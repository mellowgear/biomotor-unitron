; engine/menus/works/setup.asm: Works > Setup: equip part list, Works equipment list copy / equip / slot accessors

c_218743	section	code abs=0x218743

; [code] page callback of SetupEquipPartList: SetupText2, labels MenuLines_218713, GetEntryName of the Works slots body, right arm, left arm, core, legs, back (rows 1, 3-7) and accessories 1 / 2 (rows 9, 10)
DrawEquipListPage:
	ld	A,1
	ld	(wListPages),A
	ld	XHL,SetupText2
	ld	A,3
	ld	BC,0
	call	PrintStringAt
	ld	A,3
	ld	B,8
	ld	XHL,MenuLines_218713
	call	PrintStringTable
	call	GetWorksEquipBody
	call	GetEntryName
	ld	BC,0x301
	ld	WA,3
	call	PrintStringAt
	call	GetWorksEquipRightArm
	call	GetEntryName
	ld	BC,0x303
	ld	WA,3
	call	PrintStringAt
	call	GetWorksEquipLeftArm
	call	GetEntryName
	ld	BC,0x304
	ld	WA,3
	call	PrintStringAt
	call	GetWorksEquipCore
	call	GetEntryName
	ld	BC,0x305
	ld	WA,3
	call	PrintStringAt
	call	GetWorksEquipLegs
	call	GetEntryName
	ld	BC,0x306
	ld	WA,3
	call	PrintStringAt
	call	GetWorksEquipBack
	call	GetEntryName
	ld	BC,0x307
	ld	WA,3
	call	PrintStringAt
	call	GetWorksEquipAcc1
	call	GetEntryName
	ld	BC,0x309
	ld	WA,3
	call	PrintStringAt
	call	GetWorksEquipAcc2
	call	GetEntryName
	ld	BC,0x30A
	ld	WA,3
	call	PrintStringAt
	ret

c_2187EC	section	code abs=0x2187EC

; [code] ret; stored as the wListUnusedHook list hook (no action) by SetupEquipPartList (was swp_2187EC)
EquipListEmptyHook:
	ret

c_2187ED	section	code abs=0x2187ED

; [code] list move hook of SetupEquipPartList: ClearMessageBox, GetEquipListRowEntry, GetEntryDesc into the message box when valid
EquipListMoveHook:
	call	ClearMessageBox
	call	GetEquipListRowEntry
	jr	NC,EquipListMoveHook.done
	call	CallGetEntryDesc
	ld	BC,0
	call	PrintInMessageBox
EquipListMoveHook.done:
	ret

c_218802	section	code abs=0x218802

; [code] list accept hook of SetupEquipPartList: carry unless wListRow = 0 (the body row); no carry makes the list command play sound 0x83 and stay in the list
; [play] seen in play: A on the BD (Body) row of Works > Setup only plays sound 0x83; no part list opens and the body description stays (A on RA plays 0x81 and opens the Arm list)
EquipListAcceptHook:
	ld	A,(wListRow)
	cp	A,0
	ret	Z
	scf
	ret

c_21880C	section	code abs=0x21880C

; [code] WA = Works slot of row wListRow through the getter table EquipListRowGetters (body, right arm, left arm, core, legs, back, acc 1, acc 2), then CheckEntryGroupIndex
GetEquipListRowEntry:
	ld	A,(wListRow)
	sll	2,A
	ld	XHL,EquipListRowGetters
	ld	XHL,(XHL+A)
	call	CallXHL
	call	CheckEntryGroupIndex
	ret
; [code] Works slot getter per Setup list row 0-7
EquipListRowGetters:
	dl	GetWorksEquipBody,GetWorksEquipRightArm,GetWorksEquipLeftArm,GetWorksEquipCore
	dl	GetWorksEquipLegs,GetWorksEquipBack,GetWorksEquipAcc1,GetWorksEquipAcc2

c_218846	section	code abs=0x218846

; [code] call GetEntryDesc; ret (EquipListMoveHook)
CallGetEntryDesc:
	call	GetEntryDesc
	ret

c_21884B	section	code abs=0x21884B

; [code] list page DrawEquipListPage, hooks move EquipListMoveHook, accept EquipListAcceptHook, cells 0x2186D4, ListReset; caller WorksSetupMenu after CopyEquipToWorks
SetupEquipPartList:
	ld	A,8
	ld	(wListRows),A
	ld	XHL,DrawEquipListPage
	ld	(wListDrawPage),XHL
	ld	XHL,EquipListEmptyHook
	ld	(wListUnusedHook),XHL
	ld	XHL,EquipListMoveHook
	ld	(wListMoveHook),XHL
	ld	XHL,EquipListAcceptHook
	ld	(wListAcceptHook),XHL
	ld	XHL,ListCursor_2186D4
	ld	(wListCells),XHL
	jp	ListReset

c_218882	section	code abs=0x218882

; [code] wSetupSlot = A (the Setup row); kind = byte SetupSlotKinds[A] (0 Body, 4 Arm, 4 Arm, 1 Core, 2 Leg, 3 BPack, 5, 5): < 5 the part list (SetupSlotPartList), else the accessory item list (SetupSlotAccList); caller WorksSetupMenu after ChooseAPartText's row pick
SetupEquipSlotList:
	ld	(wSetupSlot),A
	ld	XHL,SetupSlotKinds
	ld	A,(XHL+A)
	cp	A,5
	jp	NC,SetupEquipSlotList.skip
	jp	SetupSlotPartList
SetupEquipSlotList.skip:
	ld	A,0
	jp	SetupSlotAccList
; [code] list kind per Setup slot: 0 body, 4 arm, 1 core, 2 legs, 3 back, 5 accessory
SetupSlotKinds:
	db	0x00,0x04,0x04,0x01,0x02,0x03,0x05,0x05

c_2194C8	section	code abs=0x2194C8

; [code] equipment slots -> Works list 0x61C3 (category << 8 | id: body, LA, RA, core, legs, back, A1, A2)
CopyEquipToWorks:
	ldw	(wWorksEquip),0
	ldw	(wWorksEquip+2),0
	ldw	(wWorksEquip+4),0
	ldw	(wWorksEquip+6),0
	ldw	(wWorksEquip+8),0
	ldw	(wWorksEquip+10),0
	ldw	(wWorksEquip+12),0
	ldw	(wWorksEquip+14),0
	ld	WA,0x200
	or	A,(wEquipCore)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip+6),WA
	ld	WA,0x100
	or	A,(wEquipBody)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip),WA
	ld	WA,0x500
	or	A,(wEquipLeftArm)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip+2),WA
	ld	WA,0x500
	or	A,(wEquipRightArm)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip+4),WA
	ld	WA,0x300
	or	A,(wEquipLegs)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip+8),WA
	ld	WA,0x400
	or	A,(wEquipBack)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip+10),WA
	ld	WA,0x600
	or	A,(wEquipAcc1)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip+12),WA
	ld	WA,0x600
	or	A,(wEquipAcc2)
	call	Z,EmptyWorksEntry
	ld	(wWorksEquip+14),WA
	ret

c_219579	section	code abs=0x219579

; [code] WA = 0; CopyEquipToWorks calls it (call Z) for an empty equipment slot, so that Works slot word is 0 instead of group << 8
EmptyWorksEntry:
	ld	WA,0
	ret

c_21957C	section	code abs=0x21957C

; [code] Works list 0x61C3-0x61D1 back into wEquipBody..wEquipAcc2
CopyWorksToEquip:
	ld	WA,(wWorksEquip+6)
	ld	(wEquipCore),A
	ld	WA,(wWorksEquip)
	ld	(wEquipBody),A
	ld	WA,(wWorksEquip+2)
	ld	(wEquipLeftArm),A
	ld	WA,(wWorksEquip+4)
	ld	(wEquipRightArm),A
	ld	WA,(wWorksEquip+8)
	ld	(wEquipLegs),A
	ld	WA,(wWorksEquip+10)
	ld	(wEquipBack),A
	ld	WA,(wWorksEquip+12)
	ld	(wEquipAcc1),A
	ld	WA,(wWorksEquip+14)
	ld	(wEquipAcc2),A
	ret

c_2195BD	section	code abs=0x2195BD

; [code] per slot: if changed, store it, RemoveItem the new part, AddItem the old one
EquipFromWorksList:
	ld	WA,(wWorksEquip+6)
	ld	XHL,wEquipCore
	call	SwapEquipSlot
	ld	WA,(wWorksEquip)
	ld	XHL,wEquipBody
	call	SwapEquipSlot
	ld	WA,(wWorksEquip+2)
	ld	XHL,wEquipLeftArm
	call	SwapEquipSlot
	ld	WA,(wWorksEquip+4)
	ld	XHL,wEquipRightArm
	call	SwapEquipSlot
	ld	WA,(wWorksEquip+8)
	ld	XHL,wEquipLegs
	call	SwapEquipSlot
	ld	WA,(wWorksEquip+10)
	ld	XHL,wEquipBack
	call	SwapEquipSlot
	ld	WA,(wWorksEquip+12)
	ld	XHL,wEquipAcc1
	call	SwapEquipSlot
	ld	WA,(wWorksEquip+14)
	ld	XHL,wEquipAcc2
	call	SwapEquipSlot
	ret

c_219626	section	code abs=0x219626

; [code] WA = Works slot value, XHL = equipment byte: if different store A, RemoveItemByCategory the new part, AddItemByCategory the old one (EquipFromWorksList per slot)
SwapEquipSlot:
	cp	(XHL),A
	ret	Z
	ld	B,W
	ld	C,(XHL)
	ld	(XHL),A
	push	BC
	call	RemoveItemByCategory
	pop	WA
	call	AddItemByCategory
	ret

c_21963B	section	code abs=0x21963B

; [code] WA = wWorksEquip (body slot)
GetWorksEquipBody:
	ld	WA,(wWorksEquip)
	ret

c_219640	section	code abs=0x219640

; [code] WA = wWorksEquip+2 (left arm slot, from wEquipLeftArm in CopyEquipToWorks)
GetWorksEquipLeftArm:
	ld	WA,(wWorksEquip+2)
	ret

c_219645	section	code abs=0x219645

; [code] WA = wWorksEquip+4 (right arm slot)
GetWorksEquipRightArm:
	ld	WA,(wWorksEquip+4)
	ret

c_21964A	section	code abs=0x21964A

; [code] WA = wWorksEquip+6 (core slot)
GetWorksEquipCore:
	ld	WA,(wWorksEquip+6)
	ret

c_21964F	section	code abs=0x21964F

; [code] WA = wWorksEquip+8 (legs slot)
GetWorksEquipLegs:
	ld	WA,(wWorksEquip+8)
	ret

c_219654	section	code abs=0x219654

; [code] WA = wWorksEquip+10 (back slot)
GetWorksEquipBack:
	ld	WA,(wWorksEquip+10)
	ret

c_219659	section	code abs=0x219659

; [code] WA = wWorksEquip+12 (accessory 1 slot)
GetWorksEquipAcc1:
	ld	WA,(wWorksEquip+12)
	ret

c_21965E	section	code abs=0x21965E

; [code] WA = wWorksEquip+14 (accessory 2 slot)
GetWorksEquipAcc2:
	ld	WA,(wWorksEquip+14)
	ret

c_219663	section	code abs=0x219663

; [code] wWorksEquip (body slot) = WA
SetWorksEquipBody:
	ld	(wWorksEquip),WA
	ret

c_219668	section	code abs=0x219668

; [code] wWorksEquip+2 (left arm slot) = WA
SetWorksEquipLeftArm:
	ld	(wWorksEquip+2),WA
	ret

c_21966D	section	code abs=0x21966D

; [code] wWorksEquip+4 (right arm slot) = WA
SetWorksEquipRightArm:
	ld	(wWorksEquip+4),WA
	ret

c_219672	section	code abs=0x219672

; [code] wWorksEquip+6 (core slot) = WA
SetWorksEquipCore:
	ld	(wWorksEquip+6),WA
	ret

c_219677	section	code abs=0x219677

; [code] wWorksEquip+8 (legs slot) = WA
SetWorksEquipLegs:
	ld	(wWorksEquip+8),WA
	ret

c_21967C	section	code abs=0x21967C

; [code] wWorksEquip+10 (back slot) = WA
SetWorksEquipBack:
	ld	(wWorksEquip+10),WA
	ret

c_219681	section	code abs=0x219681

; [code] wWorksEquip+12 (accessory 1 slot) = WA
SetWorksEquipAcc1:
	ld	(wWorksEquip+12),WA
	ret

c_219686	section	code abs=0x219686

; [code] wWorksEquip+14 (accessory 2 slot) = WA
SetWorksEquipAcc2:
	ld	(wWorksEquip+14),WA
	ret

c_21A570	section	code abs=0x21A570

; [code] Works menu value 4 "Setup": YouWantToEquipText, CopyEquipToWorks, part list (ChooseAPartText), EquipFromWorksList, WorksUnitStatus; [play] its first instruction ran on works_setup_hangar*
WorksSetupMenu:
	call	ClearTextBox4HomeB
	ld	XHL,YouWantToEquipText
	ld	XDE,YouWantToEquipText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideMenuCursor
	call	CopyEquipToWorks
	call	ShowSetupStats
WorksSetupMenu.loop:
	call	OpenListBox
WorksSetupMenu.loop2:
	call	ClearTextBox4HomeB
	call	SetupEquipPartList
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhatDoYouWantText4
	ld	XDE,WhatDoYouWantText4
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,WorksSetupMenu.skip2
	jr	WorksSetupMenu.skip
WorksSetupMenu.loop3:
	call	CopyEquipToWorks
	call	ShowSetupStats
	call	OpenListBox
	jp	WorksSetupMenu.loop2
WorksSetupMenu.skip:
	ld	WA,(wListChoice)
	call	UnequipWorksAccessory
	call	EquipFromWorksList
	call	OpenListBox
	ld	WA,(wListChoice)
	call	SetupEquipSlotList
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAPartText
	ld	XDE,ChooseAPartText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,WorksSetupMenu.loop3
	call	ClearMessageBox
	ld	WA,SFX_EQUIP
	call	CallSoundCommand
	call	EquipFromWorksList
	call	WorksUnitStatus
	jp	WorksSetupMenu.loop
WorksSetupMenu.skip2:
	ld	XHL,OKLetsGoBackText
	ld	XDE,OKLetsGoBackText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideListCursor
	jp	WorksMenuReturn

c_21A66B	section	code abs=0x21A66B

; [code] WA = Setup row: rows 6 / 7 (accessory 1 / 2) give the slot's item back (AddItemByCategory) and clear it; caller WorksSetupMenu before EquipFromWorksList
UnequipWorksAccessory:
	sub	WA,6
	jr	C,UnequipWorksAccessory.done
	ld	XHL,0x61CF
	ld	XDE,0x61D1
	call	SelectXDEIfNZ
	ld	WA,(XHL)
	ldw	(XHL),0
	call	AddItemByCategory
UnequipWorksAccessory.done:
	ret

c_21A68A	section	code abs=0x21A68A

; [code] ret Z, else XHL = XDE (3 instructions); caller UnequipWorksAccessory picks 0x61CF or 0x61D1 by its flags (was misnamed WorksDevelopMenu)
SelectXDEIfNZ:
	ret	Z
	ld	XHL,XDE
	ret
