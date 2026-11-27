; engine/arena/duel.asm: arena duels: ArenaDuelDispatch, ArenaStartBattle, round results, fades

c_214401	section	code abs=0x214401

; ArenaTask state 7 (after Fight): fades out 0x10 per frame, then draws the closed gate (portrait 0x2B on SCR1, 0x2A on
; SCR2: its two leaves, not a "vs" screen) with SONG_STORY; clears +0x1E / +0x2C / +0x2D, wFadeLevel 0, state 8 [code][play]
ArenaPreDuelGate:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wFadeLevel)
	sub	A,0x10
	; fade would pass black
	bit	7,A
	jr	Z,ArenaPreDuelGate.skip
	ld	(wFadeLevel),A
	jr	ArenaPreDuelGate.skip2
ArenaPreDuelGate.skip:
	calr	ArenaClearScreen
	ld	XWA,SONG_STORY
	call	PlayMusic
	ld	WA,0x10
	ld	BC,0
	ld	DE,0
	ld	HL,0x2B
	call	DrawPortrait
	ld	WA,0xCE
	ld	BC,0xA
	ld	DE,0x20
	ld	HL,0x2A
	call	DrawPortrait
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	(XIZ+0x2D),A
	ld	A,8
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(wFadeLevel),A
ArenaPreDuelGate.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21445B	section	code abs=0x21445B

; ArenaTask state 8: the gate opens (SCR1 slides left, SCR2 right, 1 px per two frames once started at frame 0x14)
; while fading to white; A, B or frame 0x7F -> ArenaPreDuelEnd. +0x2C = frame, +0x1E = step [code][play]
ArenaPreDuelGateOpen:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,ArenaPreDuelGateOpen.skip
	calr	ArenaPreDuelEnd
	jrl	ArenaPreDuelGateOpen.skip7
ArenaPreDuelGateOpen.skip:
	bit	5,A
	jr	Z,ArenaPreDuelGateOpen.skip2
	calr	ArenaPreDuelEnd
	jr	ArenaPreDuelGateOpen.skip7
ArenaPreDuelGateOpen.skip2:
	; scroll on even frames, fade to white from frame 0x14
	ld	A,(XIZ+0x2C)
	bit	0,A
	jr	NZ,ArenaPreDuelGateOpen.skip3
	ld	W,(XIZ+0x1E)
	ld	A,(wScr1ScrollX)
	add	A,W
	ld	(wScr1ScrollX),A
	ld	A,(wScr2ScrollX)
	sub	A,W
	ld	(wScr2ScrollX),A
	ld	A,(XIZ+0x2C)
	cp	A,0x14
	jr	C,ArenaPreDuelGateOpen.skip3
	ld	(wFadeLevel),A
ArenaPreDuelGateOpen.skip3:
	; the gate moves from frame 0x14 (SONG_EVENT, a shake) and is re-pushed at 0x3C and 0x5A
	ld	A,(XIZ+0x2C)
	cp	A,0x14
	jr	NZ,ArenaPreDuelGateOpen.skip4
	ld	A,1
	ld	(XIZ+0x1E),A
	ld	XWA,SONG_EVENT
	call	PlayMusic
	ld	WA,SFX_SHAKE
	call	SoundCommand
	jr	ArenaPreDuelGateOpen.skip6
ArenaPreDuelGateOpen.skip4:
	cp	A,0x3C
	jr	NZ,ArenaPreDuelGateOpen.skip5
	ld	A,1
	ld	(XIZ+0x1E),A
	jr	ArenaPreDuelGateOpen.skip6
ArenaPreDuelGateOpen.skip5:
	cp	A,0x5A
	jr	NZ,ArenaPreDuelGateOpen.skip6
	ld	A,1
	ld	(XIZ+0x1E),A
	jr	ArenaPreDuelGateOpen.skip6
ArenaPreDuelGateOpen.skip6:
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ld	A,(XIZ+0x2C)
	cp	A,0x7F
	jr	NZ,ArenaPreDuelGateOpen.skip7
	calr	ArenaPreDuelEnd
ArenaPreDuelGateOpen.skip7:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2144F7	section	code abs=0x2144F7

; Clears the gate (screen, fade, scrolls), SONG_STORY, duel index +0x1E and +0x1F = 0, duel state +0x2A = 2, ArenaTask state 9 [code]
ArenaPreDuelEnd:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	A,0
	ld	(XIZ+0x1F),A
	ld	A,2
	ld	(XIZ+0x2A),A
	calr	ArenaClearScreen
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr2ScrollX),A
	ld	XWA,SONG_STORY
	call	PlayMusic
	ld	A,9
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21452D	section	code abs=0x21452D

; Before duel 6 of the Rank CS final: queues the gender scene for 0x5E (Satanachia's runaway UNITRON calls, Lily's voice)
; with SONG_EVENT; state TASK_ARG 3, +0x1F = 0 [code][play]
ArenaDuel6Scene:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	OpenBox1
	call	PlaceBox1
	ld	A,0x5E
	calr	GetArenaGenderScene
	ld	(XIZ+0x12),A
	push	XWA
	ld	XWA,SONG_EVENT
	call	PlayMusic
	ld	WA,MUSIC_EVENT
	call	SoundCommand
	pop	XWA
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+0x1F),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21455F	section	code abs=0x21455F

; BC / DE = the tile column / row that centre map XHL (u8 width, height) on a 0x14 x 0x13 screen; no caller [code]
GetCenteredMapPos:
	push	XHL
	push	XWA
	ld	BC,0x14
	ld	A,(XHL+0)
	extz	WA
	sub	BC,WA
	sra	1,BC
	ld	DE,0x13
	ld	A,(XHL+1)
	extz	WA
	sub	DE,WA
	sra	1,DE
	pop	XWA
	pop	XHL
	ret

c_21457E	section	code abs=0x21457E

; DuelTitlePal (6) into palettes 0, 0x10 and 0x20 [code]
LoadDuelTitlePalettes:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	C,6
	ld	XHL,DuelTitlePal
	call	LoadPalettes
	ld	A,0x10
	ld	C,6
	ld	XHL,DuelTitlePal
	call	LoadPalettes
	ld	A,0x20
	ld	C,6
	ld	XHL,DuelTitlePal
	call	LoadPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2145AE	section	code abs=0x2145AE

; DuelTitleMonoPal (2) into mono palettes 0, 2 and 4 [code]
LoadDuelTitleMonoPalettes:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	C,2
	ld	XHL,DuelTitleMonoPal
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,DuelTitleMonoPal
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,DuelTitleMonoPal
	call	LoadMonoPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2145DE	section	code abs=0x2145DE

; Loads the "Duel n" title tiles (sword, letters, digits) and palettes, scrolling SCR1 / SCR2 off to the sides [code][play]
LoadDuelTitleGfx:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0x98
	ld	(wScr1ScrollX),A
	neg	A
	ld	(wScr2ScrollX),A
	ld	A,0xFF
	ld	(wScr2ScrollY),A
	ld	XHL,Gfx_2C8A0A
	call	GetPictureFirstTile
	call	LoadCompressedTiles
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,LoadDuelTitleGfx.skip
	calr	LoadDuelTitlePalettes
	jr	LoadDuelTitleGfx.skip2
LoadDuelTitleGfx.skip:
	calr	LoadDuelTitleMonoPalettes
LoadDuelTitleGfx.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214616	section	code abs=0x214616

; Sprite map of duel +0x1E's number at BC / DE (colour) [code]
DrawDuelNumberColor:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x1E)
	extz	WA
	extz	XWA
	mul	XWA,0xA
	ld	XHL,DuelTitleNumber1Map
	add	XHL,XWA
	call	GetPictureFirstTile
	call	DrawSpriteMap
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214639	section	code abs=0x214639

; Sprite map of duel +0x1E's number at BC / DE (mono) [code]
DrawDuelNumberMono:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x1E)
	extz	WA
	extz	XWA
	mul	XWA,0xA
	ld	XHL,DuelTitleNumber1MonoMap
	add	XHL,XWA
	call	GetPictureFirstTile
	call	DrawSpriteMap
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21465C	section	code abs=0x21465C

; Duel +0x1E's number at BC / DE in the colour or mono version [code]
DrawDuelNumber:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,DrawDuelNumber.skip
	calr	DrawDuelNumberColor
	jr	DrawDuelNumber.skip2
DrawDuelNumber.skip:
	calr	DrawDuelNumberMono
DrawDuelNumber.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214829	section	code abs=0x214829

; Duel state 2: the Rank CS duel 6 scene if +0x1F is set, else loads the title and starts the slide-in (state 3, speed +0x20 4) [code]
ArenaDuelTitleStart:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x1F)
	cp	A,0
	jr	Z,ArenaDuelTitleStart.skip
	calr	ArenaDuel6Scene
	jr	ArenaDuelTitleStart.skip2
ArenaDuelTitleStart.skip:
	calr	LoadDuelTitleGfx
	ld	A,4
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	(XIZ+0x22),A
	ld	(XIZ+0x21),A
	ld	(XIZ+0x2D),A
	ld	A,3
	ld	(XIZ+0x2A),A
ArenaDuelTitleStart.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214859	section	code abs=0x214859

; Duel state 3: slides the title in, +0x2C = position, braking past 0x5C; at 0x98 starts SONG_PILOT_BATTLE, state 4 [code][play]
ArenaDuelTitleSlideIn:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	DrawDuelSwordColumn
	calr	DrawDuelLetterColumn
	; number y = position / 2 - 0x14
	ld	BC,0x48
	ld	DE,0xFFEC
	ld	A,(XIZ+0x2C)
	extz	WA
	srl	1,WA
	add	DE,WA
	calr	DrawDuelNumber
	ld	A,(XIZ+0x2C)
	; speed 4 - (position - 0x5C) / 0x14 - 1: brakes near the end
	cp	A,0x5C
	jr	C,ArenaDuelTitleSlideIn.skip
	sub	A,0x5C
	extz	WA
	div	WA,0x14
	inc	1,A
	ld	W,4
	sub	W,A
	ld	(XIZ+0x20),W
ArenaDuelTitleSlideIn.skip:
	; +0x22 = previous +0x21 (?)
	ld	A,(XIZ+0x21)
	ld	(XIZ+0x22),A
	ld	A,(XIZ+0x2C)
	ld	W,(XIZ+0x20)
	add	A,W
	ld	(XIZ+0x2C),A
	cp	A,0x98
	jr	C,ArenaDuelTitleSlideIn.skip2
	ld	XWA,SONG_PILOT_BATTLE
	call	PlayMusic
	ld	WA,SFX_BATTLE_A0
	call	SoundCommand
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,4
	ld	(XIZ+0x2A),A
ArenaDuelTitleSlideIn.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2148C4	section	code abs=0x2148C4

; Duel state 4: holds the title 0x4B frames, then state 5 [code]
ArenaDuelTitleHold:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	BC,0x48
	ld	DE,0x38
	calr	DrawDuelNumber
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x4B
	jr	C,ArenaDuelTitleHold.skip
	ld	A,0x98
	ld	(XIZ+0x2C),A
	ld	A,5
	ld	(XIZ+0x2A),A
ArenaDuelTitleHold.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2148ED	section	code abs=0x2148ED

; Duel state 5: slides the title out 8 per frame (+0x2C), then loads opponent +0x18[+0x1E] (pilots get parts wArenaPilotParts + 6 * duel)
; at wAreaLevel = rank +0x15 - 1 and starts the battle; state 6 [code][play]
ArenaStartBattle:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	EraseDuelSwordColumn
	calr	EraseDuelLetterColumn
	ld	BC,0x48
	ld	DE,0xFFEC
	ld	A,(XIZ+0x2C)
	extz	WA
	srl	1,WA
	add	DE,WA
	calr	DrawDuelNumber
	ld	A,(XIZ+0x2C)
	dec	8,A
	ld	(XIZ+0x2C),A
	; slides from 0x98 down until the position wraps past 0
	cp	A,0x98
	jr	C,ArenaStartBattle.skip3
	jr	Z,ArenaStartBattle.skip3
	calr	ArenaClearScreen
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr2ScrollX),A
	ld	(wScr2ScrollY),A
	; opponent of this duel
	ld	E,(XIZ+0x1E)
	extz	DE
	extz	XDE
	ld	XHL,XIZ
	add	XHL,0x18
	add	XHL,XDE
	ld	A,(XHL)
	; pilot opponents (ENEMY_ALEX..ENEMY_FENRIL - 1) carry built parts
	cp	A,ENEMY_ALEX
	jr	C,ArenaStartBattle.skip
	cp	A,ENEMY_FENRIL
	jr	NC,ArenaStartBattle.skip
	ld	XHL,wArenaPilotParts
	mul	XDE,6
	add	XHL,XDE
	jr	ArenaStartBattle.skip2
ArenaStartBattle.skip:
	ld	XHL,0
ArenaStartBattle.skip2:
	; +0x15 = rank row + 2
	ld	W,(XIZ+0x15)
	sub	W,2
	inc	1,W
	ld	(wAreaLevel),W
	call	LoadEnemy
	ldb	(wDungeonBattle),0
	call	StartBattleTask
	ld	A,6
	ld	(XIZ+0x2A),A
ArenaStartBattle.skip3:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214979	section	code abs=0x214979

; Duel state 6: state 7 once the battle sets wBattleResult [code]
ArenaWaitBattleEnd:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wBattleResult)
	cp	A,BATTLE_RESULT_NONE
	jr	Z,ArenaWaitBattleEnd.skip
	ld	A,7
	ld	(XIZ+0x2A),A
ArenaWaitBattleEnd.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214990	section	code abs=0x214990

; Duel state 7: a win or a fled enemy advances +0x1E (all +0x16 duels done -> ArenaRoundsComplete, else state 2,
; flagging +0x1F before duel 6 of the Rank CS final); a loss or retreat -> ArenaBattleLost [code]
ArenaAfterBattle:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wBattleResult)
	cp	A,BATTLE_RESULT_WON
	jr	Z,ArenaAfterBattle.skip
	cp	A,BATTLE_RESULT_ENEMY_FLED
	jr	Z,ArenaAfterBattle.skip
	calr	ArenaBattleLost
	jr	ArenaAfterBattle.skip4
ArenaAfterBattle.skip:
	ld	A,(XIZ+0x1E)
	inc	1,A
	ld	(XIZ+0x1E),A
	ld	W,(XIZ+0x16)
	cp	A,W
	jr	C,ArenaAfterBattle.skip2
	calr	ArenaRoundsComplete
	jr	ArenaAfterBattle.skip4
ArenaAfterBattle.skip2:
	; next is duel 6 of the Rank CS final
	cp	A,5
	jr	NZ,ArenaAfterBattle.skip3
	ld	A,(XIZ+0x15)
	cp	A,8
	jr	NZ,ArenaAfterBattle.skip3
	call	GetStageArenaRank
	cp	A,7
	jr	NZ,ArenaAfterBattle.skip3
	ld	A,1
	ld	(XIZ+0x1F),A
ArenaAfterBattle.skip3:
	ld	A,2
	ld	(XIZ+0x2A),A
ArenaAfterBattle.skip4:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2149DC	section	code abs=0x2149DC

; All duels won: the Rank CS final (rank 8 at stage arena rank 7) shows the participants with SONG_EVENT, other ranks
; the arena screen; queues the rank's first win scene, duel state 9 [code]
ArenaRoundsComplete:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	; the Rank CS final at stage arena rank 7
	ld	A,(XIZ+0x15)
	cp	A,8
	jr	NZ,ArenaRoundsComplete.skip
	call	GetStageArenaRank
	cp	A,7
	jr	NZ,ArenaRoundsComplete.skip
	call	OpenBoxes123
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	call	PlaceBox1
	ld	HL,0x3A
	calr	DrawArenaParticipants
	ld	A,0
	ld	(XIZ+0x13),A
	push	XWA
	ld	XWA,SONG_EVENT
	call	PlayMusic
	ld	WA,MUSIC_EVENT
	call	SoundCommand
	pop	XWA
	jr	ArenaRoundsComplete.skip2
ArenaRoundsComplete.skip:
	call	SetupArenaScreen
ArenaRoundsComplete.skip2:
	calr	GetArenaRankFirstScene
	ld	(XIZ+0x12),W
	ld	A,9
	ld	(XIZ+0x2A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214A33	section	code abs=0x214A33

; A loss: duel 6 of the Rank CS final queues scene 0x42 ("It is finished...", leading to GAME OVER via ArenaExitFade);
; other ranks scene 4 ("Close, but no cigar") on the arena screen, duel state 9 [code][play]
ArenaBattleLost:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	; lost duel 6 of the Rank CS final
	ld	A,(XIZ+0x1E)
	cp	A,5
	jr	NZ,ArenaBattleLost.skip
	ld	A,(XIZ+0x15)
	cp	A,8
	jr	NZ,ArenaBattleLost.skip
	call	GetStageArenaRank
	cp	A,7
	jr	NZ,ArenaBattleLost.skip
	call	OpenBox1
	call	PlaceBox1
	ld	A,0x42
	ld	(XIZ+0x12),A
	push	XWA
	ld	XWA,SONG_EVENT
	call	PlayMusic
	ld	WA,MUSIC_EVENT
	call	SoundCommand
	pop	XWA
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	ArenaBattleLost.skip2
ArenaBattleLost.skip:
	call	SetupArenaScreen
	ld	A,4
	ld	(XIZ+0x12),A
	ld	A,9
	ld	(XIZ+0x2A),A
ArenaBattleLost.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214A84	section	code abs=0x214A84

; Duel state 9: back to ArenaTask state 3 to run the queued scene [code]
ArenaDuelDone:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214A92	section	code abs=0x214A92

; ArenaTask state 9: runs duel state +0x2A (1 -> 3, 2..7, 9; others reset to 1) and counts +0x2D [code]
ArenaDuelDispatch:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,ArenaDuelDispatch.skip
	ld	A,3
	ld	(XIZ+0x2A),A
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip:
	cp	A,2
	jr	NZ,ArenaDuelDispatch.skip2
	calr	ArenaDuelTitleStart
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip2:
	cp	A,3
	jr	NZ,ArenaDuelDispatch.skip3
	calr	ArenaDuelTitleSlideIn
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip3:
	cp	A,4
	jr	NZ,ArenaDuelDispatch.skip4
	calr	ArenaDuelTitleHold
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip4:
	cp	A,5
	jr	NZ,ArenaDuelDispatch.skip5
	calr	ArenaStartBattle
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip5:
	cp	A,6
	jr	NZ,ArenaDuelDispatch.skip6
	calr	ArenaWaitBattleEnd
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip6:
	cp	A,7
	jr	NZ,ArenaDuelDispatch.skip7
	calr	ArenaAfterBattle
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip7:
	cp	A,9
	jr	NZ,ArenaDuelDispatch.skip8
	calr	ArenaDuelDone
	jr	ArenaDuelDispatch.skip9
ArenaDuelDispatch.skip8:
	ld	A,1
	ld	(XIZ+0x2A),A
ArenaDuelDispatch.skip9:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214AF6	section	code abs=0x214AF6

; Starts the crystal mine trip: ArenaTask state 0xA at sub-state 2 [code]
ArenaGoToCrystalMine:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,2
	ld	(XIZ+0x2A),A
	ld	A,0xA
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B0F	section	code abs=0x214B0F

; Mine trip state 2: fades out, clears the boxes and portrait, starts CrystalMineTaskInit; state 3 [code]
ArenaStartCrystalMine:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	call	FadeToBlackStep
	cp	A,1
	jr	Z,ArenaStartCrystalMine.skip
	call	SetupWindowIris
	call	ApplyWindowB
	call	SetFadeNormal
	call	EraseBoxes123
	calr	ClearArenaPortraitArea
	ld	XHL,CrystalMineTaskInit
	call	StartTask
	ld	A,3
	ld	(XIZ+0x2A),A
ArenaStartCrystalMine.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B43	section	code abs=0x214B43

; Mine trip state 3: waits for the mine to write wArenaNext; nonzero ends ArenaTask (state 0xC), 0 redraws the arena with
; scene 6 and goes to state 4 [code]
ArenaWaitCrystalMine:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wArenaNext)
	; 0xFF while the mine runs
	cp	A,0xFF
	jr	Z,ArenaWaitCrystalMine.skip2
	cp	A,0
	jr	Z,ArenaWaitCrystalMine.skip
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jr	ArenaWaitCrystalMine.skip2
ArenaWaitCrystalMine.skip:
	call	SetFadeBlack
	call	ClearScr1Tilemap
	call	SetupArenaScreen
	ld	A,3
	ld	(XIZ+0xF),A
	ld	A,6
	ld	(XIZ+0x12),A
	calr	DrawArenaSceneCast
	ld	A,0xA
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+0x2A),A
ArenaWaitCrystalMine.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B83	section	code abs=0x214B83

; Mine trip state 4: fades in, then ArenaTask state 3 [code]
ArenaMineTripFadeIn:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	call	FadeInFromBlackStep
	cp	A,1
	jr	Z,ArenaMineTripFadeIn.skip
	ld	A,3
	ld	(XIZ+TASK_ARG),A
ArenaMineTripFadeIn.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B9B	section	code abs=0x214B9B

; ArenaTask state 0xA: runs mine trip state +0x2A (1 -> 2, 2..4; others reset to 1) [code]
ArenaMineTrip:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,ArenaMineTrip.skip
	ld	A,2
	ld	(XIZ+0x2A),A
	jr	ArenaMineTrip.skip5
ArenaMineTrip.skip:
	cp	A,2
	jr	NZ,ArenaMineTrip.skip2
	calr	ArenaStartCrystalMine
	jr	ArenaMineTrip.skip5
ArenaMineTrip.skip2:
	cp	A,3
	jr	NZ,ArenaMineTrip.skip3
	calr	ArenaWaitCrystalMine
	jr	ArenaMineTrip.skip5
ArenaMineTrip.skip3:
	cp	A,4
	jr	NZ,ArenaMineTrip.skip4
	calr	ArenaMineTripFadeIn
	jr	ArenaMineTrip.skip5
ArenaMineTrip.skip4:
	ld	A,1
	ld	(XIZ+0x2A),A
ArenaMineTrip.skip5:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214BD2	section	code abs=0x214BD2

; ArenaTask state 0xB, after the scene 0x42 chain (ArenaSceneNext 0xF2): fades out, wArenaNext 6 (StreetGameOver), ends ArenaTask [code][play]
ArenaExitFade:
	ld	A,1
	call	FadeToBlackStep
	cp	A,1
	jr	Z,ArenaExitFade.done
	call	EraseBox1
	ld	A,6
	ld	(wArenaNext),A
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
ArenaExitFade.done:
	ret
