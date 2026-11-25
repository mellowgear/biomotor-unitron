; engine/dungeon/encounter.asm: starting a dungeon battle: StartDungeonBattle, its encounter helpers, the battle-entry tile wipe, PlayEncounterMusic

c_210EE8	section	code abs=0x210EE8

; [code] DungeonStep mode 5: EncounterFlashStep until done, then StartBattleWipe and mode 6 (StartDungeonBattle)
DungeonEncounterFlash:
	call	EncounterFlashStep
	cp	A,1
	jr	Z,DungeonEncounterFlash.done
	calr	StartDungeonBattleWipe
	ld	A,6
	ld	(XIZ+0xF),A
DungeonEncounterFlash.done:
	ret

c_210EF9	section	code abs=0x210EF9

; [code] StartBattleWipe; DungeonEncounterFlash
StartDungeonBattleWipe:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	StartBattleWipe
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210F06	section	code abs=0x210F06

; [code+play] wipe, random enemy for the floor (GetEncounterEnemy), wAreaLevel, LoadEnemy, BattleStart
StartDungeonBattle:
	call	BattleWipeStep
	cp	A,1
	jr	Z,StartDungeonBattle.done
	call	GetEncounterEnemy
	ld	XHL,0
	ld	W,(XIZ+0x10)
	cp	W,5
	jr	Z,StartDungeonBattle.skip
	ld	W,(XIZ+0x11)
	jr	StartDungeonBattle.skip2
StartDungeonBattle.skip:
	ld	W,8
StartDungeonBattle.skip2:
	ld	(wAreaLevel),W
	call	LoadEnemy
	ldb	(wDungeonBattle),1
	call	StartBattleTask
	ld	A,7
	ld	(XIZ+0xF),A
StartDungeonBattle.done:
	ret

c_212B14	section	code abs=0x212B14

; [code] +0x2C = 0, PlayMusic(0xE), SoundCommand(0x2E): CheckEncounter on a random encounter (BossBattleIntro plays the same pair before a boss battle)
; [play] seen in play: song 0xE is the encounter jingle; it starts on the first frame of the white flash (DUNGEON_MODE 3 -> 5) and plays through the flash and the dot wipe until BattleStart's battle song
PlayEncounterMusic:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	XWA,0xE
	call	PlayMusic
	ld	WA,0x2E
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212B32	section	code abs=0x212B32

; [code] +0x2C counts to 0x40: wFadeLevel = ((n >> 1) & 7) * 16 (towards white, 8 pulses), A = 1; at 0x40 wFadeLevel 0, +0x2C 0, A = 0
EncounterFlashStep:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x40
	jr	Z,EncounterFlashStep.skip
	srl	1,A
	and	A,7
	extz	WA
	mul	WA,0x10
	ld	(wFadeLevel),A
	ld	A,1
	jr	EncounterFlashStep.skip2
EncounterFlashStep.skip:
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,0
EncounterFlashStep.skip2:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212B66	section	code abs=0x212B66

; [code] +0x2C = 0, DrawWipeTilemap on SCR1 (0x9800) with tile 0x10
StartBattleWipe:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	XHL,0x9800
	ld	WA,0x10
	call	DrawWipeTilemap
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212B80	section	code abs=0x212B80

; [code] DrawWipeTileStep of tile 0x10 for step +0x2C, +0x2C += 1; A = 1 while running (StartDungeonBattle, BossEncounter state 8 wait for 0)
BattleWipeStep:
	push	XHL
	push	XDE
	push	XBC
	ld	WA,0x10
	ld	BC,0
	ld	C,(XIZ+0x2C)
	call	DrawWipeTileStep
	ld	C,(XIZ+0x2C)
	inc	1,C
	ld	(XIZ+0x2C),C
	cp	A,1
	jr	Z,BattleWipeStep.skip
BattleWipeStep.skip:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D66	section	code abs=0x216D66

; [code] XHL = tilemap, WA = tile: DrawWipeTileStep step 0, then 20 x 19 entries (row stride 0x20) of the tile with palette 15 (0x3E00), flip bit 15 on even columns and flip bit 14 on odd rows (four mirrored copies of one tile)
DrawWipeTilemap:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	DrawWipeTileStep
	pop	WA
	ld	B,0
DrawWipeTilemap.loop:
	ld	C,0
DrawWipeTilemap.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,DrawWipeTilemap.skip
	or	DE,0x4000
	jr	DrawWipeTilemap.skip2
DrawWipeTilemap.skip:
	or	DE,0
DrawWipeTilemap.skip2:
	ld	A,C
	and	A,1
	jr	Z,DrawWipeTilemap.skip3
	or	DE,0
	jr	DrawWipeTilemap.skip4
DrawWipeTilemap.skip3:
	or	DE,0x8000
DrawWipeTilemap.skip4:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0x14
	jr	C,DrawWipeTilemap.loop2
	ld	XDE,0x20
	sub	XDE,0x14
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0x13
	jr	C,DrawWipeTilemap.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216DCD	section	code abs=0x216DCD

; [code] WA = tile, C = step: rewrites the 16 bytes of the tile in CHAR RAM 0xA000 + 16 * tile: byte i = PixelFillBytes[clamp(step / 4 - (i / 2) - 4 * (i odd), 0, 4)] (filled from the top left); A = 1 until C = 0x14
DrawWipeTileStep:
	push	XHL
	push	XDE
	push	XBC
	sra	2,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,0xA000
	add	XHL,XWA
	ld	B,0x10
DrawWipeTileStep.loop:
	ld	A,0
	ld	XDE,XHL
	and	XDE,1
	jr	Z,DrawWipeTileStep.skip
	sub	A,4
DrawWipeTileStep.skip:
	ld	XDE,XHL
	srl	1,XDE
	and	XDE,7
	sub	A,E
	add	A,C
	bit	7,A
	jr	NZ,DrawWipeTileStep.skip2
	cp	A,4
	jr	C,DrawWipeTileStep.skip3
	ld	A,4
	jr	DrawWipeTileStep.skip3
DrawWipeTileStep.skip2:
	ld	A,0
DrawWipeTileStep.skip3:
	extz	WA
	extz	XWA
	ld	XDE,PixelFillBytes
	add	XDE,XWA
	ld	A,(XDE)
	ld	(XHL),A
	inc	1,XHL
	djnz	B,DrawWipeTileStep.loop
	cp	C,0x14
	jr	Z,DrawWipeTileStep.skip4
	ld	A,1
	jr	DrawWipeTileStep.skip5
DrawWipeTileStep.skip4:
	ld	A,0
DrawWipeTileStep.skip5:
	pop	XBC
	pop	XDE
	pop	XHL
	ret
