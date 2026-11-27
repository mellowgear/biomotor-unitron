; engine/dungeon/world_map.asm: world map: WorldMapDispatch, dungeon select, name / description / Enter? boxes

c_2104EF	section	code abs=0x2104EF

; [code] A = 1: DrawPortrait 0x3C at tile 0x20 (WorldMapOpen); A = 0: DrawPortrait 0x30 + DUNGEON_ID - 1 at tile 0x94 (ShowDungeonEntrance: the dungeon's picture)
DrawWorldMapPortrait:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	cp	A,1
	jr	NZ,DrawWorldMapPortrait.skip
	ld	HL,0x3C
	ld	WA,0x20
	ld	BC,0
	ld	DE,0
	jr	DrawWorldMapPortrait.skip2
DrawWorldMapPortrait.skip:
	ld	WA,0
	ld	A,(XIZ+DUNGEON_ID)
	sub	A,1
	ld	HL,0x30
	add	HL,WA
	ld	WA,0x94
	ld	BC,0
	ld	DE,0
DrawWorldMapPortrait.skip2:
	call	DrawPortrait
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210520	section	code abs=0x210520

; [code] OpenTextBox 1 (0xA x 3, tiles 0x10) with the name for DUNGEON_ID from the pointer table 0x2274D7 ("Town", "Forest of Verdure", "Corridor of Blue", "Ruins of Wind", "Maze of Stone")
OpenWorldMapNameBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x10
	ld	A,1
	ld	C,0xA
	ld	E,3
	call	OpenTextBox
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sll	2,A
	ld	XHL,DungeonNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21054D	section	code abs=0x21054D

; [code] PlaceTextBox 1 at column 1, row 0x21; byte-identical copy of PlaceAreaNameBox (the ROM has each)
PlaceWorldMapNameBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	C,1
	ld	E,0x21
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210560	section	code abs=0x210560

; [code] EraseTextBox 1; byte-identical copy of EraseAreaNameBox, EraseBox1 (the ROM has each)
EraseWorldMapNameBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21056F	section	code abs=0x21056F

; [code] OpenTextBox 2: 0x14 x 5, tiles 0x18
OpenWorldMapBox2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x18
	ld	A,2
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210585	section	code abs=0x210585

; [code] OpenTextBox 4: 0x14 x 5, tiles 0x5E (the box WorldMapDungeonText prints the dungeon description in)
OpenWorldMapTextBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x5E
	ld	A,4
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21059B	section	code abs=0x21059B

; [code] PlaceTextBox 2 at column 0, row 0x2E
PlaceWorldMapBox2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,0
	ld	E,0x2E
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105AE	section	code abs=0x2105AE

; [code] EraseTextBox 2; byte-identical copy of EraseDungeonStatusBox, EraseBox2Tall, EraseBox2 (the ROM has each)
EraseWorldMapBox2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105BD	section	code abs=0x2105BD

; [code] OpenTextBox 3 (0x12 x 3, tiles 0x4E) with "Enter?    Yes No" (0x227590)
OpenEnterPromptBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x4E
	ld	A,3
	ld	C,0x12
	ld	E,3
	call	OpenTextBox
	ld	A,3
	ld	XHL,EnterYesNoText
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105DE	section	code abs=0x2105DE

; [code] PlaceTextBox 3 at column 1, row 0x28
PlaceEnterPromptBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	C,1
	ld	E,0x28
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105F1	section	code abs=0x2105F1

; [code] EraseTextBox 3; byte-identical copy of EraseTextBox3, EraseBox3 (the ROM has each)
EraseEnterPromptBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210600	section	code abs=0x210600

; [code] LoadCompressedTiles Gfx_2C8691 to tile 0x10 and WorldMapMarkerPal as palette 1: the tiles DrawWorldMapMarker draws; WorldMapOpen
LoadWorldMapMarkerTiles:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,Gfx_2C8691
	ld	WA,0x10
	call	LoadCompressedTiles
	ld	XHL,WorldMapMarkerPal
	ld	A,1
	ld	C,1
	call	LoadPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210622	section	code abs=0x210622

; [code] A = marker 0-3: DrawSpriteGrid 2 x 2 of tile 0x10 + 4 * ((A + (+0x2D >> 3)) & 3), palette 1, at the x / y words of WorldMapMarkerPos[A] - (8, 0xC)
DrawWorldMapMarker:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	A
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,WorldMapMarkerPos
	add	XHL,XWA
	ld	BC,(XHL)
	inc	2,XHL
	ld	DE,(XHL)
	sub	BC,8
	sub	DE,0xC
	pop	A
	ld	W,(XIZ+0x2D)
	sra	3,W
	add	A,W
	and	A,3
	extz	WA
	sll	2,WA
	add	WA,0x10
	ld	HL,0
	sll	13,HL
	or	WA,HL
	ld	HL,1
	sll	9,HL
	or	WA,HL
	ld	QB,2
	ld	QD,2
	call	DrawSpriteGrid
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210675	section	code abs=0x210675

; [code] DrawWorldMapMarker(i) for each event flag 0x60 + i (i = 0-3) that is set (BossEncounter sets 0x60 + GetBossIndex after the win); WorldMapDispatch modes 4-5
DrawBeatenDungeonMarkers:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x60
	ld	C,4
DrawBeatenDungeonMarkers.loop:
	push	C
	push	HL
	call	CheckEventFlag
	cp	L,0
	jr	Z,DrawBeatenDungeonMarkers.skip
	pop	HL
	push	HL
	sub	HL,0x60
	ld	A,L
	calr	DrawWorldMapMarker
DrawBeatenDungeonMarkers.skip:
	pop	HL
	pop	C
	inc	1,HL
	djnz	C,DrawBeatenDungeonMarkers.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2106BB	section	code abs=0x2106BB

; [code] EndChildTasks only when TASK_CHILDREN is not 0; WorldMapInput calls it on A, B and a d-pad move
EndChildTasksIfAny:
	push	XHL
	push	XWA
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	Z,EndChildTasksIfAny.skip
	call	EndChildTasks
EndChildTasksIfAny.skip:
	pop	XWA
	pop	XHL
	ret

c_2106CB	section	code abs=0x2106CB

; [code] DUNGEON_MODE = 1 (WorldMapDispatch: WorldMapOpen); DungeonTask state 1; byte-identical copy of InitDungeonMode (the ROM has each)
InitWorldMapMode:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ret

c_2106D1	section	code abs=0x2106D1

; [code] DUNGEON_MODE = 1, DUNGEON_ID = 0; no caller found
InitWorldMapModeTown:
	push	A
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ld	A,DUNGEON_TOWN
	ld	(XIZ+DUNGEON_ID),A
	pop	A
	ret

c_2106DE	section	code abs=0x2106DE

; [code] WorldMapDispatch mode 1: ClearScr1Tilemap, ClearScr2Tilemap, SetupWindowIris + StartWindowAnimToA + ApplyWindowB (opens from the centre), DrawWorldMapPortrait, DUNGEON_FACING = 1, LoadWorldMapMarkerTiles, music 0x14, mode 2
WorldMapOpen:
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	call	SetupWindowIris
	call	StartWindowAnimToA
	call	ApplyWindowB
	ld	A,1
	calr	DrawWorldMapPortrait
	ld	A,1
	ld	(XIZ+DUNGEON_FACING),A
	calr	LoadWorldMapMarkerTiles
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	ld	XWA,SONG_MAIN_MENU
	call	PlayMusic
	ld	WA,MUSIC_MAIN_MENU
	call	SoundCommand
	ret

c_21071A	section	code abs=0x21071A

; [code] WorldMapDispatch mode 2: UpdateWindowAnim until the window stops, then DUNGEON_STEPS = 0, mode 3
WorldMapWaitOpen:
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,WorldMapWaitOpen.done
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
WorldMapWaitOpen.done:
	ret

c_21072D	section	code abs=0x21072D

; [code] WorldMapDispatch mode 3: mode 4 (WorldMapInput) after 0x2D frames or on A; B (sound 0x82) -> StartWorldMapExit
WorldMapIntroWait:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,WorldMapIntroWait.skip
	jr	WorldMapIntroWait.skip3
WorldMapIntroWait.skip:
	bit	5,A
	jr	Z,WorldMapIntroWait.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	calr	StartWorldMapExit
	jr	WorldMapIntroWait.done
WorldMapIntroWait.skip2:
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	cp	A,0x2D
	jr	C,WorldMapIntroWait.done
WorldMapIntroWait.skip3:
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
WorldMapIntroWait.done:
	ret

c_21075E	section	code abs=0x21075E

; [code] WorldMapDispatch mode 4: A / B (sounds, window steps StartDungeonEntrance / StartWorldMapExit), d-pad -> DungeonSelectMove (DUNGEON_ID from DungeonSelectMoves)
WorldMapInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,WorldMapInput.skip2
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	calr	EndChildTasksIfAny
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_TOWN
	jr	Z,WorldMapInput.skip
	calr	StartDungeonEntrance
	jr	WorldMapInput.done
WorldMapInput.skip:
	calr	StartWorldMapExit
	jr	WorldMapInput.done
WorldMapInput.skip2:
	bit	5,A
	jr	Z,WorldMapInput.skip3
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	calr	EndChildTasksIfAny
	calr	StartWorldMapExit
	jr	WorldMapInput.done
WorldMapInput.skip3:
	and	A,0xF
	jr	Z,WorldMapInput.done
	cp	A,1
	jr	NZ,WorldMapInput.skip4
	ld	A,0
	jr	WorldMapInput.skip12
WorldMapInput.skip4:
	cp	A,2
	jr	NZ,WorldMapInput.skip5
	ld	A,1
	jr	WorldMapInput.skip12
WorldMapInput.skip5:
	cp	A,4
	jr	NZ,WorldMapInput.skip6
	ld	A,2
	jr	WorldMapInput.skip12
WorldMapInput.skip6:
	cp	A,8
	jr	NZ,WorldMapInput.skip7
	ld	A,3
	jr	WorldMapInput.skip12
WorldMapInput.skip7:
	cp	A,9
	jr	NZ,WorldMapInput.skip8
	ld	A,4
	jr	WorldMapInput.skip12
WorldMapInput.skip8:
	cp	A,0xA
	jr	NZ,WorldMapInput.skip9
	ld	A,5
	jr	WorldMapInput.skip12
WorldMapInput.skip9:
	cp	A,6
	jr	NZ,WorldMapInput.skip10
	ld	A,6
	jr	WorldMapInput.skip12
WorldMapInput.skip10:
	cp	A,5
	jr	NZ,WorldMapInput.skip11
	ld	A,7
	jr	WorldMapInput.skip12
WorldMapInput.skip11:
	jr	WorldMapInput.done
WorldMapInput.skip12:
	calr	DungeonSelectMove
	cp	A,0xFF
	jr	Z,WorldMapInput.done
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	calr	EndChildTasksIfAny
WorldMapInput.done:
	ret

c_2107F9	section	code abs=0x2107F9

; [code] DUNGEON_ID = DungeonSelectMoves[DUNGEON_ID * 8 + A] unless 0xFF (A = d-pad direction, WorldMapInput)
DungeonSelectMove:
	push	XHL
	push	XDE
	push	XBC
	ld	L,A
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	mul	WA,8
	add	A,L
	ld	XHL,DungeonSelectMoves
	add	XHL,XWA
	ld	A,(XHL)
	cp	A,0xFF
	jr	Z,DungeonSelectMove.skip
	ld	(XIZ+DUNGEON_ID),A
DungeonSelectMove.skip:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21081D	section	code abs=0x21081D

; [code] WorldMapInput A on a dungeon (DUNGEON_ID not 0): +0x12 = 1, the iris close (SetupWindowIris, StartWindowIrisClose), mode 5
StartDungeonEntrance:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	(XIZ+0x12),A
	call	SetupWindowIris
	call	StartWindowIrisClose
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210838	section	code abs=0x210838

; [code] WorldMapInput B or A on the town (DUNGEON_ID 0), WorldMapIntroWait B: +0x12 = 3, the iris close, mode 5
StartWorldMapExit:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	(XIZ+0x12),A
	call	SetupWindowIris
	call	StartWindowIrisClose
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210853	section	code abs=0x210853

; [code] WorldMapDispatch mode 5, once UpdateWindowAnim is done: +0x12 = 3 -> mode 1, TASK_ARG 5 (DungeonTask ends: back to the street), mode 0; else ShowDungeonEntrance
WorldMapCloseStep:
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,WorldMapCloseStep.done
	ld	A,(XIZ+0x12)
	cp	A,3
	jr	Z,WorldMapCloseStep.skip
	calr	ShowDungeonEntrance
	jr	WorldMapCloseStep.done
WorldMapCloseStep.skip:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+DUNGEON_MODE),A
WorldMapCloseStep.done:
	ret

c_210877	section	code abs=0x210877

; [code] DrawWorldMapPortrait 0 (the dungeon picture), OpenWorldMapBox2 / OpenWorldMapTextBox / OpenEnterPromptBox, box 2 = NewlineText3 + DungeonNames[DUNGEON_ID], PlaceWorldMapBox2, +0x20 = 0, the iris opening at GetDungeonSelectCursor, mode 6; [play] dungeon_*_entrance
ShowDungeonEntrance:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	calr	DrawWorldMapPortrait
	calr	OpenWorldMapBox2
	calr	OpenWorldMapTextBox
	calr	OpenEnterPromptBox
	ld	XHL,NewlineText3
	ld	A,2
	call	DrawBoxString
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sll	2,A
	ld	XHL,DungeonNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	DrawBoxString
	calr	PlaceWorldMapBox2
	ld	A,0
	ld	(XIZ+0x20),A
	call	SetupWindowIris
	calr	GetDungeonSelectCursor
	ld	L,C
	ld	H,E
	call	SetWindowBPos
	call	StartWindowAnimToA
	ld	A,6
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2108D0	section	code abs=0x2108D0

; [code] WorldMapDispatch mode 6: once UpdateWindowAnim is done, DUNGEON_STEPS = 0, mode 7
WaitDungeonEntranceOpen:
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,WaitDungeonEntranceOpen.done
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,7
	ld	(XIZ+DUNGEON_MODE),A
WaitDungeonEntranceOpen.done:
	ret

c_2108E3	section	code abs=0x2108E3

; [code] WorldMapDispatch mode 7: after 0x5A frames or on A: ClearTextBox 2, +0x25 / +0x26 = 0, mode 8 (WorldMapDungeonText); B (sound 0x82) -> CancelDungeonEntry
DungeonEntranceWait:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,DungeonEntranceWait.skip
	jr	DungeonEntranceWait.skip3
DungeonEntranceWait.skip:
	bit	5,A
	jr	Z,DungeonEntranceWait.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	calr	CancelDungeonEntry
	jr	DungeonEntranceWait.done
DungeonEntranceWait.skip2:
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	cp	A,0x5A
	jr	C,DungeonEntranceWait.done
DungeonEntranceWait.skip3:
	ld	A,2
	call	ClearTextBox
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,0
	ld	(XIZ+0x25),A
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,8
	ld	(XIZ+DUNGEON_MODE),A
DungeonEntranceWait.done:
	ret

c_210929	section	code abs=0x210929

; [code] the WorldMapDungeonText shape printing DungeonDescriptions[DUNGEON_ID - 1] in box 2 through the text pointer (+8), A after the text -> mode 9, B -> CancelDungeonEntry; no caller found
WorldMapDungeonTextBox2:
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	Z,WorldMapDungeonTextBox2.skip
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	calr	CancelDungeonEntry
	jrl	WorldMapDungeonTextBox2End
WorldMapDungeonTextBox2.skip:
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,WorldMapDungeonTextBox2.skip3
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,WorldMapDungeonTextBox2.skip2
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	Z,WorldMapDungeonTextBox2.skip8
WorldMapDungeonTextBox2.skip2:
	jrl	WorldMapDungeonTextBox2End
WorldMapDungeonTextBox2.skip3:
	ld	A,2
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,WorldMapDungeonTextBox2.skip5
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,WorldMapDungeonTextBox2.skip4
	ld	A,2
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	ld	C,0
	ld	(XWA+0x10),C
WorldMapDungeonTextBox2.skip4:
	jr	WorldMapDungeonTextBox2End
WorldMapDungeonTextBox2.skip5:
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,WorldMapDungeonTextBox2.skip6
	ld	A,2
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
WorldMapDungeonTextBox2.skip6:
	ld	A,(XIZ+0x25)
	cp	A,2
	jr	NZ,WorldMapDungeonTextBox2.skip7
	ld	A,1
	ld	(XIZ+0x25),A
	ld	A,1
	ld	(XIZ+0x26),A
	ld	A,2
	call	SetTextBoxWait
	jr	WorldMapDungeonTextBox2End
WorldMapDungeonTextBox2.skip7:
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sub	A,1
	sll	2,A
	ld	XHL,DungeonDescriptions
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,2
	ld	(XIZ+0x25),A
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	jr	WorldMapDungeonTextBox2End
WorldMapDungeonTextBox2.skip8:
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,9
	ld	(XIZ+DUNGEON_MODE),A

c_2109F3	section	code abs=0x2109F3

; [code] the ret WorldMapDungeonTextBox2 falls into; its exits and WorldMapDungeonText (waiting for A) jump here
WorldMapDungeonTextBox2End:
	ret

c_2109F4	section	code abs=0x2109F4

; [code] box 2 is placed (PlaceWorldMapBox2), box 4 (same 0x14 x 5 size) is only opened and holds the dungeon description: moves the 3 x 0x12 tiles of box 2 up one pixel row (row 0 of each tile line into row 7 of the line above) and copies pixel row +0x2C of box 4 into box 2's bottom row; WorldMapDungeonText calls it for +0x2C = 0..0x17, every 7th call (every call once A or B sets DUNGEON_STEPS 0), so the 3 text lines scroll in
; [play] seen in play: the three description lines scroll up into the lower box one pixel row per call, 24 calls (+0x2C 0..0x17), all from
; WorldMapDungeonText: every 7th frame, then every frame once A is pressed; at +0x2C = 0x18 the text sits in place ("Dungeon made of / trees: Wood /
; affinity") and the wait arrow appears
ScrollBox2UpFromBox4:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	GetBoxTilesAddr
	ld	XHL,XDE
	inc	2,XHL
	ld	W,3
ScrollBox2UpFromBox4.loop:
	push	W
	ld	B,7
ScrollBox2UpFromBox4.loop2:
	push	XDE
	push	XHL
	ld	C,0x12
ScrollBox2UpFromBox4.loop3:
	ld	WA,(XHL)
	ld	(XDE),WA
	add	XDE,0x10
	add	XHL,0x10
	djnz	C,ScrollBox2UpFromBox4.loop3
	pop	XHL
	pop	XDE
	inc	2,XHL
	inc	2,XDE
	djnz	B,ScrollBox2UpFromBox4.loop2
	pop	W
	dec	1,W
	jr	Z,ScrollBox2UpFromBox4.skip
	push	W
	ld	XWA,0
	ld	A,0x12
	sub	A,1
	sll	4,XWA
	add	XHL,XWA
	push	XDE
	push	XHL
	ld	C,0x12
ScrollBox2UpFromBox4.loop4:
	ld	WA,(XHL)
	ld	(XDE),WA
	add	XDE,0x10
	add	XHL,0x10
	djnz	C,ScrollBox2UpFromBox4.loop4
	pop	XHL
	pop	XDE
	ld	XDE,XHL
	inc	2,XHL
	pop	W
	jr	ScrollBox2UpFromBox4.loop
ScrollBox2UpFromBox4.skip:
	push	XDE
	ld	A,4
	call	GetBoxTilesAddr
	ld	XHL,XDE
	pop	XDE
	ld	XWA,0
	ld	A,(XIZ+0x2C)
	div	WA,8
	extz	WA
	extz	XWA
	sll	4,XWA
	mul	XWA,0x12
	add	XHL,XWA
	ld	A,(XIZ+0x2C)
	and	XWA,7
	sll	1,XWA
	add	XHL,XWA
	ld	C,0x12
ScrollBox2UpFromBox4.loop5:
	ld	WA,(XHL)
	ld	(XDE),WA
	add	XDE,0x10
	add	XHL,0x10
	djnz	C,ScrollBox2UpFromBox4.loop5
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210AA4	section	code abs=0x210AA4

; [code] WorldMapDispatch mode 8: box 4 = the dungeon's description from the pointer table 0x227580[DUNGEON_ID - 1] ("Dungeon made of trees; Wood affinity", "Cave on sea floor; Water affinity", "Floating ruins; Wind affinity", "Buried deep in the ground; Earth affinity"), ScrollBox2UpFromBox4 for 0x18 pixel rows (+0x2C), SetTextBoxWait; A after the text -> mode 9; B -> CancelDungeonEntry; [play] seen in play: the Forest's description scrolls up into the lower box, then the wait arrow
WorldMapDungeonText:
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	Z,WorldMapDungeonText.skip
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	calr	CancelDungeonEntry
	jrl	WorldMapDungeonText.done
WorldMapDungeonText.skip:
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,WorldMapDungeonText.skip3
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,WorldMapDungeonText.skip2
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	Z,WorldMapDungeonText.skip10
WorldMapDungeonText.skip2:
	jrl	WorldMapDungeonTextBox2End
WorldMapDungeonText.skip3:
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,WorldMapDungeonText.skip9
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,WorldMapDungeonText.skip4
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
WorldMapDungeonText.skip4:
	ld	A,(XIZ+0x27)
	and	A,A
	jr	NZ,WorldMapDungeonText.skip6
	ld	A,(XIZ+0x2C)
	cp	A,0x18
	jr	Z,WorldMapDungeonText.skip5
	calr	ScrollBox2UpFromBox4
	inc	1,A
	ld	(XIZ+0x2C),A
	jr	WorldMapDungeonText.skip6
WorldMapDungeonText.skip5:
	ld	A,1
	ld	(XIZ+0x25),A
	ld	A,1
	ld	(XIZ+0x26),A
	ld	A,2
	call	SetTextBoxWait
	jr	WorldMapDungeonText.done
WorldMapDungeonText.skip6:
	ld	A,(XIZ+0x27)
	ld	W,(XIZ+DUNGEON_STEPS)
	cp	A,W
	jr	Z,WorldMapDungeonText.skip7
	jr	NC,WorldMapDungeonText.skip7
	inc	1,A
	jr	WorldMapDungeonText.skip8
WorldMapDungeonText.skip7:
	ld	A,0
WorldMapDungeonText.skip8:
	ld	(XIZ+0x27),A
	jr	WorldMapDungeonText.done
WorldMapDungeonText.skip9:
	ld	A,4
	call	ClearTextBox
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sub	A,1
	sll	2,A
	ld	XHL,DungeonDescriptions
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,4
	call	DrawBoxString
	ld	A,2
	ld	(XIZ+0x25),A
	ld	A,6
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,0
	ld	(XIZ+0x27),A
	ld	(XIZ+0x2C),A
	jr	WorldMapDungeonText.done
WorldMapDungeonText.skip10:
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,9
	ld	(XIZ+DUNGEON_MODE),A
WorldMapDungeonText.done:
	ret

c_210B72	section	code abs=0x210B72

; [code] WorldMapDispatch mode 9: PlaceEnterPromptBox, DUNGEON_STEPS = 0, mode 0xA
ShowEnterPrompt:
	calr	PlaceEnterPromptBox
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,0xA
	ld	(XIZ+DUNGEON_MODE),A
	ret

c_210B80	section	code abs=0x210B80

; [code] WorldMapDispatch mode 0xA (Enter? Yes / No, cursor +0x20): left / right move it; A on Yes -> ConfirmDungeonEntry, on No or B -> CancelDungeonEntry
EnterPromptInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,EnterPromptInput.skip2
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,EnterPromptInput.skip
	calr	ConfirmDungeonEntry
	jr	EnterPromptInput.done
EnterPromptInput.skip:
	calr	CancelDungeonEntry
	jr	EnterPromptInput.done
EnterPromptInput.skip2:
	bit	5,A
	jr	Z,EnterPromptInput.skip3
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	calr	CancelDungeonEntry
	jr	EnterPromptInput.done
EnterPromptInput.skip3:
	and	A,0xF
	jr	Z,EnterPromptInput.done
	cp	A,4
	jr	NZ,EnterPromptInput.skip4
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	NZ,EnterPromptInput.skip4
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,0
	ld	(XIZ+0x20),A
	jr	EnterPromptInput.done
EnterPromptInput.skip4:
	cp	A,8
	jr	NZ,EnterPromptInput.done
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	NZ,EnterPromptInput.done
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x20),A
	jr	EnterPromptInput.done
EnterPromptInput.done:
	ret

c_210BF3	section	code abs=0x210BF3

; [code] +0x12 = 0, the iris close, mode 0xB (CloseDungeonEntrance: back to the world map)
CancelDungeonEntry:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x12),A
	call	SetupWindowIris
	call	StartWindowIrisClose
	ld	A,0xB
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210C0E	section	code abs=0x210C0E

; [code] +0x12 = 2, the iris close, mode 0xB (CloseDungeonEntrance: mode 0xC, TASK_ARG 3 = into the dungeon)
ConfirmDungeonEntry:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	(XIZ+0x12),A
	call	SetupWindowIris
	call	StartWindowIrisClose
	ld	A,0xB
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210C29	section	code abs=0x210C29

; [code] WorldMapDispatch mode 0xB, once UpdateWindowAnim is done: erases boxes 3, 2, 1; +0x12 = 2 -> mode 0xC, else WorldMapOpen and mode 2
CloseDungeonEntrance:
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,CloseDungeonEntrance.done
	calr	EraseEnterPromptBox
	calr	EraseWorldMapBox2
	calr	EraseWorldMapNameBox
	ld	A,(XIZ+0x12)
	cp	A,2
	jr	Z,CloseDungeonEntrance.skip
	calr	WorldMapOpen
	ld	A,2
	jr	CloseDungeonEntrance.skip2
CloseDungeonEntrance.skip:
	ld	A,0xC
CloseDungeonEntrance.skip2:
	ld	(XIZ+DUNGEON_MODE),A
CloseDungeonEntrance.done:
	ret

c_210C4E	section	code abs=0x210C4E

; [code] switch on DUNGEON_MODE 1-0xC: 1 WorldMapOpen, 2 WorldMapWaitOpen, 3 WorldMapIntroWait, 4 WorldMapInput, 5-7 window steps, 8 WorldMapDungeonText, 9 / 0xA / 0xB, 0xC -> TASK_ARG 3; in modes 4-5 LoadDungeonPalettes, GetDungeonSelectCursor, the selection effect (PlayBattleEffect 0xCF + DUNGEON_ID); mode 0xA draws the Yes/No cursor; [play] wmap_select_* and dungeon_*_enter_prompt screens
WorldMapDispatch:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,1
	jr	NZ,WorldMapDispatch.skip
	calr	WorldMapOpen
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip:
	cp	A,2
	jr	NZ,WorldMapDispatch.skip2
	calr	WorldMapWaitOpen
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip2:
	cp	A,3
	jr	NZ,WorldMapDispatch.skip3
	calr	WorldMapIntroWait
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip3:
	cp	A,4
	jr	NZ,WorldMapDispatch.skip4
	calr	WorldMapInput
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip4:
	cp	A,5
	jr	NZ,WorldMapDispatch.skip5
	calr	WorldMapCloseStep
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip5:
	cp	A,6
	jr	NZ,WorldMapDispatch.skip6
	calr	WaitDungeonEntranceOpen
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip6:
	cp	A,7
	jr	NZ,WorldMapDispatch.skip7
	calr	DungeonEntranceWait
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip7:
	cp	A,8
	jr	NZ,WorldMapDispatch.skip8
	calr	WorldMapDungeonText
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip8:
	cp	A,9
	jr	NZ,WorldMapDispatch.skip9
	calr	ShowEnterPrompt
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip9:
	cp	A,0xA
	jr	NZ,WorldMapDispatch.skip10
	calr	EnterPromptInput
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip10:
	cp	A,0xB
	jr	NZ,WorldMapDispatch.skip11
	calr	CloseDungeonEntrance
	jr	WorldMapDispatch.skip13
WorldMapDispatch.skip11:
	cp	A,0xC
	jr	NZ,WorldMapDispatch.skip12
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	WorldMapDispatch.done
WorldMapDispatch.skip12:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
WorldMapDispatch.skip13:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,4
	jr	C,WorldMapDispatch.skip14
	cp	A,6
	jr	NC,WorldMapDispatch.skip14
	call	LoadDungeonPalettes
	calr	GetDungeonSelectCursor
	call	DrawPlayerMapSprite
	calr	DrawBeatenDungeonMarkers
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,4
	jr	NZ,WorldMapDispatch.skip14
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,WorldMapDispatch.skip14
	ld	XHL,PlayBattleEffect
	call	StartChildTask
	ld	WA,0
	ld	(XHL+0x1E),WA
	ld	A,(XIZ+DUNGEON_ID)
	extz	WA
	add	WA,0xCF
	ld	(XHL+0x20),WA
	jr	WorldMapDispatch.skip17
WorldMapDispatch.skip14:
	cp	A,0xA
	jr	NZ,WorldMapDispatch.skip17
	ld	XWA,0
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,WorldMapDispatch.skip15
	ld	BC,0x58
	jr	WorldMapDispatch.skip16
WorldMapDispatch.skip15:
	ld	BC,0x78
WorldMapDispatch.skip16:
	ld	DE,0x44
	call	DrawMenuCursor
	jr	WorldMapDispatch.skip17
WorldMapDispatch.skip17:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
WorldMapDispatch.done:
	ret

c_210D34	section	code abs=0x210D34

; [code] DUNGEON_MODE = 1 (DungeonStep: EnterDungeon); DungeonTask state 3; byte-identical copy of InitWorldMapMode (the ROM has each)
InitDungeonMode:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ret
