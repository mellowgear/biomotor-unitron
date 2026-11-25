; engine/dungeon/camp.asm: camp menu: CampMenuDispatch, its boxes and drawing, item use, status labels, Leave OK?

c_211DDE	section	code abs=0x211DDE

; [code] A = box: text pointer +8 = 0x249755 = FA FF (TextCmd_Wait, TextCmd_End); 4 callers (WorldMapDungeonTextBox2, WorldMapDungeonText, CampItemUseMenu, OpenChestShowResult; was "OpenChestEnd2", the jump before it)
SetTextBoxWait:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	GetTextBox
	ld	XHL,WaitText2
	ld	(XWA+8),XHL
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211DF3	section	code abs=0x211DF3

; [code] OpenTextBox 3 (8 x 8, tile word from GetDungeonTilesPtr + 0x5BCF); CampMenuDispatch states 1 and 7
OpenCampBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	GetDungeonTilesPtr
	ld	HL,(XHL)
	ld	WA,(wDungeonTileBase)
	add	HL,WA
	ld	A,3
	ld	C,8
	ld	E,8
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211E12	section	code abs=0x211E12

; [code] PlaceTextBox 3 at column 0xC, row 0x21; CampMenuDispatch states 2 and 7
PlaceCampBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	C,0xC
	ld	E,0x21
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211E25	section	code abs=0x211E25

; [code] EraseTextBox(3): clears box 3's +8/+0xC pointers and fills its screen rectangle (+2..+5) with 0 via FillScrRect; callers CampMenuInput, CampLeavePrompt; byte-identical copy of EraseEnterPromptBox, EraseBox3 (the ROM has each)
EraseTextBox3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211E34	section	code abs=0x211E34

; [code] Camp: Item / Stats / Leave / Close
DrawCampMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	ClearTextBox
	ld	A,3
	ld	XHL,CampText
	call	DrawBoxString
	ld	A,3
	ld	XHL,ItemText
	call	DrawBoxString
	ld	A,3
	ld	XHL,StatsText
	call	DrawBoxString
	ld	A,3
	ld	XHL,LeaveText
	call	DrawBoxString
	ld	A,3
	ld	XHL,CloseText
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211E7A	section	code abs=0x211E7A

; [code] box 3: ClearTextBox, "Item" (ItemText2) and " Use ", " List ", blank, " Exit " (0x249781-0x249796); CampMenuInput row 0 and CampMenuDispatch state 7
DrawCampItemSubmenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	ClearTextBox
	ld	A,3
	ld	XHL,ItemText2
	call	DrawBoxString
	ld	A,3
	ld	XHL,UseText
	call	DrawBoxString
	ld	A,3
	ld	XHL,ListText
	call	DrawBoxString
	ld	A,3
	ld	XHL,BlankText
	call	DrawBoxString
	ld	A,3
	ld	XHL,ExitText
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211EC0	section	code abs=0x211EC0

; [code] OpenTextBox 7 (0x12 x 3, tile 0x19) with LeaveOKYesNoText; CampMenuInput row 2 "Leave"
OpenLeaveOKBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x19
	ld	A,7
	ld	C,0x12
	ld	E,3
	call	OpenTextBox
	ld	XHL,LeaveOKYesNoText
	ld	A,7
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211EE1	section	code abs=0x211EE1

; [code] PlaceTextBox 7 at column 1, row 0x2C; after OpenLeaveOKBox
PlaceLeaveOKBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,7
	ld	C,1
	ld	E,0x2C
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211EF4	section	code abs=0x211EF4

; [code] EraseTextBox 7 (the OpenLeaveOKBox box); CampLeavePrompt; byte-identical copy of EraseBossYesNoBox (the ROM has each)
EraseLeaveOKBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,7
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F03	section	code abs=0x211F03

; [code] OpenBoxes123 and OpenTextBox 4 (0xC x 0xE, tile GetPictureFirstTile): the box DrawCampItemList draws
OpenCampItemListBoxes:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	OpenBoxes123
	call	GetPictureFirstTile
	ld	HL,WA
	ld	A,4
	ld	C,0xC
	ld	E,0xE
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F20	section	code abs=0x211F20

; [code] PlaceBoxes123 and PlaceTextBox 4 at 0, 0x20
PlaceCampItemListBoxes:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	PlaceBoxes123
	ld	A,4
	ld	C,0
	ld	E,0x20
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F37	section	code abs=0x211F37

; [code] EraseBoxes123 and EraseTextBox 4 (no caller found)
EraseCampItemListBoxes:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	EraseBoxes123
	ld	A,4
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F4A	section	code abs=0x211F4A

; [code] ClearScr1Tilemap, ClearScr2Tilemap, OpenCampItemListBoxes, DrawCampItemList, DrawStatusLabel, PlaceCampItemListBoxes, DrawCampItemDesc; cursor +0x20 = 0, +0x21 = 3 (CampItemMenuDispatch: CampItemUseMenu)
ShowCampItemList:
	call	ClearScr1Tilemap
	call	ClearScr2Tilemap
	calr	OpenCampItemListBoxes
	calr	DrawCampItemList
	calr	DrawStatusLabel
	calr	PlaceCampItemListBoxes
	calr	DrawCampItemDesc
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,3
	ld	(XIZ+0x21),A
	ret

c_211F6C	section	code abs=0x211F6C

; [code+play] Status: Normal / Rusted (camp item list)
DrawStatusLabel:
	ld	A,2
	call	ClearTextBox
	ld	XHL,HPText4
	ld	A,2
	call	DrawBoxString
	ld	WA,(wUnitHP)
	cp	WA,0x3E7
	jr	C,DrawStatusLabel.skip
	ld	WA,0x3E7
DrawStatusLabel.skip:
	extz	XWA
	call	BinToBCD
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	DrawBcdDigits
	ld	XHL,SlashText2
	ld	A,2
	call	DrawBoxString
	ld	WA,(wUnitMaxHP)
	cp	WA,0x3E7
	jr	C,DrawStatusLabel.skip2
	ld	WA,0x3E7
DrawStatusLabel.skip2:
	extz	XWA
	call	BinToBCD
	ld	XHL,XWA
	ld	A,2
	ld	C,3
	call	DrawBcdDigits
	ld	XHL,StatusText
	ld	A,2
	call	DrawBoxString
	ld	A,(wStatusRust)
	cp	A,0
	jr	NZ,DrawStatusLabel.skip3
	ld	XHL,NormalText
	jr	DrawStatusLabel.skip4
DrawStatusLabel.skip3:
	ld	XHL,RustedText2
DrawStatusLabel.skip4:
	ld	A,2
	call	DrawBoxString
	ret

c_211FE8	section	code abs=0x211FE8

; [code] box 4: items 0x26-0x2B (items.asm 38-43: FixIt1-4, FullFx, Clear), each GetItemName + count digit string 0x2497B5 + count*2, or the dash line 0x2497A8 when GetInventoryByte sets carry (none held); callers ShowCampItemList, CampItemUseMenu; [play] camp_item_use_list_fixit1_x4
DrawCampItemList:
	ld	A,4
	call	ClearTextBox
	ld	A,4
	ld	XHL,ItemText3
	call	DrawBoxString
	ld	WA,0x26
	ld	C,6
DrawCampItemList.loop:
	push	WA
	push	C
	call	GetInventoryByte
	jr	NC,DrawCampItemList.skip
	ld	XHL,DashText
	ld	A,4
	call	DrawBoxString
	jr	DrawCampItemList.skip2
DrawCampItemList.skip:
	pop	C
	pop	WA
	push	WA
	push	C
	ld	L,A
	call	GetItemName
	ld	A,4
	call	DrawBoxString
	pop	C
	push	C
	ld	E,6
	sub	E,C
	ld	C,8
	add	E,1
	ld	A,4
	call	SetTextBoxCursor
	ld	XHL,TimesText
	ld	A,4
	call	DrawBoxString
	pop	C
	pop	WA
	push	WA
	push	C
	call	GetInventoryByte
	extz	WA
	extz	XWA
	mul	XWA,2
	ld	XHL,ItemCountDigitTexts
	add	XHL,XWA
	ld	A,4
	call	DrawBoxString
DrawCampItemList.skip2:
	pop	C
	pop	WA
	inc	1,WA
	djnz	C,DrawCampItemList.loop
	ret

c_21206C	section	code abs=0x21206C

; [code] box 1: GetItemOrPartDesc of item 0x26 + cursor +0x20, unless GetInventoryByte sets carry (none held)
DrawCampItemDesc:
	push	XHL
	push	XWA
	ld	A,(XIZ+0x20)
	extz	WA
	add	WA,0x26
	call	GetInventoryByte
	jr	C,DrawCampItemDesc.skip
	ld	A,(XIZ+0x20)
	extz	WA
	add	WA,0x26
	call	GetItemOrPartDesc
	ld	A,1
	call	DrawBoxString
DrawCampItemDesc.skip:
	pop	XWA
	pop	XHL
	ret

c_212093	section	code abs=0x212093

; [code+play] camp_item_use_list; RemoveItem, CampUseHealItem, DrawStatusLabel
CampItemUseMenu:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CampItemUseMenu.skip2
	ld	A,(XIZ+0x20)
	extz	WA
	add	WA,0x26
	call	GetInventoryByte
	jr	C,CampItemUseMenu.skip
	cp	A,0
	jr	Z,CampItemUseMenu.skip
	jrl	CampItemUseMenu.skip9
CampItemUseMenu.skip:
	push	WA
	ld	WA,0x83
	call	SoundCommand
	pop	WA
CampItemUseMenu.skip2:
	bit	5,A
	jr	Z,CampItemUseMenu.skip3
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,6
	ld	(XIZ+0x20),A
	jr	CampItemUseMenu.skip9
CampItemUseMenu.skip3:
	and	A,0xF
	jr	Z,CampItemUseMenu.skip8
	cp	A,1
	jr	NZ,CampItemUseMenu.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	Z,CampItemUseMenu.skip4
	dec	1,A
	ld	(XIZ+0x20),A
	jr	CampItemUseMenu.skip7
CampItemUseMenu.skip4:
	ld	A,5
	ld	(XIZ+0x20),A
	jr	CampItemUseMenu.skip7
CampItemUseMenu.skip5:
	cp	A,2
	jr	NZ,CampItemUseMenu.skip7
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,5
	jr	Z,CampItemUseMenu.skip6
	inc	1,A
	ld	(XIZ+0x20),A
	jr	CampItemUseMenu.skip7
CampItemUseMenu.skip6:
	ld	A,0
	ld	(XIZ+0x20),A
	jr	CampItemUseMenu.skip7
CampItemUseMenu.skip7:
	call	ClearTextBox1
	ld	A,(XIZ+0x20)
	cp	A,6
	jr	Z,CampItemUseMenu.skip8
	calr	DrawCampItemDesc
CampItemUseMenu.skip8:
	ld	BC,0
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,8
	add	WA,0xC
	ld	DE,WA
	call	DrawMenuCursor
	jr	CampItemUseMenu.done
CampItemUseMenu.skip9:
	ld	A,(XIZ+0x20)
	cp	A,6
	jr	Z,CampItemUseMenu.skip10
	add	A,0x26
	ld	(XIZ+0x22),A
	ld	A,(XIZ+0x22)
	extz	WA
	call	RemoveItem
	ld	A,(XIZ+0x22)
	extz	WA
	calr	CampUseHealItem
	calr	DrawCampItemList
	calr	DrawStatusLabel
	call	ClearTextBox1
	ld	A,(XIZ+0x22)
	sub	A,0x26
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,ItemUseTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	ld	A,1
	call	SetTextBoxWait
	ld	A,5
	ld	(XIZ+0x21),A
	jr	CampItemUseMenu.done
CampItemUseMenu.skip10:
	calr	CloseCampItemList
CampItemUseMenu.done:
	ret

c_212192	section	code abs=0x212192

; [code+play] FixIt1-4 add FixItHP (30/50/100/150, capped at max HP), FullFx heals fully, Clear cures status
CampUseHealItem:
	push	XHL
	push	XWA
	sub	WA,0x26
	cp	WA,5
	jr	Z,CampUseHealItem.skip3
	cp	WA,4
	jr	Z,CampUseHealItem.skip
	push	WA
	ld	WA,0x98
	call	SoundCommand
	pop	WA
	ld	XHL,FixItHP
	extz	XWA
	add	XHL,XWA
	ld	L,(XHL)
	extz	HL
	ld	WA,(wUnitHP)
	add	WA,HL
	ld	HL,(wUnitMaxHP)
	cp	HL,WA
	jr	C,CampUseHealItem.skip2
	ld	(wUnitHP),WA
	jr	CampUseHealItem.skip4
CampUseHealItem.skip:
	ld	WA,0x97
	call	SoundCommand
CampUseHealItem.skip2:
	ld	WA,(wUnitMaxHP)
	ld	(wUnitHP),WA
	jr	CampUseHealItem.skip4
CampUseHealItem.skip3:
	push	A
	ld	A,0
	ld	(wStatusRust),A
	ld	(wStatusParalyzed),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	pop	A
	ld	WA,0x97
	call	SoundCommand
CampUseHealItem.skip4:
	pop	XWA
	pop	XHL
	ret

c_2121F9	section	code abs=0x2121F9

; [code] CampItemMenuDispatch +0x21 = 5 (after CampItemUseMenu shows an ItemUseTexts line): A or B -> ClearTextBox1, DrawCampItemDesc (cursor not 6), +0x21 = 3; else draws the cursor sprite at y = 8 * cursor + 0xC
CampItemMessageWait:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CampItemMessageWait.skip
	jr	CampItemMessageWait.skip3
CampItemMessageWait.skip:
	bit	5,A
	jr	Z,CampItemMessageWait.skip2
	jr	CampItemMessageWait.skip3
CampItemMessageWait.skip2:
	ld	BC,0
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,8
	add	WA,0xC
	ld	DE,WA
	ld	QB,1
	ld	QD,2
	ld	WA,4
	or	WA,0x3E00
	call	DrawSpriteGrid
	jr	CampItemMessageWait.done
CampItemMessageWait.skip3:
	call	ClearTextBox1
	ld	A,(XIZ+0x20)
	cp	A,6
	jr	Z,CampItemMessageWait.skip4
	calr	DrawCampItemDesc
CampItemMessageWait.skip4:
	ld	A,3
	ld	(XIZ+0x21),A
CampItemMessageWait.done:
	ret

c_212241	section	code abs=0x212241

; [code] CampItemUseMenu on B / the row 6: clears 0x80 words at 0x8800, RedrawDungeonFloor, OpenCampBox, DrawCampItemSubmenu, PlaceCampBox, cursor +0x20 = +0x1F, DrawDungeonBoxes, CampMenuDispatch state 4
CloseCampItemList:
	clear_sprite_vram
	call	RedrawDungeonFloor
	calr	OpenCampBox
	calr	DrawCampItemSubmenu
	calr	PlaceCampBox
	ld	A,(XIZ+0x1F)
	ld	(XIZ+0x20),A
	call	DrawDungeonBoxes
	ld	A,4
	ld	(XIZ+0x2A),A
	ret

c_212273	section	code abs=0x212273

; [code] CampMenuDispatch state 8 (set by CampItemSubmenuInput after ShowCampItemList draws the heal item list and sets +0x21 = 3): switch on +0x21, 3 -> CampItemUseMenu, 5 -> CampItemMessageWait (A/B, back to 3), 1/2/4/6 idle, else +0x2A = 1
CampItemMenuDispatch:
	ld	A,(XIZ+0x21)
	cp	A,1
	jr	NZ,CampItemMenuDispatch.skip
	jr	CampItemMenuDispatch.done
CampItemMenuDispatch.skip:
	cp	A,2
	jr	NZ,CampItemMenuDispatch.skip2
	jr	CampItemMenuDispatch.done
CampItemMenuDispatch.skip2:
	cp	A,3
	jr	NZ,CampItemMenuDispatch.skip3
	calr	CampItemUseMenu
	jr	CampItemMenuDispatch.done
CampItemMenuDispatch.skip3:
	cp	A,4
	jr	NZ,CampItemMenuDispatch.skip4
	jr	CampItemMenuDispatch.done
CampItemMenuDispatch.skip4:
	cp	A,5
	jr	NZ,CampItemMenuDispatch.skip5
	calr	CampItemMessageWait
	jr	CampItemMenuDispatch.done
CampItemMenuDispatch.skip5:
	cp	A,6
	jr	NZ,CampItemMenuDispatch.skip6
	jr	CampItemMenuDispatch.done
CampItemMenuDispatch.skip6:
	ld	A,1
	ld	(XIZ+0x2A),A
CampItemMenuDispatch.done:
	ret

c_2122A6	section	code abs=0x2122A6

; [code] CampMenuDispatch state 3: the whole 4-row camp menu (task +0x20 = row, U/D wrap 0-3, cursor at y 0x1C + 8 * row, B -> row 3); A: row 0 "Item" -> DrawCampItemSubmenu, state 4; row 1 "Stats" -> 0x620A = 4, child CampWorksScreenTask, state 6; row 2 "Leave" -> "Camp" / "Leave" + OpenLeaveOKBox, state 5 (CampLeavePrompt); row 3 "Close" -> EndDungeonCamp (was CampMenuInput: only row 2 leaves)
CampMenuInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CampMenuInput.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	CampMenuInput.skip7
CampMenuInput.skip:
	bit	5,A
	jr	Z,CampMenuInput.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,3
	ld	(XIZ+0x20),A
	jr	CampMenuInput.skip7
CampMenuInput.skip2:
	and	A,0xF
	jr	Z,CampMenuInput.skip6
	cp	A,1
	jr	NZ,CampMenuInput.skip4
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	Z,CampMenuInput.skip3
	dec	1,A
	ld	(XIZ+0x20),A
	jr	CampMenuInput.skip6
CampMenuInput.skip3:
	ld	A,3
	ld	(XIZ+0x20),A
	jr	CampMenuInput.skip6
CampMenuInput.skip4:
	cp	A,2
	jr	NZ,CampMenuInput.skip6
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,3
	jr	Z,CampMenuInput.skip5
	inc	1,A
	ld	(XIZ+0x20),A
	jr	CampMenuInput.skip6
CampMenuInput.skip5:
	ld	A,0
	ld	(XIZ+0x20),A
	jr	CampMenuInput.skip6
CampMenuInput.skip6:
	ld	BC,0x68
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,8
	add	WA,0x1C
	ld	DE,WA
	call	DrawMenuCursor
	jrl	CampMenuInput.done
CampMenuInput.skip7:
	ld	A,(XIZ+0x20)
	ld	(XIZ+0x1E),A
	cp	A,0
	jr	NZ,CampMenuInput.skip8
	calr	DrawCampItemSubmenu
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,4
	ld	(XIZ+0x2A),A
	jr	CampMenuInput.done
CampMenuInput.skip8:
	cp	A,1
	jr	NZ,CampMenuInput.skip9
	calr	EraseTextBox3
	call	EraseDungeonBoxes
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr1ScrollY),A
	ld	A,4
	ld	(wCampWorksMode),A
	ld	XHL,CampWorksScreenTask
	call	StartChildTask
	ld	A,6
	ld	(XIZ+0x2A),A
	jr	CampMenuInput.done
CampMenuInput.skip9:
	cp	A,2
	jr	NZ,CampMenuInput.skip10
	call	EraseDungeonStatusBox
	ld	A,3
	call	ClearTextBox
	ld	A,3
	ld	XHL,CampText
	call	DrawBoxString
	ld	C,0
	ld	E,4
	ld	A,3
	call	SetTextBoxCursor
	ld	A,3
	ld	XHL,LeaveText
	call	DrawBoxString
	calr	OpenLeaveOKBox
	calr	PlaceLeaveOKBox
	ld	A,1
	ld	(XIZ+0x20),A
	ld	A,5
	ld	(XIZ+0x2A),A
	jr	CampMenuInput.done
CampMenuInput.skip10:
	calr	EraseTextBox3
	call	EraseDungeonBoxes
	call	EndDungeonCamp
	jr	CampMenuInput.done
CampMenuInput.done:
	ret

c_2123C2	section	code abs=0x2123C2

; [code+play] Camp > Leave "Leave OK?" (camp_leave_ok_prompt, mine floor 5)
CampLeavePrompt:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CampLeavePrompt.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	CampLeavePrompt.skip8
CampLeavePrompt.skip:
	bit	5,A
	jr	Z,CampLeavePrompt.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x20),A
	jr	CampLeavePrompt.skip8
CampLeavePrompt.skip2:
	and	A,0xF
	jr	Z,CampLeavePrompt.skip5
	cp	A,4
	jr	NZ,CampLeavePrompt.skip3
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	NZ,CampLeavePrompt.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,0
	ld	(XIZ+0x20),A
	jr	CampLeavePrompt.skip5
CampLeavePrompt.skip3:
	cp	A,8
	jr	NZ,CampLeavePrompt.skip4
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	NZ,CampLeavePrompt.skip4
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x20),A
	jr	CampLeavePrompt.skip5
CampLeavePrompt.skip4:
	jr	CampLeavePrompt.skip5
CampLeavePrompt.skip5:
	ld	XWA,0
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,CampLeavePrompt.skip6
	ld	BC,0x58
	jr	CampLeavePrompt.skip7
CampLeavePrompt.skip6:
	ld	BC,0x78
CampLeavePrompt.skip7:
	ld	DE,0x64
	call	DrawMenuCursor
	jr	CampLeavePrompt.done
CampLeavePrompt.skip8:
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	Z,CampLeavePrompt.skip9
	calr	EraseTextBox3
	call	EraseAreaNameBox
	calr	EraseLeaveOKBox
	call	StartDungeonExit
	jr	CampLeavePrompt.done
CampLeavePrompt.skip9:
	calr	EraseLeaveOKBox
	calr	DrawCampMenu
	call	DrawDungeonStatus
	call	PlaceDungeonStatusBox
	ld	A,(XIZ+0x1E)
	ld	(XIZ+0x20),A
	ld	A,3
	ld	(XIZ+0x2A),A
	jr	CampLeavePrompt.done
CampLeavePrompt.done:
	ret

c_212476	section	code abs=0x212476

; [code] CampMenuDispatch state 4: rows Use 0 / List 1 / (blank row 2 skipped) / Exit 3 drawn by DrawCampItemSubmenu, B -> Exit; A: Use -> ShowCampItemList (heal item list), state 8; List -> 0x620A = 5, child CampWorksScreenTask, state 7; Exit -> DrawCampMenu, back to state 3 at the saved row
; [play] Use / List / (blank) / Exit; Down Use-List-Exit, the blank row is never selected; B runs Exit at once
; (same as A on Exit: back to the Camp menu on Item)
CampItemSubmenuInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CampItemSubmenuInput.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jrl	CampItemSubmenuInput.skip9
CampItemSubmenuInput.skip:
	bit	5,A
	jr	Z,CampItemSubmenuInput.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,3
	ld	(XIZ+0x20),A
	jr	CampItemSubmenuInput.skip9
CampItemSubmenuInput.skip2:
	and	A,0xF
	jr	Z,CampItemSubmenuInput.skip8
	cp	A,1
	jr	NZ,CampItemSubmenuInput.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	Z,CampItemSubmenuInput.skip3
	cp	A,3
	jr	Z,CampItemSubmenuInput.skip4
	dec	1,A
	ld	(XIZ+0x20),A
	jr	CampItemSubmenuInput.skip8
CampItemSubmenuInput.skip3:
	ld	A,3
	ld	(XIZ+0x20),A
	jr	CampItemSubmenuInput.skip8
CampItemSubmenuInput.skip4:
	ld	A,1
	ld	(XIZ+0x20),A
	jr	CampItemSubmenuInput.skip8
CampItemSubmenuInput.skip5:
	cp	A,2
	jr	NZ,CampItemSubmenuInput.skip8
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	Z,CampItemSubmenuInput.skip6
	cp	A,3
	jr	Z,CampItemSubmenuInput.skip7
	inc	1,A
	ld	(XIZ+0x20),A
	jr	CampItemSubmenuInput.skip8
CampItemSubmenuInput.skip6:
	ld	A,3
	ld	(XIZ+0x20),A
	jr	CampItemSubmenuInput.skip8
CampItemSubmenuInput.skip7:
	ld	A,0
	ld	(XIZ+0x20),A
	jr	CampItemSubmenuInput.skip8
CampItemSubmenuInput.skip8:
	ld	BC,0x68
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,8
	add	WA,0x1C
	ld	DE,WA
	call	DrawMenuCursor
	jr	CampItemSubmenuInput.done
CampItemSubmenuInput.skip9:
	ld	A,(XIZ+0x20)
	ld	(XIZ+0x1F),A
	cp	A,0
	jr	NZ,CampItemSubmenuInput.skip10
	calr	ShowCampItemList
	ld	A,8
	ld	(XIZ+0x2A),A
	jr	CampItemSubmenuInput.done
CampItemSubmenuInput.skip10:
	cp	A,1
	jr	NZ,CampItemSubmenuInput.skip11
	ld	A,0
	ld	(wScr1ScrollX),A
	ld	(wScr1ScrollY),A
	ld	A,5
	ld	(wCampWorksMode),A
	ld	XHL,CampWorksScreenTask
	call	StartChildTask
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	CampItemSubmenuInput.done
CampItemSubmenuInput.skip11:
	calr	DrawCampMenu
	ld	A,(XIZ+0x1E)
	ld	(XIZ+0x20),A
	ld	A,3
	ld	(XIZ+0x2A),A
CampItemSubmenuInput.done:
	ret

c_21255D	section	code abs=0x21255D

; [code] CampMenuDispatch state +0x2A = 1; DungeonCampInit
StartCampMenu:
	ld	A,1
	ld	(XIZ+0x2A),A
	ret

c_212563	section	code abs=0x212563

; [code] switch on task +0x2A (states 1-9): DrawCampMenu, CampMenuInput, CampLeavePrompt, fades
CampMenuDispatch:
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,CampMenuDispatch.skip
	calr	OpenCampBox
	calr	DrawCampMenu
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,2
	ld	(XIZ+0x2A),A
	jrl	CampMenuDispatch.done
CampMenuDispatch.skip:
	cp	A,2
	jr	NZ,CampMenuDispatch.skip2
	calr	PlaceCampBox
	call	DrawDungeonBoxes
	ld	A,3
	ld	(XIZ+0x2A),A
	jrl	CampMenuDispatch.done
CampMenuDispatch.skip2:
	cp	A,3
	jr	NZ,CampMenuDispatch.skip3
	calr	CampMenuInput
	jr	CampMenuDispatch.done
CampMenuDispatch.skip3:
	cp	A,4
	jr	NZ,CampMenuDispatch.skip4
	calr	CampItemSubmenuInput
	jr	CampMenuDispatch.done
CampMenuDispatch.skip4:
	cp	A,5
	jr	NZ,CampMenuDispatch.skip5
	calr	CampLeavePrompt
	jr	CampMenuDispatch.done
CampMenuDispatch.skip5:
	cp	A,6
	jr	NZ,CampMenuDispatch.skip6
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,CampMenuDispatch.done
	ld	A,0x7F
	ld	(wFadeLevel),A
	ld	A,9
	ld	(XIZ+0x2A),A
	jr	CampMenuDispatch.done
CampMenuDispatch.skip6:
	cp	A,7
	jr	NZ,CampMenuDispatch.skip7
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,CampMenuDispatch.done
	call	RedrawDungeonFloor
	calr	OpenCampBox
	calr	DrawCampItemSubmenu
	calr	PlaceCampBox
	call	DrawDungeonBoxes
	ld	A,4
	ld	(XIZ+0x2A),A
	jr	CampMenuDispatch.done
CampMenuDispatch.skip7:
	cp	A,8
	jr	NZ,CampMenuDispatch.skip8
	calr	CampItemMenuDispatch
	jr	CampMenuDispatch.done
CampMenuDispatch.skip8:
	cp	A,9
	jr	NZ,CampMenuDispatch.skip9
	call	RedrawDungeonFloor
	calr	OpenCampBox
	calr	DrawCampMenu
	calr	PlaceCampBox
	call	DrawDungeonBoxes
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,3
	ld	(XIZ+0x2A),A
	jr	CampMenuDispatch.done
CampMenuDispatch.skip9:
	ld	A,1
	ld	(XIZ+0x2A),A
CampMenuDispatch.done:
	ret

c_212619	section	code abs=0x212619

; [code] pushes and pops XHL / XDE / XBC / XWA, ret: does nothing; no callers
swp_212619:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
