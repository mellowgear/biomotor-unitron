; engine/arena/opponents.asm: arena bracket: opponent line-up, LoadArenaOpponent boxes, participant tile wipes

c_213249	section	code abs=0x213249

; Arena talk portrait HL after clearing the area: 0 none; 0xFFFF / 0xFFFE the partner (race portrait 1 + ((wPlayerRace - 1) xor 1),
; or the talk portrait 0xB + that at columns 1-6, rows 4-13 for the Rank CS talk); 0x38 / 0x3A a full picture over boxes 2 and 3;
; else portrait HL on SCR2 [code][play]
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
	; 0x38 / 0x3A: full-screen pictures
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
	; the other race of the pair: the partner (?)
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
	call	GetArenaPortraitFirstTile
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

; Opens box 4 (8 x 6 tiles), the off-screen buffer the bracket lines are pre-shifted in [code]
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

; Portrait wipe mode +0x21 = 1 (uncover) [code]
SetPortraitUncoverMode:
	push	A
	ld	A,1
	ld	(XIZ+0x21),A
	pop	A
	ret

c_213B32	section	code abs=0x213B32

; Portrait wipe mode +0x21 = 2 (cover back) [code]
SetPortraitRecoverMode:
	push	A
	ld	A,2
	ld	(XIZ+0x21),A
	pop	A
	ret

c_213B3A	section	code abs=0x213B3A

; Starts uncovering the SCR2 portrait from fully covered (+0x2B = 0) [code]
StartPortraitUncover:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,SCROLL2_VRAM
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

; Starts covering the SCR2 portrait back from fully open (+0x2B = 0x10) [code]
StartPortraitRecover:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,SCROLL2_VRAM
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

; One frame of the portrait wipe +0x21: uncover steps +0x2B up to 0x10, cover steps it down to 0; a cover that ends in
; the Fight / Quit state (+0x2A 3) loads opponent +0x1E and uncovers it; +0x21 = 0 when done [code]
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
	; covered while cycling in Fight / Quit: swap in opponent +0x1E
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

; ArenaSceneNext 0xF8, after the rank is paid for: the rank name in box 1, rolls the line-up, opens box 4 and starts the
; reveal (+0x2A = 2) [code][play]
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
	; cursor row = rank row
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

; Fills opponent slots +0x18..+0x1D from the rank's ArenaBracketRows (count +0x16 from ArenaBracketSizes), each 0xFF a random
; pilot not yet drawn; below rank 8 each pilot gets 6 random parts in wArenaPilotParts + 6 * slot from its rank tier and pilot
; group. Ends with ResetArenaBracketState [code]
RollArenaBracket:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	; +0x15 = rank row + 2
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
	; 0xFF = a random pilot
	cp	A,0xFF
	jr	NZ,RollArenaBracket.skip2
	push	XDE
RollArenaBracket.loop2:
	call	Random
	; pilot = ENEMY_ALEX + Random % 15
	ld	W,0
	div	WA,0xF
	ld	A,W
	add	A,ENEMY_ALEX
	; re-roll if any earlier slot holds it
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
	; ranks 8 and up keep the pilots' own parts
	ld	W,(XIZ+0x15)
	cp	W,8
	jrl	NC,RollArenaBracket.skip5
	; +0x1E = part tier (7 - rank), +0x1F = pilot, +0x20 = pilot group (pilot / 3)
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
	; core by tier, body base by tier + 3 * group
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
	; two arms from the tier's 15-entry list
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
	; legs and back from the 3-entry list of (tier, group)
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
	; fixed opponents keep their own parts
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

; Clears the bracket counters +0x1E..+0x21 [code]
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

; Draws string XHL on box 4 row 3 and fills rows 2, 1, 0 with it shifted 2, 4, 6 px left (colour 1 fed in): the frames
; SlideBracketLineFromLeft copies [code]
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
	; copy row C to row C - 1, then shift that copy
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
	; rld through a tile row: each nibble is 2 px, 0x55 feeds colour 1
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

; Box4PreshiftLeft shifting right: the frames SlideBracketLineFromRight copies [code]
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
	; copy row C to row C - 1, then shift that copy
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

; Pre-shifts string XHL in box 4: A = 0 for a line entering from the left, else from the right [code]
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

; Slide step +0x1F (0..0x17) of box 2 line +0x1E: copies the right end of the matching box 4 frame into its left tiles, so
; the line enters from the left 2 px per step [code]
SlideBracketLineFromLeft:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	; source: frame +0x1F & 3, from tile 5 - +0x1F / 4
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
	; +0x1F / 4 + 1 tiles
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

; Mirror of SlideBracketLineFromLeft: the line enters from the right [code]
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
	; destination ends at the line's last tile
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

; One slide step of bracket line +0x1E: A = 0 from the left (even lines, the rounds), else from the right (the names);
; 24 steps of 2 px, one a frame [code][play]
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

; XHL = text of bracket line A: odd lines the name of opponent A / 2, even lines the round label Pointers_249CB8[A / 2]
; (label 5 for the last round) [code]
GetArenaBracketLine:
	push	XDE
	push	XBC
	push	XWA
	; carry = odd line
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

; Box 2: all 2 * +0x16 bracket lines at once [code]
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

; Highlights (xor 0xAAAA) the two box 2 lines of bracket slot +0x1E; a second call removes it [code]
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
	; 2 lines x 6 tiles x 8 pixel rows
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

; Loads opponent slot A (pilot parts if it is a pilot) and draws its picture on SCR1 [code][play]
LoadArenaOpponent:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,SCROLL1_VRAM
	call	ClearTilemap20x19
	ld	E,A
	extz	DE
	extz	XDE
	ld	XHL,XIZ
	add	XHL,0x18
	add	XHL,XDE
	ld	A,(XHL)
	; random pilots carry rolled parts
	cp	A,ENEMY_ALEX
	jr	C,LoadArenaOpponent.skip
	cp	A,ENEMY_FENRIL
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

; Bracket state 2, per frame: for each line +0x1E, pre-shift, slide it in (+0x20 1), then pause 10 frames before a name, 30
; before a round (+0x20 2 / 3), showing each opponent's picture; A skips to the full list, B quits; at the end Fight / Quit
; in box 1 on slot 0, cursor 0, state 3 [code][play]
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
	; +0x20: 0 next line, 1 sliding, 2 / 3 pause, 4 done
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
	; all lines shown
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
	; name lines show the opponent, round lines cover it
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
	; A: skip the animation
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

; Bracket state 3: A chooses; falls into the B, d-pad and cursor parts [code]
ArenaFightQuitInput:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,ArenaFightQuitInputB
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	calr	ArenaFightQuitChoose
	jrl	ArenaFightQuitCursor

c_214239	section	code abs=0x214239

; Unreachable jump to the shared exit after ArenaFightQuitInput's own [code]
ArenaFightQuitInputExit:
	jrl	ArenaFightQuitCursor.skip

c_21423C	section	code abs=0x21423C

; B picks Quit and chooses [code]
ArenaFightQuitInputB:
	bit	5,A
	jr	Z,ArenaFightQuitInputDPad
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	calr	ArenaFightQuitChoose
	jrl	ArenaFightQuitCursor

c_214255	section	code abs=0x214255

; Unreachable jump to the shared exit after ArenaFightQuitInputB's own [code]
ArenaFightQuitInputBExit:
	jrl	ArenaFightQuitCursor.skip

c_214258	section	code abs=0x214258

; Left / right move the Fight (0) / Quit (1) cursor +0x10; while no wipe runs, every 0x96 frames +0x2C highlights and shows
; the next opponent +0x1E (wrapping) [code]
ArenaFightQuitInputDPad:
	and	A,0xF
	jr	Z,ArenaFightQuitInputDPad.skip4
	; 4 = left, 8 = right
	cp	A,4
	jr	NZ,ArenaFightQuitInputDPad.skip2
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,ArenaFightQuitInputDPad.skip
	push	WA
	ld	WA,SFX_CURSOR
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
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	ArenaFightQuitInputDPad.skip4
ArenaFightQuitInputDPad.skip3:
	jr	ArenaFightQuitInputDPad.skip4
ArenaFightQuitInputDPad.skip4:
	; cycle through the opponents while idle
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
	; cover, then ArenaPortraitAnimStep loads +0x1E; falls into ArenaFightQuitCursor
	calr	SetPortraitRecoverMode

c_2142D5	section	code abs=0x2142D5

; Draws the Fight / Quit cursor, then the shared register pops and ret [code]
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

; Fight: pays the rank's entry cost from wGP, sets the talked flags, shows the arena picture and queues scene 0xB;
; Quit: ArenaBracketQuit. State TASK_ARG 3 [code]
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
	; pay the entry cost
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

; Leaves the bracket without paying: the arena picture and scene 0xC via state TASK_ARG 3 [code]
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

; ArenaTask state 6: bracket state +0x2A (1 -> 2, 2 reveal, 3 Fight / Quit; others reset to 1), then the portrait wipe [code]
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
