; engine/battle/menu.asm: battle command menu, weapon info, item list

c_209872	section	code abs=0x209872

; [code+play] "What do you do?" box: Up / Down move wBattleMenuCursor 0-3 (Attack, Item, Charge, Flee), A runs
; BattleMainMenuJumps[cursor]; each key also calls Random to stir the seed
BattleMainMenuInput:
	bit	4,(wFrameCounter)	; cursor blinks: drawn every other 16 frames
	jr	Z,BattleMainMenuInput.skip
	ld	E,(wBattleMenuCursor)
	ld	D,0
	sll	4,DE
	inc	4,DE
	ld	BC,0x60
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
BattleMainMenuInput.skip:
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,BattleMainMenuInput.skip2
	bit	BIT_D_DOWN,A
	jr	NZ,BattleMainMenuInput.skip3
	bit	BIT_A_BUTTON,A
	jr	NZ,BattleMainMenuInput.skip4
	ret
BattleMainMenuInput.skip2:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	call	Random
	ld	A,(wBattleMenuCursor)
	dec	1,A
	and	A,3
	ld	(wBattleMenuCursor),A
	ret
BattleMainMenuInput.skip3:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	call	Random
	ld	A,(wBattleMenuCursor)
	inc	1,A
	and	A,3
	ld	(wBattleMenuCursor),A
	ret
BattleMainMenuInput.skip4:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	call	Random
	ld	A,2
	call	EraseTextBox
	ld	XHL,0
	ld	L,(wBattleMenuCursor)
	sll	2,XHL
	add	XHL,BattleMainMenuJumps
	ld	XHL,(XHL)
	ld	(XIZ+TASK_FUNC),XHL
	ret
; [code] the task function for each wBattleMenuCursor 0-3 (BattleMainMenuInput)
BattleMainMenuJumps:
	dl	BattleCommandMenu	; 0
	dl	OpenBattleItemList	; 1
	dl	ShowEPAtMax	; 2
	dl	StartBattleRound	; 3

c_20990F	section	code abs=0x20990F

; [code] Charge chosen: with EP already full, "EP at max" and back to the menu (EnemyChooseAttack), else StartBattleRound
ShowEPAtMax:
	ld	WA,(wUnitEP)
	cp	WA,(wUnitMaxEP)
	jr	C,ShowEPAtMax.skip
	ld	XHL,EPAtMaxText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),EnemyChooseAttack & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyChooseAttack >> 16
	ret
ShowEPAtMax.skip:
	ldw	(XIZ+TASK_FUNC),StartBattleRound & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StartBattleRound >> 16
	ret

c_20994F	section	code abs=0x20994F

; [code] "LV": DrawBattleScreen draws it with DrawString before wPlayerLevel
LevelText:
	text "LV"
	done
; [code+play] Attack chosen: box 2 lists the right arm, left arm, skill 1 and skill 2, ShowWeaponInfo for wBattleChoice,
; then BattleCommandMenuTask; ShowNotEnoughEP returns here
BattleCommandMenu:
	ld	A,2
	ld	C,8
	ld	E,9
	ld	HL,0x194
	call	OpenTextBox
	ld	XHL,TText
	call	ExpandMessage
	call	DrawString
	ld	XHL,LeftArmText
	call	ExpandMessage
	ldb	(XWA+6),0
	ldb	(XWA+7),2
	call	DrawString
	ld	XHL,Skill1Text
	call	ExpandMessage
	ldb	(XWA+6),0
	ldb	(XWA+7),4
	call	DrawString
	ld	XHL,Skill2Text
	call	ExpandMessage
	ldb	(XWA+6),0
	ldb	(XWA+7),6
	call	DrawString
	ld	C,2
	ld	E,0x2D
	call	PlaceTextBoxXWA
	calr	ShowWeaponInfo
	ldw	(XIZ+TASK_FUNC),BattleCommandMenuTask & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleCommandMenuTask >> 16
	ret

c_2099C1	section	code abs=0x2099C1

; [code+play] runs every frame of the attack list: Up / Down move wBattleChoice 0-3 (skipping empty skill slots),
; A takes it when wCommandEPCosts[choice] <= wUnitEP (wAttackEPCost, StartBattleRound), else buzzer and ShowNotEnoughEP; B backs out
BattleCommandMenuTask:
	bit	4,(wFrameCounter)
	jr	Z,BattleCommandMenuTask.skip
	ld	DE,(wBattleChoice)
	sll	4,DE
	inc	4,DE
	ld	BC,0x60
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
BattleCommandMenuTask.skip:
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,BattleCommandMenuTask.skip2
	bit	BIT_D_DOWN,A
	jr	NZ,BattleCommandMenuTask.skip4
	bit	BIT_A_BUTTON,A
	jr	NZ,BattleCommandMenuTask.skip6
	bit	BIT_B_BUTTON,A
	jrl	NZ,BattleCommandMenuBack
	ret
BattleCommandMenuTask.skip2:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	call	Random
	ld	WA,(wBattleChoice)
	dec	1,WA
	and	WA,3
; choices 2 / 3 are skills: an empty slot (0) moves the cursor on
BattleCommandMenuTask.loop:
	ld	(wBattleChoice),WA
	cp	WA,2
	jrl	C,ShowWeaponInfo
	jr	Z,BattleCommandMenuTask.skip3
	cpb	(wSkill2),0
	jrl	NZ,ShowWeaponInfo
	ld	WA,2
	jr	BattleCommandMenuTask.loop
BattleCommandMenuTask.skip3:
	cpb	(wSkill1),0
	jrl	NZ,ShowWeaponInfo
	ld	WA,1
	jr	BattleCommandMenuTask.loop
BattleCommandMenuTask.skip4:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	call	Random
	ld	WA,(wBattleChoice)
	inc	1,WA
	and	WA,3
BattleCommandMenuTask.loop2:
	ld	(wBattleChoice),WA
	cp	WA,2
	jrl	C,ShowWeaponInfo
	jr	Z,BattleCommandMenuTask.skip5
	cpb	(wSkill2),0
	jrl	NZ,ShowWeaponInfo
	ld	A,0
	jr	BattleCommandMenuTask.loop2
BattleCommandMenuTask.skip5:
	cpb	(wSkill1),0
	jrl	NZ,ShowWeaponInfo
	ld	WA,3
	jr	BattleCommandMenuTask.loop2
BattleCommandMenuTask.skip6:
	ld	XHL,wCommandEPCosts	; EP cost per choice, worked out at battle start (?)
	ld	WA,(wBattleChoice)
	sll	1,WA
	ld	WA,(XHL+WA)
	cp	(wUnitEP),WA
	jr	C,BattleCommandMenuTask.skip7
	ld	(wAttackEPCost),WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	ld	A,2
	call	EraseTextBox
	ld	A,0
	call	ClearTextBox
	ldw	(XIZ+TASK_FUNC),StartBattleRound & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StartBattleRound >> 16
	ret
BattleCommandMenuTask.skip7:
	ld	WA,SFX_BUZZER
	call	SoundCommand
	ldw	(XIZ+TASK_FUNC),ShowNotEnoughEP & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),ShowNotEnoughEP >> 16
	ret

c_209AB5	section	code abs=0x209AB5

; [code] "Not enough EP" for the chosen attack, then back to BattleCommandMenu
ShowNotEnoughEP:
	ld	XHL,NotEnoughEPText
	call	ShowMessage
	ld	XHL,WaitBattleMessageTask
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),BattleCommandMenu & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleCommandMenu >> 16
	ret

c_209AE0	section	code abs=0x209AE0

; [code] B in the attack list: cancel sound, erase box 2, clear box 0, back to the "What do you do?" menu (EnemyChooseAttack)
BattleCommandMenuBack:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	call	Random
	ld	A,2
	call	EraseTextBox
	ld	A,0
	call	ClearTextBox
	ldw	(XIZ+TASK_FUNC),EnemyChooseAttack & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyChooseAttack >> 16
	ret

c_209B02	section	code abs=0x209B02

; [code] box 0: the chosen arm's or skill's description, EP cost (wCommandEPCosts) and its affinity icon when it has one
ShowWeaponInfo:
	ld	A,0
	call	ClearTextBox
	cpw	(wBattleChoice),1
	ld	L,(wEquipRightArm)
	jr	C,ShowWeaponInfo.skip2
	ld	L,(wEquipLeftArm)
	jr	Z,ShowWeaponInfo.skip2
	cpw	(wBattleChoice),3
	ld	L,(wSkill1)
	jr	C,ShowWeaponInfo.skip
	ld	L,(wSkill2)
ShowWeaponInfo.skip:
	push	L
	call	GetSkillRecord
	ld	WA,(XHL+0xE)
	pop	L
	call	GetSkillDesc
	jr	ShowWeaponInfo.skip3
ShowWeaponInfo.skip2:
	push	L
	call	GetArmRecord
	ld	WA,(XHL+PART_AFFINITY)
	pop	L
	call	GetArmDesc
ShowWeaponInfo.skip3:
	push	WA
	ld	(XIZ+0x10),XHL
	ld	XHL,wCommandEPCosts
	ld	WA,(wBattleChoice)
	sll	1,WA
	ld	WA,(XHL+WA)
	ld	(XIZ+0x14),WA
	ld	XHL,Str1EPCostNum3Text
	call	ExpandMessage
	ld	A,0
	call	DrawBoxString
	pop	WA
	or	WA,WA
	ret	Z
	push	WA
	ld	A,0
	ld	C,0x11
	ld	E,2
	call	SetTextBoxCursor
	pop	HL
	call	GetAffinityIcon
	call	DrawTextChar
	ret

c_209B8B	section	code abs=0x209B8B

; [code] Item chosen: box 2 with the first page (DrawBattleItemPage), wBattleChoice = 0 and its description,
; then BattleItemListInput
OpenBattleItemList:
	ld	A,2
	ld	C,0xA
	ld	E,9
	ld	HL,0x194
	call	OpenTextBox
	calr	DrawBattleItemPage
	ld	C,0
	ld	E,0x2D
	call	PlaceTextBoxXWA
	ldb	(wScr2ScrollX),0xB0
	ldb	(wScr2ScrollY),0x68
	ldw	(wBattleChoice),0
	calr	GetItemListPageRow
	calr	SetBattleItemChoice
	ldw	(XIZ+TASK_FUNC),BattleItemListInput & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),BattleItemListInput >> 16
	ret

c_209BC4	section	code abs=0x209BC4

; [code] battle item list, every frame: Up / Down row 0-5, Left / Right page 0-2 (6 per page), A uses an item
; held (wBattleChoice += ITEM_FIXIT1, StartBattleRound), else buzzer; B back to EnemyChooseAttack
BattleItemListInput:
	calr	GetItemListPageRow
	bit	4,(wFrameCounter)
	jr	Z,BattleItemListInput.skip
	sll	3,DE
	inc	4,DE
	ld	BC,0x50
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
BattleItemListInput.skip:
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,BattleItemListInput.skip2
	bit	BIT_D_DOWN,A
	jr	NZ,BattleItemListInput.skip3
	bit	BIT_D_LEFT,A
	jr	NZ,BattleItemListInput.skip4
	bit	BIT_D_RIGHT,A
	jr	NZ,BattleItemListInput.skip6
	bit	BIT_A_BUTTON,A
	jr	NZ,BattleItemListInput.skip8
	bit	BIT_B_BUTTON,A
	jrl	NZ,BattleItemListInput.skip11
	ret
BattleItemListInput.skip2:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	call	Random
	calr	GetItemListPageRow
	dec	1,DE
	or	DE,DE
	jrl	PL,SetBattleItemChoice
	ld	DE,5
	jrl	SetBattleItemChoice
BattleItemListInput.skip3:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	call	Random
	calr	GetItemListPageRow
	inc	1,DE
	cp	DE,6
	jrl	C,SetBattleItemChoice
	ld	DE,0
	jrl	SetBattleItemChoice
BattleItemListInput.skip4:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	calr	GetItemListPageRow
	dec	1,WA
	or	WA,WA
	jr	PL,BattleItemListInput.skip5
	ld	WA,2
BattleItemListInput.skip5:
	calr	SetBattleItemChoice
	jrl	DrawBattleItemPage
BattleItemListInput.skip6:
	ld	WA,SFX_CURSOR
	call	SoundCommand
	calr	GetItemListPageRow
	inc	1,WA
	cp	WA,3
	jr	C,BattleItemListInput.skip7
	ld	WA,0
BattleItemListInput.skip7:
	calr	SetBattleItemChoice
	jrl	DrawBattleItemPage
; only the 14 battle items ITEM_FIXIT1..ITEM_MAGFLR can be used; the third page's last 4 rows are empty
BattleItemListInput.skip8:
	ld	WA,(wBattleChoice)
	cp	WA,ITEM_MAGFLR+1-ITEM_FIXIT1
	jr	NC,BattleItemListInput.skip9
	add	WA,ITEM_FIXIT1
	call	GetInventoryByte
	or	A,A
	jr	NZ,BattleItemListInput.skip10
BattleItemListInput.skip9:
	ld	WA,SFX_BUZZER
	call	SoundCommand
	ret
BattleItemListInput.skip10:
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	ld	A,2
	call	EraseTextBox
	ld	A,0
	call	ClearTextBox
	addw	(wBattleChoice),ITEM_FIXIT1
	ldw	(XIZ+TASK_FUNC),StartBattleRound & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),StartBattleRound >> 16
	ret
BattleItemListInput.skip11:
	ld	WA,SFX_CANCEL
	call	SoundCommand
	call	Random
	ld	A,2
	call	EraseTextBox
	ldw	(wBattleChoice),0
	ldw	(XIZ+TASK_FUNC),EnemyChooseAttack & 0xFFFF
	ldw	(XIZ+TASK_FUNC_HI),EnemyChooseAttack >> 16
	ret

c_209CCE	section	code abs=0x209CCE

; [code] WA = wBattleChoice / 6 (page), DE = wBattleChoice % 6 (row); BattleItemListInput
GetItemListPageRow:
	ld	WA,(wBattleChoice)
	extz	XWA
	div	XWA,6
	ld	DE,QWA
	ret

c_209CDC	section	code abs=0x209CDC

; [code] WA = page, DE = row -> wBattleChoice = WA * 6 + DE; box 0 shows the item's GetItemDesc when it is a
; battle item that is held
SetBattleItemChoice:
	extz	XWA
	mul	XWA,6
	add	WA,DE
	ld	(wBattleChoice),WA
	ld	A,0
	call	ClearTextBox
	ld	WA,(wBattleChoice)
	cp	WA,ITEM_MAGFLR+1-ITEM_FIXIT1
	ret	NC
	add	WA,ITEM_FIXIT1
	push	WA
	call	GetInventoryByte
	pop	HL
	ret	C
	call	GetItemDesc
	ld	(XIZ+0x10),XHL
	ld	XHL,wCommandEPCosts
	ld	WA,(wBattleChoice)
	sll	1,WA
	ld	WA,(XHL+WA)
	ld	(XIZ+0x14),WA
	ld	XHL,Str1Text
	call	ExpandMessage
	ld	A,0
	call	DrawBoxString
	ret

c_209D2F	section	code abs=0x209D2F

; [code] box 2: page number "n/03" and the page's 6 battle items: name and count, or a dash line when none held
DrawBattleItemPage:
	ld	A,2
	call	ClearTextBox
	ld	C,5
	ld	E,6
	call	SetTextBoxCursorXWA
	ld	XHL,Slash03Text
	call	DrawString
	ld	C,2
	ld	E,6
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	ld	BC,(wBattleChoice)
	extz	XBC
	div	XBC,6
	push	BC
	inc	1,BC
	call	RenderNumberTiles
	ld	C,2
	ld	E,6
	call	SetTextBoxCursorXWA
	ld	XHL,BlankZeroText
	call	DrawString
	pop	BC
	mul	XBC,6
	ld	B,0
DrawBattleItemPage.loop:
	push	BC
	push	XWA
	ld	A,(XSP+4)	; row's item index, from the pushed BC (C)
	add	A,ITEM_FIXIT1
	extz	WA
	call	GetInventoryByte
	ld	C,A
	ld	B,0
	pop	XWA
	jr	NC,DrawBattleItemPage.skip
	ld	C,0
	ld	E,(XSP+1)
	call	SetTextBoxCursorXWA
	ld	XHL,DashText12
	call	DrawString
	jr	DrawBattleItemPage.skip2
DrawBattleItemPage.skip:
	push	BC
	ld	C,5
	ld	E,(XSP+3)
	call	SetTextBoxCursorXWA
	call	GetTextCursorTile
	pop	BC
	call	RenderNumberTiles
	ld	C,0
	ld	E,(XSP+1)
	call	SetTextBoxCursorXWA
	ld	L,(XSP+0)
	add	L,ITEM_FIXIT1
	call	GetItemName
	call	DrawString
	ld	C,6
	ld	E,(XSP+1)
	call	SetTextBoxCursorXWA
	ld	XHL,TimesText5
	call	DrawString
DrawBattleItemPage.skip2:
	pop	BC
	inc	1,C
	cp	C,ITEM_MAGFLR+1-ITEM_FIXIT1
	jr	NC,DrawBattleItemPage.done
	inc	1,B
	cp	B,6
	jr	C,DrawBattleItemPage.loop
DrawBattleItemPage.done:
	ret
; [code] DrawBattleItemPage strings: page count, " 0" drawn over the page number (?), count mark, empty row
Slash03Text:
	text "/03"
	done
; [code] see Slash03Text
BlankZeroText:
	text " 0"
	done
; [code] see Slash03Text
TimesText5:
	db	0x69,0xFF	; "×"
; [code] see Slash03Text
DashText12:
	db	0x59,0x59,0x59,0x59,0x59,0x59,0x59,0x59,0xFF	; "--------"
