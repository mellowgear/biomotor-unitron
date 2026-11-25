; engine/arena/opponents.asm: arena bracket: opponent line-up, LoadArenaOpponent boxes, participant tile wipes

c_213249	section	code abs=0x213249

; [play] arena participant screens: portraits
DrawArenaParticipants:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	ClearArenaPortraitArea
	cp	HL,0
	jr	Z,DrawArenaParticipants.skip4
	cp	HL,0xFFFF
	jr	Z,DrawArenaParticipants.skip
	cp	HL,0xFFFE
	jr	Z,DrawArenaParticipants.skip
	cp	HL,0x38
	jr	Z,DrawArenaParticipants.skip3
	cp	HL,0x3A
	jr	Z,DrawArenaParticipants.skip3
	ld	BC,0
	ld	DE,0
	add	E,0x20
	call	GetPortraitFirstTile
	call	DrawPortraitAt
	jr	DrawArenaParticipants.skip4
DrawArenaParticipants.skip:
	ld	A,(wPlayerRace)
	dec	1,A
	xor	A,1
	extz	WA
	cp	HL,0xFFFF
	jr	NZ,DrawArenaParticipants.skip2
	ld	HL,1
	add	HL,WA
	ld	BC,0
	ld	DE,0
	add	E,0x20
	call	GetPortraitFirstTile
	call	DrawPortraitAt
	jr	DrawArenaParticipants.skip4
DrawArenaParticipants.skip2:
	ld	HL,0xB
	add	HL,WA
	ld	BC,1
	ld	DE,4
	add	E,0x20
	call	swp_21684D
	call	DrawPortrait
	jr	DrawArenaParticipants.skip4
DrawArenaParticipants.skip3:
	call	EraseBox2
	call	EraseBox3
	ld	BC,0
	ld	DE,0
	call	GetPictureFirstTile
	call	DrawPortrait
DrawArenaParticipants.skip4:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B11	section	code abs=0x213B11

; [code] OpenTextBox 4 (8 x 6, tile from GetArenaBox4Tile)
OpenArenaBox4:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	GetArenaBox4Tile
	ld	HL,WA
	ld	A,4
	ld	C,8
	ld	E,6
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B2A	section	code abs=0x213B2A

; [code] +0x21 = 1 (ArenaPortraitAnimStep uncovers)
SetPortraitUncoverMode:
	push	A
	ld	A,1
	ld	(XIZ+0x21),A
	pop	A
	ret

c_213B32	section	code abs=0x213B32

; [code] +0x21 = 2 (ArenaPortraitAnimStep covers back)
SetPortraitRecoverMode:
	push	A
	ld	A,2
	ld	(XIZ+0x21),A
	pop	A
	ret

c_213B3A	section	code abs=0x213B3A

; [code] DrawUncoverTilemap of tile 0xC on SCR2 0x9800, +0x2B = 0, SetPortraitUncoverMode
StartPortraitUncover:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9800
	ld	WA,0xC
	add	WA,0
	call	DrawUncoverTilemap
	ld	A,0
	ld	(XIZ+0x2B),A
	calr	SetPortraitUncoverMode
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B5B	section	code abs=0x213B5B

; [code] DrawUncoverTilemap of tile 0xC on SCR2 0x9800, +0x2B = 0x10, ArenaUncoverStep, SetPortraitRecoverMode
StartPortraitRecover:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9800
	ld	WA,0xC
	add	WA,0
	call	DrawUncoverTilemap
	ld	A,0x10
	ld	(XIZ+0x2B),A
	calr	ArenaUncoverStep
	calr	SetPortraitRecoverMode
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B7F	section	code abs=0x213B7F

; [code] +0x21 = 1: ArenaUncoverStep with +0x2B rising to 0x10, then +0x21 = 0; 2: ArenaUncoverStep with +0x2B falling to 0, then in +0x2A = 3 LoadArenaOpponent(+0x1E) and StartPortraitUncover, else +0x21 = 0
ArenaPortraitAnimStep:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x21)
	cp	A,0
	jr	Z,ArenaPortraitAnimStep.skip8
	cp	A,1
	jr	NZ,ArenaPortraitAnimStep.skip3
	calr	ArenaUncoverStep
	ld	A,(XIZ+0x2B)
	cp	A,0x10
	jr	NC,ArenaPortraitAnimStep.skip
	inc	1,A
	ld	(XIZ+0x2B),A
	jr	ArenaPortraitAnimStep.skip2
ArenaPortraitAnimStep.skip:
	ld	A,0
	ld	(XIZ+0x21),A
ArenaPortraitAnimStep.skip2:
	jr	ArenaPortraitAnimStep.skip8
ArenaPortraitAnimStep.skip3:
	cp	A,2
	jr	NZ,ArenaPortraitAnimStep.skip7
	calr	ArenaUncoverStep
	ld	A,(XIZ+0x2B)
	cp	A,0
	jr	Z,ArenaPortraitAnimStep.skip4
	dec	1,A
	ld	(XIZ+0x2B),A
	jr	ArenaPortraitAnimStep.skip6
ArenaPortraitAnimStep.skip4:
	ld	A,(XIZ+0x2A)
	cp	A,3
	jr	NZ,ArenaPortraitAnimStep.skip5
	ld	A,(XIZ+0x1E)
	calr	LoadArenaOpponent
	calr	StartPortraitUncover
	jr	ArenaPortraitAnimStep.skip8
ArenaPortraitAnimStep.skip5:
	ld	A,0
	ld	(XIZ+0x21),A
ArenaPortraitAnimStep.skip6:
	jr	ArenaPortraitAnimStep.skip8
ArenaPortraitAnimStep.skip7:
	ld	A,0
	ld	(XIZ+0x21),A
	jr	ArenaPortraitAnimStep.skip8
ArenaPortraitAnimStep.skip8:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213BE1	section	code abs=0x213BE1

; [code] ArenaSceneNext 0xF8: EraseBox2 / EraseBox3, Box2Tall opened and placed, box 1 = ArenaRankNames[cursor +0x10], RollArenaBracket, OpenArenaBox4, +0x2A = 2 (ArenaBracketDispatch: ArenaBracketReveal)
ShowArenaBracket:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	EraseBox2
	call	EraseBox3
	call	OpenBox2Tall
	call	ClearBox2Tall
	call	PlaceBox2Tall
	call	ClearTextBox1
	ld	E,1
	ld	C,5
	ld	A,1
	call	SetTextBoxCursor
	ld	XWA,0
	ld	A,(XIZ+0x10)
	sll	2,XWA
	ld	XHL,ArenaRankNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	calr	RollArenaBracket
	calr	OpenArenaBox4
	ld	A,2
	ld	(XIZ+0x2A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213C2E	section	code abs=0x213C2E

; [code] +0x16 = ArenaBracketSizes[rank +0x15 - 2]; the 6 slots +0x18.. = ArenaBracketRows of the rank, each 0xFF replaced by a random pilot 0x62 + Random() % 15 not already in an earlier slot; below rank 8 each random pilot also gets 6 part ids in wArenaPilotParts + 6 * slot (ArenaPilotCores / BodyBase / Arms / Legs ...); ShowArenaBracket
RollArenaBracket:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x15)
	sub	A,2
	extz	WA
	extz	XWA
	ld	XHL,ArenaBracketSizes
	add	XHL,XWA
	ld	A,(XHL)
	ld	(XIZ+0x16),A
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	A,(XIZ+0x15)
	sub	A,2
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,ArenaBracketRows
	add	XHL,XWA
	ld	XDE,(XHL)
	ld	XHL,XIZ
	add	XHL,0x18
	ld	C,6
RollArenaBracket.loop:
	ld	A,(XDE)
	cp	A,0xFF
	jr	NZ,RollArenaBracket.skip2
	push	XDE
RollArenaBracket.loop2:
	call	Random
	ld	W,0
	div	WA,0xF
	ld	A,W
	add	A,0x62
	ld	B,6
	sub	B,C
	jr	Z,RollArenaBracket.skip
	ld	XDE,XHL
RollArenaBracket.loop3:
	dec	1,XDE
	ld	W,(XDE)
	cp	A,W
	jr	Z,RollArenaBracket.loop2
	djnz	B,RollArenaBracket.loop3
RollArenaBracket.skip:
	pop	XDE
RollArenaBracket.skip2:
	ld	(XHL),A
	inc	1,XHL
	inc	1,XDE
	djnz	C,RollArenaBracket.loop
	ld	W,(XIZ+0x15)
	cp	W,8
	jrl	NC,RollArenaBracket.skip5
	ld	A,7
	sub	A,W
	ld	(XIZ+0x1E),A
	ld	XHL,XIZ
	add	XHL,0x18
	ld	XDE,wArenaPilotParts
	ld	C,6
RollArenaBracket.loop4:
	push	XHL
	ld	A,(XHL)
	sub	A,0x62
	jrl	C,RollArenaBracket.skip3
	cp	A,0xF
	jrl	NC,RollArenaBracket.skip3
	ld	(XIZ+0x1F),A
	ld	W,0
	div	WA,3
	ld	(XIZ+0x20),A
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotCores
	add	XHL,XWA
	ld	A,(XHL)
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotBodyBase
	add	XHL,XWA
	ld	B,(XHL)
	ld	WA,0
	ld	A,(XIZ+0x20)
	mul	WA,3
	add	A,B
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotArmCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,0xF
	ld	XHL,ArenaPilotArms
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotArmCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,0xF
	ld	XHL,ArenaPilotArms
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotLegCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,5
	ld	XHL,0
	ld	L,(XIZ+0x20)
	add	XWA,XHL
	mul	XWA,3
	ld	XHL,ArenaPilotLegs
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotBackCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,5
	ld	XHL,0
	ld	L,(XIZ+0x20)
	add	XWA,XHL
	mul	XWA,3
	ld	XHL,ArenaPilotBacks
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	jr	RollArenaBracket.skip4
RollArenaBracket.skip3:
	inc	6,XDE
RollArenaBracket.skip4:
	pop	XHL
	inc	1,XHL
	dec	1,C
	jrl	NZ,RollArenaBracket.loop4
RollArenaBracket.skip5:
	calr	ResetArenaBracketState
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213E19	section	code abs=0x213E19

; [code] +0x1E / +0x1F / +0x20 / +0x21 = 0
ResetArenaBracketState:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	(XIZ+0x1F),A
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x21),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213E34	section	code abs=0x213E34

; [code] XHL = string: ClearTextBox 4, DrawBoxString at row 3, then rows 2, 1, 0 = row 3 shifted 2, 4, 6 pixels left (copy the row below, rld every pixel line by one nibble = 2 pixels, colour 1 fed in at the right); the frames SlideBracketLineFromLeft copies
Box4PreshiftLeft:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	push	XHL
	call	ClearTextBox
	pop	XHL
	ld	E,3
	ld	C,0
	ld	A,4
	push	XHL
	call	SetTextBoxCursor
	pop	XHL
	ld	A,4
	call	DrawBoxString
	ld	C,3
Box4PreshiftLeft.loop:
	push	C
	ld	A,4
	call	GetBoxTilesAddr
	ld	XHL,XDE
	ld	XWA,0
	ld	A,C
	mul	XWA,6
	mul	XWA,0x10
	add	XHL,XWA
	ld	XWA,0
	ld	A,C
	sub	XWA,1
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	push	XDE
	ld	BC,6
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XDE
	ld	XWA,6
	sub	XWA,1
	mul	XWA,0x10
	add	XDE,XWA
	ld	C,8
Box4PreshiftLeft.loop2:
	push	XDE
	ld	A,0x55
	ld	B,6
Box4PreshiftLeft.loop3:
	rld	A,(XDE)
	add	XDE,1
	rld	A,(XDE)
	sub	XDE,0x11
	djnz	B,Box4PreshiftLeft.loop3
	pop	XDE
	inc	2,XDE
	djnz	C,Box4PreshiftLeft.loop2
	pop	C
	djnz	C,Box4PreshiftLeft.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213EC1	section	code abs=0x213EC1

; [code] Box4PreshiftLeft shifting right (rrd, colour 1 fed in at the left): rows 2, 1, 0 = row 3 shifted 2, 4, 6 pixels right; the frames SlideBracketLineFromRight copies
Box4PreshiftRight:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	push	XHL
	call	ClearTextBox
	pop	XHL
	ld	E,3
	ld	C,0
	ld	A,4
	push	XHL
	call	SetTextBoxCursor
	pop	XHL
	ld	A,4
	call	DrawBoxString
	ld	C,3
Box4PreshiftRight.loop:
	push	C
	ld	A,4
	call	GetBoxTilesAddr
	ld	XHL,XDE
	ld	XWA,0
	ld	A,C
	mul	XWA,6
	mul	XWA,0x10
	add	XHL,XWA
	ld	XWA,0
	ld	A,C
	sub	XWA,1
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	push	XDE
	ld	BC,6
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XDE
	add	XDE,1
	ld	C,8
Box4PreshiftRight.loop2:
	push	XDE
	ld	A,0x55
	ld	B,6
Box4PreshiftRight.loop3:
	rrd	A,(XDE)
	sub	XDE,1
	rrd	A,(XDE)
	add	XDE,0x11
	djnz	B,Box4PreshiftRight.loop3
	pop	XDE
	inc	2,XDE
	djnz	C,Box4PreshiftRight.loop2
	pop	C
	djnz	C,Box4PreshiftRight.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213F46	section	code abs=0x213F46

; [code] A = 0 -> Box4PreshiftLeft, else Box4PreshiftRight (registers saved); ArenaBracketReveal passes the bracket line's parity
Box4Preshift:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	and	A,A
	jr	NZ,Box4Preshift.skip
	calr	Box4PreshiftLeft
	jr	Box4Preshift.skip2
Box4Preshift.skip:
	calr	Box4PreshiftRight
Box4Preshift.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213F5B	section	code abs=0x213F5B

; [code] slide step +0x1F (0-0x17): the rightmost +0x1F / 4 + 1 tiles of box 4 row +0x1F & 3 (shifted 6, 4, 2, 0 px left) into the first tiles of box 2 line +0x1E; over 24 steps the line enters from the left 2 pixels at a time
SlideBracketLineFromLeft:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x1F)
	and	A,3
	mul	XWA,6
	ld	XHL,XWA
	ld	W,(XIZ+0x1F)
	srl	2,W
	ld	A,6
	sub	A,W
	sub	A,1
	extz	WA
	extz	XWA
	add	XHL,XWA
	mul	XHL,0x10
	ld	A,4
	call	GetBoxTilesAddr
	add	XHL,XDE
	ld	A,2
	call	GetBoxTilesAddr
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	ld	BC,0
	ld	C,(XIZ+0x1F)
	srl	2,BC
	inc	1,BC
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213FB5	section	code abs=0x213FB5

; [code] mirror of SlideBracketLineFromLeft: the leftmost +0x1F / 4 + 1 tiles of box 4 row +0x1F & 3 (shifted right) into the last tiles of box 2 line +0x1E; the line enters from the right
SlideBracketLineFromRight:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x1F)
	and	A,3
	mul	XWA,6
	ld	XHL,XWA
	mul	XHL,0x10
	ld	A,4
	call	GetBoxTilesAddr
	add	XHL,XDE
	ld	A,2
	call	GetBoxTilesAddr
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	ld	W,(XIZ+0x1F)
	srl	2,W
	ld	A,6
	sub	A,W
	sub	A,1
	extz	WA
	extz	XWA
	mul	XWA,0x10
	add	XDE,XWA
	ld	BC,0
	ld	C,(XIZ+0x1F)
	srl	2,BC
	inc	1,BC
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214013	section	code abs=0x214013

; [code] A = 0 -> SlideBracketLineFromLeft, else SlideBracketLineFromRight (registers saved); ArenaBracketReveal state 1 each frame with the line's parity (even lines from the left, odd lines from the right)
SlideBracketLineStep:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	and	A,A
	jr	NZ,SlideBracketLineStep.skip
	calr	SlideBracketLineFromLeft
	jr	SlideBracketLineStep.skip2
SlideBracketLineStep.skip:
	calr	SlideBracketLineFromRight
SlideBracketLineStep.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214028	section	code abs=0x214028

; [code] A = line -> XHL: odd lines GetEnemyName of slot +0x18 + A / 2, even lines Pointers_249CB8[A / 2] (entry 5 for the last pair, A / 2 = +0x16 - 1)
GetArenaBracketLine:
	push	XDE
	push	XBC
	push	XWA
	srl	1,A
	jr	C,GetArenaBracketLine.skip2
	ld	W,(XIZ+0x16)
	sub	W,1
	cp	A,W
	jr	NZ,GetArenaBracketLine.skip
	ld	A,5
GetArenaBracketLine.skip:
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,Pointers_249CB8
	add	XHL,XWA
	ld	XHL,(XHL)
	jr	GetArenaBracketLine.skip3
GetArenaBracketLine.skip2:
	extz	WA
	extz	XWA
	ld	XHL,XIZ
	add	XHL,0x18
	add	XHL,XWA
	ld	A,(XHL)
	ld	L,A
	call	GetEnemyName
GetArenaBracketLine.skip3:
	pop	XWA
	pop	XBC
	pop	XDE
	ret

c_214068	section	code abs=0x214068

; [code] ClearBox2Tall, then GetArenaBracketLine for lines 0 .. 2 * +0x16 - 1 in box 2
DrawArenaBracketList:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2Tall
	ld	A,(XIZ+0x16)
	sll	1,A
	ld	C,A
	ld	B,0
DrawArenaBracketList.loop:
	push	BC
	ld	C,0
	ld	E,B
	ld	A,2
	call	SetTextBoxCursor
	ld	A,B
	calr	GetArenaBracketLine
	ld	A,2
	call	DrawBoxString
	pop	BC
	inc	1,B
	djnz	C,DrawArenaBracketList.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21409B	section	code abs=0x21409B

; [code] xors 0xAAAA into the tile words of the two box 2 lines of bracket slot +0x1E (2 x 6 tiles, GetBoxTilesAddr 2)
XorBracketSlotPixels:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,2
	mul	XWA,6
	mul	XWA,0x10
	push	XWA
	ld	A,2
	call	GetBoxTilesAddr
	pop	XWA
	add	XDE,XWA
	ld	BC,8
	mul	BC,2
	mul	BC,6
XorBracketSlotPixels.loop:
	ld	WA,(XDE)
	xor	WA,0xAAAA
	ld	(XDE),WA
	inc	2,XDE
	djnz	BC,XorBracketSlotPixels.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2140D5	section	code abs=0x2140D5

; [code] A = bracket slot: clears SCR1 map (ClearTilemap20x19 at 0x9000), A = participant id at task+0x18+slot, parts pointer 0x60CC + 6*slot for random pilots 0x62-0x70 (else 0), LoadEnemy, LoadEnemyImage; callers ArenaPortraitAnimStep / ArenaBracketReveal; [play] arena_rank*_participants_* screens
LoadArenaOpponent:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9000
	call	ClearTilemap20x19
	ld	E,A
	extz	DE
	extz	XDE
	ld	XHL,XIZ
	add	XHL,0x18
	add	XHL,XDE
	ld	A,(XHL)
	cp	A,0x62
	jr	C,LoadArenaOpponent.skip
	cp	A,0x71
	jr	NC,LoadArenaOpponent.skip
	ld	XHL,wArenaPilotParts
	mul	XDE,6
	add	XHL,XDE
	jr	LoadArenaOpponent.skip2
LoadArenaOpponent.skip:
	ld	HL,0
LoadArenaOpponent.skip2:
	call	LoadEnemy
	call	GetPictureFirstTile
	ld	BC,0
	ld	DE,0
	call	LoadEnemyImage
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214122	section	code abs=0x214122

; [code] +0x2A = 2: steps through the bracket lines (+0x1E) with the box 4 animations (Box4Preshift / SlideBracketLineStep), loading each opponent (LoadArenaOpponent) behind the portrait cover; B -> ArenaBracketQuit; A: DrawArenaBracketList and StartPortraitRecover, then (also after the last line) box 1 FightQuitText, LoadArenaOpponent(0), XorBracketSlotPixels, cursor +0x10 = 0, +0x2A = 3
ArenaBracketReveal:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,ArenaBracketReveal.skip
	jrl	ArenaBracketReveal.skip12
ArenaBracketReveal.skip:
	bit	5,A
	jr	Z,ArenaBracketReveal.skip2
	calr	ArenaBracketQuit
	jrl	ArenaBracketReveal.skip14
ArenaBracketReveal.skip2:
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	Z,ArenaBracketReveal.skip6
	cp	A,0
	jr	Z,ArenaBracketReveal.skip9
	cp	A,2
	jr	NZ,ArenaBracketReveal.skip3
	ld	W,0xA
	jr	ArenaBracketReveal.skip4
ArenaBracketReveal.skip3:
	ld	W,0x1E
ArenaBracketReveal.skip4:
	ld	A,(XIZ+0x1F)
	inc	1,A
	ld	(XIZ+0x1F),A
	cp	A,W
	jrl	C,ArenaBracketReveal.skip14
	ld	A,(XIZ+0x1E)
	srl	1,A
	ld	W,(XIZ+0x16)
	cp	A,W
	jr	C,ArenaBracketReveal.skip5
	ld	A,4
	ld	(XIZ+0x20),A
	jr	ArenaBracketReveal.skip13
ArenaBracketReveal.skip5:
	ld	A,0
	ld	(XIZ+0x20),A
	jrl	ArenaBracketReveal.skip14
ArenaBracketReveal.skip6:
	ld	A,(XIZ+0x1E)
	and	A,1
	calr	SlideBracketLineStep
	ld	A,(XIZ+0x1F)
	inc	1,A
	ld	(XIZ+0x1F),A
	cp	A,0x18
	jrl	NZ,ArenaBracketReveal.skip14
	ld	A,(XIZ+0x1E)
	inc	1,A
	ld	(XIZ+0x1E),A
	ld	A,(XIZ+0x1E)
	and	A,1
	jr	Z,ArenaBracketReveal.skip7
	ld	A,2
	jr	ArenaBracketReveal.skip8
ArenaBracketReveal.skip7:
	ld	A,3
ArenaBracketReveal.skip8:
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x1F),A
	jr	ArenaBracketReveal.skip14
ArenaBracketReveal.skip9:
	ld	A,(XIZ+0x1E)
	calr	GetArenaBracketLine
	ld	A,(XIZ+0x1E)
	and	A,1
	calr	Box4Preshift
	ld	A,(XIZ+0x1E)
	and	A,1
	jr	Z,ArenaBracketReveal.skip10
	ld	A,(XIZ+0x1E)
	srl	1,A
	calr	LoadArenaOpponent
	calr	StartPortraitUncover
	jr	ArenaBracketReveal.skip11
ArenaBracketReveal.skip10:
	calr	StartPortraitRecover
ArenaBracketReveal.skip11:
	ld	A,1
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x1F),A
	jr	ArenaBracketReveal.skip14
ArenaBracketReveal.skip12:
	calr	DrawArenaBracketList
	calr	StartPortraitRecover
	ld	A,0
	ld	(XIZ+0x21),A
ArenaBracketReveal.skip13:
	call	ClearTextBox1
	ld	A,1
	ld	XHL,FightQuitText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	(XIZ+0x1E),A
	calr	LoadArenaOpponent
	calr	XorBracketSlotPixels
	ld	A,0
	ld	(XIZ+0x10),A
	ld	A,3
	ld	(XIZ+0x2A),A
ArenaBracketReveal.skip14:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21421D	section	code abs=0x21421D

; [code] ArenaBracketDispatch +0x2A = 3: A (sound 0x81) -> ArenaFightQuitChoose; then ArenaFightQuitInputB / ArenaFightQuitInputDPad / ArenaFightQuitCursor
ArenaFightQuitInput:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,ArenaFightQuitInputB
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	calr	ArenaFightQuitChoose
	jrl	ArenaFightQuitCursor

c_214239	section	code abs=0x214239

; [code] jrl ArenaFightQuitCursor.skip (ArenaFightQuitCursor's register pops + ret), right after ArenaFightQuitInput's own jrl; no callers
ArenaFightQuitInputExit:
	jrl	ArenaFightQuitCursor.skip

c_21423C	section	code abs=0x21423C

; [code] B (sound 0x82): cursor +0x10 = 1 (Quit), ArenaFightQuitChoose
ArenaFightQuitInputB:
	bit	5,A
	jr	Z,ArenaFightQuitInputDPad
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	calr	ArenaFightQuitChoose
	jrl	ArenaFightQuitCursor

c_214255	section	code abs=0x214255

; [code] jrl ArenaFightQuitCursor.skip (ArenaFightQuitCursor's register pops + ret), right after ArenaFightQuitInputB's own jrl; no callers
ArenaFightQuitInputBExit:
	jrl	ArenaFightQuitCursor.skip

c_214258	section	code abs=0x214258

; [code] left / right move cursor +0x10 (0 Fight, 1 Quit); when the portrait is idle (+0x21 = 0), every 0x96 frames the next bracket slot +0x1E (wrapping at +0x16): DrawArenaBracketList, XorBracketSlotPixels, StartPortraitRecover mode
ArenaFightQuitInputDPad:
	and	A,0xF
	jr	Z,ArenaFightQuitInputDPad.skip4
	cp	A,4
	jr	NZ,ArenaFightQuitInputDPad.skip2
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,ArenaFightQuitInputDPad.skip
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	ArenaFightQuitInputDPad.skip4
ArenaFightQuitInputDPad.skip:
	jr	ArenaFightQuitInputDPad.skip4
ArenaFightQuitInputDPad.skip2:
	cp	A,8
	jr	NZ,ArenaFightQuitInputDPad.skip4
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,ArenaFightQuitInputDPad.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	ArenaFightQuitInputDPad.skip4
ArenaFightQuitInputDPad.skip3:
	jr	ArenaFightQuitInputDPad.skip4
ArenaFightQuitInputDPad.skip4:
	ld	A,(XIZ+0x21)
	cp	A,0
	jr	NZ,ArenaFightQuitCursor
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x96
	jr	C,ArenaFightQuitCursor
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,(XIZ+0x1E)
	ld	W,(XIZ+0x16)
	sub	W,1
	cp	A,W
	jr	Z,ArenaFightQuitInputDPad.skip5
	inc	1,A
	ld	(XIZ+0x1E),A
	jr	ArenaFightQuitInputDPad.skip6
ArenaFightQuitInputDPad.skip5:
	ld	A,0
	ld	(XIZ+0x1E),A
	jr	ArenaFightQuitInputDPad.skip6
ArenaFightQuitInputDPad.skip6:
	calr	DrawArenaBracketList
	calr	XorBracketSlotPixels
	calr	SetPortraitRecoverMode

c_2142D5	section	code abs=0x2142D5

; [code] DrawMenuCursor at x 0x18 + 0x40 * cursor +0x10, y 0x7C
ArenaFightQuitCursor:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x40
	add	WA,0x18
	ld	BC,WA
	ld	DE,0x7C
	call	DrawMenuCursor
ArenaFightQuitCursor.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2142EF	section	code abs=0x2142EF

; [code] DrawArenaBracketList; Fight (cursor 0): ClearArenaPortraitArea2, Box2 / Box3 reopened, box 3 ArenaText2, picture 0x29, DrawArenaParticipants 0x15, wGP -= ArenaEntryCosts[rank +0x15 - 2] (BinToBCD, SubBCD), SetTalkedFlags, scene 0xB, TASK_ARG 3; Quit: ArenaBracketQuit
ArenaFightQuitChoose:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	DrawArenaBracketList
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	NZ,ArenaFightQuitChoose.skip
	calr	ClearArenaPortraitArea2
	ld	A,0
	ld	(XIZ+0x21),A
	call	EraseBox2Tall
	call	OpenBox2
	call	ClearBox2
	call	PlaceBox2
	call	OpenBox3
	call	ClearBox3
	call	PlaceBox3
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	HL,0x29
	calr	ArenaShowPicture
	ld	HL,0x15
	calr	DrawArenaParticipants
	ld	A,(XIZ+0x15)
	sub	A,2
	extz	WA
	extz	XWA
	sll	1,A
	ld	XHL,ArenaEntryCosts
	add	XHL,XWA
	ld	WA,(XHL)
	extz	XWA
	call	BinToBCD
	ld	XBC,XWA
	ld	XWA,(wGP)
	call	SubBCD
	ld	(wGP),XWA
	call	SetTalkedFlags
	ld	A,0xB
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	ArenaFightQuitChoose.skip2
ArenaFightQuitChoose.skip:
	calr	ArenaBracketQuit
ArenaFightQuitChoose.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21437A	section	code abs=0x21437A

; [code] the ArenaFightQuitChoose screen without paying: ClearArenaPortraitArea2, Box2 / Box3, ArenaText2, picture 0x29, DrawArenaParticipants 0x15, scene 0xC, TASK_ARG 3
ArenaBracketQuit:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	ClearArenaPortraitArea2
	ld	A,0
	ld	(XIZ+0x21),A
	call	EraseBox2Tall
	call	OpenBox2
	call	ClearBox2
	call	PlaceBox2
	call	OpenBox3
	call	ClearBox3
	call	PlaceBox3
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	HL,0x29
	calr	ArenaShowPicture
	ld	HL,0x15
	calr	DrawArenaParticipants
	ld	A,0xC
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2143C8	section	code abs=0x2143C8

; [code] ArenaTask state 6, on +0x2A: 1 -> 2, 2 ArenaBracketReveal, 3 ArenaFightQuitInput; every frame ArenaPortraitAnimStep, +0x2D += 1
ArenaBracketDispatch:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,ArenaBracketDispatch.skip
	ld	A,2
	ld	(XIZ+0x2A),A
	jr	ArenaBracketDispatch.skip4
ArenaBracketDispatch.skip:
	cp	A,2
	jr	NZ,ArenaBracketDispatch.skip2
	calr	ArenaBracketReveal
	jr	ArenaBracketDispatch.skip4
ArenaBracketDispatch.skip2:
	cp	A,3
	jr	NZ,ArenaBracketDispatch.skip3
	calr	ArenaFightQuitInput
	jr	ArenaBracketDispatch.skip4
ArenaBracketDispatch.skip3:
	ld	A,1
	ld	(XIZ+0x2A),A
ArenaBracketDispatch.skip4:
	calr	ArenaPortraitAnimStep
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216C1F	section	code abs=0x216C1F

; [code] XHL = tilemap, WA = tile: UncoverTileStep step 0, then 12 x 14 entries (row stride 0x20) of the tile with palette 15 (0x3E00), flip bit 14 on odd rows
DrawUncoverTilemap:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	UncoverTileStep
	pop	WA
	ld	B,0
DrawUncoverTilemap.loop:
	ld	C,0
DrawUncoverTilemap.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,DrawUncoverTilemap.skip
	or	DE,0x4000
	jr	DrawUncoverTilemap.skip2
DrawUncoverTilemap.skip:
	or	DE,0
DrawUncoverTilemap.skip2:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0xC
	jr	C,DrawUncoverTilemap.loop2
	ld	XDE,0x20
	sub	XDE,0xC
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0xE
	jr	C,DrawUncoverTilemap.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216C75	section	code abs=0x216C75

; [code] WA = tile, C = step: the tile's 8 pixel rows (words) in CHAR RAM 0xA000 + 16 * tile = 0 (clear) for the last step / 2 rows, else 0xFFFF (colour 3); A = 1 until step / 2 = 8
UncoverTileStep:
	push	XHL
	push	XDE
	push	XBC
	sra	1,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,0xA000
	add	XHL,XWA
	ld	B,8
UncoverTileStep.loop:
	cp	C,B
	jr	C,UncoverTileStep.skip
	ld	WA,0
	jr	UncoverTileStep.skip2
UncoverTileStep.skip:
	ld	WA,0xFFFF
UncoverTileStep.skip2:
	ld	(XHL),WA
	inc	2,XHL
	djnz	B,UncoverTileStep.loop
	cp	C,8
	jr	Z,UncoverTileStep.skip3
	ld	A,1
	jr	UncoverTileStep.skip4
UncoverTileStep.skip3:
	ld	A,0
UncoverTileStep.skip4:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216CAA	section	code abs=0x216CAA

; [code] the DrawUncoverTilemap shape with CoverTileStep step 0 and flip bit 14 on even rows
DrawCoverTilemap:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	CoverTileStep
	pop	WA
	ld	B,0
DrawCoverTilemap.loop:
	ld	C,0
DrawCoverTilemap.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,DrawCoverTilemap.skip
	or	DE,0
	jr	DrawCoverTilemap.skip2
DrawCoverTilemap.skip:
	or	DE,0x4000
DrawCoverTilemap.skip2:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0xC
	jr	C,DrawCoverTilemap.loop2
	ld	XDE,0x20
	sub	XDE,0xC
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0xE
	jr	C,DrawCoverTilemap.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D00	section	code abs=0x216D00

; [code] the UncoverTileStep shape the other way: the last step / 2 rows = 0xFFFF, the rest 0; A = 1 until step / 2 = 0x10
CoverTileStep:
	push	XHL
	push	XDE
	push	XBC
	sra	1,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,0xA000
	add	XHL,XWA
	ld	B,8
CoverTileStep.loop:
	cp	C,B
	jr	C,CoverTileStep.skip
	ld	WA,0xFFFF
	jr	CoverTileStep.skip2
CoverTileStep.skip:
	ld	WA,0
CoverTileStep.skip2:
	ld	(XHL),WA
	inc	2,XHL
	djnz	B,CoverTileStep.loop
	cp	C,0x10
	jr	Z,CoverTileStep.skip3
	ld	A,1
	jr	CoverTileStep.skip4
CoverTileStep.skip3:
	ld	A,0
CoverTileStep.skip4:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D35	section	code abs=0x216D35

; [code] zeroes 20 x 19 entries (row stride 0x20) of the tilemap at XHL
ClearTilemap20x19:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,0
	ld	B,0
ClearTilemap20x19.loop:
	ld	C,0
ClearTilemap20x19.loop2:
	ld	(XHL),WA
	inc	2,XHL
	inc	1,C
	cp	C,0x14
	jr	C,ClearTilemap20x19.loop2
	ld	XDE,0x20
	sub	XDE,0x14
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0x13
	jr	C,ClearTilemap20x19.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
