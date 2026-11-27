; engine/dungeon/map.asm: map cell lookup and tile drawing on wMapPtr, start position from cell attributes

c_206E12	section	code abs=0x206E12

; [code] zeroes wMapScrollX / wMapScrollY / wMapScrollStepX / wMapScrollStepY; once at boot (Reset)
InitMapScroll:
	ld	WA,0
	ld	(wMapScrollX),WA
	ld	(wMapScrollY),WA
	ld	(wMapScrollStepX),WA
	ld	(wMapScrollStepY),WA
	ret

c_206E25	section	code abs=0x206E25

; [code] every main-loop frame (Reset): wMapScrollY += wMapScrollStepY and wMapScrollX += wMapScrollStepX, their low bytes to wScr1ScrollY / wScr1ScrollX; on crossing a 16-pixel cell it draws the new map row (DrawMapRow) or column (DrawMapColumn); a step >= 16 redraws everything (RedrawMapAtScroll)
UpdateMapScroll:
	; a step of 16 or more pixels (a jump) redraws the whole screen
	ld	WA,(wMapScrollStepY)
	or	WA,WA
	jr	PL,UpdateMapScroll.skip
	neg	WA
UpdateMapScroll.skip:
	cp	WA,0x10
	jp	NC,RedrawMapAtScroll
	ld	WA,(wMapScrollStepX)
	or	WA,WA
	jr	PL,UpdateMapScroll.skip2
	neg	WA
UpdateMapScroll.skip2:
	cp	WA,0x10
	jp	NC,RedrawMapAtScroll
	ld	DE,(wMapScrollStepY)
	; vertical: on entering a new cell row draw it, at the bottom edge (+12) when moving down
	or	DE,DE
	jr	Z,UpdateMapScroll.skip4
	ld	WA,(wMapScrollY)
	add	DE,WA
	ld	(wMapScrollY),DE
	ld	(wScr1ScrollY),E
	sra	4,DE
	sra	4,WA
	cp	DE,WA
	jr	Z,UpdateMapScroll.skip4
	jr	C,UpdateMapScroll.skip3
	add	DE,0xC
UpdateMapScroll.skip3:
	ld	BC,(wMapScrollX)
	sra	4,BC
	dec	2,BC
	dec	2,DE
	call	DrawMapRow
UpdateMapScroll.skip4:
	; horizontal: the same for columns, the right edge being +13
	ld	BC,(wMapScrollStepX)
	or	BC,BC
	jr	Z,UpdateMapScroll.done
	ld	WA,(wMapScrollX)
	add	BC,WA
	ld	(wMapScrollX),BC
	ld	(wScr1ScrollX),C
	sra	4,BC
	sra	4,WA
	cp	BC,WA
	jr	Z,UpdateMapScroll.done
	jr	C,UpdateMapScroll.skip5
	add	BC,0xD
UpdateMapScroll.skip5:
	ld	DE,(wMapScrollY)
	sra	4,DE
	dec	2,BC
	dec	2,DE
	call	DrawMapColumn
UpdateMapScroll.done:
	ret

c_206EB6	section	code abs=0x206EB6

; [code] BC / DE = cell x / y (wrapped to the map's width / height, words +0 / +2 of wMapPtr) -> HL = the map word at wMapPtr + 4 + 2 * (y * width + x)
GetMapCell:
	; signed modulo, so negative cells wrap round the map
	ld	XWA,(wMapPtr)
	exts	XBC
	divs	XBC,(XWA)
	ld	BC,QBC
	or	BC,BC
	jr	PL,GetMapCell.skip
	add	BC,(XWA)
GetMapCell.skip:
	exts	XDE
	divs	XDE,(XWA+2)
	ld	DE,QDE
	or	DE,DE
	jr	PL,GetMapCell.skip2
	add	DE,(XWA+2)
GetMapCell.skip2:
	ld	HL,(XWA)
	mul	XHL,DE
	add	HL,BC
	sll	1,HL
	inc	4,XHL
	add	XHL,XWA
	ld	HL,(XHL)
	ret

c_206EE6	section	code abs=0x206EE6

; [code] HL = map word -> XBC / XDE = the top / bottom tile pairs of its metatile (wMetatileTilesPtr + 8 * (HL & 0x1FFF)); bit 14 swaps the rows, bit 15 the columns, bits 13-15 are xored into each tile; non-zero tile numbers + wDungeonTileBase - 1
GetMetatileTiles:
	ld	XDE,0
	ld	DE,HL
	sll	3,DE
	add	XDE,(wMetatileTilesPtr)
	and	HL,0xE000
	bit	6,H
	jr	Z,GetMetatileTiles.skip
	ld	XBC,(XDE+4)
	ld	XDE,(XDE)
	jr	GetMetatileTiles.skip2
GetMetatileTiles.skip:
	ld	XBC,(XDE)
	ld	XDE,(XDE+4)
GetMetatileTiles.skip2:
	bit	7,H
	jr	Z,GetMetatileTiles.skip3
	ex	BC,QBC
	ex	DE,QDE
GetMetatileTiles.skip3:
	; flip / palette bits into every tile; tile 0 stays blank, others are offset to the loaded sheet
	ld	QHL,HL
	xor	XBC,XHL
	xor	XDE,XHL
	ld	HL,(wDungeonTileBase)
	dec	1,HL
	ld	WA,BC
	and	WA,0x1FF
	jr	Z,GetMetatileTiles.skip4
	add	BC,HL
GetMetatileTiles.skip4:
	ld	WA,QBC
	and	WA,0x1FF
	jr	Z,GetMetatileTiles.skip5
	ld	WA,QBC
	add	WA,HL
	ld	QBC,WA
GetMetatileTiles.skip5:
	ld	WA,DE
	and	WA,0x1FF
	jr	Z,GetMetatileTiles.skip6
	add	DE,HL
GetMetatileTiles.skip6:
	ld	WA,QDE
	and	WA,0x1FF
	jr	Z,GetMetatileTiles.done
	ld	WA,QDE
	add	WA,HL
	ld	QDE,WA
GetMetatileTiles.done:
	ret

c_206F55	section	code abs=0x206F55

; [code] BC / DE = cell -> HL = attribute word (wMetatileAttrPtr)[GetMapCell & 0x1FFF]; GetCellAttrInDirection, the start-position search FindFloorStartCell
GetMapCellAttr:
	call	GetMapCell
	and	HL,0x1FFF
	sll	1,HL
	extz	XHL
	add	XHL,(wMetatileAttrPtr)
	ld	HL,(XHL)
	ret

c_206F8D	section	code abs=0x206F8D

; [code] DrawMapCell for 14 cells from BC, DE
DrawMapRow:
	ld	A,0xE
DrawMapRow.loop:
	push	A
	push	BC
	push	DE
	calr	DrawMapCell
	pop	DE
	pop	BC
	pop	A
	inc	1,BC
	djnz	A,DrawMapRow.loop
	ret

c_206F9E	section	code abs=0x206F9E

; [code] DrawMapCell for 13 cells from DE, BC
DrawMapColumn:
	ld	A,0xD
DrawMapColumn.loop:
	push	A
	push	BC
	push	DE
	calr	DrawMapCell
	pop	DE
	pop	BC
	pop	A
	inc	1,DE
	djnz	A,DrawMapColumn.loop
	ret

c_206FAF	section	code abs=0x206FAF

; [code] DrawMapRow for 13 rows from DE (14 x 13 cells); RedrawMapAtScroll
DrawMapScreen:
	ld	A,0xD
DrawMapScreen.loop:
	push	A
	push	BC
	push	DE
	call	DrawMapRow
	pop	DE
	pop	BC
	pop	A
	inc	1,DE
	djnz	A,DrawMapScreen.loop
	ret

c_21154F	section	code abs=0x21154F

; [code] zeroes the four map scroll words, then RedrawMapAtScroll (redraw at the scroll position); no caller found
ResetMapScrollAndRedraw:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	xor	WA,WA
	ld	(wMapScrollX),WA
	ld	(wMapScrollY),WA
	ld	(wMapScrollStepX),WA
	ld	(wMapScrollStepY),WA
	call	RedrawMapAtScroll
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211BE0	section	code abs=0x211BE0

; [code] DUNGEON_X / Y = the first map cell (row by row) whose GetMapCellAttr has 0x200 when +0x12 = 2 (DungeonFloorChangeStep floor - 1, entered by an 0x100 cell in CheckEncounter), else 0x100; failing that, the first cell without attr bit 12; StartDungeonFloor
FindFloorStartCell:
	push	XHL
	push	XDE
	push	BC
	push	XWA
	ld	A,(XIZ+DUNGEON_CHANGE)
	; arriving by stairs: look for the matching stairs (0x200 after floor - 1, 0x100 after floor + 1); XIZ+0x2C is scratch
	cp	A,2
	jr	Z,FindFloorStartCell.skip
	ld	HL,0x100
	jr	FindFloorStartCell.skip2
FindFloorStartCell.skip:
	ld	HL,0x200
FindFloorStartCell.skip2:
	ld	(XIZ+0x2C),HL
	ld	XHL,(wMapPtr)
	ld	BC,(XHL)
	inc	2,XHL
	ld	DE,(XHL)
	ld	A,C
	ld	W,E
	ld	BC,0
	ld	DE,0
FindFloorStartCell.loop:
	push	WA
	push	BC
	push	DE
	call	GetMapCellAttr
	pop	DE
	pop	BC
	pop	WA
	and	HL,(XIZ+0x2C)
	jr	NZ,FindFloorStartCell.skip3
	inc	1,BC
	cp	C,A
	jr	C,FindFloorStartCell.loop
	ld	BC,0
	inc	1,DE
	cp	E,W
	jr	C,FindFloorStartCell.loop
	ld	BC,0
	ld	DE,0
	; no stairs: the first open cell
FindFloorStartCell.loop2:
	push	WA
	push	BC
	push	DE
	call	GetMapCellAttr
	pop	DE
	pop	BC
	pop	WA
	and	HL,0x1000
	jr	Z,FindFloorStartCell.skip3
	inc	1,BC
	cp	C,A
	jr	C,FindFloorStartCell.loop2
	ld	BC,0
	inc	1,DE
	cp	E,W
	jr	C,FindFloorStartCell.loop2
FindFloorStartCell.skip3:
	ld	(XIZ+DUNGEON_X),C
	ld	(XIZ+DUNGEON_Y),E
	pop	XWA
	pop	BC
	pop	XDE
	pop	XHL
	ret

c_211C52	section	code abs=0x211C52

; [code] wMapScrollX = (DUNGEON_X - 5) * 16 + 8, wMapScrollY = (DUNGEON_Y - 5) * 16 + 0xC, then RedrawMapAtScroll (full redraw)
SetMapScrollToPlayer:
	push	XWA
	; party 5 cells from the left / top; X < 5 wraps the byte (map wraps anyway) (?)
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_X)
	sub	A,5
	mul	WA,0x10
	add	WA,8
	ld	(wMapScrollX),WA
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_Y)
	sub	A,5
	mul	WA,0x10
	add	WA,0xC
	ld	(wMapScrollY),WA
	call	RedrawMapAtScroll
	pop	XWA
	ret
