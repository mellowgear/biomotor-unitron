; engine/arena/entry.asm: arena Entry/Quit menu and the entry fee / rank boxes

c_213817	section	code abs=0x213817

; ArenaTask state 4 (set by ArenaSceneEnd command 0xFC), each frame: up/down wrap cursor +0x10 over Entry (0) / Quit (1),
; A chooses, B forces Quit; redraws the cursor and counts +0x2D [code][play]
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
	; B button
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
	; d-pad: 1 = up, 2 = down; both ends wrap
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
	; cursor x 0x60, y 8 * row + 4
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

; Leaves only the chosen line in box 2 and queues scene +0x12 = 7 (Entry) or 8 (Quit) through state TASK_ARG 3 [code]
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
	; next scene for state 3
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

; Box 2: the ranks open at GetStageArenaRank (last row in +0x14) then Quit at row 8; box 1 the cost of row +0x10
; (reset to the last rank unless command +0x17 is 0xF3) and the GP box [code][play]
ShowArenaRankList:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	ClearBox2Tall
	call	GetStageArenaRank
	; last row = rank - 1, rank 9 keeps 7 (the cp 1 test branches nowhere)
	cp	A,1
	jr	NC,ShowArenaRankList.skip
ShowArenaRankList.skip:
	cp	A,9
	jr	Z,ShowArenaRankList.skip2
	inc	1,A
ShowArenaRankList.skip2:
	sub	A,2
	ld	(XIZ+0x14),A
	; one line per open rank
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
	; command 0xF3 returns to the list keeping the old cursor
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

; Box 1: the entry cost line of rank row A [code]
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

; ArenaTask state 5, each frame: up/down move cursor +0x10 over rows 0..+0x14 and Quit (8), redrawing the cost;
; A chooses, B picks Quit [code]
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
	; up from 0 goes to Quit, up from Quit to the last rank, down mirrors
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
	; no cost line on Quit
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

; Leaves the chosen line in box 2 and queues a scene via state TASK_ARG 3: Quit -> 8, cost above wGP -> 0x41,
; else ArenaText2 in box 3, +0x15 = row + 2 (the match rank (?)) and scene 9 [code]
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
	; row 8 is Quit
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
	; cost (word, binary) to BCD to compare with wGP
	sll	1,A
	ld	XHL,ArenaEntryCosts
	add	XHL,XWA
	ld	WA,(XHL)
	extz	XWA
	call	BinToBCD
	ld	XBC,XWA
	ld	XWA,(wGP)
	call	SubBCD
	; not enough GP
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
