; engine/arena/entry.asm: arena Entry/Quit menu and the entry fee / rank boxes

c_213817	section	code abs=0x213817

; [code] cursor task+0x10 toggles 0/1 on U/D (sound 0x80), A (0x81) or B (0x82, forces 1) calls ArenaEntryMenuChoose which draws string pointer 0x249BC9[cursor] = "Entry" (0x249BBC) / "Quit" (0x249BC3, decoded with charmap) and sets scene 7 / 8; DrawMenuCursor at y = 8*cursor+4; state TASK_ARG 4 of ArenaTask (set by ArenaSceneEnd command 0xFC); [play] arena_entry_quit_menu
ArenaEntryMenuInput:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,ArenaEntryMenuInput.skip
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	calr	ArenaEntryMenuChoose
	jr	ArenaEntryMenuInput.skip7
ArenaEntryMenuInput.skip:
	bit	5,A
	jr	Z,ArenaEntryMenuInput.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	calr	ArenaEntryMenuChoose
	jr	ArenaEntryMenuInput.skip7
ArenaEntryMenuInput.skip2:
	and	A,0xF
	jr	Z,ArenaEntryMenuInput.skip7
	cp	A,1
	jr	NZ,ArenaEntryMenuInput.skip4
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,ArenaEntryMenuInput.skip3
	dec	1,A
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip3:
	ld	A,1
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip4:
	cp	A,2
	jr	NZ,ArenaEntryMenuInput.skip6
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,ArenaEntryMenuInput.skip5
	inc	1,A
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip5:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	ArenaEntryMenuInput.skip6
ArenaEntryMenuInput.skip6:
	jr	ArenaEntryMenuInput.skip7
ArenaEntryMenuInput.skip7:
	ld	BC,0x60
	ld	XWA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2138B7	section	code abs=0x2138B7

; [code] ArenaEntryMenuInput on A / B: box 2 = only the chosen line (ArenaEntryMenuTexts[cursor]), Entry -> scene 7, Quit -> scene 8, TASK_ARG 3
ArenaEntryMenuChoose:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2Tall
	ld	E,(XIZ+0x10)
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	ld	XWA,0
	ld	A,(XIZ+0x10)
	sll	2,XWA
	ld	XHL,ArenaEntryMenuTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	DrawBoxString
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	NZ,ArenaEntryMenuChoose.skip
	ld	A,7
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	ArenaEntryMenuChoose.skip2
ArenaEntryMenuChoose.skip:
	ld	A,8
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
ArenaEntryMenuChoose.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213903	section	code abs=0x213903

; [code] box 2: ArenaRankNames up to the GetStageArenaRank entry (+0x14 = the last row), QuitText3 at row 8; cursor +0x10 = +0x14 (kept for command 0xF3); box 1 DrawArenaEntryCost, DrawGPBox3; [play] arena_rank*_rank_list_cost
ShowArenaRankList:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2Tall
	call	GetStageArenaRank
	cp	A,1
	jr	NC,ShowArenaRankList.skip
ShowArenaRankList.skip:
	cp	A,9
	jr	Z,ShowArenaRankList.skip2
	inc	1,A
ShowArenaRankList.skip2:
	sub	A,2
	ld	(XIZ+0x14),A
	ld	XDE,ArenaRankNames
	ld	C,A
	inc	1,C
ShowArenaRankList.loop:
	ld	XHL,(XDE)
	ld	A,2
	push	XDE
	push	C
	call	DrawBoxString
	pop	C
	pop	XDE
	inc	4,XDE
	djnz	C,ShowArenaRankList.loop
	ld	E,8
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	ld	A,2
	ld	XHL,QuitText3
	call	DrawBoxString
	ld	A,(XIZ+0x17)
	cp	A,0xF3
	jr	Z,ShowArenaRankList.skip3
	ld	A,(XIZ+0x14)
	ld	(XIZ+0x10),A
ShowArenaRankList.skip3:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	calr	DrawArenaEntryCost
	call	DrawGPBox3
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213972	section	code abs=0x213972

; [code] box 1: CostText + ArenaEntryCostTexts[A]
DrawArenaEntryCost:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	A
	ld	XHL,CostText
	ld	A,1
	call	DrawBoxString
	pop	A
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,ArenaEntryCostTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21399E	section	code abs=0x21399E

; [code] ArenaTask state 5: up / down move cursor +0x10 over rows 0..+0x14 and Quit (8), redrawing DrawArenaEntryCost; A -> ArenaRankListChoose, B -> Quit; DrawMenuCursor at x 0x68, y 8 * cursor + 4
ArenaRankListInput:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,ArenaRankListInput.skip
	push	WA
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	calr	ArenaRankListChoose
	jrl	ArenaRankListInput.skip10
ArenaRankListInput.skip:
	bit	5,A
	jr	Z,ArenaRankListInput.skip2
	push	WA
	ld	WA,SFX_CANCEL
	call	SoundCommand
	pop	WA
	ld	A,8
	ld	(XIZ+0x10),A
	calr	ArenaRankListChoose
	jr	ArenaRankListInput.skip10
ArenaRankListInput.skip2:
	and	A,0xF
	jr	Z,ArenaRankListInput.skip10
	cp	A,1
	jr	NZ,ArenaRankListInput.skip5
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,ArenaRankListInput.skip3
	cp	A,8
	jr	Z,ArenaRankListInput.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	ArenaRankListInput.skip9
ArenaRankListInput.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	ArenaRankListInput.skip9
ArenaRankListInput.skip4:
	ld	A,(XIZ+0x14)
	ld	(XIZ+0x10),A
	jr	ArenaRankListInput.skip9
ArenaRankListInput.skip5:
	cp	A,2
	jr	NZ,ArenaRankListInput.skip8
	push	WA
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,ArenaRankListInput.skip6
	cp	A,(XIZ+0x14)
	jr	Z,ArenaRankListInput.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	ArenaRankListInput.skip9
ArenaRankListInput.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	ArenaRankListInput.skip9
ArenaRankListInput.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	ArenaRankListInput.skip9
ArenaRankListInput.skip8:
	jr	ArenaRankListInput.skip10
ArenaRankListInput.skip9:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,ArenaRankListInput.skip10
	calr	DrawArenaEntryCost
ArenaRankListInput.skip10:
	ld	BC,0x68
	ld	XWA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213A68	section	code abs=0x213A68

; [code] box 2 = only the chosen line; Quit -> scene 8; a rank whose ArenaEntryCosts (BinToBCD) is more than wGP (SubBCD carry) -> scene 0x41; else box 3 ArenaText2, +0x15 = rank + 2, scene 9; TASK_ARG 3
ArenaRankListChoose:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2Tall
	ld	E,(XIZ+0x10)
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	ld	XWA,0
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,ArenaRankListChoose.skip
	sll	2,XWA
	ld	XHL,ArenaRankNames
	add	XHL,XWA
	ld	XHL,(XHL)
	jr	ArenaRankListChoose.skip2
ArenaRankListChoose.skip:
	ld	XHL,QuitText3
ArenaRankListChoose.skip2:
	ld	A,2
	call	DrawBoxString
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,ArenaRankListChoose.skip4
	ld	A,(XIZ+0x10)
	extz	WA
	extz	XWA
	sll	1,A
	ld	XHL,ArenaEntryCosts
	add	XHL,XWA
	ld	WA,(XHL)
	extz	XWA
	call	BinToBCD
	ld	XBC,XWA
	ld	XWA,(wGP)
	call	SubBCD
	jr	NC,ArenaRankListChoose.skip3
	ld	A,0x41
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	ArenaRankListChoose.skip5
ArenaRankListChoose.skip3:
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	A,(XIZ+0x10)
	add	A,2
	ld	(XIZ+0x15),A
	ld	A,9
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	ArenaRankListChoose.skip5
ArenaRankListChoose.skip4:
	ld	XHL,ArenaText2
	ld	A,3
	call	DrawBoxString
	ld	A,8
	ld	(XIZ+0x12),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
ArenaRankListChoose.skip5:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
