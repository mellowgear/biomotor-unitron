; engine/menus/save.asm: save slots: cart base, flash block reads, slot offsets, the BIOS flash erase / write calls (FlashEraseBlock, FlashWrite), slot list drawing, save/load slot select and confirm tasks, Yes/No prompt, boot save check

c_206179	section	code abs=0x206179

; HL = bit L of the u16 array at XDE as 0 / 0xFFFF (Z when clear), the event-flag layout; reads a slot's flags [code]
CheckBitArray:
	push	A
	push	BC
	ld	H,0
	ld	A,L
	; word offset (L >> 4) * 2, mask 1 << (L & 15)
	srl	4,HL
	sll	1,HL
	ld	BC,1
	rlc	A,BC
	ld	HL,(XDE+HL)
	and	HL,BC
	scc	NZ,HL
	pop	BC
	pop	A
	ret

c_20776F	section	code abs=0x20776F

; BIOS flash erase (vector 8, SWI 1) of block B on the cart's chip; RA3 = result, callers retry until 0 [code]
FlashEraseBlock:
	cpw	(HeaderCartId),0xFFFE
	scc	Z,RA3
	ld	RB3,B
	ld	RW3,8
	ldb	(WDCR),0x4E
	swi	1
	ldb	(WDCR),0x4E
	ret

c_207788	section	code abs=0x207788

; BIOS flash write (vector 6, SWI 1) of BC pages from XHL to flash offset XDE; RA3 = result [code]
FlashWrite:
	cpw	(HeaderCartId),0xFFFE
	scc	Z,RA3
	ld	RW3,6
	ld	RBC3,BC
	ld	XHL3,XHL
	ld	XDE3,XDE
	ldb	(WDCR),0x4E
	swi	1
	ldb	(WDCR),0x4E
	ret

c_2077A6	section	code abs=0x2077A6

; Copies BC 256-byte pages from cart offset XHL to XDE; RA3 = A = 0 [code]
ReadCartBlocks:
	push	XHL
	calr	GetCartBase
	add	(XSP),XHL
	pop	XHL
	ld	WA,BC
ReadCartBlocks.loop:
	ld	BC,0x80
	ldirw	(XDE+),(XHL+)
	djnz	WA,ReadCartBlocks.loop
	ld	RA3,0
	ld	A,RA3
	ret

c_2077BE	section	code abs=0x2077BE

; XHL = the cart base, 0x200000 (0x800000 when HeaderCartId is 0xFFFE (?)) [code]
GetCartBase:
	cpw	(HeaderCartId),0xFFFE
	ld	XHL,0x200000
	ret	NZ
	ld	QL,0x80
	ret

c_20DAB9	section	code abs=0x20DAB9

; XHL = the cart address of save slot A [code]
GetSaveSlotAddr:
	call	GetSaveSlotOffset
	add	XHL,0xFA000
	push	XHL
	call	GetCartBase
	add	XHL,(XSP+)
	ret

c_20DACC	section	code abs=0x20DACC

; XHL = slot A's offset in the save block at flash 0xFA000: slot 0 (options) at 0, files 1-3 at 0x30 + 0x290 * (A - 1) [code]
GetSaveSlotOffset:
	ld	XHL,0
	or	A,A
	ret	Z
	dec	1,A
	ld	L,A
	mul	XHL,0x290
	add	XHL,0x30
	ret

c_20DAE1	section	code abs=0x20DAE1

; Erases the whole save block (flash block 0x11) inside BIOS calls 0x16 / 0x15; Delete Data "All" [code]
EraseSaveBlock:
	ld	RW3,0x16
	call	BiosCall
EraseSaveBlock.loop:
	ld	B,0x11
	call	FlashEraseBlock
	cp	RA3,0
	jr	NZ,EraseSaveBlock.loop
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DAFD	section	code abs=0x20DAFD

; Empties save slot A (0xFF over its 0x27D bytes) by rewriting the save block through wTextBuffer; DeleteDataSelect [code]
ClearSaveSlot:
	push	A
	ld	RW3,0x16
	call	BiosCall
	; the 0x800-byte save block into RAM, edit, erase and write back
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	ReadCartBlocks
	pop	A
	call	GetSaveSlotOffset
	add	XHL,wTextBuffer
	ld	BC,0x27D
	ld	A,0xFF
ClearSaveSlot.loop:
	ld	(XHL+),A
	djnz	BC,ClearSaveSlot.loop
ClearSaveSlot.loop2:
	ld	B,0x11
	call	FlashEraseBlock
	cp	RA3,0
	jr	NZ,ClearSaveSlot.loop2
	ld	BC,8
	ld	XDE,0xFA000
	ld	XHL,wTextBuffer
	call	FlashWrite
	cp	RA3,0
	jr	NZ,ClearSaveSlot.loop2
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DB57	section	code abs=0x20DB57

; Z when save slot A starts with the cart header id (HeaderCartId .. Header+0x30), i.e. holds a save [code]
IsSaveSlotUsed:
	call	GetSaveSlotAddr
	ld	XDE,HeaderCartId
IsSaveSlotUsed.loop:
	ld	A,(XDE+)
	cp	A,(XHL+)
	ret	NZ
	cp	XDE,Header+0x30
	ret	Z
	jr	IsSaveSlotUsed.loop

c_20DB72	section	code abs=0x20DB72

; Saves to slot A (0 -> SaveOptions): the header id then 0x26D bytes from wPlayerName, via wTextBuffer [code]
SaveGameSlot:
	or	A,A
	jp	Z,SaveOptions
	push	A
	ld	RW3,0x16
	call	BiosCall
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	ReadCartBlocks
	pop	A
	call	GetSaveSlotOffset
	add	XHL,wTextBuffer
	ld	XDE,XHL
	ld	XHL,HeaderCartId
	ld	BC,0x10
	ldir	(XDE+),(XHL+)
	ld	XHL,wPlayerName
	ld	BC,0x26D
	ldir	(XDE+),(XHL+)
SaveGameSlot.loop:
	; retry the erase and write until both succeed
	ld	B,0x11
	call	FlashEraseBlock
	cp	RA3,0
	jr	NZ,SaveGameSlot.loop
	ld	BC,8
	ld	XDE,0xFA000
	ld	XHL,wTextBuffer
	call	FlashWrite
	cp	RA3,0
	jr	NZ,SaveGameSlot.loop
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DBDE	section	code abs=0x20DBDE

; Saves slot 0: the header id and the 2 option bytes at wOptionMessageSpeed (speed, animation); also ConfigMenu [code]
SaveOptions:
	ld	RW3,0x16
	call	BiosCall
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	ReadCartBlocks
	ld	A,0
	call	GetSaveSlotOffset
	add	XHL,wTextBuffer
	ld	XDE,XHL
	ld	XHL,HeaderCartId
	ld	BC,0x10
	ldir	(XDE+),(XHL+)
	ld	XHL,wOptionMessageSpeed
	ld	BC,2:16
	ldir	(XDE+),(XHL+)
SaveOptions.loop:
	ld	B,0x11
	call	FlashEraseBlock
	cp	RA3,0
	jr	NZ,SaveOptions.loop
	ld	BC,8
	ld	XDE,0xFA000
	ld	XHL,wTextBuffer
	call	FlashWrite
	cp	RA3,0
	jr	NZ,SaveOptions.loop
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DC43	section	code abs=0x20DC43

; Loads slot A (0 -> LoadOptions) into wPlayerName (0x26D bytes), clears wEventFlagsB0; MainMenuLoadTask, WorksLoadTask [code]
LoadGameSlot:
	or	A,A
	jp	Z,LoadOptions
	call	GetSaveSlotAddr
	add	XHL,0x10
	ld	XDE,wPlayerName
	ld	BC,0x26D
	ldir	(XDE+),(XHL+)
	ldw	(wEventFlagsB0),0
	ret

c_20DC65	section	code abs=0x20DC65

; Loads the 2 option bytes of slot 0 into wOptionMessageSpeed [code]
LoadOptions:
	ld	A,0
	call	GetSaveSlotAddr
	add	XHL,0x10
	ld	XDE,wOptionMessageSpeed
	ld	BC,2:16
	ldir	(XDE+),(XHL+)
	ret

c_20DC7C	section	code abs=0x20DC7C

; Starts the Load slot list on slot 1 [code]
InitLoadSlotList:
	ldb	(wSaveMenuMode),SAVE_MENU_LOAD
	ldb	(wSaveSlot),1
	call	ClearScr2Tilemap
	calr	DrawSaveSlotList
	ret

c_20DC8E	section	code abs=0x20DC8E

; Starts the Clear slot list on slot 1 [code]
InitClearSlotList:
	ldb	(wSaveMenuMode),SAVE_MENU_CLEAR
	ldb	(wSaveSlot),1
	call	ClearScr2Tilemap
	calr	DrawSaveSlotList
	ret

c_20DDBC	section	code abs=0x20DDBC

; Opens the slot boxes (box +0x10, tiles from TASK_ARG): the Load / Save / Clear title, then per slot 1-3 the empty text, or
; names, levels, the four emblems (flags 0x10-0x13) and the rank title of the saved file [code][play]
DrawSaveSlotList:
	pushw	(XIZ+TASK_ARG)
	ld	A,(XIZ+0x10)
	ld	C,0xA
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	call	OpenTextBox
	; title by mode: below Save = Load, Save, above = Clear
	cpb	(wSaveMenuMode),SAVE_MENU_SAVE
	ld	XHL,SaveMenuLoadText
	jr	C,DrawSaveSlotList.skip
	ld	XHL,SaveMenuSaveText
	jr	Z,DrawSaveSlotList.skip
	ld	XHL,SaveMenuClearText
DrawSaveSlotList.skip:
	call	DrawString
	ld	C,0
	ld	E,0x20
	ld	A,(XIZ+0x10)
	call	PlaceTextBox
	; each slot box takes 0x30 tiles after the title's 8
	addw	(XIZ+TASK_ARG),8
	ld	A,1
DrawSaveSlotList.loop:
	push	A
	ld	A,(XIZ+0x10)
	ld	C,0x12
	ld	E,5
	ld	HL,(XIZ+TASK_ARG)
	call	OpenTextBox
	ld	A,(XSP)
	call	IsSaveSlotUsed
	jr	Z,DrawSaveSlotList.skip2
	ld	A,(XIZ+0x10)
	ld	XHL,SaveSlotEmptyText
	call	DrawBoxString
	jrl	DrawSaveSlotList.skip7
DrawSaveSlotList.skip2:
	ld	A,(XSP)
	call	GetSaveSlotAddr
	add	XHL,0x10
	push	XHL
	ld	A,(XIZ+0x10)
	ld	C,8
	ld	E,0
	call	SetTextBoxCursor
	call	GetTextCursorTile
	ld	XHL,(XSP)
	; levels at file +0xF (player) and +0x2B (partner)
	ld	C,(XHL+0xF:16)
	ld	B,0
	call	RenderNumberTiles
	ld	C,8
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	L,(SaveSlotLvChar)
	call	DrawTextChar
	ld	C,8
	ld	E,1
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	XHL,(XSP)
	ld	C,(XHL+0x2B:16)
	ld	B,0
	call	RenderNumberTiles
	ld	C,8
	ld	E,1
	call	SetTextBoxCursorXWA
	ld	L,(SaveSlotLvChar)
	call	DrawTextChar
	ld	C,1
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,(XSP)
	add	XHL,0
	call	DrawString
	ld	C,1
	ld	E,1
	call	SetTextBoxCursorXWA
	ld	XHL,(XSP)
	add	XHL,0x1C
	call	DrawString
	; the file's event flags at +0x4D: emblems 0x10-0x13
	ld	XDE,(XSP)
	add	XDE,0x4D
	ld	L,0x10
	call	CheckBitArray
	jr	Z,DrawSaveSlotList.skip3
	push	XDE
	ld	C,0xC
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	L,(SaveSlotEmblemChars)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip3:
	ld	L,0x11
	call	CheckBitArray
	jr	Z,DrawSaveSlotList.skip4
	push	XDE
	ld	C,0xD
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	L,(SaveSlotEmblemChars+1)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip4:
	ld	L,0x12
	call	CheckBitArray
	jr	Z,DrawSaveSlotList.skip5
	push	XDE
	ld	C,0xE
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	L,(SaveSlotEmblemChars+2)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip5:
	ld	L,0x13
	call	CheckBitArray
	jr	Z,DrawSaveSlotList.skip6
	push	XDE
	ld	C,0xF
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	L,(SaveSlotEmblemChars+3)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip6:
	ld	C,9
	ld	E,2
	call	SetTextBoxCursorXWA
	pop	XHL
	push	XWA
	; rank at file +0x32
	ld	A,(XHL+0x32:16)
	call	GetRankTitle
	pop	XWA
	call	DrawString
DrawSaveSlotList.skip7:
	ld	E,(XSP)
	dec	1,E
	mul	DE,5
	add	DE,0x24
	ld	C,1
	call	PlaceTextBoxXWA
	addw	(XIZ+TASK_ARG),0x30
	pop	A
	inc	1,A
	cp	A,4
	jrl	C,DrawSaveSlotList.loop
	popw	(XIZ+TASK_ARG)
	ret

c_20DF80	section	code abs=0x20DF80

; Opens the "... Ok? Yes No" box for wSaveMenuMode: Load, Clear, Over (saving on a used slot) or Save [code][play]
ShowSaveConfirmBox:
	ld	A,(XIZ+0x10)
	ld	C,0x12
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0x98
	call	OpenTextBox
	cpb	(wSaveMenuMode),SAVE_MENU_LOAD
	ld	XHL,LoadOkYesNoText
	jr	Z,ShowSaveConfirmBox.skip
	cpb	(wSaveMenuMode),SAVE_MENU_CLEAR
	ld	XHL,ClearOkYesNoText
	jr	Z,ShowSaveConfirmBox.skip
	ld	A,(wSaveSlot)
	call	IsSaveSlotUsed
	ld	XHL,OverOkYesNoText
	jr	Z,ShowSaveConfirmBox.skip
	ld	XHL,SaveOkYesNoText
ShowSaveConfirmBox.skip:
	ld	A,(XIZ+0x10)
	call	DrawBoxString
	ld	C,1
	ld	E,0x28
	call	PlaceTextBoxXWA
	ret

c_20E012	section	code abs=0x20E012

; Opens the "... Complete" box for wSaveMenuMode [code][play]
ShowSaveDoneBox:
	ld	A,(XIZ+0x10)
	ld	C,0x12
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0x98
	call	OpenTextBox
	cpb	(wSaveMenuMode),SAVE_MENU_LOAD
	ld	XHL,LoadCompleteText
	jr	Z,ShowSaveDoneBox.skip
	cpb	(wSaveMenuMode),SAVE_MENU_CLEAR
	ld	XHL,ClearCompleteText
	jr	Z,ShowSaveDoneBox.skip
	ld	XHL,SaveCompleteText
ShowSaveDoneBox.skip:
	ld	A,(XIZ+0x10)
	call	DrawBoxString
	ld	C,1
	ld	E,0x28
	call	PlaceTextBoxXWA
	ret

c_20E084	section	code abs=0x20E084

; Task: cursor over slots 1-3 in wSaveSlot (up / down wrap); A ends it, but buzzes on an empty slot unless saving;
; B ends with wSaveSlot 0; WorksLoadTask, WorksSaveTask, the title [code]
SaveSlotSelectTask:
	ldw	(XIZ+TASK_FUNC),SaveSlotSelectTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SaveSlotSelectTask.skip >> 16
	cpb	(wSaveSlot),0
	jr	NZ,SaveSlotSelectTask.skip
	ldb	(wSaveSlot),1
SaveSlotSelectTask.skip:
	ld	E,(wSaveSlot)
	dec	1,E
	mul	DE,0x28
	add	DE,0x2C
	ld	BC,8
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,SaveSlotSelectTask.skip2
	bit	1,A
	jr	NZ,SaveSlotSelectTask.skip3
	bit	4,A
	jr	NZ,SaveSlotSelectTask.skip4
	bit	5,A
	jr	NZ,SaveSlotSelectTask.skip6
	ret
SaveSlotSelectTask.skip2:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	decb	1,(wSaveSlot)
	ret	NZ
	ldb	(wSaveSlot),3
	ret
SaveSlotSelectTask.skip3:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	incb	1,(wSaveSlot)
	cpb	(wSaveSlot),4
	ret	C
	ldb	(wSaveSlot),1
	ret
SaveSlotSelectTask.skip4:
	; Load and Clear need a used slot
	cpb	(wSaveMenuMode),SAVE_MENU_SAVE
	jr	Z,SaveSlotSelectTask.skip5
	ld	A,(wSaveSlot)
	call	IsSaveSlotUsed
	jr	Z,SaveSlotSelectTask.skip5
	ld	WA,SFX_BUZZER
	call	SoundCommand
	ret
SaveSlotSelectTask.skip5:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	call	EndTask
	ret
SaveSlotSelectTask.skip6:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	ldb	(wSaveSlot),0
	call	EndTask
	ret

c_20E131	section	code abs=0x20E131

; Task: Yes / No prompt starting on No (wYesNoChoice 2) [code]
YesNoPromptTask:
	ldb	(wYesNoChoice),2
	ldw	(XIZ+TASK_FUNC),YesNoPromptInput & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),YesNoPromptInput >> 16
	ret

c_20E141	section	code abs=0x20E141

; Yes / No each frame: left / right set wYesNoChoice 1 / 2, A ends it, B ends with 0; callers test for 1 [code][play]
YesNoPromptInput:
	ld	C,(wYesNoChoice)
	dec	1,C
	mul	BC,0x20
	add	BC,0x58
	ld	DE,0x44
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ld	A,(wJoyPressed)
	bit	BIT_D_LEFT,A
	jr	NZ,YesNoPromptInput.skip
	bit	3,A
	jr	NZ,YesNoPromptInput.skip2
	bit	4,A
	jr	NZ,YesNoPromptInput.skip3
	bit	5,A
	jr	NZ,YesNoPromptInput.skip4
	ret
YesNoPromptInput.skip:
	cpb	(wYesNoChoice),1
	ret	Z
	ld	WA,SFX_CURSOR
	call	SoundCommand
	ldb	(wYesNoChoice),1
	ret
YesNoPromptInput.skip2:
	cpb	(wYesNoChoice),2
	ret	Z
	ld	WA,SFX_CURSOR
	call	SoundCommand
	ldb	(wYesNoChoice),2
	ret
YesNoPromptInput.skip3:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	call	EndTask
	ret
YesNoPromptInput.skip4:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	ldb	(wYesNoChoice),0
	call	EndTask
	ret

c_20E1BC	section	code abs=0x20E1BC

; Task: ends after 0x1E frames (+0x12); after ShowSaveDoneBox [code]
Wait30FramesTask:
	ldw	(XIZ+0x12),0x1E
	ldw	(XIZ+TASK_FUNC),Wait30FramesTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),Wait30FramesTask.resume >> 16
Wait30FramesTask.resume:
	decw	1,(XIZ+0x12)
	jp	Z,EndTask
	ret

c_21D5C5	section	code abs=0x21D5C5

; Boot step: default options (speed 3, animation on), the saved ones if slot 0 holds a save, then the intro [code]
BootLoadOptions:
	ldb	(wOptionMessageSpeed),3
	ldb	(wOptionAnimation),0xFF
	ld	A,0
	call	IsSaveSlotUsed
	call	Z,LoadOptions
	call	InitTextBoxes
	ldw	(XIZ+TASK_FUNC),IntroThenMainMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroThenMainMenu >> 16
	ret
