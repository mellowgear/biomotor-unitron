; data/dungeon/tables.asm: the dungeon tables in ROM order, one section per part; each part is a
; file in src/data/dungeon/: numbers as asm900 records (#include), names as text slot
; files ($include, character codes from the charmap). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_22744B	section	romdata abs=0x22744B
DungeonSelectMoves:
#include "src/data/dungeon/dungeon_select_moves.asm"
d_227473	section	romdata abs=0x227473
DungeonSelectCursor:
#include "src/data/dungeon/dungeon_select_cursor.asm"
d_2275A1	section	romdata abs=0x2275A1
; [code] DrawWorldMapMarker: the sprite position (x, y; drawn at x - 8, y - 12 by DrawSpriteGrid) of the
; marker for dungeon A = 0-3, which DrawBeatenDungeonMarkers draws for each set event flag 0x60-0x63 (was Data_2275A1)
WorldMapMarkerPos:
	dw	140,74
	dw	96,142
	dw	38,66
	dw	88,20
d_2275C0	section	romdata abs=0x2275C0
EncounterChance:
#include "src/data/dungeon/encounter_chance.asm"
d_228641	section	romdata abs=0x228641
BossBeatenSprites:
#include "src/data/dungeon/boss_beaten_sprites.asm"
d_2495EC	section	romdata abs=0x2495EC
WorldChests:
#include "src/data/dungeon/chests.asm"
d_2496B0	section	romdata abs=0x2496B0
MineChests:
#include "src/data/dungeon/mine_chests.asm"
d_2496CE	section	romdata abs=0x2496CE
ChestGold:
#include "src/data/dungeon/chest_gold/gold.asm"
d_2496EE	section	romdata abs=0x2496EE
ChestGoldText:
$include "src/data/dungeon/chest_gold/text.asm"
d_24974E	section	romdata abs=0x24974E
ChestOdds:
#include "src/data/dungeon/chest_odds.asm"
d_249936	section	romdata abs=0x249936
EncounterEnemies:
#include "src/data/dungeon/encounter_enemies.asm"
d_24998E	section	romdata abs=0x24998E
EncounterCounts:
#include "src/data/dungeon/encounters/counts.asm"
d_2499AF	section	romdata abs=0x2499AF
EncounterLists:
#include "src/data/dungeon/encounters/lists.asm"
d_249A55	section	romdata abs=0x249A55
BossEnemies:
#include "src/data/dungeon/boss_enemies.asm"
d_26FE0B	section	romdata abs=0x26FE0B
PlayerDungeonSprites:
#include "src/data/dungeon/player_dungeon_sprites.asm"
