; engine/battle/tasks.asm: battle tasks: unit/enemy HP and EP change tasks, screen shake, WaitBattleMessageTask, PlayEffectList / PlayNextEffect and the battle effect animation player

c_208B74	section	code abs=0x208B74

; [code] task: wFadeLevel = -(0x7F * n / TASK_ARG) for n = TASK_ARG down to 0, one step per frame (0x81 = black, FadeToBlackStep), then EndTask; BattleStart starts it with 0xF after the battle screen is drawn
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

; [code] task: wFadeLevel = -(0x7F * n / TASK_ARG) for n = 0 up to TASK_ARG (0 -> 0x81 black), then EndTask; BattleStart starts it with 0xF before clearing the screen
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

; [code] task: wFadeLevel = 0x7F * n / TASK_ARG for n = TASK_ARG down to 0 (0x7F = white, FadeToWhiteStep), then EndTask
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

; [code] task: wFadeLevel = 0x7F * n / TASK_ARG for n = 0 up to TASK_ARG (0 -> 0x7F white), then EndTask
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

; [code] task: wShakeFlags = 2 (VBlank UpdateScrollRegisters adds wShakeX/Y to the SCR1 scroll only), amplitude +0x10 = 4, then ScreenShakeTask; EnemyHitResult2-4 and ConfusedPlayerHitResult start it (ShakeScr1Amp8Task on a critical: wEnemyCritHit, wCritHit) when the unit is hit; also CheckEncounter on a step while wStatusRust
ShakeScr1Amp4Task:
	ldb	(wShakeFlags),2
	ldw	(XIZ+0x10),4
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C38	section	code abs=0x208C38

; [code] ShakeScr1Amp4Task with amplitude 8: EnemyHitResult2-4 on wEnemyCritHit, ConfusedPlayerHitResult on wCritHit, BattleDefeat
ShakeScr1Amp8Task:
	ldb	(wShakeFlags),2
	ldw	(XIZ+0x10),8
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C4C	section	code abs=0x208C4C

; [code] task: wShakeFlags = 4 (UpdateScrollRegisters adds wShakeX/Y to the SCR2 scroll only), amplitude 4, then ScreenShakeTask; PlayerHitResult1-3 and ConfusedEnemyHitResult start it (ShakeScr2Amp8Task on a critical: wCritHit, wEnemyCritHit) when the enemy is hit; also BossEncounter and places.asm
ShakeScr2Amp4Task:
	ldb	(wShakeFlags),4
	ldw	(XIZ+0x10),4
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C60	section	code abs=0x208C60

; [code] ShakeScr2Amp4Task with amplitude 8: PlayerHitResult1-3 on wCritHit, ConfusedEnemyHitResult on wEnemyCritHit, BattleVictory
ShakeScr2Amp8Task:
	ldb	(wShakeFlags),4
	ldw	(XIZ+0x10),8
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C74	section	code abs=0x208C74

; [code] TASK_ARG frames of random offsets +-(amp-1) in 0x5A80/0x5A81, then cleared
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

; [code] task started by BattleStart: each frame, when the value changed since the last frame (+0x10-0x16), redraws in text box 1 wUnitHP / wUnitEP (number col 0xB, bar col 0xF via DrawBarTiles, max wUnitMaxHP/EP) and wEnemyHP / wEnemyEP (bar col 0 via DrawBarTilesReversed, number col 6, the string QuestionMarkText instead of the number when >= 1000)
BattleHPEPDisplayTask:
	ld	A,1
	call	GetTextBox
	ld	(XIZ+TASK_ARG),WA
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
QuestionMarkText:
	text " ? "
	done

c_208E0F	section	code abs=0x208E0F

; [code] task: TASK_ARG = amount (clamped to wUnitMaxHP - wUnitHP, 0 -> EndTask), wUnitHP = start + amount * frame / +0x10 each frame, EndTask after +0x10 frames (the gain counterpart of UnitHPLossTask)
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

; [code] task: TASK_ARG = amount (clamped to wUnitHP), resumes at UnitHPLossTask.resume each frame: wUnitHP = start HP - amount*frame/+0x10, EndTask after +0x10 frames; started with +0xE = the damage (wPlayerDamage in ConfusedPlayerHitResult, wEnemyDamage in EnemyHitResult2-4), +0x10 = 0xF, and from status.asm
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

; [code] the UnitHPGainTask shape on wUnitEP / wUnitMaxEP; BattleRecharge starts it with the GetRechargeAmount gain and 0xF frames
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

; [code] the UnitHPLossTask shape on wUnitEP (amount clamped to the current EP)
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

; [code] the UnitHPGainTask shape on wEnemyHP / wEnemyMaxHP
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

; [code] the UnitHPLossTask shape on wEnemyHP
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

; [code] the UnitHPGainTask shape on wEnemyEP / wEnemyMaxEP
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

; [code] the UnitHPLossTask shape on wEnemyEP
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

; [code] task: wScr1ScrollX 0x60 -> 0xC0 (0xC0 - 0x60 * n / TASK_ARG, n = TASK_ARG .. 0); PlayerTurn as the second turn of the round; Y scroll 0; at once when wOptionAnimation = 0
; [code+play] SCR1 X rising 0x60 -> 0xC0: the unit enters from the right (0x60 = off screen, where UnitSlideInTask starts) and stops 64 px right of its home (X 0); PlayerHitResult1 runs it after UnitSlideOutLeftTask with the enemy shown (SCR2 X 0); the direction from play: a rising scroll X moves the plane left (the battle-start slides EnemySlideInTask / UnitSlideInTask) (was swp_20904F) [play] I38: 16 frames, 6.4 px a frame, the unit stops just right of the enemy; PlayerTurn also runs it when the player moves second (SCR2 0x60, the unit slides in alone).
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

; [code] task: wScr1ScrollX 0x60 -> 0 (-(0xA0 * n / TASK_ARG), n = TASK_ARG .. 0, i.e. 0x60 up through 0xF8 to 0); Y scroll 0; at once when wOptionAnimation = 0; DrawBattleScreen (TASK_ARG 0x14)
; [play] seen in play: SCR1 holds the unit; at battle start it steps 8 px per frame for 20 frames and the unit slides in from the right before "What do you do?" (was swp_209089)
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

; [code] task: wScr1ScrollX 0xC0 -> 0x60 upwards (0xC0 + 0xA0 * n / TASK_ARG, n = 0 .. TASK_ARG); Y scroll 0; at once when wOptionAnimation = 0
; [code+play] SCR1 X rising 0xC0 -> 0x160 (= 0x60): the unit moves 160 px left, from 64 px right of home off the screen; PlayerHitResult1 before UnitSlideInShiftedTask; the direction from play: a rising scroll X moves the plane left (the battle-start slides EnemySlideInTask / UnitSlideInTask) (was swp_2090C0) [play] I38: 16 frames, about 10.7 px a frame; PlayerHitResult1 then sets SCR2 X = 0, the enemy at home.
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

; [code] task: wScr1ScrollX 0xC0 -> 0x60 downwards (0x60 + 0x60 * n / TASK_ARG, n = TASK_ARG .. 0); BattleRetreat; Y scroll 0; at once when wOptionAnimation = 0
; [code+play] SCR1 X falling 0xC0 -> 0x60: the unit moves 96 px right, off the screen; the direction from play: a rising scroll X moves the plane left (the battle-start slides EnemySlideInTask / UnitSlideInTask) (was swp_2090FE) [play] I38: on a successful flee (BattleRetreat), 16 frames at 6.4 px a frame, after "You fled!!".
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

; [code] task: wScr1ScrollX 0 -> 0xC0 (0xC0 + 0x40 * n / TASK_ARG, n = TASK_ARG .. 0); PlayerTurn as the first turn of the round; Y scroll 0; at once when wOptionAnimation = 0
; [code+play] SCR1 X falling 0x100 (= 0) -> 0xC0: the unit moves from its home 64 px right; the direction from play: a rising scroll X moves the plane left (the battle-start slides EnemySlideInTask / UnitSlideInTask) (was swp_209136) [play] I38: 16 frames, SCR1 X 0 -> 0xC0 at about 4.3 px a frame (Animation On).
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

; [code] task: wScr2ScrollX 0x60 -> 0 (0x60 * n / TASK_ARG, n = TASK_ARG .. 0); BattleEncounterMessage, EnemyTurn, EnemyHitResult2; Y scroll 0; at once when wOptionAnimation = 0
; [play] seen in play: SCR2 holds the enemy; at battle start the enemy picture slides in from the left before "You encountered ...!!" (random and boss battles) (was swp_20916E) [play] I38: SCR2 X 0x60 -> 0 in 16 frames (6.4 px a frame), also at each EnemyTurn and after EnemySlideOutRightTask.
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

; [code] task: wScr2ScrollX 0 -> 0x60 (0x60 - 0x60 * n / TASK_ARG, n = TASK_ARG .. 0); BattleEncounterMessage, EnemyFleeSucceeded; Y scroll 0; at once when wOptionAnimation = 0
; [play] seen in play: after "You encountered ...!!" the enemy picture (SCR2) leaves to the left; SCR2 stays at X 0x60 (off screen) on the command menu (was swp_2091A3)
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

; [code] task: wScr2ScrollX 0 -> 0x60 downwards, wrapping (-(0xA0 * n / TASK_ARG), n = 0 .. TASK_ARG); Y scroll 0; at once when wOptionAnimation = 0
; [code+play] SCR2 X falling 0 -> -0xA0 (= 0x60): the enemy moves 160 px right, off the screen (EnemySlideOutTask leaves to the left); EnemyHitResult2 before EnemySlideInTask; the direction from play: a rising scroll X moves the plane left (the battle-start slides EnemySlideInTask / UnitSlideInTask) (was swp_2091DD) [play] I38: 16 frames, about 10.7 px a frame; EnemyHitResult2 then sets SCR1 X = 0xC0 and EnemySlideInTask brings the enemy back from the left.
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

; [code] task: TaskYield until text box 0 (ShowMessage's box) has no text pointer, A or B sets its speed +0x10 = 0 (rest at once); then EndTask (WaitBattleMessageEnd); started after each battle ShowMessage
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

; [code] WaitBattleMessageTask's last state (TASK_FUNC 0x924F): EndTask
WaitBattleMessageEnd:
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
	ld	XHL,BattleEffectDispatch
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

c_209296	section	code abs=0x209296

; [code] same body as PlayEffectList (0x209254) without the loop back: if wOptionAnimation, takes the next effect id from the parent task's list (XIY+0x14), starts BattleEffectDispatch (PlayBattleEffect) with +0x20 = id, then EndTask; started twice by PlayerHitResult2 / EnemyHitResult3
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

; [code] task started by PlayEffectList / PlayNextEffect with +0x20 = effect id: TASK_ARG = 0x41; effect 0xCD -> BlackFlashEffectTask, 0xCE -> WhiteFlashEffectTask, else PlayBattleEffect
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

; [code] battle effect 0xCE: for TASK_ARG (0x41) frames wFadeLevel = 0x7F (white) or 0, switching every 8 frames, then wFadeLevel = 0 and EndTask
WhiteFlashEffectTask:
	decw	1,(XIZ+TASK_ARG)
	jr	Z,WhiteFlashEffectTask.skip
	ld	WA,(XIZ+TASK_ARG)
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

; [code] battle effect 0xCD: as WhiteFlashEffectTask with wFadeLevel = 0x81 (black) or 0
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

; [code] ret; no callers (between BlackFlashEffectTask and PlayBattleEffect)
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
	call	DrawSpriteMap
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
	call	DrawSpriteMapFlipped
	jr	PlayBattleEffect.skip5
PlayBattleEffect.skip4:
	call	DrawSpriteMap
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
