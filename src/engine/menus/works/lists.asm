; engine/menus/works/lists.asm: Works item and part list pages and hooks (shared by Item, Setup, Develop, Trade and the shop), Works > Item menu

c_21823C	section	code abs=0x21823C

; [code] list page callback: wListCount = GetItemGroupSize(wListGroup + 1), wListPages = (count + 9) / 10, group title (ItemGroupTitles), "page / pages" (PrintByteZeros, ItemListPageSlash), then 10 rows: GetItemNameWorks padded to 8, a TimesText2 "×" and the count (GetListItemCount & 0xF), "----------" DashText2 for count 0, ClearListLine past the end; [play] shop_sell_* and works_item_* screens
DrawItemListPage:
	ld	W,(wListGroup)
	inc	1,W
	call	GetItemGroupSize
	ld	(wListCount),A
	ld	A,(wListCount)
	extz	WA
	add	WA,9
	div	WA,0xA
	ld	(wListPages),A
	ld	A,(wListGroup)
	sll	2,A
	ld	XHL,ItemGroupTitles
	ld	XHL,(XHL+A)
	ld	BC,0
	ld	A,3
	call	PrintStringAt
	ld	BC,0x50B
	ld	E,(wListPage)
	inc	1,E
	ld	WA,0x203
	call	PrintByteZeros
	ld	BC,0x80B
	ld	E,(wListPages)
	ld	WA,0x203
	call	PrintByteZeros
	ld	A,3
	ld	B,1
	ld	XHL,ItemListPageSlash
	call	PrintStringTable
	ld	A,(wListGroup)
	inc	1,A
	ld	B,A
	ld	A,(wListPage)
	mul	WA,0xA
	inc	1,A
	ld	C,A
	ld	DE,1
	ld	WA,0xA
DrawItemListPage.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(wListCount)
	jr	C,DrawItemListPage.skip
	call	ClearListLine
	jp	DrawItemListPage.skip3
DrawItemListPage.skip:
	ld	WA,BC
	call	GetListItemCount
	or	A,A
	jr	NZ,DrawItemListPage.skip2
	ld	XHL,DashText2
	ld	B,D
	ld	C,E
	ld	A,3
	call	PrintStringAt
	jp	DrawItemListPage.skip3
DrawItemListPage.skip2:
	and	A,0xF
	push	WA
	ld	WA,BC
	call	ItemGroupToIndex
	call	GetItemNameWorks
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	PrintStringPadded8
	pop	DE
	ld	B,8
	ld	C,E
	ld	L,(TimesText2)
	exts	HL
	ld	A,3
	push	DE
	call	DrawCharAt
	pop	DE
	pop	WA
	ld	B,9
	ld	C,E
	ld	E,A
	extz	DE
	ld	WA,0x103
	call	PrintByteZeros
DrawItemListPage.skip3:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	djnz	WA,DrawItemListPage.loop
	ret

c_218331	section	code abs=0x218331

; [code] ret; stored as the wListUnusedHook list hook (no action) by the Works item lists, the shop item lists and the trade list (was swp_218331)
ItemListEmptyHook:
	ret

c_218332	section	code abs=0x218332

; [code] list move hook of the Setup accessory list (SetupSlotAccList): for a valid row StoreSelectedInWorksSlot + ShowSetupStats, else clear box 2 and print MenuLines_218AA8; then PrintListItemDesc
SetupAccListMoveHook:
	call	GetSelectedListItem
	jr	NC,SetupAccListMoveHook.skip
	call	StoreSelectedInWorksSlot
	call	ShowSetupStats
	jr	PrintListItemDesc
SetupAccListMoveHook.skip:
	calr	ClearTextBox2Home
	ld	A,2
	ld	B,8
	ld	XHL,MenuLines_218AA8
	call	PrintStringTable

c_218352	section	code abs=0x218352

; [code] list move hook of SetupWorksItemList (also the tail of SetupAccListMoveHook): ClearMessageBox, then for a row with GetListItemCount != 0 ItemGroupToIndex + GetItemDescWorks into the message box
PrintListItemDesc:
	call	ClearMessageBox
	call	GetSelectedListItem
	jr	NC,PrintListItemDesc.done
	ld	BC,WA
	call	GetListItemCount
	or	A,A
	jr	Z,PrintListItemDesc.done
	ld	WA,BC
	call	ItemGroupToIndex
	call	GetItemDescWorks
	ld	BC,0
	call	PrintInMessageBox
PrintListItemDesc.done:
	ret

c_218377	section	code abs=0x218377

; [code] list accept hook of the Setup accessory list (SetupSlotAccList): carry only for a valid row with GetListItemCount & 0xF != 0
ItemListAcceptCount:
	call	GetSelectedListItem
	jr	NC,ItemListAcceptDone
	ld	BC,WA
	call	GetListItemCount
	and	A,0xF
	jr	Z,ItemListAcceptDone

c_218388	section	code abs=0x218388

; [code] scf; ret: list accept hook of SetupWorksItemList (every row accepted)
ItemListAcceptAny:
	scf

c_218389	section	code abs=0x218389

; [code] ret: no-carry exit of ItemListAcceptCount (ItemListAcceptAny falls in after scf) (was loc_218389)
ItemListAcceptDone:
	ret

c_21838A	section	code abs=0x21838A

; [code] A = wListPage * 10 + wListRow + 1, W = wListGroup + 1, CheckItemGroupIndex (carry when valid)
GetSelectedListItem:
	ld	A,(wListPage)
	mul	WA,0xA
	add	A,(wListRow)
	inc	1,A
	ld	W,(wListGroup)
	inc	1,W
	call	CheckItemGroupIndex
	ret

c_2183A2	section	code abs=0x2183A2

; [code] GetItemCountBy (DrawItemListPage, DrawShopBuyItemPage)
GetListItemCount:
	call	GetItemCountBy
	ret

c_2183A7	section	code abs=0x2183A7

; [code] hooks move SetupAccListMoveHook / accept ItemListAcceptCount, then the rest of SetupWorksItemList (jr SetupWorksItemList.skip) with A = 0; SetupEquipSlotList for the accessory slots
SetupSlotAccList:
	ld	XHL,SetupAccListMoveHook
	ld	XDE,ItemListAcceptCount
	jr	SetupWorksItemList.skip

c_2183B3	section	code abs=0x2183B3

; [code] list hooks: move PrintListItemDesc, accept ItemListAcceptAny, wListGroup = A, page DrawItemListPage, cells 0x2181D8, ListReset; WorksItemMenu > Item
SetupWorksItemList:
	ld	XHL,PrintListItemDesc
	ld	XDE,ItemListAcceptAny
SetupWorksItemList.skip:
	ld	(wListMoveHook),XHL
	ld	(wListAcceptHook),XDE
	ld	(wListGroup),A
	ld	A,0xA
	ld	(wListRows),A
	ld	XHL,DrawItemListPage
	ld	(wListDrawPage),XHL
	ld	XHL,ItemListEmptyHook
	ld	(wListUnusedHook),XHL
	ld	XHL,ListCursor_2181D8
	ld	(wListCells),XHL
	jp	ListReset

c_21848E	section	code abs=0x21848E

; [code] list page callback for the entry lists: wListCount = GetEntryGroupSize(GetListEntryGroup), wListPages = (count + 9) / 10, title by wListEntryKind (PartListTitles: Body, Core, Leg, BPack, Arm, Arm-Sel, Mate.-Sel, Tool-Sel), page / pages, 10 rows of GetEntryName padded to 8 + "×" + count (GetListEntryCount), "----------" for count 0
DrawPartListPage:
	call	GetListEntryGroup
	call	GetEntryGroupSize
	ld	(wListCount),A
	ld	A,(wListCount)
	extz	WA
	add	WA,9
	div	WA,0xA
	ld	(wListPages),A
	ld	A,(wListEntryKind)
	sll	2,A
	ld	XHL,PartListTitles
	ld	XHL,(XHL+A)
	ld	BC,0
	ld	A,3
	call	PrintStringAt
	ld	BC,0x50B
	ld	E,(wListPage)
	inc	1,E
	ld	WA,0x203
	call	PrintByteZeros
	ld	BC,0x80B
	ld	E,(wListPages)
	ld	WA,0x203
	call	PrintByteZeros
	ld	A,3
	ld	B,1
	ld	XHL,PartListPageSlash
	call	PrintStringTable
	call	GetListEntryGroup
	ld	B,W
	ld	A,(wListPage)
	mul	WA,0xA
	inc	1,A
	ld	C,A
	ld	DE,1
	ld	WA,0xA
DrawPartListPage.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(wListCount)
	jr	C,DrawPartListPage.skip
	call	ClearListLine
	jp	DrawPartListPage.skip3
DrawPartListPage.skip:
	ld	WA,BC
	call	GetListEntryCount
	or	A,A
	jr	NZ,DrawPartListPage.skip2
	ld	XHL,DashText3
	ld	B,D
	ld	C,E
	ld	A,3
	call	PrintStringAt
	jp	DrawPartListPage.skip3
DrawPartListPage.skip2:
	and	A,0xF
	push	WA
	ld	WA,BC
	call	GetEntryName
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	PrintStringPadded8
	pop	DE
	ld	B,8
	ld	C,E
	ld	L,(TimesText3)
	ld	A,3
	push	DE
	call	DrawCharAt
	pop	DE
	pop	WA
	ld	B,9
	ld	C,E
	ld	E,A
	ld	WA,0x103
	call	PrintByteZeros
DrawPartListPage.skip3:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	djnz	WA,DrawPartListPage.loop
	ret

c_218577	section	code abs=0x218577

; [code] ret; stored as the wListUnusedHook list hook (no action) by the Develop / part lists, the shop part lists and the trade list (was swp_218577)
EntryListEmptyHook:
	ret

c_218578	section	code abs=0x218578

; [code] list move hook of SetupDevelopArmList: clears box 4, for a row with a count ShowPartEpCostAndAffinity of the selected entry, then PrintListEntryDesc
DevelopArmMoveHook:
	call	ClearTextBox4Home
	call	HasSelectedEntryCount
	jr	NC,DevelopArmMoveHook.skip
	call	GetSelectedListEntry
	call	ShowPartEpCostAndAffinity
DevelopArmMoveHook.skip:
	jr	PrintListEntryDesc

c_21858C	section	code abs=0x21858C

; [code] list move hook of SetupDevelopMaterialList: clears box 4, for an accepted row wDevelopMaterial = the selected entry and UpdateDevelopChanceBox, then PrintListEntryDesc
DevelopMaterialMoveHook:
	call	ClearTextBox4Home
	ld	XHL,(wListAcceptHook)
	call	CallXHL
	jr	NC,DevelopMaterialMoveHook.skip
	call	GetSelectedListEntry
	ld	(wDevelopMaterial),A
	call	UpdateDevelopChanceBox
DevelopMaterialMoveHook.skip:
	jr	PrintListEntryDesc

c_2185A8	section	code abs=0x2185A8

; [code] list move hook of SetupDevelopToolList: clears box 4, for an accepted row wDevelopTool = the selected entry and UpdateDevelopChanceBox, then PrintListEntryDesc
DevelopToolMoveHook:
	call	ClearTextBox4Home
	ld	XHL,(wListAcceptHook)
	call	CallXHL
	jr	NC,DevelopToolMoveHook.skip
	call	GetSelectedListEntry
	ld	(wDevelopTool),A
	call	UpdateDevelopChanceBox
DevelopToolMoveHook.skip:
	jr	PrintListEntryDesc

c_2185C4	section	code abs=0x2185C4

; [code] list move hook of the Setup part lists (SetupSlotPartList): StoreSelectedInWorksSlot, ShowSetupStats, clear box 4, ShowPartEpCostAndAffinity for a row with a count, then PrintListEntryDesc
SetupPartListMoveHook:
	call	StoreSelectedInWorksSlot
	call	ShowSetupStats
	call	ClearTextBox4Home
	call	HasSelectedEntryCount
	jr	NC,SetupPartListMoveHook.skip
	call	GetSelectedListEntry
	call	ShowPartEpCostAndAffinity
SetupPartListMoveHook.skip:
	jr	PrintListEntryDesc

c_2185E0	section	code abs=0x2185E0

; [code] list move hook of SetupWorksPartList: ShowSelectedPartStats (filter HasSelectedEntryCount), then PrintListEntryDesc
WorksPartMoveHook:
	ld	XHL,HasSelectedEntryCount
	call	ShowSelectedPartStats

c_2185E9	section	code abs=0x2185E9

; [code] tail of the entry-list move hooks: ClearMessageBox, then for a row with GetListEntryCount != 0 GetEntryDesc into the message box
PrintListEntryDesc:
	call	ClearMessageBox
	call	GetSelectedListEntry
	jr	NC,PrintListEntryDesc.done
	ld	BC,WA
	call	GetListEntryCount
	or	A,A
	jr	Z,PrintListEntryDesc.done
	ld	WA,BC
	call	GetEntryDesc
	ld	BC,0
	call	PrintInMessageBox
PrintListEntryDesc.done:
	ret

c_21860A	section	code abs=0x21860A

; [code] list accept hook of the Develop arm / material / tool lists and the Setup part list: carry only for a valid row with GetListEntryCount & 0xF != 0
EntryListAcceptCount:
	call	GetSelectedListEntry
	jr	NC,EntryListAcceptDone
	ld	BC,WA
	call	GetListEntryCount
	and	A,0xF
	jr	Z,EntryListAcceptDone

c_21861B	section	code abs=0x21861B

; [code] scf; ret: list accept hook of SetupWorksPartList (every row accepted)
EntryListAcceptAny:
	scf

c_21861C	section	code abs=0x21861C

; [code] ret: no-carry exit of EntryListAcceptCount (EntryListAcceptAny falls in after scf) (was loc_21861C)
EntryListAcceptDone:
	ret

c_21861D	section	code abs=0x21861D

; [code] carry when GetSelectedListEntry is valid and GetListEntryCount != 0; ShowSelectedPartStats filter of WorksPartMoveHook, and DevelopArmMoveHook
HasSelectedEntryCount:
	call	GetSelectedListEntry
	ret	NC
	call	GetListEntryCount
	or	A,A
	ret	Z
	scf
	ret

c_21862D	section	code abs=0x21862D

; [code] A = wListPage * 10 + wListRow + 1, W = entry group from ListEntryKindGroups[0x6183] (1-5 part groups, 8 / 9 item groups), CheckEntryGroupIndex
GetSelectedListEntry:
	ld	A,(wListPage)
	mul	WA,0xA
	add	A,(wListRow)
	inc	1,A
	call	GetListEntryGroup
	push	WA
	call	CheckEntryGroupIndex
	pop	WA
	ret

c_218645	section	code abs=0x218645

; [code] GetEntryCountBy (DrawPartListPage)
GetListEntryCount:
	call	GetEntryCountBy
	ret

c_21864A	section	code abs=0x21864A

; [code] W = byte ListEntryKindGroups[0x6183] (01 02 03 04 05 05 09 08: part groups 1-5, item groups + 5)
GetListEntryGroup:
	push	XHL
	ld	XHL,ListEntryKindGroups
	ld	W,(wListEntryKind)
	ld	W,(XHL+W)
	pop	XHL
	ret
ListEntryKindGroups:
	db	0x01,0x02,0x03,0x04,0x05,0x05,0x09,0x08

c_218663	section	code abs=0x218663

; [code] hooks move SetupPartListMoveHook / accept EntryListAcceptCount, then SetupEntryList with A = kind; SetupEquipSlotList for the part slots
SetupSlotPartList:
	ld	XHL,SetupPartListMoveHook
	ld	XDE,EntryListAcceptCount
	jr	SetupEntryList

c_21866F	section	code abs=0x21866F

; [code] wListEntryKind 5 (Arm-Sel), hooks move DevelopArmMoveHook / accept EntryListAcceptCount, then the shared entry-list setup; WorksDevelopMenu's first list (WhatDoYouWantText5)
SetupDevelopArmList:
	ld	A,5
	ld	XHL,DevelopArmMoveHook
	ld	XDE,EntryListAcceptCount
	jr	SetupEntryList

c_21867D	section	code abs=0x21867D

; [code] wListEntryKind 6 (Mate.-Sel), hooks move DevelopMaterialMoveHook / accept EntryListAcceptCount; WorksDevelopMenu's second list (WhatDoYouWantText6)
SetupDevelopMaterialList:
	ld	A,6
	ld	XHL,DevelopMaterialMoveHook
	ld	XDE,EntryListAcceptCount
	jr	SetupEntryList

c_21868B	section	code abs=0x21868B

; [code] wListEntryKind 7 (Tool-Sel), hooks move DevelopToolMoveHook / accept EntryListAcceptCount; WorksDevelopMenu after DoYouWantToText5 (SelectAToolText)
SetupDevelopToolList:
	ld	A,7
	ld	XHL,DevelopToolMoveHook
	ld	XDE,EntryListAcceptCount
	jr	SetupEntryList

c_218699	section	code abs=0x218699

; [code] list hooks: move WorksPartMoveHook, accept EntryListAcceptAny, page DrawPartListPage, cells 0x2183EE, ListReset; WorksItemMenu > Parts (after SetupPartCategoryMenu, WhichPartsDoYouText)
SetupWorksPartList:
	ld	XHL,WorksPartMoveHook
	ld	XDE,EntryListAcceptAny

c_2186A3	section	code abs=0x2186A3

; [code] shared tail of the entry-list setups: wListMoveHook = XHL, wListAcceptHook = XDE, wListEntryKind = A, 10 rows, page DrawPartListPage, cells ListCursor_2183EE, ListReset
SetupEntryList:
	ld	(wListMoveHook),XHL
	ld	(wListAcceptHook),XDE
	ld	(wListEntryKind),A
	ld	A,0xA
	ld	(wListRows),A
	ld	XHL,DrawPartListPage
	ld	(wListDrawPage),XHL
	ld	XHL,EntryListEmptyHook
	ld	(wListUnusedHook),XHL
	ld	XHL,ListCursor_2183EE
	ld	(wListCells),XHL
	jp	ListReset

c_2188A9	section	code abs=0x2188A9

; [code] WA = the selected list entry (wSetupSlot < 6) or item + 5 (accessory slots), 0 when the row is invalid; stored in the Works equipment slot wSetupSlot through the setter table WorksEquipSetters (SetWorksEquipBody .. SetWorksEquipAcc2)
StoreSelectedInWorksSlot:
	cpb	(wSetupSlot),6
	jr	NC,StoreSelectedInWorksSlot.skip
	call	GetSelectedListEntry
	jr	NC,StoreSelectedInWorksSlot.skip2
	jr	StoreSelectedInWorksSlot.skip3
StoreSelectedInWorksSlot.skip:
	call	GetSelectedListItem
	jr	NC,StoreSelectedInWorksSlot.skip2
	add	W,5
	jr	StoreSelectedInWorksSlot.skip3
StoreSelectedInWorksSlot.skip2:
	ld	WA,0
StoreSelectedInWorksSlot.skip3:
	ld	BC,WA
	ld	A,(wSetupSlot)
	sll	2,A
	ld	XHL,WorksEquipSetters
	ld	XHL,(XHL+A)
	ld	WA,BC
	call	CallXHL
	ret
WorksEquipSetters:
	dl	SetWorksEquipBody,SetWorksEquipRightArm,SetWorksEquipLeftArm,SetWorksEquipCore
	dl	SetWorksEquipLegs,SetWorksEquipBack,SetWorksEquipAcc1,SetWorksEquipAcc2

c_218932	section	code abs=0x218932

; [code] ClearTextBoxHome with A = 4; byte-identical copy of ClearTextBox4HomeB (the ROM has each)
ClearTextBox4Home:
	ld	A,4
	call	ClearTextBoxHome
	ret

c_21895C	section	code abs=0x21895C

; [code] SetShownPart (WA) + DrawPartEpCostAndAffinity
ShowPartEpCostAndAffinity:
	call	SetShownPart
	call	DrawPartEpCostAndAffinity
	ret

c_218965	section	code abs=0x218965

; [code] wShownPart = WA
SetShownPart:
	ld	(wShownPart),WA
	ret

c_21896A	section	code abs=0x21896A

; [code] clears box 4; for wShownPart != 0: GetPartStatsBy, record +0xC (ep_cost) and +0xE (affinity) to wShownPartEpCost / wShownPartAffinity, "EP" (EPText3) + PrintByteZeros at 2,0, DrawAffinityIcons at 5,0; [play] works_develop_*_result screens
DrawPartEpCostAndAffinity:
	ld	A,4
	call	ClearTextBoxHome
	ld	WA,(wShownPart)
	or	WA,WA
	jr	Z,DrawPartEpCostAndAffinity.done
	call	GetPartStatsBy
	ld	WA,(XHL+0xC)
	ld	(wShownPartEpCost),A
	ld	WA,(XHL+0xE)
	ld	(wShownPartAffinity),A
	ld	XHL,EPText3
	ld	WA,4
	call	PrintStringAt
	ld	BC,0x200
	ld	E,(wShownPartEpCost)
	ld	WA,0x204
	call	PrintByteZeros
	ld	BC,0x500
	ld	E,(wShownPartAffinity)
	ld	WA,0x304
	call	DrawAffinityIcons
DrawPartEpCostAndAffinity.done:
	ret
PercentText:
	text "%"
	done

c_218A62	section	code abs=0x218A62

; [code] ClearTextBoxHome with A = 4; byte-identical copy of ClearTextBox4Home (the ROM has each)
ClearTextBox4HomeB:
	ld	A,4
	call	ClearTextBoxHome
	ret

c_218A69	section	code abs=0x218A69

; [code] ClearTextBoxHome with A = 2
ClearTextBox2Home:
	ld	A,2
	call	ClearTextBoxHome
	ret

c_219238	section	code abs=0x219238

; [code] XHL = filter callback (wPanelPartFilter), LoadSelectedPartStats, DrawPartStatsPanel; called by the shop buy / sell part move hooks and WorksPartMoveHook
ShowSelectedPartStats:
	ld	(wPanelPartFilter),XHL
	call	LoadSelectedPartStats
	call	DrawPartStatsPanel
	ret

c_219256	section	code abs=0x219256

; [code] wPanelPart = GetSelectedListEntry when valid and the wPanelPartFilter callback returns carry, else 0; falls into LoadPartStatsPanel (develop.asm)
LoadSelectedPartStats:
	ldw	(wPanelPart),0
	call	GetSelectedListEntry
	jp	NC,ClearPanelPart
	ld	(wPanelPart),WA
	ld	XHL,(wPanelPartFilter)
	call	CallXHL
	jr	NC,ClearPanelPart

c_2192D7	section	code abs=0x2192D7

; [code] wPanelPart = 0 (LoadSelectedPartStats: invalid row or filter refused), falls into DrawPartStatsPanel (was loc_2192D7)
ClearPanelPart:
	ldw	(wPanelPart),0

c_2192DE	section	code abs=0x2192DE

; [code] box 2: labels MenuLines_2191C8 (HP EP AP SP RP MP AT), then dashes (MenuLines_21920E) when wPanelPart = 0, else the 6 words of wPanelStats (PrintWordZeros) and DrawAffinityIcons
DrawPartStatsPanel:
	ld	A,2
	ld	B,7
	ld	XHL,MenuLines_2191C8
	call	PrintStringTable
	cpw	(wPanelPart),0
	jp	NZ,DrawPartStatsPanel.skip
	ld	A,2
	ld	B,7
	ld	XHL,MenuLines_21920E
	call	PrintStringTable
	jp	DrawPartStatsPanel.done
DrawPartStatsPanel.skip:
	ld	BC,0x300
	ld	DE,(wPanelStats)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x301
	ld	DE,(wPanelStats+2)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x302
	ld	DE,(wPanelStats+4)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x303
	ld	DE,(wPanelStats+6)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x304
	ld	DE,(wPanelStats+8)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x305
	ld	DE,(wPanelStats+10)
	ld	WA,0x302
	call	PrintWordZeros
	ld	BC,0x308
	ld	E,(wPanelStats+12)
	ld	WA,0x302
	call	DrawAffinityIcons
DrawPartStatsPanel.done:
	ret

c_219D1A	section	code abs=0x219D1A

; [code] Works menu value 1 "Item": SetupItemPartsMenu (Item / Parts / Exit), HeresTheItemDataText; [play] its first instruction ran on works_item_list_final_collection and camp_item_list_menu
WorksItemMenu:
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,HeresTheItemDataText
	ld	XDE,HeresTheItemDataText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksItemMenu.skip
	cp	A,0
	jp	Z,WorksItemMenu.loop
	cp	A,1
	jp	Z,WorksItemMenu.loop2
	jp	WorksItemMenu.skip
WorksItemMenu.loop:
	call	SetupPartCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichPartsDoYouText
	ld	XDE,WhichPartsDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksItemMenu
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wMenuChoice)
	call	SetupWorksPartList
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,HeresTheDataListText
	ld	XDE,HeresTheDataListText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	WorksGreeting
	jp	WorksItemMenu.loop
WorksItemMenu.loop2:
	call	SetupItemCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichItemDoYouText
	ld	XDE,WhichItemDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksItemMenu
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wMenuChoice)
	call	SetupWorksItemList
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,HeresTheDataListText
	ld	XDE,HeresTheDataListText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	WorksGreeting
	jp	WorksItemMenu.loop2
WorksItemMenu.skip:
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	cpb	(wWorksScreenMode),WORKS_MODE_CAMP_ITEMS
	jp	Z,WorksExit
	jp	WorksMainMenu
