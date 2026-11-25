; engine/gfx/tiles.asm: CHAR RAM tile loading: raw, mapped and LZSS-compressed tiles, tile fills; the battle HP / EP bar tiles, the arena portrait and battle-entry tile wipes

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

c_207C0F	section	code abs=0x207C0F

; [code] DE = tile -> XDE = CHAR RAM 0xA000 + 16 * tile, then (entered here, or at DrawBarTilesAt with XDE set by BattleHPEPDisplayTask): QC copies of the empty bar tile RawTiles_2C83DD+2, then from the left one full tile (+0x82) per 8 of n = BC * 8 * QC / HL (rounded up) and the partial tile +2 + 16 * (n % 8); HL = max, BC = value
DrawBarTiles:
	extz	XDE
	sll	4,DE
	add	DE,CHARACTER_RAM
; [code] entry with XDE already a CHAR RAM address (BattleHPEPDisplayTask)
DrawBarTilesAt:
	push	BC
	push	HL
	push	XDE
	ld	XHL,RawTiles_2C83DD+0x2
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	ld	XHL,(XSP)
	ld	C,QC
	dec	1,C
	jr	Z,DrawBarTiles.skip
	ld	B,0
	sll	3,BC
	ldirw	(XDE+),(XHL+)
DrawBarTiles.skip:
	pop	XDE
	pop	HL
	pop	BC
	or	BC,BC
	ret	Z
	ld	QB,0
	sll	3,QBC
	mul	XBC,QBC
	extz	XHL
	add	XBC,XHL
	dec	1,XBC
	div	XBC,HL
DrawBarTiles.loop:
	cp	BC,8
	jr	C,DrawBarTiles.skip2
	push	BC
	ld	XHL,RawTiles_2C83DD+0x82
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	BC
	dec	8,BC
	jr	DrawBarTiles.loop
DrawBarTiles.skip2:
	or	BC,BC
	ret	Z
	sll	4,BC
	ld	XHL,RawTiles_2C83DD+0x2
	lda	XHL,XHL+BC
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	ret

c_207C7B	section	code abs=0x207C7B

; [code] the DrawBarTiles shape with RawTiles_2C846F, filled from the right end backwards (lddrw); entered at DrawBarTilesReversedAt by BattleHPEPDisplayTask for the enemy HP / EP
DrawBarTilesReversed:
	extz	XDE
	sll	4,DE
	add	DE,CHARACTER_RAM
; [code] entry with XDE already a CHAR RAM address (BattleHPEPDisplayTask)
DrawBarTilesReversedAt:
	push	BC
	push	HL
	push	XDE
	ld	XHL,RawTiles_2C846F+0x2
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XHL
	ld	C,QC
	dec	1,C
	jr	Z,DrawBarTilesReversed.skip
	ld	B,0
	sll	3,BC
	ldirw	(XDE+),(XHL+)
	dec	2,XDE
DrawBarTilesReversed.skip:
	pop	HL
	pop	BC
	or	BC,BC
	ret	Z
	ld	QB,0
	sll	3,QBC
	mul	XBC,QBC
	extz	XHL
	add	XBC,XHL
	dec	1,XBC
	div	XBC,HL
DrawBarTilesReversed.loop:
	cp	BC,8
	jr	C,DrawBarTilesReversed.skip2
	push	BC
	ld	XHL,RawTiles_2C846F+0x90
	ld	BC,8
	lddrw	(XDE-),(XHL-)
	pop	BC
	dec	8,BC
	jr	DrawBarTilesReversed.loop
DrawBarTilesReversed.skip2:
	or	BC,BC
	ret	Z
	sll	4,BC
	ld	XHL,RawTiles_2C846F+0x10
	lda	XHL,XHL+BC
	ld	BC,8
	lddrw	(XDE-),(XHL-)
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
	ld	XHL,CHARACTER_RAM
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

c_216D00	section	code abs=0x216D00

; [code] the UncoverTileStep shape the other way: the last step / 2 rows = 0xFFFF, the rest 0; A = 1 until step / 2 = 0x10
CoverTileStep:
	push	XHL
	push	XDE
	push	XBC
	sra	1,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,CHARACTER_RAM
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

c_216DCD	section	code abs=0x216DCD

; [code] WA = tile, C = step: rewrites the 16 bytes of the tile in CHAR RAM 0xA000 + 16 * tile: byte i = PixelFillBytes[clamp(step / 4 - (i / 2) - 4 * (i odd), 0, 4)] (filled from the top left); A = 1 until C = 0x14
DrawWipeTileStep:
	push	XHL
	push	XDE
	push	XBC
	sra	2,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,CHARACTER_RAM
	add	XHL,XWA
	ld	B,0x10
DrawWipeTileStep.loop:
	ld	A,0
	ld	XDE,XHL
	and	XDE,1
	jr	Z,DrawWipeTileStep.skip
	sub	A,4
DrawWipeTileStep.skip:
	ld	XDE,XHL
	srl	1,XDE
	and	XDE,7
	sub	A,E
	add	A,C
	bit	7,A
	jr	NZ,DrawWipeTileStep.skip2
	cp	A,4
	jr	C,DrawWipeTileStep.skip3
	ld	A,4
	jr	DrawWipeTileStep.skip3
DrawWipeTileStep.skip2:
	ld	A,0
DrawWipeTileStep.skip3:
	extz	WA
	extz	XWA
	ld	XDE,PixelFillBytes
	add	XDE,XWA
	ld	A,(XDE)
	ld	(XHL),A
	inc	1,XHL
	djnz	B,DrawWipeTileStep.loop
	cp	C,0x14
	jr	Z,DrawWipeTileStep.skip4
	ld	A,1
	jr	DrawWipeTileStep.skip5
DrawWipeTileStep.skip4:
	ld	A,0
DrawWipeTileStep.skip5:
	pop	XBC
	pop	XDE
	pop	XHL
	ret
