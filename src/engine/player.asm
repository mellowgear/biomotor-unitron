; engine/player: 42 routines (each keeps its ROM address in its own section)

c_206195	section	code abs=0x206195

; [code] W + 1, then AddItem: WA = part index -> its count byte in wItemCounts + 0x100 (wPartCounts) + 1 (max 9), bit 7 set; NewGameSetup adds the starting right arm with it
AddPart:
	inc	1,W

c_2061D4	section	code abs=0x2061D4

; [code] W + 1: XHL = wItemCounts + 0x100 + WA (the part count bytes, wPartCounts), A = count (low nibble), carry = bit 7 (owned) clear; CalcUnitStats sets bit 7 for every equipped part
GetPartInventoryByte:
	inc	1,W
; [code] the shared tail, also called directly with WA = index into wItemCounts (the item count bytes; parts start at 0x100): A = count (low nibble), carry = bit 7 clear
GetInventoryByte:
	ld	XHL,wItemCounts
	lda	XHL,XHL+WA
	ld	A,(XHL)
	ld	W,A
	and	A,0xF
	sll	1,W
	ccf
	ret

c_2061EC	section	code abs=0x2061EC

; [code] XWA (binary) -> XWA = 8 packed-BCD digits (div 10 per digit into XDE); AddGP uses it before adding to wGP
BinToBCD:
	push	XDE
	push	BC
	ld	C,8
BinToBCD.loop:
	srl	4,XDE
	extz	XWA
	div	XWA,0xA
	sll	4,QA
	ld	B,QD
	or	B,QA
	ld	QD,B
	djnz	C,BinToBCD.loop
	ld	XWA,XDE
	pop	BC
	pop	XDE
	ret

c_20620E	section	code abs=0x20620E

; [code] XWA = XWA + XBC as 4 packed-BCD bytes (add/adc + daa)
AddBCD:
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

; [code] XWA = XWA - XBC as 4 packed-BCD bytes (sub/sbc + daa), carry = borrow; AddGP compares against 0x999999 with it
SubBCD:
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

c_207B12	section	code abs=0x207B12

; if wExpToNext <= 0: next level, stat gains; CF = levelled up
TryLevelUp:
	ld	B,(wPlayerLevel)
	cp	B,0x32
	jr	C,TryLevelUpBelowMax
	ldw	(wExpToNext),0
	rcf
	ret

c_207B23	section	code abs=0x207B23

; [code] TryLevelUp below level 50: wExpToNext <= 0 -> LevelUpStatGains (C), else NC
TryLevelUpBelowMax:
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
	jr	NZ,LevelUpStatGains.skip
	ld	XHL,LevelGainsEven
LevelUpStatGains.skip:
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
	jr	Z,LevelUpStatGains.skip2
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotAP),WA
LevelUpStatGains.skip2:
	ld	A,(XHL+)
	or	A,A
	jr	Z,LevelUpStatGains.skip3
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotSP),WA
LevelUpStatGains.skip3:
	ld	A,(XHL+)
	or	A,A
	jr	Z,LevelUpStatGains.skip4
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotRP),WA
LevelUpStatGains.skip4:
	ld	A,(XHL+)
	or	A,A
	jr	Z,LevelUpStatGains.skip5
	inc	1,A
	ld	W,0
	call	RandomRange
	dec	1,WA
	add	(wPilotMP),WA
LevelUpStatGains.skip5:
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
	jr	Z,CalcUnitStats.skip
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
	call	GetPartInventoryByte
	orb	(XHL),0x80
CalcUnitStats.skip:
	ld	L,(wEquipCore)
	or	L,L
	jr	Z,CalcUnitStats.skip2
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
	call	GetPartInventoryByte
	orb	(XHL),0x80
CalcUnitStats.skip2:
	ld	L,(wEquipRightArm)
	or	L,L
	jr	Z,CalcUnitStats.skip3
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
	call	GetPartInventoryByte
	orb	(XHL),0x80
CalcUnitStats.skip3:
	ld	L,(wEquipLeftArm)
	or	L,L
	jr	Z,CalcUnitStats.skip4
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
	call	GetPartInventoryByte
	orb	(XHL),0x80
CalcUnitStats.skip4:
	ld	L,(wEquipLegs)
	or	L,L
	jr	Z,CalcUnitStats.skip5
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
	call	GetPartInventoryByte
	orb	(XHL),0x80
CalcUnitStats.skip5:
	ld	L,(wEquipBack)
	or	L,L
	jr	Z,CalcUnitStats.skip6
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
	call	GetPartInventoryByte
	orb	(XHL),0x80
CalcUnitStats.skip6:
	ld	WA,0
	ld	L,(wEquipAcc1)
	calr	ApplyAccessoryStats
	ld	L,(wEquipAcc2)
	calr	ApplyAccessoryStats
	or	WA,WA
	ret	OV
	ld	(wUnitAffinity),WA
	ret

c_208879	section	code abs=0x208879

; [code] L = accessory item id (wEquipAcc1/2), 0 -> return: jp through Pointers_20888E[L] (AccStats*: Ct affinity bits on WA, Armr / Tank / Bst / Plt / Axel / Burn stat bonuses); caller CalcUnitStats
ApplyAccessoryStats:
	or	L,L
	ret	Z
	extz	HL
	sll	2,HL
	extz	XHL
	add	XHL,Pointers_20888E
	ld	XHL,(XHL)
	jp	XHL

c_208926	section	code abs=0x208926

; [code] Pointers_20888E entries 0, 9-17, 36, 37: ret (items without a stat effect)
AccStatsNone:
	ret

c_208927	section	code abs=0x208927

; [code] Pointers_20888E entry 1 = item 1 FlrCt (src/data/items/names.asm): or WA,1 (affinity bit 0) (ApplyAccessoryStats from CalcUnitStats)
AccStatsFlrCt:
	or	WA,1
	ret

c_20892C	section	code abs=0x20892C

; [code] Pointers_20888E entry 2 = item 2 RefCt (src/data/items/names.asm): or WA,2 (ApplyAccessoryStats from CalcUnitStats)
AccStatsRefCt:
	or	WA,2
	ret

c_208931	section	code abs=0x208931

; [code] Pointers_20888E entry 3 = item 3 IceCt (src/data/items/names.asm): or WA,4 (ApplyAccessoryStats from CalcUnitStats)
AccStatsIceCt:
	or	WA,4
	ret

c_208936	section	code abs=0x208936

; [code] Pointers_20888E entry 4 = item 4 WindCt (src/data/items/names.asm): or WA,8 (ApplyAccessoryStats from CalcUnitStats)
AccStatsWindCt:
	or	WA,8
	ret

c_20893B	section	code abs=0x20893B

; [code] Pointers_20888E entry 5 = item 5 ErthCt (src/data/items/names.asm): or WA,0x10 (ApplyAccessoryStats from CalcUnitStats)
AccStatsErthCt:
	or	WA,0x10
	ret

c_208940	section	code abs=0x208940

; [code] Pointers_20888E entry 6 = item 6 LghtCt (src/data/items/names.asm): or WA,0x20 (ApplyAccessoryStats from CalcUnitStats)
AccStatsLghtCt:
	or	WA,0x20
	ret

c_208945	section	code abs=0x208945

; [code] Pointers_20888E entry 7 = item 7 DarkCt (src/data/items/names.asm): or WA,0x40 (ApplyAccessoryStats from CalcUnitStats)
AccStatsDarkCt:
	or	WA,0x40
	ret

c_20894A	section	code abs=0x20894A

; [code] Pointers_20888E entry 8 = item 8 MirrCt (src/data/items/names.asm): or WA,0x80 (ApplyAccessoryStats from CalcUnitStats)
AccStatsMirrCt:
	or	WA,0x80
	ret

c_20894F	section	code abs=0x20894F

; [code] Pointers_20888E entry 18 = item 18 Armr25 (src/data/items/names.asm): wUnitMaxHP += 25 (ApplyAccessoryStats from CalcUnitStats)
AccStatsArmr25:
	addw	(wUnitMaxHP),0x19
	ret

c_208956	section	code abs=0x208956

; [code] Pointers_20888E entry 19 = item 19 Armr50 (src/data/items/names.asm): wUnitMaxHP += 50 (ApplyAccessoryStats from CalcUnitStats)
AccStatsArmr50:
	addw	(wUnitMaxHP),0x32
	ret

c_20895D	section	code abs=0x20895D

; [code] Pointers_20888E entry 20 = item 20 Armr80 (src/data/items/names.asm): wUnitMaxHP += 80 (ApplyAccessoryStats from CalcUnitStats)
AccStatsArmr80:
	addw	(wUnitMaxHP),0x50
	ret

c_208964	section	code abs=0x208964

; [code] Pointers_20888E entry 21 = item 21 Tank15 (src/data/items/names.asm): wUnitMaxEP += 15 (ApplyAccessoryStats from CalcUnitStats)
AccStatsTank15:
	addw	(wUnitMaxEP),0xF
	ret

c_20896B	section	code abs=0x20896B

; [code] Pointers_20888E entry 22 = item 22 Tank30 (src/data/items/names.asm): wUnitMaxEP += 30 (ApplyAccessoryStats from CalcUnitStats)
AccStatsTank30:
	addw	(wUnitMaxEP),0x1E
	ret

c_208972	section	code abs=0x208972

; [code] Pointers_20888E entry 23 = item 23 Tank60 (src/data/items/names.asm): wUnitMaxEP += 60 (ApplyAccessoryStats from CalcUnitStats)
AccStatsTank60:
	addw	(wUnitMaxEP),0x3C
	ret

c_208979	section	code abs=0x208979

; [code] Pointers_20888E entry 24 = item 24 Bst10 (src/data/items/names.asm): wUnitAP += 10 (ApplyAccessoryStats from CalcUnitStats)
AccStatsBst10:
	addw	(wUnitAP),0xA
	ret

c_208980	section	code abs=0x208980

; [code] Pointers_20888E entry 25 = item 25 Bst20 (src/data/items/names.asm): wUnitAP += 20 (ApplyAccessoryStats from CalcUnitStats)
AccStatsBst20:
	addw	(wUnitAP),0x14
	ret

c_208987	section	code abs=0x208987

; [code] Pointers_20888E entry 26 = item 26 Bst30 (src/data/items/names.asm): wUnitAP += 30 (ApplyAccessoryStats from CalcUnitStats)
AccStatsBst30:
	addw	(wUnitAP),0x1E
	ret

c_20898E	section	code abs=0x20898E

; [code] Pointers_20888E entry 27 = item 27 Plt10 (src/data/items/names.asm): wUnitSP += 10 (ApplyAccessoryStats from CalcUnitStats)
AccStatsPlt10:
	addw	(wUnitSP),0xA
	ret

c_208995	section	code abs=0x208995

; [code] Pointers_20888E entry 28 = item 28 Plt20 (src/data/items/names.asm): wUnitSP += 20 (ApplyAccessoryStats from CalcUnitStats)
AccStatsPlt20:
	addw	(wUnitSP),0x14
	ret

c_20899C	section	code abs=0x20899C

; [code] Pointers_20888E entry 29 = item 29 Plt30 (src/data/items/names.asm): wUnitSP += 30 (ApplyAccessoryStats from CalcUnitStats)
AccStatsPlt30:
	addw	(wUnitSP),0x1E
	ret

c_2089A3	section	code abs=0x2089A3

; [code] Pointers_20888E entry 30 = item 30 Axel10 (src/data/items/names.asm): wUnitRP += 10 (ApplyAccessoryStats from CalcUnitStats)
AccStatsAxel10:
	addw	(wUnitRP),0xA
	ret

c_2089AA	section	code abs=0x2089AA

; [code] Pointers_20888E entry 31 = item 31 Axel20 (src/data/items/names.asm): wUnitRP += 20 (ApplyAccessoryStats from CalcUnitStats)
AccStatsAxel20:
	addw	(wUnitRP),0x14
	ret

c_2089B1	section	code abs=0x2089B1

; [code] Pointers_20888E entry 32 = item 32 Axel30 (src/data/items/names.asm): wUnitRP += 30 (ApplyAccessoryStats from CalcUnitStats)
AccStatsAxel30:
	addw	(wUnitRP),0x1E
	ret

c_2089B8	section	code abs=0x2089B8

; [code] Pointers_20888E entry 33 = item 33 Burn10 (src/data/items/names.asm): wUnitMP += 10 (ApplyAccessoryStats from CalcUnitStats)
AccStatsBurn10:
	addw	(wUnitMP),0xA
	ret

c_2089BF	section	code abs=0x2089BF

; [code] Pointers_20888E entry 34 = item 34 Burn20 (src/data/items/names.asm): wUnitMP += 20 (ApplyAccessoryStats from CalcUnitStats)
AccStatsBurn20:
	addw	(wUnitMP),0x14
	ret

c_2089C6	section	code abs=0x2089C6

; [code] Pointers_20888E entry 35 = item 35 Burn30 (src/data/items/names.asm): wUnitMP += 30 (ApplyAccessoryStats from CalcUnitStats)
AccStatsBurn30:
	addw	(wUnitMP),0x1E
	ret

c_208AE4	section	code abs=0x208AE4

; WA = amount; BCD add to wGP, capped at 999999
AddGP:
	extz	XWA
	call	BinToBCD
	ld	XBC,(wGP)
	call	AddBCD
	ld	(wGP),XWA
	ld	XBC,0x999999
	call	SubBCD
	ccf
	ret	NC
	ld	XWA,0x999999
	ld	(wGP),XWA
	ret

c_208B0C	section	code abs=0x208B0C

; [code] task: scale = 255 * remaining / frames (+0x14 counts down from +0x12) -> SetWindowScaled around TASK_ARG, +0x10, so the window shrinks to nothing; EndTask at 0
WindowCloseTask:
	ld	A,(XIZ+0x12)
	ld	(XIZ+0x14),A
	ldw	(XIZ+TASK_FUNC),WindowCloseTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WindowCloseTask.resume >> 16
WindowCloseTask.resume:
	ld	A,0xFF
	mul	WA,(XIZ+0x14)
	div	WA,(XIZ+0x12)
	cpl	A
	ld	B,A
	ld	D,A
	ld	C,(XIZ+TASK_ARG)
	ld	E,(XIZ+0x10)
	call	SetWindowScaled
	cpb	(XIZ+0x14),0
	jp	Z,EndTask
	decb	1,(XIZ+0x14)
	ret

c_208B41	section	code abs=0x208B41

; [code] task: the reverse of WindowCloseTask (scale = 255 - 255 * remaining / frames): the window grows from TASK_ARG, +0x10 to full; EndTask at 0
WindowOpenTask:
	ld	A,(XIZ+0x12)
	ld	(XIZ+0x14),A
	ldw	(XIZ+TASK_FUNC),WindowOpenTask.resume & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),WindowOpenTask.resume >> 16
WindowOpenTask.resume:
	ld	A,0xFF
	mul	WA,(XIZ+0x14)
	div	WA,(XIZ+0x12)
	ld	B,A
	ld	D,A
	ld	C,(XIZ+TASK_ARG)
	ld	E,(XIZ+0x10)
	call	SetWindowScaled
	cpb	(XIZ+0x14),0
	jp	Z,EndTask
	decb	1,(XIZ+0x14)
	ret

c_20D7FA	section	code abs=0x20D7FA

; [code] clears the SCR1 tile map (0x9000-0x97FF), wFadeLevel = 0, runs StreetMenuTask on the calling task (XIZ: TASK_ARG 1,
; TASK_FUNC = StreetMenuDispatch, street music), then pilot AP/SP/RP/MP = 999, wPlayerLevel = 99, wSkill1 = 1, wSkill2 = 3
; and CalcUnitStats. Nothing reaches it: no call or jump, no 32-bit pointer to 0x20D7FA anywhere in the ROM, no split
; TASK_FUNC store, and no play run executed it. It sits right before StreetMenuTask; it would have to run as (or from) a
; task. A max-stats street start with no way in from the retail game; what it was for is not shown by the code
SetMaxPilotStats:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	clear_scr1_map
	ld	A,0
	ld	(wFadeLevel),A
	calr	StreetMenuTask
	ldw	(wPilotAP),0x3E7
	ldw	(wPilotSP),0x3E7
	ldw	(wPilotRP),0x3E7
	ldw	(wPilotMP),0x3E7
	ldb	(wPlayerLevel),0x63
	ldw	(wSkill1),1
	ldw	(wSkill2),3
	call	CalcUnitStats
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21D647	section	code abs=0x21D647

; [code] New game: runs SelectPlayerTask (no race chosen -> back to MainMenuTask), then clears the event flags, item and part
; counts and pilot stats, levels 0 -> 1, equips the race's StartingEquipment, fills HP/EP, adds the right arm part, sets
; engineer level 1 / 5 EXP, 0 GP, arena rank 0, plays the Unitice story scene and continues to StreetGoWorks
NewGameSetup:
	call	ResetAllPalettes
	ld	XHL,SelectPlayerTask
	call	StartChildTask
	task_wait
	cpb	(wPlayerRace),0
	ld	XHL,MainMenuTask
	jrl	Z,NewGameSetup.skip
	ld	XHL,wEventFlags
	ld	BC,0x10
NewGameSetup.loop:
	ldw	(XHL+),0
	djnz	BC,NewGameSetup.loop
	ld	XHL,0x5080
	ld	BC,0x200
NewGameSetup.loop2:
	ldb	(XHL+),0
	djnz	BC,NewGameSetup.loop2
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
	call	AddPart
	ldb	(wEngineerLevel),1
	ldw	(wEngineerExp),5
	ld	XWA,0
	ld	(wGP),XWA
	ldb	(wArenaRank),0
	ld	XHL,StorySceneUniticeSetup
	call	StartChildTask
	task_wait
	ld	XHL,StreetGoWorks
NewGameSetup.skip:
	ld	(XIZ+TASK_FUNC),XHL
	ret
