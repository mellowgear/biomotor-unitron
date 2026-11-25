; engine/menus/shop: 127 routines (each keeps its ROM address in its own section)

c_20768A	section	code abs=0x20768A

sub_20768A:
	call	GetTextBox

c_20768E	section	code abs=0x20768E

sub_20768E:
	ld	(XWA+6),C
	ld	(XWA+7),E
	ret

c_207695	section	code abs=0x207695

swp_207695:
	call	GetTextBox

c_2157D2	section	code abs=0x2157D2

dyn_2157D2:
	ld	XWA,2
	call	PlayMusic
	ld	WA,0x22
	call	SoundCommand
	jr	dyn_2157E1

c_2157E1	section	code abs=0x2157E1

dyn_2157E1:
	jr	0x215821

c_2157E3	section	code abs=0x2157E3

dyn_2157E3:
	ld	W,(XIZ+0x15)
	ld	A,(XIZ+0x12)
	calr	GetTalkRow
	ld	L,(XHL+1)
	extz	HL
	call	dyn_216845
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	call	dyn_2166C9
	ld	A,0
	ld	(XIZ+0x13),A
	ld	XWA,4
	call	PlayMusic
	ld	WA,0x24
	call	SoundCommand
	call	dyn_216E3A
	ld	A,7
	ld	(XIZ+0xF),A
	ld	A,0
	ld	(XIZ+0x2D),A
	ret

c_21717A	section	code abs=0x21717A

swp_21717A:
	jp	XHL

c_21717C	section	code abs=0x21717C

swp_21717C:
	ld	(0x60FE),XWA
	ld	(0x6102),XBC
	ld	XHL,0x60FE
	ld	XDE,0x6102
	ld	B,4
swp_21717C.loop:
	ld	A,(XHL)
	adc	A,(XDE)
	daa	A
	ld	(XHL),A
	inc	1,XHL
	inc	1,XDE
	djnz	B,swp_21717C.loop
	ld	XWA,(0x60FE)
	ld	XBC,(0x6102)
	ret

c_2171A8	section	code abs=0x2171A8

; [code] the caller's return address becomes the task's resume point (TASK_FUNC), back to RunTasks
TaskYield:
	pop	XWA
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_2171AD	section	code abs=0x2171AD

swp_2171AD:
	xor	A,A
swp_2171AD.loop:
	cpb	(XHL+),0xFF
	ret	Z
	inc	1,A
	jr	swp_2171AD.loop

c_2171B9	section	code abs=0x2171B9

swp_2171B9:
	push	WA
	push	HL
	ld	E,C
	ld	C,B
	call	sub_20768A
	pop	HL
	pop	WA
	call	swp_207695
	ret

c_2171CA	section	code abs=0x2171CA

swp_2171CA:
	ld	XBC,XHL
swp_2171CA.loop:
	ld	L,(XBC+)
	cp	L,0xFF
	jr	Z,swp_2171CA.done
	push	XBC
	push	WA
	call	swp_207695
	pop	WA
	pop	XBC
	jr	swp_2171CA.loop
swp_2171CA.done:
	ret

c_2171DF	section	code abs=0x2171DF

swp_2171DF:
	push	WA
	push	XHL
	ld	E,C
	ld	C,B
	call	sub_20768A
	pop	XHL
	pop	WA
	call	swp_2171CA
	ret

c_2171F0	section	code abs=0x2171F0

swp_2171F0:
	ld	C,6
	mul	BC,B
	lda	XDE,XHL+BC
	ld	B,(XDE+)
	ld	C,(XDE+)
	ld	XHL,(XDE+)
	call	swp_2171DF
	ret

c_217207	section	code abs=0x217207

swp_217207:
	ld	C,B
	xor	B,B
swp_217207.loop:
	cp	B,C
	jr	NC,swp_217207.done
	push	BC
	push	WA
	push	XHL
	call	swp_2171F0
	pop	XHL
	pop	WA
	pop	BC
	inc	1,B
	jr	swp_217207.loop
swp_217207.done:
	ret

c_21721E	section	code abs=0x21721E

swp_21721E:
	call	GetTextBox
	ld	B,(XWA+2)
	ld	C,(XWA+3)
	and	B,0x1F
	and	C,0x1F
	ret

c_21722F	section	code abs=0x21722F

swp_21722F:
	push	BC
	call	swp_21721E
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
	call	sub_206BFF
	ret

c_21725D	section	code abs=0x21725D

sub_21725D:
	call	GetTextBox
	ld	XHL,(XWA+8)
	or	XHL,XHL
	ret	Z
	scf
	ret

c_21726A	section	code abs=0x21726A

swp_21726A:
	call	GetTextBox
	ld	A,(XWA+0x12)
	and	A,0x7F
	cp	A,2
	rcf
	ret	NZ
	scf
	ret

c_21727B	section	code abs=0x21727B

swp_21727B:
	call	GetTextBox
	ld	A,(XWA+0x12)
	cp	A,1
	rcf
	ret	NZ
	scf
	ret

c_217289	section	code abs=0x217289

swp_217289:
	call	GetTextBox
	ld	(XWA+0x10),B
	ret

c_217291	section	code abs=0x217291

swp_217291:
	call	GetTextBox
	ld	(XWA+8),XHL
	ret

c_217299	section	code abs=0x217299

swp_217299:
	ld	QC,0x10
	jr	loc_2172AA

c_21729F	section	code abs=0x21729F

swp_21729F:
	ld	QC,0
	ld	QB,1
	jr	0x2172AF

c_2172A7	section	code abs=0x2172A7

swp_2172A7:
	ld	QC,0

c_2172AA	section	code abs=0x2172AA

loc_2172AA:
	ld	QB,1
	extz	DE
	add	B,W
	dec	1,B
loc_2172AA.loop:
	rlc	16,XBC
	push	WA
	ld	WA,DE
	extz	XWA
	div	XWA,0xA
	ld	DE,WA
	srl	16,XWA
	cp	WA,0
	jr	NZ,loc_2172AA.skip
	or	B,B
	jr	NZ,loc_2172AA.skip
	ld	WA,BC
loc_2172AA.skip:
	or	DE,DE
	jr	NZ,loc_2172AA.skip2
	xor	B,B
loc_2172AA.skip2:
	ld	XHL,swp_2172F2
	ld	L,(XHL+WA)
	pop	WA
	rlc	16,XBC
	push	XBC
	push	DE
	push	WA
	call	swp_2171B9
	pop	WA
	pop	DE
	pop	XBC
	dec	1,B
	djnz	W,loc_2172AA.loop
	ret

c_2172F2	section	code abs=0x2172F2

swp_2172F2:
	ld	XBC,0x45444342
	ld	XIZ,0x4A494847
	ld	A,0x22
	ld	C,0x24
	ld	E,0x26
	nop

c_217303	section	code abs=0x217303

sub_217303:
	ld	QC,0x10
	jr	loc_21730C

c_217309	section	code abs=0x217309

swp_217309:
	ld	QC,0

c_21730C	section	code abs=0x21730C

loc_21730C:
	ld	QB,1
	add	B,W
	dec	1,B
loc_21730C.loop:
	rlc	16,XBC
	push	WA
	ld	WA,DE
	and	WA,0xF
	srl	4,XDE
	cp	WA,0
	jr	NZ,loc_21730C.skip
	or	B,B
	jr	NZ,loc_21730C.skip
	ld	WA,BC
loc_21730C.skip:
	or	XDE,XDE
	jr	NZ,loc_21730C.skip2
	xor	B,B
loc_21730C.skip2:
	ld	XHL,swp_2172F2
	ld	L,(XHL+WA)
	pop	WA
	rlc	16,XBC
	push	XBC
	push	XDE
	push	WA
	call	swp_2171B9
	pop	WA
	pop	XDE
	pop	XBC
	dec	1,B
	djnz	W,loc_21730C.loop
	ret

c_21734E	section	code abs=0x21734E

sub_21734E:
	push	WA
	ld	E,0
	ld	C,0
	call	sub_20768A
	pop	WA
	call	ClearTextBox
	ret

c_21735D	section	code abs=0x21735D

swp_21735D:
	push	WA
	push	BC
	push	XHL
	call	swp_2171DF
	pop	XHL
	call	swp_2171AD
	pop	BC
	add	B,A
	sll	1,A
	ld	XHL,0x21737F
	lda	XHL,XHL+A
	pop	WA
	call	swp_2171DF
	ret
	db	0x00,0x00,0x00,0x00,0x00,0x00,0xFF

c_217386	section	code abs=0x217386

loc_217386:
	or	WA,WA
	jp	Z,loc_217427
	call	CheckItemGroupIndex
	jp	NC,loc_217427
	call	ItemGroupToIndex
	call	swp_21B8E4
	ret

c_21739F	section	code abs=0x21739F

sub_21739F:
	cp	W,6
	jr	C,sub_21739F.skip
	sub	W,5
	jp	loc_217386
sub_21739F.skip:
	or	WA,WA
	jp	Z,loc_217427
	call	CheckPartGroupIndex
	jp	NC,loc_217427
	call	PartGroupToIndex
	call	swp_21B987
	ret

c_2174D9	section	code abs=0x2174D9

swp_2174D9:
	call	CheckItemGroupIndex
	ret	NC
	call	ItemGroupToIndex
	call	sub_21B92F
	scf
	ret

c_2174E9	section	code abs=0x2174E9

swp_2174E9:
	cp	W,6
	jr	NC,swp_2174E9.skip
	call	sub_217434
	ret	NC
	ld	XWA,(XHL+0x14)
	scf
	ret
swp_2174E9.skip:
	sub	W,5
	jp	swp_2174D9

c_2174FF	section	code abs=0x2174FF

swp_2174FF:
	call	swp_2174D9
	ret	NC
	call	sub_217517
	scf
	ret

c_21750B	section	code abs=0x21750B

swp_21750B:
	call	swp_2174E9
	ret	NC
	call	sub_217517
	scf
	ret

c_217517	section	code abs=0x217517

sub_217517:
	ld	XBC,XWA
	call	swp_21717C
	call	swp_21717C
	call	swp_21717C
	call	swp_21717C
	srl	4,XWA
	ret

c_217558	section	code abs=0x217558

; [code] GetShopItemTierBy, then carry only when tier != 0 and tier > 0x217571[wArenaRankCopy] (shop_item_stock.txt); swp_21B6AE draws a shop line only with carry
IsShopItemStocked:
	call	GetShopItemTierBy
	ret	NC
	or	A,A
	ret	Z
	ld	W,(wArenaRankCopy)
	ld	XHL,0x217571
	cp	(XHL+W),A
	ret
	db	0x04,0x03,0x03,0x02,0x02,0x01,0x01,0x00,0x00,0x00

c_21757B	section	code abs=0x21757B

; [code] GetShopTier, then the same tier check as IsShopItemStocked (items and parts)
IsShopEntryStocked:
	call	GetShopTier
	jp	0x21755C

c_217634	section	code abs=0x217634

swp_217634:
	pop	XHL
	ld	(0x6128),XHL
swp_217634.loop:
	ld	XHL,(0x6117)
	or	XHL,XHL
	jr	NZ,swp_217634.skip
	ld	A,(0x6115)
	call	sub_21725D
	jr	NC,swp_217634.skip2
swp_217634.skip:
	call	TaskYield
	jr	swp_217634.loop
swp_217634.skip2:
	ld	XHL,(0x6128)
	jp	XHL

c_217657	section	code abs=0x217657

swp_217657:
	pop	XHL
	ld	(0x612C),XHL
	ldb	(0x611C),1
swp_217657.loop:
	ld	XHL,(0x6117)
	or	XHL,XHL
	jr	NZ,swp_217657.skip
	ld	A,(0x6115)
	call	sub_21725D
	jr	NC,swp_217657.skip2
swp_217657.skip:
	call	TaskYield
	jr	swp_217657.loop
swp_217657.skip2:
	ldb	(0x611C),0
	ld	XHL,(0x612C)
	jp	XHL

c_217684	section	code abs=0x217684

swp_217684:
	ld	A,(0x6115)
	call	dyn_207611
	call	swp_217657
	ld	A,(0x6115)
	call	sub_21734E
	ret

c_217699	section	code abs=0x217699

swp_217699:
	ld	A,(0x6115)
	call	swp_2171DF
	ret

c_2176A2	section	code abs=0x2176A2

; [code] draws "Yes No" (0x21774C: 39 05 13 .. 2E 0F), cursor columns 0x217755 (4, 0xA); L -> 0, R -> 1; A returns 0x611E (0 Yes, 1 No), B returns 0xFF, back to the saved return address; [play] *_are_you_sure screens
AskYesNo:
	ld	(0x611F),XHL
	pop	XHL
	ld	(0x6123),XHL
	call	swp_217684
	ld	XHL,(0x611F)
	call	0x21762F
	call	swp_217634
	ld	XHL,0x21774C
	ld	BC,0x402
	call	swp_217699
	ld	A,(0x6115)
	call	swp_2175B6
	call	swp_2175A8
	xor	A,A
	ld	(0x611E),A
AskYesNo.loop:
	ld	XHL,0x217755
	ld	B,(XHL+A)
	ld	C,2
	call	swp_2175BB
AskYesNo.loop2:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,AskYesNo.skip4
	bit	5,A
	jr	NZ,AskYesNo.skip5
	bit	2,A
	jr	NZ,AskYesNo.skip
	bit	3,A
	jr	NZ,AskYesNo.skip2
	jr	AskYesNo.loop2
AskYesNo.skip:
	ld	A,0
	jr	AskYesNo.skip3
AskYesNo.skip2:
	ld	A,1
AskYesNo.skip3:
	cp	(0x611E),A
	jr	Z,AskYesNo.loop2
	ld	(0x611E),A
	ld	WA,0x80
	call	CallSoundCommand
	ld	A,(0x611E)
	jr	AskYesNo.loop
AskYesNo.skip4:
	ld	WA,0x81
	call	CallSoundCommand
	ld	A,(0x611E)
	jr	AskYesNo.skip6
AskYesNo.skip5:
	ld	WA,0x82
	call	CallSoundCommand
	ld	A,0xFF
AskYesNo.skip6:
	ld	(0x611E),A
	call	swp_2175AF
	ld	A,(0x611E)
	ld	XHL,(0x6123)
	jp	XHL
	db	0x39,0x05,0x13,0x00,0x00,0x00,0x2E,0x0F,0xFF,0x04,0x0A

c_21777C	section	code abs=0x21777C

loc_21777C:
	pop	XHL
	ld	(0x6123),XHL
loc_21777C.loop:
	or	A,A
	jr	Z,loc_21777C.skip
	dec	1,A
	ld	(0x6127),A
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,loc_21777C.skip
	bit	5,A
	jr	NZ,loc_21777C.skip
	call	TaskYield
	ld	A,(0x6127)
	jr	loc_21777C.loop
loc_21777C.skip:
	ld	XHL,(0x6123)
	jp	XHL

c_2177A9	section	code abs=0x2177A9

swp_2177A9:
	ld	XWA,swp_2177A9.resume
	ld	(XIZ+TASK_FUNC),XWA
swp_2177A9.resume:
	ld	XWA,swp_2177A9.resume2
	ld	(XIZ+TASK_FUNC),XWA
swp_2177A9.resume2:
	ld	A,(0x6115)
	call	sub_21725D
	jr	NC,swp_2177A9.skip5
	ld	A,(0x6115)
	call	swp_21726A
	jr	NC,swp_2177A9.skip
	ldb	(0x611D),1
	ld	B,(0x611B)
	ld	A,(0x6115)
	call	swp_217289
swp_2177A9.skip:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,swp_2177A9.skip2
	bit	5,A
	jr	NZ,swp_2177A9.skip2
	jr	swp_2177A9.skip3
swp_2177A9.skip2:
	cpb	(0x611D),0
	jr	Z,swp_2177A9.skip4
	ldb	(0x611D),0
swp_2177A9.skip3:
	cpb	(0x611C),0
	jr	Z,swp_2177A9.done
swp_2177A9.skip4:
	ldb	(0x611C),0
	ld	B,0
	ld	A,(0x6115)
	call	swp_217289
swp_2177A9.done:
	ret
swp_2177A9.skip5:
	ld	XHL,(0x6117)
	or	XHL,XHL
	ret	Z
	ldb	(0x611D),0
	ld	XHL,(0x6117)
	ld	A,(0x6115)
	call	swp_217291
	ld	B,(0x611B)
	ld	A,(0x6115)
	call	swp_217289
	xor	XHL,XHL
	ld	(0x6117),XHL
	ret

c_21798E	section	code abs=0x21798E

swp_21798E:
	ld	A,6
	jp	swp_217965

c_217994	section	code abs=0x217994

swp_217994:
	pop	XHL
	ld	(0x6142),XHL
swp_217994.loop:
	ld	XWA,(0x613E)
	or	XWA,XWA
	jr	NZ,swp_217994.skip
	call	TaskYield
	jr	swp_217994.loop
swp_217994.skip:
	call	TaskYield
	ld	XWA,(0x613E)
	ld	XHL,(0x6142)
	jp	XHL

c_2179B5	section	code abs=0x2179B5

loc_2179B5:
	ld	(0x6146),A
	pop	XHL
	ld	(0x6142),XHL
	xor	XWA,XWA
	ld	(0x613E),XWA
loc_2179B5.loop:
	ld	XWA,(0x613E)
	or	XWA,XWA
	jr	NZ,loc_2179B5.skip
	call	TaskYield
	jr	loc_2179B5.loop
loc_2179B5.skip:
	call	TaskYield
	ld	XWA,(0x613E)
	ld	XHL,(0x6142)
	jp	XHL

c_217A04	section	code abs=0x217A04

swp_217A04:
	xor	A,A
	ld	(0x613B),A
	ld	(0x613C),A
	ld	(0x613D),A

c_217A12	section	code abs=0x217A12

loc_217A12:
	ld	A,(0x6146)
	cp	A,8
	jr	NC,loc_217A12.skip
	ld	XHL,0x217A2A
	sll	2,A
	ld	XHL,(XHL+A)
	jp	XHL
	db	0x5C,0x7A,0x21,0x00,0x68,0x7A,0x21,0x00,0x7A,0x7B,0x21,0x00,0x74,0x7A,0x21,0x00
	db	0xC0,0x7A,0x21,0x00,0xA4,0x7A,0x21,0x00,0x56,0x7B,0x21,0x00,0x5C,0x7A,0x21,0x00
loc_217A12.skip:
	ld	WA,0xFFFF
	ldb	(0x6146),0
	or	XWA,0xFFFF0000
	ld	(0x613E),XWA
	call	TaskYield
	call	sub_217BB4
	jp	loc_217A12

c_217A68	section	code abs=0x217A68

swp_217A68:
	xor	A,A
	ld	(0x613D),A
	xor	WA,WA
	jp	0x217A4D

c_217A74	section	code abs=0x217A74

swp_217A74:
	ld	A,2
	call	ClearTextBox
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	ld	A,2
	ld	B,(0x614B)
	ld	XHL,(0x614C)
	call	swp_217207
	ld	A,2
	call	swp_2175B6
	xor	A,A
	ld	(0x6139),A
	xor	WA,WA
	jp	0x217A4D

c_217AA4	section	code abs=0x217AA4

swp_217AA4:
	ld	A,(0x613D)
	or	A,A
	jr	NZ,swp_217AA4.skip
	call	swp_2175A8
	call	swp_217BA9
	ld	A,1
	ld	(0x613D),A
swp_217AA4.skip:
	xor	WA,WA
	jp	0x217A4D
swp_217AA4.loop:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,swp_217AA4.skip2
	bit	5,A
	jp	NZ,swp_217AA4.skip3
	bit	1,A
	jp	NZ,swp_217AA4.skip4
	bit	0,A
	jp	NZ,swp_217AA4.skip6
	jp	swp_217AA4.skip8
swp_217AA4.skip2:
	ld	WA,0x81
	call	CallSoundCommand
	ld	A,(0x6139)
	jp	swp_217AA4.skip9
swp_217AA4.skip3:
	ld	WA,0x82
	call	CallSoundCommand
	ld	A,0xFF
	jp	swp_217AA4.skip9
swp_217AA4.skip4:
	ld	A,(0x6139)
	inc	1,A
	cp	A,(0x614A)
	jr	C,swp_217AA4.skip5
	xor	A,A
swp_217AA4.skip5:
	jp	swp_217AA4.skip7
swp_217AA4.skip6:
	ld	A,(0x6139)
	dec	1,A
	jr	PL,swp_217AA4.skip7
	ld	A,(0x614A)
	dec	1,A
swp_217AA4.skip7:
	ld	(0x6139),A
	ld	WA,0x80
	call	CallSoundCommand
swp_217AA4.skip8:
	call	swp_217BA9
	jp	swp_217AA4.loop
swp_217AA4.skip9:
	cp	A,(0x614A)
	jr	NC,swp_217AA4.skip10
	ld	XHL,(0x6154)
	ld	A,(XHL+A)
swp_217AA4.skip10:
	ld	W,0xFF
	ld	(0x613B),WA
	xor	WA,WA
	jp	0x217A4D

c_217B6E	section	code abs=0x217B6E

swp_217B6E:
	call	sub_217BB4
	call	TaskYield
	jp	loc_217A12

c_217B7A	section	code abs=0x217B7A

swp_217B7A:
	ld	XWA,0xFFFF0000
	ld	A,(0x613B)
	ld	(0x613E),XWA
	call	EndTask
	ret

c_217BB4	section	code abs=0x217BB4

sub_217BB4:
	cpb	(0x613D),0
	jr	Z,sub_217BB4.done
	cpb	(0x613C),0
	jr	Z,sub_217BB4.done
	call	sub_217B8C
	jr	NC,sub_217BB4.done
	ld	A,2
	call	swp_21722F
sub_217BB4.done:
	ret

c_217CF0	section	code abs=0x217CF0

; [code] menu block 0x614A-0x6154 = "Item", "Parts", "Exit", then menu command 1
SetupItemPartsMenu:
	ld	A,3
	ld	(0x614A),A
	ld	A,3
	ld	(0x614B),A
	ld	XHL,0x217CD5
	ld	(0x614C),XHL
	ld	XHL,0x217CE7
	ld	(0x6150),XHL
	ld	XHL,0x217CED
	ld	(0x6154),XHL
	jp	loc_2179E0

c_217D60	section	code abs=0x217D60

sub_217D60:
	ld	A,5
	ld	(0x614A),A
	ld	A,5
	ld	(0x614B),A
	ld	XHL,MenuLines_217D33
	ld	(0x614C),XHL
	ld	XHL,MenuCursor_217D51
	ld	(0x6150),XHL
	ld	XHL,MenuResults_217D5B
	ld	(0x6154),XHL
	jp	loc_2179E0

c_217E8A	section	code abs=0x217E8A

swp_217E8A:
	ld	A,3
	jp	swp_217E73

c_217E90	section	code abs=0x217E90

; [code] list command 4 (no wait): U/D rows, L/R pages; A posts page*rows+row, B 0xFFFF
StartListInput:
	ld	A,4
	jp	swp_217E73

c_217E96	section	code abs=0x217E96

swp_217E96:
	ld	A,5
	jp	swp_217E73

c_217E9C	section	code abs=0x217E9C

swp_217E9C:
	ld	A,6
	jp	swp_217E73

c_217EA2	section	code abs=0x217EA2

; [code] TaskYield until the list task posts a result (0x6176), return it in XWA
WaitListResult:
	pop	XHL
	ld	(0x617A),XHL
WaitListResult.loop:
	ld	XWA,(wListResult)
	or	XWA,XWA
	jr	NZ,WaitListResult.skip
	call	TaskYield
	jr	WaitListResult.loop
WaitListResult.skip:
	call	TaskYield
	ld	XWA,(wListResult)
	ld	XHL,(0x617A)
	jp	XHL

c_217EC3	section	code abs=0x217EC3

loc_217EC3:
	ld	(wListCommand),A
	pop	XHL
	ld	(0x617A),XHL
	xor	XWA,XWA
	ld	(wListResult),XWA
loc_217EC3.loop:
	ld	XWA,(wListResult)
	or	XWA,XWA
	jr	NZ,loc_217EC3.skip
	call	TaskYield
	jr	loc_217EC3.loop
loc_217EC3.skip:
	call	TaskYield
	ld	XWA,(wListResult)
	ld	XHL,(0x617A)
	jp	XHL

c_217F59	section	code abs=0x217F59

swp_217F59:
	push	BC
	push	DE
	ld	XHL,0x217F6D
	ld	B,D
	ld	C,E
	ld	A,3
	call	swp_2171DF
	pop	DE
	pop	BC
	ret
	db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF

c_217F78	section	code abs=0x217F78

sub_217F78:
	push	WA
	push	BC
	push	XHL
	call	swp_2171DF
	pop	XHL
	call	swp_2171AD
	pop	BC
	add	B,A
	ld	XHL,0x217F97
	lda	XHL,XHL+A
	pop	WA
	call	swp_2171DF
	ret
	db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF

c_217FA0	section	code abs=0x217FA0

swp_217FA0:
	xor	WA,WA
	ld	(0x615B),WA
	ld	(0x615D),A
	ld	(0x615E),A

c_217FAE	section	code abs=0x217FAE

loc_217FAE:
	ld	A,(wListCommand)
	cp	A,8
	jr	NC,loc_217FAE.skip
	ld	XHL,ListCommandJumps
	sll	2,A
	ld	XHL,(XHL+A)
	jp	XHL
; [code] the handler for each wListCommand 0-7 (loc_217FAE: index * 4, jp)
ListCommandJumps:
	dl	loc_217FF8	; 0
	dl	swp_218004	; 1
	dl	swp_218172	; 2
	dl	swp_218018	; 3
	dl	swp_218047	; 4
	dl	swp_21802C	; 5
	dl	swp_21814F	; 6
	dl	loc_217FF8	; 7
loc_217FAE.skip:
	ld	WA,0xFFFF
	ldb	(wListCommand),0
	or	XWA,0xFFFF0000
	ld	(wListResult),XWA
loc_217FF8:
	call	TaskYield
	call	sub_2181B4
	jp	loc_217FAE

c_218166	section	code abs=0x218166

swp_218166:
	call	sub_2181B4
	call	TaskYield
	jp	loc_217FAE

c_218172	section	code abs=0x218172

swp_218172:
	ld	XWA,0xFFFF0000
	ld	WA,(0x615B)
	ld	(wListResult),XWA
	call	EndTask
	ret

c_2181B4	section	code abs=0x2181B4

sub_2181B4:
	cpb	(0x615E),0
	jr	Z,sub_2181B4.done
	cpb	(0x615D),0
	jr	Z,sub_2181B4.done
	call	swp_218184
	jr	NC,sub_2181B4.done
	ld	A,3
	call	swp_21722F
sub_2181B4.done:
	ret

c_2181CF	section	code abs=0x2181CF

; [code] jp (0x616A): the hook the list input calls after every move
CallListMoveHook:
	ld	XHL,(0x616A)
	call	swp_21717A
	ret

c_21890A	section	code abs=0x21890A

swp_21890A:
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
swp_21890A.loop:
	call	TaskYield
	jr	swp_21890A.loop

c_2196A8	section	code abs=0x2196A8

sub_2196A8:
	call	swp_219697
	ret	NC
	ld	A,(XHL)
	ret

c_2196B1	section	code abs=0x2196B1

swp_2196B1:
	call	swp_219697
	ret	NC
	ld	(XHL),B
	ret

c_2196BA	section	code abs=0x2196BA

sub_2196BA:
	call	loc_21968B
	ret	NC
	inc	1,WA
	call	AddItem
	ret

c_21972D	section	code abs=0x21972D

swp_21972D:
	push	XBC
	rcf
	ld	(0x61E2),XWA
	push	XHL
	push	XDE
	ld	XHL,0x61E2
	ld	XDE,wGP
	ld	B,4
swp_21972D.loop:
	ld	A,(XHL)
	adc	A,(XDE)
	daa	A
	ld	(XDE),A
	inc	1,XHL
	inc	1,XDE
	djnz	B,swp_21972D.loop
	ld	XHL,(wGP)
	cp	XHL,0x999999
	jr	C,swp_21972D.skip
	ld	XHL,0x999999
	ld	(wGP),XHL
swp_21972D.skip:
	pop	XDE
	pop	XHL
	pop	XBC
	ret

c_219769	section	code abs=0x219769

swp_219769:
	push	XBC
	ld	XBC,0x99999999
	sub	XBC,XWA
	ld	XWA,XBC
	scf
	jr	0x21972F

c_2197B5	section	code abs=0x2197B5

swp_2197B5:
	ld	BC,0
	ld	DE,0x20

c_2197BA	section	code abs=0x2197BA

sub_2197BA:
	ld	HL,0x126
	jp	loc_219796

c_2197C1	section	code abs=0x2197C1

sub_2197C1:
	ld	BC,0
	ld	DE,0
	ld	HL,0x7E
	jp	loc_219796

c_219843	section	code abs=0x219843

swp_219843:
	ld	A,0x1E
	jp	loc_21777C

c_219849	section	code abs=0x219849

swp_219849:
	ld	(0x61F1),XHL
	pop	XDE
	ld	(0x61ED),XDE
	call	swp_217657
	ld	XHL,(0x61F1)
	call	0x21762F
	ld	XHL,(0x61ED)
	jp	XHL

c_21AA89	section	code abs=0x21AA89

swp_21AA89:
	ld	A,(0x620A)
	call	sub_21AAA5
	ld	(0x620E),XWA
	call	dyn_20636D
	call	EndTask
swp_21AA89.loop:
	call	TaskYield
	jp	swp_21AA89.loop

c_21AAA5	section	code abs=0x21AAA5

sub_21AAA5:
	ld	XHL,swp_219917
	ld	(0x621A),XHL
	ld	(0x61F6),A
	pop	XHL
	ld	(0x6216),XHL
	xor	XWA,XWA
	ld	(0x6212),XWA
	ld	XHL,swp_21AAE2
	call	StartChildTask
sub_21AAA5.loop:
	ld	XWA,(0x6212)
	or	XWA,XWA
	jr	NZ,sub_21AAA5.skip
	call	TaskYield
	jr	sub_21AAA5.loop
sub_21AAA5.skip:
	call	TaskYield
	ld	XWA,(0x6212)
	ld	XHL,(0x6216)
	jp	XHL

c_21AC2E	section	code abs=0x21AC2E

sub_21AC2E:
	ld	XHL,ShopTalk
	jp	0x21AAAA

c_21AC37	section	code abs=0x21AC37

swp_21AC37:
	call	sub_2174C9
	and	A,0x80
	ld	(0x621E),A
	ret

c_21AC43	section	code abs=0x21AC43

swp_21AC43:
	ld	A,0x25
	call	sub_2197C1
	ret

c_21AC4A	section	code abs=0x21AC4A

swp_21AC4A:
	push	WA
	call	sub_219807
	pop	WA
	call	sub_21AC5E
	ld	BC,0
	ld	DE,0x20
	call	sub_2197BA
	ret

c_21AC5E	section	code abs=0x21AC5E

sub_21AC5E:
	ld	A,(0x621E)
	or	A,A
	ld	A,0x18
	ret	Z
	ld	A,0x19
	ret

c_21AC6B	section	code abs=0x21AC6B

swp_21AC6B:
	call	sub_2197DD
	call	swp_21AC43
	call	swp_21AC4A
	ret

c_21AC78	section	code abs=0x21AC78

swp_21AC78:
	ld	XWA,3
	jp	loc_219907

c_21AC7E	section	code abs=0x21AC7E

swp_21AC7E:
	ld	A,(0x621E)
	or	A,A
	ret	Z
	ld	XHL,XDE
	ret

c_21AC89	section	code abs=0x21AC89

swp_21AC89:
	call	swp_21AC7E
	jp	swp_219849

c_21AC91	section	code abs=0x21AC91

; [code+play] Galb/Lana's greeting by story stage (OhItsYou / HaveYouHeardWhat / HowCanIHelp ...)
ShopTalk:
	call	swp_21AC37
	call	swp_21AC78
	call	DrawGP
	ld	WA,0x23
	call	CallSoundCommand
	call	swp_21AC43
	ld	A,EVENT_STAGE_WON_RANK_D
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip
	call	swp_21AC43
	ldb	(0x621E),0
	call	swp_21AC4A
	ld	XHL,OhItsYouYouText
	call	swp_219849
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip:
	ld	A,EVENT_STAGE_WON_RANK_B
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip2
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip2
	call	swp_21AC43
	ldb	(0x621E),1
	call	swp_21AC4A
	ld	XHL,HiThereYoureInText
	call	swp_219849
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip2:
	ld	A,EVENT_STAGE_WON_RANK_S
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip3
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip3
	call	swp_21AC43
	ldb	(0x621E),1
	call	swp_21AC4A
	ld	XHL,HiTherePlayerIText
	call	swp_219849
	call	Wait30Frames
	ldb	(0x621E),0
	call	swp_21AC4A
	ld	XHL,BeCarefulPlayerYourText
	call	swp_219849
	call	Wait30Frames
	ldb	(0x621E),1
	call	swp_21AC4A
	ld	XHL,DontWorryPlayerYouText
	call	swp_219849
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip3:
	ld	A,EVENT_STAGE_LILY
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip4
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip4
	call	swp_21AC43
	ldb	(0x621E),0
	call	swp_21AC4A
	ld	XHL,HaveYouHeardWhatText
	call	swp_219849
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip4:
	ld	A,EVENT_STAGE_ENDING
	call	CheckEventFlagA
	jr	NC,ShopTalk.skip5
	ld	A,EVENT_TALKED_SHOP
	call	CheckEventFlagA
	jr	C,ShopTalk.skip5
	call	swp_21AC43
	ldb	(0x621E),1
	call	swp_21AC4A
	ld	XHL,PlayerIsThatYouText
	call	swp_219849
	call	Wait30Frames
	ldb	(0x621E),0
	call	swp_21AC4A
	ld	XHL,LetHimBeNoText
	call	swp_219849
	call	Wait30Frames
	ldb	(0x621E),1
	call	swp_21AC4A
	ld	XHL,WhyDontYouDoText
	call	swp_219849
	call	Wait30Frames
	ld	A,EVENT_TALKED_SHOP
	call	SetEventFlagA
	jp	ShopTalk.skip6
ShopTalk.skip5:
	call	swp_21AC4A
ShopTalk.skip6:
	ld	XHL,HelloLookingForSomethingText
	ld	XDE,HiThereHowCanText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26

c_21AE1E	section	code abs=0x21AE1E

; [code] Here's what we've got, buy/sell, GP checks
ShopMenu:
	call	TaskYield
	call	swp_21AC6B

c_21AE26	section	code abs=0x21AE26

loc_21AE26:
	call	swp_217684
	call	sub_21B369
	call	DrawMenuBox
	call	ShowMenuCursor
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AE26.skip13
	cp	A,0
	jp	Z,loc_21AE26.loop
	cp	A,1
	jp	Z,loc_21AE26.loop6
	jp	loc_21AE26.skip13
loc_21AE26.loop:
	call	HideListCursor
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,HeresWhatWeveGotText
	ld	XDE,WhichListAreYouText
	call	swp_21AC89
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AE26.skip7
	cp	A,0
	jp	Z,loc_21AE26.skip
	cp	A,1
	jp	Z,loc_21AE26.skip4
	jp	loc_21AE26.skip7
loc_21AE26.loop2:
	call	HideListCursor
	call	TaskYield
	call	swp_21AC6B
loc_21AE26.skip:
	call	sub_217D60
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AE26.loop
	ld	(0x621F),A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x621F)
	call	sub_21B6F9
loc_21AE26.loop3:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21AE26.loop2
	ld	W,(0x621F)
	inc	1,W
	inc	1,A
	ld	(0x6220),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	swp_21AC7E
	call	AskYesNo
	or	A,A
	jr	NZ,loc_21AE26.loop3
	ld	WA,(0x6220)
	call	sub_219701
	and	A,0x7F
	cp	A,9
	jr	NC,loc_21AE26.skip2
	ld	WA,(0x6220)
	call	swp_2174E9
	cp	(wGP),XWA
	jr	C,loc_21AE26.skip3
	call	swp_219769
	call	DrawGP
	ld	WA,(0x6220)
	call	AddItemByCategory
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThanksText2
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop3
loc_21AE26.skip2:
	ld	XHL,SorryYouDontHaveText
	ld	XDE,WhoopsYouCantCarryText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop3
loc_21AE26.skip3:
	ld	WA,0x8F
	call	CallSoundCommand
	ld	XHL,LooksLikeYoureShortText
	ld	XDE,UmmIThinkItsText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop3
loc_21AE26.loop4:
	call	HideListCursor
	call	TaskYield
	call	swp_21AC6B
loc_21AE26.skip4:
	call	sub_217DD3
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AE26.loop
	ld	(0x621F),A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x621F)
	call	sub_21B4E3
loc_21AE26.loop5:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21AE26.loop4
	ld	W,(0x621F)
	inc	1,W
	inc	1,A
	ld	(0x6220),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	swp_21AC7E
	call	AskYesNo
	or	A,A
	jr	NZ,loc_21AE26.loop5
	ld	WA,(0x6220)
	call	sub_2196A8
	and	A,0x7F
	cp	A,9
	jr	NC,loc_21AE26.skip5
	ld	WA,(0x6220)
	call	swp_2174D9
	cp	(wGP),XWA
	jr	C,loc_21AE26.skip6
	call	swp_219769
	call	DrawGP
	ld	WA,(0x6220)
	call	sub_2196BA
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThanksText2
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop5
loc_21AE26.skip5:
	ld	XHL,SorryYouDontHaveText
	ld	XDE,WhoopsYouCantCarryText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop5
loc_21AE26.skip6:
	ld	WA,0x8F
	call	CallSoundCommand
	ld	XHL,LooksLikeYoureShortText
	ld	XDE,UmmIThinkItsText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop5
loc_21AE26.skip7:
	call	HideListCursor
	jp	loc_21AE26
loc_21AE26.loop6:
	call	HideListCursor
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhatDoYouWantText7
	ld	XDE,WhatDoYouHaveText
	call	swp_21AC89
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AE26.skip12
	cp	A,0
	jp	Z,loc_21AE26.skip8
	cp	A,1
	jp	Z,loc_21AE26.skip10
	jp	loc_21AE26.skip12
loc_21AE26.loop7:
	call	HideListCursor
	call	TaskYield
	call	swp_21AC6B
loc_21AE26.skip8:
	call	sub_217D60
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AE26.loop6
	ld	(0x621F),A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x621F)
	call	sub_21B781
loc_21AE26.loop8:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(0x615B)
	or	WA,WA
	jr	MI,loc_21AE26.loop7
	ld	W,(0x621F)
	inc	1,W
	inc	1,A
	ld	(0x6220),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	swp_21AC7E
	call	AskYesNo
	or	A,A
	jr	NZ,loc_21AE26.loop8
	ld	WA,(0x6220)
	call	sub_219701
	and	A,0x7F
	jr	Z,loc_21AE26.skip9
	ld	WA,(0x6220)
	call	swp_21750B
	call	swp_21972D
	call	DrawGP
	ld	WA,(0x6220)
	call	RemoveItemByCategory
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThankYouText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop8
loc_21AE26.skip9:
	ld	XHL,ItDoesntLookLikeText
	ld	XDE,YouDontHaveThatText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop8
loc_21AE26.loop9:
	call	HideListCursor
	call	TaskYield
	call	swp_21AC6B
loc_21AE26.skip10:
	call	sub_217DD3
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AE26.loop6
	ld	(0x621F),A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x621F)
	call	sub_21B563
loc_21AE26.loop10:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAnItemText
	ld	XDE,ChooseAnItemText
	call	swp_21AC89
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21AE26.loop9
	ld	W,(0x621F)
	inc	1,W
	inc	1,A
	ld	(0x6220),WA
	ld	XHL,AreYouSureText3
	ld	XDE,AreYouSureText2
	call	swp_21AC7E
	call	AskYesNo
	or	A,A
	jr	NZ,loc_21AE26.loop10
	ld	WA,(0x6220)
	call	sub_2196A8
	and	A,0x7F
	jr	Z,loc_21AE26.skip11
	ld	WA,(0x6220)
	call	swp_2174FF
	call	swp_21972D
	call	DrawGP
	ld	WA,(0x6220)
	call	RemoveGroupItem
	ld	WA,0x8E
	call	CallSoundCommand
	ld	XHL,ThanksText
	ld	XDE,ThankYouText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop10
loc_21AE26.skip11:
	ld	XHL,ItDoesntLookLikeText
	ld	XDE,YouDontHaveThatText
	call	swp_21AC89
	call	Wait30Frames
	jp	loc_21AE26.loop10
loc_21AE26.skip12:
	call	HideListCursor
	jp	loc_21AE26
loc_21AE26.skip13:
	ld	XHL,ThanksText
	ld	XDE,ThanksText2
	call	swp_21AC89
	call	Wait30Frames
	jp	EndMenuTask
	db	0x22,0x15,0x19,0xFF,0x33,0x05,0x0C,0x0C,0xFF,0x25,0x18,0x09,0x14,0xFF,0x00,0x00
	db	0x40,0xB3,0x21,0x00,0x00,0x01,0x44,0xB3,0x21,0x00,0x00,0x08,0x49,0xB3,0x21,0x00
	db	0x00,0x00,0x00,0x01,0x00,0x08,0x00,0x01,0xFF

c_21B369	section	code abs=0x21B369

sub_21B369:
	ld	A,3
	ld	(0x614A),A
	ld	A,3
	ld	(0x614B),A
	ld	XHL,0x21B34E
	ld	(0x614C),XHL
	ld	XHL,0x21B360
	ld	(0x6150),XHL
	ld	XHL,0x21B366
	ld	(0x6154),XHL
	jp	loc_2179E0

c_21B394	section	code abs=0x21B394

swp_21B394:
	ld	W,(0x6182)
	inc	1,W
	call	GetItemGroupSize
	ld	(0x6160),A
	ld	A,(0x6160)
	extz	WA
	add	WA,9
	div	WA,0xA
	ld	(0x6161),A
	ld	A,(0x6182)
	sll	2,A
	ld	XHL,ItemGroupTitles
	ld	XHL,(XHL+A)
	ld	BC,0
	ld	A,3
	call	swp_2171DF
	ld	BC,0x50B
	ld	E,(wListPage)
	inc	1,E
	ld	WA,0x203
	call	swp_2172A7
	ld	BC,0x80B
	ld	E,(0x6161)
	ld	WA,0x203
	call	swp_2172A7
	ld	A,3
	ld	B,1
	ld	XHL,swp_218236
	call	swp_217207
	ld	A,(0x6182)
	inc	1,A
	ld	B,A
	ld	A,(wListPage)
	mul	WA,0xA
	inc	1,A
	ld	C,A
	ld	DE,1
	ld	WA,0xA
swp_21B394.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(0x6160)
	jr	C,swp_21B394.skip
	call	swp_217F59
	jp	swp_21B394.skip4
swp_21B394.skip:
	ld	WA,BC
	call	sub_21B4DE
	jr	C,swp_21B394.skip2
	ld	XHL,DashText2
	ld	B,D
	ld	C,E
	ld	A,3
	call	swp_2171DF
	jp	swp_21B394.skip4
swp_21B394.skip2:
	push	BC
	ld	WA,BC
	call	loc_217386
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	sub_217F78
	pop	DE
	pop	WA
	call	sub_2183A2
	or	A,A
	jr	NZ,swp_21B394.skip3
	ld	XHL,0x21B59E
	ld	B,8
	ld	C,E
	ld	A,3
	call	swp_2171DF
	jr	swp_21B394.skip4
swp_21B394.skip3:
	and	A,0xF
	push	WA
	ld	B,8
	ld	C,E
	ld	L,(TimesText2)
	ld	A,3
	push	DE
	call	swp_2171B9
	pop	DE
	pop	WA
	ld	B,9
	ld	C,E
	ld	E,A
	ld	WA,0x103
	call	swp_2172A7
swp_21B394.skip4:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	dec	1,WA
	or	WA,WA
	jp	NZ,swp_21B394.loop
	ret

c_21B4A0	section	code abs=0x21B4A0

swp_21B4A0:
	call	swp_217684
	call	sub_21838A
	jr	NC,swp_21B4A0.done
	ld	BC,WA
	call	sub_21B4DE
	jr	NC,swp_21B4A0.done
	ld	WA,BC
	push	WA
	call	0x2173E5
	ld	BC,0
	call	swp_217699
	pop	WA
	call	swp_2174D9
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	sub_217303
swp_21B4A0.done:
	ret

c_21B4D1	section	code abs=0x21B4D1

swp_21B4D1:
	call	sub_21838A
	jr	NC,swp_21B4D1.done
	ld	BC,WA
	call	sub_21B4DE
swp_21B4D1.done:
	ret

c_21B4DE	section	code abs=0x21B4DE

sub_21B4DE:
	call	IsShopItemStocked
	ret

c_21B4E3	section	code abs=0x21B4E3

sub_21B4E3:
	ld	XHL,swp_21B4A0
	ld	XDE,swp_21B4D1
	ld	(0x616A),XHL
	ld	(0x616E),XDE
	ld	(0x6182),A
	ld	A,0xA
	ld	(0x615F),A
	ld	XHL,swp_21B394
	ld	(0x6162),XHL
	ld	XHL,swp_218331
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2181D8
	ld	(0x6172),XHL
	jp	loc_217EEE

c_21B51E	section	code abs=0x21B51E

swp_21B51E:
	call	swp_217684
	call	sub_21838A
	jr	NC,swp_21B51E.done
	ld	BC,WA
	call	sub_2183A2
	or	A,A
	jr	Z,swp_21B51E.done
	ld	WA,BC
	push	WA
	call	0x2173E5
	ld	BC,0
	call	swp_217699
	pop	WA
	call	swp_2174FF
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	sub_217303
swp_21B51E.done:
	ret

c_21B551	section	code abs=0x21B551

swp_21B551:
	call	sub_21838A
	jr	NC,swp_21B551.done
	ld	BC,WA
	call	sub_2183A2
	or	A,A
	jr	Z,swp_21B551.done
	scf
swp_21B551.done:
	ret

c_21B563	section	code abs=0x21B563

sub_21B563:
	ld	XHL,swp_21B51E
	ld	XDE,swp_21B551
	ld	(0x616A),XHL
	ld	(0x616E),XDE
	ld	(0x6182),A
	ld	A,0xA
	ld	(0x615F),A
	ld	XHL,loc_21823C
	ld	(0x6162),XHL
	ld	XHL,swp_218331
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2181D8
	ld	(0x6172),XHL
	jp	loc_217EEE
	db	0x00,0x00,0x00,0xFF

c_21B5A2	section	code abs=0x21B5A2

swp_21B5A2:
	ld	W,(0x6183)
	inc	1,W
	call	GetPartGroupSize
	ld	(0x6160),A
	ld	A,(0x6160)
	extz	WA
	add	WA,9
	div	WA,0xA
	ld	(0x6161),A
	ld	A,(0x6183)
	sll	2,A
	ld	XHL,PartListTitles
	ld	XHL,(XHL+A)
	ld	BC,0
	ld	A,3
	call	swp_2171DF
	ld	BC,0x50B
	ld	E,(wListPage)
	inc	1,E
	ld	WA,0x203
	call	swp_2172A7
	ld	BC,0x80B
	ld	E,(0x6161)
	ld	WA,0x203
	call	swp_2172A7
	ld	A,3
	ld	B,1
	ld	XHL,swp_218488
	call	swp_217207
	ld	A,(0x6183)
	inc	1,A
	ld	B,A
	ld	A,(wListPage)
	mul	WA,0xA
	inc	1,A
	ld	C,A
	ld	DE,1
	ld	WA,0xA
swp_21B5A2.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(0x6160)
	jr	C,swp_21B5A2.skip
	call	swp_217F59
	jp	swp_21B5A2.skip4
swp_21B5A2.skip:
	ld	WA,BC
	call	sub_21B6F4
	jr	C,swp_21B5A2.skip2
	ld	XHL,DashText3
	ld	B,D
	ld	C,E
	ld	A,3
	call	swp_2171DF
	jp	swp_21B5A2.skip4
swp_21B5A2.skip2:
	push	BC
	ld	WA,BC
	call	sub_21739F
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	sub_217F78
	pop	DE
	pop	WA
	call	sub_218645
	or	A,A
	jr	NZ,swp_21B5A2.skip3
	ld	XHL,0x21B59E
	ld	B,8
	ld	C,E
	ld	A,3
	call	swp_2171DF
	jr	swp_21B5A2.skip4
swp_21B5A2.skip3:
	and	A,0xF
	push	WA
	ld	B,8
	ld	C,E
	ld	L,(TimesText2)
	ld	A,3
	push	DE
	call	swp_2171B9
	pop	DE
	pop	WA
	ld	B,9
	ld	C,E
	ld	E,A
	ld	WA,0x103
	call	swp_2172A7
swp_21B5A2.skip4:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	dec	1,WA
	or	WA,WA
	jp	NZ,swp_21B5A2.loop
	ret

c_21B6AE	section	code abs=0x21B6AE

swp_21B6AE:
	ld	XHL,(0x616E)
	call	sub_219238
	call	swp_217684
	call	sub_21862D
	jr	NC,swp_21B6AE.done
	ld	BC,WA
	call	sub_21B6F4
	jr	NC,swp_21B6AE.done
	ld	WA,BC
	push	WA
	call	sub_2173D5
	ld	BC,0
	call	swp_217699
	pop	WA
	call	swp_2174E9
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	sub_217303
swp_21B6AE.done:
	ret

c_21B6E7	section	code abs=0x21B6E7

swp_21B6E7:
	call	sub_21862D
	jr	NC,swp_21B6E7.done
	ld	BC,WA
	call	sub_21B6F4
swp_21B6E7.done:
	ret

c_21B6F4	section	code abs=0x21B6F4

sub_21B6F4:
	call	IsShopEntryStocked
	ret

c_21B6F9	section	code abs=0x21B6F9

sub_21B6F9:
	ld	XHL,swp_21B6AE
	ld	XDE,swp_21B6E7
	ld	(0x616A),XHL
	ld	(0x616E),XDE
	ld	(0x6183),A
	ld	A,0xA
	ld	(0x615F),A
	ld	XHL,swp_21B5A2
	ld	(0x6162),XHL
	ld	XHL,swp_218577
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2183EE
	ld	(0x6172),XHL
	jp	loc_217EEE

c_21B734	section	code abs=0x21B734

swp_21B734:
	ld	XHL,(0x616E)
	call	sub_219238
	call	swp_217684
	call	sub_21862D
	jr	NC,swp_21B734.done
	ld	BC,WA
	call	sub_218645
	or	A,A
	jr	Z,swp_21B734.done
	ld	WA,BC
	push	WA
	call	sub_2173D5
	ld	BC,0
	call	swp_217699
	pop	WA
	call	swp_21750B
	ld	BC,0xC02
	ld	XDE,XWA
	ld	WA,0x601
	call	sub_217303
swp_21B734.done:
	ret

c_21B76F	section	code abs=0x21B76F

swp_21B76F:
	call	sub_21862D
	jr	NC,swp_21B76F.done
	ld	BC,WA
	call	sub_218645
	or	A,A
	jr	Z,swp_21B76F.done
	scf
swp_21B76F.done:
	ret

c_21B781	section	code abs=0x21B781

sub_21B781:
	ld	XHL,swp_21B734
	ld	XDE,swp_21B76F
	ld	(0x616A),XHL
	ld	(0x616E),XDE
	ld	(0x6183),A
	ld	A,0xA
	ld	(0x615F),A
	ld	XHL,loc_21848E
	ld	(0x6162),XHL
	ld	XHL,swp_218577
	ld	(0x6166),XHL
	ld	XHL,ListCursor_2183EE
	ld	(0x6172),XHL
	jp	loc_217EEE

c_21B92F	section	code abs=0x21B92F

sub_21B92F:
	push	XHL
	sll	2,WA
	ld	XHL,ItemPrices
	ld	XWA,(XHL+WA)
	pop	XHL
	ret
; [code] part count per group W (GetPartGroupSize, CheckPartGroupIndex): 0 = all parts, 1 body,
; 2 core, 3 legs, 4 back, 5 arm. The arm entry is also PartGroupFirstIds[0].
PartGroupSizes:
	db	227, 15, 15, 44, 20
; [code] PartGroupToIndex: first 0-based part id of group W = 1-5 (body 0, core 15, legs 30,
; back 74, arm 94); entry 0 is the arm count of PartGroupSizes (the two tables overlap)
PartGroupFirstIds:
	db	133
	db	0, 15, 30, 74, 94

c_21B94A	section	code abs=0x21B94A

; [code] carry when W is part group 1-5 and 1 <= A <= size (sizes: PartGroupSizes)
CheckPartGroupIndex:
	dec	1,W
	cp	W,5
	inc	1,W
	jr	NC,CheckPartGroupIndex.done
	push	XHL
	ld	XHL,PartGroupSizes
	dec	1,A
	cp	A,(XHL+W)
	inc	1,A
	pop	XHL
CheckPartGroupIndex.done:
	ret

c_21D738	section	code abs=0x21D738

swp_21D738:
	ldw	(wEnemyAffinity),(wUnitAffinity)
	ld	A,2
	call	sub_21AAA5
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_21D856	section	code abs=0x21D856

swp_21D856:
	ld	XHL,swp_214C75
	call	StartChildTask
	task_wait
	cpb	(0x60F0),3
	jr	Z,swp_21D856.skip3
	cpb	(0x60F0),4
	jr	Z,swp_21D856.skip
	cpb	(0x60F0),5
	jr	Z,swp_21D856.skip2
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
swp_21D856.skip:
	ld	A,1
	call	sub_21AC2E
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
swp_21D856.skip2:
	ld	A,1
	call	sub_21AC2E
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
swp_21D856.skip3:
	ld	A,1
	call	sub_21AC2E
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_21D8C0	section	code abs=0x21D8C0

swp_21D8C0:
	ld	XHL,swp_2130E1
	call	StartChildTask
	task_wait
	cpb	(0x5FF8),1
	ld	XHL,StreetGoWorks
	jr	Z,swp_21D8C0.skip
	cpb	(0x5FF8),2
	ld	XHL,swp_21D93E
	jr	Z,swp_21D8C0.skip
	cpb	(0x5FF8),4
	ld	XHL,swp_21D95E
	jr	Z,swp_21D8C0.skip
	cpb	(0x5FF8),5
	ld	XHL,swp_21D980
	jr	Z,swp_21D8C0.skip
	cpb	(0x5FF8),6
	ld	XHL,loc_21D997
	jr	Z,swp_21D8C0.skip
	ld	XHL,StreetTask
swp_21D8C0.skip:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_21D91C	section	code abs=0x21D91C

swp_21D91C:
	ld	XHL,swp_214BEC
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_21D93E	section	code abs=0x21D93E

swp_21D93E:
	ldw	(wEnemyAffinity),(wUnitAffinity)
	ld	A,3
	call	sub_21AAA5
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_21D95E	section	code abs=0x21D95E

swp_21D95E:
	ld	XHL,swp_20F179
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xD800
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret

c_21D980	section	code abs=0x21D980

swp_21D980:
	ld	XHL,StorySceneTheEnd
	call	StartChildTask
	task_wait

c_21D997	section	code abs=0x21D997

loc_21D997:
	ld	XHL,GameOverScreen
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xD5E9
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
