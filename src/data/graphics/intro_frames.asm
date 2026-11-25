; Animation tables of the intro scenes (engine/scenes.asm), 0x226B2D-0x226C11.

; [code] IntroCockpitAnim: SCR1 tilemap per step (task +0xE, 0-3) at column 0x17 row 7, 4 frames
; each, when wColorFlags bit 4 is set (colour) ...
IntroCockpitFrames:
	dl	IntroHelmetFrame1Map,IntroHelmetFrame2Map,IntroHelmetFrame3Map,IntroHelmetFrame2Map
; ... and when it is clear (mono)
IntroCockpitFramesMono:
	dl	IntroHelmetFrame1MonoMap,IntroHelmetFrame2MonoMap,IntroHelmetFrame3MonoMap,IntroHelmetFrame2MonoMap

; [code] CycleIntroLetters: SCR2 tilemap per step (BIO, MOTOR, UNITRON)
IntroLetterMaps:
	dl	IntroBioLettersMap,IntroMotorLettersMap,IntroUnitronLettersMap

; [code] IntroMeteorTask: sprite map (DrawSpriteMap) per frame: entry (counter / 2) & 3 (was Data_226B59)
IntroMeteorFrames:
	dl	IntroMeteorFrame1Map,IntroMeteorFrame1Map,IntroMeteorFrame2Map,IntroMeteorFrame3Map

; [code] IntroImpactTask: SCR2 tilemap records (DrawTilemapScr2): pointer, x, y (in tiles). The
; frame table IntroImpactFrames picks 1-5; record 0 (the planet, IntroPlanetGraphics) is not picked. (was Data_226B69)
IntroImpactMaps:
	dl	IntroPlanetMap
	dw	0,0
	dl	IntroImpact1Map
	dw	3,12
	dl	IntroImpact2Map
	dw	2,12
	dl	IntroImpact3Map
	dw	2,11
	dl	IntroImpact4Map
	dw	1,10
	dl	IntroImpact5Map
	dw	0,9

; [code] IntroImpactTask: 60 words, a IntroImpactMaps record per frame (13 x 1, 13 x 2, 13 x 3, 12 x 4,
; 9 x 5). The code reads the word at +4 * frame for frames 0-59 (task +0x18; it ends the task
; after 0x3C frames), so it uses every second word and, from frame 30 on, reads past the table
; (into the bytes from 0x226C11). [play] it runs all 60 frames (not ended early); most past-the-end
; words give x/y >= 0x20 (nothing drawn); at zoom frame 34 word 0 redraws the planet on SCR2 over the
; impact rings, so the rings vanish during the fade to white. (was Data_226B99)
IntroImpactFrames:
	dw	1,1,1,1,1,1,1,1,1,1,1,1,1
	dw	2,2,2,2,2,2,2,2,2,2,2,2,2
	dw	3,3,3,3,3,3,3,3,3,3,3,3,3
	dw	4,4,4,4,4,4,4,4,4,4,4,4
	dw	5,5,5,5,5,5,5,5,5
