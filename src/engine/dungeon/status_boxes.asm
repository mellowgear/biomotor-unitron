; engine/dungeon/status_boxes.asm: the dungeon's area name box and status box (name, level, HP, GP): open, draw, place, erase, and their show / hide timer (DungeonBoxesStep)

c_212867	section	code abs=0x212867

; [code] OpenTextBox 1 (7 x 3, tile 0x14); OpenDungeonBoxes
OpenAreaNameBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x14
	ld	A,1
	ld	C,7
	ld	E,3
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21287D	section	code abs=0x21287D

; [code] PlaceTextBox 1 at 1, 0x21; byte-identical copy of PlaceWorldMapNameBox (the ROM has each)
PlaceAreaNameBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	C,1
	ld	E,0x21
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212890	section	code abs=0x212890

; [code] box 1: AreaNames[DUNGEON_FLOOR] (DrawBoxString)
DrawAreaName:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_FLOOR)
	sll	2,A
	ld	XHL,AreaNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2128B0	section	code abs=0x2128B0

; [code] EraseTextBox 1; byte-identical copy of EraseWorldMapNameBox, EraseBox1 (the ROM has each)
EraseAreaNameBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2128BF	section	code abs=0x2128BF

; [code] OpenTextBox 2 (0xC x 5, tile 0x19), the box DrawDungeonStatus draws
OpenDungeonStatusBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x19
	ld	A,2
	ld	C,0xC
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2128D5	section	code abs=0x2128D5

; [code] PlaceTextBox 2 at 7, 0x2D
PlaceDungeonStatusBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,7
	ld	E,0x2D
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2128E8	section	code abs=0x2128E8

; [code+play] box 2: name, level, HP (rust label), wUnitHP/wUnitMaxHP, wGP (camp, arrival)
DrawDungeonStatus:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	ClearTextBox
	ld	A,2
	ld	C,0
	ld	E,0
	call	SetTextBoxCursor
	ld	A,2
	ld	XHL,PlayerText3
	call	DrawBoxString
	ld	A,2
	ld	C,7
	ld	E,0
	call	SetTextBoxCursor
	ld	A,2
	ld	XHL,LText
	call	DrawBoxString
	ld	A,(wPlayerLevel)
	cp	A,0x63
	jr	C,DrawDungeonStatus.skip
	ld	A,0x63
DrawDungeonStatus.skip:
	extz	WA
	extz	XWA
	call	BinToBCD
	ld	XHL,XWA
	ld	A,2
	ld	C,2
	call	DrawBcdDigits
	ld	A,2
	ld	C,0
	ld	E,1
	call	SetTextBoxCursor
	ld	A,(wStatusRust)
	cp	A,0
	jr	Z,DrawDungeonStatus.skip2
	ld	XHL,RtText
	jr	DrawDungeonStatus.skip3
DrawDungeonStatus.skip2:
	ld	XHL,HPText
DrawDungeonStatus.skip3:
	ld	A,2
	call	DrawBoxString
	ld	WA,(wUnitHP)
	cp	WA,0x3E7
	jr	C,DrawDungeonStatus.skip4
	ld	WA,0x3E7
DrawDungeonStatus.skip4:
	extz	XWA
	call	BinToBCD
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	DrawBcdDigits
	ld	A,2
	ld	C,6
	ld	E,1
	call	SetTextBoxCursor
	ld	A,2
	ld	XHL,SlashText
	call	DrawBoxString
	ld	WA,(wUnitMaxHP)
	cp	WA,0x3E7
	jr	C,DrawDungeonStatus.skip5
	ld	WA,0x3E7
DrawDungeonStatus.skip5:
	extz	XWA
	call	BinToBCD
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	DrawBcdDigits
	ld	A,2
	ld	C,0
	ld	E,2
	call	SetTextBoxCursor
	ld	A,2
	ld	XHL,GText
	call	DrawBoxString
	ld	XHL,(wGP)
	ld	C,6
	ld	A,2
	call	DrawBcdDigits
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2129D2	section	code abs=0x2129D2

; [code] EraseTextBox 2; byte-identical copy of EraseWorldMapBox2, EraseBox2Tall, EraseBox2 (the ROM has each)
EraseDungeonStatusBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2129E1	section	code abs=0x2129E1

; [code] OpenAreaNameBox, OpenDungeonStatusBox (OpenDungeonBoxes without the +0x29 = 8); no caller found
OpenDungeonBoxesOnly:
	calr	OpenAreaNameBox
	call	OpenDungeonStatusBox
	ret

c_2129E9	section	code abs=0x2129E9

; [code] DrawAreaName, DrawDungeonStatus, PlaceAreaNameBox, PlaceDungeonStatusBox
DrawDungeonBoxes:
	calr	DrawAreaName
	call	DrawDungeonStatus
	calr	PlaceAreaNameBox
	call	PlaceDungeonStatusBox
	ret

c_2129F8	section	code abs=0x2129F8

; [code] EraseAreaNameBox, EraseDungeonStatusBox
EraseDungeonBoxes:
	call	EraseAreaNameBox
	call	EraseDungeonStatusBox
	ret

c_212A01	section	code abs=0x212A01

; [code] OpenAreaNameBox, OpenDungeonStatusBox, box state +0x29 = 8 (hidden)
OpenDungeonBoxes:
	push	A
	calr	OpenAreaNameBox
	call	OpenDungeonStatusBox
	ld	A,8
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A10	section	code abs=0x212A10

; [code] DrawAreaName, PlaceAreaNameBox, box state +0x29 = 3; StartDungeonFloor
ShowAreaName:
	push	A
	calr	DrawAreaName
	calr	PlaceAreaNameBox
	ld	A,3
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A1E	section	code abs=0x212A1E

; [code] PlaceAreaNameBox, timer +0x28 = 0, box state +0x29 = 4 (DungeonBoxesStep: after 0x80 frames ShowDungeonBoxes without input, else HideDungeonBoxes)
ShowAreaNameAndWait:
	push	A
	calr	PlaceAreaNameBox
	push	A
	ld	A,0
	ld	(XIZ+0x28),A
	pop	A
	ld	A,4
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A30	section	code abs=0x212A30

; [code] unless box state +0x29 is 7: erase both boxes (unless 8), timer +0x28 = 0, state 7 (DungeonBoxesStep: ShowDungeonBoxes after 0x80 frames)
HideDungeonBoxesAndWait:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,7
	jr	Z,HideDungeonBoxesAndWait.skip2
	cp	A,8
	jr	Z,HideDungeonBoxesAndWait.skip
	call	EraseAreaNameBox
	call	EraseDungeonStatusBox
HideDungeonBoxesAndWait.skip:
	push	A
	ld	A,0
	ld	(XIZ+0x28),A
	pop	A
	ld	A,7
	ld	(XIZ+0x29),A
HideDungeonBoxesAndWait.skip2:
	pop	A
	ret

c_212A53	section	code abs=0x212A53

; [code] DrawDungeonBoxes, box state +0x29 = 5
ShowDungeonBoxes:
	push	A
	calr	DrawAreaName
	call	DrawDungeonStatus
	calr	PlaceAreaNameBox
	call	PlaceDungeonStatusBox
	ld	A,5
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A69	section	code abs=0x212A69

; [code] unless box state +0x29 is 8: erase both boxes (unless 7), state 8
HideDungeonBoxes:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,8
	jr	Z,HideDungeonBoxes.skip2
	cp	A,7
	jr	Z,HideDungeonBoxes.skip
	call	EraseAreaNameBox
	call	EraseDungeonStatusBox
HideDungeonBoxes.skip:
	ld	A,8
	ld	(XIZ+0x29),A
HideDungeonBoxes.skip2:
	pop	A
	ret

c_212A85	section	code abs=0x212A85

; [code] CheckEncounter with D-pad/A/B held: HideDungeonBoxes unless box state +0x29 is 4
HideDungeonBoxesOnInput:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,4
	jr	Z,HideDungeonBoxesOnInput.skip
	call	HideDungeonBoxes
HideDungeonBoxesOnInput.skip:
	pop	A
	ret

c_212A93	section	code abs=0x212A93

; [code] CheckEncounter with nothing held: HideDungeonBoxesAndWait when box state +0x29 is 8
RestartDungeonBoxTimer:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,8
	jr	NZ,RestartDungeonBoxTimer.skip
	calr	HideDungeonBoxesAndWait
RestartDungeonBoxTimer.skip:
	pop	A
	ret

c_212AA1	section	code abs=0x212AA1

; [code] every DungeonStep frame: box state +0x29 4 or 7 counts +0x28 to 0x80, then ShowDungeonBoxes (state 4 with D-pad/A/B held: HideDungeonBoxes); [play] the name / status boxes appear after standing still
DungeonBoxesStep:
	ld	A,(XIZ+0x29)
	cp	A,1
	jr	NZ,DungeonBoxesStep.skip
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip:
	cp	A,2
	jr	NZ,DungeonBoxesStep.skip2
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip2:
	cp	A,3
	jr	NZ,DungeonBoxesStep.skip3
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip3:
	cp	A,4
	jr	NZ,DungeonBoxesStep.skip5
	push	A
	ld	A,(XIZ+0x28)
	inc	1,A
	ld	(XIZ+0x28),A
	pop	A
	ld	A,(XIZ+0x28)
	cp	A,0x80
	jr	C,DungeonBoxesStep.done
	ld	A,(wJoyHeld)
	and	A,D_PAD|A_BUTTON|B_BUTTON
	jr	NZ,DungeonBoxesStep.skip4
	calr	ShowDungeonBoxes
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip4:
	call	HideDungeonBoxes
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip5:
	cp	A,5
	jr	NZ,DungeonBoxesStep.skip6
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip6:
	cp	A,6
	jr	NZ,DungeonBoxesStep.skip7
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip7:
	cp	A,7
	jr	NZ,DungeonBoxesStep.skip8
	push	A
	ld	A,(XIZ+0x28)
	inc	1,A
	ld	(XIZ+0x28),A
	pop	A
	ld	A,(XIZ+0x28)
	cp	A,0x80
	jr	C,DungeonBoxesStep.done
	calr	ShowDungeonBoxes
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip8:
	cp	A,8
	jr	NZ,DungeonBoxesStep.skip9
	jr	DungeonBoxesStep.done
DungeonBoxesStep.skip9:
	ld	A,8
	ld	(XIZ+0x29),A
DungeonBoxesStep.done:
	ret
