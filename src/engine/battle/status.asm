; engine/battle/status.asm: turn ends: status recovery rolls, turn counters, BattleStatusEffects (rust, paralysis, EP leak, confusion)

c_2083FB	section	code abs=0x2083FB

; [code] L = turns -> L = StatusRecovery[turns]
GetStatusRecovery:
	ld	H,0
	extz	XHL
	add	XHL,StatusRecovery
	ld	L,(XHL)
	ld	H,0
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
	cpb	(wSkillAPUpTurns),0
	jr	Z,PlayerTurnEnd.skip4
	decb	1,(wSkillAPUpTurns)
PlayerTurnEnd.skip4:
	cpb	(wSkillSPUpTurns),0
	jr	Z,PlayerTurnEnd.skip5
	decb	1,(wSkillSPUpTurns)
PlayerTurnEnd.skip5:
	cpb	(wSkillRPUpTurns),0
	jr	Z,PlayerTurnEnd.skip6
	decb	1,(wSkillRPUpTurns)
PlayerTurnEnd.skip6:
	cpb	(wSkillMPUpTurns),0
	jr	Z,PlayerTurnEnd.skip7
	decb	1,(wSkillMPUpTurns)
PlayerTurnEnd.skip7:
	cpb	(wItemAPUpTurns),0
	jr	Z,PlayerTurnEnd.skip8
	decb	1,(wItemAPUpTurns)
PlayerTurnEnd.skip8:
	cpb	(wItemSPUpTurns),0
	jr	Z,PlayerTurnEnd.skip9
	decb	1,(wItemSPUpTurns)
PlayerTurnEnd.skip9:
	cpb	(wItemRPUpTurns),0
	jr	Z,PlayerTurnEnd.skip10
	decb	1,(wItemRPUpTurns)
PlayerTurnEnd.skip10:
	cpb	(wItemMPUpTurns),0
	jr	Z,PlayerTurnEnd.skip11
	decb	1,(wItemMPUpTurns)
PlayerTurnEnd.skip11:
	ld	XHL,UnitEPLossTask
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
	ldw	(XIZ+TASK_FUNC),BattleStatusEffects & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleStatusEffects >> 16
	ret
PlayerTurnEnd.skip13:
	cpb	(wRoundSecondTurn),0
	ld	XHL,BattleStatusEffects
	jr	NZ,PlayerTurnEnd.skip14
	incb	1,(wRoundSecondTurn)
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
	cpb	(wEnemyAPDownTurns),0
	jr	Z,EnemyTurnEnd.skip4
	decb	1,(wEnemyAPDownTurns)
EnemyTurnEnd.skip4:
	cpb	(wSkillEnemyAPDownTurns),0
	jr	Z,EnemyTurnEnd.skip5
	decb	1,(wSkillEnemyAPDownTurns)
EnemyTurnEnd.skip5:
	cpb	(wEnemySPUpTurns),0
	jr	Z,EnemyTurnEnd.skip6
	decb	1,(wEnemySPUpTurns)
EnemyTurnEnd.skip6:
	cpb	(wEnemySPDownTurns),0
	jr	Z,EnemyTurnEnd.skip7
	decb	1,(wEnemySPDownTurns)
EnemyTurnEnd.skip7:
	cpb	(wSkillEnemySPDownTurns),0
	jr	Z,EnemyTurnEnd.skip8
	decb	1,(wSkillEnemySPDownTurns)
EnemyTurnEnd.skip8:
	cpb	(wEnemyRPDownTurns),0
	jr	Z,EnemyTurnEnd.skip9
	decb	1,(wEnemyRPDownTurns)
EnemyTurnEnd.skip9:
	cpb	(wSkillEnemyRPDownTurns),0
	jr	Z,EnemyTurnEnd.skip10
	decb	1,(wSkillEnemyRPDownTurns)
EnemyTurnEnd.skip10:
	cpb	(wEnemyMPDownTurns),0
	jr	Z,EnemyTurnEnd.skip11
	decb	1,(wEnemyMPDownTurns)
EnemyTurnEnd.skip11:
	cpb	(wSkillEnemyMPDownTurns),0
	jr	Z,EnemyTurnEnd.skip12
	decb	1,(wSkillEnemyMPDownTurns)
EnemyTurnEnd.skip12:
	cpb	(wTimeStopTurns),0
	jr	Z,EnemyTurnEnd.skip13
	decb	1,(wTimeStopTurns)
EnemyTurnEnd.skip13:
	ld	XHL,EnemyEPLossTask
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
	ldw	(XIZ+TASK_FUNC),BattleStatusEffects & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleStatusEffects >> 16
	ret
EnemyTurnEnd.skip15:
	cpb	(wRoundSecondTurn),0
	ld	XHL,BattleStatusEffects
	jr	NZ,EnemyTurnEnd.skip16
	incb	1,(wRoundSecondTurn)
	ld	XHL,PlayerTurn
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
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,YoureTotallyRustedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	WA,(wUnitMaxHP)
	add	WA,0x13
	extz	XWA
	div	XWA,0x14
	ld	(XIZ+0x10),WA
	ld	XHL,PlayerTakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
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
	ldw	(XIZ+TASK_FUNC),BattleDefeat & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleDefeat >> 16
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
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,Data_22541D
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	HL,(XIZ+0x10)
	calr	ShowHPGain
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPGainTask
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	jrl	BattleStatusEffects.skip11
BattleStatusEffects.skip5:
	cpb	(wStatusEPLeak),0
	jrl	Z,BattleStatusEffects.skip7
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,YoureLeakingEnergyText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitEPLossTask
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitEPGainTask
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
BattleStatusEffects.skip9:
	cpb	(wStatusParalyzed),0
	jr	Z,BattleStatusEffects.skip10
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,YoureParalyzedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
BattleStatusEffects.skip10:
	cpb	(wStatusConfused),0
	jr	Z,BattleStatusEffects.skip11
	ldb	(wScr1ScrollX),0xC0
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0x60
	ldb	(wScr2ScrollY),0
	ld	XHL,YoureConfusedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
BattleStatusEffects.skip11:
	cpb	(wEnemyRusted),0
	jrl	Z,BattleStatusEffects.skip12
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ld	XHL,IsTotallyRustedText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	WA,(wEnemyHP)
	add	WA,0x13
	extz	XWA
	div	XWA,0x14
	ld	(XIZ+0x10),WA
	ld	XHL,TakesDamageText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyHPLossTask
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
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ld	XHL,IsLeakingEnergyText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,EnemyEPLossTask
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
BattleStatusEffects.skip14:
	cpb	(wEnemyParalyzed),0
	jr	Z,BattleStatusEffects.skip15
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ld	XHL,IsParalyzedText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
BattleStatusEffects.skip15:
	cpb	(wEnemyConfused),0
	jr	Z,BattleStatusEffects.skip16
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ld	XHL,IsConfusedText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
BattleStatusEffects.skip16:
	ldw	(XIZ+TASK_FUNC),DrawBattleScreen & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),DrawBattleScreen >> 16
	ret
BattleStatusEffects.skip17:
	ldw	(XIZ+TASK_FUNC),BattleVictory & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleVictory >> 16
	ret
