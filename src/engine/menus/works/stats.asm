; engine/menus/works/stats.asm: Works > Stats (Chara / UNIT): status panels, CalcSetupStats and its accessory handlers

c_217402	section	code abs=0x217402

; [code] WA = 0 -> GetDashesText, else GetRankTitle
GetRankTitleOrDashes:
	or	WA,WA
	jp	Z,GetDashesText
	call	GetRankTitle
	ret

c_21741B	section	code abs=0x21741B

; [code] A = 0 -> GetDashesText, else GetRaceName
GetRaceNameOrDashes:
	or	A,A
	jp	Z,GetDashesText
	call	GetRaceName
	ret

c_217C9A	section	code abs=0x217C9A

; [code] menu box table: "Chara" (0), "UNIT" (1), "Exit" (0xFF) at MenuLines_217C7F; caller WorksStatsMenu
SetupStatsMenu:
	ld	A,3
	ld	(wMenuCount),A
	ld	A,3
	ld	(wMenuTextCount),A
	ld	XHL,MenuLines_217C7F
	ld	(wMenuTexts),XHL
	ld	XHL,MenuCursor_217C91
	ld	(wMenuCells),XHL
	ld	XHL,MenuResults_217C97
	ld	(wMenuValues),XHL
	jp	MenuReset
ItemText8:
	db	0x29,0x14,0x05,0x0D,0xFF	; "Item"
PartsText:
	db	0x30,0x01,0x12,0x14,0x13,0xFF	; "Parts"
ExitText6:
	db	0x25,0x18,0x09,0x14,0xFF	; "Exit"
MenuLines_217CD5:
	menu_item	0,0,ItemText8
	menu_item	0,1,PartsText
	menu_item	0,8,ExitText6
MenuCursor_217CE7:
	db	0,0, 0,1, 0,8	; column, row
MenuResults_217CED:
	db	0x01,0x00,0xFF

c_218AD8	section	code abs=0x218AD8

; [code] UpdateSetupStats + DrawSetupStats (WorksSetupMenu, the Setup list move hooks, WorksUnitStatus)
ShowSetupStats:
	call	UpdateSetupStats
	call	DrawSetupStats
	ret

c_218AE1	section	code abs=0x218AE1

; [code] zeroes wSetupStats (8 words), then CalcSetupStats when CheckWorksEquipOwned gives carry
UpdateSetupStats:
	ldw	(wSetupStats),0
	ldw	(wSetupStats+2),0
	ldw	(wSetupStats+4),0
	ldw	(wSetupStats+6),0
	ldw	(wSetupStats+8),0
	ldw	(wSetupStats+10),0
	ldw	(wSetupStats+12),0
	ldw	(wSetupStats+14),0
	call	CheckWorksEquipOwned
	jp	NC,UpdateSetupStats.done
	call	CalcSetupStats
UpdateSetupStats.done:
	ret

c_218B1F	section	code abs=0x218B1F

; [code+play] Setup stats 0x6193-0x61A1 = pilot stats + each Works-list part + accessories
CalcSetupStats:
	ldw	(wSetupStats+4),(wPilotAP)
	ldw	(wSetupStats+6),(wPilotAP)
	ldw	(wSetupStats+8),(wPilotSP)
	ldw	(wSetupStats+10),(wPilotRP)
	ldw	(wSetupStats+12),(wPilotMP)
	call	GetWorksEquipBody
	or	WA,WA
	jr	Z,CalcSetupStats.skip
	call	GetPartStatsBy
	ldw	(wSetupStats),(XHL+0)
	ldw	(wSetupStats+2),(XHL+2)
	ldw	(wSetupStats+14),(XHL+0xE)
	ld	WA,(XHL+4)
	add	(wSetupStats+4),WA
	add	(wSetupStats+6),WA
	ld	WA,(XHL+6)
	add	(wSetupStats+8),WA
	ld	WA,(XHL+8)
	add	(wSetupStats+10),WA
	ld	WA,(XHL+0xA)
	add	(wSetupStats+12),WA
CalcSetupStats.skip:
	call	GetWorksEquipCore
	or	WA,WA
	jr	Z,CalcSetupStats.skip2
	call	GetPartStatsBy
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(wSetupStats+2),WA
	ld	WA,(XHL+4)
	add	(wSetupStats+4),WA
	add	(wSetupStats+6),WA
	ld	WA,(XHL+6)
	add	(wSetupStats+8),WA
	ld	WA,(XHL+8)
	add	(wSetupStats+10),WA
	ld	WA,(XHL+0xA)
	add	(wSetupStats+12),WA
CalcSetupStats.skip2:
	call	GetWorksEquipRightArm
	or	WA,WA
	jr	Z,CalcSetupStats.skip3
	call	GetPartStatsBy
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(wSetupStats+2),WA
	ld	WA,(XHL+4)
	add	(wSetupStats+6),WA
	ld	WA,(XHL+6)
	add	(wSetupStats+8),WA
	ld	WA,(XHL+8)
	add	(wSetupStats+10),WA
	ld	WA,(XHL+0xA)
	add	(wSetupStats+12),WA
CalcSetupStats.skip3:
	call	GetWorksEquipLeftArm
	or	WA,WA
	jr	Z,CalcSetupStats.skip4
	call	GetPartStatsBy
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(wSetupStats+2),WA
	ld	WA,(XHL+4)
	add	(wSetupStats+4),WA
	ld	WA,(XHL+6)
	add	(wSetupStats+8),WA
	ld	WA,(XHL+8)
	add	(wSetupStats+10),WA
	ld	WA,(XHL+0xA)
	add	(wSetupStats+12),WA
CalcSetupStats.skip4:
	call	GetWorksEquipLegs
	or	WA,WA
	jr	Z,CalcSetupStats.skip5
	call	GetPartStatsBy
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(wSetupStats+2),WA
	ld	WA,(XHL+4)
	add	(wSetupStats+4),WA
	add	(wSetupStats+6),WA
	ld	WA,(XHL+6)
	add	(wSetupStats+8),WA
	ld	WA,(XHL+8)
	add	(wSetupStats+10),WA
	ld	WA,(XHL+0xA)
	add	(wSetupStats+12),WA
CalcSetupStats.skip5:
	call	GetWorksEquipBack
	or	WA,WA
	jr	Z,CalcSetupStats.skip6
	call	GetPartStatsBy
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(wSetupStats+2),WA
	ld	WA,(XHL+4)
	add	(wSetupStats+4),WA
	add	(wSetupStats+6),WA
	ld	WA,(XHL+6)
	add	(wSetupStats+8),WA
	ld	WA,(XHL+8)
	add	(wSetupStats+10),WA
	ld	WA,(XHL+0xA)
	add	(wSetupStats+12),WA
CalcSetupStats.skip6:
	ld	BC,0
	call	GetWorksEquipAcc1
	call	ApplyAccessoryBonus
	call	GetWorksEquipAcc2
	call	ApplyAccessoryBonus
	or	BC,BC
	ret	OV
	ld	(wSetupStats+14),BC
	ret

c_218CAD	section	code abs=0x218CAD

; [code] WA = accessory entry (CalcSetupStats passes Works slots A1 and A2), 0 = none: jump through AccessoryBonusJumps by the item id (low byte, 1-0x25): ids 1-8 (FlrCt..MirrCt) set affinity bit id-1 in BC (CalcSetupStats stores BC to wSetupStats+14 only when `or BC,BC` gives odd parity (`ret OV` = parity even): one chip, or the same chip in both slots, replaces the body affinity; two different chips or none leave it), 18-35 (Armr, Tank, Bst, Plt, Axel, Burn) add to a wSetupStats word, the others (Radar, Cycl, Panl, AutoRp, Proplr) do nothing
ApplyAccessoryBonus:
	or	WA,WA
	ret	Z
	cp	A,0x26
	ret	NC
	extz	WA
	sll	2,WA
	ld	XHL,AccessoryBonusJumps
	lda	XHL,XHL+WA
	ld	XHL,(XHL)
	jp	XHL

d_218CC9	section	romdata abs=0x218CC9
; [code] ApplyAccessoryBonus: routine per accessory id 1-0x25 (entry 0 is never used: WA = 0 returns first)
AccessoryBonusJumps:
	dl	AccBonusNone,AccBonusFlrCt,AccBonusRefCt,AccBonusIceCt
	dl	AccBonusWindCt,AccBonusErthCt,AccBonusLghtCt,AccBonusDarkCt
	dl	AccBonusMirrCt,AccBonusNone,AccBonusNone,AccBonusNone
	dl	AccBonusNone,AccBonusNone,AccBonusNone,AccBonusNone
	dl	AccBonusNone,AccBonusNone,AccBonusArmr25,AccBonusArmr50
	dl	AccBonusArmr80,AccBonusTank15,AccBonusTank30,AccBonusTank60
	dl	AccBonusBst10,AccBonusBst20,AccBonusBst30,AccBonusPlt10
	dl	AccBonusPlt20,AccBonusPlt30,AccBonusAxel10,AccBonusAxel20
	dl	AccBonusAxel30,AccBonusBurn10,AccBonusBurn20,AccBonusBurn30
	dl	AccBonusNone,AccBonusNone

c_218D61	section	code abs=0x218D61

; [code] ret: accessory with no Setup stat bonus
AccBonusNone:
	ret

c_218D62	section	code abs=0x218D62

; [code] accessory 1 FlrCt: affinity bit 0 (BC |= 0x1)
AccBonusFlrCt:
	or	BC,1
	ret

c_218D67	section	code abs=0x218D67

; [code] accessory 2 RefCt: affinity bit 1 (BC |= 0x2)
AccBonusRefCt:
	or	BC,2
	ret

c_218D6C	section	code abs=0x218D6C

; [code] accessory 3 IceCt: affinity bit 2 (BC |= 0x4)
AccBonusIceCt:
	or	BC,4
	ret

c_218D71	section	code abs=0x218D71

; [code] accessory 4 WindCt: affinity bit 3 (BC |= 0x8)
AccBonusWindCt:
	or	BC,8
	ret

c_218D76	section	code abs=0x218D76

; [code] accessory 5 ErthCt: affinity bit 4 (BC |= 0x10)
AccBonusErthCt:
	or	BC,0x10
	ret

c_218D7B	section	code abs=0x218D7B

; [code] accessory 6 LghtCt: affinity bit 5 (BC |= 0x20)
AccBonusLghtCt:
	or	BC,0x20
	ret

c_218D80	section	code abs=0x218D80

; [code] accessory 7 DarkCt: affinity bit 6 (BC |= 0x40)
AccBonusDarkCt:
	or	BC,0x40
	ret

c_218D85	section	code abs=0x218D85

; [code] accessory 8 MirrCt: affinity bit 7 (BC |= 0x80)
AccBonusMirrCt:
	or	BC,0x80
	ret

c_218D8A	section	code abs=0x218D8A

; [code] accessory 18 Armr25: Setup HP (wSetupStats) + 25
AccBonusArmr25:
	addw	(wSetupStats),0x19
	ret

c_218D91	section	code abs=0x218D91

; [code] accessory 19 Armr50: Setup HP + 50
AccBonusArmr50:
	addw	(wSetupStats),0x32
	ret

c_218D98	section	code abs=0x218D98

; [code] accessory 20 Armr80: Setup HP + 80
AccBonusArmr80:
	addw	(wSetupStats),0x50
	ret

c_218D9F	section	code abs=0x218D9F

; [code] accessory 21 Tank15: Setup EP (wSetupStats+2) + 15
AccBonusTank15:
	addw	(wSetupStats+2),0xF
	ret

c_218DA6	section	code abs=0x218DA6

; [code] accessory 22 Tank30: Setup EP + 30
AccBonusTank30:
	addw	(wSetupStats+2),0x1E
	ret

c_218DAD	section	code abs=0x218DAD

; [code] accessory 23 Tank60: Setup EP + 60
AccBonusTank60:
	addw	(wSetupStats+2),0x3C
	ret

c_218DB4	section	code abs=0x218DB4

; [code] accessory 24 Bst10: Setup LA (+4) and RA (+6) + 10
AccBonusBst10:
	addw	(wSetupStats+4),0xA
	addw	(wSetupStats+6),0xA
	ret

c_218DC1	section	code abs=0x218DC1

; [code] accessory 25 Bst20: Setup LA and RA + 20
AccBonusBst20:
	addw	(wSetupStats+4),0x14
	addw	(wSetupStats+6),0x14
	ret

c_218DCE	section	code abs=0x218DCE

; [code] accessory 26 Bst30: Setup LA and RA + 30
AccBonusBst30:
	addw	(wSetupStats+4),0x1E
	addw	(wSetupStats+6),0x1E
	ret

c_218DDB	section	code abs=0x218DDB

; [code] accessory 27 Plt10: Setup SP (+8) + 10
AccBonusPlt10:
	addw	(wSetupStats+8),0xA
	ret

c_218DE2	section	code abs=0x218DE2

; [code] accessory 28 Plt20: Setup SP + 20
AccBonusPlt20:
	addw	(wSetupStats+8),0x14
	ret

c_218DE9	section	code abs=0x218DE9

; [code] accessory 29 Plt30: Setup SP + 30
AccBonusPlt30:
	addw	(wSetupStats+8),0x1E
	ret

c_218DF0	section	code abs=0x218DF0

; [code] accessory 30 Axel10: Setup RP (+10) + 10
AccBonusAxel10:
	addw	(wSetupStats+10),0xA
	ret

c_218DF7	section	code abs=0x218DF7

; [code] accessory 31 Axel20: Setup RP + 20
AccBonusAxel20:
	addw	(wSetupStats+10),0x14
	ret

c_218DFE	section	code abs=0x218DFE

; [code] accessory 32 Axel30: Setup RP + 30
AccBonusAxel30:
	addw	(wSetupStats+10),0x1E
	ret

c_218E05	section	code abs=0x218E05

; [code] accessory 33 Burn10: Setup MP (+12) + 10
AccBonusBurn10:
	addw	(wSetupStats+12),0xA
	ret

c_218E0C	section	code abs=0x218E0C

; [code] accessory 34 Burn20: Setup MP + 20
AccBonusBurn20:
	addw	(wSetupStats+12),0x14
	ret

c_218E13	section	code abs=0x218E13

; [code] accessory 35 Burn30: Setup MP + 30
AccBonusBurn30:
	addw	(wSetupStats+12),0x1E
	ret

c_218E1A	section	code abs=0x218E1A

; [code] box 2: labels MenuLines_218AA8 (HP EP RA LA SP RP MP AT); when CheckWorksEquipOwned gives carry, wSetupStats HP, EP, RA (+6), LA (+4), SP, RP, MP (PrintWordZeros) and the affinity (+14, DrawAffinityIcons)
DrawSetupStats:
	ld	A,2
	call	ClearTextBoxHome
	ld	A,2
	ld	B,8
	ld	XHL,MenuLines_218AA8
	call	PrintStringTable
	call	CheckWorksEquipOwned
	jp	NC,DrawSetupStats.done
	ld	BC,0x300
	ld	DE,(wSetupStats)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x301
	ld	DE,(wSetupStats+2)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x302
	ld	DE,(wSetupStats+6)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x303
	ld	DE,(wSetupStats+4)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x304
	ld	DE,(wSetupStats+8)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x305
	ld	DE,(wSetupStats+10)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x306
	ld	DE,(wSetupStats+12)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x308
	ld	E,(wSetupStats+14)
	ld	WA,0x302
	call	DrawAffinityIcons
DrawSetupStats.done:
	ret

c_218EA7	section	code abs=0x218EA7

; [code] C when every Works slot body, LA, RA, core, legs, back holds an owned entry (CheckEntryOwned) and A1 / A2 are empty or owned (CheckEntryOwnedOrNone); UpdateSetupStats / DrawSetupStats show numbers only then; [play] NC (labels only, no numbers) on a dashed never-owned row of a Setup part list (every list: arms, cores, legs, backpacks, accessories) and on the empty rows past the last entry; an equipped part shown as X0 (byte 0x80) still draws numbers
CheckWorksEquipOwned:
	call	GetWorksEquipBody
	call	CheckEntryOwned
	ret	NC
	call	GetWorksEquipLeftArm
	call	CheckEntryOwned
	ret	NC
	call	GetWorksEquipRightArm
	call	CheckEntryOwned
	ret	NC
	call	GetWorksEquipCore
	call	CheckEntryOwned
	ret	NC
	call	GetWorksEquipLegs
	call	CheckEntryOwned
	ret	NC
	call	GetWorksEquipBack
	call	CheckEntryOwned
	ret	NC
	call	GetWorksEquipAcc1
	call	CheckEntryOwnedOrNone
	ret	NC
	call	GetWorksEquipAcc2
	call	CheckEntryOwnedOrNone
	ret	NC
	ret

c_218EF8	section	code abs=0x218EF8

; [code] WA = entry: 0 -> C; else falls into CheckEntryOwned
CheckEntryOwnedOrNone:
	or	WA,WA
	scf
	ret	Z

c_218EFD	section	code abs=0x218EFD

; [code] WA = entry: C when GetEntryCountBy is valid and its count byte is non-zero; AddItem sets bit 7 and RemoveItem keeps it, so only a never-held entry is 0 (the dashed list row)
CheckEntryOwned:
	call	GetEntryCountBy
	ret	NC
	or	A,A
	ret	Z
	scf
	ret

c_218F09	section	code abs=0x218F09

; [code] CallCopyEquipToWorks2 (CopyEquipToWorks) + DrawWorksEquipNames; WorksUnitStatus when wStatusPage != 0
ShowWorksEquipNames:
	call	CallCopyEquipToWorks2
	call	DrawWorksEquipNames
	ret

c_218F12	section	code abs=0x218F12

; [code] call CopyEquipToWorks; ret (the same as CallCopyEquipToWorks); first step of ShowWorksEquipNames
CallCopyEquipToWorks2:
	call	CopyEquipToWorks
	ret

c_218F17	section	code abs=0x218F17

; [code] box 2: GetEntryName of the Works slots body, right arm, left arm, core, legs, back (rows 0-5) and accessories 1 / 2 (rows 7, 8); the second WorksUnitStatus page (L/R)
DrawWorksEquipNames:
	ld	A,2
	call	ClearTextBoxHome
	call	GetWorksEquipBody
	call	GetEntryName
	ld	BC,0
	ld	WA,2
	call	PrintStringAt
	call	GetWorksEquipRightArm
	call	GetEntryName
	ld	BC,1
	ld	WA,2
	call	PrintStringAt
	call	GetWorksEquipLeftArm
	call	GetEntryName
	ld	BC,2
	ld	WA,2
	call	PrintStringAt
	call	GetWorksEquipCore
	call	GetEntryName
	ld	BC,3
	ld	WA,2
	call	PrintStringAt
	call	GetWorksEquipLegs
	call	GetEntryName
	ld	BC,4
	ld	WA,2
	call	PrintStringAt
	call	GetWorksEquipBack
	call	GetEntryName
	ld	BC,5
	ld	WA,2
	call	PrintStringAt
	call	GetWorksEquipAcc1
	call	GetEntryName
	ld	BC,7
	ld	WA,2
	call	PrintStringAt
	call	GetWorksEquipAcc2
	call	GetEntryName
	ld	BC,8
	ld	WA,2
	call	PrintStringAt
	ret

c_218FC1	section	code abs=0x218FC1

; [code] CopyMasterStatsInfo + DrawMasterStats; WorksCharaStatus page 0 (ThisIsYourStatusText)
ShowMasterStats:
	call	CopyMasterStatsInfo
	call	DrawMasterStats
	ret

c_218FCA	section	code abs=0x218FCA

; [code+play] name, rank, race, level, emblems, wExpToNext -> wCharaPage for the Master stats page
CopyMasterStatsInfo:
	ld	XHL,(wPlayerNamePtrCopy)
	ld	(wCharaPage),XHL
	ld	A,(wArenaRankCopy)
	ld	(wCharaPage+4),A
	ld	A,(wPlayerRaceCopy)
	ld	(wCharaPage+5),A
	ld	A,(wPlayerLevelCopy)
	ld	(wCharaPage+6),A
	ld	A,(wEmblemBits)
	ld	(wCharaPage+7),A
	ld	WA,(wExpToNext)
	ld	(wCharaPage+8),A
	ret

c_218FFB	section	code abs=0x218FFB

; [code] CopyEngineerStatsInfo + DrawEngineerStats; WorksCharaStatus page 1 (ThisIsMyStatusText)
ShowEngineerStats:
	call	CopyEngineerStatsInfo
	call	DrawEngineerStats
	ret

c_219004	section	code abs=0x219004

; [code] wCharaPage from the partner: wPartnerNamePtrCopy, rank 0, wWorksPartnerRace, wWorksEngineerLevel, wEmblemBitsCopy, wEngineerExp (low byte)
CopyEngineerStatsInfo:
	ld	XHL,(wPartnerNamePtrCopy)
	ld	(wCharaPage),XHL
	xor	A,A
	ld	(wCharaPage+4),A
	ld	A,(wWorksPartnerRace)
	ld	(wCharaPage+5),A
	ld	A,(wWorksEngineerLevel)
	ld	(wCharaPage+6),A
	ld	A,(wEmblemBitsCopy)
	ld	(wCharaPage+7),A
	ld	WA,(wEngineerExp)
	ld	(wCharaPage+8),A
	ret

c_219033	section	code abs=0x219033

; [code] box 2: title "Master" (MasterText), then DrawCharaStatsPage; ShowMasterStats
DrawMasterStats:
	ld	A,2
	call	ClearTextBoxHome
	ld	XHL,MasterText
	ld	BC,2
	ld	WA,2
	call	PrintStringAt
	jr	DrawCharaStatsPage

c_219048	section	code abs=0x219048

; [code] box 2: title " Eng." (EngText), then DrawCharaStatsPage; ShowEngineerStats; [play] camp_stats_menu_chara_unit
DrawEngineerStats:
	ld	A,2
	call	ClearTextBoxHome
	ld	XHL,EngText
	ld	BC,2
	ld	WA,2
	call	PrintStringAt

c_21905B	section	code abs=0x21905B

; [code] box 2 from wCharaPage: labels CharaStatsLevLine ("Lev"), name, race (SplitRaceGender, GetRaceNameOrDashes), level, "Nxt" + next (or "------" when 0), rank title when the rank byte != 0 (GetRankTitleOrDashes), emblem bits (DrawAffinityIcons)
DrawCharaStatsPage:
	ld	A,2
	ld	B,1
	ld	XHL,CharaStatsLevLine
	call	PrintStringTable
	ld	XHL,(wCharaPage)
	ld	BC,0
	ld	WA,2
	call	PrintStringAt
	ld	A,(wCharaPage+5)
	call	SplitRaceGender
	call	GetRaceNameOrDashes
	ld	BC,1
	ld	WA,2
	call	PrintStringAt
	ld	BC,0x304
	ld	E,(wCharaPage+6)
	ld	WA,0x302
	call	PrintByteBlanks
	ld	A,(wCharaPage+8)
	or	A,A
	jr	NZ,DrawCharaStatsPage.skip
	ld	XHL,DashText11
	ld	BC,5
	ld	WA,2
	call	PrintStringAt
	jr	DrawCharaStatsPage.skip2
DrawCharaStatsPage.skip:
	ld	XHL,NxtText
	ld	BC,5
	ld	WA,2
	call	PrintStringAt
	ld	BC,0x305
	ld	E,(wCharaPage+8)
	ld	WA,0x302
	call	PrintByteBlanks
DrawCharaStatsPage.skip2:
	ld	A,(wCharaPage+4)
	or	A,A
	jr	Z,DrawCharaStatsPage.skip3
	call	GetRankTitleOrDashes
	ld	BC,7
	ld	WA,2
	call	PrintStringAt
DrawCharaStatsPage.skip3:
	ld	BC,8
	ld	E,(wCharaPage+7)
	ld	WA,0x302
	call	DrawAffinityIcons
	ret
DashText14:
	db	0x59,0x59,0x59,0x59,0x59,0x59,0xFF	; "------"
NoneText:
	db	0x61,0x0E,0x0F,0x0E,0x05,0x63,0xFF	; "{61}none{63}"
ArmText3:
	db	0x21,0x12,0x0D,0xFF	; "Arm"
MateText3:
	db	0x2D,0x01,0x14,0x05,0x5A,0xFF	; "Mate."
ToolText3:
	db	0x34,0x0F,0x0F,0x0C,0xFF	; "Tool"
MenuLines_219108:
	menu_item	0,0,ArmText3
	menu_item	0,3,MateText3
	menu_item	0,6,ToolText3

c_21936A	section	code abs=0x21936A

; [code] clears 12x14 at 0,0 on SCR1 (FillScr1Rect, 0x9000) and SCR2 (FillScr2Rect, 0x9800), FillTiles 0x7E x 0x1C2, CalcUnitStats, DrawEquippedRobot at tile 0x7E; caller WorksUnitStatus; [play] works_setup_* screens
RedrawEquippedRobot:
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
	call	CalcUnitStats
	ld	WA,0x7E
	ld	BC,0
	ld	DE,2
	call	DrawEquippedRobot
	ret

c_219BA3	section	code abs=0x219BA3

; [code] Works menu value 0 "Stats": SetupStatsMenu, Chara -> WorksCharaStatus, UNIT -> ThisIsYourUNITRONsText + WorksUnitStatus, then FinishedText; [play] its first instruction ran on works_stats_chara_* and camp_stats_menu_chara_unit (executed-address log)
WorksStatsMenu:
	call	SetupStatsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhatDoYouWantText3
	ld	XDE,WhatDoYouWantText3
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksStatsMenu.skip3
	cp	A,0
	jr	Z,WorksStatsMenu.skip
	cp	A,1
	jr	Z,WorksStatsMenu.skip2
	jp	WorksStatsMenu.skip3
WorksStatsMenu.skip:
	call	WorksCharaStatus
	jp	WorksStatsMenu.skip3
WorksStatsMenu.skip2:
	ld	XHL,ThisIsYourUNITRONsText
	ld	XDE,ThisIsYourUNITRONsText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	CopyEquipToWorks
	call	WorksUnitStatus
	jp	WorksStatsMenu.skip3
WorksStatsMenu.skip3:
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	cpb	(wWorksScreenMode),4
	jp	Z,WorksExit
	jp	WorksMenuReturn

c_219C22	section	code abs=0x219C22

; [code] Stats submenu value 1 "UNIT" (after ThisIsYourUNITRONsText) and after equipping in TradeSwapItems: RedrawEquippedRobot, DrawGP, L/R toggles wStatusPage between ShowSetupStats and ShowWorksEquipNames, A/B returns
WorksUnitStatus:
	pop	XHL
	ld	(wStatusReturn),XHL
	call	HideMenuCursor
	call	RedrawEquippedRobot
	xor	A,A
	ld	(wStatusPage),A
	call	DrawGP
WorksUnitStatus.loop:
	ld	A,(wStatusPage)
	or	A,A
	jr	NZ,WorksUnitStatus.skip
	call	ShowSetupStats
	jr	WorksUnitStatus.loop2
WorksUnitStatus.skip:
	call	ShowWorksEquipNames
WorksUnitStatus.loop2:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,WorksUnitStatus.skip3
	bit	5,A
	jp	NZ,WorksUnitStatus.skip3
	bit	2,A
	jp	NZ,WorksUnitStatus.skip2
	bit	3,A
	jp	NZ,WorksUnitStatus.skip2
	jp	WorksUnitStatus.loop2
WorksUnitStatus.skip2:
	xorb	(wStatusPage),1
	jp	WorksUnitStatus.loop
WorksUnitStatus.skip3:
	ld	XHL,(wStatusReturn)
	jp	XHL

c_219C86	section	code abs=0x219C86

; [code] Stats submenu value 0 "Chara" (SetupStatsMenu): ThisIsYourStatusText + ShowMasterStats or ThisIsMyStatusText + ShowEngineerStats, L/R toggles wStatusPage, A/B returns (was WorksInfoMenus)
WorksCharaStatus:
	pop	XHL
	ld	(wStatusReturn),XHL
	call	HideMenuCursor
	xor	A,A
	ld	(wStatusPage),A
	call	DrawGP
WorksCharaStatus.loop:
	call	FlushMessage
	ld	A,(wStatusPage)
	or	A,A
	jr	NZ,WorksCharaStatus.skip
	ld	XHL,ThisIsYourStatusText
	ld	XDE,ThisIsYourStatusText
	call	ShowPartnerGenderText
	call	ClearScr2Picture
	ld	A,0xFE
	call	DrawPortraitScr2
	call	ShowMasterStats
	jr	WorksCharaStatus.loop2
WorksCharaStatus.skip:
	ld	XHL,ThisIsMyStatusText
	ld	XDE,ThisIsMyStatusText
	call	ShowPartnerGenderText
	call	ClearScr2Picture
	ld	A,0xFF
	call	DrawPortraitScr2
	call	ShowEngineerStats
WorksCharaStatus.loop2:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,WorksCharaStatus.skip3
	bit	5,A
	jp	NZ,WorksCharaStatus.skip3
	bit	2,A
	jp	NZ,WorksCharaStatus.skip2
	bit	3,A
	jp	NZ,WorksCharaStatus.skip2
	jp	WorksCharaStatus.loop2
WorksCharaStatus.skip2:
	xorb	(wStatusPage),1
	jp	WorksCharaStatus.loop
WorksCharaStatus.skip3:
	ld	XHL,(wStatusReturn)
	jp	XHL
