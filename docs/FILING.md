# Code file layout (src/engine/, src/home/)

Every routine is its own section pinned at its ROM address (`c_XXXXXX section code abs=0x...`)
and labels are global in the one module (src/main.asm includes every file), so a routine can sit
in any file without changing the ROM.

**Rule used:** a routine goes in the file for what it demonstrably does (its name and its
`[code]`/`[play]` comment); an unnamed `sub_`/`swp_`/`dyn_`/`loc_` routine goes with its callers or
callees, and where nothing is clear it stays next to its address neighbours (no subsystem is
invented for it). Helpers called from several subsystems go to the shared file for their kind
(gfx/*, text.asm, menus/menu_helpers.asm, menus/print.asm, home/system.asm). Moves are of whole
sections only (section line to the next section line: comment block, dotted locals and any data
inside the section travel with it); within a file sections stay in ROM address order.

| File | Lines | What is in it |
|---|---|---|
| `src/engine/arena/duel.asm` | 1126 | arena duels: ArenaDuelDispatch, ArenaStartBattle, round results, fades |
| `src/engine/arena/entry.asm` | 383 | arena Entry/Quit menu and the entry fee / rank boxes |
| `src/engine/arena/opponents.asm` | 1451 | arena bracket: opponent line-up, LoadArenaOpponent boxes, participant tile wipes |
| `src/engine/arena/scenes.asm` | 857 | arena task, talk scenes (ArenaSceneStep, ArenaSceneEnd), arena event flags |
| `src/engine/battle/calc.asm` | 440 | battle formulas: level rolls, hit/turn-order margins, damage roll, affinity, Airbag, EP cost/recharge and stat-buff multipliers, ComputeStatBuffs, exp for a kill |
| `src/engine/battle/effects.asm` | 584 | skill and item effects: stat up/down, full heal, Time Stop, Recvr, Airbag, Full Charge, the battle item handlers |
| `src/engine/battle/end.asm` | 257 | battle end: victory (exp, GP, drop), defeat, retreat, BattleEnd, HP/EP gain message pickers |
| `src/engine/battle/enemy_turn.asm` | 1161 | enemy turn: attack choice, EnemyAttack / EnemyArmAttack, enemy hit results, enemy non-attack actions (flee, heal, cure, recharge) |
| `src/engine/battle/init.asm` | 899 | battle setup: LoadEnemy, battle-start accessory effects (AccBattle*), enemy image, level-gap chances, BattleStart and its task start, DrawBattleScreen |
| `src/engine/battle/menu.asm` | 547 | battle command menu, weapon info, item list |
| `src/engine/battle/player_turn.asm` | 791 | player turn: attack checks, PlayerAttack, items, recharge, flee, the player hit-result messages |
| `src/engine/battle/status.asm` | 476 | turn ends: status recovery rolls, turn counters, BattleStatusEffects (rust, paralysis, EP leak, confusion) |
| `src/engine/battle/tasks.asm` | 956 | battle tasks: unit/enemy HP and EP change tasks, screen shake, WaitBattleMessageTask, PlayEffectList / PlayNextEffect and the battle effect animation player |
| `src/engine/dungeon/boss.asm` | 732 | the floor boss (GetFloorBossBeaten, UpdateFloorBossSprite), boss encounters: BossEncounter, BossTalkStep, their boxes and fades |
| `src/engine/dungeon/camp.asm` | 1087 | camp menu: CampMenuDispatch, its boxes and drawing, item use, status labels, Leave OK? |
| `src/engine/dungeon/chests.asm` | 945 | chests: RollFloorMaps, RollFloorChests, chest lookup (GetChestAt), OpenChest |
| `src/engine/dungeon/encounter.asm` | 258 | starting a dungeon battle: StartDungeonBattle, its encounter helpers, the battle-entry tile wipe, PlayEncounterMusic |
| `src/engine/dungeon/floors.asm` | 192 | dungeon floors: StartDungeonFloor, floor change and exit (DungeonFloorChangeStep), RedrawDungeonFloor, PlayDungeonMusic |
| `src/engine/dungeon/load.asm` | 361 | dungeon floor loading: LoadDungeonFloor, GetDungeonTilesPtr, dungeon palettes, boss and player map sprites (DrawPlayerMapSprite) |
| `src/engine/dungeon/map.asm` | 347 | map cell lookup and tile drawing on wMapPtr, start position from cell attributes |
| `src/engine/dungeon/status_boxes.asm` | 438 | the dungeon's area name box and status box (name, level, HP, GP), their show / hide timer (DungeonBoxesStep) |
| `src/engine/dungeon/steps.asm` | 649 | moving on the dungeon map: cell attributes by direction, passability, adjacent boss / chest checks, rust step damage, CheckEncounter, DungeonStep |
| `src/engine/dungeon/task.asm` | 333 | the world map / dungeon task (WorldMapTaskInit, CrystalMineTaskInit, DungeonTask), EnterDungeon, the DUNGEON_MODE steps around battles, camp, chests and bosses |
| `src/engine/dungeon/world_map.asm` | 1217 | world map: WorldMapDispatch, dungeon select, name / description / Enter? boxes |
| `src/engine/events.asm` | 165 | story stage and talk/event flag helpers (GetStoryStage, AdvanceStoryStage, ClearTalkedFlags) |
| `src/engine/gfx/palettes.asm` | 426 | palette loading (colour and mono), palette resets, screen fades (wFadeLevel) and their upload to palette RAM |
| `src/engine/gfx/portraits.asm` | 121 | portrait drawing (PortraitTable), GetPictureFirstTile |
| `src/engine/gfx/robot.asm` | 445 | robot drawing: part images, equipped robot, image palettes |
| `src/engine/gfx/sprites.asm` | 304 | sprite buffer clear and upload, sprite map drawing (also H-flipped), DrawSpriteGrid, the sprite menu cursor |
| `src/engine/gfx/tilemap.asm` | 324 | tilemap (SCR1/SCR2) fill, clear and drawing, the flipped tile block writer |
| `src/engine/gfx/tiles.asm` | 179 | CHAR RAM tile loading: raw, mapped and LZSS-compressed tiles, tile fills |
| `src/engine/gfx/window.asm` | 387 | window registers: iris and window open/close animations |
| `src/engine/menus/main_menu.asm` | 788 | title screen (press A), main menu, config menu, delete data, MainMenuTask |
| `src/engine/menus/menu_helpers.asm` | 1458 | menu task framework: message task and waits, AskYesNo, cursor task, menu box task, list task and their post/wait commands, EndMenuTask |
| `src/engine/menus/new_game.asm` | 1022 | new game: Select Player, name entry, names confirm, default names |
| `src/engine/menus/print.asm` | 255 | string and number printing into text boxes: strings at a cell, string tables (PrintStringTable), decimal / hex / padded numbers, the GP display |
| `src/engine/menus/save.asm` | 636 | save slots: cart base, flash block reads, slot offsets, the BIOS flash erase / write calls (FlashEraseBlock, FlashWrite, moved here from audio/sound.asm), slot list drawing, save/load slot select and confirm tasks, Yes/No prompt, boot save check |
| `src/engine/menus/shop/lists.asm` | 463 | shop buy/sell list pages and hooks |
| `src/engine/menus/shop/menu.asm` | 745 | shop: clerk portraits and texts, ShopTalk greeting, buy/sell main menu, prices (packed BCD, sell = half), GP add/subtract, stock tier checks |
| `src/engine/menus/town/colla.asm` | 467 | Colla's gem offer, Tetis's gift, BCD/GP box drawing |
| `src/engine/menus/town/cyrius.asm` | 571 | Cyrius's emblem trade in D-town |
| `src/engine/menus/town/helmut.asm` | 471 | Helmut's skill offer |
| `src/engine/menus/town/npc_talk.asm` | 1312 | talking to town NPCs: talk rows, row actions, talk-screen transitions |
| `src/engine/menus/town/places.asm` | 932 | the town place task: Square menu, place pictures, talk slots, place states |
| `src/engine/menus/town/street.asm` | 541 | the street menu (Works / Shop / Arena / Square / W.Map) and the street task |
| `src/engine/menus/works/data.asm` | 180 | Works > Data: Save / Load menu and tasks |
| `src/engine/menus/works/develop.asm` | 717 | Works > Develop: develop chance (recipe, level, partner, tool bonuses), roll, engineer level up |
| `src/engine/menus/works/entries.asm` | 273 | entry (part or item group) lookups: names, descriptions, stats, affinity, inventory counts by group/category |
| `src/engine/menus/works/help.asm` | 132 | Works > Help: help menu and help page viewer task |
| `src/engine/menus/works/lists.asm` | 773 | Works item and part list pages and hooks (shared by Item, Setup, Develop, Trade and the shop), Works > Item menu |
| `src/engine/menus/works/main.asm` | 748 | Works screen: RunWorksScreen, WorksScreenTask, partner greeting, top menu and cursor descriptions, partner portrait/gender text |
| `src/engine/menus/works/setup.asm` | 469 | Works > Setup: equip part list, Works equipment list copy / equip / slot accessors |
| `src/engine/menus/works/stats.asm` | 876 | Works > Stats (Chara / UNIT): status panels, CalcSetupStats and its accessory handlers |
| `src/engine/menus/works/trade.asm` | 1003 | Works > Trade: trade menu, trade lists, link cable task |
| `src/engine/player.asm` | 701 | player/unit stats: TryLevelUp, LevelUpStatGains, CalcUnitStats, ApplyAccessoryStats and its AccStats* handlers, SetMaxPilotStats, BCD helpers |
| `src/engine/scenes.asm` | 1672 | intro, title reveal, story scenes, credits, game over; direct palette writes for scenes |
| `src/engine/tables.asm` | 966 | table lookups: item/part/enemy/skill names, descriptions and records, talk rows, shop tiers, item prices |
| `src/engine/text.asm` | 1302 | font glyphs, the text boxes (open / place / erase / clear, cursor, state queries, speed, the box cursor sprite) and their control codes, the Box1/2/3 wrappers, DrawString, message expansion |
| `src/home/system.asm` | 805 | boot, Reset, VBlank, tasks, joypad, random, event flags, items, display init, BIOS calls |

**Cleanups after the split (2026-11-25):** dungeon/core.asm was split into task.asm, floors.asm,
steps.asm and status_boxes.asm (its boss, chest, loading and encounter routines went to boss.asm,
chests.asm, load.asm and encounter.asm); the text-box routines that were in menus/print.asm
(SetTextBoxCursor, DrawTextCharInBox, GetTextBoxPos, DrawBoxCursorSprite, the IsTextBox* queries,
SetTextBoxSpeed / SetTextBoxText, ClearTextBoxHome) are in text.asm; FlashEraseBlock / FlashWrite
moved from audio/sound.asm to menus/save.asm.
