; engine/gfx/tilemap.asm: tilemap (SCR1/SCR2) fill, clear and drawing, the flipped tile block writer; dungeon map cells, the picture-area clears, the arena cover / uncover and battle-entry wipe maps, the arena duel sword / letter columns

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

c_206F69	section	code abs=0x206F69

; [code] BC / DE = cell -> its GetMetatileTiles 2 x 2 tiles into SCR1 0x9000 + (y & 15) * 0x80 + (x & 15) * 4 (XBC) and +0x40 (XDE)
DrawMapCell:
	ld	XWA,0
	ld	A,C
	ld	W,E
	and	WA,0xF0F
	sll	3,A
	srl	1,WA
	add	WA,SCROLL1_VRAM
	push	XWA
	call	GetMapCell
	call	GetMetatileTiles
	pop	XWA
	ld	(XWA),XBC
	ld	(XWA+0x40),XDE
	ret

c_213201	section	code abs=0x213201

; [code] ClearPictureMap on SCR2 0x9800 (zeroes its top-left 12 x 14 entries); byte-identical copy of ClearArenaPortraitArea, ClearTalkPortraitArea (the ROM has each)
ClearArenaPortraitArea2:
	push	XHL
	ld	XHL,SCROLL2_VRAM
	call	ClearPictureMap
	pop	XHL
	ret

c_21323D	section	code abs=0x21323D

; [code] ClearPictureMap on SCR2 0x9800 (zeroes its top-left 12 x 14 entries); DrawArenaParticipants does it before each portrait; byte-identical copy of ClearArenaPortraitArea2, ClearTalkPortraitArea (the ROM has each)
ClearArenaPortraitArea:
	push	XHL
	ld	XHL,SCROLL2_VRAM
	call	ClearPictureMap
	pop	XHL
	ret

c_21516D	section	code abs=0x21516D

; [code] ClearPictureMap on SCR2 0x9800 (zeroes its top-left 12 x 14 entries), the area the talk speaker portrait is drawn in; byte-identical copy of ClearArenaPortraitArea2, ClearArenaPortraitArea (the ROM has each)
ClearTalkPortraitArea:
	push	XHL
	ld	XHL,SCROLL2_VRAM
	call	ClearPictureMap
	pop	XHL
	ret

c_21ABDA	section	code abs=0x21ABDA

; [code] same 12x14 clear + FillTiles 0x7E x 0x1C2 as ClearPicture, then zeroes all of 0x9000-0x97FF and 0x9800-0x9FFF (SCR1 and SCR2 maps); callers ClearPictureHideCursor, HideMenuClearPicture, WorksScreenTask, ReopenWorksBoxes
ClearPictureAndTilemaps:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	FillScr1Rect
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	FillScr2Rect
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	ld	XHL,SCROLL1_VRAM
	ld	XDE,SCROLL1_VRAM+1
	ld	XBC,0x7FF
	xor	A,A
	ld	(XHL),A
	ldir	(XDE+),(XHL+)
	ld	XHL,SCROLL2_VRAM
	ld	XDE,SCROLL2_VRAM+1
	ld	XBC,0x7FF
	xor	A,A
	ld	(XHL),A
	ldir	(XDE+),(XHL+)
	ret

c_214675	section	code abs=0x214675

; [code] the 18 x 5 map DuelTitleSwordMap (mono DuelTitleSwordMonoMap) drawn one column at a time into SCR1 row 7 at column (0x98 - +0x2C) / 8 - 1 (columns 1-0x12), tiles + GetPictureFirstTile - 1; wScr1ScrollX = 0x98 - +0x2C
DrawDuelSwordColumn:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	srl	3,A
	dec	1,A
	cp	A,1
	jr	C,DrawDuelSwordColumn.skip4
	cp	A,0x13
	jr	NC,DrawDuelSwordColumn.skip4
	extz	WA
	extz	XWA
	push	XWA
	sll	1,XWA
	ld	XDE,7
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,SCROLL1_VRAM
	add	XDE,XWA
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,DrawDuelSwordColumn.skip
	ld	XHL,DuelTitleSwordMap
	jr	DrawDuelSwordColumn.skip2
DrawDuelSwordColumn.skip:
	ld	XHL,DuelTitleSwordMonoMap
DrawDuelSwordColumn.skip2:
	inc	2,XHL
	pop	XWA
	sub	XWA,1
	sll	1,XWA
	add	XHL,XWA
	call	GetPictureFirstTile
	dec	1,WA
	ld	C,5
DrawDuelSwordColumn.loop:
	push	C
	ld	BC,(XHL)
	and	BC,0x1FF
	ld	BC,(XHL)
	jr	Z,DrawDuelSwordColumn.skip3
	add	BC,WA
DrawDuelSwordColumn.skip3:
	ld	(XDE),BC
	pop	C
	add	XHL,0x24
	add	XDE,0x40
	djnz	C,DrawDuelSwordColumn.loop
DrawDuelSwordColumn.skip4:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	ld	(wScr1ScrollX),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214700	section	code abs=0x214700

; [code] the 10 x 3 map DuelTitleWordMap (mono DuelTitleWordMonoMap) one column at a time into SCR2 row 8 at column +0x2C / 8 + 1 (columns 5-0xE); SCR2 scroll the other way
DrawDuelLetterColumn:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2C)
	srl	3,A
	inc	1,A
	cp	A,5
	jr	C,DrawDuelLetterColumn.skip4
	cp	A,0xF
	jr	NC,DrawDuelLetterColumn.skip4
	extz	WA
	extz	XWA
	push	XWA
	sll	1,XWA
	ld	XDE,8
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,SCROLL2_VRAM
	add	XDE,XWA
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,DrawDuelLetterColumn.skip
	ld	XHL,DuelTitleWordMap
	jr	DrawDuelLetterColumn.skip2
DrawDuelLetterColumn.skip:
	ld	XHL,DuelTitleWordMonoMap
DrawDuelLetterColumn.skip2:
	inc	2,XHL
	pop	XWA
	sub	XWA,5
	sll	1,XWA
	add	XHL,XWA
	call	GetPictureFirstTile
	dec	1,WA
	ld	C,3
DrawDuelLetterColumn.loop:
	push	C
	ld	BC,(XHL)
	and	BC,0x1FF
	ld	BC,(XHL)
	jr	Z,DrawDuelLetterColumn.skip3
	add	BC,WA
DrawDuelLetterColumn.skip3:
	ld	(XDE),BC
	pop	C
	add	XHL,0x14
	add	XDE,0x40
	djnz	C,DrawDuelLetterColumn.loop
DrawDuelLetterColumn.skip4:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	neg	A
	ld	(wScr2ScrollX),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21478C	section	code abs=0x21478C

; [code] ArenaStartBattle: zeroes the 5 SCR1 entries of column (0x98 - +0x2C) / 8 - 2 from row 7; wScr1ScrollX = 0x98 - +0x2C
EraseDuelSwordColumn:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	srl	3,A
	dec	2,A
	cp	A,1
	jr	C,EraseDuelSwordColumn.skip
	cp	A,0x13
	jr	NC,EraseDuelSwordColumn.skip
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XDE,7
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,SCROLL1_VRAM
	add	XDE,XWA
	ld	WA,0
	ld	C,5
EraseDuelSwordColumn.loop:
	ld	(XDE),WA
	add	XDE,0x40
	djnz	C,EraseDuelSwordColumn.loop
EraseDuelSwordColumn.skip:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	ld	(wScr1ScrollX),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2147DA	section	code abs=0x2147DA

; [code] ArenaStartBattle: zeroes the 3 SCR2 entries of column +0x2C / 8 + 2 from row 8; wScr2ScrollX = -(0x98 - +0x2C)
EraseDuelLetterColumn:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2C)
	srl	3,A
	inc	2,A
	cp	A,5
	jr	C,EraseDuelLetterColumn.skip
	cp	A,0xF
	jr	NC,EraseDuelLetterColumn.skip
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XDE,8
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,SCROLL2_VRAM
	add	XDE,XWA
	ld	WA,0
	ld	C,3
EraseDuelLetterColumn.loop:
	ld	(XDE),WA
	add	XDE,0x40
	djnz	C,EraseDuelLetterColumn.loop
EraseDuelLetterColumn.skip:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	neg	A
	ld	(wScr2ScrollX),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216C1F	section	code abs=0x216C1F

; [code] XHL = tilemap, WA = tile: UncoverTileStep step 0, then 12 x 14 entries (row stride 0x20) of the tile with palette 15 (0x3E00), flip bit 14 on odd rows
DrawUncoverTilemap:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	UncoverTileStep
	pop	WA
	ld	B,0
DrawUncoverTilemap.loop:
	ld	C,0
DrawUncoverTilemap.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,DrawUncoverTilemap.skip
	or	DE,0x4000
	jr	DrawUncoverTilemap.skip2
DrawUncoverTilemap.skip:
	or	DE,0
DrawUncoverTilemap.skip2:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0xC
	jr	C,DrawUncoverTilemap.loop2
	ld	XDE,0x20
	sub	XDE,0xC
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0xE
	jr	C,DrawUncoverTilemap.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216CAA	section	code abs=0x216CAA

; [code] the DrawUncoverTilemap shape with CoverTileStep step 0 and flip bit 14 on even rows
DrawCoverTilemap:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	CoverTileStep
	pop	WA
	ld	B,0
DrawCoverTilemap.loop:
	ld	C,0
DrawCoverTilemap.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,DrawCoverTilemap.skip
	or	DE,0
	jr	DrawCoverTilemap.skip2
DrawCoverTilemap.skip:
	or	DE,0x4000
DrawCoverTilemap.skip2:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0xC
	jr	C,DrawCoverTilemap.loop2
	ld	XDE,0x20
	sub	XDE,0xC
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0xE
	jr	C,DrawCoverTilemap.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D35	section	code abs=0x216D35

; [code] zeroes 20 x 19 entries (row stride 0x20) of the tilemap at XHL
ClearTilemap20x19:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,0
	ld	B,0
ClearTilemap20x19.loop:
	ld	C,0
ClearTilemap20x19.loop2:
	ld	(XHL),WA
	inc	2,XHL
	inc	1,C
	cp	C,0x14
	jr	C,ClearTilemap20x19.loop2
	ld	XDE,0x20
	sub	XDE,0x14
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0x13
	jr	C,ClearTilemap20x19.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D66	section	code abs=0x216D66

; [code] XHL = tilemap, WA = tile: DrawWipeTileStep step 0, then 20 x 19 entries (row stride 0x20) of the tile with palette 15 (0x3E00), flip bit 15 on even columns and flip bit 14 on odd rows (four mirrored copies of one tile)
DrawWipeTilemap:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	DrawWipeTileStep
	pop	WA
	ld	B,0
DrawWipeTilemap.loop:
	ld	C,0
DrawWipeTilemap.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,DrawWipeTilemap.skip
	or	DE,0x4000
	jr	DrawWipeTilemap.skip2
DrawWipeTilemap.skip:
	or	DE,0
DrawWipeTilemap.skip2:
	ld	A,C
	and	A,1
	jr	Z,DrawWipeTilemap.skip3
	or	DE,0
	jr	DrawWipeTilemap.skip4
DrawWipeTilemap.skip3:
	or	DE,0x8000
DrawWipeTilemap.skip4:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0x14
	jr	C,DrawWipeTilemap.loop2
	ld	XDE,0x20
	sub	XDE,0x14
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0x13
	jr	C,DrawWipeTilemap.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216BEE	section	code abs=0x216BEE

; [code] XHL = tilemap address: zeroes the top-left 12 x 14 entries (rows 0x20 words apart), registers saved; callers ClearArenaPortraitArea / ClearArenaPortraitArea2 (SCR2 0x9800) and the town talk code
ClearPictureMap:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,0
	ld	B,0
ClearPictureMap.loop:
	ld	C,0
ClearPictureMap.loop2:
	ld	(XHL),WA
	inc	2,XHL
	inc	1,C
	cp	C,0xC
	jr	C,ClearPictureMap.loop2
	ld	XDE,0x20
	sub	XDE,0xC
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0xE
	jr	C,ClearPictureMap.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
