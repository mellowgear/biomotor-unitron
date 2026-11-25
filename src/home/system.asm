; home/system: 35 routines (each keeps its ROM address in its own section)

c_205FA3	section	code abs=0x205FA3

; header entry point: stack, clear RAM, init, main loop
Start:
	call	InitConsoleType
	jp	Reset

c_205FAB	section	code abs=0x205FAB

; main loop restarts here
Reset:
	di
	ldf	1
	ld	XSP,0x6C00
	ld	RW3,1
	ld	RBC3,0
	call	BiosCall
	ld	XWA,0
	ld	XHL,wTextBuffer
Reset.loop:
	ld	(XHL+),XWA
	cp	HL,0x6C00
	jr	C,Reset.loop
	orb	(TRUN),0x80
	ld	RW3,2
	ld	XHL3,wBootRtcTime
	call	BiosCall
	ld	RW3,0x10
	call	BiosCall
	call	InitSound
	call	ResetSoundState
	ld	XWA,0
	call	PlaySong
	ldb	(wVBlankWait),0
	ld	XHL,VBlankHandler
	ld	(VEC_VBLANK),XHL
	ld	WA,(wBootRtcTime)
	ld	BC,(wBootRtcTime+2)
	ld	DE,(wBootRtcTime+4)
	inc	1,DE
	calr	SetRandomSeeds
	call	InitDisplay
	call	InitTaskList
	call	InitJoypad
	call	InitMapScroll
	ldb	(wOptionMessageSpeed),3
	call	InitTextBoxes
	ld	XHL,BootLoadOptions
	call	StartTask
	ei	0
Reset.loop2:
	ldb	(wVBlankWait),0xFF
Reset.loop3:
	cpb	(wVBlankWait),0
	jr	NZ,Reset.loop3
	call	UpdateSpritesAndFade
	call	ReadJoypad
	call	UpdateTextBoxes
	call	UpdateMapScroll
	call	RunTasks
	call	SendQueuedSoundCommand
	cpb	(wJoyResetCombo),0
	jr	Z,Reset.loop2
	window_off
	jrl	Reset

c_206073	section	code abs=0x206073

; installed at VEC_VBLANK; frame counter, watchdog kick
VBlankHandler:
	push	XWA
	push	XBC
	push	XDE
	push	XHL
	push	XWA3
	push	XBC3
	push	XDE3
	push	XHL3
	ld	RW3,0x16
	call	BiosCall
	call	UpdateScrollRegisters
	call	MergeCs1CardInput
	ld	XWA,(wFrameCounter)
	inc	1,XWA
	ld	(wFrameCounter),XWA
	ldb	(wVBlankWait),0
	ldb	(WDCR),0x4E
	ld	RW3,0x15
	call	BiosCall
	pop	XHL3
	pop	XDE3
	pop	XBC3
	pop	XWA3
	pop	XHL
	pop	XDE
	pop	XBC
	pop	XWA
	reti

c_2060BE	section	code abs=0x2060BE

; [code] wRandomSeeds = WA, +2 = BC, +4 = DE; caller Reset
SetRandomSeeds:
	ld	(wRandomSeeds),WA
	ld	(wRandomSeeds+2),BC
	ld	(wRandomSeeds+4),DE
	ret

c_2060CB	section	code abs=0x2060CB

; -> WA: Wichmann-Hill (seeds wRandomSeeds; 171/30269, 172/30307, 170/30323)
Random:
	push	XBC
	ld	BC,(wRandomSeeds)
	mul	XBC,0xAB
	div	XBC,0x763D
	ld	WA,QBC
	ld	(wRandomSeeds),WA
	ld	BC,(wRandomSeeds+2)
	mul	XBC,0xAC
	div	XBC,0x7663
	ld	WA,QBC
	ld	(wRandomSeeds+2),WA
	ld	BC,(wRandomSeeds+4)
	mul	XBC,0xAA
	div	XBC,0x7673
	ld	WA,QBC
	ld	(wRandomSeeds+4),WA
	ld	BC,(wRandomSeeds)
	sll	16,XBC
	div	XBC,0x763D
	ld	WA,BC
	ld	BC,(wRandomSeeds+2)
	sll	16,XBC
	div	XBC,0x7663
	add	WA,BC
	ld	BC,(wRandomSeeds+4)
	sll	16,XBC
	div	XBC,0x7673
	add	WA,BC
	pop	XBC
	ret

c_20612E	section	code abs=0x20612E

; [code] HL = flag: set bit (HL & 15) of wEventFlags[HL >> 4]
SetEventFlag:
	ld	H,0
	extz	XHL
	ld	A,L
	srl	4,HL
	sll	1,HL
	ld	BC,1
	rlc	A,BC
	or	(XHL+0x5060),BC
	ret

c_206144	section	code abs=0x206144

; [code] HL = flag: clear it
ClearEventFlag:
	ld	H,0
	extz	XHL
	ld	A,L
	srl	4,HL
	sll	1,HL
	ld	BC,0xFFFE
	rlc	A,BC
	and	(XHL+0x5060),BC
	ret

c_20615B	section	code abs=0x20615B

; HL = flag -> NZ if bit (HL & 15) of wEventFlags[HL >> 4] is set
CheckEventFlag:
	push	A
	push	BC
	ld	H,0
	extz	XHL
	ld	A,L
	srl	4,HL
	sll	1,HL
	ld	BC,1
	rlc	A,BC
	ld	HL,(XHL+0x5060)
	and	HL,BC
	scc	NZ,HL
	pop	BC
	pop	A
	ret

c_206197	section	code abs=0x206197

; [code] WA = item id: count + 1 (max 9), bit 7 set; C if already 9
AddItem:
	ld	XHL,wItemCounts
	ld	C,(XHL+WA)
	and	C,0xF
	cp	C,9
	ccf
	ret	C
	inc	1,C
	or	C,0x80
	ld	(XHL+WA),C
	rcf
	ret

c_2061B6	section	code abs=0x2061B6

; [code] W + 1, then RemoveItem: the part counterpart of RemoveItem (count byte wItemCounts + 0x100 + index - 1); no callers
RemovePart:
	inc	1,W

c_2061B8	section	code abs=0x2061B8

; [code+play] WA = item id: count - 1, bit 7 (seen) kept; C if none held
RemoveItem:
	ld	XHL,wItemCounts
	ld	C,(XHL+WA)
	and	C,0xF
	scf
	ret	Z
	dec	1,C
	or	C,0x80
	ld	(XHL+WA),C
	rcf
	ret

c_206250	section	code abs=0x206250

; clears 32 task slots at 0x5282, empty list at wTaskList
InitTaskList:
	ld	XWA,0
	ld	XHL,wTasks
	ld	BC,0x20
InitTaskList.loop:
	ld	(XHL+0),WA
	ld	(XHL+6),WA
	ld	(XHL+0xC),WA
	ld	(XHL+8),XWA
	add	HL,0x2E
	djnz	BC,InitTaskList.loop
	ldw	(wTaskList+2),wTaskList+4
	ldw	(wTaskList),wTaskList+4
	ldw	(wTaskList+6),wTaskList
	ldw	(wTaskList+4),wTaskList
	ret

c_206286	section	code abs=0x206286

; walks the task list, calls each task's function (+8)
RunTasks:
	ld	XIZ,0
	ld	IZ,(wTaskList+2)
RunTasks.loop:
	cp	IZ,wTaskList+4
	jr	Z,RunTasks.done
	bit	7,(XIZ+7)
	jr	NZ,RunTasks.skip3
	res	6,(XIZ+7)
	ld	XHL,(XIZ+TASK_FUNC)
	ld	XIY,0
	ld	IY,(XIZ+4)
	push	IY
	push	IZ
	call	XHL
	ld	XIZ,0
	pop	IZ
	ld	XIY,0
	pop	IY
	or	IY,IY
	jr	Z,RunTasks.skip2
	bit	7,(XIY+7)
	jr	Z,RunTasks.skip
	ldw	(XIZ+4),0
RunTasks.skip:
	bit	6,(XIY+7)
	jr	Z,RunTasks.skip2
	orb	(XIZ+7),0xC0
RunTasks.skip2:
	ld	IZ,(XIZ+2)
	jr	RunTasks.loop
RunTasks.skip3:
	ld	XDE,0
	ld	DE,(XIZ+4)
	or	DE,DE
	jr	Z,RunTasks.skip4
	decw	1,(XDE+0xC)
RunTasks.skip4:
	ld	DE,(XIZ+0)
	ld	XHL,0
	ld	HL,(XIZ+2)
	ld	(XDE+2),HL
	ld	(XHL+0),DE
	ldw	(XIZ+0),0
	ldw	(XIZ+6),0
	ld	IZ,HL
	decb	1,(wTaskCount)
	jr	RunTasks.loop
RunTasks.done:
	ret

c_2062F5	section	code abs=0x2062F5

; [code] like StartChildTask but without a parent: wTaskCount += 1, free slot (FindFreeTaskSlot, C = none), links the new task last before the list tail wTaskList+4, +4 parent = 0, +8 = XHL function, +0xC = 0; callers Reset, BattleStart, BattleVictory, BattleDefeat, StartBattleTask (BattleStart)
StartTask:
	incb	1,(wTaskCount)
	ld	XDE,XHL
	call	FindFreeTaskSlot
	ret	C
	ld	XWA,0
	ld	WA,(wTaskList+4)
	ld	(XWA+2),HL
	ld	(wTaskList+4),HL
	ld	(XHL+0),WA
	ldw	(XHL+2),wTaskList+4
	ld	(XHL+8),XDE
	ldw	(XHL+4),0
	ldw	(XHL+0xC),0
	ret

c_206324	section	code abs=0x206324

; [code] XHL = function -> XHL = new task after the current one; the current task waits for it (+0xC)
StartChildTask:
	incb	1,(wTaskCount)
	ld	XDE,XHL
	call	FindFreeTaskSlot
	ret	C
	ld	XWA,0
	ld	WA,(XIZ+2)
	ld	(XWA+0),HL
	ld	(XIZ+2),HL
	ld	(XHL+0),IZ
	ld	(XHL+2),WA
	ld	(XHL+8),XDE
	ld	(XHL+4),IZ
	ldw	(XHL+0xC),0
	incw	1,(XIZ+TASK_CHILDREN)
	ret

c_206350	section	code abs=0x206350

; [code] XHL = first wTasks slot (0x2E bytes each, up to wTaskList) whose byte +0 is 0 (Z); none: XHL = 0 and carry; callers StartTask, StartChildTask
FindFreeTaskSlot:
	ld	XHL,wTasks
FindFreeTaskSlot.loop:
	cpb	(XHL+0),0
	ret	Z
	add	HL,0x2E
	cp	HL,wTaskList
	jr	C,FindFreeTaskSlot.loop
	ld	XHL,0
	scf
	ret

c_206369	section	code abs=0x206369

; [code] marks the current task finished (bit 7 of +7); RunTasks unlinks it and wakes the parent
EndTask:
	set	7,(XIZ+7)
	ret

c_20636D	section	code abs=0x20636D

; [code] sets bit 6 of the current task's +7; RunTasks gives a task whose parent (+4) has bit 6 set +7 |= 0xC0 (ended, and passes it on to its own children); RunTasks clears bit 6 before each call
EndChildTasks:
	set	6,(XIZ+7)
	ret

c_206FC1	section	code abs=0x206FC1

; [code] wMapScrollStepX/Y = 0, wScr1ScrollX/Y = low bytes of wMapScrollX/Y, then DrawMapScreen from cell (wMapScrollX >> 4) - 2, (wMapScrollY >> 4) - 2
RedrawMapAtScroll:
	ld	WA,0
	ld	(wMapScrollStepX),WA
	ld	(wMapScrollStepY),WA
	ld	BC,(wMapScrollX)
	ld	(wScr1ScrollX),C
	sra	4,BC
	ld	DE,(wMapScrollY)
	ld	(wScr1ScrollY),E
	sra	4,DE
	dec	2,BC
	dec	2,DE
	call	DrawMapScreen
	ret

c_206FEA	section	code abs=0x206FEA

; [code] zeroes wJoyHistoryIndex, wJoyHeld, wJoyPressed, wJoyReleased, wJoyResetCombo and the 256-byte wJoyHistory (0x40 longwords), 0x5CDD = SYS_LEVER; only caller Reset
InitJoypad:
	ld	XWA,0
	ld	(wJoyHistoryIndex),A
	ld	(wJoyHeld),A
	ld	(wJoyPressed),A
	ld	(wJoyReleased),A
	ld	(wJoyResetCombo),A
	ld	XHL,wJoyHistory
	ld	C,0x40
InitJoypad.loop:
	ld	(XHL+),XWA
	djnz	C,InitJoypad.loop
	ldb	(0x5CDD),(SYS_LEVER)
	ret

c_207014	section	code abs=0x207014

; per frame: wJoyHistory, wJoyHeld / wJoyPressed / wJoyReleased
ReadJoypad:
	ld	XHL,wJoyHistory
	ld	E,(wJoyHistoryIndex)
	ld	D,0
	ldb	(XHL+DE),(SYS_LEVER)
	ldb	(wJoyHeld),(SYS_LEVER)
	dec	1,E
	ld	A,(XHL+DE)
	inc	1,E
	xor	A,(XHL+DE)
	ld	W,A
	and	A,(XHL+DE)
	ld	(wJoyPressed),A
	ld	A,(XHL+DE)
	cpl	A
	and	W,A
	ld	(wJoyReleased),W
	ld	W,0x3C
	sub	E,W
	ld	A,0xFF
ReadJoypad.loop:
	and	A,(XHL+DE)
	inc	1,E
	djnz	W,ReadJoypad.loop
	and	A,0x70
	cp	A,0x70
	scc	Z,A
	or	(wJoyResetCombo),A
	incb	1,(wJoyHistoryIndex)
	ret

c_208134	section	code abs=0x208134

; [code] (Random1To10 - 1) * 10 + Random1To10 -> WA = 1..100; no caller found
Random1To100:
	call	Random1To10
	dec	1,A
	mul	WA,0xA
	push	WA
	call	Random1To10
	add	WA,(XSP+)
	ret

c_208146	section	code abs=0x208146

; [code] WA = 10, jp RandomRange -> WA = 1..10
Random1To10:
	ld	WA,0xA
	jp	RandomRange

c_20814D	section	code abs=0x20814D

; WA = n -> 1..n
RandomRange:
	push	BC
	push	WA
	call	Random
	extz	XWA
	pop	BC
	div	XWA,BC
	pop	BC
	ld	WA,QWA
	inc	1,WA
	ret

c_21717A	section	code abs=0x21717A

; [code] jp XHL (callers call it to make an indirect call)
CallXHL:
	jp	XHL

c_2171A8	section	code abs=0x2171A8

; [code] the caller's return address becomes the task's resume point (TASK_FUNC), back to RunTasks
TaskYield:
	pop	XWA
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_219807	section	code abs=0x219807

; [code] FillScr2Rect 0 over 12x14 at 0,0 and FillTiles 0x126 x 0xA8
ClearScr2Picture:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	FillScr2Rect
	ld	WA,0x126
	ld	QA,0
	ld	BC,0xA8
	call	FillTiles
	ret

c_219823	section	code abs=0x219823

; [code] A = flag -> C if set
CheckEventFlagA:
	ld	L,A
	extz	HL
	call	CheckEventFlag
	or	HL,HL
	ret	Z
	scf
	ret

c_219831	section	code abs=0x219831

; [code] A = flag -> SetEventFlag
SetEventFlagA:
	ld	L,A
	extz	HL
	call	SetEventFlag
	ret

c_21983A	section	code abs=0x21983A

; [code] A = flag -> ClearEventFlag (the counterpart of SetEventFlagA)
ClearEventFlagA:
	ld	L,A
	extz	HL
	call	ClearEventFlag
	ret

c_219864	section	code abs=0x219864

; [code] coroutine: saves the return address, waits 0x1E frames, resumes
Wait30Frames:
	pop	XDE
	ld	(wTextWaitReturn),XDE
	call	WaitMessage
	ld	A,0x1E
	call	WaitFramesOrButton
	ld	XHL,(wTextWaitReturn)
	jp	XHL

c_219879	section	code abs=0x219879

; [code] coroutine: resumes on A/B/left/right or after 0x3C frames
WaitForButton:
	pop	XDE
	ld	(wTextWaitReturn),XDE
	ldb	(wWaitButtonTimer),0x3C
WaitForButton.loop:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,WaitForButton.skip2
	bit	5,A
	jp	NZ,WaitForButton.skip2
	bit	2,A
	jp	NZ,WaitForButton.skip2
	bit	3,A
	jp	NZ,WaitForButton.skip2
	bit	0,A
	jp	NZ,WaitForButton.skip2
	bit	1,A
	jp	NZ,WaitForButton.skip2
	ld	XHL,(wMsgPending)
	or	XHL,XHL
	jr	NZ,WaitForButton.skip
	ld	A,(wMsgBox)
	call	IsTextBoxPrinting
	jr	C,WaitForButton.skip
	cpb	(wWaitButtonTimer),0
	jp	Z,WaitForButton.skip2
	decb	1,(wWaitButtonTimer)
WaitForButton.skip:
	call	TaskYield
	jr	WaitForButton.loop
WaitForButton.skip2:
	ld	XHL,(wTextWaitReturn)
	jp	XHL

c_21D9B9	section	code abs=0x21D9B9

; [code] VBlankHandler, every frame: only with OS_VERSION 0x10, byte 0x6C59 != 0 and byte 0x6C5B != 1: A = port 0xB0 | ~byte 0x9FFFFE is stored at 0x6E97 and the value stored there the frame before is ORed into SYS_LEVER (old & new | released bits = the old value); 0x6C59 is the BIOS's flash type byte for a card on CS1 (0x800000, the development board's slot; 0x6C58 is the cartridge's) and 0x9FFFFE the top of that window: a joypad input hook for a CS1 (development) card (was MergeCs1CardInput)
; [play] seen in play: 0x6C59 and 0x6C5B stay 0 on a retail cartridge (nothing writes them), so the hook exits at the 0x6C59 test every frame
MergeCs1CardInput:
	cpb	(OS_VERSION),0x10
	jr	NZ,MergeCs1CardInput.done
	cpb	(0x6C59),0
	jr	Z,MergeCs1CardInput.done
	cpb	(0x6C5B),1
	jr	Z,MergeCs1CardInput.done
	push	WA
	ld	A,(0xB0)
	ld	W,(0x9FFFFE)
	cpl	W
	or	A,W
	ex	(0x6E97),A
	ld	W,A
	xor	A,(0x6E97)
	and	W,A
	cpl	A
	and	A,(0x6E97)
	or	A,W
	or	(SYS_LEVER),A
	pop	WA
MergeCs1CardInput.done:
	ret

c_21D9F5	section	code abs=0x21D9F5

; SDK SYSTEM_CALL: RW3 = function, jumps through 0xFFFE00
BiosCall:
	push	SR
	ldf	3
	push	XIX
	add	W,W
	add	W,W
	ld	XIX,0xFFFE00
	ld	XIX,(XIX+W)
	call	XIX
	pop	XIX
	pop	SR
	ret

c_21DA0C	section	code abs=0x21DA0C

; checks OS version byte (mono NGP vs Color)
InitConsoleType:
	cpb	(OS_VERSION),0
	jr	NZ,InitConsoleType.done
	res	3,(0x6F83)
	ldb	(0x6DA0),0
InitConsoleType.done:
	ret
