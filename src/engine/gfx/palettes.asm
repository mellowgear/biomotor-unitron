; engine/gfx/palettes.asm: palette loading (colour and mono), palette resets, screen fades (wFadeLevel) and their upload to palette RAM

c_206626	section	code abs=0x206626

; palette shadow 0x5876 -> palette RAM 0x8200, with brightness
FadePalettes:
	cpb	(wColorFlags),0x10
	ret	C
	push	XIX
	push	XIY
	ld	XIY,wPalShadow
	ld	XIX,0x8200
	ld	QHL,0x100
	ld	HL,0
	ld	A,(wFadeLevel)
	or	A,A
	jrl	Z,FadePalettes.skip
	cp	A,0x7F
	scf
	jrl	Z,FadePalettes.skip2
	cp	A,0x81
	rcf
	jr	Z,FadePalettes.skip2
	ld	L,A
	sll	1,L
	jr	NC,FadePalettes.loop2
FadePalettes.loop:
	ld	WA,(XIY+)
	ld	BC,WA
	and	BC,0xF
	mul	XBC,HL
	and	B,0xF
	ld	E,B
	ld	BC,WA
	and	BC,0xF0
	mul	XBC,HL
	and	B,0xF0
	or	E,B
	ld	BC,WA
	and	BC,0xF00
	mul	XBC,HL
	ld	D,QC
	ld	(XIX+),DE
	djnz	QHL,FadePalettes.loop
	pop	XIY
	pop	XIX
	ret
FadePalettes.loop2:
	ld	WA,(XIY+)
	ld	BC,WA
	and	BC,0xF
	xor	C,0xF
	mul	XBC,HL
	and	B,0xF
	add	A,B
	ld	BC,WA
	and	BC,0xF0
	xor	C,0xF0
	mul	XBC,HL
	and	B,0xF0
	add	A,B
	ld	BC,WA
	and	BC,0xF00
	xor	B,0xF
	mul	XBC,HL
	add	W,QC
	ld	(XIX+),WA
	djnz	QHL,FadePalettes.loop2
	pop	XIY
	pop	XIX
	ret
FadePalettes.skip:
	ld	BC,QHL
	ldirw	(XIX+),(XIY+)
	pop	XIY
	pop	XIX
	ret
FadePalettes.skip2:
	sbc	WA,WA
FadePalettes.loop3:
	ld	(XIX+),WA
	djnz	QHL,FadePalettes.loop3
	pop	XIY
	pop	XIX
	ret

c_2066DE	section	code abs=0x2066DE

; [code] the monochrome counterpart of FadePalettes (only when wColorFlags < 0x10): wMonoPalShadow -> 0x8100 (0x19 bytes) scaled by wFadeLevel (0 copy, 0x7F / 0x81 all one shade)
FadeMonoPalettes:
	cpb	(wColorFlags),0x10
	ret	NC
	push	XIX
	push	XIY
	ld	XIY,wMonoPalShadow
	ld	XIX,0x8100
	ld	QHL,0x19
	ld	HL,0
	ld	A,(wFadeLevel)
	or	A,A
	jr	Z,FadeMonoPalettes.skip
	cp	A,0x7F
	rcf
	jr	Z,FadeMonoPalettes.skip2
	cp	A,0x81
	scf
	jr	Z,FadeMonoPalettes.skip2
	ld	L,A
	sll	1,L
	cpl	L
	jr	C,FadeMonoPalettes.loop2
FadeMonoPalettes.loop:
	ld	A,(XIY+)
	and	WA,7
	mul	XWA,HL
	and	W,7
	or	W,0x80
	ld	(XIX+),W
	djnz	QHL,FadeMonoPalettes.loop
	pop	XIY
	pop	XIX
	ret
FadeMonoPalettes.loop2:
	ld	A,(XIY+)
	and	WA,7
	ld	C,A
	xor	A,7
	mul	XWA,HL
	add	W,C
	and	W,7
	or	W,0x80
	ld	(XIX+),W
	djnz	QHL,FadeMonoPalettes.loop2
	pop	XIY
	pop	XIX
	ret
FadeMonoPalettes.skip:
	ld	BC,QHL
	ldir	(XIX+),(XIY+)
	pop	XIY
	pop	XIX
	ret
FadeMonoPalettes.skip2:
	sbc	W,W
	and	W,7
	or	W,0x80
FadeMonoPalettes.loop3:
	ld	(XIX+),W
	djnz	QHL,FadeMonoPalettes.loop3
	pop	XIY
	pop	XIX
	ret

c_206863	section	code abs=0x206863

; [code] ResetScr1Palettes + ResetScr2Palettes + ResetSpritePalettes
ResetAllPalettes:
	call	ResetScr1Palettes
	call	ResetScr2Palettes
	jp	ResetSpritePalettes

c_20686F	section	code abs=0x20686F

; [code] ResetScr1Palettes + ResetScr2Palettes (no sprite palettes)
ResetBgPalettes:
	call	ResetScr1Palettes
	jp	ResetScr2Palettes

c_206877	section	code abs=0x206877

; [code] same as ResetSpritePalettes but for SCR1: 15 x 0xFFF + Pal_21F010 into 0x58F6 (= wPalShadow+0x80 = LoadPalettes slot 0x10, the slot LoadImagePalette uses for SCR1), mono 0x5865 (= LoadMonoPalettes entries 2-3, SCR1 in LoadImagePalette) = 0 + MonoPal_21F018; 0x585C = ~wFadeLevel
ResetScr1Palettes:
	ld	WA,0xFFF
	ld	XDE,wPalShadow+0x80
	ld	C,0x3C
ResetScr1Palettes.loop:
	ld	(XDE+),WA
	djnz	C,ResetScr1Palettes.loop
	ld	XHL,Pal_21F010
	ld	BC,4
	ldirw	(XDE+),(XHL+)
	ld	A,0
	ld	XDE,wMonoPalShadow+8
	ld	C,4
ResetScr1Palettes.loop2:
	ld	(XDE+),A
	djnz	C,ResetScr1Palettes.loop2
	ld	XHL,MonoPal_21F018
	ld	BC,4
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(wFadeLevelShown),A
	ret

c_2068B3	section	code abs=0x2068B3

; [code] same for SCR2: 0x5976 (= wPalShadow+0x100 = slot 0x20, SCR2 in LoadImagePalette) and mono 0x586D (entries 4-5); callers ResetAllPalettes, ResetBgPalettes, StreetGoWorks
ResetScr2Palettes:
	ld	WA,0xFFF
	ld	XDE,wPalShadow+0x100
	ld	C,0x3C
ResetScr2Palettes.loop:
	ld	(XDE+),WA
	djnz	C,ResetScr2Palettes.loop
	ld	XHL,Pal_21F010
	ld	BC,4
	ldirw	(XDE+),(XHL+)
	ld	A,0
	ld	XDE,wMonoPalShadow+0x10
	ld	C,4
ResetScr2Palettes.loop2:
	ld	(XDE+),A
	djnz	C,ResetScr2Palettes.loop2
	ld	XHL,MonoPal_21F018
	ld	BC,4
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(wFadeLevelShown),A
	ret

c_2068EF	section	code abs=0x2068EF

; [code] sprite palettes in wPalShadow: 15 x 0xFFF, palette 15 = Pal_21F010; mono 0x585D
ResetSpritePalettes:
	ld	WA,0xFFF
	ld	XDE,wPalShadow
	ld	C,0x3C
ResetSpritePalettes.loop:
	ld	(XDE+),WA
	djnz	C,ResetSpritePalettes.loop
	ld	XHL,Pal_21F010
	ld	BC,4
	ldirw	(XDE+),(XHL+)
	ld	A,0
	ld	XDE,wMonoPalShadow
	ld	C,4
ResetSpritePalettes.loop2:
	ld	(XDE+),A
	djnz	C,ResetSpritePalettes.loop2
	ld	XHL,MonoPal_21F018
	ld	BC,4
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(wFadeLevelShown),A
	ret

c_206D9E	section	code abs=0x206D9E

; A = first slot, C = count, XHL = data (4 colours each)
LoadPalettes:
	cp	A,0x30
	ret	NC
	ld	W,A
	add	W,C
	cp	W,0x40
	jr	LE,LoadPalettes.skip
	ld	C,0x40
	sub	C,A
LoadPalettes.skip:
	ld	XDE,0
	ld	E,A
	sll	3,DE
	add	DE,wPalShadow
	ld	B,0
	sll	2,BC
	ldirw	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(wFadeLevelShown),A
	ret

c_206DCD	section	code abs=0x206DCD

; A = first entry, C = count, XHL = data (4 bytes each)
LoadMonoPalettes:
	cp	A,6
	ret	NC
	ld	W,A
	add	W,C
	cp	W,6
	jr	LE,LoadMonoPalettes.skip
	ld	C,6
	sub	C,A
LoadMonoPalettes.skip:
	ld	XDE,0
	ld	E,A
	sll	2,DE
	add	DE,wMonoPalShadow
	ld	B,0
	sll	2,BC
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(wFadeLevelShown),A
	ret
	db	0x00,0x02,0x04,0x06,0x00,0x00,0x03,0x07,0x00,0x02,0x04,0x06,0x00,0x00,0x03,0x07
	db	0x00,0x02,0x04,0x06,0x00,0x00,0x03,0x07

c_216E31	section	code abs=0x216E31

; [code] wFadeLevel = 0 (FadePalettes copies the palettes unchanged)
SetFadeNormal:
	push	A
	ld	A,0
	ld	(wFadeLevel),A
	pop	A
	ret

c_216E3A	section	code abs=0x216E3A

; [code] wFadeLevel = 0x81 (FadePalettes: all colours 0)
SetFadeBlack:
	push	A
	ld	A,0x81
	ld	(wFadeLevel),A
	pop	A
	ret

c_216E43	section	code abs=0x216E43

; [code] wFadeLevel += A towards 0 (from the 0x81.. dark range); A = 1 while fading, 0 once it reaches 0
FadeInFromBlackStep:
	push	W
	ld	W,(wFadeLevel)
	add	W,A
	cp	W,0
	jr	Z,FadeInFromBlackDone
	bit	7,W
	jr	Z,FadeInFromBlackDone
	ld	(wFadeLevel),W
	ld	A,1
	jr	FadeInFromBlackDone.skip

c_216E5C	section	code abs=0x216E5C

; [code] FadeInFromBlackStep reached 0: wFadeLevel = 0, A = 0
FadeInFromBlackDone:
	ld	W,0
	ld	(wFadeLevel),W
	ld	A,0
FadeInFromBlackDone.skip:
	pop	W
	ret

c_216E67	section	code abs=0x216E67

; [code] wFadeLevel -= A towards 0x81; A = 1 while fading, 0 once black (0x81)
FadeToBlackStep:
	push	W
	ld	W,(wFadeLevel)
	sub	W,A
	cp	W,0x81
	jr	Z,FadeToBlackDone
	bit	7,W
	jr	Z,FadeToBlackDone
	ld	(wFadeLevel),W
	ld	A,1
	jr	FadeToBlackDone.skip

c_216E81	section	code abs=0x216E81

; [code] FadeToBlackStep reached black: wFadeLevel = 0x81, A = 0
FadeToBlackDone:
	ld	W,0x81
	ld	(wFadeLevel),W
	ld	A,0
FadeToBlackDone.skip:
	pop	W
	ret

c_216E8C	section	code abs=0x216E8C

; [code] wFadeLevel = 0x7F (FadePalettes: all colours 0xFFF)
SetFadeWhite:
	push	A
	ld	A,0x7F
	ld	(wFadeLevel),A
	pop	A
	ret

c_216E95	section	code abs=0x216E95

; [code] wFadeLevel -= A towards 0 (from the 0x7F.. bright range); A = 1 while fading, 0 at 0
FadeInFromWhiteStep:
	push	W
	ld	W,(wFadeLevel)
	sub	W,A
	cp	W,0
	jr	Z,FadeInFromWhiteStep.skip
	bit	7,W
	jr	NZ,FadeInFromWhiteStep.skip
	ld	(wFadeLevel),W
	ld	A,1
	jr	FadeInFromWhiteStep.skip2
FadeInFromWhiteStep.skip:
	ld	W,0
	ld	(wFadeLevel),W
	ld	A,0
FadeInFromWhiteStep.skip2:
	pop	W
	ret

c_216EB9	section	code abs=0x216EB9

; [code] wFadeLevel += A towards 0x7F; A = 1 while fading, 0 once white (0x7F)
FadeToWhiteStep:
	push	W
	ld	W,(wFadeLevel)
	add	W,A
	cp	W,0x7F
	jr	Z,FadeToWhiteStep.skip
	bit	7,W
	jr	NZ,FadeToWhiteStep.skip
	ld	(wFadeLevel),W
	ld	A,1
	jr	FadeToWhiteStep.skip2
FadeToWhiteStep.skip:
	ld	W,0x7F
	ld	(wFadeLevel),W
	ld	A,0
FadeToWhiteStep.skip2:
	pop	W
	ret

c_20E1E7	section	code abs=0x20E1E7

; [code] XHL = colours, BC = palette count, WA = first palette: copies BC*4 words straight into palette RAM 0x8200 + 8*WA and sets wFadeLevelShown = wFadeLevel (no shadow, no fade pass)
WritePalettesDirect:
	push	XDE
	push	XHL
	extz	BC
	sll	2,BC
	extz	WA
	extz	XWA
	sll	3,XWA
	ld	XDE,SPRITE_PAL
	add	XDE,XWA
	ldirw	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	ld	(wFadeLevelShown),A
	pop	XHL
	pop	XDE
	ret

c_20E209	section	code abs=0x20E209

; [code] the monochrome counterpart of WritePalettesDirect: BC*4 bytes into 0x8100 + 4*WA, wFadeLevelShown = wFadeLevel
WriteMonoPalettesDirect:
	push	XDE
	push	XHL
	extz	BC
	sll	2,BC
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XDE,SPPLT_01-1
	add	XDE,XWA
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	ld	(wFadeLevelShown),A
	pop	XHL
	pop	XDE
	ret
