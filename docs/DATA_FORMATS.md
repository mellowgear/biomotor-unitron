# Data formats

One section per structured format the code reads: layout, where it lives, who reads it. Offsets are bytes,
words are little-endian, "long" is a 4-byte ROM address (`dl` / `dd`). Prices and GP are **4-byte packed
BCD**, written `dd 0x650000` for 650000. Record macros: src/macros/tables.inc; field offset names:
src/constants/struct_fields.inc. Each data file's header comment has the full notes (play checks, odd
lines); where this page and a reader's header differ, the reader wins. Graphics and audio products:
[ASSETS.md](ASSETS.md); songs: [SONGS.md](SONGS.md). (?) = not settled.

Tables are 1-based unless noted: "line" n of a data file is id n, and the accessors subtract 1.

## Robot parts

**PartStats** (src/data/parts/stats.asm, `part_stat`): 227 records of 24 bytes, id 1..227 in five
categories: Body 1-15, Core 16-30, Legs 31-74, Back 75-94, Arm 95-227. `PartCategoryStart`
(category_start.asm, 5 words, read at 0x271882) holds each category's first id; `GetBodyName` ..
`GetArmRecord` (engine/tables.asm) take a category-relative id.

| Off | Size | Field (constant) | Reader |
|---|---|---|---|
| +0x00 | 2 | hp (`PART_HP`): summed into max HP | `CalcUnitStats`, `LoadEnemy` |
| +0x02 | 2 | ep (`PART_EP`): summed into max EP | same |
| +0x04..+0x0A | 4 x 2 | ap, sp, rp, mp: added to the pilot's | same |
| +0x0C | 2 | ep_cost (`PART_EP_COST`): EP an arm's attack costs | battle menu, `EnemyChooseAttack` |
| +0x0E | 2 | affinity bit mask (`PART_AFFINITY`); the body's is the robot's | `CalcUnitStats`, `LoadEnemy` |
| +0x10 | 2 | status an arm's hit inflicts: 1 paralysis, 2 rust, 3 EP leak, 4 confusion, 0 none | the player hit code |
| +0x12 | 1 | image within the slot's image group (0 = none) (`PART_IMAGE`) | `SetRobotDrawParts` |
| +0x13 | 1 | not identified (`p13`) | |
| +0x14 | 4 | price, BCD (selling: half) (`PART_PRICE`) | shop |

| Table | Layout | Reader |
|---|---|---|
| `PartNames` / `PartDescs` (names.asm, descs.asm) | 7-byte slots (6 chars + 0xFF) / 19-byte slots (18 + 0xFF) by id | `GetPartName`.. (engine/tables.asm) |
| `ArmEffects` (arm_effects.asm) | 133 x 7 bytes, line = part id - 94: +0 f0 (hit routine: 0 `PlayerHitResult1`, 1 `...2`, 2+ `...3`), +1..+6 battle effect ids, 0xFF ends | `GetArmEffects` |
| `PartOffsetsBody/RightArm/LeftArm/Legs/Back` (part_offsets_*.asm) | 32 bytes per image: 16 (x, y) signed pixel pairs, one per body image (column 0 unused) | `DrawRobotPart` |
| `PartIdWords` (part_id_words.asm) | 239 x (part, bits): category bit per part | `GetPartIdWord`, no caller |
| `ShopPartStock` (data/shop/shop_part_stock.asm) | 1 tier byte per part, see [Shops](#shops) | `GetShopPartTier` |

## Items

**Items** are ids 1..71 in four groups (`ItemGroupSizes`, `ItemGroupStarts`): 1-37 accessories, 38-51
battle items, 52-56 tools, 57-71 materials. Item 0xFF is the Tetis autograph count (`wTetisAutographs`).

| Table (src/data/items/) | Layout | Reader |
|---|---|---|
| `ItemPrices` (prices.asm) | 71 x 4-byte BCD buy price | 0x208272 / 0x208281 accessors, shop |
| `ItemNames` / `ItemDescs` (names.asm, descs.asm) | 7-byte / 19-byte slots | engine/tables.asm |
| `BattleItemEffects` (battle_item_effects.asm) | 14 x 4 bytes, line = id - 37: +0 f0, +1..+3 effect ids | `GetBattleItemEffect`, `BattleUseItem` -> `BattleItemJumps` |
| `FixItHP` (fixit_hp.asm) | 4 bytes: HP restored by FixIt1-4 at camp | `CampUseHealItem` |
| `AccessoryData` (accessory_data.asm) | 37 x 2 bytes (b0, b1); no reader found | |
| accessory handlers (accessory_pointers.asm) | long per accessory id: battle-start handler, stat handler | `ApplyBattleAccessory`, `ApplyAccessoryStats` |
| `ItemGroupIds`, `ItemAffinity`, `ItemValues_25B379` (item_works/) | 71 x 2 bytes each, the Works copy; mostly no caller | |
| `ShopItemStock` (data/shop/) | 1 tier byte per item | `GetShopItemTier` |

**Inventory** (save data): `wItemCounts` + id (0x5080.. for id 1) and `wPartCounts` + id (0x5180..): one
byte per id, the low 4 bits the count (`AddItem`: max 9, carry when full), bit 7 = seen once (kept by
`RemoveItem`). An **entry** in the Works / shop code is a word group << 8 | index (`wShownPart`,
`wShopEntry`): part categories 1-5, item groups from 6 (engine/menus/works/entries.asm).

## Enemies and their attacks

**EnemyStats** (src/data/battle/enemies/stats.asm, `enemy_stat`): 118 records of 26 bytes, id 1..118.
`GetEnemyRecord` (0x2082AF), read by `LoadEnemy` (0x2077D1) into the enemy battle block (0x5DA2..).

| Off | Size | Field (constant) | Goes to |
|---|---|---|---|
| +0x00 | 1 | level (`ENEMY_LEVEL`); 255 = scaled by area (`EnemyScaling`) | `wEnemyLevel` |
| +0x01 | 1 | not identified (`f01`) | |
| +0x02, +0x04 | 2, 2 | max HP, max EP (ids below 0x62 get a random -5..+5 when scaled) | `wEnemyMaxHP`, `wEnemyMaxEP` |
| +0x06..+0x0C | 4 x 2 | ap, sp, rp, mp | `wEnemyAP`..`wEnemyMP` |
| +0x0E | 2 | affinity bit mask | `wEnemyAffinity` |
| +0x10 | 2 | monster image (`GetMonsterImage`: ImageTable[235 + image - 1]; palette `MonsterPalettes` + 8 x (image - 1)) | `wEnemyImage` |
| +0x12 | 2 | EXP (scaled by `ExpLevelDiff`) | `ExpForKill` |
| +0x14 | 2 | GP | `BattleVictory` |
| +0x16 | 2 | drop: item id, or a part when the high byte is set | `BattleVictory` |
| +0x18 | 1 | drop chance % (100+ = always) | `BattleVictory` |
| +0x19 | 1 | not identified (`f19`) | |

**EnemyAttacks** (enemy_attacks.asm, `enemy_attack`): 472 records of 15 bytes = 4 slots per enemy
(`GetEnemyAttackSlots`); `DefaultEnemyAttack` (default_attack.asm) is used when EP is below every slot.

| Off | Size | Field (constant) |
|---|---|---|
| +0 | 1 | attack name id (`AttackNames`), 255 = empty slot (`SLOT_ATTACK`) |
| +1 | 2 | power: base damage, scaled for scaled enemies (`SLOT_POWER`) |
| +3 | 1 | action: `EnemyActionJumps[action + 1]` (255 plain attack; 1-4 inflict a status; 11 / 12 attack with the robot's right / left arm) (`SLOT_ACTION`) |
| +4 | 2 | EP cost (`SLOT_EP`) |
| +6 | 1 | affinity bit (`SLOT_AFFINITY`) |
| +7 | 1 | chance %, slots tried in order: 100 always, 101 only below half HP, 0x65 once (`wEnemyFullHealUsed`) (`SLOT_PCT`) |
| +8 | 1 | f0: hit routine (`EnemyHitResult2/3/4`) |
| +9..+0xE | 6 | battle effect ids, 0xFF ends (`SLOT_EFFECTS`) |

| Table (src/data/battle/) | Layout | Reader |
|---|---|---|
| `EnemyScaling` (enemy_scaling.asm) | 16 x 14 bytes: hp, ep, ap, sp, rp, mp % (words), level base, level random; row = area level (1-8, rows 9-16 after event flag 0xA / 0xB) | `GetEnemyScaling` |
| `EnemyNames`, `AttackNames` | 7-byte slots | `GetEnemyName`, 0x2082DC |
| `DamageTable` (damage.asm) | 202 x 5 words d0..d4: base damage, line from attack - defence, column random | `DamageRoll` |
| `AffinityTable` (affinity.asm) | 9 x 9 words, see below | `ApplyAffinity` |
| `LevelRolls` (level_rolls.asm) | 11 x (rand, base): random 1..rand + base, line = (level - 1) / 5 + 1 | `LevelRoll` |
| `ExpLevelDiff` (exp_level_diff.asm) | 11 x exp %, line = enemy level - yours, clamped -5..+5, + 6 | `ExpForKill` |
| `LevelGapCrit` / `LevelGapStatus` / `LevelGapFlee` (level_gap_chances/) | 23 x 1 byte each, line = level gap + 12 | `AddLevelGapChances` |
| `StatusRecovery` (status_recovery.asm) | 22 x recovery % by turns so far | `RollStatusRecovery` |
| `BattleEffectSounds` (effect_sounds.asm) | long per effect id -> list of `sound_cue` (frame byte, sound word), frame 0xFF ends | `PlayBattleEffect` |
| `BossEnemies`, `BossBeatenSprites` (data/dungeon/) | 1 byte per boss index | `BossEncounter`, `LoadBossMapSprite` |

**AffinityTable**: 9 records of 18 bytes, line = the attacker's affinity, column = the defender's; each
entry a word % (damage x entry / 100, at least 1). `AffinityIndex` turns a bit mask into its lowest set
bit: 1 Fire, 2 Wood, 4 Water, 8 Wind, 16 Earth, 32 Light, 64 Dark, 128 Mirror; no bit = line 9.

## Skills

| Table (src/data/battle/skills/) | Layout | Reader |
|---|---|---|
| `SkillStats` (stats.asm) | 20 x 18 bytes: 8 words s00..s0E, then the effect word (0 attack with power s04; 5 stats up, 6 enemy stats down, 7 full heal, 8 time stop, 9 Recvr, 10 Airbag, 11 Full charge) | accessors 0x2083BF.., `SkillEffects` |
| `SkillData` (data.asm) | 20 x 8 bytes, as `ArmEffects` (f0 + effect ids) (?): the header calls it 8 bytes, arm_effects.asm calls the format 7 | `CheckCanAttack` |
| `SkillNames` / `SkillDescs` | 7 / 19-byte slots | |

Race r = (`wPlayerRace` - 1) / 2 is offered skills 4r+1..4r+4 by Helmut (`HelmutSkillOffer`).

## Pilot and Works tables

| Table | Layout | Reader |
|---|---|---|
| `ExpCurve1..5` (data/player/exp_curves/) | 50 words per race: EXP to the next level (0 = max) | `TryLevelUp` via `ExpCurves` (0x224FF5) |
| `LevelGainsOdd` / `LevelGainsEven` (level_gains/) | 51 x (ap, sp, rp, mp) by level; odd / even `wPlayerRace` | `TryLevelUp` |
| `LevelBonus` (level_bonus.asm) | 10 x (ap, sp, rp, mp) random extra, line = `wPlayerRace` | `TryLevelUp` |
| `StartingEquipment` (start_equipment.asm) | 5 x 6 category-relative part ids: core, body, right arm, left arm, legs, back | `NewGameSetup` |
| `RaceNames`, `RankTitles` | 7-byte slots | `GetRaceName`, `GetRankTitle` |
| `Recipes` (data/works/recipes.asm) | 1995 x 3 bytes (pct, result arm, dev_exp) at 3 x (15 x (arm - 1) + material - 1); pct 255 = none | `GetRecipe`, `DevelopRoll` |
| `DevLevelBonusMale/Female`, `DevLevelExpMale/Female`, `DevPartnerBonus` (data/works/) | bytes by engineer level / partner race | `UpdateDevelopChance`, `EngineerLevelUp` |

## Shops

`ShopItemStock` and `ShopPartStock` (src/data/shop/): one tier byte per id. An entry is listed when its
tier is non-zero and above the threshold for `wArenaRankCopy` in `ShopTierByRank` (4 3 3 2 2 1 1 0 0 0
for ranks 0-9): 4 = from the start, 3 = from rank 3, 2 = rank 5, 1 = rank 7, 0 = never. Prices: the part
or item price; selling gives half (engine/menus/shop/menu.asm). The shop menu and list screens use the
menu tables below.

## Menu and list tables

| Format | Layout | Reader |
|---|---|---|
| `menu_item` (data/works/menu_*.asm, data/shop/menu_*.asm) | 6 bytes: text box column, row, long string pointer | `PrintStringTable`, `PrintStringTableEntry` |
| menu box set-up | the caller sets `wMenuCount` (stops), `wMenuTextCount`, `wMenuTexts` (menu_items), `wMenuCells` (2 bytes column, row per stop), `wMenuValues` (1 byte result per stop) | `MenuBoxTask` |
| list set-up | `wListCells` (2 bytes per row), `wListRows`, `wListDrawPage` / `wListMoveHook` / `wListAcceptHook` callbacks | `ListTask` |

## Dungeons

| Table (src/data/dungeon/) | Layout | Reader |
|---|---|---|
| `DungeonData` (dungeon.asm, 0x2493EC) | 3 longs: `DungeonMetatiles`, `DungeonTiles` (LZSS sheet), `DungeonMetatileAttrs` | `LoadDungeonFloor` |
| `DungeonMetatiles` (src/gfx/blocksets/dungeon.bst) | 441 x 4 tile words (top left, top right, bottom left, bottom right) | `GetMetatileTiles` |
| `DungeonMetatileAttrs` | 1 word per metatile: 0x1000 solid, 0x8000 + n chest spot n, 0x0200 stairs down, 0x0100 arrival / stairs up, 0x9000 (?) | `GetMapCellAttr` |
| `DungeonMaps` (pointers.asm) | 57 x 8 bytes (`DUNGEON_MAP_SIZE`): long map, long chest list (`DUNGEON_MAP_CHESTS`) | `GetFloorDungeonMap` |
| a floor map (src/maps/dungeon/map_NN.blk) | word width, word height, then width x height map words: bits 0-12 metatile, bit 14 swap rows, bit 15 swap columns, bits 13-15 also xored into each tile word | `GetMapCell`, `GetMetatileTiles` |
| `DungeonChests_NN` | 6 x (x, y, attr) words: the chest spots | `RollFloorChests` |
| `DungeonPalettes` / `DungeonMonoPalettes` | long per dungeon 1-5 | `LoadDungeonFloor` |
| `WorldChests` (chests.asm) | 28 x 7 chest codes, line = 7 x (dungeon - 1) + floor; column by `ChestOdds` (7 x %) | `PickWorldChest` |
| `MineChests` (mine_chests.asm) | 5 x 6 fixed chest codes (Crystal Mine) | `SetMineChests` |
| `ChestGold` / `ChestGoldText` (chest_gold/) | 16 words / 6-byte slots for codes 74-89 | `GetChestGold`, `GetChestGoldText` |
| `EncounterCounts`, `EncounterLists`, `EncounterEnemies` (encounters/, encounter_enemies.asm) | per (dungeon - 1) x 7 + floor: count, long to a run of enemy ids | `GetEncounterEnemy` |
| `EncounterChance` (encounter_chance.asm) | 25 x %: battle chance by steps since the last battle (the last must stay 100) | `CheckEncounter` |
| `PlayerDungeonSprites` (player_dungeon_sprites.asm, `player_dungeon_sprite`) | 60 x 10 bytes: w, h, 4 tile words of player.png; line = race x 12 + set x 3 + frame + 1 | `LoadPlayerDungeonSprite` |
| `DungeonSelectMoves`, `DungeonSelectCursor` | world map moves per direction (255 = none), cursor x / y | `DungeonSelectMove`, `GetDungeonSelectCursor` |

**Chest codes**: 1-71 item id, 72 part CoreX, 73 part Grav, 74-89 gold (`ChestGold`), 0xFC empty, 0xFD
opened, 0xFE a special per-dungeon chest (?), 0xFF no chest. **`wChestTable`** (0x5FFA): per floor
(`CHEST_FLOOR_SIZE` 0x1E) 6 chests (`CHESTS_PER_FLOOR`) of 5 bytes (`CHEST_SIZE`): code, x, y, attr word.

**Floors** (`RollFloorMaps`): dungeons 1-4 have 13 maps each (map ids 13 x (dungeon - 1) + 0..12):
floors 1-6 are 6 distinct random maps of the first 12 and floor 7 is map 12 (the boss). The Crystal Mine
has 5 fixed maps 0x34-0x38. The chosen ids go to `DUNGEON_FLOOR_MAPS` in the task.

## Town talk

**Talk rows** (`talk_row`, 8 bytes; src/data/town/talk_*.asm, one table per place: Pub, D-town, Forest,
Spring, Works, Shop, places 7 and 8; `TalkPlaceRows` points at each; `TalkDefaultRow` for row 0xFF).
`GetTalkRow` = rows[place - 1] + 8 x row.

| Off | Size | Field |
|---|---|---|
| +0 | 1 | speaker: the portrait drawn for the speaker (0 none, 255 the player's own); NPC n = speaker - 0x15 (`TownNpcTalk`) |
| +1 | 1 | portrait: the place picture behind |
| +2 | 1 | event flag set when the row is shown (`NpcTalkRowAction`; 0 none; 1, 9, 0x4A, 0x4D do more) |
| +3 | 1 | next: the next row, a command 0xE6-0xFD (`NpcTalkRowNext`), 0xFF end |
| +4 | 4 | message: text address; below 0x58 an offset into `TalkGenderTexts` (female / male pointer pairs) |

| Table | Layout | Reader |
|---|---|---|
| `TalkSlotsPub/DTown/Forest/Spring` + `TalkSlotCounts` (talk_slots_*.asm, talk_slot_lists/) | per story stage, the rows listed in the place, 255 ends | `LoadTalkSlots` |
| `TalkNpcRows` (talk_npc_rows.asm) | 17 x 4 bytes: the row shown once the NPC's talked flag is set, by greeted / late columns, 255 = default | `TownNpcTalk` |
| `PlacePortraits` | 7 picture numbers (Square, Pub, D-town, Forest, Spring, Works, Shop) | `DrawTownPlace` |
| `CollaItems` / `CollaOdds` / `CollaPrices` / `CollaPriceOdds` (colla_offers/, colla_price_odds.asm) | 10 items, 6 rank columns of %, 5 BCD prices each, 5 price-column % | `RollCollaOffer` |
| `CyriusTradeMenu` (cyrius_trades.asm) | 5 x 6 words per race: item id, or 0x100 + part id | `CyriusTrade` |
| `TetisGiftIndex`, `TetisGifts` | gift by autograph count and gender; value as Cyrius's | `TetisGift` |

## Story and arena

| Table | Layout | Reader |
|---|---|---|
| `StageFlags`, `StageArenaRank`, `StageStatBonus` (data/story/) | flag per stage, `wArenaRank` per stage, ap/sp/rp/mp bonus per stage | `SetStoryStage`, `GetStageArenaRank`, town event 0x4A |
| `StageRequiredTalkCounts` / `StageRequiredTalkLists` (data/arena/) | per stage, event flags that must all be set before the arena | `GetArenaTalkRow` |
| `ArenaEntryCosts`, `ArenaPrizeGP`, `ArenaPrizeItems` | per rank E D C B A S CS X: word GP, word GP, item | `ArenaRankListChoose`, `ArenaSceneEnd` |
| `ArenaBrackets` + `ArenaBracketSizes` (arena_brackets/) | 8 x 6 opponents (enemy id, 255 = random pilot 98 + Random() % 15), count | `RollArenaBracket` |
| `ArenaPilot*` (arena_pilot_parts/) | per rank and pilot group: core, body base, arm / leg / back choices and counts -> 6 part ids per random pilot at `wArenaPilotParts` + 6 x slot (core, body, right arm, left arm, legs, back) | `RollArenaBracket`, `LoadEnemy` |
| `ArenaSceneCast` / `ArenaSceneEndActions` / `ArenaSceneNext` (arena_scenes/) | 70 bytes each, by scene: portraits, end action (1-3), next scene (below 0x50 a scene, 0x50-0x6F a gender pair in `ArenaGenderScenes`, 0xF2-0xFE commands, 0xFF end) | `ArenaSceneEnd`, `DrawArenaSceneCast` |

## Text

The character set (src/text/charmap.txt): 0x00 space, 0x01-0x1A a-z, 0x21-0x3A A-Z, 0x41-0x4A 0-9, then
punctuation and symbols up to 0x78. Font glyph n - 1 draws code n (`GetFontGlyph`, 128 glyphs).

| Code | Meaning | Handled by |
|---|---|---|
| 0x90-0x9F | `<NUM0>`..`<NUM15>`: decimal of the word at XIZ+0xE+2n of the calling task | `ExpandMessage` -> `MsgInsertNumber` |
| 0xA0-0xAF | `<STR0>`..`<STR15>`: the string at the long pointer XIZ+0xE+2n | `MsgInsertString` |
| 0xB0-0xB4 | `<ENEMY>`, `<RIGHTARM>`, `<LEFTARM>`, `<SKILL1>`, `<SKILL2>` | `MsgInsert*` |
| 0xFA | `<WAIT>`: wait for A / B | `TextCmd_Wait` |
| 0xFB / 0xFC | `<PARTNER>` / `<PLAYER>`: the name at 0x502F / 0x5013 | `TextCmd_Name2`, `TextCmd_PlayerName` |
| 0xFD | `page`: clear the box | `TextCmd_Page` |
| 0xFE | `line`: newline | `TextCmd_Newline` |
| 0xFF | `done`: end | `TextCmd_End` |

Placeholders (0x90..0xEF) are expanded into `wTextBuffer` by `ExpandMessage` before printing; the codes
0xF0 up are run by the text box itself. Name and description tables are fixed-size slots (`slot 7 FF`,
`slot 19 FF`): the text, 0xFF, padding. Texts are in src/text/*.asm, one bank per file (src/text/banks.asm).

## Graphics records

| Format | Layout | Reader |
|---|---|---|
| portrait record (data/graphics/portraits.asm) | 6 longs: colour palette (10 palettes), colour tiles (LZSS sheet), colour map, mono palette, mono tiles, mono map | `DrawPortrait`, `DrawPortraitColor` |
| `PortraitTable` | 68 longs, one per portrait number | `DrawPortrait` |
| `PortraitOffsets` | 25 x (dx, dy) | `DrawPortraitAt` |
| `ImageTable` and its sub-tables (gfx/image_pointers.asm) | longs: body images, then right arm, left arm, legs, back and monster images | `DrawRobotPart`, `GetMonsterImage` |
| `MonsterPalettes` (gfx/monsters.asm) | 4 colours per image | `LoadPalettes` |
| intro frame tables (data/graphics/intro_frames.asm) | longs to maps per animation step, colour and mono | `IntroCockpitAnim`, `CycleIntroLetters`, `IntroMeteorTask` |
| tile sheet / image / map products | see [ASSETS.md](ASSETS.md) | |

### Battle effects

`BattleEffects` (data/battle_anims/battle_effects.asm, 0x284124): long per effect id (232) to a 20-byte
record of 5 longs:

| Off | Field |
|---|---|
| +0x00 | frame list: a long per frame, each a sprite map (u8 w, h + words) |
| +0x04 | tile sheet (u16 count + LZSS) |
| +0x08 | colour palette (sprite palette 0xE) |
| +0x0C | mono palette (never loaded: `LoadMonoPalettes` with A = 0xE returns) |
| +0x10 | script: total ticks, then 4-byte steps (ticks, frame, dx, dy) |

Sound cues per effect: `BattleEffectSounds` above.

## Compression

LZSS as in Okumura's LZSS.C (`DecompressTiles`, engine/gfx/tiles.asm): a 1 KiB ring at `wTextBuffer`,
zeroed, write position starting at 0x3EE; a flag byte per 8 items, bit set = a literal byte, clear = a
match word: offset = low byte | (high byte & 0xF0) << 4, length = (high byte & 0xF) + 3. Used by tile
sheets (`LoadCompressedTiles`), monster images (`LoadMonsterImage`) and part images (`DrawPartImage`, 4-bit
pixels). The build's compressor reproduces every original stream.

## Songs

`SongTable` (audio/songs.asm, 0x200E86): 21 longs + 0; a song header is 3 Z80 addresses, the voice count
and voice ids (9-byte records in `SoundInit`), then per track a long and a byte map, 0 ending the list.
Tracks are in audio/tracks/*.song. Full format: [SONGS.md](SONGS.md), the driver: [Z80_DRIVER.md](Z80_DRIVER.md).

## Save data

A file (`SaveGameSlot` / `LoadGameSlot`) is 16 bytes of cartridge id + 0x26D bytes copied from RAM
0x5013..0x527F, at flash 0xFA030 + 0x290 x (slot - 1); slot 0 (0xFA000) holds the id and the two option
bytes. Offsets below are from the start of the RAM block (add 0x10 for the flash offset).

| Off | RAM | Size | Field |
|---|---|---|---|
| +0x000 | 0x5013 | 14 | `wPlayerName` (0xFF-terminated, 6 chars) |
| +0x00E | 0x5021 | 1 | `wPlayerRace` (1-10: race pair x 2, odd = male) |
| +0x00F | 0x5022 | 1 | `wPlayerLevel` |
| +0x010 | 0x5023 | 2 | `wExpToNext` |
| +0x012 | 0x5025 | 1, 1 | `wSkill1`, `wSkill2` |
| +0x014 | 0x5027 | 4 x 2 | `wPilotAP`, `wPilotSP`, `wPilotRP`, `wPilotMP` |
| +0x01C | 0x502F | 14 | `wPartnerName` |
| +0x02A | 0x503D | 1 | `wPartnerRace` |
| +0x02B | 0x503E | 1 | `wEngineerLevel` |
| +0x02C | 0x503F | 2 | `wEngineerExp` |
| +0x02E | 0x5041 | 4 | `wGP` (BCD) |
| +0x032 | 0x5045 | 1 | `wArenaRank` |
| +0x033 | 0x5046 | 8 | equipment: `wEquipCore`, Body, RightArm, LeftArm, Legs, Back, Acc1, Acc2 (category-relative ids) |
| +0x03B | 0x504E | 6 x 2 | `wUnitAP`, SP, RP, MP, `wUnitHP`, `wUnitEP` |
| +0x047 | 0x505A | 2 | `wUnitAffinity` |
| +0x049 | 0x505C | 2, 2 | `wUnitMaxHP`, `wUnitMaxEP` |
| +0x04D | 0x5060 | 16 x 2 | `wEventFlags`: flag f = bit f & 15 of word f >> 4 (`CheckEventFlag`); the words at 0x5068 (flags 0x40..0x4F, `wNpcTalked`), 0x5074 (0xA0.., `wBodyUpgrades`) and 0x5076 (0xB0.., `wEventFlagsB0`, zeroed by `LoadGameSlot`) have their own names |
| +0x06D | 0x5080 | 255 | item counts, id 1..0xFF at `wItemCounts` + id (0x517E = `wTetisAutographs`, item 0xFF) |
| +0x16D | 0x5180 | 255 | part counts, id 1..0xFF at `wPartCounts` + id |
| (slot 0) | 0x5280, 0x5281 | 1, 1 | `wOptionMessageSpeed`, `wOptionAnimation` |

Event flag meanings: src/constants/event_flags.inc. `CheckBitArray` (engine/menus/save.asm) reads a flag
from a saved slot's copy (the save list's emblems, flags 0x10-0x13).

## Link packet

`LinkCommTask` (engine/menus/works/trade.asm) exchanges a 7-byte packet, sent as 16 bytes: the sync word
`LinkSyncWord` + 14 hex characters (`EncodeLinkPacket` / `DecodeLinkPacket`).

| Off | Size | Field |
|---|---|---|
| +0 | 1 | counter (the larger of own and received, + 1) |
| +1 | 1 | answer bits: 0 / 2 own (1 yes, 5 no), 1 / 3 the partner's echoed |
| +2 | 2 | the entry offered (`wLinkOffer`: row + 1, group) |
| +4 | 2 | the partner's offer echoed back |
| +6 | 1 | `LinkChecksum` |
