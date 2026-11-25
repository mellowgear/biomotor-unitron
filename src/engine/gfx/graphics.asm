; engine/gfx/graphics: 81 routines (each keeps its ROM address in its own section)

c_206179	section	code abs=0x206179

swp_206179:
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

c_20659B	section	code abs=0x20659B

sub_20659B:
	push	XIX
	push	XIY
	ld	XHL,0x5A86
	ld	XDE,0x8900
	ld	BC,(0x5A82)
	sub	BC,HL
	jr	Z,sub_20659B.skip
	srl	2,BC
sub_20659B.loop:
	ld	XWA,(XHL+)
	ld	(-XDE),XWA
	djnz	BC,sub_20659B.loop
sub_20659B.skip:
	ld	BC,0x5B86
	sub	BC,(0x5A82)
	jr	Z,sub_20659B.skip2
	srl	2,BC
	ld	XWA,0
sub_20659B.loop2:
	ld	(-XDE),XWA
	djnz	BC,sub_20659B.loop2
sub_20659B.skip2:
	cpb	(wColorFlags),0x10
	jr	C,sub_20659B.skip4
	ld	XHL,0x5B86
	ld	XDE,0x8C40
	ld	BC,(0x5A84)
	sub	BC,HL
	jr	Z,sub_20659B.skip3
sub_20659B.loop3:
	ld	A,(XHL+)
	ld	(-XDE),A
	djnz	BC,sub_20659B.loop3
sub_20659B.skip3:
	ld	A,(wFadeLevel)
	cp	A,(0x585C)
	ld	(0x585C),A
	call	NZ,FadePalettes
	jr	sub_20659B.skip5
sub_20659B.skip4:
	ld	A,(wFadeLevel)
	cp	A,(0x585C)
	ld	(0x585C),A
	call	NZ,sub_2066DE
	jr	sub_20659B.skip5
sub_20659B.skip5:
	ldw	(0x5A82),0x5A86
	ldw	(0x5A84),0x5B86
	pop	XIY
	pop	XIX
	ret

c_206626	section	code abs=0x206626

; palette shadow 0x5876 -> palette RAM 0x8200, with brightness
FadePalettes:
	cpb	(wColorFlags),0x10
	ret	C
	push	XIX
	push	XIY
	ld	XIY,wPalShadow
	ld	XIX,0x8200
	ld	QHL,0x100
	ld	HL,0
	ld	A,(wFadeLevel)
	or	A,A
	jrl	Z,FadePalettes.skip
	cp	A,0x7F
	scf
	jrl	Z,FadePalettes.skip2
	cp	A,0x81
	rcf
	jr	Z,FadePalettes.skip2
	ld	L,A
	sll	1,L
	jr	NC,FadePalettes.loop2
FadePalettes.loop:
	ld	WA,(XIY+)
	ld	BC,WA
	and	BC,0xF
	mul	XBC,HL
	and	B,0xF
	ld	E,B
	ld	BC,WA
	and	BC,0xF0
	mul	XBC,HL
	and	B,0xF0
	or	E,B
	ld	BC,WA
	and	BC,0xF00
	mul	XBC,HL
	ld	D,QC
	ld	(XIX+),DE
	djnz	QHL,FadePalettes.loop
	pop	XIY
	pop	XIX
	ret
FadePalettes.loop2:
	ld	WA,(XIY+)
	ld	BC,WA
	and	BC,0xF
	xor	C,0xF
	mul	XBC,HL
	and	B,0xF
	add	A,B
	ld	BC,WA
	and	BC,0xF0
	xor	C,0xF0
	mul	XBC,HL
	and	B,0xF0
	add	A,B
	ld	BC,WA
	and	BC,0xF00
	xor	B,0xF
	mul	XBC,HL
	add	W,QC
	ld	(XIX+),WA
	djnz	QHL,FadePalettes.loop2
	pop	XIY
	pop	XIX
	ret
FadePalettes.skip:
	ld	BC,QHL
	ldirw	(XIX+),(XIY+)
	pop	XIY
	pop	XIX
	ret
FadePalettes.skip2:
	sbc	WA,WA
FadePalettes.loop3:
	ld	(XIX+),WA
	djnz	QHL,FadePalettes.loop3
	pop	XIY
	pop	XIX
	ret

c_2066DE	section	code abs=0x2066DE

sub_2066DE:
	cpb	(wColorFlags),0x10
	ret	NC
	push	XIX
	push	XIY
	ld	XIY,wMonoPalShadow
	ld	XIX,0x8100
	ld	QHL,0x19
	ld	HL,0
	ld	A,(wFadeLevel)
	or	A,A
	jr	Z,sub_2066DE.skip
	cp	A,0x7F
	rcf
	jr	Z,sub_2066DE.skip2
	cp	A,0x81
	scf
	jr	Z,sub_2066DE.skip2
	ld	L,A
	sll	1,L
	cpl	L
	jr	C,sub_2066DE.loop2
sub_2066DE.loop:
	ld	A,(XIY+)
	and	WA,7
	mul	XWA,HL
	and	W,7
	or	W,0x80
	ld	(XIX+),W
	djnz	QHL,sub_2066DE.loop
	pop	XIY
	pop	XIX
	ret
sub_2066DE.loop2:
	ld	A,(XIY+)
	and	WA,7
	ld	C,A
	xor	A,7
	mul	XWA,HL
	add	W,C
	and	W,7
	or	W,0x80
	ld	(XIX+),W
	djnz	QHL,sub_2066DE.loop2
	pop	XIY
	pop	XIX
	ret
sub_2066DE.skip:
	ld	BC,QHL
	ldir	(XIX+),(XIY+)
	pop	XIY
	pop	XIX
	ret
sub_2066DE.skip2:
	sbc	W,W
	and	W,7
	or	W,0x80
sub_2066DE.loop3:
	ld	(XIX+),W
	djnz	QHL,sub_2066DE.loop3
	pop	XIY
	pop	XIX
	ret

c_20692B	section	code abs=0x20692B

; XHL = u16 count + tiles, WA = first tile
LoadRawTiles:
	ld	BC,(XHL+)
	sll	3,BC
	ld	DE,WA
	sll	4,DE
	extz	XDE
	add	XDE,0xA000
	ldirw	(XDE+),(XHL+)
	ret

c_206941	section	code abs=0x206941

swp_206941:
	ld	C,(XDE+)
	mul	BC,(XDE+)
	sll	4,WA
	add	WA,0xA000
	ld	QBC,WA
	inc	2,XHL
swp_206941.loop:
	push	XHL
	ld	WA,(XDE+)
	or	WA,WA
	jr	NZ,swp_206941.skip
	ld	XWA,0
	ld	XHL,0
	ld	HL,QBC
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	QBC,HL
	jr	swp_206941.skip2
swp_206941.skip:
	dec	1,WA
	sll	4,WA
	lda	XHL,XHL+WA
	push	BC
	push	XDE
	ld	BC,8
	ld	XDE,0
	ld	DE,QBC
	ldirw	(XDE+),(XHL+)
	ld	QBC,DE
	pop	XDE
	pop	BC
swp_206941.skip2:
	pop	XHL
	djnz	BC,swp_206941.loop
	ret

c_206993	section	code abs=0x206993

; fill tiles with one shade
FillTiles:
	ld	XDE,0
	and	QA,3
	jr	Z,FillTiles.skip
	ld	E,QA
	sll	2,E
	or	E,QA
	sll	2,E
	or	E,QA
	sll	2,E
	or	E,QA
	ld	D,E
	ld	QDE,DE
FillTiles.skip:
	sll	2,BC
	sll	4,WA
	add	WA,0xA000
	extz	XWA
FillTiles.loop:
	ld	(XWA+),XDE
	djnz	BC,FillTiles.loop
	ret

c_2069C8	section	code abs=0x2069C8

dyn_2069C8:
	cp	DE,0x98
	ret	GE
	cp	BC,0xA0
	ret	GE
	dec	1,WA
	or	W,0x18
	push	WA
	push	DE
	push	BC
	ld	A,(XHL+)
	ld	QC,A
	ld	W,0
	sll	3,WA
	add	WA,BC
	jrl	MI,0x206A78
	ld	A,(XHL+)
	ld	QB,A
	ld	W,0
	sll	3,WA
	add	WA,DE
	jr	MI,0x206A78
	ld	BC,0
	ld	XDE,0
	cpw	(0x5A82),0x5B86
	jr	NC,0x206A78
	ld	WA,(XHL)
	and	WA,0x1FF
	jr	Z,0x206A66
	ld	A,B
	ld	W,0
	sll	3,WA
	add	WA,(XSP+2)
	cp	WA,0xFFF8
	jr	LE,0x206A66
	cp	WA,0xA0
	jr	GE,0x206A78
	ld	QW,A
	ld	A,C
	ld	W,0
	sll	3,WA
	add	WA,(XSP)
	cp	WA,0xFFF8
	jr	LE,0x206A66
	cp	WA,0xA8
	jr	GE,0x206A66
	ld	QA,A
	ld	WA,(XHL)
	and	W,0xE1
	add	WA,(XSP+4)
	ld	DE,(0x5A82)
	ld	(XDE+),XWA
	ld	(0x5A82),DE
	ld	WA,(XHL)
	srl	1,W
	and	W,0xF
	ld	DE,(0x5A84)
	ld	(XDE+),W
	ld	(0x5A84),DE
	inc	2,XHL
	inc	1,C
	cp	C,QC
	jr	C,0x2069FF
	ld	C,0
	inc	1,B
	cp	B,QB
	jr	C,0x2069FF
	inc	6,XSP
	ret

c_206B37	section	code abs=0x206B37

; WA = tile base, BC = column, DE = row (>=0x20: SCR2)
DrawTilemap:
	dec	1,WA
	push	WA
	push	DE
	push	BC
	cp	DE,0x20
	ld	XDE,0x9000
	jr	C,DrawTilemapAt
	subw	(XSP+2),0x20
	ld	DE,0x9800
	jr	DrawTilemapAt

c_206B51	section	code abs=0x206B51

DrawTilemapScr1:
	dec	1,WA
	push	WA
	push	DE
	push	BC
	ld	XDE,0x9000
	jr	DrawTilemapAt

c_206B5D	section	code abs=0x206B5D

DrawTilemapScr2:
	dec	1,WA
	push	WA
	push	DE
	push	BC
	ld	XDE,0x9800
	jr	DrawTilemapAt

c_206B69	section	code abs=0x206B69

DrawTilemapAt:
	cpw	(XSP+2),0x20
	jrl	GE,0x206BFC
	cpw	(XSP),0x20
	jrl	GE,0x206BFC
	ld	A,(XHL+)
	ld	QC,A
	ld	W,0
	add	WA,(XSP)
	jr	MI,0x206BFC
	bit	7,(XSP+5)
	jr	Z,0x206B8B
	ld	(XSP),WA
	ld	A,(XHL+)
	ld	QB,A
	ld	W,0
	add	WA,(XSP+2)
	jr	MI,0x206BFC
	bit	6,(XSP+5)
	jr	Z,0x206B9F
	ld	(XSP),WA
	ld	BC,0
	ld	A,B
	ld	W,0
	bit	6,(XSP+5)
	jr	Z,0x206BAC
	neg	WA
	add	WA,(XSP+2)
	jr	MI,0x206BEA
	cp	WA,0x20
	jr	NC,0x206BFC
	ld	QA,A
	ld	A,C
	ld	W,0
	bit	7,(XSP+5)
	jr	Z,0x206BC5
	neg	WA
	add	WA,(XSP)
	jr	MI,0x206BEA
	cp	WA,0x20
	jr	NC,0x206BEA
	ld	QW,0
	sll	11,WA
	sll	6,XWA
	ld	WA,(XHL)
	and	WA,0x1FF
	ld	WA,(XHL)
	jr	Z,0x206BE5
	add	WA,(XSP+4)
	ld	(XDE+QWA),WA
	inc	2,XHL
	inc	1,C
	cp	C,QC
	jr	C,0x206BA1
	ld	C,0
	inc	1,B
	cp	B,QB
	jr	C,0x206BA1
	inc	6,XSP
	ret

c_206D30	section	code abs=0x206D30

sub_206D30:
	cpl	B
	cpl	D
	or	B,B
	jr	Z,sub_206D30.skip3
	or	D,D
	jr	Z,sub_206D30.skip3
	ld	WA,0xA0
	cp	B,0xFF
	jr	Z,sub_206D30.skip
	ld	L,C
	mul	HL,B
	div	HL,0xFF
	ld	W,C
	sub	W,L
	ld	L,0xA0
	sub	L,C
	mul	HL,B
	div	HL,0xFF
	ld	A,L
	add	A,C
	sub	A,W
sub_206D30.skip:
	ld	(WBA_H),W
	ld	(WSI_H),A
	ld	WA,0x98
	cp	D,0xFF
	jr	Z,sub_206D30.skip2
	ld	L,E
	mul	HL,D
	div	HL,0xFF
	ld	W,E
	sub	W,L
	ld	L,0x98
	sub	L,E
	mul	HL,D
	div	HL,0xFF
	ld	A,L
	add	A,E
	sub	A,W
sub_206D30.skip2:
	ld	(WBA_V),W
	ld	(WSI_V),A
	ret
sub_206D30.skip3:
	ldw	(WBA_H),0xFF00
	ldw	(WSI_H),0
	ret

c_206D9E	section	code abs=0x206D9E

; A = first slot, C = count, XHL = data (4 colours each)
LoadPalettes:
	cp	A,0x30
	ret	NC
	ld	W,A
	add	W,C
	cp	W,0x40
	jr	LE,LoadPalettes.skip
	ld	C,0x40
	sub	C,A
LoadPalettes.skip:
	ld	XDE,0
	ld	E,A
	sll	3,DE
	add	DE,0x5876
	ld	B,0
	sll	2,BC
	ldirw	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(0x585C),A
	ret

c_206DCD	section	code abs=0x206DCD

; A = first entry, C = count, XHL = data (4 bytes each)
LoadMonoPalettes:
	cp	A,6
	ret	NC
	ld	W,A
	add	W,C
	cp	W,6
	jr	LE,LoadMonoPalettes.skip
	ld	C,6
	sub	C,A
LoadMonoPalettes.skip:
	ld	XDE,0
	ld	E,A
	sll	2,DE
	add	DE,0x585D
	ld	B,0
	sll	2,BC
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(0x585C),A
	ret
	db	0x00,0x02,0x04,0x06,0x00,0x00,0x03,0x07,0x00,0x02,0x04,0x06,0x00,0x00,0x03,0x07
	db	0x00,0x02,0x04,0x06,0x00,0x00,0x03,0x07

c_206E12	section	code abs=0x206E12

sub_206E12:
	ld	WA,0
	ld	(0x5BC7),WA
	ld	(0x5BC9),WA
	ld	(0x5BCB),WA
	ld	(0x5BCD),WA
	ret

c_206E25	section	code abs=0x206E25

sub_206E25:
	ld	WA,(0x5BCD)
	or	WA,WA
	jr	PL,sub_206E25.skip
	neg	WA
sub_206E25.skip:
	cp	WA,0x10
	jp	NC,loc_206FC1
	ld	WA,(0x5BCB)
	or	WA,WA
	jr	PL,sub_206E25.skip2
	neg	WA
sub_206E25.skip2:
	cp	WA,0x10
	jp	NC,loc_206FC1
	ld	DE,(0x5BCD)
	or	DE,DE
	jr	Z,sub_206E25.skip4
	ld	WA,(0x5BC9)
	add	DE,WA
	ld	(0x5BC9),DE
	ld	(0x584D),E
	sra	4,DE
	sra	4,WA
	cp	DE,WA
	jr	Z,sub_206E25.skip4
	jr	C,sub_206E25.skip3
	add	DE,0xC
sub_206E25.skip3:
	ld	BC,(0x5BC7)
	sra	4,BC
	dec	2,BC
	dec	2,DE
	call	sub_206F8D
sub_206E25.skip4:
	ld	BC,(0x5BCB)
	or	BC,BC
	jr	Z,sub_206E25.done
	ld	WA,(0x5BC7)
	add	BC,WA
	ld	(0x5BC7),BC
	ld	(0x584B),C
	sra	4,BC
	sra	4,WA
	cp	BC,WA
	jr	Z,sub_206E25.done
	jr	C,sub_206E25.skip5
	add	BC,0xD
sub_206E25.skip5:
	ld	DE,(0x5BC9)
	sra	4,DE
	dec	2,BC
	dec	2,DE
	call	sub_206F9E
sub_206E25.done:
	ret

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

c_207206	section	code abs=0x207206

; format 02: w, h, LZSS tiles
LoadMonsterImage:
	cpb	(XHL+),2
	ret	NZ
	ld	BC,(XHL+)
	push	BC
	mul	BC,B
	srl	6,BC
	sll	4,BC
	calr	DecompressTiles
	pop	B
	pop	D
	srl	3,B
	srl	3,D
	ret

c_207226	section	code abs=0x207226

; XHL = u16 count + LZSS stream, WA = first tile
LoadCompressedTiles:
	ld	BC,(XHL+)
	push	BC
	sll	4,BC
	calr	DecompressTiles
	pop	BC
	ret

c_207232	section	code abs=0x207232

; LZSS (1 KiB ring at 0x4000) straight into CHAR RAM
DecompressTiles:
	push	XIX
	push	XIY
	push	XIZ
	ld	XIZ,XHL
	ld	XHL,0
	ld	HL,WA
	sll	4,HL
	add	HL,0xA000
	ld	XDE,wTextBuffer
	ld	XWA,0
	ld	(XDE+),XWA
	cp	DE,0x43EE
	jr	C,0x207249
	ld	IY,BC
	ld	IX,0
	ld	QIX,0x3EE
	srl	1,IX
	bit	0,IXH
	jr	NZ,0x20726E
	ld	A,(XIZ+)
	ld	IXL,A
	ld	IXH,0xFF
	bit	0,IXL
	jr	Z,dyn_207293
	ld	A,(XIZ+)
	ld	XDE,wTextBuffer
	ld	(XDE+QIX),A
	ld	(XHL+),A
	minc1	0x400,QIX
	dec	1,IY
	or	IY,IY
	jr	NZ,0x20725B
	pop	XIZ
	pop	XIY
	pop	XIX
	ret

c_207293	section	code abs=0x207293

dyn_207293:
	ld	WA,(XIZ+)
	ld	QIY,WA
	srl	4,QIYH
	and	W,0xF
	inc	3,W
	ld	QW,W
	ld	XDE,wTextBuffer
	ld	A,(XDE+QIY)
	minc1	0x400,QIY
	ld	(XDE+QIX),A
	ld	(XHL+),A
	minc1	0x400,QIX
	dec	1,IY
	or	IY,IY
	jr	Z,0x20728F
	djnz	QW,0x2072A5
	jr	0x20725B

c_2072CD	section	code abs=0x2072CD

; [code] text box tiles 0x2C8569, Pal_21F010/MonoPal_21F018, all 8 wTextBoxes reset (speed = wOptionMessageSpeed)
InitTextBoxes:
	ld	WA,1
	ld	XHL,RawTiles_2C8569
	call	LoadRawTiles
	ld	A,1
	ld	C,1
	ld	XHL,MonoPal_21F018
	call	LoadMonoPalettes
	ld	A,3
	ld	C,1
	ld	XHL,MonoPal_21F018
	call	LoadMonoPalettes
	ld	A,5
	ld	C,1
	ld	XHL,MonoPal_21F018
	call	LoadMonoPalettes
	ld	A,0xF
	ld	C,1
	ld	XHL,Pal_21F010
	call	LoadPalettes
	ld	A,0x1F
	ld	C,1
	ld	XHL,Pal_21F010
	call	LoadPalettes
	ld	A,0x2F
	ld	C,1
	ld	XHL,Pal_21F010
	call	LoadPalettes
	ld	A,8
	ld	XHL,wTextBoxes
	ld	XDE,0
InitTextBoxes.loop:
	ldw	(XHL+0),0x200
	ldb	(XHL+2),0x20
	ldb	(XHL+3),0x20
	ld	(XHL+4),E
	ld	(XHL+5),E
	ld	(XHL+6),E
	ld	(XHL+7),E
	ld	(XHL+8),XDE
	ld	(XHL+0xC),XDE
	ldb	(XHL+0x10),(wOptionMessageSpeed)
	ld	(XHL+0x11),E
	ld	(XHL+0x12),E
	add	HL,0x13
	djnz	A,InitTextBoxes.loop
	ret

c_2076DE	section	code abs=0x2076DE

swp_2076DE:
	ret

c_2076DF	section	code abs=0x2076DF

swp_2076DF:
	ld	XHL,wPlayerName
	call	DrawString
	ret

c_2076E9	section	code abs=0x2076E9

swp_2076E9:
	ld	XHL,wPartnerName
	call	DrawString
	ret

c_2076F3	section	code abs=0x2076F3

; [code] A = box, XHL = 0xFF-terminated string: DrawTextChar per byte
DrawBoxString:
	call	GetTextBox

c_2076F7	section	code abs=0x2076F7

; [code] DrawBoxString with XWA = the box already
DrawString:
	ld	XBC,XHL
DrawString.loop:
	ld	XHL,0
	ld	L,(XBC+)
	cp	L,0xFF
	ret	Z
	push	XBC
	call	DrawTextChar
	pop	XBC
	jr	DrawString.loop

c_20770B	section	code abs=0x20770B

swp_20770B:
	call	GetTextBox
	ld	XDE,0
	ld	DE,(XWA+0)
	sll	4,DE
	add	DE,0xA000
	ret

c_20771C	section	code abs=0x20771C

swp_20771C:
	call	GetTextBox

c_207720	section	code abs=0x207720

sub_207720:
	bit	7,(XWA+0x12)
	jr	NZ,sub_207720.skip
	ld	XDE,0
	ld	E,(XWA+4)
	dec	2,E
	mul	DE,(XWA+7)
	add	E,(XWA+6)
	adc	D,0
	add	DE,(XWA+0)
	sll	4,DE
	add	DE,0xA000
	ret
sub_207720.skip:
	ld	XDE,0
	ld	E,(XWA+4)
	mul	DE,(XWA+7)
	add	E,(XWA+6)
	adc	D,0
	add	DE,(XWA+0)
	sll	4,DE
	add	DE,0xA000
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
	ld	XIX,0x220C3C
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
	ld	XIX,0x220D7C
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
	ld	XIX,0x220EBC
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
	ld	XIX,0x220F84
	ld	XIY,PartOffsetsBack
	calr	DrawRobotPart
	pop	XIY
	pop	XIX
	ret

c_207E77	section	code abs=0x207E77

; [code] SetRobotDrawParts(wEquipCore), DrawRobot, colours from GetAffinityPalette(wUnitAffinity)
DrawEquippedRobot:
	push	DE
	push	BC
	push	WA
	call	swp_208475
	ld	HL,(XSP)
	call	DrawRobot
	pop	WA
	pop	BC
	ld	DE,(XSP)
	call	swp_206C7B
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

swp_208475:
	ld	XHL,wEquipCore
	call	SetRobotDrawParts
	ret

c_20DDBC	section	code abs=0x20DDBC

; [code] header "Load"/"Save"/"Clear" by 0x5DF5 (0x20DF5B..), then slots 1-3: empty text 0x20DF6E if dyn_20DB57 NZ, else name (+0), partner name (+0x1C), levels (+0xF, +0x2B), emblem flags 0x10-0x13, GetRankTitle (+0x32) (rank_titles.txt header); [play] works_data_save_load_menu
DrawSaveSlotList:
	pushw	(XIZ+TASK_ARG)
	ld	A,(XIZ+0x10)
	ld	C,0xA
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	call	OpenTextBox
	cpb	(wSaveMenuMode),1
	ld	XHL,swp_20DF5B
	jr	C,DrawSaveSlotList.skip
	ld	XHL,0x20DF61
	jr	Z,DrawSaveSlotList.skip
	ld	XHL,0x20DF67
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
	call	dyn_20DB57
	jr	Z,DrawSaveSlotList.skip2
	ld	A,(XIZ+0x10)
	ld	XHL,0x20DF6E
	call	DrawBoxString
	jrl	DrawSaveSlotList.skip7
DrawSaveSlotList.skip2:
	ld	A,(XSP)
	call	dyn_20DAB9
	add	XHL,0x10
	push	XHL
	ld	A,(XIZ+0x10)
	ld	C,8
	ld	E,0
	call	sub_20768A
	call	sub_207720
	ld	XHL,(XSP)
	ld	C,(XHL+0xF:16)
	ld	B,0
	call	sub_207CF0
	ld	C,8
	ld	E,0
	call	sub_20768E
	ld	L,(0x20DF7B)
	call	DrawTextChar
	ld	C,8
	ld	E,1
	call	sub_20768E
	call	sub_207720
	ld	XHL,(XSP)
	ld	C,(XHL+0x2B:16)
	ld	B,0
	call	sub_207CF0
	ld	C,8
	ld	E,1
	call	sub_20768E
	ld	L,(0x20DF7B)
	call	DrawTextChar
	ld	C,1
	ld	E,0
	call	sub_20768E
	ld	XHL,(XSP)
	add	XHL,0
	call	DrawString
	ld	C,1
	ld	E,1
	call	sub_20768E
	ld	XHL,(XSP)
	add	XHL,0x1C
	call	DrawString
	ld	XDE,(XSP)
	add	XDE,0x4D
	ld	L,0x10
	call	swp_206179
	jr	Z,DrawSaveSlotList.skip3
	push	XDE
	ld	C,0xC
	ld	E,0
	call	sub_20768E
	ld	L,(0x20DF7C)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip3:
	ld	L,0x11
	call	swp_206179
	jr	Z,DrawSaveSlotList.skip4
	push	XDE
	ld	C,0xD
	ld	E,0
	call	sub_20768E
	ld	L,(0x20DF7D)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip4:
	ld	L,0x12
	call	swp_206179
	jr	Z,DrawSaveSlotList.skip5
	push	XDE
	ld	C,0xE
	ld	E,0
	call	sub_20768E
	ld	L,(0x20DF7E)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip5:
	ld	L,0x13
	call	swp_206179
	jr	Z,DrawSaveSlotList.skip6
	push	XDE
	ld	C,0xF
	ld	E,0
	call	sub_20768E
	ld	L,(0x20DF7F)
	call	DrawTextChar
	pop	XDE
DrawSaveSlotList.skip6:
	ld	C,9
	ld	E,2
	call	sub_20768E
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

c_20F877	section	code abs=0x20F877

; [code+play] child task: draws the 6 entered chars and the blinking cursor
DrawEnteredNameTask:
	ld	A,0
	call	GetTextBox
	ld	C,0xB
	ld	E,1
	call	sub_20768E
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
	jr	Z,0x20F8D9
	ld	A,0
	call	GetTextBox
	ld	C,(XIY+0x18)
	cp	C,6
	jr	GE,0x20F8D9
	add	C,0xB
	ld	E,1
	call	sub_20768E
	ld	L,(NameEntryCursorChar)
	call	DrawTextChar
	ret

c_21037F	section	code abs=0x21037F

swp_21037F:
	ret

c_210380	section	code abs=0x210380

DrawPortraitAt:
	push	WA
	push	HL
	cp	HL,0xA
	jr	LE,0x21039C
	cp	HL,0x15
	jr	GE,dyn_210390
	jr	0x2103B4

c_210390	section	code abs=0x210390

dyn_210390:
	cp	HL,0x22
	jr	LE,dyn_210398
	jr	0x2103B4

c_210398	section	code abs=0x210398

dyn_210398:
	sub	HL,0xA
	extz	XHL
	sll	1,XHL
	add	XHL,PortraitOffsets
	ld	A,(XHL)
	extz	WA
	add	BC,WA
	ld	A,(XHL+1)
	extz	WA
	add	DE,WA
	pop	HL
	pop	WA
	calr	DrawPortrait
	ret

c_2103BA	section	code abs=0x2103BA

; HL = portrait number; record table PortraitTable (data/graphics/portraits.asm)
DrawPortrait:
	push	WA
	push	BC
	push	DE
	ld	WA,HL
	sll	2,WA
	ld	XHL,PortraitTable
	ld	XHL,(XHL+WA)
	ld	C,0xA
	ld	A,0x10
	cpw	(XSP),0x20
	jr	LT,0x2103D8
	ld	A,0x20
	push	XHL
	ld	XHL,(XHL)
	call	LoadPalettes
	call	FadePalettes
	pop	XHL
	ld	C,2
	ld	A,2
	cpw	(XSP),0x20
	jr	LT,0x2103F0
	ld	A,4
	push	XHL
	ld	XHL,(XHL+0xC)
	call	LoadMonoPalettes
	call	sub_2066DE
	pop	XHL
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,dyn_210423
	ld	WA,(XSP+4)
	push	XHL
	ld	XHL,(XHL+0x10)
	call	LoadCompressedTiles
	pop	XHL
	ld	XHL,(XHL+0x14)
	ld	DE,(XSP)
	ld	BC,(XSP+2)
	ld	WA,(XSP+4)
	call	DrawTilemap
	jr	0x21043E

c_2115AC	section	code abs=0x2115AC

; [code] sub_21156E (FF = no boss on this floor) / boss index sub_212C92: beaten -> 0x228641[i] record at 0x228539 + palette 0x2275D9 + 8*(rec+8); alive -> 0x227813 + 0x42*(3i + frame) ((+0x2D>>3)&3) + palette 0x2275D9 + 8i; index 8 (mine floor 5) -> 9 records from 0x227E43; LoadRawTiles to tile 0x182 / 0x19B, LoadPalettes A=0x19 (BLOBS_PLAN 2275D9 row)
LoadBossMapSprite:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_21156E
	cp	A,0xFF
	jrl	Z,LoadBossMapSprite.skip6
	cp	A,0
	jr	Z,LoadBossMapSprite.skip
	call	sub_212C92
	cp	A,8
	jrl	Z,LoadBossMapSprite.skip6
	extz	WA
	extz	XWA
	ld	XHL,BossBeatenSprites
	add	XHL,XWA
	ld	A,(XHL)
	extz	WA
	extz	XWA
	mul	XWA,0x42
	ld	XDE,MapSpriteBeaten0
	add	XDE,XWA
	ld	A,(XHL)
	add	A,8
	extz	WA
	extz	XWA
	sll	3,XWA
	ld	XHL,BossMapSpritePalettes
	add	XHL,XWA
	ld	WA,0x182
	jrl	LoadBossMapSprite.skip5
LoadBossMapSprite.skip:
	call	sub_212C92
	cp	A,8
	jr	NZ,LoadBossMapSprite.skip3
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	3,A
	and	A,3
	cp	A,3
	jr	NZ,LoadBossMapSprite.skip2
	ld	A,1
LoadBossMapSprite.skip2:
	mul	XWA,9
	mul	XWA,0x42
	ld	XDE,MapSpriteUniti0_0
	add	XDE,XWA
	ld	XHL,0
	ld	WA,0x19B
	ld	XHL,XDE
	ld	C,9
LoadBossMapSprite.loop:
	push	XHL
	push	WA
	push	C
	call	LoadRawTiles
	pop	C
	pop	WA
	pop	XHL
	add	XHL,0x42
	add	WA,4
	djnz	C,LoadBossMapSprite.loop
	jr	LoadBossMapSprite.skip6
LoadBossMapSprite.skip3:
	extz	WA
	extz	XWA
	push	XWA
	mul	XWA,3
	ld	XDE,XWA
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	3,A
	and	A,3
	cp	A,3
	jr	NZ,LoadBossMapSprite.skip4
	ld	A,1
LoadBossMapSprite.skip4:
	add	XDE,XWA
	mul	XDE,0x42
	ld	XWA,MapSpriteEnt0
	add	XDE,XWA
	pop	XWA
	sll	3,XWA
	ld	XHL,BossMapSpritePalettes
	add	XHL,XWA
	ld	WA,0x182
LoadBossMapSprite.skip5:
	push	XHL
	ld	XHL,XDE
	call	LoadRawTiles
	pop	XHL
	cp	XHL,0
	jr	Z,LoadBossMapSprite.skip6
	ld	A,0x19
	ld	C,1
	call	LoadPalettes
	ld	XHL,0x227641
	ld	A,2
	ld	C,1
LoadBossMapSprite.skip6:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211B13	section	code abs=0x211B13

swp_211B13:
	push	XWA
	xor	XWA,XWA
	ld	A,(XIZ+0x11)
	dec	1,A
	ld	XHL,XIZ
	add	XHL,0x17
	add	XHL,XWA
	xor	XWA,XWA
	ld	A,(XHL)
	mul	WA,DUNGEON_MAP_SIZE
	ld	XHL,DungeonMaps
	add	XHL,XWA
	pop	XWA
	ret

c_211B35	section	code abs=0x211B35

; [code] DungeonPalettes/MonoPalettes, DungeonData metatiles/tiles/attrs, wMapPtr from DungeonMaps, chests
LoadDungeonFloor:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x10)
	sub	A,1
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DungeonPalettes
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	C,0xF
	ld	A,0x10
	call	LoadPalettes
	ld	A,(XIZ+0x10)
	sub	A,1
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DungeonMonoPalettes
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	C,1
	ld	A,2
	call	LoadMonoPalettes
	ld	XHL,DungeonData
	ld	XWA,(XHL)
	ld	(0x5BD5),XWA
	add	XHL,4
	ld	XWA,(XHL)
	ld	XDE,XWA
	add	XHL,4
	ld	XWA,(XHL)
	ld	(wMetatileAttrPtr),XWA
	add	XHL,4
	ld	XHL,XDE
	ld	WA,0x37
	ld	(0x5BCF),WA
	call	LoadCompressedTiles
	calr	swp_211B13
	ld	XWA,(XHL)
	ld	(wMapPtr),XWA
	add	XHL,4
	calr	sub_2118F4
	call	LoadBossMapSprite
	ld	WA,0
	ld	(0x5BCB),WA
	ld	(0x5BCD),WA
	call	loc_206FC1
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211C7F	section	code abs=0x211C7F

; [play] every dungeon screen; palettes by race
LoadDungeonPalettes:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,PlayerDungeonSprites
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	mul	WA,0x78
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+0x15)
	cp	A,0
	jr	NZ,LoadDungeonPalettes.skip
	ld	A,1
	jr	LoadDungeonPalettes.skip2
LoadDungeonPalettes.skip:
	cp	A,1
	jr	NZ,LoadDungeonPalettes.skip2
	ld	A,0
LoadDungeonPalettes.skip2:
	mul	WA,0x1E
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	3,A
	and	A,3
	cp	A,3
	jr	NZ,LoadDungeonPalettes.skip3
	ld	A,1
LoadDungeonPalettes.skip3:
	mul	WA,0xA
	add	XHL,XWA
	ld	XDE,XHL
	ld	XHL,PlayerDungeonTiles
	ld	WA,0xC
	call	swp_206941
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	sll	3,A
	ld	XHL,Pal_26FDD7
	add	XHL,XWA
	ld	A,0
	ld	C,1
	call	LoadPalettes
	ld	XHL,MonoPal_26FE07
	ld	A,0
	ld	C,1
	call	LoadMonoPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211D03	section	code abs=0x211D03

; [code] sprite maps 0x26FE0B + race*0x78 + frame*0x1E, tiles from 0x270063, Pal_26FDD7 per race
LoadPlayerDungeonSprite:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,PlayerDungeonSprites
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	mul	WA,0x78
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	4,A
	and	A,3
	cp	A,1
	jr	NZ,LoadPlayerDungeonSprite.skip
	ld	A,2
	jr	LoadPlayerDungeonSprite.skip2
LoadPlayerDungeonSprite.skip:
	cp	A,2
	jr	NZ,LoadPlayerDungeonSprite.skip2
	ld	A,1
LoadPlayerDungeonSprite.skip2:
	mul	WA,0x1E
	add	XHL,XWA
	ld	XWA,1
	cp	A,3
	mul	WA,0xA
	add	XHL,XWA
	ld	XDE,XHL
	ld	XHL,PlayerDungeonTiles
	ld	WA,0xC
	call	swp_206941
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	sll	3,A
	ld	XHL,Pal_26FDD7
	add	XHL,XWA
	ld	A,0
	ld	C,1
	call	LoadPalettes
	ld	XHL,MonoPal_26FE07
	ld	A,0
	ld	C,1
	call	LoadMonoPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211DBD	section	code abs=0x211DBD

; [code] 1x2 sprite of tile 0x3E04 at BC/DE, skipped while bit 4 of +0x2D is set (blink)
DrawMenuCursor:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2D)
	srl	5,A
	jr	C,0x211DD9
	ld	QB,1
	ld	QD,2
	ld	WA,4
	or	WA,0x3E00
	call	sub_206BFF
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211E34	section	code abs=0x211E34

; [code] Camp: Item / Stats / Leave / Close
DrawCampMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	ClearTextBox
	ld	A,3
	ld	XHL,CampText
	call	DrawBoxString
	ld	A,3
	ld	XHL,ItemText
	call	DrawBoxString
	ld	A,3
	ld	XHL,StatsText
	call	DrawBoxString
	ld	A,3
	ld	XHL,LeaveText
	call	DrawBoxString
	ld	A,3
	ld	XHL,CloseText
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F6C	section	code abs=0x211F6C

; [code+play] Status: Normal / Rusted (camp item list)
DrawStatusLabel:
	ld	A,2
	call	ClearTextBox
	ld	XHL,HPText4
	ld	A,2
	call	DrawBoxString
	ld	WA,(wUnitHP)
	cp	WA,0x3E7
	jr	C,DrawStatusLabel.skip
	ld	WA,0x3E7
DrawStatusLabel.skip:
	extz	XWA
	call	sub_2061EC
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	sub_216851
	ld	XHL,SlashText2
	ld	A,2
	call	DrawBoxString
	ld	WA,(wUnitMaxHP)
	cp	WA,0x3E7
	jr	C,DrawStatusLabel.skip2
	ld	WA,0x3E7
DrawStatusLabel.skip2:
	extz	XWA
	call	sub_2061EC
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	sub_216851
	ld	XHL,StatusText
	ld	A,2
	call	DrawBoxString
	ld	A,(wStatusRust)
	cp	A,0
	jr	NZ,DrawStatusLabel.skip3
	ld	XHL,NormalText
	jr	DrawStatusLabel.skip4
DrawStatusLabel.skip3:
	ld	XHL,RustedText2
DrawStatusLabel.skip4:
	ld	A,2
	call	DrawBoxString
	ret

c_211FE8	section	code abs=0x211FE8

; [code] box 4: items 0x26-0x2B (items.txt 38-43: FixIt1-4, FullFx, Clear), each GetItemName + count digit string 0x2497B5 + count*2, or the dash line 0x2497A8 when 0x2061D6 sets carry (none held); callers sub_211F4A, CampItemUseMenu; [play] camp_item_use_list_fixit1_x4
DrawCampItemList:
	ld	A,4
	call	ClearTextBox
	ld	A,4
	ld	XHL,ItemText3
	call	DrawBoxString
	ld	WA,0x26
	ld	C,6
DrawCampItemList.loop:
	push	WA
	push	C
	call	0x2061D6
	jr	NC,DrawCampItemList.skip
	ld	XHL,DashText
	ld	A,4
	call	DrawBoxString
	jr	DrawCampItemList.skip2
DrawCampItemList.skip:
	pop	C
	pop	WA
	push	WA
	push	C
	ld	L,A
	call	GetItemName
	ld	A,4
	call	DrawBoxString
	pop	C
	push	C
	ld	E,6
	sub	E,C
	ld	C,8
	add	E,1
	ld	A,4
	call	sub_20768A
	ld	XHL,TimesText
	ld	A,4
	call	DrawBoxString
	pop	C
	pop	WA
	push	WA
	push	C
	call	0x2061D6
	extz	WA
	extz	XWA
	mul	XWA,2
	ld	XHL,ItemCountDigitTexts
	add	XHL,XWA
	ld	A,4
	call	DrawBoxString
DrawCampItemList.skip2:
	pop	C
	pop	WA
	inc	1,WA
	djnz	C,DrawCampItemList.loop
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
	call	sub_20768A
	ld	A,2
	ld	XHL,PlayerText3
	call	DrawBoxString
	ld	A,2
	ld	C,7
	ld	E,0
	call	sub_20768A
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
	call	sub_2061EC
	ld	XHL,XWA
	ld	A,2
	ld	C,2
	call	sub_216851
	ld	A,2
	ld	C,0
	ld	E,1
	call	sub_20768A
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
	call	sub_2061EC
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	sub_216851
	ld	A,2
	ld	C,6
	ld	E,1
	call	sub_20768A
	ld	A,2
	ld	XHL,SlashText
	call	DrawBoxString
	ld	WA,(wUnitMaxHP)
	cp	WA,0x3E7
	jr	C,DrawDungeonStatus.skip5
	ld	WA,0x3E7
DrawDungeonStatus.skip5:
	extz	XWA
	call	sub_2061EC
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	sub_216851
	ld	A,2
	ld	C,0
	ld	E,2
	call	sub_20768A
	ld	A,2
	ld	XHL,GText
	call	DrawBoxString
	ld	XHL,(wGP)
	ld	C,6
	ld	A,2
	call	sub_216851
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213249	section	code abs=0x213249

; [play] arena participant screens: portraits
DrawArenaParticipants:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	sub_21323D
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
	call	dyn_216849
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
	call	dyn_216849
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
	call	dyn_21676A
	call	dyn_2167B1
	ld	BC,0
	ld	DE,0
	call	dyn_216845
	call	DrawPortrait
DrawArenaParticipants.skip4:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2132D2	section	code abs=0x2132D2

; [code] arena_scenes.txt cast of scene task +0x12 -> DrawArenaParticipants, only when it differs from task +0x13
DrawArenaSceneCast:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x12)
	extz	WA
	extz	XWA
	ld	XHL,ArenaSceneCast
	add	XHL,XWA
	ld	A,(XHL)
	ld	W,(XIZ+0x13)
	cp	A,W
	jr	Z,DrawArenaSceneCast.skip
	ld	(XIZ+0x13),A
	ld	L,A
	exts	HL
	calr	DrawArenaParticipants
DrawArenaSceneCast.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2140D5	section	code abs=0x2140D5

; [code] A = bracket slot: clears SCR1 map (swp_216D35 at 0x9000), A = participant id at task+0x18+slot, parts pointer 0x60CC + 6*slot for random pilots 0x62-0x70 (else 0), LoadEnemy, LoadEnemyImage; callers sub_213B7F / sub_214122; [play] arena_rank*_participants_* screens
LoadArenaOpponent:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9000
	call	swp_216D35
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
	ld	XHL,0x60CC
	mul	XDE,6
	add	XHL,XDE
	jr	LoadArenaOpponent.skip2
LoadArenaOpponent.skip:
	ld	HL,0
LoadArenaOpponent.skip2:
	call	LoadEnemy
	call	dyn_216845
	ld	BC,0
	ld	DE,0
	call	LoadEnemyImage
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214D10	section	code abs=0x214D10

; [code] exit case of the town place task dyn_214C97 (TASK_ARG 0xC or out of range): TASK_ARG = 1, 0x60F0 = task +0x11, EndTask
TownPlaceTaskEnd:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,(XIZ+0x11)
	ld	(0x60F0),A
	call	EndTask
	jr	dyn_214D22

c_214D22	section	code abs=0x214D22

dyn_214D22:
	ret

c_214D23	section	code abs=0x214D23

; [code] place task +0x15: PlacePortraits picture (DrawPortrait) and its name from the pointers at 0x249EAB (DrawBoxString)
DrawTownPlace:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x15)
	extz	WA
	extz	XWA
	push	XWA
	call	dyn_206803
	pop	XWA
	push	XWA
	ld	XHL,PlacePortraits
	add	XHL,XWA
	ld	L,(XHL)
	extz	HL
	call	dyn_216845
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	pop	XWA
	sll	2,XWA
	ld	XHL,PlaceNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,3
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214F3D	section	code abs=0x214F3D

; [code] copies the talk rows listed for the place (task +0x15) and GetStoryStage (talk_slots_*.txt) to task +0x1E.., count to +0x1A
LoadTalkSlots:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,XIZ
	add	XHL,0x1E
	ld	XDE,XHL
	ld	A,0xFF
	ld	C,4
LoadTalkSlots.loop:
	ld	(XHL),A
	inc	1,XHL
	djnz	C,LoadTalkSlots.loop
	ld	A,0
	ld	(XIZ+0x1A),A
	ld	A,(XIZ+0x15)
	sub	A,1
	extz	WA
	extz	XWA
	ld	XHL,TalkSlotCounts
	add	XHL,XWA
	ld	C,(XHL)
	extz	BC
	sll	2,XWA
	ld	XHL,TalkSlotLists
	add	XHL,XWA
	ld	XHL,(XHL)
	call	GetStoryStage
	extz	WA
	extz	XWA
	mul	XWA,BC
	add	XHL,XWA
	ld	A,0
LoadTalkSlots.loop2:
	ld	W,(XHL)
	cp	W,0xFF
	jr	Z,LoadTalkSlots.skip
	ld	(XDE),W
	inc	1,XHL
	inc	1,XDE
	inc	1,A
	djnz	C,LoadTalkSlots.loop2
LoadTalkSlots.skip:
	ld	(XIZ+0x1A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215BCD	section	code abs=0x215BCD

; [code] newline, then GetItemOrPartDesc (sub_216BC9) of CyriusTradeMenu[(wPlayerRace - 1) / 2][cursor +0x10] in box 1; callers sub_215C14, CyriusTradeMenuInput
DrawCyriusTradeDesc:
	push	XHL
	push	XWA
	ld	XHL,NewlineText2
	ld	A,1
	call	DrawBoxString
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
	call	GetItemOrPartDesc
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XHL
	ret

c_216849	section	code abs=0x216849

dyn_216849:
	ld	WA,0x13C
	ret

c_21684D	section	code abs=0x21684D

swp_21684D:
	ld	WA,0x46
	ret

c_216851	section	code abs=0x216851

sub_216851:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	E,C
	ld	B,A
sub_216851.loop:
	srl	1,XHL
	rr	1,A
	srl	1,XHL
	rr	1,A
	srl	1,XHL
	rr	1,A
	srl	1,XHL
	rr	1,A
	srl	4,A
	push	A
	djnz	C,sub_216851.loop
	ld	W,0xA
	ld	C,E
sub_216851.loop2:
	pop	A
	cp	A,0
	jr	NZ,sub_216851.skip
	cp	C,1
	jr	NZ,sub_216851.skip2
sub_216851.skip:
	ld	W,0
sub_216851.skip2:
	add	A,W
	push	BC
	push	W
	extz	WA
	extz	XWA
	mul	XWA,2
	ld	XHL,BcdDigitTexts
	add	XHL,XWA
	ld	A,B
	call	DrawBoxString
	pop	W
	pop	BC
	djnz	C,sub_216851.loop2
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2168AC	section	code abs=0x2168AC

; [code] ClearTextBox 3, then sub_216851 draws XHL = (wGP) as C = 6 BCD digits (glyph strings 0x24A1FC) in box 3, registers saved; callers CollaBuy, sub_21640A, swp_213903 (arena entry cost)
DrawGPBox3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	ClearTextBox
	ld	XHL,(wGP)
	ld	C,6
	ld	A,3
	call	sub_216851
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2179E0	section	code abs=0x2179E0

loc_2179E0:
	ld	A,1
	jp	loc_2179B5

c_2179E6	section	code abs=0x2179E6

swp_2179E6:
	ld	A,2
	jp	loc_2179B5

c_2179EC	section	code abs=0x2179EC

; [code] menu command 3 (0x6146, waits for 0x613E): handler swp_217A74 clears/places box 2 (col 0xC, row 0x20) and draws the 0x614B entries from 0x614C (swp_217207)
DrawMenuBox:
	ld	A,3
	jp	loc_2179B5

c_2179F2	section	code abs=0x2179F2

; [code] menu command 4 (waits): handler 0x217AC0 = U/D wrap of cursor 0x6139 over 0x614A rows, A -> byte (0x6154)[cursor], B -> 0xFF, stored in 0x613B (callers read 0x613B)
RunMenuInput:
	ld	A,4
	jp	loc_2179B5

c_2179F8	section	code abs=0x2179F8

; [code] menu command 5 (waits): handler swp_217AA4 sets wCursorVisible (swp_2175A8) and the cursor position (swp_217BA9), 0x613D = 1; command 6 (sub_2179FE -> swp_217B56) turns it off
ShowMenuCursor:
	ld	A,5
	jp	loc_2179B5

c_2179FE	section	code abs=0x2179FE

sub_2179FE:
	ld	A,6
	jp	loc_2179B5

c_218939	section	code abs=0x218939

; [code] wGP -> 0x6185, drawn as 6 BCD digits
DrawGP:
	call	sub_218942
	call	sub_21894B
	ret

c_218942	section	code abs=0x218942

sub_218942:
	ld	XWA,(wGP)
	ld	(0x6185),XWA
	ret

c_21894B	section	code abs=0x21894B

sub_21894B:
	ld	XDE,(0x6185)
	ld	BC,0
	ld	WA,0x604
	call	sub_217303
	ret
	db	0x25,0x30,0xFF

c_2193C5	section	code abs=0x2193C5

; [code] clears the panel, draws arm image 0x61C2 (right and left) after TheNewArmIsText
DrawDevelopedArm:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_20677A
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_206781
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	ld	B,(0x6106)
	ld	D,(0x6107)
	ld	QB,0xC
	ld	QD,0xB
	ld	WA,0x7E
	ld	BC,0
	ld	DE,2
	call	swp_206C8F
	ld	HL,0x7E
	ld	B,(wDevelopArmImage)
	ld	C,1
	call	DrawRightArmPart
	ld	HL,0x7E
	ld	B,(wDevelopArmImage)
	ld	C,1
	call	DrawLeftArmPart
	ret

c_2197CC	section	code abs=0x2197CC

; [code] sub_2197DD clears the picture area, portrait 0x35 (place_portraits.txt: 53 = Works) at 0,0 tile 0x7E (sub_2197C1), then A = 0xFF -> the partner's portrait (wWorksPartnerRace, loc_219796) at 0,0x20 tile 0x126 (swp_2197B5 -> sub_2197BA)
DrawWorksPortraits:
	call	sub_2197DD
	ld	A,0x35
	call	sub_2197C1
	ld	A,0xFF
	call	swp_2197B5
	ret

c_2197DD	section	code abs=0x2197DD

sub_2197DD:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_20677A
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_206781
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	ret
