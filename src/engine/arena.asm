; engine/arena: 148 routines (each keeps its ROM address in its own section)

c_207C00	section	code abs=0x207C00

swp_207C00:
	ldb	(wBattleResult),0xFF
	ld	XHL,BattleStart
	call	StartTask
	ret

c_207C0F	section	code abs=0x207C0F

swp_207C0F:
	extz	XDE
	sll	4,DE
	add	DE,0xA000
	push	BC
	push	HL
	push	XDE
	ld	XHL,RawTiles_2C83DD+0x2
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	ld	XHL,(XSP)
	ld	C,QC
	dec	1,C
	jr	Z,swp_207C0F.skip
	ld	B,0
	sll	3,BC
	ldirw	(XDE+),(XHL+)
swp_207C0F.skip:
	pop	XDE
	pop	HL
	pop	BC
	or	BC,BC
	ret	Z
	ld	QB,0
	sll	3,QBC
	mul	XBC,QBC
	extz	XHL
	add	XBC,XHL
	dec	1,XBC
	div	XBC,HL
swp_207C0F.loop:
	cp	BC,8
	jr	C,swp_207C0F.skip2
	push	BC
	ld	XHL,RawTiles_2C83DD+0x82
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	BC
	dec	8,BC
	jr	swp_207C0F.loop
swp_207C0F.skip2:
	or	BC,BC
	ret	Z
	sll	4,BC
	ld	XHL,RawTiles_2C83DD+0x2
	lda	XHL,XHL+BC
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	ret

c_207C7B	section	code abs=0x207C7B

swp_207C7B:
	extz	XDE
	sll	4,DE
	add	DE,0xA000
	push	BC
	push	HL
	push	XDE
	ld	XHL,RawTiles_2C846F+0x2
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XHL
	ld	C,QC
	dec	1,C
	jr	Z,swp_207C7B.skip
	ld	B,0
	sll	3,BC
	ldirw	(XDE+),(XHL+)
	dec	2,XDE
swp_207C7B.skip:
	pop	HL
	pop	BC
	or	BC,BC
	ret	Z
	ld	QB,0
	sll	3,QBC
	mul	XBC,QBC
	extz	XHL
	add	XBC,XHL
	dec	1,XBC
	div	XBC,HL
swp_207C7B.loop:
	cp	BC,8
	jr	C,swp_207C7B.skip2
	push	BC
	ld	XHL,RawTiles_2C846F+0x90
	ld	BC,8
	lddrw	(XDE-),(XHL-)
	pop	BC
	dec	8,BC
	jr	swp_207C7B.loop
swp_207C7B.skip2:
	or	BC,BC
	ret	Z
	sll	4,BC
	ld	XHL,RawTiles_2C846F+0x10
	lda	XHL,XHL+BC
	ld	BC,8
	lddrw	(XDE-),(XHL-)
	ret

c_208A73	section	code abs=0x208A73

swp_208A73:
	push	WA
	ld	A,(wEnemyEPCostBuff)
	ld	W,0
	mul	XWA,(XSP+)
	div	XWA,0x64
	ret

c_208B74	section	code abs=0x208B74

swp_208B74:
	ld	WA,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),WA
	ldw	(XIZ+TASK_FUNC),0x8B84
	ldw	(XIZ+TASK_FUNC_HI),0x20
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

swp_208BA1:
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0x8BB0
	ldw	(XIZ+TASK_FUNC_HI),0x20
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

swp_208BCE:
	ld	WA,(XIZ+TASK_ARG)
	ld	(XIZ+0x10),WA
	ldw	(XIZ+TASK_FUNC),0x8BDE
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,0x7F
	mul	XWA,(XIZ+0x10)
	div	XWA,(XIZ+TASK_ARG)
	ld	(wFadeLevel),A
	cpw	(XIZ+0x10),0
	jp	Z,EndTask
	decw	1,(XIZ+0x10)
	ret

c_208BF9	section	code abs=0x208BF9

swp_208BF9:
	ldw	(XIZ+0x10),0
	ldw	(XIZ+TASK_FUNC),0x8C08
	ldw	(XIZ+TASK_FUNC_HI),0x20
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

swp_208C24:
	ldb	(wShakeFlags),2
	ldw	(XIZ+0x10),4
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C38	section	code abs=0x208C38

swp_208C38:
	ldb	(wShakeFlags),2
	ldw	(XIZ+0x10),8
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C4C	section	code abs=0x208C4C

swp_208C4C:
	ldb	(wShakeFlags),4
	ldw	(XIZ+0x10),4
	ld	XHL,ScreenShakeTask
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_208C60	section	code abs=0x208C60

swp_208C60:
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

loc_208CB6:
	ld	A,1
	call	GetTextBox
	ld	(XIZ+TASK_ARG),WA
	ld	WA,0x8000
	ld	(XIZ+0x10),WA
	ld	(XIZ+0x12),WA
	ld	(XIZ+0x14),WA
	ld	(XIZ+0x16),WA
	ldw	(XIZ+TASK_FUNC),0x8CD8
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	XWA,0
	ld	WA,(XIZ+TASK_ARG)
	or	WA,WA
	jp	Z,loc_208CB6
	ld	BC,(XIZ+0x10)
	cp	BC,(wUnitHP)
	jr	Z,loc_208CB6.skip
	ldw	(XIZ+0x10),(wUnitHP)
	ld	C,0xF
	ld	E,0
	call	sub_20768E
	call	sub_207720
	ld	HL,(wUnitMaxHP)
	ld	BC,(wUnitHP)
	ld	QC,5
	call	0x207C18
	ld	C,0xB
	ld	E,0
	call	sub_20768E
	call	sub_207720
	ld	BC,(wUnitHP)
	call	sub_207CF0
loc_208CB6.skip:
	ld	BC,(XIZ+0x12)
	cp	BC,(wUnitEP)
	jr	Z,loc_208CB6.skip2
	ldw	(XIZ+0x12),(wUnitEP)
	ld	C,0xF
	ld	E,1
	call	sub_20768E
	call	sub_207720
	ld	HL,(wUnitMaxEP)
	ld	BC,(wUnitEP)
	ld	QC,5
	call	0x207C18
	ld	C,0xB
	ld	E,1
	call	sub_20768E
	call	sub_207720
	ld	BC,(wUnitEP)
	call	sub_207CF0
loc_208CB6.skip2:
	ld	BC,(XIZ+0x14)
	cp	BC,(wEnemyHP)
	jr	Z,loc_208CB6.skip3
	ldw	(XIZ+0x14),(wEnemyHP)
	ld	C,0
	ld	E,0
	call	sub_20768E
	call	sub_207720
	ld	HL,(wEnemyMaxHP)
	ld	BC,(wEnemyHP)
	ld	QC,5
	call	0x207C84
	ld	C,6
	ld	E,0
	call	sub_20768E
	ld	XHL,0x208E0B
	call	DrawString
	cpw	(wEnemyHP),0x3E8
	jr	NC,loc_208CB6.skip3
	ld	C,6
	ld	E,0
	call	sub_20768E
	call	sub_207720
	ld	BC,(wEnemyHP)
	call	sub_207CF0
loc_208CB6.skip3:
	ld	BC,(XIZ+0x16)
	cp	BC,(wEnemyEP)
	jr	Z,loc_208CB6.done
	ldw	(XIZ+0x16),(wEnemyEP)
	ld	C,0
	ld	E,1
	call	sub_20768E
	call	sub_207720
	ld	HL,(wEnemyMaxEP)
	ld	BC,(wEnemyEP)
	ld	QC,5
	call	0x207C84
	ld	C,6
	ld	E,1
	call	sub_20768E
	ld	XHL,0x208E0B
	call	DrawString
	cpw	(wEnemyEP),0x3E8
	jr	NC,loc_208CB6.done
	ld	C,6
	ld	E,1
	call	sub_20768E
	call	sub_207720
	ld	BC,(wEnemyEP)
	call	sub_207CF0
loc_208CB6.done:
	ret
	db	0x00,0x64,0x00,0xFF

c_208E0F	section	code abs=0x208E0F

loc_208E0F:
	ld	WA,(wUnitHP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wUnitMaxHP)
	jr	LE,loc_208E0F.skip
	ld	WA,(wUnitMaxHP)
	sub	WA,(wUnitHP)
	jr	Z,loc_208E0F.skip2
	ld	(XIZ+TASK_ARG),WA
loc_208E0F.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitHP)
	ldw	(XIZ+TASK_FUNC),0x8E3D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wUnitHP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
loc_208E0F.skip2:
	call	EndTask
	ret

c_208E5D	section	code abs=0x208E5D

; [code] task: TASK_ARG = amount (clamped to wUnitHP), resumes at 0x208E7D each frame: wUnitHP = start HP - amount*frame/+0x10, EndTask after +0x10 frames; started with +0xE = wPlayerDamage, +0x10 = 0xF by EnemyHitResult1 etc. (battle.asm x5)
UnitHPLossTask:
	ld	WA,(wUnitHP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,UnitHPLossTask.skip
	ld	(XIZ+TASK_ARG),WA
UnitHPLossTask.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitHP)
	ldw	(XIZ+TASK_FUNC),0x8E7D
	ldw	(XIZ+TASK_FUNC_HI),0x20
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

swp_208E9F:
	ld	WA,(wUnitEP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wUnitMaxEP)
	jr	LE,swp_208E9F.skip
	ld	WA,(wUnitMaxEP)
	sub	WA,(wUnitEP)
	jr	Z,swp_208E9F.skip2
	ld	(XIZ+TASK_ARG),WA
swp_208E9F.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitEP)
	ldw	(XIZ+TASK_FUNC),0x8ECD
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wUnitEP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
swp_208E9F.skip2:
	call	EndTask
	ret

c_208EED	section	code abs=0x208EED

swp_208EED:
	ld	WA,(wUnitEP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,swp_208EED.skip
	ld	(XIZ+TASK_ARG),WA
swp_208EED.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wUnitEP)
	ldw	(XIZ+TASK_FUNC),0x8F0D
	ldw	(XIZ+TASK_FUNC_HI),0x20
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

swp_208F2F:
	ld	WA,(wEnemyHP)
	add	WA,(XIZ+TASK_ARG)
	cp	WA,(wEnemyMaxHP)
	jr	LE,swp_208F2F.skip
	ld	WA,(wEnemyMaxHP)
	sub	WA,(wEnemyHP)
	jr	Z,swp_208F2F.skip2
	ld	(XIZ+TASK_ARG),WA
swp_208F2F.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyHP)
	ldw	(XIZ+TASK_FUNC),0x8F5D
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	WA,(XIZ+TASK_ARG)
	mul	XWA,(XIZ+0x12)
	div	XWA,(XIZ+0x10)
	add	WA,(XIZ+0x14)
	ld	(wEnemyHP),WA
	incw	1,(XIZ+0x12)
	ld	WA,(XIZ+0x12)
	cp	WA,(XIZ+0x10)
	ret	LE
swp_208F2F.skip2:
	call	EndTask
	ret

c_208F7D	section	code abs=0x208F7D

swp_208F7D:
	ld	WA,(wEnemyHP)
	cp	WA,(XIZ+TASK_ARG)
	jr	PL,swp_208F7D.skip
	ld	(XIZ+TASK_ARG),WA
swp_208F7D.skip:
	ldw	(XIZ+0x12),0
	ldw	(XIZ+0x14),(wEnemyHP)
	ldw	(XIZ+TASK_FUNC),0x8F9D
	ldw	(XIZ+TASK_FUNC_HI),0x20
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

c_209296	section	code abs=0x209296

; [code] same body as PlayEffectList (0x209254) without the loop back: if wOptionAnimation, takes the next effect id from the parent task's list (XIY+0x14), starts swp_2092D4 (PlayBattleEffect) with +0x20 = id, then EndTask; started twice by PlayerHitResult2 / EnemyHitResult3
PlayNextEffect:
	cpb	(wOptionAnimation),0
	jr	Z,PlayNextEffect.skip
	ld	XBC,(XIY+0x14)
	ld	A,(XBC+)
	cp	A,0xFF
	jr	Z,PlayNextEffect.skip
	ld	(XIY+0x14),XBC
	ld	XHL,swp_2092D4
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

swp_2092D4:
	ldw	(XIZ+TASK_ARG),0x41
	cpw	(XIZ+0x20),0xCD
	ld	XHL,swp_20931A
	jr	Z,swp_2092D4.skip
	cpw	(XIZ+0x20),0xCE
	ld	XHL,swp_2092FB
	jr	Z,swp_2092D4.skip
	ld	XHL,PlayBattleEffect
swp_2092D4.skip:
	ld	(XIZ+TASK_FUNC),XHL
	jp	XHL

c_211F03	section	code abs=0x211F03

sub_211F03:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2167CF
	call	dyn_216845
	ld	HL,WA
	ld	A,4
	ld	C,0xC
	ld	E,0xE
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F20	section	code abs=0x211F20

sub_211F20:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2167E4
	ld	A,4
	ld	C,0
	ld	E,0x20
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F37	section	code abs=0x211F37

swp_211F37:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2167F9
	ld	A,4
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2130E1	section	code abs=0x2130E1

swp_2130E1:
	call	dyn_206803
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(0x5FF9),A
	ld	A,0xFF
	ld	(0x5FF8),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,swp_21310A
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_21310A	section	code abs=0x21310A

swp_21310A:
	ld	A,(XIZ+TASK_ARG)
	cp	A,0xC
	jr	Z,swp_21310A.skip11
	cp	A,1
	jr	NZ,swp_21310A.skip
	ld	A,2
	ld	(XIZ+TASK_ARG),A
swp_21310A.skip:
	cp	A,2
	jr	NZ,swp_21310A.skip2
	call	SetupArenaScreen
	jr	swp_21310A.done
swp_21310A.skip2:
	cp	A,3
	jr	NZ,swp_21310A.skip3
	call	sub_213768
	jr	swp_21310A.done
swp_21310A.skip3:
	cp	A,4
	jr	NZ,swp_21310A.skip4
	call	ArenaEntryMenuInput
	jr	swp_21310A.done
swp_21310A.skip4:
	cp	A,5
	jr	NZ,swp_21310A.skip5
	call	sub_21399E
	jr	swp_21310A.done
swp_21310A.skip5:
	cp	A,6
	jr	NZ,swp_21310A.skip6
	call	sub_2143C8
	jr	swp_21310A.done
swp_21310A.skip6:
	cp	A,7
	jr	NZ,swp_21310A.skip7
	call	sub_214401
	jr	swp_21310A.done
swp_21310A.skip7:
	cp	A,8
	jr	NZ,swp_21310A.skip8
	call	sub_21445B
	jr	swp_21310A.done
swp_21310A.skip8:
	cp	A,9
	jr	NZ,swp_21310A.skip9
	call	sub_214A92
	jr	swp_21310A.done
swp_21310A.skip9:
	cp	A,0xA
	jr	NZ,swp_21310A.skip10
	call	sub_214B9B
	jr	swp_21310A.done
swp_21310A.skip10:
	cp	A,0xB
	jr	NZ,swp_21310A.skip11
	call	sub_214BD2
	jr	swp_21310A.done
swp_21310A.skip11:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,(0x5FF9)
	ld	(0x5FF8),A
	call	EndTask
	jr	swp_21310A.done
swp_21310A.done:
	ret

c_213197	section	code abs=0x213197

swp_213197:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9800
	ld	WA,0xC
	add	WA,0
	call	swp_216C1F
	ld	A,0
	ld	(XIZ+0x2B),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2131B5	section	code abs=0x2131B5

sub_2131B5:
	push	XHL
	push	XDE
	push	XBC
	ld	WA,0xC
	add	WA,0
	ld	BC,0
	ld	C,(XIZ+0x2B)
	call	sub_216C75
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2131CC	section	code abs=0x2131CC

swp_2131CC:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9800
	ld	WA,0xC
	add	WA,0
	call	swp_216CAA
	ld	A,0
	ld	(XIZ+0x2B),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2131EA	section	code abs=0x2131EA

sub_2131EA:
	push	XHL
	push	XDE
	push	XBC
	ld	WA,0xC
	add	WA,0
	ld	BC,0
	ld	C,(XIZ+0x2B)
	call	sub_216D00
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213201	section	code abs=0x213201

sub_213201:
	push	XHL
	ld	XHL,0x9800
	call	dyn_216BEE
	pop	XHL
	ret

c_21320D	section	code abs=0x21320D

sub_21320D:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	swp_216830
	call	dyn_206803
	call	dyn_206825
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213222	section	code abs=0x213222

sub_213222:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	HL
	call	dyn_206803
	pop	HL
	call	dyn_216845
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21323D	section	code abs=0x21323D

sub_21323D:
	push	XHL
	ld	XHL,0x9800
	call	dyn_216BEE
	pop	XHL
	ret

c_213450	section	code abs=0x213450

; [code+play] end of an arena talk scene: runs its end action (arena_scenes.txt: 1 SetTalkedJon, 2 rank won = AdvanceStoryStage + prize item/GP, 3 SetJonNotReadySeen), then its next scene or command (play: prize and next-rank screens)
ArenaSceneEnd:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x12)
	ld	XHL,ArenaSceneEndActions
	add	XHL,XWA
	ld	A,(XHL)
	cp	A,1
	jr	Z,ArenaSceneEnd.skip
	cp	A,2
	jr	Z,ArenaSceneEnd.skip3
	cp	A,3
	jr	Z,ArenaSceneEnd.skip2
	jrl	ArenaSceneEnd.skip9
ArenaSceneEnd.skip:
	call	SetTalkedJon
	jrl	ArenaSceneEnd.skip9
ArenaSceneEnd.skip2:
	call	SetJonNotReadySeen
	jrl	ArenaSceneEnd.skip9
ArenaSceneEnd.skip3:
	call	AdvanceStoryStage
	call	GetStageArenaRank
	cp	A,9
	jr	NC,ArenaSceneEnd.skip4
	call	ClearTalkedFlags
	ld	HL,EVENT_JON_NOT_READY_SEEN
	call	ClearEventFlag
ArenaSceneEnd.skip4:
	call	GetStageArenaRank
	cp	A,3
	jr	C,ArenaSceneEnd.skip5
	cp	A,9
	jr	NC,ArenaSceneEnd.skip5
	sub	A,2
	extz	WA
	extz	XWA
	ld	XHL,ArenaPrizeItems
	add	XHL,XWA
	ld	A,(XHL)
	extz	WA
	call	AddItem
ArenaSceneEnd.skip5:
	call	GetStageArenaRank
	cp	A,2
	jr	C,ArenaSceneEnd.skip7
	cp	A,8
	jr	Z,ArenaSceneEnd.skip6
	jr	NC,ArenaSceneEnd.skip7
	sub	A,2
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XHL,ArenaPrizeGP
	add	XHL,XWA
	ld	WA,(XHL)
	call	AddGP
	jr	ArenaSceneEnd.skip7
ArenaSceneEnd.skip6:
	ld	WA,0xC350
	call	AddGP
	ld	WA,0xC350
	call	AddGP
ArenaSceneEnd.skip7:
	call	GetStageArenaRank
	cp	A,8
	jr	NZ,ArenaSceneEnd.skip8
	ld	A,1
	ld	(0x5FF9),A
ArenaSceneEnd.skip8:
	jr	ArenaSceneEnd.skip9
ArenaSceneEnd.skip9:
	ld	XWA,0
	ld	A,(XIZ+0x12)
	ld	XHL,ArenaSceneNext
	add	XHL,XWA
	ld	A,(XHL)
	cp	A,0x50
	jrl	C,loc_2135C0
	cp	A,0x70
	jrl	C,loc_2135C5
	cp	A,0xFF
	jrl	Z,loc_2135F5
	cp	A,0xFE
	jr	Z,ArenaSceneEnd.skip10
	cp	A,0xFD
	jr	Z,loc_21358C
	cp	A,0xFC
	jr	Z,loc_21356A
	cp	A,0xF9
	jr	Z,loc_213575
	cp	A,0xF3
	jr	Z,loc_213575
	cp	A,0xF8
	jr	Z,loc_213582
	cp	A,0xF7
	jr	Z,loc_213593
	cp	A,0xF6
	jr	Z,loc_21359A
	cp	A,0xF5
	jr	Z,loc_2135AD
	cp	A,0xF4
	jr	Z,loc_2135B4
	cp	A,0xF2
	jr	Z,loc_2135B9
	jrl	loc_2135F5
ArenaSceneEnd.skip10:
	call	swp_216732
	ld	A,7
	ld	(XIZ+0x12),A
	jrl	loc_2135FF

c_213567	section	code abs=0x213567

swp_213567:
	jrl	loc_2135F5

c_21356A	section	code abs=0x21356A

loc_21356A:
	calr	swp_2137EF
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	jrl	loc_2135FF

c_213575	section	code abs=0x213575

loc_213575:
	ld	(XIZ+0x17),A
	calr	swp_213903
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	jr	loc_2135FF

c_213582	section	code abs=0x213582

loc_213582:
	calr	swp_213BE1
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	jr	loc_2135FF

c_21358C	section	code abs=0x21358C

loc_21358C:
	ld	A,1
	ld	(XIZ+0x12),A
	jr	loc_2135FF

c_213593	section	code abs=0x213593

loc_213593:
	ld	A,7
	ld	(XIZ+TASK_ARG),A
	jr	loc_2135FF

c_21359A	section	code abs=0x21359A

loc_21359A:
	call	dyn_2166DC
	calr	sub_21320D
	ld	A,2
	ld	(XIZ+0x2A),A
	ld	A,9
	ld	(XIZ+TASK_ARG),A
	jr	loc_2135FF

c_2135AD	section	code abs=0x2135AD

loc_2135AD:
	ld	A,0x3A
	ld	(XIZ+0x12),A
	jr	loc_2135FF

c_2135B4	section	code abs=0x2135B4

loc_2135B4:
	calr	swp_214AF6
	jr	loc_2135FF

c_2135B9	section	code abs=0x2135B9

loc_2135B9:
	ld	A,0xB
	ld	(XIZ+TASK_ARG),A
	jr	loc_2135FF

c_2135C0	section	code abs=0x2135C0

loc_2135C0:
	ld	(XIZ+0x12),A
	jr	loc_2135FF

c_2135C5	section	code abs=0x2135C5

loc_2135C5:
	cp	A,0x64
	jr	NZ,loc_2135C5.skip
	push	A
	call	dyn_206803
	pop	A
	call	dyn_216757
	call	dyn_21679E
	ld	HL,0x29
	calr	sub_213222
	push	XWA
	ld	XWA,4
	call	PlayMusic
	ld	WA,0x24
	call	SoundCommand
	pop	XWA
loc_2135C5.skip:
	calr	GetArenaGenderScene
	ld	(XIZ+0x12),A
	jr	loc_2135FF

c_2135F5	section	code abs=0x2135F5

loc_2135F5:
	ld	A,4
	ld	(XIZ+0xF),A
	ld	A,0
	ld	(XIZ+0x11),A

c_2135FF	section	code abs=0x2135FF

loc_2135FF:
	calr	sub_213607
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213607	section	code abs=0x213607

sub_213607:
	push	A
	ld	A,0
	ld	(XIZ+0x25),A
	pop	A
	ret

c_21360F	section	code abs=0x21360F

; [code] box 3 "Arena " (picture 0x29) or "C.Mine" (0x34, Lily stage), PlayMusic 4
SetupArenaScreen:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2167CF
	call	dyn_2167E4
	call	CheckStageEnding
	cp	A,1
	jr	Z,SetupArenaScreen.skip
	call	CheckStageLily
	cp	A,0
	jr	Z,SetupArenaScreen.skip
	call	CheckTalkedJon
	cp	A,0
	jr	Z,SetupArenaScreen.skip
	ld	XHL,CMineText
	ld	A,3
	call	DrawBoxString
	ld	HL,0x34
	jr	SetupArenaScreen.skip2
SetupArenaScreen.skip:
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	HL,0x29
SetupArenaScreen.skip2:
	calr	sub_213222
	ld	A,0
	ld	(XIZ+0x13),A
	call	dyn_216EDE
	call	dyn_216FB1
	call	dyn_216F6B
	ld	A,0xFF
	ld	(XIZ+0x12),A
	ld	A,0
	ld	(XIZ+0x25),A
	push	XWA
	ld	XWA,4
	call	PlayMusic
	ld	WA,0x24
	call	SoundCommand
	pop	XWA
	ld	A,2
	ld	(XIZ+0xF),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21368D	section	code abs=0x21368D

; [code] per frame of an arena talk scene: text box 1 message (GetTextBox +8) empty -> first frame sets +8 = ArenaTalkTexts[task+0x12] (GetArenaTalkRow when +0x12 = FF, sub_2132D2 portraits), after the message calls ArenaSceneEnd; A/B (wJoyPressed) sets box speed +0x10 to 0 and restores it from +0x23/+0x24; [play] every arena_* talk screen
ArenaSceneStep:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,ArenaSceneStep.skip
	ld	B,(XIZ+0x24)
	dec	1,B
	ld	(XIZ+0x24),B
	jrl	NZ,ArenaSceneStep.skip8
	ld	A,1
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
ArenaSceneStep.skip:
	ld	A,1
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,ArenaSceneStep.skip4
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	jr	NZ,ArenaSceneStep.skip2
	ld	A,1
	ld	(XIZ+0x26),A
ArenaSceneStep.skip2:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jrl	Z,ArenaSceneStep.skip8
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,ArenaSceneStep.skip3
	ld	A,0
	ld	(XIZ+0x26),A
	jr	ArenaSceneStep.skip8
ArenaSceneStep.skip3:
	ld	A,1
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	inc	1,C
	ld	(XIZ+0x24),C
	ld	C,0
	ld	(XWA+0x10),C
	jr	ArenaSceneStep.skip8
ArenaSceneStep.skip4:
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,ArenaSceneStep.skip5
	ld	A,1
	ld	(XIZ+0x25),A
	calr	ArenaSceneEnd
	jr	ArenaSceneStep.skip8
ArenaSceneStep.skip5:
	ld	A,(XIZ+0x12)
	cp	A,0xFF
	jr	NZ,ArenaSceneStep.skip6
	calr	GetArenaTalkRow
	ld	(XIZ+0x12),W
ArenaSceneStep.skip6:
	calr	DrawArenaSceneCast
	ld	A,(XIZ+0x12)
	cp	A,0x3A
	jr	NZ,ArenaSceneStep.skip7
	ld	XHL,CMineText
	ld	A,3
	call	DrawBoxString
	ld	HL,0x34
	calr	sub_213222
ArenaSceneStep.skip7:
	ld	A,(XIZ+0x12)
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,ArenaTalkTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,2
	ld	(XIZ+0x25),A
ArenaSceneStep.skip8:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213768	section	code abs=0x213768

sub_213768:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0xF)
	cp	A,1
	jr	NZ,sub_213768.skip
	ld	A,2
	ld	(XIZ+0xF),A
	jr	sub_213768.skip8
sub_213768.skip:
	cp	A,2
	jr	NZ,sub_213768.skip2
	ld	A,0
	cp	A,1
	jr	Z,sub_213768.skip8
	calr	sub_213201
	ld	A,3
	ld	(XIZ+0xF),A
	jr	sub_213768.skip8
sub_213768.skip2:
	cp	A,3
	jr	NZ,sub_213768.skip3
	calr	ArenaSceneStep
	jr	sub_213768.skip8
sub_213768.skip3:
	cp	A,4
	jr	NZ,sub_213768.skip5
	calr	sub_21323D
	call	swp_216830
	ld	A,(XIZ+0x11)
	cp	A,0
	jr	NZ,sub_213768.skip4
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
sub_213768.skip4:
	jr	sub_213768.skip8
sub_213768.skip5:
	cp	A,5
	jr	NZ,sub_213768.skip6
	calr	sub_2131EA
	cp	A,1
	jr	Z,sub_213768.skip8
	calr	sub_213201
	calr	swp_213197
	ld	A,6
	ld	(XIZ+0xF),A
	jr	sub_213768.skip8
sub_213768.skip6:
	cp	A,6
	jr	NZ,sub_213768.skip7
	calr	sub_2131B5
	cp	A,1
	jr	Z,sub_213768.skip8
	calr	sub_213201
	ld	A,3
	ld	(XIZ+0xF),A
	jr	sub_213768.skip8
sub_213768.skip7:
	ld	A,1
	ld	(XIZ+0xF),A
sub_213768.skip8:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2137EF	section	code abs=0x2137EF

swp_2137EF:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	swp_216732
	ld	A,2
	ld	XHL,EntryText
	call	DrawBoxString
	ld	A,2
	ld	XHL,QuitText2
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213817	section	code abs=0x213817

; [code] cursor task+0x10 toggles 0/1 on U/D (sound 0x80), A (0x81) or B (0x82, forces 1) calls sub_2138B7 which draws string pointer 0x249BC9[cursor] = "Entry" (0x249BBC) / "Quit" (0x249BC3, decoded with charmap) and sets scene 7 / 8; DrawMenuCursor at y = 8*cursor+4; state TASK_ARG 4 of swp_21310A (set by ArenaSceneEnd command 0xFC); [play] arena_entry_quit_menu
ArenaEntryMenuInput:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,ArenaEntryMenuInput.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	calr	sub_2138B7
	jr	ArenaEntryMenuInput.skip7
ArenaEntryMenuInput.skip:
	bit	5,A
	jr	Z,ArenaEntryMenuInput.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	calr	sub_2138B7
	jr	ArenaEntryMenuInput.skip7
ArenaEntryMenuInput.skip2:
	and	A,0xF
	jr	Z,ArenaEntryMenuInput.skip7
	cp	A,1
	jr	NZ,ArenaEntryMenuInput.skip4
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,ArenaEntryMenuInput.skip3
	dec	1,A
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip3:
	ld	A,1
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip4:
	cp	A,2
	jr	NZ,ArenaEntryMenuInput.skip6
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,ArenaEntryMenuInput.skip5
	inc	1,A
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip5:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip6:
	jr	ArenaEntryMenuInput.skip7
ArenaEntryMenuInput.skip7:
	ld	BC,0x60
	ld	XWA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2138B7	section	code abs=0x2138B7

sub_2138B7:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	swp_216732
	ld	E,(XIZ+0x10)
	ld	C,0
	ld	A,2
	call	sub_20768A
	ld	XWA,0
	ld	A,(XIZ+0x10)
	sll	2,XWA
	ld	XHL,ArenaEntryMenuTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	DrawBoxString
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	NZ,sub_2138B7.skip
	ld	A,7
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	sub_2138B7.skip2
sub_2138B7.skip:
	ld	A,8
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
sub_2138B7.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213903	section	code abs=0x213903

swp_213903:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	swp_216732
	call	GetStageArenaRank
	cp	A,1
	jr	NC,swp_213903.skip
swp_213903.skip:
	cp	A,9
	jr	Z,swp_213903.skip2
	inc	1,A
swp_213903.skip2:
	sub	A,2
	ld	(XIZ+0x14),A
	ld	XDE,ArenaRankNames
	ld	C,A
	inc	1,C
swp_213903.loop:
	ld	XHL,(XDE)
	ld	A,2
	push	XDE
	push	C
	call	DrawBoxString
	pop	C
	pop	XDE
	inc	4,XDE
	djnz	C,swp_213903.loop
	ld	E,8
	ld	C,0
	ld	A,2
	call	sub_20768A
	ld	A,2
	ld	XHL,QuitText3
	call	DrawBoxString
	ld	A,(XIZ+0x17)
	cp	A,0xF3
	jr	Z,swp_213903.skip3
	ld	A,(XIZ+0x14)
	ld	(XIZ+0x10),A
swp_213903.skip3:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	calr	sub_213972
	call	DrawGPBox3
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213972	section	code abs=0x213972

sub_213972:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	A
	ld	XHL,CostText
	ld	A,1
	call	DrawBoxString
	pop	A
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,ArenaEntryCostTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21399E	section	code abs=0x21399E

sub_21399E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_21399E.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	calr	sub_213A68
	jrl	sub_21399E.skip10
sub_21399E.skip:
	bit	5,A
	jr	Z,sub_21399E.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,8
	ld	(XIZ+0x10),A
	calr	sub_213A68
	jr	sub_21399E.skip10
sub_21399E.skip2:
	and	A,0xF
	jr	Z,sub_21399E.skip10
	cp	A,1
	jr	NZ,sub_21399E.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,sub_21399E.skip3
	cp	A,8
	jr	Z,sub_21399E.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	sub_21399E.skip9
sub_21399E.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	sub_21399E.skip9
sub_21399E.skip4:
	ld	A,(XIZ+0x14)
	ld	(XIZ+0x10),A
	jr	sub_21399E.skip9
sub_21399E.skip5:
	cp	A,2
	jr	NZ,sub_21399E.skip8
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,sub_21399E.skip6
	cp	A,(XIZ+0x14)
	jr	Z,sub_21399E.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	sub_21399E.skip9
sub_21399E.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	sub_21399E.skip9
sub_21399E.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	sub_21399E.skip9
sub_21399E.skip8:
	jr	sub_21399E.skip10
sub_21399E.skip9:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,sub_21399E.skip10
	calr	sub_213972
sub_21399E.skip10:
	ld	BC,0x68
	ld	XWA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213A68	section	code abs=0x213A68

sub_213A68:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	swp_216732
	ld	E,(XIZ+0x10)
	ld	C,0
	ld	A,2
	call	sub_20768A
	ld	XWA,0
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,sub_213A68.skip
	sll	2,XWA
	ld	XHL,ArenaRankNames
	add	XHL,XWA
	ld	XHL,(XHL)
	jr	sub_213A68.skip2
sub_213A68.skip:
	ld	XHL,QuitText3
sub_213A68.skip2:
	ld	A,2
	call	DrawBoxString
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,sub_213A68.skip4
	ld	A,(XIZ+0x10)
	extz	WA
	extz	XWA
	sll	1,A
	ld	XHL,ArenaEntryCosts
	add	XHL,XWA
	ld	WA,(XHL)
	extz	XWA
	call	sub_2061EC
	ld	XBC,XWA
	ld	XWA,(wGP)
	call	sub_20622F
	jr	NC,sub_213A68.skip3
	ld	A,0x41
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	sub_213A68.skip5
sub_213A68.skip3:
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	A,(XIZ+0x10)
	add	A,2
	ld	(XIZ+0x15),A
	ld	A,9
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	sub_213A68.skip5
sub_213A68.skip4:
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	A,8
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
sub_213A68.skip5:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B11	section	code abs=0x213B11

swp_213B11:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	swp_216841
	ld	HL,WA
	ld	A,4
	ld	C,8
	ld	E,6
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B2A	section	code abs=0x213B2A

sub_213B2A:
	push	A
	ld	A,1
	ld	(XIZ+0x21),A
	pop	A
	ret

c_213B32	section	code abs=0x213B32

sub_213B32:
	push	A
	ld	A,2
	ld	(XIZ+0x21),A
	pop	A
	ret

c_213B3A	section	code abs=0x213B3A

sub_213B3A:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9800
	ld	WA,0xC
	add	WA,0
	call	swp_216C1F
	ld	A,0
	ld	(XIZ+0x2B),A
	calr	sub_213B2A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B5B	section	code abs=0x213B5B

sub_213B5B:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0x9800
	ld	WA,0xC
	add	WA,0
	call	swp_216C1F
	ld	A,0x10
	ld	(XIZ+0x2B),A
	calr	sub_2131B5
	calr	sub_213B32
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213B7F	section	code abs=0x213B7F

sub_213B7F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x21)
	cp	A,0
	jr	Z,sub_213B7F.skip8
	cp	A,1
	jr	NZ,sub_213B7F.skip3
	calr	sub_2131B5
	ld	A,(XIZ+0x2B)
	cp	A,0x10
	jr	NC,sub_213B7F.skip
	inc	1,A
	ld	(XIZ+0x2B),A
	jr	sub_213B7F.skip2
sub_213B7F.skip:
	ld	A,0
	ld	(XIZ+0x21),A
sub_213B7F.skip2:
	jr	sub_213B7F.skip8
sub_213B7F.skip3:
	cp	A,2
	jr	NZ,sub_213B7F.skip7
	calr	sub_2131B5
	ld	A,(XIZ+0x2B)
	cp	A,0
	jr	Z,sub_213B7F.skip4
	dec	1,A
	ld	(XIZ+0x2B),A
	jr	sub_213B7F.skip6
sub_213B7F.skip4:
	ld	A,(XIZ+0x2A)
	cp	A,3
	jr	NZ,sub_213B7F.skip5
	ld	A,(XIZ+0x1E)
	calr	LoadArenaOpponent
	calr	sub_213B3A
	jr	sub_213B7F.skip8
sub_213B7F.skip5:
	ld	A,0
	ld	(XIZ+0x21),A
sub_213B7F.skip6:
	jr	sub_213B7F.skip8
sub_213B7F.skip7:
	ld	A,0
	ld	(XIZ+0x21),A
	jr	sub_213B7F.skip8
sub_213B7F.skip8:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213BE1	section	code abs=0x213BE1

swp_213BE1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_21676A
	call	dyn_2167B1
	call	swp_2166FA
	call	swp_216732
	call	swp_216710
	call	ClearTextBox1
	ld	E,1
	ld	C,5
	ld	A,1
	call	sub_20768A
	ld	XWA,0
	ld	A,(XIZ+0x10)
	sll	2,XWA
	ld	XHL,ArenaRankNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	calr	sub_213C2E
	calr	swp_213B11
	ld	A,2
	ld	(XIZ+0x2A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213C2E	section	code abs=0x213C2E

sub_213C2E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x15)
	sub	A,2
	extz	WA
	extz	XWA
	ld	XHL,ArenaBracketSizes
	add	XHL,XWA
	ld	A,(XHL)
	ld	(XIZ+0x16),A
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	A,(XIZ+0x15)
	sub	A,2
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,ArenaBracketRows
	add	XHL,XWA
	ld	XDE,(XHL)
	ld	XHL,XIZ
	add	XHL,0x18
	ld	C,6
sub_213C2E.loop:
	ld	A,(XDE)
	cp	A,0xFF
	jr	NZ,sub_213C2E.skip2
	push	XDE
sub_213C2E.loop2:
	call	Random
	ld	W,0
	div	WA,0xF
	ld	A,W
	add	A,0x62
	ld	B,6
	sub	B,C
	jr	Z,sub_213C2E.skip
	ld	XDE,XHL
sub_213C2E.loop3:
	dec	1,XDE
	ld	W,(XDE)
	cp	A,W
	jr	Z,sub_213C2E.loop2
	djnz	B,sub_213C2E.loop3
sub_213C2E.skip:
	pop	XDE
sub_213C2E.skip2:
	ld	(XHL),A
	inc	1,XHL
	inc	1,XDE
	djnz	C,sub_213C2E.loop
	ld	W,(XIZ+0x15)
	cp	W,8
	jrl	NC,sub_213C2E.skip5
	ld	A,7
	sub	A,W
	ld	(XIZ+0x1E),A
	ld	XHL,XIZ
	add	XHL,0x18
	ld	XDE,0x60CC
	ld	C,6
sub_213C2E.loop4:
	push	XHL
	ld	A,(XHL)
	sub	A,0x62
	jrl	C,sub_213C2E.skip3
	cp	A,0xF
	jrl	NC,sub_213C2E.skip3
	ld	(XIZ+0x1F),A
	ld	W,0
	div	WA,3
	ld	(XIZ+0x20),A
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotCores
	add	XHL,XWA
	ld	A,(XHL)
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotBodyBase
	add	XHL,XWA
	ld	B,(XHL)
	ld	WA,0
	ld	A,(XIZ+0x20)
	mul	WA,3
	add	A,B
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotArmCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,0xF
	ld	XHL,ArenaPilotArms
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotArmCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,0xF
	ld	XHL,ArenaPilotArms
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotLegCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,5
	ld	XHL,0
	ld	L,(XIZ+0x20)
	add	XWA,XHL
	mul	XWA,3
	ld	XHL,ArenaPilotLegs
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	ld	XHL,ArenaPilotBackCounts
	add	XHL,XWA
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,5
	ld	XHL,0
	ld	L,(XIZ+0x20)
	add	XWA,XHL
	mul	XWA,3
	ld	XHL,ArenaPilotBacks
	add	XHL,XWA
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	sub	A,1
	add	A,1
	ld	(XDE),A
	inc	1,XDE
	jr	sub_213C2E.skip4
sub_213C2E.skip3:
	inc	6,XDE
sub_213C2E.skip4:
	pop	XHL
	inc	1,XHL
	dec	1,C
	jrl	NZ,sub_213C2E.loop4
sub_213C2E.skip5:
	calr	sub_213E19
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213E19	section	code abs=0x213E19

sub_213E19:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	(XIZ+0x1F),A
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x21),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213E34	section	code abs=0x213E34

sub_213E34:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	push	XHL
	call	ClearTextBox
	pop	XHL
	ld	E,3
	ld	C,0
	ld	A,4
	push	XHL
	call	sub_20768A
	pop	XHL
	ld	A,4
	call	DrawBoxString
	ld	C,3
sub_213E34.loop:
	push	C
	ld	A,4
	call	swp_20770B
	ld	XHL,XDE
	ld	XWA,0
	ld	A,C
	mul	XWA,6
	mul	XWA,0x10
	add	XHL,XWA
	ld	XWA,0
	ld	A,C
	sub	XWA,1
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	push	XDE
	ld	BC,6
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XDE
	ld	XWA,6
	sub	XWA,1
	mul	XWA,0x10
	add	XDE,XWA
	ld	C,8
sub_213E34.loop2:
	push	XDE
	ld	A,0x55
	ld	B,6
sub_213E34.loop3:
	rld	A,(XDE)
	add	XDE,1
	rld	A,(XDE)
	sub	XDE,0x11
	djnz	B,sub_213E34.loop3
	pop	XDE
	inc	2,XDE
	djnz	C,sub_213E34.loop2
	pop	C
	djnz	C,sub_213E34.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213EC1	section	code abs=0x213EC1

sub_213EC1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	push	XHL
	call	ClearTextBox
	pop	XHL
	ld	E,3
	ld	C,0
	ld	A,4
	push	XHL
	call	sub_20768A
	pop	XHL
	ld	A,4
	call	DrawBoxString
	ld	C,3
sub_213EC1.loop:
	push	C
	ld	A,4
	call	swp_20770B
	ld	XHL,XDE
	ld	XWA,0
	ld	A,C
	mul	XWA,6
	mul	XWA,0x10
	add	XHL,XWA
	ld	XWA,0
	ld	A,C
	sub	XWA,1
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	push	XDE
	ld	BC,6
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XDE
	add	XDE,1
	ld	C,8
sub_213EC1.loop2:
	push	XDE
	ld	A,0x55
	ld	B,6
sub_213EC1.loop3:
	rrd	A,(XDE)
	sub	XDE,1
	rrd	A,(XDE)
	add	XDE,0x11
	djnz	B,sub_213EC1.loop3
	pop	XDE
	inc	2,XDE
	djnz	C,sub_213EC1.loop2
	pop	C
	djnz	C,sub_213EC1.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213F46	section	code abs=0x213F46

sub_213F46:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	and	A,A
	jr	NZ,sub_213F46.skip
	calr	sub_213E34
	jr	sub_213F46.skip2
sub_213F46.skip:
	calr	sub_213EC1
sub_213F46.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213F5B	section	code abs=0x213F5B

sub_213F5B:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x1F)
	and	A,3
	mul	XWA,6
	ld	XHL,XWA
	ld	W,(XIZ+0x1F)
	srl	2,W
	ld	A,6
	sub	A,W
	sub	A,1
	extz	WA
	extz	XWA
	add	XHL,XWA
	mul	XHL,0x10
	ld	A,4
	call	swp_20770B
	add	XHL,XDE
	ld	A,2
	call	swp_20770B
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	ld	BC,0
	ld	C,(XIZ+0x1F)
	srl	2,BC
	inc	1,BC
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213FB5	section	code abs=0x213FB5

sub_213FB5:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x1F)
	and	A,3
	mul	XWA,6
	ld	XHL,XWA
	mul	XHL,0x10
	ld	A,4
	call	swp_20770B
	add	XHL,XDE
	ld	A,2
	call	swp_20770B
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,6
	mul	XWA,0x10
	add	XDE,XWA
	ld	W,(XIZ+0x1F)
	srl	2,W
	ld	A,6
	sub	A,W
	sub	A,1
	extz	WA
	extz	XWA
	mul	XWA,0x10
	add	XDE,XWA
	ld	BC,0
	ld	C,(XIZ+0x1F)
	srl	2,BC
	inc	1,BC
	mul	BC,8
	ldirw	(XDE+),(XHL+)
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214013	section	code abs=0x214013

sub_214013:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	and	A,A
	jr	NZ,sub_214013.skip
	calr	sub_213F5B
	jr	sub_214013.skip2
sub_214013.skip:
	calr	sub_213FB5
sub_214013.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214028	section	code abs=0x214028

sub_214028:
	push	XDE
	push	XBC
	push	XWA
	srl	1,A
	jr	C,sub_214028.skip2
	ld	W,(XIZ+0x16)
	sub	W,1
	cp	A,W
	jr	NZ,sub_214028.skip
	ld	A,5
sub_214028.skip:
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,Pointers_249CB8
	add	XHL,XWA
	ld	XHL,(XHL)
	jr	sub_214028.skip3
sub_214028.skip2:
	extz	WA
	extz	XWA
	ld	XHL,XIZ
	add	XHL,0x18
	add	XHL,XWA
	ld	A,(XHL)
	ld	L,A
	call	GetEnemyName
sub_214028.skip3:
	pop	XWA
	pop	XBC
	pop	XDE
	ret

c_214068	section	code abs=0x214068

sub_214068:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	swp_216732
	ld	A,(XIZ+0x16)
	sll	1,A
	ld	C,A
	ld	B,0
sub_214068.loop:
	push	BC
	ld	C,0
	ld	E,B
	ld	A,2
	call	sub_20768A
	ld	A,B
	calr	sub_214028
	ld	A,2
	call	DrawBoxString
	pop	BC
	inc	1,B
	djnz	C,sub_214068.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21409B	section	code abs=0x21409B

sub_21409B:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x1E)
	mul	XWA,2
	mul	XWA,6
	mul	XWA,0x10
	push	XWA
	ld	A,2
	call	swp_20770B
	pop	XWA
	add	XDE,XWA
	ld	BC,8
	mul	BC,2
	mul	BC,6
sub_21409B.loop:
	ld	WA,(XDE)
	xor	WA,0xAAAA
	ld	(XDE),WA
	inc	2,XDE
	djnz	BC,sub_21409B.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214122	section	code abs=0x214122

sub_214122:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_214122.skip
	jrl	sub_214122.skip12
sub_214122.skip:
	bit	5,A
	jr	Z,sub_214122.skip2
	calr	sub_21437A
	jrl	sub_214122.skip14
sub_214122.skip2:
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	Z,sub_214122.skip6
	cp	A,0
	jr	Z,sub_214122.skip9
	cp	A,2
	jr	NZ,sub_214122.skip3
	ld	W,0xA
	jr	sub_214122.skip4
sub_214122.skip3:
	ld	W,0x1E
sub_214122.skip4:
	ld	A,(XIZ+0x1F)
	inc	1,A
	ld	(XIZ+0x1F),A
	cp	A,W
	jrl	C,sub_214122.skip14
	ld	A,(XIZ+0x1E)
	srl	1,A
	ld	W,(XIZ+0x16)
	cp	A,W
	jr	C,sub_214122.skip5
	ld	A,4
	ld	(XIZ+0x20),A
	jr	sub_214122.skip13
sub_214122.skip5:
	ld	A,0
	ld	(XIZ+0x20),A
	jrl	sub_214122.skip14
sub_214122.skip6:
	ld	A,(XIZ+0x1E)
	and	A,1
	calr	sub_214013
	ld	A,(XIZ+0x1F)
	inc	1,A
	ld	(XIZ+0x1F),A
	cp	A,0x18
	jrl	NZ,sub_214122.skip14
	ld	A,(XIZ+0x1E)
	inc	1,A
	ld	(XIZ+0x1E),A
	ld	A,(XIZ+0x1E)
	and	A,1
	jr	Z,sub_214122.skip7
	ld	A,2
	jr	sub_214122.skip8
sub_214122.skip7:
	ld	A,3
sub_214122.skip8:
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x1F),A
	jr	sub_214122.skip14
sub_214122.skip9:
	ld	A,(XIZ+0x1E)
	calr	sub_214028
	ld	A,(XIZ+0x1E)
	and	A,1
	calr	sub_213F46
	ld	A,(XIZ+0x1E)
	and	A,1
	jr	Z,sub_214122.skip10
	ld	A,(XIZ+0x1E)
	srl	1,A
	calr	LoadArenaOpponent
	calr	sub_213B3A
	jr	sub_214122.skip11
sub_214122.skip10:
	calr	sub_213B5B
sub_214122.skip11:
	ld	A,1
	ld	(XIZ+0x20),A
	ld	A,0
	ld	(XIZ+0x1F),A
	jr	sub_214122.skip14
sub_214122.skip12:
	calr	sub_214068
	calr	sub_213B5B
	ld	A,0
	ld	(XIZ+0x21),A
sub_214122.skip13:
	call	ClearTextBox1
	ld	A,1
	ld	XHL,FightQuitText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	(XIZ+0x1E),A
	calr	LoadArenaOpponent
	calr	sub_21409B
	ld	A,0
	ld	(XIZ+0x10),A
	ld	A,3
	ld	(XIZ+0x2A),A
sub_214122.skip14:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21421D	section	code abs=0x21421D

sub_21421D:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,loc_21423C
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	calr	sub_2142EF
	jrl	loc_2142D5

c_214239	section	code abs=0x214239

swp_214239:
	jrl	0x2142EA

c_21423C	section	code abs=0x21423C

loc_21423C:
	bit	5,A
	jr	Z,loc_214258
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	calr	sub_2142EF
	jrl	loc_2142D5

c_214255	section	code abs=0x214255

swp_214255:
	jrl	0x2142EA

c_214258	section	code abs=0x214258

loc_214258:
	and	A,0xF
	jr	Z,loc_214258.skip4
	cp	A,4
	jr	NZ,loc_214258.skip2
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,loc_214258.skip
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	loc_214258.skip4
loc_214258.skip:
	jr	loc_214258.skip4
loc_214258.skip2:
	cp	A,8
	jr	NZ,loc_214258.skip4
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,loc_214258.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	loc_214258.skip4
loc_214258.skip3:
	jr	loc_214258.skip4
loc_214258.skip4:
	ld	A,(XIZ+0x21)
	cp	A,0
	jr	NZ,loc_2142D5
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x96
	jr	C,loc_2142D5
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,(XIZ+0x1E)
	ld	W,(XIZ+0x16)
	sub	W,1
	cp	A,W
	jr	Z,loc_214258.skip5
	inc	1,A
	ld	(XIZ+0x1E),A
	jr	loc_214258.skip6
loc_214258.skip5:
	ld	A,0
	ld	(XIZ+0x1E),A
	jr	loc_214258.skip6
loc_214258.skip6:
	calr	sub_214068
	calr	sub_21409B
	calr	sub_213B32

c_2142D5	section	code abs=0x2142D5

loc_2142D5:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x40
	add	WA,0x18
	ld	BC,WA
	ld	DE,0x7C
	call	DrawMenuCursor
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2142EF	section	code abs=0x2142EF

sub_2142EF:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	sub_214068
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	NZ,sub_2142EF.skip
	calr	sub_213201
	ld	A,0
	ld	(XIZ+0x21),A
	call	swp_216723
	call	dyn_216741
	call	sub_216779
	call	dyn_216757
	call	dyn_216788
	call	swp_2167C0
	call	dyn_21679E
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	HL,0x29
	calr	sub_213222
	ld	HL,0x15
	calr	DrawArenaParticipants
	ld	A,(XIZ+0x15)
	sub	A,2
	extz	WA
	extz	XWA
	sll	1,A
	ld	XHL,ArenaEntryCosts
	add	XHL,XWA
	ld	WA,(XHL)
	extz	XWA
	call	sub_2061EC
	ld	XBC,XWA
	ld	XWA,(wGP)
	call	sub_20622F
	ld	(wGP),XWA
	call	swp_21698A
	ld	A,0xB
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	sub_2142EF.skip2
sub_2142EF.skip:
	calr	sub_21437A
sub_2142EF.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21437A	section	code abs=0x21437A

sub_21437A:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	sub_213201
	ld	A,0
	ld	(XIZ+0x21),A
	call	swp_216723
	call	dyn_216741
	call	sub_216779
	call	dyn_216757
	call	dyn_216788
	call	swp_2167C0
	call	dyn_21679E
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	HL,0x29
	calr	sub_213222
	ld	HL,0x15
	calr	DrawArenaParticipants
	ld	A,0xC
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2143C8	section	code abs=0x2143C8

sub_2143C8:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,sub_2143C8.skip
	ld	A,2
	ld	(XIZ+0x2A),A
	jr	sub_2143C8.skip4
sub_2143C8.skip:
	cp	A,2
	jr	NZ,sub_2143C8.skip2
	calr	sub_214122
	jr	sub_2143C8.skip4
sub_2143C8.skip2:
	cp	A,3
	jr	NZ,sub_2143C8.skip3
	calr	sub_21421D
	jr	sub_2143C8.skip4
sub_2143C8.skip3:
	ld	A,1
	ld	(XIZ+0x2A),A
sub_2143C8.skip4:
	calr	sub_213B7F
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214401	section	code abs=0x214401

sub_214401:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wFadeLevel)
	sub	A,0x10
	bit	7,A
	jr	Z,sub_214401.skip
	ld	(wFadeLevel),A
	jr	sub_214401.skip2
sub_214401.skip:
	calr	sub_21320D
	ld	XWA,4
	call	PlayMusic
	ld	WA,0x10
	ld	BC,0
	ld	DE,0
	ld	HL,0x2B
	call	DrawPortrait
	ld	WA,0xCE
	ld	BC,0xA
	ld	DE,0x20
	ld	HL,0x2A
	call	DrawPortrait
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	(XIZ+0x2D),A
	ld	A,8
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(wFadeLevel),A
sub_214401.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21445B	section	code abs=0x21445B

sub_21445B:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_21445B.skip
	calr	sub_2144F7
	jrl	sub_21445B.skip7
sub_21445B.skip:
	bit	5,A
	jr	Z,sub_21445B.skip2
	calr	sub_2144F7
	jr	sub_21445B.skip7
sub_21445B.skip2:
	ld	A,(XIZ+0x2C)
	bit	0,A
	jr	NZ,sub_21445B.skip3
	ld	W,(XIZ+0x1E)
	ld	A,(0x584B)
	add	A,W
	ld	(0x584B),A
	ld	A,(0x5853)
	sub	A,W
	ld	(0x5853),A
	ld	A,(XIZ+0x2C)
	cp	A,0x14
	jr	C,sub_21445B.skip3
	ld	(wFadeLevel),A
sub_21445B.skip3:
	ld	A,(XIZ+0x2C)
	cp	A,0x14
	jr	NZ,sub_21445B.skip4
	ld	A,1
	ld	(XIZ+0x1E),A
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x84
	call	SoundCommand
	jr	sub_21445B.skip6
sub_21445B.skip4:
	cp	A,0x3C
	jr	NZ,sub_21445B.skip5
	ld	A,1
	ld	(XIZ+0x1E),A
	jr	sub_21445B.skip6
sub_21445B.skip5:
	cp	A,0x5A
	jr	NZ,sub_21445B.skip6
	ld	A,1
	ld	(XIZ+0x1E),A
	jr	sub_21445B.skip6
sub_21445B.skip6:
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ld	A,(XIZ+0x2C)
	cp	A,0x7F
	jr	NZ,sub_21445B.skip7
	calr	sub_2144F7
sub_21445B.skip7:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2144F7	section	code abs=0x2144F7

sub_2144F7:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x1E),A
	ld	A,0
	ld	(XIZ+0x1F),A
	ld	A,2
	ld	(XIZ+0x2A),A
	calr	sub_21320D
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,0
	ld	(0x584B),A
	ld	(0x5853),A
	ld	XWA,4
	call	PlayMusic
	ld	A,9
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21478C	section	code abs=0x21478C

sub_21478C:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	srl	3,A
	dec	2,A
	cp	A,1
	jr	C,sub_21478C.skip
	cp	A,0x13
	jr	NC,sub_21478C.skip
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XDE,7
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,0x9000
	add	XDE,XWA
	ld	WA,0
	ld	C,5
sub_21478C.loop:
	ld	(XDE),WA
	add	XDE,0x40
	djnz	C,sub_21478C.loop
sub_21478C.skip:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	ld	(0x584B),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2147DA	section	code abs=0x2147DA

sub_2147DA:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2C)
	srl	3,A
	inc	2,A
	cp	A,5
	jr	C,sub_2147DA.skip
	cp	A,0xF
	jr	NC,sub_2147DA.skip
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XDE,8
	mul	XDE,0x40
	add	XDE,XWA
	ld	XWA,0x9800
	add	XDE,XWA
	ld	WA,0
	ld	C,3
sub_2147DA.loop:
	ld	(XDE),WA
	add	XDE,0x40
	djnz	C,sub_2147DA.loop
sub_2147DA.skip:
	ld	A,0x98
	ld	W,(XIZ+0x2C)
	sub	A,W
	neg	A
	ld	(0x5853),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2148ED	section	code abs=0x2148ED

; [code] slides (task+0x2C -= 8, sub_21465C) then: enemy = task+0x18+task+0x1E with parts 0x60CC+6*slot for pilots 0x62-0x70, wAreaLevel = rank (task+0x15) - 1, LoadEnemy, 0x5DDA = 0, swp_207C00 (0x5DD9 = FF, sub_2062F5(BattleStart)), state +0x2A = 6; [play] arena_cs_duel_* screens
ArenaStartBattle:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	sub_21478C
	calr	sub_2147DA
	ld	BC,0x48
	ld	DE,0xFFEC
	ld	A,(XIZ+0x2C)
	extz	WA
	srl	1,WA
	add	DE,WA
	calr	sub_21465C
	ld	A,(XIZ+0x2C)
	dec	8,A
	ld	(XIZ+0x2C),A
	cp	A,0x98
	jr	C,ArenaStartBattle.skip3
	jr	Z,ArenaStartBattle.skip3
	calr	sub_21320D
	ld	A,0
	ld	(0x584B),A
	ld	(0x5853),A
	ld	(0x5855),A
	ld	E,(XIZ+0x1E)
	extz	DE
	extz	XDE
	ld	XHL,XIZ
	add	XHL,0x18
	add	XHL,XDE
	ld	A,(XHL)
	cp	A,0x62
	jr	C,ArenaStartBattle.skip
	cp	A,0x71
	jr	NC,ArenaStartBattle.skip
	ld	XHL,0x60CC
	mul	XDE,6
	add	XHL,XDE
	jr	ArenaStartBattle.skip2
ArenaStartBattle.skip:
	ld	XHL,0
ArenaStartBattle.skip2:
	ld	W,(XIZ+0x15)
	sub	W,2
	inc	1,W
	ld	(wAreaLevel),W
	call	LoadEnemy
	ldb	(wDungeonBattle),0
	call	swp_207C00
	ld	A,6
	ld	(XIZ+0x2A),A
ArenaStartBattle.skip3:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214979	section	code abs=0x214979

sub_214979:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wBattleResult)
	cp	A,0xFF
	jr	Z,sub_214979.skip
	ld	A,7
	ld	(XIZ+0x2A),A
sub_214979.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214990	section	code abs=0x214990

; [code] state 7 of sub_214A92 (after sub_214979 sees 0x5DD9 != FF): battle result 0 (BattleVictory) or 1 (enemy fled, swp_20C4B0) -> next opponent task+0x1E += 1, all task+0x16 done -> sub_2149DC, else state 2; result 2/3 (gave up / BattleDefeat) -> sub_214A33
ArenaAfterBattle:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wBattleResult)
	cp	A,0
	jr	Z,ArenaAfterBattle.skip
	cp	A,1
	jr	Z,ArenaAfterBattle.skip
	calr	ArenaBattleLost
	jr	ArenaAfterBattle.skip4
ArenaAfterBattle.skip:
	ld	A,(XIZ+0x1E)
	inc	1,A
	ld	(XIZ+0x1E),A
	ld	W,(XIZ+0x16)
	cp	A,W
	jr	C,ArenaAfterBattle.skip2
	calr	sub_2149DC
	jr	ArenaAfterBattle.skip4
ArenaAfterBattle.skip2:
	cp	A,5
	jr	NZ,ArenaAfterBattle.skip3
	ld	A,(XIZ+0x15)
	cp	A,8
	jr	NZ,ArenaAfterBattle.skip3
	call	GetStageArenaRank
	cp	A,7
	jr	NZ,ArenaAfterBattle.skip3
	ld	A,1
	ld	(XIZ+0x1F),A
ArenaAfterBattle.skip3:
	ld	A,2
	ld	(XIZ+0x2A),A
ArenaAfterBattle.skip4:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2149DC	section	code abs=0x2149DC

sub_2149DC:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x15)
	cp	A,8
	jr	NZ,sub_2149DC.skip
	call	GetStageArenaRank
	cp	A,7
	jr	NZ,sub_2149DC.skip
	call	dyn_2167CF
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	call	dyn_2166C9
	ld	HL,0x3A
	calr	DrawArenaParticipants
	ld	A,0
	ld	(XIZ+0x13),A
	push	XWA
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x20
	call	SoundCommand
	pop	XWA
	jr	sub_2149DC.skip2
sub_2149DC.skip:
	call	SetupArenaScreen
sub_2149DC.skip2:
	calr	GetArenaRankFirstScene
	ld	(XIZ+0x12),W
	ld	A,9
	ld	(XIZ+0x2A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214A33	section	code abs=0x214A33

; [code] only from sub_214990 on battle result 2 (swp_20CD32 "You gave up") or 3 (BattleDefeat): scene 0x42 for slot 5 of rank 8 at stage rank 7 (PlayMusic 0, TASK_ARG 3), else SetupArenaScreen, scene 4, state +0x2A = 9
ArenaBattleLost:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x1E)
	cp	A,5
	jr	NZ,ArenaBattleLost.skip
	ld	A,(XIZ+0x15)
	cp	A,8
	jr	NZ,ArenaBattleLost.skip
	call	GetStageArenaRank
	cp	A,7
	jr	NZ,ArenaBattleLost.skip
	call	dyn_2166B3
	call	dyn_2166C9
	ld	A,0x42
	ld	(XIZ+0x12),A
	push	XWA
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x20
	call	SoundCommand
	pop	XWA
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	ArenaBattleLost.skip2
ArenaBattleLost.skip:
	call	SetupArenaScreen
	ld	A,4
	ld	(XIZ+0x12),A
	ld	A,9
	ld	(XIZ+0x2A),A
ArenaBattleLost.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214A84	section	code abs=0x214A84

sub_214A84:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214A92	section	code abs=0x214A92

sub_214A92:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,sub_214A92.skip
	ld	A,3
	ld	(XIZ+0x2A),A
	jr	sub_214A92.skip9
sub_214A92.skip:
	cp	A,2
	jr	NZ,sub_214A92.skip2
	calr	sub_214829
	jr	sub_214A92.skip9
sub_214A92.skip2:
	cp	A,3
	jr	NZ,sub_214A92.skip3
	calr	sub_214859
	jr	sub_214A92.skip9
sub_214A92.skip3:
	cp	A,4
	jr	NZ,sub_214A92.skip4
	calr	sub_2148C4
	jr	sub_214A92.skip9
sub_214A92.skip4:
	cp	A,5
	jr	NZ,sub_214A92.skip5
	calr	ArenaStartBattle
	jr	sub_214A92.skip9
sub_214A92.skip5:
	cp	A,6
	jr	NZ,sub_214A92.skip6
	calr	sub_214979
	jr	sub_214A92.skip9
sub_214A92.skip6:
	cp	A,7
	jr	NZ,sub_214A92.skip7
	calr	ArenaAfterBattle
	jr	sub_214A92.skip9
sub_214A92.skip7:
	cp	A,9
	jr	NZ,sub_214A92.skip8
	calr	sub_214A84
	jr	sub_214A92.skip9
sub_214A92.skip8:
	ld	A,1
	ld	(XIZ+0x2A),A
sub_214A92.skip9:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214AF6	section	code abs=0x214AF6

swp_214AF6:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,2
	ld	(XIZ+0x2A),A
	ld	A,0xA
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B0F	section	code abs=0x214B0F

sub_214B0F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	call	dyn_216E67
	cp	A,1
	jr	Z,sub_214B0F.skip
	call	dyn_216EDE
	call	dyn_216F8E
	call	dyn_216E31
	call	dyn_2167F9
	calr	sub_21323D
	ld	XHL,swp_210467
	call	StartTask
	ld	A,3
	ld	(XIZ+0x2A),A
sub_214B0F.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B43	section	code abs=0x214B43

sub_214B43:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(0x5FF9)
	cp	A,0xFF
	jr	Z,sub_214B43.skip2
	cp	A,0
	jr	Z,sub_214B43.skip
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jr	sub_214B43.skip2
sub_214B43.skip:
	call	dyn_216E3A
	call	dyn_206803
	call	SetupArenaScreen
	ld	A,3
	ld	(XIZ+0xF),A
	ld	A,6
	ld	(XIZ+0x12),A
	calr	DrawArenaSceneCast
	ld	A,0xA
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+0x2A),A
sub_214B43.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B83	section	code abs=0x214B83

sub_214B83:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,4
	call	dyn_216E43
	cp	A,1
	jr	Z,sub_214B83.skip
	ld	A,3
	ld	(XIZ+TASK_ARG),A
sub_214B83.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214B9B	section	code abs=0x214B9B

sub_214B9B:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,sub_214B9B.skip
	ld	A,2
	ld	(XIZ+0x2A),A
	jr	sub_214B9B.skip5
sub_214B9B.skip:
	cp	A,2
	jr	NZ,sub_214B9B.skip2
	calr	sub_214B0F
	jr	sub_214B9B.skip5
sub_214B9B.skip2:
	cp	A,3
	jr	NZ,sub_214B9B.skip3
	calr	sub_214B43
	jr	sub_214B9B.skip5
sub_214B9B.skip3:
	cp	A,4
	jr	NZ,sub_214B9B.skip4
	calr	sub_214B83
	jr	sub_214B9B.skip5
sub_214B9B.skip4:
	ld	A,1
	ld	(XIZ+0x2A),A
sub_214B9B.skip5:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214BD2	section	code abs=0x214BD2

sub_214BD2:
	ld	A,1
	call	dyn_216E67
	cp	A,1
	jr	Z,sub_214BD2.done
	call	dyn_2166DC
	ld	A,6
	ld	(0x5FF9),A
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
sub_214BD2.done:
	ret

c_214BEC	section	code abs=0x214BEC

swp_214BEC:
	call	dyn_206803
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	A,0
	ld	(XIZ+0x15),A
	ld	XWA,dyn_214C97
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_214C0E	section	code abs=0x214C0E

dyn_214C0E:
	call	GetStoryStage
	cp	A,0
	jr	NZ,dyn_214C30
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,1
	jr	Z,dyn_214C30
	call	dyn_206803
	call	dyn_206825
	ld	A,7
	ld	(XIZ+0x15),A
	jr	0x214C62

c_214C30	section	code abs=0x214C30

dyn_214C30:
	call	GetStoryStage
	cp	A,0xA
	jr	NZ,dyn_214C53
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,1
	jr	Z,dyn_214C53
	call	dyn_206803
	call	dyn_206825
	ld	A,8
	ld	(XIZ+0x15),A
	jr	0x214C62

c_214FA4	section	code abs=0x214FA4

; [code] LoadTalkSlots (sub_214F3D), then per slot GetTalkRow (dyn_214D97) and the speaker name 0x249F66[row speaker - 0x15] + newline 0x249FA1 in box 2; box 1 TalkWithWhoText; +0xF = 2, TASK_ARG 4; [play] *_talk_menu, square_menu
ShowTalkMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_216779
	calr	LoadTalkSlots
	ld	C,(XIZ+0x1A)
	cp	C,0
	jr	Z,ShowTalkMenu.skip
	ld	XHL,XIZ
	add	XHL,0x1E
	ld	XDE,XHL
	ld	W,(XIZ+0x15)
ShowTalkMenu.loop:
	push	XDE
	push	C
	push	W
	ld	A,(XDE)
	calr	GetTalkRow
	ld	A,(XHL+0)
	sub	A,0x15
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,NpcNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	DrawBoxString
	ld	XHL,NewlineText2
	ld	A,2
	call	DrawBoxString
	pop	W
	pop	C
	pop	XDE
	inc	1,XDE
	djnz	C,ShowTalkMenu.loop
ShowTalkMenu.skip:
	calr	sub_214D64
	ld	A,0
	ld	(XIZ+0x13),A
	ld	A,1
	call	ClearTextBox
	ld	XHL,TalkWithWhoText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	(XIZ+0x2C),A
	ld	A,2
	ld	(XIZ+0xF),A
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215031	section	code abs=0x215031

sub_215031:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	ShowTalkMenu
	calr	DrawTownPlace
	ld	A,(XIZ+0x1A)
	cp	A,0
	jr	NZ,sub_215031.skip
	ld	A,8
	jr	sub_215031.skip2
sub_215031.skip:
	ld	A,0
sub_215031.skip2:
	ld	(XIZ+0x10),A
	call	dyn_216FB1
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166B3	section	code abs=0x2166B3

dyn_2166B3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x10
	ld	A,1
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166C9	section	code abs=0x2166C9

dyn_2166C9:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	C,0
	ld	E,0x2E
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166DC	section	code abs=0x2166DC

dyn_2166DC:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166EB	section	code abs=0x2166EB

; [code] whole body = A=1, call ClearTextBox, all registers (XWA/XBC/XDE/XHL) saved; called directly (call dyn_2166EB) from arena.asm x4 and town.asm x5
ClearTextBox1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166FA	section	code abs=0x2166FA

swp_2166FA:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x46
	ld	A,2
	ld	C,8
	ld	E,0xE
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216710	section	code abs=0x216710

swp_216710:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216723	section	code abs=0x216723

swp_216723:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216732	section	code abs=0x216732

swp_216732:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216741	section	code abs=0x216741

dyn_216741:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x46
	ld	A,2
	ld	C,8
	ld	E,0xB
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216757	section	code abs=0x216757

dyn_216757:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21676A	section	code abs=0x21676A

dyn_21676A:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216779	section	code abs=0x216779

sub_216779:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216788	section	code abs=0x216788

dyn_216788:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x8E
	ld	A,3
	ld	C,8
	ld	E,3
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21679E	section	code abs=0x21679E

dyn_21679E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	C,0xC
	ld	E,0x2B
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167B1	section	code abs=0x2167B1

dyn_2167B1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167C0	section	code abs=0x2167C0

swp_2167C0:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167CF	section	code abs=0x2167CF

dyn_2167CF:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2166B3
	call	dyn_216741
	call	dyn_216788
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167E4	section	code abs=0x2167E4

dyn_2167E4:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2166C9
	call	dyn_216757
	call	dyn_21679E
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167F9	section	code abs=0x2167F9

dyn_2167F9:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2166DC
	call	dyn_21676A
	call	dyn_2167B1
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21680E	section	code abs=0x21680E

swp_21680E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2166B3
	call	swp_2166FA
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21681F	section	code abs=0x21681F

swp_21681F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2166C9
	call	swp_216710
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216830	section	code abs=0x216830

swp_216830:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2166DC
	call	swp_216723
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216841	section	code abs=0x216841

swp_216841:
	ld	WA,0x1E4
	ret

c_216845	section	code abs=0x216845

dyn_216845:
	ld	WA,0x94
	ret

c_21698A	section	code abs=0x21698A

swp_21698A:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_TALKED_JON
	call	SetEventFlag
	ld	HL,EVENT_TALKED_LILY
	call	SetEventFlag
	ld	HL,EVENT_TALKED_CYRIUS
	call	SetEventFlag
	ld	HL,EVENT_TALKED_WYSE
	call	SetEventFlag
	ld	HL,EVENT_TALKED_ZIGGY
	call	SetEventFlag
	ld	HL,EVENT_TALKED_CEUS
	call	SetEventFlag
	ld	HL,EVENT_TALKED_HELMUT
	call	SetEventFlag
	ld	HL,EVENT_TALKED_ALDA
	call	SetEventFlag
	ld	HL,EVENT_TALKED_CAMIL
	call	SetEventFlag
	ld	HL,EVENT_TALKED_MEESE
	call	SetEventFlag
	ld	HL,EVENT_TALKED_COLLA
	call	SetEventFlag
	ld	HL,EVENT_TALKED_TETIS
	call	SetEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216A4E	section	code abs=0x216A4E

; [code] A = EVENT_TALKED_JON
CheckTalkedJon:
	push	XHL
	push	BC
	ld	HL,EVENT_TALKED_JON
	call	CheckEventFlag
	ld	A,L
	pop	BC
	pop	XHL
	ret

c_216A5C	section	code abs=0x216A5C

; [code] sets EVENT_TALKED_JON
SetTalkedJon:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_TALKED_JON
	call	SetEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216A78	section	code abs=0x216A78

; [code] sets EVENT_JON_NOT_READY_SEEN (Jon row 0x3F's action 3)
SetJonNotReadySeen:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_JON_NOT_READY_SEEN
	call	SetEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216A86	section	code abs=0x216A86

; [code] A = EVENT_STAGE_LILY
CheckStageLily:
	push	XHL
	push	BC
	ld	HL,EVENT_STAGE_LILY
	call	CheckEventFlag
	ld	A,L
	pop	BC
	pop	XHL
	ret

c_216C1F	section	code abs=0x216C1F

swp_216C1F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	sub_216C75
	pop	WA
	ld	B,0
swp_216C1F.loop:
	ld	C,0
swp_216C1F.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,swp_216C1F.skip
	or	DE,0x4000
	jr	swp_216C1F.skip2
swp_216C1F.skip:
	or	DE,0
swp_216C1F.skip2:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0xC
	jr	C,swp_216C1F.loop2
	ld	XDE,0x20
	sub	XDE,0xC
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0xE
	jr	C,swp_216C1F.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216C75	section	code abs=0x216C75

sub_216C75:
	push	XHL
	push	XDE
	push	XBC
	sra	1,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,0xA000
	add	XHL,XWA
	ld	B,8
sub_216C75.loop:
	cp	C,B
	jr	C,sub_216C75.skip
	ld	WA,0
	jr	sub_216C75.skip2
sub_216C75.skip:
	ld	WA,0xFFFF
sub_216C75.skip2:
	ld	(XHL),WA
	inc	2,XHL
	djnz	B,sub_216C75.loop
	cp	C,8
	jr	Z,sub_216C75.skip3
	ld	A,1
	jr	sub_216C75.skip4
sub_216C75.skip3:
	ld	A,0
sub_216C75.skip4:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216CAA	section	code abs=0x216CAA

swp_216CAA:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	sub_216D00
	pop	WA
	ld	B,0
swp_216CAA.loop:
	ld	C,0
swp_216CAA.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,swp_216CAA.skip
	or	DE,0
	jr	swp_216CAA.skip2
swp_216CAA.skip:
	or	DE,0x4000
swp_216CAA.skip2:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0xC
	jr	C,swp_216CAA.loop2
	ld	XDE,0x20
	sub	XDE,0xC
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0xE
	jr	C,swp_216CAA.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D00	section	code abs=0x216D00

sub_216D00:
	push	XHL
	push	XDE
	push	XBC
	sra	1,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,0xA000
	add	XHL,XWA
	ld	B,8
sub_216D00.loop:
	cp	C,B
	jr	C,sub_216D00.skip
	ld	WA,0xFFFF
	jr	sub_216D00.skip2
sub_216D00.skip:
	ld	WA,0
sub_216D00.skip2:
	ld	(XHL),WA
	inc	2,XHL
	djnz	B,sub_216D00.loop
	cp	C,0x10
	jr	Z,sub_216D00.skip3
	ld	A,1
	jr	sub_216D00.skip4
sub_216D00.skip3:
	ld	A,0
sub_216D00.skip4:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D35	section	code abs=0x216D35

swp_216D35:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,0
	ld	B,0
swp_216D35.loop:
	ld	C,0
swp_216D35.loop2:
	ld	(XHL),WA
	inc	2,XHL
	inc	1,C
	cp	C,0x14
	jr	C,swp_216D35.loop2
	ld	XDE,0x20
	sub	XDE,0x14
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0x13
	jr	C,swp_216D35.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216D66	section	code abs=0x216D66

swp_216D66:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	WA
	and	WA,0x1FF
	ld	BC,0
	call	sub_216DCD
	pop	WA
	ld	B,0
swp_216D66.loop:
	ld	C,0
swp_216D66.loop2:
	push	WA
	ld	DE,0
	ld	A,B
	and	A,1
	jr	Z,swp_216D66.skip
	or	DE,0x4000
	jr	swp_216D66.skip2
swp_216D66.skip:
	or	DE,0
swp_216D66.skip2:
	ld	A,C
	and	A,1
	jr	Z,swp_216D66.skip3
	or	DE,0
	jr	swp_216D66.skip4
swp_216D66.skip3:
	or	DE,0x8000
swp_216D66.skip4:
	pop	WA
	or	DE,WA
	or	DE,0x3E00
	ld	(XHL),DE
	inc	2,XHL
	inc	1,C
	cp	C,0x14
	jr	C,swp_216D66.loop2
	ld	XDE,0x20
	sub	XDE,0x14
	sll	1,XDE
	add	XHL,XDE
	inc	1,B
	cp	B,0x13
	jr	C,swp_216D66.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216DCD	section	code abs=0x216DCD

sub_216DCD:
	push	XHL
	push	XDE
	push	XBC
	sra	2,BC
	extz	XWA
	sll	4,XWA
	ld	XHL,0xA000
	add	XHL,XWA
	ld	B,0x10
sub_216DCD.loop:
	ld	A,0
	ld	XDE,XHL
	and	XDE,1
	jr	Z,sub_216DCD.skip
	sub	A,4
sub_216DCD.skip:
	ld	XDE,XHL
	srl	1,XDE
	and	XDE,7
	sub	A,E
	add	A,C
	bit	7,A
	jr	NZ,sub_216DCD.skip2
	cp	A,4
	jr	C,sub_216DCD.skip3
	ld	A,4
	jr	sub_216DCD.skip3
sub_216DCD.skip2:
	ld	A,0
sub_216DCD.skip3:
	extz	WA
	extz	XWA
	ld	XDE,PixelFillBytes
	add	XDE,XWA
	ld	A,(XDE)
	ld	(XHL),A
	inc	1,XHL
	djnz	B,sub_216DCD.loop
	cp	C,0x14
	jr	Z,sub_216DCD.skip4
	ld	A,1
	jr	sub_216DCD.skip5
sub_216DCD.skip4:
	ld	A,0
sub_216DCD.skip5:
	pop	XBC
	pop	XDE
	pop	XHL
	ret
