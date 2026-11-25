; engine/gfx/font.asm: the video side of the text boxes: glyph upload into CHAR RAM, text box frames and tile grids into SCR1, CHAR RAM addresses of a box and of its cursor cell

c_207093	section	code abs=0x207093

; [code] L = character, WA = tile: GetFontGlyph, then the glyph's 8 rows into CHAR RAM 0xA000 + 16 * WA with the pixel bits rearranged (not a plain copy like DrawTextChar); callers draw the player and partner names into tiles 0x16C/0x173
LoadGlyphTile:
	call	GetFontGlyph
	ld	XDE,0
	ld	DE,WA
	sll	4,XDE
	add	XDE,CHARACTER_RAM
	ld	B,8
LoadGlyphTile.loop:
	ld	WA,(XHL+)
	ld	C,8
LoadGlyphTile.loop2:
	sll	1,XWA
	bit	0,QA
	zcf
	rl	1,QWA
	sll	1,WA
	djnz	C,LoadGlyphTile.loop2
	ld	WA,QWA
	ld	(XDE+),WA
	djnz	B,LoadGlyphTile.loop
	ret

c_2074C0	section	code abs=0x2074C0

; [code] A = box, C = column, E = row: frame tiles + the box's tile grid into SCR1 (no frame if bit 7)
PlaceTextBox:
	call	GetTextBox

c_2074C4	section	code abs=0x2074C4

; [code] PlaceTextBox with XWA = the box already
PlaceTextBoxXWA:
	bit	7,(XWA+0x12)
	jrl	NZ,PlaceTextBoxNoFrame
	ld	(XWA+2),C
	ld	(XWA+3),E
	ld	XHL,0
	ld	H,E
	srl	2,HL
	ld	B,0
	sll	1,BC
	add	HL,BC
	add	HL,SCROLL1_VRAM
	ld	D,(XWA+5)
	dec	1,D
	ld	E,0
	srl	2,DE
	ldw	(XHL),0x3E01
	ldw	(XHL+DE),0x3E03
	ld	B,(XWA+4)
	dec	2,B
	ld	C,2
	inc	2,DE
PlaceTextBoxXWA.loop:
	ldw	(XHL+C),0x3E07
	ldw	(XHL+DE),0x3E09
	inc	2,C
	inc	2,DE
	djnz	B,PlaceTextBoxXWA.loop
	ldw	(XHL+C),0x3E02
	ldw	(XHL+DE),0x3E06
	ld	E,(XWA+5)
	dec	2,E
	ld	QD,E
	ld	DE,(XWA+0)
	or	DE,0x3E00
PlaceTextBoxXWA.loop2:
	add	HL,0x40
	ldw	(XHL),0x3E08
	ld	B,(XWA+4)
	dec	2,B
	ld	C,2
PlaceTextBoxXWA.loop3:
	ld	(XHL+C),DE
	inc	1,DE
	inc	2,C
	djnz	B,PlaceTextBoxXWA.loop3
	ldw	(XHL+C),0x3E0A
	djnz	QD,PlaceTextBoxXWA.loop2
	ret

c_207559	section	code abs=0x207559

; [code] PlaceTextBoxXWA for a frameless box (+0x12 bit 7): box at column C, row E, only its tile grid (full width +4 x height +5, tiles from +0) into SCR1 0x9000
PlaceTextBoxNoFrame:
	ld	(XWA+2),C
	ld	(XWA+3),E
	ld	XHL,0
	ld	H,E
	srl	2,HL
	ld	B,0
	sll	1,BC
	add	HL,BC
	add	HL,SCROLL1_VRAM
	ld	E,(XWA+5)
	ld	QD,E
	ld	DE,(XWA+0)
	or	DE,0x3E00
PlaceTextBoxNoFrame.loop:
	ld	B,(XWA+4)
	ld	C,0
PlaceTextBoxNoFrame.loop2:
	ld	(XHL+C),DE
	inc	1,DE
	inc	2,C
	djnz	B,PlaceTextBoxNoFrame.loop2
	add	HL,0x40
	djnz	QD,PlaceTextBoxNoFrame.loop
	ret

c_20770B	section	code abs=0x20770B

; [code] A = box -> XDE = CHAR RAM address of the box's first tile (0xA000 + 16 * tile +0); the box 4 slide code and ScrollBox2UpFromBox4 copy pixels with it
GetBoxTilesAddr:
	call	GetTextBox
	ld	XDE,0
	ld	DE,(XWA+0)
	sll	4,DE
	add	DE,CHARACTER_RAM
	ret

c_20771C	section	code abs=0x20771C

; [code] A = box: GetTextBox, then GetTextCursorTile (XDE = CHAR RAM address of the cell under the cursor); no callers
GetBoxCursorTile:
	call	GetTextBox

c_207720	section	code abs=0x207720

; [code] XWA = box -> XDE = CHAR RAM address (0xA000 + 16 * tile) of the cell under the cursor: tile +0 + row +7 * inner width + column +6 (full width +4 for frameless boxes); DrawTextChar writes the glyph there
GetTextCursorTile:
	bit	7,(XWA+0x12)
	jr	NZ,GetTextCursorTile.skip
	ld	XDE,0
	ld	E,(XWA+4)
	dec	2,E
	mul	DE,(XWA+7)
	add	E,(XWA+6)
	adc	D,0
	add	DE,(XWA+0)
	sll	4,DE
	add	DE,CHARACTER_RAM
	ret
GetTextCursorTile.skip:
	ld	XDE,0
	ld	E,(XWA+4)
	mul	DE,(XWA+7)
	add	E,(XWA+6)
	adc	D,0
	add	DE,(XWA+0)
	sll	4,DE
	add	DE,CHARACTER_RAM
	ret
