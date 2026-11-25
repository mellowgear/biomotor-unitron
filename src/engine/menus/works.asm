; engine/menus/works: 333 routines (each keeps its ROM address in its own section)

c_206371	section	code abs=0x206371

swp_206371:
	set	7,(XHL+7)
	ret

c_206375	section	code abs=0x206375

swp_206375:
	set	6,(XHL+7)
	ret

c_206379	section	code abs=0x206379

sub_206379:
	ldb	(wColorFlags),0
	cpb	(OS_VERSION),0x10
	jr	C,sub_206379.skip
	ldb	(wColorFlags),0x10
	ld	RW3,0xE
	ld	RA3,0x10
	call	BiosCall
sub_206379.skip:
	ldb	(SCROLL_PRIORITY),0x80
	ldb	(BG),0x80
	ldb	(CONTROL_2D),7
	andb	(TRUN),0x8E
	ldb	(T01MOD),0
	ldb	(TREG0),1
	orb	(TRUN),1
	ld	RW3,4
	ld	RB3,0
	ld	RC3,2
	call	BiosCall
	call	sub_2067E1
	call	sub_206847
	call	sub_2063EE
	ldb	(wFadeLevel),0x81
	ld	XHL,0x8200
	ld	BC,0x100
sub_206379.loop:
	ldw	(XHL+),0
	djnz	BC,sub_206379.loop
	ldw	(WBA_H),0
	ldw	(WSI_H),0x98A0
	ret

c_2063EE	section	code abs=0x2063EE

sub_2063EE:
	ld	A,0
	ld	(0x5A76),A
	ld	(0x584B),A
	ld	(0x584D),A
	ld	(0x584F),A
	ld	(0x5851),A
	ld	(0x5853),A
	ld	(0x5855),A
	ld	(0x5857),A
	ld	(0x5859),A
	ld	(0x5A7B),A
	ld	(0x5A7D),A
	ld	(wShakeFlags),A
	ld	(wShakeX),A
	ld	(wShakeY),A
	ld	XWA,0
	ld	XHL,0x5A86
	ld	(0x5A82),HL
	ld	XDE,0x5B86
	ld	(0x5A84),DE
	ld	C,0x40
sub_2063EE.loop:
	ld	(XHL+),XWA
	ld	(XDE+),A
	djnz	C,sub_2063EE.loop
	ldb	(wFadeLevel),0
	ldb	(0x585C),0xFF
	ldw	(0x5A56),0xFFF
	ldw	(0x5A58),0xDDD
	ldw	(0x5A5A),0xBBB
	ldw	(0x5A5C),0x999
	ldw	(0x5A5E),0x666
	ldw	(0x5A60),0x444
	ldw	(0x5A62),0x222
	ldw	(0x5A64),0
	ldw	(0x5A66),0xFFF
	ldw	(0x5A68),0xDDD
	ldw	(0x5A6A),0xBBB
	ldw	(0x5A6C),0x999
	ldw	(0x5A6E),0x666
	ldw	(0x5A70),0x444
	ldw	(0x5A72),0x222
	ldw	(0x5A74),0
	ld	XHL,0x8100
	ld	XDE,wMonoPalShadow
	ld	BC,0x19
	ldir	(XDE+),(XHL+)
	ldb	(0x5875),0x80
	ret

c_2064C6	section	code abs=0x2064C6

sub_2064C6:
	ld	W,(wShakeFlags)
	ld	A,(0x5A76)
	or	A,A
	jr	Z,sub_2064C6.skip3
	cp	A,0x98
	jr	NC,sub_2064C6.skip3
	ld	C,(0x584F)
	ld	E,(0x5851)
	bit	3,W
	jr	Z,sub_2064C6.skip
	add	C,(wShakeX)
	add	E,(wShakeY)
sub_2064C6.skip:
	ld	(0x5A77),C
	ld	(0x5A78),E
	ld	C,(0x5857)
	ld	E,(0x5859)
	bit	4,W
	jr	Z,sub_2064C6.skip2
	add	C,(wShakeX)
	add	E,(wShakeY)
sub_2064C6.skip2:
	ld	(0x5A79),C
	ld	(0x5A7A),E
	ld	W,0
	ldc	DMAC0,WA
	ld	A,0x14
	ldc	DMAM0,A
	ldb	(DMA0V),0x10
	ld	XWA,0x5A77
	ldc	DMAS1,XWA
	ld	XWA,0x8032
	ldc	DMAD1,XWA
	ld	WA,1
	ldc	DMAC1,WA
	ld	A,0xA
	ldc	DMAM1,A
	ldb	(DMA1V),0x10
sub_2064C6.skip3:
	ld	W,(wShakeFlags)
	ld	C,(0x584B)
	ld	E,(0x584D)
	bit	1,W
	jr	Z,sub_2064C6.skip4
	add	C,(wShakeX)
	add	E,(wShakeY)
sub_2064C6.skip4:
	ld	(S1SO_H),C
	ld	(S1SO_V),E
	ld	C,(0x5853)
	ld	E,(0x5855)
	bit	2,W
	jr	Z,sub_2064C6.skip5
	add	C,(wShakeX)
	add	E,(wShakeY)
sub_2064C6.skip5:
	ld	(S2SO_H),C
	ld	(S2SO_V),E
	ld	C,(0x5A7B)
	ld	E,(0x5A7D)
	bit	0,W
	jr	Z,sub_2064C6.skip6
	add	C,(wShakeX)
	add	E,(wShakeY)
sub_2064C6.skip6:
	neg	C
	neg	E
	ld	(PO_H),C
	ld	(PO_V),E
	ret

c_206BFF	section	code abs=0x206BFF

sub_206BFF:
	push	WA
	push	DE
	push	BC
	ld	BC,0
	ld	DE,0
	ld	XHL,0
sub_206BFF.loop:
	cpw	(0x5A82),0x5B86
	jr	NC,sub_206BFF.skip2
	ld	WA,DE
	sll	3,WA
	add	WA,(XSP+2)
	cp	WA,0xFFF8
	jr	LE,sub_206BFF.skip
	cp	WA,0xA0
	jr	GE,sub_206BFF.skip2
	ld	QW,A
	ld	WA,BC
	sll	3,WA
	add	WA,(XSP)
	cp	WA,0xFFF8
	jr	LE,sub_206BFF.skip
	cp	WA,0xA8
	jr	GE,sub_206BFF.skip
	ld	QA,A
	ld	WA,(XSP+4)
	and	W,0xE1
	or	W,0x18
	ld	HL,(0x5A82)
	ld	(XHL+),XWA
	ld	(0x5A82),HL
	ld	WA,(XSP+4)
	and	W,0x1E
	srl	1,W
	ld	HL,(0x5A84)
	ld	(XHL+),W
	ld	(0x5A84),HL
sub_206BFF.skip:
	incw	1,(XSP+4)
	inc	1,C
	cp	C,QB
	jr	C,sub_206BFF.loop
	ld	C,0
	inc	1,E
	cp	E,QD
	jr	C,sub_206BFF.loop
sub_206BFF.skip2:
	inc	6,XSP
	ret

c_206C7B	section	code abs=0x206C7B

swp_206C7B:
	cp	DE,0x20
	ld	XHL,0x9000
	jr	C,loc_206C9D
	sub	DE,0x20
	ld	HL,0x9800
	jr	loc_206C9D

c_206C8F	section	code abs=0x206C8F

swp_206C8F:
	ld	XHL,0x9000
	jr	loc_206C9D

c_206C96	section	code abs=0x206C96

swp_206C96:
	ld	XHL,0x9800
	jr	loc_206C9D

c_206C9D	section	code abs=0x206C9D

loc_206C9D:
	cp	DE,0x20
	ret	GE
	cp	BC,0x20
	ret	GE
	ld	QWA,WA
	ld	A,QD
	ld	W,0
	dec	1,WA
	add	WA,DE
	ret	MI
	bit	6,QW
	jr	Z,loc_206C9D.skip
	ld	DE,WA
loc_206C9D.skip:
	ld	A,QB
	ld	W,0
	dec	1,WA
	add	WA,BC
	ret	MI
	bit	7,QW
	jr	Z,loc_206C9D.skip2
	ld	BC,WA
loc_206C9D.skip2:
	ld	WA,QWA
	push	WA
	push	DE
	push	BC
	ld	BC,0
	ld	DE,0
loc_206C9D.loop:
	ld	WA,DE
	bit	6,(XSP+5)
	jr	Z,loc_206C9D.skip3
	neg	WA
loc_206C9D.skip3:
	add	WA,(XSP+2)
	jr	MI,loc_206C9D.skip5
	cp	WA,0x20
	jr	NC,loc_206C9D.skip6
	and	A,0x1F
	ld	QA,A
	ld	WA,BC
	bit	7,(XSP+5)
	jr	Z,loc_206C9D.skip4
	neg	WA
loc_206C9D.skip4:
	add	WA,(XSP)
	jr	MI,loc_206C9D.skip5
	cp	WA,0x20
	jr	NC,loc_206C9D.skip5
	ld	QW,0
	sll	11,WA
	sll	6,XWA
	ld	WA,(XSP+4)
	ld	(XHL+QWA),WA
loc_206C9D.skip5:
	incw	1,(XSP+4)
	inc	1,C
	cp	C,QB
	jr	C,loc_206C9D.loop
	ld	C,0
	inc	1,E
	cp	E,QD
	jr	C,loc_206C9D.loop
loc_206C9D.skip6:
	inc	6,XSP
	ret

c_208926	section	code abs=0x208926

swp_208926:
	ret

c_208927	section	code abs=0x208927

swp_208927:
	or	WA,1
	ret

c_20892C	section	code abs=0x20892C

swp_20892C:
	or	WA,2
	ret

c_208931	section	code abs=0x208931

swp_208931:
	or	WA,4
	ret

c_208936	section	code abs=0x208936

swp_208936:
	or	WA,8
	ret

c_20893B	section	code abs=0x20893B

swp_20893B:
	or	WA,0x10
	ret

c_208940	section	code abs=0x208940

swp_208940:
	or	WA,0x20
	ret

c_208945	section	code abs=0x208945

swp_208945:
	or	WA,0x40
	ret

c_20894A	section	code abs=0x20894A

swp_20894A:
	or	WA,0x80
	ret

c_20894F	section	code abs=0x20894F

swp_20894F:
	addw	(wUnitMaxHP),0x19
	ret

c_208956	section	code abs=0x208956

swp_208956:
	addw	(wUnitMaxHP),0x32
	ret

c_20895D	section	code abs=0x20895D

swp_20895D:
	addw	(wUnitMaxHP),0x50
	ret

c_208964	section	code abs=0x208964

swp_208964:
	addw	(wUnitMaxEP),0xF
	ret

c_20896B	section	code abs=0x20896B

swp_20896B:
	addw	(wUnitMaxEP),0x1E
	ret

c_208972	section	code abs=0x208972

swp_208972:
	addw	(wUnitMaxEP),0x3C
	ret

c_208979	section	code abs=0x208979

swp_208979:
	addw	(wUnitAP),0xA
	ret

c_208980	section	code abs=0x208980

swp_208980:
	addw	(wUnitAP),0x14
	ret

c_208987	section	code abs=0x208987

swp_208987:
	addw	(wUnitAP),0x1E
	ret

c_20DB57	section	code abs=0x20DB57

dyn_20DB57:
	call	dyn_20DAB9
	ld	XDE,HeaderCartId
	ld	A,(XDE+)
	cp	A,(XHL+)
	ret	NZ
	cp	XDE,0x200030
	ret	Z
	jr	0x20DB60

c_20DB72	section	code abs=0x20DB72

; [code] A = slot: header copy + 0x26D bytes from wPlayerName into the 0xFA000 flash block (erase + write)
SaveGameSlot:
	or	A,A
	jp	Z,loc_20DBDE
	push	A
	ld	RW3,0x16
	call	BiosCall
	ld	BC,8
	ld	XDE,wTextBuffer
	ld	XHL,0xFA000
	call	sub_2077A6
	pop	A
	call	dyn_20DACC
	add	XHL,0x4000
	ld	XDE,XHL
	ld	XHL,HeaderCartId
	ld	BC,0x10
	ldir	(XDE+),(XHL+)
	ld	XHL,wPlayerName
	ld	BC,0x26D
	ldir	(XDE+),(XHL+)
SaveGameSlot.loop:
	ld	B,0x11
	call	swp_20776F
	cp	RA3,0
	jr	NZ,SaveGameSlot.loop
	ld	BC,8
	ld	XDE,0xFA000
	ld	XHL,wTextBuffer
	call	sub_207788
	cp	RA3,0
	jr	NZ,SaveGameSlot.loop
	ld	RW3,0x15
	call	BiosCall
	ret

c_20DC43	section	code abs=0x20DC43

sub_20DC43:
	or	A,A
	jp	Z,dyn_20DC65
	call	dyn_20DAB9
	add	XHL,0x10
	ld	XDE,wPlayerName
	ld	BC,0x26D
	ldir	(XDE+),(XHL+)
	ldw	(0x5076),0
	ret

c_20DC65	section	code abs=0x20DC65

dyn_20DC65:
	ld	A,0
	call	dyn_20DAB9
	add	XHL,0x10
	ld	XDE,wOptionMessageSpeed
	ld	BC,2:16
	ldir	(XDE+),(XHL+)
	ret

c_20DCA0	section	code abs=0x20DCA0

; [code+play] Works > Data > Load: slot list, confirm, sub_20DC43 copies the slot into wPlayerName..
WorksLoadTask:
	calr	swp_20DC7C
	ldw	(XIZ+TASK_FUNC),0xDCAD
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jp	Z,EndTask
	calr	sub_20DF80
	ld	XHL,swp_20E131
	call	StartChildTask
	task_wait
	cpb	(wYesNoChoice),1
	jr	Z,WorksLoadTask.skip
	calr	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),0xDCAD
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
WorksLoadTask.skip:
	ld	A,(wSaveSlot)
	call	sub_20DC43
	calr	sub_20E012
	ld	XHL,swp_20E1BC
	call	StartChildTask
	task_wait
	call	EndTask
	ret

c_20DD24	section	code abs=0x20DD24

swp_20DD24:
	ldb	(wSaveMenuMode),1
	ldb	(wSaveSlot),1
	call	dyn_206825
	calr	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),0xDD3F
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ld	XHL,SaveSlotSelectTask
	call	StartChildTask
	task_wait
	cpb	(wSaveSlot),0
	jp	Z,EndTask
	calr	sub_20DF80
	ld	XHL,swp_20E131
	call	StartChildTask
	task_wait
	cpb	(wYesNoChoice),1
	jr	Z,swp_20DD24.skip
	calr	DrawSaveSlotList
	ldw	(XIZ+TASK_FUNC),0xDD3F
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret
swp_20DD24.skip:
	ld	A,(wSaveSlot)
	call	SaveGameSlot
	calr	sub_20E012
	ld	XHL,swp_20E1BC
	call	StartChildTask
	task_wait
	ldw	(XIZ+TASK_FUNC),0xDD24
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_20DF5B	section	code abs=0x20DF5B

swp_20DF5B:
	nop
	push	IX
	retd	1025
	db	0xFF,0x00,0x33,0x01,0x16,0x05,0xFF,0x00,0x23,0x0C,0x05,0x01,0x12,0xFF,0xFE,0x00
	db	0x00,0x00,0x00,0x00,0x65,0x2E,0x2F,0x2E,0x25,0x65,0xFF,0x2C,0x6E,0x6D,0x70,0x6F

c_20DF80	section	code abs=0x20DF80

sub_20DF80:
	ld	A,(XIZ+0x10)
	ld	C,0x12
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0x98
	call	OpenTextBox
	cpb	(wSaveMenuMode),0
	ld	XHL,swp_20DFCE
	jr	Z,sub_20DF80.skip
	cpb	(wSaveMenuMode),2
	ld	XHL,ClearOkYesNoText
	jr	Z,sub_20DF80.skip
	ld	A,(wSaveSlot)
	call	dyn_20DB57
	ld	XHL,OverOkYesNoText
	jr	Z,sub_20DF80.skip
	ld	XHL,SaveOkYesNoText
sub_20DF80.skip:
	ld	A,(XIZ+0x10)
	call	DrawBoxString
	ld	C,1
	ld	E,0x28
	call	PlaceTextBoxXWA
	ret

c_20DFCE	section	code abs=0x20DFCE

swp_20DFCE:
	push	IX
	retd	1025

c_20E012	section	code abs=0x20E012

sub_20E012:
	ld	A,(XIZ+0x10)
	ld	C,0x12
	ld	E,3
	ld	HL,(XIZ+TASK_ARG)
	add	HL,0x98
	call	OpenTextBox
	cpb	(wSaveMenuMode),0
	ld	XHL,swp_20E051
	jr	Z,sub_20E012.skip
	cpb	(wSaveMenuMode),2
	ld	XHL,0x20E062
	jr	Z,sub_20E012.skip
	ld	XHL,0x20E073
sub_20E012.skip:
	ld	A,(XIZ+0x10)
	call	DrawBoxString
	ld	C,1
	ld	E,0x28
	call	PlaceTextBoxXWA
	ret

c_20E051	section	code abs=0x20E051

swp_20E051:
	nop
	push	IX
	retd	1025
	db	0x00,0x23,0x0F,0x0D,0x10,0x0C,0x05,0x14,0x05,0x00,0x00,0xFF,0x00,0x23,0x0C,0x05
	db	0x01,0x12,0x00,0x23,0x0F,0x0D,0x10,0x0C,0x05,0x14,0x05,0x00,0xFF,0x00,0x33,0x01
	db	0x16,0x05,0x00,0x23,0x0F,0x0D,0x10,0x0C,0x05,0x14,0x05,0x00,0x00,0xFF

c_20E084	section	code abs=0x20E084

; [code] task (started by WorksLoadTask, swp_20DD24, title.asm): cursor sprite at slot 0x5DF6, U/D wrap 1-3, A accepts (empty slots, dyn_20DB57 NZ, only when 0x5DF5 = 1 Save, else sound 0x83), B sets 0x5DF6 = 0; EndTask
SaveSlotSelectTask:
	ldw	(XIZ+TASK_FUNC),0xE09A
	ldw	(XIZ+TASK_FUNC_HI),0x20
	cpb	(wSaveSlot),0
	jr	NZ,SaveSlotSelectTask.skip
	ldb	(wSaveSlot),1
SaveSlotSelectTask.skip:
	ld	E,(wSaveSlot)
	dec	1,E
	mul	DE,0x28
	add	DE,0x2C
	ld	BC,8
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	A,(wJoyPressed)
	bit	BIT_D_UP,A
	jr	NZ,SaveSlotSelectTask.skip2
	bit	1,A
	jr	NZ,SaveSlotSelectTask.skip3
	bit	4,A
	jr	NZ,SaveSlotSelectTask.skip4
	bit	5,A
	jr	NZ,SaveSlotSelectTask.skip6
	ret
SaveSlotSelectTask.skip2:
	ld	WA,0x80
	call	SoundCommand
	decb	1,(wSaveSlot)
	ret	NZ
	ldb	(wSaveSlot),3
	ret
SaveSlotSelectTask.skip3:
	ld	WA,0x80
	call	SoundCommand
	incb	1,(wSaveSlot)
	cpb	(wSaveSlot),4
	ret	C
	ldb	(wSaveSlot),1
	ret
SaveSlotSelectTask.skip4:
	cpb	(wSaveMenuMode),1
	jr	Z,SaveSlotSelectTask.skip5
	ld	A,(wSaveSlot)
	call	dyn_20DB57
	jr	Z,SaveSlotSelectTask.skip5
	ld	WA,0x83
	call	SoundCommand
	ret
SaveSlotSelectTask.skip5:
	ld	WA,0x81
	call	SoundCommand
	call	EndTask
	ret
SaveSlotSelectTask.skip6:
	ld	WA,0x82
	call	SoundCommand
	ldb	(wSaveSlot),0
	call	EndTask
	ret

c_20E131	section	code abs=0x20E131

swp_20E131:
	ldb	(wYesNoChoice),2
	ldw	(XIZ+TASK_FUNC),0xE141
	ldw	(XIZ+TASK_FUNC_HI),0x20
	ret

c_2173C3	section	code abs=0x2173C3

swp_2173C3:
	cp	W,6
	jr	NC,swp_2173C3.skip
	call	GetPartGroupSize
	jr	swp_2173C3.done
swp_2173C3.skip:
	sub	W,5
	call	GetItemGroupSize
swp_2173C3.done:
	ret

c_2173D5	section	code abs=0x2173D5

sub_2173D5:
	cp	W,6
	jr	NC,sub_2173D5.skip
	call	PartGroupToIndex
	call	swp_21B996
	ret
sub_2173D5.skip:
	sub	W,5
	call	ItemGroupToIndex
	call	swp_21B8F3
	ret

c_2173EE	section	code abs=0x2173EE

swp_2173EE:
	cp	W,6
	jr	NC,swp_2173EE.skip
	call	CheckPartGroupIndex
	jr	swp_2173EE.done
swp_2173EE.skip:
	push	WA
	sub	W,5
	call	CheckItemGroupIndex
	pop	WA
swp_2173EE.done:
	ret

c_21740E	section	code abs=0x21740E

; [code] A = race/gender 1-10 -> W = gender bit (0 odd/male), A = race 1-5
SplitRaceGender:
	dec	1,A
	ld	W,A
	and	W,1
	srl	1,A
	inc	1,A
	ret

c_217427	section	code abs=0x217427

loc_217427:
	ld	XHL,0x21742D
	ret
	db	0x59,0x59,0x59,0x59,0x59,0x59,0xFF

c_217434	section	code abs=0x217434

sub_217434:
	call	CheckPartGroupIndex
	jr	NC,sub_217434.done
	call	PartGroupToIndex
	call	sub_21B9B4
	scf
sub_217434.done:
	ret

c_217444	section	code abs=0x217444

swp_217444:
	cp	W,6
	jr	NC,swp_217444.skip
	call	CheckPartGroupIndex
	jr	NC,swp_217444.done
	call	PartGroupToIndex
	call	sub_21B9B4
	ld	WA,(XHL+0xE)
	jr	swp_217444.skip2
swp_217444.skip:
	sub	W,5
	call	CheckItemGroupIndex
	jr	NC,swp_217444.done
	call	ItemGroupToIndex
	call	GetItemAffinity
swp_217444.skip2:
	scf
swp_217444.done:
	ret

c_21746E	section	code abs=0x21746E

swp_21746E:
	ld	XHL,0x217491
swp_21746E.loop:
	or	E,E
	jr	Z,swp_21746E.done
	srl	1,E
	jr	NC,swp_21746E.skip
	push	XHL
	push	DE
	push	BC
	push	WA
	ld	L,(XHL)
	call	swp_2171B9
	pop	WA
	pop	BC
	pop	DE
	pop	XHL
	inc	1,B
swp_21746E.skip:
	inc	1,XHL
	jr	swp_21746E.loop
swp_21746E.done:
	ret
	db	0x6C,0x6E,0x6D,0x70,0x6F,0x6A,0x6B,0x73

c_217499	section	code abs=0x217499

; [code] W = gender, A = engineer level -> DevLevelExpMale/Female
GetDevLevelExp:
	or	W,W
	jr	NZ,GetDevLevelExp.skip
	call	swp_21B9DE
	jr	GetDevLevelExp.done
GetDevLevelExp.skip:
	call	swp_21B9EB
GetDevLevelExp.done:
	ret

c_2174A8	section	code abs=0x2174A8

; [code] W = gender, A = engineer level -> DevLevelBonusMale/Female
GetDevLevelBonus:
	or	W,W
	jr	NZ,GetDevLevelBonus.skip
	call	swp_21B9F8
	jr	GetDevLevelBonus.done
GetDevLevelBonus.skip:
	call	swp_21BA05
GetDevLevelBonus.done:
	ret

c_2174B7	section	code abs=0x2174B7

; [code] A = partner race/gender -> DevPartnerBonus
GetDevPartnerBonus:
	call	swp_21BA12
	ret

c_2174BC	section	code abs=0x2174BC

; [code] A = tool 1-5 -> 5/10/15/20/100 (0x21BA1F)
GetDevToolBonus:
	call	sub_21BA24
	ret

c_2174C1	section	code abs=0x2174C1

; [code] A = min(A, 100)
Cap100:
	cp	A,0x64
	jr	C,Cap100.done
	ld	A,0x64
Cap100.done:
	ret

c_2174C9	section	code abs=0x2174C9

sub_2174C9:
	call	Random
	mul	XWA,0x100
	div	XWA,0x7530
	srl	16,XWA
	ret

c_217583	section	code abs=0x217583

sub_217583:
	xor	A,A
	ld	(wCursorVisible),A
	ld	(0x610D),A
	ld	(0x610E),A
	ld	(0x610F),A
	ld	(0x6110),A
	ld	XHL,swp_2175C4
	call	StartChildTask
	ld	(0x6108),XHL
	ret

c_217620	section	code abs=0x217620

sub_217620:
	ld	(0x6115),A
	ret

c_217625	section	code abs=0x217625

sub_217625:
	ld	(0x611B),A
	ret

c_21762A	section	code abs=0x21762A

swp_21762A:
	ldb	(0x611C),1
	ld	(0x6117),XHL
	ret

c_217757	section	code abs=0x217757

sub_217757:
	pop	XHL
	ld	(0x6123),XHL
sub_217757.loop:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	NZ,sub_217757.skip
	bit	5,A
	jr	NZ,sub_217757.skip2
	jr	sub_217757.loop
sub_217757.skip:
	ld	A,0
	jr	sub_217757.skip3
sub_217757.skip2:
	ld	A,0xFF
sub_217757.skip3:
	ld	XHL,(0x6123)
	jp	XHL

c_21783D	section	code abs=0x21783D

swp_21783D:
	ld	XWA,swp_21783D.done
	ld	(XIZ+TASK_FUNC),XWA
swp_21783D.done:
	ret

c_217846	section	code abs=0x217846

sub_217846:
	xor	WA,WA
	ld	(0x6137),WA
	ld	(0x6135),WA
	ld	XHL,loc_2178A6
	call	StartChildTask
	ret

c_21795E	section	code abs=0x21795E

swp_21795E:
	ld	XWA,(0x613E)
	or	XWA,XWA
	ret

c_217965	section	code abs=0x217965

swp_217965:
	ld	(0x6146),A
	xor	XWA,XWA
	ld	(0x613E),XWA
	ret

c_217970	section	code abs=0x217970

swp_217970:
	ld	A,1
	jp	swp_217965

c_217976	section	code abs=0x217976

swp_217976:
	ld	A,2
	jp	swp_217965

c_21797C	section	code abs=0x21797C

swp_21797C:
	ld	A,3
	jp	swp_217965

c_217982	section	code abs=0x217982

swp_217982:
	ld	A,4
	jp	swp_217965

c_217988	section	code abs=0x217988

swp_217988:
	ld	A,5
	jp	swp_217965

c_217C44	section	code abs=0x217C44

sub_217C44:
	ld	A,8
	ld	(0x614A),A
	ld	A,8
	ld	(0x614B),A
	ld	XHL,MenuLines_217BFC
	ld	(0x614C),XHL
	ld	XHL,MenuCursor_217C2C
	ld	(0x6150),XHL
	ld	XHL,MenuResults_217C3C
	ld	(0x6154),XHL
	jp	loc_2179E0
	db	0x23,0x08,0x01,0x12,0x01,0xFF,0x35,0x2E,0x29,0x34,0xFF,0x25,0x18,0x09,0x14,0xFF
	db	0x00,0x00,0x6F,0x7C,0x21,0x00,0x00,0x01,0x75,0x7C,0x21,0x00,0x00,0x08,0x7A,0x7C
	db	0x21,0x00,0x00,0x00,0x00,0x01,0x00,0x08,0x00,0x01,0xFF

c_217C9A	section	code abs=0x217C9A

sub_217C9A:
	ld	A,3
	ld	(0x614A),A
	ld	A,3
	ld	(0x614B),A
	ld	XHL,0x217C7F
	ld	(0x614C),XHL
	ld	XHL,0x217C91
	ld	(0x6150),XHL
	ld	XHL,0x217C97
	ld	(0x6154),XHL
	jp	loc_2179E0
	db	0x29,0x14,0x05,0x0D,0xFF,0x30,0x01,0x12,0x14,0x13,0xFF,0x25,0x18,0x09,0x14,0xFF
	db	0x00,0x00,0xC5,0x7C,0x21,0x00,0x00,0x01,0xCA,0x7C,0x21,0x00,0x00,0x08,0xD0,0x7C
	db	0x21,0x00,0x00,0x00,0x00,0x01,0x00,0x08,0x01,0x00,0xFF

c_217DD3	section	code abs=0x217DD3

sub_217DD3:
	ld	A,5
	ld	(0x614A),A
	ld	A,5
	ld	(0x614B),A
	ld	XHL,MenuLines_217DA6
	ld	(0x614C),XHL
	ld	XHL,MenuCursor_217DC4
	ld	(0x6150),XHL
	ld	XHL,MenuResults_217DCE
	ld	(0x6154),XHL
	jp	loc_2179E0
	db	0x33,0x01,0x16,0x05,0xFF
	push	IX
	retd	1025
	db	0xFF,0x25,0x18,0x09,0x14,0xFF,0x00,0x00,0xFE,0x7D,0x21,0x00,0x00,0x01,0x03,0x7E
	db	0x21,0x00,0x00,0x08,0x08,0x7E,0x21,0x00,0x00,0x00,0x00,0x01,0x00,0x08,0x00,0x01
	db	0xFF

c_217E28	section	code abs=0x217E28

sub_217E28:
	ld	A,3
	ld	(0x614A),A
	ld	A,3
	ld	(0x614B),A
	ld	XHL,0x217E0D
	ld	(0x614C),XHL
	ld	XHL,0x217E1F
	ld	(0x6150),XHL
	ld	XHL,0x217E25
	ld	(0x6154),XHL
	jp	loc_2179E0

c_217E53	section	code abs=0x217E53

sub_217E53:
	xor	XWA,XWA
	ld	(wListCommand),XWA
	ld	(wListResult),XWA
	call	sub_217F12
	ld	XHL,swp_217FA0
	call	StartChildTask
	ret

c_217EEE	section	code abs=0x217EEE

loc_217EEE:
	ld	A,1
	jp	loc_217EC3

c_217EF4	section	code abs=0x217EF4

swp_217EF4:
	ld	A,2
	jp	loc_217EC3

c_217EFA	section	code abs=0x217EFA

; [code] list command 3: redraw the page through the page-draw callback (0x6162)
RedrawListPage:
	ld	A,3
	jp	loc_217EC3

c_217F00	section	code abs=0x217F00

sub_217F00:
	ld	A,4
	jp	loc_217EC3

c_217F06	section	code abs=0x217F06

; [code] list command 5: cursor on at the current row (0x610C = 1)
ShowListCursor:
	ld	A,5
	jp	loc_217EC3

c_217F0C	section	code abs=0x217F0C

; [code] list command 6: cursor off (0x610C, 0x615E = 0)
HideListCursor:
	ld	A,6
	jp	loc_217EC3

c_217F12	section	code abs=0x217F12

sub_217F12:
	ld	A,3
	ld	C,0xC
	ld	E,0xE
	ld	HL,0x7E
	call	OpenTextBox
	ret

c_217F20	section	code abs=0x217F20

swp_217F20:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_20677A
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	ld	A,3
	ld	C,0xC
	ld	E,0xE
	ld	HL,0x7E
	call	OpenTextBox
	ld	A,3
	call	ClearTextBox
	ld	A,3
	ld	C,0
	ld	E,0
	call	PlaceTextBox
	ret

c_218236	section	code abs=0x218236

swp_218236:
	reti

c_218237	section	code abs=0x218237

swp_218237:
	pushw	0x8229
	ld	A,0

c_21823C	section	code abs=0x21823C

loc_21823C:
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
loc_21823C.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(0x6160)
	jr	C,loc_21823C.skip
	call	swp_217F59
	jp	loc_21823C.skip3
loc_21823C.skip:
	ld	WA,BC
	call	sub_2183A2
	or	A,A
	jr	NZ,loc_21823C.skip2
	ld	XHL,DashText2
	ld	B,D
	ld	C,E
	ld	A,3
	call	swp_2171DF
	jp	loc_21823C.skip3
loc_21823C.skip2:
	and	A,0xF
	push	WA
	ld	WA,BC
	call	ItemGroupToIndex
	call	swp_21B8E4
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	sub_217F78
	pop	DE
	ld	B,8
	ld	C,E
	ld	L,(TimesText2)
	exts	HL
	ld	A,3
	push	DE
	call	swp_2171B9
	pop	DE
	pop	WA
	ld	B,9
	ld	C,E
	ld	E,A
	extz	DE
	ld	WA,0x103
	call	swp_2172A7
loc_21823C.skip3:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	djnz	WA,loc_21823C.loop
	ret

c_218331	section	code abs=0x218331

swp_218331:
	ret

c_218332	section	code abs=0x218332

swp_218332:
	call	sub_21838A
	jr	NC,swp_218332.skip
	call	sub_2188A9
	call	sub_218AD8
	jr	loc_218352
swp_218332.skip:
	calr	sub_218A69
	ld	A,2
	ld	B,8
	ld	XHL,MenuLines_218AA8
	call	swp_217207

c_218352	section	code abs=0x218352

loc_218352:
	call	swp_217684
	call	sub_21838A
	jr	NC,loc_218352.done
	ld	BC,WA
	call	sub_2183A2
	or	A,A
	jr	Z,loc_218352.done
	ld	WA,BC
	call	ItemGroupToIndex
	call	swp_21B8F3
	ld	BC,0
	call	swp_217699
loc_218352.done:
	ret

c_218377	section	code abs=0x218377

swp_218377:
	call	sub_21838A
	jr	NC,loc_218389
	ld	BC,WA
	call	sub_2183A2
	and	A,0xF
	jr	Z,loc_218389

c_218388	section	code abs=0x218388

loc_218388:
	scf

c_218389	section	code abs=0x218389

loc_218389:
	ret

c_21838A	section	code abs=0x21838A

sub_21838A:
	ld	A,(wListPage)
	mul	WA,0xA
	add	A,(wListRow)
	inc	1,A
	ld	W,(0x6182)
	inc	1,W
	call	CheckItemGroupIndex
	ret

c_2183A2	section	code abs=0x2183A2

sub_2183A2:
	call	sub_2196A8
	ret

c_2183A7	section	code abs=0x2183A7

loc_2183A7:
	ld	XHL,swp_218332
	ld	XDE,swp_218377
	jr	0x2183BD

c_2183B3	section	code abs=0x2183B3

sub_2183B3:
	ld	XHL,loc_218352
	ld	XDE,loc_218388
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

c_218488	section	code abs=0x218488

swp_218488:
	reti

c_218489	section	code abs=0x218489

swp_218489:
	pushw	0x847B
	ld	A,0

c_21848E	section	code abs=0x21848E

loc_21848E:
	call	sub_21864A
	call	swp_2173C3
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
	call	sub_21864A
	ld	B,W
	ld	A,(wListPage)
	mul	WA,0xA
	inc	1,A
	ld	C,A
	ld	DE,1
	ld	WA,0xA
loc_21848E.loop:
	push	WA
	push	BC
	push	DE
	ld	A,C
	dec	1,A
	cp	A,(0x6160)
	jr	C,loc_21848E.skip
	call	swp_217F59
	jp	loc_21848E.skip3
loc_21848E.skip:
	ld	WA,BC
	call	sub_218645
	or	A,A
	jr	NZ,loc_21848E.skip2
	ld	XHL,DashText3
	ld	B,D
	ld	C,E
	ld	A,3
	call	swp_2171DF
	jp	loc_21848E.skip3
loc_21848E.skip2:
	and	A,0xF
	push	WA
	ld	WA,BC
	call	sub_21739F
	ld	B,D
	ld	C,E
	ld	A,3
	push	DE
	call	sub_217F78
	pop	DE
	ld	B,8
	ld	C,E
	ld	L,(TimesText3)
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
loc_21848E.skip3:
	pop	DE
	pop	BC
	inc	1,C
	inc	1,E
	pop	WA
	djnz	WA,loc_21848E.loop
	ret

c_218577	section	code abs=0x218577

swp_218577:
	ret

c_218578	section	code abs=0x218578

swp_218578:
	call	swp_218932
	call	swp_21861D
	jr	NC,swp_218578.skip
	call	sub_21862D
	call	sub_21895C
swp_218578.skip:
	jr	loc_2185E9

c_21858C	section	code abs=0x21858C

swp_21858C:
	call	swp_218932
	ld	XHL,(0x616E)
	call	swp_21717A
	jr	NC,swp_21858C.skip
	call	sub_21862D
	ld	(wDevelopMaterial),A
	call	sub_2189B4
swp_21858C.skip:
	jr	loc_2185E9

c_2185A8	section	code abs=0x2185A8

swp_2185A8:
	call	swp_218932
	ld	XHL,(0x616E)
	call	swp_21717A
	jr	NC,swp_2185A8.skip
	call	sub_21862D
	ld	(wDevelopTool),A
	call	sub_2189B4
swp_2185A8.skip:
	jr	loc_2185E9

c_2185C4	section	code abs=0x2185C4

swp_2185C4:
	call	sub_2188A9
	call	sub_218AD8
	call	swp_218932
	call	swp_21861D
	jr	NC,swp_2185C4.skip
	call	sub_21862D
	call	sub_21895C
swp_2185C4.skip:
	jr	loc_2185E9

c_2185E0	section	code abs=0x2185E0

swp_2185E0:
	ld	XHL,swp_21861D
	call	sub_219238

c_2185E9	section	code abs=0x2185E9

loc_2185E9:
	call	swp_217684
	call	sub_21862D
	jr	NC,loc_2185E9.done
	ld	BC,WA
	call	sub_218645
	or	A,A
	jr	Z,loc_2185E9.done
	ld	WA,BC
	call	sub_2173D5
	ld	BC,0
	call	swp_217699
loc_2185E9.done:
	ret

c_21860A	section	code abs=0x21860A

swp_21860A:
	call	sub_21862D
	jr	NC,loc_21861C
	ld	BC,WA
	call	sub_218645
	and	A,0xF
	jr	Z,loc_21861C

c_21861B	section	code abs=0x21861B

loc_21861B:
	scf

c_21861C	section	code abs=0x21861C

loc_21861C:
	ret

c_21861D	section	code abs=0x21861D

swp_21861D:
	call	sub_21862D
	ret	NC
	call	sub_218645
	or	A,A
	ret	Z
	scf
	ret

c_21862D	section	code abs=0x21862D

sub_21862D:
	ld	A,(wListPage)
	mul	WA,0xA
	add	A,(wListRow)
	inc	1,A
	call	sub_21864A
	push	WA
	call	swp_2173EE
	pop	WA
	ret

c_218645	section	code abs=0x218645

sub_218645:
	call	sub_219701
	ret

c_21864A	section	code abs=0x21864A

sub_21864A:
	push	XHL
	ld	XHL,0x21865B
	ld	W,(0x6183)
	ld	W,(XHL+W)
	pop	XHL
	ret
	db	0x01,0x02,0x03,0x04,0x05,0x05,0x09,0x08

c_218663	section	code abs=0x218663

loc_218663:
	ld	XHL,swp_2185C4
	ld	XDE,swp_21860A
	jr	loc_2186A3

c_21866F	section	code abs=0x21866F

sub_21866F:
	ld	A,5
	ld	XHL,swp_218578
	ld	XDE,swp_21860A
	jr	loc_2186A3

c_21867D	section	code abs=0x21867D

sub_21867D:
	ld	A,6
	ld	XHL,swp_21858C
	ld	XDE,swp_21860A
	jr	loc_2186A3

c_21868B	section	code abs=0x21868B

sub_21868B:
	ld	A,7
	ld	XHL,swp_2185A8
	ld	XDE,swp_21860A
	jr	loc_2186A3

c_218699	section	code abs=0x218699

sub_218699:
	ld	XHL,swp_2185E0
	ld	XDE,loc_21861B

c_2186A3	section	code abs=0x2186A3

loc_2186A3:
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

c_218743	section	code abs=0x218743

swp_218743:
	ld	A,1
	ld	(0x6161),A
	ld	XHL,SetupText2
	ld	A,3
	ld	BC,0
	call	swp_2171DF
	ld	A,3
	ld	B,8
	ld	XHL,MenuLines_218713
	call	swp_217207
	call	swp_21963B
	call	sub_21739F
	ld	BC,0x301
	ld	WA,3
	call	swp_2171DF
	call	swp_219645
	call	sub_21739F
	ld	BC,0x303
	ld	WA,3
	call	swp_2171DF
	call	swp_219640
	call	sub_21739F
	ld	BC,0x304
	ld	WA,3
	call	swp_2171DF
	call	swp_21964A
	call	sub_21739F
	ld	BC,0x305
	ld	WA,3
	call	swp_2171DF
	call	swp_21964F
	call	sub_21739F
	ld	BC,0x306
	ld	WA,3
	call	swp_2171DF
	call	swp_219654
	call	sub_21739F
	ld	BC,0x307
	ld	WA,3
	call	swp_2171DF
	call	sub_219659
	call	sub_21739F
	ld	BC,0x309
	ld	WA,3
	call	swp_2171DF
	call	sub_21965E
	call	sub_21739F
	ld	BC,0x30A
	ld	WA,3
	call	swp_2171DF
	ret

c_2187EC	section	code abs=0x2187EC

swp_2187EC:
	ret

c_2187ED	section	code abs=0x2187ED

swp_2187ED:
	call	swp_217684
	call	sub_21880C
	jr	NC,swp_2187ED.done
	call	sub_218846
	ld	BC,0
	call	swp_217699
swp_2187ED.done:
	ret

c_218802	section	code abs=0x218802

swp_218802:
	ld	A,(wListRow)
	cp	A,0
	ret	Z
	scf
	ret

c_21880C	section	code abs=0x21880C

sub_21880C:
	ld	A,(wListRow)
	sll	2,A
	ld	XHL,0x218826
	ld	XHL,(XHL+A)
	call	swp_21717A
	call	swp_2173EE
	ret
	db	0x3B,0x96,0x21,0x00,0x45,0x96,0x21,0x00,0x40,0x96,0x21,0x00,0x4A,0x96,0x21,0x00
	db	0x4F,0x96,0x21,0x00,0x54,0x96,0x21,0x00,0x59,0x96,0x21,0x00,0x5E,0x96,0x21,0x00

c_218846	section	code abs=0x218846

sub_218846:
	call	sub_2173D5
	ret

c_21884B	section	code abs=0x21884B

sub_21884B:
	ld	A,8
	ld	(0x615F),A
	ld	XHL,swp_218743
	ld	(0x6162),XHL
	ld	XHL,swp_2187EC
	ld	(0x6166),XHL
	ld	XHL,swp_2187ED
	ld	(0x616A),XHL
	ld	XHL,swp_218802
	ld	(0x616E),XHL
	ld	XHL,ListCursor_2186D4
	ld	(0x6172),XHL
	jp	loc_217EEE

c_218882	section	code abs=0x218882

sub_218882:
	ld	(0x6184),A
	ld	XHL,0x2188A1
	ld	A,(XHL+A)
	cp	A,5
	jp	NC,sub_218882.skip
	jp	loc_218663
sub_218882.skip:
	ld	A,0
	jp	loc_2183A7
	db	0x00,0x04,0x04,0x01,0x02,0x03,0x05,0x05

c_2188A9	section	code abs=0x2188A9

sub_2188A9:
	cpb	(0x6184),6
	jr	NC,sub_2188A9.skip
	call	sub_21862D
	jr	NC,sub_2188A9.skip2
	jr	sub_2188A9.skip3
sub_2188A9.skip:
	call	sub_21838A
	jr	NC,sub_2188A9.skip2
	add	W,5
	jr	sub_2188A9.skip3
sub_2188A9.skip2:
	ld	WA,0
sub_2188A9.skip3:
	ld	BC,WA
	ld	A,(0x6184)
	sll	2,A
	ld	XHL,0x2188DF
	ld	XHL,(XHL+A)
	ld	WA,BC
	call	swp_21717A
	ret
	db	0x63,0x96,0x21,0x00,0x6D,0x96,0x21,0x00,0x68,0x96,0x21,0x00,0x72,0x96,0x21,0x00
	db	0x77,0x96,0x21,0x00,0x7C,0x96,0x21,0x00,0x81,0x96,0x21,0x00,0x86,0x96,0x21,0x00

c_2188FF	section	code abs=0x2188FF

sub_2188FF:
	ld	XHL,swp_21890A
	call	StartChildTask
	ret

c_21892D	section	code abs=0x21892D

swp_21892D:
	call	EndTask
	ret

c_218932	section	code abs=0x218932

swp_218932:
	ld	A,4
	call	sub_21734E
	ret

c_21895C	section	code abs=0x21895C

sub_21895C:
	call	sub_218965
	call	sub_21896A
	ret

c_218965	section	code abs=0x218965

sub_218965:
	ld	(0x6189),WA
	ret

c_21896A	section	code abs=0x21896A

sub_21896A:
	ld	A,4
	call	sub_21734E
	ld	WA,(0x6189)
	or	WA,WA
	jr	Z,sub_21896A.done
	call	sub_217434
	ld	WA,(XHL+0xC)
	ld	(0x618B),A
	ld	WA,(XHL+0xE)
	ld	(0x618C),A
	ld	XHL,0x218959
	ld	WA,4
	call	swp_2171DF
	ld	BC,0x200
	ld	E,(0x618B)
	ld	WA,0x204
	call	swp_2172A7
	ld	BC,0x500
	ld	E,(0x618C)
	ld	WA,0x304
	call	swp_21746E
sub_21896A.done:
	ret
	db	0x52,0xFF

c_2189B4	section	code abs=0x2189B4

sub_2189B4:
	call	UpdateDevelopChance
	call	sub_218A34
	ret

c_2189BD	section	code abs=0x2189BD

; [code+play] wDevelopChance = recipe pct + level/partner/tool bonuses (0x6190 in play)
UpdateDevelopChance:
	ld	W,(wDevelopArm)
	ld	A,(wDevelopMaterial)
	call	GetRecipe
	ld	A,(XHL+0)
	ld	(wDevelopChance),A
	ld	A,(XHL+1)
	ld	(wDevelopResult),A
	ld	A,(XHL+2)
	ld	(wDevelopExp),A
	ld	A,(wDevelopChance)
	or	A,A
	jp	MI,UpdateDevelopChance.done
	ld	A,(wWorksPartnerRace)
	call	SplitRaceGender
	ld	A,(wWorksEngineerLevel)
	call	GetDevLevelBonus
	add	A,(wDevelopChance)
	call	Cap100
	ld	(wDevelopChance),A
	ld	A,(wWorksPartnerRace)
	call	GetDevPartnerBonus
	add	A,(wDevelopChance)
	call	Cap100
	ld	(wDevelopChance),A
	ld	A,(wDevelopTool)
	or	A,A
	jr	Z,UpdateDevelopChance.done
	jr	MI,UpdateDevelopChance.done
	call	GetDevToolBonus
	add	A,(wDevelopChance)
	call	Cap100
	ld	(wDevelopChance),A
UpdateDevelopChance.done:
	ret

c_218A34	section	code abs=0x218A34

sub_218A34:
	ld	A,4
	call	sub_21734E
	ld	A,(wDevelopChance)
	or	A,A
	jp	MI,sub_218A34.done
	ld	BC,0x400
	ld	XHL,0x2189B2
	ld	WA,4
	call	swp_2171DF
	ld	BC,0x100
	ld	E,(wDevelopChance)
	ld	WA,0x304
	call	swp_217299
sub_218A34.done:
	ret

c_218A62	section	code abs=0x218A62

sub_218A62:
	ld	A,4
	call	sub_21734E
	ret

c_218A69	section	code abs=0x218A69

sub_218A69:
	ld	A,2
	call	sub_21734E
	ret

c_218AD8	section	code abs=0x218AD8

sub_218AD8:
	call	sub_218AE1
	call	sub_218E1A
	ret

c_218AE1	section	code abs=0x218AE1

sub_218AE1:
	ldw	(wSetupStats),0
	ldw	(0x6195),0
	ldw	(0x6197),0
	ldw	(0x6199),0
	ldw	(0x619B),0
	ldw	(0x619D),0
	ldw	(0x619F),0
	ldw	(0x61A1),0
	call	sub_218EA7
	jp	NC,sub_218AE1.done
	call	CalcSetupStats
sub_218AE1.done:
	ret

c_218B1F	section	code abs=0x218B1F

; [code+play] Setup stats 0x6193-0x61A1 = pilot stats + each Works-list part + accessories
CalcSetupStats:
	ldw	(0x6197),(wPilotAP)
	ldw	(0x6199),(wPilotAP)
	ldw	(0x619B),(wPilotSP)
	ldw	(0x619D),(wPilotRP)
	ldw	(0x619F),(wPilotMP)
	call	swp_21963B
	or	WA,WA
	jr	Z,CalcSetupStats.skip
	call	sub_217434
	ldw	(wSetupStats),(XHL+0)
	ldw	(0x6195),(XHL+2)
	ldw	(0x61A1),(XHL+0xE)
	ld	WA,(XHL+4)
	add	(0x6197),WA
	add	(0x6199),WA
	ld	WA,(XHL+6)
	add	(0x619B),WA
	ld	WA,(XHL+8)
	add	(0x619D),WA
	ld	WA,(XHL+0xA)
	add	(0x619F),WA
CalcSetupStats.skip:
	call	swp_21964A
	or	WA,WA
	jr	Z,CalcSetupStats.skip2
	call	sub_217434
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(0x6195),WA
	ld	WA,(XHL+4)
	add	(0x6197),WA
	add	(0x6199),WA
	ld	WA,(XHL+6)
	add	(0x619B),WA
	ld	WA,(XHL+8)
	add	(0x619D),WA
	ld	WA,(XHL+0xA)
	add	(0x619F),WA
CalcSetupStats.skip2:
	call	swp_219645
	or	WA,WA
	jr	Z,CalcSetupStats.skip3
	call	sub_217434
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(0x6195),WA
	ld	WA,(XHL+4)
	add	(0x6199),WA
	ld	WA,(XHL+6)
	add	(0x619B),WA
	ld	WA,(XHL+8)
	add	(0x619D),WA
	ld	WA,(XHL+0xA)
	add	(0x619F),WA
CalcSetupStats.skip3:
	call	swp_219640
	or	WA,WA
	jr	Z,CalcSetupStats.skip4
	call	sub_217434
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(0x6195),WA
	ld	WA,(XHL+4)
	add	(0x6197),WA
	ld	WA,(XHL+6)
	add	(0x619B),WA
	ld	WA,(XHL+8)
	add	(0x619D),WA
	ld	WA,(XHL+0xA)
	add	(0x619F),WA
CalcSetupStats.skip4:
	call	swp_21964F
	or	WA,WA
	jr	Z,CalcSetupStats.skip5
	call	sub_217434
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(0x6195),WA
	ld	WA,(XHL+4)
	add	(0x6197),WA
	add	(0x6199),WA
	ld	WA,(XHL+6)
	add	(0x619B),WA
	ld	WA,(XHL+8)
	add	(0x619D),WA
	ld	WA,(XHL+0xA)
	add	(0x619F),WA
CalcSetupStats.skip5:
	call	swp_219654
	or	WA,WA
	jr	Z,CalcSetupStats.skip6
	call	sub_217434
	ld	WA,(XHL+0)
	add	(wSetupStats),WA
	ld	WA,(XHL+2)
	add	(0x6195),WA
	ld	WA,(XHL+4)
	add	(0x6197),WA
	add	(0x6199),WA
	ld	WA,(XHL+6)
	add	(0x619B),WA
	ld	WA,(XHL+8)
	add	(0x619D),WA
	ld	WA,(XHL+0xA)
	add	(0x619F),WA
CalcSetupStats.skip6:
	ld	BC,0
	call	sub_219659
	call	sub_218CAD
	call	sub_21965E
	call	sub_218CAD
	or	BC,BC
	ret	OV
	ld	(0x61A1),BC
	ret

c_218CAD	section	code abs=0x218CAD

sub_218CAD:
	or	WA,WA
	ret	Z
	cp	A,0x26
	ret	NC
	extz	WA
	sll	2,WA
	ld	XHL,Data_218CC9
	lda	XHL,XHL+WA
	ld	XHL,(XHL)
	jp	XHL

d_218CC9	section	romdata abs=0x218CC9
; [code] sub_218CAD: routine per WA = 1-0x25 (entry 0 is never used: WA = 0 returns first)
Data_218CC9:
	dl	swp_218D61,swp_218D62,swp_218D67,swp_218D6C
	dl	swp_218D71,swp_218D76,swp_218D7B,swp_218D80
	dl	swp_218D85,swp_218D61,swp_218D61,swp_218D61
	dl	swp_218D61,swp_218D61,swp_218D61,swp_218D61
	dl	swp_218D61,swp_218D61,swp_218D8A,swp_218D91
	dl	swp_218D98,swp_218D9F,swp_218DA6,swp_218DAD
	dl	swp_218DB4,swp_218DC1,swp_218DCE,swp_218DDB
	dl	swp_218DE2,swp_218DE9,swp_218DF0,swp_218DF7
	dl	swp_218DFE,swp_218E05,swp_218E0C,swp_218E13
	dl	swp_218D61,swp_218D61

c_218D61	section	code abs=0x218D61

swp_218D61:
	ret

c_218D62	section	code abs=0x218D62

swp_218D62:
	or	BC,1
	ret

c_218D67	section	code abs=0x218D67

swp_218D67:
	or	BC,2
	ret

c_218D6C	section	code abs=0x218D6C

swp_218D6C:
	or	BC,4
	ret

c_218D71	section	code abs=0x218D71

swp_218D71:
	or	BC,8
	ret

c_218D76	section	code abs=0x218D76

swp_218D76:
	or	BC,0x10
	ret

c_218D7B	section	code abs=0x218D7B

swp_218D7B:
	or	BC,0x20
	ret

c_218D80	section	code abs=0x218D80

swp_218D80:
	or	BC,0x40
	ret

c_218D85	section	code abs=0x218D85

swp_218D85:
	or	BC,0x80
	ret

c_218D8A	section	code abs=0x218D8A

swp_218D8A:
	addw	(wSetupStats),0x19
	ret

c_218D91	section	code abs=0x218D91

swp_218D91:
	addw	(wSetupStats),0x32
	ret

c_218D98	section	code abs=0x218D98

swp_218D98:
	addw	(wSetupStats),0x50
	ret

c_218D9F	section	code abs=0x218D9F

swp_218D9F:
	addw	(0x6195),0xF
	ret

c_218DA6	section	code abs=0x218DA6

swp_218DA6:
	addw	(0x6195),0x1E
	ret

c_218DAD	section	code abs=0x218DAD

swp_218DAD:
	addw	(0x6195),0x3C
	ret

c_218DB4	section	code abs=0x218DB4

swp_218DB4:
	addw	(0x6197),0xA
	addw	(0x6199),0xA
	ret

c_218DC1	section	code abs=0x218DC1

swp_218DC1:
	addw	(0x6197),0x14
	addw	(0x6199),0x14
	ret

c_218DCE	section	code abs=0x218DCE

swp_218DCE:
	addw	(0x6197),0x1E
	addw	(0x6199),0x1E
	ret

c_218DDB	section	code abs=0x218DDB

swp_218DDB:
	addw	(0x619B),0xA
	ret

c_218DE2	section	code abs=0x218DE2

swp_218DE2:
	addw	(0x619B),0x14
	ret

c_218DE9	section	code abs=0x218DE9

swp_218DE9:
	addw	(0x619B),0x1E
	ret

c_218DF0	section	code abs=0x218DF0

swp_218DF0:
	addw	(0x619D),0xA
	ret

c_218DF7	section	code abs=0x218DF7

swp_218DF7:
	addw	(0x619D),0x14
	ret

c_218DFE	section	code abs=0x218DFE

swp_218DFE:
	addw	(0x619D),0x1E
	ret

c_218E05	section	code abs=0x218E05

swp_218E05:
	addw	(0x619F),0xA
	ret

c_218E0C	section	code abs=0x218E0C

swp_218E0C:
	addw	(0x619F),0x14
	ret

c_218E13	section	code abs=0x218E13

swp_218E13:
	addw	(0x619F),0x1E
	ret

c_218E1A	section	code abs=0x218E1A

sub_218E1A:
	ld	A,2
	call	sub_21734E
	ld	A,2
	ld	B,8
	ld	XHL,MenuLines_218AA8
	call	swp_217207
	call	sub_218EA7
	jp	NC,sub_218E1A.done
	ld	BC,0x300
	ld	DE,(wSetupStats)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x301
	ld	DE,(0x6195)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x302
	ld	DE,(0x6199)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x303
	ld	DE,(0x6197)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x304
	ld	DE,(0x619B)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x305
	ld	DE,(0x619D)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x306
	ld	DE,(0x619F)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x308
	ld	E,(0x61A1)
	ld	WA,0x302
	call	swp_21746E
sub_218E1A.done:
	ret

c_218EA7	section	code abs=0x218EA7

sub_218EA7:
	call	swp_21963B
	call	sub_218EFD
	ret	NC
	call	swp_219640
	call	sub_218EFD
	ret	NC
	call	swp_219645
	call	sub_218EFD
	ret	NC
	call	swp_21964A
	call	sub_218EFD
	ret	NC
	call	swp_21964F
	call	sub_218EFD
	ret	NC
	call	swp_219654
	call	sub_218EFD
	ret	NC
	call	sub_219659
	call	sub_218EF8
	ret	NC
	call	sub_21965E
	call	sub_218EF8
	ret	NC
	ret

c_218EF8	section	code abs=0x218EF8

sub_218EF8:
	or	WA,WA
	scf
	ret	Z

c_218EFD	section	code abs=0x218EFD

sub_218EFD:
	call	sub_219701
	ret	NC
	or	A,A
	ret	Z
	scf
	ret

c_218F09	section	code abs=0x218F09

sub_218F09:
	call	sub_218F12
	call	sub_218F17
	ret

c_218F12	section	code abs=0x218F12

sub_218F12:
	call	CopyEquipToWorks
	ret

c_218F17	section	code abs=0x218F17

sub_218F17:
	ld	A,2
	call	sub_21734E
	call	swp_21963B
	call	sub_21739F
	ld	BC,0
	ld	WA,2
	call	swp_2171DF
	call	swp_219645
	call	sub_21739F
	ld	BC,1
	ld	WA,2
	call	swp_2171DF
	call	swp_219640
	call	sub_21739F
	ld	BC,2
	ld	WA,2
	call	swp_2171DF
	call	swp_21964A
	call	sub_21739F
	ld	BC,3
	ld	WA,2
	call	swp_2171DF
	call	swp_21964F
	call	sub_21739F
	ld	BC,4
	ld	WA,2
	call	swp_2171DF
	call	swp_219654
	call	sub_21739F
	ld	BC,5
	ld	WA,2
	call	swp_2171DF
	call	sub_219659
	call	sub_21739F
	ld	BC,7
	ld	WA,2
	call	swp_2171DF
	call	sub_21965E
	call	sub_21739F
	ld	BC,8
	ld	WA,2
	call	swp_2171DF
	ret
	db	0x2D,0x01,0x13,0x14,0x05,0x12,0xFF

c_218FFB	section	code abs=0x218FFB

sub_218FFB:
	call	sub_219004
	call	sub_219048
	ret

c_219004	section	code abs=0x219004

sub_219004:
	ld	XHL,(wPartnerNamePtrCopy)
	ld	(0x61A3),XHL
	xor	A,A
	ld	(0x61A7),A
	ld	A,(wWorksPartnerRace)
	ld	(0x61A8),A
	ld	A,(wWorksEngineerLevel)
	ld	(0x61A9),A
	ld	A,(wEmblemBitsCopy)
	ld	(0x61AA),A
	ld	WA,(wEngineerExp)
	ld	(0x61AB),A
	ret

c_219048	section	code abs=0x219048

sub_219048:
	ld	A,2
	call	sub_21734E
	ld	XHL,loc_218FA6
	ld	BC,2
	ld	WA,2
	call	swp_2171DF

c_21911A	section	code abs=0x21911A

; [code] zeroes 0x61AC-0x61AE, wDevelopArm, wDevelopMaterial, wDevelopTool; only caller WorksDevelopMenu
ClearDevelopChoices:
	ldb	(0x61AC),0
	ldb	(0x61AD),0
	ldb	(0x61AE),0
	ldb	(wDevelopArm),0
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	ret

c_219139	section	code abs=0x219139

sub_219139:
	call	sub_219142
	call	sub_219143
	ret

c_219142	section	code abs=0x219142

sub_219142:
	ret

c_219143	section	code abs=0x219143

sub_219143:
	ld	A,2
	call	sub_21734E
	ld	A,2
	ld	B,3
	ld	XHL,0x219108
	call	swp_217207
	ld	XHL,0x2190EB
	ld	A,(0x61AC)
	or	A,A
	jr	Z,sub_219143.skip
	ld	W,5
	call	sub_21739F
sub_219143.skip:
	ld	A,2
	ld	BC,1
	call	swp_2171DF
	ld	XHL,0x2190EB
	ld	A,(0x61AD)
	or	A,A
	jr	Z,sub_219143.skip2
	ld	W,9
	call	sub_21739F
sub_219143.skip2:
	ld	A,2
	ld	BC,4
	call	swp_2171DF
	ld	XHL,0x2190EB
	ld	A,(0x61AE)
	or	A,A
	jr	Z,sub_219143.skip3
	ld	XHL,0x2190F2
	jr	MI,sub_219143.skip3
	ld	W,8
	call	sub_21739F
sub_219143.skip3:
	ld	A,2
	ld	BC,7
	call	swp_2171DF
	ret

c_219238	section	code abs=0x219238

sub_219238:
	ld	(0x61AF),XHL
	call	swp_219256
	call	sub_2192DE
	ret

c_219245	section	code abs=0x219245

sub_219245:
	call	sub_21924E
	call	sub_2192DE
	ret

c_21924E	section	code abs=0x21924E

sub_21924E:
	ld	(0x61B3),WA
	jp	loc_219273

c_219256	section	code abs=0x219256

swp_219256:
	ldw	(0x61B3),0
	call	sub_21862D
	jp	NC,loc_2192D7
	ld	(0x61B3),WA
	ld	XHL,(0x61AF)
	call	swp_21717A
	jr	NC,loc_2192D7

c_219273	section	code abs=0x219273

loc_219273:
	ldw	(0x61B5),0
	ldw	(0x61B7),0
	ldw	(0x61B9),0
	ldw	(0x61BB),0
	ldw	(0x61BD),0
	ldw	(0x61BF),0
	ldb	(0x61C1),0
	ld	WA,(0x61B3)
	call	sub_217434
	ld	WA,(XHL+0)
	ld	(0x61B5),WA
	ld	WA,(XHL+2)
	ld	(0x61B7),WA
	ld	WA,(XHL+4)
	ld	(0x61B9),WA
	ld	WA,(XHL+6)
	ld	(0x61BB),WA
	ld	WA,(XHL+8)
	ld	(0x61BD),WA
	ld	WA,(XHL+0xA)
	ld	(0x61BF),WA
	ld	WA,(XHL+0xE)
	ld	(0x61C1),A
	jr	loc_2192DD

c_2192D7	section	code abs=0x2192D7

loc_2192D7:
	ldw	(0x61B3),0

c_2192DD	section	code abs=0x2192DD

loc_2192DD:
	ret

c_2192DE	section	code abs=0x2192DE

sub_2192DE:
	ld	A,2
	ld	B,7
	ld	XHL,MenuLines_2191C8
	call	swp_217207
	cpw	(0x61B3),0
	jp	NZ,sub_2192DE.skip
	ld	A,2
	ld	B,7
	ld	XHL,MenuLines_21920E
	call	swp_217207
	jp	sub_2192DE.done
sub_2192DE.skip:
	ld	BC,0x300
	ld	DE,(0x61B5)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x301
	ld	DE,(0x61B7)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x302
	ld	DE,(0x61B9)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x303
	ld	DE,(0x61BB)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x304
	ld	DE,(0x61BD)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x305
	ld	DE,(0x61BF)
	ld	WA,0x302
	call	swp_21729F
	ld	BC,0x308
	ld	E,(0x61C1)
	ld	WA,0x302
	call	swp_21746E
sub_2192DE.done:
	ret

c_21936A	section	code abs=0x21936A

; [code] clears 12x14 at 0,0 on SCR1 (swp_20677A, 0x9000) and SCR2 (swp_206781, 0x9800), FillTiles 0x7E x 0x1C2, CalcUnitStats, DrawEquippedRobot at tile 0x7E; caller sub_219C22; [play] works_setup_* screens
RedrawEquippedRobot:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_20677A
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_206781
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	call	CalcUnitStats
	ld	WA,0x7E
	ld	BC,0
	ld	DE,2
	call	DrawEquippedRobot
	ret

c_2193A3	section	code abs=0x2193A3

sub_2193A3:
	call	sub_2193AC
	call	DrawDevelopedArm
	ret

c_2193AC	section	code abs=0x2193AC

sub_2193AC:
	ldb	(wDevelopArmImage),1
	ld	A,(wDevelopResult)
	ld	W,5
	call	sub_217434
	jr	NC,sub_2193AC.done
	ld	WA,(XHL+0x12)
	ld	(wDevelopArmImage),A
sub_2193AC.done:
	ret

c_219424	section	code abs=0x219424

sub_219424:
	call	sub_21943E
	call	CopyPlayerInfoToWorks
	call	sub_2194C6
	ret

c_21943E	section	code abs=0x21943E

sub_21943E:
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
	call	sub_21948B
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

sub_21948B:
	ldb	(wEmblemBits),0
	ld	A,EVENT_EMBLEM_GREEN
	call	CheckEventFlagA
	jr	NC,sub_21948B.skip
	orb	(wEmblemBits),2
sub_21948B.skip:
	ld	A,EVENT_EMBLEM_BLUE
	call	CheckEventFlagA
	jr	NC,sub_21948B.skip2
	orb	(wEmblemBits),4
sub_21948B.skip2:
	ld	A,EVENT_EMBLEM_WHITE
	call	CheckEventFlagA
	jr	NC,sub_21948B.skip3
	orb	(wEmblemBits),8
sub_21948B.skip3:
	ld	A,EVENT_EMBLEM_BLACK
	call	CheckEventFlagA
	jr	NC,sub_21948B.done
	orb	(wEmblemBits),0x10
sub_21948B.done:
	ret

c_2194C6	section	code abs=0x2194C6

sub_2194C6:
	ret

c_2194C8	section	code abs=0x2194C8

; [code] equipment slots -> Works list 0x61C3 (category << 8 | id: body, LA, RA, core, legs, back, A1, A2)
CopyEquipToWorks:
	ldw	(wWorksEquip),0
	ldw	(0x61C5),0
	ldw	(0x61C7),0
	ldw	(0x61C9),0
	ldw	(0x61CB),0
	ldw	(0x61CD),0
	ldw	(0x61CF),0
	ldw	(0x61D1),0
	ld	WA,0x200
	or	A,(wEquipCore)
	call	Z,sub_219579
	ld	(0x61C9),WA
	ld	WA,0x100
	or	A,(wEquipBody)
	call	Z,sub_219579
	ld	(wWorksEquip),WA
	ld	WA,0x500
	or	A,(wEquipLeftArm)
	call	Z,sub_219579
	ld	(0x61C5),WA
	ld	WA,0x500
	or	A,(wEquipRightArm)
	call	Z,sub_219579
	ld	(0x61C7),WA
	ld	WA,0x300
	or	A,(wEquipLegs)
	call	Z,sub_219579
	ld	(0x61CB),WA
	ld	WA,0x400
	or	A,(wEquipBack)
	call	Z,sub_219579
	ld	(0x61CD),WA
	ld	WA,0x600
	or	A,(wEquipAcc1)
	call	Z,sub_219579
	ld	(0x61CF),WA
	ld	WA,0x600
	or	A,(wEquipAcc2)
	call	Z,sub_219579
	ld	(0x61D1),WA
	ret

c_219579	section	code abs=0x219579

sub_219579:
	ld	WA,0
	ret

c_21957C	section	code abs=0x21957C

; [code] Works list 0x61C3-0x61D1 back into wEquipBody..wEquipAcc2
CopyWorksToEquip:
	ld	WA,(0x61C9)
	ld	(wEquipCore),A
	ld	WA,(wWorksEquip)
	ld	(wEquipBody),A
	ld	WA,(0x61C5)
	ld	(wEquipLeftArm),A
	ld	WA,(0x61C7)
	ld	(wEquipRightArm),A
	ld	WA,(0x61CB)
	ld	(wEquipLegs),A
	ld	WA,(0x61CD)
	ld	(wEquipBack),A
	ld	WA,(0x61CF)
	ld	(wEquipAcc1),A
	ld	WA,(0x61D1)
	ld	(wEquipAcc2),A
	ret

c_2195BD	section	code abs=0x2195BD

; [code] per slot: if changed, store it, RemoveItem the new part, AddItem the old one
EquipFromWorksList:
	ld	WA,(0x61C9)
	ld	XHL,wEquipCore
	call	sub_219626
	ld	WA,(wWorksEquip)
	ld	XHL,wEquipBody
	call	sub_219626
	ld	WA,(0x61C5)
	ld	XHL,wEquipLeftArm
	call	sub_219626
	ld	WA,(0x61C7)
	ld	XHL,wEquipRightArm
	call	sub_219626
	ld	WA,(0x61CB)
	ld	XHL,wEquipLegs
	call	sub_219626
	ld	WA,(0x61CD)
	ld	XHL,wEquipBack
	call	sub_219626
	ld	WA,(0x61CF)
	ld	XHL,wEquipAcc1
	call	sub_219626
	ld	WA,(0x61D1)
	ld	XHL,wEquipAcc2
	call	sub_219626
	ret

c_219626	section	code abs=0x219626

sub_219626:
	cp	(XHL),A
	ret	Z
	ld	B,W
	ld	C,(XHL)
	ld	(XHL),A
	push	BC
	call	RemoveItemByCategory
	pop	WA
	call	AddItemByCategory
	ret

c_21963B	section	code abs=0x21963B

swp_21963B:
	ld	WA,(wWorksEquip)
	ret

c_219640	section	code abs=0x219640

swp_219640:
	ld	WA,(0x61C5)
	ret

c_219645	section	code abs=0x219645

swp_219645:
	ld	WA,(0x61C7)
	ret

c_21964A	section	code abs=0x21964A

swp_21964A:
	ld	WA,(0x61C9)
	ret

c_21964F	section	code abs=0x21964F

swp_21964F:
	ld	WA,(0x61CB)
	ret

c_219654	section	code abs=0x219654

swp_219654:
	ld	WA,(0x61CD)
	ret

c_219659	section	code abs=0x219659

sub_219659:
	ld	WA,(0x61CF)
	ret

c_21965E	section	code abs=0x21965E

sub_21965E:
	ld	WA,(0x61D1)
	ret

c_219663	section	code abs=0x219663

swp_219663:
	ld	(wWorksEquip),WA
	ret

c_219668	section	code abs=0x219668

swp_219668:
	ld	(0x61C5),WA
	ret

c_21966D	section	code abs=0x21966D

swp_21966D:
	ld	(0x61C7),WA
	ret

c_219672	section	code abs=0x219672

swp_219672:
	ld	(0x61C9),WA
	ret

c_219677	section	code abs=0x219677

swp_219677:
	ld	(0x61CB),WA
	ret

c_21967C	section	code abs=0x21967C

swp_21967C:
	ld	(0x61CD),WA
	ret

c_219681	section	code abs=0x219681

swp_219681:
	ld	(0x61CF),WA
	ret

c_219686	section	code abs=0x219686

swp_219686:
	ld	(0x61D1),WA
	ret

c_21968B	section	code abs=0x21968B

loc_21968B:
	call	CheckItemGroupIndex
	ret	NC
	call	ItemGroupToIndex
	scf
	ret

c_219697	section	code abs=0x219697

swp_219697:
	call	loc_21968B
	ret	NC
	ld	XHL,0x5080
	lda	XHL,XHL+WA
	ret

c_2196C7	section	code abs=0x2196C7

; [code] W = item group, A = index: CheckItemGroupIndex (NC -> return), ItemGroupToIndex + 1, RemoveItem; callers DevelopRoll, ShopMenu
RemoveGroupItem:
	call	loc_21968B
	ret	NC
	inc	1,WA
	call	RemoveItem
	ret

c_2196D4	section	code abs=0x2196D4

sub_2196D4:
	cp	W,6
	jr	C,sub_2196D4.skip
	sub	W,5
	jp	loc_21968B
sub_2196D4.skip:
	call	CheckPartGroupIndex
	ret	NC
	call	PartGroupToIndex
	add	WA,0x100
	scf
	ret

c_2196EF	section	code abs=0x2196EF

swp_2196EF:
	call	sub_2196D4
	ret	NC
	ld	XHL,0x5080
	lda	XHL,XHL+WA
	scf
	ret

c_219701	section	code abs=0x219701

sub_219701:
	call	swp_2196EF
	ret	NC
	ld	A,(XHL)
	ret

c_21970A	section	code abs=0x21970A

swp_21970A:
	call	swp_2196EF
	ret	NC
	ld	(XHL),B
	ret

c_219713	section	code abs=0x219713

; [code] W = category, A = id (Works list form) -> wItemCounts index, AddItem
AddItemByCategory:
	call	sub_2196D4
	ret	NC
	inc	1,WA
	call	AddItem
	ret

c_219720	section	code abs=0x219720

; [code] same, RemoveItem
RemoveItemByCategory:
	call	sub_2196D4
	ret	NC
	inc	1,WA
	call	RemoveItem
	ret

c_219776	section	code abs=0x219776

swp_219776:
	ld	XHL3,0x61E6
	ld	RW3,2
	call	BiosCall
	ret

c_219785	section	code abs=0x219785

; [code+play] C if engineer level < 50 and wEngineerExp <= 0
CheckEngineerLevelUp:
	cpb	(wWorksEngineerLevel),0x32
	jr	NC,CheckEngineerLevelUp.done
	ld	WA,(wEngineerExp)
	cp	WA,1
	jr	PL,CheckEngineerLevelUp.done
	scf
CheckEngineerLevelUp.done:
	ret

c_219796	section	code abs=0x219796

loc_219796:
	cp	A,0xFE
	jr	NZ,loc_219796.skip
	ld	A,(wPlayerRaceCopy)
	jr	loc_219796.skip2
loc_219796.skip:
	cp	A,0xFF
	jr	NZ,loc_219796.skip2
	ld	A,(wWorksPartnerRace)
loc_219796.skip2:
	extz	WA
	push	WA
	ld	WA,HL
	pop	HL
	call	DrawPortraitAt
	ret

c_2198E3	section	code abs=0x2198E3

; [code] shows XHL if the partner is male, XDE if female (SplitRaceGender)
ShowPartnerGenderText:
	call	PickPartnerGenderText
	jp	swp_219849

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

swp_2198FA:
	call	swp_219776
	ld	W,(0x61E7)
	ld	A,(0x61E8)
	ret

c_219907	section	code abs=0x219907

loc_219907:
	call	PlayMusic
	ret

c_21990C	section	code abs=0x21990C

; [code] call SoundCommand; ret
CallSoundCommand:
	call	SoundCommand
	ret

c_219911	section	code abs=0x219911

swp_219911:
	ld	XWA,2
	jp	loc_219907

c_219917	section	code abs=0x219917

swp_219917:
	ldw	(0x61F7),0
	cpb	(0x61F6),6
	jp	NZ,loc_219960
	ld	A,1
	call	sub_21B7F2
	call	RedrawListPage
	call	ShowListCursor
	call	sub_217F00
	ld	A,(0x615B)
	inc	1,A
	ld	(0x61F7),A
	jp	EndMenuTask

c_219947	section	code abs=0x219947

; [code] partner's greeting by time of day / story
WorksGreeting:
	cpb	(0x61F6),4
	jr	Z,WorksGreeting.skip
	cpb	(0x61F6),5
	jr	Z,WorksGreeting.skip
	call	DrawWorksPortraits
	jr	WorksGreeting.done
WorksGreeting.skip:
	call	sub_2197DD
WorksGreeting.done:
	ret

c_219960	section	code abs=0x219960

loc_219960:
	call	WorksGreeting
	call	DrawGP
	cpb	(0x61F6),4
	jp	Z,loc_219BA3
	cpb	(0x61F6),5
	jp	Z,loc_219D1A
	call	swp_219911
	ld	WA,0x22
	call	CallSoundCommand
	cpb	(0x61F6),3
	jp	Z,loc_21AA73
	cpb	(wWorksEngineerLevel),0xA
	jr	C,loc_219960.skip
	ld	A,EVENT_BODY2
	call	CheckEventFlagA
	jr	NZ,loc_219960.skip
	ld	XHL,JustThePersonIText
	ld	XDE,JustThePersonIText2
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	UpgradeBody
	ld	A,EVENT_BODY2
	call	SetEventFlagA
	jp	loc_219960.skip5
loc_219960.skip:
	cpb	(wWorksEngineerLevel),0x1E
	jr	C,loc_219960.skip2
	ld	A,EVENT_BODY3
	call	CheckEventFlagA
	jr	NZ,loc_219960.skip2
	ld	XHL,IveGotSomeGoodText
	ld	XDE,IveGotSomeGoodText2
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	UpgradeBody
	ld	A,EVENT_BODY3
	call	SetEventFlagA
	jp	loc_219960.skip5
loc_219960.skip2:
	ld	A,EVENT_STAGE_LILY
	call	CheckEventFlagA
	jr	Z,loc_219960.skip3
	ld	XHL,ImGladToSeeText
	ld	XDE,ImSoGladToText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	loc_219960.skip5
loc_219960.skip3:
	cpb	(0x61F6),2
	jr	NZ,loc_219960.skip4
	ld	XHL,GoodMorningHowDoText
	ld	XDE,GoodMorningPlayerIText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	loc_219960.skip5
loc_219960.skip4:
	ld	XHL,WelcomeBackEverythingHeresText
	ld	XDE,WelcomeBackIJustText2
	call	ShowPartnerGenderText
	call	Wait30Frames
loc_219960.skip5:
	jp	loc_219A5B

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

loc_219A53:
	call	TaskYield
	call	DrawWorksPortraits

c_219A5B	section	code abs=0x219A5B

loc_219A5B:
	call	DrawGP
	call	sub_217C44
	call	DrawMenuBox
	call	ShowMenuCursor
	call	TaskYield
	call	swp_217982
	ld	XHL,WhatDoYouWantText2
	ld	XDE,WhatDoYouWantText2
	call	ShowPartnerGenderText
	call	WaitForButton
	ldb	(0x61F9),0xFF

c_219A8A	section	code abs=0x219A8A

loc_219A8A:
	call	swp_21795E
	jp	Z,loc_219ADB
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21AA5D
	cp	A,0
	jp	Z,loc_219BA3
	cp	A,1
	jp	Z,loc_219D1A
	cp	A,2
	jp	Z,loc_219E5F
	cp	A,3
	jp	Z,loc_21A005
	cp	A,4
	jp	Z,loc_21A570
	cp	A,5
	jp	Z,loc_21A68F
	cp	A,6
	jp	Z,loc_219F7C
	jp	loc_21AA5D

c_219AD3	section	code abs=0x219AD3

loc_219AD3:
	call	TaskYield
	jp	loc_219A8A

c_219ADB	section	code abs=0x219ADB

loc_219ADB:
	ld	A,(0x6139)
	cp	A,(0x61F9)
	jp	Z,loc_219AD3
	ld	(0x61F9),A
	call	swp_217657
	ld	A,(0x61F9)
	cp	A,8
	jp	NC,loc_219AD3
	sll	2,A
	ld	XHL,0x219B0B
	ld	XHL,(XHL+A)
	jp	XHL
	db	0x63,0x9B,0x21,0x00,0x71,0x9B,0x21,0x00,0x39,0x9B,0x21,0x00,0x2B,0x9B,0x21,0x00
	db	0x55,0x9B,0x21,0x00,0x8D,0x9B,0x21,0x00,0x47,0x9B,0x21,0x00,0x7F,0x9B,0x21,0x00

c_219B2B	section	code abs=0x219B2B

swp_219B2B:
	ld	XHL,ThisLetsYouSeeText
	ld	XDE,ThisLetsYouSeeText
	jp	loc_219B97

c_219B39	section	code abs=0x219B39

swp_219B39:
	ld	XHL,ThisLetsYouSeeText2
	ld	XDE,ThisLetsYouSeeText2
	jp	loc_219B97

c_219B47	section	code abs=0x219B47

swp_219B47:
	ld	XHL,ThisLetsYouSaveText
	ld	XDE,ThisLetsYouSaveText
	jp	loc_219B97

c_219B55	section	code abs=0x219B55

; [code+play] Works menu cursor text: IfYouAttachAText
ShowTradeDescription:
	ld	XHL,IfYouAttachAText
	ld	XDE,IfYouAttachAText
	jp	loc_219B97

c_219B63	section	code abs=0x219B63

; [code+play] Works menu cursor text: YouCanChangeYourText
ShowSetupDescription:
	ld	XHL,YouCanChangeYourText
	ld	XDE,YouCanChangeYourText
	jp	loc_219B97

c_219B71	section	code abs=0x219B71

; [code+play] Works menu cursor text: YouCanMakeNewText
ShowDevelopDescription:
	ld	XHL,YouCanMakeNewText
	ld	XDE,YouCanMakeNewText
	jp	loc_219B97

c_219B7F	section	code abs=0x219B7F

swp_219B7F:
	ld	XHL,ThisTakesYouBackText
	ld	XDE,ThisTakesYouBackText
	jp	loc_219B97

c_219B8D	section	code abs=0x219B8D

; [code+play] "This is your UNITRON's..." / help; Works and Camp stats screens
StatsMenu:
	ld	XHL,DisplaysHelpFilesText
	ld	XDE,DisplaysHelpFilesText

c_219B97	section	code abs=0x219B97

loc_219B97:
	call	PickPartnerGenderText
	call	swp_217699
	jp	loc_219AD3

c_219BA3	section	code abs=0x219BA3

loc_219BA3:
	call	sub_217C9A
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhatDoYouWantText3
	ld	XDE,WhatDoYouWantText3
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_219BA3.skip3
	cp	A,0
	jr	Z,loc_219BA3.skip
	cp	A,1
	jr	Z,loc_219BA3.skip2
	jp	loc_219BA3.skip3
loc_219BA3.skip:
	call	WorksInfoMenus
	jp	loc_219BA3.skip3
loc_219BA3.skip2:
	ld	XHL,ThisIsYourUNITRONsText
	ld	XDE,ThisIsYourUNITRONsText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	CopyEquipToWorks
	call	sub_219C22
	jp	loc_219BA3.skip3
loc_219BA3.skip3:
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	cpb	(0x61F6),4
	jp	Z,loc_21AA5D
	jp	loc_219A53

c_219C22	section	code abs=0x219C22

sub_219C22:
	pop	XHL
	ld	(0x61FC),XHL
	call	sub_2179FE
	call	RedrawEquippedRobot
	xor	A,A
	ld	(0x6200),A
	call	DrawGP
sub_219C22.loop:
	ld	A,(0x6200)
	or	A,A
	jr	NZ,sub_219C22.skip
	call	sub_218AD8
	jr	sub_219C22.loop2
sub_219C22.skip:
	call	sub_218F09
sub_219C22.loop2:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,sub_219C22.skip3
	bit	5,A
	jp	NZ,sub_219C22.skip3
	bit	2,A
	jp	NZ,sub_219C22.skip2
	bit	3,A
	jp	NZ,sub_219C22.skip2
	jp	sub_219C22.loop2
sub_219C22.skip2:
	xorb	(0x6200),1
	jp	sub_219C22.loop
sub_219C22.skip3:
	ld	XHL,(0x61FC)
	jp	XHL

c_219C86	section	code abs=0x219C86

; [code] Stats (your / my status), item data, data list, edit
WorksInfoMenus:
	pop	XHL
	ld	(0x61FC),XHL
	call	sub_2179FE
	xor	A,A
	ld	(0x6200),A
	call	DrawGP
WorksInfoMenus.loop:
	call	swp_217657
	ld	A,(0x6200)
	or	A,A
	jr	NZ,WorksInfoMenus.skip
	ld	XHL,ThisIsYourStatusText
	ld	XDE,ThisIsYourStatusText
	call	ShowPartnerGenderText
	call	sub_219807
	ld	A,0xFE
	call	swp_2197B5
	call	sub_218FC1
	jr	WorksInfoMenus.loop2
WorksInfoMenus.skip:
	ld	XHL,ThisIsMyStatusText
	ld	XDE,ThisIsMyStatusText
	call	ShowPartnerGenderText
	call	sub_219807
	ld	A,0xFF
	call	swp_2197B5
	call	sub_218FFB
WorksInfoMenus.loop2:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,WorksInfoMenus.skip3
	bit	5,A
	jp	NZ,WorksInfoMenus.skip3
	bit	2,A
	jp	NZ,WorksInfoMenus.skip2
	bit	3,A
	jp	NZ,WorksInfoMenus.skip2
	jp	WorksInfoMenus.loop2
WorksInfoMenus.skip2:
	xorb	(0x6200),1
	jp	WorksInfoMenus.loop
WorksInfoMenus.skip3:
	ld	XHL,(0x61FC)
	jp	XHL

c_219D1A	section	code abs=0x219D1A

loc_219D1A:
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,HeresTheItemDataText
	ld	XDE,HeresTheItemDataText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_219D1A.skip
	cp	A,0
	jp	Z,loc_219D1A.loop
	cp	A,1
	jp	Z,loc_219D1A.loop2
	jp	loc_219D1A.skip
loc_219D1A.loop:
	call	sub_217D60
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichPartsDoYouText
	ld	XDE,WhichPartsDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_219D1A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x613B)
	call	sub_218699
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,HeresTheDataListText
	ld	XDE,HeresTheDataListText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	WorksGreeting
	jp	loc_219D1A.loop
loc_219D1A.loop2:
	call	sub_217DD3
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichItemDoYouText
	ld	XDE,WhichItemDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_219D1A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x613B)
	call	sub_2183B3
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,HeresTheDataListText
	ld	XDE,HeresTheDataListText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	WorksGreeting
	jp	loc_219D1A.loop2
loc_219D1A.skip:
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	cpb	(0x61F6),5
	jp	Z,loc_21AA5D
	jp	loc_219A5B

c_219E5F	section	code abs=0x219E5F

loc_219E5F:
	ld	XHL,YouWantToEditText
	ld	XDE,YouWantToEditText
	call	ShowPartnerGenderText
	call	Wait30Frames
loc_219E5F.loop:
	call	sub_217E28
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,DoYouWantToText2
	ld	XDE,DoYouWantToText2
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_219E5F.skip3
	cp	A,0
	jr	Z,loc_219E5F.skip
	cp	A,1
	jr	Z,loc_219E5F.skip2
	jp	loc_219E5F.skip3
loc_219E5F.skip:
	call	WorksHelpMenu
	ldb	(0x6201),0
	ld	XHL,RunWorksSaveTask
	call	StartChildTask
loc_219E5F.loop2:
	call	TaskYield
	cpb	(0x6201),0
	jr	Z,loc_219E5F.loop2
	call	swp_21AB7A
	call	DrawWorksPortraits
	jp	loc_219E5F.loop
loc_219E5F.skip2:
	call	WorksHelpMenu
	ldb	(0x6201),0
	ld	XHL,swp_219F48
	call	StartChildTask
loc_219E5F.loop3:
	call	TaskYield
	cpb	(0x6201),0
	jr	Z,loc_219E5F.loop3
	call	swp_21AB7A
	call	DrawWorksPortraits
	ld	A,(wSaveSlot)
	or	A,A
	jp	NZ,loc_219A5B
	jp	loc_219E5F.loop
loc_219E5F.skip3:
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	loc_219A5B

c_219F1D	section	code abs=0x219F1D

; [code] child swp_20DD24 (0x5DF5 = 1 Save, slot list, SaveGameSlot) with args 0x7E/8, task_wait, then 0x6201 = 1 (polled by loc_219E5F, Data menu choice 0), EndTask
RunWorksSaveTask:
	ld	XHL,swp_20DD24
	call	StartChildTask
	ldw	(XHL+0xE),0x7E
	ldw	(XHL+0x10),8
	task_wait
	ldb	(0x6201),1
	call	EndTask
	ret

c_219F48	section	code abs=0x219F48

swp_219F48:
	ld	XHL,WorksLoadTask
	call	StartChildTask
	ldw	(XHL+0xE),0x7E
	ldw	(XHL+0x10),8
	task_wait
	ldb	(0x6201),1
	call	EndTask
	ret

c_219F73	section	code abs=0x219F73

; [code+play] "Opening help files"; help_p* screens
WorksHelpMenu:
	call	ClearPictureAndTilemaps
	call	swp_2175AF
	ret

c_219F7C	section	code abs=0x219F7C

loc_219F7C:
	ld	XHL,OpeningHelpFilesText
	ld	XDE,OpeningHelpFilesText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	WorksTradeMenu
	ldb	(0x6202),0
	ld	XHL,RunHelpViewerTask
	call	StartChildTask
loc_219F7C.loop:
	call	TaskYield
	cpb	(0x6202),0
	jr	Z,loc_219F7C.loop
	call	swp_21AB7A
	call	DrawWorksPortraits
	call	DrawGP
	ld	XHL,FinishedText
	ld	XDE,FinishedText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	loc_219A5B

c_219FCD	section	code abs=0x219FCD

; [code] after OpeningHelpFilesText (loc_219F7C): child swp_21D509 (draws pages from pointer table 0x25E6B7 by TASK_ARG: "UNITRON Status", "Affinities 1" ...), task_wait, 0x6202 = 1 (polled by loc_219F7C), EndTask; [play] help_p* screens
RunHelpViewerTask:
	ld	XHL,swp_21D509
	call	StartChildTask
	ldw	(XHL+0xE),0x7E
	ldw	(XHL+0x10),8
	task_wait
	ldb	(0x6202),1
	call	EndTask
	ret

c_219FF8	section	code abs=0x219FF8

; [code] link-cable trade (no cable / transmission error)
WorksTradeMenu:
	call	sub_2179FE
	call	ClearPictureAndTilemaps
	call	swp_2175AF
	ret

c_21A005	section	code abs=0x21A005

loc_21A005:
	ld	XHL,YouWantToTradeText
	ld	XDE,YouWantToTradeText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	StartLinkTask
	call	sub_21D1F6
	call	sub_21D25C
	ld	XHL,CheckingText
	ld	XDE,CheckingText
	call	ShowPartnerGenderText
	call	Wait30Frames
	ldw	(0x6203),0
loc_21A005.loop:
	cpw	(0x6203),0x258
	jr	NC,loc_21A005.skip
	call	sub_21D218
	jr	C,loc_21A005.skip
	call	TaskYield
	call	sub_21A443
	jr	NC,loc_21A005.loop
loc_21A005.skip:
	call	sub_21D218
	jp	NC,loc_21A005.skip10
	ld	XHL,LooksLikeTheresNoText
	ld	XDE,LooksLikeTheresNoText
	call	ShowPartnerGenderText
	call	Wait30Frames
	ld	XHL,ReadyToTradeText
	ld	XDE,ReadyToTradeText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jp	NZ,loc_21A005.skip9
loc_21A005.loop2:
	call	sub_21D210
	call	sub_21A32D
	call	sub_21D25C
	call	SetupItemPartsMenu
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhatItemDoYouText
	ld	XDE,WhatItemDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21A005.skip9
	cp	A,0
	jp	Z,loc_21A005.loop3
	cp	A,1
	jp	Z,loc_21A005.loop4
	jp	loc_21A005.skip9
loc_21A005.loop3:
	call	sub_217D60
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichPartDoYouText
	ld	XDE,WhichPartDoYouText
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21A005.loop2
	inc	1,A
	ld	(0x61FB),A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x613B)
	call	sub_21B86C
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhichDoYouChooseText
	ld	XDE,WhichDoYouChooseText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	DrawWorksPortraits
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21A005.loop3
	jp	loc_21A005.skip2
loc_21A005.loop4:
	call	sub_217DD3
	call	DrawMenuBox
	call	ShowMenuCursor
	ld	XHL,WhichItemDoYouText2
	ld	XDE,WhichItemDoYouText2
	call	ShowPartnerGenderText
	call	RunMenuInput
	call	sub_2179FE
	ld	A,(0x613B)
	or	A,A
	jp	MI,loc_21A005.loop2
	add	A,6
	ld	(0x61FB),A
	call	swp_217F20
	call	sub_218A69
	ld	A,(0x613B)
	call	sub_21B7F2
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhichDoYouChooseText
	ld	XDE,WhichDoYouChooseText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	call	DrawWorksPortraits
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21A005.loop4
loc_21A005.skip2:
	inc	1,A
	ld	(0x61FA),A
	ld	WA,(0x61FA)
	call	sub_21D236
	call	sub_21A334
loc_21A005.loop5:
	call	sub_21A50D
	jr	C,loc_21A005.skip3
	call	TaskYield
	call	sub_21A443
	jr	loc_21A005.loop5
loc_21A005.skip3:
	call	sub_21A374
	call	sub_21A50D
	jp	MI,loc_21A005.skip10
	call	GetTradeConfirmText
	call	PickPartnerGenderText
	call	AskYesNo
	call	sub_21A4CC
loc_21A005.loop6:
	call	sub_21A4EC
	jr	C,loc_21A005.skip4
	call	TaskYield
	call	sub_21A443
	jr	loc_21A005.loop6
loc_21A005.skip4:
	call	sub_21A374
	call	sub_21A4EC
	jp	MI,loc_21A005.skip6
	jp	NZ,loc_21A005.skip5
	call	WorksSetupMenu
	ld	XHL,TheTradeWasSuccessfulText
	ld	XDE,TradingCompleteText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	loc_21A005.skip7
loc_21A005.skip5:
	ld	XHL,LooksLikeItsNotText
	ld	XDE,LooksLikeItsNotText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	loc_21A005.skip7
loc_21A005.skip6:
	ld	XHL,TransmissionErrorTryAgainText
	ld	XDE,TransmissionErrorTryAgainText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	loc_21A005.skip11
loc_21A005.skip7:
	ld	XHL,DoYouWantToText4
	ld	XDE,DoYouWantToText4
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jp	NZ,loc_21A005.skip9
	call	sub_21D25C
loc_21A005.loop7:
	call	sub_21A533
	jr	C,loc_21A005.skip8
	call	TaskYield
	call	sub_21A443
	jr	NC,loc_21A005.loop7
loc_21A005.skip8:
	call	sub_21A533
	jp	MI,loc_21A005.skip10
	jp	loc_21A005.loop2
loc_21A005.skip9:
	ld	XHL,ReadyToQuitIllText
	ld	XDE,ReadyToQuitIllText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	loc_21A005.skip11
loc_21A005.skip10:
	ld	XHL,LooksLikeTheresNoText2
	ld	XDE,LooksLikeTheresNoText2
	call	ShowPartnerGenderText
	call	Wait30Frames
loc_21A005.skip11:
	call	sub_21D1E7
	jp	loc_219A5B

c_21A32D	section	code abs=0x21A32D

sub_21A32D:
	xor	XHL,XHL
	call	sub_21D26B
	ret

c_21A334	section	code abs=0x21A334

sub_21A334:
	ld	XHL,sub_21A374
	call	sub_21D26B
	ld	A,2
	call	sub_21734E
	ld	XHL,0x21A309
	ld	BC,0
	ld	WA,2
	call	swp_2171DF
	ld	XHL,0x21A30E
	ld	BC,3
	ld	WA,2
	call	swp_2171DF
	ldw	(0x6203),0
	ldw	(0x6205),0xFFFF
	ldw	(0x6207),0xFFFF
	ldb	(0x6209),0xFF

c_21A374	section	code abs=0x21A374

sub_21A374:
	call	sub_21D256
	ld	WA,(XHL+4)
	cp	(0x6205),WA
	jr	Z,sub_21A374.skip
	ld	(0x6205),WA
	ld	XHL,0x21A31D
	ld	BC,1
	ld	WA,2
	call	swp_2171DF
	ld	WA,(0x6205)
	call	sub_21739F
	ld	BC,1
	ld	WA,2
	call	swp_2171DF
sub_21A374.skip:
	call	sub_21D256
	ld	WA,(XHL+2)
	cp	(0x6207),WA
	jr	Z,sub_21A374.skip2
	ld	(0x6207),WA
	ld	XHL,0x21A31D
	ld	BC,4
	ld	WA,2
	call	swp_2171DF
	ld	WA,(0x6207)
	call	sub_21739F
	ld	BC,4
	ld	WA,2
	call	swp_2171DF
sub_21A374.skip2:
	call	sub_21D256
	ld	A,(XHL+1)
	cp	(0x6209),A
	jr	Z,sub_21A374.done
	ld	(0x6209),A
	and	A,8
	ld	XHL,0x21A317
	ld	XDE,0x21A31A
	call	sub_21A43E
	ld	A,(0x6209)
	and	A,2
	ld	XDE,XHL
	ld	XHL,0x21A314
	call	sub_21A43E
	ld	BC,0x400
	ld	WA,2
	call	swp_2171DF
	ld	A,(0x6209)
	and	A,4
	ld	XHL,0x21A317
	ld	XDE,0x21A31A
	call	sub_21A43E
	ld	A,(0x6209)
	and	A,1
	ld	XDE,XHL
	ld	XHL,0x21A314
	call	sub_21A43E
	ld	BC,0x403
	ld	WA,2
	call	swp_2171DF
sub_21A374.done:
	ret

c_21A43E	section	code abs=0x21A43E

sub_21A43E:
	ret	Z
	ld	XHL,XDE
	ret

c_21A443	section	code abs=0x21A443

sub_21A443:
	ld	WA,(0x6203)
	and	WA,7
	jr	NZ,sub_21A443.skip
	call	swp_217684
	ld	XHL,WaitAMinuteText
	ld	XDE,WaitAMinuteText
	call	PickPartnerGenderText
	ld	WA,(0x6203)
	and	WA,8
	ld	XDE,0x21A324
	call	sub_21A43E
	ld	BC,0
	call	swp_217699
sub_21A443.skip:
	incw	1,(0x6203)
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	NZ,sub_21A443.skip2
	rcf
	jr	sub_21A443.done
sub_21A443.skip2:
	scf
sub_21A443.done:
	ret

c_21A488	section	code abs=0x21A488

swp_21A488:
	push	WA
	push	XHL
	ld	A,1
	call	sub_21734E
	pop	XHL
	pop	WA
	ld	DE,WA
	ld	WA,0x401
	ld	BC,0
	push	XHL
	call	swp_217309
	pop	XHL
	ld	C,1
swp_21A488.loop:
	ld	B,0
swp_21A488.loop2:
	ld	E,(XHL+)
	push	BC
	push	XHL
	ld	WA,0x201
	call	swp_217309
	pop	XHL
	pop	BC
	inc	2,B
	cp	B,0xE
	jr	C,swp_21A488.loop2
	inc	1,C
	cp	C,3
	jr	C,swp_21A488.loop
	ret

c_21A4BF	section	code abs=0x21A4BF

swp_21A4BF:
	ld	DE,WA
	ld	WA,0x402
	ld	BC,0x208
	call	swp_217309
	ret

c_21A4CC	section	code abs=0x21A4CC

sub_21A4CC:
	or	A,A
	call	sub_21A4D7
	call	sub_21D245
	ret

c_21A4D7	section	code abs=0x21A4D7

sub_21A4D7:
	ld	A,1
	ret	Z
	ld	A,5
	ret

c_21A4DE	section	code abs=0x21A4DE

sub_21A4DE:
	call	sub_21D218
	cp	WA,1
	ret	Z
	ld	A,0xFF
	or	A,A
	scf
	ret

c_21A4EC	section	code abs=0x21A4EC

sub_21A4EC:
	call	sub_21A4DE
	ret	C
	call	sub_21D256
	ld	WA,(XHL+1)
	and	A,3
	cp	A,3
	ccf
	ret	NC
	call	sub_21D256
	ld	WA,(XHL+1)
	and	A,0xC
	scf
	ret

c_21A50D	section	code abs=0x21A50D

sub_21A50D:
	call	sub_21A4DE
	ret	C
	call	sub_21D256
	ld	WA,(XHL+1)
	and	A,0xF
	ret	NZ
	call	sub_21D256
	ld	WA,(XHL+4)
	or	WA,WA
	ret	Z
	ld	WA,(XHL+2)
	or	WA,WA
	ret	Z
	scf
	ret

c_21A533	section	code abs=0x21A533

sub_21A533:
	call	sub_21A4DE
	ret	C
	call	sub_21D256
	ld	WA,(XHL+1)
	and	A,0xF
	ret	NZ
	call	sub_21D256
	ld	WA,(XHL+4)
	or	WA,WA
	ret	NZ
	ld	WA,(XHL+2)
	or	WA,WA
	ret	NZ
	scf
	ret

c_21A559	section	code abs=0x21A559

; [code+play] "You want to equip..." / Choose a part; works_setup_* screens
WorksSetupMenu:
	call	sub_21D256
	ld	WA,(XHL+4)
	call	RemoveItemByCategory
	call	sub_21D256
	ld	WA,(XHL+2)
	call	AddItemByCategory
	ret

c_21A570	section	code abs=0x21A570

loc_21A570:
	call	sub_218A62
	ld	XHL,YouWantToEquipText
	ld	XDE,YouWantToEquipText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	sub_2179FE
	call	CopyEquipToWorks
	call	sub_218AD8
loc_21A570.loop:
	call	swp_217F20
loc_21A570.loop2:
	call	sub_218A62
	call	sub_21884B
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhatDoYouWantText4
	ld	XDE,WhatDoYouWantText4
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21A570.skip2
	jr	loc_21A570.skip
loc_21A570.loop3:
	call	CopyEquipToWorks
	call	sub_218AD8
	call	swp_217F20
	jp	loc_21A570.loop2
loc_21A570.skip:
	ld	WA,(0x615B)
	call	sub_21A66B
	call	EquipFromWorksList
	call	swp_217F20
	ld	WA,(0x615B)
	call	sub_218882
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,ChooseAPartText
	ld	XDE,ChooseAPartText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	call	HideListCursor
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21A570.loop3
	call	swp_217684
	ld	WA,0x87
	call	CallSoundCommand
	call	EquipFromWorksList
	call	sub_219C22
	jp	loc_21A570.loop
loc_21A570.skip2:
	ld	XHL,OKLetsGoBackText
	ld	XDE,OKLetsGoBackText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideListCursor
	jp	loc_219A53

c_21A66B	section	code abs=0x21A66B

sub_21A66B:
	sub	WA,6
	jr	C,sub_21A66B.done
	ld	XHL,0x61CF
	ld	XDE,0x61D1
	call	WorksDevelopMenu
	ld	WA,(XHL)
	ldw	(XHL),0
	call	AddItemByCategory
sub_21A66B.done:
	ret

c_21A68A	section	code abs=0x21A68A

; [code] You want to develop... / new arm / development level
WorksDevelopMenu:
	ret	Z
	ld	XHL,XDE
	ret

c_21A68F	section	code abs=0x21A68F

loc_21A68F:
	call	sub_2179FE
	call	CopyEquipToWorks
	call	ClearDevelopChoices
	call	sub_219139
	ld	XHL,YouWantToDevelopText
	ld	XDE,YouWantToDevelopText
	call	ShowPartnerGenderText
	call	Wait30Frames
loc_21A68F.loop:
	call	swp_217F20
loc_21A68F.loop2:
	call	sub_21866F
loc_21A68F.loop3:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhatDoYouWantText5
	ld	XDE,WhatDoYouWantText5
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21A68F.skip7
	inc	1,A
	ld	(0x61AC),A
	call	sub_219139
	ld	A,(0x61AC)
	ld	(wDevelopArm),A
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	ld	XHL,AreYouSureText
	ld	XDE,AreYouSureText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,loc_21A68F.loop5
	xor	A,A
	ld	(0x61AC),A
	call	sub_219139
	jp	loc_21A68F.loop3
loc_21A68F.loop4:
	xor	A,A
	ld	(0x61AC),A
	call	sub_219139
	call	sub_218A62
	jp	loc_21A68F.loop2
loc_21A68F.loop5:
	call	sub_21867D
loc_21A68F.loop6:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,WhatDoYouWantText6
	ld	XDE,WhatDoYouWantText6
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21A68F.loop4
	ld	A,(wDevelopChance)
	or	A,A
	jr	PL,loc_21A68F.skip
	ld	XHL,YouCantMakeAnText
	ld	XDE,YouCantMakeAnText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	loc_21A68F.loop6
loc_21A68F.skip:
	ld	WA,(0x615B)
	inc	1,A
	ld	(0x61AD),A
	call	sub_219139
	ld	XHL,AreYouSureText
	ld	XDE,AreYouSureText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,loc_21A68F.loop7
	xor	A,A
	ld	(0x61AD),A
	call	sub_219139
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	call	sub_2189B4
	jp	loc_21A68F.loop6
loc_21A68F.loop7:
	ld	XHL,DoYouWantToText5
	ld	XDE,DoYouWantToText5
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jp	NZ,loc_21A68F.skip2
	call	sub_21868B
loc_21A68F.loop8:
	call	RedrawListPage
	call	ShowListCursor
	call	TaskYield
	call	StartListInput
	ld	XHL,SelectAToolText
	ld	XDE,SelectAToolText
	call	ShowPartnerGenderText
	call	WaitForButton
	call	CallListMoveHook
	call	WaitListResult
	ld	WA,(0x615B)
	or	WA,WA
	jp	MI,loc_21A68F.loop7
	inc	1,A
	ld	(0x61AE),A
	call	sub_219139
	ld	XHL,AreYouSureText
	ld	XDE,AreYouSureText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,loc_21A68F.skip3
	xor	A,A
	ld	(0x61AE),A
	call	sub_219139
	ldb	(wDevelopTool),0
	call	sub_2189B4
	jp	loc_21A68F.loop8
loc_21A68F.skip2:
	ldb	(0x61AE),0xFF
	call	sub_219139
	ldb	(wDevelopTool),0xFF
	call	sub_2189B4
loc_21A68F.skip3:
	ld	XHL,AllRightWereReadyText
	ld	XDE,AllRightWereReadyText
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	Z,loc_21A68F.skip4
	xor	A,A
	ld	(0x61AD),A
	ld	(0x61AE),A
	call	sub_219139
	ldb	(wDevelopMaterial),0
	ldb	(wDevelopTool),0
	call	sub_2189B4
	jp	loc_21A68F.loop5
loc_21A68F.skip4:
	ld	WA,0x88
	call	CallSoundCommand
	ld	XHL,HereWeGoText
	ld	XDE,HereWeGoText
	call	ShowPartnerGenderText
	call	Wait30Frames
	ld	A,0x1E
	call	loc_21777C
	ld	WA,0x288
	call	CallSoundCommand
	call	DevelopRoll
	jr	NC,loc_21A68F.skip6
	ld	WA,0x89
	call	CallSoundCommand
	call	DevelopSuccess
	jr	C,loc_21A68F.skip5
	ld	XHL,ImSorryButIText
	ld	XDE,ImSorryButIText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	loc_21A68F.skip7
loc_21A68F.skip5:
	ld	XHL,TheNewArmIsText
	ld	XDE,TheNewArmIsText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideListCursor
	call	sub_2193A3
	call	sub_218A69
	ld	A,(wDevelopResult)
	ld	W,5
	call	sub_219245
	ld	A,(wDevelopResult)
	ld	W,5
	call	sub_21895C
	call	WorksDevelopDone
	call	sub_217757
loc_21A68F.loop9:
	call	CheckEngineerLevelUp
	jp	NC,loc_21A68F.skip7
	call	EngineerLevelUp
	ld	XHL,PartnerSDevelopmentLevelText
	ld	XDE,PartnerSDevelopmentLevelText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jr	loc_21A68F.loop9
loc_21A68F.skip6:
	ld	WA,0x8A
	call	CallSoundCommand
	ld	XHL,SorryItDidntWorkText
	ld	XDE,SorryItDidntWorkText
	call	ShowPartnerGenderText
	call	Wait30Frames
loc_21A68F.skip7:
	ld	XHL,DoYouWantToText6
	ld	XDE,DoYouWantToText6
	call	PickPartnerGenderText
	call	AskYesNo
	or	A,A
	jr	NZ,loc_21A68F.skip8
	call	sub_218A62
	call	ClearDevelopChoices
	call	sub_219139
	jp	loc_21A68F.loop
loc_21A68F.skip8:
	ld	XHL,AllForNowLetText
	ld	XDE,AllForNowLetText
	call	ShowPartnerGenderText
	call	Wait30Frames
	call	HideListCursor
	jp	loc_219A53

c_21A9A9	section	code abs=0x21A9A9

; [code+play] removes the arm, material and tool; C if a random 0-99 < wDevelopChance
DevelopRoll:
	ld	A,(0x61AC)
	ld	W,5
	call	RemoveItemByCategory
	ld	A,(0x61AD)
	ld	W,4
	call	RemoveGroupItem
	ld	A,(0x61AE)
	ld	W,3
	call	RemoveGroupItem
	call	sub_2174C9
	extz	WA
	div	WA,0x64
	cp	W,(wDevelopChance)
	ret

c_21A9D5	section	code abs=0x21A9D5

; [code] gives wDevelopResult, takes wDevelopExp off wEngineerExp below level 50
DevelopSuccess:
	ld	A,(wDevelopResult)
	ld	W,5
	call	AddItemByCategory
	ld	A,(wDevelopExp)
	ld	A,(0x61AC)
	cp	A,(wDevelopResult)
	rcf
	cpb	(wWorksEngineerLevel),0x32
	jr	NC,DevelopSuccess.skip
	ld	A,(wDevelopExp)
	extz	WA
	sub	(wEngineerExp),WA
DevelopSuccess.skip:
	scf
	ret

c_21A9FF	section	code abs=0x21A9FF

; [code+play] wEngineerExp += GetDevLevelExp, level + 1 (max 50)
EngineerLevelUp:
	ld	A,(wWorksPartnerRace)
	call	SplitRaceGender
	ld	A,(wWorksEngineerLevel)
	call	GetDevLevelExp
	extz	WA
	add	(wEngineerExp),WA
	ld	A,(wWorksEngineerLevel)
	cp	A,0x32
	jr	NC,EngineerLevelUp.skip
	inc	1,A
	ld	(wWorksEngineerLevel),A
	ld	(wEngineerLevel),A
	cp	A,0x32
	jr	C,EngineerLevelUp.done
EngineerLevelUp.skip:
	ldw	(wEngineerExp),0
EngineerLevelUp.done:
	ret

c_21AA34	section	code abs=0x21AA34

; [code+play] "See you later" / "Whew, I'm glad to..."
WorksDevelopDone:
	call	swp_217684
	ld	A,(wDevelopResult)
	ld	W,5
	call	sub_21739F
	ld	BC,0
	ld	WA,1
	call	swp_2171DF
	ld	A,(wDevelopResult)
	ld	W,5
	call	sub_2173D5
	ld	BC,2
	ld	WA,1
	call	swp_2171DF
	ret

c_21AA73	section	code abs=0x21AA73

loc_21AA73:
	ld	XHL,WhewImGladToText
	ld	XDE,WhewImGladToText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	loc_219A5B

c_21AAE2	section	code abs=0x21AAE2

swp_21AAE2:
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
	call	sub_217583
	call	sub_217603
	call	sub_217846
	call	sub_217949
	call	sub_217E53
	call	sub_2188FF
	call	sub_219424
	ld	A,1
	call	sub_217620
	ld	A,(wOptionMessageSpeed)
	call	sub_217625
	call	sub_217888
	call	sub_217894
	call	sub_21789A
	ld	XHL,(0x621A)
	jp	XHL

c_21AB7A	section	code abs=0x21AB7A

swp_21AB7A:
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
	call	sub_219424
	ret

c_21ABDA	section	code abs=0x21ABDA

; [code] same 12x14 clear + FillTiles 0x7E x 0x1C2 as sub_2197DD, then zeroes all of 0x9000-0x97FF and 0x9800-0x9FFF (SCR1 and SCR2 maps); callers WorksHelpMenu, WorksTradeMenu, swp_21AAE2, swp_21AB7A
ClearPictureAndTilemaps:
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_20677A
	ld	WA,0
	ld	C,0
	ld	E,0
	ld	B,0xC
	ld	D,0xE
	call	swp_206781
	ld	WA,0x7E
	ld	QA,0
	ld	BC,0x1C2
	call	FillTiles
	ld	XHL,0x9000
	ld	XDE,0x9001
	ld	XBC,0x7FF
	xor	A,A
	ld	(XHL),A
	ldir	(XDE+),(XHL+)
	ld	XHL,0x9800
	ld	XDE,0x9801
	ld	XBC,0x7FF
	xor	A,A
	ld	(XHL),A
	ldir	(XDE+),(XHL+)
	ret

c_21B7BC	section	code abs=0x21B7BC

swp_21B7BC:
	call	swp_217684
	call	sub_21838A
	jr	NC,swp_21B7BC.done
	ld	BC,WA
	call	sub_2183A2
	or	A,A
	jr	Z,swp_21B7BC.done
	ld	WA,BC
	call	0x2173E5
	ld	BC,0
	call	swp_217699
swp_21B7BC.done:
	ret

c_21B7DD	section	code abs=0x21B7DD

swp_21B7DD:
	call	sub_21838A
	jr	NC,swp_21B7DD.done
	ld	BC,WA
	call	sub_2183A2
	and	A,0xF
	or	A,A
	jr	Z,swp_21B7DD.done
	scf
swp_21B7DD.done:
	ret

c_21B7F2	section	code abs=0x21B7F2

sub_21B7F2:
	ld	XHL,swp_21B7BC
	ld	XDE,swp_21B7DD
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

c_21B82D	section	code abs=0x21B82D

swp_21B82D:
	ld	XHL,swp_21861D
	call	sub_219238
	call	swp_217684
	call	sub_21862D
	jr	NC,swp_21B82D.done
	ld	BC,WA
	call	sub_218645
	or	A,A
	jr	Z,swp_21B82D.done
	ld	WA,BC
	call	sub_2173D5
	ld	BC,0
	call	swp_217699
swp_21B82D.done:
	ret

c_21B857	section	code abs=0x21B857

swp_21B857:
	call	sub_21862D
	jr	NC,swp_21B857.done
	ld	BC,WA
	call	sub_218645
	and	A,0xF
	or	A,A
	jr	Z,swp_21B857.done
	scf
swp_21B857.done:
	ret

c_21B86C	section	code abs=0x21B86C

sub_21B86C:
	ld	XHL,swp_21B82D
	ld	XDE,swp_21B857
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

c_21B9DE	section	code abs=0x21B9DE

swp_21B9DE:
	push	XHL
	ld	XHL,0x25E648
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21B9EB	section	code abs=0x21B9EB

swp_21B9EB:
	push	XHL
	ld	XHL,0x25E67A
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21B9F8	section	code abs=0x21B9F8

swp_21B9F8:
	push	XHL
	ld	XHL,DevLevelBonusMale
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21BA05	section	code abs=0x21BA05

swp_21BA05:
	push	XHL
	ld	XHL,DevLevelBonusFemale
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21BA12	section	code abs=0x21BA12

swp_21BA12:
	push	XHL
	ld	XHL,0x25E6AC
	ld	A,(XHL+A)
	pop	XHL

c_21BA1E	section	code abs=0x21BA1E

loc_21BA1E:
	ret
	db	0x05,0x0A,0x0F,0x14,0x64

c_21BA24	section	code abs=0x21BA24

sub_21BA24:
	push	XHL
	ld	XHL,loc_21BA1E
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21D192	section	code abs=0x21D192

; [code] W = arm, A = material -> XHL = Recipes entry (pct, result, dev_exp)
GetRecipe:
	ld	L,W
	dec	1,L
	mul	HL,0xF
	dec	1,A
	extz	WA
	add	WA,HL
	mul	XWA,3
	ld	XHL,Recipes
	lda	XHL,XHL+WA
	ret

c_21D1C8	section	code abs=0x21D1C8

swp_21D1C8:
	pop	XWA
	ld	(XIZ+TASK_FUNC),XWA
	ret
	db	0x55,0x54

c_21D1CF	section	code abs=0x21D1CF

; [code] TRUN bit 7, child swp_21D270 looping on BIOS COM calls 0x10-0x1A (cable trade)
StartLinkTask:
	orb	(TRUN),0x80
	xor	XHL,XHL
	ld	(0x622E),XHL
	ld	XHL,LinkCommTask
	call	StartChildTask
	ld	(0x6222),XHL
	ret

c_21D1E7	section	code abs=0x21D1E7

sub_21D1E7:
	ld	XHL,(0x6222)
	call	swp_206371
	xor	XHL,XHL
	ld	(0x622E),XHL
	ret

c_21D1F6	section	code abs=0x21D1F6

sub_21D1F6:
	ld	XHL,0x622B
	ld	XDE,0x622C
	ld	XBC,0x6D
	ldb	(XHL),0
	ldir	(XDE+),(XHL+)
	ldb	(0x6232),0x1E
	ret

c_21D210	section	code abs=0x21D210

sub_21D210:
	xor	WA,WA
	ld	(0x6238),WA
	scf
	ret

c_21D218	section	code abs=0x21D218

sub_21D218:
	ld	WA,(0x6238)
	or	A,A
	ret	MI
	ret	Z
	scf
	ret

c_21D224	section	code abs=0x21D224

swp_21D224:
	ld	BC,(0x6244)
	or	BC,BC
	ret	Z
	ld	WA,(0x6246)
	or	WA,WA
	ret	Z
	scf
	ret

c_21D236	section	code abs=0x21D236

sub_21D236:
	ld	(0x622B),WA
	scf
	ret

c_21D23C	section	code abs=0x21D23C

swp_21D23C:
	ld	A,(0x622D)
	and	A,0xF
	scf
	ret

c_21D245	section	code abs=0x21D245

sub_21D245:
	andb	(0x622D),0xFA
	or	(0x622D),A
	scf
	ret

c_21D250	section	code abs=0x21D250

swp_21D250:
	ld	XHL,0x623A
	ret

c_21D256	section	code abs=0x21D256

sub_21D256:
	ld	XHL,0x6242
	ret

c_21D25C	section	code abs=0x21D25C

sub_21D25C:
	xor	XWA,XWA
	ld	(0x622B),WA
	ld	(0x622D),A
	ld	(0x622E),XWA
	ret

c_21D26B	section	code abs=0x21D26B

sub_21D26B:
	ld	(0x622E),XHL
	ret

c_21D270	section	code abs=0x21D270

; [code] child of StartLinkTask: BIOS COM calls 0x10-0x1A in a loop; receives into 0x6249, syncs on word 0x21D1CD, assembles a 16-byte packet at 0x6289, checksum sub_21D47C, status 0x6238 (1 ok, FF/FE/FD errors, bits in 0x6239), sends 16 bytes (COM 0x19); [play] works_trade_checking / no_cable
LinkCommTask:
	ld	XHL,0x622B
	ld	XDE,0x622C
	ld	XBC,0x6D
	ldb	(XHL),0
	ldir	(XDE+),(XHL+)
	ldb	(0x6232),0x1E
	ld	RW3,0x10
	calr	BiosCall
LinkCommTask.loop:
	ld	XHL,(0x622E)
	or	XHL,XHL
	jr	Z,LinkCommTask.skip
	call	XHL
LinkCommTask.skip:
	ld	RW3,0x12
	calr	BiosCall
	ld	RW3,0x15
	call	BiosCall
	call	swp_21D1C8
	ld	XHL,0x6289
	ld	(0x6233),XHL
	ld	B,0x10
	ld	(0x6237),B
LinkCommTask.loop2:
	ld	RW3,0x18
	call	BiosCall
	ld	WA,RWA3
	and	W,0xE
	jp	NZ,LinkCommTask.skip7
	or	A,A
	jp	Z,LinkCommTask.skip4
	ld	XHL,0x6249
	ld	XHL3,XHL
	ld	B,0x40
	ld	RB3,B
	ld	RW3,0x1A
	calr	BiosCall
	ld	A,RB3
	ld	B,0x40
	sub	B,A
	ld	XHL,0x6249
	ld	XDE,(0x6233)
	ld	C,(0x6237)
	cp	C,0x10
	jr	NZ,LinkCommTask.loop4
LinkCommTask.loop3:
	cp	B,2
	jr	C,LinkCommTask.skip3
	ld	WA,(0x21D1CD)
	cp	WA,(XHL)
	jr	Z,LinkCommTask.skip2
	inc	1,XHL
	dec	1,B
	jr	LinkCommTask.loop3
LinkCommTask.skip2:
	ld	(XDE+),WA
	inc	2,XHL
	dec	2,B
	dec	2,C
LinkCommTask.loop4:
	or	C,C
	jr	Z,LinkCommTask.skip5
	or	B,B
	jr	Z,LinkCommTask.skip3
	ld	A,(XHL+)
	ld	(XDE+),A
	dec	1,B
	dec	1,C
	jr	LinkCommTask.loop4
LinkCommTask.skip3:
	ld	(0x6233),XDE
	ld	(0x6237),C
	cpb	(0x6232),0
	jp	Z,LinkCommTask.skip6
	decb	1,(0x6232)
	call	swp_21D1C8
	jp	LinkCommTask.loop2
LinkCommTask.skip4:
	cpb	(0x6232),0
	jp	Z,LinkCommTask.skip6
	decb	1,(0x6232)
	jp	LinkCommTask.skip13
LinkCommTask.skip5:
	ld	XHL,0x6289
	ld	XDE,0x6242
	call	sub_21D487
	jr	NC,LinkCommTask.skip9
	ld	XHL,0x6242
	call	sub_21D47C
	cp	A,(XHL)
	jr	NZ,LinkCommTask.skip8
	jp	LinkCommTask.skip11
LinkCommTask.skip6:
	orb	(0x6239),8
	ldb	(0x6238),0
	jr	LinkCommTask.skip10
LinkCommTask.skip7:
	sll	4,W
	or	(0x6239),W
	ldb	(0x6238),0xFF
	orb	(0x6239),1
	jr	LinkCommTask.skip10
LinkCommTask.skip8:
	ldb	(0x6238),0xFE
	orb	(0x6239),2
	jr	LinkCommTask.skip10
LinkCommTask.skip9:
	ldb	(0x6238),0xFD
	orb	(0x6239),4
LinkCommTask.skip10:
	ld	XHL,0x6242
	ld	XDE,0x6243
	ld	XBC,6
	ldb	(XHL),0
	ldir	(XDE+),(XHL+)
	jr	LinkCommTask.skip12
LinkCommTask.skip11:
	ldb	(0x6238),1
LinkCommTask.skip12:
	ldb	(0x6232),0x1E
LinkCommTask.skip13:
	cpb	(0x6238),1
	jr	NZ,LinkCommTask.skip14
	ld	WA,(0x6244)
	ld	(0x623E),WA
	ld	A,(0x6243)
	sll	1,A
	and	A,0xA
	andb	(0x623B),0xF5
	or	(0x623B),A
LinkCommTask.skip14:
	ld	WA,(0x622B)
	ld	(0x623C),WA
	ld	A,(0x622D)
	and	A,5
	andb	(0x623B),0xFA
	or	(0x623B),A
	ld	A,(0x6242)
	cp	A,(0x623A)
	jr	PL,LinkCommTask.skip15
	ld	A,(0x623A)
LinkCommTask.skip15:
	inc	1,A
	ld	(0x623A),A
	ld	XHL,0x623A
	call	sub_21D47C
	ld	(XHL),A
	ld	XHL,0x623A
	ld	XDE,0x6289
	call	sub_21D4D1
	ld	RW3,0x17
	calr	BiosCall
	ld	WA,RWA3
	or	A,A
	jr	NZ,LinkCommTask.skip16
	ld	XHL,0x6289
	ld	XHL3,XHL
	ld	B,0x10
	ld	RB3,B
	ld	RW3,0x19
	calr	BiosCall
	cp	RB3,0
	jr	Z,LinkCommTask.skip16
LinkCommTask.skip16:
	ld	RW3,0x11
	calr	BiosCall
	ld	A,(0x623B)
	andb	(0x622D),0xF5
	or	(0x622D),A
	jp	LinkCommTask.loop

c_21D47C	section	code abs=0x21D47C

sub_21D47C:
	ld	B,6
	xor	A,A
sub_21D47C.loop:
	xor	A,(XHL+)
	djnz	B,sub_21D47C.loop
	ret

c_21D487	section	code abs=0x21D487

sub_21D487:
	ld	WA,(0x21D1CD)
	cp	WA,(XHL+)
	jr	NZ,sub_21D487.skip
	ld	B,7
sub_21D487.loop:
	ld	A,(XHL+)
	call	sub_21D4BF
	jr	NC,sub_21D487.skip2
	ld	W,A
	ld	A,(XHL+)
	call	sub_21D4BF
	jr	NC,sub_21D487.skip2
	sll	4,W
	or	A,W
	ld	(XDE+),A
	djnz	B,sub_21D487.loop
	xor	A,A
	scf
	jr	sub_21D487.done
sub_21D487.skip:
	ld	A,1
	jr	sub_21D487.skip3
sub_21D487.skip2:
	ld	A,2
sub_21D487.skip3:
	rcf
sub_21D487.done:
	ret

c_21D4BF	section	code abs=0x21D4BF

sub_21D4BF:
	sub	A,0x30
	ccf
	ret	NC
	cp	A,0xA
	ret	C
	sub	A,7
	cp	A,0x10
	ret

c_21D4D1	section	code abs=0x21D4D1

sub_21D4D1:
	ld	WA,(0x21D1CD)
	ld	(XDE+),WA
	ld	B,7
sub_21D4D1.loop:
	ld	W,(XHL+)
	ld	A,W
	srl	4,A
	call	sub_21D4FD
	ld	(XDE+),A
	ld	A,W
	and	A,0xF
	call	sub_21D4FD
	ld	(XDE+),A
	djnz	B,sub_21D4D1.loop
	xor	A,A
	scf
	ret

c_21D4FD	section	code abs=0x21D4FD

sub_21D4FD:
	add	A,0x30
	cp	A,0x3A
	ret	C
	add	A,7
	ret

c_21D509	section	code abs=0x21D509

swp_21D509:
	call	sub_2067E1
	call	InitTextBoxes
	ld	A,(XIZ+0x10)
	ld	C,0x14
	ld	E,0x13
	ld	HL,(XIZ+TASK_ARG)
	call	OpenTextBox
	ld	C,0
	ld	E,0
	call	PlaceTextBoxXWA
	ldw	(XIZ+TASK_ARG),0
	ldw	(XIZ+TASK_FUNC),0xD538
	ldw	(XIZ+TASK_FUNC_HI),0x21
	jr	loc_21D5A8

c_21D538	section	code abs=0x21D538

swp_21D538:
	incw	1,(XIZ+0x2A)
	ld	WA,(XIZ+0x2A)
	and	WA,0x10
	jr	Z,swp_21D538.skip
	ld	BC,0
	ld	DE,4
	ld	WA,0xBE04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
	ld	BC,0x98
	ld	DE,4
	ld	WA,0x3E04
	ld	QB,1
	ld	QD,2
	call	sub_206BFF
swp_21D538.skip:
	ld	A,(wJoyPressed)
	and	A,B_BUTTON
	jr	NZ,loc_21D5C0
	ld	A,(wJoyPressed)
	and	A,D_LEFT|D_RIGHT
	ret	Z
	ld	A,(wJoyPressed)
	and	A,D_LEFT
	jr	Z,swp_21D538.skip2
	decw	1,(XIZ+TASK_ARG)
	jr	swp_21D538.skip3
swp_21D538.skip2:
	incw	1,(XIZ+TASK_ARG)
swp_21D538.skip3:
	ld	WA,(XIZ+TASK_ARG)
	cp	WA,0xFFFF
	jr	GT,swp_21D538.skip4
	ldw	(XIZ+TASK_ARG),9
	jr	loc_21D5A8
swp_21D538.skip4:
	ld	WA,(XIZ+TASK_ARG)
	cp	WA,0xA
	jr	LT,loc_21D5A8
	ldw	(XIZ+TASK_ARG),0

c_21D5A8	section	code abs=0x21D5A8

loc_21D5A8:
	ld	HL,(XIZ+TASK_ARG)
	extz	XHL
	sll	2,XHL
	add	XHL,HelpPages
	ld	XHL,(XHL)
	ld	A,(XIZ+0x10)
	call	DrawBoxString
	ret

c_21D5C0	section	code abs=0x21D5C0

loc_21D5C0:
	call	EndTask
	ret

c_21D5C5	section	code abs=0x21D5C5

dyn_21D5C5:
	ldb	(wOptionMessageSpeed),3
	ldb	(wOptionAnimation),0xFF
	ld	A,0
	call	dyn_20DB57
	call	Z,dyn_20DC65
	call	InitTextBoxes
	ldw	(XIZ+TASK_FUNC),0xD5E9
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
