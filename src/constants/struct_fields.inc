; Record field offsets of the game database tables (src/data/<subject>/), from their confirmed columns.
; Code that reads a record right after its accessor uses these names.
ENEMY_LEVEL	equ	0x0
ENEMY_HP	equ	0x2
ENEMY_EP	equ	0x4
ENEMY_AP	equ	0x6
ENEMY_SP	equ	0x8
ENEMY_RP	equ	0xA
ENEMY_MP	equ	0xC
ENEMY_AFFINITY	equ	0xE
ENEMY_IMAGE	equ	0x10
ENEMY_EXP	equ	0x12
ENEMY_GP	equ	0x14
ENEMY_DROP	equ	0x16
ENEMY_DROP_PCT	equ	0x18
PART_HP	equ	0x0
PART_EP	equ	0x2
PART_AP	equ	0x4
PART_SP	equ	0x6
PART_RP	equ	0x8
PART_MP	equ	0xA
PART_EP_COST	equ	0xC
PART_AFFINITY	equ	0xE
PART_STATUS	equ	0x10
PART_IMAGE	equ	0x12
PART_PRICE	equ	0x14
SLOT_ATTACK	equ	0x0
SLOT_POWER	equ	0x1
SLOT_ACTION	equ	0x3
SLOT_EP	equ	0x4
SLOT_AFFINITY	equ	0x6
SLOT_PCT	equ	0x7
SLOT_EFFECTS	equ	0x9


; dungeon task (block 0x52B0; the Crystal Mine uses 0x52DE): same fields as wGameMode..
DUNGEON_MODE	equ	0xF
DUNGEON_ID	equ	0x10
DUNGEON_FLOOR	equ	0x11
DUNGEON_X	equ	0x13
DUNGEON_Y	equ	0x14
DUNGEON_FACING	equ	0x15
DUNGEON_FLOOR_COUNT	equ	0x16
DUNGEON_FLOOR_MAPS	equ	0x17
DUNGEON_STEPS	equ	0x2B

; wChestTable: per floor 6 chests x 5 bytes (content, x, y, attr u16)
CHESTS_PER_FLOOR	equ	6
CHEST_SIZE	equ	5
CHEST_FLOOR_SIZE	equ	0x1E

; DungeonMaps 0x249424: per map id, +0 map pointer, +4 chest position list
DUNGEON_MAP_SIZE	equ	8
DUNGEON_MAP_CHESTS	equ	4
