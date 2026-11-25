; engine/battle: 164 routines (each keeps its ROM address in its own section)

c_206A7B	section	code abs=0x206A7B

swp_206A7B:
	cp	DE,0x98
	ret	GE
	cp	BC,0xA0
	ret	GE
	dec	1,WA
	or	W,0x18
	xor	W,0x80
	push	WA
	push	DE
	push	BC
	ld	A,(XHL+)
	ld	QC,A
	ld	W,0
	sll	3,WA
	add	BC,WA
	jrl	MI,swp_206A7B.skip2
	dec	8,BC
	ld	(XSP),BC
	ld	A,(XHL+)
	ld	QB,A
	ld	W,0
	sll	3,WA
	add	DE,WA
	jr	MI,swp_206A7B.skip2
	ld	BC,0
	ld	XDE,0
swp_206A7B.loop:
	cpw	(0x5A82),0x5B86
	jr	NC,swp_206A7B.skip2
	ld	WA,(XHL)
	and	WA,0x1FF
	jr	Z,swp_206A7B.skip
	ld	A,B
	ld	W,0
	sll	3,WA
	add	WA,(XSP+2)
	cp	WA,0xFFF8
	jr	LE,swp_206A7B.skip
	cp	WA,0xA0
	jr	GE,swp_206A7B.skip2
	ld	QW,A
	ld	A,C
	ld	W,0
	sll	3,WA
	neg	WA
	add	WA,(XSP)
	cp	WA,0xFFF8
	jr	LE,swp_206A7B.skip
	cp	WA,0xA8
	jr	GE,swp_206A7B.skip
	ld	QA,A
	ld	WA,(XHL)
	and	W,0xE1
	add	WA,(XSP+4)
	ld	DE,(0x5A82)
	ld	(XDE+),XWA
	ld	(0x5A82),DE
	ld	WA,(XHL)
	srl	1,W
	and	W,0xF
	ld	DE,(0x5A84)
	ld	(XDE+),W
	ld	(0x5A84),DE
swp_206A7B.skip:
	inc	2,XHL
	inc	1,C
	cp	C,QC
	jr	C,swp_206A7B.loop
	ld	C,0
	inc	1,B
	cp	B,QB
	jr	C,swp_206A7B.loop
swp_206A7B.skip2:
	inc	6,XSP
	ret

c_2077A6	section	code abs=0x2077A6

sub_2077A6:
	push	XHL
	calr	dyn_2077BE
	add	(XSP),XHL
	pop	XHL
	ld	WA,BC
sub_2077A6.loop:
	ld	BC,0x80
	ldirw	(XDE+),(XHL+)
	djnz	WA,sub_2077A6.loop
	ld	RA3,0
	ld	A,RA3
	ret

c_2077BE	section	code abs=0x2077BE

dyn_2077BE:
	cpw	(HeaderCartId),0xFFFE
	ld	XHL,0x200000
	ret	NZ
	ld	QL,0x80
	ret

c_2077D1	section	code abs=0x2077D1

; A = enemy id: copies its record into battle RAM 0x5DA3-0x5DB9
LoadEnemy:
	ld	(wEnemyId),A
	ld	XWA,0
	ld	(wEnemyParts),XWA
	ld	(0x5DD5),WA
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
	ld	L,(0x5DD2)
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
	ld	L,(0x5DD3)
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
	ld	L,(0x5DD4)
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
	ld	L,(0x5DD5)
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
	ld	L,(0x5DD6)
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

swp_207A27:
	ld	A,(wEquipAcc1)
	calr	sub_207A32
	ld	A,(wEquipAcc2)

c_207A32	section	code abs=0x207A32

sub_207A32:
	ld	XHL,0
	ld	L,A
	sll	2,HL
	add	XHL,Pointers_207A43
	ld	XHL,(XHL)
	jp	XHL

c_207E9A	section	code abs=0x207E9A

; wEnemyImage -> MonsterImage, LoadMonsterImage; images 0x5E+ are portraits (EnemyImagePortraits)
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
	call	swp_206C7B
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
	call	swp_20847F
	ld	HL,(XSP)
	call	DrawRobot
	pop	WA
	pop	BC
	ld	DE,(XSP)
	inc	1,DE
	or	WA,0x8000
	ld	QB,0xC
	ld	QD,0xB
	call	swp_206C7B
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
	calr	sub_207FF7
	ld	W,(XHL+A)
	add	(wCritChance),W
	ld	W,(XDE+A)
	add	(wFleeChance),W
	ld	W,(XBC+A)
	add	(wStatusChance),W
	ld	A,(wEnemyLevel)
	sub	A,(wPlayerLevel)
	calr	sub_207FF7
	ld	W,(XHL+A)
	add	(wEnemyCritChance),W
	ld	W,(XDE+A)
	add	(0x5DBF),W
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

sub_207FF7:
	add	A,0xB
	jr	MI,sub_207FF7.skip
	cp	A,0x16
	ret	LE
	ld	A,0x16
	ret
sub_207FF7.skip:
	ld	A,0
	ret

c_208007	section	code abs=0x208007

; cheapest enemy attack -> wEnemyMinAttackEP
CalcEnemyMinAttackEP:
	ld	WA,0xFFFF
	ld	(wCommandEPCosts),WA
	ld	(0x5D84),WA
	ld	(0x5D86),WA
	ld	(0x5D88),WA
	ld	(wMinEPCost),WA
	ld	(wEnemyMinAttackEP),WA
	ld	L,(wEnemyId)
	call	GetEnemyAttackSlots
	ld	C,4
CalcEnemyMinAttackEP.loop:
	ld	A,(XHL+3)
	cp	A,0xB
	ld	W,(0x5DD3)
	jr	Z,CalcEnemyMinAttackEP.skip
	cp	A,0xC
	ld	W,(0x5DD4)
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
	call	sub_2089DC
	ld	(wCommandEPCosts),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip5
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip5:
	ld	L,(wEquipLeftArm)
	call	GetArmRecord
	ld	WA,(XHL+PART_EP_COST)
	call	sub_2089DC
	ld	(0x5D84),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip6
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip6:
	ld	L,(wSkill1)
	or	L,L
	jr	Z,CalcEnemyMinAttackEP.skip7
	call	GetSkillRecord
	ld	WA,(XHL+0xC)
	call	sub_2089DC
	ld	(0x5D86),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip7
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip7:
	ld	L,(wSkill2)
	or	L,L
	jr	Z,CalcEnemyMinAttackEP.skip8
	call	GetSkillRecord
	ld	WA,(XHL+0xC)
	call	sub_2089DC
	ld	(0x5D88),WA
	cp	(wMinEPCost),WA
	jr	C,CalcEnemyMinAttackEP.skip8
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.skip8:
	cpb	(wFullChargeActive),0
	jr	Z,CalcEnemyMinAttackEP.done
	ld	WA,0
	ld	(wCommandEPCosts),WA
	ld	(0x5D84),WA
	ld	(0x5D86),WA
	ld	(0x5D88),WA
	ld	(wMinEPCost),WA
CalcEnemyMinAttackEP.done:
	ret

c_208108	section	code abs=0x208108

; [code] A = level -> WA = random 1..rand + base (LevelRolls[(level-1)/5])
LevelRoll:
	dec	1,A
	ld	W,0
	div	WA,5
	ld	W,0
	sll	1,WA
	extz	XWA
	add	XWA,LevelRolls
	push	WA
	push	XWA
	ld	A,(XWA)
	ld	W,0
	call	RandomRange
	ld	(XSP+4),WA
	pop	XWA
	inc	1,XWA
	ld	A,(XWA)
	ld	W,0
	add	WA,(XSP+)
	ret

c_20815F	section	code abs=0x20815F

; [code] (unit MP % + LevelRoll) - (enemy MP % + LevelRoll); negative: EnemyTurn first (swp_209E01)
TurnOrderMargin:
	ld	WA,(wUnitMP)
	call	sub_208A27
	push	WA
	ld	A,(wPlayerLevel)
	call	LevelRoll
	add	(XSP),WA
	ld	WA,(wEnemyMP)
	call	sub_208AD5
	push	WA
	ld	A,(wEnemyLevel)
	call	LevelRoll
	add	(XSP),WA
	pop	WA
	sub	(XSP),WA
	pop	WA
	ret

c_20818A	section	code abs=0x20818A

; [code] BC = attacker RP, DE = defender RP, A/W = levels -> WA = BC + LevelRoll - ((DE+3)/4 + W); negative = miss
HitMargin:
	inc	3,DE
	srl	2,DE
	push	W
	call	LevelRoll
	add	BC,WA
	pop	A
	add	DE,WA
	sub	BC,DE
	ld	WA,BC
	ret

c_20819F	section	code abs=0x20819F

; [code] BC = attack, DE = defence, A = level -> WA = DamageTable[row][random 0-4]
DamageRoll:
	push	A
	call	LevelRoll
	add	BC,WA
	pop	A
	call	LevelRoll
	add	DE,WA
	sub	BC,DE
	jr	NC,DamageRoll.skip
	ld	BC,0xFFFB
DamageRoll.skip:
	add	BC,9
	extz	XBC
	div	XBC,5
	cp	BC,0xC9
	jr	LE,DamageRoll.skip2
	ld	BC,0xC9
DamageRoll.skip2:
	ld	WA,0xA
	call	RandomRange
	dec	1,WA
	srl	1,WA
	mul	XBC,5
	add	BC,WA
	sll	1,BC
	ld	XDE,DamageTable
	ld	WA,(XDE+BC)
	ret

c_2081E7	section	code abs=0x2081E7

; [code] WA = damage, BC/DE = attacker/defender affinity -> WA x AffinityTable / 100, min 1
ApplyAffinity:
	push	XHL
	push	WA
	ld	WA,BC
	call	AffinityIndex
	ld	HL,WA
	mul	XHL,9
	ld	WA,DE
	call	AffinityIndex
	add	HL,WA
	sll	1,XHL
	add	XHL,AffinityTable
	ld	HL,(XHL)
	pop	WA
	mul	XWA,HL
	div	XWA,0x64
	pop	XHL
	or	WA,WA
	ret	NZ
	inc	1,WA
	ret

c_208217	section	code abs=0x208217

; [code] WA = affinity bits -> lowest set bit 0-7, 8 = none (BS1F)
AffinityIndex:
	or	WA,0xFF00
	bs1f	A,WA
	ld	W,0
	ret

c_20823D	section	code abs=0x20823D

; [code] HL = attack affinity (else wEnemyAffinity, else the body's) -> XHL = AffinityPalettes + 8 * AffinityIndex
GetAffinityPalette:
	push	XWA
	ld	WA,HL
	call	AffinityIndex
	cp	WA,7
	jr	C,GetAffinityPalette.skip
	ld	WA,(wEnemyAffinity)
	call	AffinityIndex
	cp	WA,7
	jr	C,GetAffinityPalette.skip
	ld	L,(wEquipBody)
	call	GetBodyRecord
	ld	WA,(XHL+PART_AFFINITY)
	call	AffinityIndex
GetAffinityPalette.skip:
	extz	XWA
	sll	3,XWA
	add	XWA,AffinityPalettes
	ld	XHL,XWA
	pop	XWA
	ret

c_2083B0	section	code abs=0x2083B0

; [code] L = arm -> ArmEffects + 7*(arm-1)
GetArmEffects:
	ld	H,0
	dec	1,HL
	mul	XHL,7
	add	XHL,ArmEffects
	ret

c_2083FB	section	code abs=0x2083FB

; [code] L = turns -> L = StatusRecovery[turns]
GetStatusRecovery:
	ld	H,0
	extz	XHL
	add	XHL,StatusRecovery
	ld	L,(XHL)
	ld	H,0
	ret

c_20847F	section	code abs=0x20847F

swp_20847F:
	ld	XHL,wEnemyParts
	call	SetRobotDrawParts
	ret

c_20898E	section	code abs=0x20898E

swp_20898E:
	addw	(wUnitSP),0xA
	ret

c_208995	section	code abs=0x208995

swp_208995:
	addw	(wUnitSP),0x14
	ret

c_20899C	section	code abs=0x20899C

swp_20899C:
	addw	(wUnitSP),0x1E
	ret

c_2089A3	section	code abs=0x2089A3

swp_2089A3:
	addw	(wUnitRP),0xA
	ret

c_2089AA	section	code abs=0x2089AA

swp_2089AA:
	addw	(wUnitRP),0x14
	ret

c_2089B1	section	code abs=0x2089B1

swp_2089B1:
	addw	(wUnitRP),0x1E
	ret

c_2089B8	section	code abs=0x2089B8

swp_2089B8:
	addw	(wUnitMP),0xA
	ret

c_2089BF	section	code abs=0x2089BF

swp_2089BF:
	addw	(wUnitMP),0x14
	ret

c_2089C6	section	code abs=0x2089C6

swp_2089C6:
	addw	(wUnitMP),0x1E
	ret

c_2089CD	section	code abs=0x2089CD

sub_2089CD:
	cpb	(wAirbagActive),0
	ret	Z
	srl	1,WA
	ret	NZ
	ld	WA,1
	ret

c_2089DC	section	code abs=0x2089DC

sub_2089DC:
	push	WA
	ld	A,(0x5D91)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_2089EB	section	code abs=0x2089EB

swp_2089EB:
	ld	A,(0x5D92)
	ld	W,0
	mul	XWA,(wUnitMaxEP)
	div	XWA,0x64
	ret

c_2089FA	section	code abs=0x2089FA

swp_2089FA:
	push	WA
	ld	A,(0x5D8A)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A09	section	code abs=0x208A09

swp_208A09:
	push	WA
	ld	A,(wPlayerSPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A18	section	code abs=0x208A18

swp_208A18:
	push	WA
	ld	A,(wPlayerRPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A27	section	code abs=0x208A27

sub_208A27:
	push	WA
	ld	A,(0x5D8D)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A36	section	code abs=0x208A36

; WA = enemy exp -> exp x ExpLevelDiff % (rounded up)
ExpForKill:
	push	WA
	ld	XWA,0
	ld	A,(wPlayerLevel)
	sub	A,(wEnemyLevel)
	cp	A,0xFB
	jr	GE,ExpForKill.skip
	ld	A,0xFB
	jr	ExpForKill.skip2
ExpForKill.skip:
	cp	A,5
	jr	LE,ExpForKill.skip2
	ld	A,5
ExpForKill.skip2:
	neg	A
	inc	5,A
	add	XWA,ExpLevelDiff
	ld	A,(XWA)
	ld	W,0
	mul	XWA,(XSP+)
	add	XWA,0x63
	div	XWA,0x64
	ret

c_208A6C	section	code abs=0x208A6C

; [code] WA = 0 -> WA = 1, else unchanged; called right after ApplyAffinity before storing wPlayerDamage / wEnemyDamage (PlayerAttack, EnemyAttack, EnemyArmAttack)
AtLeastOne:
	or	WA,WA
	ret	NZ
	ld	WA,1
	ret

c_208A82	section	code abs=0x208A82

swp_208A82:
	ld	A,(0x5DC2)
	ld	W,0
	mul	XWA,(wEnemyMaxEP)
	div	XWA,0x64
	ret

c_208A91	section	code abs=0x208A91

swp_208A91:
	push	XHL
	push	WA
	ld	A,(wEnemyAPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	pop	XHL
	ret

c_208AA2	section	code abs=0x208AA2

swp_208AA2:
	cpb	(wEnemyScaled),0
	ret	Z
	push	XHL
	call	GetEnemyScaling
	mul	XWA,(XHL+4)
	div	XWA,0x64
	pop	XHL
	ret

c_208AB7	section	code abs=0x208AB7

; [code] WA = WA * byte(0x5DBB) / 100, same shape as swp_208AC6 (wEnemyRPBuff) and the wEnemyAPBuff multiply at battle.asm:862; applied to wEnemySP in PlayerAttack / EnemyAttack / EnemyArmAttack before DamageRoll
ApplyEnemySPBuff:
	push	WA
	ld	A,(wEnemySPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208AC6	section	code abs=0x208AC6

swp_208AC6:
	push	WA
	ld	A,(wEnemyRPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208AD5	section	code abs=0x208AD5

sub_208AD5:
	push	WA
	ld	A,(0x5DBD)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208FBF	section	code abs=0x208FBF

swp_208FBF:
	ld	WA,(wEnemyEP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wEnemyMaxEP)
	jr	LE,swp_208FBF.skip
	ld	WA,(wEnemyMaxEP)
	sub	WA,(wEnemyEP)
	jr	Z,swp_208FBF.skip2
	ld	(XIZ+TASK_ARG),WA
swp_208FBF.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyEP)
	ldw	(XIZ+TASK_FUNC),0x8FED
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wEnemyEP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
swp_208FBF.skip2:
	call	EndTask
	ret

c_20900D	section	code abs=0x20900D

swp_20900D:
	ld	WA,(wEnemyEP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,swp_20900D.skip
	ld	(XIZ+TASK_ARG),WA
swp_20900D.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyEP)
	ldw	(XIZ+TASK_FUNC),0x902D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	neg	WA
	add	WA,(XIZ+0x14)
	ld	(wEnemyEP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
	call	EndTask
	ret

c_20904F	section	code abs=0x20904F

swp_20904F:
	ldb	(0x584D),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),0x906F
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_20904F.skip
	ldb	(XIZ+0x10),0
swp_20904F.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	add	A,0xC0
	ld	(0x584B),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_209089	section	code abs=0x209089

swp_209089:
	ldb	(0x584D),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),0x90A9
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_209089.skip
	ldb	(XIZ+0x10),0
swp_209089.skip:
	ld	A,0xA0
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	ld	(0x584B),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_2090C0	section	code abs=0x2090C0

swp_2090C0:
	ldb	(0x584D),0
	ldb	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0x90E0
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_2090C0.skip
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
swp_2090C0.skip:
	ld	A,0xA0
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	add	A,0xC0
	ld	(0x584B),A
	incb	1,(XIZ+0x10)
	ld	A,(XIZ+0x10)
	cp	A,(XIZ+TASK_ARG)
	jp	GT,EndTask
	ret

c_2090FE	section	code abs=0x2090FE

swp_2090FE:
	ldb	(0x584D),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),0x911E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_2090FE.skip
	ldb	(XIZ+0x10),0
swp_2090FE.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	add	A,0x60
	ld	(0x584B),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_209136	section	code abs=0x209136

swp_209136:
	ldb	(0x584D),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),0x9156
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_209136.skip
	ldb	(XIZ+0x10),0
swp_209136.skip:
	ld	A,0x40
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	add	A,0xC0
	ld	(0x584B),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_20916E	section	code abs=0x20916E

swp_20916E:
	ldb	(0x5855),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),0x918E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_20916E.skip
	ldb	(XIZ+0x10),0
swp_20916E.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	ld	(0x5853),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_2091A3	section	code abs=0x2091A3

swp_2091A3:
	ldb	(0x5855),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),0x91C3
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_2091A3.skip
	ldb	(XIZ+0x10),0
swp_2091A3.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	add	A,0x60
	ld	(0x5853),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_2091DD	section	code abs=0x2091DD

swp_2091DD:
	ldb	(0x5855),0
	ldb	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0x91FD
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wOptionAnimation),0
	jr	NZ,swp_2091DD.skip
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
swp_2091DD.skip:
	ld	A,0xA0
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	ld	(0x5853),A
	incb	1,(XIZ+0x10)
	ld	A,(XIZ+0x10)
	cp	A,(XIZ+TASK_ARG)
	jp	GT,EndTask
	ret

c_20921A	section	code abs=0x20921A

swp_20921A:
	ld	A,0
	call	GetTextBox
	ld	(XIZ+TASK_ARG),XWA
	ldw	(XIZ+TASK_FUNC),0x922D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	XWA,(XIZ+TASK_ARG)
	ld	L,(wJoyPressed)
	and	L,0x30
	jr	Z,swp_20921A.skip
	ldb	(XWA+0x10),0
swp_20921A.skip:
	ld	XHL,(XWA+8)
	or	XHL,XHL
	ret	NZ
	ldw	(XIZ+TASK_FUNC),0x924F
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20924F	section	code abs=0x20924F

swp_20924F:
	call	EndTask
	ret

c_209254	section	code abs=0x209254

; [code] task: plays each effect id of the list at task +0x14 until FF
PlayEffectList:
	cpb	(wOptionAnimation),0
	jr	Z,PlayEffectList.skip
	ld	XBC,(XIY+0x14)
	ld	A,(XBC+)
	cp	A,0xFF
	jr	Z,PlayEffectList.skip
	ld	(XIY+0x14),XBC
	ld	XHL,swp_2092D4
	push	A
	call	StartChildTask
	pop	A
	ld	W,0
	ld	(XHL+0x20),WA
	ld	WA,(XIZ+TASK_ARG)
	ld	(XHL+0x1E),WA
	task_wait
	jp	PlayEffectList
PlayEffectList.skip:
	call	EndTask
	ret

c_2092FB	section	code abs=0x2092FB

swp_2092FB:
	decw	1,(XIZ+TASK_ARG)
	jr	Z,swp_2092FB.skip
	ld	WA,(XIZ+TASK_ARG)
	rr	4,WA
	sbc	A,A
	and	A,0x7F
	ld	(wFadeLevel),A
	ret
swp_2092FB.skip:
	ldb	(wFadeLevel),0
	call	EndTask
	ret

c_20931A	section	code abs=0x20931A

swp_20931A:
	decw	1,(XIZ+TASK_ARG)
	jr	Z,swp_20931A.skip
	ld	WA,(XIZ+TASK_ARG)
	rr	4,WA
	sbc	A,A
	and	A,0x7F
	neg	A
	ld	(wFadeLevel),A
	ret
swp_20931A.skip:
	ldb	(wFadeLevel),0
	call	EndTask
	ret

c_20933B	section	code abs=0x20933B

; [code+play] battle screen setup: enemy image, battle RAM reset, AddLevelGapChances, PlayMusic (every encounter screen)
BattleStart:
	ld	XHL,swp_208BA1
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	call	InitTextBoxes
	call	sub_2067E1
	call	sub_206847
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x584F),0
	ldb	(0x5851),0x60
	ldb	(0x5853),0x60
	ldb	(0x5855),0
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
	call	sub_20768E
	ld	XHL,QuestionMarksText
	call	DrawString
	ld	C,6
	ld	E,1
	call	sub_20768E
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
	call	swp_206C7B
	ld	WA,0x3F5B
	ld	BC,5
	ld	DE,0x18
	ld	QB,4
	ld	QD,1
	call	swp_206C7B
	ld	WA,0x3F61
	ld	BC,0xB
	ld	DE,0x18
	ld	QB,4
	ld	QD,1
	call	swp_206C7B
	ld	WA,0x1D6A
	ld	BC,0
	ld	DE,0x19
	ld	QB,0x14
	ld	QD,1
	call	swp_206C7B
	ld	WA,0x3F6F
	ld	BC,5
	ld	DE,0x19
	ld	QB,4
	ld	QD,1
	call	swp_206C7B
	ld	WA,0x3F75
	ld	BC,0xB
	ld	DE,0x19
	ld	QB,4
	ld	QD,1
	call	swp_206C7B
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
	ldb	(0x5D91),0x64
	ldb	(0x5D92),0x1E
	ld	(wStatusChance),A
	ld	(wStatusParalyzed),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ld	(0x5D97),A
	ld	(0x5D98),A
	ld	(0x5D99),A
	ld	(0x5D9A),A
	ld	(0x5D9B),A
	ld	(0x5D9C),A
	ld	(0x5D9D),A
	ld	(0x5D9E),A
	ld	(wAirbagActive),A
	ld	(wFullChargeActive),A
	ld	(wRecvrActive),A
	ldw	(wEnemyHP),(wEnemyMaxHP)
	ldw	(wEnemyEP),(wEnemyMaxEP)
	ld	(wEnemyCritChance),A
	ld	(0x5DBF),A
	ldb	(wEnemyEPCostBuff),0x64
	ldb	(0x5DC2),0x1E
	ld	(wEnemyStatusChance),A
	ld	(wEnemyParalyzed),A
	ld	(wEnemyRusted),A
	ld	(wEnemyEPLeak),A
	ld	(wEnemyConfused),A
	ld	(0x5DC7),A
	ld	(0x5DC8),A
	ld	(wEnemySPDownTurns),A
	ld	(wEnemyRPDownTurns),A
	ld	(wEnemyMPDownTurns),A
	ld	(0x5DCC),A
	ld	(0x5DCD),A
	ld	(0x5DCE),A
	ld	(0x5DCF),A
	ld	(0x5DD8),A
	ld	(wTimeStopTurns),A
	ldb	(wBattleResult),0xFF
	call	swp_207A27
	call	AddLevelGapChances
	ld	XHL,loc_208CB6
	call	StartTask
	ld	(XIZ+0x2C),HL
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
	ld	XHL,swp_208B74
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),0x95E6
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
; [code] "??" + FF (charmap 64 = "?"), drawn by DrawString at 0x2093BA and 0x2093CB
QuestionMarksText:
	db	0x64,0x64,0xFF
; [code] BattleStart's task resumes here (TASK_FUNC 0x2095E6 above); [play] executed in all runs (D10)
loc_2095E6:
	ld	XHL,swp_20916E
	call	StartChildTask
	ldb	(XHL+0xE),0xF

c_2095F3	section	code abs=0x2095F3
	task_wait
	ld	XHL,YouEncounteredEnemyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_2091A3
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),0x9647
	ldw	(XIZ+TASK_FUNC_HI),0x20
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
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ld	XHL,swp_209089
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
	call	sub_20768E
	call	sub_207720
	ld	C,(wPlayerLevel)
	ld	B,0
	call	sub_207CF0
	ld	C,0
	ld	E,0
	call	sub_20768E
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
	ldw	(XIZ+TASK_FUNC),0x974E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20974E	section	code abs=0x20974E

; pick a slot by chance, or the default attack if EP is short
EnemyChooseAttack:
	ld	WA,(wEnemyMinAttackEP)
	cp	(wEnemyEP),WA
	ld	XHL,DefaultEnemyAttack
	jr	C,EnemyChooseAttack.skip
	ld	L,(wEnemyId)
	call	GetEnemyAttackSlots
	call	Random
	extz	WA
EnemyChooseAttack.loop:
	ld	B,(XHL+7)
	calr	swp_20984D
	cp	B,0x64
	jr	Z,EnemyChooseAttack.skip
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	sub	WA,BC
	jr	C,EnemyChooseAttack.skip
	add	XHL,0xF
	jr	EnemyChooseAttack.loop
EnemyChooseAttack.skip:
	ld	A,(XHL+3)
	cp	A,0xB
	ld	W,(0x5DD3)
	jr	Z,EnemyChooseAttack.skip2
	cp	A,0xC
	ld	W,(0x5DD4)
	jr	Z,EnemyChooseAttack.skip2
	ld	WA,(XHL+4)
	jr	EnemyChooseAttack.skip3
EnemyChooseAttack.skip2:
	push	XHL
	ld	L,W
	call	GetArmRecord
	ld	WA,(XHL+PART_EP_COST)
	pop	XHL
EnemyChooseAttack.skip3:
	cp	(wEnemyEP),WA
	jr	NC,EnemyChooseAttack.skip4
	ld	XHL,DefaultEnemyAttack
EnemyChooseAttack.skip4:
	ld	(wEnemyAttackSlot),XHL
	ld	XHL,WhatDoYouDoText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,2
	ld	C,8
	ld	E,9
	ld	HL,0x194
	call	OpenTextBox
	ld	XHL,AttackItemChargeText
	call	ExpandMessage
	call	DrawString
	cpb	(wEnemyId),0x76
	jr	NZ,EnemyChooseAttack.skip5
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	jr	NZ,EnemyChooseAttack.skip5
	ld	HL,EVENT_STAGE_WON_RANK_X
	call	CheckEventFlag
	jr	NZ,EnemyChooseAttack.skip5
	jr	EnemyChooseAttack.skip6
EnemyChooseAttack.skip5:
	cpb	(wDungeonBattle),0
	ld	XHL,QuitText
	jr	Z,EnemyChooseAttack.skip7
EnemyChooseAttack.skip6:
	ld	XHL,FleeText
EnemyChooseAttack.skip7:
	call	ExpandMessage
	call	DrawString
	ld	C,2
	ld	E,0x2D
	call	PlaceTextBoxXWA
	ldb	(0x5853),0xB0
	ldb	(0x5855),0x68
	ldw	(XIZ+TASK_FUNC),0x9872
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20984D	section	code abs=0x20984D

swp_20984D:
	cp	B,0x65
	ret	C
	jr	Z,swp_20984D.skip
	ld	B,0
	ret
swp_20984D.skip:
	ld	B,0
	cpb	(0x5DD8),0
	ret	NZ
	ld	BC,(wEnemyMaxHP)
	srl	1,BC
	cp	(wEnemyHP),BC
	ld	B,0
	ret	NC
	ld	B,0x64
	ret

c_209872	section	code abs=0x209872

; [code+play] cursor 0x5DE0 0-3 on U/D, A jumps through BattleMainMenuJumps
BattleMainMenuInput:
	bit	4,(wFrameCounter)
	jr	Z,BattleMainMenuInput.skip
	ld	E,(wBattleMenuCursor)
	ld	D,0
	sll	4,DE
	inc	4,DE
	ld	BC,0x60
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
BattleMainMenuInput.skip:
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,BattleMainMenuInput.skip2
	bit	1,A
	jr	NZ,BattleMainMenuInput.skip3
	bit	4,A
	jr	NZ,BattleMainMenuInput.skip4
	ret
BattleMainMenuInput.skip2:
	ld	WA,0x80
	call	SoundCommand
	call	Random
	ld	A,(wBattleMenuCursor)
	dec	1,A
	and	A,3
	ld	(wBattleMenuCursor),A
	ret
BattleMainMenuInput.skip3:
	ld	WA,0x80
	call	SoundCommand
	call	Random
	ld	A,(wBattleMenuCursor)
	inc	1,A
	and	A,3
	ld	(wBattleMenuCursor),A
	ret
BattleMainMenuInput.skip4:
	ld	WA,0x81
	call	SoundCommand
	call	Random
	ld	A,2
	call	sub_207598
	ld	XHL,0
	ld	L,(wBattleMenuCursor)
	sll	2,XHL
	add	XHL,BattleMainMenuJumps
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
; [code] the task function for each wBattleMenuCursor 0-3 (BattleMainMenuInput)
BattleMainMenuJumps:
	dl	BattleCommandMenu	; 0
	dl	swp_209B8B	; 1
	dl	ShowEPAtMax	; 2
	dl	swp_209E01	; 3

c_20990F	section	code abs=0x20990F

; [code] "EP at max"
ShowEPAtMax:
	ld	WA,(wUnitEP)
	cp	WA,(wUnitMaxEP)
	jr	C,ShowEPAtMax.skip
	ld	XHL,EPAtMaxText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0x974E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
ShowEPAtMax.skip:
	ldw	(XIZ+TASK_FUNC),0x9E01
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20994F	section	code abs=0x20994F

; [code] "LV" + FF (charmap 2C 36): DrawBattleScreen draws it with DrawString before wPlayerLevel
LevelText:
	db	0x2C,0x36,0xFF
; [code+play] battle_command_menu; ShowWeaponInfo. [play] entered at 0x209952 in all runs (D10);
; BattleMainMenuJumps entry 0 and the task resume after swp_209E01 lead here
BattleCommandMenu:
	ld	A,2
	ld	C,8
	ld	E,9
	ld	HL,0x194
	call	OpenTextBox
	ld	XHL,TText
	call	ExpandMessage
	call	DrawString
	ld	XHL,LeftArmText
	call	ExpandMessage
	ldb	(XWA+6),0
	ldb	(XWA+7),2
	call	DrawString
	ld	XHL,Skill1Text
	call	ExpandMessage
	ldb	(XWA+6),0
	ldb	(XWA+7),4
	call	DrawString
	ld	XHL,Skill2Text
	call	ExpandMessage
	ldb	(XWA+6),0
	ldb	(XWA+7),6
	call	DrawString
	ld	C,2
	ld	E,0x2D
	call	PlaceTextBoxXWA
	calr	ShowWeaponInfo
	ldw	(XIZ+TASK_FUNC),0x99C1
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_2099C1	section	code abs=0x2099C1

; [code+play] task set by BattleCommandMenu (split pointer 0x99C1/0x20): cursor for wBattleChoice drawn when wFrameCounter bit 4 is set (sub_206BFF), wJoyPressed Up/Down/A/B; trace: runs every frame of the menu (play runs.md)
BattleCommandMenuTask:
	bit	4,(wFrameCounter)
	jr	Z,BattleCommandMenuTask.skip
	ld	DE,(wBattleChoice)
	sll	4,DE
	inc	4,DE
	ld	BC,0x60
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
BattleCommandMenuTask.skip:
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,BattleCommandMenuTask.skip2
	bit	1,A
	jr	NZ,BattleCommandMenuTask.skip4
	bit	4,A
	jr	NZ,BattleCommandMenuTask.skip6
	bit	5,A
	jrl	NZ,loc_209AE0
	ret
BattleCommandMenuTask.skip2:
	ld	WA,0x80
	call	SoundCommand
	call	Random
	ld	WA,(wBattleChoice)
	dec	1,WA
	and	WA,3
BattleCommandMenuTask.loop:
	ld	(wBattleChoice),WA
	cp	WA,2
	jrl	C,ShowWeaponInfo
	jr	Z,BattleCommandMenuTask.skip3
	cpb	(wSkill2),0
	jrl	NZ,ShowWeaponInfo
	ld	WA,2
	jr	BattleCommandMenuTask.loop
BattleCommandMenuTask.skip3:
	cpb	(wSkill1),0
	jrl	NZ,ShowWeaponInfo
	ld	WA,1
	jr	BattleCommandMenuTask.loop
BattleCommandMenuTask.skip4:
	ld	WA,0x80
	call	SoundCommand
	call	Random
	ld	WA,(wBattleChoice)
	inc	1,WA
	and	WA,3
BattleCommandMenuTask.loop2:
	ld	(wBattleChoice),WA
	cp	WA,2
	jrl	C,ShowWeaponInfo
	jr	Z,BattleCommandMenuTask.skip5
	cpb	(wSkill2),0
	jrl	NZ,ShowWeaponInfo
	ld	A,0
	jr	BattleCommandMenuTask.loop2
BattleCommandMenuTask.skip5:
	cpb	(wSkill1),0
	jrl	NZ,ShowWeaponInfo
	ld	WA,3
	jr	BattleCommandMenuTask.loop2
BattleCommandMenuTask.skip6:
	ld	XHL,wCommandEPCosts
	ld	WA,(wBattleChoice)
	sll	1,WA
	ld	WA,(XHL+WA)
	cp	(wUnitEP),WA
	jr	C,BattleCommandMenuTask.skip7
	ld	(wAttackEPCost),WA
	ld	WA,0x81
	call	SoundCommand
	ld	A,2
	call	sub_207598
	ld	A,0
	call	ClearTextBox
	ldw	(XIZ+TASK_FUNC),0x9E01
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
BattleCommandMenuTask.skip7:
	ld	WA,0x83
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),0x9AB5
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_209AB5	section	code abs=0x209AB5

; [code]
ShowNotEnoughEP:
	ld	XHL,NotEnoughEPText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0x9952
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_209AE0	section	code abs=0x209AE0

loc_209AE0:
	ld	WA,0x82
	call	SoundCommand
	call	Random
	ld	A,2
	call	sub_207598
	ld	A,0
	call	ClearTextBox
	ldw	(XIZ+TASK_FUNC),0x974E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_209B02	section	code abs=0x209B02

; [code] arm / skill record and description in battle
ShowWeaponInfo:
	ld	A,0
	call	ClearTextBox
	cpw	(wBattleChoice),1
	ld	L,(wEquipRightArm)
	jr	C,ShowWeaponInfo.skip2
	ld	L,(wEquipLeftArm)
	jr	Z,ShowWeaponInfo.skip2
	cpw	(wBattleChoice),3
	ld	L,(wSkill1)
	jr	C,ShowWeaponInfo.skip
	ld	L,(wSkill2)
ShowWeaponInfo.skip:
	push	L
	call	GetSkillRecord
	ld	WA,(XHL+0xE)
	pop	L
	call	GetSkillDesc
	jr	ShowWeaponInfo.skip3
ShowWeaponInfo.skip2:
	push	L
	call	GetArmRecord
	ld	WA,(XHL+PART_AFFINITY)
	pop	L
	call	GetArmDesc
ShowWeaponInfo.skip3:
	push	WA
	ld	(XIZ+0x10),XHL
	ld	XHL,wCommandEPCosts
	ld	WA,(wBattleChoice)
	sll	1,WA
	ld	WA,(XHL+WA)
	ld	(XIZ+0x14),WA
	ld	XHL,Str1EPCostNum3Text
	call	ExpandMessage
	ld	A,0
	call	DrawBoxString
	pop	WA
	or	WA,WA
	ret	Z
	push	WA
	ld	A,0
	ld	C,0x11
	ld	E,2
	call	sub_20768A
	pop	HL
	call	GetAffinityIcon
	call	DrawTextChar
	ret

c_209B8B	section	code abs=0x209B8B

swp_209B8B:
	ld	A,2
	ld	C,0xA
	ld	E,9
	ld	HL,0x194
	call	OpenTextBox
	calr	sub_209D2F
	ld	C,0
	ld	E,0x2D
	call	PlaceTextBoxXWA
	ldb	(0x5853),0xB0
	ldb	(0x5855),0x68
	ldw	(wBattleChoice),0
	calr	sub_209CCE
	calr	sub_209CDC
	ldw	(XIZ+TASK_FUNC),0x9BC4
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_209BC4	section	code abs=0x209BC4

; [code] task func set by swp_209B8B (opens box 2, wBattleChoice = 0): U/D row 0-5 and L/R page 0-2 of wBattleChoice (6 per page, sub_209CCE/sub_209CDC draw GetItemDesc of item choice+0x26), A: choice < 0xE and 0x2061D6(item) -> wBattleChoice += 0x26 (battle items 38-51) and swp_209E01, else sound 0x83; B -> 0x20974E
BattleItemListInput:
	calr	sub_209CCE
	bit	4,(wFrameCounter)
	jr	Z,BattleItemListInput.skip
	sll	3,DE
	inc	4,DE
	ld	BC,0x50
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
BattleItemListInput.skip:
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,BattleItemListInput.skip2
	bit	1,A
	jr	NZ,BattleItemListInput.skip3
	bit	2,A
	jr	NZ,BattleItemListInput.skip4
	bit	3,A
	jr	NZ,BattleItemListInput.skip6
	bit	4,A
	jr	NZ,BattleItemListInput.skip8
	bit	5,A
	jrl	NZ,BattleItemListInput.skip11
	ret
BattleItemListInput.skip2:
	ld	WA,0x80
	call	SoundCommand
	call	Random
	calr	sub_209CCE
	dec	1,DE
	or	DE,DE
	jrl	PL,sub_209CDC
	ld	DE,5
	jrl	sub_209CDC
BattleItemListInput.skip3:
	ld	WA,0x80
	call	SoundCommand
	call	Random
	calr	sub_209CCE
	inc	1,DE
	cp	DE,6
	jrl	C,sub_209CDC
	ld	DE,0
	jrl	sub_209CDC
BattleItemListInput.skip4:
	ld	WA,0x80
	call	SoundCommand
	calr	sub_209CCE
	dec	1,WA
	or	WA,WA
	jr	PL,BattleItemListInput.skip5
	ld	WA,2
BattleItemListInput.skip5:
	calr	sub_209CDC
	jrl	sub_209D2F
BattleItemListInput.skip6:
	ld	WA,0x80
	call	SoundCommand
	calr	sub_209CCE
	inc	1,WA
	cp	WA,3
	jr	C,BattleItemListInput.skip7
	ld	WA,0
BattleItemListInput.skip7:
	calr	sub_209CDC
	jrl	sub_209D2F
BattleItemListInput.skip8:
	ld	WA,(wBattleChoice)
	cp	WA,0xE
	jr	NC,BattleItemListInput.skip9
	add	WA,0x26
	call	0x2061D6
	or	A,A
	jr	NZ,BattleItemListInput.skip10
BattleItemListInput.skip9:
	ld	WA,0x83
	call	SoundCommand
	ret
BattleItemListInput.skip10:
	ld	WA,0x81
	call	SoundCommand
	ld	A,2
	call	sub_207598
	ld	A,0
	call	ClearTextBox
	addw	(wBattleChoice),0x26
	ldw	(XIZ+TASK_FUNC),0x9E01
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
BattleItemListInput.skip11:
	ld	WA,0x82
	call	SoundCommand
	call	Random
	ld	A,2
	call	sub_207598
	ldw	(wBattleChoice),0
	ldw	(XIZ+TASK_FUNC),0x974E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_209CCE	section	code abs=0x209CCE

sub_209CCE:
	ld	WA,(wBattleChoice)
	extz	XWA
	div	XWA,6
	ld	DE,QWA
	ret

c_209CDC	section	code abs=0x209CDC

sub_209CDC:
	extz	XWA
	mul	XWA,6
	add	WA,DE
	ld	(wBattleChoice),WA
	ld	A,0
	call	ClearTextBox
	ld	WA,(wBattleChoice)
	cp	WA,0xE
	ret	NC
	add	WA,0x26
	push	WA
	call	0x2061D6
	pop	HL
	ret	C
	call	GetItemDesc
	ld	(XIZ+0x10),XHL
	ld	XHL,wCommandEPCosts
	ld	WA,(wBattleChoice)
	sll	1,WA
	ld	WA,(XHL+WA)
	ld	(XIZ+0x14),WA
	ld	XHL,Str1Text
	call	ExpandMessage
	ld	A,0
	call	DrawBoxString
	ret

c_209D2F	section	code abs=0x209D2F

sub_209D2F:
	ld	A,2
	call	ClearTextBox
	ld	C,5
	ld	E,6
	call	sub_20768E
	ld	XHL,0x209DEF
	call	DrawString
	ld	C,2
	ld	E,6
	call	sub_20768E
	call	sub_207720
	ld	BC,(wBattleChoice)
	extz	XBC
	div	XBC,6
	push	BC
	inc	1,BC
	call	sub_207CF0
	ld	C,2
	ld	E,6
	call	sub_20768E
	ld	XHL,0x209DF3
	call	DrawString
	pop	BC
	mul	XBC,6
	ld	B,0
sub_209D2F.loop:
	push	BC
	push	XWA
	ld	A,(XSP+4)
	add	A,0x26
	extz	WA
	call	0x2061D6
	ld	C,A
	ld	B,0
	pop	XWA
	jr	NC,sub_209D2F.skip
	ld	C,0
	ld	E,(XSP+1)
	call	sub_20768E
	ld	XHL,0x209DF8
	call	DrawString
	jr	sub_209D2F.skip2
sub_209D2F.skip:
	push	BC
	ld	C,5
	ld	E,(XSP+3)
	call	sub_20768E
	call	sub_207720
	pop	BC
	call	sub_207CF0
	ld	C,0
	ld	E,(XSP+1)
	call	sub_20768E
	ld	L,(XSP+0)
	add	L,0x26
	call	GetItemName
	call	DrawString
	ld	C,6
	ld	E,(XSP+1)
	call	sub_20768E
	ld	XHL,0x209DF6
	call	DrawString
sub_209D2F.skip2:
	pop	BC
	inc	1,C
	cp	C,0xE
	jr	NC,sub_209D2F.done
	inc	1,B
	cp	B,6
	jr	C,sub_209D2F.loop
sub_209D2F.done:
	ret
	db	0x5B,0x41,0x44,0xFF,0x00,0x41,0xFF,0x69,0xFF,0x59,0x59,0x59,0x59,0x59,0x59,0x59
	db	0x59,0xFF

c_209E01	section	code abs=0x209E01

swp_209E01:
	ld	A,3
	call	sub_207598
	ld	WA,0
	ld	C,0xC
	ld	E,9
	ld	B,8
	ld	D,2
	call	sub_206768
	ldb	(0x5DE3),0
	cpb	(wDungeonBattle),0
	jr	NZ,swp_209E01.skip
	cpb	(wBattleMenuCursor),3
	jr	NZ,swp_209E01.skip
	ld	XHL,swp_209E45
	jr	swp_209E01.skip2
swp_209E01.skip:
	call	TurnOrderMargin
	or	WA,WA
	ld	XHL,swp_209E45
	jr	PL,swp_209E01.skip2
	ld	XHL,EnemyTurn
swp_209E01.skip2:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_209E45	section	code abs=0x209E45

swp_209E45:
	calr	ComputeStatBuffs
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	cpb	(0x5DE3),0
	ld	XHL,swp_20904F
	jr	NZ,swp_209E45.skip
	ld	XHL,swp_209136
swp_209E45.skip:
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	ld	XHL,0
	ld	L,(wBattleMenuCursor)
	sll	2,HL
	add	XHL,0x209E8E
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
	db	0x9E,0x9E,0x20,0x00,0xD6,0xA1,0x20,0x00,0x6A,0xA2,0x20,0x00,0x08,0xA3,0x20,0x00

c_209E9E	section	code abs=0x209E9E

; [code] Not enough EP / Confused / You can't attack
CheckCanAttack:
	cpb	(wStatusParalyzed),0
	jr	NZ,CheckCanAttack.skip2
	ld	WA,(wAttackEPCost)
	cp	(wUnitEP),WA
	jr	NC,CheckCanAttack.skip
	ld	XHL,NotEnoughEPText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
CheckCanAttack.skip:
	cpb	(wStatusConfused),0
	jr	Z,CheckCanAttack.skip2
	ld	XHL,YoureConfusedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
CheckCanAttack.skip2:
	ld	XHL,0
	cpw	(wBattleChoice),1
	ld	L,(wEquipRightArm)
	jrl	C,loc_209FB1
	ld	L,(wEquipLeftArm)
	jrl	Z,loc_209FB1
	cpw	(wBattleChoice),3
	ld	L,(wSkill1)
	jr	C,CheckCanAttack.skip3
	ld	L,(wSkill2)
CheckCanAttack.skip3:
	push	L
	call	GetSkillData
	ld	(XIZ+0x14),XHL
	pop	L
	call	GetSkillRecord
	ld	(XIZ+0x10),XHL
	ld	XWA,0
	ld	A,(XHL+0x10)
	cp	A,0xFF
	jr	Z,loc_209FC3
	cp	A,5
	jr	C,loc_209FC3
	ld	XHL,0
	ld	HL,(wBattleChoice)
	sll	2,HL
	add	XHL,BattleChoiceTexts
	ld	XHL,(XHL)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0x10)
	sub	A,5
	ld	W,0
	sll	2,WA
	extz	XWA
	add	XWA,SkillEffects
	ld	XWA,(XWA)
	ld	(XIZ+TASK_FUNC),XWA
	ret

d_209F95	section	romdata abs=0x209F95
SkillEffects:
	db	0x47,0xAA,0x20,0x00,0x2E,0xAB,0x20,0x00,0x29,0xAC,0x20,0x00,0xCB,0xAC,0x20,0x00
	db	0x38,0xAD,0x20,0x00,0xC4,0xAD,0x20,0x00,0x4F,0xAE,0x20,0x00

c_209FB1	section	code abs=0x209FB1

loc_209FB1:
	push	L
	call	GetArmEffects
	ld	(XIZ+0x14),XHL
	pop	L
	call	GetArmRecord
	ld	(XIZ+0x10),XHL

c_209FC3	section	code abs=0x209FC3

loc_209FC3:
	cpb	(wStatusParalyzed),0
	jr	Z,PlayerAttack
	ld	XHL,YouCantAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_209FFB	section	code abs=0x209FFB

; [code] HitMargin, then DamageRoll (damage.txt: about 0.4 x (attack - defence) + 8) x affinity, x2 crit (play)
PlayerAttack:
	ld	XHL,0
	ld	HL,(wBattleChoice)
	sll	2,HL
	add	XHL,BattleChoiceTexts
	ld	XHL,(XHL)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	cpb	(wStatusConfused),0
	jrl	NZ,PlayerAttack.skip3
	ld	WA,(wUnitRP)
	call	swp_208A18
	ld	BC,WA
	ld	WA,(wEnemyRP)
	call	swp_208AC6
	ld	DE,WA
	ld	A,(wPlayerLevel)
	ld	W,(wEnemyLevel)
	call	HitMargin
	ld	(wPlayerHitMargin),W
	ld	WA,(XHL+4)
	add	WA,(wUnitAP)
	call	swp_2089FA
	ld	BC,WA
	ld	WA,(wEnemySP)
	call	ApplyEnemySPBuff
	ld	DE,WA
	ld	A,(wPlayerLevel)
	ld	W,(wEnemyLevel)
	call	DamageRoll
	ld	BC,(XHL+0xE)
	ld	DE,(wEnemyAffinity)
	call	ApplyAffinity
	call	AtLeastOne
	ld	(wPlayerDamage),WA
	ld	B,(wCritChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	scc	C,A
	ld	(wCritHit),A
	ldb	(wInflictStatus),0xFF
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0x10)
	or	A,A
	jr	Z,PlayerAttack.skip
	cp	A,0xFF
	jr	Z,PlayerAttack.skip
	ldb	(wInflictStatus),0
	ld	B,(wStatusChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	NC,PlayerAttack.skip
	ld	A,(XHL+0x10)
	ld	(wInflictStatus),A
PlayerAttack.skip:
	ld	XHL,(XIZ+0x14)
	ld	A,(XHL+)
	ld	(XIZ+0x14),XHL
	cp	A,1
	ld	XHL,PlayerHitResult1
	jr	C,PlayerAttack.skip2
	ld	XHL,PlayerHitResult2
	jr	Z,PlayerAttack.skip2
	ld	XHL,PlayerHitResult3
PlayerAttack.skip2:
	ld	(XIZ+TASK_FUNC),XHL
	ret
PlayerAttack.skip3:
	ld	WA,(wUnitRP)
	call	swp_208A18
	ld	BC,WA
	ld	DE,WA
	ld	A,(wPlayerLevel)
	ld	W,A
	call	HitMargin
	ld	(wPlayerHitMargin),W
	ld	WA,(XHL+4)
	add	WA,(wUnitAP)
	call	swp_2089FA
	ld	BC,WA
	ld	WA,(wUnitSP)
	call	swp_208A09
	ld	DE,WA
	ld	A,(wPlayerLevel)
	ld	W,A
	call	DamageRoll
	ld	BC,(XHL+0xE)
	ld	DE,(wUnitAffinity)
	call	ApplyAffinity
	call	sub_2089CD
	inc	3,WA
	srl	2,WA
	ld	(wPlayerDamage),WA
	ld	B,(wCritChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	scc	C,A
	ld	(wCritHit),A
	ldb	(wInflictStatus),0xFF
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0x10)
	or	A,A
	jr	Z,PlayerAttack.skip4
	cp	A,0xFF
	jr	Z,PlayerAttack.skip4
	ldb	(wInflictStatus),0
	ld	B,(wStatusChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	NC,PlayerAttack.skip4
	ld	A,(XHL+0x10)
	ld	(wInflictStatus),A
PlayerAttack.skip4:
	ld	XHL,(XIZ+0x14)
	ld	A,(XHL+)
	cp	A,1
	ld	W,0
	jr	C,PlayerAttack.skip5
	ld	W,2
	jr	Z,PlayerAttack.skip5
	ld	W,0
PlayerAttack.skip5:
	lda	XHL,XHL+W
	ld	(XIZ+0x14),XHL
	ldw	(XIZ+TASK_FUNC),0xA8BD
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20A1D6	section	code abs=0x20A1D6

; [code] "You used <item>"
BattleUseItem:
	ld	WA,(wBattleChoice)
	call	RemoveItem
	ld	L,(wBattleChoice)
	call	GetItemName
	ld	(XIZ+0x10),XHL
	ld	XHL,YouUsedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	L,(wBattleChoice)
	call	GetBattleItemEffect
	ld	(XIZ+0x14),XHL
	ldw	(wAttackEPCost),0
	ld	XHL,0
	ld	L,(wBattleChoice)
	sub	L,0x26
	sll	2,HL
	add	XHL,0x20A232
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
	db	0xDA,0xAE,0x20,0x00,0xEA,0xAE,0x20,0x00,0xFA,0xAE,0x20,0x00,0x0A,0xAF,0x20,0x00
	db	0x1A,0xAF,0x20,0x00,0xFC,0xAF,0x20,0x00,0x5D,0xB0,0x20,0x00,0xB1,0xB0,0x20,0x00
	db	0x05,0xB1,0x20,0x00,0x59,0xB1,0x20,0x00,0xAD,0xB1,0x20,0x00,0x15,0xB2,0x20,0x00
	db	0x7D,0xB2,0x20,0x00,0xE5,0xB2,0x20,0x00

c_20A26A	section	code abs=0x20A26A

; [code] YouRechargedYourEnergyText, EP gain message, wAttackEPCost = 0
BattleRecharge:
	ld	XHL,YouRechargedYourEnergyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,DefaultEnemyAttack+SLOT_EFFECTS
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	call	swp_2089EB
	ld	(XIZ+0x10),WA
	ld	HL,WA
	calr	ShowUnitEPGain
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208E9F
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20A308	section	code abs=0x20A308

; [code] You fled / But it chases you (event flags, Random)
TryFlee:
	cpb	(wEnemyId),0x76
	jr	NZ,TryFlee.skip
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	jr	NZ,TryFlee.skip
	ld	HL,EVENT_STAGE_WON_RANK_X
	call	CheckEventFlag
	jr	NZ,TryFlee.skip
	jr	TryFlee.skip2
TryFlee.skip:
	cpb	(wDungeonBattle),0
	jr	Z,TryFlee.skip3
	cpb	(wEnemyParalyzed),0
	jr	NZ,TryFlee.skip3
	ld	XHL,YouFledText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	B,(wFleeChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	C,TryFlee.skip3
TryFlee.skip2:
	ld	XHL,ButChasesYouText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
TryFlee.skip3:
	ldw	(XIZ+TASK_FUNC),0xCD32
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20A3A7	section	code abs=0x20A3A7

; [code] You missed / Critical hit / can't damage / takes damage (variant 1 of 4)
PlayerHitResult1:
	ld	XHL,swp_2090C0
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,swp_20904F
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	cpb	(wPlayerHitMargin),0
	jr	PL,PlayerHitResult1.skip
	ld	XHL,YouMissedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
PlayerHitResult1.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,swp_208C4C
	jr	Z,PlayerHitResult1.skip2
	ld	XHL,swp_208C60
PlayerHitResult1.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,PlayerHitResult1.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
PlayerHitResult1.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,PlayerHitResult1.skip4
	ld	XHL,YouCantDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	PlayerHitResult1.skip5
PlayerHitResult1.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208F7D
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wInflictStatus),0xFF
	jr	Z,PlayerHitResult1.skip5
	cpw	(wEnemyHP),0
	jr	Z,PlayerHitResult1.skip5
	ld	A,(wInflictStatus)
	sll	2,A
	ld	XHL,StatusInflictedTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,PlayerHitResult1.skip5
	ld	XHL,0x5DC2
	orb	(XHL+A),0x80
PlayerHitResult1.skip5:
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20A55D	section	code abs=0x20A55D

; [code] (variant 2)
PlayerHitResult2:
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wPlayerHitMargin),0
	jr	PL,PlayerHitResult2.skip
	ld	XHL,YouMissedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
PlayerHitResult2.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,swp_208C4C
	jr	Z,PlayerHitResult2.skip2
	ld	XHL,swp_208C60
PlayerHitResult2.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,PlayerHitResult2.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
PlayerHitResult2.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,PlayerHitResult2.skip4
	ld	XHL,YouCantDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	PlayerHitResult2.skip5
PlayerHitResult2.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208F7D
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wInflictStatus),0xFF
	jr	Z,PlayerHitResult2.skip5
	cpw	(wEnemyHP),0
	jr	Z,PlayerHitResult2.skip5
	ld	A,(wInflictStatus)
	sll	2,A
	ld	XHL,StatusInflictedTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,PlayerHitResult2.skip5
	ld	XHL,0x5DC2
	orb	(XHL+A),0x80
PlayerHitResult2.skip5:
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20A733	section	code abs=0x20A733

; [code] (variant 3)
PlayerHitResult3:
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	cpb	(wPlayerHitMargin),0
	jr	PL,PlayerHitResult3.skip
	ld	XHL,YouMissedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
PlayerHitResult3.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,swp_208C4C
	jr	Z,PlayerHitResult3.skip2
	ld	XHL,swp_208C60
PlayerHitResult3.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,PlayerHitResult3.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
PlayerHitResult3.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,PlayerHitResult3.skip4
	ld	XHL,YouCantDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	PlayerHitResult3.skip5
PlayerHitResult3.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208F7D
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wInflictStatus),0xFF
	jr	Z,PlayerHitResult3.skip5
	cpw	(wEnemyHP),0
	jr	Z,PlayerHitResult3.skip5
	ld	A,(wInflictStatus)
	sll	2,A
	ld	XHL,StatusInflictedTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,PlayerHitResult3.skip5
	ld	XHL,0x5DC2
	orb	(XHL+A),0x80
PlayerHitResult3.skip5:
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20A8BD	section	code abs=0x20A8BD

; [code] You dodged / Critical hit / took no damage / takes damage (variant 1 of 4)
EnemyHitResult1:
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	cpb	(wPlayerHitMargin),0
	jr	PL,EnemyHitResult1.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyHitResult1.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	cpb	(wCritHit),0
	ld	XHL,swp_208C24
	jr	Z,EnemyHitResult1.skip2
	ld	XHL,swp_208C38
EnemyHitResult1.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,EnemyHitResult1.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
EnemyHitResult1.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,EnemyHitResult1.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	EnemyHitResult1.skip5
EnemyHitResult1.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wInflictStatus),0xFF
	jr	Z,EnemyHitResult1.skip5
	cpw	(wUnitHP),0
	jr	Z,EnemyHitResult1.skip5
	ld	A,(wInflictStatus)
	sll	2,A
	ld	XHL,PlayerStatusTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,EnemyHitResult1.skip5
	ld	XHL,0x5D92
	orb	(XHL+A),0x80
EnemyHitResult1.skip5:
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AA47	section	code abs=0x20AA47

; [code] AP/SP/RP/MP went up
ShowStatUp:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	or	A,A
	jr	Z,ShowStatUp.skip
	ld	(0x5D97),A
	ld	XHL,APWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatUp.skip:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+6)
	or	A,A
	jr	Z,ShowStatUp.skip2
	ld	(0x5D98),A
	ld	XHL,SPWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatUp.skip2:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+8)
	or	A,A
	jr	Z,ShowStatUp.skip3
	ld	(0x5D99),A
	ld	XHL,RPWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatUp.skip3:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0xA)
	or	A,A
	jr	Z,ShowStatUp.skip4
	ld	(0x5D9A),A
	ld	XHL,MPWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatUp.skip4:
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AB2E	section	code abs=0x20AB2E

; [code] effect 6: "... went down" messages
ShowStatDown:
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	or	A,A
	jr	Z,ShowStatDown.skip
	ld	(0x5DCC),A
	ld	XHL,APWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatDown.skip:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+6)
	or	A,A
	jr	Z,ShowStatDown.skip2
	ld	(0x5DCD),A
	ld	XHL,SPWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatDown.skip2:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+8)
	or	A,A
	jr	Z,ShowStatDown.skip3
	ld	(0x5DCE),A
	ld	XHL,RPWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatDown.skip3:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0xA)
	or	A,A
	jr	Z,ShowStatDown.skip4
	ld	(0x5DCF),A
	ld	XHL,MPWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
ShowStatDown.skip4:
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AC29	section	code abs=0x20AC29

; [code] effect 7: "Your HP are fully restored" / status returned to normal
ShowFullHeal:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,YourHPAreFullyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,loc_208E0F
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ld	XHL,YourStatusReturnedToText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusRust),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20ACCB	section	code abs=0x20ACCB

; [code] effect 8: "Time stopped! Can't move" (August)
SkillTimeStop:
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,TimeStoppedCantMoveText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	ld	(wTimeStopTurns),A
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AD38	section	code abs=0x20AD38

; [code] effect 9: "Recvr activated!! Auto-recover at 0 HP!!" (Aqua); once per battle
SkillRecvr:
	cpb	(wRecvrActive),0
	jr	Z,SkillRecvr.skip
	ld	XHL,NoEffectText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
SkillRecvr.skip:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,RecvrActivatedAutoRecoverText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	incb	1,(wRecvrActive)
	ret	NZ
	ldb	(wRecvrActive),0xFF
	ret

c_20ADC4	section	code abs=0x20ADC4

; [code] effect 10: "Airbag activated! Damage is halved!" (Vapor); turns = skill s04
SkillAirbag:
	cpb	(wAirbagActive),0
	jr	Z,SkillAirbag.skip
	ld	XHL,NoEffectText3
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
SkillAirbag.skip:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,AirbagActivatedDamageIsText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	ld	(wAirbagActive),A
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AE4F	section	code abs=0x20AE4F

; [code] effect 11: "Fully charged!! EP costs reduced to 0!!" (Breath); turns = skill s04
SkillFullCharge:
	cpb	(wFullChargeActive),0
	jr	Z,SkillFullCharge.skip
	ld	XHL,NoEffectText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
SkillFullCharge.skip:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,FullyChargedEPCostsText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	ld	(wFullChargeActive),A
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AEDA	section	code abs=0x20AEDA

swp_20AEDA:
	ldw	(XIZ+0x10),0x1E
	ldw	(XIZ+TASK_FUNC),0xAF8A
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AEEA	section	code abs=0x20AEEA

swp_20AEEA:
	ldw	(XIZ+0x10),0x32
	ldw	(XIZ+TASK_FUNC),0xAF8A
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AEFA	section	code abs=0x20AEFA

swp_20AEFA:
	ldw	(XIZ+0x10),0x64
	ldw	(XIZ+TASK_FUNC),0xAF8A
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AF0A	section	code abs=0x20AF0A

swp_20AF0A:
	ldw	(XIZ+0x10),0x96
	ldw	(XIZ+TASK_FUNC),0xAF8A
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AF1A	section	code abs=0x20AF1A

; [code] entry 5 of BattleUseItem's handler table 0x20A232 (item 42 FullFx): PlayEffectList, YourHPAreFullyText, HP gain task loc_208E0F with +0xE = 9999, then PlayerTurnEnd (0xB34D)
ItemFullFx:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,YourHPAreFullyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,loc_208E0F
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AF8A	section	code abs=0x20AF8A

swp_20AF8A:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	HL,(XIZ+0x10)
	calr	ShowHPGain
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,loc_208E0F
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20AFFC	section	code abs=0x20AFFC

; [code] "Your status returned to normal"
ShowStatusCured:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,YourStatusReturnedToText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusRust),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B05D	section	code abs=0x20B05D

; [code] handler table 0x20A232 entry 7 (item 44 PowDrv "AP +15% (temp)"): APWentUpText, 0x5D9B = 5, PlayerTurnEnd
ItemPowDrv:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,APWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(0x5D9B),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B0B1	section	code abs=0x20B0B1

; [code] handler table 0x20A232 entry 8 (item 45 EField "SP +15% (temp)"): SPWentUpText, 0x5D9C = 5, PlayerTurnEnd
ItemEField:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,SPWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(0x5D9C),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B105	section	code abs=0x20B105

; [code] handler table 0x20A232 entry 9 (item 46 SitClr "RP +15% (temp)"): RPWentUpText, 0x5D9D = 5, PlayerTurnEnd
ItemSitClr:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,RPWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(0x5D9D),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B159	section	code abs=0x20B159

; [code] handler table 0x20A232 entry 10 (item 47 Turbo "MP +15% (temp)"): MPWentUpText, 0x5D9E = 5, PlayerTurnEnd
ItemTurbo:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,MPWentUpText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(0x5D9E),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B1AD	section	code abs=0x20B1AD

; [code] handler table 0x20A232 entry 11 (item 48 Absorb "Enemy AP -15%"): APWentDownText, 0x5DC8 = 5, PlayerTurnEnd
ItemAbsorb:
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,APWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(0x5DC8),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B215	section	code abs=0x20B215

; [code] handler table 0x20A232 entry 12 (item 49 AcidBm "Enemy SP -15%"): SPWentDownText, 0x5DC9 = 5, PlayerTurnEnd
ItemAcidBm:
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,SPWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(wEnemySPDownTurns),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B27D	section	code abs=0x20B27D

; [code] handler table 0x20A232 entry 13 (item 50 Jammer "Enemy RP -15%"): RPWentDownText, 0x5DCA = 5, PlayerTurnEnd
ItemJammer:
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,RPWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(wEnemyRPDownTurns),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B2E5	section	code abs=0x20B2E5

; [code] handler table 0x20A232 entry 14 (item 51 MagFlr "Enemy MP -15%"): MPWentDownText, 0x5DCB = 5, PlayerTurnEnd
ItemMagFlr:
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ldb	(0x5853),0
	ldb	(0x5855),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,MPWentDownText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(wEnemyMPDownTurns),5
	ldw	(XIZ+TASK_FUNC),0xB34D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B34D	section	code abs=0x20B34D

; [code] player status recovery, turn counters, wAttackEPCost, then EnemyTurn or BattleStatusEffects
PlayerTurnEnd:
	cpb	(wStatusParalyzed),0
	jr	Z,PlayerTurnEnd.loop
	ld	A,(wStatusParalyzed)
	calr	RollStatusRecovery
	jr	NC,PlayerTurnEnd.skip
	ldb	(wStatusParalyzed),0
	jr	PlayerTurnEnd.loop
PlayerTurnEnd.skip:
	cpb	(wStatusParalyzed),0x95
	jr	NC,PlayerTurnEnd.loop
	incb	1,(wStatusParalyzed)
PlayerTurnEnd.loop:
	cpb	(wStatusConfused),0
	jr	Z,PlayerTurnEnd.skip3
	ld	A,(wStatusConfused)
	calr	RollStatusRecovery
	jr	NC,PlayerTurnEnd.skip2
	ldb	(wStatusConfused),0
	jr	PlayerTurnEnd.loop
PlayerTurnEnd.skip2:
	cpb	(wStatusConfused),0x95
	jr	NC,PlayerTurnEnd.skip3
	incb	1,(wStatusConfused)
PlayerTurnEnd.skip3:
	cpb	(0x5D97),0
	jr	Z,PlayerTurnEnd.skip4
	decb	1,(0x5D97)
PlayerTurnEnd.skip4:
	cpb	(0x5D98),0
	jr	Z,PlayerTurnEnd.skip5
	decb	1,(0x5D98)
PlayerTurnEnd.skip5:
	cpb	(0x5D99),0
	jr	Z,PlayerTurnEnd.skip6
	decb	1,(0x5D99)
PlayerTurnEnd.skip6:
	cpb	(0x5D9A),0
	jr	Z,PlayerTurnEnd.skip7
	decb	1,(0x5D9A)
PlayerTurnEnd.skip7:
	cpb	(0x5D9B),0
	jr	Z,PlayerTurnEnd.skip8
	decb	1,(0x5D9B)
PlayerTurnEnd.skip8:
	cpb	(0x5D9C),0
	jr	Z,PlayerTurnEnd.skip9
	decb	1,(0x5D9C)
PlayerTurnEnd.skip9:
	cpb	(0x5D9D),0
	jr	Z,PlayerTurnEnd.skip10
	decb	1,(0x5D9D)
PlayerTurnEnd.skip10:
	cpb	(0x5D9E),0
	jr	Z,PlayerTurnEnd.skip11
	decb	1,(0x5D9E)
PlayerTurnEnd.skip11:
	ld	XHL,swp_208EED
	call	StartChildTask
	ld	WA,(wAttackEPCost)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpw	(wEnemyHP),0
	jr	Z,PlayerTurnEnd.skip12
	cpw	(wUnitHP),0
	jr	NZ,PlayerTurnEnd.skip13
PlayerTurnEnd.skip12:
	ldw	(XIZ+TASK_FUNC),0xC604
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
PlayerTurnEnd.skip13:
	cpb	(0x5DE3),0
	ld	XHL,BattleStatusEffects
	jr	NZ,PlayerTurnEnd.skip14
	incb	1,(0x5DE3)
	ld	XHL,EnemyTurn
PlayerTurnEnd.skip14:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_20B440	section	code abs=0x20B440

; [code] A = status byte -> C if the status wears off (StatusRecovery[turns])
RollStatusRecovery:
	and	A,0x7F
	ld	L,A
	call	GetStatusRecovery
	ld	H,L
	ld	L,0
	add	HL,0x63
	extz	XHL
	div	XHL,0x64
	call	Random
	extz	WA
	cp	WA,HL
	ret

c_20B460	section	code abs=0x20B460

; [code] enemy's turn: "can't attack" while wTimeStopTurns, else EP check and attack
EnemyTurn:
	calr	ComputeStatBuffs
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ld	XHL,swp_20916E
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	cpb	(wTimeStopTurns),0
	jr	Z,EnemyTurn.skip
	ld	XHL,CantAttackText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyTurn.skip:
	ld	XHL,(wEnemyAttackSlot)
	ld	WA,(XHL+SLOT_EP)
	call	swp_208A73
	ld	(wEnemyAttackEPCost),WA
	ld	XWA,0
	ld	A,(XHL+3)
	inc	1,A
	sll	2,WA
	add	XWA,0x20B4E5
	ld	XWA,(XWA)
	ld	(XIZ+TASK_FUNC),XWA
	ret
	db	0x21,0xB5,0x20,0x00,0x21,0xB5,0x20,0x00,0x21,0xB5,0x20,0x00,0x21,0xB5,0x20,0x00
	db	0x21,0xB5,0x20,0x00,0x21,0xB5,0x20,0x00,0xB1,0xC0,0x20,0x00,0x21,0xC1,0x20,0x00
	db	0xA5,0xC1,0x20,0x00,0xE3,0xC1,0x20,0x00,0x74,0xC2,0x20,0x00,0x60,0xC3,0x20,0x00
	db	0xAF,0xB7,0x20,0x00,0x26,0xB8,0x20,0x00,0x12,0xC4,0x20,0x00

c_20B521	section	code abs=0x20B521

; [code] enemy: Can't attack / Not enough EP / Is confused
EnemyCheckCanAttack:
	cpb	(wEnemyParalyzed),0
	jr	Z,EnemyCheckCanAttack.skip
	ld	XHL,CantAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyCheckCanAttack.skip:
	ld	XHL,(wEnemyAttackSlot)
	cpw	(wEnemyEP),0
	jr	Z,EnemyCheckCanAttack.skip2
	ld	WA,(wEnemyAttackEPCost)
	cp	(wEnemyEP),WA
	jr	NC,EnemyCheckCanAttack.skip3
EnemyCheckCanAttack.skip2:
	ld	XHL,NotEnoughEPText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyCheckCanAttack.skip3:
	cpb	(wEnemyConfused),0
	jr	Z,EnemyAttack
	ld	XHL,IsConfusedText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait

c_20B5C7	section	code abs=0x20B5C7

EnemyAttack:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	cpb	(wEnemyConfused),0
	jrl	NZ,EnemyAttack.skip3
	ld	WA,(wEnemyRP)
	call	swp_208AC6
	ld	BC,WA
	ld	WA,(wUnitRP)
	call	swp_208A18
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	XHL,(wEnemyAttackSlot)
	ld	WA,(XHL+SLOT_POWER)
	call	swp_208AA2
	add	WA,(wEnemyAP)
	call	swp_208A91
	ld	BC,WA
	ld	WA,(wUnitSP)
	call	swp_208A09
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	DamageRoll
	ld	C,(XHL+6)
	ld	B,0
	ld	DE,(wUnitAffinity)
	call	ApplyAffinity
	call	sub_2089CD
	ld	(wEnemyDamage),WA
	ld	B,(wEnemyCritChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	scc	C,A
	ld	(wEnemyCritHit),A
	ldb	(wEnemyAttackStatus),0xFF
	ld	A,(XHL+3)
	or	A,A
	jr	Z,EnemyAttack.skip
	cp	A,0xFF
	jr	Z,EnemyAttack.skip
	ldb	(wEnemyAttackStatus),0
	ld	B,(wEnemyStatusChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	NC,EnemyAttack.skip
	ld	A,(XHL+3)
	ld	(wEnemyAttackStatus),A
EnemyAttack.skip:
	ld	A,(XHL+8)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	cp	A,1
	ld	XHL,EnemyHitResult2
	jr	C,EnemyAttack.skip2
	ld	XHL,EnemyHitResult3
	jr	Z,EnemyAttack.skip2
	ld	XHL,EnemyHitResult4
EnemyAttack.skip2:
	ld	(XIZ+TASK_FUNC),XHL
	ret
EnemyAttack.skip3:
	ld	WA,(wEnemyRP)
	call	swp_208AC6
	ld	BC,WA
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,A
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	XHL,(wEnemyAttackSlot)
	ld	WA,(XHL+SLOT_POWER)
	call	swp_208AA2
	add	WA,(wEnemyAP)
	call	swp_208A91
	ld	BC,WA
	ld	WA,(wEnemySP)
	call	ApplyEnemySPBuff
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,A
	call	DamageRoll
	ld	C,(XHL+6)
	ld	B,0
	ld	DE,(wEnemyAffinity)
	call	ApplyAffinity
	call	AtLeastOne
	inc	3,WA
	srl	2,WA
	ld	(wEnemyDamage),WA
	ld	B,(wEnemyCritChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	scc	C,A
	ld	(wEnemyCritHit),A
	ldb	(wEnemyAttackStatus),0xFF
	ld	A,(XHL+3)
	or	A,A
	jr	Z,EnemyAttack.skip4
	cp	A,0xFF
	jr	Z,EnemyAttack.skip4
	ldb	(wEnemyAttackStatus),0
	ld	B,(wEnemyStatusChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	NC,EnemyAttack.skip4
	ld	A,(XHL+3)
	ld	(wEnemyAttackStatus),A
EnemyAttack.skip4:
	ld	A,(XHL+8)
	lda	XHL,XHL+9
	cp	A,1
	ld	W,0
	jr	C,EnemyAttack.skip5
	ld	W,2
	jr	Z,EnemyAttack.skip5
	ld	W,0
EnemyAttack.skip5:
	lda	XHL,XHL+W
	ld	(XIZ+0x14),XHL
	ldw	(XIZ+TASK_FUNC),0xBF27
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B7AF	section	code abs=0x20B7AF

; [code] "<arm> can't attack" (one per arm; which is which not read)
ArmCantAttack1:
	cpb	(wEnemyParalyzed),0
	jr	Z,ArmCantAttack1.skip
	ld	XHL,CantAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
ArmCantAttack1.skip:
	ld	L,(0x5DD3)
	call	GetArmName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	L,(0x5DD3)
	ld	H,0
	ld	(XIZ+0x10),HL
	ldw	(XIZ+TASK_FUNC),0xB89D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B826	section	code abs=0x20B826

; [code]
ArmCantAttack2:
	cpb	(wEnemyParalyzed),0
	jr	Z,ArmCantAttack2.skip
	ld	XHL,CantAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
ArmCantAttack2.skip:
	ld	L,(0x5DD4)
	call	GetArmName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	L,(0x5DD4)
	ld	H,0
	ld	(XIZ+0x10),HL
	ldw	(XIZ+TASK_FUNC),0xB89D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20B89D	section	code abs=0x20B89D

; [code+play] enemy attack action 11/12: a robot enemy attacks with an arm (GetArmRecord, HitMargin, DamageRoll); Arena robots
EnemyArmAttack:
	ld	HL,(XIZ+0x10)
	push	HL
	call	GetArmEffects
	ld	(XIZ+0x14),XHL
	pop	HL
	call	GetArmRecord
	ld	(XIZ+0x10),XHL
	ld	XHL,(XIZ+0x10)
	ld	WA,(XHL+0xC)
	call	swp_208A73
	ld	(wEnemyAttackEPCost),WA
	ld	B,(wEnemyCritChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	scc	C,A
	ld	(wEnemyCritHit),A
	ldb	(wEnemyAttackStatus),0xFF
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0x10)
	or	A,A
	jr	Z,EnemyArmAttack.skip
	cp	A,0xFF
	jr	Z,EnemyArmAttack.skip
	ldb	(wEnemyAttackStatus),0
	ld	B,(wEnemyStatusChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	NC,EnemyArmAttack.skip
	ld	A,(XHL+0x10)
	ld	(wEnemyAttackStatus),A
EnemyArmAttack.skip:
	cpb	(wEnemyConfused),0
	jr	NZ,EnemyArmAttack.skip3
	ld	WA,(wEnemyRP)
	call	swp_208AC6
	ld	BC,WA
	ld	WA,(wUnitRP)
	call	swp_208A18
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	WA,(XHL+4)
	add	WA,(wEnemyAP)
	call	swp_208A91
	ld	BC,WA
	ld	WA,(wUnitSP)
	call	swp_208A09
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	DamageRoll
	ld	BC,(XHL+0xE)
	ld	DE,(wUnitAffinity)
	call	ApplyAffinity
	call	sub_2089CD
	ld	(wEnemyDamage),WA
	ld	XHL,(XIZ+0x14)
	ld	A,(XHL+)
	ld	(XIZ+0x14),XHL
	cp	A,1
	ld	XHL,EnemyHitResult2
	jr	C,EnemyArmAttack.skip2
	ld	XHL,EnemyHitResult3
	jr	Z,EnemyArmAttack.skip2
	ld	XHL,EnemyHitResult4
EnemyArmAttack.skip2:
	ld	(XIZ+TASK_FUNC),XHL
	ret
EnemyArmAttack.skip3:
	ld	WA,(wEnemyRP)
	call	swp_208AC6
	ld	BC,WA
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,A
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	WA,(XHL+4)
	add	WA,(wEnemyAP)
	call	swp_208A91
	ld	BC,WA
	ld	WA,(wEnemySP)
	call	ApplyEnemySPBuff
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,A
	call	DamageRoll
	ld	BC,(XHL+0xE)
	ld	DE,(wEnemyAffinity)
	call	ApplyAffinity
	call	AtLeastOne
	inc	3,WA
	srl	2,WA
	ld	(wEnemyDamage),WA
	ld	XHL,(XIZ+0x14)
	ld	A,(XHL+)
	cp	A,1
	ld	W,0
	jr	C,EnemyArmAttack.skip4
	ld	W,2
	jr	Z,EnemyArmAttack.skip4
	ld	W,0
EnemyArmAttack.skip4:
	lda	XHL,XHL+W
	ld	(XIZ+0x14),XHL
	ldw	(XIZ+TASK_FUNC),0xBF27
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20BA11	section	code abs=0x20BA11

; [code] (variant 2)
EnemyHitResult2:
	ld	XHL,swp_2091DD
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ld	XHL,swp_20916E
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	cpb	(wEnemyHitMargin),0
	jr	PL,EnemyHitResult2.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyHitResult2.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,swp_208C24
	jr	Z,EnemyHitResult2.skip2
	ld	XHL,swp_208C38
EnemyHitResult2.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,EnemyHitResult2.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
EnemyHitResult2.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,EnemyHitResult2.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	EnemyHitResult2.skip5
EnemyHitResult2.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wEnemyAttackStatus),0xFF
	jr	Z,EnemyHitResult2.skip5
	cpw	(wUnitHP),0
	jr	Z,EnemyHitResult2.skip5
	ld	A,(wEnemyAttackStatus)
	sll	2,A
	ld	XHL,PlayerStatusTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,EnemyHitResult2.skip5
	ld	XHL,0x5D92
	orb	(XHL+A),0x80
EnemyHitResult2.skip5:
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20BBC7	section	code abs=0x20BBC7

; [code] (variant 3)
EnemyHitResult3:
	ldb	(0x5853),0
	ldb	(0x5855),0
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	cpb	(wEnemyHitMargin),0
	jr	PL,EnemyHitResult3.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyHitResult3.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,swp_208C24
	jr	Z,EnemyHitResult3.skip2
	ld	XHL,swp_208C38
EnemyHitResult3.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,EnemyHitResult3.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
EnemyHitResult3.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,EnemyHitResult3.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	EnemyHitResult3.skip5
EnemyHitResult3.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wEnemyAttackStatus),0xFF
	jr	Z,EnemyHitResult3.skip5
	cpw	(wUnitHP),0
	jr	Z,EnemyHitResult3.skip5
	ld	A,(wEnemyAttackStatus)
	sll	2,A
	ld	XHL,PlayerStatusTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,EnemyHitResult3.skip5
	ld	XHL,0x5D92
	orb	(XHL+A),0x80
EnemyHitResult3.skip5:
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20BD9D	section	code abs=0x20BD9D

; [code] (variant 4)
EnemyHitResult4:
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	cpb	(wEnemyHitMargin),0
	jr	PL,EnemyHitResult4.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyHitResult4.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,swp_208C24
	jr	Z,EnemyHitResult4.skip2
	ld	XHL,swp_208C38
EnemyHitResult4.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,EnemyHitResult4.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
EnemyHitResult4.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,EnemyHitResult4.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	EnemyHitResult4.skip5
EnemyHitResult4.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wEnemyAttackStatus),0xFF
	jr	Z,EnemyHitResult4.skip5
	cpw	(wUnitHP),0
	jr	Z,EnemyHitResult4.skip5
	ld	A,(wEnemyAttackStatus)
	sll	2,A
	ld	XHL,PlayerStatusTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,EnemyHitResult4.skip5
	ld	XHL,0x5D92
	orb	(XHL+A),0x80
EnemyHitResult4.skip5:
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20BF27	section	code abs=0x20BF27

; [code] (variant 4: "dodged the attack")
PlayerHitResult4:
	ldb	(0x5853),0
	ldb	(0x5855),0
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	cpb	(wEnemyHitMargin),0
	jr	PL,PlayerHitResult4.skip
	ld	XHL,DodgedTheAttackText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
PlayerHitResult4.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,swp_208C4C
	jr	Z,PlayerHitResult4.skip2
	ld	XHL,swp_208C60
PlayerHitResult4.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,PlayerHitResult4.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
PlayerHitResult4.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,PlayerHitResult4.skip4
	ld	XHL,TookNoDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jrl	PlayerHitResult4.skip5
PlayerHitResult4.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208F7D
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wEnemyAttackStatus),0xFF
	jr	Z,PlayerHitResult4.skip5
	cpw	(wEnemyHP),0
	jr	Z,PlayerHitResult4.skip5
	ld	A,(wEnemyAttackStatus)
	sll	2,A
	ld	XHL,StatusInflictedTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,PlayerHitResult4.skip5
	ld	XHL,0x5DC2
	orb	(XHL+A),0x80
PlayerHitResult4.skip5:
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C0B1	section	code abs=0x20C0B1

; [code] enemy action: "<ENEMY> fled!!", unless a roll >= wFleeChance: "But you are able to chase it!!"
EnemyFlee:
	ld	XHL,EnemyFledText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	B,(wFleeChance)
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	C,EnemyFlee.skip
	ld	XHL,ButYouAreAbleText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyFlee.skip:
	ldw	(XIZ+TASK_FUNC),0xC4B0
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C121	section	code abs=0x20C121

; [code] "<enemy>'s SP went up" via its attack
EnemyStatUpAttack:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	ld	XHL,SPWentUpText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldb	(0x5DC7),5
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C1A5	section	code abs=0x20C1A5

; [code] enemy attack action 7 (table 0x20B4E5 [action+1]; Bonryu/Scaley "Revive"): message 0x2254A8 "<ENEMY>'s <STR1>!!" with GetAttackName, then swp_20C39E with +0x10 = 50 (ShowEnemyHPGain, enemy HP gain task swp_208F2F)
EnemyHeal50:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+0x10),0x32
	ldw	(XIZ+TASK_FUNC),0xC39E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C1E3	section	code abs=0x20C1E3

; [code] "<enemy>'s status returned to normal"
EnemyCureAttack:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	ld	XHL,SStatusReturnedToText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	A,0
	ld	(wEnemyParalyzed),A
	ld	(wEnemyRusted),A
	ld	(wEnemyEPLeak),A
	ld	(wEnemyConfused),A
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C274	section	code abs=0x20C274

; [code] '<ENEMY>'s HP / EP are fully restored'
EnemyHealAttack:
	ldb	(0x5DD8),0xFF
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	ld	XHL,SHPAreFullyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208F2F
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ld	XHL,SEPAreFullyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208FBF
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C360	section	code abs=0x20C360

; [code] enemy attack action 10 (table 0x20B4E5; Uniti "Repair"): same as swp_20C1A5 with +0x10 = 100
EnemyHeal100:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+0x10),0x64
	ldw	(XIZ+TASK_FUNC),0xC39E
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C39E	section	code abs=0x20C39E

swp_20C39E:
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	ld	HL,(XIZ+0x10)
	calr	ShowEnemyHPGain
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208F2F
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C412	section	code abs=0x20C412

; [code] "recharged its energy"
EnemyRecharge:
	ld	XHL,RechargedItsEnergyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,DefaultEnemyAttack+SLOT_EFFECTS
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	call	swp_208A82
	ld	(XIZ+0x10),WA
	ld	HL,WA
	calr	ShowEnemyEPGain
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208FBF
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),0xC4FB
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C4B0	section	code abs=0x20C4B0

swp_20C4B0:
	ld	XHL,swp_2091A3
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	ld	XHL,EnemyFledText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_ARG),1
	ldw	(XIZ+TASK_FUNC),0xCD89
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20C4FB	section	code abs=0x20C4FB

; [code] enemy paralysis/confusion recovery, turn counters, wTimeStopTurns, EP cost, BattleStatusEffects
EnemyTurnEnd:
	cpb	(wEnemyParalyzed),0
	jr	Z,EnemyTurnEnd.loop
	ld	A,(wEnemyParalyzed)
	calr	RollStatusRecovery
	jr	NC,EnemyTurnEnd.skip
	ldb	(wEnemyParalyzed),0
	jr	EnemyTurnEnd.loop
EnemyTurnEnd.skip:
	cpb	(wEnemyParalyzed),0x95
	jr	NC,EnemyTurnEnd.loop
	incb	1,(wEnemyParalyzed)
EnemyTurnEnd.loop:
	cpb	(wEnemyConfused),0
	jr	Z,EnemyTurnEnd.skip3
	ld	A,(wEnemyConfused)
	calr	RollStatusRecovery
	jr	NC,EnemyTurnEnd.skip2
	ldb	(wEnemyConfused),0
	jr	EnemyTurnEnd.loop
EnemyTurnEnd.skip2:
	cpb	(wEnemyConfused),0x95
	jr	NC,EnemyTurnEnd.skip3
	incb	1,(wEnemyConfused)
EnemyTurnEnd.skip3:
	cpb	(0x5DC8),0
	jr	Z,EnemyTurnEnd.skip4
	decb	1,(0x5DC8)
EnemyTurnEnd.skip4:
	cpb	(0x5DCC),0
	jr	Z,EnemyTurnEnd.skip5
	decb	1,(0x5DCC)
EnemyTurnEnd.skip5:
	cpb	(0x5DC7),0
	jr	Z,EnemyTurnEnd.skip6
	decb	1,(0x5DC7)
EnemyTurnEnd.skip6:
	cpb	(wEnemySPDownTurns),0
	jr	Z,EnemyTurnEnd.skip7
	decb	1,(wEnemySPDownTurns)
EnemyTurnEnd.skip7:
	cpb	(0x5DCD),0
	jr	Z,EnemyTurnEnd.skip8
	decb	1,(0x5DCD)
EnemyTurnEnd.skip8:
	cpb	(wEnemyRPDownTurns),0
	jr	Z,EnemyTurnEnd.skip9
	decb	1,(wEnemyRPDownTurns)
EnemyTurnEnd.skip9:
	cpb	(0x5DCE),0
	jr	Z,EnemyTurnEnd.skip10
	decb	1,(0x5DCE)
EnemyTurnEnd.skip10:
	cpb	(wEnemyMPDownTurns),0
	jr	Z,EnemyTurnEnd.skip11
	decb	1,(wEnemyMPDownTurns)
EnemyTurnEnd.skip11:
	cpb	(0x5DCF),0
	jr	Z,EnemyTurnEnd.skip12
	decb	1,(0x5DCF)
EnemyTurnEnd.skip12:
	cpb	(wTimeStopTurns),0
	jr	Z,EnemyTurnEnd.skip13
	decb	1,(wTimeStopTurns)
EnemyTurnEnd.skip13:
	ld	XHL,swp_20900D
	call	StartChildTask
	ld	WA,(wEnemyAttackEPCost)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpw	(wUnitHP),0
	jr	Z,EnemyTurnEnd.skip14
	cpw	(wEnemyHP),0
	jr	NZ,EnemyTurnEnd.skip15
EnemyTurnEnd.skip14:
	ldw	(XIZ+TASK_FUNC),0xC604
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
EnemyTurnEnd.skip15:
	cpb	(0x5DE3),0
	ld	XHL,BattleStatusEffects
	jr	NZ,EnemyTurnEnd.skip16
	incb	1,(0x5DE3)
	ld	XHL,swp_209E45
EnemyTurnEnd.skip16:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_20C604	section	code abs=0x20C604

; [code] Rust/Paralyzed/EP leak/Confused messages, HP/EP changes
BattleStatusEffects:
	cpw	(wEnemyHP),0
	jrl	Z,BattleStatusEffects.skip17
	cpw	(wUnitHP),0
	jrl	Z,BattleStatusEffects.skip
	cpb	(wStatusRust),0
	jrl	Z,BattleStatusEffects.skip
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ld	XHL,YoureTotallyRustedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	WA,(wUnitMaxHP)
	add	WA,0x13
	extz	XWA
	div	XWA,0x14
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
BattleStatusEffects.skip:
	cpw	(wUnitHP),0
	jrl	NZ,BattleStatusEffects.skip5
	cpb	(wRecvrActive),0
	jr	NZ,BattleStatusEffects.skip2
	ld	XBC,wEquipAcc1
	cpb	(XBC),ITEM_AUTORP
	jr	Z,BattleStatusEffects.skip3
	ld	XBC,wEquipAcc2
	cpb	(XBC),ITEM_AUTORP
	jr	Z,BattleStatusEffects.skip3
	ldw	(XIZ+TASK_FUNC),0xCC9C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
BattleStatusEffects.skip2:
	decb	1,(wRecvrActive)
	ldw	(XIZ+0x10),0x270F
	jr	BattleStatusEffects.skip4
BattleStatusEffects.skip3:
	ldb	(XBC),0
	ld	WA,(wUnitMaxHP)
	srl	1,WA
	ld	(XIZ+0x10),WA
BattleStatusEffects.skip4:
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusRust),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ld	XHL,Data_22541D
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	HL,(XIZ+0x10)
	calr	ShowHPGain
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,loc_208E0F
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	jrl	BattleStatusEffects.skip11
BattleStatusEffects.skip5:
	cpb	(wStatusEPLeak),0
	jrl	Z,BattleStatusEffects.skip7
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ld	XHL,YoureLeakingEnergyText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	cpw	(wUnitEP),0
	jr	Z,BattleStatusEffects.skip7
	ld	WA,(wUnitMaxEP)
	add	WA,0x13
	extz	XWA
	div	XWA,0x14
	cp	WA,(wUnitEP)
	jr	C,BattleStatusEffects.skip6
	ld	WA,(wUnitEP)
BattleStatusEffects.skip6:
	ld	(XIZ+0x10),WA
	ld	XHL,YouLostEPText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208EED
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
BattleStatusEffects.skip7:
	ld	WA,(wMinEPCost)
	cp	(wUnitEP),WA
	jr	NC,BattleStatusEffects.skip9
	ld	XBC,wEquipAcc1
	cpb	(XBC),ITEM_PROPLR
	jr	Z,BattleStatusEffects.skip8
	ld	XBC,wEquipAcc2
	cpb	(XBC),ITEM_PROPLR
	jr	Z,BattleStatusEffects.skip8
	jr	BattleStatusEffects.skip9
BattleStatusEffects.skip8:
	ldb	(XBC),0
	ld	XHL,Data_225420
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,YourEPAreFullyText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208E9F
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
BattleStatusEffects.skip9:
	cpb	(wStatusParalyzed),0
	jr	Z,BattleStatusEffects.skip10
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ld	XHL,YoureParalyzedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
BattleStatusEffects.skip10:
	cpb	(wStatusConfused),0
	jr	Z,BattleStatusEffects.skip11
	ldb	(0x584B),0xC0
	ldb	(0x584D),0
	ldb	(0x5853),0x60
	ldb	(0x5855),0
	ld	XHL,YoureConfusedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
BattleStatusEffects.skip11:
	cpb	(wEnemyRusted),0
	jrl	Z,BattleStatusEffects.skip12
	ldb	(0x5853),0
	ldb	(0x5855),0
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ld	XHL,IsTotallyRustedText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	WA,(wEnemyHP)
	add	WA,0x13
	extz	XWA
	div	XWA,0x14
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_208F7D
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
BattleStatusEffects.skip12:
	cpw	(wEnemyHP),0
	jrl	Z,BattleStatusEffects.skip17
	cpb	(wEnemyEPLeak),0
	jrl	Z,BattleStatusEffects.skip14
	ldb	(0x5853),0
	ldb	(0x5855),0
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ld	XHL,IsLeakingEnergyText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	cpw	(wEnemyEP),0
	jr	Z,BattleStatusEffects.skip14
	ld	WA,(wEnemyMaxEP)
	add	WA,0x13
	extz	XWA
	div	XWA,0x14
	cp	WA,(wEnemyEP)
	jr	C,BattleStatusEffects.skip13
	ld	WA,(wEnemyEP)
BattleStatusEffects.skip13:
	ld	(XIZ+0x10),WA
	ld	XHL,LostEPText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ld	XHL,swp_20900D
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
BattleStatusEffects.skip14:
	cpb	(wEnemyParalyzed),0
	jr	Z,BattleStatusEffects.skip15
	ldb	(0x5853),0
	ldb	(0x5855),0
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ld	XHL,IsParalyzedText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
BattleStatusEffects.skip15:
	cpb	(wEnemyConfused),0
	jr	Z,BattleStatusEffects.skip16
	ldb	(0x5853),0
	ldb	(0x5855),0
	ldb	(0x584B),0x60
	ldb	(0x584D),0
	ld	XHL,IsConfusedText2
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
BattleStatusEffects.skip16:
	ldw	(XIZ+TASK_FUNC),0x9647
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
BattleStatusEffects.skip17:
	ldw	(XIZ+TASK_FUNC),0xCAE0
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20CAE0	section	code abs=0x20CAE0

; [code] You win, EXP, GP, drop, level up
BattleVictory:
	ld	XHL,swp_208C60
	call	StartTask
	ldw	(XHL+0xE),0xF
	ld	XHL,Data_22541A
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xC
	call	swp_206781
	ld	WA,0xF
	call	PlayMusic
	ld	WA,0x2F
	call	SoundCommand
	ld	XHL,YouWinText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_ARG),0
	ld	L,(wEnemyId)
	call	GetEnemyRecord
	ld	WA,(XHL+ENEMY_EXP)
	call	ExpForKill
	or	WA,WA
	jr	Z,BattleVictory.skip
	ld	(XIZ+0x10),WA
	sub	(wExpToNext),WA
	ld	XHL,YouGainEXPText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	incw	1,(XIZ+TASK_ARG)
BattleVictory.skip:
	cpb	(wDungeonBattle),0
	jrl	Z,BattleVictory.skip6
	ld	L,(wEnemyId)
	call	GetEnemyRecord
	ld	WA,(XHL+ENEMY_GP)
	or	WA,WA
	jr	Z,BattleVictory.skip2
	ld	(XIZ+0x10),WA
	call	AddGP
	ld	XHL,YouGotGPText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	incw	1,(XIZ+TASK_ARG)
BattleVictory.skip2:
	ld	L,(wEnemyId)
	call	GetEnemyRecord
	ld	B,(XHL+ENEMY_DROP_PCT)
	cp	B,0x64
	jr	NC,BattleVictory.skip3
	ld	C,0
	add	BC,0x63
	extz	XBC
	div	XBC,0x64
	call	Random
	extz	WA
	cp	WA,BC
	jr	NC,BattleVictory.skip6
BattleVictory.skip3:
	ld	WA,(XHL+0x16)
	push	WA
	call	AddItem
	pop	HL
	jr	C,BattleVictory.skip6
	or	H,H
	jr	Z,BattleVictory.skip4
	call	GetPartName
	jr	BattleVictory.skip5
BattleVictory.skip4:
	call	GetItemName
BattleVictory.skip5:
	ld	(XIZ+0x10),XHL
	ld	XHL,YouFoundText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	incw	1,(XIZ+TASK_ARG)
BattleVictory.skip6:
	cpw	(XIZ+TASK_ARG),0
	jr	Z,BattleVictory.loop
	ld	XHL,WaitText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
BattleVictory.loop:
	call	TryLevelUp
	jr	NC,BattleVictory.skip7
	ld	WA,0xAC
	call	SoundCommand
	ld	XHL,YouGainedALevelText
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	jr	BattleVictory.loop
BattleVictory.skip7:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),0xCD89
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20CC9C	section	code abs=0x20CC9C

; [code] You lost / You are unable to move
BattleDefeat:
	ld	XHL,swp_208C38
	call	StartTask
	ldw	(XHL+0xE),0xF
	ld	XHL,Data_22541A
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),1
	task_wait
	ld	WA,0
	ld	C,0
	ld	E,1
	ld	B,0xC
	ld	D,0xB
	call	swp_20677A
	ld	WA,0x10
	call	PlayMusic
	ld	WA,0x30
	call	SoundCommand
	cpb	(wDungeonBattle),0
	ld	XHL,YouLostText
	jr	Z,BattleDefeat.skip
	ld	XHL,YouAreUnableToText
BattleDefeat.skip:
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(wUnitHP),(wUnitMaxHP)
	ldw	(wUnitEP),(wUnitMaxEP)
	ldw	(XIZ+TASK_ARG),3
	ldw	(XIZ+TASK_FUNC),0xCD89
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20CD32	section	code abs=0x20CD32

; [code] player escapes: reached from TryFlee (TASK_FUNC 0xCD32) on a successful flee or always when 0x5DDA = 0; shows YouGaveUpText (0x5DDA = 0) or 0x22599D "You were able to retreat..." (decoded), then BattleEnd with TASK_ARG 2
BattleRetreat:
	ld	XHL,swp_2090FE
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	cpb	(wDungeonBattle),0
	ld	XHL,YouGaveUpText
	jr	Z,BattleRetreat.skip
	ld	XHL,YouWereAbleToText
BattleRetreat.skip:
	call	ShowMessage
	ld	XHL,swp_20921A
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_ARG),2
	ldw	(XIZ+TASK_FUNC),0xCD89
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20CD89	section	code abs=0x20CD89

; [code] clears paralysis, EP leak, confusion (not rust), screen, InitTextBoxes, scrolls; EndTask
BattleEnd:
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ld	HL,(XIZ+0x2C)
	extz	XHL
	set	7,(XHL+7)
	call	sub_2067E1
	call	sub_206847
	call	InitTextBoxes
	ld	A,0
	ld	(0x5A76),A
	ld	(0x584B),A
	ld	(0x584D),A
	ld	(0x584F),A
	ld	(0x5851),A
	ld	(0x5853),A
	ld	(0x5855),A
	ld	(0x5857),A
	ld	(0x5859),A
	ld	WA,0x7F
	call	SoundCommand
	ld	WA,0x8086
	call	SoundCommand
	ld	A,(XIZ+TASK_ARG)
	ld	(wBattleResult),A
	call	EndTask
	ret

c_20CDEB	section	code abs=0x20CDEB

; [code] HP fully restored / gained HP
ShowHPGain:
	add	HL,(wUnitHP)
	cp	HL,(wUnitMaxHP)
	ld	XHL,YourHPAreFullyText
	ret	NC
	ld	XHL,YouGainedHPText
	ret

c_20CE00	section	code abs=0x20CE00

; [code] XHL = YourEPAreFullyText if wUnitEP + HL >= max, else YouGainedEPText
ShowUnitEPGain:
	add	HL,(wUnitEP)
	cp	HL,(wUnitMaxEP)
	ld	XHL,YourEPAreFullyText
	ret	NC
	ld	XHL,YouGainedEPText
	ret

c_20CE15	section	code abs=0x20CE15

; [code] XHL = SHPAreFullyText if wEnemyHP + HL >= max, else GainedHPText
ShowEnemyHPGain:
	add	HL,(wEnemyHP)
	cp	HL,(wEnemyMaxHP)
	ld	XHL,SHPAreFullyText
	ret	NC
	ld	XHL,GainedHPText
	ret

c_20CE2A	section	code abs=0x20CE2A

; [code] EP fully restored / gained EP
ShowEnemyEPGain:
	add	HL,(wEnemyEP)
	cp	HL,(wEnemyMaxEP)
	ld	XHL,SEPAreFullyText
	ret	NC
	ld	XHL,GainedEPText
	ret

c_210213	section	code abs=0x210213

swp_210213:
	ret

c_210214	section	code abs=0x210214

; [code] effect id -> loads its tiles (0x180) and palette (14) from BattleEffects
PlayBattleEffect:
	ldw	(XIZ+0x1A),0
	ld	HL,(XIZ+0x20)
	extz	XHL
	sll	2,XHL
	add	XHL,BattleEffectSounds
	ld	XHL,(XHL)
	ld	(XIZ+0x22),XHL
	ld	HL,(XIZ+0x20)
	extz	XHL
	sll	2,XHL
	add	XHL,BattleEffects
	ld	XHL,(XHL)
	push	XHL
	ld	XHL,(XHL)
	ld	(XIZ+TASK_ARG),XHL
	pop	XHL
	inc	4,XHL
	push	XHL
	ld	XHL,(XHL)
	ld	WA,0x180
	call	LoadCompressedTiles
	pop	XHL
	inc	4,XHL
	push	XHL
	ld	XHL,(XHL)
	ld	A,0xE
	ld	C,1
	call	LoadPalettes
	pop	XHL
	inc	4,XHL
	push	XHL
	ld	XHL,(XHL)
	ld	A,0xE
	ld	C,1
	call	LoadMonoPalettes
	pop	XHL
	inc	4,XHL
	ld	XHL,(XHL)
	ld	A,(XHL)
	extz	WA
	ld	(XIZ+0x16),WA
	inc	1,XHL
	ld	(XIZ+0x12),XHL
	ldw	(XIZ+0x1C),0
	ldw	(XIZ+0x18),0
PlayBattleEffect.loop:
	ld	XIY,(XIZ+0x12)
	ld	WA,(XIZ+0x18)
	incw	1,(XIZ+0x18)
	extz	XWA
	sll	2,XWA
	add	XIY,XWA
	ld	A,(XIY+0)
	cp	A,0
	jr	Z,PlayBattleEffect.skip
	cpb	(XIZ+0x1C),0
	jr	NZ,PlayBattleEffect.skip
	extz	WA
	ld	(XIZ+0x1C),WA
PlayBattleEffect.skip:
	ld	C,(XIY+2)
	exts	BC
	cpw	(XIZ+0x1E),0
	jr	Z,PlayBattleEffect.skip2
	neg	BC
PlayBattleEffect.skip2:
	add	BC,0x50
	ld	E,(XIY+3)
	exts	DE
	add	DE,0x30
	ld	A,(XIY+1)
	cp	A,0xFF
	jr	Z,PlayBattleEffect.skip5
	extz	XWA
	sll	2,XWA
	ld	XHL,(XIZ+TASK_ARG)
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,(XHL+0)
	extz	WA
	sll	2,WA
	sub	BC,WA
	ld	A,(XHL+1)
	extz	WA
	sll	2,WA
	sub	DE,WA
	ld	WA,0x180
	cpw	(XIZ+0x1E),0
	jr	NZ,PlayBattleEffect.skip3
	call	dyn_2069C8
	jr	PlayBattleEffect.skip5
PlayBattleEffect.skip3:
	cpw	(XIZ+0x20),0x72
	jr	Z,PlayBattleEffect.skip4
	cpw	(XIZ+0x20),0x73
	jr	Z,PlayBattleEffect.skip4
	cpw	(XIZ+0x20),0xBE
	jr	Z,PlayBattleEffect.skip4
	cpw	(XIZ+0x20),0xBF
	jr	Z,PlayBattleEffect.skip4
	call	swp_206A7B
	jr	PlayBattleEffect.skip5
PlayBattleEffect.skip4:
	call	dyn_2069C8
PlayBattleEffect.skip5:
	ld	A,(XIY+0)
	cp	A,0
	jrl	Z,PlayBattleEffect.loop
	ld	XHL,(XIZ+0x22)
	ld	A,(XHL)
	exts	WA
	cp	WA,0xFFFF
	jr	Z,PlayBattleEffect.skip6
	cp	(XIZ+0x1A),WA
	jr	NZ,PlayBattleEffect.skip6
	ld	WA,(XHL+1)
	call	SoundCommand
	inc	3,XHL
	ld	(XIZ+0x22),XHL
PlayBattleEffect.skip6:
	incw	1,(XIZ+0x1A)
	decw	1,(XIZ+0x16)
	decw	1,(XIZ+0x1C)
	jr	Z,PlayBattleEffect.skip7
	ldw	(XIZ+TASK_FUNC),0x281
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
PlayBattleEffect.skip7:
	cpw	(XIZ+0x16),0
	jr	NZ,PlayBattleEffect.skip8
	call	EndTask
	ret
PlayBattleEffect.skip8:
	ld	WA,(XIZ+0x18)
	extz	XWA
	sll	2,XWA
	add	(XIZ+0x12),XWA
	ldw	(XIZ+TASK_FUNC),0x27C
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_210EE8	section	code abs=0x210EE8

sub_210EE8:
	call	sub_212B32
	cp	A,1
	jr	Z,sub_210EE8.done
	calr	sub_210EF9
	ld	A,6
	ld	(XIZ+0xF),A
sub_210EE8.done:
	ret

c_210EF9	section	code abs=0x210EF9

sub_210EF9:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_212B66
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210F06	section	code abs=0x210F06

; [code+play] wipe, random enemy for the floor (sub_212BAB), wAreaLevel, LoadEnemy, BattleStart
StartDungeonBattle:
	call	sub_212B80
	cp	A,1
	jr	Z,StartDungeonBattle.done
	call	GetEncounterEnemy
	ld	XHL,0
	ld	W,(XIZ+0x10)
	cp	W,5
	jr	Z,StartDungeonBattle.skip
	ld	W,(XIZ+0x11)
	jr	StartDungeonBattle.skip2
StartDungeonBattle.skip:
	ld	W,8
StartDungeonBattle.skip2:
	ld	(wAreaLevel),W
	call	LoadEnemy
	ldb	(wDungeonBattle),1
	call	swp_207C00
	ld	A,7
	ld	(XIZ+0xF),A
StartDungeonBattle.done:
	ret

c_212B32	section	code abs=0x212B32

sub_212B32:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x40
	jr	Z,sub_212B32.skip
	srl	1,A
	and	A,7
	extz	WA
	mul	WA,0x10
	ld	(wFadeLevel),A
	ld	A,1
	jr	sub_212B32.skip2
sub_212B32.skip:
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,0
sub_212B32.skip2:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212B66	section	code abs=0x212B66

sub_212B66:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	XHL,0x9800
	ld	WA,0x10
	call	swp_216D66
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21452D	section	code abs=0x21452D

sub_21452D:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2166B3
	call	dyn_2166C9
	ld	A,0x5E
	calr	GetArenaGenderScene
	ld	(XIZ+0x12),A
	push	XWA
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x20
	call	SoundCommand
	pop	XWA
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+0x1F),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21455F	section	code abs=0x21455F

swp_21455F:
	push	XHL
	push	XWA
	ld	BC,0x14
	ld	A,(XHL+0)
	extz	WA
	sub	BC,WA
	sra	1,BC
	ld	DE,0x13
	ld	A,(XHL+1)
	extz	WA
	sub	DE,WA
	sra	1,DE
	pop	XWA
	pop	XHL
	ret

c_21457E	section	code abs=0x21457E

sub_21457E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	C,6
	ld	XHL,Pal_2C8772
	call	LoadPalettes
	ld	A,0x10
	ld	C,6
	ld	XHL,Pal_2C8772
	call	LoadPalettes
	ld	A,0x20
	ld	C,6
	ld	XHL,Pal_2C8772
	call	LoadPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2145AE	section	code abs=0x2145AE

sub_2145AE:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	C,2
	ld	XHL,MonoPal_2C87A2
	call	LoadMonoPalettes
	ld	A,2
	ld	C,2
	ld	XHL,MonoPal_2C87A2
	call	LoadMonoPalettes
	ld	A,4
	ld	C,2
	ld	XHL,MonoPal_2C87A2
	call	LoadMonoPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2145DE	section	code abs=0x2145DE

sub_2145DE:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0x98
	ld	(0x584B),A
	neg	A
	ld	(0x5853),A
	ld	A,0xFF
	ld	(0x5855),A
	ld	XHL,Gfx_2C8A0A
	call	dyn_216845
	call	LoadCompressedTiles
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,sub_2145DE.skip
	calr	sub_21457E
	jr	sub_2145DE.skip2
sub_2145DE.skip:
	calr	sub_2145AE
sub_2145DE.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214616	section	code abs=0x214616

sub_214616:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x1E)
	extz	WA
	extz	XWA
	mul	XWA,0xA
	ld	XHL,Map_2C8992
	add	XHL,XWA
	call	dyn_216845
	call	dyn_2069C8
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214639	section	code abs=0x214639

sub_214639:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x1E)
	extz	WA
	extz	XWA
	mul	XWA,0xA
	ld	XHL,Map_2C89CE
	add	XHL,XWA
	call	dyn_216845
	call	dyn_2069C8
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21465C	section	code abs=0x21465C

sub_21465C:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,sub_21465C.skip
	calr	sub_214616
	jr	sub_21465C.skip2
sub_21465C.skip:
	calr	sub_214639
sub_21465C.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214675	section	code abs=0x214675

sub_214675:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	srl	3,A
	dec	1,A
	cp	A,1
	jr	C,sub_214675.skip4
	cp	A,0x13
	jr	NC,sub_214675.skip4
	extz	WA
	extz	XWA
	push	XWA
	sll	1,XWA
	ld	XDE,7
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,0x9000
	add	XDE,XWA
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,sub_214675.skip
	ld	XHL,Map_2C87AA
	jr	sub_214675.skip2
sub_214675.skip:
	ld	XHL,Map_2C8860
sub_214675.skip2:
	inc	2,XHL
	pop	XWA
	sub	XWA,1
	sll	1,XWA
	add	XHL,XWA
	call	dyn_216845
	dec	1,WA
	ld	C,5
sub_214675.loop:
	push	C
	ld	BC,(XHL)
	and	BC,0x1FF
	ld	BC,(XHL)
	jr	Z,sub_214675.skip3
	add	BC,WA
sub_214675.skip3:
	ld	(XDE),BC
	pop	C
	add	XHL,0x24
	add	XDE,0x40
	djnz	C,sub_214675.loop
sub_214675.skip4:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	ld	(0x584B),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214700	section	code abs=0x214700

sub_214700:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2C)
	srl	3,A
	inc	1,A
	cp	A,5
	jr	C,sub_214700.skip4
	cp	A,0xF
	jr	NC,sub_214700.skip4
	extz	WA
	extz	XWA
	push	XWA
	sll	1,XWA
	ld	XDE,8
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,0x9800
	add	XDE,XWA
	ld	A,(wColorFlags)
	cp	A,0
	jr	Z,sub_214700.skip
	ld	XHL,Map_2C8916
	jr	sub_214700.skip2
sub_214700.skip:
	ld	XHL,Map_2C8954
sub_214700.skip2:
	inc	2,XHL
	pop	XWA
	sub	XWA,5
	sll	1,XWA
	add	XHL,XWA
	call	dyn_216845
	dec	1,WA
	ld	C,3
sub_214700.loop:
	push	C
	ld	BC,(XHL)
	and	BC,0x1FF
	ld	BC,(XHL)
	jr	Z,sub_214700.skip3
	add	BC,WA
sub_214700.skip3:
	ld	(XDE),BC
	pop	C
	add	XHL,0x14
	add	XDE,0x40
	djnz	C,sub_214700.loop
sub_214700.skip4:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	neg	A
	ld	(0x5853),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214829	section	code abs=0x214829

sub_214829:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x1F)
	cp	A,0
	jr	Z,sub_214829.skip
	calr	sub_21452D
	jr	sub_214829.skip2
sub_214829.skip:
	calr	sub_2145DE
	ld	A,4
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	(XIZ+0x22),A
	ld	(XIZ+0x21),A
	ld	(XIZ+0x2D),A
	ld	A,3
	ld	(XIZ+0x2A),A
sub_214829.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214859	section	code abs=0x214859

sub_214859:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	sub_214675
	calr	sub_214700
	ld	BC,0x48
	ld	DE,0xFFEC
	ld	A,(XIZ+0x2C)
	extz	WA
	srl	1,WA
	add	DE,WA
	calr	sub_21465C
	ld	A,(XIZ+0x2C)
	cp	A,0x5C
	jr	C,sub_214859.skip
	sub	A,0x5C
	extz	WA
	div	WA,0x14
	inc	1,A
	ld	W,4
	sub	W,A
	ld	(XIZ+0x20),W
sub_214859.skip:
	ld	A,(XIZ+0x21)
	ld	(XIZ+0x22),A
	ld	A,(XIZ+0x2C)
	ld	W,(XIZ+0x20)
	add	A,W
	ld	(XIZ+0x2C),A
	cp	A,0x98
	jr	C,sub_214859.skip2
	ld	XWA,0xB
	call	PlayMusic
	ld	WA,0xA0
	call	SoundCommand
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,4
	ld	(XIZ+0x2A),A
sub_214859.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2148C4	section	code abs=0x2148C4

sub_2148C4:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	BC,0x48
	ld	DE,0x38
	calr	sub_21465C
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x4B
	jr	C,sub_2148C4.skip
	ld	A,0x98
	ld	(XIZ+0x2C),A
	ld	A,5
	ld	(XIZ+0x2A),A
sub_2148C4.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
