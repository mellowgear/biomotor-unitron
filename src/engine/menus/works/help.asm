; engine/menus/works/help.asm: Works > Help: help menu and help page viewer task

c_219F7C	section	code abs=0x219F7C

; [code] Works menu value 6 "Help": OpeningHelpFilesText, HideMenuClearPicture, RunHelpViewerTask (waits for wHelpDone), FinishedText, WorksMainMenu; [play] help_p* screens
WorksHelpMenu:
	ld	XHL,OpeningHelpFilesText
	ld	XDE,OpeningHelpFilesText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideMenuClearPicture
	ldb	(wHelpDone),0
	ld	XHL,RunHelpViewerTask
	call	StartChildTask
WorksHelpMenu.loop:
	call	TaskYield
	cpb	(wHelpDone),0
	jr	Z,WorksHelpMenu.loop
	call	ReopenWorksBoxes
	call	DrawWorksPortraits
	call	DrawGP
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	WorksMainMenu

c_219FCD	section	code abs=0x219FCD

; [code] after OpeningHelpFilesText (WorksHelpMenu): child HelpViewerTask (draws pages from pointer table 0x25E6B7 by TASK_ARG: "UNITRON Status", "Affinities 1" ...), task_wait, wHelpDone = 1 (polled by WorksHelpMenu), EndTask; [play] help_p* screens
RunHelpViewerTask:
	ld	XHL,HelpViewerTask
	call	StartChildTask
	ldw	(XHL+0xE),0x7E
	ldw	(XHL+0x10),8
	task_wait
	ldb	(wHelpDone),1
	call	EndTask
	ret

c_219FF8	section	code abs=0x219FF8

; [code] HideMenuCursor + ClearPictureAndTilemaps + HideCursor, nothing else; caller WorksHelpMenu before RunHelpViewerTask (was misnamed WorksTradeMenu)
HideMenuClearPicture:
	call	HideMenuCursor
	call	ClearPictureAndTilemaps
	call	HideCursor
	ret

c_21D509	section	code abs=0x21D509

; [code] child of RunHelpViewerTask: ClearTilemaps, InitTextBoxes, opens and places box (XIZ+0x10), page TASK_ARG = 0, resumes at HelpViewerInput (0x21D538), DrawHelpPage; [play] help_p01_unitron_status
HelpViewerTask:
	call	ClearTilemaps
	call	InitTextBoxes
	ld	A,(XIZ+0x10)
	ld	C,0x14
	ld	E,0x13
	ld	HL,(XIZ+TASK_ARG)
	call	OpenTextBox
	ld	C,0
	ld	E,0
	call	PlaceTextBoxXWA
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),HelpViewerInput & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),HelpViewerInput >> 16
	jr	DrawHelpPage

c_21D538	section	code abs=0x21D538

; [code] HelpViewerTask's resume step: blinks two sprite arrows (DrawSpriteGrid every 16 frames), B ends the task (EndTask), Left / Right page - 1 / + 1 (wraps 0-9), then DrawHelpPage; [play] help_p01 .. help_p10 screens
HelpViewerInput:
	incw	1,(XIZ+0x2A)
	ld	WA,(XIZ+0x2A)
	and	WA,0x10
	jr	Z,HelpViewerInput.skip
	ld	BC,0
	ld	DE,4
	ld	WA,0xBE04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ld	BC,0x98
	ld	DE,4
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
HelpViewerInput.skip:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	NZ,loc_21D5C0
	ld	A,(wJoyPressed)
	and	A,D_LEFT|D_RIGHT
	ret	Z
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,HelpViewerInput.skip2
	decw	1,(XIZ+TASK_ARG)
	jr	HelpViewerInput.skip3
HelpViewerInput.skip2:
	incw	1,(XIZ+TASK_ARG)
HelpViewerInput.skip3:
	ld	WA,(XIZ+TASK_ARG)
	cp	WA,0xFFFF
	jr	GT,HelpViewerInput.skip4
	ldw	(XIZ+TASK_ARG),9
	jr	DrawHelpPage
HelpViewerInput.skip4:
	ld	WA,(XIZ+TASK_ARG)
	cp	WA,0xA
	jr	LT,DrawHelpPage
	ldw	(XIZ+TASK_ARG),0

c_21D5A8	section	code abs=0x21D5A8

; [code] DrawBoxString HelpPages[TASK_ARG] into box (XIZ+0x10)
DrawHelpPage:
	ld	HL,(XIZ+TASK_ARG)
	extz	XHL
	sll	2,XHL
	add	XHL,HelpPages
	ld	XHL,(XHL)
	ld	A,(XIZ+0x10)
	call	DrawBoxString
	ret

c_21D5C0	section	code abs=0x21D5C0

loc_21D5C0:
	call	EndTask
	ret
