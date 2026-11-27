; engine/gfx/portraits.asm: portrait drawing (PortraitTable), GetPictureFirstTile

c_21037F	section	code abs=0x21037F

; [code] ret; no callers (before DrawPortraitAt)
Unused_21037F:
	ret

c_210380	section	code abs=0x210380

DrawPortraitAt:
	push	WA
	push	HL
	cp	HL,0xA
	jr	LE,DrawPortraitAtOffset.skip
	cp	HL,0x15
	jr	GE,DrawPortraitAtHigh
	jr	DrawPortraitAtOffset.skip2

c_210390	section	code abs=0x210390

; [code] DrawPortraitAt for HL >= 0x15: 0x15-0x22 -> DrawPortraitAtOffset, else DrawPortrait at BC / DE as given
DrawPortraitAtHigh:
	cp	HL,0x22
	jr	LE,DrawPortraitAtOffset
	jr	DrawPortraitAtOffset.skip2

c_210398	section	code abs=0x210398

; [code] BC += PortraitOffsets[HL - 0xA] byte 0, DE += byte 1, then DrawPortrait (DrawPortraitAt for HL 0x15-0x22; HL <= 0xA joins after the subtraction, indexing by HL)
DrawPortraitAtOffset:
	sub	HL,0xA
DrawPortraitAtOffset.skip:
	extz	XHL
	sll	1,XHL
	add	XHL,PortraitOffsets
	ld	A,(XHL)
	extz	WA
	add	BC,WA
	ld	A,(XHL+1)
	extz	WA
	add	DE,WA
DrawPortraitAtOffset.skip2:
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
	jr	LT,DrawPortrait.skip
	ld	A,0x20
DrawPortrait.skip:
	push	XHL
	ld	XHL,(XHL)
	call	LoadPalettes
	call	FadePalettes
	pop	XHL
	ld	C,2
	ld	A,2
	cpw	(XSP),0x20
	jr	LT,DrawPortrait.skip2
	ld	A,4
DrawPortrait.skip2:
	push	XHL
	ld	XHL,(XHL+0xC)
	call	LoadMonoPalettes
	call	FadeMonoPalettes
	pop	XHL
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,DrawPortraitColor
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
	jr	DrawPortraitColor.skip

c_210423	section	code abs=0x210423

; [code] DrawPortrait with wColorFlags bit 4 set: LoadCompressedTiles of record +4 and DrawTilemap of record +8 (the colour tiles and map)
DrawPortraitColor:
	ld	WA,(XSP+4)
	push	XHL
	ld	XHL,(XHL+4)
	call	LoadCompressedTiles
	pop	XHL
	ld	XHL,(XHL+8)
	ld	DE,(XSP)
	ld	BC,(XSP+2)
	ld	WA,(XSP+4)
	call	DrawTilemap
DrawPortraitColor.skip:
	pop	DE
	pop	BC
	pop	WA
	ret

c_216845	section	code abs=0x216845

; [code] WA = 0x94; every caller passes it as the first tile to DrawPortrait, LoadEnemyImage, DrawSpriteMap or LoadCompressedTiles
GetPictureFirstTile:
	ld	WA,0x94
	ret
