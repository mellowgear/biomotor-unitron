; engine/scenes: 51 routines (each keeps its ROM address in its own section)

c_20E1D4	section	code abs=0x20E1D4

; Child task, the scenes' timed wait: ends after TASK_ARG frames (set by the starter) or when its parent (+4)
; is gone [code]
WaitFramesTask:
	cpw	(XIZ+4),0
	jp	Z,EndTask
	decw	1,(XIZ+TASK_ARG)
	jp	Z,EndTask
	ret

c_20E22B	section	code abs=0x20E22B

; Child task: steps wFadeLevel linearly from +0x12 to +0x14 over TASK_ARG frames (the starter sets all three),
; then ends; levels 0 = normal, 0x7F = white, 0x81 = black [code]
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

; IntroBackground's child: starts IntroSequence, then runs IntroSkipCheck each frame [code]
RunIntroTask:
	ld	XHL,IntroSequence
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),IntroSkipCheck & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroSkipCheck >> 16
	ret

c_20E278	section	code abs=0x20E278

; Ends with the intro; A skips it (IntroSkip) [code]
IntroSkipCheck:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	NZ,IntroSkip
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ret

c_20E28C	section	code abs=0x20E28C

; Stops IntroSequence and its scenes (EndChildTasks) and ends once they are gone [code]
IntroSkip:
	call	EndChildTasks
	cpw	(XIZ+TASK_CHILDREN),0
	jp	Z,EndTask
	ret

c_20E29B	section	code abs=0x20E29B

; Title child setup: TASK_ARG = 0x258 (the idle countdown before the intro replays), parent TASK_ARG = 0 [code]
TitleTaskInit:
	ldw	(XIZ+TASK_ARG),0x258
	ldw	(XIY+0xE),0
	ldw	(XIZ+TASK_FUNC),TitleTaskStart & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleTaskStart >> 16
	ret

c_20E3AF	section	code abs=0x20E3AF

; Boot task for the attract loop: intro (skippable with A), title reveal and flash, then the title menu
; (TitleTaskInit); loops back to the intro when the title times out, else ends; scrolls zeroed both ways [play]
IntroBackground:
	ldb	(wUnk5CE2),0
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
	ld	XHL,TitleScreenFlashMap
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,IntroBackground.skip
	ld	XHL,TitleScreenFlashMonoMap
IntroBackground.skip:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2	; a 5-frame flash frame before the title picture
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),5
	task_wait
	ld	XHL,TitleScreenMap
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,IntroBackground.skip2
	ld	XHL,TitleScreenMonoMap
IntroBackground.skip2:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	ld	XHL,TitleTaskInit
	call	StartChildTask
	task_wait
	cpw	(XIZ+TASK_ARG),0	; the title timed out: replay the intro
	jrl	Z,IntroBackground
	ldb	(wUnk5CE2),1
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	call	EndTask
	ret

c_20E496	section	code abs=0x20E496

; The intro: Yumekobo logo, "199 years ago", planet and meteor impact, the BIO / MOTOR / UNITRON letter scenes
; between head cuts, fade to white and the cockpit; each step a child task waited on [play]
IntroSequence:
	ld	XWA,SONG_INTRO
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
	ldw	(XHL+TASK_ARG),0x14
	task_wait
	ldb	(wFadeLevel),0
	ld	WA,MUSIC_INTRO
	call	SoundCommand
	ld	XHL,Intro199YearsAgo
	call	StartChildTask
	task_wait
	calr	IntroPlanetGraphics
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x12C
	task_wait
	ld	XHL,IntroMeteorTask
	call	StartChildTask
	task_wait
	ld	WA,SFX_INTRO_IMPACT
	call	SoundCommand
	ld	XHL,IntroImpactTask
	call	StartChildTask
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x5A
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
	ldw	(XHL+TASK_ARG),0x14
	task_wait
	ld	XHL,IntroHeadMouthCutTask
	call	StartChildTask
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
	task_wait
	ld	XHL,IntroCockpitScene
	call	StartChildTask
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x14
	ld	XHL,IntroCockpitAnim
	call	StartChildTask
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x1E
	task_wait
	call	EndTask
	ret

c_20E6E4	section	code abs=0x20E6E4

; Intro caption screen: draws the "199 years ago" map on scroll 1, then Intro199YearsAgoStep for 0x168 frames [play]
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
	ld	XHL,Intro199YearsAgoPal
	call	LoadPalettes
	ld	A,2
	ld	C,1
	ld	XHL,IntroMonoPal
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DE3A7
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,Intro199YearsAgoMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0x168
	ldw	(XIZ+TASK_FUNC),Intro199YearsAgoStep & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),Intro199YearsAgoStep >> 16
	ldb	(wFadeLevel),0
	ret

c_20E753	section	code abs=0x20E753

; Adds the Planet "Elscea" caption 0xB4 frames in, then ends black (wFadeLevel 0x81) [code]
Intro199YearsAgoStep:
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xB4
	jr	Z,Intro199YearsAgoStep.skip
	ret
Intro199YearsAgoStep.skip:
	ld	WA,0xC
	ld	XHL,PlanetElsceaCaptionMap
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

; Title reveal: IntroTitleScene, title music, the four banners slide in, the robot slides onto scroll 2,
; then scroll 2 is cleared [code+play]
TitleRevealSequence:
	calr	IntroTitleScene
	ld	WA,MUSIC_TITLE
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
	ldw	(XHL+TASK_ARG),0x14
	task_wait
	calr	ClearTilemapScr2
	call	EndTask
	ret

c_20E7FF	section	code abs=0x20E7FF

; Loads the title palettes and tiles (banners from tile 0xC, the title picture from 0xE7) and the copyright line [play]
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
	ld	XHL,TitleBannerPal
	call	LoadPalettes
	ld	A,0x10
	ld	C,9
	ld	XHL,TitleBannerPal
	call	LoadPalettes
	ld	A,0x20
	ld	C,0xA
	ld	XHL,TitleScreenPal
	call	LoadPalettes
	ld	A,0
	ld	C,2
	ld	XHL,TitleBannerMonoPal
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,TitleBannerMonoPal
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,TitleScreenMonoPal
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2E42CE
	call	LoadCompressedTiles
	ld	WA,0xE7
	ld	XHL,Gfx_2E5997
	call	LoadCompressedTiles
	ld	XHL,TitleCopyrightMap
	ld	WA,0xC
	ld	BC,0
	ld	DE,0x11
	call	DrawTilemapScr1
	ret

c_20E89B	section	code abs=0x20E89B

; Slides TitleBannerTopMap (row 1) in from the left and TitleBannerBottomMap (row 13) from the right, one
; column a frame over 20 frames [code+play]
SlideInTitleBanners:
	ldb	(wFadeLevel),0
	ldw	(XIZ+TASK_ARG),0xFFEC
	ldw	(XIZ+0x10),0x14
	ldw	(XIZ+TASK_FUNC),SlideInTitleBanners.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SlideInTitleBanners.resume >> 16
SlideInTitleBanners.resume:
	ld	WA,0xC
	ld	XHL,TitleBannerTopMap
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,1
	call	DrawTilemapScr1
	ld	WA,0xC
	ld	XHL,TitleBannerBottomMap
	ld	BC,(XIZ+0x10)
	ld	DE,0xD
	call	DrawTilemapScr1
	decw	1,(XIZ+0x10)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),1
	jp	GE,EndTask
	ret

c_20E8E8	section	code abs=0x20E8E8

; SlideInTitleBanners for the middle banners, rows 5 and 9 [code+play]
SlideInMiddleTitleBanners:
	ldw	(XIZ+TASK_ARG),0xFFEC
	ldw	(XIZ+0x10),0x14
	ldw	(XIZ+TASK_FUNC),SlideInMiddleTitleBanners.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),SlideInMiddleTitleBanners.resume >> 16
SlideInMiddleTitleBanners.resume:
	ld	WA,0xC
	ld	XHL,TitleBannerMiddle1Map
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,5
	call	DrawTilemapScr1
	ld	WA,0xC
	ld	XHL,TitleBannerMiddle2Map
	ld	BC,(XIZ+0x10)
	ld	DE,9
	call	DrawTilemapScr1
	decw	1,(XIZ+0x10)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),1
	jp	GE,EndTask
	ret

c_20E930	section	code abs=0x20E930

; Slides TitleRobotMap (mono map on mono) in from column 20 to 0 on scroll 2, one column a frame [play]
TitleReveal:
	ldw	(XIZ+TASK_ARG),0x14
	ldw	(XIZ+TASK_FUNC),TitleReveal.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),TitleReveal.resume >> 16
TitleReveal.resume:
	ld	XHL,TitleRobotMap
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,TitleReveal.skip
	ld	XHL,TitleRobotMonoMap
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

; Yumekobo logo: fills the screen with tile 0xC, fades the logo in from white, sweeps YumekoboLogoStripeMap
; across row 3, then fades to white [play]
IntroLogoScene:
	ldb	(wFadeLevel),0x7F
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x14
	task_wait
	ld	WA,0xC
	ld	C,0
	ld	E,0
	ld	B,0x20
	ld	D,0x13
	call	FillScrRect
	ld	A,0x10
	ld	C,2
	ld	XHL,YumekoboLogoPal
	call	LoadPalettes
	ld	A,0x20
	ld	C,2
	ld	XHL,YumekoboLogoPal
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,YumekoboLogoMonoPal
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,YumekoboLogoMonoPal
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DDAB9
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,YumekoboLogoMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_ARG),0xFFE8	; stripe from column -0x18 to 0x14
	ldb	(wFadeLevel),0x7F
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0x7F
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x28
	task_wait
	ldw	(XIZ+TASK_FUNC),IntroLogoScene.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroLogoScene.resume >> 16
IntroLogoScene.resume:
	ld	WA,0xC
	ld	XHL,YumekoboLogoStripeMap
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,3
	call	DrawTilemapScr1
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0x14
	ret	NZ
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x14
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
	task_wait
	call	EndTask
	ret

c_20EAA6	section	code abs=0x20EAA6

; The meteor impact: 60 frames of IntroImpactMaps on scroll 2 picked by IntroImpactFrames (word stride 4, so it
; reads past the table from frame 30, a bug in the original), fading to white from frame 7 [code+play]
IntroImpactTask:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+0x12),0x3C	; frames left
	ldw	(XIZ+0x18),0	; frame
	ldw	(XIZ+TASK_FUNC),IntroImpactTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),IntroImpactTask.resume >> 16
IntroImpactTask.resume:
	ld	WA,(XIZ+0x18)
	cp	WA,7
	jr	NZ,IntroImpactTask.skip
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0x7F
IntroImpactTask.skip:
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	2,XHL
	add	XHL,IntroImpactFrames
	ld	HL,(XHL)
	extz	XHL
	sll	3,XHL
	add	XHL,IntroImpactMaps
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

; Loads the planet palettes and tiles and draws IntroPlanetMap on scroll 1 [code]
IntroPlanetGraphics:
	ld	A,0
	ld	C,3
	ld	XHL,IntroPlanetPal
	call	LoadPalettes
	ld	A,0x10
	ld	C,3
	ld	XHL,IntroPlanetPal
	call	LoadPalettes
	ld	A,0x20
	ld	C,3
	ld	XHL,IntroPlanetPal
	call	LoadPalettes
	ld	A,0
	ld	C,2
	ld	XHL,IntroMonoPal
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,IntroMonoPal
	call	LoadMonoPalettes
	ld	A,4
	ld	C,3
	ld	XHL,IntroMonoPal
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DEB58
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,IntroPlanetMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldb	(wFadeLevel),0
	ret

c_20EB87	section	code abs=0x20EB87

; The meteor: 0x78 frames of IntroMeteorFrames sprite maps (frame changes every 2), moving from x 0xA0, y 0x18
; left 1 a frame and down 1 every 2 frames [code] [play: intro_planet_meteor]
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
	srl	1,HL	; frame / 2 & 3
	and	HL,3
	sll	2,HL
	extz	XHL
	add	XHL,IntroMeteorFrames
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

; 20-frame cut to the three-eyed mechanical head (IntroHeadMap, scroll 2 from tile 0x17C); between the letter
; scenes [code+play]
IntroHeadCutTask:
	ldw	(XIZ+TASK_ARG),0x14
	ld	WA,0x17C
	ld	XHL,IntroHeadMap
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

; IntroHeadCutTask with IntroHeadMouthMap (the jaw line changed), once before the fade to white [code+play]
IntroHeadMouthCutTask:
	ldw	(XIZ+TASK_ARG),0x14
	ld	WA,0x17C
	ld	XHL,IntroHeadMouthMap
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

; Clears the scroll 1 map (FillScrRect) [code]
ClearTilemapScr1:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0x20
	ld	D,0x20
	call	FillScrRect
	ret

c_20EC58	section	code abs=0x20EC58

; Clears the scroll 2 map (FillScrRect rows 0x20+) [code]
ClearTilemapScr2:
	ld	WA,0
	ld	C,0
	ld	E,0x20
	ld	B,0x20
	ld	D,0x20
	call	FillScrRect
	ret

c_20EC67	section	code abs=0x20EC67

; Draws the cockpit picture on scroll 1, then pans it (IntroCockpitPan) [play]
IntroCockpitScene:
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	A,0x10
	ld	C,0xC
	ld	XHL,IntroCockpitPal
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,IntroCockpitMonoPal
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2DC0C7
	call	LoadCompressedTiles
	ld	XHL,IntroCockpitMap
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,IntroCockpitScene.skip
	ld	XHL,IntroCockpitMonoMap
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

; Pans scroll 1 to x = TASK_ARG / 2 for 0xC0 frames (0x5F pixels) [code]
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

; Plays the 4-frame IntroCockpitFrames (mono IntroCockpitFramesMono) at column 0x17, row 7 over the cockpit,
; 4 frames each [code] [play: intro_cockpit_helmet]
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

; Loads the letter scenes' palettes, the letter tiles (from 0x12C) and the head tiles (from 0x17C) [code]
IntroLettersGraphics:
	ld	A,0
	ld	C,7
	ld	XHL,IntroLettersPal
	call	LoadPalettes
	ld	A,0x10
	ld	C,7
	ld	XHL,IntroLettersPal
	call	LoadPalettes
	ld	A,0x20
	ld	C,7
	ld	XHL,IntroLettersPal
	call	LoadPalettes
	ld	A,0
	ld	C,2
	ld	XHL,IntroMonoPal
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,IntroMonoPal
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,IntroMonoPal
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

; "BIO" on scroll 2 over IntroBioSceneMap on scroll 1, panned 0x3C pixels over 0x78 frames [play]
IntroBioLetters:
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	WA,0xC
	ld	XHL,Gfx_2E231F
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,IntroBioLettersMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,IntroBioSceneMap
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
	cpw	(XIZ+TASK_ARG),0xFF88	; -0x78
	jr	Z,IntroBioLetters.skip
	ret
IntroBioLetters.skip:
	calr	ClearTilemapScr1
	call	EndTask
	ret

c_20EE1A	section	code abs=0x20EE1A

; "MOTOR" on scroll 2 over IntroMotorSceneMap, panned over 0x30 frames [code]
IntroMotorScene:
	calr	ClearTilemapScr2
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	XHL,Gfx_2E2E82
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,IntroMotorLettersMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,IntroMotorSceneMap
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

; "UNITRON" on scroll 2 over IntroUnitronSceneMap, panned the other way over 0x30 frames [code]
IntroUnitronScene:
	calr	ClearTilemapScr2
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	XHL,Gfx_2E1302
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,IntroUnitronLettersMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,IntroUnitronSceneMap
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

; The letters cycling (CycleIntroLetters) over IntroMotorUnitronSceneMap, which scrolls from y -0x5A over
; 0xB4 frames [play]
IntroMotorUnitronLetters:
	calr	ClearTilemapScr2
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	XHL,Gfx_2E0426
	call	LoadCompressedTiles
	ld	WA,0x12C
	ld	XHL,IntroBioLettersMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr2
	ld	WA,0xC
	ld	XHL,IntroMotorUnitronSceneMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0xFF4C	; -0xB4, halved for the scroll
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

; Child of IntroMotorUnitronLetters: cycles BIO, MOTOR, UNITRON (IntroLetterMaps) on scroll 2, every 20
; frames at first, 2 fewer each time down to 4; ends with its parent [code]
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

; New game (NewGameSetup): black screen, story song, then StorySceneUnitice [code]
StorySceneUniticeSetup:
	ldb	(wFadeLevel),0x81
	ldb	(wUnk5CE2),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XWA,SONG_STORY
	call	PlayMusic
	ldw	(XIZ+TASK_FUNC),StorySceneUnitice & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StorySceneUnitice >> 16
	ret

c_20EFF4	section	code abs=0x20EFF4

; Opening story: "It all began with..." over portrait 0x2E, then portrait 0x3C with "These crystals called
; Uni-..." over a dimmed picture; ends black and sets EVENT_STAGE_TOWN [code]
StorySceneUnitice:
	ld	WA,MUSIC_STORY
	call	SoundCommand
	ld	WA,0xC
	ld	HL,0x2E
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	A,0x20
	ld	C,1
	ld	XHL,StoryTextPal
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,StoryTextMonoPal
	call	LoadMonoPalettes
	ldb	(wFadeLevel),0
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,ItAllBeganWithText
	ld	(XHL+TASK_ARG),XDE
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
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
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0x81
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x28
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0
	ldb	(XHL+0x14),0xD8	; dim the picture for the text (0xB0 on mono)
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneUnitice.resume5
	ldb	(XHL+0x14),0xB0
StorySceneUnitice.resume5:
	task_wait
	ld	A,0x20
	ld	C,1
	ld	XHL,StoryTextPal
	calr	WritePalettesDirect	; text palette written past the fade, so it stays bright
	ld	A,4
	ld	C,1
	ld	XHL,StoryTextMonoPal
	calr	WriteMonoPalettesDirect
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TheseCrystalsCalledUniText
	ld	(XHL+TASK_ARG),XDE
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0xD8
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneUnitice.skip
	ldb	(XHL+0x12),0xB0
StorySceneUnitice.skip:
	ldb	(XHL+0x14),0x81
	task_wait
	ldb	(wUnk5CE2),1
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	HL,EVENT_STAGE_TOWN
	call	SetEventFlag
	call	EndTask
	ret

c_20F179	section	code abs=0x20F179

; Ending (StreetEndingScenes): black screen, destruction song, then StorySceneDestruction [code]
StorySceneDestructionSetup:
	ldb	(wFadeLevel),0x81
	ldb	(wUnk5CE2),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XWA,SONG_DESTRUCTION
	call	PlayMusic
	ld	WA,MUSIC_DESTRUCTION
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),StorySceneDestruction & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StorySceneDestruction >> 16
	ret

c_20F1A4	section	code abs=0x20F1A4

; Ending: StoryDestructionMap, then "With the destruction of..." over it dimmed, then StorySceneSunBegan [code]
StorySceneDestruction:
	ld	A,0x10
	ld	C,7
	ld	XHL,StoryDestructionPal
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,YumekoboLogoMonoPal
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2E79D7
	call	LoadCompressedTiles
	ld	WA,0xC
	ld	XHL,StoryDestructionMap
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
	ldb	(XHL+0x12),0x81
	ldb	(XHL+0x14),0
	task_wait
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x5A
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
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
	ld	XHL,StoryTextPal
	calr	WritePalettesDirect
	ld	A,4
	ld	C,1
	ld	XHL,StoryTextMonoPal
	calr	WriteMonoPalettesDirect
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,WithTheDestructionOfText
	ld	(XHL+TASK_ARG),XDE
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
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

; Ending: StorySunBeganMap, then "The sun began to..." over it dimmed, then CreditsScreen [code]
StorySceneSunBegan:
	ld	A,0x10
	ld	C,8
	ld	XHL,StorySunBeganPal
	call	LoadPalettes
	ld	A,2
	ld	C,2
	ld	XHL,StorySunBeganMonoPal
	call	LoadMonoPalettes
	ld	WA,0xC
	ld	XHL,Gfx_2E6C94
	call	LoadCompressedTiles
	ld	XHL,StorySunBeganMap
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,StorySceneSunBegan.skip
	ld	XHL,StorySunBeganMonoMap
StorySceneSunBegan.skip:
	ld	WA,0xC
	ld	BC,0
	ld	DE,0
	call	DrawTilemapScr1
	ld	XHL,WaitFramesTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x3C
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
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
	ld	XHL,StoryTextPal
	calr	WritePalettesDirect
	ld	A,4
	ld	C,1
	ld	XHL,StoryTextMonoPal
	calr	WriteMonoPalettesDirect
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TheSunBeganToText
	ld	(XHL+TASK_ARG),XDE
	task_wait
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x20
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
	ldw	(XHL+TASK_ARG),0x3C
	task_wait
	ldb	(wFadeLevel),0x81
	ldw	(XIZ+TASK_FUNC),CreditsScreen & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),CreditsScreen >> 16
	ret

c_20F3E6	section	code abs=0x20F3E6

; Staff credits over portrait 0x2E, then TO BE CONTINUED; sets EVENT_STAGE_ENDING, clears the talk flags and,
; after the Cyrius trade, the four beaten-boss flags; A or B fades out and ends [code]
CreditsScreen:
	ld	XWA,SONG_CREDITS
	call	PlayMusic
	ld	WA,MUSIC_CREDITS
	call	SoundCommand
	calr	ClearTilemapScr1
	ld	WA,0xC
	ld	HL,0x2E
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	A,0x20
	ld	C,1
	ld	XHL,StoryTextPal
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,StoryTextMonoPal
	call	LoadMonoPalettes
	ldb	(wFadeLevel),0
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,BIOMOTORUNITRONPLANNINGText
	ld	(XHL+TASK_ARG),XDE
	task_wait
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,TOBECONTINUEDText
	ld	(XHL+TASK_ARG),XDE
	task_wait
	ld	HL,EVENT_STAGE_ENDING
	call	SetEventFlag
	ld	HL,EVENT_STAGE_LILY
	call	ClearEventFlag
	call	ClearTalkedFlags
	ld	HL,EVENT_CYRIUS_TRADED	; the bosses come back for the next loop (?)
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
	ldb	(wUnk5CE2),1
	ld	XHL,FadeLevelTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x3C
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

; "It was the end..." over portrait 0x37 (after Yes to Uniti's offer); A or B ends [code]
StorySceneTheEnd:
	ldb	(wFadeLevel),0x81
	ldb	(wUnk5CE2),0
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ld	XWA,SONG_DEFEAT
	call	PlayMusic
	ld	WA,MUSIC_DEFEAT
	call	SoundCommand
	ld	WA,0xC
	ld	HL,0x37
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ldb	(wFadeLevel),0
	ld	A,0x20
	ld	C,1
	ld	XHL,StoryTextPal
	call	LoadPalettes
	ld	A,4
	ld	C,1
	ld	XHL,StoryTextMonoPal
	call	LoadMonoPalettes
	ld	XHL,CreditsTask
	call	StartChildTask
	ld	XDE,ItWasTheEndText
	ld	(XHL+TASK_ARG),XDE
	task_wait
	ldw	(XIZ+TASK_FUNC),StorySceneTheEnd.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StorySceneTheEnd.resume >> 16
StorySceneTheEnd.resume:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	ret	Z
	ldb	(wUnk5CE2),1
	calr	ClearTilemapScr1
	calr	ClearTilemapScr2
	ldb	(wScr1ScrollX),0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	call	EndTask
	ret

c_20F599	section	code abs=0x20F599

; GAME OVER typed out in text box 0, then GameOverWaitB [code]
GameOverScreen:
	ldb	(wFadeLevel),0
	call	ClearTilemaps
	call	InitTextBoxes
	ld	A,0x2F
	ld	C,1
	ld	XHL,StoryTextPal
	call	LoadPalettes
	ld	A,5
	ld	C,1
	ld	XHL,StoryTextMonoPal
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
	ldb	(XWA+0x10),0x14	; typing speed (?)
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

; Sets TASK_FUNC = GameOverWaitB and falls into it; no callers [code]
GameOverSetWaitB:
	ldw	(XIZ+TASK_FUNC),GameOverWaitB & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),GameOverWaitB >> 16

c_20F61B	section	code abs=0x20F61B

; Ends the GAME OVER screen on B [code]
GameOverWaitB:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jp	NZ,EndTask
	ret

c_20F628	section	code abs=0x20F628

; Scrolling text task (credits and story captions), TASK_ARG = text: loads the name glyphs, clears the glyph
; cache, runs CreditsLineTask and scrolls scroll 2 up a line every 5 frames; B or the text's end stops it [play]
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
	ld	WA,0x186	; first tile for the text glyphs
	ld	(XIZ+0x18),WA
	ldb	(XIZ+0x12),0
	ldw	(XIZ+0x14),5
	ld	WA,(XIZ+0x14)
	ld	(XIZ+0x16),WA
	ld	XHL,CreditsLineTask
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),CreditsTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),CreditsTask.resume >> 16
	ld	XDE,wCreditsGlyphCache	; 0xFFFF = glyph not loaded
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

; Every +0x14 (5) frames: wScr2ScrollY = +0x12, then +0x12 + 1 [code]
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

; CreditsTask's child (parent XIY): on each 8-line scroll step writes the next text line into the scroll 2
; row just below the screen; 0xFF ends, 0xFE blanks the rest, 0xFC / 0xFB the player / partner name [code]
CreditsLineTask:
	ld	WA,(XIY+0x14)
	cp	(XIY+0x16),WA
	ret	NZ	; only on frames the parent scrolled
	ldw	(XIZ+TASK_ARG),0
	ld	A,(XIY+0x12)
	and	A,7
	ret	NZ
	ld	XWA,0
	ld	A,(XIY+0x12)
	srl	3,A
	add	A,0x13	; the row just below the 19 visible
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

; Code 0xFB: the partner name tiles (wPartnerName); else a text char [code]
CreditsLinePartnerName:
	cp	C,0xFB
	jr	NZ,CreditsLineChar
	ld	DE,CREDITS_PARTNER_NAME_TILE
	ld	XBC,wPartnerName

c_20F73D	section	code abs=0x20F73D

; Writes tile DE, DE + 2 ... for each char of the 0xFF-ended name at XBC into the row [code]
CreditsLineNameTiles:
	ld	(XWA+),DE
	inc	2,DE
	inc	1,XBC
	cpb	(XBC),0xFF
	jr	NZ,CreditsLineNameTiles
	inc	1,XHL
	jr	CreditsLineTask.loop

c_20F74D	section	code abs=0x20F74D

; A text char: 0 = a blank cell, else its glyph tile (CreditsLineCachedGlyph) [code]
CreditsLineChar:
	ld	C,(XHL+)
	cp	C,0
	jr	NZ,CreditsLineCachedGlyph
CreditsLineChar.skip:
	ldw	(XWA+),0
	jr	CreditsLineLoadGlyph.skip

c_20F75B	section	code abs=0x20F75B

; The char's tile from wCreditsGlyphCache, loading it first if the slot is 0xFFFF [code]
CreditsLineCachedGlyph:
	exts	BC
	ld	DE,BC
	extz	XDE
	sll	1,XDE
	add	XDE,wCreditsGlyphCache
	push	XDE
	ld	DE,(XDE)
	cp	DE,0xFFFF
	jr	Z,CreditsLineLoadGlyph
	ld	(XWA+),DE
	pop	XDE
	jr	CreditsLineLoadGlyph.skip

c_20F779	section	code abs=0x20F779

; Loads the char's glyph into the parent's next free tile (+0x18), caches it; after 20 cells the parent's text
; pointer moves past the line [code]
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

; Code 0xFF, the end of the text: EndTask [code]
CreditsLineEnd:
	call	EndTask
	ret
