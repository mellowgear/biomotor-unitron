; engine/menus/town/street.asm: the street menu (Works / Shop / Arena / Square / W.Map) and the street task

c_20D84E	section	code abs=0x20D84E

; [code] child of StreetTask: TASK_ARG = 1, TASK_FUNC = StreetMenuDispatch, PlayMusic 1, SoundCommand 0x21; also called directly by SetMaxPilotStats
StreetMenuTask:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	XWA,StreetMenuDispatch
	ld	(XIZ+TASK_FUNC),XWA
	ld	WA,SONG_TOWN
	call	PlayMusic
	ld	WA,MUSIC_TOWN
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20D871	section	code abs=0x20D871

; [code] Works / Shop / Arena / Square / W.Map
StreetMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearTilemaps
	call	ClearSprites
	call	OpenBoxes123
	ld	A,2
	ld	XHL,WorksText
	call	DrawBoxString
	ld	A,2
	ld	XHL,ShopText
	call	DrawBoxString
	ld	A,2
	ld	XHL,ArenaText
	call	DrawBoxString
	ld	A,2
	ld	XHL,SquareText
	call	DrawBoxString
	ld	A,2
	ld	XHL,WMapText
	call	DrawBoxString
	ld	XHL,StreetText
	ld	A,3
	call	DrawBoxString
	call	PlaceBoxes123
	ld	A,1
	call	ClearTextBox
	ld	XHL,WhereDoYouGoText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	HL,0x28
	call	GetPictureFirstTile
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	call	SetupWindowIris
	call	StartWindowAnimToA
	call	ApplyWindowA
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20D8FB	section	code abs=0x20D8FB

; [code] street menu state 3 (each frame): A -> sound 0x81, StreetMenuSelect; else StreetMenuPrompt / StreetMenuMoveCursor; then StreetMenuDrawCursor
StreetMenuInput:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,StreetMenuPrompt
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	calr	StreetMenuSelect
	jr	StreetMenuDrawCursor

c_20D914	section	code abs=0x20D914

; [code+play] "Where do you go?"
StreetMenuPrompt:
	bit	5,A
	jr	Z,StreetMenuMoveCursor
	ld	A,1
	call	ClearTextBox
	ld	XHL,WhereDoYouGoText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	WA,SFX_CANCEL
	call	SoundCommand
	jr	StreetMenuDrawCursor

c_20D936	section	code abs=0x20D936

; [code] joypad bits 0-3 (A = wJoyPressed): bit 0 (up) wStreetMenuChoice - 1 (0 wraps to 4), bit 1 (down) + 1 (4 wraps to 0), sound 0x80; then StreetMenuDrawCursor
StreetMenuMoveCursor:
	and	A,0xF
	jr	Z,StreetMenuDrawCursor
	cp	A,1
	jr	NZ,StreetMenuMoveCursor.skip2
	ld	WA,SFX_CURSOR
	call	SoundCommand
	ld	A,(wStreetMenuChoice)
	cp	A,0
	jr	Z,StreetMenuMoveCursor.skip
	dec	1,A
	ld	(wStreetMenuChoice),A
	jr	StreetMenuMoveCursor.skip4
StreetMenuMoveCursor.skip:
	ld	A,4
	ld	(wStreetMenuChoice),A
	jr	StreetMenuMoveCursor.skip4
StreetMenuMoveCursor.skip2:
	cp	A,2
	jr	NZ,StreetMenuMoveCursor.skip4
	ld	WA,SFX_CURSOR
	call	SoundCommand
	ld	A,(wStreetMenuChoice)
	cp	A,4
	jr	Z,StreetMenuMoveCursor.skip3
	inc	1,A
	ld	(wStreetMenuChoice),A
	jr	StreetMenuMoveCursor.skip4
StreetMenuMoveCursor.skip3:
	ld	A,0
	ld	(wStreetMenuChoice),A
	jr	StreetMenuMoveCursor.skip4
StreetMenuMoveCursor.skip4:
	jr	StreetMenuDrawCursor

c_20D983	section	code abs=0x20D983

; [code] DrawMenuCursor at x 0x60, y wStreetMenuChoice * 8 + 4; task +0x2D += 1
StreetMenuDrawCursor:
	ld	BC,0x60
	ld	XWA,0
	ld	A,(wStreetMenuChoice)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20D9A6	section	code abs=0x20D9A6

; [code] street menu A (StreetMenuInput): choices 0-3 -> TASK_ARG 4; choice 4 (W.Map) shows NoUNITRONYouCantText when EVENT_STAGE_TOWN or EVENT_STAGE_WON_RANK_CS is set, else TASK_ARG 4
StreetMenuSelect:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,1
	call	ClearTextBox
	ld	A,(wStreetMenuChoice)
	cp	A,2
	jr	Z,StreetMenuSelectAccept
	cp	A,3
	jr	Z,StreetMenuSelectAccept
	cp	A,0
	jr	Z,StreetMenuSelectAccept
	cp	A,1
	jr	Z,StreetMenuSelectAccept
	ld	HL,EVENT_STAGE_TOWN
	call	CheckEventFlag
	jr	NZ,StreetMenuSelect.skip
	ld	HL,EVENT_STAGE_WON_RANK_CS
	call	CheckEventFlag
	jr	NZ,StreetMenuSelect.skip
	jr	StreetMenuSelectAccept
StreetMenuSelect.skip:
	ld	A,1
	call	ClearTextBox
	ld	XHL,NoUNITRONYouCantText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	jr	StreetMenuSelectDone

c_20D9F8	section	code abs=0x20D9F8

; [code] StreetMenuSelect: TASK_ARG 4 (StreetMenuDispatch ends the menu task; StreetTask goes by wStreetMenuChoice)
StreetMenuSelectAccept:
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	jr	StreetMenuSelectDone

c_20D9FF	section	code abs=0x20D9FF

; [code] StreetMenuSelect exit: registers restored, ret
StreetMenuSelectDone:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DA04	section	code abs=0x20DA04

; [code] EraseBoxes123, TASK_ARG 5 (StreetMenuWaitChildren), then a child task by wStreetMenuChoice: 4 WorldMapTaskInit, 3 TownPlaceTaskSquare, 0 TownPlaceTaskWorks, 1 TownPlaceTaskShop, 2 (Arena) none; no caller found and never executed in play (StreetTask starts these itself after the menu task ends)
StreetMenuStartPlaceTask:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	EraseBoxes123
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,(wStreetMenuChoice)
	cp	A,4
	jr	NZ,StreetMenuStartPlaceTask.skip
	ld	XHL,WorldMapTaskInit
	call	StartChildTask
	jr	StreetMenuStartPlaceTask.skip5
StreetMenuStartPlaceTask.skip:
	cp	A,2
	jr	NZ,StreetMenuStartPlaceTask.skip2
	jr	StreetMenuStartPlaceTask.skip5
StreetMenuStartPlaceTask.skip2:
	cp	A,3
	jr	NZ,StreetMenuStartPlaceTask.skip3
	ld	XHL,TownPlaceTaskSquare
	call	StartChildTask
	jr	StreetMenuStartPlaceTask.skip5
StreetMenuStartPlaceTask.skip3:
	cp	A,0
	jr	NZ,StreetMenuStartPlaceTask.skip4
	ld	XHL,TownPlaceTaskWorks
	call	StartChildTask
	jr	StreetMenuStartPlaceTask.skip5
StreetMenuStartPlaceTask.skip4:
	cp	A,1
	jr	NZ,StreetMenuStartPlaceTask.skip5
	ld	XHL,TownPlaceTaskShop
	call	StartChildTask
	jr	StreetMenuStartPlaceTask.skip5
StreetMenuStartPlaceTask.skip5:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DA5C	section	code abs=0x20DA5C

; [code] street menu state 5: TASK_ARG = 1 (StreetMenu again) once the task has no children (TASK_CHILDREN = 0)
StreetMenuWaitChildren:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,StreetMenuWaitChildren.skip
	ld	A,1
	ld	(XIZ+TASK_ARG),A
StreetMenuWaitChildren.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DA71	section	code abs=0x20DA71

; [code] street menu task (TASK_FUNC from StreetMenuTask), by TASK_ARG: 1 StreetMenu, -> 2; 2 -> 3; 3 StreetMenuInput; 4 EndTask (StreetMenuSelect sets 4); 5 StreetMenuWaitChildren
StreetMenuDispatch:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+TASK_ARG)
	cp	A,1
	jr	NZ,StreetMenuDispatchState2
	calr	StreetMenu
	ld	A,2
	ld	(XIZ+TASK_ARG),A
	jr	StreetMenuDispatchEnd.skip

c_20DA86	section	code abs=0x20DA86

; [code] StreetMenuDispatch case chain: TASK_ARG 2 -> 3, else the next test
StreetMenuDispatchState2:
	cp	A,2
	jr	NZ,StreetMenuDispatchState3
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	StreetMenuDispatchEnd.skip

c_20DA91	section	code abs=0x20DA91

; [code] StreetMenuDispatch case chain: TASK_ARG 3 -> StreetMenuInput, else the next test
StreetMenuDispatchState3:
	cp	A,3
	jr	NZ,StreetMenuDispatchState4
	calr	StreetMenuInput
	jr	StreetMenuDispatchEnd.skip

c_20DA9A	section	code abs=0x20DA9A

; [code] StreetMenuDispatch case chain: TASK_ARG 4 -> EndTask, 5 -> StreetMenuWaitChildren
StreetMenuDispatchState4:
	cp	A,4
	jr	NZ,StreetMenuDispatchState4.skip
	call	EndTask
	jr	StreetMenuDispatchEnd.skip
StreetMenuDispatchState4.skip:
	cp	A,5
	jr	NZ,StreetMenuDispatchState4.skip2
	calr	StreetMenuWaitChildren
	jr	StreetMenuDispatchEnd.skip
StreetMenuDispatchState4.skip2:
	jr	StreetMenuDispatchEnd.skip

c_20DAAF	section	code abs=0x20DAAF

; [code] TASK_ARG = 1, then the StreetMenuDispatch exit at StreetMenuDispatchEnd.skip (registers restored, ret) that every case jumps to; the first two instructions are never jumped to and never executed in play
StreetMenuDispatchEnd:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
StreetMenuDispatchEnd.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21D758	section	code abs=0x21D758

; [code+play] full HP/EP, statuses cleared, street menu, then by 0x5DF4: Works, Shop, Arena, Square, World map
StreetTask:
	ldw	(wUnitHP),(wUnitMaxHP)
	ldw	(wUnitEP),(wUnitMaxEP)
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusRust),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ld	XHL,StreetMenuTask
	call	StartChildTask
	task_wait
	cpb	(wStreetMenuChoice),1
	ld	XHL,StreetGoWorks
	jr	C,StreetTask.skip
	ld	XHL,StreetGoShop
	jr	Z,StreetTask.skip
	cpb	(wStreetMenuChoice),3
	ld	XHL,StreetGoArena
	jr	C,StreetTask.skip
	ld	XHL,StreetGoSquare
	jr	Z,StreetTask.skip
	ld	XHL,StreetGoWorldMap
StreetTask.skip:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_21D7BC	section	code abs=0x21D7BC

; [code] StreetTask choice 4 (W.Map): child WorldMapTaskInit, task_wait, then by wStreetNext: 2 StreetAfterDungeonDefeat, 4 StreetEndingScenes, 5 StreetTheEnd, else StreetTask
StreetGoWorldMap:
	ld	XHL,WorldMapTaskInit
	call	StartChildTask
	task_wait
	cpb	(wStreetNext),2
	ld	XHL,StreetAfterDungeonDefeat
	jr	Z,StreetGoWorldMap.skip
	cpb	(wStreetNext),4
	ld	XHL,StreetEndingScenes
	jr	Z,StreetGoWorldMap.skip
	cpb	(wStreetNext),5
	ld	XHL,StreetTheEnd
	jr	Z,StreetGoWorldMap.skip
	ld	XHL,StreetTask
StreetGoWorldMap.skip:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_21D800	section	code abs=0x21D800

; [code] street choice 0 (Works), then back to StreetTask
StreetGoWorks:
	ld	XHL,TownPlaceTaskWorks
	call	StartChildTask
	task_wait
	call	ResetScr2Palettes
	cpb	(wTownPlaceResult),1
	jr	Z,StreetGoWorks.skip
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret
StreetGoWorks.skip:
	ldw	(wEnemyAffinity),(wUnitAffinity)
	ld	A,WORKS_MODE_STREET
	call	RunWorksScreen
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret

c_21D856	section	code abs=0x21D856

; [code] StreetTask choice 1 (Shop): child TownPlaceTaskShop, task_wait; when wTownPlaceResult (the place task +0x11 at TownPlaceTaskEnd) is 3, 4 or 5 RunShopScreen 1; back to StreetTask
StreetGoShop:
	ld	XHL,TownPlaceTaskShop
	call	StartChildTask
	task_wait
	cpb	(wTownPlaceResult),3
	jr	Z,StreetGoShop.skip3
	cpb	(wTownPlaceResult),4
	jr	Z,StreetGoShop.skip
	cpb	(wTownPlaceResult),5
	jr	Z,StreetGoShop.skip2
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret
StreetGoShop.skip:
	ld	A,1
	call	RunShopScreen
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret
StreetGoShop.skip2:
	ld	A,1
	call	RunShopScreen
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret
StreetGoShop.skip3:
	ld	A,1
	call	RunShopScreen
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret

c_21D8C0	section	code abs=0x21D8C0

; [code] StreetTask choice 2 (Arena): child ArenaTaskInit, task_wait, then by wStreetNext: 1 StreetGoWorks, 2 StreetAfterDungeonDefeat, 4 StreetEndingScenes, 5 StreetTheEnd, 6 StreetGameOver, else StreetTask
StreetGoArena:
	ld	XHL,ArenaTaskInit
	call	StartChildTask
	task_wait
	cpb	(wStreetNext),1
	ld	XHL,StreetGoWorks
	jr	Z,StreetGoArena.skip
	cpb	(wStreetNext),2
	ld	XHL,StreetAfterDungeonDefeat
	jr	Z,StreetGoArena.skip
	cpb	(wStreetNext),4
	ld	XHL,StreetEndingScenes
	jr	Z,StreetGoArena.skip
	cpb	(wStreetNext),5
	ld	XHL,StreetTheEnd
	jr	Z,StreetGoArena.skip
	cpb	(wStreetNext),6
	ld	XHL,StreetGameOver
	jr	Z,StreetGoArena.skip
	ld	XHL,StreetTask
StreetGoArena.skip:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_21D91C	section	code abs=0x21D91C

; [code] StreetTask choice 3 (Square): child TownPlaceTaskSquare, task_wait, back to StreetTask
StreetGoSquare:
	ld	XHL,TownPlaceTaskSquare
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret

c_21D93E	section	code abs=0x21D93E

; [code] wStreetNext 2: wEnemyAffinity = wUnitAffinity, RunWorksScreen 3, CalcUnitStats, wStreetMenuChoice = 0, back to StreetTask. 2 is the DUNGEON_MODE a dungeon task ends with after a defeat: a lost random battle (DungeonWaitBattleEnd, wBattleResult 3), a lost boss battle (BossEncounter, except the Crystal Mine's last floor) or 0 HP from RustStepDamage (PlayerIsDeadText, DungeonStep mode 0x10); from the Crystal Mine it reaches wStreetNext through wArenaNext; [play] seen after losing a world-dungeon boss battle (Ent): the Works opens with "Whew! I'm glad to see you're all right!" (was StreetAfterBossLoss)
StreetAfterDungeonDefeat:
	ldw	(wEnemyAffinity),(wUnitAffinity)
	ld	A,WORKS_MODE_AFTER_DEFEAT
	call	RunWorksScreen
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret

c_21D95E	section	code abs=0x21D95E

; [code] wStreetNext 4: child StorySceneDestructionSetup, task_wait, then resumes at StreetGoWorks; [play] 4 follows beating Uniti in the Crystal Mine (the destruction scene "With the destruction of Unitice, all UNITRON cores lost their power", StorySceneSunBegan, the credits, then "One year later..." at the Works)
StreetEndingScenes:
	ld	XHL,StorySceneDestructionSetup
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),StreetGoWorks & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetGoWorks >> 16
	ret

c_21D980	section	code abs=0x21D980

; [code] wStreetNext 5: child StorySceneTheEnd, task_wait, then falls into StreetGameOver. 5 comes from the Crystal Mine (via wArenaNext): BossEncounter after the talk in state 4, or a lost boss battle on the mine's last floor; [play] 5 follows answering Yes to Uniti's offer ("do you turn over your power to me?") in the Crystal Mine: the dead planet ("It was the end of an era..."), then GAME OVER
StreetTheEnd:
	ld	XHL,StorySceneTheEnd
	call	StartChildTask
	task_wait

c_21D997	section	code abs=0x21D997

; [code] wStreetNext 6 (and after StreetTheEnd): child GameOverScreen, task_wait, then resumes at 0x21D5E9; [play] 6 follows losing the Rank CS final to Satana ("GAME OVER")
StreetGameOver:
	ld	XHL,GameOverScreen
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),IntroThenMainMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroThenMainMenu >> 16
	ret
