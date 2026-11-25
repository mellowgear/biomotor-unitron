; engine/scenes: 47 routines (each keeps its ROM address in its own section)

c_20E141	section	code abs=0x20E141

; [code+play] frame set by swp_20E131 (0x5DF7 = 2): cursor at x 0x58 + 0x20*(0x5DF7-1), D_LEFT 0x5DF7 = 1, D_RIGHT = 2 (sound 0x80), A -> sound 0x81 + EndTask, B -> 0x5DF7 = 0 + EndTask; callers MainMenuLoadTask and works.asm 463/631/665 all test 0x5DF7 == 1 after "Load/Save/Over/Clear Ok? Yes No" (sub_20DF80/sub_20E012 texts 0x20DFCE..0x20E001)
YesNoPromptInput:
	ld	C,(wYesNoChoice)
	dec	1,C
	mul	BC,0x20
	add	BC,0x58
	ld	DE,0x44
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	bit	BIT_D_LEFT,A
	jr	NZ,YesNoPromptInput.skip
	bit	3,A
	jr	NZ,YesNoPromptInput.skip2
	bit	4,A
	jr	NZ,YesNoPromptInput.skip3
	bit	5,A
	jr	NZ,YesNoPromptInput.skip4
	ret
YesNoPromptInput.skip:
	cpb	(wYesNoChoice),1
	ret	Z
	ld	WA,0x80
	call	SoundCommand
	ldb	(wYesNoChoice),1
	ret
YesNoPromptInput.skip2:
	cpb	(wYesNoChoice),2
	ret	Z
	ld	WA,0x80
	call	SoundCommand
	ldb	(wYesNoChoice),2
	ret
YesNoPromptInput.skip3:
	ld	WA,0x81
	call	SoundCommand
	call	EndTask
	ret
YesNoPromptInput.skip4:
	ld	WA,0x82
	call	SoundCommand
	ldb	(wYesNoChoice),0
	call	EndTask
	ret

c_20E1BC	section	code abs=0x20E1BC

swp_20E1BC:
	ldw	(XIZ+0x12),0x1E
	ldw	(XIZ+TASK_FUNC),0xE1CB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	decw	1,(XIZ+0x12)
	jp	Z,EndTask
	ret

c_20E1D4	section	code abs=0x20E1D4

dyn_20E1D4:
	cpw	(XIZ+4),0
	jp	Z,EndTask
	decw	1,(XIZ+TASK_ARG)
	jp	Z,EndTask
	ret

c_20E1E7	section	code abs=0x20E1E7

dyn_20E1E7:
	push	XDE
	push	XHL
	extz	BC
	sll	2,BC
	extz	WA
	extz	XWA
	sll	3,XWA
	ld	XDE,0x8200
	add	XDE,XWA
	ldirw	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	ld	(0x585C),A
	pop	XHL
	pop	XDE
	ret

c_20E209	section	code abs=0x20E209

dyn_20E209:
	push	XDE
	push	XHL
	extz	BC
	sll	2,BC
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XDE,0x8100
	add	XDE,XWA
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	ld	(0x585C),A
	pop	XHL
	pop	XDE
	ret

c_20E22B	section	code abs=0x20E22B

dyn_20E22B:
	ldw	(XIZ+0x16),0
	ld	A,(XIZ+0x14)
	sub	A,(XIZ+0x12)
	exts	WA
	ld	(XIZ+0x1A),WA
	ldw	(XIZ+TASK_FUNC),0xE245
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+0x1A)
	muls	WA,(XIZ+0x16)
	divs	WA,(XIZ+TASK_ARG)
	add	A,(XIZ+0x12)
	ld	(wFadeLevel),A
	incw	1,(XIZ+0x16)
	ld	WA,(XIZ+0x16)
	cp	WA,(XIZ+TASK_ARG)
	jp	GT,EndTask
	ret

c_20E264	section	code abs=0x20E264

dyn_20E264:
	ld	XHL,IntroSequence
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),0xE278
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20E278	section	code abs=0x20E278

dyn_20E278:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	NZ,dyn_20E28C
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ret

c_20E28C	section	code abs=0x20E28C

dyn_20E28C:
	call	dyn_20636D
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ret

c_20E29B	section	code abs=0x20E29B

dyn_20E29B:
	ldw	(XIZ+TASK_ARG),0x258
	ldw	(XIY+0xE),0
	ldw	(XIZ+TASK_FUNC),0xE2B0
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20E3AF	section	code abs=0x20E3AF

; [play] all intro screens and the title
IntroBackground:
	ldb	(0x5CE2),0
	ldb	(0x584B),0
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ldb	(wFadeLevel),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XHL,dyn_20E264
	call	StartChildTask
	task_wait
	ld	XHL,TitleRevealSequence
	call	StartChildTask
	task_wait
	ld	XHL,Map_2E513D
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,0x20E414
	ld	XHL,Map_2E573D
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),5
	task_wait
	ld	XHL,Map_2E4EE3
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,0x20E44E
	ld	XHL,Map_2E54E3
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	ld	XHL,dyn_20E29B
	call	StartChildTask
	task_wait
	cpw	(XIZ+TASK_ARG),0
	jrl	Z,IntroBackground
	ldb	(0x5CE2),1
	ldb	(0x584B),0
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	call	EndTask
	ret

c_20E496	section	code abs=0x20E496

; [play] task: Yumekobo logo, planet, meteor, cockpit, BIO/MOTOR/UNITRON letters (intro_* screens)
IntroSequence:
	ld	XWA,0x11
	call	PlayMusic
	ld	XHL,IntroLogoScene
	call	StartChildTask
	task_wait
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(0x584B),0
	ldb	(0x584D),0
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	ldb	(wFadeLevel),0
	ld	WA,0x31
	call	SoundCommand
	ld	XHL,Intro199YearsAgo
	call	StartChildTask
	task_wait
	calr	IntroPlanetGraphics
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x12C
	task_wait
	ld	XHL,swp_20EB87
	call	StartChildTask
	task_wait
	ld	WA,0xAF
	call	SoundCommand
	ld	XHL,swp_20EAA6
	call	StartChildTask
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x5A
	task_wait
	calr	IntroLettersGraphics
	ld	XHL,IntroBioLetters
	call	StartChildTask
	task_wait
	ld	XHL,swp_20EBF9
	call	StartChildTask
	task_wait
	ld	XHL,IntroMotorScene
	call	StartChildTask
	task_wait
	ld	XHL,swp_20EBF9
	call	StartChildTask
	task_wait
	ld	XHL,IntroUnitronScene
	call	StartChildTask
	task_wait
	ld	XHL,swp_20EBF9
	call	StartChildTask
	task_wait
	ld	XHL,IntroMotorUnitronLetters
	call	StartChildTask
	task_wait
	ld	XHL,swp_20EBF9
	call	StartChildTask
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	ld	XHL,swp_20EC21
	call	StartChildTask
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
	task_wait
	ld	XHL,IntroCockpitScene
	call	StartChildTask
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	ld	XHL,IntroCockpitAnim
	call	StartChildTask
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x1E
	task_wait
	call	EndTask
	ret

c_20E6E4	section	code abs=0x20E6E4

; [play] intro_199_years_ago
Intro199YearsAgo:
	ldb	(wFadeLevel),0x7F
	ldb	(0x584B),0
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(wFadeLevel),0
	ld	A,0x10
	ld	C,1
	ld	XHL,Pal_2DE017
	call	LoadPalettes
	ld	A,2
	ld	C,1
	ld	XHL,MonoPal_2DE027
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DE3A7
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,Map_2DE033
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0x168
	ldw	(XIZ+TASK_FUNC),0xE753
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ldb	(wFadeLevel),0
	ret

c_20E753	section	code abs=0x20E753

; [code] frame function of Intro199YearsAgo: Map_2DE32D (Planet "Elscea") at 0xB4, fade at 0
Intro199YearsAgoStep:
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xB4
	jr	Z,Intro199YearsAgoStep.skip
	ret
Intro199YearsAgoStep.skip:
	ld	WA,0xC
	ld	XHL,Map_2DE32D
	ld	BC,0
	ld	DE,9
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_FUNC),0xE779
	ldw	(XIZ+TASK_FUNC_HI),0x20
	decw	1,(XIZ+TASK_ARG)
	jr	Z,Intro199YearsAgoStep.skip2
	ret
Intro199YearsAgoStep.skip2:
	ldb	(wFadeLevel),0x81
	call	EndTask
	ret

c_20E7FF	section	code abs=0x20E7FF

; [play] intro_title_reveal
IntroTitleScene:
	ldb	(wFadeLevel),0x7F
	ldb	(0x584B),0
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(wFadeLevel),0
	ld	A,0
	ld	C,9
	ld	XHL,Pal_2E3F68
	call	LoadPalettes
	ld	A,0x10
	ld	C,9
	ld	XHL,Pal_2E3F68
	call	LoadPalettes
	ld	A,0x20
	ld	C,0xA
	ld	XHL,Pal_2E4D3F
	call	LoadPalettes
	ld	A,0
	ld	C,2
	ld	XHL,MonoPal_2E3FB0
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2E3FB0
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,MonoPal_2E4D8F
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2E42CE
	call	LoadCompressedTiles
	ld	WA,0xE7
	ld	XHL,Gfx_2E5997
	call	LoadCompressedTiles
	ld	XHL,Map_2E4240
	ld	WA,0xC
	ld	BC,0
	ld	DE,0x11
	call	DrawTilemapScr1
	ret

c_20E89B	section	code abs=0x20E89B

; [code+play] Map_2E3FB8 (row 1) and Map_2E405A (row 13) slide in from opposite sides
SlideInTitleBanners:
	ldb	(wFadeLevel),0
	ldw	(XIZ+TASK_ARG),0xFFEC
	ldw	(XIZ+0x10),0x14
	ldw	(XIZ+TASK_FUNC),0xE8B4
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,0xC
	ld	XHL,Map_2E3FB8
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,1
	call	DrawTilemapScr1
	ld	WA,0xC
	ld	XHL,Map_2E405A
	ld	BC,(XIZ+0x10)
	ld	DE,0xD
	call	DrawTilemapScr1
	decw	1,(XIZ+0x10)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),1
	jp	GE,EndTask
	ret

c_20E8E8	section	code abs=0x20E8E8

dyn_20E8E8:
	ldw	(XIZ+TASK_ARG),0xFFEC
	ldw	(XIZ+0x10),0x14
	ldw	(XIZ+TASK_FUNC),0xE8FC
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,0xC
	ld	XHL,Map_2E40FC
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,5
	call	DrawTilemapScr1
	ld	WA,0xC
	ld	XHL,Map_2E419E
	ld	BC,(XIZ+0x10)
	ld	DE,9
	call	DrawTilemapScr1
	decw	1,(XIZ+0x10)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),1
	jp	GE,EndTask
	ret

c_20E96C	section	code abs=0x20E96C

; [play] ran on yumekobo_logo, intro_199_years_ago
IntroLogoScene:
	ldb	(wFadeLevel),0x7F
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	ld	WA,0xC
	ld	C,0
	ld	E,0
	ld	B,0x20
	ld	D,0x13
	call	sub_206768
	ld	A,0x10
	ld	C,2
	ld	XHL,Pal_2DD54D
	call	LoadPalettes
	ld	A,0x20
	ld	C,2
	ld	XHL,Pal_2DD54D
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2DD55D
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,MonoPal_2DD55D
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DDAB9
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,Map_2DD7BF
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_ARG),0xFFE8
	ldb	(wFadeLevel),0x7F
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0x7F
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x28
	task_wait
	ldw	(XIZ+TASK_FUNC),0xEA46
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,0xC
	ld	XHL,Map_2DD565
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,3
	call	DrawTilemapScr1
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0x14
	ret	NZ
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
	task_wait
	call	EndTask
	ret

c_20EAA6	section	code abs=0x20EAA6

swp_20EAA6:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+0x12),0x3C
	ldw	(XIZ+0x18),0
	ldw	(XIZ+TASK_FUNC),0xEAC4
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+0x18)
	cp	WA,7
	jr	NZ,swp_20EAA6.skip
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
swp_20EAA6.skip:
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	2,XHL
	add	XHL,Data_226B99
	ld	HL,(XHL)
	extz	XHL
	sll	3,XHL
	add	XHL,Data_226B69
	ld	BC,(XHL+4)
	ld	DE,(XHL+6)
	ld	XHL,(XHL)
	ld	WA,0xC
	call	DrawTilemapScr2
	incw	1,(XIZ+0x18)
	decw	1,(XIZ+0x12)
	jp	Z,EndTask
	ret

c_20EB17	section	code abs=0x20EB17

; [code] Gfx_2DEB58 + Map_2DE660 (the planet) on SCR1, after Intro199YearsAgo
IntroPlanetGraphics:
	ld	A,0
	ld	C,3
	ld	XHL,Pal_2DE648
	call	LoadPalettes
	ld	A,0x10
	ld	C,3
	ld	XHL,Pal_2DE648
	call	LoadPalettes
	ld	A,0x20
	ld	C,3
	ld	XHL,Pal_2DE648
	call	LoadPalettes
	ld	A,0
	ld	C,2
	ld	XHL,MonoPal_2DE027
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2DE027
	call	LoadMonoPalettes
	ld	A,4
	ld	C,3
	ld	XHL,MonoPal_2DE027
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DEB58
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,Map_2DE660
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldb	(wFadeLevel),0
	ret

c_20EB87	section	code abs=0x20EB87

swp_20EB87:
	ldw	(XIZ+TASK_ARG),0xA0
	ldw	(XIZ+0x10),0x18
	ldw	(XIZ+0x12),0x78
	ldw	(XIZ+0x14),1
	ldw	(XIZ+0x16),2
	ldw	(XIZ+0x18),0
	ldw	(XIZ+TASK_FUNC),0xEBAF
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,0xC
	ld	HL,(XIZ+0x18)
	srl	1,HL
	and	HL,3
	sll	2,HL
	extz	XHL
	add	XHL,Data_226B59
	ld	XHL,(XHL)
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,(XIZ+0x10)
	incw	1,(XIZ+0x18)
	decw	1,(XIZ+0x12)
	jp	Z,EndTask
	call	dyn_2069C8
	decw	1,(XIZ+0x14)
	jr	NZ,swp_20EB87.skip
	ldw	(XIZ+0x14),1
	decw	1,(XIZ+TASK_ARG)
swp_20EB87.skip:
	decw	1,(XIZ+0x16)
	jr	NZ,swp_20EB87.done
	ldw	(XIZ+0x16),2
	incw	1,(XIZ+0x10)
swp_20EB87.done:
	ret

c_20EBF9	section	code abs=0x20EBF9

swp_20EBF9:
	ldw	(XIZ+TASK_ARG),0x14
	ld	WA,0x17C
	ld	XHL,Map_2E3616
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_FUNC),0xEC18
	ldw	(XIZ+TASK_FUNC_HI),0x20
	decw	1,(XIZ+TASK_ARG)
	jp	Z,EndTask
	ret

c_20EC21	section	code abs=0x20EC21

swp_20EC21:
	ldw	(XIZ+TASK_ARG),0x14
	ld	WA,0x17C
	ld	XHL,Map_2E3910
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_FUNC),0xEC40
	ldw	(XIZ+TASK_FUNC_HI),0x20
	decw	1,(XIZ+TASK_ARG)
	jp	Z,EndTask
	ret

c_20EC49	section	code abs=0x20EC49

; [code] dyn_206768 fill 0x20 x 0x20 with 0 on SCR1
ClearTilemapScr1:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0x20
	ld	D,0x20
	call	sub_206768
	ret

c_20EC58	section	code abs=0x20EC58

; [code] same on SCR2
ClearTilemapScr2:
	ld	WA,0
	ld	C,0
	ld	E,0x20
	ld	B,0x20
	ld	D,0x20
	call	sub_206768
	ret

c_20EC67	section	code abs=0x20EC67

; [play] intro_cockpit
IntroCockpitScene:
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	A,0x10
	ld	C,0xC
	ld	XHL,Pal_2DB37F
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2DB3CF
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DC0C7
	call	LoadCompressedTiles
	ld	XHL,Map_2DB3D7
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,IntroCockpitScene.skip
	ld	XHL,Map_2DBA4F
IntroCockpitScene.skip:
	ld	WA,0xC
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldb	(wFadeLevel),0
	ldw	(XIZ+TASK_FUNC),0xECCB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20ECCB	section	code abs=0x20ECCB

swp_20ECCB:
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(0x584B),A
	ldb	(0x584D),(XIZ+0x10)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xC0
	jp	Z,EndTask
	ret

c_20ECE8	section	code abs=0x20ECE8

; [code] started by IntroSequence right after IntroCockpitScene: cycles 4 SCR1 tilemaps from table 0x226B2D (colour) / 0x226B3D (mono, wColorFlags bit 4) at column 0x17 row 7 over the cockpit picture, 4 frames each, then EndTask; ran on intro_cockpit_helmet
IntroCockpitAnim:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0xECFC
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	HL,(XIZ+TASK_ARG)
	sll	2,HL
	extz	XHL
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,IntroCockpitAnim.skip
	add	XHL,IntroCockpitFramesMono
	jr	IntroCockpitAnim.skip2
IntroCockpitAnim.skip:
	add	XHL,IntroCockpitFrames
IntroCockpitAnim.skip2:
	ld	XHL,(XHL)
	ld	WA,0xC
	ld	BC,0x17
	ld	DE,7
	call	DrawTilemapScr1
	incw	1,(XIZ+0x10)
	cpw	(XIZ+0x10),4
	jr	NZ,IntroCockpitAnim.done
	ldw	(XIZ+0x10),0
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),4
	jp	Z,EndTask
IntroCockpitAnim.done:
	ret

c_20ED46	section	code abs=0x20ED46

; [code] Gfx_2DFF62 at tile 0x12C for the MOTOR/UNITRON letter maps
IntroLettersGraphics:
	ld	A,0
	ld	C,7
	ld	XHL,Pal_2DF63C
	call	LoadPalettes
	ld	A,0x10
	ld	C,7
	ld	XHL,Pal_2DF63C
	call	LoadPalettes
	ld	A,0x20
	ld	C,7
	ld	XHL,Pal_2DF63C
	call	LoadPalettes
	ld	A,0
	ld	C,2
	ld	XHL,MonoPal_2DE027
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2DE027
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,MonoPal_2DE027
	call	LoadMonoPalettes
	ld	WA,0x12C
	ld	XHL,Gfx_2DFF62
	call	LoadCompressedTiles
	ld	WA,0x17C
	ld	XHL,Gfx_2E3C0A
	call	LoadCompressedTiles
	ldb	(wFadeLevel),0
	ret

c_20EDB2	section	code abs=0x20EDB2

; [play] intro_bio_letters
IntroBioLetters:
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	WA,0xC
	ld	XHL,Gfx_2E231F
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,Map_2DF674
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,Map_2E2025
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0xEDF8
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(0x584B),A
	ldb	(0x584D),(XIZ+0x10)
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xFF88
	jr	Z,IntroBioLetters.skip
	ret
IntroBioLetters.skip:
	calr	ClearTilemapScr1
	call	EndTask
	ret

c_20EE1A	section	code abs=0x20EE1A

; [code] SCR2 Map_2DF96E ("MOTOR"), SCR1 Map_2E2B88 scrolled; started by IntroSequence
IntroMotorScene:
	calr	ClearTilemapScr2
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	XHL,Gfx_2E2E82
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,Map_2DF96E
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,Map_2E2B88
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0xEE60
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(0x584B),A
	ldb	(0x584D),(XIZ+0x10)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0x30
	jr	Z,IntroMotorScene.skip
	ret
IntroMotorScene.skip:
	calr	ClearTilemapScr1
	call	EndTask
	ret

c_20EE82	section	code abs=0x20EE82

; [code] SCR2 Map_2DFC68 ("UNITRON"), SCR1 Map_2E1008 scrolled the other way
IntroUnitronScene:
	calr	ClearTilemapScr2
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	XHL,Gfx_2E1302
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,Map_2DFC68
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,Map_2E1008
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0xEEC8
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(0x584B),A
	ldb	(0x584D),(XIZ+0x10)
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xFFD0
	jr	Z,IntroUnitronScene.skip
	ret
IntroUnitronScene.skip:
	calr	ClearTilemapScr1
	call	EndTask
	ret

c_20EEEA	section	code abs=0x20EEEA

; [play] intro_motor_letters, intro_unitron_letters
IntroMotorUnitronLetters:
	calr	ClearTilemapScr2
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	XHL,Gfx_2E0426
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,Map_2DF674
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,Map_2E012C
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0xFF4C
	ld	XHL,CycleIntroLetters
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),0xEF39
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ldb	(0x584B),(XIZ+TASK_ARG)
	ld	WA,(XIZ+0x10)
	srl	1,WA
	ld	(0x584D),A
	incw	1,(XIZ+0x10)
	cpw	(XIZ+0x10),0
	jr	Z,IntroMotorUnitronLetters.skip
	ret
IntroMotorUnitronLetters.skip:
	ldb	(0x584B),0
	ldb	(0x584D),0
	calr	ClearTilemapScr1
	call	EndTask
	ret

c_20EF65	section	code abs=0x20EF65

; [code] child of IntroMotorUnitronLetters: SCR2 tilemap cycles through table 0x226B4D = Map_2DF674 (BIO, IntroBioLetters), Map_2DF96E (MOTOR), Map_2DFC68 (UNITRON) at base 0x12C, interval 0x14 frames shrinking by 2 to 4; ends when its parent link (XIZ+4) is cleared
CycleIntroLetters:
	ldw	(XIZ+0x14),0
	ldw	(XIZ+0x16),0x14
	ldw	(XIZ+0x18),0
	ldw	(XIZ+TASK_FUNC),0xEF7E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpw	(XIZ+4),0
	jp	Z,EndTask
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	2,XHL
	add	XHL,IntroLetterMaps
	ld	XHL,(XHL)
	ld	WA,0x12C
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	incw	1,(XIZ+0x14)
	ld	WA,(XIZ+0x14)
	cp	WA,(XIZ+0x16)
	jr	GT,CycleIntroLetters.skip
	ret
CycleIntroLetters.skip:
	ldw	(XIZ+0x14),0
	decw	2,(XIZ+0x16)
	cpw	(XIZ+0x16),4
	jr	GT,CycleIntroLetters.skip2
	ldw	(XIZ+0x16),4
CycleIntroLetters.skip2:
	incw	1,(XIZ+0x18)
	cpw	(XIZ+0x18),3
	jr	LT,CycleIntroLetters.done
	ldw	(XIZ+0x18),0
CycleIntroLetters.done:
	ret

c_20EFD3	section	code abs=0x20EFD3

; [code] started by NewGameSetup (task_wait, then StreetGoWorks): wFadeLevel 0x81, ClearTilemapScr1/2, PlayMusic 4, then TASK_FUNC = 0x20EFF4 = StorySceneUnitice (DrawPortrait 0x2E + CreditsTask with ItAllBeganWithText 0x225C49)
StorySceneUniticeSetup:
	ldb	(wFadeLevel),0x81
	ldb	(0x5CE2),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XWA,4
	call	PlayMusic
	ldw	(XIZ+TASK_FUNC),0xEFF4
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20EFF4	section	code abs=0x20EFF4

; [code] "It all began with..." / "These crystals called Uni-..."
StorySceneUnitice:
	ld	WA,0x24
	call	SoundCommand
	ld	WA,0xC
	ld	HL,0x2E
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	A,0x20
	ld	C,1
	ld	XHL,Pal_225C3D
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	call	LoadMonoPalettes
	ldb	(wFadeLevel),0
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,ItAllBeganWithText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x81
	task_wait
	calr	ClearTilemapScr2
	ld	WA,0xC
	ld	HL,0x3C
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0x81
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x28
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneUnitice.resume5
	ldb	(XHL+0x14),0xB0
StorySceneUnitice.resume5:
	task_wait
	ld	A,0x20
	ld	C,1
	ld	XHL,Pal_225C3D
	calr	dyn_20E1E7
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	calr	dyn_20E209
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TheseCrystalsCalledUniText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,0x20F143
	ldb	(XHL+0x12),0xB0
	ldb	(XHL+0x14),0x81
	task_wait
	ldb	(0x5CE2),1
	ldb	(0x584B),0
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	HL,EVENT_STAGE_TOWN
	call	SetEventFlag
	call	EndTask
	ret

c_20F179	section	code abs=0x20F179

swp_20F179:
	ldb	(wFadeLevel),0x81
	ldb	(0x5CE2),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XWA,0x12
	call	PlayMusic
	ld	WA,0x33
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),0xF1A4
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20F1A4	section	code abs=0x20F1A4

; [code] "With the destruction of..."
StorySceneDestruction:
	ld	A,0x10
	ld	C,7
	ld	XHL,Pal_2E766D
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2DD55D
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2E79D7
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,Map_2E76DD
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0x81
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x5A
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneDestruction.resume3
	ldb	(XHL+0x14),0xB0
StorySceneDestruction.resume3:
	task_wait
	ld	A,0x20
	ld	C,1
	ld	XHL,Pal_225C3D
	calr	dyn_20E1E7
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	calr	dyn_20E209
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,WithTheDestructionOfText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneDestruction.skip
	ldb	(XHL+0x12),0xB0
StorySceneDestruction.skip:
	ldb	(XHL+0x14),0x81
	task_wait
	calr	ClearTilemapScr1
	ldw	(XIZ+TASK_FUNC),0xF2C1
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20F2C1	section	code abs=0x20F2C1

; [code] "The sun began to..."
StorySceneSunBegan:
	ld	A,0x10
	ld	C,8
	ld	XHL,Pal_2E6618
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2E6698
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2E6C94
	call	LoadCompressedTiles
	ld	XHL,Map_2E66A0
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneSunBegan.skip
	ld	XHL,Map_2E699A
StorySceneSunBegan.skip:
	ld	WA,0xC
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x3C
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0x81
	ldb	(XHL+0x14),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneSunBegan.resume2
	ldb	(XHL+0x14),0xB0
StorySceneSunBegan.resume2:
	task_wait
	ld	A,0x20
	ld	C,1
	ld	XHL,Pal_225C3D
	calr	dyn_20E1E7
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	calr	dyn_20E209
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TheSunBeganToText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneSunBegan.skip2
	ldb	(XHL+0x12),0xB0
StorySceneSunBegan.skip2:
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x3C
	task_wait
	ldb	(wFadeLevel),0x81
	ldw	(XIZ+TASK_FUNC),0xF3E6
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20F3E6	section	code abs=0x20F3E6

; [code] BIO MOTOR UNITRON / PLANNING ... / TO BE CONTINUED
CreditsScreen:
	ld	XWA,0x13
	call	PlayMusic
	ld	WA,0x34
	call	SoundCommand
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	HL,0x2E
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	A,0x20
	ld	C,1
	ld	XHL,Pal_225C3D
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	call	LoadMonoPalettes
	ldb	(wFadeLevel),0
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,BIOMOTORUNITRONPLANNINGText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TOBECONTINUEDText
	ld	(XHL+0xE),XDE
	task_wait
	ld	HL,EVENT_STAGE_ENDING
	call	SetEventFlag
	ld	HL,EVENT_STAGE_LILY
	call	ClearEventFlag
	call	ClearTalkedFlags
	ld	HL,EVENT_CYRIUS_TRADED
	call	CheckEventFlag
	jr	Z,CreditsScreen.skip
	ld	HL,EVENT_BEAT_ENT
	call	ClearEventFlag
	ld	HL,EVENT_BEAT_KRAKEN
	call	ClearEventFlag
	ld	HL,EVENT_BEAT_ROC
	call	ClearEventFlag
	ld	HL,EVENT_BEAT_BEHEMOTH
	call	ClearEventFlag
CreditsScreen.skip:
	ldw	(XIZ+TASK_FUNC),0xF4A5
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	ret	Z
	ldb	(0x5CE2),1
	ld	XHL,dyn_20E22B
	call	StartChildTask
	ldw	(XHL+0xE),0x3C
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x81
	task_wait
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(0x584B),0
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	call	EndTask
	ret

c_20F4F6	section	code abs=0x20F4F6

; [code] "It was the end..."
StorySceneTheEnd:
	ldb	(wFadeLevel),0x81
	ldb	(0x5CE2),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XWA,0x10
	call	PlayMusic
	ld	WA,0x30
	call	SoundCommand
	ld	WA,0xC
	ld	HL,0x37
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ldb	(wFadeLevel),0
	ld	A,0x20
	ld	C,1
	ld	XHL,Pal_225C3D
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	call	LoadMonoPalettes
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,ItWasTheEndText
	ld	(XHL+0xE),XDE
	task_wait
	ldw	(XIZ+TASK_FUNC),0xF56C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	ret	Z
	ldb	(0x5CE2),1
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(0x584B),0
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	call	EndTask
	ret

c_20F599	section	code abs=0x20F599

; [code] GAME OVER
GameOverScreen:
	ldb	(wFadeLevel),0
	call	sub_2067E1
	call	InitTextBoxes
	ld	A,0x2F
	ld	C,1
	ld	XHL,Pal_225C3D
	call	LoadPalettes
	ld	A,5
	ld	C,1
	ld	XHL,MonoPal_225C45
	call	LoadMonoPalettes
	ld	A,0
	ld	C,0x14
	ld	E,0x13
	ld	HL,0xC
	call	OpenTextBoxNoWait
	ld	C,0
	ld	E,0x20
	call	PlaceTextBoxXWA
	ld	A,0
	call	GetTextBox
	ldb	(XWA+6),5
	ldb	(XWA+7),8
	ld	A,0
	call	GetTextBox
	ldb	(XWA+0x10),0x14
	ld	XHL,GAMEOVERText
	ld	(XWA+8),XHL
	ldw	(XIZ+TASK_FUNC),0xF5FF
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	A,0
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,loc_20F61B
	ret

c_20F611	section	code abs=0x20F611

swp_20F611:
	ldw	(XIZ+TASK_FUNC),0xF61B
	ldw	(XIZ+TASK_FUNC_HI),0x20

c_20F61B	section	code abs=0x20F61B

loc_20F61B:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jp	NZ,EndTask
	ret

c_20F628	section	code abs=0x20F628

; [play] staff credits (credits_* screens)
CreditsTask:
	calr	ClearTilemapScr2
	ldb	(0x5855),0
	ld	XDE,wPlayerName
	ld	B,6
	ld	WA,0x16C
	ld	L,(XDE)
	push	B
	push	XDE
	push	WA
	call	dyn_207093
	pop	WA
	pop	XDE
	pop	B
	inc	1,XDE
	inc	2,WA
	djnz	B,0x20F63A
	ld	XDE,wPartnerName
	ld	B,6
	ld	WA,0x173
	ld	L,(XDE)
	push	B
	push	XDE
	push	WA
	call	dyn_207093
	pop	WA
	pop	XDE
	pop	B
	inc	1,XDE
	inc	2,WA
	djnz	B,0x20F659
	ld	WA,0x186
	ld	(XIZ+0x18),WA
	ldb	(XIZ+0x12),0
	ldw	(XIZ+0x14),5
	ld	WA,(XIZ+0x14)
	ld	(XIZ+0x16),WA
	ld	XHL,dyn_20F6E0
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),0xF6AB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	XDE,0x5DF8
	ld	BC,0x100
	extz	XBC
	ldw	(XDE+),0xFFFF
	dec	1,BC
	cp	BC,0
	jr	NZ,0x20F6A0
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	Z,dyn_20F6CA
	calr	ClearTilemapScr2
	call	dyn_20636D
	call	EndTask
	ret

c_20F6CA	section	code abs=0x20F6CA

dyn_20F6CA:
	decw	1,(XIZ+0x16)
	ret	NZ
	ld	WA,(XIZ+0x14)
	ld	(XIZ+0x16),WA
	ld	A,(XIZ+0x12)
	ld	(0x5855),A
	incb	1,(XIZ+0x12)
	ret

c_20F6E0	section	code abs=0x20F6E0

dyn_20F6E0:
	ld	WA,(XIY+0x14)
	cp	(XIY+0x16),WA
	ret	NZ
	ldw	(XIZ+TASK_ARG),0
	ld	A,(XIY+0x12)
	and	A,7
	ret	NZ
	ld	XWA,0
	ld	A,(XIY+0x12)
	srl	3,A
	add	A,0x13
	and	A,0x1F
	sll	6,XWA
	add	XWA,0x9800
	ldw	(XIZ+TASK_ARG),0
	ld	XHL,(XIY+0xE)
	ld	C,(XHL)
	cp	C,0xFE
	jr	Z,0x20F754
	cp	C,0xFF
	jrl	Z,loc_20F7A8
	cp	C,0xFC
	jr	NZ,dyn_20F730
	ld	DE,0x16C
	ld	XBC,wPlayerName
	jr	loc_20F73D
