; engine/gfx/robot: 15 routines (each keeps its ROM address in its own section)

c_2070C7	section	code abs=0x2070C7

; format 04: w, h, LZSS 4-bit pixels (4 = transparent)
DrawPartImage:
	cpb	(XHL+),4
	ret	NZ
	push	XIX
	push	XIY
	push	XIZ
	pushw	0
	pushw	(XHL+)
	push	QD
	push	QB
	push	DE
	push	BC
	push	WA
	ld	XDE,wTextBuffer
	ld	XWA,0
DrawPartImage.loop:
	ld	(XDE+),XWA
	cp	DE,0x43EE
	jr	C,DrawPartImage.loop
	ld	XIZ,XHL
	ld	A,(XSP+8)
	mul	WA,(XSP+9)
	ld	IY,WA
	ld	IX,0
	ld	QIX,0x3EE
DrawPartImage.loop2:
	cp	(XSP+0xA),IY
	jrl	NC,DrawPartImage.skip3
	srl	1,IX
	bit	0,IXH
	jr	NZ,DrawPartImage.skip
	ld	A,(XIZ+)
	ld	IXL,A
	ld	IXH,0xFF
DrawPartImage.skip:
	bit	0,IXL
	jr	Z,DrawPartImage.skip2
	ld	A,(XIZ+)
	ld	XDE,wTextBuffer
	ld	(XDE+QIX),A
	minc1	0x400,QIX
	ld	QB,A
	srl	4,A
	cp	A,4
	call	C,PlotPixel
	incw	1,(XSP+0xA)
	ld	A,QB
	and	A,0xF
	cp	A,4
	call	C,PlotPixel
	incw	1,(XSP+0xA)
	jr	DrawPartImage.loop2
DrawPartImage.skip2:
	ld	WA,(XIZ+)
	ld	QIY,WA
	srl	4,QIYH
	and	W,0xF
	inc	3,W
	ld	QW,W
DrawPartImage.loop3:
	ld	XDE,wTextBuffer
	ld	A,(XDE+QIY)
	minc1	0x400,QIY
	ld	(XDE+QIX),A
	minc1	0x400,QIX
	ld	QB,A
	srl	4,A
	cp	A,4
	call	C,PlotPixel
	incw	1,(XSP+0xA)
	ld	A,QB
	and	A,0xF
	cp	A,4
	call	C,PlotPixel
	incw	1,(XSP+0xA)
	djnz	QW,DrawPartImage.loop3
	jrl	DrawPartImage.loop2
DrawPartImage.skip3:
	add	XSP,0xC
	pop	XIZ
	pop	XIY
	pop	XIX
	ret

c_2071AF	section	code abs=0x2071AF

PlotPixel:
	ld	DE,(XSP+0xE)
	div	DE,(XSP+0xC)
	ld	C,D
	ld	B,0
	ld	D,0
	add	BC,(XSP+6)
	add	DE,(XSP+8)
	ld	HL,DE
	srl	3,HL
	mul	HL,(XSP+0xA)
	ld	QHL,HL
	ld	HL,BC
	srl	3,HL
	add	HL,QHL
	add	HL,(XSP+4)
	push	A
	sll	4,HL
	ld	A,E
	and	A,7
	sll	1,A
	ld	W,0
	add	HL,WA
	add	HL,0xA000
	ld	A,C
	sll	1,A
	ld	BC,0x3FFF
	rrc	A,BC
	pop	E
	and	DE,3
	inc	2,A
	rrc	A,DE
	extz	XHL
	and	(XHL),BC
	or	(XHL),DE
	ret

c_207CE7	section	code abs=0x207CE7

swp_207CE7:
	extz	XDE
	sll	4,DE
	add	DE,0xA000

c_207CF0	section	code abs=0x207CF0

; [code] BC = value (clamped to 0-999), XDE = 3 tiles: fills them with the font glyph of code 0 (space, byte NumberTileChars), then writes the decimal digits right-aligned (glyph 0x41 '0' + digit, GetFontGlyph), last digit first; callers ScreenShakeTask, DrawBattleScreen, DrawBattleItemPage, DrawSaveSlotList
RenderNumberTiles:
	or	BC,BC
	jr	PL,RenderNumberTiles.skip
	ld	BC,0
	jr	RenderNumberTiles.skip2
RenderNumberTiles.skip:
	cp	BC,0x3E8
	jr	C,RenderNumberTiles.skip2
	ld	BC,0x3E7
RenderNumberTiles.skip2:
	push	BC
	push	XDE
	ld	L,(NumberTileChars)
	call	GetFontGlyph
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XHL
	ld	BC,0x10
	ldirw	(XDE+),(XHL+)
	dec	2,XDE
	pop	BC
RenderNumberTiles.loop:
	extz	XBC
	div	XBC,0xA
	ld	HL,QBC
	add	L,(NumberTileChars+1)
	call	GetFontGlyph
	add	XHL,0xE
	push	BC
	ld	BC,8
	lddrw	(XDE-),(XHL-)
	pop	BC
	or	BC,BC
	jr	NZ,RenderNumberTiles.loop
	ret
NumberTileChars:
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

c_207D9D	section	code abs=0x207D9D

; [code] wDrawBody image (ImageTable group 0) at PartOffsetsBody[wDrawBody]
DrawBodyPart:
	or	B,B
	ret	Z
	push	XIX
	push	XIY
	ld	XIX,ImageTable
	ld	XIY,PartOffsetsBody
	or	C,C
	jr	Z,DrawBodyPart.skip
	cp	C,0x10
	jr	NC,DrawBodyPart.skip
	ld	C,B
	ld	XDE,0
	ld	D,B
	dec	1,D
	srl	3,DE
	sub	XIY,XDE
DrawBodyPart.skip:
	calr	DrawRobotPart
	pop	XIY
	pop	XIX
	ret

c_207DC9	section	code abs=0x207DC9

; [code+play] wDrawRightArm image from group 15 (gfx/parts/arm_r), drawn behind the body
DrawRightArmPart:
	or	B,B
	ret	Z
	push	XIX
	push	XIY
	ld	XIX,RightArmImages
	ld	XIY,PartOffsetsRightArm
	calr	DrawRobotPart
	pop	XIY
	pop	XIX
	ret

c_207DDF	section	code abs=0x207DDF

; [code+play] wDrawLeftArm image from group 95 (gfx/parts/arm_l), drawn last
DrawLeftArmPart:
	or	B,B
	ret	Z
	push	XIX
	push	XIY
	ld	XIX,LeftArmImages
	ld	XIY,PartOffsetsLeftArm
	calr	DrawRobotPart
	pop	XIY
	pop	XIX
	ret

c_207DF5	section	code abs=0x207DF5

; [code] wDrawLegs image (ImageTable group 175) at PartOffsetsLegs[image][wDrawBody]
DrawLegsPart:
	or	B,B
	ret	Z
	push	XIX
	push	XIY
	ld	XIX,LegImages
	ld	XIY,PartOffsetsLegs
	calr	DrawRobotPart
	pop	XIY
	pop	XIX
	ret

c_207E0B	section	code abs=0x207E0B

; [code] wDrawBack image (ImageTable group 225) at PartOffsetsBack[image][wDrawBody]
DrawBackPart:
	or	B,B
	ret	Z
	push	XIX
	push	XIY
	ld	XIX,BackImages
	ld	XIY,PartOffsetsBack
	calr	DrawRobotPart
	pop	XIY
	pop	XIX
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

c_207E77	section	code abs=0x207E77

; [code] SetRobotDrawParts(wEquipCore), DrawRobot, colours from GetAffinityPalette(wUnitAffinity)
DrawEquippedRobot:
	push	DE
	push	BC
	push	WA
	call	SetEquippedDrawParts
	ld	HL,(XSP)
	call	DrawRobot
	pop	WA
	pop	BC
	ld	DE,(XSP)
	call	DrawTileBlockScr
	ld	HL,(wUnitAffinity)
	call	GetAffinityPalette
	pop	DE
	call	LoadImagePalette
	ret

c_207F30	section	code abs=0x207F30

; [code] XHL palette into SCR2 palette 0 (DE >= 0x20) or SCR1 palette 0, + mono palettes
LoadImagePalette:
	cp	DE,0x20
	jr	C,LoadImagePalette.skip
	ld	A,0x20
	ld	C,1
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_220BFC
	call	LoadMonoPalettes
	ld	A,5
	ld	C,1
	ld	XHL,MonoPal_21F018
	call	LoadMonoPalettes
	ret
LoadImagePalette.skip:
	ld	A,0x10
	ld	C,1
	call	LoadPalettes
	ld	A,2
	ld	C,1
	ld	XHL,MonoPal_220BFC
	call	LoadMonoPalettes
	ld	A,3
	ld	C,1
	ld	XHL,MonoPal_21F018
	call	LoadMonoPalettes
	ret

c_208475	section	code abs=0x208475

; [code] SetRobotDrawParts with XHL = wEquipCore (the equipped parts); caller DrawEquippedRobot
SetEquippedDrawParts:
	ld	XHL,wEquipCore
	call	SetRobotDrawParts
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
