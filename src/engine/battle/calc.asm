; engine/battle/calc.asm: battle formulas: level rolls, hit/turn-order margins, damage roll, affinity, Airbag, EP cost/recharge and stat-buff multipliers, ComputeStatBuffs, exp for a kill

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

; [code] (unit MP % + LevelRoll) - (enemy MP % + LevelRoll); negative: EnemyTurn first (StartBattleRound)
TurnOrderMargin:
	ld	WA,(wUnitMP)
	call	ApplyPlayerMPBuff
	push	WA
	ld	A,(wPlayerLevel)
	call	LevelRoll
	add	(XSP),WA
	ld	WA,(wEnemyMP)
	call	ApplyEnemyMPBuff
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

c_2089CD	section	code abs=0x2089CD

; [code] when wAirbagActive: WA >>= 1, 0 -> 1; three callers in battle.asm
ApplyAirbag:
	cpb	(wAirbagActive),0
	ret	Z
	srl	1,WA
	ret	NZ
	ld	WA,1
	ret

c_2089DC	section	code abs=0x2089DC

; [code] WA = WA * wEPCostPercent / 100; CalcEnemyMinAttackEP applies it to both arms' and both skills' EP costs
ScaleEPCost:
	push	WA
	ld	A,(wEPCostPercent)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_2089EB	section	code abs=0x2089EB

; [code] WA = wRechargePercent * wUnitMaxEP / 100; BattleRecharge shows it as the EP gain
GetRechargeAmount:
	ld	A,(wRechargePercent)
	ld	W,0
	mul	XWA,(wUnitMaxEP)
	div	XWA,0x64
	ret

c_2089FA	section	code abs=0x2089FA

; [code] WA = WA * wPlayerAPBuff / 100 (the ApplyPlayerSPBuff shape); PlayerAttack callers
ApplyPlayerAPBuff:
	push	WA
	ld	A,(wPlayerAPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A09	section	code abs=0x208A09

; [code] WA = WA * wPlayerSPBuff / 100 (the ApplyEnemySPBuff shape)
ApplyPlayerSPBuff:
	push	WA
	ld	A,(wPlayerSPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A18	section	code abs=0x208A18

; [code] WA = WA * wPlayerRPBuff / 100
ApplyPlayerRPBuff:
	push	WA
	ld	A,(wPlayerRPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A27	section	code abs=0x208A27

; [code] WA = WA * wPlayerMPBuff / 100
ApplyPlayerMPBuff:
	push	WA
	ld	A,(wPlayerMPBuff)
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

c_208A73	section	code abs=0x208A73

; [code] WA = WA * wEnemyEPCostBuff / 100
ApplyEnemyEPCostBuff:
	push	WA
	ld	A,(wEnemyEPCostBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208A82	section	code abs=0x208A82

; [code] WA = wEnemyRechargePercent * wEnemyMaxEP / 100; EnemyRecharge shows it as the EP gain (GetRechargeAmount for the enemy)
GetEnemyRechargeAmount:
	ld	A,(wEnemyRechargePercent)
	ld	W,0
	mul	XWA,(wEnemyMaxEP)
	div	XWA,0x64
	ret

c_208A91	section	code abs=0x208A91

; [code] WA = WA * wEnemyAPBuff / 100 (XHL kept)
ApplyEnemyAPBuff:
	push	XHL
	push	WA
	ld	A,(wEnemyAPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	pop	XHL
	ret

c_208AA2	section	code abs=0x208AA2

; [code] only when wEnemyScaled: WA = WA * byte +4 of the GetEnemyScaling row / 100
ApplyEnemyScaling:
	cpb	(wEnemyScaled),0
	ret	Z
	push	XHL
	call	GetEnemyScaling
	mul	XWA,(XHL+4)
	div	XWA,0x64
	pop	XHL
	ret

c_208AB7	section	code abs=0x208AB7

; [code] WA = WA * byte(0x5DBB) / 100, same shape as ApplyEnemyRPBuff (wEnemyRPBuff) and the wEnemyAPBuff multiply in engine/battle/; applied to wEnemySP in PlayerAttack / EnemyAttack / EnemyArmAttack before DamageRoll
ApplyEnemySPBuff:
	push	WA
	ld	A,(wEnemySPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208AC6	section	code abs=0x208AC6

; [code] WA = WA * wEnemyRPBuff / 100
ApplyEnemyRPBuff:
	push	WA
	ld	A,(wEnemyRPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208AD5	section	code abs=0x208AD5

; [code] WA = WA * wEnemyMPBuff / 100
ApplyEnemyMPBuff:
	push	WA
	ld	A,(wEnemyMPBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_20CE3F	section	code abs=0x20CE3F

; [code] battle stat percentages from the turn counters: each of 0x5D8A-0x5D8D (player) starts at
; 100 and gets +30 for each of its two counters (0x5D97+i, 0x5D9B+i) that is not 0; each of
; 0x5DBA-0x5DBD (enemy) starts at 100 and gets -30 per counter (0x5DC8+i, 0x5DCC+i; wEnemySPBuff also
; +50 for 0x5DC7). Called by DrawBattleScreen, PlayerTurn and EnemyTurn. Play traces: every run
; executes it (D10, 2026-11-25); was an unknown data block plus swp_20CED8 (its tail).
ComputeStatBuffs:
	ldb	(wPlayerAPBuff),0x64
	cpb	(wSkillAPUpTurns),0
	jr	Z,ComputeStatBuffs.skip1
	addb	(wPlayerAPBuff),0x1E
ComputeStatBuffs.skip1:
	cpb	(wItemAPUpTurns),0
	jr	Z,ComputeStatBuffs.skip2
	addb	(wPlayerAPBuff),0x1E
ComputeStatBuffs.skip2:
	ldb	(wPlayerSPBuff),0x64
	cpb	(wSkillSPUpTurns),0
	jr	Z,ComputeStatBuffs.skip3
	addb	(wPlayerSPBuff),0x1E
ComputeStatBuffs.skip3:
	cpb	(wItemSPUpTurns),0
	jr	Z,ComputeStatBuffs.skip4
	addb	(wPlayerSPBuff),0x1E
ComputeStatBuffs.skip4:
	ldb	(wPlayerRPBuff),0x64
	cpb	(wSkillRPUpTurns),0
	jr	Z,ComputeStatBuffs.skip5
	addb	(wPlayerRPBuff),0x1E
ComputeStatBuffs.skip5:
	cpb	(wItemRPUpTurns),0
	jr	Z,ComputeStatBuffs.skip6
	addb	(wPlayerRPBuff),0x1E
ComputeStatBuffs.skip6:
	ldb	(wPlayerMPBuff),0x64
	cpb	(wSkillMPUpTurns),0
	jr	Z,ComputeStatBuffs.skip7
	addb	(wPlayerMPBuff),0x1E
ComputeStatBuffs.skip7:
	cpb	(wItemMPUpTurns),0
	jr	Z,ComputeStatBuffs.skip8
	addb	(wPlayerMPBuff),0x1E
ComputeStatBuffs.skip8:
	ldb	(wEnemyAPBuff),0x64
	cpb	(wEnemyAPDownTurns),0
	jr	Z,ComputeStatBuffs.skip9
	addb	(wEnemyAPBuff),0xE2
ComputeStatBuffs.skip9:
	cpb	(wSkillEnemyAPDownTurns),0
	jr	Z,ComputeStatBuffs.skip10
	addb	(wEnemyAPBuff),0xE2
ComputeStatBuffs.skip10:
	ldb	(wEnemySPBuff),0x64
	cpb	(wEnemySPUpTurns),0
	jr	Z,ComputeStatBuffs.skip11
	addb	(wEnemySPBuff),0x32
ComputeStatBuffs.skip11:
	cpb	(wEnemySPDownTurns),0
	jr	Z,ComputeStatBuffs.skip12
	addb	(wEnemySPBuff),0xE2
ComputeStatBuffs.skip12:
	cpb	(wSkillEnemySPDownTurns),0
	jr	Z,ComputeStatBuffs.skip13
	addb	(wEnemySPBuff),0xE2
ComputeStatBuffs.skip13:
	ldb	(wEnemyRPBuff),0x64
	cpb	(wEnemyRPDownTurns),0
	jr	Z,ComputeStatBuffs.skip14
	addb	(wEnemyRPBuff),0xE2
ComputeStatBuffs.skip14:
	cpb	(wSkillEnemyRPDownTurns),0
	jr	Z,ComputeStatBuffs.skip15
	addb	(wEnemyRPBuff),0xE2
ComputeStatBuffs.skip15:
	ldb	(wEnemyMPBuff),0x64
	cpb	(wEnemyMPDownTurns),0
	jr	Z,ComputeStatBuffs.skip16
	addb	(wEnemyMPBuff),0xE2
ComputeStatBuffs.skip16:
	cpb	(wSkillEnemyMPDownTurns),0
	jr	Z,ComputeStatBuffs.skip17
	addb	(wEnemyMPBuff),0xE2
ComputeStatBuffs.skip17:
	ret
