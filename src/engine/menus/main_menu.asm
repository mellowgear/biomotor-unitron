; engine/menus/main_menu.asm: title screen (press A), main menu, config menu, delete data, MainMenuTask

c_20CF34	section	code abs=0x20CF34

; [play] main_menu: window graphics, portrait, music
MainMenuSetup:
	call	InitTextBoxes
	call	ClearTilemaps
	ldb	(wMainMenuCursor),0
	ld	WA,0xB5
	ld	HL,0x2A
	ld	BC,0xA
	ld	DE,0
	call	DrawPortrait
	ld	WA,0x161
	ld	HL,0x2B
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	WA,SONG_MAIN_MENU
	call	PlayMusic
	ld	WA,MUSIC_MAIN_MENU
	call	SoundCommand
	set_scroll_priority	0
	ldw	(XIZ+TASK_FUNC),MainMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenu >> 16
	ret

c_20CF7C	section	code abs=0x20CF7C

; [play] main_menu, reads wJoyPressed
MainMenu:
	call	ClearScr2Tilemap
	call	ClearSprites
	ld	A,0
	ld	C,0xC
	ld	E,3
	ld	HL,0xC
	call	OpenTextBox
	ld	A,0
	call	GetTextBox
	ld	XHL,MainMenuTitleText
	call	DrawString
	ld	C,4
	ld	E,0x22
	call	PlaceTextBoxXWA
	ld	A,1
	ld	C,0xC
	ld	E,7
	ld	HL,0x16
	call	OpenTextBox
	ld	A,1
	call	GetTextBox
	ld	XHL,MainMenuChoicesText
	call	DrawString
	ld	C,4
	ld	E,0x26
	call	PlaceTextBoxXWA
	ld	XHL,MainMenuTransitionIn
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),MainMenu.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenu.resume >> 16
MainMenu.resume:
	ld	E,(wMainMenuCursor)
	ld	D,0
	sll	4,DE
	add	DE,0x34
	ld	BC,0x28
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,MainMenu.skip
	bit	1,A
	jr	NZ,MainMenu.skip2
	bit	4,A
	jr	NZ,MainMenuConfirm
	bit	5,A
	jr	NZ,MainMenuCancel
	ret
MainMenu.skip:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	decb	1,(wMainMenuCursor)
	ret	PL
	ldb	(wMainMenuCursor),2
	ret
MainMenu.skip2:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	incb	1,(wMainMenuCursor)
	cpb	(wMainMenuCursor),3
	ret	C
	ldb	(wMainMenuCursor),0
	ret

c_20D04E	section	code abs=0x20D04E

; [code] main menu A: sound 0x81, transition, then the option task by wMainMenuCursor (table MainMenuJumps: 0 new game, 1 MainMenuLoadTask, 2 ConfigMenu)
MainMenuConfirm:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	ld	XHL,MainMenuTransitionOut
	call	StartChildTask
	task_wait
	call	ClearScr2Tilemap
	ld	XHL,0
	ld	L,(wMainMenuCursor)
	sll	2,HL
	add	XHL,MainMenuJumps
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
; [code] next task per wMainMenuCursor: New Game, Load, Config
MainMenuJumps:
	dl	MainMenuNewGame,MainMenuLoadTask,ConfigMenu

c_20D091	section	code abs=0x20D091

; [code] MainMenu on B (joypad bit 5): sound 0x82, MainMenuTransitionOut, ClearScr2Tilemap, wMainMenuCursor = 0 (MainMenuTask then goes back to IntroThenMainMenu), SCROLL_PRIORITY = 0x80, EndTask
MainMenuCancel:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	ld	XHL,MainMenuTransitionOut
	call	StartChildTask
	task_wait
	call	ClearScr2Tilemap
	ldb	(wMainMenuCursor),0
	set_scroll_priority	0x80
	call	EndTask
	ret
; [code] main menu title box text
MainMenuTitleText:
	page "Main Menu"
	done
; [code] main menu choices, one per two rows (wMainMenuCursor 0-2)
MainMenuChoicesText:
	page " New Game"
	line ""
	line " Load"
	line ""
	line " Config"
	done

c_20D0E8	section	code abs=0x20D0E8

; [code] main menu option 0 (MainMenuConfirm table): wMainMenuCursor += 1 (-> 1: MainMenuTask goes to NewGameSetup), SCROLL_PRIORITY = 0x80, EndTask
MainMenuNewGame:
	incb	1,(wMainMenuCursor)
	set_scroll_priority	0x80
	call	EndTask
	ret

c_20D0F6	section	code abs=0x20D0F6

; [code+play] main menu option 1: slot list, confirm, load; cancel back to MainMenu
MainMenuLoadTask:
	ldw	(XIZ+TASK_ARG),0xC
	ldw	(XIZ+0x10),0
	call	InitLoadSlotList
	ld	XHL,MainMenuTransitionIn
	call	StartChildTask
	task_wait
MainMenuLoadTask.resume:
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jr	Z,MainMenuLoadTask.skip2
	call	ShowSaveConfirmBox
	ld	XHL,YesNoPromptTask
	call	StartChildTask
	task_wait
	call	DrawSaveSlotList
	cpb	(wYesNoChoice),1
	jr	Z,MainMenuLoadTask.skip
	ldw	(XIZ+TASK_FUNC),MainMenuLoadTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenuLoadTask.resume >> 16
	ret
MainMenuLoadTask.skip:
	ld	A,(wSaveSlot)
	call	LoadGameSlot
	call	ShowSaveDoneBox
	ld	XHL,Wait30FramesTask
	call	StartChildTask
	task_wait
	incb	1,(wMainMenuCursor)
	set_scroll_priority	0x80
	call	EndTask
	ret
MainMenuLoadTask.skip2:
	ld	XHL,MainMenuTransitionOut
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),MainMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenu >> 16
	ret

c_20D1BD	section	code abs=0x20D1BD

; [code] Message Speed Fast/Slow, Animation ON/OFF, Delete Data; wOptionMessageSpeed / wOptionAnimation
ConfigMenu:
	ldb	(wConfigCursor),0
	call	ClearScr2Tilemap
	ld	A,0
	ld	C,0xA
	ld	E,3
	ld	HL,0xC
	call	OpenTextBox
	ld	XHL,ConfigText
	call	DrawString
	ld	C,0
	ld	E,0x20
	call	PlaceTextBoxXWA
	ld	A,1
	ld	C,0x12
	ld	E,5
	ld	HL,0x16
	call	OpenTextBox
	ld	XHL,MessageSpeedFastSlowText
	call	DrawString
	ld	C,1
	ld	E,0x24
	call	PlaceTextBoxXWA
	ld	A,2
	ld	C,0x12
	ld	E,5
	ld	HL,0x46
	call	OpenTextBox
	ld	XHL,AnimationONOFFText
	call	DrawString
	ld	C,1
	ld	E,0x29
	call	PlaceTextBoxXWA
	ld	A,3
	ld	C,0x12
	ld	E,5
	ld	HL,0x76
	call	OpenTextBox
	ld	XHL,DeleteDataContinueText
	call	DrawString
	ld	C,1
	ld	E,0x2E
	call	PlaceTextBoxXWA
	ld	XHL,MainMenuTransitionIn
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),ConfigMenu.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfigMenu.resume >> 16
ConfigMenu.resume:
	calr	DrawConfigCursors
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,ConfigMenu.skip
	bit	1,A
	jr	NZ,ConfigMenu.skip2
	bit	4,A
	jr	NZ,ConfigMenu.skip3
	bit	5,A
	jrl	NZ,ConfigMenu.skip6
	and	A,0xC
	jr	NZ,ConfigMenu.skip4
	ret
ConfigMenu.skip:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	decb	1,(wConfigCursor)
	ret	PL
	ldb	(wConfigCursor),2
	ret
ConfigMenu.skip2:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	incb	1,(wConfigCursor)
	cpb	(wConfigCursor),3
	ret	C
	ldb	(wConfigCursor),0
	ret
ConfigMenu.skip3:
	cpb	(wConfigCursor),2
	ret	C
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),DeleteDataMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DeleteDataMenu >> 16
	ret
ConfigMenu.skip4:
	cpb	(wConfigCursor),1
	jr	C,ConfigMenu.skip5
	ret	NZ
	ld	WA,SFX_CURSOR
	call	SoundCommand
	cpb	(wOptionAnimation),0xFF
	ldb	(wOptionAnimation),0
	ret	Z
	ldb	(wOptionAnimation),0xFF
	ret
ConfigMenu.skip5:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	cpb	(wOptionMessageSpeed),3
	ldb	(wOptionMessageSpeed),1
	ret	Z
	ldb	(wOptionMessageSpeed),3
	ret
ConfigMenu.skip6:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	ld	XHL,MainMenuTransitionOut
	call	StartChildTask
	task_wait
	ld	A,0
	call	SaveOptions
	call	ClearScr2Tilemap
	ldw	(XIZ+TASK_FUNC),MainMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenu >> 16
	ret

c_20D397	section	code abs=0x20D397

; [code+play] Config > Delete Data "Which? All / Select" task (split pointer 0xD397/0x20 from ConfigMenu): choice task +0xE (1 Select), Left/Right flip it, A: All -> DeleteAllData, Select -> the Clear slot list; B -> back to "Continue?"; [play] traced in play: the entry runs once each time the box opens, then the per-frame task; Up/Down do nothing
DeleteDataMenu:
	ldw	(XIZ+TASK_ARG),1
	ld	A,0
	ld	C,0x12
	ld	E,5
	ld	HL,0x76
	call	OpenTextBox
	ld	XHL,DeleteDataMenuText
	call	DrawString
	ldw	(XIZ+TASK_FUNC),DeleteDataMenu.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DeleteDataMenu.resume >> 16
DeleteDataMenu.resume:
	calr	DrawConfigCursors
	ld	BC,(XIZ+TASK_ARG)
	mul	XBC,0x28
	add	BC,0x30
	ld	DE,0x84
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,DeleteDataMenu.skip
	bit	5,A
	jr	NZ,DeleteDataMenu.skip3
	and	A,0xC
	jr	NZ,DeleteDataMenu.skip4
	ret
DeleteDataMenu.skip:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	cpw	(XIZ+TASK_ARG),0
	ld	XHL,DeleteAllData
	jr	Z,DeleteDataMenu.skip2
	ld	XHL,DeleteDataSelect
DeleteDataMenu.skip2:
	ld	(XIZ+TASK_FUNC),XHL
	ret
DeleteDataMenu.skip3:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	ld	XHL,DeleteDataContinueText
	ld	A,0
	call	DrawBoxString
	ldw	(XIZ+TASK_FUNC),ConfigMenu.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfigMenu.resume >> 16
	ret
DeleteDataMenu.skip4:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	cpb	(XIZ+TASK_ARG),0
	ldb	(XIZ+TASK_ARG),1
	ret	Z
	ldb	(XIZ+TASK_ARG),0
	ret
; [code] DeleteDataMenu prompt: All (TASK_ARG 0) or Select (1)
DeleteDataMenuText:
	page "Delete Data"
	line "Which?"
	line "     All  Select"
	done

c_20D462	section	code abs=0x20D462

; [code] reached by `ld XHL,0x20D462` at 0x20D3FA (Delete Data submenu at 0x20D397, choice 0 "All" of text DeleteDataMenuText "Delete Data / Which? / All / Select"; choice 1 -> DeleteDataSelect): text 0x20D544 "Delete All Ok? Yes No" (TASK_ARG default 1 = No), on Yes DrawBoxString 0x20D56F "Deleting...", EraseSaveBlock (BIOS 0x16, FlashEraseBlock block 0x11 loop, BIOS 0x15), wOptionMessageSpeed = 3, wOptionAnimation = 0xFF, 0x20D588 "Finished", then MainMenu; No/B -> 0x20D397
DeleteAllData:
	ldw	(XIZ+TASK_ARG),1
	ld	A,0
	ld	C,0x12
	ld	E,5
	ld	HL,0x76
	call	OpenTextBox
	ld	XHL,DeleteDataDeleteAllText
	call	DrawString
	ldw	(XIZ+TASK_FUNC),DeleteAllData.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DeleteAllData.resume >> 16
DeleteAllData.resume:
	calr	DrawConfigCursors
	ld	BC,(XIZ+TASK_ARG)
	mul	XBC,0x28
	add	BC,0x40
	ld	DE,0x84
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,DeleteAllData.skip
	bit	5,A
	jr	NZ,DeleteAllData.skip3
	and	A,0xC
	jr	NZ,DeleteAllData.skip4
	ret
DeleteAllData.skip:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	cpw	(XIZ+TASK_ARG),0
	jr	Z,DeleteAllData.skip2
	ldw	(XIZ+TASK_FUNC),DeleteDataMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DeleteDataMenu >> 16
	ret
DeleteAllData.skip2:
	call	ClearSprites
	ld	A,0
	ld	XHL,DeleteDataDeletingText
	call	DrawBoxString
	call	EraseSaveBlock
	ldb	(wOptionMessageSpeed),3
	ldb	(wOptionAnimation),0xFF
	ld	A,0
	ld	XHL,DeleteDataFinishedText
	call	DrawBoxString
	ld	XHL,MainMenuTransitionOut
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),MainMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenu >> 16
	ret
DeleteAllData.skip3:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),DeleteDataMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DeleteDataMenu >> 16
	ret
DeleteAllData.skip4:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	cpb	(XIZ+TASK_ARG),0
	ldb	(XIZ+TASK_ARG),1
	ret	Z
	ldb	(XIZ+TASK_ARG),0
	ret

c_20D59E	section	code abs=0x20D59E

; [code] Delete Data choice 1 "Select" (comment at 0x20D462): InitClearSlotList, SaveSlotSelectTask, ShowSaveConfirmBox + YesNoPromptTask; Yes -> sound 0x81, ClearSaveSlot wSaveSlot, ShowSaveDoneBox
DeleteDataSelect:
	ld	XHL,MainMenuTransitionOut
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_ARG),0xC
	ldw	(XIZ+0x10),0
	call	InitClearSlotList
	ld	XHL,MainMenuTransitionIn
	call	StartChildTask
	task_wait
DeleteDataSelect.resume:
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jr	Z,DeleteDataSelect.skip2
	call	ShowSaveConfirmBox
	ld	XHL,YesNoPromptTask
	call	StartChildTask
	task_wait
	call	DrawSaveSlotList
	cpb	(wYesNoChoice),1
	jr	Z,DeleteDataSelect.skip
	ldw	(XIZ+TASK_FUNC),DeleteDataSelect.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DeleteDataSelect.resume >> 16
	ret
DeleteDataSelect.skip:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	ld	A,(wSaveSlot)
	call	ClearSaveSlot
	call	ShowSaveDoneBox
	ld	XHL,Wait30FramesTask
	call	StartChildTask
	task_wait
	call	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),DeleteDataSelect.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DeleteDataSelect.resume >> 16
	ret
DeleteDataSelect.skip2:
	ld	XHL,MainMenuTransitionOut
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),ConfigMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfigMenu >> 16
	ret

c_20D684	section	code abs=0x20D684

; [code] Config screen sprites (DrawSpriteGrid): the row cursor at y = 0x2C + 0x28 * wConfigCursor, the message speed mark (right when wOptionMessageSpeed = 3) and the animation mark (right when wOptionAnimation = 0); [play] config_menu
DrawConfigCursors:
	ld	E,(wConfigCursor)
	ld	D,0
	mul	XDE,0x28
	add	DE,0x2C
	ld	BC,8
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	cpb	(wOptionMessageSpeed),3
	scc	Z,BC
	mul	BC,0x28
	add	BC,0x40
	ld	DE,0x34
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	cpb	(wOptionAnimation),0
	scc	Z,BC
	mul	BC,0x28
	add	BC,0x40
	ld	DE,0x5C
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ret

c_20D6DF	section	code abs=0x20D6DF

; [code] child task: MainMenuGraphics, SCROLL_PRIORITY 0 during MainMenuSplitOpen, 0x80 during MainMenuSplitClose, EndTask; started after a main menu / Config / load screen is drawn (MainMenuTransitionOut is the same with the priorities swapped)
; [play] seen in play: started by MainMenu, ConfigMenu and MainMenuLoadTask after their boxes are drawn; the closed door picture (SCR1) covers
; the screen, splits and slides apart to show the boxes on white, then slides back together behind the boxes (SCR2 in front)
MainMenuTransitionIn:
	calr	MainMenuGraphics
	set_scroll_priority	0
	ld	XHL,MainMenuSplitOpen
	call	StartChildTask
	task_wait
	set_scroll_priority	0x80
	ld	XHL,MainMenuSplitClose
	call	StartChildTask
	task_wait
	jp	EndTask

c_20D71E	section	code abs=0x20D71E

; [code] child task: MainMenuGraphics, SCROLL_PRIORITY 0x80 during MainMenuSplitOpen, 0 during MainMenuSplitClose, EndTask; started before leaving a main menu screen (MainMenuConfirm, MainMenuCancel, ...)
; [play] seen in play: started by MainMenuConfirm, ConfigMenu (B) and MainMenuLoadTask (B); the doors slide apart behind the boxes, then close in
; front of them and hide the screen; the next screen is drawn behind the closed doors (New Game goes on to Select Player with no TransitionIn)
MainMenuTransitionOut:
	calr	MainMenuGraphics
	set_scroll_priority	0x80
	ld	XHL,MainMenuSplitOpen
	call	StartChildTask
	task_wait
	set_scroll_priority	0
	ld	XHL,MainMenuSplitClose
	call	StartChildTask
	task_wait
	jp	EndTask

c_20D75D	section	code abs=0x20D75D

; [code] child task: TASK_ARG 1..0xA, one DrawMainMenuSplit per frame (the two halves move apart), then EndTask
; [play] seen in play: the two halves of the door picture slide off to the left and right, a step every 2-3 video frames
MainMenuSplitOpen:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),MainMenuSplitOpen.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenuSplitOpen.resume >> 16
MainMenuSplitOpen.resume:
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xB
	jp	NC,EndTask
	jr	DrawMainMenuSplit

c_20D77B	section	code abs=0x20D77B

; [code] child task: TASK_ARG 0xA..0, one DrawMainMenuSplit per frame (the two halves move back together), then EndTask
; [play] seen in play: the two door halves slide back together; started by the transition 25 frames after MainMenuSplitOpen
MainMenuSplitClose:
	ldw	(XIZ+TASK_ARG),0xB
	ldw	(XIZ+TASK_FUNC),MainMenuSplitClose.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenuSplitClose.resume >> 16
MainMenuSplitClose.resume:
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0
	jp	MI,EndTask
	jr	DrawMainMenuSplit

c_20D799	section	code abs=0x20D799

; [code] the two halves of the main menu background (+0x12 left, +0x16 right) for DrawMainMenuSplit: GateLeftPictureMonoMap / GateRightPictureMonoMap, colour GateLeftPictureMap / GateRightPictureMap
; [play] seen in play: a rusty brown metal door behind the main menu, Config and Load screens
MainMenuGraphics:
	cpb	(wColorFlags),0
	ld	XDE,GateLeftPictureMonoMap
	ld	XHL,GateRightPictureMonoMap
	jr	Z,MainMenuGraphics.skip
	ld	XDE,GateLeftPictureMap
	ld	XHL,GateRightPictureMap
MainMenuGraphics.skip:
	ld	(XIZ+0x12),XDE
	ld	(XIZ+0x16),XHL
	ret

c_20D7BB	section	code abs=0x20D7BB

; [code] DrawTilemap the parent's map +0x12 (tiles 0x161) at column -TASK_ARG and map +0x16 (tiles 0xB5) at column TASK_ARG + 0xA, then FillScrRect 0 over the 2 * TASK_ARG columns between them (none at TASK_ARG 0)
DrawMainMenuSplit:
	ld	WA,0x161
	ld	XHL,(XIY+0x12)
	ld	BC,(XIZ+TASK_ARG)
	neg	BC
	ld	DE,0
	call	DrawTilemap
	ld	WA,0xB5
	ld	XHL,(XIY+0x16)
	ld	BC,(XIZ+TASK_ARG)
	add	BC,0xA
	ld	DE,0
	call	DrawTilemap
	ld	C,0xA
	sub	C,(XIZ+TASK_ARG)
	cp	C,0xA
	ret	Z
	ld	E,0
	ld	B,(XIZ+TASK_ARG)
	sll	1,B
	ld	D,0x13
	ld	WA,0
	call	FillScrRect
	ret

c_20E2B0	section	code abs=0x20E2B0

; [code] title task: children TitleScreen and TitleBlinkTask, then TitleWaitA each frame
TitleTaskStart:
	ld	XHL,TitleScreen
	call	StartChildTask
	ld	XHL,TitleBlinkTask
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),TitleWaitA & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleWaitA >> 16
	ret

c_20E2CD	section	code abs=0x20E2CD

; [code] each frame: A pressed -> TitlePressedA; else TASK_ARG - 1, at 0 EndChildTasks + EndTask without the A mark
TitleWaitA:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	NZ,TitlePressedA
	decw	1,(XIZ+TASK_ARG)
	jr	Z,TitlePressedA.skip
	ret

c_20E2DC	section	code abs=0x20E2DC

; [code] parent task +0xE = 1 (A was pressed), EndChildTasks, EndTask
TitlePressedA:
	ldw	(XIY+0xE),1
TitlePressedA.skip:
	call	EndChildTasks
	call	EndTask
	ret

c_20E2EA	section	code abs=0x20E2EA

; [play] title_press_a_button, main_menu
TitleScreen:
	ldw	(XIZ+TASK_ARG),0xB4
	ldw	(XIZ+TASK_FUNC),TitleScreen.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleScreen.resume >> 16
TitleScreen.resume:
	decw	1,(XIZ+TASK_ARG)
	ret	NZ
	ldw	(XIZ+0x10),2
	ldw	(XIZ+TASK_FUNC),TitleScreen.resume2 & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleScreen.resume2 >> 16
TitleScreen.resume2:
	ld	XHL,TitleScreenFlashMap
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,TitleScreen.skip
	ld	XHL,TitleScreenFlashMonoMap
TitleScreen.skip:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_FUNC),TitleMapFlashStep & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleMapFlashStep >> 16
	ret

c_20E336	section	code abs=0x20E336

; [code] TitleScreen's step after the TitleScreenFlashMap frame (TASK_FUNC 0x20E336): DrawTilemapScr2 TitleScreenMap (mono TitleScreenMonoMap) at 0,2 tiles 0xE7, +0x10 - 1: not 0 -> back to TitleScreen.resume2 (the other map) the next frame, 0 -> TitleScreen (0xB4 frames wait); the two maps alternate frame by frame, twice, every 0xB4 frames [play] I39: TitleScreenFlashMap is the flash frame of the whole SCR2 title picture (robot white, logo pale with yellow lines), TitleScreenMap the normal one; flashed twice, every 187 frames.
TitleMapFlashStep:
	ld	XHL,TitleScreenMap
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,TitleMapFlashStep.skip
	ld	XHL,TitleScreenMonoMap
TitleMapFlashStep.skip:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	decw	1,(XIZ+0x10)
	jr	Z,TitleMapFlashStep.skip2
	ldw	(XIZ+TASK_FUNC),TitleScreen.resume2 & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleScreen.resume2 >> 16
	ret
TitleMapFlashStep.skip2:
	ldw	(XIZ+TASK_FUNC),TitleScreen & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleScreen >> 16
	ret

c_20E36F	section	code abs=0x20E36F

; [code] child task for 0x348 frames: DrawSpriteMap at x 0x18, y 0x58 of TitlePressAButtonMap, or TitlePressAButtonOffMap while bit 5 of the frame count is set (they alternate every 32 frames), then EndTask
; [play] seen in play: the blinking "PRESS A BUTTON" prompt under the UNITRON logo (TitlePressAButtonMap shown, TitlePressAButtonOffMap draws nothing), 32 frames
; on and 32 off, one DrawSpriteMap per frame; A ends it early (TitlePressedA, EndChildTasks) before the 0x348 limit
TitleBlinkTask:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),TitleBlinkTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleBlinkTask.resume >> 16
TitleBlinkTask.resume:
	cpw	(XIZ+TASK_ARG),0x348
	jp	Z,EndTask
	ld	XHL,TitlePressAButtonMap
	incw	1,(XIZ+TASK_ARG)
	ld	WA,(XIZ+TASK_ARG)
	srl	5,WA
	and	WA,1
	jr	Z,TitleBlinkTask.skip
	ld	XHL,TitlePressAButtonOffMap
TitleBlinkTask.skip:
	ld	WA,0xC
	ld	BC,0x18
	ld	DE,0x58
	call	DrawSpriteMap
	ret

c_21D5E9	section	code abs=0x21D5E9

; [code] child IntroBackground, task_wait, then resumes at MainMenuTask; StreetGameOver and the save code resume here
IntroThenMainMenu:
	ld	XHL,IntroBackground
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),MainMenuTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),MainMenuTask >> 16
	ret

c_21D60B	section	code abs=0x21D60B

; [code] ResetAllPalettes, MainMenuSetup child, then wMainMenuCursor 1 -> NewGameSetup (set by MainMenuNewGame, menu option 0), 2 -> LoadGameEnterWorks (MainMenuLoadTask incb after a load), else IntroThenMainMenu (IntroBackground, then back here); also the TASK_FUNC NewGameSetup returns to when wPlayerRace == 0
MainMenuTask:
	call	ResetAllPalettes
	ld	XHL,MainMenuSetup
	call	StartChildTask
	task_wait
	cpb	(wMainMenuCursor),1
	ld	XHL,NewGameSetup
	jr	Z,MainMenuTask.skip
	cpb	(wMainMenuCursor),2
	ld	XHL,LoadGameEnterWorks
	jr	Z,MainMenuTask.skip
	ld	XHL,IntroThenMainMenu
MainMenuTask.skip:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_21D738	section	code abs=0x21D738

; [code] MainMenuTask with wMainMenuCursor 2 (after a load): wEnemyAffinity = wUnitAffinity, RunWorksScreen mode 2, CalcUnitStats, wStreetMenuChoice 0, resume at StreetTask (0x21D758)
LoadGameEnterWorks:
	ldw	(wEnemyAffinity),(wUnitAffinity)
	ld	A,WORKS_MODE_LOADED_GAME
	call	RunWorksScreen
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),StreetTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StreetTask >> 16
	ret
