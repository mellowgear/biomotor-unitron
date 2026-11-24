; Record field offsets, from the confirmed columns in src/tables (tools/tables.py).
; Code that reads a record right after its accessor uses these names.
.equ ENEMY_LEVEL 0x0
.equ ENEMY_HP 0x2
.equ ENEMY_EP 0x4
.equ ENEMY_AP 0x6
.equ ENEMY_SP 0x8
.equ ENEMY_RP 0xA
.equ ENEMY_MP 0xC
.equ ENEMY_AFFINITY 0xE
.equ ENEMY_IMAGE 0x10
.equ ENEMY_EXP 0x12
.equ ENEMY_GP 0x14
.equ ENEMY_DROP 0x16
.equ ENEMY_DROP_PCT 0x18
.equ PART_HP 0x0
.equ PART_EP 0x2
.equ PART_AP 0x4
.equ PART_SP 0x6
.equ PART_RP 0x8
.equ PART_MP 0xA
.equ PART_EP_COST 0xC
.equ PART_AFFINITY 0xE
.equ PART_STATUS 0x10
.equ PART_IMAGE 0x12
.equ PART_PRICE 0x14
.equ SLOT_ATTACK 0x0
.equ SLOT_POWER 0x1
.equ SLOT_ACTION 0x3
.equ SLOT_EP 0x4
.equ SLOT_AFFINITY 0x6
.equ SLOT_PCT 0x7
.equ SLOT_EFFECTS 0x9

; task struct (RunTasks 0x206286): +0 prev, +2 next, +4 parent, +7 flags (bit 7 ended),
; +8 function (32-bit; +0xA = its high word), +0xC children still running, +0xE argument
.equ TASK_FUNC 0x8
.equ TASK_FUNC_HI 0xA
.equ TASK_CHILDREN 0xC
.equ TASK_ARG 0xE

; dungeon task (block 0x52B0; the Crystal Mine uses 0x52DE): same fields as wGameMode..
.equ DUNGEON_MODE 0xF
.equ DUNGEON_ID 0x10
.equ DUNGEON_FLOOR 0x11
.equ DUNGEON_X 0x13
.equ DUNGEON_Y 0x14
.equ DUNGEON_FACING 0x15
.equ DUNGEON_FLOOR_COUNT 0x16
.equ DUNGEON_FLOOR_MAPS 0x17
.equ DUNGEON_STEPS 0x2B

; wChestTable: per floor 6 chests x 5 bytes (content, x, y, attr u16)
.equ CHESTS_PER_FLOOR 6
.equ CHEST_SIZE 5
.equ CHEST_FLOOR_SIZE 0x1E

; DungeonMaps 0x249424: per map id, +0 map pointer, +4 chest position list
.equ DUNGEON_MAP_SIZE 8
.equ DUNGEON_MAP_CHESTS 4
