; engine/gfx/tilemap.asm: tilemap (SCR1/SCR2) fill, clear and drawing, the flipped tile block writer

c_206768	section	code abs=0x206768

; [code] FillTilemapRect with rows 0-0x1F on SCR1 (0x9000), rows 0x20+ on SCR2 (0x9800, row - 0x20); EraseTextBox and TextWaitButton use it
FillScrRect:
	cp	E,0x20
	ld	XHL,0x9000
	jr	C,FillTilemapRect
	sub	E,0x20
	ld	HL,0x9800
	jr	FillTilemapRect

c_20677A	section	code abs=0x20677A

; [code] FillTilemapRect on the SCR1 map 0x9000
FillScr1Rect:
	ld	XHL,0x9000
	jr	FillTilemapRect

c_206781	section	code abs=0x206781

; [code] FillTilemapRect on the SCR2 map 0x9800
FillScr2Rect:
	ld	XHL,0x9800
	jr	FillTilemapRect

c_206788	section	code abs=0x206788

; [code] XHL = tile map, WA = tile word, C/E = column/row, B/D = width/height: writes WA to every cell of the rectangle, clipped to the 32x32 map
FillTilemapRect:
	ld	QB,B
	ld	QD,D
	exts	BC
	exts	DE
	ld	QWA,WA
	push	QWA
	push	DE
	push	BC
	ld	BC,0
	ld	DE,0
FillTilemapRect.loop:
	ld	WA,DE
	add	WA,(XSP+2)
	jr	MI,FillTilemapRect.skip
	cp	WA,0x20
	jr	NC,FillTilemapRect.skip2
	and	A,0x1F
	ld	QA,A
	ld	WA,BC
	add	WA,(XSP)
	jr	MI,FillTilemapRect.skip
	cp	WA,0x20
	jr	NC,FillTilemapRect.skip
	ld	QW,0
	sll	11,WA
	sll	6,XWA
	ld	WA,(XSP+4)
	ld	(XHL+QWA),WA
FillTilemapRect.skip:
	inc	1,C
	cp	C,QB
	jr	C,FillTilemapRect.loop
	ld	C,0
	inc	1,E
	cp	E,QD
	jr	C,FillTilemapRect.loop
FillTilemapRect.skip2:
	inc	6,XSP
	ret

c_2067E1	section	code abs=0x2067E1

; [code] zeroes tile 0 (CHAR RAM 0xA000, 16 bytes) and both maps 0x9000-0x9FFF (SCR1 + SCR2)
ClearTilemaps:
	ld	XWA,0
	ld	XHL,0xA000
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	XHL,0x9000
	ld	BC,0x400
ClearTilemaps.loop:
	ld	(XHL+),XWA
	djnz	BC,ClearTilemaps.loop
	ret

c_206803	section	code abs=0x206803

; [code] zeroes tile 0 (0xA000) and the SCR1 map 0x9000-0x97FF
ClearScr1Tilemap:
	ld	XWA,0
	ld	XHL,0xA000
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	XHL,0x9000
	ld	BC,0x200
ClearScr1Tilemap.loop:
	ld	(XHL+),XWA
	djnz	BC,ClearScr1Tilemap.loop
	ret

c_206825	section	code abs=0x206825

; [code] zeroes tile 0 (0xA000) and the SCR2 map 0x9800-0x9FFF
ClearScr2Tilemap:
	ld	XWA,0
	ld	XHL,0xA000
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	XHL,0x9800
	ld	BC,0x200
ClearScr2Tilemap.loop:
	ld	(XHL+),XWA
	djnz	BC,ClearScr2Tilemap.loop
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
	jrl	GE,DrawTilemapAt.skip7
	cpw	(XSP),0x20
	jrl	GE,DrawTilemapAt.skip7
	ld	A,(XHL+)
	ld	QC,A
	ld	W,0
	add	WA,(XSP)
	jr	MI,DrawTilemapAt.skip7
	bit	7,(XSP+5)
	jr	Z,DrawTilemapAt.skip
	ld	(XSP),WA
DrawTilemapAt.skip:
	ld	A,(XHL+)
	ld	QB,A
	ld	W,0
	add	WA,(XSP+2)
	jr	MI,DrawTilemapAt.skip7
	bit	6,(XSP+5)
	jr	Z,DrawTilemapAt.skip2
	ld	(XSP),WA
DrawTilemapAt.skip2:
	ld	BC,0
DrawTilemapAt.loop:
	ld	A,B
	ld	W,0
	bit	6,(XSP+5)
	jr	Z,DrawTilemapAt.skip3
	neg	WA
DrawTilemapAt.skip3:
	add	WA,(XSP+2)
	jr	MI,DrawTilemapAt.skip6
	cp	WA,0x20
	jr	NC,DrawTilemapAt.skip7
	ld	QA,A
	ld	A,C
	ld	W,0
	bit	7,(XSP+5)
	jr	Z,DrawTilemapAt.skip4
	neg	WA
DrawTilemapAt.skip4:
	add	WA,(XSP)
	jr	MI,DrawTilemapAt.skip6
	cp	WA,0x20
	jr	NC,DrawTilemapAt.skip6
	ld	QW,0
	sll	11,WA
	sll	6,XWA
	ld	WA,(XHL)
	and	WA,0x1FF
	ld	WA,(XHL)
	jr	Z,DrawTilemapAt.skip5
	add	WA,(XSP+4)
DrawTilemapAt.skip5:
	ld	(XDE+QWA),WA
DrawTilemapAt.skip6:
	inc	2,XHL
	inc	1,C
	cp	C,QC
	jr	C,DrawTilemapAt.loop
	ld	C,0
	inc	1,B
	cp	B,QB
	jr	C,DrawTilemapAt.loop
DrawTilemapAt.skip7:
	inc	6,XSP
	ret

c_206C7B	section	code abs=0x206C7B

; [code] DrawTileBlock on SCR1 (0x9000) for row DE < 0x20, else SCR2 (0x9800, row - 0x20); callers DrawEquippedRobot, LoadEnemyImage, BattleStart
DrawTileBlockScr:
	cp	DE,0x20
	ld	XHL,0x9000
	jr	C,DrawTileBlock
	sub	DE,0x20
	ld	HL,0x9800
	jr	DrawTileBlock

c_206C8F	section	code abs=0x206C8F

; [code] DrawTileBlock on the SCR1 map 0x9000; caller DrawDevelopedArm
DrawTileBlockScr1:
	ld	XHL,0x9000
	jr	DrawTileBlock

c_206C96	section	code abs=0x206C96

; [code] DrawTileBlock on the SCR2 map 0x9800
DrawTileBlockScr2:
	ld	XHL,0x9800
	jr	DrawTileBlock

c_206C9D	section	code abs=0x206C9D

; [code] XHL = map, WA = first tile word, BC / DE = column / row, QB / QD = width / height: writes WA, WA + 1 ... row by row into the 32x32 map, clipped; tile word bit 15 mirrors the columns and bit 14 the rows (the K2GE H / V flip bits)
DrawTileBlock:
	cp	DE,0x20
	ret	GE
	cp	BC,0x20
	ret	GE
	ld	QWA,WA
	ld	A,QD
	ld	W,0
	dec	1,WA
	add	WA,DE
	ret	MI
	bit	6,QW
	jr	Z,DrawTileBlock.skip
	ld	DE,WA
DrawTileBlock.skip:
	ld	A,QB
	ld	W,0
	dec	1,WA
	add	WA,BC
	ret	MI
	bit	7,QW
	jr	Z,DrawTileBlock.skip2
	ld	BC,WA
DrawTileBlock.skip2:
	ld	WA,QWA
	push	WA
	push	DE
	push	BC
	ld	BC,0
	ld	DE,0
DrawTileBlock.loop:
	ld	WA,DE
	bit	6,(XSP+5)
	jr	Z,DrawTileBlock.skip3
	neg	WA
DrawTileBlock.skip3:
	add	WA,(XSP+2)
	jr	MI,DrawTileBlock.skip5
	cp	WA,0x20
	jr	NC,DrawTileBlock.skip6
	and	A,0x1F
	ld	QA,A
	ld	WA,BC
	bit	7,(XSP+5)
	jr	Z,DrawTileBlock.skip4
	neg	WA
DrawTileBlock.skip4:
	add	WA,(XSP)
	jr	MI,DrawTileBlock.skip5
	cp	WA,0x20
	jr	NC,DrawTileBlock.skip5
	ld	QW,0
	sll	11,WA
	sll	6,XWA
	ld	WA,(XSP+4)
	ld	(XHL+QWA),WA
DrawTileBlock.skip5:
	incw	1,(XSP+4)
	inc	1,C
	cp	C,QB
	jr	C,DrawTileBlock.loop
	ld	C,0
	inc	1,E
	cp	E,QD
	jr	C,DrawTileBlock.loop
DrawTileBlock.skip6:
	inc	6,XSP
	ret
