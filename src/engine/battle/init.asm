; engine/battle/init.asm: battle setup: LoadEnemy, battle-start accessory effects (AccBattle*), enemy image, level-gap chances, BattleStart and its task start, DrawBattleScreen

c_2077D1	section	code abs=0x2077D1

; A = enemy id: copies its record into battle RAM 0x5DA3-0x5DB9
LoadEnemy:
	ld	(wEnemyId),A
	ld	XWA,0
	ld	(wEnemyParts),XWA
	ld	(wEnemyParts+4),WA
	or	XHL,XHL
	jr	Z,LoadEnemy.skip
	ld	XDE,wEnemyParts
	ld	BC,6
	ldir	(XDE+),(XHL+)
LoadEnemy.skip:
	ld	L,(wEnemyId)
	call	GetEnemyRecord
	ld	A,(XHL+ENEMY_LEVEL)
	ld	(wEnemyLevel),A
	ld	WA,(XHL+ENEMY_HP)
	ld	(wEnemyMaxHP),WA
	ld	WA,(XHL+ENEMY_EP)
	ld	(wEnemyMaxEP),WA
	ld	WA,(XHL+ENEMY_AP)
	ld	(wEnemyAP),WA
	ld	WA,(XHL+ENEMY_SP)
	ld	(wEnemySP),WA
	ld	WA,(XHL+ENEMY_RP)
	ld	(wEnemyRP),WA
	ld	WA,(XHL+ENEMY_MP)
	ld	(wEnemyMP),WA
	ld	WA,(XHL+ENEMY_AFFINITY)
	ld	(wEnemyAffinity),WA
	ld	WA,(XHL+ENEMY_IMAGE)
	ld	(wEnemyImage),WA
	ldb	(wEnemyScaled),0
	ld	A,(wEnemyLevel)
	or	A,A
	jrl	PL,LoadEnemy.skip3
	ldb	(wEnemyScaled),0xFF
	cpb	(wEnemyId),0x62
	jr	NC,LoadEnemy.skip2
	ld	WA,0xB
	call	RandomRange
	dec	6,WA
	add	(wEnemyMaxHP),WA
	ld	WA,0xB
	call	RandomRange
	dec	6,WA
	add	(wEnemyMaxEP),WA
LoadEnemy.skip2:
	call	GetEnemyScaling
	ld	WA,(XHL+0)
	mul	XWA,(wEnemyMaxHP)
	div	XWA,0x64
	ld	(wEnemyMaxHP),WA
	ld	WA,(XHL+2)
	mul	XWA,(wEnemyMaxEP)
	div	XWA,0x64
	ld	(wEnemyMaxEP),WA
	ld	WA,(XHL+4)
	mul	XWA,(wEnemyAP)
	div	XWA,0x64
	ld	(wEnemyAP),WA
	ld	WA,(XHL+6)
	mul	XWA,(wEnemySP)
	div	XWA,0x64
	ld	(wEnemySP),WA
	ld	WA,(XHL+8)
	mul	XWA,(wEnemyRP)
	div	XWA,0x64
	ld	(wEnemyRP),WA
	ld	WA,(XHL+0xA)
	mul	XWA,(wEnemyMP)
	div	XWA,0x64
	ld	(wEnemyMP),WA
	ld	A,(XHL+0xD)
	ld	W,0
	call	RandomRange
	add	A,(XHL+0xC)
	ld	(wEnemyLevel),A
	cpb	(wEnemyId),0x62
	jr	NC,LoadEnemy.skip3
	ld	WA,0xB
	call	RandomRange
	dec	6,WA
	add	(wEnemyMaxHP),WA
	ld	WA,0xB
	call	RandomRange
	dec	6,WA
	add	(wEnemyMaxEP),WA
LoadEnemy.skip3:
	cpb	(wEnemyId),0x71
	jrl	NC,LoadEnemy.done
	ld	L,(wEnemyParts+1)
	or	L,L
	jrl	Z,LoadEnemy.done
	call	GetBodyRecord
	ldw	(wEnemyAffinity),(XHL+PART_AFFINITY)
	ld	WA,(XHL+PART_HP)
	add	(wEnemyMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wEnemyMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wEnemyAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wEnemySP),WA
	ld	WA,(XHL+PART_RP)
	add	(wEnemyRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wEnemyMP),WA
	ld	L,(wEnemyParts)
	call	GetCoreRecord
	ld	WA,(XHL+PART_HP)
	add	(wEnemyMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wEnemyMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wEnemyAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wEnemySP),WA
	ld	WA,(XHL+PART_RP)
	add	(wEnemyRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wEnemyMP),WA
	ld	L,(wEnemyParts+2)
	call	GetArmRecord
	ld	WA,(XHL+PART_HP)
	add	(wEnemyMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wEnemyMaxEP),WA
	ld	WA,(XHL+PART_SP)
	add	(wEnemySP),WA
	ld	WA,(XHL+PART_RP)
	add	(wEnemyRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wEnemyMP),WA
	ld	L,(wEnemyParts+3)
	call	GetArmRecord
	ld	WA,(XHL+PART_HP)
	add	(wEnemyMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wEnemyMaxEP),WA
	ld	WA,(XHL+PART_SP)
	add	(wEnemySP),WA
	ld	WA,(XHL+PART_RP)
	add	(wEnemyRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wEnemyMP),WA
	ld	L,(wEnemyParts+4)
	call	GetLegsRecord
	ld	WA,(XHL+PART_HP)
	add	(wEnemyMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wEnemyMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wEnemyAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wEnemySP),WA
	ld	WA,(XHL+PART_RP)
	add	(wEnemyRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wEnemyMP),WA
	ld	L,(wEnemyParts+5)
	call	GetBackRecord
	ld	WA,(XHL+PART_HP)
	add	(wEnemyMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wEnemyMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wEnemyAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wEnemySP),WA
	ld	WA,(XHL+PART_RP)
	add	(wEnemyRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wEnemyMP),WA
LoadEnemy.done:
	ret

c_207A27	section	code abs=0x207A27

; [code] ApplyBattleAccessory(wEquipAcc1), then falls into it with wEquipAcc2
ApplyBattleAccessories:
	ld	A,(wEquipAcc1)
	calr	ApplyBattleAccessory
	ld	A,(wEquipAcc2)

c_207A32	section	code abs=0x207A32

; [code] A = accessory item id: jp through Pointers_207A43[A] (AccBattle*: Radar crit, Cycl EP cost, Panl recharge)
ApplyBattleAccessory:
	ld	XHL,0
	ld	L,A
	sll	2,HL
	add	XHL,Pointers_207A43
	ld	XHL,(XHL)
	jp	XHL

c_207ADB	section	code abs=0x207ADB

; [code] Pointers_207A43 entries 0-8, 18-37: ret (items without a battle-start effect)
AccBattleNone:
	ret

c_207ADC	section	code abs=0x207ADC

; [code] Pointers_207A43 entry 9 = item 9 Radar5 (src/data/items/names.txt): wCritChance += 5 (ApplyBattleAccessory)
AccBattleRadar5:
	addb	(wCritChance),5
	ret

c_207AE2	section	code abs=0x207AE2

; [code] Pointers_207A43 entry 10 = item 10 Radar8 (src/data/items/names.txt): wCritChance += 8 (ApplyBattleAccessory)
AccBattleRadar8:
	addb	(wCritChance),8
	ret

c_207AE8	section	code abs=0x207AE8

; [code] Pointers_207A43 entry 11 = item 11 Radr10 (src/data/items/names.txt): wCritChance += 10 (ApplyBattleAccessory)
AccBattleRadr10:
	addb	(wCritChance),0xA
	ret

c_207AEE	section	code abs=0x207AEE

; [code] Pointers_207A43 entry 12 = item 12 Cycl10 (src/data/items/names.txt): wEPCostPercent -= 10 (ApplyBattleAccessory)
AccBattleCycl10:
	addb	(wEPCostPercent),0xF6
	ret

c_207AF4	section	code abs=0x207AF4

; [code] Pointers_207A43 entry 13 = item 13 Cycl20 (src/data/items/names.txt): wEPCostPercent -= 20 (ApplyBattleAccessory)
AccBattleCycl20:
	addb	(wEPCostPercent),0xEC
	ret

c_207AFA	section	code abs=0x207AFA

; [code] Pointers_207A43 entry 14 = item 14 Cycl30 (src/data/items/names.txt): wEPCostPercent -= 30 (ApplyBattleAccessory)
AccBattleCycl30:
	addb	(wEPCostPercent),0xE2
	ret

c_207B00	section	code abs=0x207B00

; [code] Pointers_207A43 entry 15 = item 15 Panl15 (src/data/items/names.txt): wRechargePercent += 15 (ApplyBattleAccessory)
AccBattlePanl15:
	addb	(wRechargePercent),0xF
	ret

c_207B06	section	code abs=0x207B06

; [code] Pointers_207A43 entry 16 = item 16 Panl30 (src/data/items/names.txt): wRechargePercent += 30 (ApplyBattleAccessory)
AccBattlePanl30:
	addb	(wRechargePercent),0x1E
	ret

c_207B0C	section	code abs=0x207B0C

; [code] Pointers_207A43 entry 17 = item 17 Panl50 (src/data/items/names.txt): wRechargePercent += 50 (ApplyBattleAccessory)
AccBattlePanl50:
	addb	(wRechargePercent),0x32
	ret

c_207C00	section	code abs=0x207C00

; [code] wBattleResult = 0xFF, StartTask(BattleStart); callers StartDungeonBattle, BossEncounter, ArenaStartBattle (their callers wait for wBattleResult != 0xFF)
StartBattleTask:
	ldb	(wBattleResult),0xFF
	ld	XHL,BattleStart
	call	StartTask
	ret

c_207C0F	section	code abs=0x207C0F

; [code] DE = tile -> XDE = CHAR RAM 0xA000 + 16 * tile, then (entered here, or at DrawBarTilesAt with XDE set by BattleHPEPDisplayTask): QC copies of the empty bar tile RawTiles_2C83DD+2, then from the left one full tile (+0x82) per 8 of n = BC * 8 * QC / HL (rounded up) and the partial tile +2 + 16 * (n % 8); HL = max, BC = value
DrawBarTiles:
	extz	XDE
	sll	4,DE
	add	DE,0xA000
; [code] entry with XDE already a CHAR RAM address (BattleHPEPDisplayTask)
DrawBarTilesAt:
	push	BC
	push	HL
	push	XDE
	ld	XHL,RawTiles_2C83DD+0x2
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	ld	XHL,(XSP)
	ld	C,QC
	dec	1,C
	jr	Z,DrawBarTiles.skip
	ld	B,0
	sll	3,BC
	ldirw	(XDE+),(XHL+)
DrawBarTiles.skip:
	pop	XDE
	pop	HL
	pop	BC
	or	BC,BC
	ret	Z
	ld	QB,0
	sll	3,QBC
	mul	XBC,QBC
	extz	XHL
	add	XBC,XHL
	dec	1,XBC
	div	XBC,HL
DrawBarTiles.loop:
	cp	BC,8
	jr	C,DrawBarTiles.skip2
	push	BC
	ld	XHL,RawTiles_2C83DD+0x82
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	BC
	dec	8,BC
	jr	DrawBarTiles.loop
DrawBarTiles.skip2:
	or	BC,BC
	ret	Z
	sll	4,BC
	ld	XHL,RawTiles_2C83DD+0x2
	lda	XHL,XHL+BC
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	ret

c_207C7B	section	code abs=0x207C7B

; [code] the DrawBarTiles shape with RawTiles_2C846F, filled from the right end backwards (lddrw); entered at DrawBarTilesReversedAt by BattleHPEPDisplayTask for the enemy HP / EP
DrawBarTilesReversed:
	extz	XDE
	sll	4,DE
	add	DE,0xA000
; [code] entry with XDE already a CHAR RAM address (BattleHPEPDisplayTask)
DrawBarTilesReversedAt:
	push	BC
	push	HL
	push	XDE
	ld	XHL,RawTiles_2C846F+0x2
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XHL
	ld	C,QC
	dec	1,C
	jr	Z,DrawBarTilesReversed.skip
	ld	B,0
	sll	3,BC
	ldirw	(XDE+),(XHL+)
	dec	2,XDE
DrawBarTilesReversed.skip:
	pop	HL
	pop	BC
	or	BC,BC
	ret	Z
	ld	QB,0
	sll	3,QBC
	mul	XBC,QBC
	extz	XHL
	add	XBC,XHL
	dec	1,XBC
	div	XBC,HL
DrawBarTilesReversed.loop:
	cp	BC,8
	jr	C,DrawBarTilesReversed.skip2
	push	BC
	ld	XHL,RawTiles_2C846F+0x90
	ld	BC,8
	lddrw	(XDE-),(XHL-)
	pop	BC
	dec	8,BC
	jr	DrawBarTilesReversed.loop
DrawBarTilesReversed.skip2:
	or	BC,BC
	ret	Z
	sll	4,BC
	ld	XHL,RawTiles_2C846F+0x10
	lda	XHL,XHL+BC
	ld	BC,8
	lddrw	(XDE-),(XHL-)
	ret

c_207E9A	section	code abs=0x207E9A

; wEnemyImage -> GetMonsterImage, LoadMonsterImage; images 0x5E+ are portraits (EnemyImagePortraits)
LoadEnemyImage:
	ld	HL,(wEnemyImage)
	cp	HL,0xFFFF
	jr	Z,LoadEnemyImage.skip2
	cp	HL,0x5E
	jr	NC,LoadEnemyImage.skip3
	push	DE
	push	BC
	push	WA
	call	GetMonsterImage
	call	LoadMonsterImage
	ld	QB,B
	ld	QD,D
	pop	WA
	pop	BC
	ld	DE,(XSP)
	cp	QB,6
	jr	GT,LoadEnemyImage.skip
	inc	2,BC
	inc	2,DE
LoadEnemyImage.skip:
	call	DrawTileBlockScr
	ld	HL,(wEnemyImage)
	call	GetMonsterPalette
	pop	DE
	call	LoadImagePalette
	ret
LoadEnemyImage.skip2:
	push	DE
	push	BC
	push	WA
	ld	QA,0
	ld	BC,0x84
	call	FillTiles
	call	SetEnemyDrawParts
	ld	HL,(XSP)
	call	DrawRobot
	pop	WA
	pop	BC
	ld	DE,(XSP)
	inc	1,DE
	or	WA,0x8000
	ld	QB,0xC
	ld	QD,0xB
	call	DrawTileBlockScr
	ld	HL,(wEnemyAffinity)
	call	GetAffinityPalette
	pop	DE
	call	LoadImagePalette
	ret
LoadEnemyImage.skip3:
	sub	HL,0x5E
	extz	XHL
	add	XHL,EnemyImagePortraits
	ld	L,(XHL)
	ld	H,0
	call	DrawPortraitAt
	ret

d_207F2A	section	romdata abs=0x207F2A
EnemyImagePortraits:
	db	0x3E,0x40,0x3D,0x3F,0x41,0x42

c_207F7C	section	code abs=0x207F7C

; [code] adds LevelGapCrit/Flee/Status[clamp(level gap + 11, 0, 22)] to both sides' chances
AddLevelGapChances:
	ld	XHL,LevelGapCrit
	ld	XDE,LevelGapFlee
	ld	XBC,LevelGapStatus
	ld	A,(wPlayerLevel)
	sub	A,(wEnemyLevel)
	calr	LevelGapIndex
	ld	W,(XHL+A)
	add	(wCritChance),W
	ld	W,(XDE+A)
	add	(wFleeChance),W
	ld	W,(XBC+A)
	add	(wStatusChance),W
	ld	A,(wEnemyLevel)
	sub	A,(wPlayerLevel)
	calr	LevelGapIndex
	ld	W,(XHL+A)
	add	(wEnemyCritChance),W
	ld	W,(XDE+A)
	add	(wEnemyFleeChance),W
	ld	W,(XBC+A)
	add	(wEnemyStatusChance),W
	cpb	(wEnemyId),0x59
	ret	C
	cpb	(wEnemyId),0x62
	jr	C,AddLevelGapChances.skip
	cpb	(wEnemyId),0x71
	ret	C
AddLevelGapChances.skip:
	ldb	(wFleeChance),0
	ldb	(wStatusChance),0
	ret

c_207FF7	section	code abs=0x207FF7

; [code] A = clamp(A + 11, 0, 22): the index AddLevelGapChances uses into LevelGapCrit / LevelGapFlee / LevelGapStatus
LevelGapIndex:
	add	A,0xB
	jr	MI,LevelGapIndex.skip
	cp	A,0x16
	ret	LE
	ld	A,0x16
	ret
LevelGapIndex.skip:
	ld	A,0
	ret

c_208007	section	code abs=0x208007

; cheapest enemy attack -> wEnemyMinAttackEP
CalcEnemyMinAttackEP:
	ld	WA,0xFFFF
	ld	(wCommandEPCosts),WA
	ld	(wCommandEPCosts+2),WA
	ld	(wCommandEPCosts+4),WA
	ld	(wCommandEPCosts+6),WA
	ld	(wMinEPCost),WA
	ld	(wEnemyMinAttackEP),WA
	ld	L,(wEnemyId)
	call	GetEnemyAttackSlots
	ld	C,4
CalcEnemyMinAttackEP.loop:
	ld	A,(XHL+3)
	cp	A,0xB
	ld	W,(wEnemyParts+2)
	jr	Z,CalcEnemyMinAttackEP.skip
	cp	A,0xC
	ld	W,(wEnemyParts+3)
	jr	Z,CalcEnemyMinAttackEP.skip
	ld	WA,(XHL+4)
	jr	CalcEnemyMinAttackEP.skip2
CalcEnemyMinAttackEP.skip:
	push	XHL
	ld	L,W
	call	GetArmRecord
	ld	WA,(XHL+PART_EP_COST)
	pop	XHL
CalcEnemyMinAttackEP.skip2:
	cp	WA,0xFFFF
	jr	Z,CalcEnemyMinAttackEP.skip4
	or	WA,WA
	jr	Z,CalcEnemyMinAttackEP.skip3
	cp	(wEnemyMinAttackEP),WA
	jr	C,CalcEnemyMinAttackEP.skip3
	ld	(wEnemyMinAttackEP),WA
CalcEnemyMinAttackEP.skip3:
	add	XHL,0xF
	djnz	C,CalcEnemyMinAttackEP.loop
CalcEnemyMinAttackEP.skip4:
	ld	L,(wEquipRightArm)
	call	GetArmRecord
	ld	WA,(XHL+PART_EP_COST)
	call	ScaleEPCost
	ld	(wCommandEPCosts),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip5
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip5:
	ld	L,(wEquipLeftArm)
	call	GetArmRecord
	ld	WA,(XHL+PART_EP_COST)
	call	ScaleEPCost
	ld	(wCommandEPCosts+2),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip6
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip6:
	ld	L,(wSkill1)
	or	L,L
	jr	Z,CalcEnemyMinAttackEP.skip7
	call	GetSkillRecord
	ld	WA,(XHL+0xC)
	call	ScaleEPCost
	ld	(wCommandEPCosts+4),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip7
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip7:
	ld	L,(wSkill2)
	or	L,L
	jr	Z,CalcEnemyMinAttackEP.skip8
	call	GetSkillRecord
	ld	WA,(XHL+0xC)
	call	ScaleEPCost
	ld	(wCommandEPCosts+6),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip8
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip8:
	cpb	(wFullChargeActive),0
	jr	Z,CalcEnemyMinAttackEP.done
	ld	WA,0
	ld	(wCommandEPCosts),WA
	ld	(wCommandEPCosts+2),WA
	ld	(wCommandEPCosts+4),WA
	ld	(wCommandEPCosts+6),WA
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.done:
	ret

c_20847F	section	code abs=0x20847F

; [code] SetRobotDrawParts(wEnemyParts): LoadEnemyImage for an enemy without an image (wEnemyImage = 0xFFFF)
SetEnemyDrawParts:
	ld	XHL,wEnemyParts
	call	SetRobotDrawParts
	ret

c_20933B	section	code abs=0x20933B

; [code+play] battle screen setup: enemy image, battle RAM reset, AddLevelGapChances, PlayMusic (every encounter screen)
BattleStart:
	ld	XHL,FadeOutToBlackTask
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	call	InitTextBoxes
	call	ClearTilemaps
	call	ClearSprites
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(0x584F),0
	ldb	(0x5851),0x60
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ldb	(0x5857),0
	ldb	(0x5859),0x68
	ldb	(0x5A76),0x61
	ld	A,0
	ld	C,0x14
	ld	E,5
	ld	HL,0x120
	call	OpenTextBox
	ld	C,0
	ld	E,0x1A
	call	PlaceTextBoxXWA
	ld	A,1
	ld	C,0x14
	ld	E,2
	ld	HL,0x156
	call	OpenTextBoxNoWait
	ld	C,6
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,QuestionMarksText
	call	DrawString
	ld	C,6
	ld	E,1
	call	SetTextBoxCursorXWA
	ld	XHL,QuestionMarksText
	call	DrawString
	ld	C,0
	ld	E,0x18
	call	PlaceTextBoxXWA
	ld	WA,0x15B
	ld	XHL,RawTiles_2C8557
	call	LoadRawTiles
	ld	WA,0x16F
	ld	XHL,RawTiles_2C8557
	call	LoadRawTiles
	ld	WA,0x164
	ld	XHL,RawTiles_2C8545
	call	LoadRawTiles
	ld	WA,0x178
	ld	XHL,RawTiles_2C8545
	call	LoadRawTiles
	ld	WA,0x15F
	ld	XHL,RawTiles_2C8501
	call	LoadRawTiles
	ld	WA,0x173
	ld	XHL,RawTiles_2C8523
	call	LoadRawTiles
	ld	XHL,Pal_2C82CE
	ld	A,0x1D
	ld	C,2
	call	LoadPalettes
	ld	WA,0x1B56
	ld	BC,0
	ld	DE,0x18
	ld	QB,0x14
	ld	QD,1
	call	DrawTileBlockScr
	ld	WA,0x3F5B
	ld	BC,5
	ld	DE,0x18
	ld	QB,4
	ld	QD,1
	call	DrawTileBlockScr
	ld	WA,0x3F61
	ld	BC,0xB
	ld	DE,0x18
	ld	QB,4
	ld	QD,1
	call	DrawTileBlockScr
	ld	WA,0x1D6A
	ld	BC,0
	ld	DE,0x19
	ld	QB,0x14
	ld	QD,1
	call	DrawTileBlockScr
	ld	WA,0x3F6F
	ld	BC,5
	ld	DE,0x19
	ld	QB,4
	ld	QD,1
	call	DrawTileBlockScr
	ld	WA,0x3F75
	ld	BC,0xB
	ld	DE,0x19
	ld	QB,4
	ld	QD,1
	call	DrawTileBlockScr
	ld	WA,0xC
	ld	BC,0
	ld	DE,1
	call	DrawEquippedRobot
	ld	WA,0x90
	ld	BC,0
	ld	DE,0x20
	call	LoadEnemyImage
	ldw	(wUnitEP),(wUnitMaxEP)
	ld	A,0
	ld	(wCritChance),A
	ld	(wFleeChance),A
	ldb	(wEPCostPercent),0x64
	ldb	(wRechargePercent),0x1E
	ld	(wStatusChance),A
	ld	(wStatusParalyzed),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ld	(wSkillAPUpTurns),A
	ld	(wSkillSPUpTurns),A
	ld	(wSkillRPUpTurns),A
	ld	(wSkillMPUpTurns),A
	ld	(wItemAPUpTurns),A
	ld	(wItemSPUpTurns),A
	ld	(wItemRPUpTurns),A
	ld	(wItemMPUpTurns),A
	ld	(wAirbagActive),A
	ld	(wFullChargeActive),A
	ld	(wRecvrActive),A
	ldw	(wEnemyHP),(wEnemyMaxHP)
	ldw	(wEnemyEP),(wEnemyMaxEP)
	ld	(wEnemyCritChance),A
	ld	(wEnemyFleeChance),A
	ldb	(wEnemyEPCostBuff),0x64
	ldb	(wEnemyRechargePercent),0x1E
	ld	(wEnemyStatusChance),A
	ld	(wEnemyParalyzed),A
	ld	(wEnemyRusted),A
	ld	(wEnemyEPLeak),A
	ld	(wEnemyConfused),A
	ld	(wEnemySPUpTurns),A
	ld	(wEnemyAPDownTurns),A
	ld	(wEnemySPDownTurns),A
	ld	(wEnemyRPDownTurns),A
	ld	(wEnemyMPDownTurns),A
	ld	(wSkillEnemyAPDownTurns),A
	ld	(wSkillEnemySPDownTurns),A
	ld	(wSkillEnemyRPDownTurns),A
	ld	(wSkillEnemyMPDownTurns),A
	ld	(wEnemyFullHealUsed),A
	ld	(wTimeStopTurns),A
	ldb	(wBattleResult),0xFF
	call	ApplyBattleAccessories
	call	AddLevelGapChances
	ld	XHL,BattleHPEPDisplayTask
	call	StartTask
	ld	(XIZ+0x2C),HL
; [code] the battle song by wEnemyId: < 0x59 song 0xA, 0x59-0x60 0xC, 0x61 0xD, 0x62-0x75 0xB, >= 0x76 0xC; SoundCommand 0x20 + song
; [play] seen in play: song 0xA (SoundCommand 0x2A) in a random battle (Spidey), song 0xC (0x2C) in the Ent and Kraken boss battles
	ld	E,(wEnemyId)
	cp	E,0x59
	ld	WA,0xA
	ld	BC,0x2A
	jr	C,BattleStart.skip2
	cp	E,0x61
	jr	C,BattleStart.skip
	ld	WA,0xD
	ld	BC,0x2D
	jr	Z,BattleStart.skip2
	cp	E,0x76
	ld	WA,0xB
	ld	BC,0x2B
	jr	C,BattleStart.skip2
BattleStart.skip:
	ld	WA,0xC
	ld	BC,0x2C
BattleStart.skip2:
	push	BC
	call	PlayMusic
	pop	WA
	call	SoundCommand
	ld	XHL,FadeInFromBlackTask
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),BattleEncounterMessage & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleEncounterMessage >> 16
	ret
; [code] "??" + FF (charmap 64 = "?"), drawn by DrawString at 0x2093BA and 0x2093CB
QuestionMarksText:
	db	0x64,0x64,0xFF
; [code] BattleStart's task resumes here (TASK_FUNC 0x2095E6 above): EnemySlideInTask (wScr2ScrollX 0x60 -> 0), YouEncounteredEnemyText, EnemySlideOutTask (0 -> 0x60), then task 0x209647; [play] executed in all runs (D10)
BattleEncounterMessage:
	ld	XHL,EnemySlideInTask
	call	StartChildTask
	ldb	(XHL+0xE),0xF

c_2095F3	section	code abs=0x2095F3
	task_wait
	ld	XHL,YouEncounteredEnemyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemySlideOutTask
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),DrawBattleScreen & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DrawBattleScreen >> 16
	ret

c_209647	section	code abs=0x209647

; [code] battle tiles, palettes, status icon maps
DrawBattleScreen:
	calr	ComputeStatBuffs
	ldw	(wAttackEPCost),0
	ldw	(wEnemyAttackEPCost),0
	ld	XHL,Pal_2C82AE
	ld	A,0x11
	ld	C,4
	call	LoadPalettes
	ld	WA,0x1CC
	ld	XHL,Gfx_2C8306
	call	LoadCompressedTiles
	call	CalcEnemyMinAttackEP
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,UnitSlideInTask
	call	StartChildTask
	ldb	(XHL+0xE),0x14
	task_wait
	ld	A,3
	ld	C,4
	ld	E,1
	ld	HL,0x180
	call	OpenTextBoxNoWait
	ld	C,1
	ld	E,0
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	C,(wPlayerLevel)
	ld	B,0
	call	RenderNumberTiles
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	ld	XHL,LevelText
	call	DrawString
	ld	C,6
	ld	E,0x38
	call	PlaceTextBoxXWA
	cpb	(wStatusParalyzed),0
	jr	Z,DrawBattleScreen.skip
	ld	WA,0x1CC
	ld	BC,0xC
	ld	DE,9
	ld	XHL,Map_2C82DE
	call	DrawTilemap
DrawBattleScreen.skip:
	cpb	(wStatusRust),0
	jr	Z,DrawBattleScreen.skip2
	ld	WA,0x1CC
	ld	BC,0xE
	ld	DE,9
	ld	XHL,Map_2C82FC
	call	DrawTilemap
DrawBattleScreen.skip2:
	cpb	(wStatusEPLeak),0
	jr	Z,DrawBattleScreen.skip3
	ld	WA,0x1CC
	ld	BC,0x10
	ld	DE,9
	ld	XHL,Map_2C82F2
	call	DrawTilemap
DrawBattleScreen.skip3:
	cpb	(wStatusConfused),0
	jr	Z,DrawBattleScreen.skip4
	ld	WA,0x1CC
	ld	BC,0x12
	ld	DE,9
	ld	XHL,Map_2C82E8
	call	DrawTilemap
DrawBattleScreen.skip4:
	ldw	(wBattleChoice),0
	ldb	(wBattleMenuCursor),0
	ldw	(XIZ+TASK_FUNC),EnemyChooseAttack & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyChooseAttack >> 16
	ret
