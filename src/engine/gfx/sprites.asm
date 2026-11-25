; engine/gfx/sprites.asm: sprite buffer clear and upload, sprite map drawing (also H-flipped), DrawSpriteGrid, the sprite menu cursor

c_20659B	section	code abs=0x20659B

; [code] main loop after the VBlank wait: copies the sprite buffer 0x5A86..(wSpriteBufferPtr) to sprite VRAM below 0x8900 and zeroes the rest; on colour the sprite palette bytes 0x5B86..(wSpritePalBufferPtr) below 0x8C40; FadePalettes (colour) / FadeMonoPalettes when wFadeLevel differs from 0x585C; then resets both buffer pointers
UpdateSpritesAndFade:
	push	XIX
	push	XIY
	ld	XHL,wSpriteBuffer
	ld	XDE,0x8900
	ld	BC,(wSpriteBufferPtr)
	sub	BC,HL
	jr	Z,UpdateSpritesAndFade.skip
	srl	2,BC
UpdateSpritesAndFade.loop:
	ld	XWA,(XHL+)
	ld	(-XDE),XWA
	djnz	BC,UpdateSpritesAndFade.loop
UpdateSpritesAndFade.skip:
	ld	BC,wSpritePalBuffer
	sub	BC,(wSpriteBufferPtr)
	jr	Z,UpdateSpritesAndFade.skip2
	srl	2,BC
	ld	XWA,0
UpdateSpritesAndFade.loop2:
	ld	(-XDE),XWA
	djnz	BC,UpdateSpritesAndFade.loop2
UpdateSpritesAndFade.skip2:
	cpb	(wColorFlags),0x10
	jr	C,UpdateSpritesAndFade.skip4
	ld	XHL,wSpritePalBuffer
	ld	XDE,0x8C40
	ld	BC,(wSpritePalBufferPtr)
	sub	BC,HL
	jr	Z,UpdateSpritesAndFade.skip3
UpdateSpritesAndFade.loop3:
	ld	A,(XHL+)
	ld	(-XDE),A
	djnz	BC,UpdateSpritesAndFade.loop3
UpdateSpritesAndFade.skip3:
	ld	A,(wFadeLevel)
	cp	A,(wFadeLevelShown)
	ld	(wFadeLevelShown),A
	call	NZ,FadePalettes
	jr	UpdateSpritesAndFade.skip5
UpdateSpritesAndFade.skip4:
	ld	A,(wFadeLevel)
	cp	A,(wFadeLevelShown)
	ld	(wFadeLevelShown),A
	call	NZ,FadeMonoPalettes
	jr	UpdateSpritesAndFade.skip5
UpdateSpritesAndFade.skip5:
	ldw	(wSpriteBufferPtr),wSpriteBuffer
	ldw	(wSpritePalBufferPtr),wSpritePalBuffer
	pop	XIY
	pop	XIX
	ret

c_206847	section	code abs=0x206847

; [code] zeroes sprite VRAM 0x8800-0x88FF (64 sprites) and resets the sprite buffer pointers 0x5A82 = 0x5A86, 0x5A84 = 0x5B86
ClearSprites:
	ld	XWA,0
	ld	XHL,0x8800
	ld	C,0x40
ClearSprites.loop:
	ld	(XHL+),XWA
	djnz	C,ClearSprites.loop
	ldw	(wSpriteBufferPtr),wSpriteBuffer
	ldw	(wSpritePalBufferPtr),wSpritePalBuffer
	ret

c_2069C8	section	code abs=0x2069C8

; [code] like DrawSpriteGrid but from a map at XHL (u8 w, h + one word per cell, DrawTilemap format; empty cells skipped), base WA, at pixel BC, DE
DrawSpriteMap:
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
	jrl	MI,DrawSpriteMap.skip2
	ld	A,(XHL+)
	ld	QB,A
	ld	W,0
	sll	3,WA
	add	WA,DE
	jr	MI,DrawSpriteMap.skip2
	ld	BC,0
	ld	XDE,0
DrawSpriteMap.loop:
	cpw	(wSpriteBufferPtr),wSpritePalBuffer
	jr	NC,DrawSpriteMap.skip2
	ld	WA,(XHL)
	and	WA,0x1FF
	jr	Z,DrawSpriteMap.skip
	ld	A,B
	ld	W,0
	sll	3,WA
	add	WA,(XSP+2)
	cp	WA,0xFFF8
	jr	LE,DrawSpriteMap.skip
	cp	WA,0xA0
	jr	GE,DrawSpriteMap.skip2
	ld	QW,A
	ld	A,C
	ld	W,0
	sll	3,WA
	add	WA,(XSP)
	cp	WA,0xFFF8
	jr	LE,DrawSpriteMap.skip
	cp	WA,0xA8
	jr	GE,DrawSpriteMap.skip
	ld	QA,A
	ld	WA,(XHL)
	and	W,0xE1
	add	WA,(XSP+4)
	ld	DE,(wSpriteBufferPtr)
	ld	(XDE+),XWA
	ld	(wSpriteBufferPtr),DE
	ld	WA,(XHL)
	srl	1,W
	and	W,0xF
	ld	DE,(wSpritePalBufferPtr)
	ld	(XDE+),W
	ld	(wSpritePalBufferPtr),DE
DrawSpriteMap.skip:
	inc	2,XHL
	inc	1,C
	cp	C,QC
	jr	C,DrawSpriteMap.loop
	ld	C,0
	inc	1,B
	cp	B,QB
	jr	C,DrawSpriteMap.loop
DrawSpriteMap.skip2:
	inc	6,XSP
	ret

c_206A7B	section	code abs=0x206A7B

; [code] DrawSpriteMap mirrored: columns placed right to left from pixel BC and attribute bit 15 (H flip) toggled (xor W,0x80); one caller in engine/battle/ next to DrawSpriteMap
DrawSpriteMapFlipped:
	cp	DE,0x98
	ret	GE
	cp	BC,0xA0
	ret	GE
	dec	1,WA
	or	W,0x18
	xor	W,0x80
	push	WA
	push	DE
	push	BC
	ld	A,(XHL+)
	ld	QC,A
	ld	W,0
	sll	3,WA
	add	BC,WA
	jrl	MI,DrawSpriteMapFlipped.skip2
	dec	8,BC
	ld	(XSP),BC
	ld	A,(XHL+)
	ld	QB,A
	ld	W,0
	sll	3,WA
	add	DE,WA
	jr	MI,DrawSpriteMapFlipped.skip2
	ld	BC,0
	ld	XDE,0
DrawSpriteMapFlipped.loop:
	cpw	(wSpriteBufferPtr),wSpritePalBuffer
	jr	NC,DrawSpriteMapFlipped.skip2
	ld	WA,(XHL)
	and	WA,0x1FF
	jr	Z,DrawSpriteMapFlipped.skip
	ld	A,B
	ld	W,0
	sll	3,WA
	add	WA,(XSP+2)
	cp	WA,0xFFF8
	jr	LE,DrawSpriteMapFlipped.skip
	cp	WA,0xA0
	jr	GE,DrawSpriteMapFlipped.skip2
	ld	QW,A
	ld	A,C
	ld	W,0
	sll	3,WA
	neg	WA
	add	WA,(XSP)
	cp	WA,0xFFF8
	jr	LE,DrawSpriteMapFlipped.skip
	cp	WA,0xA8
	jr	GE,DrawSpriteMapFlipped.skip
	ld	QA,A
	ld	WA,(XHL)
	and	W,0xE1
	add	WA,(XSP+4)
	ld	DE,(wSpriteBufferPtr)
	ld	(XDE+),XWA
	ld	(wSpriteBufferPtr),DE
	ld	WA,(XHL)
	srl	1,W
	and	W,0xF
	ld	DE,(wSpritePalBufferPtr)
	ld	(XDE+),W
	ld	(wSpritePalBufferPtr),DE
DrawSpriteMapFlipped.skip:
	inc	2,XHL
	inc	1,C
	cp	C,QC
	jr	C,DrawSpriteMapFlipped.loop
	ld	C,0
	inc	1,B
	cp	B,QB
	jr	C,DrawSpriteMapFlipped.loop
DrawSpriteMapFlipped.skip2:
	inc	6,XSP
	ret

c_206BFF	section	code abs=0x206BFF

; [code] adds a QB x QD grid of 8x8 sprites at pixel BC (x), DE (y) to the sprite buffer (0x5A82 / palette byte 0x5A84), tile word WA incremented per cell, cells off screen skipped; stops when the buffer is full (0x5B86)
DrawSpriteGrid:
	push	WA
	push	DE
	push	BC
	ld	BC,0
	ld	DE,0
	ld	XHL,0
DrawSpriteGrid.loop:
	cpw	(wSpriteBufferPtr),wSpritePalBuffer
	jr	NC,DrawSpriteGrid.skip2
	ld	WA,DE
	sll	3,WA
	add	WA,(XSP+2)
	cp	WA,0xFFF8
	jr	LE,DrawSpriteGrid.skip
	cp	WA,0xA0
	jr	GE,DrawSpriteGrid.skip2
	ld	QW,A
	ld	WA,BC
	sll	3,WA
	add	WA,(XSP)
	cp	WA,0xFFF8
	jr	LE,DrawSpriteGrid.skip
	cp	WA,0xA8
	jr	GE,DrawSpriteGrid.skip
	ld	QA,A
	ld	WA,(XSP+4)
	and	W,0xE1
	or	W,0x18
	ld	HL,(wSpriteBufferPtr)
	ld	(XHL+),XWA
	ld	(wSpriteBufferPtr),HL
	ld	WA,(XSP+4)
	and	W,0x1E
	srl	1,W
	ld	HL,(wSpritePalBufferPtr)
	ld	(XHL+),W
	ld	(wSpritePalBufferPtr),HL
DrawSpriteGrid.skip:
	incw	1,(XSP+4)
	inc	1,C
	cp	C,QB
	jr	C,DrawSpriteGrid.loop
	ld	C,0
	inc	1,E
	cp	E,QD
	jr	C,DrawSpriteGrid.loop
DrawSpriteGrid.skip2:
	inc	6,XSP
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
	jr	C,DrawMenuCursor.skip
	ld	QB,1
	ld	QD,2
	ld	WA,4
	or	WA,0x3E00
	call	DrawSpriteGrid
DrawMenuCursor.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
