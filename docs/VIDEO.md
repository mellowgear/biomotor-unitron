# Video

How the game drives the K2GE video chip (0x8000..0xBFFF): planes, sprites, palettes (colour and mono),
fades, the split and shake, the window, and the text and picture systems built on them. Summarised from
the headers in src/engine/gfx/ (its README.md lists every entry point), src/engine/text.asm,
src/ram/gfx.inc and src/constants/hardware.inc. (?) = uncertain in the source or here.

## The chip as the game sets it up (InitDisplay, engine/gfx/display.asm)

| Item | Setting |
|---|---|
| Mode | on a colour BIOS (OS_VERSION >= 0x10) `wColorFlags` = 0x10 and BIOS 0x0E switches the K2GE to colour mode; on a mono NGP `wColorFlags` = 0 and the game runs in mono (every picture has a mono variant) |
| Screen | `SCREEN_WIDTH` x `SCREEN_HEIGHT` = 160 x 152 pixels (20 x 19 tiles); the window WBA = 0,0, WSI = 0xA0 x 0x98 |
| Planes | scroll 1 at `SCROLL1_VRAM` 0x9000, scroll 2 at `SCROLL2_VRAM` 0x9800, each 32 x 32 tile words; `SCROLL_PRIORITY` = 0x80 at boot (scroll 2 in front); the main-menu door transition flips it (`set_scroll_priority`) |
| Character RAM | `CHARACTER_RAM` 0xA000: 512 tiles of 8 x 8 at 2 bits a pixel, tile n at 0xA000 + 16n |
| Sprites | 64 entries at `SPRITE_VRAM` 0x8800, colour palette numbers at 0x8C00 |
| Other | `BG` = 0x80 (background colour on), `CONTROL_2D` = 7, timer 0 started (TREG0 = 1) for the split DMA, BIOS 4 (interrupt level (?)) |
| Start | tilemaps, sprites and all 0x200 bytes of palette RAM zeroed, `InitDisplayState` (scrolls, split, shake, sprite buffers zeroed; grey ramps in the BG and window palette shadows), then `wFadeLevel` = 0x81 (black) |

A tile word is tile (bits 0..8) | palette << 9 (bits 9..12) | bit 13 | V flip (bit 14) | H flip (bit 15).
Routines that take a row treat rows 0x20 and up as scroll 2 (`FillScrRect`, `DrawTilemap`,
`DrawTileBlockScr`), so one (column, row) pair reaches both planes. Text boxes and menus are on scroll 1;
pictures, portraits and the wipes on scroll 2; the dungeon map on scroll 1.

## Sprites (engine/gfx/sprites.asm)

Tasks never write sprite VRAM. They append 4-byte entries to `wSpriteBuffer` (64 x 4) and palette bytes to
`wSpritePalBuffer` through `DrawSpriteGrid`, `DrawSpriteMap` and `DrawSpriteMapFlipped`; at the start of
the next frame `UpdateSpritesAndFade` copies both to the chip (written backwards), zeroes the unused
entries and resets the pointers. A sprite lasts one frame, so every task redraws its own each frame.

| Routine | Draws |
|---|---|
| `DrawSpriteGrid` | a QB x QD grid of 8 x 8 sprites at pixel BC, DE, tile word WA counting up per cell; off-screen cells skipped, stops when the buffer is full. The attribute byte keeps the tile word's flips and palette, with priority bits 0x18 (in front of both planes); the palette field >> 1 goes to `wSpritePalBuffer` |
| `DrawSpriteMap` | a `DrawTilemap`-format map (u8 w, h, a word per cell; 0 = no sprite) with tile base WA |
| `DrawSpriteMapFlipped` | the same mirrored: columns right to left, H flip toggled per cell |
| `DrawMenuCursor`, `DrawBoxCursorSprite` | the 1 x 2 cursor (tile word 0x3E04), blinking on a task counter bit |
| `DrawPlayerMapSprite` | the 2 x 2 player on the world map and in dungeons (tile 0xC) |

The sprite offset registers PO_H / PO_V are -(`wSpriteOffsetX/Y`), plus the shake when `wShakeFlags`
bit 0 is set (`UpdateScrollRegisters`).

## Palettes and their shadows (engine/gfx/palettes.asm)

Palette loads write RAM shadows; `UpdateSpritesAndFade` rewrites palette RAM from the shadows through the
current fade whenever `wFadeLevel` differs from `wFadeLevelShown` (the loaders force this by storing
~`wFadeLevel` there).

| Shadow | Holds | Register |
|---|---|---|
| `wPalShadow` 0x5876 | slots 0x00..0x0F: sprite palettes, 4 colours (0x0BGR) each | SPRITE_PAL 0x8200 |
| `wPalShadow+0x80` 0x58F6 | slots 0x10..0x1F: scroll 1 palettes | 0x8280 |
| `wPalShadow+0x100` 0x5976 | slots 0x20..0x2F: scroll 2 palettes | 0x8300 |
| 0x59F6..0x5A55 | the rest of the 0x100 words (K1GE-compatible palettes (?)) | 0x8380.. |
| `wBgPalShadow` 0x5A56 | background palette (grey ramp 0xFFF..0 from `InitDisplayState`) | 0x83E0 |
| `wWindowPalShadow` 0x5A66 | window palette (the same ramp) | 0x83F0 |
| `wMonoPalShadow` 0x585D | 6 mono palettes x 4 shade bytes: entries 0-1 sprites, 2-3 scroll 1, 4-5 scroll 2 | SPPLT_01-1 0x8100.. |
| `wBgShadow` 0x5875 | mono background (+0x18; 0x80 at boot) | BG 0x8118 |

| Routine | Use |
|---|---|
| `LoadPalettes` | A = first slot (0..0x2F), C = count, XHL = 4 colours per palette, into `wPalShadow` |
| `LoadMonoPalettes` | A = first entry (0..5), C = count, 4 bytes each, into `wMonoPalShadow`; A >= 6 returns without loading (the battle effects' mono palettes are never loaded) |
| `LoadImagePalette` (engine/gfx/robot.asm) | an image's colour palette into slot 0 of scroll 2 (DE >= 0x20) or scroll 1, with its mono palette and the text box's |
| `ResetAllPalettes`, `ResetBgPalettes`, `ResetScr1Palettes`, `ResetScr2Palettes`, `ResetSpritePalettes` | 15 white palettes and `TextBoxPal` as palette 15 of the group; mono entries 0 + `TextBoxMonoPal` |
| `WritePalettesDirect`, `WriteMonoPalettesDirect` | straight into palette RAM (no shadow, no fade), used by scenes |

Palette 15 of each group is the text-box palette (`InitTextBoxes` loads `TextBoxPal` into slots 0xF, 0x1F,
0x2F and `TextBoxMonoPal` into mono entries 1, 3, 5). Fixed users: battle effects use sprite palette 0xE,
the dungeon boss map sprite slot 0x19 (`LoadBossMapSprite`), beaten bosses 8 + n (`BossBeatenSprites`).

**Mono.** `FadeMonoPalettes` runs only when `wColorFlags` < 0x10 and `FadePalettes` only when it is
0x10, so exactly one set of registers is driven. Mono shades are 3 bits (0..7). At level 0 the shadows are copied as
they are; a scaled level writes every one of the 0x19 bytes with bit 7 set (the BG enable bit of 0x8118;
why the palette bytes get it too is open (?)).

## Fades

`wFadeLevel` scales every colour (`FadePalettes`, `FadeMonoPalettes`):

| Level | Screen |
|---|---|
| 0 | the shadows as they are |
| 0x01..0x7E | moved toward white: c + (15 - c) x 2L / 256 per component |
| 0x7F | white (all 0xFFF) |
| 0x81 | black |
| 0x82..0xFF | dark: c x ((2L) & 0xFF) / 256, brighter as the level rises |

| Routine | Use |
|---|---|
| `SetFadeNormal` (0), `SetFadeBlack` (0x81), `SetFadeWhite` (0x7F) | jumps |
| `FadeInFromBlackStep` / `FadeToBlackStep` | `wFadeLevel` += / -= A between 0x81 and 0 (wrapping through 0xFF); A = 1 while fading |
| `FadeInFromWhiteStep` / `FadeToWhiteStep` | -= / += A between 0x7F and 0 |
| `FadeLevelTask` (engine/scenes.asm) | a child task fading over a number of frames |

The battle white and black flashes (`WhiteFlashEffectTask`, `BlackFlashEffectTask`) and the dungeon's
return-from-battle fade (`StartDungeonReturn` / `DungeonReturnStep`) are built on these.

## Scroll split and screen shake (engine/gfx/vblank.asm)

`UpdateScrollRegisters` (VBlank) writes S1SO_H/V from `wScr1ScrollX/Y`, S2SO_H/V from `wScr2ScrollX/Y`
and PO from the sprite offset. When `wScrollSplitLine` is 1..0x97 it also arms micro-DMA: channel 0
(triggered by timer 0, counting lines) and channel 1, which copies the 4 bytes of `wSplitScrollBuffer`
(`wScr1SplitScrollX/Y`, `wScr2SplitScrollX/Y`) to S1SO_H..S2SO_V, so the lines below the split use the
second pair (?). `BattleStart` sets line 0x61 (the battle screen's two halves); `InitDisplayState` and
`BattleEnd` set 0 (off).

Shake: `wShakeX/Y` is added to each register pair whose bit is set in `wShakeFlags` (0 sprites, 1 scroll 1,
2 scroll 2, 3 / 4 the split pairs). The battle shake tasks (engine/battle/tasks.asm) set it.

## Window, wipes and covers

| Routine | Effect |
|---|---|
| `SetupWindowIris`, `ApplyWindowB`, `StartWindowAnimToA` / `StartWindowIrisClose`, `UpdateWindowAnim` (engine/gfx/window.asm) | the K2GE window (`wWindowA`, `wWindowB`, `wWindowStep`, `wWindowAnim`) grows from or closes to the centre: the world map, dungeon entry, stairs, Camp > Leave |
| `SetupWindowOpenHorizontal` / `SetupWindowOpenVertical` | the window opens sideways or up and down (the Works talk transitions) |
| `SetWindowScaled` (`WindowCloseTask`, `WindowOpenTask`) | the window scaled towards a point |
| `DrawWipeTilemap` + `DrawWipeTileStep` | the diagonal wipe into a dungeon battle: one tile repeated over 20 x 19 cells as four mirrored copies, the tile redrawn each step (`PixelFillBytes`) |
| `DrawUncoverTilemap` / `DrawCoverTilemap` + `UncoverTileStep` / `CoverTileStep` | the arena's 12 x 14 portrait area uncovered or covered row by row, again by redrawing one tile |
| `MainMenuTransitionIn` / `Out`, `DrawMainMenuSplit` | the two halves of the gate picture slide apart / together, with the scroll priority swapped |
| `DrawDuelSwordColumn` / `DrawDuelLetterColumn` (+ the Erase forms) | the arena duel title, one column per frame with the planes scrolling against each other |

## Tiles, maps and pictures

Formats, sources and how they are built: [ASSETS.md](ASSETS.md) and src/engine/gfx/README.md. The loaders:

| Data | Loader | Lands in |
|---|---|---|
| raw tiles (u16 count + 2bpp) | `LoadRawTiles` | CHAR RAM from tile WA |
| mapped tiles | `LoadMappedTiles`: sheet tile (cell - 1) for each map cell, cell 0 = blank | consecutive tiles from WA (the player's dungeon sprite) |
| LZSS sheet (u16 count + stream) | `LoadCompressedTiles` / `DecompressTiles` (ring in `wTextBuffer`) | CHAR RAM from tile WA |
| monster image (`02 w h` + LZSS) | `LoadMonsterImage` | tiles from WA; B, D = size in tiles |
| part image (`04 w h` + LZSS of 4-bit pixels, 4+ = clear) | `DrawPartImage` / `PlotPixel` | a tile canvas QB tiles wide |
| tile map (u8 w, h + words) | `DrawTilemap` / `DrawTilemapScr1/2`: non-zero cells get WA - 1 added; WA bits 15 / 14 mirror the placement | a plane, clipped to 32 x 32 |
| tile block | `DrawTileBlockScr`: WA, WA + 1 ... row by row, mirrored with the flip bits | a plane |
| font glyph | `GetFontGlyph` + `DrawTextChar` / `LoadGlyphTile` | one tile per character cell |

**Portraits and pictures** (engine/gfx/portraits.asm). `DrawPortrait` takes a portrait number (HL),
reads `PortraitTable[HL]` (data/graphics/portraits.asm, 68 numbers, 66 records) and loads, by
`wColorFlags` bit 4, either the colour palette (10 palettes) + colour tiles + colour map, or the mono
palette + tiles + map; `DrawPortraitAt` adds `PortraitOffsets` for numbers 0..0xA and 0x15..0x22. Every
caller gives tile base 0x94 (`GetPictureFirstTile`). The town places (`PlacePortraits`), talk speakers,
race portraits (race + 0xA), the arena cast, story scenes and the game-over / ending pictures all go
through it.

**The robot** (engine/gfx/robot.asm). `DrawRobot` clears a 12 x 11 tile canvas and draws, in order, the
back, right arm, body, legs and left arm images (`wDrawBody`..`wDrawBack`, from `SetRobotDrawParts`: the
`PART_IMAGE` byte of each part), each placed by the per-body offset tables
(data/parts/part_offsets_*.asm). `DrawEquippedRobot` draws the player's unit in the colours of its
affinity. Enemy robots (pilots) use the same path with `wEnemyParts`.

**Battle effects** (`PlayBattleEffect`, engine/battle/tasks.asm). An effect loads its tile sheet and
sprite palette 0xE, then steps its script: each entry shows one frame (a sprite map) at an offset around
(0x50, 0x30), mirrored for the enemy's side except effects 0x72, 0x73, 0xBE, 0xBF, and plays the sound cues
at their frame numbers. Format: [DATA_FORMATS.md](DATA_FORMATS.md#battle-effects).

**Dungeon map** (engine/dungeon/map.asm). The floor map is a grid of metatiles (2 x 2 tiles,
`DungeonMetatiles`); `DrawMapCell` draws one cell into the 16 x 16-cell ring of scroll 1, `UpdateMapScroll`
draws the row or column entering the screen as `wMapScrollX/Y` cross a 16-pixel boundary, and
`RedrawMapAtScroll` draws 14 x 13 cells at once.

## VRAM layout the code uses

Tile numbers are fixed per screen; the lists below are what the code passes (CHAR RAM tile numbers).

| Tiles | Use | Set by |
|---|---|---|
| 1.. | text box frame and arrow tiles (`RawTiles_2C8569`); tile 0xB is the blinking prompt arrow, reloaded each frame from 0x2C83B9 / 0x2C83CB by `wFrameCounter` bit 3 | `InitTextBoxes`, `UpdateTextBoxes` |
| 0xC.. | the player's map sprite (world map, dungeon) | `LoadDungeonPalettes`, `LoadPlayerDungeonSprite` |
| 0x10.., 0x46.., 0x8E.. | text boxes 1 (20 x 5), 2 (8 x 11 or 8 x 14), 3 (8 x 3): their character cells | `OpenBox1`, `OpenBox2` / `OpenBox2Tall`, `OpenBox3` |
| 0x37.. | dungeon floor tile sheet (`wDungeonTileBase`); box tiles follow the sheet | `LoadDungeonFloor` |
| 0x94.. | the current picture or portrait (`GetPictureFirstTile`) | `DrawPortrait` and the picture loaders |
| 0xB5.., 0x161.. | the two halves of the main-menu gate picture | `DrawMainMenuSplit` |
| 0xE7.. | the title picture | `TitleMapFlashStep` |
| 0x169.. | chest sprites, 4 tiles per chest (0x169 + 4 x (attr & 0xF)) | `LoadFloorChestSprites` |
| 0x16C, 0x173 | player and partner names rendered into tiles (credits) | `CreditsTask`, `LoadGlyphTile` |
| 0x182.., 0x19B.. | the floor boss map sprite (beaten remains / Uniti's 9 parts) | `LoadBossMapSprite` |
| 0x1E4.. | text box 4 (the arena) | `GetArenaBox4Tile` |

| Map | Range | Use |
|---|---|---|
| scroll 1 0x9000..0x97FF | text boxes, menus, the dungeon map ring, duel sword | |
| scroll 2 0x9800..0x9FFF | the 12 x 14 picture area at the top left (`ClearPictureMap`), full-screen wipes, battle enemy, title | |

## Text boxes (engine/text.asm)

Text is drawn into tiles, one tile per character cell: each box owns a grid of tiles and `DrawTextChar`
copies a font glyph into the tile under the cursor (`GetTextCursorTile`).

| Item | Rule |
|---|---|
| Boxes | 8 records of 0x13 bytes at `wTextBoxes` (`GetTextBox`: wTextBoxes + 0x13 x A): +0 first tile (word, 0x200 = none), +2 / +3 screen column / row, +4 / +5 width / height, +6 / +7 cursor column / row, +8 text pointer (long), +0xC a second pointer, +0x10 speed, +0x11 delay counter, +0x12 state (0 print, 1 delay, 2 wait for a button; bit 7 = frameless box) |
| Printing | `UpdateTextBoxes` runs every box with a text pointer once a frame (`TextBoxStateJumps`): one character per `speed` frames; speed 0 prints the page at once. Speed comes from `wOptionMessageSpeed` |
| Codes | 0xFF end, 0xFE newline, 0xFD new page (clear), 0xFC player name, 0xFB partner name, 0xFA wait for A / B (`TextWaitButton` shows tile 0x3E0B in the frame corner); see [DATA_FORMATS.md](DATA_FORMATS.md#text) |
| Placing | `PlaceTextBox` draws the frame and the box's tile grid on scroll 1 (`PlaceTextBoxNoFrame` without the frame); `EraseTextBox` fills its rectangle with tile 0; the Box1/2/3 wrappers fix each box's place |

Higher layers: `ExpandMessage` expands the placeholders 0x90..0xB4 into `wTextBuffer` before a message
reaches box 0 (`ShowMessage`); the menu framework's `MessageTask` (engine/menus/menu_helpers.asm) queues
and fast-forwards messages; `CreditsTask` scrolls captions on scroll 2 with its own glyph cache.
