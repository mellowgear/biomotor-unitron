; engine/battle/init.asm: battle setup: LoadEnemy, battle-start accessory effects (AccBattle*), enemy image, level-gap chances, BattleStart and its task start, DrawBattleScreen

c_2077D1	section	code abs=0x2077D1

; [code] A = enemy id, XHL = 6 part ids or 0: sets wEnemyId / wEnemyParts and loads the record's level and stats;
; a negative level means scaled by GetEnemyScaling (wEnemyScaled = 0xFF); robots below Fenril add their parts' stats
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
	; level < 0: a scaled enemy; ids below Alex get HP / EP +-5 here and again after scaling
	ld	A,(wEnemyLevel)
	or	A,A
	jrl	PL,LoadEnemy.skip3
	ldb	(wEnemyScaled),0xFF
	cpb	(wEnemyId),ENEMY_ALEX
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
	ld	WA,(XHL+0)	; scaling record: +0..+0xA stat %, +0xC base level, +0xD random level range
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
	cpb	(wEnemyId),ENEMY_ALEX
	jr	NC,LoadEnemy.skip3
	ld	WA,0xB
	call	RandomRange
	dec	6,WA
	add	(wEnemyMaxHP),WA
	ld	WA,0xB
	call	RandomRange
	dec	6,WA
	add	(wEnemyMaxEP),WA
; arena robots (Alex..Dupon, and Ent..Uniti if they have parts): body sets the affinity, every part adds HP / EP / SP / RP / MP
LoadEnemy.skip3:
	cpb	(wEnemyId),ENEMY_FENRIL
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
	; arms add no AP: their power is per attack
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

; [code] Pointers_207A43 entry 9 = item 9 Radar5 (src/data/items/names.asm): wCritChance += 5 (ApplyBattleAccessory)
AccBattleRadar5:
	addb	(wCritChance),5
	ret

c_207AE2	section	code abs=0x207AE2

; [code] Pointers_207A43 entry 10 = item 10 Radar8 (src/data/items/names.asm): wCritChance += 8 (ApplyBattleAccessory)
AccBattleRadar8:
	addb	(wCritChance),8
	ret

c_207AE8	section	code abs=0x207AE8

; [code] Pointers_207A43 entry 11 = item 11 Radr10 (src/data/items/names.asm): wCritChance += 10 (ApplyBattleAccessory)
AccBattleRadr10:
	addb	(wCritChance),0xA
	ret

c_207AEE	section	code abs=0x207AEE

; [code] Pointers_207A43 entry 12 = item 12 Cycl10 (src/data/items/names.asm): wEPCostPercent -= 10 (ApplyBattleAccessory)
AccBattleCycl10:
	addb	(wEPCostPercent),0xF6
	ret

c_207AF4	section	code abs=0x207AF4

; [code] Pointers_207A43 entry 13 = item 13 Cycl20 (src/data/items/names.asm): wEPCostPercent -= 20 (ApplyBattleAccessory)
AccBattleCycl20:
	addb	(wEPCostPercent),0xEC
	ret

c_207AFA	section	code abs=0x207AFA

; [code] Pointers_207A43 entry 14 = item 14 Cycl30 (src/data/items/names.asm): wEPCostPercent -= 30 (ApplyBattleAccessory)
AccBattleCycl30:
	addb	(wEPCostPercent),0xE2
	ret

c_207B00	section	code abs=0x207B00

; [code] Pointers_207A43 entry 15 = item 15 Panl15 (src/data/items/names.asm): wRechargePercent += 15 (ApplyBattleAccessory)
AccBattlePanl15:
	addb	(wRechargePercent),0xF
	ret

c_207B06	section	code abs=0x207B06

; [code] Pointers_207A43 entry 16 = item 16 Panl30 (src/data/items/names.asm): wRechargePercent += 30 (ApplyBattleAccessory)
AccBattlePanl30:
	addb	(wRechargePercent),0x1E
	ret

c_207B0C	section	code abs=0x207B0C

; [code] Pointers_207A43 entry 17 = item 17 Panl50 (src/data/items/names.asm): wRechargePercent += 50 (ApplyBattleAccessory)
AccBattlePanl50:
	addb	(wRechargePercent),0x32
	ret

c_207C00	section	code abs=0x207C00

; [code] wBattleResult = BATTLE_RESULT_NONE, StartTask(BattleStart); callers StartDungeonBattle, BossEncounter,
; ArenaStartBattle wait for wBattleResult to change
StartBattleTask:
	ldb	(wBattleResult),BATTLE_RESULT_NONE
	ld	XHL,BattleStart
	call	StartTask
	ret

c_207E9A	section	code abs=0x207E9A

; [code] BC / DE = position: draws the enemy: a monster image (+palette), a robot from wEnemyParts (wEnemyImage 0xFFFF,
; affinity palette), or a portrait for images 0x5E+ (EnemyImagePortraits)
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
	cp	QB,6	; narrow images (width <= 6) are centred 2 tiles in
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
	or	WA,0x8000	; flip the robot to face left (?)
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

; [code] adds LevelGapCrit / Flee / Status[clamp(gap + 11, 0, 22)] to both sides' chances (gap = own level - other's);
; against bosses (Ent..Uniti, Fenril..Satana) the unit's flee and status chances are then 0
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
	cpb	(wEnemyId),ENEMY_ENT	; dungeon monsters and arena robots keep them
	ret	C
	cpb	(wEnemyId),ENEMY_ALEX
	jr	C,AddLevelGapChances.skip
	cpb	(wEnemyId),ENEMY_FENRIL
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

; [code] at each round's draw: wEnemyMinAttackEP = cheapest non-zero cost of the enemy's first 4 slots (an arm's EP
; cost for actions 11 / 12); wCommandEPCosts[4] = the unit's arm / skill costs (ScaleEPCost), wMinEPCost their minimum; all 0 under FullCharge
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
	ld	A,(XHL+SLOT_ACTION)	; actions 11 / 12 use the enemy's arm parts' costs
	cp	A,0xB
	ld	W,(wEnemyParts+2)
	jr	Z,CalcEnemyMinAttackEP.skip
	cp	A,0xC
	ld	W,(wEnemyParts+3)
	jr	Z,CalcEnemyMinAttackEP.skip
	ld	WA,(XHL+SLOT_EP)
	jr	CalcEnemyMinAttackEP.skip2
CalcEnemyMinAttackEP.skip:
	push	XHL
	ld	L,W
	call	GetArmRecord
	ld	WA,(XHL+PART_EP_COST)
	pop	XHL
CalcEnemyMinAttackEP.skip2:
	cp	WA,0xFFFF	; 0xFFFF ends the slot list
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
	ld	WA,(XHL+0xC)	; skill record +0xC = EP cost
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
	; FullCharge skill: every command is free
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

; [code+play] battle task start: fade out, the battle layout (boxes, HP / EP bars, unit and enemy images), resets both
; sides' battle RAM (full EP, chances, statuses, buffs; rust stays), accessories and level-gap chances,
; starts BattleHPEPDisplayTask (+0x2C), the music by enemy, fade in, BattleEncounterMessage
BattleStart:
	ld	XHL,FadeOutToBlackTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	call	InitTextBoxes
	call	ClearTilemaps
	call	ClearSprites
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr1SplitScrollX),0
	ldb	(wScr1SplitScrollY),0x60
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ldb	(wScr2SplitScrollX),0
	ldb	(wScr2SplitScrollY),0x68
	ldb	(wScrollSplitLine),0x61
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
	ld	XHL,BattleStartPal
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
	; battle starts with full EP; HP carries over
	ldw	(wUnitEP),(wUnitMaxEP)
	ld	A,0
	ld	(wCritChance),A
	ld	(wFleeChance),A
	ldb	(wEPCostPercent),0x64	; EP costs at 100 %, recharge 30 % of max EP until accessories change them
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
	ldb	(wBattleResult),BATTLE_RESULT_NONE
	call	ApplyBattleAccessories
	call	AddLevelGapChances
	ld	XHL,BattleHPEPDisplayTask
	call	StartTask
	ld	(XIZ+0x2C),HL	; kept for BattleEnd to end it
; [code] the battle song by wEnemyId: < 0x59 song 0xA, 0x59-0x60 0xC, 0x61 0xD, 0x62-0x75 0xB, >= 0x76 0xC; SoundCommand 0x20 + song
; [play] seen in play: song 0xA (SoundCommand 0x2A) in a random battle (Spidey), song 0xC (0x2C) in the Ent and Kraken boss battles
	ld	E,(wEnemyId)
	cp	E,ENEMY_ENT
	ld	WA,SONG_BATTLE
	ld	BC,MUSIC_BATTLE
	jr	C,BattleStart.skip2
	cp	E,ENEMY_UNITI
	jr	C,BattleStart.skip
	ld	WA,SONG_UNITI_BATTLE
	ld	BC,MUSIC_UNITI_BATTLE
	jr	Z,BattleStart.skip2
	cp	E,ENEMY_SATANA
	ld	WA,SONG_PILOT_BATTLE
	ld	BC,MUSIC_PILOT_BATTLE
	jr	C,BattleStart.skip2
BattleStart.skip:
	ld	WA,SONG_BOSS_BATTLE
	ld	BC,MUSIC_BOSS_BATTLE
BattleStart.skip2:
	push	BC
	call	PlayMusic
	pop	WA
	call	SoundCommand
	ld	XHL,FadeInFromBlackTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),BattleEncounterMessage & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleEncounterMessage >> 16
	ret
; [code] "??" + FF (charmap 64 = "?"), drawn by DrawString at 0x2093BA and 0x2093CB
; [code] "??": BattleStart's placeholder for both sides' level numbers (?)
QuestionMarksText:
	text "??"
	done
; [code] enemy slides in, "You encountered <ENEMY>", slides back out, then DrawBattleScreen
BattleEncounterMessage:
	ld	XHL,EnemySlideInTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF

c_2095F3	section	code abs=0x2095F3
	task_wait
	ld	XHL,YouEncounteredEnemyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemySlideOutTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),DrawBattleScreen & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DrawBattleScreen >> 16
	ret

c_209647	section	code abs=0x209647

; [code] start of every round: stat buffs, EP costs (CalcEnemyMinAttackEP), the unit slides in, level box and
; status icons for paralysis / rust / EP leak / confusion; cursor and choice 0, then EnemyChooseAttack
DrawBattleScreen:
	calr	ComputeStatBuffs
	ldw	(wAttackEPCost),0
	ldw	(wEnemyAttackEPCost),0
	ld	XHL,BattleScreenPal
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
	ldb	(XHL+TASK_ARG),0x14
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
	ld	XHL,BattleParalyzedIconMap
	call	DrawTilemap
DrawBattleScreen.skip:
	cpb	(wStatusRust),0
	jr	Z,DrawBattleScreen.skip2
	ld	WA,0x1CC
	ld	BC,0xE
	ld	DE,9
	ld	XHL,BattleRustIconMap
	call	DrawTilemap
DrawBattleScreen.skip2:
	cpb	(wStatusEPLeak),0
	jr	Z,DrawBattleScreen.skip3
	ld	WA,0x1CC
	ld	BC,0x10
	ld	DE,9
	ld	XHL,BattleEPLeakIconMap
	call	DrawTilemap
DrawBattleScreen.skip3:
	cpb	(wStatusConfused),0
	jr	Z,DrawBattleScreen.skip4
	ld	WA,0x1CC
	ld	BC,0x12
	ld	DE,9
	ld	XHL,BattleConfusedIconMap
	call	DrawTilemap
DrawBattleScreen.skip4:
	ldw	(wBattleChoice),0
	ldb	(wBattleMenuCursor),0
	ldw	(XIZ+TASK_FUNC),EnemyChooseAttack & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyChooseAttack >> 16
	ret
