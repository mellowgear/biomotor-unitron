; engine/battle/enemy_turn.asm: enemy turn: attack choice, EnemyAttack / EnemyArmAttack, enemy hit results, enemy non-attack actions (flee, heal, cure, recharge)

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
	calr	GetEnemySlotChance
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
	ld	W,(wEnemyParts+2)
	jr	Z,EnemyChooseAttack.skip2
	cp	A,0xC
	ld	W,(wEnemyParts+3)
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
	ld	XHL,WaitBattleMessageTask
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
	cpb	(wEnemyId),ENEMY_SATANA
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
	ldb	(wScr2ScrollX),0xB0
	ldb	(wScr2ScrollY),0x68
	ldw	(XIZ+TASK_FUNC),BattleMainMenuInput & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleMainMenuInput >> 16
	ret

c_20984D	section	code abs=0x20984D

; [code] B = attack slot chance byte (slot +7, EnemyChooseAttack) -> B: <= 100 kept; 0x65 = 100 only while wEnemyFullHealUsed = 0 and wEnemyHP < wEnemyMaxHP / 2, else 0; above 0x65 = 0
GetEnemySlotChance:
	cp	B,0x65
	ret	C
	jr	Z,GetEnemySlotChance.skip
	ld	B,0
	ret
GetEnemySlotChance.skip:
	ld	B,0
	cpb	(wEnemyFullHealUsed),0
	ret	NZ
	ld	BC,(wEnemyMaxHP)
	srl	1,BC
	cp	(wEnemyHP),BC
	ld	B,0
	ret	NC
	ld	B,0x64
	ret

c_20A8BD	section	code abs=0x20A8BD

; [code] the player's attack while wStatusConfused (PlayerAttack resumes here, task pointer 0x20A8BD, after rolling HitMargin / DamageRoll with the unit's own RP / SP / affinity as the target's): the enemy-hit shapes and texts (You dodged / Critical hit / You took no damage / takes damage, UnitHPLossTask, PlayerStatusTexts) with the player's attack results (wPlayerHitMargin, wCritHit, wPlayerDamage, wInflictStatus): the unit hits itself (was EnemyHitResult1)
; [play] seen in play (confused by a Pumper's Makeup, then an XGun attack): "You're confused!!", "Rena's XGun!!" with the hit drawn on the
; unit, "Rena takes 25 damage!!" (.skip4), the unit's HP 145 -> 120 through UnitHPLossTask, the enemy's HP unchanged, then PlayerTurnEnd;
; every confused arm attack came here and hit the unit for 23-26 (about a quarter of a normal hit). With the results set by hand: wPlayerDamage 0
; gives "You took no damage!!", wPlayerHitMargin 0xFF "You dodged the attack!!", wCritHit 1 "Critical hit!!" and double damage (50)
ConfusedPlayerHitResult:
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	cpb	(wPlayerHitMargin),0
	jr	PL,ConfusedPlayerHitResult.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret
ConfusedPlayerHitResult.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	cpb	(wCritHit),0
	ld	XHL,ShakeScr1Amp4Task
	jr	Z,ConfusedPlayerHitResult.skip2
	ld	XHL,ShakeScr1Amp8Task
ConfusedPlayerHitResult.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,ConfusedPlayerHitResult.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ConfusedPlayerHitResult.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,ConfusedPlayerHitResult.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	ConfusedPlayerHitResult.skip5
ConfusedPlayerHitResult.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+TASK_ARG),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wInflictStatus),0xFF
	jr	Z,ConfusedPlayerHitResult.skip5
	cpw	(wUnitHP),0
	jr	Z,ConfusedPlayerHitResult.skip5
	ld	A,(wInflictStatus)
	sll	2,A
	ld	XHL,PlayerStatusTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,ConfusedPlayerHitResult.skip5
	ld	XHL,wStatusParalyzed-1
	orb	(XHL+A),0x80
ConfusedPlayerHitResult.skip5:
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B460	section	code abs=0x20B460

; [code] enemy's turn: "can't attack" while wTimeStopTurns, else EP check and attack
EnemyTurn:
	calr	ComputeStatBuffs
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ld	XHL,EnemySlideInTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wTimeStopTurns),0
	jr	Z,EnemyTurn.skip
	ld	XHL,CantAttackText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyTurn.skip:
	ld	XHL,(wEnemyAttackSlot)
	ld	WA,(XHL+SLOT_EP)
	call	ApplyEnemyEPCostBuff
	ld	(wEnemyAttackEPCost),WA
	ld	XWA,0
	ld	A,(XHL+3)
	inc	1,A
	sll	2,WA
	add	XWA,EnemyActionJumps
	ld	XWA,(XWA)
	ld	(XIZ+TASK_FUNC),XWA
	ret
EnemyActionJumps:
	dl	EnemyCheckCanAttack,EnemyCheckCanAttack,EnemyCheckCanAttack,EnemyCheckCanAttack
	dl	EnemyCheckCanAttack,EnemyCheckCanAttack,EnemyFlee,EnemyStatUpAttack
	dl	EnemyHeal50,EnemyCureAttack,EnemyHealAttack,EnemyHeal100
	dl	EnemyArmTurn1,EnemyArmTurn2,EnemyRecharge

c_20B521	section	code abs=0x20B521

; [code] enemy: Can't attack / Not enough EP / Is confused
EnemyCheckCanAttack:
	cpb	(wEnemyParalyzed),0
	jr	Z,EnemyCheckCanAttack.skip
	ld	XHL,CantAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyCheckCanAttack.skip3:
	cpb	(wEnemyConfused),0
	jr	Z,EnemyAttack
	ld	XHL,IsConfusedText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait

c_20B5C7	section	code abs=0x20B5C7

; [code] "<ENEMY>'s <attack>" (GetAttackName of the wEnemyAttackSlot record), HitMargin (wEnemyRP vs wUnitRP), DamageRoll (slot power (ApplyEnemyScaling) + wEnemyAP vs wUnitSP) x ApplyAffinity vs wUnitAffinity, ApplyAirbag -> wEnemyDamage; crit and status rolls (wEnemyCritChance, wEnemyStatusChance); then EnemyHitResult2/3/4 by the slot's f0; while wEnemyConfused against its own RP / SP / affinity, then ConfusedEnemyHitResult.
; A near-copy of PlayerAttack (engine/battle/player_turn.asm) with the sides swapped, reading an enemy attack slot instead of an arm record: power SLOT_POWER through ApplyEnemyScaling, affinity byte +6, status +3, effect list at +8 (its first byte picks the hit result, as in PlayerAttack); crit and status rolls repeated in both branches as in PlayerAttack. EnemyArmAttack is the same code for an arm record
EnemyAttack:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	cpb	(wEnemyConfused),0
	jrl	NZ,EnemyAttack.skip3
	ld	WA,(wEnemyRP)
	call	ApplyEnemyRPBuff
	ld	BC,WA
	ld	WA,(wUnitRP)
	call	ApplyPlayerRPBuff
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	XHL,(wEnemyAttackSlot)
	ld	WA,(XHL+SLOT_POWER)
	call	ApplyEnemyScaling
	add	WA,(wEnemyAP)
	call	ApplyEnemyAPBuff
	ld	BC,WA
	ld	WA,(wUnitSP)
	call	ApplyPlayerSPBuff
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	DamageRoll
	ld	C,(XHL+6)
	ld	B,0
	ld	DE,(wUnitAffinity)
	call	ApplyAffinity
	call	ApplyAirbag
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
	call	ApplyEnemyRPBuff
	ld	BC,WA
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,A
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	XHL,(wEnemyAttackSlot)
	ld	WA,(XHL+SLOT_POWER)
	call	ApplyEnemyScaling
	add	WA,(wEnemyAP)
	call	ApplyEnemyAPBuff
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
	ldw	(XIZ+TASK_FUNC),ConfusedEnemyHitResult & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfusedEnemyHitResult >> 16
	ret

c_20B7AF	section	code abs=0x20B7AF

; [code] the enemy's turn with its arm 0x5DD3: wEnemyParalyzed -> CantAttackText and the turn ends
; (task 0x20C4FB); else "Enemy's <arm>" (GetArmName of 0x5DD3), then EnemyArmAttack (task 0x20B89D).
; EnemyArmTurn2 is the same for the arm 0x5DD4. (Was EnemyArmTurn1/2: only the paralysed branch says that.)
EnemyArmTurn1:
	cpb	(wEnemyParalyzed),0
	jr	Z,EnemyArmTurn1.skip
	ld	XHL,CantAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyArmTurn1.skip:
	ld	L,(wEnemyParts+2)
	call	GetArmName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	L,(wEnemyParts+2)
	ld	H,0
	ld	(XIZ+0x10),HL
	ldw	(XIZ+TASK_FUNC),EnemyArmAttack & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyArmAttack >> 16
	ret

c_20B826	section	code abs=0x20B826

; [code]
EnemyArmTurn2:
	cpb	(wEnemyParalyzed),0
	jr	Z,EnemyArmTurn2.skip
	ld	XHL,CantAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyArmTurn2.skip:
	ld	L,(wEnemyParts+3)
	call	GetArmName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	L,(wEnemyParts+3)
	ld	H,0
	ld	(XIZ+0x10),HL
	ldw	(XIZ+TASK_FUNC),EnemyArmAttack & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyArmAttack >> 16
	ret

c_20B89D	section	code abs=0x20B89D

; [code+play] enemy attack action 11/12: a robot enemy attacks with an arm (GetArmRecord, HitMargin, DamageRoll); Arena robots; while wEnemyConfused against its own RP / SP / affinity, then ConfusedEnemyHitResult.
; A near-copy of EnemyAttack for an arm record (GetArmRecord / GetArmEffects: +4 power with no ApplyEnemyScaling, +0xE affinity word, +0x10 status, effect list in +0x14 as in PlayerAttack) that also sets wEnemyAttackEPCost (+0xC, ApplyEnemyEPCostBuff), shows no message of its own and rolls crit / status once before the hit, not per branch
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
	call	ApplyEnemyEPCostBuff
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
	call	ApplyEnemyRPBuff
	ld	BC,WA
	ld	WA,(wUnitRP)
	call	ApplyPlayerRPBuff
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	WA,(XHL+4)
	add	WA,(wEnemyAP)
	call	ApplyEnemyAPBuff
	ld	BC,WA
	ld	WA,(wUnitSP)
	call	ApplyPlayerSPBuff
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,(wPlayerLevel)
	call	DamageRoll
	ld	BC,(XHL+0xE)
	ld	DE,(wUnitAffinity)
	call	ApplyAffinity
	call	ApplyAirbag
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
	call	ApplyEnemyRPBuff
	ld	BC,WA
	ld	DE,WA
	ld	A,(wEnemyLevel)
	ld	W,A
	call	HitMargin
	ld	(wEnemyHitMargin),W
	ld	WA,(XHL+4)
	add	WA,(wEnemyAP)
	call	ApplyEnemyAPBuff
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
	ldw	(XIZ+TASK_FUNC),ConfusedEnemyHitResult & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfusedEnemyHitResult >> 16
	ret

c_20BA11	section	code abs=0x20BA11

; [code] two scroll tasks (EnemySlideOutRightTask, EnemySlideInTask), then You dodged / Critical hit / You took no damage / takes damage, UnitHPLossTask; EnemyAttack / EnemyArmAttack pick it for f0 = 0
EnemyHitResult2:
	ld	XHL,EnemySlideOutRightTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ld	XHL,EnemySlideInTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wEnemyHitMargin),0
	jr	PL,EnemyHitResult2.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyHitResult2.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,ShakeScr1Amp4Task
	jr	Z,EnemyHitResult2.skip2
	ld	XHL,ShakeScr1Amp8Task
EnemyHitResult2.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,EnemyHitResult2.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
EnemyHitResult2.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,EnemyHitResult2.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	EnemyHitResult2.skip5
EnemyHitResult2.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+TASK_ARG),WA
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,EnemyHitResult2.skip5
	ld	XHL,wStatusParalyzed-1
	orb	(XHL+A),0x80
EnemyHitResult2.skip5:
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20BBC7	section	code abs=0x20BBC7

; [code] as EnemyHitResult2 with PlayNextEffect twice (scroll registers set directly) in place of the two scroll tasks; picked for f0 = 1 [play] I38: SCR1 0xC0 / SCR2 0x60 set in one step, no slide.
EnemyHitResult3:
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	cpb	(wEnemyHitMargin),0
	jr	PL,EnemyHitResult3.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyHitResult3.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,ShakeScr1Amp4Task
	jr	Z,EnemyHitResult3.skip2
	ld	XHL,ShakeScr1Amp8Task
EnemyHitResult3.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,EnemyHitResult3.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
EnemyHitResult3.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,EnemyHitResult3.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	EnemyHitResult3.skip5
EnemyHitResult3.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+TASK_ARG),WA
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,EnemyHitResult3.skip5
	ld	XHL,wStatusParalyzed-1
	orb	(XHL+A),0x80
EnemyHitResult3.skip5:
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20BD9D	section	code abs=0x20BD9D

; [code] as EnemyHitResult2 without the two scroll tasks (wScr2ScrollX/Y set to 0x60 / 0); picked for f0 = 2 and up
EnemyHitResult4:
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	cpb	(wEnemyHitMargin),0
	jr	PL,EnemyHitResult4.skip
	ld	XHL,YouDodgedTheAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyHitResult4.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,ShakeScr1Amp4Task
	jr	Z,EnemyHitResult4.skip2
	ld	XHL,ShakeScr1Amp8Task
EnemyHitResult4.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,EnemyHitResult4.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
EnemyHitResult4.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,EnemyHitResult4.skip4
	ld	XHL,YouTookNoDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	EnemyHitResult4.skip5
EnemyHitResult4.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPLossTask
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+TASK_ARG),WA
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,EnemyHitResult4.skip5
	ld	XHL,wStatusParalyzed-1
	orb	(XHL+A),0x80
EnemyHitResult4.skip5:
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20C0B1	section	code abs=0x20C0B1

; [code] enemy action: "<ENEMY> fled!!", unless a roll >= wFleeChance: "But you are able to chase it!!"
EnemyFlee:
	ld	XHL,EnemyFledText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
EnemyFlee.skip:
	ldw	(XIZ+TASK_FUNC),EnemyFleeSucceeded & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyFleeSucceeded >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	ld	XHL,SPWentUpText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wEnemySPUpTurns),5
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20C1A5	section	code abs=0x20C1A5

; [code] enemy attack action 7 (table EnemyActionJumps [action+1]; Bonryu/Scaley "Revive"): message 0x2254A8 "<ENEMY>'s <STR1>!!" with GetAttackName, then EnemyHealGain with +0x10 = 50 (ShowEnemyHPGain, enemy HP gain task EnemyHPGainTask)
EnemyHeal50:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+0x10),0x32
	ldw	(XIZ+TASK_FUNC),EnemyHealGain & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyHealGain >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	ld	XHL,SStatusReturnedToText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,0
	ld	(wEnemyParalyzed),A
	ld	(wEnemyRusted),A
	ld	(wEnemyEPLeak),A
	ld	(wEnemyConfused),A
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20C274	section	code abs=0x20C274

; [code] '<ENEMY>'s HP / EP are fully restored'
EnemyHealAttack:
	ldb	(wEnemyFullHealUsed),0xFF
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	ld	XHL,SHPAreFullyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyHPGainTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ld	XHL,SEPAreFullyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyEPGainTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20C360	section	code abs=0x20C360

; [code] enemy attack action 10 (table EnemyActionJumps; Uniti "Repair"): same as EnemyHeal50 with +0x10 = 100
EnemyHeal100:
	ld	XHL,(wEnemyAttackSlot)
	ld	L,(XHL+SLOT_ATTACK)
	call	GetAttackName
	ld	(XIZ+0x10),XHL
	ld	XHL,EnemysStr1Text
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+0x10),0x64
	ldw	(XIZ+TASK_FUNC),EnemyHealGain & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyHealGain >> 16
	ret

c_20C39E	section	code abs=0x20C39E

; [code] resumed by EnemyHeal50 / EnemyHeal100 (TASK_FUNC 0xC39E, +0x10 = HP): PlayEffectList of the slot's effects, ShowEnemyHPGain message, EnemyHPGainTask of +0x10, then EnemyTurnEnd (0xC4FB)
EnemyHealGain:
	ld	XHL,(wEnemyAttackSlot)
	lda	XHL,XHL+9
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	ld	HL,(XIZ+0x10)
	calr	ShowEnemyHPGain
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyHPGainTask
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+TASK_ARG),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20C412	section	code abs=0x20C412

; [code] "recharged its energy"
EnemyRecharge:
	ld	XHL,RechargedItsEnergyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,DefaultEnemyAttack+SLOT_EFFECTS
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),1
	task_wait
	call	GetEnemyRechargeAmount
	ld	(XIZ+0x10),WA
	ld	HL,WA
	calr	ShowEnemyEPGain
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyEPGainTask
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+TASK_ARG),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(wEnemyAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret

c_20C4B0	section	code abs=0x20C4B0

; [code] EnemyFlee when the chase roll fails (TASK_FUNC 0xC4B0): EnemySlideOutTask (SCR2 slide), EnemyFledText2 "<ENEMY> fled...", then BattleEnd with TASK_ARG (wBattleResult) 1
EnemyFleeSucceeded:
	ld	XHL,EnemySlideOutTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	ld	XHL,EnemyFledText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_ARG),BATTLE_RESULT_ENEMY_FLED
	ldw	(XIZ+TASK_FUNC),BattleEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleEnd >> 16
	ret
