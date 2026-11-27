; engine/menus/town/cyrius.asm: Cyrius's emblem trade in D-town

c_215AF1	section	code abs=0x215AF1

; [code] Cyrius state 0 (CyriusTalkDispatch): YesNoText at 0,2 in box 1, cursor 0, +0x2D = 0, state 1 (CyriusTradeYesNo); [play] dtown_cyrius_will_you_trade_yes_no, dtown_cyrius_trade_well_yes_no_*
DrawCyriusTradeYesNo:
	ld	C,0
	ld	E,2
	ld	A,1
	call	SetTextBoxCursor
	ld	A,1
	ld	XHL,YesNoText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A	; cursor +0x10: 0 Yes, 1 No
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,1
	ld	(XIZ+0x27),A	; +0x27 = Cyrius substate (CyriusTalkDispatch)
	ret

c_215B16	section	code abs=0x215B16

; [code+play] Cyrius state 1: L/R between 2 options, A/B set the next talk row
CyriusTradeYesNo:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CyriusTradeYesNo.skip
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	jr	CyriusTradeYesNo.skip7
CyriusTradeYesNo.skip:
	bit	BIT_B_BUTTON,A
	jr	Z,CyriusTradeYesNo.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,1	; B = No
	ld	(XIZ+0x10),A
	jr	CyriusTradeYesNo.skip7
CyriusTradeYesNo.skip2:
	and	A,D_PAD
	jr	Z,CyriusTradeYesNo.skip6
	cp	A,D_LEFT
	jr	NZ,CyriusTradeYesNo.skip4
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip3
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip3:
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip4:
	cp	A,D_RIGHT
	jr	NZ,CyriusTradeYesNo.skip6
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,CyriusTradeYesNo.skip5
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip5:
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip6:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x30	; Yes / No columns 0x20 and 0x50 pixels
	add	WA,0x20
	ld	BC,WA
	ld	DE,0x84
	call	DrawMenuCursor
	jr	CyriusTradeYesNo.done
; answered: +0x28 = 1 when EVENT_CYRIUS_TRADED (a return visit), which picks the second set of talk rows
CyriusTradeYesNo.skip7:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip9
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip8
	ld	A,0x1C	; No, return visit
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip8:
	ld	A,0x14	; No, first visit
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip9:
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip10
	ld	A,0x1D	; Yes, return visit
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip10:
	ld	A,0x15	; Yes, first visit
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip11:
	ld	(XIZ+0x12),A	; +0x12 = talk row, TASK_ARG 6 = TownTalkDispatch prints it
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+0x27),A
CyriusTradeYesNo.done:
	ret

c_215BCD	section	code abs=0x215BCD

; [code] newline, then GetItemOrPartDesc of CyriusTradeMenu[(wPlayerRace - 1) / 2][cursor +0x10] in box 1; callers DrawCyriusTradeMenu, CyriusTradeMenuInput
DrawCyriusTradeDesc:
	push	XHL
	push	XWA
	ld	XHL,NewlineText2
	ld	A,1
	call	DrawBoxString
	push	XHL
	push	XWA
; row of 6 words in CyriusTradeMenu per race pair: (wPlayerRace - 1) / 2
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	extz	WA
	extz	XWA
	mul	XWA,6
	sll	1,WA
	ld	XHL,CyriusTradeMenu
	add	XHL,XWA
	pop	XWA
	ld	A,(XIZ+0x10)
	extz	WA
	extz	XWA
	sll	1,XWA
	add	XHL,XWA
	ld	WA,(XHL)
	pop	XHL
	call	GetItemOrPartDesc
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XHL
	ret

c_215C14	section	code abs=0x215C14

; [code] Cyrius state 2: box 2 the 6 GetItemOrPartName of the CyriusTradeMenu row for (wPlayerRace - 1) / 2, QuitText4 at row 8, DrawCyriusTradeDesc, state 3 (CyriusTradeMenuInput)
DrawCyriusTradeMenu:
	push	XWA
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	extz	WA
	extz	XWA
	mul	XWA,6
	sll	1,WA
	ld	XHL,CyriusTradeMenu
	add	XHL,XWA
	pop	XWA
	ld	C,6	; 6 offers, one per row
	ld	E,0
DrawCyriusTradeMenu.loop:
	push	C
	push	E
	push	XHL
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	pop	XHL
	push	XHL
	ld	WA,(XHL)
	call	GetItemOrPartName
	ld	A,2
	call	DrawBoxString
	pop	XHL
	pop	E
	pop	C
	inc	1,E
	inc	2,XHL
; row 8 = Quit
	djnz	C,DrawCyriusTradeMenu.loop
	ld	C,0
	ld	E,8
	ld	A,2
	call	SetTextBoxCursor
	ld	XHL,QuitText4
	ld	A,2
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	call	ClearTextBox1
	calr	DrawCyriusTradeDesc
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,3
	ld	(XIZ+0x27),A
	ret

c_215C88	section	code abs=0x215C88

; [code+play] cursor over the 6 CyriusTradeMenu entries + cancel, names via GetItemOrPartName
CyriusTradeMenuInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CyriusTradeMenuInput.skip
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	jrl	CyriusTradeMenuInput.skip11
CyriusTradeMenuInput.skip:
	bit	BIT_B_BUTTON,A
	jr	Z,CyriusTradeMenuInput.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,8	; B = Quit (row 8)
	ld	(XIZ+0x10),A
	jrl	CyriusTradeMenuInput.skip11
CyriusTradeMenuInput.skip2:
	and	A,D_PAD
	jr	Z,CyriusTradeMenuInput.skip8
	cp	A,D_UP
	jr	NZ,CyriusTradeMenuInput.skip5
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
; up: 0 wraps to Quit, Quit goes to 5
	cp	A,0
	jr	Z,CyriusTradeMenuInput.skip3
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip4:
	ld	A,5
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip5:
	cp	A,D_DOWN
	jr	NZ,CyriusTradeMenuInput.skip8
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
; down: 5 goes to Quit, Quit wraps to 0
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip6
	cp	A,5
	jr	Z,CyriusTradeMenuInput.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip8:
	jr	CyriusTradeMenuInput.skip10
CyriusTradeMenuInput.skip9:
	calr	ResetTextBox1
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip10
	calr	DrawCyriusTradeDesc
CyriusTradeMenuInput.skip10:
	ld	BC,0x60
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,8	; rows 8 pixels apart
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	jrl	CyriusTradeMenuInput.done
; chosen: redraw only that name (or Quit) in box 2 and remember the offer word at +0x2A
CyriusTradeMenuInput.skip11:
	call	ClearBox2
	calr	ResetTextBox1
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip13
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	push	XHL
	push	XWA
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	extz	WA
	extz	XWA
	mul	XWA,6
	sll	1,WA
	ld	XHL,CyriusTradeMenu
	add	XHL,XWA
	pop	XWA
	ld	A,(XIZ+0x10)
	extz	WA
	extz	XWA
	sll	1,XWA
	add	XHL,XWA
	ld	WA,(XHL)
	pop	XHL
	ld	(XIZ+0x2A),WA	; +0x2A = chosen offer (item or part word)
	call	GetItemOrPartName
	ld	A,2
	call	DrawBoxString
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeMenuInput.skip12
	ld	A,0x1F
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip12:
	ld	A,0x18
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip13:
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	ld	XHL,QuitText4
	ld	A,2
	call	DrawBoxString
	ld	WA,0
	ld	(XIZ+0x2A),WA	; +0x2A = 0: nothing chosen
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeMenuInput.skip14
	ld	A,0x1E
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip14:
	ld	A,0x17
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip15:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+0x27),A
CyriusTradeMenuInput.done:
	ret

c_215DD9	section	code abs=0x215DD9

; [code] Cyrius state 4: YesNoText at 0,2 in box 1, cursor 0, +0x2D = 0, state 5 (CyriusTrade); [play] dtown_cyrius_trade_is_this_what_you_want; byte-identical copy of DrawHelmutYesNo (the ROM has each)
DrawCyriusConfirmYesNo:
	ld	C,0
	ld	E,2
	ld	A,1
	call	SetTextBoxCursor
	ld	A,1
	ld	XHL,YesNoText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,5
	ld	(XIZ+0x27),A
	ret

c_215DFE	section	code abs=0x215DFE

; [code+play] Cyrius's Emblem trade (dtown_cyrius_trade_* screens), GetStoryStage
CyriusTrade:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CyriusTrade.skip
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	jr	CyriusTrade.skip7
CyriusTrade.skip:
	bit	BIT_B_BUTTON,A
	jr	Z,CyriusTrade.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,1	; B = No
	ld	(XIZ+0x10),A
	jr	CyriusTrade.skip7
CyriusTrade.skip2:
	and	A,D_PAD
	jr	Z,CyriusTrade.skip6
	cp	A,D_LEFT
	jr	NZ,CyriusTrade.skip4
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTrade.skip3
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTrade.skip6
CyriusTrade.skip3:
	jr	CyriusTrade.skip6
CyriusTrade.skip4:
	cp	A,D_RIGHT
	jr	NZ,CyriusTrade.skip6
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,CyriusTrade.skip5
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTrade.skip6
CyriusTrade.skip5:
	jr	CyriusTrade.skip6
CyriusTrade.skip6:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x30
	add	WA,0x20
	ld	BC,WA
	ld	DE,0x84
	call	DrawMenuCursor
	jr	CyriusTrade.done
CyriusTrade.skip7:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTrade.skip9
	ld	A,2	; No: back to the menu (substate 2)
	ld	(XIZ+0x27),A
	call	ClearBox2
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTrade.skip8
	ld	A,0x20
	jr	CyriusTrade.skip13
CyriusTrade.skip8:
	ld	A,0x19
	jr	CyriusTrade.skip13
; Yes: give the offer; carry from AddItem = not given (talk row 0x48, no room?)
CyriusTrade.skip9:
	ld	WA,(XIZ+0x2A)
	call	AddItem
	jr	NC,CyriusTrade.skip10
	ld	A,2
	ld	(XIZ+0x27),A
	ld	A,0x48
	jr	CyriusTrade.skip13
CyriusTrade.skip10:
	call	ClearEmblemFlags	; the 4 emblems are the price
	call	GetStoryStage
	cp	A,0xA	; (?) stage 0xA+: the beaten-dungeon flags reset too so the bosses return
	jr	C,CyriusTrade.skip11
	call	ClearBeatenDungeonFlags
CyriusTrade.skip11:
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTrade.skip12
	ld	A,0x21
	jr	CyriusTrade.skip13
CyriusTrade.skip12:
	ld	A,0x1A
	jr	CyriusTrade.skip13
CyriusTrade.skip13:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
CyriusTrade.done:
	ret

c_215EDC	section	code abs=0x215EDC

; [code] town place task state 7 (TownPlaceTaskState6): switch on +0x27: 0 DrawCyriusTradeYesNo, 1 CyriusTradeYesNo, 2 DrawCyriusTradeMenu, 3 CyriusTradeMenuInput, 4 DrawCyriusConfirmYesNo, 5 CyriusTrade; +0x2D += 1; [play] dtown_cyrius_trade* screens
CyriusTalkDispatch:
	ld	A,(XIZ+0x27)
	cp	A,0
	jr	NZ,CyriusTalkDispatch.skip
	calr	DrawCyriusTradeYesNo
	jr	CyriusTalkDispatch.skip6
CyriusTalkDispatch.skip:
	cp	A,1
	jr	NZ,CyriusTalkDispatch.skip2
	calr	CyriusTradeYesNo
	jr	CyriusTalkDispatch.skip6
CyriusTalkDispatch.skip2:
	cp	A,2
	jr	NZ,CyriusTalkDispatch.skip3
	calr	DrawCyriusTradeMenu
	jr	CyriusTalkDispatch.skip6
CyriusTalkDispatch.skip3:
	cp	A,3
	jr	NZ,CyriusTalkDispatch.skip4
	calr	CyriusTradeMenuInput
	jr	CyriusTalkDispatch.skip6
CyriusTalkDispatch.skip4:
	cp	A,4
	jr	NZ,CyriusTalkDispatch.skip5
	calr	DrawCyriusConfirmYesNo
	jr	CyriusTalkDispatch.skip6
CyriusTalkDispatch.skip5:
	cp	A,5
	jr	NZ,CyriusTalkDispatch.skip6
	calr	CyriusTrade
	jr	CyriusTalkDispatch.skip6
CyriusTalkDispatch.skip6:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ret

c_216B38	section	code abs=0x216B38

; [code] ClearEventFlag 0x10-0x13 (EVENT_EMBLEM_*); called by CyriusTrade
ClearEmblemFlags:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_EMBLEM_GREEN
	ld	A,4
ClearEmblemFlags.loop:
	push	HL
	push	A
	call	ClearEventFlag
	pop	A
	pop	HL
	inc	1,HL
	djnz	A,ClearEmblemFlags.loop
	pop	A
	pop	BC
	pop	XHL
	ret

c_216B51	section	code abs=0x216B51

; [code] ClearEventFlag 0x60-0x63 (EVENT_BEAT_ENT, KRAKEN, ROC, BEHEMOTH: the beaten-dungeon flags BossEncounter sets and DrawBeatenDungeonMarkers reads); CyriusTrade calls it after a trade at story stage 0xA or later
ClearBeatenDungeonFlags:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_BEAT_ENT
	ld	A,4
ClearBeatenDungeonFlags.loop:
	push	HL
	push	A
	call	ClearEventFlag
	pop	A
	pop	HL
	inc	1,HL
	djnz	A,ClearBeatenDungeonFlags.loop
	pop	A
	pop	BC
	pop	XHL
	ret
