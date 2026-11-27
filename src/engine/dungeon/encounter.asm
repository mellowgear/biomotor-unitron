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
	ld	XWA,SONG_ENCOUNTER
	call	PlayMusic
	ld	WA,MUSIC_ENCOUNTER
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
	ld	XHL,SCROLL2_VRAM
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
