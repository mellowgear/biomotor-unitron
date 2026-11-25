; engine/text.asm: font glyphs, the text boxes (wTextBoxes: open / place / erase / clear, cursor, state queries, speed, the box cursor sprite) and their text stream with control codes, the Box1/2/3 wrappers, DrawString, message expansion

c_207073	section	code abs=0x207073

; L = character code -> XHL = glyph in Font
GetFontGlyph:
	or	L,L
	jr	Z,GetFontGlyph.skip
	extz	HL
	dec	1,HL
	cp	HL,(Font)
	jr	NC,GetFontGlyph.skip
	mul	XHL,0x10
	add	XHL,Font+2
	ret
GetFontGlyph.skip:
	ld	XHL,BlankGlyph
	ret

c_2072CD	section	code abs=0x2072CD

; [code] text box tiles 0x2C8569, TextBoxPal/TextBoxMonoPal, all 8 wTextBoxes reset (speed = wOptionMessageSpeed)
InitTextBoxes:
	ld	WA,1
	ld	XHL,RawTiles_2C8569
	call	LoadRawTiles
	ld	A,1
	ld	C,1
	ld	XHL,TextBoxMonoPal
	call	LoadMonoPalettes
	ld	A,3
	ld	C,1
	ld	XHL,TextBoxMonoPal
	call	LoadMonoPalettes
	ld	A,5
	ld	C,1
	ld	XHL,TextBoxMonoPal
	call	LoadMonoPalettes
	ld	A,0xF
	ld	C,1
	ld	XHL,TextBoxPal
	call	LoadPalettes
	ld	A,0x1F
	ld	C,1
	ld	XHL,TextBoxPal
	call	LoadPalettes
	ld	A,0x2F
	ld	C,1
	ld	XHL,TextBoxPal
	call	LoadPalettes
	ld	A,8
	ld	XHL,wTextBoxes
	ld	XDE,0
InitTextBoxes.loop:
	ldw	(XHL+0),0x200
	ldb	(XHL+2),0x20
	ldb	(XHL+3),0x20
	ld	(XHL+4),E
	ld	(XHL+5),E
	ld	(XHL+6),E
	ld	(XHL+7),E
	ld	(XHL+8),XDE
	ld	(XHL+0xC),XDE
	ldb	(XHL+0x10),(wOptionMessageSpeed)
	ld	(XHL+0x11),E
	ld	(XHL+0x12),E
	add	HL,0x13
	djnz	A,InitTextBoxes.loop
	ret

c_207361	section	code abs=0x207361

; [code] main loop (Reset, after ReadJoypad): for boxes 0-7 with a text pointer (+8) runs the +0x12 state handler from the table at TextBoxStateJumps (TextStep, TextDelayTick, TextWaitButton), then reloads tile 0xB from 0x2C83B9 or 0x2C83CB by bit 3 of wFrameCounter (the blinking tile)
UpdateTextBoxes:
	ld	A,0
UpdateTextBoxes.loop:
	push	A
	call	GetTextBox
	ld	XBC,(XWA+8)
	or	XBC,XBC
	jr	Z,UpdateTextBoxes.skip
	ld	XHL,0
	ld	L,(XWA+0x12)
	sll	2,L
	add	XHL,TextBoxStateJumps
	ld	XHL,(XHL)
	call	XHL
UpdateTextBoxes.skip:
	pop	A
	inc	1,A
	cp	A,8
	jr	C,UpdateTextBoxes.loop
	ld	A,(wFrameCounter)
	srl	3,A
	and	A,1
	ld	XHL,RawTiles_2C83B9
	jr	Z,UpdateTextBoxes.skip2
	ld	XHL,RawTiles_2C83CB
UpdateTextBoxes.skip2:
	ld	WA,0xB
	call	LoadRawTiles
	ret
TextBoxStateJumps:
	dl	TextStep,TextDelayTick,TextWaitButton

c_2073B3	section	code abs=0x2073B3

; one byte of the text stream at window+8
TextStep:
	ld	XBC,(XWA+8)
	or	XBC,XBC
	ret	Z
	ld	L,(XBC+)
	ld	(XWA+8),XBC
	cp	L,0xF0
	jr	NC,TextControlCode
	call	DrawTextChar
	ld	L,(XWA+0x10)
	ld	(XWA+0x11),L
	or	L,L
	jr	Z,TextStep
	incb	1,(XWA+0x12)
	ret

c_2073D7	section	code abs=0x2073D7

; [code] TextStep for codes >= 0xF0: calls entry ~code of the table at TextControlJumps (TextCmd_End, TextCmd_Newline, TextCmd_Page, TextCmd_PlayerName, TextCmd_Name2, TextCmd_Wait), then continues TextStep unless the state +0x12 is set
TextControlCode:
	cpl	L
	extz	HL
	extz	XHL
	sll	2,XHL
	add	XHL,TextControlJumps
	ld	XHL,(XHL)
	call	XHL
	ld	L,(XWA+0x12)
	and	L,0x7F
	ret	NZ
	jr	TextStep
TextControlJumps:
	dl	TextCmd_End,TextCmd_Newline,TextCmd_Page,TextCmd_PlayerName
	dl	TextCmd_Name2,TextCmd_Wait

c_20740C	section	code abs=0x20740C

; FF
TextCmd_End:
	ld	XHL,(XWA+0xC)
	ld	(XWA+8),XHL
	ld	XHL,0
	ld	(XWA+0xC),XHL
	ret

c_207418	section	code abs=0x207418

; FC: inserts the string at 0x5013
TextCmd_PlayerName:
	ld	XHL,(XWA+8)
	ld	(XWA+0xC),XHL
	ld	XHL,wPlayerName
	ld	(XWA+8),XHL
	ret

c_207427	section	code abs=0x207427

; FB: inserts the string at 0x502F
TextCmd_Name2:
	ld	XHL,(XWA+8)
	ld	(XWA+0xC),XHL
	ld	XHL,wPartnerName
	ld	(XWA+8),XHL
	ret

c_207436	section	code abs=0x207436

; FA
TextCmd_Wait:
	incb	2,(XWA+0x12)
	ret

c_20743A	section	code abs=0x20743A

; [code] text box state 1 (table TextBoxStateJumps in UpdateTextBoxes): counts +0x11 down, then back to state 0 (TextStep)
TextDelayTick:
	decb	1,(XWA+0x11)
	ret	NZ
	decb	1,(XWA+0x12)
	ret

c_207443	section	code abs=0x207443

; [code] text box state 2 (TextCmd_Wait adds 2): puts tile 0x3E0B at the box's bottom-right frame cell; on A or B (wJoyPressed & 0x30) state -= 2 and the cell back to frame tile 0x3E09
TextWaitButton:
	ld	C,(XWA+2)
	add	C,(XWA+4)
	dec	2,C
	ld	E,(XWA+3)
	add	E,(XWA+5)
	dec	1,E
	ld	B,1
	ld	D,1
	push	XWA
	ld	WA,0x3E0B
	call	FillScrRect
	pop	XWA
	ld	L,(wJoyPressed)
	and	L,0x30
	ret	Z
	decb	2,(XWA+0x12)
	ld	C,(XWA+2)
	add	C,(XWA+4)
	dec	2,C
	ld	E,(XWA+3)
	add	E,(XWA+5)
	dec	1,E
	ld	B,1
	ld	D,1
	push	XWA
	ld	WA,0x3E09
	call	FillScrRect
	pop	XWA
	ret

c_20748A	section	code abs=0x20748A

; A = box number -> XWA = wTextBoxes + 0x13*A
GetTextBox:
	mul	WA,0x13
	add	WA,0x5CE3
	extz	XWA
	ret

c_207494	section	code abs=0x207494

; [code] like OpenTextBoxNoWait, +0x12 = 0, then TextCmd_Page
OpenTextBox:
	call	GetTextBox
	ld	(XWA+0),HL
	ld	(XWA+4),C
	ld	(XWA+5),E
	ldb	(XWA+0x12),0
	call	TextCmd_Page
	ret

c_2074AA	section	code abs=0x2074AA

; [code] text box with bit 7 set in +0x12, then TextCmd_Page
OpenTextBoxNoWait:
	call	GetTextBox
	ld	(XWA+0),HL
	ld	(XWA+4),C
	ld	(XWA+5),E
	ldb	(XWA+0x12),0x80
	call	TextCmd_Page
	ret

c_207598	section	code abs=0x207598

; [code] A = box: clears the text pointers +8/+0xC, fills the box's screen rectangle (+2..+5) with tile 0 (FillScrRect), reloads speed +0x10 from wOptionMessageSpeed, +0x11/+0x12 = 0; EraseTextBox3 is this for box 3
EraseTextBox:
	call	GetTextBox
	ld	XHL,0
	ld	(XWA+8),XHL
	ld	(XWA+0xC),XHL
	ld	C,(XWA+2)
	ld	E,(XWA+3)
	ld	B,(XWA+4)
	ld	D,(XWA+5)
	push	XWA
	ld	WA,0
	call	FillScrRect
	pop	XWA
	ld	XDE,0
	ld	(XWA+8),XDE
	ld	(XWA+0xC),XDE
	ldb	(XWA+0x10),(wOptionMessageSpeed)
	ld	(XWA+0x11),E
	ld	(XWA+0x12),E
	ret

c_2075CC	section	code abs=0x2075CC

; [code] A = box: GetTextBox, then TextCmd_Page (clear, cursor 0,0)
ClearTextBox:
	call	GetTextBox

c_2075D0	section	code abs=0x2075D0

; FD
TextCmd_Page:
	bit	7,(XWA+0x12)
	jr	NZ,TextCmd_Page.skip
	ldb	(XWA+6),0
	ldb	(XWA+7),0
	ld	C,(XWA+4)
	ld	B,(XWA+5)
	dec	2,C
	dec	2,B
	mul	BC,B
	push	XWA
	ld	WA,(XWA+0)
	ld	QA,1
	call	FillTiles
	pop	XWA
	ret
TextCmd_Page.skip:
	ldb	(XWA+6),0
	ldb	(XWA+7),0
	ld	C,(XWA+4)
	mul	BC,(XWA+5)
	push	XWA
	ld	WA,(XWA+0)
	ld	QA,1
	call	FillTiles
	pop	XWA
	ret

c_207611	section	code abs=0x207611

; [code] A = box: clears the text pointers +8/+0xC and state +0x12, speed +0x10 = wOptionMessageSpeed, delay +0x11 = 0 (no screen change, unlike EraseTextBox)
ResetTextBox:
	call	GetTextBox
	ld	XHL,0
	ld	(XWA+8),XHL
	ld	(XWA+0xC),XHL
	ld	(XWA+0x12),L
	ldb	(XWA+0x10),(wOptionMessageSpeed)
	ld	(XWA+0x11),L
	ret

c_207629	section	code abs=0x207629

; [code] A = box: GetTextBox, then falls into AdvanceTextCursorXWA
AdvanceTextCursor:
	call	GetTextBox

c_20762D	section	code abs=0x20762D

; [code] DrawTextChar after each glyph: cursor column +6 += 1; at the inner width (+4 - 2, or +4 for frameless boxes, bit 7 of +0x12) a newline (TextCmd_Newline / TextNewlineNoFrame)
AdvanceTextCursorXWA:
	bit	7,(XWA+0x12)
	jr	NZ,AdvanceTextCursorXWA.skip
	incb	1,(XWA+6)
	ld	B,(XWA+4)
	dec	2,B
	cp	(XWA+6),B
	ret	C
	call	TextCmd_Newline
	ret
AdvanceTextCursorXWA.skip:
	incb	1,(XWA+6)
	ld	B,(XWA+4)
	cp	(XWA+6),B
	ret	C
	calr	TextNewlineNoFrame
	ret

c_207653	section	code abs=0x207653

; [code] A = box: GetTextBox, then falls into TextCmd_Newline
TextNewline:
	call	GetTextBox

c_207657	section	code abs=0x207657

; FE
TextCmd_Newline:
	bit	7,(XWA+0x12)
	jr	NZ,TextNewlineNoFrame
	ldb	(XWA+6),0
	incb	1,(XWA+7)
	ld	B,(XWA+5)
	dec	2,B
	cp	(XWA+7),B
	ret	C
	dec	1,B
	ld	(XWA+7),B
	rcf
	ret

c_207674	section	code abs=0x207674

; [code] TextCmd_Newline for frameless boxes (bit 7 of +0x12): column +6 = 0, row +7 += 1, clamped to height +5 - 1
TextNewlineNoFrame:
	ldb	(XWA+6),0
	incb	1,(XWA+7)
	ld	B,(XWA+5)
	cp	(XWA+7),B
	ret	C
	dec	1,B
	ld	(XWA+7),B
	rcf
	ret

c_20768A	section	code abs=0x20768A

; [code] A = box: GetTextBox, then falls into SetTextBoxCursorXWA (cursor column +6 = C, row +7 = E)
SetTextBoxCursor:
	call	GetTextBox

c_20768E	section	code abs=0x20768E

; [code] XWA = box: cursor column +6 = C, row +7 = E (the fields TextCmd_Page zeroes and DrawTextChar advances)
SetTextBoxCursorXWA:
	ld	(XWA+6),C
	ld	(XWA+7),E
	ret

c_207695	section	code abs=0x207695

; [code] A = box: GetTextBox, then falls into DrawTextChar (L = character)
DrawTextCharInBox:
	call	GetTextBox

c_207699	section	code abs=0x207699

DrawTextChar:
	cp	L,0xF0
	jr	NC,DrawTextChar.skip
	call	GetTextCursorTile
	call	GetFontGlyph
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	call	AdvanceTextCursorXWA
	rcf
	ret
DrawTextChar.skip:
	cpl	L
	extz	HL
	extz	XHL
	sll	2,XHL
	add	XHL,DrawTextCharJumps
	ld	XHL,(XHL)
	call	XHL
	scf
	ret
DrawTextCharJumps:
	dl	TextCmd_Nop,TextCmd_Newline,TextCmd_Page,DrawPlayerName
	dl	DrawPartnerName,TextCmd_Nop

c_2076DE	section	code abs=0x2076DE

; [code] ret: DrawTextCharJumps entries 0 and 5 (control codes that draw nothing) (was swp_2076DE)
TextCmd_Nop:
	ret

c_2076DF	section	code abs=0x2076DF

; [code] DrawString wPlayerName
DrawPlayerName:
	ld	XHL,wPlayerName
	call	DrawString
	ret

c_2076E9	section	code abs=0x2076E9

; [code] DrawString wPartnerName
DrawPartnerName:
	ld	XHL,wPartnerName
	call	DrawString
	ret

c_2076F3	section	code abs=0x2076F3

; [code] A = box, XHL = 0xFF-terminated string: DrawTextChar per byte
DrawBoxString:
	call	GetTextBox

c_2076F7	section	code abs=0x2076F7

; [code] DrawBoxString with XWA = the box already
DrawString:
	ld	XBC,XHL
DrawString.loop:
	ld	XHL,0
	ld	L,(XBC+)
	cp	L,0xFF
	ret	Z
	push	XBC
	call	DrawTextChar
	pop	XBC
	jr	DrawString.loop

c_2084F2	section	code abs=0x2084F2

; XHL = message: expand it, start it in text box 0
ShowMessage:
	ld	A,0
	call	GetTextBox
	call	ExpandMessage
	ld	(XWA+8),XHL
	ldb	(XWA+0x10),(wOptionMessageSpeed)
	ret

c_208505	section	code abs=0x208505

; copy XHL to wTextBuffer, expanding placeholders 0x90-0xEF
ExpandMessage:
	push	XWA
	push	XBC
	push	XDE
	ld	XDE,wTextBuffer
ExpandMessage.loop:
	ld	A,(XHL+)
	cp	A,0xF0
	jr	NC,ExpandMessage.skip
	cp	A,0x90
	jr	NC,ExpandMessage.skip2
ExpandMessage.skip:
	ld	(XDE+),A
	cp	A,0xFF
	jr	NZ,ExpandMessage.loop
	pop	XDE
	pop	XBC
	pop	XWA
	ld	XHL,wTextBuffer
	ret
ExpandMessage.skip2:
	sub	A,0x90
	ld	XBC,0
	ld	C,A
	sll	2,BC
	add	XBC,MessagePlaceholders
	ld	XBC,(XBC)
	call	XBC
	jr	ExpandMessage.loop

d_208541	section	romdata abs=0x208541
; [code] ExpandMessage: routine per text code 0x90-0xB4 (code - 0x90): <NUM0>-<NUM15>,
; <STR0>-<STR15> (MsgInsertString), <ENEMY>,
; <RIGHTARM>, <LEFTARM>, <SKILL1>, <SKILL2> (src/text/charmap.txt)
MessagePlaceholders:
	dl	MsgInsertNumber,MsgInsertNumber,MsgInsertNumber,MsgInsertNumber
	dl	MsgInsertNumber,MsgInsertNumber,MsgInsertNumber,MsgInsertNumber
	dl	MsgInsertNumber,MsgInsertNumber,MsgInsertNumber,MsgInsertNumber
	dl	MsgInsertNumber,MsgInsertNumber,MsgInsertNumber,MsgInsertNumber
	dl	MsgInsertString,MsgInsertString,MsgInsertString,MsgInsertString
	dl	MsgInsertString,MsgInsertString,MsgInsertString,MsgInsertString
	dl	MsgInsertString,MsgInsertString,MsgInsertString,MsgInsertString
	dl	MsgInsertString,MsgInsertString,MsgInsertString,MsgInsertString
	dl	MsgInsertEnemyName,MsgInsertRightArm,MsgInsertLeftArm,MsgInsertSkill1
	dl	MsgInsertSkill2

c_2085D5	section	code abs=0x2085D5

; <NUM0>-<NUM15>: decimal of argument n (text box +0xE + 2n)
MsgInsertNumber:
	ld	W,0
	sll	1,WA
	add	WA,0xE
	ld	BC,(XIZ+WA)
	push	XHL
	push	XDE
	ld	XHL,wNumberBuffer
MsgInsertNumber.loop:
	extz	XBC
	div	XBC,0xA
	ld	WA,QBC
	add	WA,(MsgDigitZero)
	ld	(XHL+),A
	or	BC,BC
	jr	NZ,MsgInsertNumber.loop
	pop	XDE
MsgInsertNumber.loop2:
	ld	A,(-XHL)
	ld	(XDE+),A
	cp	XHL,0x4100
	jr	GT,MsgInsertNumber.loop2
	pop	XHL
	ret

c_208610	section	code abs=0x208610

; [code] MsgInsertNumber adds the word here to each digit and stores its low byte: 0x41 = "0"
; (src/text/charmap.txt); the high byte read with it is MsgInsertString's first opcode
MsgDigitZero:
	db	0x41
; <STR0>-<STR15>: copies string argument n (pointer at text box +0xE + 2n). [code] the
; MessagePlaceholders entries 0x208581-0x2085BD point here; [play] executed at 0x208611 in all runs (D10)
MsgInsertString:
	push	XHL
	ld	W,0
	sub	A,0x10
	sll	1,WA
	add	WA,0xE
	ld	XHL,(XIZ+WA)
	calr	CopyString
	pop	XHL
	ret

c_208628	section	code abs=0x208628

; <ENEMY>
MsgInsertEnemyName:
	push	XHL
	ld	L,(wEnemyId)
	call	GetEnemyName
	calr	CopyString
	pop	XHL
	ret

c_208636	section	code abs=0x208636

; <RIGHTARM> (B1)
MsgInsertRightArm:
	push	XHL
	ld	L,(wEquipRightArm)
	or	L,L
	jr	Z,MsgInsertRightArm.skip
	call	GetArmName
	calr	CopyString
MsgInsertRightArm.skip:
	pop	XHL
	ret

c_208648	section	code abs=0x208648

; <LEFTARM> (B2)
MsgInsertLeftArm:
	push	XHL
	ld	L,(wEquipLeftArm)
	or	L,L
	jr	Z,MsgInsertLeftArm.skip
	call	GetArmName
	calr	CopyString
MsgInsertLeftArm.skip:
	pop	XHL
	ret

c_20865A	section	code abs=0x20865A

; <SKILL1>
MsgInsertSkill1:
	push	XHL
	ld	L,(wSkill1)
	or	L,L
	jr	Z,MsgInsertSkill1.skip
	call	GetSkillName
	calr	CopyString
MsgInsertSkill1.skip:
	pop	XHL
	ret

c_20866C	section	code abs=0x20866C

; <SKILL2>
MsgInsertSkill2:
	push	XHL
	ld	L,(wSkill2)
	or	L,L
	jr	Z,MsgInsertSkill2.skip
	call	GetSkillName
	calr	CopyString
MsgInsertSkill2.skip:
	pop	XHL
	ret

c_20867E	section	code abs=0x20867E

; [code] copies bytes (XHL+) -> (XDE+) until FF (terminator not copied); used by MsgInsertEnemyName / RightArm / LeftArm / Skill1 / Skill2 and MsgInsertString
CopyString:
	ld	A,(XHL+)
	cp	A,0xFF
	ret	Z
	ld	(XDE+),A
	jr	CopyString

c_2166B3	section	code abs=0x2166B3

; [code] OpenTextBox 1: 0x14 x 5, tiles from 0x10 (registers saved); with PlaceBox1 / EraseBox1 / ClearTextBox1
OpenBox1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x10
	ld	A,1
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166C9	section	code abs=0x2166C9

; [code] PlaceTextBox 1 at column 0, row 0x2E (registers saved)
PlaceBox1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	C,0
	ld	E,0x2E
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166DC	section	code abs=0x2166DC

; [code] EraseTextBox 1 (registers saved); byte-identical copy of EraseWorldMapNameBox, EraseAreaNameBox (the ROM has each)
EraseBox1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166EB	section	code abs=0x2166EB

; [code] whole body = A=1, call ClearTextBox, all registers (XWA/XBC/XDE/XHL) saved; called directly from arena.asm x4 and town.asm x5
ClearTextBox1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2166FA	section	code abs=0x2166FA

; [code] OpenTextBox 2: 8 x 0xE, tiles from 0x46 (registers saved); paired in OpenBoxes1And2Tall; a copy of OpenBox2 that differs only in the height (0xE, OpenBox2 0xB)
OpenBox2Tall:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x46
	ld	A,2
	ld	C,8
	ld	E,0xE
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216710	section	code abs=0x216710

; [code] PlaceTextBox 2 at column 0xC, row 0x20 (registers saved); paired in PlaceBoxes1And2Tall; byte-identical copy of PlaceBox2 (the ROM has each)
PlaceBox2Tall:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216723	section	code abs=0x216723

; [code] EraseTextBox 2 (registers saved); paired in EraseBoxes1And2Tall; byte-identical copy of EraseWorldMapBox2, EraseDungeonStatusBox, EraseBox2 (the ROM has each)
EraseBox2Tall:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216732	section	code abs=0x216732

; [code] ClearTextBox 2 (registers saved), the copy next to the 8 x 0xE box helpers; byte-identical copy of ClearBox2 (the ROM has each)
ClearBox2Tall:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216741	section	code abs=0x216741

; [code] OpenTextBox 2: 8 x 0xB, tiles from 0x46 (registers saved); OpenBox2Tall is a copy that differs only in the height (0xE)
OpenBox2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x46
	ld	A,2
	ld	C,8
	ld	E,0xB
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216757	section	code abs=0x216757

; [code] PlaceTextBox 2 at column 0xC, row 0x20 (registers saved); byte-identical copy of PlaceBox2Tall (the ROM has each)
PlaceBox2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21676A	section	code abs=0x21676A

; [code] EraseTextBox 2 (registers saved); byte-identical copy of EraseWorldMapBox2, EraseDungeonStatusBox, EraseBox2Tall (the ROM has each)
EraseBox2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216779	section	code abs=0x216779

; [code] ClearTextBox 2 (registers saved); byte-identical copy of ClearBox2Tall (the ROM has each)
ClearBox2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216788	section	code abs=0x216788

; [code] OpenTextBox 3: 8 x 3, tiles from 0x8E (registers saved)
OpenBox3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x8E
	ld	A,3
	ld	C,8
	ld	E,3
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21679E	section	code abs=0x21679E

; [code] PlaceTextBox 3 at column 0xC, row 0x2B (registers saved)
PlaceBox3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	C,0xC
	ld	E,0x2B
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167B1	section	code abs=0x2167B1

; [code] EraseTextBox 3 (registers saved); byte-identical copy of EraseEnterPromptBox, EraseTextBox3 (the ROM has each)
EraseBox3:
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

c_2167C0	section	code abs=0x2167C0

; [code] ClearTextBox 3 (registers saved)
ClearBox3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167CF	section	code abs=0x2167CF

; [code] OpenBox1, OpenBox2, OpenBox3
OpenBoxes123:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	OpenBox1
	call	OpenBox2
	call	OpenBox3
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167E4	section	code abs=0x2167E4

; [code] PlaceBox1, PlaceBox2, PlaceBox3
PlaceBoxes123:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	PlaceBox1
	call	PlaceBox2
	call	PlaceBox3
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2167F9	section	code abs=0x2167F9

; [code] EraseBox1, EraseBox2, EraseBox3
EraseBoxes123:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	EraseBox1
	call	EraseBox2
	call	EraseBox3
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21680E	section	code abs=0x21680E

; [code] OpenBox1, OpenBox2Tall
OpenBoxes1And2Tall:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	OpenBox1
	call	OpenBox2Tall
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21681F	section	code abs=0x21681F

; [code] PlaceBox1, PlaceBox2Tall
PlaceBoxes1And2Tall:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	PlaceBox1
	call	PlaceBox2Tall
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216830	section	code abs=0x216830

; [code] EraseBox1, EraseBox2Tall
EraseBoxes1And2Tall:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	EraseBox1
	call	EraseBox2Tall
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_216841	section	code abs=0x216841

; [code] WA = 0x1E4: the first tile OpenArenaBox4 gives text box 4 (its only caller)
GetArenaBox4Tile:
	ld	WA,0x1E4
	ret

c_21721E	section	code abs=0x21721E

; [code] A = box -> B = screen column +2, C = row +3 (both & 0x1F)
GetTextBoxPos:
	call	GetTextBox
	ld	B,(XWA+2)
	ld	C,(XWA+3)
	and	B,0x1F
	and	C,0x1F
	ret

c_21722F	section	code abs=0x21722F

; [code] A = box, B/C = cell in the box: the 1x2 sprite 0x3E04 (DrawSpriteGrid) at pixel 8 * (box column + B) + 2, 8 * (box row + C) + 4; CursorTask draws the list cursor with it
DrawBoxCursorSprite:
	push	BC
	call	GetTextBoxPos
	pop	DE
	add	B,D
	add	C,E
	ld	E,C
	ld	C,B
	extz	BC
	extz	DE
	sll	3,BC
	sll	3,DE
	add	BC,2
	add	DE,4
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	DrawSpriteGrid
	ret

c_21725D	section	code abs=0x21725D

; [code] A = box -> carry when its text pointer +8 is set
IsTextBoxPrinting:
	call	GetTextBox
	ld	XHL,(XWA+8)
	or	XHL,XHL
	ret	Z
	scf
	ret

c_21726A	section	code abs=0x21726A

; [code] A = box -> carry when its state (+0x12 & 0x7F) is 2 (TextWaitButton)
IsTextBoxWaitingButton:
	call	GetTextBox
	ld	A,(XWA+0x12)
	and	A,0x7F
	cp	A,2
	rcf
	ret	NZ
	scf
	ret

c_21727B	section	code abs=0x21727B

; [code] A = box -> carry when its state +0x12 is 1 (TextDelayTick)
IsTextBoxDelaying:
	call	GetTextBox
	ld	A,(XWA+0x12)
	cp	A,1
	rcf
	ret	NZ
	scf
	ret

c_217289	section	code abs=0x217289

; [code] A = box: speed +0x10 = B (0 = whole page at once: TextStep loops while the delay is 0)
SetTextBoxSpeed:
	call	GetTextBox
	ld	(XWA+0x10),B
	ret

c_217291	section	code abs=0x217291

; [code] A = box: text pointer +8 = XHL (starts printing)
SetTextBoxText:
	call	GetTextBox
	ld	(XWA+8),XHL
	ret

c_21734E	section	code abs=0x21734E

; [code] A = box: SetTextBoxCursor 0,0 then ClearTextBox
ClearTextBoxHome:
	push	WA
	ld	E,0
	ld	C,0
	call	SetTextBoxCursor
	pop	WA
	call	ClearTextBox
	ret
