; engine/menus/shop/lists.asm: shop buy/sell list pages and hooks

c_21B394	section	code abs=0x21B394

; [code] list page callback of SetupShopBuyItemList: title by wListGroup (0x218218: Acce., Item, Tool, Mate.), page / pages, 10 rows: IsListItemStocked -> GetItemEntryName padded to 8 + "×" + GetListItemCount (blank when 0), else "----------"; [play] shop_buy_items / shop_buy_acce screens
DrawShopBuyItemPage:
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
DrawShopBuyItemPage.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(wListCount)
	jr	C,DrawShopBuyItemPage.skip
	call	ClearListLine
	jp	DrawShopBuyItemPage.skip4
DrawShopBuyItemPage.skip:
	ld	WA,BC
	call	IsListItemStocked
	jr	C,DrawShopBuyItemPage.skip2
	ld	XHL,DashText2
	ld	B,D
	ld	C,E
	ld	A,3
	call	PrintStringAt
	jp	DrawShopBuyItemPage.skip4
DrawShopBuyItemPage.skip2:
	push	BC
	ld	WA,BC
	call	GetItemEntryName
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	PrintStringPadded8
	pop	DE
	pop	WA
	call	GetListItemCount
	or	A,A
	jr	NZ,DrawShopBuyItemPage.skip3
	ld	XHL,BlankText7
	ld	B,8
	ld	C,E
	ld	A,3
	call	PrintStringAt
	jr	DrawShopBuyItemPage.skip4
DrawShopBuyItemPage.skip3:
	and	A,0xF
	push	WA
	ld	B,8
	ld	C,E
	ld	L,(TimesText2)
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
DrawShopBuyItemPage.skip4:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	dec	1,WA
	or	WA,WA
	jp	NZ,DrawShopBuyItemPage.loop
	ret

c_21B4A0	section	code abs=0x21B4A0

; [code] list move hook of SetupShopBuyItemList: ClearMessageBox, then for a stocked row (IsListItemStocked) the item description (PrintInMessageBox) and GetItemPriceBy (PrintHexBlanks at 12,2)
ShopBuyItemMoveHook:
	call	ClearMessageBox
	call	GetSelectedListItem
	jr	NC,ShopBuyItemMoveHook.done
	ld	BC,WA
	call	IsListItemStocked
	jr	NC,ShopBuyItemMoveHook.done
	ld	WA,BC
	push	WA
	call	GetItemEntryDesc
	ld	BC,0
	call	PrintInMessageBox
	pop	WA
	call	GetItemPriceBy
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	PrintHexBlanks
ShopBuyItemMoveHook.done:
	ret

c_21B4D1	section	code abs=0x21B4D1

; [code] list accept hook of SetupShopBuyItemList: carry only for a valid row that IsListItemStocked
ShopBuyItemAcceptHook:
	call	GetSelectedListItem
	jr	NC,ShopBuyItemAcceptHook.done
	ld	BC,WA
	call	IsListItemStocked
ShopBuyItemAcceptHook.done:
	ret

c_21B4DE	section	code abs=0x21B4DE

; [code] IsShopItemStocked (DrawShopBuyItemPage: rows without carry show "----------")
IsListItemStocked:
	call	IsShopItemStocked
	ret

c_21B4E3	section	code abs=0x21B4E3

; [code] list hooks: move ShopBuyItemMoveHook, accept ShopBuyItemAcceptHook, wListGroup = A, 10 rows, page DrawShopBuyItemPage, cells 0x2181D8, ListReset; ShopMainMenu Buy > Item; [play] shop_buy_items / shop_buy_acce screens run its page
SetupShopBuyItemList:
	ld	XHL,ShopBuyItemMoveHook
	ld	XDE,ShopBuyItemAcceptHook
	ld	(wListMoveHook),XHL
	ld	(wListAcceptHook),XDE
	ld	(wListGroup),A
	ld	A,0xA
	ld	(wListRows),A
	ld	XHL,DrawShopBuyItemPage
	ld	(wListDrawPage),XHL
	ld	XHL,swp_218331
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2181D8
	ld	(wListCells),XHL
	jp	ListReset

c_21B51E	section	code abs=0x21B51E

; [code] list move hook of SetupShopSellItemList: ClearMessageBox, then for a row with count != 0 the item description and GetItemSellPrice (PrintHexBlanks at 12,2)
ShopSellItemMoveHook:
	call	ClearMessageBox
	call	GetSelectedListItem
	jr	NC,ShopSellItemMoveHook.done
	ld	BC,WA
	call	GetListItemCount
	or	A,A
	jr	Z,ShopSellItemMoveHook.done
	ld	WA,BC
	push	WA
	call	GetItemEntryDesc
	ld	BC,0
	call	PrintInMessageBox
	pop	WA
	call	GetItemSellPrice
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	PrintHexBlanks
ShopSellItemMoveHook.done:
	ret

c_21B551	section	code abs=0x21B551

; [code] list accept hook of SetupShopSellItemList: carry only for a valid row with GetListItemCount != 0
ShopSellItemAcceptHook:
	call	GetSelectedListItem
	jr	NC,ShopSellItemAcceptHook.done
	ld	BC,WA
	call	GetListItemCount
	or	A,A
	jr	Z,ShopSellItemAcceptHook.done
	scf
ShopSellItemAcceptHook.done:
	ret

c_21B563	section	code abs=0x21B563

; [code] list hooks: move ShopSellItemMoveHook, accept ShopSellItemAcceptHook, page DrawItemListPage, cells 0x2181D8, ListReset; ShopMainMenu Sell > Item
SetupShopSellItemList:
	ld	XHL,ShopSellItemMoveHook
	ld	XDE,ShopSellItemAcceptHook
	ld	(wListMoveHook),XHL
	ld	(wListAcceptHook),XDE
	ld	(wListGroup),A
	ld	A,0xA
	ld	(wListRows),A
	ld	XHL,DrawItemListPage
	ld	(wListDrawPage),XHL
	ld	XHL,swp_218331
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2181D8
	ld	(wListCells),XHL
	jp	ListReset
BlankText7:
	db	0x00,0x00,0x00,0xFF	; "   "

c_21B5A2	section	code abs=0x21B5A2

; [code] list page callback of SetupShopBuyPartList (the part counterpart of DrawShopBuyItemPage); [play] shop_buy_arms_* screens
DrawShopBuyPartPage:
	ld	W,(wListEntryKind)
	inc	1,W
	call	GetPartGroupSize
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
	ld	A,(wListEntryKind)
	inc	1,A
	ld	B,A
	ld	A,(wListPage)
	mul	WA,0xA
	inc	1,A
	ld	C,A
	ld	DE,1
	ld	WA,0xA
DrawShopBuyPartPage.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(wListCount)
	jr	C,DrawShopBuyPartPage.skip
	call	ClearListLine
	jp	DrawShopBuyPartPage.skip4
DrawShopBuyPartPage.skip:
	ld	WA,BC
	call	IsListEntryStocked
	jr	C,DrawShopBuyPartPage.skip2
	ld	XHL,DashText3
	ld	B,D
	ld	C,E
	ld	A,3
	call	PrintStringAt
	jp	DrawShopBuyPartPage.skip4
DrawShopBuyPartPage.skip2:
	push	BC
	ld	WA,BC
	call	GetEntryName
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	PrintStringPadded8
	pop	DE
	pop	WA
	call	GetListEntryCount
	or	A,A
	jr	NZ,DrawShopBuyPartPage.skip3
	ld	XHL,BlankText7
	ld	B,8
	ld	C,E
	ld	A,3
	call	PrintStringAt
	jr	DrawShopBuyPartPage.skip4
DrawShopBuyPartPage.skip3:
	and	A,0xF
	push	WA
	ld	B,8
	ld	C,E
	ld	L,(TimesText2)
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
DrawShopBuyPartPage.skip4:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	dec	1,WA
	or	WA,WA
	jp	NZ,DrawShopBuyPartPage.loop
	ret

c_21B6AE	section	code abs=0x21B6AE

; [code] list move hook of SetupShopBuyPartList: ShowSelectedPartStats (filter = the accept hook), ClearMessageBox, then for a stocked row (IsListEntryStocked) GetEntryDesc and GetEntryPrice (PrintHexBlanks at 12,2)
ShopBuyPartMoveHook:
	ld	XHL,(wListAcceptHook)
	call	ShowSelectedPartStats
	call	ClearMessageBox
	call	GetSelectedListEntry
	jr	NC,ShopBuyPartMoveHook.done
	ld	BC,WA
	call	IsListEntryStocked
	jr	NC,ShopBuyPartMoveHook.done
	ld	WA,BC
	push	WA
	call	GetEntryDesc
	ld	BC,0
	call	PrintInMessageBox
	pop	WA
	call	GetEntryPrice
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	PrintHexBlanks
ShopBuyPartMoveHook.done:
	ret

c_21B6E7	section	code abs=0x21B6E7

; [code] list accept hook of SetupShopBuyPartList: carry only for a valid row that IsListEntryStocked
ShopBuyPartAcceptHook:
	call	GetSelectedListEntry
	jr	NC,ShopBuyPartAcceptHook.done
	ld	BC,WA
	call	IsListEntryStocked
ShopBuyPartAcceptHook.done:
	ret

c_21B6F4	section	code abs=0x21B6F4

; [code] IsShopEntryStocked (DrawShopBuyPartPage: rows without carry show DashText3); the part counterpart of IsListItemStocked
IsListEntryStocked:
	call	IsShopEntryStocked
	ret

c_21B6F9	section	code abs=0x21B6F9

; [code] list hooks: move ShopBuyPartMoveHook, accept ShopBuyPartAcceptHook, page DrawShopBuyPartPage, cells 0x2183EE, ListReset; ShopMainMenu Buy > Parts (after SetupPartCategoryMenu)
SetupShopBuyPartList:
	ld	XHL,ShopBuyPartMoveHook
	ld	XDE,ShopBuyPartAcceptHook
	ld	(wListMoveHook),XHL
	ld	(wListAcceptHook),XDE
	ld	(wListEntryKind),A
	ld	A,0xA
	ld	(wListRows),A
	ld	XHL,DrawShopBuyPartPage
	ld	(wListDrawPage),XHL
	ld	XHL,swp_218577
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2183EE
	ld	(wListCells),XHL
	jp	ListReset

c_21B734	section	code abs=0x21B734

; [code] list move hook of SetupShopSellPartList: ShowSelectedPartStats (filter = the accept hook), ClearMessageBox, then for a row with count != 0 GetEntryDesc and GetEntrySellPrice (PrintHexBlanks at 12,2)
ShopSellPartMoveHook:
	ld	XHL,(wListAcceptHook)
	call	ShowSelectedPartStats
	call	ClearMessageBox
	call	GetSelectedListEntry
	jr	NC,ShopSellPartMoveHook.done
	ld	BC,WA
	call	GetListEntryCount
	or	A,A
	jr	Z,ShopSellPartMoveHook.done
	ld	WA,BC
	push	WA
	call	GetEntryDesc
	ld	BC,0
	call	PrintInMessageBox
	pop	WA
	call	GetEntrySellPrice
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	PrintHexBlanks
ShopSellPartMoveHook.done:
	ret

c_21B76F	section	code abs=0x21B76F

; [code] list accept hook of SetupShopSellPartList: carry only for a valid row with GetListEntryCount != 0
ShopSellPartAcceptHook:
	call	GetSelectedListEntry
	jr	NC,ShopSellPartAcceptHook.done
	ld	BC,WA
	call	GetListEntryCount
	or	A,A
	jr	Z,ShopSellPartAcceptHook.done
	scf
ShopSellPartAcceptHook.done:
	ret

c_21B781	section	code abs=0x21B781

; [code] list hooks: move ShopSellPartMoveHook, accept ShopSellPartAcceptHook, page DrawPartListPage, cells 0x2183EE, ListReset; ShopMainMenu Sell > Parts
SetupShopSellPartList:
	ld	XHL,ShopSellPartMoveHook
	ld	XDE,ShopSellPartAcceptHook
	ld	(wListMoveHook),XHL
	ld	(wListAcceptHook),XDE
	ld	(wListEntryKind),A
	ld	A,0xA
	ld	(wListRows),A
	ld	XHL,DrawPartListPage
	ld	(wListDrawPage),XHL
	ld	XHL,swp_218577
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2183EE
	ld	(wListCells),XHL
	jp	ListReset
