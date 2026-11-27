; engine/battle/effects.asm: skill and item effects: stat up/down, full heal, Time Stop, Recvr, Airbag, Full Charge, the battle item handlers

c_20AA47	section	code abs=0x20AA47

; [code] skill status code 5 (SkillEffects): the effect, then for each of AP / SP / RP / MP with turns in the skill
; record (+4 / +6 / +8 / +0xA) its wSkill*UpTurns and "... went up"; PlayerTurnEnd
ShowStatUp:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL	; skip the effect list's hit-shape byte
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	ld	XHL,(XIZ+0x10)
	ld	A,(XHL+4)	; record +4: AP-up turns, 0 = no change
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

; [code] skill code 6: as ShowStatUp for the enemy's wSkillEnemy*DownTurns, "... went down", enemy half in view
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
	ldw	(XHL+TASK_ARG),0
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

; [code] skill code 7: full HP (9999, capped) and every unit status cleared; PlayerTurnEnd
ShowFullHeal:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	ld	XHL,YourHPAreFullyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPGainTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x270F
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

; [code] skill code 8 (August): "Time stopped! Can't move", wTimeStopTurns = record +4; the enemy loses its turns
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
	ldw	(XHL+TASK_ARG),0
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

; [code] skill code 9 (Aqua): "Recvr activated!!": wRecvrActive + 1 (BattleStatusEffects spends it to revive at 9999 HP);
; no effect while one is already set
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
	ldw	(XHL+TASK_ARG),0
	task_wait
	ld	XHL,RecvrActivatedAutoRecoverText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	incb	1,(wRecvrActive)	; caps at 0xFF; unreachable since it is only set from 0 (?)
	ret	NZ
	ldb	(wRecvrActive),0xFF
	ret

c_20ADC4	section	code abs=0x20ADC4

; [code] skill code 10 (Vapor): "Airbag activated! Damage is halved!", wAirbagActive = record +4 (never counted down: the rest of the battle); no effect while active
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
	ldw	(XHL+TASK_ARG),0
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

; [code] skill code 11 (Breath): "Fully charged!! EP costs reduced to 0!!", wFullChargeActive = record +4 (never counted down);
; no effect while active
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
	ldw	(XHL+TASK_ARG),0
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

; [code] FixIt1: ItemFixItHeal of 30 HP (+0x10)
ItemFixIt1:
	ldw	(XIZ+0x10),0x1E
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AEEA	section	code abs=0x20AEEA

; [code] FixIt2: ItemFixItHeal of 50 HP
ItemFixIt2:
	ldw	(XIZ+0x10),0x32
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AEFA	section	code abs=0x20AEFA

; [code] FixIt3: ItemFixItHeal of 100 HP
ItemFixIt3:
	ldw	(XIZ+0x10),0x64
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AF0A	section	code abs=0x20AF0A

; [code] FixIt4: ItemFixItHeal of 150 HP
ItemFixIt4:
	ldw	(XIZ+0x10),0x96
	ldw	(XIZ+TASK_FUNC),ItemFixItHeal & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ItemFixItHeal >> 16
	ret

c_20AF1A	section	code abs=0x20AF1A

; [code] FullFx: the effect, "Your HP are fully restored", UnitHPGainTask of 9999 (capped), PlayerTurnEnd
ItemFullFx:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	ld	XHL,YourHPAreFullyText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ld	XHL,UnitHPGainTask
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0x270F
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20AF8A	section	code abs=0x20AF8A

; [code] FixIt1-4 tail, +0x10 = HP: the effect, the ShowHPGain message, UnitHPGainTask, PlayerTurnEnd
ItemFixItHeal:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
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
	ld	(XHL+TASK_ARG),WA
	ldw	(XHL+0x10),0xF
	task_wait
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20AFFC	section	code abs=0x20AFFC

; [code] Clear item: the effect, "Your status returned to normal", clears paralysis, rust, EP leak and confusion
ShowStatusCured:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
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

; [code] PowDrv: "AP went up", wItemAPUpTurns = 5 (AP +30 % in ComputeStatBuffs; the item text says 15 %); the next three are the same for SP / RP / MP
ItemPowDrv:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
	task_wait
	ld	XHL,APWentUpText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wItemAPUpTurns),5	; 5 turns, counted down in PlayerTurnEnd
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B0B1	section	code abs=0x20B0B1

; [code] EField: "SP went up", wItemSPUpTurns = 5
ItemEField:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
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

; [code] SitClr: "RP went up", wItemRPUpTurns = 5
ItemSitClr:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
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

; [code] Turbo: "MP went up", wItemMPUpTurns = 5
ItemTurbo:
	ld	XHL,(XIZ+0x14)
	inc	1,XHL
	ld	(XIZ+0x14),XHL
	ld	XHL,PlayEffectList
	call	StartChildTask
	ldw	(XHL+TASK_ARG),0
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

; [code] Absorb: "AP went down" on the enemy, wEnemyAPDownTurns = 5 (AP -30 % in ComputeStatBuffs; the item text says 15 %); the next three are the same for
; SP / RP / MP
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
	ldw	(XHL+TASK_ARG),0
	task_wait
	ld	XHL,APWentDownText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldb	(wEnemyAPDownTurns),5	; 5 turns, counted down in EnemyTurnEnd
	ldw	(XIZ+TASK_FUNC),PlayerTurnEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayerTurnEnd >> 16
	ret

c_20B215	section	code abs=0x20B215

; [code] AcidBm: enemy "SP went down", wEnemySPDownTurns = 5
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
	ldw	(XHL+TASK_ARG),0
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

; [code] Jammer: enemy "RP went down", wEnemyRPDownTurns = 5
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
	ldw	(XHL+TASK_ARG),0
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

; [code] MagFlr: enemy "MP went down", wEnemyMPDownTurns = 5
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
	ldw	(XHL+TASK_ARG),0
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
