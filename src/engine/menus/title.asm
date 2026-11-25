; engine/menus/title: 88 routines (each keeps its ROM address in its own section)

c_206195	section	code abs=0x206195

dyn_206195:
	inc	1,W

c_206768	section	code abs=0x206768

sub_206768:
	cp	E,0x20
	ld	XHL,0x9000
	jr	C,loc_206788
	sub	E,0x20
	ld	HL,0x9800
	jr	loc_206788

c_20677A	section	code abs=0x20677A

swp_20677A:
	ld	XHL,0x9000
	jr	loc_206788

c_206781	section	code abs=0x206781

swp_206781:
	ld	XHL,0x9800
	jr	loc_206788

c_206788	section	code abs=0x206788

loc_206788:
	ld	QB,B
	ld	QD,D
	exts	BC
	exts	DE
	ld	QWA,WA
	push	QWA
	push	DE
	push	BC
	ld	BC,0
	ld	DE,0
loc_206788.loop:
	ld	WA,DE
	add	WA,(XSP+2)
	jr	MI,loc_206788.skip
	cp	WA,0x20
	jr	NC,loc_206788.skip2
	and	A,0x1F
	ld	QA,A
	ld	WA,BC
	add	WA,(XSP)
	jr	MI,loc_206788.skip
	cp	WA,0x20
	jr	NC,loc_206788.skip
	ld	QW,0
	sll	11,WA
	sll	6,XWA
	ld	WA,(XSP+4)
	ld	(XHL+QWA),WA
loc_206788.skip:
	inc	1,C
	cp	C,QB
	jr	C,loc_206788.loop
	ld	C,0
	inc	1,E
	cp	E,QD
	jr	C,loc_206788.loop
loc_206788.skip2:
	inc	6,XSP
	ret

c_2067E1	section	code abs=0x2067E1

sub_2067E1:
	ld	XWA,0
	ld	XHL,0xA000
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	XHL,0x9000
	ld	BC,0x400
sub_2067E1.loop:
	ld	(XHL+),XWA
	djnz	BC,sub_2067E1.loop
	ret

c_206803	section	code abs=0x206803

dyn_206803:
	ld	XWA,0
	ld	XHL,0xA000
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	XHL,0x9000
	ld	BC,0x200
	ld	(XHL+),XWA
	djnz	BC,0x20681E
	ret

c_206825	section	code abs=0x206825

dyn_206825:
	ld	XWA,0
	ld	XHL,0xA000
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	(XHL+),XWA
	ld	XHL,0x9800
	ld	BC,0x200
	ld	(XHL+),XWA
	djnz	BC,0x206840
	ret

c_206847	section	code abs=0x206847

sub_206847:
	ld	XWA,0
	ld	XHL,0x8800
	ld	C,0x40
sub_206847.loop:
	ld	(XHL+),XWA
	djnz	C,sub_206847.loop
	ldw	(0x5A82),0x5A86
	ldw	(0x5A84),0x5B86
	ret

c_206863	section	code abs=0x206863

dyn_206863:
	call	ResetScr1Palettes
	call	ResetScr2Palettes
	jp	ResetSpritePalettes

c_20686F	section	code abs=0x20686F

swp_20686F:
	call	ResetScr1Palettes
	jp	ResetScr2Palettes

c_206877	section	code abs=0x206877

; [code] same as ResetSpritePalettes but for SCR1: 15 x 0xFFF + Pal_21F010 into 0x58F6 (= wPalShadow+0x80 = LoadPalettes slot 0x10, the slot LoadImagePalette uses for SCR1), mono 0x5865 (= LoadMonoPalettes entries 2-3, SCR1 in LoadImagePalette) = 0 + MonoPal_21F018; 0x585C = ~wFadeLevel
ResetScr1Palettes:
	ld	WA,0xFFF
	ld	XDE,0x58F6
	ld	C,0x3C
	ld	(XDE+),WA
	djnz	C,0x206881
	ld	XHL,Pal_21F010
	ld	BC,4
	ldirw	(XDE+),(XHL+)
	ld	A,0
	ld	XDE,0x5865
	ld	C,4
	ld	(XDE+),A
	djnz	C,0x206899
	ld	XHL,MonoPal_21F018
	ld	BC,4
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(0x585C),A
	ret

c_2068B3	section	code abs=0x2068B3

; [code] same for SCR2: 0x5976 (= wPalShadow+0x100 = slot 0x20, SCR2 in LoadImagePalette) and mono 0x586D (entries 4-5); callers dyn_206863, swp_20686F, StreetGoWorks
ResetScr2Palettes:
	ld	WA,0xFFF
	ld	XDE,0x5976
	ld	C,0x3C
	ld	(XDE+),WA
	djnz	C,0x2068BD
	ld	XHL,Pal_21F010
	ld	BC,4
	ldirw	(XDE+),(XHL+)
	ld	A,0
	ld	XDE,0x586D
	ld	C,4
	ld	(XDE+),A
	djnz	C,0x2068D5
	ld	XHL,MonoPal_21F018
	ld	BC,4
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(0x585C),A
	ret

c_2068EF	section	code abs=0x2068EF

; [code] sprite palettes in wPalShadow: 15 x 0xFFF, palette 15 = Pal_21F010; mono 0x585D
ResetSpritePalettes:
	ld	WA,0xFFF
	ld	XDE,wPalShadow
	ld	C,0x3C
	ld	(XDE+),WA
	djnz	C,0x2068F9
	ld	XHL,Pal_21F010
	ld	BC,4
	ldirw	(XDE+),(XHL+)
	ld	A,0
	ld	XDE,wMonoPalShadow
	ld	C,4
	ld	(XDE+),A
	djnz	C,0x206911
	ld	XHL,MonoPal_21F018
	ld	BC,4
	ldir	(XDE+),(XHL+)
	ld	A,(wFadeLevel)
	cpl	A
	ld	(0x585C),A
	ret

c_207674	section	code abs=0x207674

sub_207674:
	ldb	(XWA+6),0
	incb	1,(XWA+7)
	ld	B,(XWA+5)
	cp	(XWA+7),B
	ret	C
	dec	1,B
	ld	(XWA+7),B
	rcf
	ret

c_20CE3F	section	code abs=0x20CE3F

; [code] battle stat percentages from the turn counters: each of 0x5D8A-0x5D8D (player) starts at
; 100 and gets +30 for each of its two counters (0x5D97+i, 0x5D9B+i) that is not 0; each of
; 0x5DBA-0x5DBD (enemy) starts at 100 and gets -30 per counter (0x5DC8+i, 0x5DCC+i; wEnemySPBuff also
; +50 for 0x5DC7). Called by DrawBattleScreen, swp_209E45 and EnemyTurn. Play traces: every run
; executes it (D10, 2026-11-25); was an unknown data block plus swp_20CED8 (its tail).
ComputeStatBuffs:
	ldb	(0x5D8A),0x64
	cpb	(0x5D97),0
	jr	Z,ComputeStatBuffs.skip1
	addb	(0x5D8A),0x1E
ComputeStatBuffs.skip1:
	cpb	(0x5D9B),0
	jr	Z,ComputeStatBuffs.skip2
	addb	(0x5D8A),0x1E
ComputeStatBuffs.skip2:
	ldb	(wPlayerSPBuff),0x64
	cpb	(0x5D98),0
	jr	Z,ComputeStatBuffs.skip3
	addb	(wPlayerSPBuff),0x1E
ComputeStatBuffs.skip3:
	cpb	(0x5D9C),0
	jr	Z,ComputeStatBuffs.skip4
	addb	(wPlayerSPBuff),0x1E
ComputeStatBuffs.skip4:
	ldb	(wPlayerRPBuff),0x64
	cpb	(0x5D99),0
	jr	Z,ComputeStatBuffs.skip5
	addb	(wPlayerRPBuff),0x1E
ComputeStatBuffs.skip5:
	cpb	(0x5D9D),0
	jr	Z,ComputeStatBuffs.skip6
	addb	(wPlayerRPBuff),0x1E
ComputeStatBuffs.skip6:
	ldb	(0x5D8D),0x64
	cpb	(0x5D9A),0
	jr	Z,ComputeStatBuffs.skip7
	addb	(0x5D8D),0x1E
ComputeStatBuffs.skip7:
	cpb	(0x5D9E),0
	jr	Z,ComputeStatBuffs.skip8
	addb	(0x5D8D),0x1E
ComputeStatBuffs.skip8:
	ldb	(wEnemyAPBuff),0x64
	cpb	(0x5DC8),0
	jr	Z,ComputeStatBuffs.skip9
	addb	(wEnemyAPBuff),0xE2
ComputeStatBuffs.skip9:
	cpb	(0x5DCC),0
	jr	Z,ComputeStatBuffs.skip10
	addb	(wEnemyAPBuff),0xE2
ComputeStatBuffs.skip10:
	ldb	(wEnemySPBuff),0x64
	cpb	(0x5DC7),0
	jr	Z,ComputeStatBuffs.skip11
	addb	(wEnemySPBuff),0x32
ComputeStatBuffs.skip11:
	cpb	(wEnemySPDownTurns),0
	jr	Z,ComputeStatBuffs.skip12
	addb	(wEnemySPBuff),0xE2
ComputeStatBuffs.skip12:
	cpb	(0x5DCD),0
	jr	Z,ComputeStatBuffs.skip13
	addb	(wEnemySPBuff),0xE2
ComputeStatBuffs.skip13:
	ldb	(wEnemyRPBuff),0x64
	cpb	(wEnemyRPDownTurns),0
	jr	Z,ComputeStatBuffs.skip14
	addb	(wEnemyRPBuff),0xE2
ComputeStatBuffs.skip14:
	cpb	(0x5DCE),0
	jr	Z,ComputeStatBuffs.skip15
	addb	(wEnemyRPBuff),0xE2
ComputeStatBuffs.skip15:
	ldb	(0x5DBD),0x64
	cpb	(wEnemyMPDownTurns),0
	jr	Z,ComputeStatBuffs.skip16
	addb	(0x5DBD),0xE2
ComputeStatBuffs.skip16:
	cpb	(0x5DCF),0
	jr	Z,ComputeStatBuffs.skip17
	addb	(0x5DBD),0xE2
ComputeStatBuffs.skip17:
	ret

c_20CF34	section	code abs=0x20CF34

; [play] main_menu: window graphics, portrait, music
MainMenuSetup:
	call	InitTextBoxes
	call	sub_2067E1
	ldb	(wMainMenuCursor),0
	ld	WA,0xB5
	ld	HL,0x2A
	ld	BC,0xA
	ld	DE,0
	call	DrawPortrait
	ld	WA,0x161
	ld	HL,0x2B
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	WA,0x14
	call	PlayMusic
	ld	WA,0x35
	call	SoundCommand
	ldb	(SCROLL_PRIORITY),0
	ldw	(XIZ+TASK_FUNC),0xCF7C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20CF7C	section	code abs=0x20CF7C

; [play] main_menu, reads wJoyPressed
MainMenu:
	call	dyn_206825
	call	sub_206847
	ld	A,0
	ld	C,0xC
	ld	E,3
	ld	HL,0xC
	call	OpenTextBox
	ld	A,0
	call	GetTextBox
	ld	XHL,0x20D0C2
	call	DrawString
	ld	C,4
	ld	E,0x22
	call	PlaceTextBoxXWA
	ld	A,1
	ld	C,0xC
	ld	E,7
	ld	HL,0x16
	call	OpenTextBox
	ld	A,1
	call	GetTextBox
	ld	XHL,0x20D0CD
	call	DrawString
	ld	C,4
	ld	E,0x26
	call	PlaceTextBoxXWA
	ld	XHL,dyn_20D6DF
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xCFED
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	E,(wMainMenuCursor)
	ld	D,0
	sll	4,DE
	add	DE,0x34
	ld	BC,0x28
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,MainMenu.skip
	bit	1,A
	jr	NZ,MainMenu.skip2
	bit	4,A
	jr	NZ,MainMenuConfirm
	bit	5,A
	jr	NZ,loc_20D091
	ret
MainMenu.skip:
	ld	WA,0x80
	call	SoundCommand
	decb	1,(wMainMenuCursor)
	ret	PL
	ldb	(wMainMenuCursor),2
	ret
MainMenu.skip2:
	ld	WA,0x80
	call	SoundCommand
	incb	1,(wMainMenuCursor)
	cpb	(wMainMenuCursor),3
	ret	C
	ldb	(wMainMenuCursor),0
	ret

c_20D04E	section	code abs=0x20D04E

; [code] main menu A: sound 0x81, transition, then the option task by wMainMenuCursor (table 0x20D085: 0 new game, 1 MainMenuLoadTask, 2 ConfigMenu)
MainMenuConfirm:
	ld	WA,0x81
	call	SoundCommand
	ld	XHL,dyn_20D71E
	call	StartChildTask
	task_wait
	call	dyn_206825
	ld	XHL,0
	ld	L,(wMainMenuCursor)
	sll	2,HL
	add	XHL,0x20D085
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
	db	0xE8,0xD0,0x20,0x00,0xF6,0xD0,0x20,0x00,0xBD,0xD1,0x20,0x00

c_20D091	section	code abs=0x20D091

loc_20D091:
	ld	WA,0x82
	call	SoundCommand
	ld	XHL,dyn_20D71E
	call	StartChildTask
	task_wait
	call	dyn_206825
	ldb	(wMainMenuCursor),0
	ldb	(SCROLL_PRIORITY),0x80
	call	EndTask
	ret
	db	0xFD,0x2D,0x01,0x09,0x0E,0x00,0x2D,0x05,0x0E,0x15,0xFF,0xFD,0x00,0x2E,0x05,0x17
	db	0x00,0x27,0x01,0x0D,0x05,0xFE,0xFE,0x00,0x2C,0x0F,0x01,0x04,0xFE,0xFE,0x00,0x23
	db	0x0F,0x0E,0x06,0x09,0x07,0xFF

c_20D0E8	section	code abs=0x20D0E8

dyn_20D0E8:
	incb	1,(wMainMenuCursor)
	ldb	(SCROLL_PRIORITY),0x80
	call	EndTask
	ret

c_20D0F6	section	code abs=0x20D0F6

; [code+play] main menu option 1: slot list, confirm, load; cancel back to MainMenu
MainMenuLoadTask:
	ldw	(XIZ+TASK_ARG),0xC
	ldw	(XIZ+0x10),0
	call	swp_20DC7C
	ld	XHL,dyn_20D6DF
	call	StartChildTask
	task_wait
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jr	Z,MainMenuLoadTask.skip2
	call	sub_20DF80
	ld	XHL,swp_20E131
	call	StartChildTask
	task_wait
	call	DrawSaveSlotList
	cpb	(wYesNoChoice),1
	jr	Z,MainMenuLoadTask.skip
	ldw	(XIZ+TASK_FUNC),0xD11B
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
MainMenuLoadTask.skip:
	ld	A,(wSaveSlot)
	call	sub_20DC43
	call	sub_20E012
	ld	XHL,swp_20E1BC
	call	StartChildTask
	task_wait
	incb	1,(wMainMenuCursor)
	ldb	(SCROLL_PRIORITY),0x80
	call	EndTask
	ret
MainMenuLoadTask.skip2:
	ld	XHL,dyn_20D71E
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xCF7C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20D1BD	section	code abs=0x20D1BD

; [code] Message Speed Fast/Slow, Animation ON/OFF, Delete Data; wOptionMessageSpeed / wOptionAnimation
ConfigMenu:
	ldb	(wConfigCursor),0
	call	dyn_206825
	ld	A,0
	ld	C,0xA
	ld	E,3
	ld	HL,0xC
	call	OpenTextBox
	ld	XHL,ConfigText
	call	DrawString
	ld	C,0
	ld	E,0x20
	call	PlaceTextBoxXWA
	ld	A,1
	ld	C,0x12
	ld	E,5
	ld	HL,0x16
	call	OpenTextBox
	ld	XHL,MessageSpeedFastSlowText
	call	DrawString
	ld	C,1
	ld	E,0x24
	call	PlaceTextBoxXWA
	ld	A,2
	ld	C,0x12
	ld	E,5
	ld	HL,0x46
	call	OpenTextBox
	ld	XHL,AnimationONOFFText
	call	DrawString
	ld	C,1
	ld	E,0x29
	call	PlaceTextBoxXWA
	ld	A,3
	ld	C,0x12
	ld	E,5
	ld	HL,0x76
	call	OpenTextBox
	ld	XHL,DeleteDataContinueText
	call	DrawString
	ld	C,1
	ld	E,0x2E
	call	PlaceTextBoxXWA
	ld	XHL,dyn_20D6DF
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xD25F
	ldw	(XIZ+TASK_FUNC_HI),0x20
	calr	sub_20D684
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,ConfigMenu.skip
	bit	1,A
	jr	NZ,ConfigMenu.skip2
	bit	4,A
	jr	NZ,ConfigMenu.skip3
	bit	5,A
	jrl	NZ,ConfigMenu.skip6
	and	A,0xC
	jr	NZ,ConfigMenu.skip4
	ret
ConfigMenu.skip:
	ld	WA,0x80
	call	SoundCommand
	decb	1,(wConfigCursor)
	ret	PL
	ldb	(wConfigCursor),2
	ret
ConfigMenu.skip2:
	ld	WA,0x80
	call	SoundCommand
	incb	1,(wConfigCursor)
	cpb	(wConfigCursor),3
	ret	C
	ldb	(wConfigCursor),0
	ret
ConfigMenu.skip3:
	cpb	(wConfigCursor),2
	ret	C
	ld	WA,0x81
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),0xD397
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
ConfigMenu.skip4:
	cpb	(wConfigCursor),1
	jr	C,ConfigMenu.skip5
	ret	NZ
	ld	WA,0x80
	call	SoundCommand
	cpb	(wOptionAnimation),0xFF
	ldb	(wOptionAnimation),0
	ret	Z
	ldb	(wOptionAnimation),0xFF
	ret
ConfigMenu.skip5:
	ld	WA,0x80
	call	SoundCommand
	cpb	(wOptionMessageSpeed),3
	ldb	(wOptionMessageSpeed),1
	ret	Z
	ldb	(wOptionMessageSpeed),3
	ret
ConfigMenu.skip6:
	ld	WA,0x82
	call	SoundCommand
	ld	XHL,dyn_20D71E
	call	StartChildTask
	task_wait
	ld	A,0
	call	loc_20DBDE
	call	dyn_206825
	ldw	(XIZ+TASK_FUNC),0xCF7C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20D397	section	code abs=0x20D397

; [code+play] Config > Delete Data "Which? All / Select" task (split pointer 0xD397/0x20 from ConfigMenu): choice task +0xE (1 Select), Left/Right flip it, A: All -> DeleteAllData, Select -> the Clear slot list; B -> back to "Continue?" (trace: play runs.md)
DeleteDataMenu:
	ldw	(XIZ+TASK_ARG),1
	ld	A,0
	ld	C,0x12
	ld	E,5
	ld	HL,0x76
	call	OpenTextBox
	ld	XHL,0x20D43D
	call	DrawString
	ldw	(XIZ+TASK_FUNC),0xD3BC
	ldw	(XIZ+TASK_FUNC_HI),0x20
	calr	sub_20D684
	ld	BC,(XIZ+TASK_ARG)
	mul	XBC,0x28
	add	BC,0x30
	ld	DE,0x84
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,DeleteDataMenu.skip
	bit	5,A
	jr	NZ,DeleteDataMenu.skip3
	and	A,0xC
	jr	NZ,DeleteDataMenu.skip4
	ret
DeleteDataMenu.skip:
	ld	WA,0x81
	call	SoundCommand
	cpw	(XIZ+TASK_ARG),0
	ld	XHL,DeleteAllData
	jr	Z,DeleteDataMenu.skip2
	ld	XHL,swp_20D59E
DeleteDataMenu.skip2:
	ld	(XIZ+TASK_FUNC),XHL
	ret
DeleteDataMenu.skip3:
	ld	WA,0x82
	call	SoundCommand
	ld	XHL,DeleteDataContinueText
	ld	A,0
	call	DrawBoxString
	ldw	(XIZ+TASK_FUNC),0xD25F
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
DeleteDataMenu.skip4:
	ld	WA,0x80
	call	SoundCommand
	cpb	(XIZ+TASK_ARG),0
	ldb	(XIZ+TASK_ARG),1
	ret	Z
	ldb	(XIZ+TASK_ARG),0
	ret
	db	0xFD,0x24,0x05,0x0C,0x05,0x14,0x05,0x00,0x24,0x01,0x14,0x01,0xFE,0x37,0x08,0x09
	db	0x03,0x08,0x64,0xFE,0x00,0x00,0x00,0x00,0x00,0x21,0x0C,0x0C,0x00,0x00,0x33,0x05
	db	0x0C,0x05,0x03,0x14,0xFF

c_20D462	section	code abs=0x20D462

; [code] reached by `ld XHL,0x20D462` at 0x20D3FA (Delete Data submenu at 0x20D397, choice 0 "All" of text 0x20D43D "Delete Data / Which? / All / Select"; choice 1 -> swp_20D59E): text 0x20D544 "Delete All Ok? Yes No" (TASK_ARG default 1 = No), on Yes DrawBoxString 0x20D56F "Deleting...", swp_20DAE1 (BIOS 0x16, swp_20776F block 0x11 loop, BIOS 0x15), wOptionMessageSpeed = 3, wOptionAnimation = 0xFF, 0x20D588 "Finished", then MainMenu; No/B -> 0x20D397
DeleteAllData:
	ldw	(XIZ+TASK_ARG),1
	ld	A,0
	ld	C,0x12
	ld	E,5
	ld	HL,0x76
	call	OpenTextBox
	ld	XHL,DeleteDataDeleteAllText
	call	DrawString
	ldw	(XIZ+TASK_FUNC),0xD487
	ldw	(XIZ+TASK_FUNC_HI),0x20
	calr	sub_20D684
	ld	BC,(XIZ+TASK_ARG)
	mul	XBC,0x28
	add	BC,0x40
	ld	DE,0x84
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,DeleteAllData.skip
	bit	5,A
	jr	NZ,DeleteAllData.skip3
	and	A,0xC
	jr	NZ,DeleteAllData.skip4
	ret
DeleteAllData.skip:
	ld	WA,0x81
	call	SoundCommand
	cpw	(XIZ+TASK_ARG),0
	jr	Z,DeleteAllData.skip2
	ldw	(XIZ+TASK_FUNC),0xD397
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
DeleteAllData.skip2:
	call	sub_206847
	ld	A,0
	ld	XHL,DeleteDataDeletingText
	call	DrawBoxString
	call	swp_20DAE1
	ldb	(wOptionMessageSpeed),3
	ldb	(wOptionAnimation),0xFF
	ld	A,0
	ld	XHL,DeleteDataFinishedText
	call	DrawBoxString
	ld	XHL,dyn_20D71E
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xCF7C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
DeleteAllData.skip3:
	ld	WA,0x82
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),0xD397
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
DeleteAllData.skip4:
	ld	WA,0x80
	call	SoundCommand
	cpb	(XIZ+TASK_ARG),0
	ldb	(XIZ+TASK_ARG),1
	ret	Z
	ldb	(XIZ+TASK_ARG),0
	ret

c_20D59E	section	code abs=0x20D59E

swp_20D59E:
	ld	XHL,dyn_20D71E
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_ARG),0xC
	ldw	(XIZ+0x10),0
	call	swp_20DC8E
	ld	XHL,dyn_20D6DF
	call	StartChildTask
	task_wait
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jr	Z,swp_20D59E.skip2
	call	sub_20DF80
	ld	XHL,swp_20E131
	call	StartChildTask
	task_wait
	call	DrawSaveSlotList
	cpb	(wYesNoChoice),1
	jr	Z,swp_20D59E.skip
	ldw	(XIZ+TASK_FUNC),0xD5DA
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
swp_20D59E.skip:
	ld	WA,0x81
	call	SoundCommand
	ld	A,(wSaveSlot)
	call	swp_20DAFD
	call	sub_20E012
	ld	XHL,swp_20E1BC
	call	StartChildTask
	task_wait
	call	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),0xD5DA
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
swp_20D59E.skip2:
	ld	XHL,dyn_20D71E
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xD1BD
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20D684	section	code abs=0x20D684

sub_20D684:
	ld	E,(wConfigCursor)
	ld	D,0
	mul	XDE,0x28
	add	DE,0x2C
	ld	BC,8
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	cpb	(wOptionMessageSpeed),3
	scc	Z,BC
	mul	BC,0x28
	add	BC,0x40
	ld	DE,0x34
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	cpb	(wOptionAnimation),0
	scc	Z,BC
	mul	BC,0x28
	add	BC,0x40
	ld	DE,0x5C
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ret

c_20D6DF	section	code abs=0x20D6DF

dyn_20D6DF:
	calr	MainMenuGraphics
	ldb	(SCROLL_PRIORITY),0
	ld	XHL,dyn_20D75D
	call	StartChildTask
	task_wait
	ldb	(SCROLL_PRIORITY),0x80
	ld	XHL,dyn_20D77B
	call	StartChildTask
	task_wait
	jp	EndTask

c_20D71E	section	code abs=0x20D71E

dyn_20D71E:
	calr	MainMenuGraphics
	ldb	(SCROLL_PRIORITY),0x80
	ld	XHL,dyn_20D75D
	call	StartChildTask
	task_wait
	ldb	(SCROLL_PRIORITY),0
	ld	XHL,dyn_20D77B
	call	StartChildTask
	task_wait
	jp	EndTask

c_20D75D	section	code abs=0x20D75D

dyn_20D75D:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),0xD76C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xB
	jp	NC,EndTask
	jr	dyn_20D7BB

c_20D77B	section	code abs=0x20D77B

dyn_20D77B:
	ldw	(XIZ+TASK_ARG),0xB
	ldw	(XIZ+TASK_FUNC),0xD78A
	ldw	(XIZ+TASK_FUNC_HI),0x20
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0
	jp	MI,EndTask
	jr	dyn_20D7BB

c_20D799	section	code abs=0x20D799

; [play] main_menu, config_menu, load_menu
MainMenuGraphics:
	cpb	(wColorFlags),0
	ld	XDE,Map_2876C4
	ld	XHL,Map_287ED4
	jr	Z,0x20D7B4
	ld	XDE,Map_29C88F
	ld	XHL,Map_29D39A
	ld	(XIZ+0x12),XDE
	ld	(XIZ+0x16),XHL
	ret

c_20D7BB	section	code abs=0x20D7BB

dyn_20D7BB:
	ld	WA,0x161
	ld	XHL,(XIY+0x12)
	ld	BC,(XIZ+TASK_ARG)
	neg	BC
	ld	DE,0
	call	DrawTilemap
	ld	WA,0xB5
	ld	XHL,(XIY+0x16)
	ld	BC,(XIZ+TASK_ARG)
	add	BC,0xA
	ld	DE,0
	call	DrawTilemap
	ld	C,0xA
	sub	C,(XIZ+TASK_ARG)
	cp	C,0xA
	ret	Z
	ld	E,0
	ld	B,(XIZ+TASK_ARG)
	sll	1,B
	ld	D,0x13
	ld	WA,0
	call	sub_206768
	ret

c_20D7FA	section	code abs=0x20D7FA

; [code] AP/SP/RP/MP 999, level 99, skills 1/3, CalcUnitStats; no reader found (no call, no pointer)
SetMaxPilotStats:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	BC,0x400
	dec	1,BC
	ld	XHL,0x9000
	ld	XDE,0x9002
	ldw	(XHL),0
	ldirw	(XDE+),(XHL+)
	ld	A,0
	ld	(wFadeLevel),A
	calr	dyn_20D84E
	ldw	(wPilotAP),0x3E7
	ldw	(wPilotSP),0x3E7
	ldw	(wPilotRP),0x3E7
	ldw	(wPilotMP),0x3E7
	ldb	(wPlayerLevel),0x63
	ldw	(wSkill1),1
	ldw	(wSkill2),3
	call	CalcUnitStats
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DACC	section	code abs=0x20DACC

dyn_20DACC:
	ld	XHL,0
	or	A,A
	ret	Z
	dec	1,A
	ld	L,A
	mul	XHL,0x290
	add	XHL,0x30
	ret

c_20DAE1	section	code abs=0x20DAE1

swp_20DAE1:
	ld	RW3,0x16
	call	BiosCall
swp_20DAE1.loop:
	ld	B,0x11
	call	swp_20776F
	cp	RA3,0
	jr	NZ,swp_20DAE1.loop
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DAFD	section	code abs=0x20DAFD

swp_20DAFD:
	push	A
	ld	RW3,0x16
	call	BiosCall
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	sub_2077A6
	pop	A
	call	dyn_20DACC
	add	XHL,0x4000
	ld	BC,0x27D
	ld	A,0xFF
swp_20DAFD.loop:
	ld	(XHL+),A
	djnz	BC,swp_20DAFD.loop
swp_20DAFD.loop2:
	ld	B,0x11
	call	swp_20776F
	cp	RA3,0
	jr	NZ,swp_20DAFD.loop2
	ld	BC,8
	ld	XDE,0xFA000
	ld	XHL,wTextBuffer
	call	sub_207788
	cp	RA3,0
	jr	NZ,swp_20DAFD.loop2
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DBDE	section	code abs=0x20DBDE

loc_20DBDE:
	ld	RW3,0x16
	call	BiosCall
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	sub_2077A6
	ld	A,0
	call	dyn_20DACC
	add	XHL,0x4000
	ld	XDE,XHL
	ld	XHL,HeaderCartId
	ld	BC,0x10
	ldir	(XDE+),(XHL+)
	ld	XHL,wOptionMessageSpeed
	ld	BC,2:16
	ldir	(XDE+),(XHL+)
loc_20DBDE.loop:
	ld	B,0x11
	call	swp_20776F
	cp	RA3,0
	jr	NZ,loc_20DBDE.loop
	ld	BC,8
	ld	XDE,0xFA000
	ld	XHL,wTextBuffer
	call	sub_207788
	cp	RA3,0
	jr	NZ,loc_20DBDE.loop
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DC7C	section	code abs=0x20DC7C

swp_20DC7C:
	ldb	(wSaveMenuMode),0
	ldb	(wSaveSlot),1
	call	dyn_206825
	calr	DrawSaveSlotList
	ret

c_20DC8E	section	code abs=0x20DC8E

swp_20DC8E:
	ldb	(wSaveMenuMode),2
	ldb	(wSaveSlot),1
	call	dyn_206825
	calr	DrawSaveSlotList
	ret

c_20E2B0	section	code abs=0x20E2B0

dyn_20E2B0:
	ld	XHL,TitleScreen
	call	StartChildTask
	ld	XHL,dyn_20E36F
	call	StartChildTask
	ldw	(XIZ+TASK_FUNC),0xE2CD
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20E2CD	section	code abs=0x20E2CD

dyn_20E2CD:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	NZ,dyn_20E2DC
	decw	1,(XIZ+TASK_ARG)
	jr	Z,0x20E2E1
	ret

c_20E2DC	section	code abs=0x20E2DC

dyn_20E2DC:
	ldw	(XIY+0xE),1
	call	dyn_20636D
	call	EndTask
	ret

c_20E2EA	section	code abs=0x20E2EA

; [play] title_press_a_button, main_menu
TitleScreen:
	ldw	(XIZ+TASK_ARG),0xB4
	ldw	(XIZ+TASK_FUNC),0xE2F9
	ldw	(XIZ+TASK_FUNC_HI),0x20
	decw	1,(XIZ+TASK_ARG)
	ret	NZ
	ldw	(XIZ+0x10),2
	ldw	(XIZ+TASK_FUNC),0xE30D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	XHL,Map_2E513D
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,TitleScreen.skip
	ld	XHL,Map_2E573D
TitleScreen.skip:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	ldw	(XIZ+TASK_FUNC),0xE336
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20E336	section	code abs=0x20E336

swp_20E336:
	ld	XHL,Map_2E4EE3
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,swp_20E336.skip
	ld	XHL,Map_2E54E3
swp_20E336.skip:
	ld	WA,0xE7
	ld	BC,0
	ld	DE,2
	call	DrawTilemapScr2
	decw	1,(XIZ+0x10)
	jr	Z,swp_20E336.skip2
	ldw	(XIZ+TASK_FUNC),0xE30D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
swp_20E336.skip2:
	ldw	(XIZ+TASK_FUNC),0xE2EA
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20E36F	section	code abs=0x20E36F

dyn_20E36F:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),0xE37E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpw	(XIZ+TASK_ARG),0x348
	jp	Z,EndTask
	ld	XHL,Map_2E4292
	incw	1,(XIZ+TASK_ARG)
	ld	WA,(XIZ+TASK_ARG)
	srl	5,WA
	and	WA,1
	jr	Z,0x20E3A1
	ld	XHL,Map_2E42B0
	ld	WA,0xC
	ld	BC,0x18
	ld	DE,0x58
	call	dyn_2069C8
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
	ld	XHL,dyn_20E8E8
	call	StartChildTask
	task_wait
	ld	XHL,TitleReveal
	call	StartChildTask
	task_wait
	calr	ClearTilemapScr2
	ld	XHL,dyn_20E1D4
	call	StartChildTask
	ldw	(XHL+0xE),0x14
	task_wait
	calr	ClearTilemapScr2
	call	EndTask
	ret

c_20E930	section	code abs=0x20E930

; [play] intro_title_reveal
TitleReveal:
	ldw	(XIZ+TASK_ARG),0x14
	ldw	(XIZ+TASK_FUNC),0xE93F
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	XHL,Map_2E4D97
	ld	A,(wColorFlags)
	and	A,0x10
	jr	NZ,0x20E952
	ld	XHL,Map_2E5397
	ld	BC,(XIZ+TASK_ARG)
	ld	WA,0xE7
	ld	DE,2
	call	DrawTilemapScr2
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0
	jp	LT,EndTask
	ret

c_20F730	section	code abs=0x20F730

dyn_20F730:
	cp	C,0xFB
	jr	NZ,dyn_20F74D
	ld	DE,0x173
	ld	XBC,wPartnerName

c_20F73D	section	code abs=0x20F73D

loc_20F73D:
	ld	(XWA+),DE
	inc	2,DE
	inc	1,XBC
	cpb	(XBC),0xFF
	jr	NZ,loc_20F73D
	inc	1,XHL
	jr	0x20F714

c_20F74D	section	code abs=0x20F74D

dyn_20F74D:
	ld	C,(XHL+)
	cp	C,0
	jr	NZ,dyn_20F75B
	ldw	(XWA+),0
	jr	0x20F797

c_20F75B	section	code abs=0x20F75B

dyn_20F75B:
	exts	BC
	ld	DE,BC
	extz	XDE
	sll	1,XDE
	add	XDE,0x5DF8
	push	XDE
	ld	DE,(XDE)
	cp	DE,0xFFFF
	jr	Z,dyn_20F779
	ld	(XWA+),DE
	pop	XDE
	jr	0x20F797

c_20F779	section	code abs=0x20F779

dyn_20F779:
	pop	XDE
	push	XHL
	ld	HL,(XIY+0x18)
	ld	(XDE),HL
	pop	XHL
	push	XWA
	push	XHL
	ld	L,C
	ld	WA,(XIY+0x18)
	call	dyn_207093
	pop	XHL
	pop	XWA
	ld	BC,(XIY+0x18)
	ld	(XWA+),BC
	incw	1,(XIY+0x18)
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0x14
	jrl	NZ,0x20F714
	inc	1,XHL
	ld	(XIY+0xE),XHL
	ret

c_20F7A8	section	code abs=0x20F7A8

loc_20F7A8:
	call	EndTask
	ret

c_20F7AD	section	code abs=0x20F7AD

; [play] Select Player screen task (select_player_* screens only)
SelectPlayerTask:
	ld	WA,0x14
	call	PlayMusic
	ld	WA,0x35
	call	SoundCommand
	call	ClearTilemapScr1
	call	ClearTilemapScr2
	calr	OpenSelectPlayerBoxes
	ld	XHL,SelectPlayerNames
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	NZ,PlayerNameEntryTask
	ldb	(wPlayerRace),0
	ldb	(wPartnerRace),0
	call	EndTask
	ret

c_20F7F3	section	code abs=0x20F7F3

; [code+play] NameEntryScreen for the player (EnterYourNameText); OK -> partner, cancel -> SelectPlayerTask
PlayerNameEntryTask:
	call	ClearTilemapScr1
	call	ClearTilemapScr2
	ldw	(XIZ+TASK_ARG),0
	calr	NameEntryScreen
	ld	XHL,NameEntrySetup
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	NZ,NameEntryTask
	jr	SelectPlayerTask

c_20F823	section	code abs=0x20F823

; [code+play] runs NameEntryScreen (name_entry* / names_confirm)
NameEntryTask:
	ldw	(XIZ+TASK_ARG),1
	calr	NameEntryScreen
	ld	XHL,NameEntrySetup
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	Z,PlayerNameEntryTask
	call	ClearTilemapScr1
	call	ClearTilemapScr2
	calr	OpenSelectPlayerBoxes
	ld	XHL,ConfirmNames
	call	StartChildTask
	task_wait
	cpw	(XIZ+0x10),0
	jr	Z,PlayerNameEntryTask
	call	EndTask
	ret

c_20F8DA	section	code abs=0x20F8DA

; [play] name_entry, select_player_confirm
NameEntrySetup:
	ld	XHL,DrawEnteredNameTask
	call	StartChildTask
	ld	WA,0xD8
	ld	XHL,Gfx_2C8D88
	call	LoadCompressedTiles
	ld	A,1
	ld	C,1
	ld	XHL,Pal_2C8D6C
	call	LoadPalettes
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+0x10),0
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),1
	ldw	(XIZ+0x16),1
	ldw	(XIZ+0x18),0
	ldw	(XIZ+0x1A),0
	ldw	(XIZ+0x1C),0
	ldw	(XIZ+0x1E),0
	ldw	(XIZ+0x20),0
	ldw	(XIZ+0x22),0
	ldw	(XIZ+0x24),0
	ldw	(XIZ+0x26),0x10
	ldw	(XIZ+0x28),0
	ldw	(XIZ+0x2A),0
	ld	XDE,wPlayerName
	ld	A,(wPlayerRace)
	cpw	(XIY+0xE),0
	jr	Z,0x20F960
	ld	XDE,wPartnerName
	ld	A,(wPartnerRace)
	ld	XHL,XIZ
	add	XHL,0x1A
	cpb	(XDE),0xFF
	jr	Z,dyn_20F97A
	incw	1,(XIZ+0x18)
	ld	WA,0
	ld	A,(XDE+)
	ld	(XHL+),WA
	jr	0x20F968

c_20F97A	section	code abs=0x20F97A

dyn_20F97A:
	ldw	(XIZ+TASK_FUNC),0xF985
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20F985	section	code abs=0x20F985

dyn_20F985:
	ld	A,(wJoyHeld)
	cp	A,(XIZ+0x29)
	jr	NZ,dyn_20F9AF
	decw	1,(XIZ+0x26)
	cpw	(XIZ+0x26),0
	jr	Z,dyn_20F99E
	ldb	(XIZ+0x28),0
	jr	0x20F9C2

c_20F99E	section	code abs=0x20F99E

dyn_20F99E:
	ld	A,(wJoyHeld)
	ld	(XIZ+0x29),A
	ld	(XIZ+0x28),A
	ldw	(XIZ+0x26),7
	jr	0x20F9C2

c_20F9AF	section	code abs=0x20F9AF

dyn_20F9AF:
	ldw	(XIZ+0x26),0x10
	ld	A,(wJoyPressed)
	ld	(XIZ+0x28),A
	ld	A,(wJoyHeld)
	ld	(XIZ+0x29),A
	cpw	(XIZ+0x16),1
	jrl	NZ,dyn_20FAF2
	ld	A,(XIZ+0x28)
	and	A,4
	jr	Z,0x20F9D9
	ld	WA,0x80
	call	SoundCommand
	ld	A,(XIZ+0x28)
	and	A,8
	jr	Z,0x20F9E8
	ld	WA,0x80
	call	SoundCommand
	ld	A,(XIZ+0x28)
	and	A,1
	jr	Z,dyn_20FA0C
	ld	WA,0x80
	call	SoundCommand
	decw	1,(XIZ+0x14)
	cpw	(XIZ+0x14),0xFFFF
	jr	NZ,dyn_20FA0C
	ldw	(XIZ+0x16),0
	ldw	(XIZ+0x10),8
	ret

c_20FA0C	section	code abs=0x20FA0C

dyn_20FA0C:
	ld	A,(XIZ+0x28)
	and	A,2
	jr	Z,dyn_20FA30
	ld	WA,0x80
	call	SoundCommand
	incw	1,(XIZ+0x14)
	cpw	(XIZ+0x14),2
	jr	NZ,dyn_20FA30
	ldw	(XIZ+0x16),0
	ldw	(XIZ+0x10),0
	ret

c_20FA30	section	code abs=0x20FA30

dyn_20FA30:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jrl	Z,dyn_20FAC6
	ld	WA,(XIZ+0x14)
	cp	WA,0
	jr	Z,0x20FA45
	cp	WA,1
	jr	Z,dyn_20FA59
	ld	WA,0x82
	call	SoundCommand
	ldb	(XIY+0x10),0
	call	dyn_20636D
	call	EndTask
	ret

c_20FA59	section	code abs=0x20FA59

dyn_20FA59:
	ld	BC,(XIZ+0x18)
	cp	BC,0
	jr	NZ,dyn_20FA69
	ld	WA,0x83
	call	SoundCommand
	jr	dyn_20FAC6

c_20FA69	section	code abs=0x20FA69

dyn_20FA69:
	ld	WA,(XIZ+0x1A)
	add	WA,(XIZ+0x1C)
	add	WA,(XIZ+0x1E)
	add	WA,(XIZ+0x20)
	add	WA,(XIZ+0x22)
	add	WA,(XIZ+0x24)
	cp	WA,0
	jr	NZ,StoreEnteredName
	ld	WA,0x83
	call	SoundCommand
	jr	dyn_20FAC6

c_20FA88	section	code abs=0x20FA88

; [code] entered chars -> wPlayerName (0x5013) or wPartnerName (0x502F), 0xFF-terminated
StoreEnteredName:
	ld	WA,0x81
	call	SoundCommand
	ld	DE,0x5013
	cpw	(XIY+0xE),0
	jr	Z,0x20FA9C
	ld	DE,0x502F
	ld	WA,0x81
	call	SoundCommand
	extz	XDE
	ld	HL,0x1A
	extz	XHL
	add	XHL,XIZ
	ld	WA,(XHL+)
	ld	(XDE+),A
	djnz	BC,0x20FAAC
	ldb	(XDE),0xFF
	call	dyn_20636D
	call	EndTask
	ldw	(XIY+0x10),1
	ret

c_20FAC6	section	code abs=0x20FAC6

dyn_20FAC6:
	incw	1,(XIZ+0x2A)
	ld	WA,(XIZ+0x2A)
	and	WA,0x10
	jr	Z,0x20FAF1
	ld	BC,0
	ld	HL,(XIZ+0x14)
	extz	XHL
	sll	1,XHL
	add	XHL,Data_226C12
	ld	DE,(XHL)
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ret

c_20FAF2	section	code abs=0x20FAF2

dyn_20FAF2:
	ld	A,(XIZ+0x28)
	and	A,4
	jr	Z,0x20FB10
	ld	WA,0x80
	call	SoundCommand
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xFFFF
	jr	NZ,0x20FB10
	ldw	(XIZ+TASK_ARG),9
	ld	A,(XIZ+0x28)
	and	A,8
	jr	Z,0x20FB2E
	ld	WA,0x80
	call	SoundCommand
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xA
	jr	NZ,0x20FB2E
	ldw	(XIZ+TASK_ARG),0
	ld	A,(XIZ+0x28)
	and	A,2
	jr	Z,dyn_20FB52
	ld	WA,0x80
	call	SoundCommand
	incw	1,(XIZ+0x10)
	cpw	(XIZ+0x10),9
	jr	LT,dyn_20FB52
	ldw	(XIZ+0x16),1
	ldw	(XIZ+0x14),1
	ret

c_20FB52	section	code abs=0x20FB52

dyn_20FB52:
	ld	A,(XIZ+0x28)
	and	A,1
	jr	Z,dyn_20FB76
	ld	WA,0x80
	call	SoundCommand
	decw	1,(XIZ+0x10)
	cpw	(XIZ+0x10),0xFFFF
	jr	GT,dyn_20FB76
	ldw	(XIZ+0x16),1
	ldw	(XIZ+0x14),1
	ret

c_20FB76	section	code abs=0x20FB76

dyn_20FB76:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	Z,0x20FBEA
	ld	WA,(XIZ+0x18)
	cp	WA,6
	jr	GE,dyn_20FB76.skip
	ld	WA,0x81
	call	SoundCommand
	jr	0x20FBA0
dyn_20FB76.skip:
	ldw	(XIZ+0x14),1
	ldw	(XIZ+0x16),1
	ld	WA,0x83
	call	SoundCommand
	ld	BC,(XIZ+0x10)
	mul	XBC,0xA
	ld	DE,(XIZ+TASK_ARG)
	inc	1,DE
	add	BC,DE
	cpw	(XIZ+0x12),0
	jr	Z,dyn_20FBBF
	add	XBC,NameEntryChars
	ld	A,(XBC)
	jr	0x20FBC7

c_20FBBF	section	code abs=0x20FBBF

dyn_20FBBF:
	add	XBC,NameEntryChars
	ld	A,(XBC)
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	1,HL
	add	HL,0x1A
	add	XHL,XIZ
	extz	WA
	ld	(XHL),WA
	incw	1,(XIZ+0x18)
	cpw	(XIZ+0x18),7
	jr	Z,dyn_20FBBF.skip
	jr	0x20FC3B
dyn_20FBBF.skip:
	ldw	(XIZ+0x18),6
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	Z,0x20FC3B
	ld	WA,0x82
	call	SoundCommand
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	1,HL
	add	HL,0x1A
	add	XHL,XIZ
	ldw	(XHL),0
	decw	1,(XIZ+0x18)
	cpw	(XIZ+0x18),0xFFFF
	jr	NZ,0x20FC22
	ld	WA,0x83
	call	SoundCommand
	ldw	(XIZ+0x18),0
	ld	WA,0x82
	call	SoundCommand
	ld	HL,(XIZ+0x18)
	extz	XHL
	sll	1,HL
	add	HL,0x1A
	add	XHL,XIZ
	ldw	(XHL),0
	ld	BC,(XIZ+TASK_ARG)
	ld	DE,(XIZ+0x10)
	mul	XBC,8
	mul	XDE,8
	add	BC,4
	add	DE,0x24
	ld	XHL,Map_2C8D74
	incw	1,(XIZ+0x2A)
	ld	WA,(XIZ+0x2A)
	and	WA,0x10
	jr	Z,0x20FC67
	ld	XHL,Map_2C8D7E
	ld	WA,0xD8
	call	dyn_2069C8
	ret

c_20FC6F	section	code abs=0x20FC6F

swp_20FC6F:
	ld	A,1
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	ld	XHL,NameEntryChars
	call	DrawString
	ret

c_20FC87	section	code abs=0x20FC87

; [code] Enter your name / partner name
NameEntryScreen:
	ld	A,0
	ld	C,0x14
	ld	E,4
	ld	HL,0xC
	call	OpenTextBox
	ld	A,0
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	PlaceTextBoxXWA
	ld	XHL,EnterYourNameText
	cpw	(XIZ+TASK_ARG),0
	jr	Z,0x20FCB3
	ld	XHL,EnterPartnerNameText
	call	DrawString
	ld	A,(wPlayerRace)
	extz	WA
	ld	HL,WA
	cpw	(XIZ+TASK_ARG),0
	jr	Z,0x20FCCE
	ld	A,(wPartnerRace)
	extz	WA
	ld	HL,WA
	add	HL,0xA
	ld	WA,0xDA
	ld	BC,0xD
	ld	DE,4
	call	DrawPortraitAt
	ld	A,1
	ld	C,0xA
	ld	E,9
	ld	HL,0x30
	call	OpenTextBoxNoWait
	ld	A,1
	call	GetTextBox
	ld	C,1
	ld	E,5
	call	PlaceTextBoxXWA
	ld	XHL,NameEntryChars
	call	DrawString
	ld	A,3
	ld	C,6
	ld	E,2
	ld	HL,0xBA
	call	OpenTextBoxNoWait
	ld	A,3
	call	GetTextBox
	ld	C,1
	ld	E,0xF
	call	PlaceTextBoxXWA
	ld	XHL,CancelEndText
	call	DrawString
	ld	A,2
	ld	C,0xD
	ld	E,5
	ld	HL,0x8A
	call	OpenTextBox
	ld	A,2
	call	GetTextBox
	ld	C,7
	ld	E,0xE
	call	PlaceTextBoxXWA
	ld	XHL,SelectPutBackText
	call	DrawString
	ret

c_20FD4B	section	code abs=0x20FD4B

; [code] text boxes 0-5 at fixed places + raw tiles 0x2C861B (Select Player / name confirm)
OpenSelectPlayerBoxes:
	ld	A,5
	ld	C,9
	ld	E,1
	ld	HL,0xD3
	call	OpenTextBoxNoWait
	ld	A,5
	call	GetTextBox
	ld	C,6
	ld	E,0xD
	call	PlaceTextBoxXWA
	ld	A,3
	ld	C,7
	ld	E,1
	ld	HL,0xC5
	call	OpenTextBoxNoWait
	ld	A,3
	call	GetTextBox
	ld	C,1
	ld	E,0
	call	PlaceTextBoxXWA
	ld	A,4
	ld	C,7
	ld	E,1
	ld	HL,0xCC
	call	OpenTextBoxNoWait
	ld	A,4
	call	GetTextBox
	ld	C,0xB
	ld	E,0
	call	PlaceTextBoxXWA
	ld	A,2
	ld	C,0x14
	ld	E,5
	ld	HL,0x84
	call	OpenTextBox
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0xE
	call	PlaceTextBoxXWA
	ld	A,0
	ld	C,8
	ld	E,0xC
	ld	HL,0xC
	call	OpenTextBox
	ld	A,0
	call	GetTextBox
	ld	C,1
	ld	E,1
	call	PlaceTextBoxXWA
	ld	A,1
	ld	C,8
	ld	E,0xC
	ld	HL,0x48
	call	OpenTextBox
	ld	A,1
	call	GetTextBox
	ld	C,0xB
	ld	E,0x21
	call	PlaceTextBoxXWA
	ld	WA,0xDC
	ld	XHL,RawTiles_2C861B
	call	LoadRawTiles
	ret

c_20FDFA	section	code abs=0x20FDFA

; [play] names_confirm
ConfirmNames:
	ld	XHL,OkYesNoText2
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	call	DrawString
	ld	XHL,wPlayerName
	ld	A,3
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	call	DrawString
	ld	XHL,wPartnerName
	ld	A,4
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	call	DrawString
	ld	E,2
	ld	C,2
	ld	B,6
	ld	D,0xA
	ld	WA,0
	call	sub_206768
	ld	A,(wPlayerRace)
	extz	WA
	ld	HL,WA
	add	HL,0xA
	ld	BC,2
	ld	DE,2
	ld	WA,0xC
	call	DrawPortraitAt
	ld	E,0xC
	ld	C,0x22
	ld	B,6
	ld	D,0xA
	ld	WA,0
	call	sub_206768
	ld	A,(wPartnerRace)
	extz	WA
	ld	HL,WA
	add	HL,0xA
	ld	BC,0xC
	ld	DE,0x22
	ld	WA,0x48
	call	DrawPortraitAt
	ldw	(XIZ+TASK_ARG),1
	ldw	(XIZ+TASK_FUNC),0xFE9A
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,0x20FEB6
	cpw	(XIZ+TASK_ARG),1
	jr	Z,0x20FEB6
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+TASK_ARG),1
	ld	DE,0x84
	ld	BC,0x20
	cpw	(XIZ+TASK_ARG),1
	jr	Z,0x20FEC6
	ld	BC,0x50
	incw	1,(XIZ+0x10)
	ld	WA,(XIZ+0x10)
	and	WA,0x10
	jr	Z,0x20FEDF
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	and	A,D_RIGHT
	jr	Z,0x20FEFB
	cpw	(XIZ+TASK_ARG),0
	jr	Z,0x20FEFB
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+TASK_ARG),0
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	NZ,ConfirmNames.skip
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	ret	Z
	cpw	(XIZ+TASK_ARG),0
	jr	Z,ConfirmNames.skip
	ldw	(XIY+0x10),1
	ld	WA,0x81
	call	SoundCommand
	call	EndTask
	ret
ConfirmNames.skip:
	ld	WA,0x82
	call	SoundCommand
	ldw	(XIY+0x10),0
	call	EndTask
	ret

c_20FF36	section	code abs=0x20FF36

; [code+play] Player / Partner names on Select Player
SelectPlayerNames:
	ld	A,3
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	ld	XHL,PlayerText
	call	DrawString
	ld	A,4
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	ld	XHL,PartnerText
	call	DrawString
	ld	WA,0xFFFF
	ld	XHL,wPlayerName
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	XHL,wPartnerName
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ld	(XHL+),WA
	ldw	(XIZ+TASK_ARG),1
	ldw	(XIZ+0x12),1
	ldw	(XIZ+0x14),0x84
	ldw	(XIZ+0x18),1
	ldw	(XIZ+0x1A),0
	ldw	(XIZ+TASK_FUNC),0xFFBE
	ldw	(XIZ+TASK_FUNC_HI),0x20
	incw	1,(XIZ+0x1A)
	ld	WA,(XIZ+0x1A)
	and	WA,0x10
	jr	Z,0x20FFEF
	ld	BC,0x48
	ld	DE,0x30
	ld	WA,0x3EDC
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	BC,0
	ld	DE,0x30
	ld	WA,0xBEDC
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,0x210007
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x18),1
	decw	1,(XIZ+TASK_ARG)
	ld	A,(wJoyPressed)
	and	A,D_RIGHT
	jr	Z,0x21001F
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x18),1
	incw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0xB
	jr	NZ,0x21002B
	ldw	(XIZ+TASK_ARG),1
	cpw	(XIZ+TASK_ARG),0
	jr	NZ,0x210037
	ldw	(XIZ+TASK_ARG),0xA
	ld	WA,(XIZ+TASK_ARG)
	and	WA,1
	jr	NZ,SelectPlayerScreen
	ld	WA,(XIZ+TASK_ARG)
	dec	1,WA
	jr	0x21004C

c_210047	section	code abs=0x210047

; [code+play] "Select Player" with portraits
SelectPlayerScreen:
	ld	WA,(XIZ+TASK_ARG)
	inc	1,WA
	ld	(XIZ+0x16),WA
	cpw	(XIZ+0x18),0
	jr	Z,0x210081
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0xA
	ld	WA,0xC
	ld	BC,2
	ld	DE,2
	call	DrawPortraitAt
	ld	HL,(XIZ+0x16)
	add	HL,0xA
	ld	WA,0x48
	ld	BC,0xC
	ld	DE,0x22
	call	DrawPortraitAt
	ldw	(XIZ+0x18),0
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	ld	XHL,SelectPlayerSelectText
	call	DrawString
	ld	A,5
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	ld	HL,(XIZ+TASK_ARG)
	extz	XHL
	dec	1,HL
	srl	1,XHL
	sll	2,XHL
	add	XHL,RaceNameTexts
	ld	XHL,(XHL)
	call	DrawString
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	Z,SelectPlayerAskOk
	ld	WA,0x82
	call	SoundCommand
	ldb	(XIY+0x10),0
	call	EndTask
	ret

c_2100D8	section	code abs=0x2100D8

; [code+play] SelectPlayerScreen frame (B -> parent +0x10 = 0, end) jumps here: A -> sound 0x81, clears box 2, DrawString 0x226C5B ("Ok? / Yes No"), TASK_FUNC = 0x21010A; ran on select_player_*
SelectPlayerAskOk:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	ret	Z
	ld	WA,0x81
	call	SoundCommand
	ld	A,2
	call	GetTextBox
	ld	C,0
	ld	E,0
	call	sub_20768E
	ld	XHL,OkYesNoText2
	call	DrawString
	ldw	(XIZ+TASK_FUNC),0x10A
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_21010A	section	code abs=0x21010A

; [code+play] frame set by dyn_2100D8: D_LEFT +0x12 = 1 / D_RIGHT +0x12 = 0 (sound 0x80), blinking cursor dyn_206BFF at x 0x20 (1) / 0x50 (0), A with +0x12 = 1 -> SetPlayerRacesAndNames, A with 0 or B -> sound 0x82, dyn_210204 (back to 0x20FFBE); ran on select_player_confirm
SelectPlayerConfirm:
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,dyn_210128
	cpw	(XIZ+0x12),1
	jr	Z,0x210144
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x12),1
	jr	0x210144

c_210128	section	code abs=0x210128

dyn_210128:
	ld	A,(wJoyPressed)
	and	A,D_RIGHT
	jr	Z,0x210144
	cpw	(XIZ+0x12),0
	jr	Z,0x210144
	ld	WA,0x80
	call	SoundCommand
	ldw	(XIZ+0x12),0
	ld	BC,0x20
	ld	DE,(XIZ+0x14)
	ld	WA,(XIZ+0x12)
	and	WA,1
	jr	NZ,0x210156
	ld	BC,0x50
	incw	1,(XIZ+0x1A)
	ld	WA,(XIZ+0x1A)
	and	WA,0x10
	jr	Z,0x21016F
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	and	A,A_BUTTON
	jr	Z,dyn_210183
	ld	WA,(XIZ+0x12)
	and	WA,1
	jr	NZ,SetPlayerRacesAndNames
	jr	0x21018C

c_210183	section	code abs=0x210183

dyn_210183:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	ret	Z
	ld	WA,0x82
	call	SoundCommand
	jr	dyn_210204

c_210195	section	code abs=0x210195

; [code+play] wPlayerRace/wPartnerRace, default names from DefaultNames into wPlayerName/wPartnerName
SetPlayerRacesAndNames:
	ld	WA,0x81
	call	SoundCommand
	ldw	(XIY+0x10),1
	ld	WA,(XIZ+TASK_ARG)
	ld	(wPlayerRace),A
	ld	WA,(XIZ+0x16)
	ld	(wPartnerRace),A
	ld	A,(wPlayerRace)
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DefaultNames
	add	XHL,XWA
	ld	XHL,(XHL)
	inc	1,XHL
	ld	XDE,wPlayerName
	cpb	(XHL),0xFF
	jr	Z,dyn_2101D7
	ld	A,(XHL+)
	ld	(XDE+),A
	jr	0x2101CA

c_2101D7	section	code abs=0x2101D7

dyn_2101D7:
	ld	A,(wPartnerRace)
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DefaultNames
	add	XHL,XWA
	ld	XHL,(XHL)
	inc	1,XHL
	ld	XDE,wPartnerName
	cpb	(XHL),0xFF
	jr	Z,dyn_2101FF
	ld	A,(XHL+)
	ld	(XDE+),A
	jr	0x2101F2

c_2101FF	section	code abs=0x2101FF

dyn_2101FF:
	call	EndTask
	ret

c_210204	section	code abs=0x210204

dyn_210204:
	call	sub_206847
	ldw	(XIZ+TASK_FUNC),0xFFBE
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_21D5E9	section	code abs=0x21D5E9

dyn_21D5E9:
	ld	XHL,IntroBackground
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xD60B
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_21D60B	section	code abs=0x21D60B

; [code] dyn_206863, MainMenuSetup child, then wMainMenuCursor 1 -> NewGameSetup (set by dyn_20D0E8, menu option 0), 2 -> swp_21D738 (MainMenuLoadTask incb after a load), else dyn_21D5E9 (IntroBackground, then back here); also the TASK_FUNC NewGameSetup returns to when wPlayerRace == 0
MainMenuTask:
	call	dyn_206863
	ld	XHL,MainMenuSetup
	call	StartChildTask
	task_wait
	cpb	(wMainMenuCursor),1
	ld	XHL,NewGameSetup
	jr	Z,0x21D643
	cpb	(wMainMenuCursor),2
	ld	XHL,swp_21D738
	jr	Z,0x21D643
	ld	XHL,dyn_21D5E9
	ld	(XIZ+TASK_FUNC),XHL
	ret
