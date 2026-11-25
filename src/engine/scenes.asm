; engine/scenes: 51 routines (each keeps its ROM address in its own section)

c_20E1D4	section	code abs=0x20E1D4

; [code] child task: ends (EndTask) when its parent (+4) is gone or after TASK_ARG (+0xE, set by the starter) frames; used by IntroSequence, the story scenes and the credits as a timed wait
WaitFramesTask:
	cpw	(XIZ+4),0
	jp	Z,EndTask
	decw	1,(XIZ+TASK_ARG)
	jp	Z,EndTask
	ret

c_20E22B	section	code abs=0x20E22B

; [code] child task: over TASK_ARG (+0xE) frames sets wFadeLevel = +0x12 + (+0x14 - +0x12) * frame / TASK_ARG (the starter sets the from / to levels), then EndTask
FadeLevelTask:
	ldw	(XIZ+0x16),0
	ld	A,(XIZ+0x14)
	sub	A,(XIZ+0x12)
	exts	WA
	ld	(XIZ+0x1A),WA
	ldw	(XIZ+TASK_FUNC),FadeLevelTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),FadeLevelTask.resume >> 16
FadeLevelTask.resume:
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

; [code] IntroBackground's child: starts IntroSequence, then resumes at IntroSkipCheck (0x20E278)
RunIntroTask:
	ld	XHL,IntroSequence
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),IntroSkipCheck & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroSkipCheck >> 16
	ret

c_20E278	section	code abs=0x20E278

; [code] RunIntroTask's resume step: A -> IntroSkip; ends when IntroSequence is done (TASK_CHILDREN = 0)
IntroSkipCheck:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	NZ,IntroSkip
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ret

c_20E28C	section	code abs=0x20E28C

; [code] EndChildTasks (stops IntroSequence and its scenes), EndTask once TASK_CHILDREN = 0
IntroSkip:
	call	EndChildTasks
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ret

c_20E29B	section	code abs=0x20E29B

; [code] TASK_ARG = 0x258 (TitleWaitA's countdown), parent +0xE = 0, then TitleTaskStart
TitleTaskInit:
	ldw	(XIZ+TASK_ARG),0x258
	ldw	(XIY+0xE),0
	ldw	(XIZ+TASK_FUNC),TitleTaskStart & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleTaskStart >> 16
	ret

c_20E3AF	section	code abs=0x20E3AF

; [play] all intro screens and the title
IntroBackground:
	ldb	(0x5CE2),0
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ldb	(wFadeLevel),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XHL,RunIntroTask
	call	StartChildTask
	task_wait
	ld	XHL,TitleRevealSequence
	call	StartChildTask
	task_wait
	ld	XHL,Map_2E513D
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,IntroBackground.skip
	ld	XHL,Map_2E573D
IntroBackground.skip:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),5
	task_wait
	ld	XHL,Map_2E4EE3
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,IntroBackground.skip2
	ld	XHL,Map_2E54E3
IntroBackground.skip2:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	ld	XHL,TitleTaskInit
	call	StartChildTask
	task_wait
	cpw	(XIZ+TASK_ARG),0
	jrl	Z,IntroBackground
	ldb	(0x5CE2),1
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
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
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ld	XHL,WaitFramesTask
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
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x12C
	task_wait
	ld	XHL,IntroMeteorTask
	call	StartChildTask
	task_wait
	ld	WA,0xAF
	call	SoundCommand
	ld	XHL,IntroImpactTask
	call	StartChildTask
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x5A
	task_wait
	calr	IntroLettersGraphics
	ld	XHL,IntroBioLetters
	call	StartChildTask
	task_wait
	ld	XHL,IntroHeadCutTask
	call	StartChildTask
	task_wait
	ld	XHL,IntroMotorScene
	call	StartChildTask
	task_wait
	ld	XHL,IntroHeadCutTask
	call	StartChildTask
	task_wait
	ld	XHL,IntroUnitronScene
	call	StartChildTask
	task_wait
	ld	XHL,IntroHeadCutTask
	call	StartChildTask
	task_wait
	ld	XHL,IntroMotorUnitronLetters
	call	StartChildTask
	task_wait
	ld	XHL,IntroHeadCutTask
	call	StartChildTask
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	ld	XHL,IntroHeadMouthCutTask
	call	StartChildTask
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
	task_wait
	ld	XHL,IntroCockpitScene
	call	StartChildTask
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	ld	XHL,IntroCockpitAnim
	call	StartChildTask
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x1E
	task_wait
	call	EndTask
	ret

c_20E6E4	section	code abs=0x20E6E4

; [play] intro_199_years_ago
Intro199YearsAgo:
	ldb	(wFadeLevel),0x7F
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
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
	ldw	(XIZ+TASK_FUNC),Intro199YearsAgoStep & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),Intro199YearsAgoStep >> 16
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
	ldw	(XIZ+TASK_FUNC),Intro199YearsAgoStep.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),Intro199YearsAgoStep.resume >> 16
Intro199YearsAgoStep.resume:
	decw	1,(XIZ+TASK_ARG)
	jr	Z,Intro199YearsAgoStep.skip2
	ret
Intro199YearsAgoStep.skip2:
	ldb	(wFadeLevel),0x81
	call	EndTask
	ret

c_20E789	section	code abs=0x20E789

; [code+play] IntroTitleScene, title banner tasks, TitleReveal, clear SCR2
TitleRevealSequence:
	calr	IntroTitleScene
	ld	WA,0x32
	call	SoundCommand
	ld	XHL,SlideInTitleBanners
	call	StartChildTask
	task_wait
	ld	XHL,SlideInMiddleTitleBanners
	call	StartChildTask
	task_wait
	ld	XHL,TitleReveal
	call	StartChildTask
	task_wait
	calr	ClearTilemapScr2
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	calr	ClearTilemapScr2
	call	EndTask
	ret

c_20E7FF	section	code abs=0x20E7FF

; [play] intro_title_reveal
IntroTitleScene:
	ldb	(wFadeLevel),0x7F
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
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
	ldw	(XIZ+TASK_FUNC),SlideInTitleBanners.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SlideInTitleBanners.resume >> 16
SlideInTitleBanners.resume:
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

; [code] TitleRevealSequence: Map_2E40FC (row 5) from column -20 and Map_2E419E (row 9) from column 20 slide to the centre on SCR1 (the middle two banners; SlideInTitleBanners does rows 1 and 13); [play] intro_title_reveal (four banners)
SlideInMiddleTitleBanners:
	ldw	(XIZ+TASK_ARG),0xFFEC
	ldw	(XIZ+0x10),0x14
	ldw	(XIZ+TASK_FUNC),SlideInMiddleTitleBanners.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SlideInMiddleTitleBanners.resume >> 16
SlideInMiddleTitleBanners.resume:
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

c_20E930	section	code abs=0x20E930

; [play] intro_title_reveal
TitleReveal:
	ldw	(XIZ+TASK_ARG),0x14
	ldw	(XIZ+TASK_FUNC),TitleReveal.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleReveal.resume >> 16
TitleReveal.resume:
	ld	XHL,Map_2E4D97
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,TitleReveal.skip
	ld	XHL,Map_2E5397
TitleReveal.skip:
	ld	BC,(XIZ+TASK_ARG)
	ld	WA,0xE7
	ld	DE,2
	call	DrawTilemapScr2
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0
	jp	LT,EndTask
	ret

c_20E96C	section	code abs=0x20E96C

; [play] ran on yumekobo_logo, intro_199_years_ago
IntroLogoScene:
	ldb	(wFadeLevel),0x7F
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	ld	WA,0xC
	ld	C,0
	ld	E,0
	ld	B,0x20
	ld	D,0x13
	call	FillScrRect
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
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0x7F
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x28
	task_wait
	ldw	(XIZ+TASK_FUNC),IntroLogoScene.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroLogoScene.resume >> 16
IntroLogoScene.resume:
	ld	WA,0xC
	ld	XHL,Map_2DD565
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,3
	call	DrawTilemapScr1
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0x14
	ret	NZ
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
	task_wait
	call	EndTask
	ret

c_20EAA6	section	code abs=0x20EAA6

; [code] the intro zoom, after IntroMeteorTask and sound 0xAF: 60 frames of Data_226B99 maps on SCR2 (reads past the table from frame 30);
; from frame 7 a FadeLevelTask (0x20 frames, 0 -> 0x7F) fades to white
; [play] seen in play: the meteor hits the planet: a red impact on the blue face grows into white shock rings while the
; screen fades to white (the rings vanish at frame 34, see intro_frames.asm) (was swp_20EAA6)
IntroImpactTask:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+0x12),0x3C
	ldw	(XIZ+0x18),0
	ldw	(XIZ+TASK_FUNC),IntroImpactTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroImpactTask.resume >> 16
IntroImpactTask.resume:
	ld	WA,(XIZ+0x18)
	cp	WA,7
	jr	NZ,IntroImpactTask.skip
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
IntroImpactTask.skip:
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

; [code] IntroSequence after IntroPlanetGraphics: 0x78 frames of a sprite map from Data_226B59 (4 frames, every 2nd frame) at x 0xA0 (- 1 per frame), y 0x18 (+ 1 every 2nd frame), DrawSpriteMap; [play] intro_planet_meteor
IntroMeteorTask:
	ldw	(XIZ+TASK_ARG),0xA0
	ldw	(XIZ+0x10),0x18
	ldw	(XIZ+0x12),0x78
	ldw	(XIZ+0x14),1
	ldw	(XIZ+0x16),2
	ldw	(XIZ+0x18),0
	ldw	(XIZ+TASK_FUNC),IntroMeteorTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroMeteorTask.resume >> 16
IntroMeteorTask.resume:
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
	call	DrawSpriteMap
	decw	1,(XIZ+0x14)
	jr	NZ,IntroMeteorTask.skip
	ldw	(XIZ+0x14),1
	decw	1,(XIZ+TASK_ARG)
IntroMeteorTask.skip:
	decw	1,(XIZ+0x16)
	jr	NZ,IntroMeteorTask.done
	ldw	(XIZ+0x16),2
	incw	1,(XIZ+0x10)
IntroMeteorTask.done:
	ret

c_20EBF9	section	code abs=0x20EBF9

; [code] 20 frames: Map_2E3616 on SCR2 at 0, 0 (tiles from 0x17C; the letters stay on SCR1); IntroSequence runs it after IntroBioLetters, IntroMotorScene, IntroUnitronScene and IntroMotorUnitronLetters
; [play] seen in play: a full-screen cut, black but for a purple three-eyed mechanical head (Map_2E3616) (was swp_20EBF9)
IntroHeadCutTask:
	ldw	(XIZ+TASK_ARG),0x14
	ld	WA,0x17C
	ld	XHL,Map_2E3616
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_FUNC),IntroHeadCutTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroHeadCutTask.resume >> 16
IntroHeadCutTask.resume:
	decw	1,(XIZ+TASK_ARG)
	jp	Z,EndTask
	ret

c_20EC21	section	code abs=0x20EC21

; [code] the IntroHeadCutTask shape with Map_2E3910 (the same head, 9 cells of rows 11-12 differ); IntroSequence runs it once before the fade to white and IntroCockpitScene
; [play] seen in play: the head again with the mouth / jaw line changed (was swp_20EC21)
IntroHeadMouthCutTask:
	ldw	(XIZ+TASK_ARG),0x14
	ld	WA,0x17C
	ld	XHL,Map_2E3910
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_FUNC),IntroHeadMouthCutTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroHeadMouthCutTask.resume >> 16
IntroHeadMouthCutTask.resume:
	decw	1,(XIZ+TASK_ARG)
	jp	Z,EndTask
	ret

c_20EC49	section	code abs=0x20EC49

; [code] FillScrRect fill 0x20 x 0x20 with 0 on SCR1
ClearTilemapScr1:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0x20
	ld	D,0x20
	call	FillScrRect
	ret

c_20EC58	section	code abs=0x20EC58

; [code] same on SCR2
ClearTilemapScr2:
	ld	WA,0
	ld	C,0
	ld	E,0x20
	ld	B,0x20
	ld	D,0x20
	call	FillScrRect
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
	ldw	(XIZ+TASK_FUNC),IntroCockpitPan & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroCockpitPan >> 16
	ret

c_20ECCB	section	code abs=0x20ECCB

; [code] IntroCockpitScene's resume step (TASK_FUNC 0x20ECCB): wScr1ScrollX = TASK_ARG / 2, wScr1ScrollY = +0x10 (0), TASK_ARG + 1 each frame, EndTask at 0xC0 (the cockpit picture scrolls 0x5F px over 0xC0 frames); [play] runs during the intro's cockpit picture
IntroCockpitPan:
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(wScr1ScrollX),A
	ldb	(wScr1ScrollY),(XIZ+0x10)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xC0
	jp	Z,EndTask
	ret

c_20ECE8	section	code abs=0x20ECE8

; [code] started by IntroSequence right after IntroCockpitScene: cycles 4 SCR1 tilemaps from table 0x226B2D (colour) / 0x226B3D (mono, wColorFlags bit 4) at column 0x17 row 7 over the cockpit picture, 4 frames each, then EndTask; ran on intro_cockpit_helmet
IntroCockpitAnim:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),IntroCockpitAnim.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroCockpitAnim.resume >> 16
IntroCockpitAnim.resume:
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
	ldw	(XIZ+TASK_FUNC),IntroBioLetters.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroBioLetters.resume >> 16
IntroBioLetters.resume:
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(wScr1ScrollX),A
	ldb	(wScr1ScrollY),(XIZ+0x10)
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
	ldw	(XIZ+TASK_FUNC),IntroMotorScene.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroMotorScene.resume >> 16
IntroMotorScene.resume:
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(wScr1ScrollX),A
	ldb	(wScr1ScrollY),(XIZ+0x10)
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
	ldw	(XIZ+TASK_FUNC),IntroUnitronScene.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroUnitronScene.resume >> 16
IntroUnitronScene.resume:
	ld	WA,(XIZ+TASK_ARG)
	srl	1,WA
	ld	(wScr1ScrollX),A
	ldb	(wScr1ScrollY),(XIZ+0x10)
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
	ldw	(XIZ+TASK_FUNC),IntroMotorUnitronLetters.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroMotorUnitronLetters.resume >> 16
IntroMotorUnitronLetters.resume:
	ldb	(wScr1ScrollX),(XIZ+TASK_ARG)
	ld	WA,(XIZ+0x10)
	srl	1,WA
	ld	(wScr1ScrollY),A
	incw	1,(XIZ+0x10)
	cpw	(XIZ+0x10),0
	jr	Z,IntroMotorUnitronLetters.skip
	ret
IntroMotorUnitronLetters.skip:
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	calr	ClearTilemapScr1
	call	EndTask
	ret

c_20EF65	section	code abs=0x20EF65

; [code] child of IntroMotorUnitronLetters: SCR2 tilemap cycles through table 0x226B4D = Map_2DF674 (BIO, IntroBioLetters), Map_2DF96E (MOTOR), Map_2DFC68 (UNITRON) at base 0x12C, interval 0x14 frames shrinking by 2 to 4; ends when its parent link (XIZ+4) is cleared
CycleIntroLetters:
	ldw	(XIZ+0x14),0
	ldw	(XIZ+0x16),0x14
	ldw	(XIZ+0x18),0
	ldw	(XIZ+TASK_FUNC),CycleIntroLetters.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),CycleIntroLetters.resume >> 16
CycleIntroLetters.resume:
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
	ldw	(XIZ+TASK_FUNC),StorySceneUnitice & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StorySceneUnitice >> 16
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
	ld	XHL,FadeLevelTask
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
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0x81
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x28
	task_wait
	ld	XHL,FadeLevelTask
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
	calr	WritePalettesDirect
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	calr	WriteMonoPalettesDirect
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TheseCrystalsCalledUniText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneUnitice.skip
	ldb	(XHL+0x12),0xB0
StorySceneUnitice.skip:
	ldb	(XHL+0x14),0x81
	task_wait
	ldb	(0x5CE2),1
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	HL,EVENT_STAGE_TOWN
	call	SetEventFlag
	call	EndTask
	ret

c_20F179	section	code abs=0x20F179

; [code] street task (0x5FF8 = 4, StreetEndingScenes): wFadeLevel 0x81, ClearTilemapScr1/2, PlayMusic 0x12, sound 0x33, then TASK_FUNC = 0x20F1A4 = StorySceneDestruction (as StorySceneUniticeSetup)
StorySceneDestructionSetup:
	ldb	(wFadeLevel),0x81
	ldb	(0x5CE2),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XWA,0x12
	call	PlayMusic
	ld	WA,0x33
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),StorySceneDestruction & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StorySceneDestruction >> 16
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
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x20
	ldb	(XHL+0x12),0x81
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x5A
	task_wait
	ld	XHL,FadeLevelTask
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
	calr	WritePalettesDirect
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	calr	WriteMonoPalettesDirect
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,WithTheDestructionOfText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,FadeLevelTask
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
	ldw	(XIZ+TASK_FUNC),StorySceneSunBegan & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StorySceneSunBegan >> 16
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
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x3C
	task_wait
	ld	XHL,FadeLevelTask
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
	calr	WritePalettesDirect
	ld	A,4
	ld	C,1
	ld	XHL,MonoPal_225C45
	calr	WriteMonoPalettesDirect
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TheSunBeganToText
	ld	(XHL+0xE),XDE
	task_wait
	ld	XHL,FadeLevelTask
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
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+0xE),0x3C
	task_wait
	ldb	(wFadeLevel),0x81
	ldw	(XIZ+TASK_FUNC),CreditsScreen & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),CreditsScreen >> 16
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
	ldw	(XIZ+TASK_FUNC),CreditsScreen.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),CreditsScreen.resume >> 16
CreditsScreen.resume:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	ret	Z
	ldb	(0x5CE2),1
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+0xE),0x3C
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x81
	task_wait
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
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
	ldw	(XIZ+TASK_FUNC),StorySceneTheEnd.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StorySceneTheEnd.resume >> 16
StorySceneTheEnd.resume:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	ret	Z
	ldb	(0x5CE2),1
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	call	EndTask
	ret

c_20F599	section	code abs=0x20F599

; [code] GAME OVER
GameOverScreen:
	ldb	(wFadeLevel),0
	call	ClearTilemaps
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
	ldw	(XIZ+TASK_FUNC),GameOverScreen.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),GameOverScreen.resume >> 16
GameOverScreen.resume:
	ld	A,0
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,GameOverWaitB
	ret

c_20F611	section	code abs=0x20F611

; [code] TASK_FUNC = GameOverWaitB, then falls into it; no callers (after a ret; GameOverScreen's resume step GameOverScreen.resume jumps to GameOverWaitB itself)
GameOverSetWaitB:
	ldw	(XIZ+TASK_FUNC),GameOverWaitB & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),GameOverWaitB >> 16

c_20F61B	section	code abs=0x20F61B

; [code] GAME OVER screen, after its text: B -> EndTask
GameOverWaitB:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jp	NZ,EndTask
	ret

c_20F628	section	code abs=0x20F628

; [play] staff credits (credits_* screens)
CreditsTask:
	calr	ClearTilemapScr2
	ldb	(wScr2ScrollY),0
	ld	XDE,wPlayerName
	ld	B,6
	ld	WA,CREDITS_PLAYER_NAME_TILE
CreditsTask.loop:
	ld	L,(XDE)
	push	B
	push	XDE
	push	WA
	call	LoadGlyphTile
	pop	WA
	pop	XDE
	pop	B
	inc	1,XDE
	inc	2,WA
	djnz	B,CreditsTask.loop
	ld	XDE,wPartnerName
	ld	B,6
	ld	WA,CREDITS_PARTNER_NAME_TILE
CreditsTask.loop2:
	ld	L,(XDE)
	push	B
	push	XDE
	push	WA
	call	LoadGlyphTile
	pop	WA
	pop	XDE
	pop	B
	inc	1,XDE
	inc	2,WA
	djnz	B,CreditsTask.loop2
	ld	WA,0x186
	ld	(XIZ+0x18),WA
	ldb	(XIZ+0x12),0
	ldw	(XIZ+0x14),5
	ld	WA,(XIZ+0x14)
	ld	(XIZ+0x16),WA
	ld	XHL,CreditsLineTask
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),CreditsTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),CreditsTask.resume >> 16
	ld	XDE,0x5DF8
	ld	BC,0x100
	extz	XBC
CreditsTask.loop3:
	ldw	(XDE+),0xFFFF
	dec	1,BC
	cp	BC,0
	jr	NZ,CreditsTask.loop3
CreditsTask.resume:
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	Z,CreditsScrollStep
	calr	ClearTilemapScr2
	call	EndChildTasks
	call	EndTask
	ret

c_20F6CA	section	code abs=0x20F6CA

; [code] CreditsTask each frame without B: every +0x14 (5) frames wScr2ScrollY = +0x12, +0x12 + 1
CreditsScrollStep:
	decw	1,(XIZ+0x16)
	ret	NZ
	ld	WA,(XIZ+0x14)
	ld	(XIZ+0x16),WA
	ld	A,(XIZ+0x12)
	ld	(wScr2ScrollY),A
	incb	1,(XIZ+0x12)
	ret

c_20F6E0	section	code abs=0x20F6E0

; [code] child task of CreditsTask (parent XIY): on a frame the parent scrolled (+0x16 = +0x14) at a multiple of 8 lines, writes the next text line (parent +0xE) into the SCR2 row just below the screen ((+0x12 / 8 + 0x13) & 0x1F at 0x9800): 0xFF -> CreditsLineEnd, 0xFE blanks the rest of the 20 cells, 0xFC / 0xFB the player / partner name tiles (0x16C / 0x173), else CreditsLineChar
CreditsLineTask:
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
	add	XWA,SCROLL2_VRAM
	ldw	(XIZ+TASK_ARG),0
	ld	XHL,(XIY+0xE)
CreditsLineTask.loop:
	ld	C,(XHL)
	cp	C,0xFE
	jr	Z,CreditsLineChar.skip
	cp	C,0xFF
	jrl	Z,CreditsLineEnd
	cp	C,0xFC
	jr	NZ,CreditsLinePartnerName
	ld	DE,CREDITS_PLAYER_NAME_TILE
	ld	XBC,wPlayerName
	jr	CreditsLineNameTiles

c_20F730	section	code abs=0x20F730

; [code] CreditsLineTask code 0xFB: the partner name tiles from 0x173 (wPartnerName); else CreditsLineChar
CreditsLinePartnerName:
	cp	C,0xFB
	jr	NZ,CreditsLineChar
	ld	DE,CREDITS_PARTNER_NAME_TILE
	ld	XBC,wPartnerName

c_20F73D	section	code abs=0x20F73D

; [code] tile DE, DE + 2, ... into the map row for each char of the name at XBC (to 0xFF), then the next code
CreditsLineNameTiles:
	ld	(XWA+),DE
	inc	2,DE
	inc	1,XBC
	cpb	(XBC),0xFF
	jr	NZ,CreditsLineNameTiles
	inc	1,XHL
	jr	CreditsLineTask.loop

c_20F74D	section	code abs=0x20F74D

; [code] CreditsLineTask, a text char: 0 (space) -> blank cell; else CreditsLineCachedGlyph
CreditsLineChar:
	ld	C,(XHL+)
	cp	C,0
	jr	NZ,CreditsLineCachedGlyph
CreditsLineChar.skip:
	ldw	(XWA+),0
	jr	CreditsLineLoadGlyph.skip

c_20F75B	section	code abs=0x20F75B

; [code] the char's tile from the cache 0x5DF8 + 2 * char (0xFFFF = not loaded yet -> CreditsLineLoadGlyph)
CreditsLineCachedGlyph:
	exts	BC
	ld	DE,BC
	extz	XDE
	sll	1,XDE
	add	XDE,0x5DF8
	push	XDE
	ld	DE,(XDE)
	cp	DE,0xFFFF
	jr	Z,CreditsLineLoadGlyph
	ld	(XWA+),DE
	pop	XDE
	jr	CreditsLineLoadGlyph.skip

c_20F779	section	code abs=0x20F779

; [code] char not in the cache: LoadGlyphTile into the parent's next free tile +0x18, cached at 0x5DF8 + 2 * char, +0x18 + 1; after 20 cells the line pointer (parent +0xE) moves past the line
CreditsLineLoadGlyph:
	pop	XDE
	push	XHL
	ld	HL,(XIY+0x18)
	ld	(XDE),HL
	pop	XHL
	push	XWA
	push	XHL
	ld	L,C
	ld	WA,(XIY+0x18)
	call	LoadGlyphTile
	pop	XHL
	pop	XWA
	ld	BC,(XIY+0x18)
	ld	(XWA+),BC
	incw	1,(XIY+0x18)
CreditsLineLoadGlyph.skip:
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0x14
	jrl	NZ,CreditsLineTask.loop
	inc	1,XHL
	ld	(XIY+0xE),XHL
	ret

c_20F7A8	section	code abs=0x20F7A8

; [code] EndTask (code 0xFF: the end of the credits text)
CreditsLineEnd:
	call	EndTask
	ret
