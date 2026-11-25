; engine/dungeon: 197 routines (each keeps its ROM address in its own section)

c_206EB6	section	code abs=0x206EB6

sub_206EB6:
	ld	XWA,(wMapPtr)
	exts	XBC
	divs	XBC,(XWA)
	ld	BC,QBC
	or	BC,BC
	jr	PL,sub_206EB6.skip
	add	BC,(XWA)
sub_206EB6.skip:
	exts	XDE
	divs	XDE,(XWA+2)
	ld	DE,QDE
	or	DE,DE
	jr	PL,sub_206EB6.skip2
	add	DE,(XWA+2)
sub_206EB6.skip2:
	ld	HL,(XWA)
	mul	XHL,DE
	add	HL,BC
	sll	1,HL
	inc	4,XHL
	add	XHL,XWA
	ld	HL,(XHL)
	ret

c_206EE6	section	code abs=0x206EE6

sub_206EE6:
	ld	XDE,0
	ld	DE,HL
	sll	3,DE
	add	XDE,(0x5BD5)
	and	HL,0xE000
	bit	6,H
	jr	Z,sub_206EE6.skip
	ld	XBC,(XDE+4)
	ld	XDE,(XDE)
	jr	sub_206EE6.skip2
sub_206EE6.skip:
	ld	XBC,(XDE)
	ld	XDE,(XDE+4)
sub_206EE6.skip2:
	bit	7,H
	jr	Z,sub_206EE6.skip3
	ex	BC,QBC
	ex	DE,QDE
sub_206EE6.skip3:
	ld	QHL,HL
	xor	XBC,XHL
	xor	XDE,XHL
	ld	HL,(0x5BCF)
	dec	1,HL
	ld	WA,BC
	and	WA,0x1FF
	jr	Z,sub_206EE6.skip4
	add	BC,HL
sub_206EE6.skip4:
	ld	WA,QBC
	and	WA,0x1FF
	jr	Z,sub_206EE6.skip5
	ld	WA,QBC
	add	WA,HL
	ld	QBC,WA
sub_206EE6.skip5:
	ld	WA,DE
	and	WA,0x1FF
	jr	Z,sub_206EE6.skip6
	add	DE,HL
sub_206EE6.skip6:
	ld	WA,QDE
	and	WA,0x1FF
	jr	Z,sub_206EE6.done
	ld	WA,QDE
	add	WA,HL
	ld	QDE,WA
sub_206EE6.done:
	ret

c_206F55	section	code abs=0x206F55

swp_206F55:
	call	sub_206EB6
	and	HL,0x1FFF
	sll	1,HL
	extz	XHL
	add	XHL,(wMetatileAttrPtr)
	ld	HL,(XHL)
	ret

c_206F69	section	code abs=0x206F69

sub_206F69:
	ld	XWA,0
	ld	A,C
	ld	W,E
	and	WA,0xF0F
	sll	3,A
	srl	1,WA
	add	WA,0x9000
	push	XWA
	call	sub_206EB6
	call	sub_206EE6
	pop	XWA
	ld	(XWA),XBC
	ld	(XWA+0x40),XDE
	ret

c_206F8D	section	code abs=0x206F8D

sub_206F8D:
	ld	A,0xE
sub_206F8D.loop:
	push	A
	push	BC
	push	DE
	calr	sub_206F69
	pop	DE
	pop	BC
	pop	A
	inc	1,BC
	djnz	A,sub_206F8D.loop
	ret

c_206F9E	section	code abs=0x206F9E

sub_206F9E:
	ld	A,0xD
sub_206F9E.loop:
	push	A
	push	BC
	push	DE
	calr	sub_206F69
	pop	DE
	pop	BC
	pop	A
	inc	1,DE
	djnz	A,sub_206F9E.loop
	ret

c_206FAF	section	code abs=0x206FAF

sub_206FAF:
	ld	A,0xD
sub_206FAF.loop:
	push	A
	push	BC
	push	DE
	call	sub_206F8D
	pop	DE
	pop	BC
	pop	A
	inc	1,DE
	djnz	A,sub_206FAF.loop
	ret

c_210423	section	code abs=0x210423

dyn_210423:
	ld	WA,(XSP+4)
	push	XHL
	ld	XHL,(XHL+4)
	call	LoadCompressedTiles
	pop	XHL
	ld	XHL,(XHL+8)
	ld	DE,(XSP)
	ld	BC,(XSP+2)
	ld	WA,(XSP+4)
	call	DrawTilemap
	pop	DE
	pop	BC
	pop	WA
	ret

c_210442	section	code abs=0x210442

swp_210442:
	ret

c_210443	section	code abs=0x210443

swp_210443:
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+DUNGEON_ID),A
	ld	A,0xFF
	ld	(0x5FF8),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,swp_210485
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_210467	section	code abs=0x210467

swp_210467:
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	ld	A,5
	ld	(XIZ+DUNGEON_ID),A
	ld	A,0xFF
	ld	(0x5FF9),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,swp_210485
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_210485	section	code abs=0x210485

swp_210485:
	ld	A,(XIZ+TASK_ARG)
	cp	A,5
	jr	Z,swp_210485.skip4
	cp	A,1
	jr	NZ,swp_210485.skip
	call	sub_2106CB
	ld	A,2
	ld	(XIZ+TASK_ARG),A
	jr	swp_210485.done
swp_210485.skip:
	cp	A,2
	jr	NZ,swp_210485.skip2
	call	sub_210C4E
	jr	swp_210485.done
swp_210485.skip2:
	cp	A,3
	jr	NZ,swp_210485.skip3
	call	sub_210D34
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	jr	swp_210485.done
swp_210485.skip3:
	cp	A,4
	jr	NZ,swp_210485.skip4
	call	DungeonStep
	jr	swp_210485.done
swp_210485.skip4:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(0x584B),A
	ld	(0x584D),A
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,swp_210485.skip5
	ld	A,(XIZ+DUNGEON_MODE)
	ld	(0x5FF8),A
	call	EndTask
	jr	swp_210485.done
swp_210485.skip5:
	ld	A,(XIZ+DUNGEON_MODE)
	ld	(0x5FF9),A
	call	EndTask
	jr	swp_210485.done
swp_210485.done:
	ret

c_2104EF	section	code abs=0x2104EF

swp_2104EF:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	cp	A,1
	jr	NZ,swp_2104EF.skip
	ld	HL,0x3C
	ld	WA,0x20
	ld	BC,0
	ld	DE,0
	jr	swp_2104EF.skip2
swp_2104EF.skip:
	ld	WA,0
	ld	A,(XIZ+DUNGEON_ID)
	sub	A,1
	ld	HL,0x30
	add	HL,WA
	ld	WA,0x94
	ld	BC,0
	ld	DE,0
swp_2104EF.skip2:
	call	DrawPortrait
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210520	section	code abs=0x210520

swp_210520:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x10
	ld	A,1
	ld	C,0xA
	ld	E,3
	call	OpenTextBox
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sll	2,A
	ld	XHL,DungeonNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21054D	section	code abs=0x21054D

swp_21054D:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	C,1
	ld	E,0x21
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210560	section	code abs=0x210560

sub_210560:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21056F	section	code abs=0x21056F

sub_21056F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x18
	ld	A,2
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210585	section	code abs=0x210585

sub_210585:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x5E
	ld	A,4
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21059B	section	code abs=0x21059B

sub_21059B:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,0
	ld	E,0x2E
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105AE	section	code abs=0x2105AE

sub_2105AE:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105BD	section	code abs=0x2105BD

sub_2105BD:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x4E
	ld	A,3
	ld	C,0x12
	ld	E,3
	call	OpenTextBox
	ld	A,3
	ld	XHL,EnterYesNoText
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105DE	section	code abs=0x2105DE

sub_2105DE:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	C,1
	ld	E,0x28
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2105F1	section	code abs=0x2105F1

sub_2105F1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210600	section	code abs=0x210600

sub_210600:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,Gfx_2C8691
	ld	WA,0x10
	call	LoadCompressedTiles
	ld	XHL,Pal_2C865D
	ld	A,1
	ld	C,1
	call	LoadPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210622	section	code abs=0x210622

sub_210622:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	A
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,Data_2275A1
	add	XHL,XWA
	ld	BC,(XHL)
	inc	2,XHL
	ld	DE,(XHL)
	sub	BC,8
	sub	DE,0xC
	pop	A
	ld	W,(XIZ+0x2D)
	sra	3,W
	add	A,W
	and	A,3
	extz	WA
	sll	2,WA
	add	WA,0x10
	ld	HL,0
	sll	13,HL
	or	WA,HL
	ld	HL,1
	sll	9,HL
	or	WA,HL
	ld	QB,2
	ld	QD,2
	call	sub_206BFF
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210675	section	code abs=0x210675

sub_210675:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x60
	ld	C,4
sub_210675.loop:
	push	C
	push	HL
	call	CheckEventFlag
	cp	L,0
	jr	Z,sub_210675.skip
	pop	HL
	push	HL
	sub	HL,0x60
	ld	A,L
	calr	sub_210622
sub_210675.skip:
	pop	HL
	pop	C
	inc	1,HL
	djnz	C,sub_210675.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2106BB	section	code abs=0x2106BB

sub_2106BB:
	push	XHL
	push	XWA
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	Z,sub_2106BB.skip
	call	dyn_20636D
sub_2106BB.skip:
	pop	XWA
	pop	XHL
	ret

c_2106CB	section	code abs=0x2106CB

sub_2106CB:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ret

c_2106D1	section	code abs=0x2106D1

swp_2106D1:
	push	A
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ld	A,0
	ld	(XIZ+DUNGEON_ID),A
	pop	A
	ret

c_2106DE	section	code abs=0x2106DE

sub_2106DE:
	call	dyn_206803
	call	dyn_206825
	call	dyn_216EDE
	call	dyn_216FB1
	call	dyn_216F8E
	ld	A,1
	calr	swp_2104EF
	ld	A,1
	ld	(XIZ+DUNGEON_FACING),A
	calr	sub_210600
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	ld	XWA,0x14
	call	PlayMusic
	ld	WA,0x35
	call	SoundCommand
	ret

c_21071A	section	code abs=0x21071A

sub_21071A:
	call	dyn_216FC3
	cp	A,1
	jr	Z,sub_21071A.done
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
sub_21071A.done:
	ret

c_21072D	section	code abs=0x21072D

sub_21072D:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_21072D.skip
	jr	sub_21072D.skip3
sub_21072D.skip:
	bit	5,A
	jr	Z,sub_21072D.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	calr	sub_210838
	jr	sub_21072D.done
sub_21072D.skip2:
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	cp	A,0x2D
	jr	C,sub_21072D.done
sub_21072D.skip3:
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
sub_21072D.done:
	ret

c_21075E	section	code abs=0x21075E

sub_21075E:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_21075E.skip2
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	calr	sub_2106BB
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,0
	jr	Z,sub_21075E.skip
	calr	sub_21081D
	jr	sub_21075E.done
sub_21075E.skip:
	calr	sub_210838
	jr	sub_21075E.done
sub_21075E.skip2:
	bit	5,A
	jr	Z,sub_21075E.skip3
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	calr	sub_2106BB
	calr	sub_210838
	jr	sub_21075E.done
sub_21075E.skip3:
	and	A,0xF
	jr	Z,sub_21075E.done
	cp	A,1
	jr	NZ,sub_21075E.skip4
	ld	A,0
	jr	sub_21075E.skip12
sub_21075E.skip4:
	cp	A,2
	jr	NZ,sub_21075E.skip5
	ld	A,1
	jr	sub_21075E.skip12
sub_21075E.skip5:
	cp	A,4
	jr	NZ,sub_21075E.skip6
	ld	A,2
	jr	sub_21075E.skip12
sub_21075E.skip6:
	cp	A,8
	jr	NZ,sub_21075E.skip7
	ld	A,3
	jr	sub_21075E.skip12
sub_21075E.skip7:
	cp	A,9
	jr	NZ,sub_21075E.skip8
	ld	A,4
	jr	sub_21075E.skip12
sub_21075E.skip8:
	cp	A,0xA
	jr	NZ,sub_21075E.skip9
	ld	A,5
	jr	sub_21075E.skip12
sub_21075E.skip9:
	cp	A,6
	jr	NZ,sub_21075E.skip10
	ld	A,6
	jr	sub_21075E.skip12
sub_21075E.skip10:
	cp	A,5
	jr	NZ,sub_21075E.skip11
	ld	A,7
	jr	sub_21075E.skip12
sub_21075E.skip11:
	jr	sub_21075E.done
sub_21075E.skip12:
	calr	DungeonSelectMove
	cp	A,0xFF
	jr	Z,sub_21075E.done
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	calr	sub_2106BB
sub_21075E.done:
	ret

c_2107F9	section	code abs=0x2107F9

; [code] DUNGEON_ID = DungeonSelectMoves[DUNGEON_ID * 8 + A] unless 0xFF (A = d-pad direction, sub_21075E)
DungeonSelectMove:
	push	XHL
	push	XDE
	push	XBC
	ld	L,A
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	mul	WA,8
	add	A,L
	ld	XHL,DungeonSelectMoves
	add	XHL,XWA
	ld	A,(XHL)
	cp	A,0xFF
	jr	Z,DungeonSelectMove.skip
	ld	(XIZ+DUNGEON_ID),A
DungeonSelectMove.skip:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21081D	section	code abs=0x21081D

sub_21081D:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	(XIZ+0x12),A
	call	dyn_216EDE
	call	swp_216FBA
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210838	section	code abs=0x210838

sub_210838:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	(XIZ+0x12),A
	call	dyn_216EDE
	call	swp_216FBA
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210853	section	code abs=0x210853

sub_210853:
	call	dyn_216FC3
	cp	A,1
	jr	Z,sub_210853.done
	ld	A,(XIZ+0x12)
	cp	A,3
	jr	Z,sub_210853.skip
	calr	sub_210877
	jr	sub_210853.done
sub_210853.skip:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+DUNGEON_MODE),A
sub_210853.done:
	ret

c_210877	section	code abs=0x210877

sub_210877:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	calr	swp_2104EF
	calr	sub_21056F
	calr	sub_210585
	calr	sub_2105BD
	ld	XHL,NewlineText3
	ld	A,2
	call	DrawBoxString
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sll	2,A
	ld	XHL,DungeonNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	DrawBoxString
	calr	sub_21059B
	ld	A,0
	ld	(XIZ+0x20),A
	call	dyn_216EDE
	calr	GetDungeonSelectCursor
	ld	L,C
	ld	H,E
	call	swp_216F62
	call	dyn_216FB1
	ld	A,6
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2108D0	section	code abs=0x2108D0

sub_2108D0:
	call	dyn_216FC3
	cp	A,1
	jr	Z,sub_2108D0.done
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,7
	ld	(XIZ+DUNGEON_MODE),A
sub_2108D0.done:
	ret

c_2108E3	section	code abs=0x2108E3

sub_2108E3:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_2108E3.skip
	jr	sub_2108E3.skip3
sub_2108E3.skip:
	bit	5,A
	jr	Z,sub_2108E3.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	calr	sub_210BF3
	jr	sub_2108E3.done
sub_2108E3.skip2:
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	cp	A,0x5A
	jr	C,sub_2108E3.done
sub_2108E3.skip3:
	ld	A,2
	call	ClearTextBox
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,0
	ld	(XIZ+0x25),A
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,8
	ld	(XIZ+DUNGEON_MODE),A
sub_2108E3.done:
	ret

c_210929	section	code abs=0x210929

swp_210929:
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	Z,swp_210929.skip
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	calr	sub_210BF3
	jrl	loc_2109F3
swp_210929.skip:
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,swp_210929.skip3
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,swp_210929.skip2
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	Z,swp_210929.skip8
swp_210929.skip2:
	jrl	loc_2109F3
swp_210929.skip3:
	ld	A,2
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,swp_210929.skip5
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,swp_210929.skip4
	ld	A,2
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	ld	C,0
	ld	(XWA+0x10),C
swp_210929.skip4:
	jr	loc_2109F3
swp_210929.skip5:
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,swp_210929.skip6
	ld	A,2
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
swp_210929.skip6:
	ld	A,(XIZ+0x25)
	cp	A,2
	jr	NZ,swp_210929.skip7
	ld	A,1
	ld	(XIZ+0x25),A
	ld	A,1
	ld	(XIZ+0x26),A
	ld	A,2
	call	SetTextBoxWait
	jr	loc_2109F3
swp_210929.skip7:
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sub	A,1
	sll	2,A
	ld	XHL,DungeonDescriptions
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,2
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,2
	ld	(XIZ+0x25),A
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	jr	loc_2109F3
swp_210929.skip8:
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,9
	ld	(XIZ+DUNGEON_MODE),A

c_2109F3	section	code abs=0x2109F3

loc_2109F3:
	ret

c_2109F4	section	code abs=0x2109F4

sub_2109F4:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	swp_20770B
	ld	XHL,XDE
	inc	2,XHL
	ld	W,3
sub_2109F4.loop:
	push	W
	ld	B,7
sub_2109F4.loop2:
	push	XDE
	push	XHL
	ld	C,0x12
sub_2109F4.loop3:
	ld	WA,(XHL)
	ld	(XDE),WA
	add	XDE,0x10
	add	XHL,0x10
	djnz	C,sub_2109F4.loop3
	pop	XHL
	pop	XDE
	inc	2,XHL
	inc	2,XDE
	djnz	B,sub_2109F4.loop2
	pop	W
	dec	1,W
	jr	Z,sub_2109F4.skip
	push	W
	ld	XWA,0
	ld	A,0x12
	sub	A,1
	sll	4,XWA
	add	XHL,XWA
	push	XDE
	push	XHL
	ld	C,0x12
sub_2109F4.loop4:
	ld	WA,(XHL)
	ld	(XDE),WA
	add	XDE,0x10
	add	XHL,0x10
	djnz	C,sub_2109F4.loop4
	pop	XHL
	pop	XDE
	ld	XDE,XHL
	inc	2,XHL
	pop	W
	jr	sub_2109F4.loop
sub_2109F4.skip:
	push	XDE
	ld	A,4
	call	swp_20770B
	ld	XHL,XDE
	pop	XDE
	ld	XWA,0
	ld	A,(XIZ+0x2C)
	div	WA,8
	extz	WA
	extz	XWA
	sll	4,XWA
	mul	XWA,0x12
	add	XHL,XWA
	ld	A,(XIZ+0x2C)
	and	XWA,7
	sll	1,XWA
	add	XHL,XWA
	ld	C,0x12
sub_2109F4.loop5:
	ld	WA,(XHL)
	ld	(XDE),WA
	add	XDE,0x10
	add	XHL,0x10
	djnz	C,sub_2109F4.loop5
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210AA4	section	code abs=0x210AA4

sub_210AA4:
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	Z,sub_210AA4.skip
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	calr	sub_210BF3
	jrl	sub_210AA4.done
sub_210AA4.skip:
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,sub_210AA4.skip3
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_210AA4.skip2
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	Z,sub_210AA4.skip10
sub_210AA4.skip2:
	jrl	loc_2109F3
sub_210AA4.skip3:
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,sub_210AA4.skip9
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,sub_210AA4.skip4
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
sub_210AA4.skip4:
	ld	A,(XIZ+0x27)
	and	A,A
	jr	NZ,sub_210AA4.skip6
	ld	A,(XIZ+0x2C)
	cp	A,0x18
	jr	Z,sub_210AA4.skip5
	calr	sub_2109F4
	inc	1,A
	ld	(XIZ+0x2C),A
	jr	sub_210AA4.skip6
sub_210AA4.skip5:
	ld	A,1
	ld	(XIZ+0x25),A
	ld	A,1
	ld	(XIZ+0x26),A
	ld	A,2
	call	SetTextBoxWait
	jr	sub_210AA4.done
sub_210AA4.skip6:
	ld	A,(XIZ+0x27)
	ld	W,(XIZ+DUNGEON_STEPS)
	cp	A,W
	jr	Z,sub_210AA4.skip7
	jr	NC,sub_210AA4.skip7
	inc	1,A
	jr	sub_210AA4.skip8
sub_210AA4.skip7:
	ld	A,0
sub_210AA4.skip8:
	ld	(XIZ+0x27),A
	jr	sub_210AA4.done
sub_210AA4.skip9:
	ld	A,4
	call	ClearTextBox
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sub	A,1
	sll	2,A
	ld	XHL,DungeonDescriptions
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,4
	call	DrawBoxString
	ld	A,2
	ld	(XIZ+0x25),A
	ld	A,6
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,0
	ld	(XIZ+0x27),A
	ld	(XIZ+0x2C),A
	jr	sub_210AA4.done
sub_210AA4.skip10:
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,9
	ld	(XIZ+DUNGEON_MODE),A
sub_210AA4.done:
	ret

c_210B72	section	code abs=0x210B72

sub_210B72:
	calr	sub_2105DE
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,0xA
	ld	(XIZ+DUNGEON_MODE),A
	ret

c_210B80	section	code abs=0x210B80

sub_210B80:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_210B80.skip2
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,sub_210B80.skip
	calr	sub_210C0E
	jr	sub_210B80.done
sub_210B80.skip:
	calr	sub_210BF3
	jr	sub_210B80.done
sub_210B80.skip2:
	bit	5,A
	jr	Z,sub_210B80.skip3
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	calr	sub_210BF3
	jr	sub_210B80.done
sub_210B80.skip3:
	and	A,0xF
	jr	Z,sub_210B80.done
	cp	A,4
	jr	NZ,sub_210B80.skip4
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	NZ,sub_210B80.skip4
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,0
	ld	(XIZ+0x20),A
	jr	sub_210B80.done
sub_210B80.skip4:
	cp	A,8
	jr	NZ,sub_210B80.done
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	NZ,sub_210B80.done
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x20),A
	jr	sub_210B80.done
sub_210B80.done:
	ret

c_210BF3	section	code abs=0x210BF3

sub_210BF3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x12),A
	call	dyn_216EDE
	call	swp_216FBA
	ld	A,0xB
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210C0E	section	code abs=0x210C0E

sub_210C0E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	(XIZ+0x12),A
	call	dyn_216EDE
	call	swp_216FBA
	ld	A,0xB
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210C29	section	code abs=0x210C29

sub_210C29:
	call	dyn_216FC3
	cp	A,1
	jr	Z,sub_210C29.done
	calr	sub_2105F1
	calr	sub_2105AE
	calr	sub_210560
	ld	A,(XIZ+0x12)
	cp	A,2
	jr	Z,sub_210C29.skip
	calr	sub_2106DE
	ld	A,2
	jr	sub_210C29.skip2
sub_210C29.skip:
	ld	A,0xC
sub_210C29.skip2:
	ld	(XIZ+DUNGEON_MODE),A
sub_210C29.done:
	ret

c_210C4E	section	code abs=0x210C4E

sub_210C4E:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,1
	jr	NZ,sub_210C4E.skip
	calr	sub_2106DE
	jr	sub_210C4E.skip13
sub_210C4E.skip:
	cp	A,2
	jr	NZ,sub_210C4E.skip2
	calr	sub_21071A
	jr	sub_210C4E.skip13
sub_210C4E.skip2:
	cp	A,3
	jr	NZ,sub_210C4E.skip3
	calr	sub_21072D
	jr	sub_210C4E.skip13
sub_210C4E.skip3:
	cp	A,4
	jr	NZ,sub_210C4E.skip4
	calr	sub_21075E
	jr	sub_210C4E.skip13
sub_210C4E.skip4:
	cp	A,5
	jr	NZ,sub_210C4E.skip5
	calr	sub_210853
	jr	sub_210C4E.skip13
sub_210C4E.skip5:
	cp	A,6
	jr	NZ,sub_210C4E.skip6
	calr	sub_2108D0
	jr	sub_210C4E.skip13
sub_210C4E.skip6:
	cp	A,7
	jr	NZ,sub_210C4E.skip7
	calr	sub_2108E3
	jr	sub_210C4E.skip13
sub_210C4E.skip7:
	cp	A,8
	jr	NZ,sub_210C4E.skip8
	calr	sub_210AA4
	jr	sub_210C4E.skip13
sub_210C4E.skip8:
	cp	A,9
	jr	NZ,sub_210C4E.skip9
	calr	sub_210B72
	jr	sub_210C4E.skip13
sub_210C4E.skip9:
	cp	A,0xA
	jr	NZ,sub_210C4E.skip10
	calr	sub_210B80
	jr	sub_210C4E.skip13
sub_210C4E.skip10:
	cp	A,0xB
	jr	NZ,sub_210C4E.skip11
	calr	sub_210C29
	jr	sub_210C4E.skip13
sub_210C4E.skip11:
	cp	A,0xC
	jr	NZ,sub_210C4E.skip12
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	sub_210C4E.done
sub_210C4E.skip12:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
sub_210C4E.skip13:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,4
	jr	C,sub_210C4E.skip14
	cp	A,6
	jr	NC,sub_210C4E.skip14
	call	LoadDungeonPalettes
	calr	GetDungeonSelectCursor
	call	sub_211D92
	calr	sub_210675
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,4
	jr	NZ,sub_210C4E.skip14
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,sub_210C4E.skip14
	ld	XHL,PlayBattleEffect
	call	StartChildTask
	ld	WA,0
	ld	(XHL+0x1E),WA
	ld	A,(XIZ+DUNGEON_ID)
	extz	WA
	add	WA,0xCF
	ld	(XHL+0x20),WA
	jr	sub_210C4E.skip17
sub_210C4E.skip14:
	cp	A,0xA
	jr	NZ,sub_210C4E.skip17
	ld	XWA,0
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,sub_210C4E.skip15
	ld	BC,0x58
	jr	sub_210C4E.skip16
sub_210C4E.skip15:
	ld	BC,0x78
sub_210C4E.skip16:
	ld	DE,0x44
	call	DrawMenuCursor
	jr	sub_210C4E.skip17
sub_210C4E.skip17:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
sub_210C4E.done:
	ret

c_210D34	section	code abs=0x210D34

sub_210D34:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
	ret

c_210D3A	section	code abs=0x210D3A

sub_210D3A:
	call	RollFloorMaps
	ld	A,1
	ld	W,(XIZ+DUNGEON_ID)
	cp	W,5
	jr	Z,sub_210D3A.skip
	ld	W,(wJoyHeld)
	cp	W,0
	jr	Z,sub_210D3A.skip
	inc	1,A
	cp	W,0x22
	jr	Z,sub_210D3A.skip
	inc	1,A
	cp	W,0x21
	jr	Z,sub_210D3A.skip
	inc	1,A
	cp	W,0x32
	jr	Z,sub_210D3A.skip
	inc	1,A
	cp	W,0x34
	jr	Z,sub_210D3A.skip
	inc	1,A
	cp	W,0x38
	jr	Z,sub_210D3A.skip
	inc	1,A
	cp	W,0x31
	jr	Z,sub_210D3A.skip
	ld	A,1
sub_210D3A.skip:
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	cp	A,W
	jr	C,sub_210D3A.skip2
	ld	A,(XIZ+DUNGEON_FLOOR_COUNT)
sub_210D3A.skip2:
	ld	(XIZ+DUNGEON_FLOOR),A
	ld	A,1
	ld	(XIZ+0x12),A
	call	PlayDungeonMusic
	calr	sub_210D95
	ret

c_210D95	section	code abs=0x210D95

sub_210D95:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	LoadDungeonFloor
	call	swp_211BE0
	call	swp_211C52
	call	sub_212A01
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,1
	ld	(XIZ+DUNGEON_FACING),A
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	call	dyn_216EDE
	call	dyn_216FB1
	call	dyn_216F8E
	call	sub_212A10
	ld	WA,0x85
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210DD4	section	code abs=0x210DD4

sub_210DD4:
	call	dyn_216FC3
	cp	A,1
	jr	Z,sub_210DD4.done
	xor	A,A
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	call	sub_212A1E
sub_210DD4.done:
	ret

c_210DEB	section	code abs=0x210DEB

; [code] only called by CheckEncounter after the cell attr test 0x100 (sets +0x12 = 2) or 0x200 (+0x12 = 1); starts the 0x60F1.. transition (dyn_216EDE, swp_216FBA), sound 0x85, DUNGEON_MODE 4, whose handler sub_210E23 does floor +1 (1) / -1 (2) / 0 (3)
StartFloorChange:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_216EDE
	call	swp_216FBA
	ld	WA,0x85
	call	SoundCommand
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210E08	section	code abs=0x210E08

sub_210E08:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	ld	(XIZ+0x12),A
	call	dyn_216EDE
	call	swp_216FBA
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210E23	section	code abs=0x210E23

sub_210E23:
	call	dyn_216FC3
	cp	A,1
	jr	Z,sub_210E23.done
	call	sub_212A69
	ld	A,(XIZ+0x12)
	cp	A,3
	jr	NZ,sub_210E23.skip
	ld	A,0
	ld	(XIZ+DUNGEON_FLOOR),A
	jr	sub_210E23.skip4
sub_210E23.skip:
	cp	A,2
	jr	NZ,sub_210E23.skip2
	ld	A,(XIZ+DUNGEON_FLOOR)
	sub	A,1
	jr	C,sub_210E23.skip4
	ld	(XIZ+DUNGEON_FLOOR),A
	jr	sub_210E23.skip4
sub_210E23.skip2:
	cp	A,1
	jr	NZ,sub_210E23.skip3
	ld	A,(XIZ+DUNGEON_FLOOR)
	inc	1,A
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	cp	W,A
	jr	C,sub_210E23.skip4
	ld	(XIZ+DUNGEON_FLOOR),A
	jr	sub_210E23.skip4
sub_210E23.skip3:
	ld	A,0
	ld	(XIZ+0x12),A
sub_210E23.skip4:
	ld	A,(XIZ+DUNGEON_FLOOR)
	and	A,A
	jr	NZ,sub_210E23.skip6
	ld	A,0
	ld	(0x584B),A
	ld	(0x584D),A
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,sub_210E23.skip5
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	jr	sub_210E23.done
sub_210E23.skip5:
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0
	ld	(XIZ+DUNGEON_MODE),A
	call	dyn_216E3A
	jr	sub_210E23.done
sub_210E23.skip6:
	calr	sub_210D95
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
sub_210E23.done:
	ret

c_210EA0	section	code abs=0x210EA0

sub_210EA0:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_206803
	call	dyn_206825
	call	LoadDungeonFloor
	call	swp_211C52
	call	sub_212A01
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210EBD	section	code abs=0x210EBD

; [code] PlayMusic(DUNGEON_ID - 1 + 5) and SoundCommand(DUNGEON_ID - 1 + 0x25); callers sub_210D3A, sub_210F62, BossEncounter
PlayDungeonMusic:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+DUNGEON_ID)
	dec	1,A
	extz	WA
	extz	XWA
	add	XWA,5
	call	PlayMusic
	ld	A,(XIZ+DUNGEON_ID)
	dec	1,A
	extz	WA
	add	WA,0x25
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210F39	section	code abs=0x210F39

sub_210F39:
	ld	A,(wBattleResult)
	cp	A,0xFF
	jr	Z,sub_210F39.done
	cp	A,3
	jr	NZ,sub_210F39.skip
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jr	sub_210F39.done
sub_210F39.skip:
	calr	sub_210F56
sub_210F39.done:
	ret

c_210F56	section	code abs=0x210F56

sub_210F56:
	push	A
	call	sub_212B9F
	ld	A,8
	ld	(XIZ+DUNGEON_MODE),A
	pop	A
	ret

c_210F62	section	code abs=0x210F62

sub_210F62:
	ld	A,(wFadeLevel)
	cp	A,0x7F
	jr	NZ,sub_210F62.skip
	call	sub_210EA0
	call	PlayDungeonMusic
sub_210F62.skip:
	call	sub_212BA4
	cp	A,1
	jr	Z,sub_210F62.done
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
sub_210F62.done:
	ret

c_210F86	section	code abs=0x210F86

sub_210F86:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_212A69
	ld	A,9
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210F98	section	code abs=0x210F98

sub_210F98:
	ld	A,0xA
	ld	(XIZ+DUNGEON_MODE),A
	call	sub_21255D
	ret

c_210FA2	section	code abs=0x210FA2

sub_210FA2:
	call	CampMenuDispatch
	ret

c_210FA7	section	code abs=0x210FA7

swp_210FA7:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0xB
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210FB5	section	code abs=0x210FB5

sub_210FB5:
	xor	A,A
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	ret

c_210FC0	section	code abs=0x210FC0

sub_210FC0:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_212A69
	ld	A,0xC
	ld	(XIZ+DUNGEON_MODE),A
	call	sub_21266E
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210FD6	section	code abs=0x210FD6

sub_210FD6:
	call	OpenChest
	ret

c_210FDB	section	code abs=0x210FDB

swp_210FDB:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	xor	A,A
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_210FEE	section	code abs=0x210FEE

sub_210FEE:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_212A69
	ld	A,0xD
	ld	(XIZ+DUNGEON_MODE),A
	call	swp_212CAF
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211004	section	code abs=0x211004

sub_211004:
	call	BossEncounter
	ret

c_211009	section	code abs=0x211009

swp_211009:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	xor	A,A
	ld	(XIZ+0x2C),A
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21101C	section	code abs=0x21101C

sub_21101C:
	push	WA
	ld	HL,0
	cp	A,0xFF
	jr	Z,sub_21101C.skip5
	cp	A,0
	jr	NZ,sub_21101C.skip
	ld	H,0xFF
	jr	sub_21101C.skip5
sub_21101C.skip:
	cp	A,1
	jr	NZ,sub_21101C.skip2
	ld	H,1
	jr	sub_21101C.skip5
sub_21101C.skip2:
	cp	A,2
	jr	NZ,sub_21101C.skip3
	ld	L,0xFF
	jr	sub_21101C.skip5
sub_21101C.skip3:
	cp	A,3
	jr	NZ,sub_21101C.skip4
	ld	L,1
	jr	sub_21101C.skip5
sub_21101C.skip4:
	ld	A,0xFF
sub_21101C.skip5:
	ld	BC,0
	ld	DE,0
	ld	C,(XIZ+DUNGEON_X)
	add	C,L
	ld	E,(XIZ+DUNGEON_Y)
	add	E,H
	push	WA
	push	BC
	push	DE
	call	swp_206F55
	pop	DE
	pop	BC
	pop	WA
	pop	WA
	ret

c_211060	section	code abs=0x211060

sub_211060:
	push	W
	calr	sub_21101C
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,sub_211060.skip
	call	sub_2118B2
	cp	W,0xFF
	jr	Z,sub_211060.skip
	cp	W,0xFE
	jr	Z,sub_211060.skip
	ld	A,0xFF
	jr	sub_211060.skip3
sub_211060.skip:
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	NZ,sub_211060.skip2
	jr	sub_211060.skip3
sub_211060.skip2:
	push	HL
	and	HL,0x1000
	cp	HL,0x1000
	pop	HL
	jr	NZ,sub_211060.skip3
	ld	A,0xFF
	jr	sub_211060.skip3
sub_211060.skip3:
	pop	W
	ret

c_2110A4	section	code abs=0x2110A4

sub_2110A4:
	push	XHL
	push	XDE
	push	XBC
	push	W
	call	sub_21156E
	cp	A,0
	jr	NZ,sub_2110A4.skip
	ld	A,0
	calr	sub_21101C
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,sub_2110A4.skip2
	ld	A,1
	calr	sub_21101C
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,sub_2110A4.skip2
	ld	A,2
	calr	sub_21101C
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,sub_2110A4.skip2
	ld	A,3
	calr	sub_21101C
	push	HL
	and	HL,0x9000
	cp	HL,0x9000
	pop	HL
	jr	Z,sub_2110A4.skip2
sub_2110A4.skip:
	ld	A,0xFF
sub_2110A4.skip2:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2110FD	section	code abs=0x2110FD

sub_2110FD:
	push	XHL
	push	XDE
	push	XBC
	push	W
	ld	A,0
	calr	sub_21101C
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,sub_2110FD.skip
	call	sub_2118B2
	cp	W,0xFF
	jr	Z,sub_2110FD.skip
	cp	W,0xFE
	jr	Z,sub_2110FD.skip
	cp	W,0xFD
	jr	Z,sub_2110FD.skip
	jr	sub_2110FD.skip5
sub_2110FD.skip:
	ld	A,1
	calr	sub_21101C
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,sub_2110FD.skip2
	call	sub_2118B2
	cp	W,0xFF
	jr	Z,sub_2110FD.skip2
	cp	W,0xFE
	jr	Z,sub_2110FD.skip2
	cp	W,0xFD
	jr	Z,sub_2110FD.skip2
	jr	sub_2110FD.skip5
sub_2110FD.skip2:
	ld	A,2
	calr	sub_21101C
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,sub_2110FD.skip3
	call	sub_2118B2
	cp	W,0xFF
	jr	Z,sub_2110FD.skip3
	cp	W,0xFE
	jr	Z,sub_2110FD.skip3
	cp	W,0xFD
	jr	Z,sub_2110FD.skip3
	jr	sub_2110FD.skip5
sub_2110FD.skip3:
	ld	A,3
	calr	sub_21101C
	push	HL
	and	HL,0x8000
	cp	HL,0x8000
	pop	HL
	jr	NZ,sub_2110FD.skip4
	call	sub_2118B2
	cp	W,0xFF
	jr	Z,sub_2110FD.skip4
	cp	W,0xFE
	jr	Z,sub_2110FD.skip4
	cp	W,0xFD
	jr	Z,sub_2110FD.skip4
	jr	sub_2110FD.skip5
sub_2110FD.skip4:
	ld	A,0xFF
sub_2110FD.skip5:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2111A2	section	code abs=0x2111A2

sub_2111A2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,(wUnitMaxHP)
	add	WA,0x14
	sub	WA,1
	extz	XWA
	div	XWA,0x14
	ld	HL,(wUnitHP)
	sub	HL,WA
	ld	WA,HL
	jr	C,sub_2111A2.skip
	jr	Z,sub_2111A2.skip
	ld	(wUnitHP),WA
	ld	A,3
	ld	(XIZ+DUNGEON_MODE),A
	jr	sub_2111A2.skip2
sub_2111A2.skip:
	call	sub_212A69
	ld	WA,0
	ld	(wUnitHP),WA
	call	sub_212BF1
	call	sub_212C10
	ld	XHL,PlayerIsDeadText
	ld	A,6
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,(XIZ+DUNGEON_FACING)
	sla	4,A
	ld	(XIZ+0x2D),A
	ld	A,0xF
	ld	(XIZ+DUNGEON_MODE),A
sub_2111A2.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211202	section	code abs=0x211202

; wStepsSinceBattle -> chance table 0x2275C0
CheckEncounter:
	ld	A,(XIZ+0x2C)
	and	A,A
	jrl	Z,CheckEncounter.skip5
	dec	1,A
	ld	(XIZ+0x2C),A
	jrl	NZ,CheckEncounter.done
	xor	WA,WA
	ld	(0x5BCB),WA
	ld	(0x5BCD),WA
	ld	A,(XIZ+0x1E)
	ld	(XIZ+DUNGEON_X),A
	ld	A,(XIZ+0x1F)
	ld	(XIZ+DUNGEON_Y),A
	ld	A,0xFF
	calr	sub_211060
	ld	DE,HL
	and	HL,0x100
	jr	Z,CheckEncounter.skip
	ld	A,2
	ld	(XIZ+0x12),A
	calr	StartFloorChange
	jrl	CheckEncounter.done
CheckEncounter.skip:
	ld	HL,DE
	and	HL,0x200
	jr	Z,CheckEncounter.skip2
	ld	A,1
	ld	(XIZ+0x12),A
	calr	StartFloorChange
	jrl	CheckEncounter.done
CheckEncounter.skip2:
	calr	sub_2110A4
	cp	A,0xFF
	jr	Z,CheckEncounter.skip3
	calr	sub_210FEE
	jrl	CheckEncounter.done
CheckEncounter.skip3:
	ld	A,(XIZ+DUNGEON_STEPS)
	inc	1,A
	ld	(XIZ+DUNGEON_STEPS),A
	ld	XHL,EncounterChance
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_STEPS)
	sub	XWA,1
	add	XHL,XWA
	ld	W,(XHL)
	push	W
	call	Random
	ld	W,0
	div	WA,0x64
	ld	A,W
	pop	W
	cp	A,W
	jr	NC,CheckEncounter.skip4
	call	sub_212A69
	call	sub_212B14
	ld	A,0
	ld	(XIZ+DUNGEON_STEPS),A
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	jrl	CheckEncounter.done
CheckEncounter.skip4:
	ld	A,(wStatusRust)
	cp	A,0
	jr	Z,CheckEncounter.skip5
	ld	XHL,swp_208C24
	call	StartChildTask
	ldw	(XHL+0xE),0xF
	ld	A,0xE
	ld	(XIZ+DUNGEON_MODE),A
	jrl	CheckEncounter.done
CheckEncounter.skip5:
	ld	A,(wJoyHeld)
	and	A,D_PAD|A_BUTTON|B_BUTTON
	jr	NZ,CheckEncounter.skip6
	call	sub_212A93
	jrl	CheckEncounter.done
CheckEncounter.skip6:
	call	sub_212A85
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CheckEncounter.skip7
	calr	sub_2110FD
	cp	A,0xFF
	jr	Z,CheckEncounter.skip7
	calr	sub_21101C
	call	FindChestByAttr
	ld	(XIZ+0x21),A
	calr	sub_210FC0
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jrl	CheckEncounter.done
CheckEncounter.skip7:
	ld	A,(wJoyPressed)
	bit	BIT_B_BUTTON,A
	jr	Z,CheckEncounter.skip8
	ld	WA,0x94
	call	SoundCommand
	calr	sub_210F86
	jrl	CheckEncounter.done
CheckEncounter.skip8:
	ld	A,(wJoyHeld)
	and	A,D_PAD
	jrl	Z,CheckEncounter.done
	ld	W,0xFF
	cp	A,1
	jr	NZ,CheckEncounter.skip9
	ld	A,0
	ld	(XIZ+DUNGEON_FACING),A
	jrl	CheckEncounter.skip28
CheckEncounter.skip9:
	cp	A,9
	jr	NZ,CheckEncounter.skip13
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,0
	jr	NZ,CheckEncounter.skip10
	ld	A,3
	ld	W,0
	jr	CheckEncounter.skip12
CheckEncounter.skip10:
	cp	A,3
	jr	NZ,CheckEncounter.skip11
	ld	A,0
	ld	W,3
	jr	CheckEncounter.skip12
CheckEncounter.skip11:
	ld	A,0
	ld	W,3
CheckEncounter.skip12:
	jrl	CheckEncounter.skip28
CheckEncounter.skip13:
	cp	A,8
	jr	NZ,CheckEncounter.skip14
	ld	A,3
	ld	(XIZ+DUNGEON_FACING),A
	jr	CheckEncounter.skip28
CheckEncounter.skip14:
	cp	A,0xA
	jr	NZ,CheckEncounter.skip18
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,1
	jr	NZ,CheckEncounter.skip15
	ld	A,3
	ld	W,1
	jr	CheckEncounter.skip17
CheckEncounter.skip15:
	cp	A,3
	jr	NZ,CheckEncounter.skip16
	ld	A,1
	ld	W,3
	jr	CheckEncounter.skip17
CheckEncounter.skip16:
	ld	A,1
	ld	W,3
CheckEncounter.skip17:
	jr	CheckEncounter.skip28
CheckEncounter.skip18:
	cp	A,2
	jr	NZ,CheckEncounter.skip19
	ld	A,1
	ld	(XIZ+DUNGEON_FACING),A
	jr	CheckEncounter.skip28
CheckEncounter.skip19:
	cp	A,6
	jr	NZ,CheckEncounter.skip23
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,1
	jr	NZ,CheckEncounter.skip20
	ld	A,2
	ld	W,1
	jr	CheckEncounter.skip22
CheckEncounter.skip20:
	cp	A,2
	jr	NZ,CheckEncounter.skip21
	ld	A,1
	ld	W,2
	jr	CheckEncounter.skip22
CheckEncounter.skip21:
	ld	A,1
	ld	W,2
CheckEncounter.skip22:
	jr	CheckEncounter.skip28
CheckEncounter.skip23:
	cp	A,4
	jr	NZ,CheckEncounter.skip24
	ld	A,2
	ld	(XIZ+DUNGEON_FACING),A
	jr	CheckEncounter.skip28
CheckEncounter.skip24:
	cp	A,5
	jr	NZ,CheckEncounter.skip28
	ld	A,(XIZ+DUNGEON_FACING)
	cp	A,0
	jr	NZ,CheckEncounter.skip25
	ld	A,2
	ld	W,0
	jr	CheckEncounter.skip27
CheckEncounter.skip25:
	cp	A,2
	jr	NZ,CheckEncounter.skip26
	ld	A,0
	ld	W,2
	jr	CheckEncounter.skip27
CheckEncounter.skip26:
	ld	A,0
	ld	W,2
CheckEncounter.skip27:
	jr	CheckEncounter.skip28
CheckEncounter.skip28:
	calr	sub_211060
	cp	A,0xFF
	jr	NZ,CheckEncounter.skip30
	cp	W,0xFF
	jr	Z,CheckEncounter.skip29
	ld	A,W
	calr	sub_211060
	cp	A,0xFF
	jr	NZ,CheckEncounter.skip30
CheckEncounter.skip29:
	ld	WA,0x92
	call	SoundCommand
	jr	CheckEncounter.done
CheckEncounter.skip30:
	ld	(XIZ+DUNGEON_FACING),A
	ld	(XIZ+0x1E),C
	ld	(XIZ+0x1F),E
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_X)
	sub	WA,BC
	neg	WA
	ld	(0x5BCB),WA
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_Y)
	sub	WA,DE
	neg	WA
	ld	(0x5BCD),WA
	ld	A,0x10
	ld	(XIZ+0x2C),A
CheckEncounter.done:
	ret

c_211421	section	code abs=0x211421

; [code+play] CheckEncounter after a step; ran into every battle_encounter_*
DungeonStep:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,1
	jr	NZ,DungeonStep.skip
	calr	sub_210D3A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jrl	DungeonStep.skip17
DungeonStep.skip:
	cp	A,2
	jr	NZ,DungeonStep.skip2
	calr	sub_210DD4
	jrl	DungeonStep.skip17
DungeonStep.skip2:
	cp	A,3
	jr	NZ,DungeonStep.skip3
	calr	CheckEncounter
	jrl	DungeonStep.skip17
DungeonStep.skip3:
	cp	A,4
	jr	NZ,DungeonStep.skip4
	calr	sub_210E23
	jrl	DungeonStep.skip17
DungeonStep.skip4:
	cp	A,5
	jr	NZ,DungeonStep.skip5
	calr	sub_210EE8
	jrl	DungeonStep.skip17
DungeonStep.skip5:
	cp	A,6
	jr	NZ,DungeonStep.skip6
	calr	StartDungeonBattle
	jrl	DungeonStep.skip17
DungeonStep.skip6:
	cp	A,7
	jr	NZ,DungeonStep.skip7
	calr	sub_210F39
	jrl	DungeonStep.skip17
DungeonStep.skip7:
	cp	A,8
	jr	NZ,DungeonStep.skip8
	calr	sub_210F62
	jr	DungeonStep.skip17
DungeonStep.skip8:
	cp	A,9
	jr	NZ,DungeonStep.skip9
	calr	sub_210F98
	jr	DungeonStep.skip17
DungeonStep.skip9:
	cp	A,0xA
	jr	NZ,DungeonStep.skip10
	calr	sub_210FA2
	jr	DungeonStep.skip17
DungeonStep.skip10:
	cp	A,0xB
	jr	NZ,DungeonStep.skip11
	calr	sub_210FB5
	jr	DungeonStep.skip17
DungeonStep.skip11:
	cp	A,0xC
	jr	NZ,DungeonStep.skip12
	calr	sub_210FD6
	jr	DungeonStep.skip17
DungeonStep.skip12:
	cp	A,0xD
	jr	NZ,DungeonStep.skip13
	calr	sub_211004
	jr	DungeonStep.skip17
DungeonStep.skip13:
	cp	A,0xE
	jr	NZ,DungeonStep.skip14
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,DungeonStep.skip17
	calr	sub_2111A2
	jr	DungeonStep.skip17
DungeonStep.skip14:
	cp	A,0xF
	jr	NZ,DungeonStep.skip15
	ld	A,6
	call	GetTextBox
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	jr	NZ,DungeonStep.skip17
	ld	A,0x10
	ld	(XIZ+DUNGEON_MODE),A
	jr	DungeonStep.skip17
DungeonStep.skip15:
	cp	A,0x10
	jr	NZ,DungeonStep.skip16
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,DungeonStep.skip17
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jr	DungeonStep.skip17
DungeonStep.skip16:
	ld	A,1
	ld	(XIZ+DUNGEON_MODE),A
DungeonStep.skip17:
	ld	A,(XIZ+DUNGEON_MODE)
	cp	A,7
	jr	Z,DungeonStep.done
	cp	A,0xD
	jr	NZ,DungeonStep.skip18
	ld	W,(XIZ+0x2A)
	cp	W,9
	jr	Z,DungeonStep.skip22
	call	sub_212C92
	cp	A,8
	jr	Z,DungeonStep.skip22
	jr	DungeonStep.skip20
DungeonStep.skip18:
	cp	A,0xA
	jr	NZ,DungeonStep.skip19
	ld	W,(XIZ+0x2A)
	cp	W,6
	jr	Z,DungeonStep.skip22
	cp	W,7
	jr	Z,DungeonStep.skip22
	cp	W,8
	jr	Z,DungeonStep.skip22
DungeonStep.skip19:
	cp	A,0xF
	jr	C,DungeonStep.skip20
	call	LoadPlayerDungeonSprite
	jr	DungeonStep.skip21
DungeonStep.skip20:
	call	LoadDungeonPalettes
DungeonStep.skip21:
	call	sub_211D80
	call	sub_2116A7
	call	sub_212AA1
DungeonStep.skip22:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
DungeonStep.done:
	ret

c_21154F	section	code abs=0x21154F

swp_21154F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	xor	WA,WA
	ld	(0x5BC7),WA
	ld	(0x5BC9),WA
	ld	(0x5BCB),WA
	ld	(0x5BCD),WA
	call	loc_206FC1
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21156E	section	code abs=0x21156E

sub_21156E:
	push	XHL
	push	XDE
	push	XBC
	push	W
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,sub_21156E.skip
	ld	W,(XIZ+DUNGEON_FLOOR)
	cp	W,7
	jr	C,sub_21156E.skip3
sub_21156E.skip:
	call	sub_212C92
	cp	A,8
	jr	Z,sub_21156E.skip2
	extz	WA
	ld	HL,0x60
	add	HL,WA
	call	CheckEventFlag
	ld	A,L
	jr	sub_21156E.skip4
sub_21156E.skip2:
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	ld	A,L
	jr	sub_21156E.skip4
sub_21156E.skip3:
	ld	A,0xFF
sub_21156E.skip4:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2116A7	section	code abs=0x2116A7

sub_2116A7:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_21156E
	cp	A,0
	jr	NZ,sub_2116A7.skip
	call	LoadBossMapSprite
sub_2116A7.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2116BC	section	code abs=0x2116BC

; [code] weighted pick (ChestOdds) from WorldChests[dungeon, floor]
PickWorldChest:
	push	XHL
	push	XDE
	push	XBC
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	sub	A,1
	mul	XWA,7
	ld	XDE,XWA
	ld	XWA,0
	ld	A,(XIZ+0x22)
	add	XDE,XWA
	mul	XDE,7
	ld	XHL,WorldChests
	add	XHL,XDE
	push	W
	call	Random
	ld	W,0
	div	WA,0x64
	ld	A,W
	pop	W
	ld	C,0
	ld	XDE,ChestOdds
PickWorldChest.loop:
	ld	W,(XDE)
	sub	A,W
	jr	C,PickWorldChest.skip
	inc	1,XDE
	inc	1,C
	jr	PickWorldChest.loop
PickWorldChest.skip:
	ld	XWA,0
	ld	A,C
	add	XHL,XWA
	ld	A,(XHL)
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21170D	section	code abs=0x21170D

; [code] fills wChestTable with FF
ClearChestTable:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0xFF
	ld	XHL,wChestTable
	ld	(XHL),A
	ld	XDE,XHL
	inc	1,XDE
	ld	BC,0xD2
	dec	1,BC
	ldir	(XDE+),(XHL+)
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21172A	section	code abs=0x21172A

; [code] MineChests[floor], skipping chests whose event flag is set
SetMineChests:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x22)
	extz	WA
	extz	XWA
	ld	XHL,XIZ
	add	XHL,DUNGEON_FLOOR_MAPS
	ld	XDE,XHL
	add	XDE,XWA
	ld	XWA,0
	ld	A,(XDE)
	mul	WA,DUNGEON_MAP_SIZE
	ld	XDE,DungeonMaps
	add	XDE,XWA
	add	XDE,DUNGEON_MAP_CHESTS
	ld	XDE,(XDE)
	ld	A,(XIZ+0x22)
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,CHEST_FLOOR_SIZE
	ld	XHL,wChestTable
	add	XHL,XWA
	pop	XWA
	ld	B,6
	push	XHL
SetMineChests.loop:
	ld	A,0xFD
	ld	(XHL+0),A
	inc	5,XHL
	djnz	B,SetMineChests.loop
	pop	XHL
	ld	C,6
SetMineChests.loop2:
	ld	A,(XHL+0)
	cp	A,0xFD
	jr	NZ,SetMineChests.skip
	ld	A,(XIZ+0x22)
	extz	WA
	mul	WA,7
	push	XHL
	ld	HL,(XDE+4)
	extz	HL
	add	HL,WA
	add	HL,0x70
	push	BC
	call	CheckEventFlag
	pop	BC
	ld	WA,HL
	pop	XHL
	cp	A,1
	jr	Z,SetMineChests.skip
	push	XDE
	ld	XWA,0
	ld	A,(XIZ+0x22)
	mul	XWA,6
	ld	XDE,MineChests
	add	XDE,XWA
	ld	XWA,0
	ld	A,6
	sub	A,C
	add	XDE,XWA
	ld	A,(XDE)
	ld	(XHL+0),A
	pop	XDE
SetMineChests.skip:
	ld	WA,(XDE)
	ld	(XHL+1),A
	inc	2,XDE
	ld	WA,(XDE)
	ld	(XHL+2),A
	inc	2,XDE
	ld	WA,(XDE)
	ld	(XHL+3),WA
	inc	2,XDE
	inc	5,XHL
	djnz	C,SetMineChests.loop2
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2117E2	section	code abs=0x2117E2

; [code] A = floor: Crystal Mine -> SetMineChests, else 1 empty + 5 x PickWorldChest
RollFloorChests:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	(XIZ+0x22),A
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	NZ,RollFloorChests.skip
	calr	SetMineChests
	jrl	RollFloorChests.skip4
RollFloorChests.skip:
	ld	A,(XIZ+0x22)
	extz	WA
	extz	XWA
	ld	XHL,XIZ
	add	XHL,DUNGEON_FLOOR_MAPS
	ld	XDE,XHL
	add	XDE,XWA
	ld	XWA,0
	ld	A,(XDE)
	mul	WA,DUNGEON_MAP_SIZE
	ld	XDE,DungeonMaps
	add	XDE,XWA
	add	XDE,DUNGEON_MAP_CHESTS
	ld	XDE,(XDE)
	ld	A,(XIZ+0x22)
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,CHEST_FLOOR_SIZE
	ld	XHL,wChestTable
	add	XHL,XWA
	pop	XWA
	ld	C,6
	push	XHL
RollFloorChests.loop:
	ld	A,0xFC
	ld	(XHL+0),A
	inc	5,XHL
	djnz	C,RollFloorChests.loop
	pop	XHL
	ld	C,6
	ld	B,5
RollFloorChests.loop2:
	push	XHL
	call	Random
	ld	W,0
	div	WA,C
	ld	A,W
	extz	WA
	extz	XWA
	mul	WA,5
	add	XHL,XWA
	ld	A,(XHL+0)
	cp	A,0xFC
	jr	Z,RollFloorChests.skip2
	pop	XHL
	jr	RollFloorChests.loop2
RollFloorChests.skip2:
	ld	A,0xFD
	ld	(XHL+0),A
	pop	XHL
	djnz	B,RollFloorChests.loop2
	ld	C,6
RollFloorChests.loop3:
	ld	A,(XHL+0)
	cp	A,0xFD
	jr	NZ,RollFloorChests.skip3
	calr	PickWorldChest
	ld	(XHL+0),A
RollFloorChests.skip3:
	ld	WA,(XDE)
	ld	(XHL+1),A
	inc	2,XDE
	ld	WA,(XDE)
	ld	(XHL+2),A
	inc	2,XDE
	ld	WA,(XDE)
	ld	(XHL+3),WA
	inc	2,XDE
	inc	5,XHL
	djnz	C,RollFloorChests.loop3
RollFloorChests.skip4:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21189C	section	code abs=0x21189C

; [code+play] RollFloorChests for every floor (play: chests are rolled at dungeon entry)
RollAllChests:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,(XIZ+DUNGEON_FLOOR_COUNT)
	ld	A,0
RollAllChests.loop:
	calr	RollFloorChests
	inc	1,A
	djnz	C,RollAllChests.loop
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2118B2	section	code abs=0x2118B2

sub_2118B2:
	push	XHL
	push	XDE
	push	XBC
	push	A
	push	A
	ld	A,(XIZ+DUNGEON_FLOOR)
	dec	1,A
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,CHEST_FLOOR_SIZE
	ld	XHL,wChestTable
	add	XHL,XWA
	pop	XWA
	pop	A
	ld	D,6
sub_2118B2.loop:
	ld	W,(XHL+0)
	cp	W,0xFF
	jr	Z,sub_2118B2.skip2
	ld	A,(XHL+1)
	cp	C,A
	jr	NZ,sub_2118B2.skip
	ld	A,(XHL+2)
	cp	E,A
	jr	NZ,sub_2118B2.skip
	jr	sub_2118B2.skip2
sub_2118B2.skip:
	inc	5,XHL
	djnz	D,sub_2118B2.loop
	ld	W,0xFF
sub_2118B2.skip2:
	pop	A
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2118F4	section	code abs=0x2118F4

sub_2118F4:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	A
	ld	A,(XIZ+DUNGEON_FLOOR)
	dec	1,A
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,CHEST_FLOOR_SIZE
	ld	XHL,wChestTable
	add	XHL,XWA
	pop	XWA
	pop	A
	ld	C,6
sub_2118F4.loop:
	ld	W,(XHL+0)
	cp	W,0xFF
	jr	Z,sub_2118F4.skip4
	cp	W,0xFE
	jr	NZ,sub_2118F4.skip
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	dec	1,XWA
	mul	XWA,0x42
	ld	XDE,MapSpriteChestFE1
	add	XDE,XWA
	jr	sub_2118F4.skip3
sub_2118F4.skip:
	cp	W,0xFD
	jr	NZ,sub_2118F4.skip2
	ld	XDE,MapSpriteChestOpened
	jr	sub_2118F4.skip3
sub_2118F4.skip2:
	ld	XDE,MapSpriteChest
sub_2118F4.skip3:
	ld	WA,(XHL+3)
	and	WA,0xF
	sll	2,WA
	add	WA,0x169
	push	XHL
	push	BC
	ld	XHL,XDE
	call	LoadRawTiles
	pop	BC
	pop	XHL
	inc	5,XHL
	djnz	C,sub_2118F4.loop
sub_2118F4.skip4:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211966	section	code abs=0x211966

; [code] HL = cell attr word: scans the 6 wChestTable entries of the current floor (CHEST_FLOOR_SIZE, 5 bytes each) for attr word +3 == HL -> A = chest index 0-5, 6 if none; only caller CheckEncounter
FindChestByAttr:
	push	XHL
	push	XDE
	push	XBC
	ld	BC,HL
	push	A
	ld	A,(XIZ+DUNGEON_FLOOR)
	dec	1,A
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,CHEST_FLOOR_SIZE
	ld	XHL,wChestTable
	add	XHL,XWA
	pop	XWA
	pop	A
	ld	W,6
	ld	A,0
FindChestByAttr.loop:
	ld	DE,(XHL+3)
	cp	BC,DE
	jr	Z,FindChestByAttr.skip
	inc	1,A
	inc	5,XHL
	djnz	W,FindChestByAttr.loop
FindChestByAttr.skip:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211999	section	code abs=0x211999

; [code] A = chest index -> A = content byte +0 of wChestTable[DUNGEON_FLOOR - 1][A] (5 bytes per entry); only caller OpenChest
GetChestCode:
	push	XHL
	push	XDE
	push	XBC
	push	W
	push	A
	ld	A,(XIZ+DUNGEON_FLOOR)
	dec	1,A
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,CHEST_FLOOR_SIZE
	ld	XHL,wChestTable
	add	XHL,XWA
	pop	XWA
	pop	A
	extz	WA
	extz	XWA
	mul	WA,5
	add	XHL,XWA
	ld	A,(XHL+0)
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2119C8	section	code abs=0x2119C8

sub_2119C8:
	push	XHL
	push	XDE
	push	XBC
	push	W
	cp	A,0x4A
	jr	C,sub_2119C8.skip
	ld	A,1
	jr	sub_2119C8.skip2
sub_2119C8.skip:
	ld	A,0
sub_2119C8.skip2:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2119DE	section	code abs=0x2119DE

; [code] chest code -> WA = item id, or part CoreX (72) / Grav (73)
GetChestContent:
	push	XHL
	push	XDE
	push	XBC
	cp	A,0x48
	jr	NZ,GetChestContent.skip
	ld	WA,0x119
	jr	GetChestContent.skip3
GetChestContent.skip:
	cp	A,0x49
	jr	NZ,GetChestContent.skip2
	ld	WA,0x159
	jr	GetChestContent.skip3
GetChestContent.skip2:
	extz	WA
GetChestContent.skip3:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2119FB	section	code abs=0x2119FB

; [code] gold code 74-89 -> WA = ChestGold
GetChestGold:
	push	XHL
	push	XDE
	push	XBC
	sub	A,0x4A
	extz	WA
	extz	XWA
	sll	1,XWA
	ld	XHL,ChestGold
	add	XHL,XWA
	ld	WA,(XHL)
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211A15	section	code abs=0x211A15

; [code] gold code 74-89 -> XHL = ChestGoldText
GetChestGoldText:
	push	XDE
	push	XBC
	push	XWA
	sub	A,0x4A
	extz	WA
	extz	XWA
	mul	XWA,6
	ld	XHL,ChestGoldText
	add	XHL,XWA
	pop	XWA
	pop	XBC
	pop	XDE
	ret

c_211A2E	section	code abs=0x211A2E

; [code] wChestTable[floor][chest] = 0xFD (opened); mine: SetEventFlag 0x70 + 7*(floor-1) + chest
MarkChestOpened:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	push	A
	ld	A,(XIZ+DUNGEON_FLOOR)
	dec	1,A
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,CHEST_FLOOR_SIZE
	ld	XHL,wChestTable
	add	XHL,XWA
	pop	XWA
	pop	A
	extz	WA
	extz	XWA
	mul	WA,5
	add	XHL,XWA
	ld	A,0xFD
	ld	(XHL+0),A
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	NZ,MarkChestOpened.skip
	ld	A,(XIZ+DUNGEON_FLOOR)
	dec	1,A
	extz	WA
	mul	WA,7
	ld	HL,(XHL+3)
	extz	HL
	add	HL,WA
	add	HL,0x70
	call	SetEventFlag
MarkChestOpened.skip:
	calr	sub_2118F4
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211A80	section	code abs=0x211A80

; 6 distinct rand%12 for floors 1-6, boss map for floor 7 -> wFloorMaps
RollFloorMaps:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,RollFloorMaps.skip2
	ld	A,7
	ld	(XIZ+DUNGEON_FLOOR_COUNT),A
	ld	XHL,XIZ
	add	XHL,DUNGEON_FLOOR_MAPS
	ld	C,6
RollFloorMaps.loop:
	push	W
	call	Random
	ld	W,0
	div	WA,0xC
	ld	A,W
	pop	W
	ld	B,6
	sub	B,C
	jr	Z,RollFloorMaps.skip
	ld	XDE,XHL
RollFloorMaps.loop2:
	dec	1,XDE
	ld	W,(XDE)
	cp	A,W
	jr	Z,RollFloorMaps.loop
	djnz	B,RollFloorMaps.loop2
RollFloorMaps.skip:
	ld	(XHL),A
	inc	1,XHL
	djnz	C,RollFloorMaps.loop
	ld	A,0xC
	ld	(XIZ+0x1D),A
	ld	XHL,XIZ
	add	XHL,DUNGEON_FLOOR_MAPS
	ld	DE,0
	ld	E,(XIZ+DUNGEON_ID)
	sub	E,1
	mul	DE,0xD
	ld	C,7
RollFloorMaps.loop3:
	ld	A,(XHL)
	add	A,E
	ld	(XHL),A
	inc	1,XHL
	djnz	C,RollFloorMaps.loop3
	jr	RollFloorMaps.skip3
RollFloorMaps.skip2:
	ld	A,5
	ld	(XIZ+DUNGEON_FLOOR_COUNT),A
	ld	A,0x34
	ld	(XIZ+DUNGEON_FLOOR_MAPS),A
	inc	1,A
	ld	(XIZ+0x18),A
	inc	1,A
	ld	(XIZ+0x19),A
	inc	1,A
	ld	(XIZ+0x1A),A
	inc	1,A
	ld	(XIZ+0x1B),A
RollFloorMaps.skip3:
	calr	ClearChestTable
	calr	RollAllChests
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211BD2	section	code abs=0x211BD2

sub_211BD2:
	ld	XHL,DungeonData
	add	XHL,4
	ld	XHL,(XHL)
	ret

c_211BE0	section	code abs=0x211BE0

swp_211BE0:
	push	XHL
	push	XDE
	push	BC
	push	XWA
	ld	A,(XIZ+0x12)
	cp	A,2
	jr	Z,swp_211BE0.skip
	ld	HL,0x100
	jr	swp_211BE0.skip2
swp_211BE0.skip:
	ld	HL,0x200
swp_211BE0.skip2:
	ld	(XIZ+0x2C),HL
	ld	XHL,(wMapPtr)
	ld	BC,(XHL)
	inc	2,XHL
	ld	DE,(XHL)
	ld	A,C
	ld	W,E
	ld	BC,0
	ld	DE,0
swp_211BE0.loop:
	push	WA
	push	BC
	push	DE
	call	swp_206F55
	pop	DE
	pop	BC
	pop	WA
	and	HL,(XIZ+0x2C)
	jr	NZ,swp_211BE0.skip3
	inc	1,BC
	cp	C,A
	jr	C,swp_211BE0.loop
	ld	BC,0
	inc	1,DE
	cp	E,W
	jr	C,swp_211BE0.loop
	ld	BC,0
	ld	DE,0
swp_211BE0.loop2:
	push	WA
	push	BC
	push	DE
	call	swp_206F55
	pop	DE
	pop	BC
	pop	WA
	and	HL,0x1000
	jr	Z,swp_211BE0.skip3
	inc	1,BC
	cp	C,A
	jr	C,swp_211BE0.loop2
	ld	BC,0
	inc	1,DE
	cp	E,W
	jr	C,swp_211BE0.loop2
swp_211BE0.skip3:
	ld	(XIZ+DUNGEON_X),C
	ld	(XIZ+DUNGEON_Y),E
	pop	XWA
	pop	BC
	pop	XDE
	pop	XHL
	ret

c_211C52	section	code abs=0x211C52

swp_211C52:
	push	XWA
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_X)
	sub	A,5
	mul	WA,0x10
	add	WA,8
	ld	(0x5BC7),WA
	xor	WA,WA
	ld	A,(XIZ+DUNGEON_Y)
	sub	A,5
	mul	WA,0x10
	add	WA,0xC
	ld	(0x5BC9),WA
	call	loc_206FC1
	pop	XWA
	ret

c_211D80	section	code abs=0x211D80

sub_211D80:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	BC,0x50
	ld	DE,0x50
	calr	sub_211D92
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211D92	section	code abs=0x211D92

sub_211D92:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	sub	BC,8
	sub	DE,0xC
	ld	WA,0
	sll	13,WA
	ld	HL,0
	sll	9,HL
	or	WA,HL
	or	WA,0xC
	ld	QB,2
	ld	QD,2
	call	sub_206BFF
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211DDE	section	code abs=0x211DDE

; [code] A = box: text pointer +8 = 0x249755 = FA FF (TextCmd_Wait, TextCmd_End); 4 callers (swp_210929, sub_210AA4, CampItemUseMenu, swp_2127F3)
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

swp_211DF3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_211BD2
	ld	HL,(XHL)
	ld	WA,(0x5BCF)
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

swp_211E12:
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

; [code] dyn_207598(3): clears box 3's +8/+0xC pointers and fills its screen rectangle (+2..+5) with 0 via dyn_206768; callers CampLeave, CampLeavePrompt
EraseTextBox3:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,3
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211E7A	section	code abs=0x211E7A

swp_211E7A:
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

swp_211EC0:
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

swp_211EE1:
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

sub_211EF4:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,7
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211F4A	section	code abs=0x211F4A

sub_211F4A:
	call	dyn_206803
	call	dyn_206825
	calr	sub_211F03
	calr	DrawCampItemList
	calr	DrawStatusLabel
	calr	sub_211F20
	calr	sub_21206C
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,3
	ld	(XIZ+0x21),A
	ret

c_21206C	section	code abs=0x21206C

sub_21206C:
	push	XHL
	push	XWA
	ld	A,(XIZ+0x20)
	extz	WA
	add	WA,0x26
	call	0x2061D6
	jr	C,sub_21206C.skip
	ld	A,(XIZ+0x20)
	extz	WA
	add	WA,0x26
	call	GetItemOrPartDesc
	ld	A,1
	call	DrawBoxString
sub_21206C.skip:
	pop	XWA
	pop	XHL
	ret

c_212093	section	code abs=0x212093

; [code+play] camp_item_use_list; UseHealItem, DrawStatusLabel
CampItemUseMenu:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CampItemUseMenu.skip2
	ld	A,(XIZ+0x20)
	extz	WA
	add	WA,0x26
	call	0x2061D6
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
	calr	sub_21206C
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
	calr	sub_212241
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

sub_2121F9:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_2121F9.skip
	jr	sub_2121F9.skip3
sub_2121F9.skip:
	bit	5,A
	jr	Z,sub_2121F9.skip2
	jr	sub_2121F9.skip3
sub_2121F9.skip2:
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
	call	sub_206BFF
	jr	sub_2121F9.done
sub_2121F9.skip3:
	call	ClearTextBox1
	ld	A,(XIZ+0x20)
	cp	A,6
	jr	Z,sub_2121F9.skip4
	calr	sub_21206C
sub_2121F9.skip4:
	ld	A,3
	ld	(XIZ+0x21),A
sub_2121F9.done:
	ret

c_212241	section	code abs=0x212241

sub_212241:
	ld	XHL,0x8800
	ld	XDE,0x8802
	ld	BC,0x80
	dec	1,BC
	ld	WA,0
	ld	(XHL),WA
	ldirw	(XDE+),(XHL+)
	call	sub_210EA0
	calr	swp_211DF3
	calr	swp_211E7A
	calr	swp_211E12
	ld	A,(XIZ+0x1F)
	ld	(XIZ+0x20),A
	call	sub_2129E9
	ld	A,4
	ld	(XIZ+0x2A),A
	ret

c_212273	section	code abs=0x212273

; [code] CampMenuDispatch state 8 (set by sub_212476 after sub_211F4A draws the heal item list and sets +0x21 = 3): switch on +0x21, 3 -> CampItemUseMenu, 5 -> sub_2121F9 (A/B, back to 3), 1/2/4/6 idle, else +0x2A = 1
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
	calr	sub_2121F9
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

; [code+play] Camp > Leave
CampLeave:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CampLeave.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	CampLeave.skip7
CampLeave.skip:
	bit	5,A
	jr	Z,CampLeave.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,3
	ld	(XIZ+0x20),A
	jr	CampLeave.skip7
CampLeave.skip2:
	and	A,0xF
	jr	Z,CampLeave.skip6
	cp	A,1
	jr	NZ,CampLeave.skip4
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	Z,CampLeave.skip3
	dec	1,A
	ld	(XIZ+0x20),A
	jr	CampLeave.skip6
CampLeave.skip3:
	ld	A,3
	ld	(XIZ+0x20),A
	jr	CampLeave.skip6
CampLeave.skip4:
	cp	A,2
	jr	NZ,CampLeave.skip6
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,3
	jr	Z,CampLeave.skip5
	inc	1,A
	ld	(XIZ+0x20),A
	jr	CampLeave.skip6
CampLeave.skip5:
	ld	A,0
	ld	(XIZ+0x20),A
	jr	CampLeave.skip6
CampLeave.skip6:
	ld	BC,0x68
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,8
	add	WA,0x1C
	ld	DE,WA
	call	DrawMenuCursor
	jrl	CampLeave.done
CampLeave.skip7:
	ld	A,(XIZ+0x20)
	ld	(XIZ+0x1E),A
	cp	A,0
	jr	NZ,CampLeave.skip8
	calr	swp_211E7A
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,4
	ld	(XIZ+0x2A),A
	jr	CampLeave.done
CampLeave.skip8:
	cp	A,1
	jr	NZ,CampLeave.skip9
	calr	EraseTextBox3
	call	sub_2129F8
	ld	A,0
	ld	(0x584B),A
	ld	(0x584D),A
	ld	A,4
	ld	(0x620A),A
	ld	XHL,swp_21AA89
	call	StartChildTask
	ld	A,6
	ld	(XIZ+0x2A),A
	jr	CampLeave.done
CampLeave.skip9:
	cp	A,2
	jr	NZ,CampLeave.skip10
	call	sub_2129D2
	ld	A,3
	call	ClearTextBox
	ld	A,3
	ld	XHL,CampText
	call	DrawBoxString
	ld	C,0
	ld	E,4
	ld	A,3
	call	sub_20768A
	ld	A,3
	ld	XHL,LeaveText
	call	DrawBoxString
	calr	swp_211EC0
	calr	swp_211EE1
	ld	A,1
	ld	(XIZ+0x20),A
	ld	A,5
	ld	(XIZ+0x2A),A
	jr	CampLeave.done
CampLeave.skip10:
	calr	EraseTextBox3
	call	sub_2129F8
	call	swp_210FA7
	jr	CampLeave.done
CampLeave.done:
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
	call	sub_2128B0
	calr	sub_211EF4
	call	sub_210E08
	jr	CampLeavePrompt.done
CampLeavePrompt.skip9:
	calr	sub_211EF4
	calr	DrawCampMenu
	call	DrawDungeonStatus
	call	sub_2128D5
	ld	A,(XIZ+0x1E)
	ld	(XIZ+0x20),A
	ld	A,3
	ld	(XIZ+0x2A),A
	jr	CampLeavePrompt.done
CampLeavePrompt.done:
	ret

c_212476	section	code abs=0x212476

sub_212476:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_212476.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jrl	sub_212476.skip9
sub_212476.skip:
	bit	5,A
	jr	Z,sub_212476.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,3
	ld	(XIZ+0x20),A
	jr	sub_212476.skip9
sub_212476.skip2:
	and	A,0xF
	jr	Z,sub_212476.skip8
	cp	A,1
	jr	NZ,sub_212476.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	Z,sub_212476.skip3
	cp	A,3
	jr	Z,sub_212476.skip4
	dec	1,A
	ld	(XIZ+0x20),A
	jr	sub_212476.skip8
sub_212476.skip3:
	ld	A,3
	ld	(XIZ+0x20),A
	jr	sub_212476.skip8
sub_212476.skip4:
	ld	A,1
	ld	(XIZ+0x20),A
	jr	sub_212476.skip8
sub_212476.skip5:
	cp	A,2
	jr	NZ,sub_212476.skip8
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	Z,sub_212476.skip6
	cp	A,3
	jr	Z,sub_212476.skip7
	inc	1,A
	ld	(XIZ+0x20),A
	jr	sub_212476.skip8
sub_212476.skip6:
	ld	A,3
	ld	(XIZ+0x20),A
	jr	sub_212476.skip8
sub_212476.skip7:
	ld	A,0
	ld	(XIZ+0x20),A
	jr	sub_212476.skip8
sub_212476.skip8:
	ld	BC,0x68
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,8
	add	WA,0x1C
	ld	DE,WA
	call	DrawMenuCursor
	jr	sub_212476.done
sub_212476.skip9:
	ld	A,(XIZ+0x20)
	ld	(XIZ+0x1F),A
	cp	A,0
	jr	NZ,sub_212476.skip10
	calr	sub_211F4A
	ld	A,8
	ld	(XIZ+0x2A),A
	jr	sub_212476.done
sub_212476.skip10:
	cp	A,1
	jr	NZ,sub_212476.skip11
	ld	A,0
	ld	(0x584B),A
	ld	(0x584D),A
	ld	A,5
	ld	(0x620A),A
	ld	XHL,swp_21AA89
	call	StartChildTask
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	sub_212476.done
sub_212476.skip11:
	calr	DrawCampMenu
	ld	A,(XIZ+0x1E)
	ld	(XIZ+0x20),A
	ld	A,3
	ld	(XIZ+0x2A),A
sub_212476.done:
	ret

c_21255D	section	code abs=0x21255D

sub_21255D:
	ld	A,1
	ld	(XIZ+0x2A),A
	ret

c_212563	section	code abs=0x212563

; [code] switch on task +0x2A (states 1-9): DrawCampMenu, CampLeave, CampLeavePrompt, fades
CampMenuDispatch:
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,CampMenuDispatch.skip
	calr	swp_211DF3
	calr	DrawCampMenu
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,2
	ld	(XIZ+0x2A),A
	jrl	CampMenuDispatch.done
CampMenuDispatch.skip:
	cp	A,2
	jr	NZ,CampMenuDispatch.skip2
	calr	swp_211E12
	call	sub_2129E9
	ld	A,3
	ld	(XIZ+0x2A),A
	jrl	CampMenuDispatch.done
CampMenuDispatch.skip2:
	cp	A,3
	jr	NZ,CampMenuDispatch.skip3
	calr	CampLeave
	jr	CampMenuDispatch.done
CampMenuDispatch.skip3:
	cp	A,4
	jr	NZ,CampMenuDispatch.skip4
	calr	sub_212476
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
	call	sub_210EA0
	calr	swp_211DF3
	calr	swp_211E7A
	calr	swp_211E12
	call	sub_2129E9
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
	call	sub_210EA0
	calr	swp_211DF3
	calr	DrawCampMenu
	calr	swp_211E12
	call	sub_2129E9
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

c_212622	section	code abs=0x212622

; [code+play] text box 5: DoYouOpenYesText
ShowOpenChestPrompt:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_211BD2
	ld	HL,(XHL)
	ld	WA,(0x5BCF)
	add	HL,WA
	ld	A,5
	ld	C,0x10
	ld	E,5
	call	OpenTextBox
	ld	A,5
	ld	XHL,DoYouOpenYesText
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21264C	section	code abs=0x21264C

sub_21264C:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,5
	ld	C,2
	ld	E,0x2C
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21265F	section	code abs=0x21265F

sub_21265F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,5
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21266E	section	code abs=0x21266E

sub_21266E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	(XIZ+0x2A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21267C	section	code abs=0x21267C

; [code+play] Found / You found / It's empty; chest screens
OpenChest:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,OpenChest.skip
	calr	ShowOpenChestPrompt
	ld	A,0
	ld	(XIZ+0x20),A
	ld	A,2
	ld	(XIZ+0x2A),A
	jrl	loc_212844
OpenChest.skip:
	cp	A,2
	jr	NZ,OpenChest.skip2
	calr	sub_21264C
	ld	A,3
	ld	(XIZ+0x2A),A
	jrl	loc_212844
OpenChest.skip2:
	cp	A,3
	jr	NZ,OpenChest.skip9
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,OpenChest.skip3
	ld	A,4
	ld	(XIZ+0x2A),A
	jrl	loc_212844
OpenChest.skip3:
	bit	5,A
	jr	Z,OpenChest.skip4
	ld	A,1
	ld	(XIZ+0x20),A
	ld	A,4
	ld	(XIZ+0x2A),A
	jrl	loc_212844
OpenChest.skip4:
	and	A,0xF
	jrl	Z,loc_212844
	cp	A,4
	jr	NZ,OpenChest.skip6
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	Z,OpenChest.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x20),A
	jr	OpenChest.skip8
OpenChest.skip5:
	jr	OpenChest.skip8
OpenChest.skip6:
	cp	A,8
	jr	NZ,OpenChest.skip8
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	Z,OpenChest.skip7
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x20),A
	jr	OpenChest.skip8
OpenChest.skip7:
	jr	OpenChest.skip8
OpenChest.skip8:
	jrl	loc_212844
OpenChest.skip9:
	cp	A,4
	jrl	NZ,loc_2127FC
	calr	sub_21265F
	ld	A,(XIZ+0x20)
	cp	A,0
	jrl	NZ,loc_2127F5
	ld	A,5
	call	ClearTextBox
	ld	A,(XIZ+0x21)
	call	GetChestCode
	cp	A,0xFC
	jrl	Z,OpenChest.skip12
	push	A
	call	sub_2119C8
	cp	A,1
	pop	A
	jr	Z,OpenChest.skip11
	push	A
	call	GetChestContent
	call	AddItem
	pop	A
	jr	NC,OpenChest.skip10
	push	A
	call	GetChestContent
	call	GetItemOrPartName
	ld	A,5
	call	DrawBoxString
	ld	A,5
	ld	XHL,FoundText
	call	DrawBoxString
	pop	A
	ld	A,5
	ld	XHL,ButYouCantCarryText
	call	DrawBoxString
	jr	OpenChest.skip14
OpenChest.skip10:
	push	A
	ld	A,5
	ld	XHL,YouFoundText2
	call	DrawBoxString
	pop	A
	call	GetChestContent
	call	GetItemOrPartName
	ld	A,5
	call	DrawBoxString
	ld	A,5
	ld	XHL,ExclText
	call	DrawBoxString
	jr	OpenChest.skip13
OpenChest.skip11:
	push	A
	ld	A,5
	ld	XHL,EmptyText2
	call	DrawBoxString
	ld	A,5
	ld	XHL,YouFoundText2
	call	DrawBoxString
	pop	A
	push	A
	call	GetChestGoldText
	ld	A,5
	call	DrawBoxString
	ld	A,5
	ld	XHL,GPText
	call	DrawBoxString
	pop	A
	call	GetChestGold
	call	AddGP
	jr	OpenChest.skip13
OpenChest.skip12:
	ld	A,5
	ld	XHL,ItsEmptyText
	call	DrawBoxString
OpenChest.skip13:
	ld	A,(XIZ+0x21)
	call	MarkChestOpened
	ld	WA,0x93
	call	SoundCommand
OpenChest.skip14:
	ld	A,5
	ld	(XIZ+0x2A),A
	jr	loc_2127FC

c_2127F3	section	code abs=0x2127F3

swp_2127F3:
	jr	loc_212844

c_2127F5	section	code abs=0x2127F5

loc_2127F5:
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	loc_212844

c_2127FC	section	code abs=0x2127FC

loc_2127FC:
	cp	A,5
	jr	NZ,loc_2127FC.skip
	calr	sub_21264C
	ld	A,5
	call	SetTextBoxWait
	ld	A,6
	ld	(XIZ+0x2A),A
	jr	loc_212844
loc_2127FC.skip:
	cp	A,6
	jr	NZ,loc_2127FC.skip4
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,loc_2127FC.skip2
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	loc_212844
loc_2127FC.skip2:
	bit	5,A
	jr	Z,loc_2127FC.skip3
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	loc_212844
loc_2127FC.skip3:
	jr	loc_212844
loc_2127FC.skip4:
	cp	A,7
	jr	NZ,loc_2127FC.skip5
	calr	sub_21265F
	call	swp_210FDB
	jr	loc_212844
loc_2127FC.skip5:
	ld	A,1
	ld	(XIZ+0x2A),A

c_212844	section	code abs=0x212844

loc_212844:
	ld	A,(XIZ+0x2A)
	cp	A,3
	jr	NZ,loc_212844.skip
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,0x28
	add	WA,0x28
	ld	BC,WA
	ld	DE,0x74
	call	DrawMenuCursor
	jr	loc_212844.skip
loc_212844.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212867	section	code abs=0x212867

swp_212867:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x14
	ld	A,1
	ld	C,7
	ld	E,3
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21287D	section	code abs=0x21287D

sub_21287D:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	C,1
	ld	E,0x21
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212890	section	code abs=0x212890

sub_212890:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_FLOOR)
	sll	2,A
	ld	XHL,AreaNames
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2128B0	section	code abs=0x2128B0

sub_2128B0:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2128BF	section	code abs=0x2128BF

sub_2128BF:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x19
	ld	A,2
	ld	C,0xC
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2128D5	section	code abs=0x2128D5

sub_2128D5:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	ld	C,7
	ld	E,0x2D
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2129D2	section	code abs=0x2129D2

sub_2129D2:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,2
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2129E1	section	code abs=0x2129E1

swp_2129E1:
	calr	swp_212867
	call	sub_2128BF
	ret

c_2129E9	section	code abs=0x2129E9

sub_2129E9:
	calr	sub_212890
	call	DrawDungeonStatus
	calr	sub_21287D
	call	sub_2128D5
	ret

c_2129F8	section	code abs=0x2129F8

sub_2129F8:
	call	sub_2128B0
	call	sub_2129D2
	ret

c_212A01	section	code abs=0x212A01

sub_212A01:
	push	A
	calr	swp_212867
	call	sub_2128BF
	ld	A,8
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A10	section	code abs=0x212A10

sub_212A10:
	push	A
	calr	sub_212890
	calr	sub_21287D
	ld	A,3
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A1E	section	code abs=0x212A1E

sub_212A1E:
	push	A
	calr	sub_21287D
	push	A
	ld	A,0
	ld	(XIZ+0x28),A
	pop	A
	ld	A,4
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A30	section	code abs=0x212A30

sub_212A30:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,7
	jr	Z,sub_212A30.skip2
	cp	A,8
	jr	Z,sub_212A30.skip
	call	sub_2128B0
	call	sub_2129D2
sub_212A30.skip:
	push	A
	ld	A,0
	ld	(XIZ+0x28),A
	pop	A
	ld	A,7
	ld	(XIZ+0x29),A
sub_212A30.skip2:
	pop	A
	ret

c_212A53	section	code abs=0x212A53

sub_212A53:
	push	A
	calr	sub_212890
	call	DrawDungeonStatus
	calr	sub_21287D
	call	sub_2128D5
	ld	A,5
	ld	(XIZ+0x29),A
	pop	A
	ret

c_212A69	section	code abs=0x212A69

sub_212A69:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,8
	jr	Z,sub_212A69.skip2
	cp	A,7
	jr	Z,sub_212A69.skip
	call	sub_2128B0
	call	sub_2129D2
sub_212A69.skip:
	ld	A,8
	ld	(XIZ+0x29),A
sub_212A69.skip2:
	pop	A
	ret

c_212A85	section	code abs=0x212A85

sub_212A85:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,4
	jr	Z,sub_212A85.skip
	call	sub_212A69
sub_212A85.skip:
	pop	A
	ret

c_212A93	section	code abs=0x212A93

sub_212A93:
	push	A
	ld	A,(XIZ+0x29)
	cp	A,8
	jr	NZ,sub_212A93.skip
	calr	sub_212A30
sub_212A93.skip:
	pop	A
	ret

c_212AA1	section	code abs=0x212AA1

sub_212AA1:
	ld	A,(XIZ+0x29)
	cp	A,1
	jr	NZ,sub_212AA1.skip
	jr	sub_212AA1.done
sub_212AA1.skip:
	cp	A,2
	jr	NZ,sub_212AA1.skip2
	jr	sub_212AA1.done
sub_212AA1.skip2:
	cp	A,3
	jr	NZ,sub_212AA1.skip3
	jr	sub_212AA1.done
sub_212AA1.skip3:
	cp	A,4
	jr	NZ,sub_212AA1.skip5
	push	A
	ld	A,(XIZ+0x28)
	inc	1,A
	ld	(XIZ+0x28),A
	pop	A
	ld	A,(XIZ+0x28)
	cp	A,0x80
	jr	C,sub_212AA1.done
	ld	A,(wJoyHeld)
	and	A,D_PAD|A_BUTTON|B_BUTTON
	jr	NZ,sub_212AA1.skip4
	calr	sub_212A53
	jr	sub_212AA1.done
sub_212AA1.skip4:
	call	sub_212A69
	jr	sub_212AA1.done
sub_212AA1.skip5:
	cp	A,5
	jr	NZ,sub_212AA1.skip6
	jr	sub_212AA1.done
sub_212AA1.skip6:
	cp	A,6
	jr	NZ,sub_212AA1.skip7
	jr	sub_212AA1.done
sub_212AA1.skip7:
	cp	A,7
	jr	NZ,sub_212AA1.skip8
	push	A
	ld	A,(XIZ+0x28)
	inc	1,A
	ld	(XIZ+0x28),A
	pop	A
	ld	A,(XIZ+0x28)
	cp	A,0x80
	jr	C,sub_212AA1.done
	calr	sub_212A53
	jr	sub_212AA1.done
sub_212AA1.skip8:
	cp	A,8
	jr	NZ,sub_212AA1.skip9
	jr	sub_212AA1.done
sub_212AA1.skip9:
	ld	A,8
	ld	(XIZ+0x29),A
sub_212AA1.done:
	ret

c_212B14	section	code abs=0x212B14

sub_212B14:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	XWA,0xE
	call	PlayMusic
	ld	WA,0x2E
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212B80	section	code abs=0x212B80

sub_212B80:
	push	XHL
	push	XDE
	push	XBC
	ld	WA,0x10
	ld	BC,0
	ld	C,(XIZ+0x2C)
	call	sub_216DCD
	ld	C,(XIZ+0x2C)
	inc	1,C
	ld	(XIZ+0x2C),C
	cp	A,1
	jr	Z,sub_212B80.skip
sub_212B80.skip:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212B9F	section	code abs=0x212B9F

sub_212B9F:
	call	swp_216E8C
	ret

c_212BA4	section	code abs=0x212BA4

sub_212BA4:
	ld	A,0x10
	call	sub_216E95
	ret

c_212BF1	section	code abs=0x212BF1

sub_212BF1:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_211BD2
	ld	HL,(XHL)
	ld	WA,(0x5BCF)
	add	HL,WA
	ld	A,6
	ld	C,0x14
	ld	E,5
	call	OpenTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C10	section	code abs=0x212C10

sub_212C10:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,6
	ld	C,0
	ld	E,0x2E
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C23	section	code abs=0x212C23

sub_212C23:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,6
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C32	section	code abs=0x212C32

swp_212C32:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,6
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C41	section	code abs=0x212C41

sub_212C41:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	HL,0x19
	ld	A,7
	ld	C,0x12
	ld	E,3
	call	OpenTextBox
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	NZ,sub_212C41.skip
	ld	XHL,JoinYesNoText
	jr	sub_212C41.skip2
sub_212C41.skip:
	ld	XHL,TryYesNoText
sub_212C41.skip2:
	ld	A,7
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C70	section	code abs=0x212C70

sub_212C70:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,7
	ld	C,1
	ld	E,0x2A
	call	PlaceTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C83	section	code abs=0x212C83

sub_212C83:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,7
	call	sub_207598
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212C92	section	code abs=0x212C92

sub_212C92:
	push	XHL
	push	XDE
	push	XBC
	push	W
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	NZ,sub_212C92.skip
	ld	W,(XIZ+DUNGEON_FLOOR)
	sub	W,1
	add	A,W
sub_212C92.skip:
	sub	A,1
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212CAF	section	code abs=0x212CAF

swp_212CAF:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	(XIZ+0x2A),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212CBD	section	code abs=0x212CBD

sub_212CBD:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,0
	ld	(XIZ+0x25),A
	ld	A,0
	ld	(XIZ+0x27),A
	ld	A,0
	ld	(XIZ+0x26),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212CD5	section	code abs=0x212CD5

; [code] box 6 talk runner for BossEncounter (only caller): message = pointer table 0x24B37A[boss index (sub_212C92) * 4 + (+0x2A - 3)]; A/B during printing sets speed +0x10 = 0 (saved in +0x23/+0x24), waits on the TextCmd_Wait state (+0x12 & 0x7F == 2)
BossTalkStep:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,BossTalkStep.skip
	ld	B,(XIZ+0x24)
	dec	1,B
	ld	(XIZ+0x24),B
	jrl	NZ,loc_212D96
	ld	A,6
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
BossTalkStep.skip:
	ld	A,6
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,BossTalkStep.skip4
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	jr	NZ,BossTalkStep.skip2
	ld	A,1
	ld	(XIZ+0x26),A
BossTalkStep.skip2:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jr	Z,loc_212D96
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,BossTalkStep.skip3
	ld	A,0
	ld	(XIZ+0x26),A
	jr	loc_212D96
BossTalkStep.skip3:
	ld	A,6
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	inc	1,C
	ld	(XIZ+0x24),C
	ld	C,0
	ld	(XWA+0x10),C
	jr	loc_212D96
BossTalkStep.skip4:
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,BossTalkStep.skip5
	ld	A,1
	ld	(XIZ+0x25),A
	jr	loc_212D96
BossTalkStep.skip5:
	ld	XHL,0
	call	sub_212C92
	extz	WA
	extz	XWA
	mul	XWA,4
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+0x2A)
	sub	A,3
	add	XHL,XWA
	ld	XWA,XHL
	sll	2,XWA
	ld	XHL,BossTalkTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,6
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,2
	ld	(XIZ+0x25),A
	jr	loc_212D96

c_212D8F	section	code abs=0x212D8F

swp_212D8F:
	ld	A,1
	ld	(XIZ+0x25),A
	jr	loc_212D96

c_212D96	section	code abs=0x212D96

loc_212D96:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212D9B	section	code abs=0x212D9B

sub_212D9B:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_212B66
	ld	A,8
	ld	(XIZ+0x2A),A
	ld	XWA,0xE
	call	PlayMusic
	ld	WA,0x2E
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_212DBD	section	code abs=0x212DBD

; [code+play] world/mine boss talk and battle: portrait, LoadEnemy, win flag (Ent, Catble, Squidl, Simrug, Behemoth screens)
BossEncounter:
	ld	A,(XIZ+0x2A)
	cp	A,1
	jr	NZ,BossEncounter.skip
	call	sub_212BF1
	ld	A,2
	ld	(XIZ+0x2A),A
	jrl	BossEncounter.skip37
BossEncounter.skip:
	cp	A,2
	jr	NZ,BossEncounter.skip2
	call	sub_212C10
	calr	sub_212CBD
	ld	A,3
	ld	(XIZ+0x2A),A
	call	sub_212C92
	cp	A,8
	jrl	NZ,BossEncounter.skip37
	call	dyn_206803
	ld	A,0
	ld	(0x584B),A
	ld	(0x584D),A
	ld	BC,0
	ld	DE,0
	ld	WA,0x37
	ld	HL,0x39
	call	DrawPortrait
	jrl	BossEncounter.skip37
BossEncounter.skip2:
	cp	A,3
	jr	NZ,BossEncounter.skip6
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	ld	A,(XIZ+DUNGEON_FLOOR)
	cp	A,W
	jr	NC,BossEncounter.skip3
	calr	sub_212C23
	calr	sub_212D9B
	jrl	BossEncounter.skip37
BossEncounter.skip3:
	calr	sub_212C41
	calr	sub_212C70
	call	sub_212C92
	cp	A,8
	jr	Z,BossEncounter.skip4
	ld	A,0
	jr	BossEncounter.skip5
BossEncounter.skip4:
	ld	A,1
BossEncounter.skip5:
	ld	(XIZ+0x20),A
	ld	A,7
	ld	(XIZ+0x2A),A
	jrl	BossEncounter.skip37
BossEncounter.skip6:
	cp	A,7
	jr	NZ,BossEncounter.skip13
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,BossEncounter.skip8
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,BossEncounter.skip7
	calr	sub_212CBD
	ld	A,4
	ld	(XIZ+0x2A),A
	jr	BossEncounter.skip11
BossEncounter.skip7:
	calr	sub_212CBD
	ld	A,5
	ld	(XIZ+0x2A),A
	jr	BossEncounter.skip11
BossEncounter.skip8:
	and	A,0xF
	jr	Z,BossEncounter.skip12
	cp	A,4
	jr	NZ,BossEncounter.skip9
	ld	A,(XIZ+0x20)
	cp	A,1
	jr	NZ,BossEncounter.skip9
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,0
	ld	(XIZ+0x20),A
	jr	BossEncounter.skip12
BossEncounter.skip9:
	cp	A,8
	jr	NZ,BossEncounter.skip10
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	NZ,BossEncounter.skip10
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x20),A
	jr	BossEncounter.skip12
BossEncounter.skip10:
	jr	BossEncounter.skip12
BossEncounter.skip11:
	calr	sub_212C83
BossEncounter.skip12:
	jrl	BossEncounter.skip37
BossEncounter.skip13:
	cp	A,4
	jr	NZ,BossEncounter.skip15
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
	calr	sub_212C23
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,BossEncounter.skip14
	calr	sub_212D9B
	jrl	BossEncounter.skip37
BossEncounter.skip14:
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	jrl	BossEncounter.done
BossEncounter.skip15:
	cp	A,5
	jr	NZ,BossEncounter.skip17
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
	calr	sub_212C23
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,BossEncounter.skip16
	call	sub_210E08
	ld	A,0xB
	ld	(XIZ+0x2A),A
	jrl	BossEncounter.skip37
BossEncounter.skip16:
	calr	sub_212D9B
	jrl	BossEncounter.skip37
BossEncounter.skip17:
	cp	A,8
	jr	NZ,BossEncounter.skip20
	call	sub_212B80
	cp	A,1
	jrl	Z,BossEncounter.skip37
	call	sub_212C92
	extz	WA
	extz	XWA
	ld	XHL,BossEnemies
	add	XHL,XWA
	ld	A,(XHL)
	ld	XHL,0
	ld	W,(XIZ+DUNGEON_ID)
	cp	W,5
	jr	Z,BossEncounter.skip18
	ld	W,(XIZ+DUNGEON_FLOOR)
	jr	BossEncounter.skip19
BossEncounter.skip18:
	ld	W,8
BossEncounter.skip19:
	ld	(wAreaLevel),W
	call	LoadEnemy
	ldb	(wDungeonBattle),1
	call	swp_207C00
	ld	A,9
	ld	(XIZ+0x2A),A
	jrl	BossEncounter.skip37
BossEncounter.skip20:
	cp	A,9
	jr	NZ,BossEncounter.skip23
	ld	A,(wBattleResult)
	cp	A,0xFF
	jrl	Z,BossEncounter.skip37
	cp	A,3
	jr	NZ,BossEncounter.skip22
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	NZ,BossEncounter.skip21
	ld	A,(XIZ+DUNGEON_FLOOR)
	ld	W,(XIZ+DUNGEON_FLOOR_COUNT)
	cp	A,W
	jr	C,BossEncounter.skip21
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,5
	ld	(XIZ+DUNGEON_MODE),A
	jrl	BossEncounter.done
BossEncounter.skip21:
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+DUNGEON_MODE),A
	jrl	BossEncounter.done
BossEncounter.skip22:
	call	sub_212B9F
	ld	A,0xA
	ld	(XIZ+0x2A),A
	jrl	BossEncounter.skip37
BossEncounter.skip23:
	cp	A,0xA
	jr	NZ,BossEncounter.skip28
	ld	A,(wFadeLevel)
	cp	A,0x7F
	jr	NZ,BossEncounter.skip26
	call	sub_212C92
	cp	A,8
	jr	Z,BossEncounter.skip24
	call	sub_210EA0
	call	PlayDungeonMusic
	cp	A,4
	jr	C,BossEncounter.skip25
	extz	WA
	ld	HL,0x60
	add	HL,WA
	call	SetEventFlag
	call	LoadBossMapSprite
	jr	BossEncounter.skip26
BossEncounter.skip24:
	ld	BC,0
	ld	DE,0
	ld	WA,0x37
	ld	HL,0x3B
	call	DrawPortrait
BossEncounter.skip25:
	call	sub_212BF1
	call	sub_212C10
BossEncounter.skip26:
	call	sub_212BA4
	cp	A,1
	jrl	Z,BossEncounter.skip37
	call	sub_212C92
	cp	A,8
	jr	Z,BossEncounter.skip27
	cp	A,4
	jr	C,BossEncounter.skip27
	jr	BossEncounter.skip29
BossEncounter.skip27:
	calr	sub_212CBD
	ld	A,6
	ld	(XIZ+0x2A),A
	jrl	BossEncounter.skip37
BossEncounter.skip28:
	cp	A,6
	jr	NZ,BossEncounter.skip33
	calr	BossTalkStep
	ld	A,(XIZ+0x25)
	cp	A,1
	jrl	NZ,BossEncounter.skip37
BossEncounter.skip29:
	call	sub_212C92
	cp	A,8
	jr	Z,BossEncounter.skip32
	cp	A,4
	jr	NC,BossEncounter.skip31
	calr	sub_212C23
	extz	WA
	ld	HL,0x60
	add	HL,WA
	call	SetEventFlag
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,5
	jr	Z,BossEncounter.skip30
	sub	A,1
	extz	WA
	ld	HL,0x10
	add	HL,WA
	call	SetEventFlag
	jr	BossEncounter.skip30
BossEncounter.skip30:
	call	LoadBossMapSprite
BossEncounter.skip31:
	ld	A,0xB
	ld	(XIZ+0x2A),A
	jr	BossEncounter.skip37
BossEncounter.skip32:
	ld	XHL,swp_208C4C
	call	StartChildTask
	ldw	(XHL+0xE),0x80
	ld	WA,0xAE
	call	SoundCommand
	ld	A,0xC
	ld	(XIZ+0x2A),A
	jr	BossEncounter.done
BossEncounter.skip33:
	cp	A,0xB
	jr	NZ,BossEncounter.skip34
	call	swp_211009
	jr	BossEncounter.skip37
BossEncounter.skip34:
	cp	A,0xC
	jr	NZ,BossEncounter.skip36
	ld	A,6
	ld	(wShakeFlags),A
	ld	A,(wFadeLevel)
	add	A,1
	cp	A,0x7F
	jr	C,BossEncounter.skip35
	ld	A,0x7F
BossEncounter.skip35:
	ld	(wFadeLevel),A
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,BossEncounter.skip37
	calr	sub_212C23
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+DUNGEON_MODE),A
	jr	BossEncounter.skip37
BossEncounter.skip36:
	ld	A,1
	ld	(XIZ+0x2A),A
BossEncounter.skip37:
	ld	A,(XIZ+0x2A)
	cp	A,7
	jr	NZ,BossEncounter.done
	ld	XWA,0
	ld	A,(XIZ+0x20)
	and	A,A
	jr	NZ,BossEncounter.skip38
	ld	BC,0x58
	jr	BossEncounter.skip39
BossEncounter.skip38:
	ld	BC,0x78
BossEncounter.skip39:
	ld	DE,0x54
	call	DrawMenuCursor
BossEncounter.done:
	ret

c_216E31	section	code abs=0x216E31

dyn_216E31:
	push	A
	ld	A,0
	ld	(wFadeLevel),A
	pop	A
	ret

c_216E3A	section	code abs=0x216E3A

dyn_216E3A:
	push	A
	ld	A,0x81
	ld	(wFadeLevel),A
	pop	A
	ret

c_216E43	section	code abs=0x216E43

dyn_216E43:
	push	W
	ld	W,(wFadeLevel)
	add	W,A
	cp	W,0
	jr	Z,dyn_216E5C
	bit	7,W
	jr	Z,dyn_216E5C
	ld	(wFadeLevel),W
	ld	A,1
	jr	0x216E64

c_216E5C	section	code abs=0x216E5C

dyn_216E5C:
	ld	W,0
	ld	(wFadeLevel),W
	ld	A,0
	pop	W
	ret

c_216E67	section	code abs=0x216E67

dyn_216E67:
	push	W
	ld	W,(wFadeLevel)
	sub	W,A
	cp	W,0x81
	jr	Z,dyn_216E81
	bit	7,W
	jr	Z,dyn_216E81
	ld	(wFadeLevel),W
	ld	A,1
	jr	0x216E89

c_216E81	section	code abs=0x216E81

dyn_216E81:
	ld	W,0x81
	ld	(wFadeLevel),W
	ld	A,0
	pop	W
	ret

c_216E8C	section	code abs=0x216E8C

swp_216E8C:
	push	A
	ld	A,0x7F
	ld	(wFadeLevel),A
	pop	A
	ret

c_216E95	section	code abs=0x216E95

sub_216E95:
	push	W
	ld	W,(wFadeLevel)
	sub	W,A
	cp	W,0
	jr	Z,sub_216E95.skip
	bit	7,W
	jr	NZ,sub_216E95.skip
	ld	(wFadeLevel),W
	ld	A,1
	jr	sub_216E95.skip2
sub_216E95.skip:
	ld	W,0
	ld	(wFadeLevel),W
	ld	A,0
sub_216E95.skip2:
	pop	W
	ret

c_216EB9	section	code abs=0x216EB9

sub_216EB9:
	push	W
	ld	W,(wFadeLevel)
	add	W,A
	cp	W,0x7F
	jr	Z,sub_216EB9.skip
	bit	7,W
	jr	NZ,sub_216EB9.skip
	ld	(wFadeLevel),W
	ld	A,1
	jr	sub_216EB9.skip2
sub_216EB9.skip:
	ld	W,0x7F
	ld	(wFadeLevel),W
	ld	A,0
sub_216EB9.skip2:
	pop	W
	ret

c_216EDE	section	code abs=0x216EDE

dyn_216EDE:
	push	A
	ld	A,0
	ld	(0x60F1),A
	add	A,0x50
	ld	(0x60F5),A
	ld	A,0xA0
	ld	(0x60F3),A
	xor	A,A
	ld	(0x60F7),A
	ld	A,0
	ld	(0x60F2),A
	add	A,0x4C
	ld	(0x60F6),A
	ld	A,0x98
	ld	(0x60F4),A
	xor	A,A
	ld	(0x60F8),A
	ld	A,0
	ld	(0x60FD),A
	ld	A,2
	ld	(0x60F9),A
	ld	(0x60FA),A
	ld	A,0xFC
	ld	(0x60FB),A
	ld	(0x60FC),A
	pop	A
	ret

c_216F2D	section	code abs=0x216F2D

swp_216F2D:
	push	WA
	ld	A,(0x60F5)
	ld	W,(0x60F1)
	sub	A,W
	add	A,0x28
	sub	A,1
	xor	W,W
	div	WA,0x28
	ld	(0x60F9),A
	ld	A,(0x60F6)
	ld	W,(0x60F2)
	sub	A,W
	add	A,0x28
	sub	A,1
	xor	W,W
	div	WA,0x28
	ld	(0x60FA),A
	pop	WA
	ret

c_216F62	section	code abs=0x216F62

swp_216F62:
	ld	(0x60F5),L
	ld	(0x60F6),H
	ret

c_216F6B	section	code abs=0x216F6B

dyn_216F6B:
	push	A
	ld	A,(0x60F1)
	ld	(WBA_H),A
	ld	A,(0x60F2)
	ld	(WBA_V),A
	ld	A,(0x60F3)
	ld	(WSI_H),A
	ld	A,(0x60F4)
	ld	(WSI_V),A
	pop	A
	ret

c_216F8E	section	code abs=0x216F8E

dyn_216F8E:
	push	A
	ld	A,(0x60F5)
	ld	(WBA_H),A
	ld	A,(0x60F6)
	ld	(WBA_V),A
	ld	A,(0x60F7)
	ld	(WSI_H),A
	ld	A,(0x60F8)
	ld	(WSI_V),A
	pop	A
	ret

c_216FB1	section	code abs=0x216FB1

dyn_216FB1:
	push	A
	ld	A,1
	ld	(0x60FD),A
	pop	A
	ret

c_216FBA	section	code abs=0x216FBA

swp_216FBA:
	push	A
	ld	A,2
	ld	(0x60FD),A
	pop	A
	ret

c_216FC3	section	code abs=0x216FC3

dyn_216FC3:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(0x60FD)
	cp	A,0
	jr	NZ,dyn_216FD3
	ld	A,0
	jrl	0x2170E0

c_216FD3	section	code abs=0x216FD3

dyn_216FD3:
	cp	A,1
	jr	NZ,loc_217054
	ld	A,0
	ld	B,(WBA_H)
	ld	C,(0x60F1)
	cp	B,C
	jr	Z,0x216FF7
	jr	C,dyn_216FD3.skip
	sub	B,(0x60F9)
	jr	dyn_216FD3.skip2
dyn_216FD3.skip:
	add	B,(0x60F9)
dyn_216FD3.skip2:
	ld	(WBA_H),B
	ld	A,1
	ld	B,(WBA_V)
	ld	C,(0x60F2)
	cp	B,C
	jr	Z,0x217015
	jr	C,dyn_216FD3.skip3
	sub	B,(0x60FA)
	jr	0x21700F
dyn_216FD3.skip3:
	add	B,(0x60FA)
	ld	(WBA_V),B
	ld	A,1
	ld	B,(WSI_H)
	ld	C,(0x60F3)
	cp	B,C
	jr	Z,0x217033
	jr	C,dyn_216FD3.skip4
	add	B,(0x60FB)
	jr	dyn_216FD3.skip5
dyn_216FD3.skip4:
	sub	B,(0x60FB)
dyn_216FD3.skip5:
	ld	(WSI_H),B
	ld	A,1
	ld	B,(WSI_V)
	ld	C,(0x60F4)
	cp	B,C
	jr	Z,0x217051
	jr	C,dyn_217047
	add	B,(0x60FC)
	jr	0x21704B

c_217047	section	code abs=0x217047

dyn_217047:
	sub	B,(0x60FC)
	ld	(WSI_V),B
	ld	A,1
	jrl	0x2170D6

c_217402	section	code abs=0x217402

sub_217402:
	or	WA,WA
	jp	Z,loc_217427
	call	GetRankTitle
	ret

c_21741B	section	code abs=0x21741B

swp_21741B:
	or	A,A
	jp	Z,loc_217427
	call	GetRaceName
	ret

c_218FA6	section	code abs=0x218FA6

loc_218FA6:
	nop
	ld	E,0xE
	reti
	db	0x5A,0xFF,0x2C,0x05,0x16,0xFF,0x2E,0x18,0x14,0xFF,0x59,0x59,0x59,0x59,0x59,0x59
	db	0xFF,0x00,0x04,0xAC,0x8F,0x21,0x00

c_218FC1	section	code abs=0x218FC1

sub_218FC1:
	call	CopyMasterStatsInfo
	call	sub_219033
	ret

c_218FCA	section	code abs=0x218FCA

; [code+play] name, rank, race, level, emblems, wExpToNext -> 0x61A3-0x61AB for the Master stats page
CopyMasterStatsInfo:
	ld	XHL,(wPlayerNamePtrCopy)
	ld	(0x61A3),XHL
	ld	A,(wArenaRankCopy)
	ld	(0x61A7),A
	ld	A,(wPlayerRaceCopy)
	ld	(0x61A8),A
	ld	A,(wPlayerLevelCopy)
	ld	(0x61A9),A
	ld	A,(wEmblemBits)
	ld	(0x61AA),A
	ld	WA,(wExpToNext)
	ld	(0x61AB),A
	ret

c_219033	section	code abs=0x219033

sub_219033:
	ld	A,2
	call	sub_21734E
	ld	XHL,0x218F9F
	ld	BC,2
	ld	WA,2
	call	swp_2171DF
	jr	loc_21905B

c_21905B	section	code abs=0x21905B

loc_21905B:
	ld	A,2
	ld	B,1
	ld	XHL,0x218FBB
	call	swp_217207
	ld	XHL,(0x61A3)
	ld	BC,0
	ld	WA,2
	call	swp_2171DF
	ld	A,(0x61A8)
	call	SplitRaceGender
	call	swp_21741B
	ld	BC,1
	ld	WA,2
	call	swp_2171DF
	ld	BC,0x304
	ld	E,(0x61A9)
	ld	WA,0x302
	call	swp_217299
	ld	A,(0x61AB)
	or	A,A
	jr	NZ,loc_21905B.skip
	ld	XHL,0x218FB4
	ld	BC,5
	ld	WA,2
	call	swp_2171DF
	jr	loc_21905B.skip2
loc_21905B.skip:
	ld	XHL,0x218FB0
	ld	BC,5
	ld	WA,2
	call	swp_2171DF
	ld	BC,0x305
	ld	E,(0x61AB)
	ld	WA,0x302
	call	swp_217299
loc_21905B.skip2:
	ld	A,(0x61A7)
	or	A,A
	jr	Z,loc_21905B.skip3
	call	sub_217402
	ld	BC,7
	ld	WA,2
	call	swp_2171DF
loc_21905B.skip3:
	ld	BC,8
	ld	E,(0x61AA)
	ld	WA,0x302
	call	swp_21746E
	ret
	db	0x59,0x59,0x59,0x59,0x59,0x59,0xFF,0x61,0x0E,0x0F,0x0E,0x05,0x63,0xFF,0x21,0x12
	db	0x0D,0xFF,0x2D,0x01,0x14,0x05,0x5A,0xFF,0x34,0x0F,0x0F,0x0C,0xFF,0x00,0x00,0xF9
	db	0x90,0x21,0x00,0x00,0x03,0xFD,0x90,0x21,0x00,0x00,0x06,0x03,0x91,0x21,0x00
