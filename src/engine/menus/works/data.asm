; engine/menus/works/data.asm: Works > Data: Save / Load menu and tasks

c_20DCA0	section	code abs=0x20DCA0

; Task, Works > Data > Load: pick a used slot (B ends with wSaveSlot 0), confirm, LoadGameSlot and "Load Complete"; No returns to the list [code][play]
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

; Task, Works > Data > Save: pick a slot, confirm ("Over" on a used one), SaveGameSlot and "Save Complete", then the list again until B [code][play]
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

; Menu tables for Save (0) / Load (1) / Exit (0xFF) [code]
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

; Works menu value 2 "Data": runs Save or Load as a child and redraws the Works screen; a finished load goes back to
; WorksMainMenu, Exit says "Finished" [code][play]
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

; Task: runs WorksSaveTask (box 8, tiles 0x7E), then sets wWorksDataDone for WorksDataMenu [code]
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

; Task: runs WorksLoadTask (box 8, tiles 0x7E), then sets wWorksDataDone for WorksDataMenu [code]
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

; Clears the picture and tilemaps and hides the cursor before the save or load list [code]
ClearPictureHideCursor:
	call	ClearPictureAndTilemaps
	call	HideCursor
	ret
