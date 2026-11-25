; data/unknown/unknown.asm: data blocks not identified yet, in ROM order (one section each).
; The bytes are written out; what reads them (if anything) is still open.

; no reader found ([play] a read watch over the whole human run and the ending: no reads): 23 bytes
; rising from 1 to 100 (1,1,1,5,10,15,20,25,35,40,..,95,100,100) between ExpLevelDiff and
; StatusRecovery. Ruled out: no immediate, 24-bit pointer or table base + offset reaches it (ExpForKill
; clamps its index to ExpLevelDiff's 11 records, GetStatusRecovery starts at StatusRecovery); 23 is the
; record count of the LevelGap* tables (line = level gap + 12), but AddLevelGapChances reads only those three
d_2253DE	section	romdata abs=0x2253DE
Data_2253DE:
	db	1,1,1,5,10,15,20,25,35,40,45,50
	db	55,60,65,70,75,80,85,90,95,100,100
; no reader found: 2 words (0x016C, 0x019E) between DungeonMonoPalettes (5 pointers, dungeons 1-5) and
; DungeonMaps. Ruled out: not a pointer (0x019E016C), not alignment filler; no immediate or pointer reaches
; it (LoadDungeonFloor reads DungeonPalettes / DungeonMonoPalettes by DUNGEON_ID - 1 = 0-4 only)
d_249420	section	romdata abs=0x249420
Data_249420:
	dw	0x016C,0x019E
; no reader found (no immediate or pointer): 20 bytes 0x08-0x1B counting up, right after the 20 skill
; name strings of nova.asm (NovaText-BreathText) and before CollaItems. The values equal the talk row
; GetHelmutSkillDesc computes for skill i (i + 8), but that code adds 8 and never reads this; not proof
; enough to name it
d_24A080	section	romdata abs=0x24A080
Data_24A080:
	db	0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B
