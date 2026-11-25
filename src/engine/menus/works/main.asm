; engine/menus/works/main.asm: Works screen: RunWorksScreen, WorksScreenTask, partner greeting, top menu and cursor descriptions, partner portrait/gender text

c_217C44	section	code abs=0x217C44

; [code] menu box table: 8 entries 0x217BFC "Setup" (value 4), "Develp" (5), "Item" (1), "Stats" (0), "Trade" (3), "Help" (6), "Data" (2), "Exit" (0xFF), cells 0x217C2C, values 0x217C3C; then MenuReset
SetupWorksMenu:
	ld	A,8
	ld	(wMenuCount),A
	ld	A,8
	ld	(wMenuTextCount),A
	ld	XHL,MenuLines_217BFC
	ld	(wMenuTexts),XHL
	ld	XHL,MenuCursor_217C2C
	ld	(wMenuCells),XHL
	ld	XHL,MenuResults_217C3C
	ld	(wMenuValues),XHL
	jp	MenuReset
CharaText:
	text "Chara"
	done
UNITText:
	text "UNIT"
	done
ExitText5:
	db	0x25,0x18,0x09,0x14,0xFF	; "Exit"
MenuLines_217C7F:
	menu_item	0,0,CharaText
	menu_item	0,1,UNITText
	menu_item	0,8,ExitText5
MenuCursor_217C91:
	db	0,0, 0,1, 0,8	; column, row
MenuResults_217C97:
	db	0x00,0x01,0xFF

c_217CF0	section	code abs=0x217CF0

; [code] menu block 0x614A-0x6154 = "Item", "Parts", "Exit", then menu command 1
SetupItemPartsMenu:
	ld	A,3
	ld	(wMenuCount),A
	ld	A,3
	ld	(wMenuTextCount),A
	ld	XHL,MenuLines_217CD5
	ld	(wMenuTexts),XHL
	ld	XHL,MenuCursor_217CE7
	ld	(wMenuCells),XHL
	ld	XHL,MenuResults_217CED
	ld	(wMenuValues),XHL
	jp	MenuReset

c_217D60	section	code abs=0x217D60

; [code] menu box table: "Core" (1), "Leg" (2), "BPack" (3), "Arm" (4), "Exit" (0xFF) at 0x217D33; callers the shop and Works list screens before ChooseAnItemText
SetupPartCategoryMenu:
	ld	A,5
	ld	(wMenuCount),A
	ld	A,5
	ld	(wMenuTextCount),A
	ld	XHL,MenuLines_217D33
	ld	(wMenuTexts),XHL
	ld	XHL,MenuCursor_217D51
	ld	(wMenuCells),XHL
	ld	XHL,MenuResults_217D5B
	ld	(wMenuValues),XHL
	jp	MenuReset

c_217DD3	section	code abs=0x217DD3

; [code] 5-entry menu (MenuLines_217DA6: Item, Tool, Mate., Acce., Exit; values MenuResults_217DCE, 0xFF = Exit), MenuReset; callers WorksItemMenu (Item), WorksTradeMenu and ShopMainMenu
SetupItemCategoryMenu:
	ld	A,5
	ld	(wMenuCount),A
	ld	A,5
	ld	(wMenuTextCount),A
	ld	XHL,MenuLines_217DA6
	ld	(wMenuTexts),XHL
	ld	XHL,MenuCursor_217DC4
	ld	(wMenuCells),XHL
	ld	XHL,MenuResults_217DCE
	ld	(wMenuValues),XHL
	jp	MenuReset
SaveText:
	text "Save"
	done
LoadText:
	text "Load"
	done
ExitText7:
	db	0x25,0x18,0x09,0x14,0xFF	; "Exit"
MenuLines_217E0D:
	menu_item	0,0,SaveText
	menu_item	0,1,LoadText
	menu_item	0,8,ExitText7
MenuCursor_217E1F:
	db	0,0, 0,1, 0,8	; column, row
MenuResults_217E25:
	db	0x00,0x01,0xFF

c_2188FF	section	code abs=0x2188FF

; [code] StartChildTask WorksBox4Task; WorksScreenTask calls it after StartListTask
StartWorksBox4Task:
	ld	XHL,WorksBox4Task
	call	StartChildTask
	ret

c_21890A	section	code abs=0x21890A

; [code] child task: OpenTextBox 4 (8 x 3, tiles from 0x78), ClearTextBox 4, PlaceTextBox 4 at column 0xC, row 0xB, then TaskYield forever
WorksBox4Task:
	ld	A,4
	ld	C,8
	ld	E,3
	ld	HL,0x78
	call	OpenTextBox
	ld	A,4
	call	ClearTextBox
	ld	A,4
	ld	C,0xC
	ld	E,0xB
	call	PlaceTextBox
WorksBox4Task.loop:
	call	TaskYield
	jr	WorksBox4Task.loop

c_21892D	section	code abs=0x21892D

; [code] EndTask; ret, after WorksBox4Task's endless loop: no callers
WorksBox4TaskEnd:
	call	EndTask
	ret

c_219424	section	code abs=0x219424

; [code] CallCopyEquipToWorks (CopyEquipToWorks) + CopyPlayerInfoToWorks + CopyGameToWorksStub (ret); callers WorksScreenTask and ReopenWorksBoxes
CopyGameToWorks:
	call	CallCopyEquipToWorks
	call	CopyPlayerInfoToWorks
	call	CopyGameToWorksStub
	ret

c_21943E	section	code abs=0x21943E

; [code] call CopyEquipToWorks; ret (first step of CopyGameToWorks)
CallCopyEquipToWorks:
	call	CopyEquipToWorks
	ret

c_219444	section	code abs=0x219444

; [code] name pointer, rank, race, level, emblems -> 0x61D3-0x61DA; partner name, race, engineer level
CopyPlayerInfoToWorks:
	ld	XHL,wPlayerName
	ld	(wPlayerNamePtrCopy),XHL
	ld	A,(wArenaRank)
	ld	(wArenaRankCopy),A
	ld	A,(wPlayerRace)
	ld	(wPlayerRaceCopy),A
	ld	A,(wPlayerLevel)
	ld	(wPlayerLevelCopy),A
	call	SetEmblemBits
	ld	XHL,wPartnerName
	ld	(wPartnerNamePtrCopy),XHL
	ld	A,(wPartnerRace)
	ld	(wWorksPartnerRace),A
	ld	A,(wEngineerLevel)
	ld	(wWorksEngineerLevel),A
	ld	A,(wEmblemBits)
	ld	(wEmblemBitsCopy),A
	ret

c_21948B	section	code abs=0x21948B

; [code] wEmblemBits = bit 1 EVENT_EMBLEM_GREEN, bit 2 EVENT_EMBLEM_BLUE, bit 3 EVENT_EMBLEM_WHITE, bit 4 EVENT_EMBLEM_BLACK (CheckEventFlagA); caller CopyPlayerInfoToWorks
SetEmblemBits:
	ldb	(wEmblemBits),0
	ld	A,EVENT_EMBLEM_GREEN
	call	CheckEventFlagA
	jr	NC,SetEmblemBits.skip
	orb	(wEmblemBits),2
SetEmblemBits.skip:
	ld	A,EVENT_EMBLEM_BLUE
	call	CheckEventFlagA
	jr	NC,SetEmblemBits.skip2
	orb	(wEmblemBits),4
SetEmblemBits.skip2:
	ld	A,EVENT_EMBLEM_WHITE
	call	CheckEventFlagA
	jr	NC,SetEmblemBits.skip3
	orb	(wEmblemBits),8
SetEmblemBits.skip3:
	ld	A,EVENT_EMBLEM_BLACK
	call	CheckEventFlagA
	jr	NC,SetEmblemBits.done
	orb	(wEmblemBits),0x10
SetEmblemBits.done:
	ret

c_2194C6	section	code abs=0x2194C6

; [code] ret (third step of CopyGameToWorks)
CopyGameToWorksStub:
	ret

c_219776	section	code abs=0x219776

; [code] BIOS call 2 (RTC get: 7 BCD bytes) into wRtcBuffer
ReadRtc:
	ld	XHL3,wRtcBuffer
	ld	RW3,2
	call	BiosCall
	ret

c_219796	section	code abs=0x219796

; [code] A = portrait, 0xFE = wPlayerRaceCopy, 0xFF = wWorksPartnerRace; HL = first tile, BC/DE = position: DrawPortraitAt
DrawPortraitOrRace:
	cp	A,0xFE
	jr	NZ,DrawPortraitOrRace.skip
	ld	A,(wPlayerRaceCopy)
	jr	DrawPortraitOrRace.skip2
DrawPortraitOrRace.skip:
	cp	A,0xFF
	jr	NZ,DrawPortraitOrRace.skip2
	ld	A,(wWorksPartnerRace)
DrawPortraitOrRace.skip2:
	extz	WA
	push	WA
	ld	WA,HL
	pop	HL
	call	DrawPortraitAt
	ret

c_2197B5	section	code abs=0x2197B5

; [code] BC = 0, DE = 0x20 (row 0x20 = SCR2), then DrawPortraitTiles126: DrawPortraitOrRace at 0,0 of SCR2 with tiles from 0x126 (the SCR2 counterpart of DrawPortraitScr1)
DrawPortraitScr2:
	ld	BC,0
	ld	DE,0x20

c_2197BA	section	code abs=0x2197BA

; [code] DrawPortraitOrRace with tiles from 0x126 at the caller's BC/DE
DrawPortraitTiles126:
	ld	HL,0x126
	jp	DrawPortraitOrRace

c_2197C1	section	code abs=0x2197C1

; [code] DrawPortraitOrRace at 0,0 with tiles from 0x7E
DrawPortraitScr1:
	ld	BC,0
	ld	DE,0
	ld	HL,0x7E
	jp	DrawPortraitOrRace

c_2197CC	section	code abs=0x2197CC

; [code] ClearPicture clears the picture area, portrait 0x35 (place_portraits.asm: 53 = Works) at 0,0 tile 0x7E (DrawPortraitScr1), then A = 0xFF -> the partner's portrait (wWorksPartnerRace, DrawPortraitOrRace) at 0,0x20 tile 0x126 (DrawPortraitScr2 -> DrawPortraitTiles126)
DrawWorksPortraits:
	call	ClearPicture
	ld	A,0x35
	call	DrawPortraitScr1
	ld	A,0xFF
	call	DrawPortraitScr2
	ret

c_2197DD	section	code abs=0x2197DD

; [code] FillScr1Rect + FillScr2Rect 0 over the 12x14 area at 0,0 and FillTiles 0x7E x 0x1C2 (the picture tiles); ClearPictureAndTilemaps does this and clears both maps
ClearPicture:
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
	ret

c_2198E3	section	code abs=0x2198E3

; [code] shows XHL if the partner is male, XDE if female (SplitRaceGender)
ShowPartnerGenderText:
	call	PickPartnerGenderText
	jp	ShowMenuText

c_2198EB	section	code abs=0x2198EB

; [code] SplitRaceGender(wWorksPartnerRace): W = 1 (female) -> XHL = XDE, else XHL kept; used by ShowPartnerGenderText
PickPartnerGenderText:
	ld	A,(wWorksPartnerRace)
	call	SplitRaceGender
	or	W,W
	ret	Z
	ld	XHL,XDE
	ret

c_2198FA	section	code abs=0x2198FA

; [code] ReadRtc, W = wRtcBuffer+1, A = wRtcBuffer+2 (RTC month, day); no caller, and no 24-bit pointer to it in the ROM: dead code
; [play] never runs: no hit in two full playthroughs from boot nor in every Works menu
GetRtcMonthDay:
	call	ReadRtc
	ld	W,(wRtcBuffer+1)
	ld	A,(wRtcBuffer+2)
	ret

c_219907	section	code abs=0x219907

; [code] call PlayMusic; ret
CallPlayMusic:
	call	PlayMusic
	ret

c_219911	section	code abs=0x219911

; [code] PlayMusic 2 (CallPlayMusic); caller WorksScreenModes
PlayMusic2:
	ld	XWA,2
	jp	CallPlayMusic

c_219917	section	code abs=0x219917

; [code] the 0x621A entry of RunWorksScreen: mode 6 -> SetupTradeItemList list, result list row 0x615B + 1 to 0x61F7, EndMenuTask; other modes -> WorksScreenModes
WorksScreenEntry:
	ldw	(0x61F7),0
	cpb	(wWorksScreenMode),6
	jp	NZ,WorksScreenModes
	ld	A,1
	call	SetupTradeItemList
	call	RedrawListPage
	call	ShowListCursor
	call	RunListInput
	ld	A,(wListChoice)
	inc	1,A
	ld	(0x61F7),A
	jp	EndMenuTask

c_219947	section	code abs=0x219947

; [code] partner's greeting by time of day / story
WorksGreeting:
	cpb	(wWorksScreenMode),4
	jr	Z,WorksGreeting.skip
	cpb	(wWorksScreenMode),5
	jr	Z,WorksGreeting.skip
	call	DrawWorksPortraits
	jr	WorksGreeting.done
WorksGreeting.skip:
	call	ClearPicture
WorksGreeting.done:
	ret

c_219960	section	code abs=0x219960

; [code] WorksGreeting, DrawGP; mode 4 -> WorksStatsMenu, 5 -> WorksItemMenu, 3 -> loc_21AA73; else engineer level 10 / 30 body upgrades (JustThePersonIText / IveGotSomeGoodText, UpgradeBody, EVENT_BODY2 / EVENT_BODY3), EVENT_STAGE_LILY ImGladToSeeText, mode 2 GoodMorningHowDoText, else WelcomeBackEverythingHeresText; then WorksMainMenu
WorksScreenModes:
	call	WorksGreeting
	call	DrawGP
	cpb	(wWorksScreenMode),4
	jp	Z,WorksStatsMenu
	cpb	(wWorksScreenMode),5
	jp	Z,WorksItemMenu
	call	PlayMusic2
	ld	WA,0x22
	call	CallSoundCommand
	cpb	(wWorksScreenMode),3
	jp	Z,loc_21AA73
	cpb	(wWorksEngineerLevel),0xA
	jr	C,WorksScreenModes.skip
	ld	A,EVENT_BODY2
	call	CheckEventFlagA
	jr	NZ,WorksScreenModes.skip
	ld	XHL,JustThePersonIText
	ld	XDE,JustThePersonIText2
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	UpgradeBody
	ld	A,EVENT_BODY2
	call	SetEventFlagA
	jp	WorksScreenModes.skip5
WorksScreenModes.skip:
	cpb	(wWorksEngineerLevel),0x1E
	jr	C,WorksScreenModes.skip2
	ld	A,EVENT_BODY3
	call	CheckEventFlagA
	jr	NZ,WorksScreenModes.skip2
	ld	XHL,IveGotSomeGoodText
	ld	XDE,IveGotSomeGoodText2
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	UpgradeBody
	ld	A,EVENT_BODY3
	call	SetEventFlagA
	jp	WorksScreenModes.skip5
WorksScreenModes.skip2:
	ld	A,EVENT_STAGE_LILY
	call	CheckEventFlagA
	jr	Z,WorksScreenModes.skip3
	ld	XHL,ImGladToSeeText
	ld	XDE,ImSoGladToText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	WorksScreenModes.skip5
WorksScreenModes.skip3:
	cpb	(wWorksScreenMode),2
	jr	NZ,WorksScreenModes.skip4
	ld	XHL,GoodMorningHowDoText
	ld	XDE,GoodMorningPlayerIText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	WorksScreenModes.skip5
WorksScreenModes.skip4:
	ld	XHL,WelcomeBackEverythingHeresText
	ld	XDE,WelcomeBackIJustText2
	call	ShowPartnerGenderText
	call	Wait30Frames
WorksScreenModes.skip5:
	jp	WorksMainMenu

c_219A40	section	code abs=0x219A40

; [code] body id + 1, AddItem, EquipFromWorksList (WorksGreeting, engineer level 10/30)
UpgradeBody:
	ld	WA,(wWorksEquip)
	inc	1,A
	ld	(wWorksEquip),WA
	call	AddItemByCategory
	call	EquipFromWorksList
	ret

c_219A53	section	code abs=0x219A53

; [code] TaskYield, DrawWorksPortraits, then WorksMainMenu (the submenus jump here when done)
WorksMenuReturn:
	call	TaskYield
	call	DrawWorksPortraits

c_219A5B	section	code abs=0x219A5B

; [code] DrawGP, SetupWorksMenu, DrawMenuBox, ShowMenuCursor, PostMenuInput, WhatDoYouWantText2, then WorksMenuPoll
WorksMainMenu:
	call	DrawGP
	call	SetupWorksMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	call	TaskYield
	call	PostMenuInput
	ld	XHL,WhatDoYouWantText2
	ld	XDE,WhatDoYouWantText2
	call	ShowPartnerGenderText
	call	WaitForButton
	ldb	(0x61F9),0xFF

c_219A8A	section	code abs=0x219A8A

; [code] GetMenuResult: none -> WorksMenuCursorMoved; else wMenuChoice 0 WorksStatsMenu, 1 WorksItemMenu, 2 WorksDataMenu, 3 WorksTradeMenu, 4 WorksSetupMenu, 5 WorksDevelopMenu, 6 WorksHelpMenu, other / B -> WorksExit (values from SetupWorksMenu)
WorksMenuPoll:
	call	GetMenuResult
	jp	Z,WorksMenuCursorMoved
	ld	A,(wMenuChoice)
	or	A,A
	jp	MI,WorksExit
	cp	A,0
	jp	Z,WorksStatsMenu
	cp	A,1
	jp	Z,WorksItemMenu
	cp	A,2
	jp	Z,WorksDataMenu
	cp	A,3
	jp	Z,WorksTradeMenu
	cp	A,4
	jp	Z,WorksSetupMenu
	cp	A,5
	jp	Z,WorksDevelopMenu
	cp	A,6
	jp	Z,WorksHelpMenu
	jp	WorksExit

c_219AD3	section	code abs=0x219AD3

; [code] TaskYield, back to WorksMenuPoll
WorksMenuIdle:
	call	TaskYield
	jp	WorksMenuPoll

c_219ADB	section	code abs=0x219ADB

; [code] when wMenuCursor differs from 0x61F9: FlushMessage and the entry's description from the table at WorksMenuCursorJumps (ShowSetupDescription ... ShowExitDescription)
WorksMenuCursorMoved:
	ld	A,(wMenuCursor)
	cp	A,(0x61F9)
	jp	Z,WorksMenuIdle
	ld	(0x61F9),A
	call	FlushMessage
	ld	A,(0x61F9)
	cp	A,8
	jp	NC,WorksMenuIdle
	sll	2,A
	ld	XHL,WorksMenuCursorJumps
	ld	XHL,(XHL+A)
	jp	XHL
WorksMenuCursorJumps:
	dl	ShowSetupDescription,ShowDevelopDescription,ShowItemDescription,ShowStatsDescription
	dl	ShowTradeDescription,ShowHelpDescription,ShowDataDescription,ShowExitDescription

c_219B2B	section	code abs=0x219B2B

; [code] Works menu cursor text for entry 3 "Stats" (table WorksMenuCursorJumps): ThisLetsYouSeeText ("our status, and the UNITRON's")
ShowStatsDescription:
	ld	XHL,ThisLetsYouSeeText
	ld	XDE,ThisLetsYouSeeText
	jp	ShowWorksDescription

c_219B39	section	code abs=0x219B39

; [code] Works menu cursor text for entry 2 "Item": ThisLetsYouSeeText2 ("what items and parts we have")
ShowItemDescription:
	ld	XHL,ThisLetsYouSeeText2
	ld	XDE,ThisLetsYouSeeText2
	jp	ShowWorksDescription

c_219B47	section	code abs=0x219B47

; [code] Works menu cursor text for entry 6 "Data": ThisLetsYouSaveText ("save and load game files")
ShowDataDescription:
	ld	XHL,ThisLetsYouSaveText
	ld	XDE,ThisLetsYouSaveText
	jp	ShowWorksDescription

c_219B55	section	code abs=0x219B55

; [code+play] Works menu cursor text: IfYouAttachAText
ShowTradeDescription:
	ld	XHL,IfYouAttachAText
	ld	XDE,IfYouAttachAText
	jp	ShowWorksDescription

c_219B63	section	code abs=0x219B63

; [code+play] Works menu cursor text: YouCanChangeYourText
ShowSetupDescription:
	ld	XHL,YouCanChangeYourText
	ld	XDE,YouCanChangeYourText
	jp	ShowWorksDescription

c_219B71	section	code abs=0x219B71

; [code+play] Works menu cursor text: YouCanMakeNewText
ShowDevelopDescription:
	ld	XHL,YouCanMakeNewText
	ld	XDE,YouCanMakeNewText
	jp	ShowWorksDescription

c_219B7F	section	code abs=0x219B7F

; [code] Works menu cursor text for entry 7 "Exit": ThisTakesYouBackText ("back to the town")
ShowExitDescription:
	ld	XHL,ThisTakesYouBackText
	ld	XDE,ThisTakesYouBackText
	jp	ShowWorksDescription

c_219B8D	section	code abs=0x219B8D

; [code] Works menu cursor text for entry 5 "Help" (table WorksMenuCursorJumps): DisplaysHelpFilesText via ShowWorksDescription (was misnamed StatsMenu)
ShowHelpDescription:
	ld	XHL,DisplaysHelpFilesText
	ld	XDE,DisplaysHelpFilesText

c_219B97	section	code abs=0x219B97

; [code] PickPartnerGenderText (XHL / XDE), PrintInMessageBox, back to WorksMenuIdle; tail of the Show*Description routines
ShowWorksDescription:
	call	PickPartnerGenderText
	call	PrintInMessageBox
	jp	WorksMenuIdle

c_21AA5D	section	code abs=0x21AA5D

; [code] Works menu "Exit" / B: SeeYouLaterTakeText, EndMenuTask
WorksExit:
	ld	XHL,SeeYouLaterTakeText
	ld	XDE,SeeYouLaterTakeText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	EndMenuTask

c_21AA73	section	code abs=0x21AA73

loc_21AA73:
	ld	XHL,WhewImGladToText
	ld	XDE,WhewImGladToText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	WorksMainMenu

c_21AA89	section	code abs=0x21AA89

; [code] child task of the camp menu: RunWorksScreen(0x620A: 4 Stats from CampMenuInput, 5 Item list from CampItemSubmenuInput), result to 0x620E, EndChildTasks, EndTask
CampWorksScreenTask:
	ld	A,(wCampWorksMode)
	call	RunWorksScreen
	ld	(0x620E),XWA
	call	EndChildTasks
	call	EndTask
CampWorksScreenTask.loop:
	call	TaskYield
	jp	CampWorksScreenTask.loop

c_21AAA5	section	code abs=0x21AAA5

; [code] A = mode (wWorksScreenMode): entry pointer 0x621A = WorksScreenEntry, child WorksScreenTask, TaskYield until EndMenuTask posts 0x6212, XWA = it. Modes: 1 / 2 street Works visits (StreetGoWorks, LoadGameEnterWorks), 3 StreetAfterDungeonDefeat, 4 camp Stats, 5 camp Item list (CampWorksScreenTask), 6 list pick
RunWorksScreen:
	ld	XHL,WorksScreenEntry
RunWorksScreen.withEntry:
	ld	(0x621A),XHL
	ld	(wWorksScreenMode),A
	pop	XHL
	ld	(0x6216),XHL
	xor	XWA,XWA
	ld	(wWorksScreenResult),XWA
	ld	XHL,WorksScreenTask
	call	StartChildTask
RunWorksScreen.loop:
	ld	XWA,(wWorksScreenResult)
	or	XWA,XWA
	jr	NZ,RunWorksScreen.skip
	call	TaskYield
	jr	RunWorksScreen.loop
RunWorksScreen.skip:
	call	TaskYield
	ld	XWA,(wWorksScreenResult)
	ld	XHL,(0x6216)
	jp	XHL

c_21AAE2	section	code abs=0x21AAE2

; [code] child of RunWorksScreen: ClearPictureAndTilemaps, boxes 1 (0x14 x 5 at 0,0xE), StartCursorTask, StartMessageTask, StartBox2Task, StartMenuBoxTask, list setup, SetMessageBox 1, SetMessageSpeed wOptionMessageSpeed, then jp (0x621A)
WorksScreenTask:
	call	ClearPictureAndTilemaps
	ld	A,1
	ld	C,0x14
	ld	E,5
	ld	HL,0xC
	call	OpenTextBox
	ld	A,1
	call	ClearTextBox
	ld	A,1
	ld	C,0
	ld	E,0xE
	call	PlaceTextBox
	call	StartCursorTask
	call	StartMessageTask
	call	StartBox2Task
	call	StartMenuBoxTask
	call	StartListTask
	call	StartWorksBox4Task
	call	CopyGameToWorks
	ld	A,1
	call	SetMessageBox
	ld	A,(wOptionMessageSpeed)
	call	SetMessageSpeed
	call	Box2Open
	call	Box2ClearPlace
	call	Box2SetFlag
	ld	XHL,(0x621A)
	jp	XHL

c_21AB7A	section	code abs=0x21AB7A

; [code] ClearPictureAndTilemaps, opens, clears and places text boxes 1 (20x5), 2 (8x11) and 4 (8x3), then CopyGameToWorks; callers WorksDataMenu and WorksHelpMenu on return
ReopenWorksBoxes:
	call	ClearPictureAndTilemaps
	ld	A,1
	ld	C,0x14
	ld	E,5
	ld	HL,0xC
	call	OpenTextBox
	ld	A,1
	call	ClearTextBox
	ld	A,1
	ld	C,0
	ld	E,0xE
	call	PlaceTextBox
	ld	A,2
	ld	C,8
	ld	E,0xB
	ld	HL,0x42
	call	OpenTextBox
	ld	A,2
	call	ClearTextBox
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	ld	A,4
	ld	C,8
	ld	E,3
	ld	HL,0x78
	call	OpenTextBox
	ld	A,4
	call	ClearTextBox
	ld	A,4
	ld	C,0xC
	ld	E,0xB
	call	PlaceTextBox
	call	CopyGameToWorks
	ret
