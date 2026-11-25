# engine/gfx: the graphics layer

Everything that touches the K2GE (its registers, palette RAM, sprite VRAM, the scroll plane maps and
CHAR RAM) lives here. Game code calls these routines, uses the macros in `src/macros/gfx.inc` where the
ROM writes a register inline (no call), and passes the hardware names of `src/constants/hardware.inc`
as arguments where a routine takes a map or tile address. Every section keeps its ROM address (`abs=`).

| File | What |
|---|---|
| `display.asm` | boot display set-up: `InitDisplay`, `InitDisplayState` |
| `vblank.asm` | `UpdateScrollRegisters`, the scroll / shake / sprite offset update from VBlank |
| `palettes.asm` | palette shadows, fades, direct palette writes |
| `sprites.asm` | the sprite buffer and its upload, sprite grids and maps, the menu cursor |
| `tilemap.asm` | SCR1 / SCR2 map fills, clears and drawing |
| `tiles.asm` | CHAR RAM tiles: raw, mapped, LZSS, fills, bars, tile wipes |
| `font.asm` | the video side of the text boxes: glyph upload, box frames, box / cursor tile addresses |
| `portraits.asm` | portraits and pictures (`PortraitTable`) |
| `robot.asm` | the robot drawn from part images, number tiles |
| `window.asm` | the window registers and their open / close animations |

## Entry points

The routines game code calls, from the `[code]` comments in the files. Registers are TLCS-900 names;
"+n" is an offset in the structure the routine is given.

### Display and VBlank

```
InitDisplay           boot (Reset): wColorFlags (colour unit check, BIOS call 0xE), SCROLL_PRIORITY / BG / CONTROL_2D, timer 0, ClearTilemaps, ClearSprites, InitDisplayState, wFadeLevel = 0x81, zeroes SPRITE_PAL..0x83FF, full window
UpdateScrollRegisters from VBlankHandler: wScr1/2ScrollX/Y -> S1SO / S2SO, -(wSpriteOffsetX/Y) -> PO, plus wShakeX/Y per wShakeFlags bit; wScrollSplitLine 1..0x97 sets up the DMA0/DMA1 split (wSplitScrollBuffer)
UpdateSpritesAndFade  main loop after the VBlank wait: wSpriteBuffer -> SPRITE_VRAM, wSpritePalBuffer -> SPRITE_PAL_CODE (colour), FadePalettes / FadeMonoPalettes when wFadeLevel != wFadeLevelShown, resets the buffer pointers
```

### Palettes and fades

```
LoadPalettes          A = first slot, C = count, XHL = data (4 colours each) -> wPalShadow
LoadMonoPalettes      A = first entry, C = count, XHL = data (4 bytes each) -> wMonoPalShadow
ResetAllPalettes      ResetScr1Palettes + ResetScr2Palettes + ResetSpritePalettes (white, palette 15 = Pal_21F010)
ResetScr2Palettes     SCR2 palette shadow reset (also used by StreetGoWorks)
WritePalettesDirect   XHL = colours, BC = palette count, WA = first palette: straight into SPRITE_PAL + 8*WA, wFadeLevelShown = wFadeLevel
WriteMonoPalettesDirect  the same for the mono palette registers (SPPLT_01-1 + 4*WA)
SetFadeNormal         wFadeLevel = 0
SetFadeBlack          wFadeLevel = 0x81
SetFadeWhite          wFadeLevel = 0x7F
FadeInFromBlackStep   wFadeLevel += A towards 0; A = 1 while fading, 0 when done
FadeToBlackStep       wFadeLevel -= A towards 0x81; A = 1 / 0
FadeInFromWhiteStep   wFadeLevel -= A towards 0; A = 1 / 0
FadeToWhiteStep       wFadeLevel += A towards 0x7F; A = 1 / 0
LoadImagePalette      XHL palette into SCR2 palette 0 (DE >= 0x20) or SCR1 palette 0, plus the mono palettes
```

`FadePalettes` (wPalShadow -> palette RAM with wFadeLevel) and `FadeMonoPalettes` are called only from
`UpdateSpritesAndFade`.

### Tiles (CHAR RAM)

```
LoadRawTiles          XHL = u16 count + 2bpp tiles, WA = first tile
LoadCompressedTiles   XHL = u16 count + LZSS stream (biogfx sheet, .2bpp.lz), WA = first tile; DecompressTiles (1 KiB ring at 0x4000) straight into CHARACTER_RAM + 16*WA
LoadMappedTiles       XDE = map (u8 w, h + words), XHL = tile sheet, WA = first tile: tile (cell - 1) per cell, cell 0 blank
LoadMonsterImage      format 02 (biogfx img2): w, h, LZSS tiles
FillTiles             fill tiles with one shade (WA = first tile, BC = count, QA = shade)
DrawBarTiles / DrawBarTilesAt                  battle HP / EP bar: DE = tile (or XDE = CHAR RAM address), HL = max, BC = value, QC = tiles
DrawBarTilesReversed / DrawBarTilesReversedAt  the same filled from the right (enemy bars)
UncoverTileStep / CoverTileStep   WA = tile, C = step: the arena portrait wipe, one step; A = 1 until done
DrawWipeTileStep      WA = tile, C = step: the battle-entry wipe, one step; A = 1 until C = 0x14
LoadGlyphTile         L = character, WA = tile: the font glyph into CHAR RAM (bits rearranged); CREDITS_*_NAME_TILE
RenderNumberTiles     BC = value (0-999), XDE = 3 tiles: right-aligned decimal digits from the font
```

### Tile maps (SCR1 / SCR2)

```
ClearTilemaps         zeroes tile 0 and both maps (SCROLL1_VRAM..0x9FFF)
ClearScr1Tilemap      zeroes tile 0 and SCROLL1_VRAM
ClearScr2Tilemap      zeroes tile 0 and SCROLL2_VRAM
FillScrRect           WA = tile word, C / E = column / row (row >= 0x20: SCR2), B / D = width / height
FillScr1Rect / FillScr2Rect   the same on one plane
DrawTilemap           XHL = map (u8 w, h + words, 0 = empty), WA = tile base, BC = column, DE = row (>= 0x20: SCR2)
DrawTilemapScr1 / DrawTilemapScr2   the same on one plane
DrawTileBlockScr      XHL = map, WA = first tile word, BC / DE = column / row (>= 0x20: SCR2), QB / QD = size; bit 15 / 14 flip
DrawTileBlockScr1     the same on SCR1
DrawMapCell           BC / DE = dungeon map cell -> its 2 x 2 metatile tiles into SCROLL1_VRAM
ClearArenaPortraitArea, ClearArenaPortraitArea2, ClearTalkPortraitArea   ClearPictureMap of the top-left 12 x 14 of SCROLL2_VRAM (three copies in the ROM)
ClearPictureAndTilemaps   the picture clear, FillTiles 0x7E x 0x1C2, then both maps zeroed
DrawDuelSwordColumn / DrawDuelLetterColumn / EraseDuelSwordColumn / EraseDuelLetterColumn   arena duel title, one column per frame (XIZ+0x2C = position), sets wScr1ScrollX / wScr2ScrollX
ClearPictureMap       XHL = map address: zeroes its top-left 12 x 14 entries
ClearTilemap20x19     XHL = map address: zeroes 20 x 19 entries
DrawUncoverTilemap / DrawCoverTilemap   XHL = map address, WA = tile: (Un)coverTileStep step 0, then 12 x 14 entries of the tile (palette 15, flip bit 14 on alternate rows)
DrawWipeTilemap       XHL = map address, WA = tile: DrawWipeTileStep step 0, then 20 x 19 entries of the tile in four mirrored copies
```

Game code passes the map address to these as `SCROLL1_VRAM` / `SCROLL2_VRAM`.

### Text boxes (font.asm)

```
PlaceTextBox          A = box, C = column, E = row: frame + tile grid into SCROLL1_VRAM (no frame if +0x12 bit 7)
PlaceTextBoxXWA       the same with XWA = the box (from GetTextBox)
GetBoxTilesAddr       A = box -> XDE = CHAR RAM address of its first tile
GetTextCursorTile     XWA = box -> XDE = CHAR RAM address of the cell under the cursor (DrawTextChar writes the glyph there)
```

### Sprites

```
ClearSprites          zeroes SPRITE_VRAM (64 sprites), resets the buffer pointers
DrawSpriteGrid        QB x QD sprites at pixel BC, DE, tile word WA (+1 per cell) into wSpriteBuffer; skips off-screen cells, stops when full
DrawSpriteMap         the same from a map at XHL (DrawTilemap format), base WA
DrawSpriteMapFlipped  DrawSpriteMap mirrored (H flip toggled)
DrawMenuCursor        1 x 2 sprite tile 0x3E04 at BC / DE, blinking with +0x2D bit 4
```

### Portraits and the robot

```
DrawPortrait          HL = portrait number (PortraitTable): tiles and map, colour or mono
DrawPortraitAt        HL = portrait, BC / DE = position, with the PortraitOffsets adjustment for some numbers
GetPictureFirstTile   WA = 0x94, the first tile every picture loader is given
DrawRobot             the robot from wDrawBody..wDrawBack (back, right arm, body, legs, left arm)
DrawEquippedRobot     SetRobotDrawParts(wEquipCore), DrawRobot, colours from GetAffinityPalette(wUnitAffinity)
SetRobotDrawParts     XHL = 6 part ids -> wDrawBody..wDrawBack
DrawRightArmPart / DrawLeftArmPart   one arm image (biogfx img4)
```

### Window

```
SetupWindowIris       wWindowA = full screen, wWindowB = empty at the centre, steps 2, 2, -4, -4
SetupWindowOpenHorizontal / SetupWindowOpenVertical   the same opening sideways / up and down
SetWindowBPos         wWindowB x = L, y = H
ApplyWindowA / ApplyWindowB   WBA_H..WSI_V = wWindowA / wWindowB
StartWindowAnimToA    wWindowAnim = 1 (open towards wWindowA)
StartWindowIrisClose  wWindowAnim = 2 (close towards wWindowB)
UpdateWindowAnim      one step of the animation; A = 1 while moving, then wWindowAnim = 0
SetWindowScaled       B, D = 255 - scale, C, E = the point it shrinks to (WindowCloseTask / WindowOpenTask)
```

### Macros (src/macros/gfx.inc)

```
set_scroll_priority n   ldb (SCROLL_PRIORITY),n (main menu transitions)
window_off              window origin H 0, V 0xFF, size 0 (Reset on the reset combo)
clear_sprite_vram       zeroes the first 0x80 words of SPRITE_VRAM (CloseCampItemList)
clear_scr1_map          zeroes SCROLL1_VRAM (SetMaxPilotStats)
```

## RAM the graphics code owns

`src/ram/gfx.inc`: the scroll positions (`wScr1ScrollX/Y`, `wScr2ScrollX/Y`), the scroll split
(`wScrollSplitLine`, `wScr1SplitScrollX/Y`, `wScr2SplitScrollX/Y`, `wSplitScrollBuffer`), the sprite
offset (`wSpriteOffsetX/Y`), the fade (`wFadeLevel`, `wFadeLevelShown`), the palette shadows
(`wPalShadow`, `wMonoPalShadow`, and inside them `wBgPalShadow`, `wWindowPalShadow`, `wBgShadow`), the shake (`wShakeFlags`, `wShakeX`, `wShakeY`), the sprite buffers
(`wSpriteBuffer`, `wSpritePalBuffer` and their pointers), `wColorFlags`, `wMetatileAttrPtr`, and the
window animation (`wWindowA`, `wWindowB`, `wWindowStep`, `wWindowAnim`).

## Data formats

Built by `gfx.mk` (included from the Makefile): `unitron gfx` does the generic PNG -> 2bpp / palette
step, `tools/biogfx.cpp` the game's own formats.

| Product | Read by | biogfx | gfx.mk rule |
|---|---|---|---|
| `.2bpp.lz`: u16 tile count + LZSS(tiles + one blank) | `LoadCompressedTiles` | `sheet` | `build/%.2bpp.lz` (per-sheet `--map` / `--count` in `src/gfx/tiles/layout.mk`) |
| `.img2`: 02, w, h + LZSS(2bpp tiles) | `LoadMonsterImage` | `img2` | `build/%.img2` |
| `.img4`: 04, w, h + LZSS(4-bit pixels, 4 = clear) | `DrawPartImage` (robot parts) | `img4` | `build/%.img4` |
| `.tilemap`: the dungeon blockset as a map, for `dungeon_tiles.png` | (build only) | `blockmap` | `build/gfx/blocksets/%.tilemap` |
| `.2bpp`: raw tiles, count `dw` in the `.asm` | `LoadRawTiles`, `LoadMappedTiles` | none | `build/gfx/raw_tiles/%.2bpp`, `build/gfx/dungeon_sprites/%.2bpp` |
| `font.2bpp`: raw glyphs, `FONT_GLYPH_COUNT` | `GetFontGlyph`, `LoadGlyphTile` | none | `build/gfx/font/font.2bpp` |
| `.pal`: monster palettes | `LoadPalettes` (via `MonsterPalettes`) | none | `build/gfx/monsters/%.pal` |

## Still open

- Unnamed RAM: none left in `ram/gfx.inc`'s range that the graphics code uses as a bare number;
  the palette shadow slots are written as offsets (`wPalShadow+0x80` = SCR1, `+0x100` = SCR2).
- `DecompressTiles` uses `0x4000` (also `wTextBuffer`) as its 1 KiB ring.
- Routines not understood yet: `swp_21037F` (portraits.asm), `swp_207CE7` and `PlotPixel`
  (robot.asm), `DrawTilemapAt` (no comment yet); `GetBoxCursorTile` and `SetWindowStepsForB` have
  no callers.
- Inline video writes left in game code, with hardware names: `CreditsLineTask` (engine/scenes.asm)
  computes its SCR2 row from `SCROLL2_VRAM` and writes it as part of the credits logic; the arena
  and dungeon tasks pass `SCROLL1_VRAM` / `SCROLL2_VRAM` / `CHARACTER_RAM` to the routines above.
