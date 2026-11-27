; engine/gfx/display.asm: display set-up at boot (InitDisplay, InitDisplayState)

c_206379	section	code abs=0x206379

; Boot (Reset): sets colour mode on a colour unit (wColorFlags 0x10), the K2GE control registers and timer 0,
; clears tilemaps, sprites and palette RAM, InitDisplayState, wFadeLevel 0x81 (black), full-screen window [code]
InitDisplay:
	ldb	(wColorFlags),0
	cpb	(OS_VERSION),0x10
	jr	C,InitDisplay.skip
	ldb	(wColorFlags),0x10
	ld	RW3,0xE
	ld	RA3,0x10
	call	BiosCall
InitDisplay.skip:
	ldb	(SCROLL_PRIORITY),0x80
	ldb	(BG),0x80
	ldb	(CONTROL_2D),7
	andb	(TRUN),0x8E
	ldb	(T01MOD),0
	ldb	(TREG0),1
	orb	(TRUN),1
	ld	RW3,4
	ld	RB3,0
	ld	RC3,2
	call	BiosCall
	call	ClearTilemaps
	call	ClearSprites
	call	InitDisplayState
	ldb	(wFadeLevel),0x81
	ld	XHL,SPRITE_PAL	; 0x200 bytes of palette RAM (sprite, scr1, scr2, BG, window)
	ld	BC,0x100
InitDisplay.loop:
	ldw	(XHL+),0
	djnz	BC,InitDisplay.loop
	ldw	(WBA_H),0
	ldw	(WSI_H),SCREEN_HEIGHT<<8|SCREEN_WIDTH
	ret

c_2063EE	section	code abs=0x2063EE

; From InitDisplay: zeroes the scroll, split, sprite-offset and shake state and the sprite buffers, sets
; wFadeLevel 0 / wFadeLevelShown 0xFF (forces a reload), grey ramps in wBgPalShadow / wWindowPalShadow [code]
InitDisplayState:
	ld	A,0
	ld	(wScrollSplitLine),A
	ld	(wScr1ScrollX),A
	ld	(wScr1ScrollY),A
	ld	(wScr1SplitScrollX),A
	ld	(wScr1SplitScrollY),A
	ld	(wScr2ScrollX),A
	ld	(wScr2ScrollY),A
	ld	(wScr2SplitScrollX),A
	ld	(wScr2SplitScrollY),A
	ld	(wSpriteOffsetX),A
	ld	(wSpriteOffsetY),A
	ld	(wShakeFlags),A
	ld	(wShakeX),A
	ld	(wShakeY),A
	ld	XWA,0
	ld	XHL,wSpriteBuffer
	ld	(wSpriteBufferPtr),HL
	ld	XDE,wSpritePalBuffer
	ld	(wSpritePalBufferPtr),DE
	ld	C,0x40
InitDisplayState.loop:
	ld	(XHL+),XWA
	ld	(XDE+),A
	djnz	C,InitDisplayState.loop
	ldb	(wFadeLevel),0
	ldb	(wFadeLevelShown),0xFF
	ldw	(wBgPalShadow),0xFFF
	ldw	(wBgPalShadow+2),0xDDD
	ldw	(wBgPalShadow+4),0xBBB
	ldw	(wBgPalShadow+6),0x999
	ldw	(wBgPalShadow+8),0x666
	ldw	(wBgPalShadow+0xA),0x444
	ldw	(wBgPalShadow+0xC),0x222
	ldw	(wBgPalShadow+0xE),0
	ldw	(wWindowPalShadow),0xFFF
	ldw	(wWindowPalShadow+2),0xDDD
	ldw	(wWindowPalShadow+4),0xBBB
	ldw	(wWindowPalShadow+6),0x999
	ldw	(wWindowPalShadow+8),0x666
	ldw	(wWindowPalShadow+0xA),0x444
	ldw	(wWindowPalShadow+0xC),0x222
	ldw	(wWindowPalShadow+0xE),0
	ld	XHL,SPPLT_01-1
	ld	XDE,wMonoPalShadow
	ld	BC,0x19
	ldir	(XDE+),(XHL+)
	ldb	(wBgShadow),0x80
	ret
