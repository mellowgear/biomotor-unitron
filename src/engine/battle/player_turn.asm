; engine/battle/player_turn.asm: player turn: attack checks, PlayerAttack, items, recharge, flee, the player hit-result messages

c_209E01	section	code abs=0x209E01

; [code] task step after the command (or item) choice: clears the menu box, wRoundSecondTurn = 0, then PlayerTurn
; when TurnOrderMargin >= 0, else EnemyTurn; outside dungeons (wDungeonBattle 0) fleeing (cursor 3) always goes first
StartBattleRound:
	ld	A,3
	call	EraseTextBox
	ld	WA,0
	ld	C,0xC
	ld	E,9
	ld	B,8
	ld	D,2
	call	FillScrRect
	ldb	(wRoundSecondTurn),0
	cpb	(wDungeonBattle),0
	jr	NZ,StartBattleRound.skip
	cpb	(wBattleMenuCursor),3
	jr	NZ,StartBattleRound.skip
	ld	XHL,PlayerTurn
	jr	StartBattleRound.skip2
StartBattleRound.skip:
	call	TurnOrderMargin
	or	WA,WA
	ld	XHL,PlayerTurn
	jr	PL,StartBattleRound.skip2
	ld	XHL,EnemyTurn
StartBattleRound.skip2:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_209E45	section	code abs=0x209E45

; [code] the unit's turn: ComputeStatBuffs, slide the unit in (UnitSlideInShiftedTask when it moves second), then the
; handler for wBattleMenuCursor: attack, item, recharge, flee
PlayerTurn:
	calr	ComputeStatBuffs
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	cpb	(wRoundSecondTurn),0
	ld	XHL,UnitSlideInShiftedTask
	jr	NZ,PlayerTurn.skip
	ld	XHL,UnitShiftRightTask
PlayerTurn.skip:
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	ld	XHL,0
	ld	L,(wBattleMenuCursor)
	sll	2,HL
	add	XHL,BattleMenuJumps
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
; [code] PlayerTurn handlers by wBattleMenuCursor 0-3
BattleMenuJumps:
	dl	CheckCanAttack,BattleUseItem,BattleRecharge,TryFlee

c_209E9E	section	code abs=0x209E9E

; [code] attack or skill chosen: not enough EP ends the turn; confusion shows its message and carries on (the
; hit lands on the unit); loads the arm or skill record (+0x10) and effects (+0x14); skills with a
; status code >= 5 run a SkillEffects handler, the rest attack through PlayerParalysisCheck
CheckCanAttack:
	cpb	(wStatusParalyzed),0	; paralysed: skip the EP check, PlayerParalysisCheck ends the turn
	jr	NZ,CheckCanAttack.skip2
	ld	WA,(wAttackEPCost)
	cp	(wUnitEP),WA
	jr	NC,CheckCanAttack.skip
	ld	XHL,NotEnoughEPText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret
CheckCanAttack.skip:
	cpb	(wStatusConfused),0
	jr	Z,CheckCanAttack.skip2
	ld	XHL,YoureConfusedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
CheckCanAttack.skip2:
	ld	XHL,0
	; wBattleChoice 0 = right arm, 1 = left arm, 2 / 3 = skill 1 / 2
	cpw	(wBattleChoice),1
	ld	L,(wEquipRightArm)
	jrl	C,LoadArmAttack
	ld	L,(wEquipLeftArm)
	jrl	Z,LoadArmAttack
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
	jr	Z,PlayerParalysisCheck
	; record +0x10: status code; 0-4 / 0xFF = attack, 5+ = non-attack skill
	cp	A,5
	jr	C,PlayerParalysisCheck
	ld	XHL,0
	ld	HL,(wBattleChoice)
	sll	2,HL
	add	XHL,BattleChoiceTexts
	ld	XHL,(XHL)
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0x10)	; status to inflict, 0 / 0xFF = none
	sub	A,5	; SkillEffects index = code - 5
	ld	W,0
	sll	2,WA
	extz	XWA
	add	XWA,SkillEffects
	ld	XWA,(XWA)
	ld	(XIZ+TASK_FUNC),XWA
	ret

d_209F95	section	romdata abs=0x209F95
; [code] skill handlers for status codes 5-11
SkillEffects:
	dl	ShowStatUp,ShowStatDown,ShowFullHeal,SkillTimeStop
	dl	SkillRecvr,SkillAirbag,SkillFullCharge

c_209FB1	section	code abs=0x209FB1

; [code] CheckCanAttack for an arm (wBattleChoice 0 / 1): +0x14 = GetArmEffects, +0x10 = GetArmRecord, then PlayerParalysisCheck
LoadArmAttack:
	push	L
	call	GetArmEffects
	ld	(XIZ+0x14),XHL
	pop	L
	call	GetArmRecord
	ld	(XIZ+0x10),XHL

c_209FC3	section	code abs=0x209FC3

; [code] wStatusParalyzed -> YouCantAttackText, wAttackEPCost 0, PlayerTurnEnd; else PlayerAttack (arm attacks and skills with an attack effect)
PlayerParalysisCheck:
	cpb	(wStatusParalyzed),0
	jr	Z,PlayerAttack
	ld	XHL,YouCantAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_209FFB	section	code abs=0x209FFB

; [code] HitMargin, then DamageRoll (damage.asm: about 0.4 x (attack - defence) + 8) x affinity, x2 crit (play); while wStatusConfused the unit's own RP / SP / affinity stand in for the enemy's and the result goes to ConfusedPlayerHitResult.
; EnemyAttack and EnemyArmAttack (engine/battle/enemy_turn.asm) are near-copies of this code with the sides swapped (enemy RP / AP / level / buffs against the unit's, ApplyAirbag where this has AtLeastOne, EnemyHitResult2-4, the confused path resuming at ConfusedEnemyHitResult); EnemyArmAttack reads the same arm record fields (+4 power, +0xE affinity, +0x10 status, effect list in +0x14)
PlayerAttack:
	ld	XHL,0
	ld	HL,(wBattleChoice)
	sll	2,HL
	add	XHL,BattleChoiceTexts
	ld	XHL,(XHL)
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	; confused: the unit attacks itself (own RP / SP / affinity, damage / 4)
	cpb	(wStatusConfused),0
	jrl	NZ,PlayerAttack.skip3
	ld	WA,(wUnitRP)
	call	ApplyPlayerRPBuff
	ld	BC,WA
	ld	WA,(wEnemyRP)
	call	ApplyEnemyRPBuff
	ld	DE,WA
	ld	A,(wPlayerLevel)
	ld	W,(wEnemyLevel)
	call	HitMargin
	ld	(wPlayerHitMargin),W
	; attack = record +4 (power) + AP; record +0xE = affinity
	ld	WA,(XHL+4)
	add	WA,(wUnitAP)
	call	ApplyPlayerAPBuff
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
	; crit chance %: threshold pct*256/100 against Random's low byte
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
	ldb	(wInflictStatus),0	; 0 = status roll missed (texts entry 0), else the status id
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
; first effect-list byte picks the hit-result shape: 0, 1, 2+
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
	call	ApplyPlayerRPBuff
	ld	BC,WA
	ld	DE,WA
	ld	A,(wPlayerLevel)
	ld	W,A
	call	HitMargin
	ld	(wPlayerHitMargin),W
	ld	WA,(XHL+4)
	add	WA,(wUnitAP)
	call	ApplyPlayerAPBuff
	ld	BC,WA
	ld	WA,(wUnitSP)
	call	ApplyPlayerSPBuff
	ld	DE,WA
	ld	A,(wPlayerLevel)
	ld	W,A
	call	DamageRoll
	ld	BC,(XHL+0xE)
	ld	DE,(wUnitAffinity)
	call	ApplyAffinity
	call	ApplyAirbag
	inc	3,WA	; self-hit = ceil(damage / 4)
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
; skip the shape byte, and one more word for shape 1 (?)
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
	ldw	(XIZ+TASK_FUNC),ConfusedPlayerHitResult & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfusedPlayerHitResult >> 16
	ret

c_20A1D6	section	code abs=0x20A1D6

; [code] battle item (wBattleChoice = item id): remove it, "You used <item>", load its effect list (+0x14),
; wAttackEPCost = 0, then its handler from BattleItemJumps
BattleUseItem:
	ld	WA,(wBattleChoice)
	call	RemoveItem
	ld	L,(wBattleChoice)
	call	GetItemName
	ld	(XIZ+0x10),XHL
	ld	XHL,YouUsedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	L,(wBattleChoice)
	call	GetBattleItemEffect
	ld	(XIZ+0x14),XHL
	ldw	(wAttackEPCost),0
	ld	XHL,0
	ld	L,(wBattleChoice)
	sub	L,ITEM_FIXIT1
	sll	2,HL
	add	XHL,BattleItemJumps
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
; [code] handlers for items ITEM_FIXIT1 (38) to ItemMagFlr, in item-id order
BattleItemJumps:
	dl	ItemFixIt1,ItemFixIt2,ItemFixIt3,ItemFixIt4
	dl	ItemFullFx,ShowStatusCured,ItemPowDrv,ItemEField
	dl	ItemSitClr,ItemTurbo,ItemAbsorb,ItemAcidBm
	dl	ItemJammer,ItemMagFlr

c_20A26A	section	code abs=0x20A26A

; [code] Recharge: effect, EP gain of GetRechargeAmount (wRechargePercent % of max EP), no EP cost, then PlayerTurnEnd
BattleRecharge:
	ld	XHL,YouRechargedYourEnergyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,DefaultEnemyAttack+SLOT_EFFECTS	; reuses the default attack's effect list for the charge animation (?)
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	call	GetRechargeAmount
	ld	(XIZ+0x10),WA
	ld	HL,WA
	calr	ShowUnitEPGain
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitEPGainTask
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+TASK_ARG),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20A308	section	code abs=0x20A308

; [code] Flee: Satana can't be fled until the ending or Rank X flag; outside dungeons or when the enemy is
; paralysed it always works; else wFleeChance % -> BattleRetreat, a miss -> "But it chases you", PlayerTurnEnd
TryFlee:
	cpb	(wEnemyId),ENEMY_SATANA
	jr	NZ,TryFlee.skip
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	jr	NZ,TryFlee.skip
	ld	HL,EVENT_STAGE_WON_RANK_X
	call	CheckEventFlag
	jr	NZ,TryFlee.skip
	jr	TryFlee.skip2
TryFlee.skip:
	cpb	(wDungeonBattle),0	; arena / link battles: free retreat
	jr	Z,TryFlee.skip3
	cpb	(wEnemyParalyzed),0
	jr	NZ,TryFlee.skip3
	ld	XHL,YouFledText
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
	jr	C,TryFlee.skip3
TryFlee.skip2:
	ld	XHL,ButChasesYouText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret
TryFlee.skip3:
	ldw	(XIZ+TASK_FUNC),BattleRetreat & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleRetreat >> 16
	ret

c_20A3A7	section	code abs=0x20A3A7

; [code] hit-result shape 0: slide the unit out and back, then miss / effect and shake / crit x2 / no damage
; or damage to the enemy (EnemyHPLossTask) and the status message; sets the inflicted status's bit 7
PlayerHitResult1:
	ld	XHL,UnitSlideOutLeftTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,UnitSlideInShiftedTask
	call	StartChildTask
	ldb	(XHL+TASK_ARG),0xF
	task_wait
	; negative margin = miss
	cpb	(wPlayerHitMargin),0
	jr	PL,PlayerHitResult1.skip
	ld	XHL,YouMissedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret
PlayerHitResult1.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,PlayerHitResult1.skip2
	ld	XHL,ShakeScr2Amp8Task
PlayerHitResult1.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,PlayerHitResult1.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
PlayerHitResult1.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,PlayerHitResult1.skip4
	ld	XHL,YouCantDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	PlayerHitResult1.skip5
PlayerHitResult1.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyHPLossTask
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+TASK_ARG),WA
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,PlayerHitResult1.skip5
	ld	XHL,wEnemyParalyzed-1	; status ids 1-4 index wEnemyParalyzed..; bit 7 = on
	orb	(XHL+A),0x80
PlayerHitResult1.skip5:
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20A55D	section	code abs=0x20A55D

; [code] hit-result shape 1: as PlayerHitResult1, with two PlayNextEffect steps (unit half, then enemy half in view)
; in place of the slide tasks
PlayerHitResult2:
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	cpb	(wPlayerHitMargin),0	; negative margin = miss
	jr	PL,PlayerHitResult2.skip
	ld	XHL,YouMissedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret
PlayerHitResult2.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,PlayerHitResult2.skip2
	ld	XHL,ShakeScr2Amp8Task
PlayerHitResult2.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,PlayerHitResult2.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
PlayerHitResult2.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,PlayerHitResult2.skip4
	ld	XHL,YouCantDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	PlayerHitResult2.skip5
PlayerHitResult2.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyHPLossTask
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+TASK_ARG),WA
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,PlayerHitResult2.skip5
	ld	XHL,wEnemyParalyzed-1
	orb	(XHL+A),0x80
PlayerHitResult2.skip5:
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20A733	section	code abs=0x20A733

; [code] hit-result shape 2+: as PlayerHitResult1 with no slide, enemy half of the screen in view
PlayerHitResult3:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	cpb	(wPlayerHitMargin),0	; negative margin = miss
	jr	PL,PlayerHitResult3.skip
	ld	XHL,YouMissedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret
PlayerHitResult3.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,PlayerHitResult3.skip2
	ld	XHL,ShakeScr2Amp8Task
PlayerHitResult3.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wCritHit),0
	jr	Z,PlayerHitResult3.skip3
	ld	WA,(wPlayerDamage)
	sll	1,WA
	ld	(wPlayerDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
PlayerHitResult3.skip3:
	cpw	(wPlayerDamage),0
	jr	NZ,PlayerHitResult3.skip4
	ld	XHL,YouCantDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	PlayerHitResult3.skip5
PlayerHitResult3.skip4:
	ld	WA,(wPlayerDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyHPLossTask
	call	StartChildTask
	ld	WA,(wPlayerDamage)
	ld	(XHL+TASK_ARG),WA
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,PlayerHitResult3.skip5
	ld	XHL,wEnemyParalyzed-1
	orb	(XHL+A),0x80
PlayerHitResult3.skip5:
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20BF27	section	code abs=0x20BF27

; [code] the enemy's attack while wEnemyConfused (EnemyAttack and EnemyArmAttack resume here, task pointer 0x20BF27, after rolling HitMargin / DamageRoll with the enemy's own RP / SP / affinity as the target's): the player-hit shapes and texts ("dodged the attack" / Critical hit / took no damage / takes damage, EnemyHPLossTask, StatusInflictedTexts) with the enemy's attack results (wEnemyHitMargin, wEnemyCritHit, wEnemyDamage, wEnemyAttackStatus): the enemy hits itself (was PlayerHitResult4)
; [play] seen in play (wEnemyConfused set to 0x80 by hand): "Pumper is confused!!", "Pumper's Makeup!!" with the effect drawn on the Pumper,
; "Pumper takes 15 damage!!", the enemy's HP 176 -> 161 through EnemyHPLossTask, the unit's HP unchanged, then EnemyTurnEnd; 14-15 damage,
; or on a crit "Critical Hit!!" (CriticalHitText2) and 30; a missed status roll (wEnemyAttackStatus 0) prints StatusInflictedTexts[0]
; "Pumper dodged the extra attack!!", a landed one (Makeup, status 4) confuses the enemy itself ("Pumper is confused!!")
ConfusedEnemyHitResult:
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	cpb	(wEnemyHitMargin),0
	jr	PL,ConfusedEnemyHitResult.skip
	ld	XHL,DodgedTheAttackText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
ConfusedEnemyHitResult.skip:
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,ConfusedEnemyHitResult.skip2
	ld	XHL,ShakeScr2Amp8Task
ConfusedEnemyHitResult.skip2:
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0xF
	task_wait
	cpb	(wEnemyCritHit),0
	jr	Z,ConfusedEnemyHitResult.skip3
	ld	WA,(wEnemyDamage)
	sll	1,WA
	ld	(wEnemyDamage),WA
	ld	XHL,CriticalHitText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ConfusedEnemyHitResult.skip3:
	cpw	(wEnemyDamage),0
	jr	NZ,ConfusedEnemyHitResult.skip4
	ld	XHL,TookNoDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jrl	ConfusedEnemyHitResult.skip5
ConfusedEnemyHitResult.skip4:
	ld	WA,(wEnemyDamage)
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyHPLossTask
	call	StartChildTask
	ld	WA,(wEnemyDamage)
	ld	(XHL+TASK_ARG),WA
	ldw	(XHL+0x10),0xF
	task_wait
	cpb	(wEnemyAttackStatus),0xFF
	jr	Z,ConfusedEnemyHitResult.skip5
	cpw	(wEnemyHP),0
	jr	Z,ConfusedEnemyHitResult.skip5
	ld	A,(wEnemyAttackStatus)
	sll	2,A
	ld	XHL,StatusInflictedTexts
	ld	XHL,(XHL+A)
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wEnemyAttackStatus)
	or	A,A
	jr	Z,ConfusedEnemyHitResult.skip5
	ld	XHL,wEnemyParalyzed-1
	orb	(XHL+A),0x80
ConfusedEnemyHitResult.skip5:
	ldw	(XIZ+TASK_FUNC),EnemyTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyTurnEnd >> 16
	ret
