; engine/battle/effects.asm: skill and item effects: stat up/down, full heal, Time Stop, Recvr, Airbag, Full Charge, the battle item handlers

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
	ld	(wSkillAPUpTurns),A
	ld	XHL,APWentUpText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatUp.skip:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+6)
	or	A,A
	jr	Z,ShowStatUp.skip2
	ld	(wSkillSPUpTurns),A
	ld	XHL,SPWentUpText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatUp.skip2:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+8)
	or	A,A
	jr	Z,ShowStatUp.skip3
	ld	(wSkillRPUpTurns),A
	ld	XHL,RPWentUpText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatUp.skip3:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0xA)
	or	A,A
	jr	Z,ShowStatUp.skip4
	ld	(wSkillMPUpTurns),A
	ld	XHL,MPWentUpText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatUp.skip4:
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20AB2E	section	code abs=0x20AB2E

; [code] effect 6: "... went down" messages
ShowStatDown:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
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
	ld	(wSkillEnemyAPDownTurns),A
	ld	XHL,APWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatDown.skip:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+6)
	or	A,A
	jr	Z,ShowStatDown.skip2
	ld	(wSkillEnemySPDownTurns),A
	ld	XHL,SPWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatDown.skip2:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+8)
	or	A,A
	jr	Z,ShowStatDown.skip3
	ld	(wSkillEnemyRPDownTurns),A
	ld	XHL,RPWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatDown.skip3:
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+0xA)
	or	A,A
	jr	Z,ShowStatDown.skip4
	ld	(wSkillEnemyMPDownTurns),A
	ld	XHL,MPWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
ShowStatDown.skip4:
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPGainTask
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ld	XHL,YourStatusReturnedToText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusRust),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20ACCB	section	code abs=0x20ACCB

; [code] effect 8: "Time stopped! Can't move" (August)
SkillTimeStop:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,TimeStoppedCantMoveText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	ld	(wTimeStopTurns),A
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20AD38	section	code abs=0x20AD38

; [code] effect 9: "Recvr activated!! Auto-recover at 0 HP!!" (Aqua); once per battle
SkillRecvr:
	cpb	(wRecvrActive),0
	jr	Z,SkillRecvr.skip
	ld	XHL,NoEffectText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	ld	(wAirbagActive),A
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20AE4F	section	code abs=0x20AE4F

; [code] effect 11: "Fully charged!! EP costs reduced to 0!!" (Breath); turns = skill s04
SkillFullCharge:
	cpb	(wFullChargeActive),0
	jr	Z,SkillFullCharge.skip
	ld	XHL,NoEffectText2
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)
	ld	(wFullChargeActive),A
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20AEDA	section	code abs=0x20AEDA

; [code] handler table BattleItemJumps entry 1 (item 38 FixIt1): +0x10 = 30, then ItemFixItHeal
ItemFixIt1:
	ldw	(XIZ+0x10),0x1E
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AEEA	section	code abs=0x20AEEA

; [code] handler table BattleItemJumps entry 2 (item 39 FixIt2): +0x10 = 50, then ItemFixItHeal
ItemFixIt2:
	ldw	(XIZ+0x10),0x32
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AEFA	section	code abs=0x20AEFA

; [code] handler table BattleItemJumps entry 3 (item 40 FixIt3): +0x10 = 100, then ItemFixItHeal
ItemFixIt3:
	ldw	(XIZ+0x10),0x64
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AF0A	section	code abs=0x20AF0A

; [code] handler table BattleItemJumps entry 4 (item 41 FixIt4): +0x10 = 150, then ItemFixItHeal
ItemFixIt4:
	ldw	(XIZ+0x10),0x96
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AF1A	section	code abs=0x20AF1A

; [code] entry 5 of BattleUseItem's handler table BattleItemJumps (item 42 FullFx): PlayEffectList, YourHPAreFullyText, HP gain task UnitHPGainTask with +0xE = 9999, then PlayerTurnEnd (0xB34D)
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPGainTask
	call	StartChildTask
	ldw	(XHL+0xE),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20AF8A	section	code abs=0x20AF8A

; [code] resumed by ItemFixIt1-4 (TASK_FUNC 0xAF8A): PlayEffectList, ShowHPGain message for +0x10 HP, UnitHPGainTask of +0x10, then PlayerTurnEnd (0xB34D)
ItemFixItHeal:
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPGainTask
	call	StartChildTask
	ld	WA,(XIZ+0x10)
	ld	(XHL+0xE),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusRust),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B05D	section	code abs=0x20B05D

; [code] handler table BattleItemJumps entry 7 (item 44 PowDrv "AP +15% (temp)"): APWentUpText, 0x5D9B = 5, PlayerTurnEnd
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wItemAPUpTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B0B1	section	code abs=0x20B0B1

; [code] handler table BattleItemJumps entry 8 (item 45 EField "SP +15% (temp)"): SPWentUpText, 0x5D9C = 5, PlayerTurnEnd
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wItemSPUpTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B105	section	code abs=0x20B105

; [code] handler table BattleItemJumps entry 9 (item 46 SitClr "RP +15% (temp)"): RPWentUpText, 0x5D9D = 5, PlayerTurnEnd
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wItemRPUpTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B159	section	code abs=0x20B159

; [code] handler table BattleItemJumps entry 10 (item 47 Turbo "MP +15% (temp)"): MPWentUpText, 0x5D9E = 5, PlayerTurnEnd
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
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wItemMPUpTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B1AD	section	code abs=0x20B1AD

; [code] handler table BattleItemJumps entry 11 (item 48 Absorb "Enemy AP -15%"): APWentDownText, 0x5DC8 = 5, PlayerTurnEnd
ItemAbsorb:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,APWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wEnemyAPDownTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B215	section	code abs=0x20B215

; [code] handler table BattleItemJumps entry 12 (item 49 AcidBm "Enemy SP -15%"): SPWentDownText, 0x5DC9 = 5, PlayerTurnEnd
ItemAcidBm:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,SPWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wEnemySPDownTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B27D	section	code abs=0x20B27D

; [code] handler table BattleItemJumps entry 13 (item 50 Jammer "Enemy RP -15%"): RPWentDownText, 0x5DCA = 5, PlayerTurnEnd
ItemJammer:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,RPWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wEnemyRPDownTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B2E5	section	code abs=0x20B2E5

; [code] handler table BattleItemJumps entry 14 (item 51 MagFlr "Enemy MP -15%"): MPWentDownText, 0x5DCB = 5, PlayerTurnEnd
ItemMagFlr:
	ldb	(wScr1ScrollX),0x60
	ldb	(wScr1ScrollY),0
	ldb	(wScr2ScrollX),0
	ldb	(wScr2ScrollY),0
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+0xE),0
	task_wait
	ld	XHL,MPWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wEnemyMPDownTurns),5
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret
