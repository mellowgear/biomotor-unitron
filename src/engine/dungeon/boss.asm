; engine/dungeon/boss.asm: the floor boss (GetFloorBossBeaten, UpdateFloorBossSprite) and boss encounters: BossEncounter, BossTalkStep, their boxes and fades

c_21156E	section	code abs=0x21156E

; [code] A = 0xFF when the floor has no boss (DUNGEON_FLOOR < 7 outside the Crystal Mine), else the event flag 0x60 + GetBossIndex (index 8: EVENT_STAGE_ENDING): 0 = boss not beaten
GetFloorBossBeaten:
	push	XHL
	push	XDE
	push	XBC
	push	W
	; bosses stand on floor 7 and up, and on every mine floor
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	Z,GetFloorBossBeaten.skip
	ld	W,(XIZ+DUNGEON_FLOOR)
	cp	W,7
	; flag 0x60 + boss index: that boss beaten
	jr	C,GetFloorBossBeaten.skip3
GetFloorBossBeaten.skip:
	call	GetBossIndex
	cp	A,8
	jr	Z,GetFloorBossBeaten.skip2
	extz	WA
	ld	HL,EVENT_BEAT_ENT
	add	HL,WA
	call	CheckEventFlag
	ld	A,L
	jr	GetFloorBossBeaten.skip4
GetFloorBossBeaten.skip2:
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	ld	A,L
	jr	GetFloorBossBeaten.skip4
GetFloorBossBeaten.skip3:
	ld	A,0xFF
GetFloorBossBeaten.skip4:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2116A7	section	code abs=0x2116A7

; [code] every DungeonStep frame: LoadBossMapSprite while GetFloorBossBeaten = 0 (its animation frame follows +0x2D)
UpdateFloorBossSprite:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	GetFloorBossBeaten
	cp	A,0
	jr	NZ,UpdateFloorBossSprite.skip
	call	LoadBossMapSprite
UpdateFloorBossSprite.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212B9F	section	code abs=0x212B9F

; [code] SetFadeWhite; StartDungeonReturn, BossEncounter after a won battle
DungeonSetFadeWhite:
	call	SetFadeWhite
	ret

c_212BA4	section	code abs=0x212BA4

; [code] FadeInFromWhiteStep with A = 0x10 (A = 1 while fading); DungeonReturnStep, BossEncounter
DungeonFadeInFromWhite:
	ld	A,0x10
	call	FadeInFromWhiteStep
	ret

c_212BF1	section	code abs=0x212BF1

; [code] OpenTextBox 6 (0x14 x 5, tile word at GetDungeonTilesPtr + (wDungeonTileBase)): the boss talk box (BossTalkStep) and the PlayerIsDeadText box (RustStepDamage)
OpenDungeonBox6:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	GetDungeonTilesPtr
	ld	HL,(XHL)
	ld	WA,(wDungeonTileBase)
	add	HL,WA
	ld	A,6
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C10	section	code abs=0x212C10

; [code] PlaceTextBox 6 at 0, 0x2E
PlaceDungeonBox6:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,6
	ld	C,0
	ld	E,0x2E
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C23	section	code abs=0x212C23

; [code] EraseTextBox 6
EraseDungeonBox6:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,6
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C32	section	code abs=0x212C32

; [code] ClearTextBox 6
ClearDungeonBox6:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,6
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C41	section	code abs=0x212C41

; [code] OpenTextBox 7 (0x12 x 3, tile 0x19) with JoinYesNoText in the Crystal Mine (DUNGEON_ID 5), else TryYesNoText; BossEncounter state 3 on the last floor
OpenBossYesNoBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x19
	ld	A,7
	ld	C,0x12
	ld	E,3
	call	OpenTextBox
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	NZ,OpenBossYesNoBox.skip
	ld	XHL,JoinYesNoText
	jr	OpenBossYesNoBox.skip2
OpenBossYesNoBox.skip:
	ld	XHL,TryYesNoText
OpenBossYesNoBox.skip2:
	ld	A,7
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C70	section	code abs=0x212C70

; [code] PlaceTextBox 7 at 1, 0x2A
PlaceBossYesNoBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,7
	ld	C,1
	ld	E,0x2A
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C83	section	code abs=0x212C83

; [code] EraseTextBox 7; byte-identical copy of EraseLeaveOKBox (the ROM has each)
EraseBossYesNoBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,7
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C92	section	code abs=0x212C92

; [code] A = DUNGEON_ID - 1, in the Crystal Mine (5) DUNGEON_ID - 1 + DUNGEON_FLOOR - 1: the line of BossEnemies / BossBeatenSprites / BossTalkTexts; 8 = the mine's last floor
GetBossIndex:
	push	XHL
	push	XDE
	push	XBC
	push	W
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	NZ,GetBossIndex.skip
	ld	W,(XIZ+DUNGEON_FLOOR)
	sub	W,1
	add	A,W
GetBossIndex.skip:
	sub	A,1
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212CAF	section	code abs=0x212CAF

; [code] BossEncounter state +0x2A = 1; StartBossEncounter; byte-identical copy of StartOpenChest (the ROM has each)
InitBossEncounterState:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	(XIZ+DUNGEON_SUBSTATE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212CBD	section	code abs=0x212CBD

; [code] +0x25 / +0x26 / +0x27 = 0 (the BossTalkStep state) before each BossEncounter talk
ResetBossTalk:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x25),A
	ld	A,0
	ld	(XIZ+0x27),A
	ld	A,0
	ld	(XIZ+0x26),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212CD5	section	code abs=0x212CD5

; Runs one frame of the boss talk in box 6 (BossEncounter's only helper): starts the line BossTalkTexts
; [GetBossIndex * 4 + state - 3], lets A/B skip printing (speed 0 for a frame, saved in +0x23/+0x24)
; and past waits; +0x25 = 1 when the box is done. RAM: XIZ+0x23..0x26 [code]
BossTalkStep:
	push	XHL
	; +0x23 = saved print speed, 0xFF = none: restore it after the 1-frame burst
	push	XDE
	push	XBC
	push	XWA
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,BossTalkStep.skip
	ld	B,(XIZ+0x24)
	dec	1,B
	ld	(XIZ+0x24),B
	jrl	NZ,BossTalkStepEnd
	ld	A,6
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
BossTalkStep.skip:
	ld	A,6
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,BossTalkStep.skip4
	; box idle (no string): start the next line or report done
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	; text waiting for a key (state 2): the next A/B only clears the wait
	jr	NZ,BossTalkStep.skip2
	ld	A,1
	ld	(XIZ+0x26),A
BossTalkStep.skip2:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,BossTalkStepEnd
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,BossTalkStep.skip3
	ld	A,0
	ld	(XIZ+0x26),A
	jr	BossTalkStepEnd
BossTalkStep.skip3:
	; A/B while printing: speed 0 for one frame to flush the line
	ld	A,6
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	inc	1,C
	ld	(XIZ+0x24),C
	ld	C,0
	ld	(XWA+0x10),C
	jr	BossTalkStepEnd
BossTalkStep.skip4:
	; +0x25: 0 not started, 2 printing, 1 done
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,BossTalkStep.skip5
	ld	A,1
	ld	(XIZ+0x25),A
	jr	BossTalkStepEnd
BossTalkStep.skip5:
	; four lines per boss, picked by the BossEncounter state (3 meet, 4 yes, 5 no, 6 after the win)
	ld	XHL,0
	call	GetBossIndex
	extz	WA
	extz	XWA
	mul	XWA,4
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_SUBSTATE)
	sub	A,3
	add	XHL,XWA
	ld	XWA,XHL
	sll	2,XWA
	ld	XHL,BossTalkTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,6
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,2
	ld	(XIZ+0x25),A
	jr	BossTalkStepEnd

c_212D8F	section	code abs=0x212D8F

; [code] +0x25 = 1 (BossEncounter's "talk finished" value), BossTalkStepEnd; the same as BossTalkStep.skip4's first path; no callers (after a jr)
BossTalkStepFinished:
	ld	A,1
	ld	(XIZ+0x25),A
	jr	BossTalkStepEnd

c_212D96	section	code abs=0x212D96

; [code] BossTalkStep's common exit: pops XWA/XBC/XDE/XHL and returns
BossTalkStepEnd:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212D9B	section	code abs=0x212D9B

; [code] StartBattleWipe, BossEncounter state 8 (BattleWipeStep, then LoadEnemy of BossEnemies[GetBossIndex] and StartBattleTask), PlayMusic(0xE) + SoundCommand(0x2E)
; [play] seen in play (Ent, Kraken): the encounter jingle (song 0xE) plays over the wipe after "The challenge begins!"; no white flash before a boss; BattleStart then plays the boss battle song 0x0C
BossBattleIntro:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	StartBattleWipe
	ld	A,8
	ld	(XIZ+DUNGEON_SUBSTATE),A
	ld	XWA,SONG_ENCOUNTER
	call	PlayMusic
	ld	WA,MUSIC_ENCOUNTER
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212DBD	section	code abs=0x212DBD

; DUNGEON_MODE 0xD, per frame, state XIZ+0x2A: 1-2 box (the mine's last boss shows its portrait), 3 talk,
; then fight, or on the last floor ask Try / Join? (7, cursor +0x20) and talk 4 (yes) / 5 (no: leave);
; 8 wipe and battle, 9 result, 0xA white fade back, 6 the win talk, 0xB done, 0xC the final boss shake [code+play]
BossEncounter:
	ld	A,(XIZ+DUNGEON_SUBSTATE)
	cp	A,1
	jr	NZ,BossEncounter.skip
	call	OpenDungeonBox6
	ld	A,2
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jrl	BossEncounter.skip37
BossEncounter.skip:
	cp	A,2
	jr	NZ,BossEncounter.skip2
	call	PlaceDungeonBox6
	calr	ResetBossTalk
	ld	A,3
	ld	(XIZ+DUNGEON_SUBSTATE),A
	call	GetBossIndex
	cp	A,8
	jrl	NZ,BossEncounter.skip37
	call	ClearScr1Tilemap
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr1ScrollY),A
	ld	BC,0
	ld	DE,0
	ld	WA,0x37
	ld	HL,0x39
	call	DrawPortrait
	jrl	BossEncounter.skip37
BossEncounter.skip2:
	cp	A,3
	jr	NZ,BossEncounter.skip6
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	; not on the last floor: straight to the battle
	ld	A,(XIZ+DUNGEON_FLOOR)
	cp	A,W
	jr	NC,BossEncounter.skip3
	calr	EraseDungeonBox6
	calr	BossBattleIntro
	jrl	BossEncounter.skip37
BossEncounter.skip3:
	calr	OpenBossYesNoBox
	calr	PlaceBossYesNoBox
	call	GetBossIndex
	cp	A,8
	; the cursor starts on the left choice (0), on the right (1) for the mine's last boss
	jr	Z,BossEncounter.skip4
	ld	A,0
	jr	BossEncounter.skip5
BossEncounter.skip4:
	ld	A,1
BossEncounter.skip5:
	ld	(XIZ+0x20),A
	ld	A,7
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jrl	BossEncounter.skip37
BossEncounter.skip6:
	cp	A,7
	jr	NZ,BossEncounter.skip13
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,BossEncounter.skip8
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,BossEncounter.skip7
	calr	ResetBossTalk
	ld	A,4
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jr	BossEncounter.skip11
BossEncounter.skip7:
	calr	ResetBossTalk
	ld	A,5
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jr	BossEncounter.skip11
BossEncounter.skip8:
	; pad: left picks the left choice (0), right the right one (1)
	and	A,0xF
	jr	Z,BossEncounter.skip12
	cp	A,4
	jr	NZ,BossEncounter.skip9
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	NZ,BossEncounter.skip9
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,0
	ld	(XIZ+0x20),A
	jr	BossEncounter.skip12
BossEncounter.skip9:
	cp	A,8
	jr	NZ,BossEncounter.skip10
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	NZ,BossEncounter.skip10
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x20),A
	jr	BossEncounter.skip12
BossEncounter.skip10:
	jr	BossEncounter.skip12
BossEncounter.skip11:
	calr	EraseBossYesNoBox
BossEncounter.skip12:
	jrl	BossEncounter.skip37
BossEncounter.skip13:
	cp	A,4
	jr	NZ,BossEncounter.skip15
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
	calr	EraseDungeonBox6
	ld	A,(XIZ+DUNGEON_ID)
	; Join? Yes in the mine: no battle, back out (TASK_ARG 5) (?)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	Z,BossEncounter.skip14
	calr	BossBattleIntro
	jrl	BossEncounter.skip37
BossEncounter.skip14:
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	jrl	BossEncounter.done
BossEncounter.skip15:
	cp	A,5
	jr	NZ,BossEncounter.skip17
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
	calr	EraseDungeonBox6
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	Z,BossEncounter.skip16
	call	StartDungeonExit
	ld	A,0xB
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jrl	BossEncounter.skip37
BossEncounter.skip16:
	calr	BossBattleIntro
	jrl	BossEncounter.skip37
BossEncounter.skip17:
	; state 8: after the wipe load the boss at area level DUNGEON_FLOOR (8 in the mine) and fight
	cp	A,8
	jr	NZ,BossEncounter.skip20
	call	BattleWipeStep
	cp	A,1
	jrl	Z,BossEncounter.skip37
	call	GetBossIndex
	extz	WA
	extz	XWA
	ld	XHL,BossEnemies
	add	XHL,XWA
	ld	A,(XHL)
	ld	XHL,0
	ld	W,(XIZ+DUNGEON_ID)
	cp	W,DUNGEON_CRYSTAL_MINE
	jr	Z,BossEncounter.skip18
	ld	W,(XIZ+DUNGEON_FLOOR)
	jr	BossEncounter.skip19
BossEncounter.skip18:
	ld	W,8
BossEncounter.skip19:
	ld	(wAreaLevel),W
	call	LoadEnemy
	ldb	(wDungeonBattle),1
	call	StartBattleTask
	ld	A,9
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jrl	BossEncounter.skip37
BossEncounter.skip20:
	; state 9: lost -> leave the dungeon (TASK_ARG 5); won -> fade white
	cp	A,9
	jr	NZ,BossEncounter.skip23
	ld	A,(wBattleResult)
	cp	A,BATTLE_RESULT_NONE
	jrl	Z,BossEncounter.skip37
	cp	A,BATTLE_RESULT_LOST
	jr	NZ,BossEncounter.skip22
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	NZ,BossEncounter.skip21
	ld	A,(XIZ+DUNGEON_FLOOR)
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	cp	A,W
	jr	C,BossEncounter.skip21
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	jrl	BossEncounter.done
BossEncounter.skip21:
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jrl	BossEncounter.done
BossEncounter.skip22:
	call	DungeonSetFadeWhite
	ld	A,0xA
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jrl	BossEncounter.skip37
BossEncounter.skip23:
	; state 0xA: once white, redraw the floor (or the final portrait) and fade back in
	cp	A,0xA
	jr	NZ,BossEncounter.skip28
	ld	A,(wFadeLevel)
	cp	A,0x7F
	jr	NZ,BossEncounter.skip26
	call	GetBossIndex
	cp	A,8
	jr	Z,BossEncounter.skip24
	call	RedrawDungeonFloor
	call	PlayDungeonMusic
	cp	A,4
	jr	C,BossEncounter.skip25
	extz	WA
	; mine bosses (4-7) are marked beaten here, with no win talk
	ld	HL,EVENT_BEAT_ENT
	add	HL,WA
	call	SetEventFlag
	call	LoadBossMapSprite
	jr	BossEncounter.skip26
BossEncounter.skip24:
	ld	BC,0
	ld	DE,0
	ld	WA,0x37
	ld	HL,0x3B
	call	DrawPortrait
BossEncounter.skip25:
	call	OpenDungeonBox6
	call	PlaceDungeonBox6
BossEncounter.skip26:
	call	DungeonFadeInFromWhite
	cp	A,1
	jrl	Z,BossEncounter.skip37
	call	GetBossIndex
	cp	A,8
	jr	Z,BossEncounter.skip27
	cp	A,4
	jr	C,BossEncounter.skip27
	jr	BossEncounter.skip29
BossEncounter.skip27:
	calr	ResetBossTalk
	ld	A,6
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jrl	BossEncounter.skip37
BossEncounter.skip28:
	cp	A,6
	jr	NZ,BossEncounter.skip33
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
BossEncounter.skip29:
	; the four dungeon bosses: flag 0x60 + index beaten and 0x10 + dungeon - 1 (dungeon cleared?)
	call	GetBossIndex
	cp	A,8
	jr	Z,BossEncounter.skip32
	cp	A,4
	jr	NC,BossEncounter.skip31
	calr	EraseDungeonBox6
	extz	WA
	ld	HL,EVENT_BEAT_ENT
	add	HL,WA
	call	SetEventFlag
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	Z,BossEncounter.skip30
	sub	A,1
	extz	WA
	ld	HL,EVENT_EMBLEM_GREEN
	add	HL,WA
	call	SetEventFlag
	jr	BossEncounter.skip30
BossEncounter.skip30:
	call	LoadBossMapSprite
BossEncounter.skip31:
	ld	A,0xB
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jr	BossEncounter.skip37
BossEncounter.skip32:
	; the final boss (index 8): shake the screen 0x80 frames while fading to white, then leave
	ld	XHL,ShakeScr2Amp4Task
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x80
	ld	WA,SFX_BOSS_SHAKE
	call	SoundCommand
	ld	A,0xC
	ld	(XIZ+DUNGEON_SUBSTATE),A
	jr	BossEncounter.done
BossEncounter.skip33:
	cp	A,0xB
	jr	NZ,BossEncounter.skip34
	call	EndBossEncounter
	jr	BossEncounter.skip37
BossEncounter.skip34:
	cp	A,0xC
	jr	NZ,BossEncounter.skip36
	ld	A,6
	ld	(wShakeFlags),A
	ld	A,(wFadeLevel)
	add	A,1
	cp	A,0x7F
	jr	C,BossEncounter.skip35
	ld	A,0x7F
BossEncounter.skip35:
	ld	(wFadeLevel),A
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,BossEncounter.skip37
	calr	EraseDungeonBox6
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
	jr	BossEncounter.skip37
BossEncounter.skip36:
	ld	A,1
	ld	(XIZ+DUNGEON_SUBSTATE),A
BossEncounter.skip37:
	; the Yes / No cursor while asking
	ld	A,(XIZ+DUNGEON_SUBSTATE)
	cp	A,7
	jr	NZ,BossEncounter.done
	ld	XWA,0
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,BossEncounter.skip38
	ld	BC,0x58
	jr	BossEncounter.skip39
BossEncounter.skip38:
	ld	BC,0x78
BossEncounter.skip39:
	ld	DE,0x54
	call	DrawMenuCursor
BossEncounter.done:
	ret
