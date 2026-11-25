; engine/menus/works/develop.asm: Works > Develop: develop chance (recipe, level, partner, tool bonuses), roll, engineer level up

c_21740E	section	code abs=0x21740E

; [code] A = race/gender 1-10 -> W = gender bit (0 odd/male), A = race 1-5
SplitRaceGender:
	dec	1,A
	ld	W,A
	and	W,1
	srl	1,A
	inc	1,A
	ret

c_217499	section	code abs=0x217499

; [code] W = gender, A = engineer level -> DevLevelExpMale/Female
GetDevLevelExp:
	or	W,W
	jr	NZ,GetDevLevelExp.skip
	call	LookupDevLevelExpMale
	jr	GetDevLevelExp.done
GetDevLevelExp.skip:
	call	LookupDevLevelExpFemale
GetDevLevelExp.done:
	ret

c_2174A8	section	code abs=0x2174A8

; [code] W = gender, A = engineer level -> DevLevelBonusMale/Female
GetDevLevelBonus:
	or	W,W
	jr	NZ,GetDevLevelBonus.skip
	call	LookupDevLevelBonusMale
	jr	GetDevLevelBonus.done
GetDevLevelBonus.skip:
	call	LookupDevLevelBonusFemale
GetDevLevelBonus.done:
	ret

c_2174B7	section	code abs=0x2174B7

; [code] A = partner race/gender -> DevPartnerBonus
GetDevPartnerBonus:
	call	LookupDevPartnerBonus
	ret

c_2174BC	section	code abs=0x2174BC

; [code] A = tool 1-5 -> 5/10/15/20/100 (0x21BA1F)
GetDevToolBonus:
	call	LookupDevToolBonus
	ret

c_2174C1	section	code abs=0x2174C1

; [code] A = min(A, 100)
Cap100:
	cp	A,0x64
	jr	C,Cap100.done
	ld	A,0x64
Cap100.done:
	ret

c_2174C9	section	code abs=0x2174C9

; [code] XWA = (Random() * 256) mod 30000 (the remainder half of div XWA,0x7530); callers PickShopClerk and works.asm
Random30000:
	call	Random
	mul	XWA,0x100
	div	XWA,0x7530
	srl	16,XWA
	ret

c_2189B4	section	code abs=0x2189B4

; [code] UpdateDevelopChance + DrawDevelopChance (the develop list move hooks, WorksDevelopMenu)
UpdateDevelopChanceBox:
	call	UpdateDevelopChance
	call	DrawDevelopChance
	ret

c_2189BD	section	code abs=0x2189BD

; [code+play] wDevelopChance = recipe pct + level/partner/tool bonuses (0x6190 in play)
UpdateDevelopChance:
	ld	W,(wDevelopArm)
	ld	A,(wDevelopMaterial)
	call	GetRecipe
	ld	A,(XHL+0)
	ld	(wDevelopChance),A
	ld	A,(XHL+1)
	ld	(wDevelopResult),A
	ld	A,(XHL+2)
	ld	(wDevelopExp),A
	ld	A,(wDevelopChance)
	or	A,A
	jp	MI,UpdateDevelopChance.done
	ld	A,(wWorksPartnerRace)
	call	SplitRaceGender
	ld	A,(wWorksEngineerLevel)
	call	GetDevLevelBonus
	add	A,(wDevelopChance)
	call	Cap100
	ld	(wDevelopChance),A
	ld	A,(wWorksPartnerRace)
	call	GetDevPartnerBonus
	add	A,(wDevelopChance)
	call	Cap100
	ld	(wDevelopChance),A
	ld	A,(wDevelopTool)
	or	A,A
	jr	Z,UpdateDevelopChance.done
	jr	MI,UpdateDevelopChance.done
	call	GetDevToolBonus
	add	A,(wDevelopChance)
	call	Cap100
	ld	(wDevelopChance),A
UpdateDevelopChance.done:
	ret

c_218A34	section	code abs=0x218A34

; [code] clears box 4; for wDevelopChance >= 0: "%" (PercentText) at 4,0 and wDevelopChance (PrintByteBlanks) at 1,0; [play] works_develop_*_NNpct screens
DrawDevelopChance:
	ld	A,4
	call	ClearTextBoxHome
	ld	A,(wDevelopChance)
	or	A,A
	jp	MI,DrawDevelopChance.done
	ld	BC,0x400
	ld	XHL,PercentText
	ld	WA,4
	call	PrintStringAt
	ld	BC,0x100
	ld	E,(wDevelopChance)
	ld	WA,0x304
	call	PrintByteBlanks
DrawDevelopChance.done:
	ret

c_21911A	section	code abs=0x21911A

; [code] zeroes 0x61AC-0x61AE, wDevelopArm, wDevelopMaterial, wDevelopTool; caller WorksDevelopMenu (twice)
ClearDevelopChoices:
	ldb	(wDevelopPickArm),0
	ldb	(wDevelopPickMaterial),0
	ldb	(wDevelopPickTool),0
	ldb	(wDevelopArm),0
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	ret

c_219139	section	code abs=0x219139

; [code] ShowDevelopChoicesStub (ret) + DrawDevelopChoices; WorksDevelopMenu after each pick
ShowDevelopChoices:
	call	ShowDevelopChoicesStub
	call	DrawDevelopChoices
	ret

c_219142	section	code abs=0x219142

; [code] ret (first step of ShowDevelopChoices, before DrawDevelopChoices)
ShowDevelopChoicesStub:
	ret

c_219143	section	code abs=0x219143

; [code] box 2: labels MenuLines_219108, then GetEntryName of 0x61AC (group 5 arm) at row 1, 0x61AD (group 9 material) at row 4, 0x61AE (group 8 tool; negative = "(none)" NoneText) at row 7, "------" (DashText14) for 0
DrawDevelopChoices:
	ld	A,2
	call	ClearTextBoxHome
	ld	A,2
	ld	B,3
	ld	XHL,MenuLines_219108
	call	PrintStringTable
	ld	XHL,DashText14
	ld	A,(wDevelopPickArm)
	or	A,A
	jr	Z,DrawDevelopChoices.skip
	ld	W,5
	call	GetEntryName
DrawDevelopChoices.skip:
	ld	A,2
	ld	BC,1
	call	PrintStringAt
	ld	XHL,DashText14
	ld	A,(wDevelopPickMaterial)
	or	A,A
	jr	Z,DrawDevelopChoices.skip2
	ld	W,9
	call	GetEntryName
DrawDevelopChoices.skip2:
	ld	A,2
	ld	BC,4
	call	PrintStringAt
	ld	XHL,DashText14
	ld	A,(wDevelopPickTool)
	or	A,A
	jr	Z,DrawDevelopChoices.skip3
	ld	XHL,NoneText
	jr	MI,DrawDevelopChoices.skip3
	ld	W,8
	call	GetEntryName
DrawDevelopChoices.skip3:
	ld	A,2
	ld	BC,7
	call	PrintStringAt
	ret

c_219245	section	code abs=0x219245

; [code] SetPartStatsPanel + DrawPartStatsPanel; caller WorksDevelopMenu after TheNewArmIsText with the developed arm (group 5, wDevelopResult)
ShowPartStatsPanel:
	call	SetPartStatsPanel
	call	DrawPartStatsPanel
	ret

c_21924E	section	code abs=0x21924E

; [code] wPanelPart = WA, then LoadPartStatsPanel
SetPartStatsPanel:
	ld	(wPanelPart),WA
	jp	LoadPartStatsPanel

c_219273	section	code abs=0x219273

; [code] wPanelStats = record words +0..+0xA (hp ep ap sp rp mp) and byte +0xE (affinity) of part wPanelPart (GetPartStatsBy)
LoadPartStatsPanel:
	ldw	(wPanelStats),0
	ldw	(wPanelStats+2),0
	ldw	(wPanelStats+4),0
	ldw	(wPanelStats+6),0
	ldw	(wPanelStats+8),0
	ldw	(wPanelStats+10),0
	ldb	(wPanelStats+12),0
	ld	WA,(wPanelPart)
	call	GetPartStatsBy
	ld	WA,(XHL+0)
	ld	(wPanelStats),WA
	ld	WA,(XHL+2)
	ld	(wPanelStats+2),WA
	ld	WA,(XHL+4)
	ld	(wPanelStats+4),WA
	ld	WA,(XHL+6)
	ld	(wPanelStats+6),WA
	ld	WA,(XHL+8)
	ld	(wPanelStats+8),WA
	ld	WA,(XHL+0xA)
	ld	(wPanelStats+10),WA
	ld	WA,(XHL+0xE)
	ld	(wPanelStats+12),A
	jr	loc_2192DD

c_2192DD	section	code abs=0x2192DD

loc_2192DD:
	ret

c_2193A3	section	code abs=0x2193A3

; [code] SetDevelopArmImage + DrawDevelopedArm; caller WorksDevelopMenu after TheNewArmIsText
ShowDevelopedArm:
	call	SetDevelopArmImage
	call	DrawDevelopedArm
	ret

c_2193AC	section	code abs=0x2193AC

; [code] wDevelopArmImage = byte +0x12 (image) of arm wDevelopResult (GetPartStatsBy group 5), 1 when invalid
SetDevelopArmImage:
	ldb	(wDevelopArmImage),1
	ld	A,(wDevelopResult)
	ld	W,5
	call	GetPartStatsBy
	jr	NC,SetDevelopArmImage.done
	ld	WA,(XHL+0x12)
	ld	(wDevelopArmImage),A
SetDevelopArmImage.done:
	ret

c_2193C5	section	code abs=0x2193C5

; [code] clears the panel, draws arm image 0x61C2 (right and left) after TheNewArmIsText
DrawDevelopedArm:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	FillScr1Rect
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	FillScr2Rect
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	ld	B,(0x6106)
	ld	D,(0x6107)
	ld	QB,0xC
	ld	QD,0xB
	ld	WA,0x7E
	ld	BC,0
	ld	DE,2
	call	DrawTileBlockScr1
	ld	HL,0x7E
	ld	B,(wDevelopArmImage)
	ld	C,1
	call	DrawRightArmPart
	ld	HL,0x7E
	ld	B,(wDevelopArmImage)
	ld	C,1
	call	DrawLeftArmPart
	ret

c_219785	section	code abs=0x219785

; [code+play] C if engineer level < 50 and wEngineerExp <= 0
CheckEngineerLevelUp:
	cpb	(wWorksEngineerLevel),0x32
	jr	NC,CheckEngineerLevelUp.done
	ld	WA,(wEngineerExp)
	cp	WA,1
	jr	PL,CheckEngineerLevelUp.done
	scf
CheckEngineerLevelUp.done:
	ret

c_21A68F	section	code abs=0x21A68F

; [code] Works menu value 5 "Develp": CopyEquipToWorks, ClearDevelopChoices, YouWantToDevelopText, then the arm / material / tool lists; [play] its first instruction ran on works_develop_arm_select*
WorksDevelopMenu:
	call	HideMenuCursor
	call	CopyEquipToWorks
	call	ClearDevelopChoices
	call	ShowDevelopChoices
	ld	XHL,YouWantToDevelopText
	ld	XDE,YouWantToDevelopText
	call	ShowPartnerGenderText
	call	Wait30Frames
WorksDevelopMenu.loop:
	call	OpenListBox
WorksDevelopMenu.loop2:
	call	SetupDevelopArmList
WorksDevelopMenu.loop3:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhatDoYouWantText5
	ld	XDE,WhatDoYouWantText5
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,WorksDevelopMenu.skip7
	inc	1,A
	ld	(wDevelopPickArm),A
	call	ShowDevelopChoices
	ld	A,(wDevelopPickArm)
	ld	(wDevelopArm),A
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	ld	XHL,AreYouSureText
	ld	XDE,AreYouSureText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,WorksDevelopMenu.loop5
	xor	A,A
	ld	(wDevelopPickArm),A
	call	ShowDevelopChoices
	jp	WorksDevelopMenu.loop3
WorksDevelopMenu.loop4:
	xor	A,A
	ld	(wDevelopPickArm),A
	call	ShowDevelopChoices
	call	ClearTextBox4HomeB
	jp	WorksDevelopMenu.loop2
WorksDevelopMenu.loop5:
	call	SetupDevelopMaterialList
WorksDevelopMenu.loop6:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhatDoYouWantText6
	ld	XDE,WhatDoYouWantText6
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,WorksDevelopMenu.loop4
	ld	A,(wDevelopChance)
	or	A,A
	jr	PL,WorksDevelopMenu.skip
	ld	XHL,YouCantMakeAnText
	ld	XDE,YouCantMakeAnText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	WorksDevelopMenu.loop6
WorksDevelopMenu.skip:
	ld	WA,(wListChoice)
	inc	1,A
	ld	(wDevelopPickMaterial),A
	call	ShowDevelopChoices
	ld	XHL,AreYouSureText
	ld	XDE,AreYouSureText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,WorksDevelopMenu.loop7
	xor	A,A
	ld	(wDevelopPickMaterial),A
	call	ShowDevelopChoices
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	call	UpdateDevelopChanceBox
	jp	WorksDevelopMenu.loop6
WorksDevelopMenu.loop7:
	ld	XHL,DoYouWantToText5
	ld	XDE,DoYouWantToText5
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jp	NZ,WorksDevelopMenu.skip2
	call	SetupDevelopToolList
WorksDevelopMenu.loop8:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,SelectAToolText
	ld	XDE,SelectAToolText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,WorksDevelopMenu.loop7
	inc	1,A
	ld	(wDevelopPickTool),A
	call	ShowDevelopChoices
	ld	XHL,AreYouSureText
	ld	XDE,AreYouSureText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,WorksDevelopMenu.skip3
	xor	A,A
	ld	(wDevelopPickTool),A
	call	ShowDevelopChoices
	ldb	(wDevelopTool),0
	call	UpdateDevelopChanceBox
	jp	WorksDevelopMenu.loop8
WorksDevelopMenu.skip2:
	ldb	(wDevelopPickTool),0xFF
	call	ShowDevelopChoices
	ldb	(wDevelopTool),0xFF
	call	UpdateDevelopChanceBox
WorksDevelopMenu.skip3:
	ld	XHL,AllRightWereReadyText
	ld	XDE,AllRightWereReadyText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,WorksDevelopMenu.skip4
	xor	A,A
	ld	(wDevelopPickMaterial),A
	ld	(wDevelopPickTool),A
	call	ShowDevelopChoices
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	call	UpdateDevelopChanceBox
	jp	WorksDevelopMenu.loop5
WorksDevelopMenu.skip4:
	ld	WA,0x88
	call	CallSoundCommand
	ld	XHL,HereWeGoText
	ld	XDE,HereWeGoText
	call	ShowPartnerGenderText
	call	Wait30Frames
	ld	A,0x1E
	call	WaitFramesOrButton
	ld	WA,0x288
	call	CallSoundCommand
	call	DevelopRoll
	jr	NC,WorksDevelopMenu.skip6
	ld	WA,0x89
	call	CallSoundCommand
	call	DevelopSuccess
	jr	C,WorksDevelopMenu.skip5
	ld	XHL,ImSorryButIText
	ld	XDE,ImSorryButIText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	WorksDevelopMenu.skip7
WorksDevelopMenu.skip5:
	ld	XHL,TheNewArmIsText
	ld	XDE,TheNewArmIsText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideListCursor
	call	ShowDevelopedArm
	call	ClearTextBox2Home
	ld	A,(wDevelopResult)
	ld	W,5
	call	ShowPartStatsPanel
	ld	A,(wDevelopResult)
	ld	W,5
	call	ShowPartEpCostAndAffinity
	call	WorksDevelopDone
	call	WaitAOrB
WorksDevelopMenu.loop9:
	call	CheckEngineerLevelUp
	jp	NC,WorksDevelopMenu.skip7
	call	EngineerLevelUp
	ld	XHL,PartnerSDevelopmentLevelText
	ld	XDE,PartnerSDevelopmentLevelText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	WorksDevelopMenu.loop9
WorksDevelopMenu.skip6:
	ld	WA,0x8A
	call	CallSoundCommand
	ld	XHL,SorryItDidntWorkText
	ld	XDE,SorryItDidntWorkText
	call	ShowPartnerGenderText
	call	Wait30Frames
WorksDevelopMenu.skip7:
	ld	XHL,DoYouWantToText6
	ld	XDE,DoYouWantToText6
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	NZ,WorksDevelopMenu.skip8
	call	ClearTextBox4HomeB
	call	ClearDevelopChoices
	call	ShowDevelopChoices
	jp	WorksDevelopMenu.loop
WorksDevelopMenu.skip8:
	ld	XHL,AllForNowLetText
	ld	XDE,AllForNowLetText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideListCursor
	jp	WorksMenuReturn

c_21A9A9	section	code abs=0x21A9A9

; [code+play] removes the arm, material and tool; C if a random 0-99 < wDevelopChance
DevelopRoll:
	ld	A,(wDevelopPickArm)
	ld	W,5
	call	RemoveItemByCategory
	ld	A,(wDevelopPickMaterial)
	ld	W,4
	call	RemoveGroupItem
	ld	A,(wDevelopPickTool)
	ld	W,3
	call	RemoveGroupItem
	call	Random30000
	extz	WA
	div	WA,0x64
	cp	W,(wDevelopChance)
	ret

c_21A9D5	section	code abs=0x21A9D5

; [code] gives wDevelopResult, takes wDevelopExp off wEngineerExp below level 50
DevelopSuccess:
	ld	A,(wDevelopResult)
	ld	W,5
	call	AddItemByCategory
	ld	A,(wDevelopExp)
	ld	A,(wDevelopPickArm)
	cp	A,(wDevelopResult)
	rcf
	cpb	(wWorksEngineerLevel),0x32
	jr	NC,DevelopSuccess.skip
	ld	A,(wDevelopExp)
	extz	WA
	sub	(wEngineerExp),WA
DevelopSuccess.skip:
	scf
	ret

c_21A9FF	section	code abs=0x21A9FF

; [code+play] wEngineerExp += GetDevLevelExp, level + 1 (max 50)
EngineerLevelUp:
	ld	A,(wWorksPartnerRace)
	call	SplitRaceGender
	ld	A,(wWorksEngineerLevel)
	call	GetDevLevelExp
	extz	WA
	add	(wEngineerExp),WA
	ld	A,(wWorksEngineerLevel)
	cp	A,0x32
	jr	NC,EngineerLevelUp.skip
	inc	1,A
	ld	(wWorksEngineerLevel),A
	ld	(wEngineerLevel),A
	cp	A,0x32
	jr	C,EngineerLevelUp.done
EngineerLevelUp.skip:
	ldw	(wEngineerExp),0
EngineerLevelUp.done:
	ret

c_21AA34	section	code abs=0x21AA34

; [code+play] "See you later" / "Whew, I'm glad to..."
WorksDevelopDone:
	call	ClearMessageBox
	ld	A,(wDevelopResult)
	ld	W,5
	call	GetEntryName
	ld	BC,0
	ld	WA,1
	call	PrintStringAt
	ld	A,(wDevelopResult)
	ld	W,5
	call	GetEntryDesc
	ld	BC,2
	ld	WA,1
	call	PrintStringAt
	ret

c_21B9DE	section	code abs=0x21B9DE

; [code] A = byte 0x25E648[A] (GetDevLevelExp, male)
LookupDevLevelExpMale:
	push	XHL
	ld	XHL,DevLevelExpMale-1
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21B9EB	section	code abs=0x21B9EB

; [code] A = byte 0x25E67A[A] (GetDevLevelExp, female)
LookupDevLevelExpFemale:
	push	XHL
	ld	XHL,DevLevelExpFemale-1
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21B9F8	section	code abs=0x21B9F8

; [code] A = DevLevelBonusMale[A] (GetDevLevelBonus)
LookupDevLevelBonusMale:
	push	XHL
	ld	XHL,DevLevelBonusMale
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21BA05	section	code abs=0x21BA05

; [code] A = DevLevelBonusFemale[A] (GetDevLevelBonus)
LookupDevLevelBonusFemale:
	push	XHL
	ld	XHL,DevLevelBonusFemale
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21BA12	section	code abs=0x21BA12

; [code] A = byte 0x25E6AC[A] (GetDevPartnerBonus)
LookupDevPartnerBonus:
	push	XHL
	ld	XHL,DevPartnerBonus-1
	ld	A,(XHL+A)
	pop	XHL

c_21BA1E	section	code abs=0x21BA1E

loc_21BA1E:
	ret
	db	0x05,0x0A,0x0F,0x14,0x64

c_21BA24	section	code abs=0x21BA24

; [code] A = tool 1-5 -> A = byte 0x21BA1E[A] (5, 10, 15, 20, 100; index 0 would read the ret opcode before the table); GetDevToolBonus
LookupDevToolBonus:
	push	XHL
	ld	XHL,loc_21BA1E
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21D192	section	code abs=0x21D192

; [code] W = arm, A = material -> XHL = Recipes entry (pct, result, dev_exp)
GetRecipe:
	ld	L,W
	dec	1,L
	mul	HL,0xF
	dec	1,A
	extz	WA
	add	WA,HL
	mul	XWA,3
	ld	XHL,Recipes
	lda	XHL,XHL+WA
	ret
