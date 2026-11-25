; Animation tables of the intro scenes (engine/scenes.asm), 0x226B2D-0x226C11.

; [code] IntroCockpitAnim: SCR1 tilemap per step (task +0xE, 0-3) at column 0x17 row 7, 4 frames
; each, when wColorFlags bit 4 is set (colour) ...
IntroCockpitFrames:
	dl	Map_2DB9BD,Map_2DB92B,Map_2DB899,Map_2DB92B
; ... and when it is clear (mono)
IntroCockpitFramesMono:
	dl	Map_2DC035,Map_2DBFA3,Map_2DBF11,Map_2DBFA3

; [code] CycleIntroLetters: SCR2 tilemap per step (BIO, MOTOR, UNITRON)
IntroLetterMaps:
	dl	Map_2DF674,Map_2DF96E,Map_2DFC68

; [code] swp_20EB87: sprite map (dyn_2069C8) per frame: entry (counter / 2) & 3
Data_226B59:
	dl	Map_2DE95A,Map_2DE95A,Map_2DE980,Map_2DE9A6

; [code] swp_20EAA6: SCR2 tilemap records (DrawTilemapScr2): pointer, x, y (in tiles). The
; frame table Data_226B99 picks 1-5; record 0 (the planet, IntroPlanetGraphics) is not picked.
Data_226B69:
	dl	Map_2DE660
	dw	0,0
	dl	Map_2DE9CC
	dw	3,12
	dl	Map_2DE9E0
	dw	2,12
	dl	Map_2DEA0A
	dw	2,11
	dl	Map_2DEA3E
	dw	1,10
	dl	Map_2DEAA2
	dw	0,9

; [code] swp_20EAA6: 60 words, a Data_226B69 record per frame (13 x 1, 13 x 2, 13 x 3, 12 x 4,
; 9 x 5). The code reads the word at +4 * frame for frames 0-59 (task +0x18; it ends the task
; after 0x3C frames), so it uses every second word and, from frame 30 on, reads past the table
; (into the bytes from 0x226C11). Whether the task is ended earlier by its parent: not checked.
Data_226B99:
	dw	1,1,1,1,1,1,1,1,1,1,1,1,1
	dw	2,2,2,2,2,2,2,2,2,2,2,2,2
	dw	3,3,3,3,3,3,3,3,3,3,3,3,3
	dw	4,4,4,4,4,4,4,4,4,4,4,4
	dw	5,5,5,5,5,5,5,5,5
