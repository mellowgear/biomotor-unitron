; engine/gfx/robot: 15 routines (each keeps its ROM address in its own section)

c_2070C7	section	code abs=0x2070C7

; Plots a format-4 image at XHL (byte 4, w, h, LZSS stream of 4-bit pixels, 4+ = transparent) into a tile canvas
; QB tiles wide from tile WA, at pixel BC, DE; wTextBuffer is the 1 KiB LZSS ring as in DecompressTiles [code]
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
	cp	DE,wTextBuffer+0x3EE
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
	srl	4,A	; two pixels per byte, high nibble first
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

; DrawPartImage's pixel plot: pixel n of the image (frame word +0xE) at x = n % w, y = n / w plus the origin,
; colour A (0..3) into the 2bpp canvas tile (y / 8) * QB + x / 8 + WA [code]
PlotPixel:
	ld	DE,(XSP+0xE)
	div	DE,(XSP+0xC)	; E = row, D = column
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
	add	HL,CHARACTER_RAM
	ld	A,C
	sll	1,A
	ld	BC,0x3FFF	; pixel mask and colour rotated to bits 15-14 >> 2x
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

; RenderNumberTiles to CHAR RAM tile XDE; no callers [code]
RenderNumberTilesAtTile:
	extz	XDE
	sll	4,DE
	add	DE,CHARACTER_RAM

c_207CF0	section	code abs=0x207CF0

; Writes BC (clamped 0..999) right-aligned in three font-glyph tiles at CHAR RAM XDE [code]
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
; RenderNumberTiles' glyph codes: blank, then the first digit
NumberTileChars:
	db	0x00,0x41

c_207D40	section	code abs=0x207D40

; Draws the robot of wDrawBody..wDrawBack into the 12 x 11 tile canvas at tile HL: clears it, then back, right
; arm (behind the body), body, legs and left arm. Out: QB, QD = 0xC, 0xB [code]
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

; Draws body image B (ImageTable group 0) at PartOffsetsBody entry B, centred if C >= 0x10; B 0 = none [code]
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

; Draws right-arm image B (RightArmImages) placed for body C by PartOffsetsRightArm; B 0 = none [code+play]
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

; Draws left-arm image B (LeftArmImages) placed for body C by PartOffsetsLeftArm; B 0 = none [code+play]
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

; Draws legs image B (LegImages) placed for body C by PartOffsetsLegs; B 0 = none [code]
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

; Draws back image B (BackImages) placed for body C by PartOffsetsBack; B 0 = none [code]
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

; Draws image B of image list XIX into the canvas at tile HL, at offset table XIY[B - 1][body C] (x, y bytes;
; body 0 counts as 1), or centred in the 0x60 x 0x58 canvas for C >= 0x10 [code]
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
	srl	3,BC	; (B - 1) * 32 + C * 2
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

; Draws the equipped robot (wEquipCore parts) at tile WA, shown at BC, DE in wUnitAffinity colours [code]
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

; Loads colour palette XHL plus the image and text-box mono palettes into scroll 2 (DE >= 0x20) or scroll 1 [code]
LoadImagePalette:
	cp	DE,0x20
	jr	C,LoadImagePalette.skip
	ld	A,0x20
	ld	C,1
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,ImageMonoPal
	call	LoadMonoPalettes
	ld	A,5
	ld	C,1
	ld	XHL,TextBoxMonoPal
	call	LoadMonoPalettes
	ret
LoadImagePalette.skip:
	ld	A,0x10
	ld	C,1
	call	LoadPalettes
	ld	A,2
	ld	C,1
	ld	XHL,ImageMonoPal
	call	LoadMonoPalettes
	ld	A,3
	ld	C,1
	ld	XHL,TextBoxMonoPal
	call	LoadMonoPalettes
	ret

c_208475	section	code abs=0x208475

; SetRobotDrawParts for the equipped parts (wEquipCore) [code]
SetEquippedDrawParts:
	ld	XHL,wEquipCore
	call	SetRobotDrawParts
	ret

c_208489	section	code abs=0x208489

; Sets wDrawBody..wDrawBack to the PART_IMAGE of the 6 part ids at XHL (+1 body .. +5 back; 0 = none) [code]
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
