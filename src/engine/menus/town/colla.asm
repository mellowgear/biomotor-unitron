; engine/menus/town/colla.asm: Colla's gem offer, Tetis's gift, BCD/GP box drawing

c_216391	section	code abs=0x216391

; [code] task +0x28 = colla_offers/ line by Random() % 100 against the rank column (GetStageArenaRank 3-8), +0x29 = price column by colla_price_odds.asm
RollCollaOffer:
	push	XHL
	push	C
	push	XWA
	call	GetStageArenaRank
	cp	A,3
	jr	NC,RollCollaOffer.skip
	ld	A,3
	jr	RollCollaOffer.skip2
RollCollaOffer.skip:
	cp	A,9
	jr	C,RollCollaOffer.skip2
	ld	A,8
	jr	RollCollaOffer.skip2
RollCollaOffer.skip2:
	sub	A,3
	extz	WA
	extz	XWA
	ld	XHL,CollaOdds
	add	XHL,XWA
	push	W
	call	Random
	ld	W,0
	div	WA,0x64
	ld	A,W
	pop	W
	ld	C,0
RollCollaOffer.loop:
	ld	W,(XHL)
	sub	A,W
	jr	C,RollCollaOffer.skip3
	inc	1,C
	add	XHL,6
	jr	RollCollaOffer.loop
RollCollaOffer.skip3:
	ld	(XIZ+0x28),C
	ld	XHL,CollaPriceOdds
	push	W
	call	Random
	ld	W,0
	div	WA,0x64
	ld	A,W
	pop	W
	ld	C,0
RollCollaOffer.loop2:
	ld	W,(XHL)
	sub	A,W
	jr	C,RollCollaOffer.skip4
	inc	1,C
	add	XHL,1
	jr	RollCollaOffer.loop2
RollCollaOffer.skip4:
	ld	(XIZ+0x29),C
	pop	XWA
	pop	C
	pop	XHL
	ret

c_21640A	section	code abs=0x21640A

; [code] RollCollaOffer, then draws the offer text, the item name (GetItemOrPartName) and its price (CollaPrices)
ShowCollaOffer:
	calr	RollCollaOffer
	ld	A,2
	call	ClearTextBox
	ld	XHL,ItemText4
	ld	A,2
	call	DrawBoxString
	push	XHL
	ld	A,(XIZ+0x28)
	extz	WA
	extz	XWA
	ld	XHL,CollaItems
	add	XHL,XWA
	ld	A,(XHL)
	extz	WA
	pop	XHL
	call	GetItemOrPartName
	ld	A,2
	call	DrawBoxString
	ld	C,0
	ld	E,5
	ld	A,2
	call	SetTextBoxCursor
	ld	XHL,PriceText
	ld	A,2
	call	DrawBoxString
	push	XWA
	ld	A,(XIZ+0x28)
	extz	WA
	extz	XWA
	mul	XWA,5
	ld	XHL,XWA
	ld	A,(XIZ+0x29)
	extz	WA
	extz	XWA
	add	XWA,XHL
	mul	XWA,4
	ld	XHL,CollaPrices
	add	XHL,XWA
	ld	XHL,(XHL)
	pop	XWA
	ld	A,2
	ld	C,6
	call	DrawBcdDigits
	call	DrawGPBox3
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,2
	ld	(XIZ+0x27),A
	ret

c_21648D	section	code abs=0x21648D

; [code] Colla step 2 (after ShowCollaOffer): A, B or 0x3C frames (+0x2D) -> talk row +0x12 = 0x1E (TalkForest line 31 "So, what do you want to do?"), TASK_ARG 6, step 3 (DrawCollaBuyPrompt, entered again by that row's next 0xEA)
CollaOfferWait:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CollaOfferWait.skip
	jr	CollaOfferWait.skip3
CollaOfferWait.skip:
	bit	5,A
	jr	Z,CollaOfferWait.skip2
	jr	CollaOfferWait.skip3
CollaOfferWait.skip2:
	ld	A,(XIZ+0x2D)
	cp	A,0x3C
	jr	C,CollaOfferWait.done
CollaOfferWait.skip3:
	ld	A,0x1E
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,3
	ld	(XIZ+0x27),A
CollaOfferWait.done:
	ret

c_2164B7	section	code abs=0x2164B7

; [code] Colla state 3 (CollaTalkDispatch): ClearTextBox1, message of talk row 0x1F (table +0x15), YesNoText at 0,2 in box 1, cursor 0, +0x2D = 0, state 4 (CollaBuy)
DrawCollaBuyPrompt:
	call	ClearTextBox1
	ld	W,(XIZ+0x15)
	ld	A,0x1F
	calr	GetTalkRow
	ld	XHL,(XHL+4)
	ld	A,1
	call	DrawBoxString
	ld	C,0
	ld	E,2
	ld	A,1
	call	SetTextBoxCursor
	ld	A,1
	ld	XHL,YesNoText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,4
	ld	(XIZ+0x27),A
	ret

c_2164F1	section	code abs=0x2164F1

; [code+play] Colla's gem offer: buy prompt, AddItem (colla_offer_*_buy_prompt)
CollaBuy:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CollaBuy.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	CollaBuy.skip7
CollaBuy.skip:
	bit	5,A
	jr	Z,CollaBuy.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	jr	CollaBuy.skip7
CollaBuy.skip2:
	and	A,0xF
	jr	Z,CollaBuy.skip6
	cp	A,4
	jr	NZ,CollaBuy.skip4
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CollaBuy.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	CollaBuy.skip6
CollaBuy.skip3:
	jr	CollaBuy.skip6
CollaBuy.skip4:
	cp	A,8
	jr	NZ,CollaBuy.skip6
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,CollaBuy.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	CollaBuy.skip6
CollaBuy.skip5:
	jr	CollaBuy.skip6
CollaBuy.skip6:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x30
	add	WA,0x20
	ld	BC,WA
	ld	DE,0x84
	call	DrawMenuCursor
	jrl	CollaBuy.done
CollaBuy.skip7:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CollaBuy.skip8
	ld	A,0x21
	jrl	CollaBuy.skip11
CollaBuy.skip8:
	push	XWA
	ld	A,(XIZ+0x28)
	extz	WA
	extz	XWA
	mul	XWA,5
	ld	XHL,XWA
	ld	A,(XIZ+0x29)
	extz	WA
	extz	XWA
	add	XWA,XHL
	mul	XWA,4
	ld	XHL,CollaPrices
	add	XHL,XWA
	ld	XHL,(XHL)
	pop	XWA
	ld	XBC,XHL
	ld	XWA,(wGP)
	call	SubBCD
	jr	NC,CollaBuy.skip9
	ld	A,0x22
	jr	CollaBuy.skip11
CollaBuy.skip9:
	push	XHL
	ld	A,(XIZ+0x28)
	extz	WA
	extz	XWA
	ld	XHL,CollaItems
	add	XHL,XWA
	ld	A,(XHL)
	extz	WA
	pop	XHL
	call	AddItem
	jr	NC,CollaBuy.skip10
	ld	A,0x23
	jr	CollaBuy.skip11
CollaBuy.skip10:
	push	XWA
	ld	A,(XIZ+0x28)
	extz	WA
	extz	XWA
	mul	XWA,5
	ld	XHL,XWA
	ld	A,(XIZ+0x29)
	extz	WA
	extz	XWA
	add	XWA,XHL
	mul	XWA,4
	ld	XHL,CollaPrices
	add	XHL,XWA
	ld	XHL,(XHL)
	pop	XWA
	ld	XBC,XHL
	ld	XWA,(wGP)
	call	SubBCD
	ld	(wGP),XWA
	call	DrawGPBox3
	ld	A,0x20
	jr	CollaBuy.skip11
CollaBuy.skip11:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
CollaBuy.done:
	ret

c_216619	section	code abs=0x216619

; [code] town place task state 0xA: switch on +0x27: 1 ShowCollaOffer, 2 CollaOfferWait, 3 DrawCollaBuyPrompt, 4 CollaBuy; +0x2D += 1; [play] colla_offer_*_buy_prompt
CollaTalkDispatch:
	ld	A,(XIZ+0x27)
	cp	A,1
	jr	NZ,CollaTalkDispatch.skip
	calr	ShowCollaOffer
	jr	CollaTalkDispatch.skip4
CollaTalkDispatch.skip:
	cp	A,2
	jr	NZ,CollaTalkDispatch.skip2
	calr	CollaOfferWait
	jr	CollaTalkDispatch.skip4
CollaTalkDispatch.skip2:
	cp	A,3
	jr	NZ,CollaTalkDispatch.skip3
	calr	DrawCollaBuyPrompt
	jr	CollaTalkDispatch.skip4
CollaTalkDispatch.skip3:
	cp	A,4
	jr	NZ,CollaTalkDispatch.skip4
	calr	CollaBuy
	jr	CollaTalkDispatch.skip4
CollaTalkDispatch.skip4:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ret

c_216649	section	code abs=0x216649

; [code+play] post-game thank-you: gift from TetisGifts by autograph count and gender, then removes the autographs
TetisGift:
	push	W
	ld	WA,0xFF
	call	GetInventoryByte
	pop	W
	dec	1,A
	sll	1,A
	ld	W,A
	call	IsPlayerMale
	xor	A,1
	add	A,W
	extz	WA
	extz	XWA
	ld	XHL,TetisGiftIndex
	add	XHL,XWA
	ld	A,(XHL)
	push	A
	add	A,0x54
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	calr	ResetTalkRowPhase
	pop	A
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XHL,TetisGifts
	add	XHL,XWA
	ld	WA,(XHL)
	call	AddItem
	jr	C,TetisGift.done
	push	W
	ld	WA,0xFF
	call	GetInventoryByte
	pop	W
	ld	C,A
TetisGift.loop:
	ld	WA,0xFF
	push	C
	call	RemoveItem
	pop	C
	djnz	C,TetisGift.loop
TetisGift.done:
	ret

c_216849	section	code abs=0x216849

; [code] WA = 0x13C; every caller passes it as the first tile to DrawPortraitAt (talk speaker: DrawTalkSpeakerPortrait, TalkShowRow1Picture; DrawArenaParticipants)
GetPortraitFirstTile:
	ld	WA,0x13C
	ret

c_21684D	section	code abs=0x21684D

swp_21684D:
	ld	WA,0x46
	ret

c_216851	section	code abs=0x216851

; [code] A = box, XHL = packed BCD, C = digit count: DrawBoxString of BcdDigitTexts[digit] per digit, most significant first; leading zeros use entry digit + 0xA (all but the last digit); registers saved; callers DrawGPBox3, ShowCollaOffer, DrawStatusLabel, DrawDungeonStatus
DrawBcdDigits:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	E,C
	ld	B,A
DrawBcdDigits.loop:
	srl	1,XHL
	rr	1,A
	srl	1,XHL
	rr	1,A
	srl	1,XHL
	rr	1,A
	srl	1,XHL
	rr	1,A
	srl	4,A
	push	A
	djnz	C,DrawBcdDigits.loop
	ld	W,0xA
	ld	C,E
DrawBcdDigits.loop2:
	pop	A
	cp	A,0
	jr	NZ,DrawBcdDigits.skip
	cp	C,1
	jr	NZ,DrawBcdDigits.skip2
DrawBcdDigits.skip:
	ld	W,0
DrawBcdDigits.skip2:
	add	A,W
	push	BC
	push	W
	extz	WA
	extz	XWA
	mul	XWA,2
	ld	XHL,BcdDigitTexts
	add	XHL,XWA
	ld	A,B
	call	DrawBoxString
	pop	W
	pop	BC
	djnz	C,DrawBcdDigits.loop2
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2168AC	section	code abs=0x2168AC

; [code] ClearTextBox 3, then DrawBcdDigits draws XHL = (wGP) as C = 6 BCD digits (glyph strings 0x24A1FC) in box 3, registers saved; callers CollaBuy, ShowCollaOffer, ShowArenaRankList (arena entry cost)
DrawGPBox3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	ClearTextBox
	ld	XHL,(wGP)
	ld	C,6
	ld	A,3
	call	DrawBcdDigits
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
