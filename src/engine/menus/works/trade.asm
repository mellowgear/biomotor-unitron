; engine/menus/works/trade.asm: Works > Trade: trade menu, trade lists, link cable task

c_206371	section	code abs=0x206371

; [code] set bit 7 of task XHL +7: the EndTask mark for another task (RunTasks unlinks it); StopLinkTask uses it on wLinkTask
EndTaskAtXHL:
	set	7,(XHL+7)
	ret

c_206375	section	code abs=0x206375

; [code] set bit 6 of task XHL +7: the EndChildTasks mark for another task; no caller found
EndChildTasksAtXHL:
	set	6,(XHL+7)
	ret

c_21A005	section	code abs=0x21A005

; [code] Works menu value 3 "Trade": YouWantToTradeText, StartLinkTask, ... TradeSwapItems + TheTradeWasSuccessfulText; [play] its first instruction ran on works_trade_checking (executed-address log)
WorksTradeMenu:
	ld	XHL,YouWantToTradeText
	ld	XDE,YouWantToTradeText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	StartLinkTask
	call	ClearLinkState
	call	ResetLinkOffer
	ld	XHL,CheckingText
	ld	XDE,CheckingText
	call	ShowPartnerGenderText
	call	Wait30Frames
	ldw	(wTradeWaitTimer),0
WorksTradeMenu.loop:
	cpw	(wTradeWaitTimer),0x258
	jr	NC,WorksTradeMenu.skip
	call	CheckLinkStatus
	jr	C,WorksTradeMenu.skip
	call	TaskYield
	call	TradeWaitBlink
	jr	NC,WorksTradeMenu.loop
WorksTradeMenu.skip:
	call	CheckLinkStatus
	jp	NC,WorksTradeMenu.skip10
	ld	XHL,LooksLikeTheresNoText
	ld	XDE,LooksLikeTheresNoText
	call	ShowPartnerGenderText
	call	Wait30Frames
	ld	XHL,ReadyToTradeText
	ld	XDE,ReadyToTradeText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jp	NZ,WorksTradeMenu.skip9
WorksTradeMenu.loop2:
	call	ClearLinkStatus
	call	ClearLinkCallback
	call	ResetLinkOffer
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhatItemDoYouText
	ld	XDE,WhatItemDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksTradeMenu.skip9
	cp	A,0
	jp	Z,WorksTradeMenu.loop3
	cp	A,1
	jp	Z,WorksTradeMenu.loop4
	jp	WorksTradeMenu.skip9
WorksTradeMenu.loop3:
	call	SetupPartCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichPartDoYouText
	ld	XDE,WhichPartDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksTradeMenu.loop2
	inc	1,A
	ld	(wTradeOffer+1),A
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wMenuChoice)
	call	SetupTradePartList
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhichDoYouChooseText
	ld	XDE,WhichDoYouChooseText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	DrawWorksPortraits
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,WorksTradeMenu.loop3
	jp	WorksTradeMenu.skip2
WorksTradeMenu.loop4:
	call	SetupItemCategoryMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichItemDoYouText2
	ld	XDE,WhichItemDoYouText2
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	HideMenuCursor
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksTradeMenu.loop2
	add	A,6
	ld	(wTradeOffer+1),A
	call	OpenListBox
	call	ClearTextBox2Home
	ld	A,(wMenuChoice)
	call	SetupTradeItemList
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhichDoYouChooseText
	ld	XDE,WhichDoYouChooseText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	DrawWorksPortraits
	ld	WA,(wListChoice)
	or	WA,WA
	jp	MI,WorksTradeMenu.loop4
WorksTradeMenu.skip2:
	inc	1,A
	ld	(wTradeOffer),A
	ld	WA,(wTradeOffer)
	call	SetLinkOffer
	call	StartTradeStatus
WorksTradeMenu.loop5:
	call	CheckTradeOffers
	jr	C,WorksTradeMenu.skip3
	call	TaskYield
	call	TradeWaitBlink
	jr	WorksTradeMenu.loop5
WorksTradeMenu.skip3:
	call	DrawTradeStatus
	call	CheckTradeOffers
	jp	MI,WorksTradeMenu.skip10
	call	GetTradeConfirmText
	call	PickPartnerGenderText
	call	AskYesNo
	call	SetTradeAnswer
WorksTradeMenu.loop6:
	call	CheckTradeAnswers
	jr	C,WorksTradeMenu.skip4
	call	TaskYield
	call	TradeWaitBlink
	jr	WorksTradeMenu.loop6
WorksTradeMenu.skip4:
	call	DrawTradeStatus
	call	CheckTradeAnswers
	jp	MI,WorksTradeMenu.skip6
	jp	NZ,WorksTradeMenu.skip5
	call	TradeSwapItems
	ld	XHL,TheTradeWasSuccessfulText
	ld	XDE,TradingCompleteText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	WorksTradeMenu.skip7
WorksTradeMenu.skip5:
	ld	XHL,LooksLikeItsNotText
	ld	XDE,LooksLikeItsNotText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	WorksTradeMenu.skip7
WorksTradeMenu.skip6:
	ld	XHL,TransmissionErrorTryAgainText
	ld	XDE,TransmissionErrorTryAgainText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	WorksTradeMenu.skip11
WorksTradeMenu.skip7:
	ld	XHL,DoYouWantToText4
	ld	XDE,DoYouWantToText4
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jp	NZ,WorksTradeMenu.skip9
	call	ResetLinkOffer
WorksTradeMenu.loop7:
	call	CheckTradeCleared
	jr	C,WorksTradeMenu.skip8
	call	TaskYield
	call	TradeWaitBlink
	jr	NC,WorksTradeMenu.loop7
WorksTradeMenu.skip8:
	call	CheckTradeCleared
	jp	MI,WorksTradeMenu.skip10
	jp	WorksTradeMenu.loop2
WorksTradeMenu.skip9:
	ld	XHL,ReadyToQuitIllText
	ld	XDE,ReadyToQuitIllText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	WorksTradeMenu.skip11
WorksTradeMenu.skip10:
	ld	XHL,LooksLikeTheresNoText2
	ld	XDE,LooksLikeTheresNoText2
	call	ShowPartnerGenderText
	call	Wait30Frames
WorksTradeMenu.skip11:
	call	StopLinkTask
	jp	WorksMainMenu

c_21A32D	section	code abs=0x21A32D

; [code] SetLinkCallback 0 (LinkCommTask stops calling DrawTradeStatus)
ClearLinkCallback:
	xor	XHL,XHL
	call	SetLinkCallback
	ret

c_21A334	section	code abs=0x21A334

; [code] SetLinkCallback DrawTradeStatus, ClearTextBoxHome 2, prints "Self" (row 0) and "Other" (row 3) in box 2, wTradeWaitTimer = 0, the three wTradeShown* caches = 0xFFFF / 0xFF (forces a redraw), then falls into DrawTradeStatus
StartTradeStatus:
	ld	XHL,DrawTradeStatus
	call	SetLinkCallback
	ld	A,2
	call	ClearTextBoxHome
	ld	XHL,SelfText
	ld	BC,0
	ld	WA,2
	call	PrintStringAt
	ld	XHL,OtherText
	ld	BC,3
	ld	WA,2
	call	PrintStringAt
	ldw	(wTradeWaitTimer),0
	ldw	(wTradeShownSelf),0xFFFF
	ldw	(wTradeShownOther),0xFFFF
	ldb	(wTradeShownFlags),0xFF

c_21A374	section	code abs=0x21A374

; [code] link callback (wLinkCallback, every LinkCommTask loop): in box 2, when changed, row 1 = GetEntryName of received packet word +4 (wTradeShownSelf), row 4 = name of word +2 (wTradeShownOther), and at column 4 of rows 0 / 3 a mark from packet byte +1: bit 1 / bit 0 clear -> "--", else bit 3 / bit 2 clear -> "OK", set -> "NO" (wTradeShownFlags)
DrawTradeStatus:
	call	GetLinkRecvPacket
	ld	WA,(XHL+4)
	cp	(wTradeShownSelf),WA
	jr	Z,DrawTradeStatus.skip
	ld	(wTradeShownSelf),WA
	ld	XHL,BlankText5
	ld	BC,1
	ld	WA,2
	call	PrintStringAt
	ld	WA,(wTradeShownSelf)
	call	GetEntryName
	ld	BC,1
	ld	WA,2
	call	PrintStringAt
DrawTradeStatus.skip:
	call	GetLinkRecvPacket
	ld	WA,(XHL+2)
	cp	(wTradeShownOther),WA
	jr	Z,DrawTradeStatus.skip2
	ld	(wTradeShownOther),WA
	ld	XHL,BlankText5
	ld	BC,4
	ld	WA,2
	call	PrintStringAt
	ld	WA,(wTradeShownOther)
	call	GetEntryName
	ld	BC,4
	ld	WA,2
	call	PrintStringAt
DrawTradeStatus.skip2:
	call	GetLinkRecvPacket
	ld	A,(XHL+1)
	cp	(wTradeShownFlags),A
	jr	Z,DrawTradeStatus.done
	ld	(wTradeShownFlags),A
	and	A,8
	ld	XHL,OKText
	ld	XDE,NOText
	call	PickXDEIfNZ
	ld	A,(wTradeShownFlags)
	and	A,2
	ld	XDE,XHL
	ld	XHL,DashText15
	call	PickXDEIfNZ
	ld	BC,0x400
	ld	WA,2
	call	PrintStringAt
	ld	A,(wTradeShownFlags)
	and	A,4
	ld	XHL,OKText
	ld	XDE,NOText
	call	PickXDEIfNZ
	ld	A,(wTradeShownFlags)
	and	A,1
	ld	XDE,XHL
	ld	XHL,DashText15
	call	PickXDEIfNZ
	ld	BC,0x403
	ld	WA,2
	call	PrintStringAt
DrawTradeStatus.done:
	ret

c_21A43E	section	code abs=0x21A43E

; [code] Z: XHL kept; NZ: XHL = XDE
PickXDEIfNZ:
	ret	Z
	ld	XHL,XDE
	ret

c_21A443	section	code abs=0x21A443

; [code] each call wTradeWaitTimer += 1; every 8th call redraws the message box: WaitAMinuteText, or 8 spaces when bit 3 of the timer is set (a blink); C when B is pressed (only the cable-check wait and the CheckTradeCleared wait in WorksTradeMenu stop on it; the offer and answer waits ignore it)
TradeWaitBlink:
	ld	WA,(wTradeWaitTimer)
	and	WA,7
	jr	NZ,TradeWaitBlink.skip
	call	ClearMessageBox
	ld	XHL,WaitAMinuteText
	ld	XDE,WaitAMinuteText
	call	PickPartnerGenderText
	ld	WA,(wTradeWaitTimer)
	and	WA,8
	ld	XDE,BlankText6
	call	PickXDEIfNZ
	ld	BC,0
	call	PrintInMessageBox
TradeWaitBlink.skip:
	incw	1,(wTradeWaitTimer)
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	NZ,TradeWaitBlink.skip2
	rcf
	jr	TradeWaitBlink.done
TradeWaitBlink.skip2:
	scf
TradeWaitBlink.done:
	ret

c_21A488	section	code abs=0x21A488

; [code] WA = word, XHL = bytes: ClearTextBoxHome 1, WA as 4 hex digits at 0,0, then 14 bytes as 2-digit hex (7 per row, columns 0-0xC, rows 1-2); no callers
PrintHexDumpBox1:
	push	WA
	push	XHL
	ld	A,1
	call	ClearTextBoxHome
	pop	XHL
	pop	WA
	ld	DE,WA
	ld	WA,0x401
	ld	BC,0
	push	XHL
	call	PrintHexZeros
	pop	XHL
	ld	C,1
PrintHexDumpBox1.loop:
	ld	B,0
PrintHexDumpBox1.loop2:
	ld	E,(XHL+)
	push	BC
	push	XHL
	ld	WA,0x201
	call	PrintHexZeros
	pop	XHL
	pop	BC
	inc	2,B
	cp	B,0xE
	jr	C,PrintHexDumpBox1.loop2
	inc	1,C
	cp	C,3
	jr	C,PrintHexDumpBox1.loop
	ret

c_21A4BF	section	code abs=0x21A4BF

; [code] WA as 4 hex digits (PrintHexZeros, WA = 0x402) at column 2, row 8 of text box 2; no callers
PrintHexWordBox2:
	ld	DE,WA
	ld	WA,0x402
	ld	BC,0x208
	call	PrintHexZeros
	ret

c_21A4CC	section	code abs=0x21A4CC

; [code] A = AskYesNo answer: 0 -> 1, else 5 (TradeAnswerBits), SetLinkAnswerBits
SetTradeAnswer:
	or	A,A
	call	TradeAnswerBits
	call	SetLinkAnswerBits
	ret

c_21A4D7	section	code abs=0x21A4D7

; [code] Z -> A = 1, NZ -> A = 5
TradeAnswerBits:
	ld	A,1
	ret	Z
	ld	A,5
	ret

c_21A4DE	section	code abs=0x21A4DE

; [code] C and MI (A = 0xFF) unless wLinkStatus word = 1 (status 1, no error bits): link error; else NC, Z
CheckLinkError:
	call	CheckLinkStatus
	cp	WA,1
	ret	Z
	ld	A,0xFF
	or	A,A
	scf
	ret

c_21A4EC	section	code abs=0x21A4EC

; [code] after the yes/no: C + MI on a link error; NC while received packet byte +1 bits 0-1 are not both set; then C, Z when its bits 2-3 are clear (WorksTradeMenu then TradeSwapItems), NZ -> LooksLikeItsNotText
CheckTradeAnswers:
	call	CheckLinkError
	ret	C
	call	GetLinkRecvPacket
	ld	WA,(XHL+1)
	and	A,3
	cp	A,3
	ccf
	ret	NC
	call	GetLinkRecvPacket
	ld	WA,(XHL+1)
	and	A,0xC
	scf
	ret

c_21A50D	section	code abs=0x21A50D

; [code] after picking the offer: C + MI on a link error; C when received packet byte +1 bits 0-3 are clear and its words +4 and +2 are both non-zero; else NC (keep waiting)
CheckTradeOffers:
	call	CheckLinkError
	ret	C
	call	GetLinkRecvPacket
	ld	WA,(XHL+1)
	and	A,0xF
	ret	NZ
	call	GetLinkRecvPacket
	ld	WA,(XHL+4)
	or	WA,WA
	ret	Z
	ld	WA,(XHL+2)
	or	WA,WA
	ret	Z
	scf
	ret

c_21A533	section	code abs=0x21A533

; [code] before a new round: C + MI on a link error; C when received packet byte +1 bits 0-3 and its words +4 and +2 are all zero; else NC
CheckTradeCleared:
	call	CheckLinkError
	ret	C
	call	GetLinkRecvPacket
	ld	WA,(XHL+1)
	and	A,0xF
	ret	NZ
	call	GetLinkRecvPacket
	ld	WA,(XHL+4)
	or	WA,WA
	ret	NZ
	ld	WA,(XHL+2)
	or	WA,WA
	ret	NZ
	scf
	ret

c_21A559	section	code abs=0x21A559

; [code] RemoveItemByCategory (word +4 of the GetLinkRecvPacket record), AddItemByCategory (word +2); caller WorksTradeMenu right before TheTradeWasSuccessfulText (was misnamed WorksSetupMenu)
TradeSwapItems:
	call	GetLinkRecvPacket
	ld	WA,(XHL+4)
	call	RemoveItemByCategory
	call	GetLinkRecvPacket
	ld	WA,(XHL+2)
	call	AddItemByCategory
	ret

c_21B7BC	section	code abs=0x21B7BC

; [code] list move hook of SetupTradeItemList: ClearMessageBox, then for a row with GetListItemCount != 0 GetItemEntryDesc into the message box
TradeItemMoveHook:
	call	ClearMessageBox
	call	GetSelectedListItem
	jr	NC,TradeItemMoveHook.done
	ld	BC,WA
	call	GetListItemCount
	or	A,A
	jr	Z,TradeItemMoveHook.done
	ld	WA,BC
	call	GetItemEntryDesc
	ld	BC,0
	call	PrintInMessageBox
TradeItemMoveHook.done:
	ret

c_21B7DD	section	code abs=0x21B7DD

; [code] list accept hook of SetupTradeItemList: carry only for a valid row with GetListItemCount & 0xF != 0
TradeItemAcceptHook:
	call	GetSelectedListItem
	jr	NC,TradeItemAcceptHook.done
	ld	BC,WA
	call	GetListItemCount
	and	A,0xF
	or	A,A
	jr	Z,TradeItemAcceptHook.done
	scf
TradeItemAcceptHook.done:
	ret

c_21B7F2	section	code abs=0x21B7F2

; [code] list hooks: move TradeItemMoveHook, accept TradeItemAcceptHook, page DrawItemListPage, ListReset; callers WorksTradeMenu and WorksScreenEntry (mode 6)
SetupTradeItemList:
	ld	XHL,TradeItemMoveHook
	ld	XDE,TradeItemAcceptHook
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

c_21B82D	section	code abs=0x21B82D

; [code] list move hook of SetupTradePartList: ShowSelectedPartStats (filter HasSelectedEntryCount), ClearMessageBox, then GetEntryDesc for a row with a count
TradePartMoveHook:
	ld	XHL,HasSelectedEntryCount
	call	ShowSelectedPartStats
	call	ClearMessageBox
	call	GetSelectedListEntry
	jr	NC,TradePartMoveHook.done
	ld	BC,WA
	call	GetListEntryCount
	or	A,A
	jr	Z,TradePartMoveHook.done
	ld	WA,BC
	call	GetEntryDesc
	ld	BC,0
	call	PrintInMessageBox
TradePartMoveHook.done:
	ret

c_21B857	section	code abs=0x21B857

; [code] list accept hook of SetupTradePartList: carry only for a valid row with GetListEntryCount & 0xF != 0
TradePartAcceptHook:
	call	GetSelectedListEntry
	jr	NC,TradePartAcceptHook.done
	ld	BC,WA
	call	GetListEntryCount
	and	A,0xF
	or	A,A
	jr	Z,TradePartAcceptHook.done
	scf
TradePartAcceptHook.done:
	ret

c_21B86C	section	code abs=0x21B86C

; [code] list hooks: move TradePartMoveHook, accept TradePartAcceptHook, page DrawPartListPage, ListReset; caller WorksTradeMenu
SetupTradePartList:
	ld	XHL,TradePartMoveHook
	ld	XDE,TradePartAcceptHook
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

c_21D1C8	section	code abs=0x21D1C8

; [code] pop the return address into TASK_FUNC and ret (the same as TaskYield); LinkCommTask calls it
LinkTaskYield:
	pop	XWA
	ld	(XIZ+TASK_FUNC),XWA
	ret
; [code] 0x5455 (bytes "UT" in ASCII): the first word of every link packet
LinkSyncWord:
	dw	0x5455

c_21D1CF	section	code abs=0x21D1CF

; [code] TRUN bit 7, child LinkCommTask looping on BIOS COM calls 0x10-0x1A (cable trade)
StartLinkTask:
	orb	(TRUN),0x80
	xor	XHL,XHL
	ld	(wLinkCallback),XHL
	ld	XHL,LinkCommTask
	call	StartChildTask
	ld	(wLinkTask),XHL
	ret

c_21D1E7	section	code abs=0x21D1E7

; [code] marks wLinkTask ended (EndTaskAtXHL), wLinkCallback = 0; the exit of WorksTradeMenu
StopLinkTask:
	ld	XHL,(wLinkTask)
	call	EndTaskAtXHL
	xor	XHL,XHL
	ld	(wLinkCallback),XHL
	ret

c_21D1F6	section	code abs=0x21D1F6

; [code] zeroes 0x6E bytes from wLinkOffer (to 0x6298), wLinkTimeout = 0x1E (the start of LinkCommTask does the same)
ClearLinkState:
	ld	XHL,wLinkOffer
	ld	XDE,wLinkOffer+1
	ld	XBC,0x6D
	ldb	(XHL),0
	ldir	(XDE+),(XHL+)
	ldb	(wLinkTimeout),0x1E
	ret

c_21D210	section	code abs=0x21D210

; [code] wLinkStatus word = 0, C
ClearLinkStatus:
	xor	WA,WA
	ld	(wLinkStatus),WA
	scf
	ret

c_21D218	section	code abs=0x21D218

; [code] WA = wLinkStatus word; C only when the status byte is positive (1 = packet received and checked)
CheckLinkStatus:
	ld	WA,(wLinkStatus)
	or	A,A
	ret	MI
	ret	Z
	scf
	ret

c_21D224	section	code abs=0x21D224

; [code] C when received packet words +2 (wLinkRecvPacket+2) and +4 (wLinkRecvPacket+4) are both non-zero; no caller found
Unused_21D224:
	ld	BC,(wLinkRecvPacket+2)
	or	BC,BC
	ret	Z
	ld	WA,(wLinkRecvPacket+4)
	or	WA,WA
	ret	Z
	scf
	ret

c_21D236	section	code abs=0x21D236

; [code] wLinkOffer = WA (the entry WorksTradeMenu offers: wTradeOffer+1 << 8 | wTradeOffer), C
SetLinkOffer:
	ld	(wLinkOffer),WA
	scf
	ret

c_21D23C	section	code abs=0x21D23C

; [code] A = wLinkFlags & 0xF, C (the getter beside SetLinkAnswerBits); no caller found
GetLinkFlags:
	ld	A,(wLinkFlags)
	and	A,0xF
	scf
	ret

c_21D245	section	code abs=0x21D245

; [code] wLinkFlags bits 0 and 2 = A (bits 0 / 2 of A), C
SetLinkAnswerBits:
	andb	(wLinkFlags),0xFA
	or	(wLinkFlags),A
	scf
	ret

c_21D250	section	code abs=0x21D250

; [code] XHL = wLinkSendPacket; no caller found
GetLinkSendPacket:
	ld	XHL,wLinkSendPacket
	ret

c_21D256	section	code abs=0x21D256

; [code] XHL = wLinkRecvPacket
GetLinkRecvPacket:
	ld	XHL,wLinkRecvPacket
	ret

c_21D25C	section	code abs=0x21D25C

; [code] wLinkOffer = 0, wLinkFlags = 0, wLinkCallback = 0
ResetLinkOffer:
	xor	XWA,XWA
	ld	(wLinkOffer),WA
	ld	(wLinkFlags),A
	ld	(wLinkCallback),XWA
	ret

c_21D26B	section	code abs=0x21D26B

; [code] wLinkCallback = XHL (LinkCommTask calls it each loop when non-zero)
SetLinkCallback:
	ld	(wLinkCallback),XHL
	ret

c_21D270	section	code abs=0x21D270

; [code] child of StartLinkTask: BIOS COM calls 0x10-0x1A in a loop; receives into wLinkRxBuffer, syncs on word LinkSyncWord, assembles a 16-byte packet at wLinkPacketText, checksum LinkChecksum, status wLinkStatus (1 ok, FF/FE/FD errors, bits in wLinkErrorBits), sends 16 bytes (COM 0x19); [play] works_trade_checking / no_cable
LinkCommTask:
	ld	XHL,wLinkOffer
	ld	XDE,wLinkOffer+1
	ld	XBC,0x6D
	ldb	(XHL),0
	ldir	(XDE+),(XHL+)
	ldb	(wLinkTimeout),0x1E
	ld	RW3,0x10
	calr	BiosCall
LinkCommTask.loop:
	ld	XHL,(wLinkCallback)
	or	XHL,XHL
	jr	Z,LinkCommTask.skip
	call	XHL
LinkCommTask.skip:
	ld	RW3,0x12
	calr	BiosCall
	ld	RW3,0x15
	call	BiosCall
	call	LinkTaskYield
	ld	XHL,wLinkPacketText
	ld	(wLinkPacketWritePtr),XHL
	ld	B,0x10
	ld	(wLinkPacketBytesLeft),B
LinkCommTask.loop2:
	ld	RW3,0x18
	call	BiosCall
	ld	WA,RWA3
	and	W,0xE
	jp	NZ,LinkCommTask.skip7
	or	A,A
	jp	Z,LinkCommTask.skip4
	ld	XHL,wLinkRxBuffer
	ld	XHL3,XHL
	ld	B,0x40
	ld	RB3,B
	ld	RW3,0x1A
	calr	BiosCall
	ld	A,RB3
	ld	B,0x40
	sub	B,A
	ld	XHL,wLinkRxBuffer
	ld	XDE,(wLinkPacketWritePtr)
	ld	C,(wLinkPacketBytesLeft)
	cp	C,0x10
	jr	NZ,LinkCommTask.loop4
LinkCommTask.loop3:
	cp	B,2
	jr	C,LinkCommTask.skip3
	ld	WA,(LinkSyncWord)
	cp	WA,(XHL)
	jr	Z,LinkCommTask.skip2
	inc	1,XHL
	dec	1,B
	jr	LinkCommTask.loop3
LinkCommTask.skip2:
	ld	(XDE+),WA
	inc	2,XHL
	dec	2,B
	dec	2,C
LinkCommTask.loop4:
	or	C,C
	jr	Z,LinkCommTask.skip5
	or	B,B
	jr	Z,LinkCommTask.skip3
	ld	A,(XHL+)
	ld	(XDE+),A
	dec	1,B
	dec	1,C
	jr	LinkCommTask.loop4
LinkCommTask.skip3:
	ld	(wLinkPacketWritePtr),XDE
	ld	(wLinkPacketBytesLeft),C
	cpb	(wLinkTimeout),0
	jp	Z,LinkCommTask.skip6
	decb	1,(wLinkTimeout)
	call	LinkTaskYield
	jp	LinkCommTask.loop2
LinkCommTask.skip4:
	cpb	(wLinkTimeout),0
	jp	Z,LinkCommTask.skip6
	decb	1,(wLinkTimeout)
	jp	LinkCommTask.skip13
LinkCommTask.skip5:
	ld	XHL,wLinkPacketText
	ld	XDE,wLinkRecvPacket
	call	DecodeLinkPacket
	jr	NC,LinkCommTask.skip9
	ld	XHL,wLinkRecvPacket
	call	LinkChecksum
	cp	A,(XHL)
	jr	NZ,LinkCommTask.skip8
	jp	LinkCommTask.skip11
LinkCommTask.skip6:
	orb	(wLinkErrorBits),8
	ldb	(wLinkStatus),0
	jr	LinkCommTask.skip10
LinkCommTask.skip7:
	sll	4,W
	or	(wLinkErrorBits),W
	ldb	(wLinkStatus),0xFF
	orb	(wLinkErrorBits),1
	jr	LinkCommTask.skip10
LinkCommTask.skip8:
	ldb	(wLinkStatus),0xFE
	orb	(wLinkErrorBits),2
	jr	LinkCommTask.skip10
LinkCommTask.skip9:
	ldb	(wLinkStatus),0xFD
	orb	(wLinkErrorBits),4
LinkCommTask.skip10:
	ld	XHL,wLinkRecvPacket
	ld	XDE,wLinkRecvPacket+1
	ld	XBC,6
	ldb	(XHL),0
	ldir	(XDE+),(XHL+)
	jr	LinkCommTask.skip12
LinkCommTask.skip11:
	ldb	(wLinkStatus),1
LinkCommTask.skip12:
	ldb	(wLinkTimeout),0x1E
LinkCommTask.skip13:
	cpb	(wLinkStatus),1
	jr	NZ,LinkCommTask.skip14
	ld	WA,(wLinkRecvPacket+2)
	ld	(wLinkSendPacket+4),WA
	ld	A,(wLinkRecvPacket+1)
	sll	1,A
	and	A,0xA
	andb	(wLinkSendPacket+1),0xF5
	or	(wLinkSendPacket+1),A
LinkCommTask.skip14:
	ld	WA,(wLinkOffer)
	ld	(wLinkSendPacket+2),WA
	ld	A,(wLinkFlags)
	and	A,5
	andb	(wLinkSendPacket+1),0xFA
	or	(wLinkSendPacket+1),A
	ld	A,(wLinkRecvPacket)
	cp	A,(wLinkSendPacket)
	jr	PL,LinkCommTask.skip15
	ld	A,(wLinkSendPacket)
LinkCommTask.skip15:
	inc	1,A
	ld	(wLinkSendPacket),A
	ld	XHL,wLinkSendPacket
	call	LinkChecksum
	ld	(XHL),A
	ld	XHL,wLinkSendPacket
	ld	XDE,wLinkPacketText
	call	EncodeLinkPacket
	ld	RW3,0x17
	calr	BiosCall
	ld	WA,RWA3
	or	A,A
	jr	NZ,LinkCommTask.skip16
	ld	XHL,wLinkPacketText
	ld	XHL3,XHL
	ld	B,0x10
	ld	RB3,B
	ld	RW3,0x19
	calr	BiosCall
	cp	RB3,0
	jr	Z,LinkCommTask.skip16
LinkCommTask.skip16:
	ld	RW3,0x11
	calr	BiosCall
	ld	A,(wLinkSendPacket+1)
	andb	(wLinkFlags),0xF5
	or	(wLinkFlags),A
	jp	LinkCommTask.loop

c_21D47C	section	code abs=0x21D47C

; [code] A = XOR of the 6 bytes at XHL (XHL left at +6: the packet checksum byte)
LinkChecksum:
	ld	B,6
	xor	A,A
LinkChecksum.loop:
	xor	A,(XHL+)
	djnz	B,LinkChecksum.loop
	ret

c_21D487	section	code abs=0x21D487

; [code] XHL = 16 received bytes: the sync word (LinkSyncWord) then 14 hex characters -> 7 bytes at XDE, C, A = 0; NC with A = 1 (no sync word) or 2 (not a hex character)
DecodeLinkPacket:
	ld	WA,(LinkSyncWord)
	cp	WA,(XHL+)
	jr	NZ,DecodeLinkPacket.skip
	ld	B,7
DecodeLinkPacket.loop:
	ld	A,(XHL+)
	call	HexCharToNibble
	jr	NC,DecodeLinkPacket.skip2
	ld	W,A
	ld	A,(XHL+)
	call	HexCharToNibble
	jr	NC,DecodeLinkPacket.skip2
	sll	4,W
	or	A,W
	ld	(XDE+),A
	djnz	B,DecodeLinkPacket.loop
	xor	A,A
	scf
	jr	DecodeLinkPacket.done
DecodeLinkPacket.skip:
	ld	A,1
	jr	DecodeLinkPacket.skip3
DecodeLinkPacket.skip2:
	ld	A,2
DecodeLinkPacket.skip3:
	rcf
DecodeLinkPacket.done:
	ret

c_21D4BF	section	code abs=0x21D4BF

; [code] A = ASCII hex character -> A = 0-15, C; NC if below "0" or above "F" (":".."@" are not rejected: they give 3-9)
HexCharToNibble:
	sub	A,0x30
	ccf
	ret	NC
	cp	A,0xA
	ret	C
	sub	A,7
	cp	A,0x10
	ret

c_21D4D1	section	code abs=0x21D4D1

; [code] 7 bytes at XHL -> XDE: the sync word (LinkSyncWord), then each byte as two hex characters (14), C
EncodeLinkPacket:
	ld	WA,(LinkSyncWord)
	ld	(XDE+),WA
	ld	B,7
EncodeLinkPacket.loop:
	ld	W,(XHL+)
	ld	A,W
	srl	4,A
	call	NibbleToHexChar
	ld	(XDE+),A
	ld	A,W
	and	A,0xF
	call	NibbleToHexChar
	ld	(XDE+),A
	djnz	B,EncodeLinkPacket.loop
	xor	A,A
	scf
	ret

c_21D4FD	section	code abs=0x21D4FD

; [code] A = 0-15 -> ASCII hex character "0"-"9", "A"-"F"
NibbleToHexChar:
	add	A,0x30
	cp	A,0x3A
	ret	C
	add	A,7
	ret
