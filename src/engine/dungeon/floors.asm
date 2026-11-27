; engine/dungeon/floors.asm: dungeon floors: StartDungeonFloor, floor change and exit (DungeonFloorChangeStep), RedrawDungeonFloor, PlayDungeonMusic

c_210D95	section	code abs=0x210D95

; Builds and shows the current floor: loads it, puts the party on its start cell facing down, opens the
; status boxes, irises the window open with the area name; DUNGEON_STEPS and XIZ+0x2D = 0. From
; EnterDungeon and DungeonFloorChangeStep [code]
StartDungeonFloor:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	LoadDungeonFloor
	call	FindFloorStartCell
	call	SetMapScrollToPlayer
	call	OpenDungeonBoxes
	ld	A,0
	ld	(XIZ+DUNGEON_ANIM_FRAME),A
	ld	A,1
	ld	(XIZ+DUNGEON_FACING),A
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	call	SetupWindowIris
	call	StartWindowAnimToA
	call	ApplyWindowB
	call	ShowAreaName
	ld	WA,SFX_FLOOR_CHANGE
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210DD4	section	code abs=0x210DD4

; [code] DungeonStep mode 2: once UpdateWindowAnim is done: +0x2C = 0, mode 3 (CheckEncounter), ShowAreaNameAndWait
WaitDungeonFloorOpen:
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,WaitDungeonFloorOpen.done
	xor	A,A
	ld	(XIZ+DUNGEON_STEP_FRAMES),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	call	ShowAreaNameAndWait
WaitDungeonFloorOpen.done:
	ret

c_210DEB	section	code abs=0x210DEB

; Stairs taken (CheckEncounter, XIZ+0x12 = 1 down / 2 up already set): irises the window closed with the
; floor-change sound and sets DUNGEON_MODE 4 (DungeonFloorChangeStep) [code]
StartFloorChange:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	SetupWindowIris
	call	StartWindowIrisClose
	ld	WA,SFX_FLOOR_CHANGE
	call	SoundCommand
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210E08	section	code abs=0x210E08

; [code] StartFloorChange with +0x12 = 3 (DungeonFloorChangeStep sets floor 0: leave the dungeon), no sound; callers CampLeavePrompt (Leave OK? yes), BossEncounter
StartDungeonExit:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	(XIZ+DUNGEON_CHANGE),A
	call	SetupWindowIris
	call	StartWindowIrisClose
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210E23	section	code abs=0x210E23

; DUNGEON_MODE 4, after the iris closes: applies XIZ+0x12 (1 floor + 1 up to DUNGEON_FLOOR_COUNT, 2 floor - 1,
; 3 floor 0); floor 0 leaves (TASK_ARG 1 = world map, the mine TASK_ARG 5 with a black fade), else
; StartDungeonFloor and mode 2 [code]
DungeonFloorChangeStep:
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,DungeonFloorChangeStep.done
	call	HideDungeonBoxes
	ld	A,(XIZ+DUNGEON_CHANGE)
	cp	A,3
	jr	NZ,DungeonFloorChangeStep.skip
	ld	A,0
	ld	(XIZ+DUNGEON_FLOOR),A
	jr	DungeonFloorChangeStep.skip4
DungeonFloorChangeStep.skip:
	cp	A,2
	jr	NZ,DungeonFloorChangeStep.skip2
	ld	A,(XIZ+DUNGEON_FLOOR)
	sub	A,1
	jr	C,DungeonFloorChangeStep.skip4
	ld	(XIZ+DUNGEON_FLOOR),A
	jr	DungeonFloorChangeStep.skip4
DungeonFloorChangeStep.skip2:
	cp	A,1
	jr	NZ,DungeonFloorChangeStep.skip3
	ld	A,(XIZ+DUNGEON_FLOOR)
	inc	1,A
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	cp	W,A
	jr	C,DungeonFloorChangeStep.skip4
	ld	(XIZ+DUNGEON_FLOOR),A
	jr	DungeonFloorChangeStep.skip4
DungeonFloorChangeStep.skip3:
	ld	A,0
	ld	(XIZ+DUNGEON_CHANGE),A
DungeonFloorChangeStep.skip4:
	; floor 0 = out of the dungeon
	ld	A,(XIZ+DUNGEON_FLOOR)
	and	A,A
	jr	NZ,DungeonFloorChangeStep.skip6
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr1ScrollY),A
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	Z,DungeonFloorChangeStep.skip5
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	jr	DungeonFloorChangeStep.done
DungeonFloorChangeStep.skip5:
	; the crystal mine returns to the arena, not the world map (?)
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+DUNGEON_MODE),A
	call	SetFadeBlack
	jr	DungeonFloorChangeStep.done
DungeonFloorChangeStep.skip6:
	calr	StartDungeonFloor
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
DungeonFloorChangeStep.done:
	ret

c_210EA0	section	code abs=0x210EA0

; [code] ClearScr1Tilemap, ClearScr2Tilemap, LoadDungeonFloor, SetMapScrollToPlayer, OpenDungeonBoxes; after a battle (DungeonReturnStep, BossEncounter) and in the camp code
RedrawDungeonFloor:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	call	LoadDungeonFloor
	call	SetMapScrollToPlayer
	call	OpenDungeonBoxes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210EBD	section	code abs=0x210EBD

; [code] PlayMusic(DUNGEON_ID - 1 + 5) and SoundCommand(DUNGEON_ID - 1 + 0x25); callers EnterDungeon, DungeonReturnStep, BossEncounter
PlayDungeonMusic:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+DUNGEON_ID)
	dec	1,A
	extz	WA
	extz	XWA
	add	XWA,SONG_FOREST_OF_VERDURE
	call	PlayMusic
	ld	A,(XIZ+DUNGEON_ID)
	dec	1,A
	extz	WA
	add	WA,MUSIC_FOREST_OF_VERDURE
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
