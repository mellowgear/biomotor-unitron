; engine/gfx/window.asm: window registers: iris and window open/close animations

c_206D30	section	code abs=0x206D30

; [code] window registers WBA_H/WSI_H, WBA_V/WSI_V: B, D = 255 - scale (x, y, of 0xA0 x 0x98), C, E = the point it shrinks towards; scale 0 on either axis -> WBA_H 0xFF00, WSI_H 0; callers the two window tasks WindowCloseTask / WindowOpenTask
SetWindowScaled:
	cpl	B
	cpl	D
	or	B,B
	jr	Z,SetWindowScaled.skip3
	or	D,D
	jr	Z,SetWindowScaled.skip3
	ld	WA,0xA0
	cp	B,0xFF
	jr	Z,SetWindowScaled.skip
	ld	L,C
	mul	HL,B
	div	HL,0xFF
	ld	W,C
	sub	W,L
	ld	L,0xA0
	sub	L,C
	mul	HL,B
	div	HL,0xFF
	ld	A,L
	add	A,C
	sub	A,W
SetWindowScaled.skip:
	ld	(WBA_H),W
	ld	(WSI_H),A
	ld	WA,0x98
	cp	D,0xFF
	jr	Z,SetWindowScaled.skip2
	ld	L,E
	mul	HL,D
	div	HL,0xFF
	ld	W,E
	sub	W,L
	ld	L,0x98
	sub	L,E
	mul	HL,D
	div	HL,0xFF
	ld	A,L
	add	A,E
	sub	A,W
SetWindowScaled.skip2:
	ld	(WBA_V),W
	ld	(WSI_V),A
	ret
SetWindowScaled.skip3:
	ldw	(WBA_H),0xFF00
	ldw	(WSI_H),0
	ret

c_216EDE	section	code abs=0x216EDE

; [code] wWindowA = full screen (0, 0, 0xA0 x 0x98), wWindowB = empty at the centre (0x50, 0x4C, 0 x 0), steps 2, 2, 0xFC, 0xFC, wWindowAnim 0; callers ApplyWindowB + StartWindowAnimToA (the window opens from the centre)
SetupWindowIris:
	push	A
	ld	A,0
	ld	(wWindowA),A
	add	A,0x50
	ld	(wWindowB),A
	ld	A,0xA0
	ld	(wWindowA+2),A
	xor	A,A
	ld	(wWindowB+2),A
	ld	A,0
	ld	(wWindowA+1),A
	add	A,0x4C
	ld	(wWindowB+1),A
	ld	A,0x98
	ld	(wWindowA+3),A
	xor	A,A
	ld	(wWindowB+3),A
	ld	A,0
	ld	(wWindowAnim),A
	ld	A,2
	ld	(wWindowStep),A
	ld	(wWindowStep+1),A
	ld	A,0xFC
	ld	(wWindowStep+2),A
	ld	(wWindowStep+3),A
	pop	A
	ret

c_216F2D	section	code abs=0x216F2D

; [code] wWindowStep x / y = (wWindowB - wWindowA + 0x27) / 0x28 for x and y (no callers found)
SetWindowStepsForB:
	push	WA
	ld	A,(wWindowB)
	ld	W,(wWindowA)
	sub	A,W
	add	A,0x28
	sub	A,1
	xor	W,W
	div	WA,0x28
	ld	(wWindowStep),A
	ld	A,(wWindowB+1)
	ld	W,(wWindowA+1)
	sub	A,W
	add	A,0x28
	sub	A,1
	xor	W,W
	div	WA,0x28
	ld	(wWindowStep+1),A
	pop	WA
	ret

c_216F62	section	code abs=0x216F62

; [code] wWindowB x = L, y = H
SetWindowBPos:
	ld	(wWindowB),L
	ld	(wWindowB+1),H
	ret

c_216F6B	section	code abs=0x216F6B

; [code] WBA_H, WBA_V, WSI_H, WSI_V = wWindowA (0x60F1-0x60F4)
ApplyWindowA:
	push	A
	ld	A,(wWindowA)
	ld	(WBA_H),A
	ld	A,(wWindowA+1)
	ld	(WBA_V),A
	ld	A,(wWindowA+2)
	ld	(WSI_H),A
	ld	A,(wWindowA+3)
	ld	(WSI_V),A
	pop	A
	ret

c_216F8E	section	code abs=0x216F8E

; [code] WBA_H, WBA_V, WSI_H, WSI_V = wWindowB (0x60F5-0x60F8)
ApplyWindowB:
	push	A
	ld	A,(wWindowB)
	ld	(WBA_H),A
	ld	A,(wWindowB+1)
	ld	(WBA_V),A
	ld	A,(wWindowB+2)
	ld	(WSI_H),A
	ld	A,(wWindowB+3)
	ld	(WSI_V),A
	pop	A
	ret

c_216FB1	section	code abs=0x216FB1

; [code] wWindowAnim = 1: UpdateWindowAnim then moves all four window registers towards wWindowA by wWindowStep
StartWindowAnimToA:
	push	A
	ld	A,1
	ld	(wWindowAnim),A
	pop	A
	ret

c_216FBA	section	code abs=0x216FBA

; [code] (was StartWindowAnimMode2) wWindowAnim = 2: UpdateWindowAnim then moves all four window registers towards wWindowB (the mode 2
; branch at 0x217054; was "only WSI_V", wrong). [play] the black iris closing to the centre before a scene change:
; world map B / A on a dungeon / entrance and description B / Yes to enter, Camp > Leave > Yes, stairs; never in
; town
StartWindowIrisClose:
	push	A
	ld	A,2
	ld	(wWindowAnim),A
	pop	A
	ret

c_216FC3	section	code abs=0x216FC3

; [code] wWindowAnim 1: each of WBA_H/WBA_V/WSI_H/WSI_V one step (wWindowStep, sign by direction) towards wWindowA; 2: the same towards wWindowB; A = 1 while a register moved, else 0 and wWindowAnim = 0; callers poll it (WorldMapWaitOpen waits for A != 1)
UpdateWindowAnim:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(wWindowAnim)
	cp	A,0
	jr	NZ,UpdateWindowAnimToA
	ld	A,0
	jrl	UpdateWindowAnimToB.skip15

c_216FD3	section	code abs=0x216FD3

; [code] UpdateWindowAnim mode 1: WBA_H, WBA_V, WSI_H, WSI_V one wWindowStep each towards wWindowA (A = 1 if any moved); else (mode 2) UpdateWindowAnimToB
UpdateWindowAnimToA:
	cp	A,1
	jr	NZ,UpdateWindowAnimToB
	ld	A,0
	ld	B,(WBA_H)
	ld	C,(wWindowA)
	cp	B,C
	jr	Z,UpdateWindowAnimToA.skip6
	jr	C,UpdateWindowAnimToA.skip
	sub	B,(wWindowStep)
	jr	UpdateWindowAnimToA.skip2
UpdateWindowAnimToA.skip:
	add	B,(wWindowStep)
UpdateWindowAnimToA.skip2:
	ld	(WBA_H),B
	ld	A,1
UpdateWindowAnimToA.skip6:
	ld	B,(WBA_V)
	ld	C,(wWindowA+1)
	cp	B,C
	jr	Z,UpdateWindowAnimToA.skip8
	jr	C,UpdateWindowAnimToA.skip3
	sub	B,(wWindowStep+1)
	jr	UpdateWindowAnimToA.skip7
UpdateWindowAnimToA.skip3:
	add	B,(wWindowStep+1)
UpdateWindowAnimToA.skip7:
	ld	(WBA_V),B
	ld	A,1
UpdateWindowAnimToA.skip8:
	ld	B,(WSI_H)
	ld	C,(wWindowA+2)
	cp	B,C
	jr	Z,UpdateWindowAnimToA.skip9
	jr	C,UpdateWindowAnimToA.skip4
	add	B,(wWindowStep+2)
	jr	UpdateWindowAnimToA.skip5
UpdateWindowAnimToA.skip4:
	sub	B,(wWindowStep+2)
UpdateWindowAnimToA.skip5:
	ld	(WSI_H),B
	ld	A,1
UpdateWindowAnimToA.skip9:
	ld	B,(WSI_V)
	ld	C,(wWindowA+3)
	cp	B,C
	jr	Z,UpdateWindowToAHeightBelow.skip2
	jr	C,UpdateWindowToAHeightBelow
	add	B,(wWindowStep+3)
	jr	UpdateWindowToAHeightBelow.skip

c_217047	section	code abs=0x217047

; [code] UpdateWindowAnimToA, WSI_V below wWindowA+3: WSI_V -= wWindowStep+3 (0xFC in the iris setups: + 4), A = 1
UpdateWindowToAHeightBelow:
	sub	B,(wWindowStep+3)
UpdateWindowToAHeightBelow.skip:
	ld	(WSI_V),B
	ld	A,1
UpdateWindowToAHeightBelow.skip2:
	jrl	UpdateWindowAnimToB.skip14

c_217054	section	code abs=0x217054

; [code] UpdateWindowAnim mode 2: the same towards wWindowB; any other mode: A = 0, wWindowAnim = 0
UpdateWindowAnimToB:
	cp	A,2
	jr	NZ,UpdateWindowAnimToB.skip13
	ld	A,0
	ld	B,(WBA_H)
	ld	C,(wWindowB)
	cp	B,C
	jr	Z,UpdateWindowAnimToB.skip3
	jr	C,UpdateWindowAnimToB.skip
	sub	B,(wWindowStep)
	jr	UpdateWindowAnimToB.skip2
UpdateWindowAnimToB.skip:
	add	B,(wWindowStep)
UpdateWindowAnimToB.skip2:
	ld	(WBA_H),B
	ld	A,1
UpdateWindowAnimToB.skip3:
	ld	B,(WBA_V)
	ld	C,(wWindowB+1)
	cp	B,C
	jr	Z,UpdateWindowAnimToB.skip6
	jr	C,UpdateWindowAnimToB.skip4
	sub	B,(wWindowStep+1)
	jr	UpdateWindowAnimToB.skip5
UpdateWindowAnimToB.skip4:
	add	B,(wWindowStep+1)
UpdateWindowAnimToB.skip5:
	ld	(WBA_V),B
	ld	A,1
UpdateWindowAnimToB.skip6:
	ld	B,(WSI_H)
	ld	C,(wWindowB+2)
	cp	B,C
	jr	Z,UpdateWindowAnimToB.skip9
	jr	C,UpdateWindowAnimToB.skip7
	add	B,(wWindowStep+2)
	jr	UpdateWindowAnimToB.skip8
UpdateWindowAnimToB.skip7:
	sub	B,(wWindowStep+2)
UpdateWindowAnimToB.skip8:
	ld	(WSI_H),B
	ld	A,1
UpdateWindowAnimToB.skip9:
	ld	B,(WSI_V)
	ld	C,(wWindowB+3)
	cp	B,C
	jr	Z,UpdateWindowAnimToB.skip12
	jr	C,UpdateWindowAnimToB.skip10
	add	B,(wWindowStep+3)
	jr	UpdateWindowAnimToB.skip11
UpdateWindowAnimToB.skip10:
	sub	B,(wWindowStep+3)
UpdateWindowAnimToB.skip11:
	ld	(WSI_V),B
	ld	A,1
UpdateWindowAnimToB.skip12:
	jr	UpdateWindowAnimToB.skip14
UpdateWindowAnimToB.skip13:
	ld	A,0
UpdateWindowAnimToB.skip14:
	cp	A,0
	jr	NZ,UpdateWindowAnimToB.skip15
	ld	A,0
	ld	(wWindowAnim),A
UpdateWindowAnimToB.skip15:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2170E4	section	code abs=0x2170E4

; [code] wWindowA = full screen, wWindowB = x 0x50 width 0 at full height, steps x 2, width 0xFC (opens sideways); caller TalkGoToWorksRowE
SetupWindowOpenHorizontal:
	push	A
	ld	A,0
	ld	(wWindowA),A
	ld	A,0x50
	ld	(wWindowB),A
	ld	A,0xA0
	ld	(wWindowA+2),A
	ld	A,0
	ld	(wWindowB+2),A
	ld	A,0
	ld	(wWindowA+1),A
	ld	A,0
	ld	(wWindowB+1),A
	ld	A,0x98
	ld	(wWindowA+3),A
	ld	A,0x98
	ld	(wWindowB+3),A
	ld	A,2
	ld	(wWindowStep),A
	ld	A,0
	ld	(wWindowStep+1),A
	ld	A,0xFC
	ld	(wWindowStep+2),A
	ld	A,0
	ld	(wWindowStep+3),A
	pop	A
	ret

c_21712F	section	code abs=0x21712F

; [code] wWindowA = full screen, wWindowB = y 0x4C height 0 at full width, steps y 2, height 0xFC (opens up and down); caller TalkGoToWorksRow0
SetupWindowOpenVertical:
	push	A
	ld	A,0
	ld	(wWindowA),A
	ld	A,0
	ld	(wWindowB),A
	ld	A,0xA0
	ld	(wWindowA+2),A
	ld	A,0xA0
	ld	(wWindowB+2),A
	ld	A,0
	ld	(wWindowA+1),A
	ld	A,0x4C
	ld	(wWindowB+1),A
	ld	A,0x98
	ld	(wWindowA+3),A
	ld	A,0
	ld	(wWindowB+3),A
	ld	A,0
	ld	(wWindowStep),A
	ld	A,2
	ld	(wWindowStep+1),A
	ld	A,0
	ld	(wWindowStep+2),A
	ld	A,0xFC
	ld	(wWindowStep+3),A
	pop	A
	ret
