; engine/menus/works/data.asm: Works > Data: Save / Load menu and tasks

c_20DCA0	section	code abs=0x20DCA0

; [code+play] Works > Data > Load: slot list, confirm, LoadGameSlot copies the slot into wPlayerName..
WorksLoadTask:
	calr	InitLoadSlotList
	ldw	(XIZ+TASK_FUNC),WorksLoadTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WorksLoadTask.resume >> 16
WorksLoadTask.resume:
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jp	Z,EndTask
	calr	ShowSaveConfirmBox
	ld	XHL,YesNoPromptTask
	call	StartChildTask
	task_wait
	cpb	(wYesNoChoice),1
	jr	Z,WorksLoadTask.skip
	calr	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),WorksLoadTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WorksLoadTask.resume >> 16
	ret
WorksLoadTask.skip:
	ld	A,(wSaveSlot)
	call	LoadGameSlot
	calr	ShowSaveDoneBox
	ld	XHL,Wait30FramesTask
	call	StartChildTask
	task_wait
	call	EndTask
	ret

c_20DD24	section	code abs=0x20DD24

; [code] child of RunWorksSaveTask: wSaveMenuMode = 1, wSaveSlot = 1, DrawSaveSlotList, SaveSlotSelectTask; slot 0 -> EndTask; ShowSaveConfirmBox + YesNoPromptTask, Yes -> SaveGameSlot, ShowSaveDoneBox, Wait30FramesTask; [play] works_data_save* screens
WorksSaveTask:
	ldb	(wSaveMenuMode),SAVE_MENU_SAVE
	ldb	(wSaveSlot),1
	call	ClearScr2Tilemap
	calr	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),WorksSaveTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WorksSaveTask.resume >> 16
WorksSaveTask.resume:
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jp	Z,EndTask
	calr	ShowSaveConfirmBox
	ld	XHL,YesNoPromptTask
	call	StartChildTask
	task_wait
	cpb	(wYesNoChoice),1
	jr	Z,WorksSaveTask.skip
	calr	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),WorksSaveTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WorksSaveTask.resume >> 16
	ret
WorksSaveTask.skip:
	ld	A,(wSaveSlot)
	call	SaveGameSlot
	calr	ShowSaveDoneBox
	ld	XHL,Wait30FramesTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),WorksSaveTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WorksSaveTask >> 16
	ret

c_217E28	section	code abs=0x217E28

; [code] menu box table: "Save" (0), "Load" (1), "Exit" (0xFF) at MenuLines_217E0D; caller WorksDataMenu
SetupDataMenu:
	ld	A,3
	ld	(wMenuCount),A
	ld	A,3
	ld	(wMenuTextCount),A
	ld	XHL,MenuLines_217E0D
	ld	(wMenuTexts),XHL
	ld	XHL,MenuCursor_217E1F
	ld	(wMenuCells),XHL
	ld	XHL,MenuResults_217E25
	ld	(wMenuValues),XHL
	jp	MenuReset

c_219E5F	section	code abs=0x219E5F

; [code] Works menu value 2 "Data": YouWantToEditText, SetupDataMenu: Save -> RunWorksSaveTask, Load -> RunWorksLoadTask (back to WorksMainMenu when wSaveSlot != 0); [play] its first instruction ran on works_data_save_* screens
WorksDataMenu:
	ld	XHL,YouWantToEditText
	ld	XDE,YouWantToEditText
	call	ShowPartnerGenderText
	call	Wait30Frames
WorksDataMenu.loop:
	call	SetupDataMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,DoYouWantToText2
	ld	XDE,DoYouWantToText2
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksDataMenu.skip3
	cp	A,0
	jr	Z,WorksDataMenu.skip
	cp	A,1
	jr	Z,WorksDataMenu.skip2
	jp	WorksDataMenu.skip3
WorksDataMenu.skip:
	call	ClearPictureHideCursor
	ldb	(wWorksDataDone),0
	ld	XHL,RunWorksSaveTask
	call	StartChildTask
WorksDataMenu.loop2:
	call	TaskYield
	cpb	(wWorksDataDone),0
	jr	Z,WorksDataMenu.loop2
	call	ReopenWorksBoxes
	call	DrawWorksPortraits
	jp	WorksDataMenu.loop
WorksDataMenu.skip2:
	call	ClearPictureHideCursor
	ldb	(wWorksDataDone),0
	ld	XHL,RunWorksLoadTask
	call	StartChildTask
WorksDataMenu.loop3:
	call	TaskYield
	cpb	(wWorksDataDone),0
	jr	Z,WorksDataMenu.loop3
	call	ReopenWorksBoxes
	call	DrawWorksPortraits
	ld	A,(wSaveSlot)
	or	A,A
	jp	NZ,WorksMainMenu
	jp	WorksDataMenu.loop
WorksDataMenu.skip3:
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	WorksMainMenu

c_219F1D	section	code abs=0x219F1D

; [code] child WorksSaveTask (0x5DF5 = 1 Save, slot list, SaveGameSlot) with args 0x7E/8, task_wait, then wWorksDataDone = 1 (polled by WorksDataMenu, Data menu choice 0), EndTask
RunWorksSaveTask:
	ld	XHL,WorksSaveTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x7E
	ldw	(XHL+0x10),8
	task_wait
	ldb	(wWorksDataDone),1
	call	EndTask
	ret

c_219F48	section	code abs=0x219F48

; [code] child WorksLoadTask (slot list, LoadGameSlot) with args 0x7E / 8, task_wait, then wWorksDataDone = 1 (polled by WorksDataMenu), EndTask: the Load counterpart of RunWorksSaveTask; [play] runs after Works > Data > Load Ok
RunWorksLoadTask:
	ld	XHL,WorksLoadTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x7E
	ldw	(XHL+0x10),8
	task_wait
	ldb	(wWorksDataDone),1
	call	EndTask
	ret

c_219F73	section	code abs=0x219F73

; [code] ClearPictureAndTilemaps + HideCursor, nothing else; callers the Data menu's Save and Load paths (WorksDataMenu) before RunWorksSaveTask / RunWorksLoadTask (was misnamed WorksHelpMenu: the Help entry is the routine after it)
ClearPictureHideCursor:
	call	ClearPictureAndTilemaps
	call	HideCursor
	ret
