; engine/battle/end.asm: battle end: victory (exp, GP, drop), defeat, retreat, BattleEnd, HP/EP gain message pickers

c_20CAE0	section	code abs=0x20CAE0

; [code] You win, EXP, GP, drop, level up
BattleVictory:
	ld	XHL,ShakeScr2Amp8Task
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
	call	FillScr2Rect
	ld	WA,0xF
	call	PlayMusic
	ld	WA,0x2F
	call	SoundCommand
	ld	XHL,YouWinText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
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
	ld	XHL,WaitBattleMessageTask
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
	ld	XHL,WaitBattleMessageTask
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	incw	1,(XIZ+TASK_ARG)
BattleVictory.skip6:
	cpw	(XIZ+TASK_ARG),0
	jr	Z,BattleVictory.loop
	ld	XHL,WaitText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
BattleVictory.loop:
	call	TryLevelUp
	jr	NC,BattleVictory.skip7
	ld	WA,0xAC
	call	SoundCommand
	ld	XHL,YouGainedALevelText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	jr	BattleVictory.loop
BattleVictory.skip7:
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),BattleEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleEnd >> 16
	ret

c_20CC9C	section	code abs=0x20CC9C

; [code] You lost / You are unable to move
BattleDefeat:
	ld	XHL,ShakeScr1Amp8Task
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
	call	FillScr1Rect
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(wUnitHP),(wUnitMaxHP)
	ldw	(wUnitEP),(wUnitMaxEP)
	ldw	(XIZ+TASK_ARG),3
	ldw	(XIZ+TASK_FUNC),BattleEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleEnd >> 16
	ret

c_20CD32	section	code abs=0x20CD32

; [code] player escapes: reached from TryFlee (TASK_FUNC 0xCD32) on a successful flee or always when 0x5DDA = 0; shows YouGaveUpText (0x5DDA = 0) or 0x22599D "You were able to retreat..." (decoded), then BattleEnd with TASK_ARG 2
BattleRetreat:
	ld	XHL,UnitSlideOutRightTask
	call	StartChildTask
	ldb	(XHL+0xE),0xF
	task_wait
	cpb	(wDungeonBattle),0
	ld	XHL,YouGaveUpText
	jr	Z,BattleRetreat.skip
	ld	XHL,YouWereAbleToText
BattleRetreat.skip:
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_ARG),2
	ldw	(XIZ+TASK_FUNC),BattleEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleEnd >> 16
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
	call	ClearTilemaps
	call	ClearSprites
	call	InitTextBoxes
	ld	A,0
	ld	(0x5A76),A
	ld	(wScr1ScrollX),A
	ld	(wScr1ScrollY),A
	ld	(0x584F),A
	ld	(0x5851),A
	ld	(wScr2ScrollX),A
	ld	(wScr2ScrollY),A
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
