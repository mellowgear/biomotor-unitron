; engine/menus/save.asm: save slots: cart base, flash block reads, slot offsets, the BIOS flash erase / write calls (FlashEraseBlock, FlashWrite), slot list drawing, save/load slot select and confirm tasks, Yes/No prompt, boot save check

c_206179	section	code abs=0x206179

; [code] HL = bit L of the u16 array at XDE: 0 or 0xFFFF (word L >> 4, bit L & 15; the CheckEventFlag layout)
CheckBitArray:
	push	A
	push	BC
	ld	H,0
	ld	A,L
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

; [code] BIOS vector 8 (VECT_FLASHERS, the SNK BIOS system call vectors) through SWI 1: RA3 = flash select (1 when the HeaderCartId word is 0xFFFE), RB3 = block B; callers retry until RA3 = 0 (SaveGameSlot, SaveOptions, ClearSaveSlot, EraseSaveBlock)
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

; [code] BIOS vector 6 (VECT_FLASHWRITE, the SNK BIOS system call vectors) through SWI 1: RA3 = flash select, RBC3 = BC, XHL3 = source XHL, XDE3 = XDE; callers write wTextBuffer back to 0xFA000 after FlashEraseBlock
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

; [code] copies BC blocks of 0x80 words from GetCartBase + XHL to XDE (ldirw); callers the save code (e.g. ClearSaveSlot reads flash 0xFA000 into wTextBuffer)
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

; [code] XHL = 0x200000, or 0x800000 when the word at HeaderCartId is 0xFFFE
GetCartBase:
	cpw	(HeaderCartId),0xFFFE
	ld	XHL,0x200000
	ret	NZ
	ld	QL,0x80
	ret

c_20DAB9	section	code abs=0x20DAB9

; [code] A = slot -> XHL = GetCartBase + 0xFA000 + GetSaveSlotOffset
GetSaveSlotAddr:
	call	GetSaveSlotOffset
	add	XHL,0xFA000
	push	XHL
	call	GetCartBase
	add	XHL,(XSP+)
	ret

c_20DACC	section	code abs=0x20DACC

; [code] A = slot -> XHL = 0 for slot 0, else 0x30 + 0x290 * (slot - 1) (flash layout, cart offset 0xFA000: slot 0 = 0x30 bytes system data, slots 1-3 0x290 each)
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

; [code] BIOS 0x16, FlashEraseBlock 0x11 until RA3 = 0, BIOS 0x15 (no write back); the Delete Data "All" path (comment at 0x20D462)
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

; [code] A = slot: reads the 0xFA000 block into wTextBuffer, fills the slot's 0x27D bytes with 0xFF, FlashEraseBlock 0x11 + FlashWrite; caller DeleteDataSelect after Yes
ClearSaveSlot:
	push	A
	ld	RW3,0x16
	call	BiosCall
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	ReadCartBlocks
	pop	A
	call	GetSaveSlotOffset
	add	XHL,0x4000
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

; [code] A = slot: Z when the bytes at GetSaveSlotAddr match the cart header from HeaderCartId up to 0x200030 (a written slot); DrawSaveSlotList shows the empty text when NZ, ShowSaveConfirmBox asks "Over Ok?" when Z
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

; [code] A = slot: header copy + 0x26D bytes from wPlayerName into the 0xFA000 flash block (erase + write)
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
	add	XHL,0x4000
	ld	XDE,XHL
	ld	XHL,HeaderCartId
	ld	BC,0x10
	ldir	(XDE+),(XHL+)
	ld	XHL,wPlayerName
	ld	BC,0x26D
	ldir	(XDE+),(XHL+)
SaveGameSlot.loop:
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

; [code] SaveGameSlot with A = 0: reads the 0xFA000 block into wTextBuffer, puts the cart header (HeaderCartId, 16 bytes) and the 2 bytes from wOptionMessageSpeed (message speed, animation) at slot 0, FlashEraseBlock 0x11 + FlashWrite; also called by ConfigMenu
SaveOptions:
	ld	RW3,0x16
	call	BiosCall
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	ReadCartBlocks
	ld	A,0
	call	GetSaveSlotOffset
	add	XHL,0x4000
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

; [code] A = slot: 0 -> LoadOptions, else 0x26D bytes from GetSaveSlotAddr + 0x10 to wPlayerName (the counterpart of SaveGameSlot), (0x5076) = 0; callers MainMenuLoadTask, WorksLoadTask
LoadGameSlot:
	or	A,A
	jp	Z,LoadOptions
	call	GetSaveSlotAddr
	add	XHL,0x10
	ld	XDE,wPlayerName
	ld	BC,0x26D
	ldir	(XDE+),(XHL+)
	ldw	(0x5076),0
	ret

c_20DC65	section	code abs=0x20DC65

; [code] slot 0 + 0x10 (GetSaveSlotAddr) -> 2 bytes at wOptionMessageSpeed (message speed, animation); LoadGameSlot with A = 0, BootLoadOptions when slot 0 is used
LoadOptions:
	ld	A,0
	call	GetSaveSlotAddr
	add	XHL,0x10
	ld	XDE,wOptionMessageSpeed
	ld	BC,2:16
	ldir	(XDE+),(XHL+)
	ret

c_20DC7C	section	code abs=0x20DC7C

; [code] wSaveMenuMode = 0 (Load), wSaveSlot = 1, ClearScr2Tilemap, DrawSaveSlotList
InitLoadSlotList:
	ldb	(wSaveMenuMode),0
	ldb	(wSaveSlot),1
	call	ClearScr2Tilemap
	calr	DrawSaveSlotList
	ret

c_20DC8E	section	code abs=0x20DC8E

; [code] wSaveMenuMode = 2 (Clear), wSaveSlot = 1, ClearScr2Tilemap, DrawSaveSlotList
InitClearSlotList:
	ldb	(wSaveMenuMode),2
	ldb	(wSaveSlot),1
	call	ClearScr2Tilemap
	calr	DrawSaveSlotList
	ret

c_20DDBC	section	code abs=0x20DDBC

; [code] header "Load"/"Save"/"Clear" by 0x5DF5 (SaveMenuLoadText ..), then slots 1-3: SaveSlotEmptyText if IsSaveSlotUsed NZ, else name (+0), partner name (+0x1C), levels (+0xF, +0x2B), emblem flags 0x10-0x13, GetRankTitle (+0x32) (rank_titles.txt header); [play] works_data_save_load_menu
DrawSaveSlotList:
	pushw	(XIZ+TASK_ARG)
	ld	A,(XIZ+0x10)
	ld	C,0xA
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	call	OpenTextBox
	cpb	(wSaveMenuMode),1
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

; [code] OpenTextBox (task +0x10 box, 0x12 x 3, tile TASK_ARG + 0x98) with "Load Ok?  Yes No" (wSaveMenuMode 0), "Clear Ok? Yes No" (2), "Over Ok?  Yes No" (1 and IsSaveSlotUsed wSaveSlot), else "Save Ok?  Yes No", placed at column 1 row 0x28; [play] data_save_ok_prompt
ShowSaveConfirmBox:
	ld	A,(XIZ+0x10)
	ld	C,0x12
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0x98
	call	OpenTextBox
	cpb	(wSaveMenuMode),0
	ld	XHL,LoadOkYesNoText
	jr	Z,ShowSaveConfirmBox.skip
	cpb	(wSaveMenuMode),2
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

; [code] same box with " Load Complete " (wSaveMenuMode 0), " Clear Complete" (2), else " Save Complete "; [play] data_load_ok_yes
ShowSaveDoneBox:
	ld	A,(XIZ+0x10)
	ld	C,0x12
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0x98
	call	OpenTextBox
	cpb	(wSaveMenuMode),0
	ld	XHL,LoadCompleteText
	jr	Z,ShowSaveDoneBox.skip
	cpb	(wSaveMenuMode),2
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

; [code] task (started by WorksLoadTask, WorksSaveTask, title.asm): cursor sprite at slot 0x5DF6, U/D wrap 1-3, A accepts (empty slots, IsSaveSlotUsed NZ, only when 0x5DF5 = 1 Save, else sound 0x83), B sets 0x5DF6 = 0; EndTask
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
	ld	WA,0x80
	call	SoundCommand
	decb	1,(wSaveSlot)
	ret	NZ
	ldb	(wSaveSlot),3
	ret
SaveSlotSelectTask.skip3:
	ld	WA,0x80
	call	SoundCommand
	incb	1,(wSaveSlot)
	cpb	(wSaveSlot),4
	ret	C
	ldb	(wSaveSlot),1
	ret
SaveSlotSelectTask.skip4:
	cpb	(wSaveMenuMode),1
	jr	Z,SaveSlotSelectTask.skip5
	ld	A,(wSaveSlot)
	call	IsSaveSlotUsed
	jr	Z,SaveSlotSelectTask.skip5
	ld	WA,0x83
	call	SoundCommand
	ret
SaveSlotSelectTask.skip5:
	ld	WA,0x81
	call	SoundCommand
	call	EndTask
	ret
SaveSlotSelectTask.skip6:
	ld	WA,0x82
	call	SoundCommand
	ldb	(wSaveSlot),0
	call	EndTask
	ret

c_20E131	section	code abs=0x20E131

; [code] task entry: wYesNoChoice = 2 (No), resume at YesNoPromptInput; started after ShowSaveConfirmBox
YesNoPromptTask:
	ldb	(wYesNoChoice),2
	ldw	(XIZ+TASK_FUNC),YesNoPromptInput & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),YesNoPromptInput >> 16
	ret

c_20E141	section	code abs=0x20E141

; [code+play] frame set by YesNoPromptTask (0x5DF7 = 2): cursor at x 0x58 + 0x20*(0x5DF7-1), D_LEFT 0x5DF7 = 1, D_RIGHT = 2 (sound 0x80), A -> sound 0x81 + EndTask, B -> 0x5DF7 = 0 + EndTask; callers MainMenuLoadTask and works.asm 463/631/665 all test 0x5DF7 == 1 after "Load/Save/Over/Clear Ok? Yes No" (ShowSaveConfirmBox / ShowSaveDoneBox texts LoadOkYesNoText .. SaveCompleteText)
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
	ld	WA,0x80
	call	SoundCommand
	ldb	(wYesNoChoice),1
	ret
YesNoPromptInput.skip2:
	cpb	(wYesNoChoice),2
	ret	Z
	ld	WA,0x80
	call	SoundCommand
	ldb	(wYesNoChoice),2
	ret
YesNoPromptInput.skip3:
	ld	WA,0x81
	call	SoundCommand
	call	EndTask
	ret
YesNoPromptInput.skip4:
	ld	WA,0x82
	call	SoundCommand
	ldb	(wYesNoChoice),0
	call	EndTask
	ret

c_20E1BC	section	code abs=0x20E1BC

; [code] task: counter +0x12 = 0x1E, EndTask when it reaches 0 (one decrement per frame); started after ShowSaveDoneBox
Wait30FramesTask:
	ldw	(XIZ+0x12),0x1E
	ldw	(XIZ+TASK_FUNC),Wait30FramesTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),Wait30FramesTask.resume >> 16
Wait30FramesTask.resume:
	decw	1,(XIZ+0x12)
	jp	Z,EndTask
	ret

c_21D5C5	section	code abs=0x21D5C5

; [code] boot task step (system.asm): wOptionMessageSpeed = 3, wOptionAnimation = 0xFF, LoadOptions when IsSaveSlotUsed 0 (Z), InitTextBoxes, then resume at 0x21D5E9
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
