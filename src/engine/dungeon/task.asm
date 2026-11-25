; engine/dungeon/task.asm: the world map / dungeon task (WorldMapTaskInit, CrystalMineTaskInit, DungeonTask), EnterDungeon, and the DUNGEON_MODE steps around battles, camp, chests and bosses

c_210442	section	code abs=0x210442

; [code] ret; no callers
swp_210442:
	ret

c_210443	section	code abs=0x210443

; [code] task start, by the street code (StartChildTask in street.asm, StreetGoWorldMap): wFadeLevel 0, TASK_ARG 1 (DungeonTask: InitWorldMapMode, then WorldMapDispatch), DUNGEON_ID 0, 0x5FF8 = 0xFF, then DungeonTask
WorldMapTaskInit:
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+DUNGEON_ID),A
	ld	A,0xFF
	ld	(wStreetNext),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,DungeonTask
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_210467	section	code abs=0x210467

; [code] task start from the arena (ArenaStartCrystalMine): TASK_ARG 3 (DungeonTask: InitDungeonMode, then DungeonStep), DUNGEON_ID 5 (Crystal Mine), 0x5FF9 = 0xFF, then DungeonTask
CrystalMineTaskInit:
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	ld	A,5
	ld	(XIZ+DUNGEON_ID),A
	ld	A,0xFF
	ld	(wArenaNext),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,DungeonTask
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_210485	section	code abs=0x210485

; [code] the world map / dungeon task (WorldMapTaskInit, CrystalMineTaskInit): TASK_ARG 1 InitWorldMapMode -> 2, 2 WorldMapDispatch, 3 InitDungeonMode -> 4, 4 DungeonStep; 5 (or other): SCR1 scroll 0, DUNGEON_MODE -> 0x5FF8 (0x5FF9 for DUNGEON_ID 5), EndTask
DungeonTask:
	ld	A,(XIZ+TASK_ARG)
	cp	A,5
	jr	Z,DungeonTask.skip4
	cp	A,1
	jr	NZ,DungeonTask.skip
	call	InitWorldMapMode
	ld	A,2
	ld	(XIZ+TASK_ARG),A
	jr	DungeonTask.done
DungeonTask.skip:
	cp	A,2
	jr	NZ,DungeonTask.skip2
	call	WorldMapDispatch
	jr	DungeonTask.done
DungeonTask.skip2:
	cp	A,3
	jr	NZ,DungeonTask.skip3
	call	InitDungeonMode
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	jr	DungeonTask.done
DungeonTask.skip3:
	cp	A,4
	jr	NZ,DungeonTask.skip4
	call	DungeonStep
	jr	DungeonTask.done
DungeonTask.skip4:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr1ScrollY),A
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,DungeonTask.skip5
	ld	A,(XIZ+DUNGEON_MODE)
	ld	(wStreetNext),A
	call	EndTask
	jr	DungeonTask.done
DungeonTask.skip5:
	ld	A,(XIZ+DUNGEON_MODE)
	ld	(wArenaNext),A
	call	EndTask
	jr	DungeonTask.done
DungeonTask.done:
	ret

c_210D3A	section	code abs=0x210D3A

; [code] DungeonStep mode 1: RollFloorMaps, DUNGEON_FLOOR = 1 (outside the mine, wJoyHeld 0x22 / 0x21 / 0x32 / 0x34 / 0x38 / 0x31 held picks floor 2-7, capped at DUNGEON_FLOOR_COUNT), +0x12 = 1, PlayDungeonMusic, StartDungeonFloor
; [code] hidden floor select: only the exact wJoyHeld value counts (B+Down 2, B+Up 3, A+B+Down 4, A+B+Left 5, A+B+Right 6, A+B+Up 7; anything else 1); not in the Crystal Mine (DUNGEON_ID 5)
; [play] seen in play (Forest): all six combos held on this frame (the buttons are kept held through the iris after "Enter? Yes") start on that floor, the "AreaN" banner shows it, A+B+Up starts on the floor-7 boss map; nothing, B alone or A+Down give floor 1
EnterDungeon:
	call	RollFloorMaps
	ld	A,1
	ld	W,(XIZ+DUNGEON_ID)
	cp	W,5
	jr	Z,EnterDungeon.skip
	ld	W,(wJoyHeld)
	cp	W,0
	jr	Z,EnterDungeon.skip
	inc	1,A
	cp	W,0x22
	jr	Z,EnterDungeon.skip
	inc	1,A
	cp	W,0x21
	jr	Z,EnterDungeon.skip
	inc	1,A
	cp	W,0x32
	jr	Z,EnterDungeon.skip
	inc	1,A
	cp	W,0x34
	jr	Z,EnterDungeon.skip
	inc	1,A
	cp	W,0x38
	jr	Z,EnterDungeon.skip
	inc	1,A
	cp	W,0x31
	jr	Z,EnterDungeon.skip
	ld	A,1
EnterDungeon.skip:
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	cp	A,W
	jr	C,EnterDungeon.skip2
	ld	A,(XIZ+DUNGEON_FLOOR_COUNT)
EnterDungeon.skip2:
	ld	(XIZ+DUNGEON_FLOOR),A
	ld	A,1
	ld	(XIZ+0x12),A
	call	PlayDungeonMusic
	calr	StartDungeonFloor
	ret

c_210F39	section	code abs=0x210F39

; [code] DungeonStep mode 7: waits for wBattleResult != 0xFF; 3 (BattleDefeat) -> TASK_ARG 5 (leave), mode 2; else StartDungeonReturn
DungeonWaitBattleEnd:
	ld	A,(wBattleResult)
	cp	A,0xFF
	jr	Z,DungeonWaitBattleEnd.done
	cp	A,3
	jr	NZ,DungeonWaitBattleEnd.skip
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jr	DungeonWaitBattleEnd.done
DungeonWaitBattleEnd.skip:
	calr	StartDungeonReturn
DungeonWaitBattleEnd.done:
	ret

c_210F56	section	code abs=0x210F56

; [code] SetFadeWhite (DungeonSetFadeWhite), DUNGEON_MODE 8 (DungeonReturnStep)
StartDungeonReturn:
	push	A
	call	DungeonSetFadeWhite
	ld	A,8
	ld	(XIZ+DUNGEON_MODE),A
	pop	A
	ret

c_210F62	section	code abs=0x210F62

; [code] DungeonStep mode 8: at wFadeLevel 0x7F RedrawDungeonFloor + PlayDungeonMusic; DungeonFadeInFromWhite until done, then +0x2C = 0, mode 3
DungeonReturnStep:
	ld	A,(wFadeLevel)
	cp	A,0x7F
	jr	NZ,DungeonReturnStep.skip
	call	RedrawDungeonFloor
	call	PlayDungeonMusic
DungeonReturnStep.skip:
	call	DungeonFadeInFromWhite
	cp	A,1
	jr	Z,DungeonReturnStep.done
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
DungeonReturnStep.done:
	ret

c_210F86	section	code abs=0x210F86

; [code] CheckEncounter on B (sound 0x94): HideDungeonBoxes, DUNGEON_MODE 9
StartDungeonCamp:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	HideDungeonBoxes
	ld	A,9
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210F98	section	code abs=0x210F98

; [code] DungeonStep mode 9: mode 0xA, StartCampMenu
DungeonCampInit:
	ld	A,0xA
	ld	(XIZ+DUNGEON_MODE),A
	call	StartCampMenu
	ret

c_210FA2	section	code abs=0x210FA2

; [code] DungeonStep mode 0xA: CampMenuDispatch
DungeonCampStep:
	call	CampMenuDispatch
	ret

c_210FA7	section	code abs=0x210FA7

; [code] DUNGEON_MODE = 0xB (DungeonStep: back to mode 3); callers in camp.asm
EndDungeonCamp:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0xB
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210FB5	section	code abs=0x210FB5

; [code] DungeonStep mode 0xB: +0x2C = 0, mode 3 (CheckEncounter)
DungeonCampDone:
	xor	A,A
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	ret

c_210FC0	section	code abs=0x210FC0

; [code] CheckEncounter on A at a chest (FindAdjacentChest, FindChestByAttr -> +0x21): HideDungeonBoxes, DUNGEON_MODE 0xC, StartOpenChest
StartDungeonChest:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	HideDungeonBoxes
	ld	A,0xC
	ld	(XIZ+DUNGEON_MODE),A
	call	StartOpenChest
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210FD6	section	code abs=0x210FD6

; [code] DungeonStep mode 0xC: OpenChest
DungeonChestStep:
	call	OpenChest
	ret

c_210FDB	section	code abs=0x210FDB

; [code] +0x2C = 0, DUNGEON_MODE 3; caller in chests.asm; byte-identical copy of EndBossEncounter (the ROM has each)
EndDungeonChest:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	xor	A,A
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210FEE	section	code abs=0x210FEE

; [code] CheckEncounter when FindAdjacentBossCell finds the boss: HideDungeonBoxes, DUNGEON_MODE 0xD, InitBossEncounterState (BossEncounter state 1)
StartBossEncounter:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	HideDungeonBoxes
	ld	A,0xD
	ld	(XIZ+DUNGEON_MODE),A
	call	InitBossEncounterState
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211004	section	code abs=0x211004

; [code] DungeonStep mode 0xD: BossEncounter
DungeonBossStep:
	call	BossEncounter
	ret

c_211009	section	code abs=0x211009

; [code] +0x2C = 0, DUNGEON_MODE 3; BossEncounter state 0xB; byte-identical copy of EndDungeonChest (the ROM has each)
EndBossEncounter:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	xor	A,A
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
