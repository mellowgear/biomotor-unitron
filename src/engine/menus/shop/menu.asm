; engine/menus/shop/menu.asm: shop: clerk portraits and texts, ShopTalk greeting, buy/sell main menu, prices (packed BCD, sell = half), GP add/subtract, stock tier checks

c_21717C	section	code abs=0x21717C

; [code] XWA = XWA + XBC + carry as 4 packed-BCD bytes (adc + daa per byte through wBcdSumA / wBcdSumB)
AddBCD32:
	ld	(wBcdSumA),XWA
	ld	(wBcdSumB),XBC
	ld	XHL,wBcdSumA
	ld	XDE,wBcdSumB
	ld	B,4
AddBCD32.loop:
	ld	A,(XHL)
	adc	A,(XDE)
	daa	A
	ld	(XHL),A
	inc	1,XHL
	inc	1,XDE
	djnz	B,AddBCD32.loop
	ld	XWA,(wBcdSumA)
	ld	XBC,(wBcdSumB)
	ret

c_2174D9	section	code abs=0x2174D9

; [code] item group W, index A: CheckItemGroupIndex, ItemGroupToIndex, GetItemPrice; carry when valid
GetItemPriceBy:
	call	CheckItemGroupIndex
	ret	NC
	call	ItemGroupToIndex
	call	GetItemPrice
	scf
	ret

c_2174E9	section	code abs=0x2174E9

; [code] W < 6: part record +0x14 (GetPartStatsBy), else GetItemPriceBy(W - 5); carry when valid
GetEntryPrice:
	cp	W,6
	jr	NC,GetEntryPrice.skip
	call	GetPartStatsBy
	ret	NC
	ld	XWA,(XHL+0x14)
	scf
	ret
GetEntryPrice.skip:
	sub	W,5
	jp	GetItemPriceBy

c_2174FF	section	code abs=0x2174FF

; [code] GetItemPriceBy, then HalveBCD
GetItemSellPrice:
	call	GetItemPriceBy
	ret	NC
	call	HalveBCD
	scf
	ret

c_21750B	section	code abs=0x21750B

; [code] GetEntryPrice, then HalveBCD
GetEntrySellPrice:
	call	GetEntryPrice
	ret	NC
	call	HalveBCD
	scf
	ret

c_217517	section	code abs=0x217517

; [code] XWA = packed-BCD XWA * 5 (four AddBCD32 of itself) shifted one digit right (srl 4): half the price
HalveBCD:
	ld	XBC,XWA
	call	AddBCD32
	call	AddBCD32
	call	AddBCD32
	call	AddBCD32
	srl	4,XWA
	ret

c_217558	section	code abs=0x217558

; [code] GetShopItemTierBy, then carry only when tier != 0 and tier > ShopTierByRank[wArenaRankCopy] (shop_item_stock.asm); ShopBuyPartMoveHook draws a shop line only with carry
IsShopItemStocked:
	call	GetShopItemTierBy
IsShopItemStocked.done:
	ret	NC
	or	A,A
	ret	Z
	ld	W,(wArenaRankCopy)
	ld	XHL,ShopTierByRank
	cp	(XHL+W),A
	ret
ShopTierByRank:
	db	0x04,0x03,0x03,0x02,0x02,0x01,0x01,0x00,0x00,0x00

c_21757B	section	code abs=0x21757B

; [code] GetShopTier, then the same tier check as IsShopItemStocked (items and parts)
IsShopEntryStocked:
	call	GetShopTier
	jp	IsShopItemStocked.done

c_21972D	section	code abs=0x21972D

; [code] wGP += XWA already in packed BCD (unlike AddGP, which converts a binary amount first) (adc + daa over 4 bytes), capped at 0x999999
AddGPBCD:
	push	XBC
	rcf
AddGPBCD.carryIn:
	ld	(wGPBcdAddend),XWA
	push	XHL
	push	XDE
	ld	XHL,wGPBcdAddend
	ld	XDE,wGP
	ld	B,4
AddGPBCD.loop:
	ld	A,(XHL)
	adc	A,(XDE)
	daa	A
	ld	(XDE),A
	inc	1,XHL
	inc	1,XDE
	djnz	B,AddGPBCD.loop
	ld	XHL,(wGP)
	cp	XHL,0x999999
	jr	C,AddGPBCD.skip
	ld	XHL,0x999999
	ld	(wGP),XHL
AddGPBCD.skip:
	pop	XDE
	pop	XHL
	pop	XBC
	ret

c_219769	section	code abs=0x219769

; [code] wGP -= XWA in packed BCD: XWA = 0x99999999 - XWA with carry set, then into AddGPBCD after its rcf (the ten's complement add); ShopMainMenu after a purchase; [play] runs when buying in a shop
SubtractGPBCD:
	push	XBC
	ld	XBC,0x99999999
	sub	XBC,XWA
	ld	XWA,XBC
	scf
	jr	AddGPBCD.carryIn

c_21AC2E	section	code abs=0x21AC2E

; [code] A = mode: RunWorksScreen with the entry pointer wWorksScreenEntry = ShopTalk instead of WorksScreenEntry (jumps into RunWorksScreen after its first instruction); caller StreetGoShop (A = 1)
RunShopScreen:
	ld	XHL,ShopTalk
	jp	RunWorksScreen.withEntry

c_21AC37	section	code abs=0x21AC37

; [code] wShopClerk = Random30000 & 0x80 (one of the two clerk portraits at random); ShopTalk sets it per greeting line instead
; [play] 0 = Galb (old man, portrait 0x18, "Hello! Looking for something?"), 0x80 = Lana (portrait 0x19, "Hi there!
; How can I help?"); it changes between visits, as the seeds only move when Random is called
PickShopClerk:
	call	Random30000
	and	A,0x80
	ld	(wShopClerk),A
	ret

c_21AC43	section	code abs=0x21AC43

; [code] DrawPortraitScr1 portrait 0x25 (37, the Shop picture in PlacePortraits)
DrawShopPicture:
	ld	A,0x25
	call	DrawPortraitScr1
	ret

c_21AC4A	section	code abs=0x21AC4A

; [code] ClearScr2Picture, then portrait GetShopClerkPortrait at column 0, row 0x20 (SCR2) through DrawPortraitTiles126
DrawShopClerkPortrait:
	push	WA
	call	ClearScr2Picture
	pop	WA
	call	GetShopClerkPortrait
	ld	BC,0
	ld	DE,0x20
	call	DrawPortraitTiles126
	ret

c_21AC5E	section	code abs=0x21AC5E

; [code] A = 0x18 when wShopClerk = 0, else 0x19
GetShopClerkPortrait:
	ld	A,(wShopClerk)
	or	A,A
	ld	A,0x18
	ret	Z
	ld	A,0x19
	ret

c_21AC6B	section	code abs=0x21AC6B

; [code] ClearPicture, DrawShopPicture (portrait 0x25 through DrawPortraitScr1), DrawShopClerkPortrait
ShopRedrawPictures:
	call	ClearPicture
	call	DrawShopPicture
	call	DrawShopClerkPortrait
	ret

c_21AC78	section	code abs=0x21AC78

; [code] PlayMusic 3 (CallPlayMusic); caller ShopTalk
PlayMusic3:
	ld	XWA,3
	jp	CallPlayMusic

c_21AC7E	section	code abs=0x21AC7E

; [code] XHL kept when wShopClerk = 0, else XHL = XDE
PickShopClerkText:
	ld	A,(wShopClerk)
	or	A,A
	ret	Z
	ld	XHL,XDE
	ret

c_21AC89	section	code abs=0x21AC89

; [code] PickShopClerkText, ShowMenuText (the shop's counterpart of ShowPartnerGenderText)
ShowShopClerkText:
	call	PickShopClerkText
	jp	ShowMenuText

c_21AC91	section	code abs=0x21AC91

; [code+play] Galb/Lana's greeting by story stage (OhItsYou / HaveYouHeardWhat / HowCanIHelp ...)
ShopTalk:
	call	PickShopClerk
	call	PlayMusic3
	call	DrawGP
	ld	WA,0x23
	call	CallSoundCommand
	call	DrawShopPicture
	ld	A,EVENT_STAGE_WON_RANK_D
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip
	call	DrawShopPicture
	ldb	(wShopClerk),0
	call	DrawShopClerkPortrait
	ld	XHL,OhItsYouYouText
	call	ShowMenuText
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip:
	ld	A,EVENT_STAGE_WON_RANK_B
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip2
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip2
	call	DrawShopPicture
	ldb	(wShopClerk),1
	call	DrawShopClerkPortrait
	ld	XHL,HiThereYoureInText
	call	ShowMenuText
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip2:
	ld	A,EVENT_STAGE_WON_RANK_S
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip3
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip3
	call	DrawShopPicture
	ldb	(wShopClerk),1
	call	DrawShopClerkPortrait
	ld	XHL,HiTherePlayerIText
	call	ShowMenuText
	call	Wait30Frames
	ldb	(wShopClerk),0
	call	DrawShopClerkPortrait
	ld	XHL,BeCarefulPlayerYourText
	call	ShowMenuText
	call	Wait30Frames
	ldb	(wShopClerk),1
	call	DrawShopClerkPortrait
	ld	XHL,DontWorryPlayerYouText
	call	ShowMenuText
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip3:
	ld	A,EVENT_STAGE_LILY
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip4
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip4
	call	DrawShopPicture
	ldb	(wShopClerk),0
	call	DrawShopClerkPortrait
	ld	XHL,HaveYouHeardWhatText
	call	ShowMenuText
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip4:
	ld	A,EVENT_STAGE_ENDING
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip5
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip5
	call	DrawShopPicture
	ldb	(wShopClerk),1
	call	DrawShopClerkPortrait
	ld	XHL,PlayerIsThatYouText
	call	ShowMenuText
	call	Wait30Frames
	ldb	(wShopClerk),0
	call	DrawShopClerkPortrait
	ld	XHL,LetHimBeNoText
	call	ShowMenuText
	call	Wait30Frames
	ldb	(wShopClerk),1
	call	DrawShopClerkPortrait
	ld	XHL,WhyDontYouDoText
	call	ShowMenuText
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip5:
	call	DrawShopClerkPortrait
ShopTalk.skip6:
	ld	XHL,HelloLookingForSomethingText
	ld	XDE,HiThereHowCanText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu

c_21AE1E	section	code abs=0x21AE1E

; [code] Here's what we've got, buy/sell, GP checks
ShopMenu:
	call	TaskYield
	call	ShopRedrawPictures

c_21AE26	section	code abs=0x21AE26

; [code] the shop's top menu: ClearMessageBox, SetupBuySellMenu (Buy 0 / Sell 1 / Exit), DrawMenuBox, RunMenuInput; Buy -> SetupItemPartsMenu + HeresWhatWeveGotText / WhichListAreYouText, then SetupPartCategoryMenu + ChooseAnItemText ...; ShopMenu (TaskYield + ShopRedrawPictures) falls into it
ShopMainMenu:
	call	ClearMessageBox
	call	SetupBuySellMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,ShopMainMenu.skip13
	cp	A,0
	jp	Z,ShopMainMenu.loop
	cp	A,1
	jp	Z,ShopMainMenu.loop6
	jp	ShopMainMenu.skip13
ShopMainMenu.loop:
	call	HideListCursor
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,HeresWhatWeveGotText
	ld	XDE,WhichListAreYouText
	call	ShowShopClerkText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,ShopMainMenu.skip7
	cp	A,0
	jp	Z,ShopMainMenu.skip
	cp	A,1
	jp	Z,ShopMainMenu.skip4
	jp	ShopMainMenu.skip7
ShopMainMenu.loop2:
	call	HideListCursor
	call	TaskYield
	call	ShopRedrawPictures
ShopMainMenu.skip:
	call	SetupPartCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,ShopMainMenu.loop
	ld	(wShopCategory),A
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wShopCategory)
	call	SetupShopBuyPartList
ShopMainMenu.loop3:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,ShopMainMenu.loop2
	ld	W,(wShopCategory)
	inc	1,W
	inc	1,A
	ld	(wShopEntry),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	PickShopClerkText
	call	AskYesNo
	or	A,A
	jr	NZ,ShopMainMenu.loop3
	ld	WA,(wShopEntry)
	call	GetEntryCountBy
	and	A,0x7F
	cp	A,9
	jr	NC,ShopMainMenu.skip2
	ld	WA,(wShopEntry)
	call	GetEntryPrice
	cp	(wGP),XWA
	jr	C,ShopMainMenu.skip3
	call	SubtractGPBCD
	call	DrawGP
	ld	WA,(wShopEntry)
	call	AddItemByCategory
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThanksText2
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop3
ShopMainMenu.skip2:
	ld	XHL,SorryYouDontHaveText
	ld	XDE,WhoopsYouCantCarryText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop3
ShopMainMenu.skip3:
	ld	WA,0x8F
	call	CallSoundCommand
	ld	XHL,LooksLikeYoureShortText
	ld	XDE,UmmIThinkItsText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop3
ShopMainMenu.loop4:
	call	HideListCursor
	call	TaskYield
	call	ShopRedrawPictures
ShopMainMenu.skip4:
	call	SetupItemCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,ShopMainMenu.loop
	ld	(wShopCategory),A
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wShopCategory)
	call	SetupShopBuyItemList
ShopMainMenu.loop5:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,ShopMainMenu.loop4
	ld	W,(wShopCategory)
	inc	1,W
	inc	1,A
	ld	(wShopEntry),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	PickShopClerkText
	call	AskYesNo
	or	A,A
	jr	NZ,ShopMainMenu.loop5
	ld	WA,(wShopEntry)
	call	GetItemCountBy
	and	A,0x7F
	cp	A,9
	jr	NC,ShopMainMenu.skip5
	ld	WA,(wShopEntry)
	call	GetItemPriceBy
	cp	(wGP),XWA
	jr	C,ShopMainMenu.skip6
	call	SubtractGPBCD
	call	DrawGP
	ld	WA,(wShopEntry)
	call	AddGroupItem
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThanksText2
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop5
ShopMainMenu.skip5:
	ld	XHL,SorryYouDontHaveText
	ld	XDE,WhoopsYouCantCarryText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop5
ShopMainMenu.skip6:
	ld	WA,0x8F
	call	CallSoundCommand
	ld	XHL,LooksLikeYoureShortText
	ld	XDE,UmmIThinkItsText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop5
ShopMainMenu.skip7:
	call	HideListCursor
	jp	ShopMainMenu
ShopMainMenu.loop6:
	call	HideListCursor
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhatDoYouWantText7
	ld	XDE,WhatDoYouHaveText
	call	ShowShopClerkText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,ShopMainMenu.skip12
	cp	A,0
	jp	Z,ShopMainMenu.skip8
	cp	A,1
	jp	Z,ShopMainMenu.skip10
	jp	ShopMainMenu.skip12
ShopMainMenu.loop7:
	call	HideListCursor
	call	TaskYield
	call	ShopRedrawPictures
ShopMainMenu.skip8:
	call	SetupPartCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,ShopMainMenu.loop6
	ld	(wShopCategory),A
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wShopCategory)
	call	SetupShopSellPartList
ShopMainMenu.loop8:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(wListChoice)
	or	WA,WA
	jr	MI,ShopMainMenu.loop7
	ld	W,(wShopCategory)
	inc	1,W
	inc	1,A
	ld	(wShopEntry),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	PickShopClerkText
	call	AskYesNo
	or	A,A
	jr	NZ,ShopMainMenu.loop8
	ld	WA,(wShopEntry)
	call	GetEntryCountBy
	and	A,0x7F
	jr	Z,ShopMainMenu.skip9
	ld	WA,(wShopEntry)
	call	GetEntrySellPrice
	call	AddGPBCD
	call	DrawGP
	ld	WA,(wShopEntry)
	call	RemoveItemByCategory
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThankYouText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop8
ShopMainMenu.skip9:
	ld	XHL,ItDoesntLookLikeText
	ld	XDE,YouDontHaveThatText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop8
ShopMainMenu.loop9:
	call	HideListCursor
	call	TaskYield
	call	ShopRedrawPictures
ShopMainMenu.skip10:
	call	SetupItemCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,ShopMainMenu.loop6
	ld	(wShopCategory),A
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wShopCategory)
	call	SetupShopSellItemList
ShopMainMenu.loop10:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	ShowShopClerkText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,ShopMainMenu.loop9
	ld	W,(wShopCategory)
	inc	1,W
	inc	1,A
	ld	(wShopEntry),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	PickShopClerkText
	call	AskYesNo
	or	A,A
	jr	NZ,ShopMainMenu.loop10
	ld	WA,(wShopEntry)
	call	GetItemCountBy
	and	A,0x7F
	jr	Z,ShopMainMenu.skip11
	ld	WA,(wShopEntry)
	call	GetItemSellPrice
	call	AddGPBCD
	call	DrawGP
	ld	WA,(wShopEntry)
	call	RemoveGroupItem
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThankYouText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop10
ShopMainMenu.skip11:
	ld	XHL,ItDoesntLookLikeText
	ld	XDE,YouDontHaveThatText
	call	ShowShopClerkText
	call	Wait30Frames
	jp	ShopMainMenu.loop10
ShopMainMenu.skip12:
	call	HideListCursor
	jp	ShopMainMenu
ShopMainMenu.skip13:
	ld	XHL,ThanksText
	ld	XDE,ThanksText2
	call	ShowShopClerkText
	call	Wait30Frames
	jp	EndMenuTask
BuyText:
	text "Buy"
	done
SellText:
	text "Sell"
	done
ExitText8:
	db	0x25,0x18,0x09,0x14,0xFF	; "Exit"
MenuLines_21B34E:
	menu_item	0,0,BuyText
	menu_item	0,1,SellText
	menu_item	0,8,ExitText8
MenuCursor_21B360:
	db	0,0, 0,1, 0,8	; column, row
MenuResults_21B366:
	db	0x00,0x01,0xFF

c_21B369	section	code abs=0x21B369

; [code] menu box table: "Buy" (0), "Sell" (1), "Exit" (0xFF) at MenuLines_21B34E; caller ShopMainMenu
SetupBuySellMenu:
	ld	A,3
	ld	(wMenuCount),A
	ld	A,3
	ld	(wMenuTextCount),A
	ld	XHL,MenuLines_21B34E
	ld	(wMenuTexts),XHL
	ld	XHL,MenuCursor_21B360
	ld	(wMenuCells),XHL
	ld	XHL,MenuResults_21B366
	ld	(wMenuValues),XHL
	jp	MenuReset
