; engine/battle/player_turn.asm: player turn: attack checks, PlayerAttack, items, recharge, flee, the player hit-result messages

c_209E01	section	code abs=0x209E01

; [code] BattleMainMenuJumps entry 3 and the end of the command / item choice (TASK_FUNC 0x9E01): wRoundSecondTurn = 0, then PlayerTurn first when TurnOrderMargin >= 0 (or always when wDungeonBattle = 0 and wBattleMenuCursor = 3), else EnemyTurn
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

; [code] the player's turn (StartBattleRound, EnemyTurnEnd): ComputeStatBuffs, a SCR1 slide task (UnitSlideInShiftedTask as the second turn of the round, else UnitShiftRightTask), then the handler for wBattleMenuCursor from the table BattleMenuJumps (CheckCanAttack, 0x20A1D6, 0x20A26A, 0x20A308)
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
	ldb	(XHL+0xE),0xF
	task_wait
	ld	XHL,0
	ld	L,(wBattleMenuCursor)
	sll	2,HL
	add	XHL,BattleMenuJumps
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
BattleMenuJumps:
	dl	CheckCanAttack,BattleUseItem,BattleRecharge,TryFlee

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
	ldw	(XIZ+TASK_FUNC),ConfusedPlayerHitResult & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ConfusedPlayerHitResult >> 16
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
	ld	XHL,WaitBattleMessageTask
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
	add	XHL,BattleItemJumps
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
BattleItemJumps:
	dl	ItemFixIt1,ItemFixIt2,ItemFixIt3,ItemFixIt4
	dl	ItemFullFx,ShowStatusCured,ItemPowDrv,ItemEField
	dl	ItemSitClr,ItemTurbo,ItemAbsorb,ItemAcidBm
	dl	ItemJammer,ItemMagFlr

c_20A26A	section	code abs=0x20A26A

; [code] YouRechargedYourEnergyText, EP gain message, wAttackEPCost = 0
BattleRecharge:
	ld	XHL,YouRechargedYourEnergyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,DefaultEnemyAttack+SLOT_EFFECTS
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
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
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(wAttackEPCost),0
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
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

; [code] two scroll tasks (UnitSlideOutLeftTask, UnitSlideInShiftedTask), then You missed / Critical hit / can't damage / takes damage; PlayerAttack picks it for f0 = 0
PlayerHitResult1:
	ld	XHL,UnitSlideOutLeftTask
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,UnitSlideInShiftedTask
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
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
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,PlayerHitResult1.skip2
	ld	XHL,ShakeScr2Amp8Task
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,(wInflictStatus)
	or	A,A
	jr	Z,PlayerHitResult1.skip5
	ld	XHL,wEnemyParalyzed-1
	orb	(XHL+A),0x80
PlayerHitResult1.skip5:
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20A55D	section	code abs=0x20A55D

; [code] as PlayerHitResult1 with PlayNextEffect twice (scroll registers set directly) in place of the two scroll tasks; picked for f0 = 1
PlayerHitResult2:
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,PlayNextEffect
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wPlayerHitMargin),0
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
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,PlayerHitResult2.skip2
	ld	XHL,ShakeScr2Amp8Task
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

; [code] as PlayerHitResult1 without the two scroll tasks (wScr1ScrollX/Y set to 0x60 / 0); picked for f0 = 2 and up
PlayerHitResult3:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	cpb	(wPlayerHitMargin),0
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
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,PlayerHitResult3.skip2
	ld	XHL,ShakeScr2Amp8Task
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
	ldw	(XHL+0xE),0
	task_wait
	cpb	(wEnemyCritHit),0
	ld	XHL,ShakeScr2Amp4Task
	jr	Z,ConfusedEnemyHitResult.skip2
	ld	XHL,ShakeScr2Amp8Task
ConfusedEnemyHitResult.skip2:
	call	StartChildTask
	ldw	(XHL+0xE),0xF
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
	ld	(XHL+0xE),WA
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
