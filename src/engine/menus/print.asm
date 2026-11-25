; engine/menus/print.asm: string and number printing into text boxes: strings at a cell, string tables, decimal / hex / padded numbers, the GP display

c_2171AD	section	code abs=0x2171AD

; [code] A = number of bytes before the 0xFF at XHL
StringLength:
	xor	A,A
StringLength.loop:
	cpb	(XHL+),0xFF
	ret	Z
	inc	1,A
	jr	StringLength.loop

c_2171B9	section	code abs=0x2171B9

; [code] A = box, B = column, C = row, L = character: SetTextBoxCursor, DrawTextCharInBox
DrawCharAt:
	push	WA
	push	HL
	ld	E,C
	ld	C,B
	call	SetTextBoxCursor
	pop	HL
	pop	WA
	call	DrawTextCharInBox
	ret

c_2171CA	section	code abs=0x2171CA

; [code] A = box, XHL = string: DrawTextCharInBox for each byte up to 0xFF
PrintString:
	ld	XBC,XHL
PrintString.loop:
	ld	L,(XBC+)
	cp	L,0xFF
	jr	Z,PrintString.done
	push	XBC
	push	WA
	call	DrawTextCharInBox
	pop	WA
	pop	XBC
	jr	PrintString.loop
PrintString.done:
	ret

c_2171DF	section	code abs=0x2171DF

; [code] A = box, B = column, C = row, XHL = string: SetTextBoxCursor, PrintString
PrintStringAt:
	push	WA
	push	XHL
	ld	E,C
	ld	C,B
	call	SetTextBoxCursor
	pop	XHL
	pop	WA
	call	PrintString
	ret

c_2171F0	section	code abs=0x2171F0

; [code] XHL = table of 6-byte entries (u8 column, u8 row, u32 string): PrintStringAt with entry B
PrintStringTableEntry:
	ld	C,6
	mul	BC,B
	lda	XDE,XHL+BC
	ld	B,(XDE+)
	ld	C,(XDE+)
	ld	XHL,(XDE+)
	call	PrintStringAt
	ret

c_217207	section	code abs=0x217207

; [code] PrintStringTableEntry for entries 0 .. B-1 of the table at XHL (box A)
PrintStringTable:
	ld	C,B
	xor	B,B
PrintStringTable.loop:
	cp	B,C
	jr	NC,PrintStringTable.done
	push	BC
	push	WA
	push	XHL
	call	PrintStringTableEntry
	pop	XHL
	pop	WA
	pop	BC
	inc	1,B
	jr	PrintStringTable.loop
PrintStringTable.done:
	ret

c_217299	section	code abs=0x217299

; [code] PrintByteDecimal with leading blanks (fill index 0x10 of HexDigitChars = 0x00)
PrintByteBlanks:
	ld	QC,0x10
	jr	PrintByteDecimal

c_21729F	section	code abs=0x21729F

; [code] the PrintByteDecimal loop entered after its extz DE (PrintByteDecimal.skip3): the whole word DE, leading zeros
PrintWordZeros:
	ld	QC,0
	ld	QB,1
	jr	PrintByteDecimal.skip3

c_2172A7	section	code abs=0x2172A7

; [code] PrintByteDecimal with leading zeros (fill index 0 = "0")
PrintByteZeros:
	ld	QC,0

c_2172AA	section	code abs=0x2172AA

; [code] A = box, B = column, W = digits, E = number (extz DE: the low byte), QC = fill (0x10 blank, 0 zero): right-aligned decimal through DrawCharAt with the digit table HexDigitChars; the units digit always printed
PrintByteDecimal:
	ld	QB,1
	extz	DE
PrintByteDecimal.skip3:
	add	B,W
	dec	1,B
PrintByteDecimal.loop:
	rlc	16,XBC
	push	WA
	ld	WA,DE
	extz	XWA
	div	XWA,0xA
	ld	DE,WA
	srl	16,XWA
	cp	WA,0
	jr	NZ,PrintByteDecimal.skip
	or	B,B
	jr	NZ,PrintByteDecimal.skip
	ld	WA,BC
PrintByteDecimal.skip:
	or	DE,DE
	jr	NZ,PrintByteDecimal.skip2
	xor	B,B
PrintByteDecimal.skip2:
	ld	XHL,HexDigitChars
	ld	L,(XHL+WA)
	pop	WA
	rlc	16,XBC
	push	XBC
	push	DE
	push	WA
	call	DrawCharAt
	pop	WA
	pop	DE
	pop	XBC
	dec	1,B
	djnz	W,PrintByteDecimal.loop
	ret

c_217303	section	code abs=0x217303

; [code] PrintHex with leading blanks (QC = 0x10)
PrintHexBlanks:
	ld	QC,0x10
	jr	PrintHex

c_217309	section	code abs=0x217309

; [code] PrintHex with leading zeros (QC = 0)
PrintHexZeros:
	ld	QC,0

c_21730C	section	code abs=0x21730C

; [code] like PrintByteDecimal but base 16 on all of XDE (and 0xF, srl 4), digits from HexDigitChars; DrawGP's PrintShownGP prints the packed-BCD GP this way
PrintHex:
	ld	QB,1
	add	B,W
	dec	1,B
PrintHex.loop:
	rlc	16,XBC
	push	WA
	ld	WA,DE
	and	WA,0xF
	srl	4,XDE
	cp	WA,0
	jr	NZ,PrintHex.skip
	or	B,B
	jr	NZ,PrintHex.skip
	ld	WA,BC
PrintHex.skip:
	or	XDE,XDE
	jr	NZ,PrintHex.skip2
	xor	B,B
PrintHex.skip2:
	ld	XHL,HexDigitChars
	ld	L,(XHL+WA)
	pop	WA
	rlc	16,XBC
	push	XBC
	push	XDE
	push	WA
	call	DrawCharAt
	pop	WA
	pop	XDE
	pop	XBC
	dec	1,B
	djnz	W,PrintHex.loop
	ret

c_21735D	section	code abs=0x21735D

; [code] PrintStringAt XHL, then B += StringLength and PrintStringAt of BlankText2 + 2 * length (the six 0 bytes + 0xFF after the ret: 6 - 2 * length blanks, so it only lands on the blanks up to 3 chars); no callers
swp_21735D:
	push	WA
	push	BC
	push	XHL
	call	PrintStringAt
	pop	XHL
	call	StringLength
	pop	BC
	add	B,A
	sll	1,A
	ld	XHL,BlankText2
	lda	XHL,XHL+A
	pop	WA
	call	PrintStringAt
	ret
BlankText2:
	db	0x00,0x00,0x00,0x00,0x00,0x00,0xFF	; "      "

c_218939	section	code abs=0x218939

; [code] wGP -> wShownGP (StoreShownGP), drawn as 6 BCD digits (PrintShownGP)
DrawGP:
	call	StoreShownGP
	call	PrintShownGP
	ret

c_218942	section	code abs=0x218942

; [code] wShownGP = wGP (DrawGP)
StoreShownGP:
	ld	XWA,(wGP)
	ld	(wShownGP),XWA
	ret

c_21894B	section	code abs=0x21894B

; [code] wShownGP as 6 BCD digits (PrintHexBlanks, WA = 0x604) at 0,0 of box 4 (DrawGP)
PrintShownGP:
	ld	XDE,(wShownGP)
	ld	BC,0
	ld	WA,0x604
	call	PrintHexBlanks
	ret
EPText3:
	db	0x25,0x30,0xFF	; "EP"
