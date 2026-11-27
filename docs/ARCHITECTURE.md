# Architecture

How the program is put together: boot, the task system, the game flow, a frame, memory, saves, the BIOS
and the sound CPU. Summarised from the routine headers and src/ram/wram.inc; the routine named in each row
has the details. (?) marks what the source marks as uncertain, or what this summary could not settle.

## Boot and interrupts (src/home/system.asm)

| Step | Routine | What it does |
|---|---|---|
| Entry | `Start` (0x205FA3, the header's start address) | `InitConsoleType` (on OS_VERSION 0, the mono BIOS, clears two BIOS bytes), then `Reset` |
| Reset | `Reset` | `di`, register bank 1, `XSP` = `wStackTop` (0x6C00), BIOS 1 (clock gear), zeroes work RAM 0x4000..0x6BFF, starts the timer prescaler (TRUN bit 7), BIOS 2 (RTC into `wBootRtcTime`), BIOS 0x10, `InitSound`, `ResetSoundState`, `PlaySong` `SONG_EVENT`, installs `VBlankHandler` at VEC_VBLANK, seeds `Random` from the RTC (`SetRandomSeeds`), `InitDisplay`, `InitTaskList`, `InitJoypad`, `InitMapScroll`, message speed 3, `InitTextBoxes`, starts the task `BootLoadOptions`, `ei`, main loop |
| First task | `BootLoadOptions` (engine/menus/save.asm) | default options (speed 3, animation on), `LoadOptions` when save slot 0 holds the cartridge id, `InitTextBoxes` again, then resumes at `IntroThenMainMenu` |
| Soft reset | `Reset` main loop | `ReadJoypad` sets `wJoyResetCombo` when A, B and Option (0x70) were held in each of the last 0x3C frames of `wJoyHistory`; the loop then closes the window (`window_off`) and jumps back to `Reset` |
| Sound | `InitSound` (audio/sound_engine.asm) | stops the Z80 (0xB8 = 0xAAAA), `UploadZ80Driver`, restarts it (0x5555), `SetupTimer3` (rate 2000) as the Z80's tick (?) |

| Interrupt | Handler | Work |
|---|---|---|
| VBlank (VEC_VBLANK) | `VBlankHandler` (system.asm) | saves both register banks' pairs, BIOS 0x16, `UpdateScrollRegisters`, `MergeCs1CardInput`, `wFrameCounter` + 1, clears `wVBlankWait` (releases the main loop), kicks the watchdog (WDCR = 0x4E), BIOS 0x15 |
| Timer 0 / micro-DMA | no CPU handler | the mid-screen scroll split, see [A frame](#a-frame) and [VIDEO.md](VIDEO.md) |
| Serial | none installed | the link cable is polled by a task (`LinkCommTask`) through BIOS COM calls, see [Link cable](#link-cable) |

Unlike Unitron 2 there is no play-time counter, no serial interrupt handler and no per-frame link exchange.
BIOS 0x16 / 0x15 around the VBlank work and around every flash write are the serial RTS off / on calls in
SNK's numbering (?).

## The task system (home/system.asm)

A cooperative scheduler. `RunTasks` calls every live task once a frame, in list order.

| Item | Value |
|---|---|
| Slots | `MAX_TASKS` = 0x20 at `wTasks` (0x5282), `TASK_SLOT_SIZE` = 0x2E bytes, up to the list head `wTaskList` (0x5842); live tasks form a doubly linked list from `wTaskList+2` to the tail sentinel `wTaskList+4`; `wTaskCount` (0x584A) counts them |
| Slot header (constants/tasks.inc) | +0 `TASK_PREV` (low byte 0 = free slot), +2 `TASK_NEXT`, +4 `TASK_PARENT` (0 = none), +7 `TASK_FLAGS` (`TASK_END_BIT` 7, `TASK_END_CHILDREN_BIT` 6), +8 `TASK_FUNC` (long), +0xC `TASK_CHILDREN` (live children), +0xE `TASK_ARG` and the task's own variables up to +0x2D |
| Start | `StartTask`: no parent, linked last (runs later this frame); `StartChildTask`: linked right after the current task (XIZ), parent = XIZ, the parent's `TASK_CHILDREN` + 1 |
| End | `EndTask` only sets bit 7; `RunTasks` unlinks the slot when it reaches it and lowers the parent's child count. `EndChildTasks` sets bit 6: `RunTasks` gives every child of such a parent bits 7 and 6 (ended, passing it on to the grandchildren) and clears bit 6 on the parent before each call. A child whose parent has ended is orphaned (`TASK_PARENT` = 0) |

**Resume points.** A task is a routine called with XIZ = its slot (and IY = its parent); it yields by
returning. To continue elsewhere next frame it stores an address in `TASK_FUNC`: `ld XHL,label` /
`ld (XIZ+TASK_FUNC),XHL`, the `task_wait` macro (src/macros/macros.inc: store the resume point and
return while `TASK_CHILDREN` is non-zero), or `TaskYield` (the caller's return address becomes the resume
point). Registers are not kept across a yield, only the slot.

**Child tasks.** The common wait is: start a child, `task_wait`, go on when the child has ended. Helpers
used this way include `WaitFramesTask`, `FadeLevelTask`, `Wait30FramesTask`, `YesNoPromptTask`,
`SaveSlotSelectTask`, the window tasks, the battle slide and HP / EP tasks (engine/battle/tasks.asm) and
`PlayEffectList`.

**Coroutine waits.** Many menu routines are written as straight-line code that waits in the middle:
they pop their caller's return address into a RAM word, yield with `TaskYield` each frame until a
condition holds, then jump back to the saved address. Examples: `Wait30Frames` / `WaitForButton`
(`wTextWaitReturn`), `AskYesNo`, `WaitFramesOrButton`, `WaitAOrB` (`wMenuWaitReturn`), `WaitMessage`
(`wWaitMessageReturn`), `FlushMessage` (`wFlushMessageReturn`), `MenuCommandWait` / `WaitMenuResult`
(`wMenuCmdReturn`), `ListCommandWait` / `WaitListResult` (`wListCmdReturn`), `RunWorksScreen`
(`wWorksScreenReturn`), `WorksUnitStatus` / `WorksCharaStatus` (`wStatusReturn`). Each has one RAM word, so
only one such wait of each kind can be pending at a time.

**State machines.** The long-lived tasks keep a state in `TASK_ARG` and a mode byte and jump through a
table or a case chain each frame: `DungeonTask` (TASK_ARG 1..5, then `DUNGEON_MODE` at +0xF for
`DungeonStep`), `ArenaTask` (TASK_ARG 1..0xC), `StreetMenuDispatch`, `TownPlaceTask`, `CampMenuDispatch`,
`WorldMapDispatch`, `MenuBoxTask` / `ListTask` (commands posted in `wMenuCommand` / `wListCommand`).

**Fixed task slot.** The names `wGameMode`, `wDungeonId`, `wFloor`, `wDungeonX/Y`, `wDungeonFacing`,
`wFloorCount`, `wFloorMaps`, `wDungeonSubstate`, `wStepsSinceBattle` ... (0x52BF..0x52DC in wram.inc)
are the `DUNGEON_*` fields (constants/struct_fields.inc) of task slot 1 (0x52B0): code outside the dungeon
task reads the world-map / dungeon task's variables by absolute address, which assumes that task sits in
slot 1 (the Crystal Mine's task is noted at 0x52DE) (?).

## Game flow

| Stage | Routine (file) | What happens |
|---|---|---|
| Attract loop | `IntroThenMainMenu` (menus/main_menu.asm) | child `IntroBackground` (engine/scenes.asm): the intro (skippable with A), title reveal and flash, then the title (`TitleTaskInit`, "PRESS A BUTTON"); a time-out loops back to the intro |
| Main menu | `MainMenuTask` | `ResetAllPalettes`, `MainMenuSetup` child (New Game, Load, Config); by `wMainMenuCursor`: 1 `NewGameSetup`, 2 `LoadGameEnterWorks`, else back to the intro |
| New game | `NewGameSetup` (engine/player.asm) | `SelectPlayerTask` (race, names; B returns to the menu), event flags and item / part counts cleared, pilot stats zeroed, `TryLevelUp` twice, `StartingEquipment` by race, `CalcUnitStats`, the right arm added as a spare part, engineer level 1, GP 0, rank 0, `StorySceneUniticeSetup`, then `StreetGoWorks` |
| Load | `LoadGameEnterWorks` (main_menu.asm) | after `MainMenuLoadTask` loaded a file: `RunWorksScreen` mode 2, `CalcUnitStats`, then `StreetTask` |
| Town loop | `StreetTask` (menus/town/street.asm) | full HP / EP, statuses cleared, the street menu (`StreetMenuTask`: Works / Shop / Arena / Square / W.Map), then by `wStreetMenuChoice` one branch below |
| Works | `StreetGoWorks` | `RunWorksScreen` (menus/works/main.asm): Setup, Develop, Item, Stats, Trade, Help, Data (save / load), Exit |
| Shop | `StreetGoShop` | child `TownPlaceTaskShop` (the entry talk); `wTownPlaceResult` 3..5 -> `RunShopScreen` (menus/shop/) |
| Arena | `StreetGoArena` | child `ArenaTaskInit` / `ArenaTask` (engine/arena/), then by `wStreetNext` |
| Square | `StreetGoSquare` | child `TownPlaceTaskSquare` (menus/town/places.asm): Pub, D-town, Forest, Spring and the NPC talk rows (npc_talk.asm) |
| World map | `StreetGoWorldMap` | child `WorldMapTaskInit` (engine/dungeon/task.asm): the world map, then a dungeon (`DungeonTask`); refused at stages 0 and 8 (`StreetMenuSelect`) |
| After arena / world map | `wStreetNext` | 1 `StreetGoWorks`, 2 `StreetAfterDungeonDefeat` (the Works after a defeat), 4 `StreetEndingScenes` (destruction scene, credits, "One year later"), 5 `StreetTheEnd`, 6 `StreetGameOver`, else `StreetTask` |
| Crystal Mine | `CrystalMineTaskInit` | started from the arena (`ArenaMineTrip`), dungeon 5; its end goes through `wArenaNext` |

The story is a stage number: exactly one of the event flags 0x00..0x0B is set (`GetStoryStage`,
`SetStoryStage`, `AdvanceStoryStage` in engine/events.asm; constants/event_flags.inc). Winning an arena rank
advances it (`ArenaSceneEnd` end action 2); the talk rows, shop stock, enemy scaling and arena scenes read it.

## Battles (engine/battle/)

`BattleStart` (init.asm) is a task started by the dungeon (`StartDungeonBattle`, `BossEncounter`), the
arena (`ArenaStartBattle`) or the prologue-less story. It draws the battle screen (scroll split at line
0x61), loads the enemy (`LoadEnemy`: `EnemyStats`, its parts for robot pilots, `EnemyScaling` for level-255
enemies), applies accessories and level-gap chances, and starts `BattleHPEPDisplayTask`. A round:
command menu (menu.asm) -> `PlayerTurn` / `EnemyTurn` by `TurnOrderMargin` (player_turn.asm,
enemy_turn.asm) -> hit, damage and affinity (calc.asm) -> effect animations (`PlayEffectList`,
tasks.asm) -> `PlayerTurnEnd` / `EnemyTurnEnd` and, after both, `BattleStatusEffects` (status.asm). The
end (`BattleVictory`, `BattleDefeat`, retreat: end.asm) runs `BattleEnd`, which stores `wBattleResult`
for the waiting caller (constants/battle.inc). Rules: docs/GAME_RULES.md.

## A frame

`Reset`'s main loop sets `wVBlankWait` = 0xFF, spins until `VBlankHandler` clears it, then:

| Order | Routine | Work |
|---|---|---|
| (VBlank) | `UpdateScrollRegisters` (engine/gfx/vblank.asm) | scroll and sprite-offset registers from the shadows plus the shake; arms the split DMA |
| 1 | `UpdateSpritesAndFade` (engine/gfx/sprites.asm) | `wSpriteBuffer` (filled by the tasks last frame) to sprite VRAM, `wSpritePalBuffer` to the colour sprite palette table, unused entries zeroed; `FadePalettes` / `FadeMonoPalettes` when `wFadeLevel` changed |
| 2 | `ReadJoypad` | `wJoyHistory` ring (256 bytes), `wJoyHeld` / `wJoyPressed` / `wJoyReleased`, the reset combo |
| 3 | `UpdateTextBoxes` (engine/text.asm) | runs each of the 8 text boxes with a text pointer (`TextStep`, `TextDelayTick`, `TextWaitButton`); blinks tile 0xB |
| 4 | `UpdateMapScroll` (engine/dungeon/map.asm) | adds `wMapScrollStepX/Y`, draws the dungeon row / column coming into view |
| 5 | `RunTasks` | the game |
| 6 | `SendQueuedSoundCommand` (audio/sound_engine.asm) | the next queued command to the Z80 once the last one was acknowledged |

## Memory map

### ROM (0x200000..0x2FFFFF, 1 MB)

Every routine and data piece is its own section pinned at its address (FILING.md, ASSETS.md); code and
small tables interleave in places.

| Range | What | Source |
|---|---|---|
| 0x200000 | cartridge header (id "B.M.Unitron1" at 0x200024, system code 0x10) | home/header.asm |
| 0x200040..0x2003B1 | sound engine: InitSound, queue, PlaySong, driver upload | audio/sound_engine.asm |
| 0x2003B2 | Z80 driver (2741 bytes) | audio/z80_driver.z80 |
| 0x200E67..0x205F9E | voice records and Z80CmdTable, SongTable (0x200E86) and the 21 song headers, the tracks | audio/sound_init.asm, songs.asm, tracks.asm |
| 0x205FA3..0x21DA1C | all code: home, gfx, text, battle, menus, town, Works, shop, scenes, dungeon, arena, with the menu tables and short texts they own between the routines | src/home/, src/engine/, data/works, data/shop, text/ |
| 0x21DA1D | unreferenced bytes | data/unused/unreferenced.asm |
| 0x21F000..0x2275D8 | blank glyph, part draw offsets, image pointers (0x220C00), battle tables (damage, affinity, attacks, enemy names, scaling, level rolls), player tables (exp curves, level gains), battle and story texts, intro frame tables | data/parts/, gfx/image_pointers.asm, data/battle/, data/player/, data/graphics/ |
| 0x2275D9..0x228740 | dungeon map sprites and palettes | gfx/dungeon_sprites.asm |
| 0x228741..0x249A5D | dungeon data: metatiles, tile sheet, attributes, the 57 floor maps with chest lists, DungeonData / DungeonMaps, palettes, chests, encounters | data/dungeon/dungeon.asm, tables.asm, pointers.asm |
| 0x249A5E..0x25E83B | arena, town (talk rows, place data), story, item, part, shop, Works and help tables and their texts | data/arena/, data/town/, data/story/, data/items/, data/parts/, data/shop/, data/works/, data/help/, text/ |
| 0x25EF50..0x26FCD2 | the robot part images (`.img4`) | gfx/parts.asm |
| 0x26FD9F..0x273178 | part palettes, dungeon sprite tiles, item / part tables read by the battle and Works code (the "Works copy" and the read copy of some tables) | gfx/palettes.asm, data/items/, data/parts/ |
| 0x2746C0..0x284123 | battle effect records, frames, tiles, palettes, scripts | data/battle_anims/battle_effects.asm |
| 0x2844C4..0x2C7B6D | picture sets: palette, map and tile sheet for each portrait and scene picture | gfx/palettes.asm, maps.asm, tiles.asm |
| 0x2C7B6E | `PortraitTable` and the portrait records | data/graphics/portraits.asm |
| 0x2C82AE..0x2C8DA6 | small sheets, raw tiles (text box frame, bars, cursors), their maps and palettes | gfx/raw_tiles.asm, maps.asm, tiles.asm |
| 0x2C8DA7 | font (128 glyphs) | gfx/font.asm |
| 0x2C95A9..0x2DB37E | monster images (`.img2`) and `MonsterPalettes` (0x2DB097) | gfx/monsters.asm |
| 0x2DB37F..0x2E88C5 | story, title, intro, credits and arena pictures (palettes, maps, sheets) | gfx/ |
| 0x2E88C6 | unreferenced fill | data/unused/unreferenced.asm |
| 0x2FA000..0x2FFFFF | save area (flash; as shipped: slot 0 written, the rest 0xFF) | data/save/flash.asm |

### Work RAM (src/ram/wram.inc, src/ram/gfx.inc)

| Range | Block |
|---|---|
| 0x4000..0x40FF | `wTextBuffer`: the expanded message (`ExpandMessage`), also the 1 KiB LZSS ring of `DecompressTiles` / `DrawPartImage` (0x4000..0x43FF) and the 0x800-byte copy of the save block during a flash write |
| 0x4100 | `wNumberBuffer` (digits of `MsgInsertNumber`) |
| 0x5000..0x5012 | `wRandomSeeds` (3 words, Wichmann-Hill), `wFrameCounter`, `wVBlankWait`, `wBootRtcTime` |
| 0x5013..0x527F | **the saved file** (0x26D bytes, `SaveGameSlot` / `LoadGameSlot`): pilot, partner, GP, rank, equipment, unit stats, `wEventFlags` (0x5060, 16 words), item counts, part counts. Layout: [DATA_FORMATS.md](DATA_FORMATS.md#save-data) |
| 0x5280, 0x5281 | `wOptionMessageSpeed`, `wOptionAnimation` (saved in slot 0) |
| 0x5282..0x5841 | `wTasks`: the 32 task slots (slot 1 = the dungeon task's variables, `wGameMode`..`wModeTimer`; `wHelpPage` 0x542E is inside a slot too (?)) |
| 0x5842..0x584A | `wTaskList` head / tail sentinels, `wTaskCount` |
| 0x584B..0x5BC6 | display (gfx.inc): scroll shadows, split scrolls, `wFadeLevel`, `wMonoPalShadow`, `wPalShadow` (0x100 words), `wScrollSplitLine`, `wSplitScrollBuffer`, sprite offset, shake, `wSpriteBuffer` (64 x 4), `wSpritePalBuffer`, `wColorFlags` |
| 0x5BC7..0x5BDC | dungeon map scroll, `wDungeonTileBase`, `wMapPtr`, `wMetatileTilesPtr`, `wMetatileAttrPtr` |
| 0x5BDD..0x5CE1 | joypad: `wJoyHistoryIndex`, the 256-byte `wJoyHistory`, held / pressed / released, reset combo |
| 0x5CE3..0x5D7A | `wTextBoxes`: 8 boxes x 0x13 bytes |
| 0x5D7B..0x5DF1 | battle: drawn parts, EP costs, the unit's buffs, chances, statuses and turn counters, the enemy block (0x5DA2..0x5DD8), result, area level, menu, both sides' attack results |
| 0x5DF2..0x60EF | main / config / street / save menus, `wCreditsGlyphCache`, `wStreetNext`, `wArenaNext`, `wChestTable` (0x5FFA, 7 floors x 6 chests x 5 bytes), `wArenaPilotParts` |
| 0x60F0..0x6221 | town place result, window animation, BCD scratch, cursor / message / Yes-No / menu / list tasks, Works, develop, stats pages, RTC buffer, trade, shop |
| 0x6222..0x6299 | link cable: task handle, offer, flags, packets, receive buffer |
| 0x629A..0x6347 | sound queue (16 bytes), block mask, ack, the Z80 track id lists and song loading pointers |
| 0x6348..0x6BFF | stack (grows down from `wStackTop` 0x6C00) |
| 0x6C00..0x6FFF | BIOS system RAM: `wBiosFlashSize2` / `wBiosFlashType2` (a CS1 card), OS_VERSION, the interrupt vectors, `wBiosCs1Input` |

Z80 RAM is at main 0x7000..0x7FFF (Z80 0x0000..0x0FFF); the K2GE at 0x8000..0xBFFF ([VIDEO.md](VIDEO.md)).

## Flash saves (engine/menus/save.asm)

Saves live in the cartridge's own flash, in one 0x800-byte area at cart offset 0xFA000 (CPU 0x2FA000),
flash block 0x11 (?). Every write rewrites the whole area: `ReadCartBlocks` copies 8 pages (0x800 bytes)
into `wTextBuffer`, the slot is changed there, `FlashEraseBlock` (block 0x11) and `FlashWrite` are
retried until both return 0, all between BIOS 0x16 and 0x15.

| Slot | Offset (`GetSaveSlotOffset`) | Holds |
|---|---|---|
| 0 | 0xFA000 | the 16-byte cartridge id (header 0x200020..0x20002F) + `wOptionMessageSpeed`, `wOptionAnimation` |
| 1 | 0xFA030 | the id + the file (0x26D bytes from `wPlayerName`) |
| 2 | 0xFA2C0 | the same (0x30 + 0x290 per file) |
| 3 | 0xFA550 | the same |

| Routine | Work |
|---|---|
| `SaveGameSlot` | A = 0 -> `SaveOptions`; else id + 0x5013..0x527F into the slot |
| `LoadGameSlot` / `LoadOptions` | copy back from the cartridge (no BIOS call: flash reads as ROM); `LoadGameSlot` then zeroes `wEventFlagsB0` (the event-flag word 0xB0..0xBF (?)) |
| `IsSaveSlotUsed` | Z when the slot starts with the 16-byte cartridge id |
| `ClearSaveSlot` | 0xFF over the slot's 0x27D bytes (Config > Delete Data > Select) |
| `EraseSaveBlock` | erases block 0x11 (Delete Data > All) |
| `GetCartBase` | 0x200000, or 0x800000 when `HeaderCartId` reads 0xFFFE (a development card on CS1 (?)) |
| `FlashEraseBlock` / `FlashWrite` | BIOS 8 / BIOS 6 through `swi 1`, watchdog kicked before and after |

Saving is offered from Works > Data (`RunWorksSaveTask`, menus/works/data.asm); loading from the main menu
and Works > Data. The file holds no dungeon position: the game is always resumed in town.

## Link cable

Works > Trade (menus/works/trade.asm) starts `LinkCommTask` (`StartLinkTask`), which loops on the BIOS COM
calls 0x10..0x1A: it sends and receives a 7-byte packet (counter, answer bits, offered entry, the partner's
offer echoed, checksum) as 16 bytes of sync word + hex text, with a 0x1E-poll timeout. Status in
`wLinkStatus` / `wLinkErrorBits`. Packet layout: [DATA_FORMATS.md](DATA_FORMATS.md#link-packet).

## BIOS calls

All go through `BiosCall` (system.asm: RW3 = number, vector table at 0xFFFE00, register bank 3) except the
two flash calls, which use `swi 1`. Names are SNK's where the source gives them; the rest are (?).

| No. | Use | Caller |
|---|---|---|
| 0x01 | clock gear (RBC3 = 0) | `Reset` |
| 0x02 | RTC read | `Reset` (`wBootRtcTime`, the random seeds); `ReadRtc` (`wRtcBuffer`), called only by the dead `GetRtcMonthDay` |
| 0x04 | interrupt level (?) | `InitDisplay` |
| 0x06 | flash write | `FlashWrite` |
| 0x08 | flash block erase | `FlashEraseBlock` |
| 0x0E | K2GE colour mode (RA3 = 0x10) | `InitDisplay`, on a colour BIOS only |
| 0x10 | serial init (?) | `Reset`, `LinkCommTask` |
| 0x11, 0x12, 0x17..0x1A | serial send / receive / status | `LinkCommTask` |
| 0x15, 0x16 | RTS on / off (?) | `VBlankHandler`, the save routines |

## The Z80 sound CPU

The main CPU never touches the sound chip. `UploadZ80Driver` copies the driver to Z80 RAM (main 0x7000 =
Z80 0x0000) and `Z80CmdTable` after it; `PlaySong` copies a song's header, voice records and track blocks
behind it and records the loaded track ids (`wMusicTrackIds`, `wSfxTrackIds`). `PlayMusic` (audio/sound.asm,
the routine game code calls) does a full `InitSound` (driver re-upload) and `ResetSoundState` before each
`PlaySong`. After that a sound is one command byte:

| Step | Routine | Work |
|---|---|---|
| Ask | `SoundCommand` -> `QueueSoundCommand` | `SoundIdToCommand`: id 0x7F = stop music, below 0x20 = 0xC0 + 2n (Z80CmdTable), else the loaded track's index x 4 + 3 (music) or + 2 / + 0 (SFX); into the 16-entry ring `wSoundQueue` (a full ring drops its oldest); 0x80..0x85 set / clear `wSoundBlockMask` instead |
| Send | `SendQueuedSoundCommand` (each frame) | when port 0xBC reads `wSoundAckExpected` (the complement of the last command): the next unblocked command to 0xBC, 1 to 0xBA (the Z80 NMI) |

Song ids: constants/music.inc. The driver, its commands and the song format: [Z80_DRIVER.md](Z80_DRIVER.md),
[SONGS.md](SONGS.md).

## Where each subsystem lives

| Subsystem | Files |
|---|---|
| Boot, VBlank, tasks, joypad, random, event flags, items, BIOS | src/home/system.asm |
| Display set-up, VBlank scroll, palettes and fades, tiles, tilemaps, sprites, window, portraits, robot drawing, font side of the text boxes | src/engine/gfx/ (README.md there) |
| Text boxes, control codes, message expansion | src/engine/text.asm; printing helpers src/engine/menus/print.asm |
| Menu framework (message, cursor, menu box, list, Yes/No tasks) | src/engine/menus/menu_helpers.asm |
| Title, main menu, config, new game, name entry, saves | src/engine/menus/main_menu.asm, new_game.asm, save.asm |
| Street, town places, NPC talk, Colla / Cyrius / Helmut / Tetis | src/engine/menus/town/ |
| Works (Setup, Develop, Item, Stats, Trade, Help, Data) | src/engine/menus/works/ |
| Shop | src/engine/menus/shop/ |
| Battle | src/engine/battle/ |
| World map and dungeons | src/engine/dungeon/ |
| Arena | src/engine/arena/ |
| Pilot / unit stats, level up, new game set-up | src/engine/player.asm |
| Story stage and flag helpers | src/engine/events.asm |
| Intro, title reveal, story scenes, credits, game over | src/engine/scenes.asm |
| Table accessors (names, records, talk rows, prices) | src/engine/tables.asm |
| Sound engine and data | src/audio/ |
| Game data, graphics, text | src/data/, src/gfx/, src/maps/, src/text/ |
