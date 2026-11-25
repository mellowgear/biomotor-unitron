; engine/menus/new_game.asm: new game: Select Player, name entry, names confirm, default names

c_20F7AD	section	code abs=0x20F7AD

; [play] Select Player screen task (select_player_* screens only)
SelectPlayerTask:
	ld	WA,0x14
	call	PlayMusic
	ld	WA,0x35
	call	SoundCommand
	call	ClearTilemapScr1
	call	ClearTilemapScr2
	calr	OpenSelectPlayerBoxes
	ld	XHL,SelectPlayerNames
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	NZ,PlayerNameEntryTask
	ldb	(wPlayerRace),0
	ldb	(wPartnerRace),0
	call	EndTask
	ret

c_20F7F3	section	code abs=0x20F7F3

; [code+play] NameEntryScreen for the player (EnterYourNameText); OK -> partner, cancel -> SelectPlayerTask
PlayerNameEntryTask:
	call	ClearTilemapScr1
	call	ClearTilemapScr2
	ldw	(XIZ+TASK_ARG),0
	calr	NameEntryScreen
	ld	XHL,NameEntrySetup
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	NZ,NameEntryTask
	jr	SelectPlayerTask

c_20F823	section	code abs=0x20F823

; [code+play] runs NameEntryScreen (name_entry* / names_confirm)
NameEntryTask:
	ldw	(XIZ+TASK_ARG),1
	calr	NameEntryScreen
	ld	XHL,NameEntrySetup
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	Z,PlayerNameEntryTask
	call	ClearTilemapScr1
	call	ClearTilemapScr2
	calr	OpenSelectPlayerBoxes
	ld	XHL,ConfirmNames
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	Z,PlayerNameEntryTask
	call	EndTask
	ret

c_20F877	section	code abs=0x20F877

; [code+play] child task: draws the 6 entered chars and the blinking cursor
DrawEnteredNameTask:
	ld	A,0
	call	GetTextBox
	ld	C,0xB
	ld	E,1
	call	SetTextBoxCursorXWA
	ld	HL,(XIY+0x1A)
	call	DrawTextChar
	ld	HL,(XIY+0x1C)
	call	DrawTextChar
	ld	HL,(XIY+0x1E)
	call	DrawTextChar
	ld	HL,(XIY+0x20)
	call	DrawTextChar
	ld	HL,(XIY+0x22)
	call	DrawTextChar
	ld	HL,(XIY+0x24)
	call	DrawTextChar
	incw	1,(XIZ+TASK_ARG)
	ld	A,(XIZ+TASK_ARG)
	and	A,0x10
	jr	Z,DrawEnteredNameTask.done
	ld	A,0
	call	GetTextBox
	ld	C,(XIY+0x18)
	cp	C,6
	jr	GE,DrawEnteredNameTask.done
	add	C,0xB
	ld	E,1
	call	SetTextBoxCursorXWA
	ld	L,(NameEntryCursorChar)
	call	DrawTextChar
DrawEnteredNameTask.done:
	ret

c_20F8DA	section	code abs=0x20F8DA

; [play] name_entry, select_player_confirm
NameEntrySetup:
	ld	XHL,DrawEnteredNameTask
	call	StartChildTask
	ld	WA,0xD8
	ld	XHL,Gfx_2C8D88
	call	LoadCompressedTiles
	ld	A,1
	ld	C,1
	ld	XHL,NameEntryCursorPal
	call	LoadPalettes
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),1
	ldw	(XIZ+0x16),1
	ldw	(XIZ+0x18),0
	ldw	(XIZ+0x1A),0
	ldw	(XIZ+0x1C),0
	ldw	(XIZ+0x1E),0
	ldw	(XIZ+0x20),0
	ldw	(XIZ+0x22),0
	ldw	(XIZ+0x24),0
	ldw	(XIZ+0x26),0x10
	ldw	(XIZ+0x28),0
	ldw	(XIZ+0x2A),0
	ld	XDE,wPlayerName
	ld	A,(wPlayerRace)
	cpw	(XIY+0xE),0
	jr	Z,NameEntrySetup.skip
	ld	XDE,wPartnerName
	ld	A,(wPartnerRace)
NameEntrySetup.skip:
	ld	XHL,XIZ
	add	XHL,0x1A
NameEntrySetup.loop:
	cpb	(XDE),0xFF
	jr	Z,NameEntryStartInput
	incw	1,(XIZ+0x18)
	ld	WA,0
	ld	A,(XDE+)
	ld	(XHL+),WA
	jr	NameEntrySetup.loop

c_20F97A	section	code abs=0x20F97A

; [code] end of NameEntrySetup (after the old name, if any, is copied into the char words +0x1A..+0x24, count +0x18): TASK_FUNC = NameEntryInput (0x20F985)
NameEntryStartInput:
	ldw	(XIZ+TASK_FUNC),NameEntryInput & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),NameEntryInput >> 16
	ret

c_20F985	section	code abs=0x20F985

; [code] NameEntrySetup's resume step (TASK_FUNC 0x20F985 at NameEntryStartInput): d-pad key repeat (+0x26: 0x10 frames, then every 7), moves on the OK / character grid (+0x16 = 1: the bottom row +0x14; else column TASK_ARG 0-9, row +0x10), A adds NameEntryChars[row * 10 + column + 1] (up to 6 chars), B deletes, A on OK -> StoreEnteredName; [play] name_entry_typing
NameEntryInput:
	ld	A,(wJoyHeld)
	cp	A,(XIZ+0x29)
	jr	NZ,NameEntryNewKeys
	decw	1,(XIZ+0x26)
	cpw	(XIZ+0x26),0
	jr	Z,NameEntryRepeatKeys
	ldb	(XIZ+0x28),0
	jr	NameEntryNewKeys.skip

c_20F99E	section	code abs=0x20F99E

; [code] NameEntryInput, held keys unchanged and the repeat timer +0x26 run out: the held keys act as pressed (+0x28 = wJoyHeld), next repeat in 7 frames
NameEntryRepeatKeys:
	ld	A,(wJoyHeld)
	ld	(XIZ+0x29),A
	ld	(XIZ+0x28),A
	ldw	(XIZ+0x26),7
	jr	NameEntryNewKeys.skip

c_20F9AF	section	code abs=0x20F9AF

; [code] NameEntryInput, held keys changed: repeat timer +0x26 = 0x10, +0x28 = wJoyPressed; on the grid (+0x16 = 0) -> NameEntryGridInput; on the Cancel / End column (+0x16 = 1) left / right only play sound 0x80, up from Cancel (+0x14 0) goes to grid row 8, down -> NameEntryCancelEndDown
NameEntryNewKeys:
	ldw	(XIZ+0x26),0x10
	ld	A,(wJoyPressed)
	ld	(XIZ+0x28),A
	ld	A,(wJoyHeld)
	ld	(XIZ+0x29),A
NameEntryNewKeys.skip:
	cpw	(XIZ+0x16),1
	jrl	NZ,NameEntryGridInput
	ld	A,(XIZ+0x28)
	and	A,4
	jr	Z,NameEntryNewKeys.skip2
	ld	WA,0x80
	call	SoundCommand
NameEntryNewKeys.skip2:
	ld	A,(XIZ+0x28)
	and	A,8
	jr	Z,NameEntryNewKeys.skip3
	ld	WA,0x80
	call	SoundCommand
NameEntryNewKeys.skip3:
	ld	A,(XIZ+0x28)
	and	A,1
	jr	Z,NameEntryCancelEndDown
	ld	WA,0x80
	call	SoundCommand
	decw	1,(XIZ+0x14)
	cpw	(XIZ+0x14),0xFFFF
	jr	NZ,NameEntryCancelEndDown
	ldw	(XIZ+0x16),0
	ldw	(XIZ+0x10),8
	ret

c_20FA0C	section	code abs=0x20FA0C

; [code] Cancel / End column, down: +0x14 + 1 (0 Cancel, 1 End), down from End goes to grid row 0 (+0x16 = 0, +0x10 = 0)
NameEntryCancelEndDown:
	ld	A,(XIZ+0x28)
	and	A,2
	jr	Z,NameEntryCancelEndA
	ld	WA,0x80
	call	SoundCommand
	incw	1,(XIZ+0x14)
	cpw	(XIZ+0x14),2
	jr	NZ,NameEntryCancelEndA
	ldw	(XIZ+0x16),0
	ldw	(XIZ+0x10),0
	ret

c_20FA30	section	code abs=0x20FA30

; [code] Cancel / End column, A: +0x14 = 1 (End) -> NameEntryEnd; else (Cancel) sound 0x82, parent +0x10 = 0, EndChildTasks, EndTask; no A -> NameEntryCancelEndCursor
NameEntryCancelEndA:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jrl	Z,NameEntryCancelEndCursor
	ld	WA,(XIZ+0x14)
	cp	WA,0
	jr	Z,NameEntryCancelEndA.skip
	cp	WA,1
	jr	Z,NameEntryEnd
NameEntryCancelEndA.skip:
	ld	WA,0x82
	call	SoundCommand
	ldb	(XIY+0x10),0
	call	EndChildTasks
	call	EndTask
	ret

c_20FA59	section	code abs=0x20FA59

; [code] A on End: no char entered (+0x18 = 0) -> sound 0x83 and stay; else NameEntryEndCheckBlank
NameEntryEnd:
	ld	BC,(XIZ+0x18)
	cp	BC,0
	jr	NZ,NameEntryEndCheckBlank
	ld	WA,0x83
	call	SoundCommand
	jr	NameEntryCancelEndCursor

c_20FA69	section	code abs=0x20FA69

; [code] A on End with chars: all six char words 0 (code 0 = space in the charmap) -> sound 0x83 and stay; else StoreEnteredName
NameEntryEndCheckBlank:
	ld	WA,(XIZ+0x1A)
	add	WA,(XIZ+0x1C)
	add	WA,(XIZ+0x1E)
	add	WA,(XIZ+0x20)
	add	WA,(XIZ+0x22)
	add	WA,(XIZ+0x24)
	cp	WA,0
	jr	NZ,StoreEnteredName
	ld	WA,0x83
	call	SoundCommand
	jr	NameEntryCancelEndCursor

c_20FA88	section	code abs=0x20FA88

; [code] entered chars -> wPlayerName (0x5013) or wPartnerName (0x502F), 0xFF-terminated
StoreEnteredName:
	ld	WA,0x81
	call	SoundCommand
	ld	DE,0x5013
	cpw	(XIY+0xE),0
	jr	Z,StoreEnteredName.skip
	ld	DE,0x502F
StoreEnteredName.skip:
	ld	WA,0x81
	call	SoundCommand
	extz	XDE
	ld	HL,0x1A
	extz	XHL
	add	XHL,XIZ
StoreEnteredName.loop:
	ld	WA,(XHL+)
	ld	(XDE+),A
	djnz	BC,StoreEnteredName.loop
	ldb	(XDE),0xFF
	call	EndChildTasks
	call	EndTask
	ldw	(XIY+0x10),1
	ret

c_20FAC6	section	code abs=0x20FAC6

; [code] blinking cursor of the Cancel / End column: while bit 4 of the counter +0x2A is set, DrawSpriteGrid at x 0, y = word NameEntryCancelEndCursorY[+0x14]
NameEntryCancelEndCursor:
	incw	1,(XIZ+0x2A)
	ld	WA,(XIZ+0x2A)
	and	WA,0x10
	jr	Z,NameEntryCancelEndCursor.done
	ld	BC,0
	ld	HL,(XIZ+0x14)
	extz	XHL
	sll	1,XHL
	add	XHL,NameEntryCancelEndCursorY
	ld	DE,(XHL)
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
NameEntryCancelEndCursor.done:
	ret

c_20FAF2	section	code abs=0x20FAF2

; [code] grid keys: left / right move the column TASK_ARG 0-9 (wrapping), down moves the row +0x10; down from row 8 goes to End (+0x16 = 1, +0x14 = 1); then NameEntryGridUp
NameEntryGridInput:
	ld	A,(XIZ+0x28)
	and	A,4
	jr	Z,NameEntryGridInput.skip
	ld	WA,0x80
	call	SoundCommand
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xFFFF
	jr	NZ,NameEntryGridInput.skip
	ldw	(XIZ+TASK_ARG),9
NameEntryGridInput.skip:
	ld	A,(XIZ+0x28)
	and	A,8
	jr	Z,NameEntryGridInput.skip2
	ld	WA,0x80
	call	SoundCommand
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xA
	jr	NZ,NameEntryGridInput.skip2
	ldw	(XIZ+TASK_ARG),0
NameEntryGridInput.skip2:
	ld	A,(XIZ+0x28)
	and	A,2
	jr	Z,NameEntryGridUp
	ld	WA,0x80
	call	SoundCommand
	incw	1,(XIZ+0x10)
	cpw	(XIZ+0x10),9
	jr	LT,NameEntryGridUp
	ldw	(XIZ+0x16),1
	ldw	(XIZ+0x14),1
	ret

c_20FB52	section	code abs=0x20FB52

; [code] grid, up: row +0x10 - 1; up from row 0 goes to End (+0x16 = 1, +0x14 = 1); then NameEntryGridA
NameEntryGridUp:
	ld	A,(XIZ+0x28)
	and	A,1
	jr	Z,NameEntryGridA
	ld	WA,0x80
	call	SoundCommand
	decw	1,(XIZ+0x10)
	cpw	(XIZ+0x10),0xFFFF
	jr	GT,NameEntryGridA
	ldw	(XIZ+0x16),1
	ldw	(XIZ+0x14),1
	ret

c_20FB76	section	code abs=0x20FB76

; [code] grid, A: with 6 chars already the cursor moves to End (sound 0x83), else sound 0x81; then NameEntryChars[row * 10 + column + 1] -> NameEntryAddChar (also when full: it lands in word +0x26 and the count goes back to 6)
NameEntryGridA:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	Z,NameEntryAddChar.skip3
	ld	WA,(XIZ+0x18)
	cp	WA,6
	jr	GE,NameEntryGridA.skip
	ld	WA,0x81
	call	SoundCommand
	jr	NameEntryGridA.skip2
NameEntryGridA.skip:
	ldw	(XIZ+0x14),1
	ldw	(XIZ+0x16),1
	ld	WA,0x83
	call	SoundCommand
NameEntryGridA.skip2:
	ld	BC,(XIZ+0x10)
	mul	XBC,0xA
	ld	DE,(XIZ+TASK_ARG)
	inc	1,DE
	add	BC,DE
	cpw	(XIZ+0x12),0
	jr	Z,NameEntryAddChar
	add	XBC,NameEntryChars
	ld	A,(XBC)
	jr	NameEntryAddChar.skip2

c_20FBBF	section	code abs=0x20FBBF

; [code] A = char -> char word +0x1A + 2 * count, count +0x18 + 1 (7 -> 6); B (only after a full name or without A) deletes the last char (sound 0x82, 0x83 at none left); then the blinking grid cursor (NameEntryCursorMap / NameEntryCursorAltMap, DrawSpriteMap at 8 * column + 4, 8 * row + 0x24)
NameEntryAddChar:
	add	XBC,NameEntryChars
	ld	A,(XBC)
NameEntryAddChar.skip2:
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	1,HL
	add	HL,0x1A
	add	XHL,XIZ
	extz	WA
	ld	(XHL),WA
	incw	1,(XIZ+0x18)
	cpw	(XIZ+0x18),7
	jr	Z,NameEntryAddChar.skip
	jr	NameEntryAddChar.skip5
NameEntryAddChar.skip:
	ldw	(XIZ+0x18),6
NameEntryAddChar.skip3:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	Z,NameEntryAddChar.skip5
	ld	WA,0x82
	call	SoundCommand
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	1,HL
	add	HL,0x1A
	add	XHL,XIZ
	ldw	(XHL),0
	decw	1,(XIZ+0x18)
	cpw	(XIZ+0x18),0xFFFF
	jr	NZ,NameEntryAddChar.skip4
	ld	WA,0x83
	call	SoundCommand
	ldw	(XIZ+0x18),0
NameEntryAddChar.skip4:
	ld	WA,0x82
	call	SoundCommand
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	1,HL
	add	HL,0x1A
	add	XHL,XIZ
	ldw	(XHL),0
NameEntryAddChar.skip5:
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,(XIZ+0x10)
	mul	XBC,8
	mul	XDE,8
	add	BC,4
	add	DE,0x24
	ld	XHL,NameEntryCursorMap
	incw	1,(XIZ+0x2A)
	ld	WA,(XIZ+0x2A)
	and	WA,0x10
	jr	Z,NameEntryAddChar.skip6
	ld	XHL,NameEntryCursorAltMap
NameEntryAddChar.skip6:
	ld	WA,0xD8
	call	DrawSpriteMap
	ret

c_20FC6F	section	code abs=0x20FC6F

; [code] DrawString NameEntryChars at 0,0 of text box 1
DrawNameEntryChars:
	ld	A,1
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,NameEntryChars
	call	DrawString
	ret

c_20FC87	section	code abs=0x20FC87

; [code] Enter your name / partner name
NameEntryScreen:
	ld	A,0
	ld	C,0x14
	ld	E,4
	ld	HL,0xC
	call	OpenTextBox
	ld	A,0
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	PlaceTextBoxXWA
	ld	XHL,EnterYourNameText
	cpw	(XIZ+TASK_ARG),0
	jr	Z,NameEntryScreen.skip
	ld	XHL,EnterPartnerNameText
NameEntryScreen.skip:
	call	DrawString
	ld	A,(wPlayerRace)
	extz	WA
	ld	HL,WA
	cpw	(XIZ+TASK_ARG),0
	jr	Z,NameEntryScreen.skip2
	ld	A,(wPartnerRace)
	extz	WA
	ld	HL,WA
NameEntryScreen.skip2:
	add	HL,0xA
	ld	WA,0xDA
	ld	BC,0xD
	ld	DE,4
	call	DrawPortraitAt
	ld	A,1
	ld	C,0xA
	ld	E,9
	ld	HL,0x30
	call	OpenTextBoxNoWait
	ld	A,1
	call	GetTextBox
	ld	C,1
	ld	E,5
	call	PlaceTextBoxXWA
	ld	XHL,NameEntryChars
	call	DrawString
	ld	A,3
	ld	C,6
	ld	E,2
	ld	HL,0xBA
	call	OpenTextBoxNoWait
	ld	A,3
	call	GetTextBox
	ld	C,1
	ld	E,0xF
	call	PlaceTextBoxXWA
	ld	XHL,CancelEndText
	call	DrawString
	ld	A,2
	ld	C,0xD
	ld	E,5
	ld	HL,0x8A
	call	OpenTextBox
	ld	A,2
	call	GetTextBox
	ld	C,7
	ld	E,0xE
	call	PlaceTextBoxXWA
	ld	XHL,SelectPutBackText
	call	DrawString
	ret

c_20FD4B	section	code abs=0x20FD4B

; [code] text boxes 0-5 at fixed places + raw tiles 0x2C861B (Select Player / name confirm)
OpenSelectPlayerBoxes:
	ld	A,5
	ld	C,9
	ld	E,1
	ld	HL,0xD3
	call	OpenTextBoxNoWait
	ld	A,5
	call	GetTextBox
	ld	C,6
	ld	E,0xD
	call	PlaceTextBoxXWA
	ld	A,3
	ld	C,7
	ld	E,1
	ld	HL,0xC5
	call	OpenTextBoxNoWait
	ld	A,3
	call	GetTextBox
	ld	C,1
	ld	E,0
	call	PlaceTextBoxXWA
	ld	A,4
	ld	C,7
	ld	E,1
	ld	HL,0xCC
	call	OpenTextBoxNoWait
	ld	A,4
	call	GetTextBox
	ld	C,0xB
	ld	E,0
	call	PlaceTextBoxXWA
	ld	A,2
	ld	C,0x14
	ld	E,5
	ld	HL,0x84
	call	OpenTextBox
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0xE
	call	PlaceTextBoxXWA
	ld	A,0
	ld	C,8
	ld	E,0xC
	ld	HL,0xC
	call	OpenTextBox
	ld	A,0
	call	GetTextBox
	ld	C,1
	ld	E,1
	call	PlaceTextBoxXWA
	ld	A,1
	ld	C,8
	ld	E,0xC
	ld	HL,0x48
	call	OpenTextBox
	ld	A,1
	call	GetTextBox
	ld	C,0xB
	ld	E,0x21
	call	PlaceTextBoxXWA
	ld	WA,0xDC
	ld	XHL,RawTiles_2C861B
	call	LoadRawTiles
	ret

c_20FDFA	section	code abs=0x20FDFA

; [play] names_confirm
ConfirmNames:
	ld	XHL,OkYesNoText2
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	call	DrawString
	ld	XHL,wPlayerName
	ld	A,3
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	call	DrawString
	ld	XHL,wPartnerName
	ld	A,4
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	call	DrawString
	ld	E,2
	ld	C,2
	ld	B,6
	ld	D,0xA
	ld	WA,0
	call	FillScrRect
	ld	A,(wPlayerRace)
	extz	WA
	ld	HL,WA
	add	HL,0xA
	ld	BC,2
	ld	DE,2
	ld	WA,0xC
	call	DrawPortraitAt
	ld	E,0xC
	ld	C,0x22
	ld	B,6
	ld	D,0xA
	ld	WA,0
	call	FillScrRect
	ld	A,(wPartnerRace)
	extz	WA
	ld	HL,WA
	add	HL,0xA
	ld	BC,0xC
	ld	DE,0x22
	ld	WA,0x48
	call	DrawPortraitAt
	ldw	(XIZ+TASK_ARG),1
	ldw	(XIZ+TASK_FUNC),ConfirmNames.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfirmNames.resume >> 16
ConfirmNames.resume:
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,ConfirmNames.skip2
	cpw	(XIZ+TASK_ARG),1
	jr	Z,ConfirmNames.skip2
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+TASK_ARG),1
ConfirmNames.skip2:
	ld	DE,0x84
	ld	BC,0x20
	cpw	(XIZ+TASK_ARG),1
	jr	Z,ConfirmNames.skip3
	ld	BC,0x50
ConfirmNames.skip3:
	incw	1,(XIZ+0x10)
	ld	WA,(XIZ+0x10)
	and	WA,0x10
	jr	Z,ConfirmNames.skip4
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
ConfirmNames.skip4:
	ld	A,(wJoyPressed)
	and	A,D_RIGHT
	jr	Z,ConfirmNames.skip5
	cpw	(XIZ+TASK_ARG),0
	jr	Z,ConfirmNames.skip5
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+TASK_ARG),0
ConfirmNames.skip5:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	NZ,ConfirmNames.skip
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	ret	Z
	cpw	(XIZ+TASK_ARG),0
	jr	Z,ConfirmNames.skip
	ldw	(XIY+0x10),1
	ld	WA,0x81
	call	SoundCommand
	call	EndTask
	ret
ConfirmNames.skip:
	ld	WA,0x82
	call	SoundCommand
	ldw	(XIY+0x10),0
	call	EndTask
	ret

c_20FF36	section	code abs=0x20FF36

; [code+play] Player / Partner names on Select Player
SelectPlayerNames:
	ld	A,3
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,PlayerText
	call	DrawString
	ld	A,4
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,PartnerText
	call	DrawString
	ld	WA,0xFFFF
	ld	XHL,wPlayerName
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	XHL,wPartnerName
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ldw	(XIZ+TASK_ARG),1
	ldw	(XIZ+0x12),1
	ldw	(XIZ+0x14),0x84
	ldw	(XIZ+0x18),1
	ldw	(XIZ+0x1A),0
	ldw	(XIZ+TASK_FUNC),SelectPlayerNames.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SelectPlayerNames.resume >> 16
SelectPlayerNames.resume:
	incw	1,(XIZ+0x1A)
	ld	WA,(XIZ+0x1A)
	and	WA,0x10
	jr	Z,SelectPlayerNames.skip
	ld	BC,0x48
	ld	DE,0x30
	ld	WA,0x3EDC
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ld	BC,0
	ld	DE,0x30
	ld	WA,0xBEDC
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
SelectPlayerNames.skip:
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,SelectPlayerNames.skip2
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x18),1
	decw	1,(XIZ+TASK_ARG)
SelectPlayerNames.skip2:
	ld	A,(wJoyPressed)
	and	A,D_RIGHT
	jr	Z,SelectPlayerNames.skip3
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x18),1
	incw	1,(XIZ+TASK_ARG)
SelectPlayerNames.skip3:
	cpw	(XIZ+TASK_ARG),0xB
	jr	NZ,SelectPlayerNames.skip4
	ldw	(XIZ+TASK_ARG),1
SelectPlayerNames.skip4:
	cpw	(XIZ+TASK_ARG),0
	jr	NZ,SelectPlayerNames.skip5
	ldw	(XIZ+TASK_ARG),0xA
SelectPlayerNames.skip5:
	ld	WA,(XIZ+TASK_ARG)
	and	WA,1
	jr	NZ,SelectPlayerScreen
	ld	WA,(XIZ+TASK_ARG)
	dec	1,WA
	jr	SelectPlayerScreen.skip

c_210047	section	code abs=0x210047

; [code+play] "Select Player" with portraits
SelectPlayerScreen:
	ld	WA,(XIZ+TASK_ARG)
	inc	1,WA
SelectPlayerScreen.skip:
	ld	(XIZ+0x16),WA
	cpw	(XIZ+0x18),0
	jr	Z,SelectPlayerScreen.skip2
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0xA
	ld	WA,0xC
	ld	BC,2
	ld	DE,2
	call	DrawPortraitAt
	ld	HL,(XIZ+0x16)
	add	HL,0xA
	ld	WA,0x48
	ld	BC,0xC
	ld	DE,0x22
	call	DrawPortraitAt
	ldw	(XIZ+0x18),0
SelectPlayerScreen.skip2:
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,SelectPlayerSelectText
	call	DrawString
	ld	A,5
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	HL,(XIZ+TASK_ARG)
	extz	XHL
	dec	1,HL
	srl	1,XHL
	sll	2,XHL
	add	XHL,RaceNameTexts
	ld	XHL,(XHL)
	call	DrawString
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	Z,SelectPlayerAskOk
	ld	WA,0x82
	call	SoundCommand
	ldb	(XIY+0x10),0
	call	EndTask
	ret

c_2100D8	section	code abs=0x2100D8

; [code+play] SelectPlayerScreen frame (B -> parent +0x10 = 0, end) jumps here: A -> sound 0x81, clears box 2, DrawString 0x226C5B ("Ok? / Yes No"), TASK_FUNC = 0x21010A; ran on select_player_*
SelectPlayerAskOk:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	ret	Z
	ld	WA,0x81
	call	SoundCommand
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,OkYesNoText2
	call	DrawString
	ldw	(XIZ+TASK_FUNC),SelectPlayerConfirm & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SelectPlayerConfirm >> 16
	ret

c_21010A	section	code abs=0x21010A

; [code+play] frame set by SelectPlayerAskOk: D_LEFT +0x12 = 1 / D_RIGHT +0x12 = 0 (sound 0x80), blinking cursor DrawSpriteGrid at x 0x20 (1) / 0x50 (0), A with +0x12 = 1 -> SetPlayerRacesAndNames, A with 0 or B -> sound 0x82, SelectPlayerConfirmBack (back to SelectPlayerNames.resume); ran on select_player_confirm
SelectPlayerConfirm:
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,SelectPlayerConfirmRight
	cpw	(XIZ+0x12),1
	jr	Z,SelectPlayerConfirmRight.skip
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x12),1
	jr	SelectPlayerConfirmRight.skip

c_210128	section	code abs=0x210128

; [code] SelectPlayerConfirm, right: +0x12 = 0 (No), sound 0x80; then the blinking Yes / No cursor and the A / B checks
SelectPlayerConfirmRight:
	ld	A,(wJoyPressed)
	and	A,D_RIGHT
	jr	Z,SelectPlayerConfirmRight.skip
	cpw	(XIZ+0x12),0
	jr	Z,SelectPlayerConfirmRight.skip
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x12),0
SelectPlayerConfirmRight.skip:
	ld	BC,0x20
	ld	DE,(XIZ+0x14)
	ld	WA,(XIZ+0x12)
	and	WA,1
	jr	NZ,SelectPlayerConfirmRight.skip2
	ld	BC,0x50
SelectPlayerConfirmRight.skip2:
	incw	1,(XIZ+0x1A)
	ld	WA,(XIZ+0x1A)
	and	WA,0x10
	jr	Z,SelectPlayerConfirmRight.skip3
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
SelectPlayerConfirmRight.skip3:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	Z,SelectPlayerConfirmB
	ld	WA,(XIZ+0x12)
	and	WA,1
	jr	NZ,SetPlayerRacesAndNames
	jr	SelectPlayerConfirmB.skip

c_210183	section	code abs=0x210183

; [code] SelectPlayerConfirm, B (A on No joins here): sound 0x82, SelectPlayerConfirmBack
SelectPlayerConfirmB:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	ret	Z
SelectPlayerConfirmB.skip:
	ld	WA,0x82
	call	SoundCommand
	jr	SelectPlayerConfirmBack

c_210195	section	code abs=0x210195

; [code+play] wPlayerRace/wPartnerRace, default names from DefaultNames into wPlayerName/wPartnerName
SetPlayerRacesAndNames:
	ld	WA,0x81
	call	SoundCommand
	ldw	(XIY+0x10),1
	ld	WA,(XIZ+TASK_ARG)
	ld	(wPlayerRace),A
	ld	WA,(XIZ+0x16)
	ld	(wPartnerRace),A
	ld	A,(wPlayerRace)
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DefaultNames
	add	XHL,XWA
	ld	XHL,(XHL)
	inc	1,XHL
	ld	XDE,wPlayerName
SetPlayerRacesAndNames.loop:
	cpb	(XHL),0xFF
	jr	Z,SetPartnerDefaultName
	ld	A,(XHL+)
	ld	(XDE+),A
	jr	SetPlayerRacesAndNames.loop

c_2101D7	section	code abs=0x2101D7

; [code] SetPlayerRacesAndNames, second half: DefaultNames[wPartnerRace] (after its first byte) into wPartnerName up to 0xFF
SetPartnerDefaultName:
	ld	A,(wPartnerRace)
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DefaultNames
	add	XHL,XWA
	ld	XHL,(XHL)
	inc	1,XHL
	ld	XDE,wPartnerName
SetPartnerDefaultName.loop:
	cpb	(XHL),0xFF
	jr	Z,SetPlayerRacesAndNamesEnd
	ld	A,(XHL+)
	ld	(XDE+),A
	jr	SetPartnerDefaultName.loop

c_2101FF	section	code abs=0x2101FF

; [code] EndTask; the end of SetPlayerRacesAndNames
SetPlayerRacesAndNamesEnd:
	call	EndTask
	ret

c_210204	section	code abs=0x210204

; [code] No / B on the Ok? prompt: ClearSprites, TASK_FUNC = SelectPlayerNames.resume (back to SelectPlayerNames' race choice frame)
SelectPlayerConfirmBack:
	call	ClearSprites
	ldw	(XIZ+TASK_FUNC),SelectPlayerNames.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SelectPlayerNames.resume >> 16
	ret
