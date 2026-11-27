; engine/dungeon/floors.asm: dungeon floors: StartDungeonFloor, floor change and exit (DungeonFloorChangeStep), RedrawDungeonFloor, PlayDungeonMusic

c_210D95	section	code abs=0x210D95

; [code] LoadDungeonFloor, FindFloorStartCell, SetMapScrollToPlayer, OpenDungeonBoxes, facing 1, DUNGEON_STEPS 0, the iris window opening (SetupWindowIris, StartWindowAnimToA), ShowAreaName, sound 0x85; callers EnterDungeon, DungeonFloorChangeStep
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
	ld	(XIZ+0x2D),A
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
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	call	ShowAreaNameAndWait
WaitDungeonFloorOpen.done:
	ret

c_210DEB	section	code abs=0x210DEB

; [code] only called by CheckEncounter after the cell attr test 0x100 (sets +0x12 = 2) or 0x200 (+0x12 = 1); starts the 0x60F1.. transition (SetupWindowIris, StartWindowIrisClose), sound 0x85, DUNGEON_MODE 4, whose handler DungeonFloorChangeStep does floor +1 (1) / -1 (2) / 0 (3)
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
	ld	(XIZ+0x12),A
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

; [code] DungeonStep mode 4, once UpdateWindowAnim is done: HideDungeonBoxes; +0x12 = 1 floor +1 (up to DUNGEON_FLOOR_COUNT), 2 floor -1, 3 floor 0; floor 0: SCR1 scroll 0 and TASK_ARG 1 (world map), the mine TASK_ARG 5 + SetFadeBlack; else StartDungeonFloor, mode 2
DungeonFloorChangeStep:
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,DungeonFloorChangeStep.done
	call	HideDungeonBoxes
	ld	A,(XIZ+0x12)
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
	ld	(XIZ+0x12),A
DungeonFloorChangeStep.skip4:
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
