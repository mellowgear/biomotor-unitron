; engine/player: 23 routines (each keeps its ROM address in its own section)

c_2061D4	section	code abs=0x2061D4

dyn_2061D4:
	inc	1,W
	ld	XHL,wItemCounts
	lda	XHL,XHL+WA
	ld	A,(XHL)
	ld	W,A
	and	A,0xF
	sll	1,W
	ccf
	ret

c_2061EC	section	code abs=0x2061EC

sub_2061EC:
	push	XDE
	push	BC
	ld	C,8
sub_2061EC.loop:
	srl	4,XDE
	extz	XWA
	div	XWA,0xA
	sll	4,QA
	ld	B,QD
	or	B,QA
	ld	QD,B
	djnz	C,sub_2061EC.loop
	ld	XWA,XDE
	pop	BC
	pop	XDE
	ret

c_20620E	section	code abs=0x20620E

sub_20620E:
	push	XBC
	add	A,C
	daa	A
	adc	W,B
	daa	W
	ld	C,QA
	adc	C,QC
	daa	C
	ld	QA,C
	ld	C,QW
	adc	C,QB
	daa	C
	ld	QW,C
	pop	XBC
	ret

c_20622F	section	code abs=0x20622F

sub_20622F:
	push	XBC
	sub	A,C
	daa	A
	sbc	W,B
	daa	W
	ld	C,QA
	sbc	C,QC
	daa	C
	ld	QA,C
	ld	C,QW
	sbc	C,QB
	daa	C
	ld	QW,C
	pop	XBC
	ret

c_207ADB	section	code abs=0x207ADB

swp_207ADB:
	ret

c_207ADC	section	code abs=0x207ADC

swp_207ADC:
	addb	(wCritChance),5
	ret

c_207AE2	section	code abs=0x207AE2

swp_207AE2:
	addb	(wCritChance),8
	ret

c_207AE8	section	code abs=0x207AE8

swp_207AE8:
	addb	(wCritChance),0xA
	ret

c_207AEE	section	code abs=0x207AEE

swp_207AEE:
	addb	(0x5D91),0xF6
	ret

c_207AF4	section	code abs=0x207AF4

swp_207AF4:
	addb	(0x5D91),0xEC
	ret

c_207AFA	section	code abs=0x207AFA

swp_207AFA:
	addb	(0x5D91),0xE2
	ret

c_207B00	section	code abs=0x207B00

swp_207B00:
	addb	(0x5D92),0xF
	ret

c_207B06	section	code abs=0x207B06

swp_207B06:
	addb	(0x5D92),0x1E
	ret

c_207B0C	section	code abs=0x207B0C

swp_207B0C:
	addb	(0x5D92),0x32
	ret

c_207B12	section	code abs=0x207B12

; if wExpToNext <= 0: next level, stat gains; CF = levelled up
TryLevelUp:
	ld	B,(wPlayerLevel)
	cp	B,0x32
	jr	C,dyn_207B23
	ldw	(wExpToNext),0
	rcf
	ret

c_207B23	section	code abs=0x207B23

dyn_207B23:
	cpw	(wExpToNext),0
	jr	LE,LevelUpStatGains
	rcf
	ret

c_207B2D	section	code abs=0x207B2D

; [code] LevelGains + random LevelBonus into wPilotAP..MP
LevelUpStatGains:
	ld	XHL,0
	ld	L,(wPlayerRace)
	dec	1,L
	srl	1,XHL
	sll	2,XHL
	add	XHL,ExpCurves
	ld	XHL,(XHL)
	ld	A,(wPlayerLevel)
	ld	W,0
	sll	1,WA
	ld	WA,(XHL+WA)
	add	(wExpToNext),WA
	bit	0,(wPlayerRace)
	ld	XHL,LevelGainsOdd
	jr	NZ,0x207B65
	ld	XHL,LevelGainsEven
	ld	A,(wPlayerLevel)
	ld	W,0
	sll	2,WA
	lda	XHL,XHL+WA
	ld	W,0
	ld	A,(XHL+)
	add	(wPilotAP),WA
	ld	A,(XHL+)
	add	(wPilotSP),WA
	ld	A,(XHL+)
	add	(wPilotRP),WA
	ld	A,(XHL+)
	add	(wPilotMP),WA
	ld	A,(wPlayerRace)
	dec	1,A
	ld	W,0
	sll	2,WA
	ld	XHL,LevelBonus
	lda	XHL,XHL+WA
	ld	A,(XHL+)
	or	A,A
	jr	Z,0x207BBB
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotAP),WA
	ld	A,(XHL+)
	or	A,A
	jr	Z,0x207BD0
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotSP),WA
	ld	A,(XHL+)
	or	A,A
	jr	Z,0x207BE5
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotRP),WA
	ld	A,(XHL+)
	or	A,A
	jr	Z,0x207BFA
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotMP),WA
	incb	1,(wPlayerLevel)
	scf
	ret

c_20868B	section	code abs=0x20868B

; robot stats = pilot stats + equipped parts
CalcUnitStats:
	ldw	(wUnitAP),(wPilotAP)
	ldw	(wUnitSP),(wPilotSP)
	ldw	(wUnitRP),(wPilotRP)
	ldw	(wUnitMP),(wPilotMP)
	ld	L,(wEquipBody)
	or	L,L
	jr	Z,0x2086EE
	call	GetBodyRecord
	ldw	(wUnitMaxHP),(XHL+PART_HP)
	ldw	(wUnitMaxEP),(XHL+PART_EP)
	ldw	(wUnitAffinity),(XHL+PART_AFFINITY)
	ld	WA,(XHL+PART_AP)
	add	(wUnitAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wUnitSP),WA
	ld	WA,(XHL+PART_RP)
	add	(wUnitRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wUnitMP),WA
	ld	A,(wEquipBody)
	ld	W,0
	dec	1,WA
	add	WA,(PartCategoryStart)
	call	dyn_2061D4
	orb	(XHL),0x80
	ld	L,(wEquipCore)
	or	L,L
	jr	Z,0x208738
	call	GetCoreRecord
	ld	WA,(XHL+PART_HP)
	add	(wUnitMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wUnitMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wUnitAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wUnitSP),WA
	ld	WA,(XHL+PART_RP)
	add	(wUnitRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wUnitMP),WA
	ld	A,(wEquipCore)
	ld	W,0
	dec	1,WA
	add	WA,(PartCategoryStart+0x2)
	call	dyn_2061D4
	orb	(XHL),0x80
	ld	L,(wEquipRightArm)
	or	L,L
	jr	Z,0x208782
	call	GetArmRecord
	ld	WA,(XHL+PART_HP)
	add	(wUnitMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wUnitMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wUnitAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wUnitSP),WA
	ld	WA,(XHL+PART_RP)
	add	(wUnitRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wUnitMP),WA
	ld	A,(wEquipRightArm)
	ld	W,0
	dec	1,WA
	add	WA,(PartCategoryStart+0x8)
	call	dyn_2061D4
	orb	(XHL),0x80
	ld	L,(wEquipLeftArm)
	or	L,L
	jr	Z,0x2087CC
	call	GetArmRecord
	ld	WA,(XHL+PART_HP)
	add	(wUnitMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wUnitMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wUnitAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wUnitSP),WA
	ld	WA,(XHL+PART_RP)
	add	(wUnitRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wUnitMP),WA
	ld	A,(wEquipLeftArm)
	ld	W,0
	dec	1,WA
	add	WA,(PartCategoryStart+0x8)
	call	dyn_2061D4
	orb	(XHL),0x80
	ld	L,(wEquipLegs)
	or	L,L
	jr	Z,0x208816
	call	GetLegsRecord
	ld	WA,(XHL+PART_HP)
	add	(wUnitMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wUnitMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wUnitAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wUnitSP),WA
	ld	WA,(XHL+PART_RP)
	add	(wUnitRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wUnitMP),WA
	ld	A,(wEquipLegs)
	ld	W,0
	dec	1,WA
	add	WA,(PartCategoryStart+0x4)
	call	dyn_2061D4
	orb	(XHL),0x80
	ld	L,(wEquipBack)
	or	L,L
	jr	Z,0x208860
	call	GetBackRecord
	ld	WA,(XHL+PART_HP)
	add	(wUnitMaxHP),WA
	ld	WA,(XHL+PART_EP)
	add	(wUnitMaxEP),WA
	ld	WA,(XHL+PART_AP)
	add	(wUnitAP),WA
	ld	WA,(XHL+PART_SP)
	add	(wUnitSP),WA
	ld	WA,(XHL+PART_RP)
	add	(wUnitRP),WA
	ld	WA,(XHL+PART_MP)
	add	(wUnitMP),WA
	ld	A,(wEquipBack)
	ld	W,0
	dec	1,WA
	add	WA,(PartCategoryStart+0x6)
	call	dyn_2061D4
	orb	(XHL),0x80
	ld	WA,0
	ld	L,(wEquipAcc1)
	calr	dyn_208879
	ld	L,(wEquipAcc2)
	calr	dyn_208879
	or	WA,WA
	ret	OV
	ld	(wUnitAffinity),WA
	ret

c_208879	section	code abs=0x208879

dyn_208879:
	or	L,L
	ret	Z
	extz	HL
	sll	2,HL
	extz	XHL
	add	XHL,Pointers_20888E
	ld	XHL,(XHL)
	jp	XHL

c_208AE4	section	code abs=0x208AE4

; WA = amount; BCD add to wGP, capped at 999999
AddGP:
	extz	XWA
	call	sub_2061EC
	ld	XBC,(wGP)
	call	sub_20620E
	ld	(wGP),XWA
	ld	XBC,0x999999
	call	sub_20622F
	ccf
	ret	NC
	ld	XWA,0x999999
	ld	(wGP),XWA
	ret

c_208B0C	section	code abs=0x208B0C

swp_208B0C:
	ld	A,(XIZ+0x12)
	ld	(XIZ+0x14),A
	ldw	(XIZ+TASK_FUNC),0x8B1C
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	A,0xFF
	mul	WA,(XIZ+0x14)
	div	WA,(XIZ+0x12)
	cpl	A
	ld	B,A
	ld	D,A
	ld	C,(XIZ+TASK_ARG)
	ld	E,(XIZ+0x10)
	call	sub_206D30
	cpb	(XIZ+0x14),0
	jp	Z,EndTask
	decb	1,(XIZ+0x14)
	ret

c_208B41	section	code abs=0x208B41

swp_208B41:
	ld	A,(XIZ+0x12)
	ld	(XIZ+0x14),A
	ldw	(XIZ+TASK_FUNC),0x8B51
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	A,0xFF
	mul	WA,(XIZ+0x14)
	div	WA,(XIZ+0x12)
	ld	B,A
	ld	D,A
	ld	C,(XIZ+TASK_ARG)
	ld	E,(XIZ+0x10)
	call	sub_206D30
	cpb	(XIZ+0x14),0
	jp	Z,EndTask
	decb	1,(XIZ+0x14)
	ret

c_21D647	section	code abs=0x21D647

; [code] clear stats, level 0 -> 1, CalcUnitStats
NewGameSetup:
	call	dyn_206863
	ld	XHL,SelectPlayerTask
	call	StartChildTask
	task_wait
	cpb	(wPlayerRace),0
	ld	XHL,MainMenuTask
	jrl	Z,0x21D734
	ld	XHL,wEventFlags
	ld	BC,0x10
	ldw	(XHL+),0
	djnz	BC,0x21D677
	ld	XHL,0x5080
	ld	BC,0x200
	ldb	(XHL+),0
	djnz	BC,0x21D687
	ld	WA,0
	ld	(wSkill1),A
	ld	(wSkill2),A
	ld	(wPilotAP),WA
	ld	(wPilotSP),WA
	ld	(wPilotRP),WA
	ld	(wPilotMP),WA
	ld	(wPlayerLevel),A
	ld	(wExpToNext),WA
	call	TryLevelUp
	call	TryLevelUp
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	mul	WA,6
	ld	XHL,StartingEquipment
	lda	XHL,XHL+WA
	ld	XDE,wEquipCore
	ld	BC,6
	ldir	(XDE+),(XHL+)
	ldb	(wEquipAcc1),0
	ldb	(wEquipAcc2),0
	call	CalcUnitStats
	ldw	(wUnitHP),(wUnitMaxHP)
	ldw	(wUnitEP),(wUnitMaxEP)
	ld	A,(wEquipRightArm)
	ld	W,0
	dec	1,WA
	add	WA,(PartCategoryStart+0x8)
	call	dyn_206195
	ldb	(wEngineerLevel),1
	ldw	(wEngineerExp),5
	ld	XWA,0
	ld	(wGP),XWA
	ldb	(wArenaRank),0
	ld	XHL,StorySceneUniticeSetup
	call	StartChildTask
	task_wait
	ld	XHL,StreetGoWorks
	ld	(XIZ+TASK_FUNC),XHL
	ret
