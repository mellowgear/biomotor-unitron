; engine/battle/tasks.asm: battle tasks: unit/enemy HP and EP change tasks, screen shake, WaitBattleMessageTask, PlayEffectList / PlayNextEffect and the battle effect animation player

c_208B74	section	code abs=0x208B74

; Task: fades in from black over TASK_ARG frames (wFadeLevel -0x7F * n / TASK_ARG, n down to 0), then ends; BattleStart, 0xF frames [code]
FadeInFromBlackTask:
	ld	WA,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),WA
	ldw	(XIZ+TASK_FUNC),FadeInFromBlackTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),FadeInFromBlackTask.resume >> 16
FadeInFromBlackTask.resume:
	ld	WA,0x7F
	mul	XWA,(XIZ+0x10)
	div	XWA,(XIZ+TASK_ARG)
	neg	A
	ld	(wFadeLevel),A
	cpw	(XIZ+0x10),0
	jp	Z,EndTask
	decw	1,(XIZ+0x10)
	ret

c_208BA1	section	code abs=0x208BA1

; Task: fades out to black over TASK_ARG frames, then ends; BattleStart, 0xF frames [code]
FadeOutToBlackTask:
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),FadeOutToBlackTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),FadeOutToBlackTask.resume >> 16
FadeOutToBlackTask.resume:
	ld	WA,0x7F
	mul	XWA,(XIZ+0x10)
	div	XWA,(XIZ+TASK_ARG)
	neg	A
	ld	(wFadeLevel),A
	ld	WA,(XIZ+TASK_ARG)
	cp	(XIZ+0x10),WA
	jp	NC,EndTask
	incw	1,(XIZ+0x10)
	ret

c_208BCE	section	code abs=0x208BCE

; Task: fades in from white over TASK_ARG frames, then ends [code]
FadeInFromWhiteTask:
	ld	WA,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),WA
	ldw	(XIZ+TASK_FUNC),FadeInFromWhiteTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),FadeInFromWhiteTask.resume >> 16
FadeInFromWhiteTask.resume:
	ld	WA,0x7F
	mul	XWA,(XIZ+0x10)
	div	XWA,(XIZ+TASK_ARG)
	ld	(wFadeLevel),A
	cpw	(XIZ+0x10),0
	jp	Z,EndTask
	decw	1,(XIZ+0x10)
	ret

c_208BF9	section	code abs=0x208BF9

; Task: fades out to white over TASK_ARG frames, then ends [code]
FadeOutToWhiteTask:
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),FadeOutToWhiteTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),FadeOutToWhiteTask.resume >> 16
FadeOutToWhiteTask.resume:
	ld	WA,0x7F
	mul	XWA,(XIZ+0x10)
	div	XWA,(XIZ+TASK_ARG)
	ld	(wFadeLevel),A
	ld	WA,(XIZ+TASK_ARG)
	cp	(XIZ+0x10),WA
	jp	NC,EndTask
	incw	1,(XIZ+0x10)
	ret

c_208C24	section	code abs=0x208C24

; Task: shakes SCR1 (the unit) at amplitude 4 for TASK_ARG frames: the unit is hit, or a rust step [code]
ShakeScr1Amp4Task:
	ldb	(wShakeFlags),2
	ldw	(XIZ+0x10),4
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C38	section	code abs=0x208C38

; ShakeScr1Amp4Task at amplitude 8: critical hits on the unit, BattleDefeat [code]
ShakeScr1Amp8Task:
	ldb	(wShakeFlags),2
	ldw	(XIZ+0x10),8
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C4C	section	code abs=0x208C4C

; Task: shakes SCR2 (the enemy) at amplitude 4 for TASK_ARG frames: the enemy is hit, BossEncounter, places.asm [code]
ShakeScr2Amp4Task:
	ldb	(wShakeFlags),4
	ldw	(XIZ+0x10),4
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C60	section	code abs=0x208C60

; ShakeScr2Amp4Task at amplitude 8: critical hits on the enemy, BattleVictory [code]
ShakeScr2Amp8Task:
	ldb	(wShakeFlags),4
	ldw	(XIZ+0x10),8
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C74	section	code abs=0x208C74

; Shake body: wShakeX / wShakeY = RandomRange(2 * amp - 1) - amp (amp +0x10) for TASK_ARG frames, then clears the shake and ends [code]
ScreenShakeTask:
	ld	WA,(XIZ+0x10)
	sll	1,WA
	dec	1,WA
	ld	(XIZ+0x12),WA
	call	RandomRange
	sub	WA,(XIZ+0x10)
	ld	(wShakeX),A
	ld	WA,(XIZ+0x12)
	call	RandomRange
	sub	WA,(XIZ+0x10)
	ld	(wShakeY),A
	decw	1,(XIZ+TASK_ARG)
	cpw	(XIZ+TASK_ARG),0
	ret	NZ
	ldb	(wShakeFlags),0
	ldb	(wShakeX),0
	ldb	(wShakeY),0
	call	EndTask
	ret

c_208CB6	section	code abs=0x208CB6

; Task for the whole battle (BattleStart keeps its slot in BATTLE_HP_EP_TASK): redraws in box 1 each of unit HP / EP and
; enemy HP / EP that changed since the last frame (+0x10..+0x16), as a bar and a number; enemy values of 1000 or more show " ? " [code]
BattleHPEPDisplayTask:
	ld	A,1
	call	GetTextBox
	ld	(XIZ+TASK_ARG),WA
	; impossible values force the first redraw
	ld	WA,0x8000
	ld	(XIZ+0x10),WA
	ld	(XIZ+0x12),WA
	ld	(XIZ+0x14),WA
	ld	(XIZ+0x16),WA
	ldw	(XIZ+TASK_FUNC),BattleHPEPDisplayTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleHPEPDisplayTask.resume >> 16
BattleHPEPDisplayTask.resume:
	ld	XWA,0
	ld	WA,(XIZ+TASK_ARG)
	; box 1 not open yet: start over
	or	WA,WA
	jp	Z,BattleHPEPDisplayTask
	ld	BC,(XIZ+0x10)
	cp	BC,(wUnitHP)
	jr	Z,BattleHPEPDisplayTask.skip
	ldw	(XIZ+0x10),(wUnitHP)
	ld	C,0xF
	ld	E,0
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	HL,(wUnitMaxHP)
	ld	BC,(wUnitHP)
	ld	QC,5
	call	DrawBarTilesAt
	ld	C,0xB
	ld	E,0
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	BC,(wUnitHP)
	call	RenderNumberTiles
BattleHPEPDisplayTask.skip:
	ld	BC,(XIZ+0x12)
	cp	BC,(wUnitEP)
	jr	Z,BattleHPEPDisplayTask.skip2
	ldw	(XIZ+0x12),(wUnitEP)
	ld	C,0xF
	ld	E,1
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	HL,(wUnitMaxEP)
	ld	BC,(wUnitEP)
	ld	QC,5
	call	DrawBarTilesAt
	ld	C,0xB
	ld	E,1
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	BC,(wUnitEP)
	call	RenderNumberTiles
BattleHPEPDisplayTask.skip2:
	ld	BC,(XIZ+0x14)
	cp	BC,(wEnemyHP)
	jr	Z,BattleHPEPDisplayTask.skip3
	ldw	(XIZ+0x14),(wEnemyHP)
	ld	C,0
	ld	E,0
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	HL,(wEnemyMaxHP)
	ld	BC,(wEnemyHP)
	ld	QC,5
	call	DrawBarTilesReversedAt
	ld	C,6
	ld	E,0
	call	SetTextBoxCursorXWA
	; blank or " ? " first, the number on top under 1000
	ld	XHL,QuestionMarkText
	call	DrawString
	cpw	(wEnemyHP),0x3E8
	jr	NC,BattleHPEPDisplayTask.skip3
	ld	C,6
	ld	E,0
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	BC,(wEnemyHP)
	call	RenderNumberTiles
BattleHPEPDisplayTask.skip3:
	ld	BC,(XIZ+0x16)
	cp	BC,(wEnemyEP)
	jr	Z,BattleHPEPDisplayTask.done
	ldw	(XIZ+0x16),(wEnemyEP)
	ld	C,0
	ld	E,1
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	HL,(wEnemyMaxEP)
	ld	BC,(wEnemyEP)
	ld	QC,5
	call	DrawBarTilesReversedAt
	ld	C,6
	ld	E,1
	call	SetTextBoxCursorXWA
	ld	XHL,QuestionMarkText
	call	DrawString
	cpw	(wEnemyEP),0x3E8
	jr	NC,BattleHPEPDisplayTask.done
	ld	C,6
	ld	E,1
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	BC,(wEnemyEP)
	call	RenderNumberTiles
BattleHPEPDisplayTask.done:
	ret
; Shown for enemy HP / EP of 1000 or more [code]
QuestionMarkText:
	text " ? "
	done

c_208E0F	section	code abs=0x208E0F

; Task: raises wUnitHP by TASK_ARG (capped at wUnitMaxHP) linearly over +0x10 frames, then ends [code]
UnitHPGainTask:
	ld	WA,(wUnitHP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wUnitMaxHP)
	jr	LE,UnitHPGainTask.skip
	ld	WA,(wUnitMaxHP)
	sub	WA,(wUnitHP)
	jr	Z,UnitHPGainTask.skip2
	ld	(XIZ+TASK_ARG),WA
UnitHPGainTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitHP)
	ldw	(XIZ+TASK_FUNC),UnitHPGainTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitHPGainTask.resume >> 16
UnitHPGainTask.resume:
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wUnitHP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
UnitHPGainTask.skip2:
	call	EndTask
	ret

c_208E5D	section	code abs=0x208E5D

; Task: lowers wUnitHP by TASK_ARG (capped at the HP left) over +0x10 frames, then ends; hit damage and status.asm [code]
UnitHPLossTask:
	ld	WA,(wUnitHP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,UnitHPLossTask.skip
	ld	(XIZ+TASK_ARG),WA
UnitHPLossTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitHP)
	ldw	(XIZ+TASK_FUNC),UnitHPLossTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitHPLossTask.resume >> 16
UnitHPLossTask.resume:
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	neg	WA
	add	WA,(XIZ+0x14)
	ld	(wUnitHP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
	call	EndTask
	ret

c_208E9F	section	code abs=0x208E9F

; UnitHPGainTask on wUnitEP; BattleRecharge with the GetRechargeAmount gain over 0xF frames [code]
UnitEPGainTask:
	ld	WA,(wUnitEP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wUnitMaxEP)
	jr	LE,UnitEPGainTask.skip
	ld	WA,(wUnitMaxEP)
	sub	WA,(wUnitEP)
	jr	Z,UnitEPGainTask.skip2
	ld	(XIZ+TASK_ARG),WA
UnitEPGainTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitEP)
	ldw	(XIZ+TASK_FUNC),UnitEPGainTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitEPGainTask.resume >> 16
UnitEPGainTask.resume:
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wUnitEP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
UnitEPGainTask.skip2:
	call	EndTask
	ret

c_208EED	section	code abs=0x208EED

; UnitHPLossTask on wUnitEP [code]
UnitEPLossTask:
	ld	WA,(wUnitEP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,UnitEPLossTask.skip
	ld	(XIZ+TASK_ARG),WA
UnitEPLossTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitEP)
	ldw	(XIZ+TASK_FUNC),UnitEPLossTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitEPLossTask.resume >> 16
UnitEPLossTask.resume:
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	neg	WA
	add	WA,(XIZ+0x14)
	ld	(wUnitEP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
	call	EndTask
	ret

c_208F2F	section	code abs=0x208F2F

; UnitHPGainTask on wEnemyHP [code]
EnemyHPGainTask:
	ld	WA,(wEnemyHP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wEnemyMaxHP)
	jr	LE,EnemyHPGainTask.skip
	ld	WA,(wEnemyMaxHP)
	sub	WA,(wEnemyHP)
	jr	Z,EnemyHPGainTask.skip2
	ld	(XIZ+TASK_ARG),WA
EnemyHPGainTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyHP)
	ldw	(XIZ+TASK_FUNC),EnemyHPGainTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyHPGainTask.resume >> 16
EnemyHPGainTask.resume:
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wEnemyHP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
EnemyHPGainTask.skip2:
	call	EndTask
	ret

c_208F7D	section	code abs=0x208F7D

; UnitHPLossTask on wEnemyHP [code]
EnemyHPLossTask:
	ld	WA,(wEnemyHP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,EnemyHPLossTask.skip
	ld	(XIZ+TASK_ARG),WA
EnemyHPLossTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyHP)
	ldw	(XIZ+TASK_FUNC),EnemyHPLossTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyHPLossTask.resume >> 16
EnemyHPLossTask.resume:
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	neg	WA
	add	WA,(XIZ+0x14)
	ld	(wEnemyHP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
	call	EndTask
	ret

c_208FBF	section	code abs=0x208FBF

; UnitHPGainTask on wEnemyEP [code]
EnemyEPGainTask:
	ld	WA,(wEnemyEP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wEnemyMaxEP)
	jr	LE,EnemyEPGainTask.skip
	ld	WA,(wEnemyMaxEP)
	sub	WA,(wEnemyEP)
	jr	Z,EnemyEPGainTask.skip2
	ld	(XIZ+TASK_ARG),WA
EnemyEPGainTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyEP)
	ldw	(XIZ+TASK_FUNC),EnemyEPGainTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyEPGainTask.resume >> 16
EnemyEPGainTask.resume:
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wEnemyEP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
EnemyEPGainTask.skip2:
	call	EndTask
	ret

c_20900D	section	code abs=0x20900D

; UnitHPLossTask on wEnemyEP [code]
EnemyEPLossTask:
	ld	WA,(wEnemyEP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,EnemyEPLossTask.skip
	ld	(XIZ+TASK_ARG),WA
EnemyEPLossTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyEP)
	ldw	(XIZ+TASK_FUNC),EnemyEPLossTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyEPLossTask.resume >> 16
EnemyEPLossTask.resume:
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

; Task: the unit (SCR1, X 0x60 -> 0xC0) enters from the right and stops 64 px right of home, next to the enemy, over TASK_ARG
; frames (at once with animation off); PlayerHitResult1 after UnitSlideOutLeftTask, PlayerTurn when moving second [code][play]
UnitSlideInShiftedTask:
	ldb	(wScr1ScrollY),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),UnitSlideInShiftedTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitSlideInShiftedTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,UnitSlideInShiftedTask.skip
	ldb	(XIZ+0x10),0
UnitSlideInShiftedTask.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	add	A,0xC0
	ld	(wScr1ScrollX),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_209089	section	code abs=0x209089

; Task: the unit slides in from the right to home (SCR1 X 0x60 -> 0) over TASK_ARG frames; DrawBattleScreen, 0x14 frames [code][play]
UnitSlideInTask:
	ldb	(wScr1ScrollY),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),UnitSlideInTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitSlideInTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,UnitSlideInTask.skip
	ldb	(XIZ+0x10),0
UnitSlideInTask.skip:
	ld	A,0xA0
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	ld	(wScr1ScrollX),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_2090C0	section	code abs=0x2090C0

; Task: the unit leaves to the left from 64 px right of home (SCR1 X 0xC0 -> 0x60) over TASK_ARG frames; PlayerHitResult1 [code][play]
UnitSlideOutLeftTask:
	ldb	(wScr1ScrollY),0
	ldb	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),UnitSlideOutLeftTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitSlideOutLeftTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,UnitSlideOutLeftTask.skip
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
UnitSlideOutLeftTask.skip:
	ld	A,0xA0
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	add	A,0xC0
	ld	(wScr1ScrollX),A
	incb	1,(XIZ+0x10)
	ld	A,(XIZ+0x10)
	cp	A,(XIZ+TASK_ARG)
	jp	GT,EndTask
	ret

c_2090FE	section	code abs=0x2090FE

; Task: the unit leaves to the right from 64 px right of home (SCR1 X 0xC0 -> 0x60) over TASK_ARG frames; BattleRetreat [code][play]
UnitSlideOutRightTask:
	ldb	(wScr1ScrollY),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),UnitSlideOutRightTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitSlideOutRightTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,UnitSlideOutRightTask.skip
	ldb	(XIZ+0x10),0
UnitSlideOutRightTask.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	add	A,0x60
	ld	(wScr1ScrollX),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_209136	section	code abs=0x209136

; Task: the unit moves 64 px right of home (SCR1 X 0 -> 0xC0) over TASK_ARG frames; PlayerTurn when moving first [code][play]
UnitShiftRightTask:
	ldb	(wScr1ScrollY),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),UnitShiftRightTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),UnitShiftRightTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,UnitShiftRightTask.skip
	ldb	(XIZ+0x10),0
UnitShiftRightTask.skip:
	ld	A,0x40
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	add	A,0xC0
	ld	(wScr1ScrollX),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_20916E	section	code abs=0x20916E

; Task: the enemy (SCR2, X 0x60 -> 0) slides in from the left over TASK_ARG frames; the encounter, EnemyTurn, EnemyHitResult2 [code][play]
EnemySlideInTask:
	ldb	(wScr2ScrollY),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),EnemySlideInTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemySlideInTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,EnemySlideInTask.skip
	ldb	(XIZ+0x10),0
EnemySlideInTask.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	ld	(wScr2ScrollX),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_2091A3	section	code abs=0x2091A3

; Task: the enemy leaves to the left (SCR2 X 0 -> 0x60) over TASK_ARG frames; after the encounter text, EnemyFleeSucceeded [code][play]
EnemySlideOutTask:
	ldb	(wScr2ScrollY),0
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
	ldw	(XIZ+TASK_FUNC),EnemySlideOutTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemySlideOutTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,EnemySlideOutTask.skip
	ldb	(XIZ+0x10),0
EnemySlideOutTask.skip:
	ld	A,0x60
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	add	A,0x60
	ld	(wScr2ScrollX),A
	decb	1,(XIZ+0x10)
	jp	MI,EndTask
	ret

c_2091DD	section	code abs=0x2091DD

; Task: the enemy leaves to the right (SCR2 X 0 -> 0x60 via -0xA0) over TASK_ARG frames; EnemyHitResult2 [code][play]
EnemySlideOutRightTask:
	ldb	(wScr2ScrollY),0
	ldb	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),EnemySlideOutRightTask.skip & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemySlideOutRightTask.skip >> 16
	cpb	(wOptionAnimation),0
	jr	NZ,EnemySlideOutRightTask.skip
	ld	A,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),A
EnemySlideOutRightTask.skip:
	ld	A,0xA0
	mul	WA,(XIZ+0x10)
	div	WA,(XIZ+TASK_ARG)
	neg	A
	ld	(wScr2ScrollX),A
	incb	1,(XIZ+0x10)
	ld	A,(XIZ+0x10)
	cp	A,(XIZ+TASK_ARG)
	jp	GT,EndTask
	ret

c_20921A	section	code abs=0x20921A

; Task after each battle ShowMessage: waits for box 0 to finish its text, A or B printing the rest at once, then ends [code]
WaitBattleMessageTask:
	ld	A,0
	call	GetTextBox
	ld	(XIZ+TASK_ARG),XWA
	ldw	(XIZ+TASK_FUNC),WaitBattleMessageTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WaitBattleMessageTask.resume >> 16
WaitBattleMessageTask.resume:
	ld	XWA,(XIZ+TASK_ARG)
	ld	L,(wJoyPressed)
	and	L,0x30
	jr	Z,WaitBattleMessageTask.skip
	ldb	(XWA+0x10),0
WaitBattleMessageTask.skip:
	ld	XHL,(XWA+8)
	or	XHL,XHL
	ret	NZ
	ldw	(XIZ+TASK_FUNC),WaitBattleMessageEnd & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WaitBattleMessageEnd >> 16
	ret

c_20924F	section	code abs=0x20924F

; WaitBattleMessageTask's last state: ends it [code]
WaitBattleMessageEnd:
	call	EndTask
	ret

c_209254	section	code abs=0x209254

; Task: plays each effect id of the parent's list (XIY+0x14, 0xFF-terminated) as child tasks, mirrored by TASK_ARG; none with animation off [code]
PlayEffectList:
	cpb	(wOptionAnimation),0
	jr	Z,PlayEffectList.skip
	ld	XBC,(XIY+0x14)
	ld	A,(XBC+)
	cp	A,0xFF
	jr	Z,PlayEffectList.skip
	ld	(XIY+0x14),XBC
	ld	XHL,BattleEffectDispatch
	push	A
	call	StartChildTask
	pop	A
	; child +0x20 = id, +0x1E = mirror flag (TASK_ARG)
	ld	W,0
	ld	(XHL+0x20),WA
	ld	WA,(XIZ+TASK_ARG)
	ld	(XHL+0x1E),WA
	task_wait
	jp	PlayEffectList
PlayEffectList.skip:
	call	EndTask
	ret

c_209296	section	code abs=0x209296

; PlayEffectList for one effect: the next id of the parent's list, then ends; PlayerHitResult2 / EnemyHitResult3 [code]
PlayNextEffect:
	cpb	(wOptionAnimation),0
	jr	Z,PlayNextEffect.skip
	ld	XBC,(XIY+0x14)
	ld	A,(XBC+)
	cp	A,0xFF
	jr	Z,PlayNextEffect.skip
	ld	(XIY+0x14),XBC
	ld	XHL,BattleEffectDispatch
	push	A
	call	StartChildTask
	pop	A
	ld	W,0
	ld	(XHL+0x20),WA
	ld	WA,(XIZ+TASK_ARG)
	ld	(XHL+0x1E),WA
	task_wait
PlayNextEffect.skip:
	call	EndTask
	ret

c_2092D4	section	code abs=0x2092D4

; Child task for effect +0x20 (mirror flag +0x1E): 0xCD black flash, 0xCE white flash, else PlayBattleEffect; TASK_ARG 0x41 frames [code]
BattleEffectDispatch:
	ldw	(XIZ+TASK_ARG),0x41
	cpw	(XIZ+0x20),0xCD
	ld	XHL,BlackFlashEffectTask
	jr	Z,BattleEffectDispatch.skip
	cpw	(XIZ+0x20),0xCE
	ld	XHL,WhiteFlashEffectTask
	jr	Z,BattleEffectDispatch.skip
	ld	XHL,PlayBattleEffect
BattleEffectDispatch.skip:
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_2092FB	section	code abs=0x2092FB

; Effect 0xCE: flashes white every 8 frames for TASK_ARG frames, then ends [code]
WhiteFlashEffectTask:
	decw	1,(XIZ+TASK_ARG)
	jr	Z,WhiteFlashEffectTask.skip
	ld	WA,(XIZ+TASK_ARG)
	; bit 3 of the countdown: on 8 frames, off 8
	rr	4,WA
	sbc	A,A
	and	A,0x7F
	ld	(wFadeLevel),A
	ret
WhiteFlashEffectTask.skip:
	ldb	(wFadeLevel),0
	call	EndTask
	ret

c_20931A	section	code abs=0x20931A

; Effect 0xCD: flashes black every 8 frames for TASK_ARG frames, then ends [code]
BlackFlashEffectTask:
	decw	1,(XIZ+TASK_ARG)
	jr	Z,BlackFlashEffectTask.skip
	ld	WA,(XIZ+TASK_ARG)
	rr	4,WA
	sbc	A,A
	and	A,0x7F
	neg	A
	ld	(wFadeLevel),A
	ret
BlackFlashEffectTask.skip:
	ldb	(wFadeLevel),0
	call	EndTask
	ret

c_210213	section	code abs=0x210213

; Lone ret, no caller [code]
Unused_210213:
	ret

c_210214	section	code abs=0x210214

; Plays effect +0x20 from BattleEffects: loads its tiles and palette 0xE, then runs its frame list (each entry a sprite
; map and offset around 0x50, 0x30, mirrored when +0x1E is set except effects 0x72 / 0x73 / 0xBE / 0xBF), playing the
; sound list at its frame numbers; ends after the frame count +0x16 [code]
PlayBattleEffect:
	ldw	(XIZ+0x1A),0
	; +0x22 = sound list, TASK_ARG = sprite map table
	ld	HL,(XIZ+0x20)
	extz	XHL
	sll	2,XHL
	add	XHL,BattleEffectSounds
	; frame list: count byte, then 4-byte entries (hold, map, x, y)
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
PlayBattleEffect.resume:
	ldw	(XIZ+0x1C),0
PlayBattleEffect.resume2:
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
	; the first nonzero hold of the group sets the frames to show it
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
	; 0xFF = no sprite this entry
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
	call	DrawSpriteMap
	jr	PlayBattleEffect.skip5
PlayBattleEffect.skip3:
	; these effects are never mirrored
	cpw	(XIZ+0x20),0x72
	jr	Z,PlayBattleEffect.skip4
	cpw	(XIZ+0x20),0x73
	jr	Z,PlayBattleEffect.skip4
	cpw	(XIZ+0x20),0xBE
	jr	Z,PlayBattleEffect.skip4
	cpw	(XIZ+0x20),0xBF
	jr	Z,PlayBattleEffect.skip4
	call	DrawSpriteMapFlipped
	jr	PlayBattleEffect.skip5
PlayBattleEffect.skip4:
	call	DrawSpriteMap
PlayBattleEffect.skip5:
	ld	A,(XIY+0)
	; entries with hold 0 join the next one on the same frame
	cp	A,0
	jrl	Z,PlayBattleEffect.loop
	; sound list: (frame, sound word) triples, 0xFF ends
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
	ldw	(XIZ+TASK_FUNC),PlayBattleEffect.resume2 & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayBattleEffect.resume2 >> 16
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
	ldw	(XIZ+TASK_FUNC),PlayBattleEffect.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),PlayBattleEffect.resume >> 16
	ret
