; engine/gfx/vblank.asm: the VBlank scroll / shake update (S1SO, S2SO, PO, and the mid-frame DMA copy)

c_2064C6	section	code abs=0x2064C6

; VBlank: writes the scroll and sprite-offset registers, adding wShakeX/Y to each plane whose wShakeFlags
; bit is set (0 sprites, 1 scr1, 2 scr2, 3/4 split scr1/scr2); for a wScrollSplitLine of 1..0x97 it arms
; micro-DMA to copy wSplitScrollBuffer to S1SO_H.. mid-frame [U2] [code]
UpdateScrollRegisters:
	ld	W,(wShakeFlags)
	ld	A,(wScrollSplitLine)
	or	A,A
	jr	Z,UpdateScrollRegisters.skip3
	cp	A,SCREEN_HEIGHT
	jr	NC,UpdateScrollRegisters.skip3
	ld	C,(wScr1SplitScrollX)
	ld	E,(wScr1SplitScrollY)
	bit	3,W
	jr	Z,UpdateScrollRegisters.skip
	add	C,(wShakeX)
	add	E,(wShakeY)
UpdateScrollRegisters.skip:
	ld	(wSplitScrollBuffer),C
	ld	(wSplitScrollBuffer+1),E
	ld	C,(wScr2SplitScrollX)
	ld	E,(wScr2SplitScrollY)
	bit	4,W
	jr	Z,UpdateScrollRegisters.skip2
	add	C,(wShakeX)
	add	E,(wShakeY)
UpdateScrollRegisters.skip2:
	ld	(wSplitScrollBuffer+2),C
	ld	(wSplitScrollBuffer+3),E
	ld	W,0
	ldc	DMAC0,WA
	ld	A,0x14
	ldc	DMAM0,A
	ldb	(DMA0V),0x10
	ld	XWA,wSplitScrollBuffer
	ldc	DMAS1,XWA
	ld	XWA,S1SO_H
	ldc	DMAD1,XWA
	ld	WA,1
	ldc	DMAC1,WA
	ld	A,0xA
	ldc	DMAM1,A
	ldb	(DMA1V),0x10
UpdateScrollRegisters.skip3:
	ld	W,(wShakeFlags)
	ld	C,(wScr1ScrollX)
	ld	E,(wScr1ScrollY)
	bit	1,W
	jr	Z,UpdateScrollRegisters.skip4
	add	C,(wShakeX)
	add	E,(wShakeY)
UpdateScrollRegisters.skip4:
	ld	(S1SO_H),C
	ld	(S1SO_V),E
	ld	C,(wScr2ScrollX)
	ld	E,(wScr2ScrollY)
	bit	2,W
	jr	Z,UpdateScrollRegisters.skip5
	add	C,(wShakeX)
	add	E,(wShakeY)
UpdateScrollRegisters.skip5:
	ld	(S2SO_H),C
	ld	(S2SO_V),E
	ld	C,(wSpriteOffsetX)
	ld	E,(wSpriteOffsetY)
	bit	0,W
	jr	Z,UpdateScrollRegisters.skip6
	add	C,(wShakeX)
	add	E,(wShakeY)
UpdateScrollRegisters.skip6:
	neg	C
	neg	E
	ld	(PO_H),C	; PO (sprite offset) moves sprites the other way
	ld	(PO_V),E
	ret
