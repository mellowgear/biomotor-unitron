; engine/dungeon/steps.asm: moving on the dungeon map: cell attributes by direction, passability, the adjacent boss / chest checks, rust step damage, CheckEncounter (input, steps, encounter roll) and DungeonStep

c_21101C	section	code abs=0x21101C

; [code] A = direction (0 y-1, 1 y+1, 2 x-1, 3 x+1, 0xFF the cell itself; others -> A = 0xFF): C/E = DUNGEON_X/Y + step, HL = GetMapCellAttr (the cell attributes)
GetCellAttrInDirection:
	push	WA
	ld	HL,0
	cp	A,0xFF
	jr	Z,GetCellAttrInDirection.skip5
	cp	A,0
	jr	NZ,GetCellAttrInDirection.skip
	ld	H,0xFF
	jr	GetCellAttrInDirection.skip5
GetCellAttrInDirection.skip:
	cp	A,1
	jr	NZ,GetCellAttrInDirection.skip2
	ld	H,1
	jr	GetCellAttrInDirection.skip5
GetCellAttrInDirection.skip2:
	cp	A,2
	jr	NZ,GetCellAttrInDirection.skip3
	ld	L,0xFF
	jr	GetCellAttrInDirection.skip5
GetCellAttrInDirection.skip3:
	cp	A,3
	jr	NZ,GetCellAttrInDirection.skip4
	ld	L,1
	jr	GetCellAttrInDirection.skip5
GetCellAttrInDirection.skip4:
	ld	A,0xFF
GetCellAttrInDirection.skip5:
	ld	BC,0
	ld	DE,0
	ld	C,(XIZ+DUNGEON_X)
	add	C,L
	ld	E,(XIZ+DUNGEON_Y)
	add	E,H
	push	WA
	push	BC
	push	DE
	call	GetMapCellAttr
	pop	DE
	pop	BC
	pop	WA
	pop	WA
	ret

c_211060	section	code abs=0x211060

; [code] A = direction (GetCellAttrInDirection) -> A = 0xFF when blocked: attr bit 15 with a chest there (GetChestAt not 0xFF / 0xFE), or bit 12 without bit 15; else A unchanged; CheckEncounter's step test
CheckDirectionPassable:
	push	W
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,CheckDirectionPassable.skip
	call	GetChestAt
	cp	W,0xFF
	jr	Z,CheckDirectionPassable.skip
	cp	W,0xFE
	jr	Z,CheckDirectionPassable.skip
	ld	A,0xFF
	jr	CheckDirectionPassable.skip3
CheckDirectionPassable.skip:
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	NZ,CheckDirectionPassable.skip2
	jr	CheckDirectionPassable.skip3
CheckDirectionPassable.skip2:
	push	HL
	and	HL,0x1000
	cp	HL,0x1000
	pop	HL
	jr	NZ,CheckDirectionPassable.skip3
	ld	A,0xFF
	jr	CheckDirectionPassable.skip3
CheckDirectionPassable.skip3:
	pop	W
	ret

c_2110A4	section	code abs=0x2110A4

; [code] A = the first direction 0-3 whose cell has attr bits 0x9000, only while GetFloorBossBeaten = 0 (boss alive), else 0xFF; CheckEncounter starts BossEncounter (StartBossEncounter) on it
FindAdjacentBossCell:
	push	XHL
	push	XDE
	push	XBC
	push	W
	call	GetFloorBossBeaten
	cp	A,0
	jr	NZ,FindAdjacentBossCell.skip
	ld	A,0
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,FindAdjacentBossCell.skip2
	ld	A,1
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,FindAdjacentBossCell.skip2
	ld	A,2
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,FindAdjacentBossCell.skip2
	ld	A,3
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,FindAdjacentBossCell.skip2
FindAdjacentBossCell.skip:
	ld	A,0xFF
FindAdjacentBossCell.skip2:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2110FD	section	code abs=0x2110FD

; [code] A = the first direction 0-3 whose cell has attr bit 15 and a chest entry (GetChestAt) other than 0xFF / 0xFE / 0xFD, else 0xFF; CheckEncounter on A opens it
FindAdjacentChest:
	push	XHL
	push	XDE
	push	XBC
	push	W
	ld	A,0
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,FindAdjacentChest.skip
	call	GetChestAt
	cp	W,0xFF
	jr	Z,FindAdjacentChest.skip
	cp	W,0xFE
	jr	Z,FindAdjacentChest.skip
	cp	W,0xFD
	jr	Z,FindAdjacentChest.skip
	jr	FindAdjacentChest.skip5
FindAdjacentChest.skip:
	ld	A,1
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,FindAdjacentChest.skip2
	call	GetChestAt
	cp	W,0xFF
	jr	Z,FindAdjacentChest.skip2
	cp	W,0xFE
	jr	Z,FindAdjacentChest.skip2
	cp	W,0xFD
	jr	Z,FindAdjacentChest.skip2
	jr	FindAdjacentChest.skip5
FindAdjacentChest.skip2:
	ld	A,2
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,FindAdjacentChest.skip3
	call	GetChestAt
	cp	W,0xFF
	jr	Z,FindAdjacentChest.skip3
	cp	W,0xFE
	jr	Z,FindAdjacentChest.skip3
	cp	W,0xFD
	jr	Z,FindAdjacentChest.skip3
	jr	FindAdjacentChest.skip5
FindAdjacentChest.skip3:
	ld	A,3
	calr	GetCellAttrInDirection
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,FindAdjacentChest.skip4
	call	GetChestAt
	cp	W,0xFF
	jr	Z,FindAdjacentChest.skip4
	cp	W,0xFE
	jr	Z,FindAdjacentChest.skip4
	cp	W,0xFD
	jr	Z,FindAdjacentChest.skip4
	jr	FindAdjacentChest.skip5
FindAdjacentChest.skip4:
	ld	A,0xFF
FindAdjacentChest.skip5:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2111A2	section	code abs=0x2111A2

; [code] DungeonStep mode 0xE (after the ShakeScr1Amp4Task CheckEncounter starts on a step while wStatusRust): wUnitHP -= ceil(wUnitMaxHP / 20) and mode 3; at 0 HP: HideDungeonBoxes, wUnitHP 0, box 6 with PlayerIsDeadText, mode 0xF
RustStepDamage:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,(wUnitMaxHP)
	add	WA,0x14
	sub	WA,1
	extz	XWA
	div	XWA,0x14
	ld	HL,(wUnitHP)
	sub	HL,WA
	ld	WA,HL
	jr	C,RustStepDamage.skip
	jr	Z,RustStepDamage.skip
	ld	(wUnitHP),WA
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	jr	RustStepDamage.skip2
RustStepDamage.skip:
	call	HideDungeonBoxes
	ld	WA,0
	ld	(wUnitHP),WA
	call	OpenDungeonBox6
	call	PlaceDungeonBox6
	ld	XHL,PlayerIsDeadText
	ld	A,6
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,(XIZ+DUNGEON_FACING)
	sla	4,A
	ld	(XIZ+0x2D),A
	ld	A,0xF
	ld	(XIZ+DUNGEON_MODE),A
RustStepDamage.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211202	section	code abs=0x211202

; wStepsSinceBattle -> chance table 0x2275C0
CheckEncounter:
	ld	A,(XIZ+0x2C)
	and	A,A
	jrl	Z,CheckEncounter.skip5
	dec	1,A
	ld	(XIZ+0x2C),A
	jrl	NZ,CheckEncounter.done
	xor	WA,WA
	ld	(wMapScrollStepX),WA
	ld	(wMapScrollStepY),WA
	ld	A,(XIZ+0x1E)
	ld	(XIZ+DUNGEON_X),A
	ld	A,(XIZ+0x1F)
	ld	(XIZ+DUNGEON_Y),A
	ld	A,0xFF
	calr	CheckDirectionPassable
	ld	DE,HL
	and	HL,0x100
	jr	Z,CheckEncounter.skip
	ld	A,2
	ld	(XIZ+0x12),A
	calr	StartFloorChange
	jrl	CheckEncounter.done
CheckEncounter.skip:
	ld	HL,DE
	and	HL,0x200
	jr	Z,CheckEncounter.skip2
	ld	A,1
	ld	(XIZ+0x12),A
	calr	StartFloorChange
	jrl	CheckEncounter.done
CheckEncounter.skip2:
	calr	FindAdjacentBossCell
	cp	A,0xFF
	jr	Z,CheckEncounter.skip3
	calr	StartBossEncounter
	jrl	CheckEncounter.done
CheckEncounter.skip3:
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	ld	XHL,EncounterChance
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_STEPS)
	sub	XWA,1
	add	XHL,XWA
	ld	W,(XHL)
	push	W
	call	Random
	ld	W,0
	div	WA,0x64
	ld	A,W
	pop	W
	cp	A,W
	jr	NC,CheckEncounter.skip4
	call	HideDungeonBoxes
	call	PlayEncounterMusic
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	jrl	CheckEncounter.done
CheckEncounter.skip4:
	ld	A,(wStatusRust)
	cp	A,0
	jr	Z,CheckEncounter.skip5
	ld	XHL,ShakeScr1Amp4Task
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	ld	A,0xE
	ld	(XIZ+DUNGEON_MODE),A
	jrl	CheckEncounter.done
CheckEncounter.skip5:
	ld	A,(wJoyHeld)
	and	A,D_PAD|A_BUTTON|B_BUTTON
	jr	NZ,CheckEncounter.skip6
	call	RestartDungeonBoxTimer
	jrl	CheckEncounter.done
CheckEncounter.skip6:
	call	HideDungeonBoxesOnInput
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CheckEncounter.skip7
	calr	FindAdjacentChest
	cp	A,0xFF
	jr	Z,CheckEncounter.skip7
	calr	GetCellAttrInDirection
	call	FindChestByAttr
	ld	(XIZ+0x21),A
	calr	StartDungeonChest
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jrl	CheckEncounter.done
CheckEncounter.skip7:
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	Z,CheckEncounter.skip8
	ld	WA,0x94
	call	SoundCommand
	calr	StartDungeonCamp
	jrl	CheckEncounter.done
CheckEncounter.skip8:
	ld	A,(wJoyHeld)
	and	A,D_PAD
	jrl	Z,CheckEncounter.done
	ld	W,0xFF
	cp	A,1
	jr	NZ,CheckEncounter.skip9
	ld	A,0
	ld	(XIZ+DUNGEON_FACING),A
	jrl	CheckEncounter.skip28
CheckEncounter.skip9:
	cp	A,9
	jr	NZ,CheckEncounter.skip13
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,0
	jr	NZ,CheckEncounter.skip10
	ld	A,3
	ld	W,0
	jr	CheckEncounter.skip12
CheckEncounter.skip10:
	cp	A,3
	jr	NZ,CheckEncounter.skip11
	ld	A,0
	ld	W,3
	jr	CheckEncounter.skip12
CheckEncounter.skip11:
	ld	A,0
	ld	W,3
CheckEncounter.skip12:
	jrl	CheckEncounter.skip28
CheckEncounter.skip13:
	cp	A,8
	jr	NZ,CheckEncounter.skip14
	ld	A,3
	ld	(XIZ+DUNGEON_FACING),A
	jr	CheckEncounter.skip28
CheckEncounter.skip14:
	cp	A,0xA
	jr	NZ,CheckEncounter.skip18
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,1
	jr	NZ,CheckEncounter.skip15
	ld	A,3
	ld	W,1
	jr	CheckEncounter.skip17
CheckEncounter.skip15:
	cp	A,3
	jr	NZ,CheckEncounter.skip16
	ld	A,1
	ld	W,3
	jr	CheckEncounter.skip17
CheckEncounter.skip16:
	ld	A,1
	ld	W,3
CheckEncounter.skip17:
	jr	CheckEncounter.skip28
CheckEncounter.skip18:
	cp	A,2
	jr	NZ,CheckEncounter.skip19
	ld	A,1
	ld	(XIZ+DUNGEON_FACING),A
	jr	CheckEncounter.skip28
CheckEncounter.skip19:
	cp	A,6
	jr	NZ,CheckEncounter.skip23
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,1
	jr	NZ,CheckEncounter.skip20
	ld	A,2
	ld	W,1
	jr	CheckEncounter.skip22
CheckEncounter.skip20:
	cp	A,2
	jr	NZ,CheckEncounter.skip21
	ld	A,1
	ld	W,2
	jr	CheckEncounter.skip22
CheckEncounter.skip21:
	ld	A,1
	ld	W,2
CheckEncounter.skip22:
	jr	CheckEncounter.skip28
CheckEncounter.skip23:
	cp	A,4
	jr	NZ,CheckEncounter.skip24
	ld	A,2
	ld	(XIZ+DUNGEON_FACING),A
	jr	CheckEncounter.skip28
CheckEncounter.skip24:
	cp	A,5
	jr	NZ,CheckEncounter.skip28
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,0
	jr	NZ,CheckEncounter.skip25
	ld	A,2
	ld	W,0
	jr	CheckEncounter.skip27
CheckEncounter.skip25:
	cp	A,2
	jr	NZ,CheckEncounter.skip26
	ld	A,0
	ld	W,2
	jr	CheckEncounter.skip27
CheckEncounter.skip26:
	ld	A,0
	ld	W,2
CheckEncounter.skip27:
	jr	CheckEncounter.skip28
CheckEncounter.skip28:
	calr	CheckDirectionPassable
	cp	A,0xFF
	jr	NZ,CheckEncounter.skip30
	cp	W,0xFF
	jr	Z,CheckEncounter.skip29
	ld	A,W
	calr	CheckDirectionPassable
	cp	A,0xFF
	jr	NZ,CheckEncounter.skip30
CheckEncounter.skip29:
	ld	WA,0x92
	call	SoundCommand
	jr	CheckEncounter.done
CheckEncounter.skip30:
	ld	(XIZ+DUNGEON_FACING),A
	ld	(XIZ+0x1E),C
	ld	(XIZ+0x1F),E
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_X)
	sub	WA,BC
	neg	WA
	ld	(wMapScrollStepX),WA
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_Y)
	sub	WA,DE
	neg	WA
	ld	(wMapScrollStepY),WA
	ld	A,0x10
	ld	(XIZ+0x2C),A
CheckEncounter.done:
	ret

c_211421	section	code abs=0x211421

; [code+play] CheckEncounter after a step; ran into every battle_encounter_*
DungeonStep:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,1
	jr	NZ,DungeonStep.skip
	calr	EnterDungeon
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jrl	DungeonStep.skip17
DungeonStep.skip:
	cp	A,2
	jr	NZ,DungeonStep.skip2
	calr	WaitDungeonFloorOpen
	jrl	DungeonStep.skip17
DungeonStep.skip2:
	cp	A,3
	jr	NZ,DungeonStep.skip3
	calr	CheckEncounter
	jrl	DungeonStep.skip17
DungeonStep.skip3:
	cp	A,4
	jr	NZ,DungeonStep.skip4
	calr	DungeonFloorChangeStep
	jrl	DungeonStep.skip17
DungeonStep.skip4:
	cp	A,5
	jr	NZ,DungeonStep.skip5
	calr	DungeonEncounterFlash
	jrl	DungeonStep.skip17
DungeonStep.skip5:
	cp	A,6
	jr	NZ,DungeonStep.skip6
	calr	StartDungeonBattle
	jrl	DungeonStep.skip17
DungeonStep.skip6:
	cp	A,7
	jr	NZ,DungeonStep.skip7
	calr	DungeonWaitBattleEnd
	jrl	DungeonStep.skip17
DungeonStep.skip7:
	cp	A,8
	jr	NZ,DungeonStep.skip8
	calr	DungeonReturnStep
	jr	DungeonStep.skip17
DungeonStep.skip8:
	cp	A,9
	jr	NZ,DungeonStep.skip9
	calr	DungeonCampInit
	jr	DungeonStep.skip17
DungeonStep.skip9:
	cp	A,0xA
	jr	NZ,DungeonStep.skip10
	calr	DungeonCampStep
	jr	DungeonStep.skip17
DungeonStep.skip10:
	cp	A,0xB
	jr	NZ,DungeonStep.skip11
	calr	DungeonCampDone
	jr	DungeonStep.skip17
DungeonStep.skip11:
	cp	A,0xC
	jr	NZ,DungeonStep.skip12
	calr	DungeonChestStep
	jr	DungeonStep.skip17
DungeonStep.skip12:
	cp	A,0xD
	jr	NZ,DungeonStep.skip13
	calr	DungeonBossStep
	jr	DungeonStep.skip17
DungeonStep.skip13:
	cp	A,0xE
	jr	NZ,DungeonStep.skip14
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,DungeonStep.skip17
	calr	RustStepDamage
	jr	DungeonStep.skip17
DungeonStep.skip14:
	cp	A,0xF
	jr	NZ,DungeonStep.skip15
	ld	A,6
	call	GetTextBox
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	jr	NZ,DungeonStep.skip17
	ld	A,0x10
	ld	(XIZ+DUNGEON_MODE),A
	jr	DungeonStep.skip17
DungeonStep.skip15:
	cp	A,0x10
	jr	NZ,DungeonStep.skip16
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,DungeonStep.skip17
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jr	DungeonStep.skip17
DungeonStep.skip16:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
DungeonStep.skip17:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,7
	jr	Z,DungeonStep.done
	cp	A,0xD
	jr	NZ,DungeonStep.skip18
	ld	W,(XIZ+0x2A)
	cp	W,9
	jr	Z,DungeonStep.skip22
	call	GetBossIndex
	cp	A,8
	jr	Z,DungeonStep.skip22
	jr	DungeonStep.skip20
DungeonStep.skip18:
	cp	A,0xA
	jr	NZ,DungeonStep.skip19
	ld	W,(XIZ+0x2A)
	cp	W,6
	jr	Z,DungeonStep.skip22
	cp	W,7
	jr	Z,DungeonStep.skip22
	cp	W,8
	jr	Z,DungeonStep.skip22
DungeonStep.skip19:
	cp	A,0xF
	jr	C,DungeonStep.skip20
	call	LoadPlayerDungeonSprite
	jr	DungeonStep.skip21
DungeonStep.skip20:
	call	LoadDungeonPalettes
DungeonStep.skip21:
	call	DrawPlayerDungeonSprite
	call	UpdateFloorBossSprite
	call	DungeonBoxesStep
DungeonStep.skip22:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
DungeonStep.done:
	ret
