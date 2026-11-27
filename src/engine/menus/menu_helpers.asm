; engine/menus/menu_helpers.asm: menu task framework: message task and waits, AskYesNo, cursor task, menu box task, list task and their post/wait commands, EndMenuTask

c_217583	section	code abs=0x217583

; [code] zeroes wCursorVisible, wCursorBox, wCursorCol, wCursorRow, wCursorBlink, StartChildTask CursorTask, handle in 0x6108
StartCursorTask:
	xor	A,A
	ld	(wCursorVisible),A
	ld	(wCursorBox),A
	ld	(wCursorCol),A
	ld	(wCursorRow),A
	ld	(wCursorBlink),A
	ld	XHL,CursorTask
	call	StartChildTask
	ld	(wCursorTask),XHL
	ret

c_2175A7	section	code abs=0x2175A7

; [code] ret; EndMenuTask calls it among its empty cleanup stubs, in reverse of the order WorksScreenTask starts things: this one stands for StartCursorTask (the routine just before it in ROM)
CursorTaskCleanup:
	ret

c_2175A8	section	code abs=0x2175A8

; [code] wCursorVisible = 1
ShowCursor:
	ld	A,1
	ld	(wCursorVisible),A
	ret

c_2175AF	section	code abs=0x2175AF

; [code] wCursorVisible = 0
HideCursor:
	xor	A,A
	ld	(wCursorVisible),A
	ret

c_2175B6	section	code abs=0x2175B6

; [code] wCursorBox = A (the text box CursorTask draws the cursor in)
SetCursorBox:
	ld	(wCursorBox),A
	ret

c_2175BB	section	code abs=0x2175BB

; [code] wCursorCol = B, wCursorRow = C (cell in wCursorBox)
SetCursorPos:
	ld	(wCursorCol),B
	ld	(wCursorRow),C
	ret

c_2175C4	section	code abs=0x2175C4

; [code] child task: wCursorBlink += 1; when bit 4 of it is clear and wCursorVisible is set, DrawBoxCursorSprite(wCursorBox, wCursorCol, wCursorRow): the blinking list cursor
CursorTask:
	ld	XWA,CursorTask.resume
	ld	(XIZ+TASK_FUNC),XWA
CursorTask.resume:
	ld	XWA,CursorTask.resume2
	ld	(XIZ+TASK_FUNC),XWA
CursorTask.resume2:
	incb	1,(wCursorBlink)
	ld	A,(wCursorBlink)
	srl	5,A
	ret	C
	ld	A,(wCursorVisible)
	or	A,A
	ret	Z
	ld	A,(wCursorBox)
	ld	B,(wCursorCol)
	ld	C,(wCursorRow)
	call	DrawBoxCursorSprite
	ret

c_2175FA	section	code abs=0x2175FA

swp_2175FA:
	ld	XWA,swp_2175FA.done
	ld	(XIZ+TASK_FUNC),XWA
swp_2175FA.done:
	ret

c_217603	section	code abs=0x217603

; [code] wMsgBox, wUnk6116, wMsgFastForward = 0, StartChildTask MessageTask, handle in 0x6111
StartMessageTask:
	xor	A,A
	ld	(wMsgBox),A
	ld	(wUnk6116),A
	ld	(wMsgFastForward),A
	ld	XHL,MessageTask
	call	StartChildTask
	ld	(wMsgTask),XHL
	ret

c_21761F	section	code abs=0x21761F

; [code] ret; EndMenuTask calls it among its empty cleanup stubs, in reverse of the order WorksScreenTask starts things: this one stands for StartMessageTask (the routine just before it in ROM)
MessageTaskCleanup:
	ret

c_217620	section	code abs=0x217620

; [code] wMsgBox = A (the box the message task MessageTask prints in)
SetMessageBox:
	ld	(wMsgBox),A
	ret

c_217625	section	code abs=0x217625

; [code] wMsgSpeed = A (MessageTask copies it to the box speed when a message starts and after each button wait)
SetMessageSpeed:
	ld	(wMsgSpeed),A
	ret

c_21762A	section	code abs=0x21762A

; [code] wMsgFastForward = 1 and wMsgPending = XHL (its entry +5, 0x21762F, queues without the flag: AskYesNo)
ShowMessageFast:
	ldb	(wMsgFastForward),1
; [code] wMsgPending = XHL without the fast-forward flag (entry +5 of ShowMessageFast); MessageTask starts it; callers AskYesNo, ShowMenuText
QueueMessage:
	ld	(wMsgPending),XHL
	ret

c_217634	section	code abs=0x217634

; [code] yields (TaskYield) until wMsgPending is empty and wMsgBox is not printing, then returns to the caller's return address (kept in wWaitMessageReturn)
WaitMessage:
	pop	XHL
	ld	(wWaitMessageReturn),XHL
WaitMessage.loop:
	ld	XHL,(wMsgPending)
	or	XHL,XHL
	jr	NZ,WaitMessage.skip
	ld	A,(wMsgBox)
	call	IsTextBoxPrinting
	jr	NC,WaitMessage.skip2
WaitMessage.skip:
	call	TaskYield
	jr	WaitMessage.loop
WaitMessage.skip2:
	ld	XHL,(wWaitMessageReturn)
	jp	XHL

c_217657	section	code abs=0x217657

; [code] WaitMessage with wMsgFastForward = 1 while waiting (the page prints at once), cleared after; return address in wFlushMessageReturn
FlushMessage:
	pop	XHL
	ld	(wFlushMessageReturn),XHL
	ldb	(wMsgFastForward),1
FlushMessage.loop:
	ld	XHL,(wMsgPending)
	or	XHL,XHL
	jr	NZ,FlushMessage.skip
	ld	A,(wMsgBox)
	call	IsTextBoxPrinting
	jr	NC,FlushMessage.skip2
FlushMessage.skip:
	call	TaskYield
	jr	FlushMessage.loop
FlushMessage.skip2:
	ldb	(wMsgFastForward),0
	ld	XHL,(wFlushMessageReturn)
	jp	XHL

c_217684	section	code abs=0x217684

; [code] ResetTextBox(wMsgBox), FlushMessage, ClearTextBoxHome(wMsgBox)
ClearMessageBox:
	ld	A,(wMsgBox)
	call	ResetTextBox
	call	FlushMessage
	ld	A,(wMsgBox)
	call	ClearTextBoxHome
	ret

c_217699	section	code abs=0x217699

; [code] PrintStringAt with box wMsgBox (B column, C row, XHL string)
PrintInMessageBox:
	ld	A,(wMsgBox)
	call	PrintStringAt
	ret

c_2176A2	section	code abs=0x2176A2

; [code] draws "Yes No" (YesNoText2: 39 05 13 .. 2E 0F), cursor columns AskYesNoCursorColumns (4, 0xA); L -> 0, R -> 1; A returns wYesNoAnswer (0 Yes, 1 No), B returns 0xFF, back to the saved return address; [play] *_are_you_sure screens
AskYesNo:
	ld	(wYesNoPrompt),XHL
	pop	XHL
	ld	(wMenuWaitReturn),XHL
	call	ClearMessageBox
	ld	XHL,(wYesNoPrompt)
	call	QueueMessage
	call	WaitMessage
	ld	XHL,YesNoText2
	ld	BC,0x402
	call	PrintInMessageBox
	ld	A,(wMsgBox)
	call	SetCursorBox
	call	ShowCursor
	xor	A,A
	ld	(wYesNoAnswer),A
AskYesNo.loop:
	ld	XHL,AskYesNoCursorColumns
	ld	B,(XHL+A)
	ld	C,2
	call	SetCursorPos
AskYesNo.loop2:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,AskYesNo.skip4
	bit	5,A
	jr	NZ,AskYesNo.skip5
	bit	2,A
	jr	NZ,AskYesNo.skip
	bit	3,A
	jr	NZ,AskYesNo.skip2
	jr	AskYesNo.loop2
AskYesNo.skip:
	ld	A,0
	jr	AskYesNo.skip3
AskYesNo.skip2:
	ld	A,1
AskYesNo.skip3:
	cp	(wYesNoAnswer),A
	jr	Z,AskYesNo.loop2
	ld	(wYesNoAnswer),A
	ld	WA,SFX_CURSOR
	call	CallSoundCommand
	ld	A,(wYesNoAnswer)
	jr	AskYesNo.loop
AskYesNo.skip4:
	ld	WA,SFX_CONFIRM
	call	CallSoundCommand
	ld	A,(wYesNoAnswer)
	jr	AskYesNo.skip6
AskYesNo.skip5:
	ld	WA,SFX_CANCEL
	call	CallSoundCommand
	ld	A,0xFF
AskYesNo.skip6:
	ld	(wYesNoAnswer),A
	call	HideCursor
	ld	A,(wYesNoAnswer)
	ld	XHL,(wMenuWaitReturn)
	jp	XHL
YesNoText2:
	db	0x39,0x05,0x13,0x00,0x00,0x00,0x2E,0x0F,0xFF	; "Yes   No"
AskYesNoCursorColumns:
	db	0x04,0x0A

c_217757	section	code abs=0x217757

; [code] coroutine (return address in wMenuWaitReturn): TaskYield until A (A = 0) or B (A = 0xFF) is pressed, then returns; caller WorksDevelopMenu after the develop result
WaitAOrB:
	pop	XHL
	ld	(wMenuWaitReturn),XHL
WaitAOrB.loop:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,WaitAOrB.skip
	bit	5,A
	jr	NZ,WaitAOrB.skip2
	jr	WaitAOrB.loop
WaitAOrB.skip:
	ld	A,0
	jr	WaitAOrB.skip3
WaitAOrB.skip2:
	ld	A,0xFF
WaitAOrB.skip3:
	ld	XHL,(wMenuWaitReturn)
	jp	XHL

c_21777C	section	code abs=0x21777C

; [code] waits A frames (TaskYield each, count in wWaitFrameCount) or until A or B is pressed, then returns to the saved return address (wMenuWaitReturn)
WaitFramesOrButton:
	pop	XHL
	ld	(wMenuWaitReturn),XHL
WaitFramesOrButton.loop:
	or	A,A
	jr	Z,WaitFramesOrButton.skip
	dec	1,A
	ld	(wWaitFrameCount),A
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,WaitFramesOrButton.skip
	bit	5,A
	jr	NZ,WaitFramesOrButton.skip
	call	TaskYield
	ld	A,(wWaitFrameCount)
	jr	WaitFramesOrButton.loop
WaitFramesOrButton.skip:
	ld	XHL,(wMenuWaitReturn)
	jp	XHL

c_2177A9	section	code abs=0x2177A9

; [code] child task: when the box wMsgBox is idle and wMsgPending is set, starts it (SetTextBoxText, speed wMsgSpeed) and clears wMsgPending; while printing, A or B (not the press that ended a button wait, wMsgWaitPressed) or wMsgFastForward set the box speed 0 (rest of the page at once); at a button wait the speed returns to wMsgSpeed
MessageTask:
	ld	XWA,MessageTask.resume
	ld	(XIZ+TASK_FUNC),XWA
MessageTask.resume:
	ld	XWA,MessageTask.resume2
	ld	(XIZ+TASK_FUNC),XWA
MessageTask.resume2:
	ld	A,(wMsgBox)
	call	IsTextBoxPrinting
	jr	NC,MessageTask.skip5
	ld	A,(wMsgBox)
	call	IsTextBoxWaitingButton
	jr	NC,MessageTask.skip
	ldb	(wMsgWaitPressed),1
	ld	B,(wMsgSpeed)
	ld	A,(wMsgBox)
	call	SetTextBoxSpeed
MessageTask.skip:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,MessageTask.skip2
	bit	5,A
	jr	NZ,MessageTask.skip2
	jr	MessageTask.skip3
MessageTask.skip2:
	cpb	(wMsgWaitPressed),0
	jr	Z,MessageTask.skip4
	ldb	(wMsgWaitPressed),0
MessageTask.skip3:
	cpb	(wMsgFastForward),0
	jr	Z,MessageTask.done
MessageTask.skip4:
	ldb	(wMsgFastForward),0
	ld	B,0
	ld	A,(wMsgBox)
	call	SetTextBoxSpeed
MessageTask.done:
	ret
MessageTask.skip5:
	ld	XHL,(wMsgPending)
	or	XHL,XHL
	ret	Z
	ldb	(wMsgWaitPressed),0
	ld	XHL,(wMsgPending)
	ld	A,(wMsgBox)
	call	SetTextBoxText
	ld	B,(wMsgSpeed)
	ld	A,(wMsgBox)
	call	SetTextBoxSpeed
	xor	XHL,XHL
	ld	(wMsgPending),XHL
	ret

c_21783D	section	code abs=0x21783D

swp_21783D:
	ld	XWA,swp_21783D.done
	ld	(XIZ+TASK_FUNC),XWA
swp_21783D.done:
	ret

c_217846	section	code abs=0x217846

; [code] wBox2Command = wBox2Result = 0, StartChildTask Box2Task; WorksScreenTask calls it between StartMessageTask and StartMenuBoxTask
StartBox2Task:
	xor	WA,WA
	ld	(wBox2Command),WA
	ld	(wBox2Result),WA
	ld	XHL,Box2Task
	call	StartChildTask
	ret

c_21785A	section	code abs=0x21785A

; [code] ret; EndMenuTask calls it among its empty cleanup stubs, in reverse of the order WorksScreenTask starts things: this one stands for StartBox2Task (the routine just before it in ROM)
Box2TaskCleanup:
	ret

c_21785B	section	code abs=0x21785B

; [code] wBox2Command = 0xFF00 | A, return address to wBox2Return, wBox2Result = 0, TaskYield until Box2Task posts a result, then WA = wBox2Result and back to the caller; Box2Open etc. jump here with A = 1..5
Box2CommandWait:
	ld	W,0xFF
	ld	(wBox2Command),WA
	pop	XHL
	ld	(wBox2Return),XHL
	xor	WA,WA
	ld	(wBox2Result),WA
Box2CommandWait.loop:
	ld	WA,(wBox2Result)
	or	WA,WA
	jr	NZ,Box2CommandWait.skip
	call	TaskYield
	jr	Box2CommandWait.loop
Box2CommandWait.skip:
	call	TaskYield
	ld	WA,(wBox2Result)
	ld	XHL,(wBox2Return)
	jp	XHL

c_217888	section	code abs=0x217888

; [code] Box2Task command 1 (Box2CmdOpen) through Box2CommandWait
Box2Open:
	ld	A,1
	jp	Box2CommandWait

c_21788E	section	code abs=0x21788E

; [code] Box2Task command 2 (Box2CmdNop) through Box2CommandWait; no caller found
Box2Nop:
	ld	A,2
	jp	Box2CommandWait

c_217894	section	code abs=0x217894

; [code] Box2Task command 3 (Box2CmdClearPlace) through Box2CommandWait
Box2ClearPlace:
	ld	A,3
	jp	Box2CommandWait

c_21789A	section	code abs=0x21789A

; [code] Box2Task command 4 (Box2CmdSetFlag) through Box2CommandWait
Box2SetFlag:
	ld	A,4
	jp	Box2CommandWait

c_2178A0	section	code abs=0x2178A0

; [code] Box2Task command 5 (Box2CmdClearFlag) through Box2CommandWait; no caller found
Box2ClearFlag:
	ld	A,5
	jp	Box2CommandWait

c_2178A6	section	code abs=0x2178A6

; [code] child task (StartBox2Task): byte wBox2Command 0-5 -> jump table Box2CommandJumps (0 = idle: TaskYield; 1 Box2CmdOpen, 2 Box2CmdNop, 3 Box2CmdClearPlace, 4 Box2CmdSetFlag, 5 Box2CmdClearFlag); every handler jumps back to Box2Task.loop with A = 0: wBox2Command = 0, wBox2Result = 0xFF00 | A
Box2Task:
	ld	A,(wBox2Command)
	cp	A,6
	jr	NC,Box2Task.skip
	ld	XHL,Box2CommandJumps
	sll	2,A
	ld	XHL,(XHL+A)
	jp	XHL
Box2CommandJumps:
	dl	Box2Task.idle,Box2CmdOpen,Box2CmdNop,Box2CmdClearPlace
	dl	Box2CmdSetFlag,Box2CmdClearFlag
Box2Task.skip:
	ld	WA,0xFFFF
Box2Task.loop:
	ldw	(wBox2Command),0
	ld	W,0xFF
	ld	(wBox2Result),WA
Box2Task.idle:
	call	TaskYield
	jp	Box2Task

c_2178EC	section	code abs=0x2178EC

; [code] Box2Task command 1: OpenTextBox 2 (8 x 0xB, tiles from 0x42), wBox2Flag = 0
Box2CmdOpen:
	ld	A,2
	ld	C,8
	ld	E,0xB
	ld	HL,0x42
	call	OpenTextBox
	xor	A,A
	ld	(wBox2Flag),A
	xor	A,A
	jp	Box2Task.loop

c_217905	section	code abs=0x217905

; [code] Box2Task command 2: does nothing (A = 0)
Box2CmdNop:
	xor	A,A
	jp	Box2Task.loop

c_21790B	section	code abs=0x21790B

; [code] Box2Task command 3: ClearTextBox 2, PlaceTextBox 2 at column 0xC, row 0x20
Box2CmdClearPlace:
	ld	A,2
	call	ClearTextBox
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	xor	A,A
	jp	Box2Task.loop

c_217921	section	code abs=0x217921

; [code] Box2Task command 4: wBox2Flag = 1
Box2CmdSetFlag:
	ld	A,(wBox2Flag)
	or	A,A
	jr	NZ,Box2CmdSetFlag.skip
	ld	A,1
	ld	(wBox2Flag),A
Box2CmdSetFlag.skip:
	xor	A,A
	jp	Box2Task.loop

c_217935	section	code abs=0x217935

; [code] Box2Task command 5: wBox2Flag = 0
Box2CmdClearFlag:
	ld	A,(wBox2Flag)
	or	A,A
	jr	Z,Box2CmdClearFlag.skip
	xor	A,A
	ld	(wBox2Flag),A
Box2CmdClearFlag.skip:
	xor	A,A
	jp	Box2Task.loop

c_217949	section	code abs=0x217949

; [code] wMenuCommand, wMenuResult = 0, StartChildTask MenuBoxTask
StartMenuBoxTask:
	xor	XWA,XWA
	ld	(wMenuCommand),XWA
	ld	(wMenuResult),XWA
	ld	XHL,MenuBoxTask
	call	StartChildTask
	ret

c_21795D	section	code abs=0x21795D

; [code] ret; EndMenuTask calls it among its empty cleanup stubs, in reverse of the order WorksScreenTask starts things: this one stands for StartMenuBoxTask (the routine just before it in ROM)
MenuBoxTaskCleanup:
	ret

c_21795E	section	code abs=0x21795E

; [code] XWA = wMenuResult, Z when MenuBoxTask has not posted one
GetMenuResult:
	ld	XWA,(wMenuResult)
	or	XWA,XWA
	ret

c_217965	section	code abs=0x217965

; [code] wMenuCommand = A, wMenuResult = 0, no wait (MenuCommandWait without the wait)
PostMenuCommand:
	ld	(wMenuCommand),A
	xor	XWA,XWA
	ld	(wMenuResult),XWA
	ret

c_217970	section	code abs=0x217970

; [code] PostMenuCommand 1 (no wait)
PostMenuReset:
	ld	A,1
	jp	PostMenuCommand

c_217976	section	code abs=0x217976

; [code] PostMenuCommand 2 (no wait)
PostMenuEnd:
	ld	A,2
	jp	PostMenuCommand

c_21797C	section	code abs=0x21797C

; [code] PostMenuCommand 3 (no wait)
PostDrawMenuBox:
	ld	A,3
	jp	PostMenuCommand

c_217982	section	code abs=0x217982

; [code] PostMenuCommand 4 (no wait; the caller polls GetMenuResult)
PostMenuInput:
	ld	A,4
	jp	PostMenuCommand

c_217988	section	code abs=0x217988

; [code] PostMenuCommand 5 (no wait)
PostShowMenuCursor:
	ld	A,5
	jp	PostMenuCommand

c_21798E	section	code abs=0x21798E

; [code] PostMenuCommand 6 (no wait)
PostHideMenuCursor:
	ld	A,6
	jp	PostMenuCommand

c_217994	section	code abs=0x217994

; [code] TaskYield until wMenuResult is set, XWA = it, back to the saved return address wMenuCmdReturn (no command posted)
WaitMenuResult:
	pop	XHL
	ld	(wMenuCmdReturn),XHL
WaitMenuResult.loop:
	ld	XWA,(wMenuResult)
	or	XWA,XWA
	jr	NZ,WaitMenuResult.skip
	call	TaskYield
	jr	WaitMenuResult.loop
WaitMenuResult.skip:
	call	TaskYield
	ld	XWA,(wMenuResult)
	ld	XHL,(wMenuCmdReturn)
	jp	XHL

c_2179B5	section	code abs=0x2179B5

; [code] wMenuCommand = A, wMenuResult = 0, TaskYield until MenuBoxTask posts a result, XWA = wMenuResult, back to the caller's return address (wMenuCmdReturn); DrawMenuBox / RunMenuInput / ShowMenuCursor are its commands 3-5
MenuCommandWait:
	ld	(wMenuCommand),A
	pop	XHL
	ld	(wMenuCmdReturn),XHL
	xor	XWA,XWA
	ld	(wMenuResult),XWA
MenuCommandWait.loop:
	ld	XWA,(wMenuResult)
	or	XWA,XWA
	jr	NZ,MenuCommandWait.skip
	call	TaskYield
	jr	MenuCommandWait.loop
MenuCommandWait.skip:
	call	TaskYield
	ld	XWA,(wMenuResult)
	ld	XHL,(wMenuCmdReturn)
	jp	XHL

c_2179E0	section	code abs=0x2179E0

; [code] menu command 1 (MenuCommandWait): handler MenuCmdReset; the Setup*Menu table setters end with it
MenuReset:
	ld	A,1
	jp	MenuCommandWait

c_2179E6	section	code abs=0x2179E6

; [code] menu command 2 (MenuCommandWait): handler MenuCmdEnd ends the menu task
MenuEnd:
	ld	A,2
	jp	MenuCommandWait

c_2179EC	section	code abs=0x2179EC

; [code] menu command 3 (0x6146, waits for 0x613E): handler MenuCmdDrawBox clears/places box 2 (col 0xC, row 0x20) and draws the 0x614B entries from 0x614C (PrintStringTable)
DrawMenuBox:
	ld	A,3
	jp	MenuCommandWait

c_2179F2	section	code abs=0x2179F2

; [code] menu command 4 (waits): handler 0x217AC0 = U/D wrap of cursor 0x6139 over 0x614A rows, A -> byte (wMenuValues)[cursor], B -> 0xFF, stored in wMenuChoice (callers read wMenuChoice)
RunMenuInput:
	ld	A,4
	jp	MenuCommandWait

c_2179F8	section	code abs=0x2179F8

; [code] menu command 5 (waits): handler MenuCmdShowCursor sets wCursorVisible (ShowCursor) and the cursor position (MenuSetCursorPos), 0x613D = 1; command 6 (HideMenuCursor -> MenuCmdHideCursor) turns it off
ShowMenuCursor:
	ld	A,5
	jp	MenuCommandWait

c_2179FE	section	code abs=0x2179FE

; [code] menu command 6 (MenuCommandWait): handler MenuCmdHideCursor
HideMenuCursor:
	ld	A,6
	jp	MenuCommandWait

c_217A04	section	code abs=0x217A04

; [code] child task: wMenuChoice, wMenuChoiceMade, wMenuCursorOn = 0, then MenuBoxDispatch
MenuBoxTask:
	xor	A,A
	ld	(wMenuChoice),A
	ld	(wMenuChoiceMade),A
	ld	(wMenuCursorOn),A

c_217A12	section	code abs=0x217A12

; [code] runs handler wMenuCommand (< 8) of the table at MenuCommandJumps (0 / 7 idle, 1 MenuCmdReset, 2 MenuCmdEnd, 3 MenuCmdDrawBox, 4 menu input at 0x217AC0, 5 MenuCmdShowCursor, 6 MenuCmdHideCursor); bad command -> result 0xFFFFFFFF; handlers end at MenuBoxDispatch.loop (result, command 0)
MenuBoxDispatch:
	ld	A,(wMenuCommand)
	cp	A,8
	jr	NC,MenuBoxDispatch.skip
	ld	XHL,MenuCommandJumps
	sll	2,A
	ld	XHL,(XHL+A)
	jp	XHL
MenuCommandJumps:
	dl	MenuBoxDispatch.idle,MenuCmdReset,MenuCmdEnd,MenuCmdDrawBox
	dl	MenuCmdShowCursor.loop,MenuCmdShowCursor,MenuCmdHideCursor,MenuBoxDispatch.idle
MenuBoxDispatch.skip:
	ld	WA,0xFFFF
MenuBoxDispatch.loop:
	ldb	(wMenuCommand),0
	or	XWA,0xFFFF0000
	ld	(wMenuResult),XWA
MenuBoxDispatch.idle:
	call	TaskYield
	call	DrawMenuCursorSprite
	jp	MenuBoxDispatch

c_217A68	section	code abs=0x217A68

; [code] menu command 1 handler: wMenuCursorOn = 0, result 0
MenuCmdReset:
	xor	A,A
	ld	(wMenuCursorOn),A
	xor	WA,WA
	jp	MenuBoxDispatch.loop

c_217A74	section	code abs=0x217A74

; [code] menu command 3 handler: ClearTextBox 2, PlaceTextBox 2 at column 0xC row 0x20, PrintStringTable of wMenuTextCount entries from wMenuTexts, SetCursorBox 2, wMenuCursor = 0
MenuCmdDrawBox:
	ld	A,2
	call	ClearTextBox
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	ld	A,2
	ld	B,(wMenuTextCount)
	ld	XHL,(wMenuTexts)
	call	PrintStringTable
	ld	A,2
	call	SetCursorBox
	xor	A,A
	ld	(wMenuCursor),A
	xor	WA,WA
	jp	MenuBoxDispatch.loop

c_217AA4	section	code abs=0x217AA4

; [code] menu command 5 handler: ShowCursor, cursor at the current entry (MenuSetCursorPos), wMenuCursorOn = 1; .loop (0x217AC0) is the command 4 input: U/D wrap wMenuCursor over wMenuCount (sound 0x80), A -> (wMenuValues)[cursor] (0x81), B -> 0xFF (0x82), W = 0xFF, stored in wMenuChoice
MenuCmdShowCursor:
	ld	A,(wMenuCursorOn)
	or	A,A
	jr	NZ,MenuCmdShowCursor.skip
	call	ShowCursor
	call	MenuSetCursorPos
	ld	A,1
	ld	(wMenuCursorOn),A
MenuCmdShowCursor.skip:
	xor	WA,WA
	jp	MenuBoxDispatch.loop
MenuCmdShowCursor.loop:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,MenuCmdShowCursor.skip2
	bit	5,A
	jp	NZ,MenuCmdShowCursor.skip3
	bit	1,A
	jp	NZ,MenuCmdShowCursor.skip4
	bit	0,A
	jp	NZ,MenuCmdShowCursor.skip6
	jp	MenuCmdShowCursor.skip8
MenuCmdShowCursor.skip2:
	ld	WA,SFX_CONFIRM
	call	CallSoundCommand
	ld	A,(wMenuCursor)
	jp	MenuCmdShowCursor.skip9
MenuCmdShowCursor.skip3:
	ld	WA,SFX_CANCEL
	call	CallSoundCommand
	ld	A,0xFF
	jp	MenuCmdShowCursor.skip9
MenuCmdShowCursor.skip4:
	ld	A,(wMenuCursor)
	inc	1,A
	cp	A,(wMenuCount)
	jr	C,MenuCmdShowCursor.skip5
	xor	A,A
MenuCmdShowCursor.skip5:
	jp	MenuCmdShowCursor.skip7
MenuCmdShowCursor.skip6:
	ld	A,(wMenuCursor)
	dec	1,A
	jr	PL,MenuCmdShowCursor.skip7
	ld	A,(wMenuCount)
	dec	1,A
MenuCmdShowCursor.skip7:
	ld	(wMenuCursor),A
	ld	WA,SFX_CURSOR
	call	CallSoundCommand
MenuCmdShowCursor.skip8:
	call	MenuSetCursorPos
	jp	MenuCmdShowCursor.loop
MenuCmdShowCursor.skip9:
	cp	A,(wMenuCount)
	jr	NC,MenuCmdShowCursor.skip10
	ld	XHL,(wMenuValues)
	ld	A,(XHL+A)
MenuCmdShowCursor.skip10:
	ld	W,0xFF
	ld	(wMenuChoice),WA
	xor	WA,WA
	jp	MenuBoxDispatch.loop

c_217B56	section	code abs=0x217B56

; [code] menu command 6 handler: if wMenuCursorOn, HideCursor and wMenuCursorOn = 0
MenuCmdHideCursor:
	ld	A,(wMenuCursorOn)
	or	A,A
	jr	Z,MenuCmdHideCursor.skip
	call	HideCursor
	xor	A,A
	ld	(wMenuCursorOn),A
MenuCmdHideCursor.skip:
	xor	WA,WA
	jp	MenuBoxDispatch.loop

c_217B6E	section	code abs=0x217B6E

; [code] DrawMenuCursorSprite, TaskYield, back to MenuBoxDispatch: the menu idle handler (table entries 0 / 7, MenuBoxDispatch.idle) with its two calls swapped; not in the table and after a jp: no callers
MenuBoxIdle2:
	call	DrawMenuCursorSprite
	call	TaskYield
	jp	MenuBoxDispatch

c_217B7A	section	code abs=0x217B7A

; [code] menu command 2 handler: wMenuResult = 0xFFFF0000 | wMenuChoice, EndTask
MenuCmdEnd:
	ld	XWA,0xFFFF0000
	ld	A,(wMenuChoice)
	ld	(wMenuResult),XWA
	call	EndTask
	ret

c_217B8C	section	code abs=0x217B8C

; [code] carry when wMenuCursor < wMenuCount, then B, C = the two bytes at wMenuCells + 2 * wMenuCursor
GetMenuCursorCell:
	ld	A,(wMenuCursor)
	cp	A,(wMenuCount)
	jr	NC,GetMenuCursorCell.done
	add	A,A
	ld	XHL,(wMenuCells)
	lda	XHL,XHL+A
	ld	B,(XHL+)
	ld	C,(XHL+)
	scf
GetMenuCursorCell.done:
	ret

c_217BA9	section	code abs=0x217BA9

; [code] GetMenuCursorCell, then SetCursorPos
MenuSetCursorPos:
	call	GetMenuCursorCell
	jr	NC,MenuSetCursorPos.done
	call	SetCursorPos
MenuSetCursorPos.done:
	ret

c_217BB4	section	code abs=0x217BB4

; [code] when wMenuCursorOn and wMenuChoiceMade are set and the cursor is valid (GetMenuCursorCell): DrawBoxCursorSprite in box 2
DrawMenuCursorSprite:
	cpb	(wMenuCursorOn),0
	jr	Z,DrawMenuCursorSprite.done
	cpb	(wMenuChoiceMade),0
	jr	Z,DrawMenuCursorSprite.done
	call	GetMenuCursorCell
	jr	NC,DrawMenuCursorSprite.done
	ld	A,2
	call	DrawBoxCursorSprite
DrawMenuCursorSprite.done:
	ret

c_217E53	section	code abs=0x217E53

; [code] wListCommand, wListResult = 0, OpenListBoxNoClear, StartChildTask ListTask (WorksScreenTask)
StartListTask:
	xor	XWA,XWA
	ld	(wListCommand),XWA
	ld	(wListResult),XWA
	call	OpenListBoxNoClear
	ld	XHL,ListTask
	call	StartChildTask
	ret

c_217E6B	section	code abs=0x217E6B

; [code] ret; EndMenuTask calls it among its empty cleanup stubs, in reverse of the order WorksScreenTask starts things: this one stands for StartListTask (the routine just before it in ROM)
ListTaskCleanup:
	ret

c_217E6C	section	code abs=0x217E6C

; [code] XWA = wListResult, Z when the list task has not posted one
GetListResult:
	ld	XWA,(wListResult)
	or	XWA,XWA
	ret

c_217E73	section	code abs=0x217E73

; [code] wListCommand = A, wListResult = 0, no wait
PostListCommand:
	ld	(wListCommand),A
	xor	XWA,XWA
	ld	(wListResult),XWA
	ret

c_217E7E	section	code abs=0x217E7E

; [code] PostListCommand 1
PostListReset:
	ld	A,1
	jp	PostListCommand

c_217E84	section	code abs=0x217E84

; [code] PostListCommand 2
PostListEnd:
	ld	A,2
	jp	PostListCommand

c_217E8A	section	code abs=0x217E8A

; [code] PostListCommand 3
PostListRedraw:
	ld	A,3
	jp	PostListCommand

c_217E90	section	code abs=0x217E90

; [code] list command 4 (no wait): U/D rows, L/R pages; A posts page*rows+row, B 0xFFFF
StartListInput:
	ld	A,4
	jp	PostListCommand

c_217E96	section	code abs=0x217E96

; [code] PostListCommand 5
PostShowListCursor:
	ld	A,5
	jp	PostListCommand

c_217E9C	section	code abs=0x217E9C

; [code] PostListCommand 6
PostHideListCursor:
	ld	A,6
	jp	PostListCommand

c_217EA2	section	code abs=0x217EA2

; [code] TaskYield until the list task posts a result (wListResult), return it in XWA
WaitListResult:
	pop	XHL
	ld	(wListCmdReturn),XHL
WaitListResult.loop:
	ld	XWA,(wListResult)
	or	XWA,XWA
	jr	NZ,WaitListResult.skip
	call	TaskYield
	jr	WaitListResult.loop
WaitListResult.skip:
	call	TaskYield
	ld	XWA,(wListResult)
	ld	XHL,(wListCmdReturn)
	jp	XHL

c_217EC3	section	code abs=0x217EC3

; [code] wListCommand = A, wListResult = 0, TaskYield until ListTask posts a result, XWA = it, back to the caller's return address (wListCmdReturn); RedrawListPage / ShowListCursor / HideListCursor are its commands 3 / 5 / 6
ListCommandWait:
	ld	(wListCommand),A
	pop	XHL
	ld	(wListCmdReturn),XHL
	xor	XWA,XWA
	ld	(wListResult),XWA
ListCommandWait.loop:
	ld	XWA,(wListResult)
	or	XWA,XWA
	jr	NZ,ListCommandWait.skip
	call	TaskYield
	jr	ListCommandWait.loop
ListCommandWait.skip:
	call	TaskYield
	ld	XWA,(wListResult)
	ld	XHL,(wListCmdReturn)
	jp	XHL

c_217EEE	section	code abs=0x217EEE

; [code] list command 1 (waits): ListCmdReset; the list setup routines (SetupShopBuyItemList ...) end with it
ListReset:
	ld	A,1
	jp	ListCommandWait

c_217EF4	section	code abs=0x217EF4

; [code] list command 2 (waits): ListCmdEnd
ListEnd:
	ld	A,2
	jp	ListCommandWait

c_217EFA	section	code abs=0x217EFA

; [code] list command 3: redraw the page through the page-draw callback (wListDrawPage)
RedrawListPage:
	ld	A,3
	jp	ListCommandWait

c_217F00	section	code abs=0x217F00

; [code] list command 4 (waits): ListCmdInput; caller WorksScreenEntry
RunListInput:
	ld	A,4
	jp	ListCommandWait

c_217F06	section	code abs=0x217F06

; [code] list command 5: cursor on at the current row (0x610C = 1)
ShowListCursor:
	ld	A,5
	jp	ListCommandWait

c_217F0C	section	code abs=0x217F0C

; [code] list command 6: cursor off (0x610C, 0x615E = 0)
HideListCursor:
	ld	A,6
	jp	ListCommandWait

c_217F12	section	code abs=0x217F12

; [code] OpenTextBox 3: 0xC x 0xE, tiles from 0x7E (the list box over the picture area); caller StartListTask
OpenListBoxNoClear:
	ld	A,3
	ld	C,0xC
	ld	E,0xE
	ld	HL,0x7E
	call	OpenTextBox
	ret

c_217F20	section	code abs=0x217F20

; [code] FillScr1Rect 0 over the 12x14 picture area, FillTiles 0x7E x 0x1C2, OpenTextBox 3 (0xC x 0xE, tiles 0x7E), ClearTextBox 3, PlaceTextBox 3 at 0,0: the empty list box; [play] works_develop_* / works_setup_* / shop list screens
OpenListBox:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	FillScr1Rect
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	ld	A,3
	ld	C,0xC
	ld	E,0xE
	ld	HL,0x7E
	call	OpenTextBox
	ld	A,3
	call	ClearTextBox
	ld	A,3
	ld	C,0
	ld	E,0
	call	PlaceTextBox
	ret

c_217F59	section	code abs=0x217F59

; [code] 10 blanks (BlankText3) in box 3 at column D, row E
ClearListLine:
	push	BC
	push	DE
	ld	XHL,BlankText3
	ld	B,D
	ld	C,E
	ld	A,3
	call	PrintStringAt
	pop	DE
	pop	BC
	ret
BlankText3:
	db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF	; "          "

c_217F78	section	code abs=0x217F78

; [code] A = box, B/C = column/row: PrintStringAt XHL, then blanks from BlankText4 + StringLength to fill 8 characters
PrintStringPadded8:
	push	WA
	push	BC
	push	XHL
	call	PrintStringAt
	pop	XHL
	call	StringLength
	pop	BC
	add	B,A
	ld	XHL,BlankText4
	lda	XHL,XHL+A
	pop	WA
	call	PrintStringAt
	ret
BlankText4:
	db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF	; "        "

c_217FA0	section	code abs=0x217FA0

; [code] child task: wListChoice, wListChoiceMade, wListCursorOn = 0, then ListDispatch
ListTask:
	xor	WA,WA
	ld	(wListChoice),WA
	ld	(wListChoiceMade),A
	ld	(wListCursorOn),A

c_217FAE	section	code abs=0x217FAE

; [code] runs the ListCommandJumps handler for wListCommand (< 8; else result 0xFFFFFFFF); idle loop ListIdle; handlers end at ListCommandJumps.loop (result, command 0)
ListDispatch:
	ld	A,(wListCommand)
	cp	A,8
	jr	NC,ListDispatch.skip
	ld	XHL,ListCommandJumps
	sll	2,A
	ld	XHL,(XHL+A)
	jp	XHL
; [code] the handler for each wListCommand 0-7 (ListDispatch: index * 4, jp)
ListCommandJumps:
	dl	ListIdle	; 0
	dl	ListCmdReset	; 1
	dl	ListCmdEnd	; 2
	dl	ListCmdRedraw	; 3
	dl	ListCmdInput	; 4
	dl	ListCmdShowCursor	; 5
	dl	ListCmdHideCursor	; 6
	dl	ListIdle	; 7
ListDispatch.skip:
	ld	WA,0xFFFF
ListCommandJumps.loop:
	ldb	(wListCommand),0
	or	XWA,0xFFFF0000
	ld	(wListResult),XWA
; [code] list command 0 / 7: TaskYield, DrawListCursorSprite, back to ListDispatch
ListIdle:
	call	TaskYield
	call	DrawListCursorSprite
	jp	ListDispatch

c_218004	section	code abs=0x218004

; [code] list command 1 handler: wListCursorOn, wListPage, wListRow = 0, result 0
ListCmdReset:
	xor	A,A
	ld	(wListCursorOn),A
	ld	(wListPage),A
	ld	(wListRow),A
	xor	WA,WA
	jp	ListCommandJumps.loop

c_218018	section	code abs=0x218018

; [code] list command 3 handler: SetCursorBox 3, calls the page-draw callback wListDrawPage
ListCmdRedraw:
	ld	A,3
	call	SetCursorBox
	ld	XHL,(wListDrawPage)
	call	CallXHL
	xor	WA,WA
	jp	ListCommandJumps.loop

c_21802C	section	code abs=0x21802C

; [code] list command 5 handler: ShowCursor, ListSetCursorPos, wListCursorOn = 1
ListCmdShowCursor:
	ld	A,(wListCursorOn)
	or	A,A
	jr	NZ,ListCmdShowCursor.skip
	call	ShowCursor
	call	ListSetCursorPos
	ldb	(wListCursorOn),1
ListCmdShowCursor.skip:
	xor	WA,WA
	jp	ListCommandJumps.loop

c_218047	section	code abs=0x218047

; [code] list command 4 handler: D/U wrap wListRow over wListRows, R/L wrap wListPage over wListPages (redraw through wListDrawPage), wListMoveHook after each move (sound 0x80); A calls wListAcceptHook: carry -> sound 0x81, result wListPage * wListRows + wListRow, else sound 0x83; B -> 0xFFFF (0x82); result in wListChoice, wListChoiceMade = 0xFF, HideCursor; [play] shop_buy_* screens
ListCmdInput:
	call	ListSetCursorPos
	call	ShowCursor
ListCmdInput.loop:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,ListCmdInput.skip
	bit	5,A
	jp	NZ,ListCmdInput.skip3
	bit	1,A
	jp	NZ,ListCmdInput.skip4
	bit	0,A
	jp	NZ,ListCmdInput.skip6
	bit	3,A
	jp	NZ,ListCmdInput.skip8
	bit	2,A
	jp	NZ,ListCmdInput.skip10
	jp	ListCmdInput.skip14
ListCmdInput.skip:
	ld	XHL,(wListAcceptHook)
	call	CallXHL
	jr	NC,ListCmdInput.skip2
	ld	WA,SFX_CONFIRM
	call	CallSoundCommand
	ld	L,(wListPage)
	mul	HL,(wListRows)
	ld	A,(wListRow)
	extz	WA
	add	WA,HL
	jp	ListCmdInput.skip15
ListCmdInput.skip2:
	ld	WA,SFX_BUZZER
	call	CallSoundCommand
	jp	ListCmdInput.skip14
ListCmdInput.skip3:
	ld	WA,SFX_CANCEL
	call	CallSoundCommand
	ld	WA,0xFFFF
	jp	ListCmdInput.skip15
ListCmdInput.skip4:
	ld	A,(wListRow)
	inc	1,A
	cp	A,(wListRows)
	jr	C,ListCmdInput.skip5
	xor	A,A
ListCmdInput.skip5:
	ld	(wListRow),A
	jp	ListCmdInput.skip13
ListCmdInput.skip6:
	ld	A,(wListRow)
	dec	1,A
	jr	PL,ListCmdInput.skip7
	ld	A,(wListRows)
	dec	1,A
ListCmdInput.skip7:
	ld	(wListRow),A
	jp	ListCmdInput.skip13
ListCmdInput.skip8:
	ld	A,(wListPage)
	inc	1,A
	cp	A,(wListPages)
	jr	C,ListCmdInput.skip9
	xor	A,A
ListCmdInput.skip9:
	ld	(wListPage),A
	jp	ListCmdInput.skip12
ListCmdInput.skip10:
	ld	A,(wListPage)
	dec	1,A
	jr	PL,ListCmdInput.skip11
	ld	A,(wListPages)
	dec	1,A
ListCmdInput.skip11:
	ld	(wListPage),A
ListCmdInput.skip12:
	ld	XHL,(wListDrawPage)
	call	CallXHL
ListCmdInput.skip13:
	ld	XHL,(wListMoveHook)
	call	CallXHL
	ld	WA,SFX_CURSOR
	call	CallSoundCommand
ListCmdInput.skip14:
	call	ListSetCursorPos
	jp	ListCmdInput.loop
ListCmdInput.skip15:
	ld	(wListChoice),WA
	ldb	(wListChoiceMade),0xFF
	call	HideCursor
	xor	WA,WA
	jp	ListCommandJumps.loop

c_21814F	section	code abs=0x21814F

; [code] list command 6 handler: if wListCursorOn, HideCursor and wListCursorOn = 0
ListCmdHideCursor:
	ld	A,(wListCursorOn)
	or	A,A
	jr	Z,ListCmdHideCursor.skip
	call	HideCursor
	ldb	(wListCursorOn),0
ListCmdHideCursor.skip:
	xor	WA,WA
	jp	ListCommandJumps.loop

c_218166	section	code abs=0x218166

; [code] DrawListCursorSprite, TaskYield, back to ListDispatch: ListIdle with its two calls swapped; not in ListCommandJumps and after a jp: no callers
ListIdle2:
	call	DrawListCursorSprite
	call	TaskYield
	jp	ListDispatch

c_218172	section	code abs=0x218172

; [code] list command 2 handler: wListResult = 0xFFFF0000 | wListChoice, EndTask
ListCmdEnd:
	ld	XWA,0xFFFF0000
	ld	WA,(wListChoice)
	ld	(wListResult),XWA
	call	EndTask
	ret

c_218184	section	code abs=0x218184

; [code] carry when wListRow < wListRows, then B, C = the two bytes at wListCells + 2 * wListRow
GetListCursorCell:
	ld	A,(wListRow)
	cp	A,(wListRows)
	jr	NC,GetListCursorCell.done
	add	A,A
	ld	XHL,(wListCells)
	lda	XHL,XHL+A
	ld	B,(XHL+)
	ld	C,(XHL+)
	scf
GetListCursorCell.done:
	ret

c_2181A1	section	code abs=0x2181A1

; [code] GetListCursorCell, then SetCursorBox 3 and SetCursorPos
ListSetCursorPos:
	call	GetListCursorCell
	jr	NC,ListSetCursorPos.done
	push	BC
	ld	A,3
	call	SetCursorBox
	pop	BC
	call	SetCursorPos
ListSetCursorPos.done:
	ret

c_2181B4	section	code abs=0x2181B4

; [code] when wListCursorOn and wListChoiceMade are set and GetListCursorCell succeeds: DrawBoxCursorSprite in box 3
DrawListCursorSprite:
	cpb	(wListCursorOn),0
	jr	Z,DrawListCursorSprite.done
	cpb	(wListChoiceMade),0
	jr	Z,DrawListCursorSprite.done
	call	GetListCursorCell
	jr	NC,DrawListCursorSprite.done
	ld	A,3
	call	DrawBoxCursorSprite
DrawListCursorSprite.done:
	ret

c_2181CF	section	code abs=0x2181CF

; [code] jp (wListMoveHook): the hook the list input calls after every move
CallListMoveHook:
	ld	XHL,(wListMoveHook)
	call	CallXHL
	ret

c_218909	section	code abs=0x218909

; [code] ret; EndMenuTask calls it among its empty cleanup stubs, in reverse of the order WorksScreenTask starts things: this one stands for StartWorksBox4Task (the routine just before it in ROM)
WorksBox4TaskCleanup:
	ret

c_219431	section	code abs=0x219431

; [code] calls three empty stubs (ret) that follow CallCopyEquipToWorks, SetEmblemBits and CopyGameToWorksStub in ROM; EndMenuTask calls it first among its cleanup stubs, standing for CopyGameToWorks
CopyGameToWorksCleanup:
	call	CopyEquipToWorksCleanup
	call	CopyPlayerInfoToWorksCleanup
	call	CopyGameToWorksStubCleanup
	ret

c_219443	section	code abs=0x219443

; [code] ret; CopyGameToWorksCleanup calls it in reverse of CopyGameToWorks' steps: this one stands for CallCopyEquipToWorks (the routine just before it in ROM)
CopyEquipToWorksCleanup:
	ret

c_2194C5	section	code abs=0x2194C5

; [code] ret; CopyGameToWorksCleanup calls it in reverse of CopyGameToWorks' steps: this one stands for CopyPlayerInfoToWorks (with SetEmblemBits, just before it in ROM)
CopyPlayerInfoToWorksCleanup:
	ret

c_2194C7	section	code abs=0x2194C7

; [code] ret; CopyGameToWorksCleanup calls it in reverse of CopyGameToWorks' steps: this one stands for CopyGameToWorksStub (the routine just before it in ROM)
CopyGameToWorksStubCleanup:
	ret

c_219843	section	code abs=0x219843

; [code] A = 0x1E, jp WaitFramesOrButton (30 frames or A / B); no callers (was swp_219843)
Wait30FramesOrButton:
	ld	A,0x1E
	jp	WaitFramesOrButton

c_219849	section	code abs=0x219849

; [code] FlushMessage, then queues XHL (0x21762F: wMsgPending = XHL) for MessageTask; back to the caller (return address in wTextWaitReturn); ShowPartnerGenderText and ShowShopClerkText end here
ShowMenuText:
	ld	(wMenuTextPtr),XHL
	pop	XDE
	ld	(wTextWaitReturn),XDE
	call	FlushMessage
	ld	XHL,(wMenuTextPtr)
	call	QueueMessage
	ld	XHL,(wTextWaitReturn)
	jp	XHL

c_21990C	section	code abs=0x21990C

; [code] call SoundCommand; ret
CallSoundCommand:
	call	SoundCommand
	ret

c_21AB3F	section	code abs=0x21AB3F

; [code] common exit (jp from ShopMenu, Works menu, WorksExit): empty cleanup stubs, EndChildTasks (task bit 6), posts 0xFFFF0000 | word (wWorksScreenValue) to wWorksScreenResult (the result RunWorksScreen waits for), EndTask
EndMenuTask:
	call	CopyGameToWorksCleanup
	call	WorksBox4TaskCleanup
	call	ListTaskCleanup
	call	MenuBoxTaskCleanup
	call	Box2TaskCleanup
	call	MessageTaskCleanup
	call	CursorTaskCleanup
	call	EndChildTasks
	call	TaskYield
	ld	XWA,0xFFFF0000
	ld	WA,(wWorksScreenValue)
	ld	(wWorksScreenResult),XWA
	call	EndTask
EndMenuTask.loop:
	call	TaskYield
	jr	EndMenuTask.loop
