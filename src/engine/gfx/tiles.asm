; engine/gfx/tiles.asm: CHAR RAM tile loading: raw, mapped and LZSS-compressed tiles, tile fills

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

; [code] XDE = map (u8 w, h + one word per cell), XHL = tile sheet (u16 count skipped), WA = first CHAR RAM tile: copies tile (cell - 1) of the sheet for every cell into consecutive tiles, cell 0 = blank tile; LoadDungeonPalettes uses it for PlayerDungeonTiles
LoadMappedTiles:
	ld	C,(XDE+)
	mul	BC,(XDE+)
	sll	4,WA
	add	WA,0xA000
	ld	QBC,WA
	inc	2,XHL
LoadMappedTiles.loop:
	push	XHL
	ld	WA,(XDE+)
	or	WA,WA
	jr	NZ,LoadMappedTiles.skip
	ld	XWA,0
	ld	XHL,0
	ld	HL,QBC
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	QBC,HL
	jr	LoadMappedTiles.skip2
LoadMappedTiles.skip:
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
LoadMappedTiles.skip2:
	pop	XHL
	djnz	BC,LoadMappedTiles.loop
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
DecompressTiles.loop:
	ld	(XDE+),XWA
	cp	DE,0x43EE
	jr	C,DecompressTiles.loop
	ld	IY,BC
	ld	IX,0
	ld	QIX,0x3EE
DecompressTiles.loop2:
	srl	1,IX
	bit	0,IXH
	jr	NZ,DecompressTiles.skip
	ld	A,(XIZ+)
	ld	IXL,A
	ld	IXH,0xFF
DecompressTiles.skip:
	bit	0,IXL
	jr	Z,DecompressTilesMatch
	ld	A,(XIZ+)
	ld	XDE,wTextBuffer
	ld	(XDE+QIX),A
	ld	(XHL+),A
	minc1	0x400,QIX
	dec	1,IY
	or	IY,IY
	jr	NZ,DecompressTiles.loop2
DecompressTiles.loop3:
	pop	XIZ
	pop	XIY
	pop	XIX
	ret

c_207293	section	code abs=0x207293

; [code] DecompressTiles, flag bit 0 clear: a match word (offset = low byte | high nibble << 8, length = low nibble of the high byte + 3) copied from the 1 KiB ring to CHAR RAM and the ring
DecompressTilesMatch:
	ld	WA,(XIZ+)
	ld	QIY,WA
	srl	4,QIYH
	and	W,0xF
	inc	3,W
	ld	QW,W
DecompressTilesMatch.loop:
	ld	XDE,wTextBuffer
	ld	A,(XDE+QIY)
	minc1	0x400,QIY
	ld	(XDE+QIX),A
	ld	(XHL+),A
	minc1	0x400,QIX
	dec	1,IY
	or	IY,IY
	jr	Z,DecompressTiles.loop3
	djnz	QW,DecompressTilesMatch.loop
	jr	DecompressTiles.loop2
