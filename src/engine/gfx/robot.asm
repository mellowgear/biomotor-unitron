; engine/gfx/robot: 5 routines (each keeps its ROM address in its own section)

c_207CE7	section	code abs=0x207CE7

swp_207CE7:
	extz	XDE
	sll	4,DE
	add	DE,0xA000

c_207CF0	section	code abs=0x207CF0

sub_207CF0:
	or	BC,BC
	jr	PL,sub_207CF0.skip
	ld	BC,0
	jr	sub_207CF0.skip2
sub_207CF0.skip:
	cp	BC,0x3E8
	jr	C,sub_207CF0.skip2
	ld	BC,0x3E7
sub_207CF0.skip2:
	push	BC
	push	XDE
	ld	L,(0x207D3E)
	call	GetFontGlyph
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XHL
	ld	BC,0x10
	ldirw	(XDE+),(XHL+)
	dec	2,XDE
	pop	BC
sub_207CF0.loop:
	extz	XBC
	div	XBC,0xA
	ld	HL,QBC
	add	L,(0x207D3F)
	call	GetFontGlyph
	add	XHL,0xE
	push	BC
	ld	BC,8
	lddrw	(XDE-),(XHL-)
	pop	BC
	or	BC,BC
	jr	NZ,sub_207CF0.loop
	ret
	db	0x00,0x41

c_207D40	section	code abs=0x207D40

; clear the canvas, draw back, right arm (behind the body), body, legs, left arm
DrawRobot:
	push	XHL
	ld	WA,HL
	ld	QA,0
	ld	BC,0x84
	call	FillTiles
	ld	B,(wDrawBack)
	ld	C,(wDrawBody)
	ld	HL,(XSP)
	call	DrawBackPart
	ld	B,(wDrawRightArm)
	ld	C,(wDrawBody)
	ld	HL,(XSP)
	call	DrawRightArmPart
	ld	B,(wDrawBody)
	ld	C,(wDrawBody)
	ld	HL,(XSP)
	call	DrawBodyPart
	ld	B,(wDrawLegs)
	ld	C,(wDrawBody)
	ld	HL,(XSP)
	call	DrawLegsPart
	ld	B,(wDrawLeftArm)
	ld	C,(wDrawBody)
	ld	HL,(XSP)
	call	DrawLeftArmPart
	pop	XHL
	ld	QB,0xC
	ld	QD,0xB
	ret

c_207E21	section	code abs=0x207E21

; one part image from its slot group of ImageTable
DrawRobotPart:
	push	XWA
	ld	WA,HL
	dec	1,B
	ld	XDE,0
	ld	E,B
	sll	2,DE
	add	XDE,XIX
	ld	XHL,(XDE)
	cp	C,0x10
	jr	NC,DrawRobotPart.skip2
	or	C,C
	jr	NZ,DrawRobotPart.skip
	ld	C,1
DrawRobotPart.skip:
	sll	4,C
	srl	3,BC
	extz	XBC
	add	XBC,XIY
	ld	E,(XBC+1)
	ld	C,(XBC)
	jr	DrawRobotPart.skip3
DrawRobotPart.skip2:
	ld	C,0x60
	sub	C,(XHL+1)
	srl	1,C
	ld	E,0x58
	sub	E,(XHL+2)
	srl	1,E
DrawRobotPart.skip3:
	ld	QB,0xC
	ld	QD,0xB
	exts	BC
	exts	DE
	call	DrawPartImage
	pop	XWA
	ld	QB,0xC
	ld	QD,0xB
	ret

c_208489	section	code abs=0x208489

; XHL = 6 part ids -> wDrawBody..wDrawBack image indexes
SetRobotDrawParts:
	push	XHL
	ld	XDE,XHL
	ld	XHL,0
	ld	(wDrawBody),XHL
	ld	(wDrawBack),L
	ld	L,(XDE+1)
	or	L,L
	jr	Z,SetRobotDrawParts.skip
	call	GetBodyRecord
	ld	A,(XHL+PART_IMAGE)
	ld	(wDrawBody),A
SetRobotDrawParts.skip:
	ld	L,(XDE+2)
	or	L,L
	jr	Z,SetRobotDrawParts.skip2
	call	GetArmRecord
	ld	A,(XHL+PART_IMAGE)
	ld	(wDrawRightArm),A
SetRobotDrawParts.skip2:
	ld	L,(XDE+3)
	or	L,L
	jr	Z,SetRobotDrawParts.skip3
	call	GetArmRecord
	ld	A,(XHL+PART_IMAGE)
	ld	(wDrawLeftArm),A
SetRobotDrawParts.skip3:
	ld	L,(XDE+4)
	or	L,L
	jr	Z,SetRobotDrawParts.skip4
	call	GetLegsRecord
	ld	A,(XHL+PART_IMAGE)
	ld	(wDrawLegs),A
SetRobotDrawParts.skip4:
	ld	L,(XDE+5)
	or	L,L
	jr	Z,SetRobotDrawParts.skip5
	call	GetBackRecord
	ld	A,(XHL+PART_IMAGE)
	ld	(wDrawBack),A
SetRobotDrawParts.skip5:
	pop	XHL
	ret
