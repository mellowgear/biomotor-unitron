; engine/menus/town/places.asm: the town place task: Square menu, place pictures, talk slots, place states

c_214BEC	section	code abs=0x214BEC

; Task entry from StreetGoSquare: place +0x15 = 0 (the Square), state 1 (the Square menu), then TownPlaceTask [code]
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

; Task entry from StreetGoWorks: the first visit at story stage 0 is place 7 (the opening talk), stage 0xA place 8 (see
; TownPlaceTaskWorksEnding), else place 5 (the Works); state 5 (enter), then TownPlaceTask [code]
TownPlaceTaskWorks:
	; first visit: the opening talk in place 7
	call	GetStoryStage
	cp	A,0
	jr	NZ,TownPlaceTaskWorksEnding
	ld	HL,EVENT_TALKED_WORKS
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownPlaceTaskWorksEnding
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	ld	A,7
	ld	(XIZ+0x15),A
	jr	TownPlaceTaskWorksPlace5.skip

c_214C30	section	code abs=0x214C30

; Stage 0xA before EVENT_TALKED_WORKS: place 8 ("One year later... At the capital of Rhafiace"), else the plain Works [code]
TownPlaceTaskWorksEnding:
	call	GetStoryStage
	cp	A,0xA
	jr	NZ,TownPlaceTaskWorksPlace5
	ld	HL,EVENT_TALKED_WORKS
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownPlaceTaskWorksPlace5
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	ld	A,8
	ld	(XIZ+0x15),A
	jr	TownPlaceTaskWorksPlace5.skip

c_214C53	section	code abs=0x214C53

; Place 5 (the Works) with the fade reset; the place 7 / 8 paths join at .skip to set state 5 and TownPlaceTask [code]
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

; Task entry from StreetGoShop: place 6, state 5 (enter), then TownPlaceTask [code]
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

; The town place task, by state TASK_ARG: 1 -> 2, 2 open the Square menu, 3 its input, 4 the talk menu, 5 enter a place,
; 6..0xB the talks and scenes (case chain below), 0xC or other: end [code]
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

; Case chain: state 3, the Square menu input [code]
TownPlaceTaskState3:
	cp	A,3
	jr	NZ,TownPlaceTaskState4
	call	SquareMenuInput
	jr	TownPlaceTaskReturn

c_214CBC	section	code abs=0x214CBC

; Case chain: state 4, the talk menu input [code]
TownPlaceTaskState4:
	cp	A,4
	jr	NZ,TownPlaceTaskState5
	call	TalkMenuInput
	jr	TownPlaceTaskReturn

c_214CC6	section	code abs=0x214CC6

; Case chain: state 5, TownPlaceEnter [code]
TownPlaceTaskState5:
	cp	A,5
	jr	NZ,TownPlaceTaskState6
	call	TownPlaceEnter
	jr	TownPlaceTaskReturn

c_214CD0	section	code abs=0x214CD0

; Case chain: 6 town talk, 7 Cyrius, 8 Helmut, 9 the Works Protector scene, 0xA Colla, 0xB Tetis' gift, else the end [code]
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

; Ends the place task: wTownPlaceResult = +0x11 for the street, state reset to 1 [code]
TownPlaceTaskEnd:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,(XIZ+0x11)
	ld	(wTownPlaceResult),A
	call	EndTask
	jr	TownPlaceTaskReturn

c_214D22	section	code abs=0x214D22

; The ret every TownPlaceTask case jumps to [code]
TownPlaceTaskReturn:
	ret

c_214D23	section	code abs=0x214D23

; Draws place +0x15's picture (PlacePortraits) on SCR1 and its name in box 3 [code]
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
	; one picture id byte per place
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

; Box 2 row 8: the Return line of the Square and talk menus [code]
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

; Resets and clears box 1 [code]
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

; Box 2: the Square menu (Pub, D-town, Forest, Spring, Return) with the Square picture and "Where do you go?"; clears the
; greeted flags; state 3 [code][play]
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
	; queued in box 1, printed by the text engine
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

; Place task state 2: opens the boxes and the Square menu (cursor 0) behind the iris, SONG_TOWN [code]
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

; Place task state 3, each frame: up / down over rows 0-3 and Return (8), wrapping; A chooses, B picks Return [code]
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
	; up from 0 goes to Return, from Return to Spring; down mirrors
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
	; cursor x 0x60, y 8 * row + 4
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

; Return ends the place task (+0x11 = 0, state 0xC); a place row opens place row + 1 (1 Pub .. 4 Spring) and its talk menu [code]
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

; Up to 4 talk rows of place +0x15 at the current story stage (TalkSlotLists) into +0x1E.., count in +0x1A [code]
LoadTalkSlots:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,XIZ
	add	XHL,0x1E
	ld	XDE,XHL
	; 0xFF = empty slot
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
	; list of the place: per stage, TalkSlotCounts[place] bytes, 0xFF ends early
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

; Box 2: the speaker of each talk slot then Return; box 1 "Talk with who?"; state 4 [code][play]
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
	; the row's speaker, NpcNames from speaker 0x15
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

; Talk menu and picture of the chosen place, cursor on the first slot (Return when none) [code]
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

; Place task state 4, each frame: up / down over the +0x1A slots and Return (8), wrapping; A chooses, B picks Return [code]
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
	; no slots: only Return
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

; Return goes back to the Square menu on that place; a slot starts its talk: +0x1B = slot, talk row +0x12 = +0x1E[slot] [code]
TalkMenuSelect:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	NZ,TalkMenuSelect.skip
	calr	ResetTextBox1
	; Square cursor back on this place
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

; Protector scene step 0: starts a 0x78-frame shake with its sound; step 1 [code]
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

; Protector scene step 1: keeps both planes shaking, fades to white from frame 0x39; when the shake ends draws picture
; 0x36 (a ruined city of white columns) behind the white with SONG_EVENT; step 2 [code][play]
WorksProtectorShakeToWhite:
	; shake SCR1 and SCR2
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
	; the shake child has ended
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

; Protector scene step 2: fades in from white, then the Protector's line (talk row 0xF) and step 4 [code][play]
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

; Protector scene step 3: A or B -> step 4; no writer of step 3 [code]
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

; Protector scene step 4 (talk next 0xEC): fades to white and back to the Works with SONG_WORKS, then talk row 9, step 5 [code][play]
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

; Protector scene step 5: talk row 9 again (as WorksProtectorFadeOut); never reached in play [code]
WorksProtectorResumeTalk:
	ld	A,9
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ret

c_21634F	section	code abs=0x21634F

; Place task state 9, the stage 8 Works talk (after Rank CS): runs step +0x27 (shake, white, picture 0x36, back to the Works),
; entered from talk nexts 0xED (step 0) and 0xEC [code][play]
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

; Clears every EVENT_GREETED_* flag but Jon's, each time the Square menu is drawn, so the greetings play again [code]
ClearGreetedFlags:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_GREETED_LILY
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_CYRIUS
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_GALB
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_LANA
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
	ld	HL,EVENT_GREETED_WORKS
	call	ClearEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret
