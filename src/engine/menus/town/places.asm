; engine/menus/town/places.asm: the town place task: Square menu, place pictures, talk slots, place states

c_214BEC	section	code abs=0x214BEC

; [code] town place task for the Square (StreetGoSquare): ClearScr1Tilemap, wFadeLevel = 0, TASK_ARG 1 (OpenSquareMenu), +0x23 = 0xFF, place +0x15 = 0 (Square), TASK_FUNC = TownPlaceTask
TownPlaceTaskSquare:
	call	ClearScr1Tilemap
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	A,0
	ld	(XIZ+0x15),A
	ld	XWA,TownPlaceTask
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_214C0E	section	code abs=0x214C0E

; [code] town place task for the Works (StreetGoWorks): +0x15 = 7 at story stage 0 and 8 at stage 0xA while EVENT_TALKED_RENAB is clear (both clear SCR1 and SCR2), else 5 (Works, wFadeLevel = 0); then TASK_ARG 5, +0x23 = 0xFF, TASK_FUNC = TownPlaceTask
TownPlaceTaskWorks:
	call	GetStoryStage
	cp	A,0
	jr	NZ,TownPlaceTaskWorksEnding
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownPlaceTaskWorksEnding
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	ld	A,7
	ld	(XIZ+0x15),A
	jr	TownPlaceTaskWorksPlace5.skip

c_214C30	section	code abs=0x214C30

; [code] TownPlaceTaskWorks, story stage not 0: at stage 0xA while EVENT_TALKED_RENAB is clear, ClearScr1Tilemap + ClearScr2Tilemap and place +0x15 = 8 (TalkPlace8 "One year later... At the capital of Rhafiace"), else TownPlaceTaskWorksPlace5
TownPlaceTaskWorksEnding:
	call	GetStoryStage
	cp	A,0xA
	jr	NZ,TownPlaceTaskWorksPlace5
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownPlaceTaskWorksPlace5
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	ld	A,8
	ld	(XIZ+0x15),A
	jr	TownPlaceTaskWorksPlace5.skip

c_214C53	section	code abs=0x214C53

; [code] TownPlaceTaskWorks tail: ClearScr1Tilemap, wFadeLevel = 0, place +0x15 = 5 (Works); the place-7 / place-8 paths join after the place store: TASK_ARG 5 (TownPlaceEnter), +0x23 = 0xFF, TASK_FUNC = TownPlaceTask
TownPlaceTaskWorksPlace5:
	call	ClearScr1Tilemap
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,5
	ld	(XIZ+0x15),A
TownPlaceTaskWorksPlace5.skip:
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,TownPlaceTask
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_214C75	section	code abs=0x214C75

; [code] town place task for the Shop (StreetGoShop): ClearScr1Tilemap, wFadeLevel = 0, TASK_ARG 5, +0x23 = 0xFF, place +0x15 = 6 (Shop), TASK_FUNC = TownPlaceTask
TownPlaceTaskShop:
	call	ClearScr1Tilemap
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	A,6
	ld	(XIZ+0x15),A
	ld	XWA,TownPlaceTask
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_214C97	section	code abs=0x214C97

; [code] the town place task, by TASK_ARG: 1 -> 2, 2 OpenSquareMenu, 3 SquareMenuInput, 4 TalkMenuInput, 5 TownPlaceEnter, 6 TownTalkDispatch, 7 CyriusTalkDispatch, 8 HelmutTalkDispatch, 9 WorksProtectorScene, 0xA CollaTalkDispatch, 0xB TetisGift, 0xC or other TownPlaceTaskEnd
TownPlaceTask:
	ld	A,(XIZ+TASK_ARG)
	cp	A,0xC
	jr	Z,TownPlaceTaskEnd
	cp	A,1
	jr	NZ,TownPlaceTask.skip
	ld	A,2
	ld	(XIZ+TASK_ARG),A
TownPlaceTask.skip:
	cp	A,2
	jr	NZ,TownPlaceTaskState3
	call	OpenSquareMenu
	jr	TownPlaceTaskReturn

c_214CB2	section	code abs=0x214CB2

; [code] TownPlaceTask case chain: TASK_ARG 3 -> SquareMenuInput, else the next test
TownPlaceTaskState3:
	cp	A,3
	jr	NZ,TownPlaceTaskState4
	call	SquareMenuInput
	jr	TownPlaceTaskReturn

c_214CBC	section	code abs=0x214CBC

; [code] TownPlaceTask case chain: TASK_ARG 4 -> TalkMenuInput, else the next test
TownPlaceTaskState4:
	cp	A,4
	jr	NZ,TownPlaceTaskState5
	call	TalkMenuInput
	jr	TownPlaceTaskReturn

c_214CC6	section	code abs=0x214CC6

; [code] TownPlaceTask case chain: TASK_ARG 5 -> TownPlaceEnter, else the next test
TownPlaceTaskState5:
	cp	A,5
	jr	NZ,TownPlaceTaskState6
	call	TownPlaceEnter
	jr	TownPlaceTaskReturn

c_214CD0	section	code abs=0x214CD0

; [code] TownPlaceTask case chain: TASK_ARG 6 TownTalkDispatch, 7 CyriusTalkDispatch, 8 HelmutTalkDispatch, 9 WorksProtectorScene, 0xA CollaTalkDispatch, 0xB TetisGift, else TownPlaceTaskEnd
TownPlaceTaskState6:
	cp	A,6
	jr	NZ,TownPlaceTaskState6.skip
	call	TownTalkDispatch
	jr	TownPlaceTaskReturn
TownPlaceTaskState6.skip:
	cp	A,7
	jr	NZ,TownPlaceTaskState6.skip2
	call	CyriusTalkDispatch
	jr	TownPlaceTaskReturn
TownPlaceTaskState6.skip2:
	cp	A,8
	jr	NZ,TownPlaceTaskState6.skip3
	call	HelmutTalkDispatch
	jr	TownPlaceTaskReturn
TownPlaceTaskState6.skip3:
	cp	A,9
	jr	NZ,TownPlaceTaskState6.skip4
	call	WorksProtectorScene
	jr	TownPlaceTaskReturn
TownPlaceTaskState6.skip4:
	cp	A,0xA
	jr	NZ,TownPlaceTaskState6.skip5
	call	CollaTalkDispatch
	jr	TownPlaceTaskReturn
TownPlaceTaskState6.skip5:
	cp	A,0xB
	jr	NZ,TownPlaceTaskEnd
	call	TetisGift
	jr	TownPlaceTaskReturn

c_214D10	section	code abs=0x214D10

; [code] exit case of the town place task TownPlaceTask (TASK_ARG 0xC or out of range): TASK_ARG = 1, wTownPlaceResult = task +0x11, EndTask
TownPlaceTaskEnd:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,(XIZ+0x11)
	ld	(wTownPlaceResult),A
	call	EndTask
	jr	TownPlaceTaskReturn

c_214D22	section	code abs=0x214D22

; [code] the ret every TownPlaceTask case jumps to
TownPlaceTaskReturn:
	ret

c_214D23	section	code abs=0x214D23

; [code] place task +0x15: PlacePortraits picture (DrawPortrait) and its name from the pointers at 0x249EAB (DrawBoxString)
DrawTownPlace:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x15)
	extz	WA
	extz	XWA
	push	XWA
	call	ClearScr1Tilemap
	pop	XWA
	push	XWA
	ld	XHL,PlacePortraits
	add	XHL,XWA
	ld	L,(XHL)
	extz	HL
	call	GetPictureFirstTile
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	pop	XWA
	sll	2,XWA
	ld	XHL,PlaceNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,3
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214D64	section	code abs=0x214D64

; [code] ReturnText at 0,8 in box 2 (registers saved); callers SquarePlaceMenu, ShowTalkMenu; [play] square_menu, dtown_cyrius_trade_done_* (the Return line)
DrawReturnOption:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,0
	ld	E,8
	ld	A,2
	call	SetTextBoxCursor
	ld	XHL,ReturnText
	ld	A,2
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214D82	section	code abs=0x214D82

; [code] ResetTextBox 1 + ClearTextBox 1 (registers saved); callers CyriusTradeMenuInput, HelmutPickSkill, SquareMenuSelect, TalkMenuSelect
ResetTextBox1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	ResetTextBox
	ld	A,1
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214DCA	section	code abs=0x214DCA

; [code+play] D-town / Forest / Spring
SquarePlaceMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2
	ld	A,2
	ld	XHL,PubText2
	call	DrawBoxString
	ld	A,2
	ld	XHL,DTownText2
	call	DrawBoxString
	ld	A,2
	ld	XHL,ForestText2
	call	DrawBoxString
	ld	A,2
	ld	XHL,SpringText2
	call	DrawBoxString
	calr	DrawReturnOption
	calr	DrawTownPlace
	call	ClearGreetedFlags
	ld	A,1
	call	ClearTextBox
	ld	XHL,WhereDoYouGoText2
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	(XIZ+0x2C),A
	ld	A,2
	ld	(XIZ+0xF),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214E33	section	code abs=0x214E33

; [code] town place task state 2 (TownPlaceTask): OpenBoxes123, SquarePlaceMenu (D-town / Forest / Spring), +0x10 = 0, transition SetupWindowIris.., PlayMusic 1, SoundCommand 0x21
OpenSquareMenu:
	call	OpenBoxes123
	calr	SquarePlaceMenu
	ld	A,0
	ld	(XIZ+0x10),A
	call	PlaceBoxes123
	call	SetupWindowIris
	call	StartWindowAnimToA
	call	ApplyWindowA
	ld	XWA,SONG_TOWN
	call	PlayMusic
	ld	WA,MUSIC_TOWN
	call	SoundCommand
	ret

c_214E5D	section	code abs=0x214E5D

; [code] town place task state 3 (each frame, the Square menu Pub / D-town / Forest / Spring / Return): A -> sound 0x81, SquareMenuSelect; B (joypad bit 5) -> sound 0x82, cursor +0x10 = 8 (Return), SquareMenuSelect; up / down move +0x10 over 0-3 and 8 with wrap, sound 0x80; DrawMenuCursor at x 0x60, y +0x10 * 8 + 4; +0x2D += 1
SquareMenuInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,SquareMenuInput.skip
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	calr	SquareMenuSelect
	jrl	SquareMenuInput.done
SquareMenuInput.skip:
	bit	5,A
	jr	Z,SquareMenuInput.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,8
	ld	(XIZ+0x10),A
	calr	SquareMenuSelect
	jrl	SquareMenuInput.done
SquareMenuInput.skip2:
	and	A,0xF
	jr	Z,SquareMenuInput.skip9
	cp	A,1
	jr	NZ,SquareMenuInput.skip5
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,SquareMenuInput.skip3
	cp	A,8
	jr	Z,SquareMenuInput.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	SquareMenuInput.skip8
SquareMenuInput.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	SquareMenuInput.skip8
SquareMenuInput.skip4:
	ld	A,3
	ld	(XIZ+0x10),A
	jr	SquareMenuInput.skip8
SquareMenuInput.skip5:
	cp	A,2
	jr	NZ,SquareMenuInput.skip8
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,SquareMenuInput.skip6
	cp	A,3
	jr	Z,SquareMenuInput.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	SquareMenuInput.skip8
SquareMenuInput.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	SquareMenuInput.skip8
SquareMenuInput.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	SquareMenuInput.skip8
SquareMenuInput.skip8:
	jr	SquareMenuInput.skip9
SquareMenuInput.skip9:
	ld	BC,0x60
	ld	XWA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
SquareMenuInput.done:
	ret

c_214F0F	section	code abs=0x214F0F

; [code] Square menu choice +0x10: 8 (Return) -> ResetTextBox1, +0x11 = 0, TASK_ARG 0xC (TownPlaceTaskEnd, back to the street); else place +0x15 = choice + 1 (1 Pub, 2 D-town, 3 Forest, 4 Spring), ResetTextBox1, OpenPlaceTalkMenu
SquareMenuSelect:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	NZ,SquareMenuSelect.skip
	calr	ResetTextBox1
	ld	A,0
	ld	(XIZ+0x11),A
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jr	SquareMenuSelect.skip2
SquareMenuSelect.skip:
	add	A,1
	ld	(XIZ+0x15),A
	calr	ResetTextBox1
	calr	OpenPlaceTalkMenu
	jr	SquareMenuSelect.skip2
SquareMenuSelect.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214F3D	section	code abs=0x214F3D

; [code] copies the talk rows listed for the place (task +0x15) and GetStoryStage (talk_slots_*.asm) to task +0x1E.., count to +0x1A
LoadTalkSlots:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,XIZ
	add	XHL,0x1E
	ld	XDE,XHL
	ld	A,0xFF
	ld	C,4
LoadTalkSlots.loop:
	ld	(XHL),A
	inc	1,XHL
	djnz	C,LoadTalkSlots.loop
	ld	A,0
	ld	(XIZ+0x1A),A
	ld	A,(XIZ+0x15)
	sub	A,1
	extz	WA
	extz	XWA
	ld	XHL,TalkSlotCounts
	add	XHL,XWA
	ld	C,(XHL)
	extz	BC
	sll	2,XWA
	ld	XHL,TalkSlotLists
	add	XHL,XWA
	ld	XHL,(XHL)
	call	GetStoryStage
	extz	WA
	extz	XWA
	mul	XWA,BC
	add	XHL,XWA
	ld	A,0
LoadTalkSlots.loop2:
	ld	W,(XHL)
	cp	W,0xFF
	jr	Z,LoadTalkSlots.skip
	ld	(XDE),W
	inc	1,XHL
	inc	1,XDE
	inc	1,A
	djnz	C,LoadTalkSlots.loop2
LoadTalkSlots.skip:
	ld	(XIZ+0x1A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214FA4	section	code abs=0x214FA4

; [code] LoadTalkSlots, then per slot GetTalkRow and the speaker name 0x249F66[row speaker - 0x15] + newline 0x249FA1 in box 2; box 1 TalkWithWhoText; +0xF = 2, TASK_ARG 4; [play] *_talk_menu, square_menu
ShowTalkMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2
	calr	LoadTalkSlots
	ld	C,(XIZ+0x1A)
	cp	C,0
	jr	Z,ShowTalkMenu.skip
	ld	XHL,XIZ
	add	XHL,0x1E
	ld	XDE,XHL
	ld	W,(XIZ+0x15)
ShowTalkMenu.loop:
	push	XDE
	push	C
	push	W
	ld	A,(XDE)
	calr	GetTalkRow
	ld	A,(XHL+0)
	sub	A,0x15
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,NpcNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	DrawBoxString
	ld	XHL,NewlineText2
	ld	A,2
	call	DrawBoxString
	pop	W
	pop	C
	pop	XDE
	inc	1,XDE
	djnz	C,ShowTalkMenu.loop
ShowTalkMenu.skip:
	calr	DrawReturnOption
	ld	A,0
	ld	(XIZ+0x13),A
	ld	A,1
	call	ClearTextBox
	ld	XHL,TalkWithWhoText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	(XIZ+0x2C),A
	ld	A,2
	ld	(XIZ+0xF),A
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215031	section	code abs=0x215031

; [code] ShowTalkMenu (the place's talk slots, TASK_ARG 4), DrawTownPlace, cursor +0x10 = 0 (or 8, Return, when the place has no talk slot +0x1A), StartWindowAnimToA; caller SquareMenuSelect
OpenPlaceTalkMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	ShowTalkMenu
	calr	DrawTownPlace
	ld	A,(XIZ+0x1A)
	cp	A,0
	jr	NZ,OpenPlaceTalkMenu.skip
	ld	A,8
	jr	OpenPlaceTalkMenu.skip2
OpenPlaceTalkMenu.skip:
	ld	A,0
OpenPlaceTalkMenu.skip2:
	ld	(XIZ+0x10),A
	call	StartWindowAnimToA
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215054	section	code abs=0x215054

; [code] town place task state 4 (each frame, the talk menu of ShowTalkMenu): A -> sound 0x81, TalkMenuSelect; B -> sound 0x82, cursor +0x10 = 8 (Return), TalkMenuSelect; with slots (+0x1A != 0) up / down move +0x10 over 0..+0x1A - 1 and 8 with wrap, sound 0x80; DrawMenuCursor at x 0x60, y +0x10 * 8 + 4; +0x2D += 1
TalkMenuInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,TalkMenuInput.skip
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	calr	TalkMenuSelect
	jrl	TalkMenuInput.done
TalkMenuInput.skip:
	bit	5,A
	jr	Z,TalkMenuInput.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,8
	ld	(XIZ+0x10),A
	calr	TalkMenuSelect
	jrl	TalkMenuInput.done
TalkMenuInput.skip2:
	ld	W,(XIZ+0x1A)
	cp	W,0
	jr	Z,TalkMenuInput.skip8
	and	A,0xF
	jr	Z,TalkMenuInput.skip9
	cp	A,1
	jr	NZ,TalkMenuInput.skip5
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,TalkMenuInput.skip3
	cp	A,8
	jr	Z,TalkMenuInput.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	TalkMenuInput.skip8
TalkMenuInput.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	TalkMenuInput.skip8
TalkMenuInput.skip4:
	ld	A,(XIZ+0x1A)
	dec	1,A
	ld	(XIZ+0x10),A
	jr	TalkMenuInput.skip8
TalkMenuInput.skip5:
	cp	A,2
	jr	NZ,TalkMenuInput.skip8
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,TalkMenuInput.skip6
	ld	W,(XIZ+0x1A)
	dec	1,W
	cp	A,W
	jr	Z,TalkMenuInput.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	TalkMenuInput.skip8
TalkMenuInput.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	TalkMenuInput.skip8
TalkMenuInput.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	TalkMenuInput.skip8
TalkMenuInput.skip8:
	jr	TalkMenuInput.skip9
TalkMenuInput.skip9:
	ld	BC,0x60
	ld	XWA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
TalkMenuInput.done:
	ret

c_215115	section	code abs=0x215115

; [code] talk menu choice +0x10: 8 (Return) -> ResetTextBox1, Square cursor +0x10 = place - 1, place +0x15 = 0, SquarePlaceMenu again; else ResetTextBox1, ClearBox2, StartTownTalk, +0x1B = choice, talk row +0x12 = the chosen slot's row (task +0x1E + choice)
TalkMenuSelect:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	NZ,TalkMenuSelect.skip
	calr	ResetTextBox1
	ld	A,(XIZ+0x15)
	sub	A,1
	ld	(XIZ+0x10),A
	ld	A,0
	ld	(XIZ+0x15),A
	calr	SquarePlaceMenu
	jr	TalkMenuSelect.skip2
TalkMenuSelect.skip:
	calr	ResetTextBox1
	call	ClearBox2
	calr	StartTownTalk
	ld	A,(XIZ+0x10)
	ld	(XIZ+0x1B),A
	extz	WA
	extz	XWA
	ld	XHL,XIZ
	add	XHL,0x1E
	add	XHL,XWA
	ld	A,(XHL)
	ld	(XIZ+0x12),A
	jr	TalkMenuSelect.skip2
TalkMenuSelect.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21624A	section	code abs=0x21624A

; [code] WorksProtectorScene step 0: child ShakeScr2Amp4Task for 0x78 frames, sound 0x84, +0x2C = 0, step 1 (was sub_21624A)
WorksProtectorShakeStart:
	ld	XHL,ShakeScr2Amp4Task
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x78
	ld	WA,SFX_SHAKE
	call	SoundCommand
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,1
	ld	(XIZ+0x27),A
	ret

c_21626A	section	code abs=0x21626A

; [code] WorksProtectorScene step 1: wShakeFlags 6, +0x2C counts frames; from 0x39 wFadeLevel += 2 (to 0x7F, white); when the shake task has ended: ClearScr1Tilemap, EraseBox2 / EraseBox3, ClearTextBox1, DrawPortrait 0x36 at GetPictureFirstTile, PlayMusic 0, sound 0x20, step 2
; [play] seen in play: after Lily's "But...I...!!??" the Works shakes and fades to white; picture 0x36 (a ruined city of broken white columns under a blue sky) is drawn behind the white (was sub_21626A)
WorksProtectorShakeToWhite:
	ld	A,6
	ld	(wShakeFlags),A
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x39
	jr	C,WorksProtectorShakeToWhite.skip2
	ld	A,(wFadeLevel)
	add	A,2
	cp	A,0x7F
	jr	C,WorksProtectorShakeToWhite.skip
	ld	A,0x7F
WorksProtectorShakeToWhite.skip:
	ld	(wFadeLevel),A
WorksProtectorShakeToWhite.skip2:
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,WorksProtectorShakeToWhite.done
	call	ClearScr1Tilemap
	call	EraseBox2
	call	EraseBox3
	calr	ClearTalkPortraitArea
	ld	A,0
	ld	(XIZ+0x13),A
	call	ClearTextBox1
	ld	HL,0x36
	call	GetPictureFirstTile
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	XWA,SONG_EVENT
	call	PlayMusic
	ld	WA,MUSIC_EVENT
	call	SoundCommand
	ld	A,2
	ld	(XIZ+0x27),A
WorksProtectorShakeToWhite.done:
	ret

c_2162D0	section	code abs=0x2162D0

; [code] WorksProtectorScene step 2: FadeInFromWhiteStep(2); when done: talk line 16 (+0x12 = 0xF, TalkWorks "The time has come! The power is mine!...", next 0xEC), step 4, TASK_ARG 6 (the talk)
; [play] seen in play: picture 0x36 fades in from white and the Protector's voice speaks over it (was sub_2162D0)
WorksProtectorFadeIn:
	ld	A,2
	call	FadeInFromWhiteStep
	cp	A,1
	jr	Z,WorksProtectorFadeIn.done
	ld	A,0xF
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+0x27),A
WorksProtectorFadeIn.done:
	ret

c_2162EA	section	code abs=0x2162EA

; [code] WorksProtectorScene step 3: A or B -> step 4 (no writer of step 3 found; never executed in play)
WorksProtectorWaitButton:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,WorksProtectorWaitButton.skip
	jr	WorksProtectorWaitButton.skip4
WorksProtectorWaitButton.skip:
	bit	5,A
	jr	Z,WorksProtectorWaitButton.skip2
	jr	WorksProtectorWaitButton.skip4
WorksProtectorWaitButton.skip2:
	jr	WorksProtectorWaitButton.skip3
WorksProtectorWaitButton.skip3:
	jr	WorksProtectorWaitButton.done
WorksProtectorWaitButton.skip4:
	ld	A,4
	ld	(XIZ+0x27),A
WorksProtectorWaitButton.done:
	ret

c_216306	section	code abs=0x216306

; [code] WorksProtectorScene step 4 (talk next 0xEC): FadeToWhiteStep(2); when white: ClearScr1Tilemap, PlaceBox2 / PlaceBox3, ClearTextBox1, DrawTownPlace, PlayMusic 2, sound 0x22, step 5, SetFadeNormal, talk line 10 (+0x12 = 9), TASK_ARG 6
; [play] seen in play: fades to white and the Works comes back; the talk goes on with "What's that" and Lily's "That's the Protector..." (was sub_216306)
WorksProtectorFadeOut:
	ld	A,2
	call	FadeToWhiteStep
	cp	A,1
	jr	Z,WorksProtectorFadeOut.done
	call	ClearScr1Tilemap
	call	PlaceBox2
	call	PlaceBox3
	call	ClearTextBox1
	calr	DrawTownPlace
	ld	XWA,SONG_WORKS
	call	PlayMusic
	ld	WA,MUSIC_WORKS
	call	SoundCommand
	ld	A,5
	ld	(XIZ+0x27),A
	call	SetFadeNormal
	ld	A,9
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
WorksProtectorFadeOut.done:
	ret

c_216344	section	code abs=0x216344

; [code] WorksProtectorScene step 5: talk line 10 (+0x12 = 9), TASK_ARG 6 (the same as the end of WorksProtectorFadeOut, which sets step 5; never executed in play)
WorksProtectorResumeTalk:
	ld	A,9
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ret

c_21634F	section	code abs=0x21634F

; [code] town place task state 9, by step +0x27: 0 WorksProtectorShakeStart, 1 WorksProtectorShakeToWhite, 2 WorksProtectorFadeIn, 3 WorksProtectorWaitButton, 4 WorksProtectorFadeOut, 5 WorksProtectorResumeTalk; +0x2D += 1; entered only from the talk nexts 0xED (step 0) and 0xEC (step kept), used only by TalkWorks line 9 (Lily "But...I...!!??") and line 16 (picture 0x36)
; [play] seen in play: the story stage 8 Works talk (after Rank CS is won): screen shake, fade to white, picture 0x36 with the Protector's voice, fade in, fade out back to the Works; line 14 then sets event flag 9 (was sub_21634F)
WorksProtectorScene:
	ld	A,(XIZ+0x27)
	cp	A,0
	jr	NZ,WorksProtectorScene.skip
	calr	WorksProtectorShakeStart
	jr	WorksProtectorScene.skip6
WorksProtectorScene.skip:
	cp	A,1
	jr	NZ,WorksProtectorScene.skip2
	calr	WorksProtectorShakeToWhite
	jr	WorksProtectorScene.skip6
WorksProtectorScene.skip2:
	cp	A,2
	jr	NZ,WorksProtectorScene.skip3
	calr	WorksProtectorFadeIn
	jr	WorksProtectorScene.skip6
WorksProtectorScene.skip3:
	cp	A,3
	jr	NZ,WorksProtectorScene.skip4
	calr	WorksProtectorWaitButton
	jr	WorksProtectorScene.skip6
WorksProtectorScene.skip4:
	cp	A,4
	jr	NZ,WorksProtectorScene.skip5
	calr	WorksProtectorFadeOut
	jr	WorksProtectorScene.skip6
WorksProtectorScene.skip5:
	cp	A,5
	jr	NZ,WorksProtectorScene.skip6
	calr	WorksProtectorResumeTalk
	jr	WorksProtectorScene.skip6
WorksProtectorScene.skip6:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ret

c_2169E5	section	code abs=0x2169E5

; [code] ClearEventFlag 0x51-0x5E (the EVENT_GREETED_* flags and 0x53, 0x54, 0x5E); SquarePlaceMenu calls it each time the Square menu is drawn
ClearGreetedFlags:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_GREETED_LILY
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_CYRIUS
	call	ClearEventFlag
	ld	HL,0x53
	call	ClearEventFlag
	ld	HL,0x54
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_WYSE
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_ZIGGY
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_CEUS
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_HELMUT
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_ALDA
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_CAMIL
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_MEESE
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_COLLA
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_TETIS
	call	ClearEventFlag
	ld	HL,0x5E
	call	ClearEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret
