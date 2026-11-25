; engine/arena/duel.asm: arena duels: ArenaDuelDispatch, ArenaStartBattle, round results, fades

c_214401	section	code abs=0x214401

; [code] ArenaTask state 7 (ArenaSceneNext 0xF7): wFadeLevel -= 0x10 each frame until it would pass black, then ArenaClearScreen, PlayMusic 4, DrawPortrait 0x2B at tile 0x10 (SCR1, columns 0-9) and 0x2A at tile 0xCE (SCR2, BC 0xA = from column 10, DE 0x20), +0x1E / +0x2C / +0x2D = 0, wFadeLevel 0, TASK_ARG 8
; [play] seen in play (after Fight, before "Duel 1"): portraits 0x2B and 0x2A are the left and right halves of one picture, a closed rusty metal gate (two riveted door leaves); not a "vs" screen (was ArenaPreDuelPortraits)
ArenaPreDuelGate:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wFadeLevel)
	sub	A,0x10
	bit	7,A
	jr	Z,ArenaPreDuelGate.skip
	ld	(wFadeLevel),A
	jr	ArenaPreDuelGate.skip2
ArenaPreDuelGate.skip:
	calr	ArenaClearScreen
	ld	XWA,4
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

; [code] ArenaTask state 8: every other frame wScr1ScrollX += +0x1E and wScr2ScrollX -= +0x1E (the two planes move apart), wFadeLevel = +0x2C from frame 0x14 (towards white); +0x1E = 1 at frames 0x14 (PlayMusic 0, sound 0x84), 0x3C, 0x5A (so 1 px per two frames); A / B or frame 0x7F -> ArenaPreDuelEnd
; [play] seen in play: the gate opens: the left leaf (SCR1) slides left and the right leaf (SCR2) slides right with a white gap between them, while the screen fades to white; then the "Duel 1" title (was ArenaPreDuelScroll)
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
	ld	A,(XIZ+0x2C)
	cp	A,0x14
	jr	NZ,ArenaPreDuelGateOpen.skip4
	ld	A,1
	ld	(XIZ+0x1E),A
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x84
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

; [code] +0x1E / +0x1F = 0, +0x2A = 2, ArenaClearScreen, wFadeLevel 0, SCR1 / SCR2 X scroll 0, PlayMusic 4, TASK_ARG 9 (ArenaDuelDispatch: ArenaDuelTitleStart)
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
	ld	XWA,4
	call	PlayMusic
	ld	A,9
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21452D	section	code abs=0x21452D

; [code] OpenBox1 / PlaceBox1, scene +0x12 = GetArenaGenderScene(0x5E) (female scene 36, male 37), PlayMusic 0, sound 0x20, TASK_ARG 3, +0x1F = 0
; [play] seen in play (rank 8 = Rank CS, stage arena rank 7, before duel 6): the partner gets a transmission from the opponent, picture 0x38 (Satanachia's UNITRON) with Lily's voice ("Why am I fighting...?"), then "Satanachia's UNITRON core is out of control!" and the "6 Duel" title; the male and female scenes differ only in the partner's lines
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
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x20
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

; [code] XHL = map (u8 w, h): BC = (0x14 - w) / 2, DE = (0x13 - h) / 2 (no caller found)
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

; [code] DuelTitlePal (6 palettes) to palette 0, 0x10 and 0x20
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

; [code] DuelTitleMonoPal (2 palettes) to mono palette 0, 2 and 4
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

; [code] wScr1ScrollX 0x98, wScr2ScrollX -0x98, wScr2ScrollY 0xFF, LoadCompressedTiles Gfx_2C8A0A (sword, "Duel" letters, digits) at GetPictureFirstTile, LoadDuelTitlePalettes (wColorFlags) or LoadDuelTitleMonoPalettes; [play] the "Duel n" title (arena_duel1_title)
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

; [code] DrawSpriteMap DuelTitleNumber1Map + 10 * duel index +0x1E at GetPictureFirstTile
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

; [code] DrawSpriteMap DuelTitleNumber1MonoMap + 10 * duel index +0x1E
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

; [code] DrawDuelNumberColor when wColorFlags is not 0, else DrawDuelNumberMono; BC / DE = position
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

; [code] ArenaDuelDispatch state 2: +0x1F set (ArenaAfterBattle before duel 6 of rank 8 at stage arena rank 7) -> ArenaDuel6Scene; else LoadDuelTitleGfx, speed +0x20 = 4, +0x2C / +0x21 / +0x22 / +0x2D = 0, state 3
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

; [code] ArenaDuelDispatch state 3: DrawDuelSwordColumn, DrawDuelLetterColumn, DrawDuelNumber at y -0x14 + +0x2C / 2; +0x2C += speed +0x20 (4, slowing from +0x2C 0x5C); at 0x98 PlayMusic 0xB, sound 0xA0, state 4; [play] arena_duel1_title, arena_cs_duel6_title
ArenaDuelTitleSlideIn:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	DrawDuelSwordColumn
	calr	DrawDuelLetterColumn
	ld	BC,0x48
	ld	DE,0xFFEC
	ld	A,(XIZ+0x2C)
	extz	WA
	srl	1,WA
	add	DE,WA
	calr	DrawDuelNumber
	ld	A,(XIZ+0x2C)
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
	ld	A,(XIZ+0x21)
	ld	(XIZ+0x22),A
	ld	A,(XIZ+0x2C)
	ld	W,(XIZ+0x20)
	add	A,W
	ld	(XIZ+0x2C),A
	cp	A,0x98
	jr	C,ArenaDuelTitleSlideIn.skip2
	ld	XWA,0xB
	call	PlayMusic
	ld	WA,0xA0
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

; [code] ArenaDuelDispatch state 4: DrawDuelNumber at 0x48, 0x38 for 0x4B frames, then +0x2C = 0x98, state 5 (ArenaStartBattle slides the title out)
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

; [code] slides (task+0x2C -= 8, DrawDuelNumber) then: enemy = task+0x18+task+0x1E with parts 0x60CC+6*slot for pilots 0x62-0x70, wAreaLevel = rank (task+0x15) - 1, LoadEnemy, 0x5DDA = 0, StartBattleTask (0x5DD9 = FF, StartTask(BattleStart)), state +0x2A = 6; [play] arena_cs_duel_* screens
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
	cp	A,0x98
	jr	C,ArenaStartBattle.skip3
	jr	Z,ArenaStartBattle.skip3
	calr	ArenaClearScreen
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr2ScrollX),A
	ld	(wScr2ScrollY),A
	ld	E,(XIZ+0x1E)
	extz	DE
	extz	XDE
	ld	XHL,XIZ
	add	XHL,0x18
	add	XHL,XDE
	ld	A,(XHL)
	cp	A,0x62
	jr	C,ArenaStartBattle.skip
	cp	A,0x71
	jr	NC,ArenaStartBattle.skip
	ld	XHL,wArenaPilotParts
	mul	XDE,6
	add	XHL,XDE
	jr	ArenaStartBattle.skip2
ArenaStartBattle.skip:
	ld	XHL,0
ArenaStartBattle.skip2:
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

; [code] ArenaDuelDispatch state 6: state 7 (ArenaAfterBattle) once wBattleResult != 0xFF (StartBattleTask sets 0xFF when the battle starts)
ArenaWaitBattleEnd:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wBattleResult)
	cp	A,0xFF
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

; [code] state 7 of ArenaDuelDispatch (after ArenaWaitBattleEnd sees 0x5DD9 != FF): battle result 0 (BattleVictory) or 1 (enemy fled, EnemyFleeSucceeded) -> next opponent task+0x1E += 1, all task+0x16 done -> ArenaRoundsComplete, else state 2; result 2/3 (gave up / BattleDefeat) -> ArenaBattleLost
ArenaAfterBattle:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wBattleResult)
	cp	A,0
	jr	Z,ArenaAfterBattle.skip
	cp	A,1
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

; [code] ArenaAfterBattle when the opponent index task +0x1E reaches the count +0x16 (battle results 0 / 1 only): rank 8 at stage arena rank 7 -> "Arena " in box 3, DrawArenaParticipants, PlayMusic 0; else SetupArenaScreen; scene +0x12 = GetArenaRankFirstScene, state 9
ArenaRoundsComplete:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
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
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x20
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

; [code] only from ArenaAfterBattle on battle result 2 (BattleRetreat "You gave up") or 3 (BattleDefeat): scene 0x42 for slot 5 of rank 8 at stage rank 7 (PlayMusic 0, TASK_ARG 3), else SetupArenaScreen, scene 4, state +0x2A = 9
; [play] seen in play: losing the Rank CS final (Satana) gives scene 0x42 "It is finished..." and, through ArenaExitFade, GAME OVER; a loss in another rank gives scene 4 "Close, but no cigar" and back to the Street
ArenaBattleLost:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
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
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x20
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

; [code] ArenaDuelDispatch state 9: TASK_ARG 3 (ArenaSceneRunner)
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

; [code] arena state 9 handler (ArenaTask): switch on task +0x2A: 1 -> 3, 2 ArenaDuelTitleStart, 3 ArenaDuelTitleSlideIn, 4 ArenaDuelTitleHold, 5 ArenaStartBattle, 6 ArenaWaitBattleEnd, 7 ArenaAfterBattle, 9 ArenaDuelDone
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

; [code] wFadeLevel 0, +0x2A = 2, TASK_ARG 0xA (ArenaMineTrip)
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

; [code] FadeToBlackStep(4) until black, then window / fade reset, EraseBoxes123, ClearArenaPortraitArea, StartTask(CrystalMineTaskInit), +0x2A = 3
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

; [code] waits for wArenaNext != 0xFF (the mine's DungeonTask end writes it): not 0 -> TASK_ARG 0xC (the arena ends with it); 0 -> SetFadeBlack, SetupArenaScreen, scene 6, +0x2A = 4
ArenaWaitCrystalMine:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wArenaNext)
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

; [code] FadeInFromBlackStep(4) until done, then TASK_ARG 3 (ArenaSceneRunner)
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

; [code] ArenaTask state 0xA, on +0x2A: 1 -> 2, 2 ArenaStartCrystalMine, 3 ArenaWaitCrystalMine, 4 ArenaMineTripFadeIn
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

; [code] ArenaTask state 0xB: FadeToBlackStep(1) until black, EraseBox1, wArenaNext = 6, TASK_ARG 0xC (ArenaTask ends); reached only by ArenaSceneNext 0xF2, the next of scene 69 (end of the scene 0x42 chain: 0x42 -> pair 16 (67 / 68) -> 69); wStreetNext 6 then runs StreetGameOver
; [play] seen in play: after losing the Rank CS final to Satana ("It is finished... Your spirit belongs to me now" ... "A new world awaits you... A new path..."), fades to black, then GAME OVER
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
