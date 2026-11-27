; engine/arena/scenes.asm: arena task, talk scenes (ArenaSceneStep, ArenaSceneEnd), arena event flags

c_2130E1	section	code abs=0x2130E1

; [code] task start (street Arena, StreetGoArena): ClearScr1Tilemap, wFadeLevel 0, TASK_ARG 1, wArenaNext 0, wStreetNext 0xFF, then ArenaTask
ArenaTaskInit:
	call	ClearScr1Tilemap
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(wArenaNext),A
	ld	A,0xFF
	ld	(wStreetNext),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,ArenaTask
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_21310A	section	code abs=0x21310A

; [code] the arena task: TASK_ARG 1 -> 2, 2 SetupArenaScreen, 3 ArenaSceneRunner, 4 ArenaEntryMenuInput, 5 ArenaRankListInput, 6 ArenaBracketDispatch, 7 ArenaPreDuelGate, 8 ArenaPreDuelGateOpen, 9 ArenaDuelDispatch, 0xA ArenaMineTrip, 0xB ArenaExitFade; 0xC (or other): TASK_ARG 1, wStreetNext = wArenaNext, EndTask
ArenaTask:
	ld	A,(XIZ+TASK_ARG)
	cp	A,0xC
	jr	Z,ArenaTask.skip11
	cp	A,1
	jr	NZ,ArenaTask.skip
	ld	A,2
	ld	(XIZ+TASK_ARG),A
ArenaTask.skip:
	cp	A,2
	jr	NZ,ArenaTask.skip2
	call	SetupArenaScreen
	jr	ArenaTask.done
ArenaTask.skip2:
	cp	A,3
	jr	NZ,ArenaTask.skip3
	call	ArenaSceneRunner
	jr	ArenaTask.done
ArenaTask.skip3:
	cp	A,4
	jr	NZ,ArenaTask.skip4
	call	ArenaEntryMenuInput
	jr	ArenaTask.done
ArenaTask.skip4:
	cp	A,5
	jr	NZ,ArenaTask.skip5
	call	ArenaRankListInput
	jr	ArenaTask.done
ArenaTask.skip5:
	cp	A,6
	jr	NZ,ArenaTask.skip6
	call	ArenaBracketDispatch
	jr	ArenaTask.done
ArenaTask.skip6:
	cp	A,7
	jr	NZ,ArenaTask.skip7
	call	ArenaPreDuelGate
	jr	ArenaTask.done
ArenaTask.skip7:
	cp	A,8
	jr	NZ,ArenaTask.skip8
	call	ArenaPreDuelGateOpen
	jr	ArenaTask.done
ArenaTask.skip8:
	cp	A,9
	jr	NZ,ArenaTask.skip9
	call	ArenaDuelDispatch
	jr	ArenaTask.done
ArenaTask.skip9:
	cp	A,0xA
	jr	NZ,ArenaTask.skip10
	call	ArenaMineTrip
	jr	ArenaTask.done
ArenaTask.skip10:
	cp	A,0xB
	jr	NZ,ArenaTask.skip11
	call	ArenaExitFade
	jr	ArenaTask.done
ArenaTask.skip11:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,(wArenaNext)
	ld	(wStreetNext),A
	call	EndTask
	jr	ArenaTask.done
ArenaTask.done:
	ret

c_213197	section	code abs=0x213197

; [code] DrawUncoverTilemap of tile 0xC on SCR2 (0x9800), +0x2B = 0
StartArenaUncover:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,SCROLL2_VRAM
	ld	WA,0xC
	add	WA,0
	call	DrawUncoverTilemap
	ld	A,0
	ld	(XIZ+0x2B),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2131B5	section	code abs=0x2131B5

; [code] UncoverTileStep of tile 0xC for step +0x2B (A = 1 while running)
ArenaUncoverStep:
	push	XHL
	push	XDE
	push	XBC
	ld	WA,0xC
	add	WA,0
	ld	BC,0
	ld	C,(XIZ+0x2B)
	call	UncoverTileStep
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2131CC	section	code abs=0x2131CC

; [code] DrawCoverTilemap of tile 0xC on SCR2 (0x9800), +0x2B = 0 (no caller found)
StartArenaCover:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,SCROLL2_VRAM
	ld	WA,0xC
	add	WA,0
	call	DrawCoverTilemap
	ld	A,0
	ld	(XIZ+0x2B),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2131EA	section	code abs=0x2131EA

; [code] CoverTileStep of tile 0xC for step +0x2B (A = 1 while running)
ArenaCoverStep:
	push	XHL
	push	XDE
	push	XBC
	ld	WA,0xC
	add	WA,0
	ld	BC,0
	ld	C,(XIZ+0x2B)
	call	CoverTileStep
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21320D	section	code abs=0x21320D

; [code] EraseBoxes1And2Tall, ClearScr1Tilemap, ClearScr2Tilemap
ArenaClearScreen:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	EraseBoxes1And2Tall
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213222	section	code abs=0x213222

; [code] HL = picture: ClearScr1Tilemap, DrawPortrait at 0, 0 (tile GetPictureFirstTile); SetupArenaScreen (0x29 arena, 0x34 C.Mine), ArenaSceneStep
ArenaShowPicture:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	HL
	call	ClearScr1Tilemap
	pop	HL
	call	GetPictureFirstTile
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2132D2	section	code abs=0x2132D2

; [code] arena_scenes/ cast of scene task +0x12 -> DrawArenaParticipants, only when it differs from task +0x13
DrawArenaSceneCast:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x12)
	extz	WA
	extz	XWA
	ld	XHL,ArenaSceneCast
	add	XHL,XWA
	ld	A,(XHL)
	ld	W,(XIZ+0x13)
	cp	A,W
	jr	Z,DrawArenaSceneCast.skip
	ld	(XIZ+0x13),A
	ld	L,A
	exts	HL
	calr	DrawArenaParticipants
DrawArenaSceneCast.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213450	section	code abs=0x213450

; [code+play] end of an arena talk scene: runs its end action (arena_scenes/: 1 SetTalkedJon, 2 rank won = AdvanceStoryStage + prize item/GP, 3 SetJonNotReadySeen), then its next scene or command (play: prize and next-rank screens)
ArenaSceneEnd:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x12)
	ld	XHL,ArenaSceneEndActions
	add	XHL,XWA
	ld	A,(XHL)
	cp	A,1
	jr	Z,ArenaSceneEnd.skip
	cp	A,2
	jr	Z,ArenaSceneEnd.skip3
	cp	A,3
	jr	Z,ArenaSceneEnd.skip2
	jrl	ArenaSceneEnd.skip9
ArenaSceneEnd.skip:
	call	SetTalkedJon
	jrl	ArenaSceneEnd.skip9
ArenaSceneEnd.skip2:
	call	SetJonNotReadySeen
	jrl	ArenaSceneEnd.skip9
ArenaSceneEnd.skip3:
	call	AdvanceStoryStage
	call	GetStageArenaRank
	cp	A,9
	jr	NC,ArenaSceneEnd.skip4
	call	ClearTalkedFlags
	ld	HL,EVENT_JON_NOT_READY_SEEN
	call	ClearEventFlag
ArenaSceneEnd.skip4:
	call	GetStageArenaRank
	cp	A,3
	jr	C,ArenaSceneEnd.skip5
	cp	A,9
	jr	NC,ArenaSceneEnd.skip5
	sub	A,2
	extz	WA
	extz	XWA
	ld	XHL,ArenaPrizeItems
	add	XHL,XWA
	ld	A,(XHL)
	extz	WA
	call	AddItem
ArenaSceneEnd.skip5:
	call	GetStageArenaRank
	cp	A,2
	jr	C,ArenaSceneEnd.skip7
	cp	A,8
	jr	Z,ArenaSceneEnd.skip6
	jr	NC,ArenaSceneEnd.skip7
	sub	A,2
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XHL,ArenaPrizeGP
	add	XHL,XWA
	ld	WA,(XHL)
	call	AddGP
	jr	ArenaSceneEnd.skip7
ArenaSceneEnd.skip6:
	ld	WA,0xC350
	call	AddGP
	ld	WA,0xC350
	call	AddGP
ArenaSceneEnd.skip7:
	call	GetStageArenaRank
	cp	A,8
	jr	NZ,ArenaSceneEnd.skip8
	ld	A,1
	ld	(wArenaNext),A
ArenaSceneEnd.skip8:
	jr	ArenaSceneEnd.skip9
ArenaSceneEnd.skip9:
	ld	XWA,0
	ld	A,(XIZ+0x12)
	ld	XHL,ArenaSceneNext
	add	XHL,XWA
	ld	A,(XHL)
	cp	A,0x50
	jrl	C,ArenaSceneCmdScene
	cp	A,0x70
	jrl	C,ArenaSceneCmdGenderScene
	cp	A,0xFF
	jrl	Z,ArenaSceneCmdLeave
	cp	A,0xFE
	jr	Z,ArenaSceneEnd.skip10
	cp	A,0xFD
	jr	Z,ArenaSceneCmdScene1
	cp	A,0xFC
	jr	Z,ArenaSceneCmdEntryMenu
	cp	A,0xF9
	jr	Z,ArenaSceneCmdRankList
	cp	A,0xF3
	jr	Z,ArenaSceneCmdRankList
	cp	A,0xF8
	jr	Z,ArenaSceneCmdState6
	cp	A,0xF7
	jr	Z,ArenaSceneCmdState7
	cp	A,0xF6
	jr	Z,ArenaSceneCmdDuel
	cp	A,0xF5
	jr	Z,ArenaSceneCmdCMine
	cp	A,0xF4
	jr	Z,ArenaSceneCmdMineTrip
	cp	A,0xF2
	jr	Z,ArenaSceneCmdExit
	jrl	ArenaSceneCmdLeave
ArenaSceneEnd.skip10:
	call	ClearBox2Tall
	ld	A,7
	ld	(XIZ+0x12),A
	jrl	ArenaSceneCmdEnd

c_213567	section	code abs=0x213567

; [code] jrl ArenaSceneCmdLeave (no caller found)
ArenaSceneCmdLeave2:
	jrl	ArenaSceneCmdLeave

c_21356A	section	code abs=0x21356A

; [code] ArenaSceneNext 0xFC: DrawArenaEntryMenu, TASK_ARG 4 (ArenaEntryMenuInput)
ArenaSceneCmdEntryMenu:
	calr	DrawArenaEntryMenu
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	jrl	ArenaSceneCmdEnd

c_213575	section	code abs=0x213575

; [code] ArenaSceneNext 0xF9 / 0xF3: +0x17 = the command, ShowArenaRankList, TASK_ARG 5 (ArenaRankListInput)
ArenaSceneCmdRankList:
	ld	(XIZ+0x17),A
	calr	ShowArenaRankList
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	jr	ArenaSceneCmdEnd

c_213582	section	code abs=0x213582

; [code] ArenaSceneNext 0xF8: ShowArenaBracket, TASK_ARG 6 (ArenaBracketDispatch)
ArenaSceneCmdState6:
	calr	ShowArenaBracket
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	jr	ArenaSceneCmdEnd

c_21358C	section	code abs=0x21358C

; [code] ArenaSceneNext 0xFD: scene +0x12 = 1
ArenaSceneCmdScene1:
	ld	A,1
	ld	(XIZ+0x12),A
	jr	ArenaSceneCmdEnd

c_213593	section	code abs=0x213593

; [code] ArenaSceneNext 0xF7: TASK_ARG 7 (ArenaPreDuelGate)
ArenaSceneCmdState7:
	ld	A,7
	ld	(XIZ+TASK_ARG),A
	jr	ArenaSceneCmdEnd

c_21359A	section	code abs=0x21359A

; [code] ArenaSceneNext 0xF6: EraseBox1, ArenaClearScreen, +0x2A = 2, TASK_ARG 9 (ArenaDuelDispatch)
ArenaSceneCmdDuel:
	call	EraseBox1
	calr	ArenaClearScreen
	ld	A,2
	ld	(XIZ+0x2A),A
	ld	A,9
	ld	(XIZ+TASK_ARG),A
	jr	ArenaSceneCmdEnd

c_2135AD	section	code abs=0x2135AD

; [code] ArenaSceneNext 0xF5: scene +0x12 = 0x3A (ArenaSceneStep draws CMineText and picture 0x34 for it)
ArenaSceneCmdCMine:
	ld	A,0x3A
	ld	(XIZ+0x12),A
	jr	ArenaSceneCmdEnd

c_2135B4	section	code abs=0x2135B4

; [code] ArenaSceneNext 0xF4: ArenaGoToCrystalMine
ArenaSceneCmdMineTrip:
	calr	ArenaGoToCrystalMine
	jr	ArenaSceneCmdEnd

c_2135B9	section	code abs=0x2135B9

; [code] ArenaSceneNext 0xF2: TASK_ARG 0xB (ArenaExitFade)
ArenaSceneCmdExit:
	ld	A,0xB
	ld	(XIZ+TASK_ARG),A
	jr	ArenaSceneCmdEnd

c_2135C0	section	code abs=0x2135C0

; [code] ArenaSceneNext < 0x50: scene +0x12 = A
ArenaSceneCmdScene:
	ld	(XIZ+0x12),A
	jr	ArenaSceneCmdEnd

c_2135C5	section	code abs=0x2135C5

; [code] ArenaSceneNext 0x50-0x6F: scene +0x12 = GetArenaGenderScene; for 0x64 first the arena picture 0x29 (ArenaShowPicture), Box2 / Box3 placed and PlayMusic 4
ArenaSceneCmdGenderScene:
	cp	A,0x64
	jr	NZ,ArenaSceneCmdGenderScene.skip
	push	A
	call	ClearScr1Tilemap
	pop	A
	call	PlaceBox2
	call	PlaceBox3
	ld	HL,0x29
	calr	ArenaShowPicture
	push	XWA
	ld	XWA,SONG_STORY
	call	PlayMusic
	ld	WA,MUSIC_STORY
	call	SoundCommand
	pop	XWA
ArenaSceneCmdGenderScene.skip:
	calr	GetArenaGenderScene
	ld	(XIZ+0x12),A
	jr	ArenaSceneCmdEnd

c_2135F5	section	code abs=0x2135F5

; [code] ArenaSceneNext 0xFF (and unknown commands): scene mode +0xF = 4, +0x11 = 0 (ArenaSceneRunner: TASK_ARG 0xC, the arena task ends)
ArenaSceneCmdLeave:
	ld	A,4
	ld	(XIZ+0xF),A
	ld	A,0
	ld	(XIZ+0x11),A

c_2135FF	section	code abs=0x2135FF

; [code] ArenaSceneCmdDone and return: the common exit of the ArenaSceneEnd commands
ArenaSceneCmdEnd:
	calr	ArenaSceneCmdDone
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213607	section	code abs=0x213607

; [code] +0x25 = 0 (ArenaSceneStep loads the next message); the common end of the ArenaSceneEnd next-scene commands; byte-identical copy of ResetTalkRowPhase (the ROM has each)
ArenaSceneCmdDone:
	push	A
	ld	A,0
	ld	(XIZ+0x25),A
	pop	A
	ret

c_21360F	section	code abs=0x21360F

; [code] box 3 "Arena " (picture 0x29) or "C.Mine" (0x34, Lily stage), PlayMusic 4
SetupArenaScreen:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	OpenBoxes123
	call	PlaceBoxes123
	call	CheckStageEnding
	cp	A,1
	jr	Z,SetupArenaScreen.skip
	call	CheckStageLily
	cp	A,0
	jr	Z,SetupArenaScreen.skip
	call	CheckTalkedJon
	cp	A,0
	jr	Z,SetupArenaScreen.skip
	ld	XHL,CMineText
	ld	A,3
	call	DrawBoxString
	ld	HL,0x34
	jr	SetupArenaScreen.skip2
SetupArenaScreen.skip:
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	HL,0x29
SetupArenaScreen.skip2:
	calr	ArenaShowPicture
	ld	A,0
	ld	(XIZ+0x13),A
	call	SetupWindowIris
	call	StartWindowAnimToA
	call	ApplyWindowA
	ld	A,0xFF
	ld	(XIZ+0x12),A
	ld	A,0
	ld	(XIZ+0x25),A
	push	XWA
	ld	XWA,SONG_STORY
	call	PlayMusic
	ld	WA,MUSIC_STORY
	call	SoundCommand
	pop	XWA
	ld	A,2
	ld	(XIZ+0xF),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21368D	section	code abs=0x21368D

; [code] per frame of an arena talk scene: text box 1 message (GetTextBox +8) empty -> first frame sets +8 = ArenaTalkTexts[task+0x12] (GetArenaTalkRow when +0x12 = FF, DrawArenaSceneCast portraits), after the message calls ArenaSceneEnd; A/B (wJoyPressed) sets box speed +0x10 to 0 and restores it from +0x23/+0x24; [play] every arena_* talk screen
ArenaSceneStep:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,ArenaSceneStep.skip
	ld	B,(XIZ+0x24)
	dec	1,B
	ld	(XIZ+0x24),B
	jrl	NZ,ArenaSceneStep.skip8
	ld	A,1
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
ArenaSceneStep.skip:
	ld	A,1
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,ArenaSceneStep.skip4
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	jr	NZ,ArenaSceneStep.skip2
	ld	A,1
	ld	(XIZ+0x26),A
ArenaSceneStep.skip2:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jrl	Z,ArenaSceneStep.skip8
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,ArenaSceneStep.skip3
	ld	A,0
	ld	(XIZ+0x26),A
	jr	ArenaSceneStep.skip8
ArenaSceneStep.skip3:
	ld	A,1
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	inc	1,C
	ld	(XIZ+0x24),C
	ld	C,0
	ld	(XWA+0x10),C
	jr	ArenaSceneStep.skip8
ArenaSceneStep.skip4:
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,ArenaSceneStep.skip5
	ld	A,1
	ld	(XIZ+0x25),A
	calr	ArenaSceneEnd
	jr	ArenaSceneStep.skip8
ArenaSceneStep.skip5:
	ld	A,(XIZ+0x12)
	cp	A,0xFF
	jr	NZ,ArenaSceneStep.skip6
	calr	GetArenaTalkRow
	ld	(XIZ+0x12),W
ArenaSceneStep.skip6:
	calr	DrawArenaSceneCast
	ld	A,(XIZ+0x12)
	cp	A,0x3A
	jr	NZ,ArenaSceneStep.skip7
	ld	XHL,CMineText
	ld	A,3
	call	DrawBoxString
	ld	HL,0x34
	calr	ArenaShowPicture
ArenaSceneStep.skip7:
	ld	A,(XIZ+0x12)
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,ArenaTalkTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,2
	ld	(XIZ+0x25),A
ArenaSceneStep.skip8:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213768	section	code abs=0x213768

; [code] ArenaTask state 3, on scene mode +0xF: 1 -> 2, 2 ClearArenaPortraitArea2 -> 3, 3 ArenaSceneStep, 4 (scene over) ClearArenaPortraitArea + EraseBoxes1And2Tall and TASK_ARG 0xC when +0x11 = 0, 5 ArenaCoverStep until done -> 6, 6 ArenaUncoverStep until done -> 3; +0x2D += 1
ArenaSceneRunner:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0xF)
	cp	A,1
	jr	NZ,ArenaSceneRunner.skip
	ld	A,2
	ld	(XIZ+0xF),A
	jr	ArenaSceneRunner.skip8
ArenaSceneRunner.skip:
	cp	A,2
	jr	NZ,ArenaSceneRunner.skip2
	ld	A,0
	cp	A,1
	jr	Z,ArenaSceneRunner.skip8
	calr	ClearArenaPortraitArea2
	ld	A,3
	ld	(XIZ+0xF),A
	jr	ArenaSceneRunner.skip8
ArenaSceneRunner.skip2:
	cp	A,3
	jr	NZ,ArenaSceneRunner.skip3
	calr	ArenaSceneStep
	jr	ArenaSceneRunner.skip8
ArenaSceneRunner.skip3:
	cp	A,4
	jr	NZ,ArenaSceneRunner.skip5
	calr	ClearArenaPortraitArea
	call	EraseBoxes1And2Tall
	ld	A,(XIZ+0x11)
	cp	A,0
	jr	NZ,ArenaSceneRunner.skip4
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
ArenaSceneRunner.skip4:
	jr	ArenaSceneRunner.skip8
ArenaSceneRunner.skip5:
	cp	A,5
	jr	NZ,ArenaSceneRunner.skip6
	calr	ArenaCoverStep
	cp	A,1
	jr	Z,ArenaSceneRunner.skip8
	calr	ClearArenaPortraitArea2
	calr	StartArenaUncover
	ld	A,6
	ld	(XIZ+0xF),A
	jr	ArenaSceneRunner.skip8
ArenaSceneRunner.skip6:
	cp	A,6
	jr	NZ,ArenaSceneRunner.skip7
	calr	ArenaUncoverStep
	cp	A,1
	jr	Z,ArenaSceneRunner.skip8
	calr	ClearArenaPortraitArea2
	ld	A,3
	ld	(XIZ+0xF),A
	jr	ArenaSceneRunner.skip8
ArenaSceneRunner.skip7:
	ld	A,1
	ld	(XIZ+0xF),A
ArenaSceneRunner.skip8:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2137EF	section	code abs=0x2137EF

; [code] ClearBox2Tall, box 2 = EntryText + QuitText2, cursor +0x10 = 0; ArenaSceneNext 0xFC
DrawArenaEntryMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2Tall
	ld	A,2
	ld	XHL,EntryText
	call	DrawBoxString
	ld	A,2
	ld	XHL,QuitText2
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21698A	section	code abs=0x21698A

; [code] sets EVENT_TALKED_ JON, LILY, CYRIUS, WYSE, ZIGGY, CEUS, HELMUT, ALDA, CAMIL, MEESE, COLLA, TETIS; ArenaFightQuitChoose after paying the arena entry fee
SetTalkedFlags:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_TALKED_JON
	call	SetEventFlag
	ld	HL,EVENT_TALKED_LILY
	call	SetEventFlag
	ld	HL,EVENT_TALKED_CYRIUS
	call	SetEventFlag
	ld	HL,EVENT_TALKED_WYSE
	call	SetEventFlag
	ld	HL,EVENT_TALKED_ZIGGY
	call	SetEventFlag
	ld	HL,EVENT_TALKED_CEUS
	call	SetEventFlag
	ld	HL,EVENT_TALKED_HELMUT
	call	SetEventFlag
	ld	HL,EVENT_TALKED_ALDA
	call	SetEventFlag
	ld	HL,EVENT_TALKED_CAMIL
	call	SetEventFlag
	ld	HL,EVENT_TALKED_MEESE
	call	SetEventFlag
	ld	HL,EVENT_TALKED_COLLA
	call	SetEventFlag
	ld	HL,EVENT_TALKED_TETIS
	call	SetEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216A4E	section	code abs=0x216A4E

; [code] A = EVENT_TALKED_JON
CheckTalkedJon:
	push	XHL
	push	BC
	ld	HL,EVENT_TALKED_JON
	call	CheckEventFlag
	ld	A,L
	pop	BC
	pop	XHL
	ret

c_216A5C	section	code abs=0x216A5C

; [code] sets EVENT_TALKED_JON
SetTalkedJon:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_TALKED_JON
	call	SetEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216A78	section	code abs=0x216A78

; [code] sets EVENT_JON_NOT_READY_SEEN (Jon row 0x3F's action 3)
SetJonNotReadySeen:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_JON_NOT_READY_SEEN
	call	SetEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216A86	section	code abs=0x216A86

; [code] A = EVENT_STAGE_LILY
CheckStageLily:
	push	XHL
	push	BC
	ld	HL,EVENT_STAGE_LILY
	call	CheckEventFlag
	ld	A,L
	pop	BC
	pop	XHL
	ret
