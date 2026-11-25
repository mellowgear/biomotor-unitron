; engine/text: 36 routines (each keeps its ROM address in its own section)

c_207073	section	code abs=0x207073

; L = character code -> XHL = glyph in Font
GetFontGlyph:
	or	L,L
	jr	Z,GetFontGlyph.skip
	extz	HL
	dec	1,HL
	cp	HL,(0x2C8DA7)
	jr	NC,GetFontGlyph.skip
	mul	XHL,0x10
	add	XHL,0x2C8DA9
	ret
GetFontGlyph.skip:
	ld	XHL,BlankGlyph
	ret

c_207093	section	code abs=0x207093

dyn_207093:
	call	GetFontGlyph
	ld	XDE,0
	ld	DE,WA
	sll	4,XDE
	add	XDE,0xA000
	ld	B,8
	ld	WA,(XHL+)
	ld	C,8
	sll	1,XWA
	bit	0,QA
	zcf
	rl	1,QWA
	sll	1,WA
	djnz	C,0x2070AB
	ld	WA,QWA
	ld	(XDE+),WA
	djnz	B,0x2070A6
	ret

c_207361	section	code abs=0x207361

sub_207361:
	ld	A,0
sub_207361.loop:
	push	A
	call	GetTextBox
	ld	XBC,(XWA+8)
	or	XBC,XBC
	jr	Z,sub_207361.skip
	ld	XHL,0
	ld	L,(XWA+0x12)
	sll	2,L
	add	XHL,0x2073A7
	ld	XHL,(XHL)
	call	XHL
sub_207361.skip:
	pop	A
	inc	1,A
	cp	A,8
	jr	C,sub_207361.loop
	ld	A,(wFrameCounter)
	srl	3,A
	and	A,1
	ld	XHL,RawTiles_2C83B9
	jr	Z,sub_207361.skip2
	ld	XHL,RawTiles_2C83CB
sub_207361.skip2:
	ld	WA,0xB
	call	LoadRawTiles
	ret
	db	0xB3,0x73,0x20,0x00,0x3A,0x74,0x20,0x00,0x43,0x74,0x20,0x00

c_2073B3	section	code abs=0x2073B3

; one byte of the text stream at window+8
TextStep:
	ld	XBC,(XWA+8)
	or	XBC,XBC
	ret	Z
	ld	L,(XBC+)
	ld	(XWA+8),XBC
	cp	L,0xF0
	jr	NC,dyn_2073D7
	call	DrawTextChar
	ld	L,(XWA+0x10)
	ld	(XWA+0x11),L
	or	L,L
	jr	Z,TextStep
	incb	1,(XWA+0x12)
	ret

c_2073D7	section	code abs=0x2073D7

dyn_2073D7:
	cpl	L
	extz	HL
	extz	XHL
	sll	2,XHL
	add	XHL,0x2073F4
	ld	XHL,(XHL)
	call	XHL
	ld	L,(XWA+0x12)
	and	L,0x7F
	ret	NZ
	jr	TextStep
	db	0x0C,0x74,0x20,0x00,0x57,0x76,0x20,0x00,0xD0,0x75,0x20,0x00,0x18,0x74,0x20,0x00
	db	0x27,0x74,0x20,0x00,0x36,0x74,0x20,0x00

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

dyn_20743A:
	decb	1,(XWA+0x11)
	ret	NZ
	decb	1,(XWA+0x12)
	ret

c_207443	section	code abs=0x207443

dyn_207443:
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
	call	sub_206768
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
	call	sub_206768
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

c_2074C0	section	code abs=0x2074C0

; [code] A = box, C = column, E = row: frame tiles + the box's tile grid into SCR1 (no frame if bit 7)
PlaceTextBox:
	call	GetTextBox

c_2074C4	section	code abs=0x2074C4

; [code] PlaceTextBox with XWA = the box already
PlaceTextBoxXWA:
	bit	7,(XWA+0x12)
	jrl	NZ,dyn_207559
	ld	(XWA+2),C
	ld	(XWA+3),E
	ld	XHL,0
	ld	H,E
	srl	2,HL
	ld	B,0
	sll	1,BC
	add	HL,BC
	add	HL,0x9000
	ld	D,(XWA+5)
	dec	1,D
	ld	E,0
	srl	2,DE
	ldw	(XHL),0x3E01
	ldw	(XHL+DE),0x3E03
	ld	B,(XWA+4)
	dec	2,B
	ld	C,2
	inc	2,DE
	ldw	(XHL+C),0x3E07
	ldw	(XHL+DE),0x3E09
	inc	2,C
	inc	2,DE
	djnz	B,0x207500
	ldw	(XHL+C),0x3E02
	ldw	(XHL+DE),0x3E06
	ld	E,(XWA+5)
	dec	2,E
	ld	QD,E
	ld	DE,(XWA+0)
	or	DE,0x3E00
	add	HL,0x40
	ldw	(XHL),0x3E08
	ld	B,(XWA+4)
	dec	2,B
	ld	C,2
	ld	(XHL+C),DE
	inc	1,DE
	inc	2,C
	djnz	B,0x207541
	ldw	(XHL+C),0x3E0A
	djnz	QD,0x207532
	ret

c_207559	section	code abs=0x207559

dyn_207559:
	ld	(XWA+2),C
	ld	(XWA+3),E
	ld	XHL,0
	ld	H,E
	srl	2,HL
	ld	B,0
	sll	1,BC
	add	HL,BC
	add	HL,0x9000
	ld	E,(XWA+5)
	ld	QD,E
	ld	DE,(XWA+0)
	or	DE,0x3E00
	ld	B,(XWA+4)
	ld	C,0
	ld	(XHL+C),DE
	inc	1,DE
	inc	2,C
	djnz	B,0x207583
	add	HL,0x40
	djnz	QD,0x20757E
	ret

c_207598	section	code abs=0x207598

sub_207598:
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
	call	sub_206768
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

dyn_207611:
	call	GetTextBox
	ld	XHL,0
	ld	(XWA+8),XHL
	ld	(XWA+0xC),XHL
	ld	(XWA+0x12),L
	ldb	(XWA+0x10),(wOptionMessageSpeed)
	ld	(XWA+0x11),L
	ret

c_207629	section	code abs=0x207629

swp_207629:
	call	GetTextBox

c_20762D	section	code abs=0x20762D

sub_20762D:
	bit	7,(XWA+0x12)
	jr	NZ,sub_20762D.skip
	incb	1,(XWA+6)
	ld	B,(XWA+4)
	dec	2,B
	cp	(XWA+6),B
	ret	C
	call	TextCmd_Newline
	ret
sub_20762D.skip:
	incb	1,(XWA+6)
	ld	B,(XWA+4)
	cp	(XWA+6),B
	ret	C
	calr	sub_207674
	ret

c_207653	section	code abs=0x207653

swp_207653:
	call	GetTextBox

c_207657	section	code abs=0x207657

; FE
TextCmd_Newline:
	bit	7,(XWA+0x12)
	jr	NZ,sub_207674
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

c_207699	section	code abs=0x207699

DrawTextChar:
	cp	L,0xF0
	jr	NC,DrawTextChar.skip
	call	sub_207720
	call	GetFontGlyph
	ld	BC,8
	ldirw	(XDE+),(XHL+)
	call	sub_20762D
	rcf
	ret
DrawTextChar.skip:
	cpl	L
	extz	HL
	extz	XHL
	sll	2,XHL
	add	XHL,0x2076C6
	ld	XHL,(XHL)
	call	XHL
	scf
	ret
	db	0xDE,0x76,0x20,0x00,0x57,0x76,0x20,0x00,0xD0,0x75,0x20,0x00,0xDF,0x76,0x20,0x00
	db	0xE9,0x76,0x20,0x00,0xDE,0x76,0x20,0x00

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
