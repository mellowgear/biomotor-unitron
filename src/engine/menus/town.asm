; engine/menus/town: 177 routines (each keeps its ROM address in its own section)

c_20D84E	section	code abs=0x20D84E

dyn_20D84E:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	ld	XWA,dyn_20DA71
	ld	(XIZ+TASK_FUNC),XWA
	ld	WA,1
	call	PlayMusic
	ld	WA,0x21
	call	SoundCommand
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20D871	section	code abs=0x20D871

; [code] Works / Shop / Arena / Square / W.Map
StreetMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_2067E1
	call	sub_206847
	call	dyn_2167CF
	ld	A,2
	ld	XHL,WorksText
	call	DrawBoxString
	ld	A,2
	ld	XHL,ShopText
	call	DrawBoxString
	ld	A,2
	ld	XHL,ArenaText
	call	DrawBoxString
	ld	A,2
	ld	XHL,SquareText
	call	DrawBoxString
	ld	A,2
	ld	XHL,WMapText
	call	DrawBoxString
	ld	XHL,StreetText
	ld	A,3
	call	DrawBoxString
	call	dyn_2167E4
	ld	A,1
	call	ClearTextBox
	ld	XHL,WhereDoYouGoText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	HL,0x28
	call	dyn_216845
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	call	dyn_216EDE
	call	dyn_216FB1
	call	dyn_216F6B
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20D8FB	section	code abs=0x20D8FB

dyn_20D8FB:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,StreetMenuPrompt
	ld	WA,0x81
	call	SoundCommand
	calr	StreetMenuSelect
	jr	dyn_20D983

c_20D914	section	code abs=0x20D914

; [code+play] "Where do you go?"
StreetMenuPrompt:
	bit	5,A
	jr	Z,dyn_20D936
	ld	A,1
	call	ClearTextBox
	ld	XHL,WhereDoYouGoText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	WA,0x82
	call	SoundCommand
	jr	dyn_20D983

c_20D936	section	code abs=0x20D936

dyn_20D936:
	and	A,0xF
	jr	Z,dyn_20D983
	cp	A,1
	jr	NZ,dyn_20D936.skip2
	ld	WA,0x80
	call	SoundCommand
	ld	A,(wStreetMenuChoice)
	cp	A,0
	jr	Z,dyn_20D936.skip
	dec	1,A
	ld	(wStreetMenuChoice),A
	jr	dyn_20D936.skip4
dyn_20D936.skip:
	ld	A,4
	ld	(wStreetMenuChoice),A
	jr	dyn_20D936.skip4
dyn_20D936.skip2:
	cp	A,2
	jr	NZ,dyn_20D936.skip4
	ld	WA,0x80
	call	SoundCommand
	ld	A,(wStreetMenuChoice)
	cp	A,4
	jr	Z,dyn_20D936.skip3
	inc	1,A
	ld	(wStreetMenuChoice),A
	jr	dyn_20D936.skip4
dyn_20D936.skip3:
	ld	A,0
	ld	(wStreetMenuChoice),A
	jr	dyn_20D936.skip4
dyn_20D936.skip4:
	jr	dyn_20D983

c_20D983	section	code abs=0x20D983

dyn_20D983:
	ld	BC,0x60
	ld	XWA,0
	ld	A,(wStreetMenuChoice)
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

c_20D9A6	section	code abs=0x20D9A6

; [code] street menu A (dyn_20D8FB): choices 0-3 -> TASK_ARG 4; choice 4 (W.Map) shows NoUNITRONYouCantText when EVENT_STAGE_TOWN or EVENT_STAGE_WON_RANK_CS is set, else TASK_ARG 4
StreetMenuSelect:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,0
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,1
	call	ClearTextBox
	ld	A,(wStreetMenuChoice)
	cp	A,2
	jr	Z,dyn_20D9F8
	cp	A,3
	jr	Z,dyn_20D9F8
	cp	A,0
	jr	Z,dyn_20D9F8
	cp	A,1
	jr	Z,dyn_20D9F8
	ld	HL,EVENT_STAGE_TOWN
	call	CheckEventFlag
	jr	NZ,StreetMenuSelect.skip
	ld	HL,EVENT_STAGE_WON_RANK_CS
	call	CheckEventFlag
	jr	NZ,StreetMenuSelect.skip
	jr	dyn_20D9F8
StreetMenuSelect.skip:
	ld	A,1
	call	ClearTextBox
	ld	XHL,NoUNITRONYouCantText
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	jr	dyn_20D9FF

c_20D9F8	section	code abs=0x20D9F8

dyn_20D9F8:
	ld	A,4
	ld	(XIZ+TASK_ARG),A
	jr	dyn_20D9FF

c_20D9FF	section	code abs=0x20D9FF

dyn_20D9FF:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DA04	section	code abs=0x20DA04

swp_20DA04:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	dyn_2167F9
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,(wStreetMenuChoice)
	cp	A,4
	jr	NZ,swp_20DA04.skip
	ld	XHL,swp_210443
	call	StartChildTask
	jr	swp_20DA04.skip5
swp_20DA04.skip:
	cp	A,2
	jr	NZ,swp_20DA04.skip2
	jr	swp_20DA04.skip5
swp_20DA04.skip2:
	cp	A,3
	jr	NZ,swp_20DA04.skip3
	ld	XHL,swp_214BEC
	call	StartChildTask
	jr	swp_20DA04.skip5
swp_20DA04.skip3:
	cp	A,0
	jr	NZ,swp_20DA04.skip4
	ld	XHL,dyn_214C0E
	call	StartChildTask
	jr	swp_20DA04.skip5
swp_20DA04.skip4:
	cp	A,1
	jr	NZ,swp_20DA04.skip5
	ld	XHL,swp_214C75
	call	StartChildTask
	jr	swp_20DA04.skip5
swp_20DA04.skip5:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DA5C	section	code abs=0x20DA5C

sub_20DA5C:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,sub_20DA5C.skip
	ld	A,1
	ld	(XIZ+TASK_ARG),A
sub_20DA5C.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DA71	section	code abs=0x20DA71

dyn_20DA71:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+TASK_ARG)
	cp	A,1
	jr	NZ,dyn_20DA86
	calr	StreetMenu
	ld	A,2
	ld	(XIZ+TASK_ARG),A
	jr	0x20DAB4

c_20DA86	section	code abs=0x20DA86

dyn_20DA86:
	cp	A,2
	jr	NZ,dyn_20DA91
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	jr	0x20DAB4

c_20DA91	section	code abs=0x20DA91

dyn_20DA91:
	cp	A,3
	jr	NZ,dyn_20DA9A
	calr	dyn_20D8FB
	jr	0x20DAB4

c_20DA9A	section	code abs=0x20DA9A

dyn_20DA9A:
	cp	A,4
	jr	NZ,dyn_20DA9A.skip
	call	EndTask
	jr	0x20DAB4
dyn_20DA9A.skip:
	cp	A,5
	jr	NZ,dyn_20DA9A.skip2
	calr	sub_20DA5C
	jr	0x20DAB4
dyn_20DA9A.skip2:
	jr	0x20DAB4

c_20DAAF	section	code abs=0x20DAAF

swp_20DAAF:
	ld	A,1
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_20DAB9	section	code abs=0x20DAB9

dyn_20DAB9:
	call	dyn_20DACC
	add	XHL,0xFA000
	push	XHL
	call	dyn_2077BE
	add	XHL,(XSP+)
	ret

c_214C53	section	code abs=0x214C53

dyn_214C53:
	call	dyn_206803
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,5
	ld	(XIZ+0x15),A
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	XWA,dyn_214C97
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_214C75	section	code abs=0x214C75

swp_214C75:
	call	dyn_206803
	ld	A,0
	ld	(wFadeLevel),A
	ld	A,5
	ld	(XIZ+TASK_ARG),A
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	A,6
	ld	(XIZ+0x15),A
	ld	XWA,dyn_214C97
	ld	(XIZ+TASK_FUNC),XWA
	ret

c_214C97	section	code abs=0x214C97

dyn_214C97:
	ld	A,(XIZ+TASK_ARG)
	cp	A,0xC
	jr	Z,TownPlaceTaskEnd
	cp	A,1
	jr	NZ,0x214CA8
	ld	A,2
	ld	(XIZ+TASK_ARG),A
	cp	A,2
	jr	NZ,dyn_214CB2
	call	OpenSquareMenu
	jr	dyn_214D22

c_214CB2	section	code abs=0x214CB2

dyn_214CB2:
	cp	A,3
	jr	NZ,dyn_214CBC
	call	sub_214E5D
	jr	dyn_214D22

c_214CBC	section	code abs=0x214CBC

dyn_214CBC:
	cp	A,4
	jr	NZ,dyn_214CC6
	call	sub_215054
	jr	dyn_214D22

c_214CC6	section	code abs=0x214CC6

dyn_214CC6:
	cp	A,5
	jr	NZ,dyn_214CD0
	call	dyn_215760
	jr	dyn_214D22

c_214CD0	section	code abs=0x214CD0

dyn_214CD0:
	cp	A,6
	jr	NZ,dyn_214CD0.skip
	call	dyn_215924
	jr	dyn_214D22
dyn_214CD0.skip:
	cp	A,7
	jr	NZ,dyn_214CD0.skip2
	call	sub_215EDC
	jr	dyn_214D22
dyn_214CD0.skip2:
	cp	A,8
	jr	NZ,dyn_214CD0.skip3
	call	sub_216208
	jr	dyn_214D22
dyn_214CD0.skip3:
	cp	A,9
	jr	NZ,dyn_214CD0.skip4
	call	sub_21634F
	jr	dyn_214D22
dyn_214CD0.skip4:
	cp	A,0xA
	jr	NZ,dyn_214CD0.skip5
	call	CollaTalkDispatch
	jr	dyn_214D22
dyn_214CD0.skip5:
	cp	A,0xB
	jr	NZ,TownPlaceTaskEnd
	call	TetisGift
	jr	dyn_214D22

c_214D64	section	code abs=0x214D64

sub_214D64:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,0
	ld	E,8
	ld	A,2
	call	sub_20768A
	ld	XHL,ReturnText
	ld	A,2
	call	DrawBoxString
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214D82	section	code abs=0x214D82

sub_214D82:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,1
	call	dyn_207611
	ld	A,1
	call	ClearTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214DCA	section	code abs=0x214DCA

; [code+play] D-town / Forest / Spring
SquarePlaceMenu:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	sub_216779
	ld	A,2
	ld	XHL,PubText2
	call	DrawBoxString
	ld	A,2
	ld	XHL,DTownText2
	call	DrawBoxString
	ld	A,2
	ld	XHL,ForestText2
	call	DrawBoxString
	ld	A,2
	ld	XHL,SpringText2
	call	DrawBoxString
	calr	sub_214D64
	calr	DrawTownPlace
	call	sub_2169E5
	ld	A,1
	call	ClearTextBox
	ld	XHL,WhereDoYouGoText2
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	(XIZ+0x2C),A
	ld	A,2
	ld	(XIZ+0xF),A
	ld	A,3
	ld	(XIZ+TASK_ARG),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214E33	section	code abs=0x214E33

; [code] town place task state 2 (dyn_214C97): dyn_2167CF, SquarePlaceMenu (D-town / Forest / Spring), +0x10 = 0, transition dyn_216EDE.., PlayMusic 1, SoundCommand 0x21
OpenSquareMenu:
	call	dyn_2167CF
	calr	SquarePlaceMenu
	ld	A,0
	ld	(XIZ+0x10),A
	call	dyn_2167E4
	call	dyn_216EDE
	call	dyn_216FB1
	call	dyn_216F6B
	ld	XWA,1
	call	PlayMusic
	ld	WA,0x21
	call	SoundCommand
	ret

c_214E5D	section	code abs=0x214E5D

sub_214E5D:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_214E5D.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	calr	sub_214F0F
	jrl	sub_214E5D.done
sub_214E5D.skip:
	bit	5,A
	jr	Z,sub_214E5D.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,8
	ld	(XIZ+0x10),A
	calr	sub_214F0F
	jrl	sub_214E5D.done
sub_214E5D.skip2:
	and	A,0xF
	jr	Z,sub_214E5D.skip9
	cp	A,1
	jr	NZ,sub_214E5D.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,sub_214E5D.skip3
	cp	A,8
	jr	Z,sub_214E5D.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	sub_214E5D.skip8
sub_214E5D.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	sub_214E5D.skip8
sub_214E5D.skip4:
	ld	A,3
	ld	(XIZ+0x10),A
	jr	sub_214E5D.skip8
sub_214E5D.skip5:
	cp	A,2
	jr	NZ,sub_214E5D.skip8
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,sub_214E5D.skip6
	cp	A,3
	jr	Z,sub_214E5D.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	sub_214E5D.skip8
sub_214E5D.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	sub_214E5D.skip8
sub_214E5D.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	sub_214E5D.skip8
sub_214E5D.skip8:
	jr	sub_214E5D.skip9
sub_214E5D.skip9:
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
sub_214E5D.done:
	ret

c_214F0F	section	code abs=0x214F0F

sub_214F0F:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	NZ,sub_214F0F.skip
	calr	sub_214D82
	ld	A,0
	ld	(XIZ+0x11),A
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jr	sub_214F0F.skip2
sub_214F0F.skip:
	add	A,1
	ld	(XIZ+0x15),A
	calr	sub_214D82
	calr	sub_215031
	jr	sub_214F0F.skip2
sub_214F0F.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215054	section	code abs=0x215054

sub_215054:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_215054.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	calr	sub_215115
	jrl	sub_215054.done
sub_215054.skip:
	bit	5,A
	jr	Z,sub_215054.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,8
	ld	(XIZ+0x10),A
	calr	sub_215115
	jrl	sub_215054.done
sub_215054.skip2:
	ld	W,(XIZ+0x1A)
	cp	W,0
	jr	Z,sub_215054.skip8
	and	A,0xF
	jr	Z,sub_215054.skip9
	cp	A,1
	jr	NZ,sub_215054.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,sub_215054.skip3
	cp	A,8
	jr	Z,sub_215054.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	sub_215054.skip8
sub_215054.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	sub_215054.skip8
sub_215054.skip4:
	ld	A,(XIZ+0x1A)
	dec	1,A
	ld	(XIZ+0x10),A
	jr	sub_215054.skip8
sub_215054.skip5:
	cp	A,2
	jr	NZ,sub_215054.skip8
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,sub_215054.skip6
	ld	W,(XIZ+0x1A)
	dec	1,W
	cp	A,W
	jr	Z,sub_215054.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	sub_215054.skip8
sub_215054.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	sub_215054.skip8
sub_215054.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	sub_215054.skip8
sub_215054.skip8:
	jr	sub_215054.skip9
sub_215054.skip9:
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
sub_215054.done:
	ret

c_215115	section	code abs=0x215115

sub_215115:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	NZ,sub_215115.skip
	calr	sub_214D82
	ld	A,(XIZ+0x15)
	sub	A,1
	ld	(XIZ+0x10),A
	ld	A,0
	ld	(XIZ+0x15),A
	calr	SquarePlaceMenu
	jr	sub_215115.skip2
sub_215115.skip:
	calr	sub_214D82
	call	sub_216779
	calr	dyn_215749
	ld	A,(XIZ+0x10)
	ld	(XIZ+0x1B),A
	extz	WA
	extz	XWA
	ld	XHL,XIZ
	add	XHL,0x1E
	add	XHL,XWA
	ld	A,(XHL)
	ld	(XIZ+0x12),A
	jr	sub_215115.skip2
sub_215115.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215161	section	code abs=0x215161

dyn_215161:
	push	WA
	ld	W,(XIZ+0x15)
	ld	A,(XIZ+0x12)
	calr	GetTalkRow
	pop	WA
	ret

c_21516D	section	code abs=0x21516D

dyn_21516D:
	push	XHL
	ld	XHL,0x9800
	call	dyn_216BEE
	pop	XHL
	ret

c_215179	section	code abs=0x215179

dyn_215179:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	dyn_21516D
	cp	HL,0
	jr	Z,0x2151B3
	cp	HL,0xFFFF
	jr	Z,dyn_215193
	ld	BC,0
	ld	DE,0
	add	E,0x20
	jr	dyn_2151AB

c_215193	section	code abs=0x215193

dyn_215193:
	ld	A,(wPlayerRace)
	dec	1,A
	xor	A,1
	extz	WA
	ld	HL,1
	add	HL,WA
	ld	BC,0
	ld	DE,0
	add	E,0x20
	jr	dyn_2151AB

c_2151AB	section	code abs=0x2151AB

dyn_2151AB:
	call	dyn_216849
	call	DrawPortraitAt
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2151B8	section	code abs=0x2151B8

dyn_2151B8:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	dyn_215161
	ld	A,(XHL+0)
	ld	W,(XIZ+0x13)
	cp	A,W
	jr	Z,0x2151D3
	ld	(XIZ+0x13),A
	ld	L,A
	exts	HL
	calr	dyn_215179
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2151D8	section	code abs=0x2151D8

; [code+play] talk to a town NPC (E = NPC; 8 Helmut -> HelmutSkillOffer); Colla, Cyrius, Lily screens
TownNpcTalk:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(XIZ+0x15)
	cp	A,5
	jrl	Z,0x215356
	cp	A,6
	jrl	Z,0x215356
	cp	A,7
	jrl	Z,0x215356
	cp	A,8
	jrl	Z,0x215356
	ld	D,W
	ld	W,A
	ld	A,D
	calr	GetTalkRow
	ld	A,(XHL+0)
	sub	A,0x15
	ld	E,A
	ld	HL,0x40
	ld	A,E
	extz	WA
	add	HL,WA
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownNpcTalk.skip
	ld	W,D
	jrl	0x215356
TownNpcTalk.skip:
	cp	E,2
	jr	Z,TownNpcTalk.skip2
	cp	E,8
	jr	Z,TownNpcTalk.skip6
	cp	E,0xC
	jr	Z,TownNpcTalk.skip7
	cp	E,0xD
	jrl	Z,TownNpcTalk.skip9
	jrl	TownNpcTalk.skip10
TownNpcTalk.skip2:
	ld	W,D
	cp	W,0x22
	jrl	C,0x215356
	cp	W,0x48
	jrl	NC,0x215356
	call	sub_216B19
	cp	A,0
	jrl	Z,TownNpcTalk.skip10
	ld	HL,EVENT_CYRIUS_TOLD_LORDS
	call	CheckEventFlag
	cp	L,0
	jr	Z,TownNpcTalk.skip3
	call	sub_216B19
	cp	A,4
	jr	Z,TownNpcTalk.skip4
	jrl	TownNpcTalk.skip10
TownNpcTalk.skip3:
	ld	W,0x12
	jrl	0x215356
TownNpcTalk.skip4:
	ld	HL,EVENT_CYRIUS_TRADED
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownNpcTalk.skip5
	ld	A,0
	ld	(XIZ+0x28),A
	ld	W,0x13
	jrl	0x215356
TownNpcTalk.skip5:
	ld	A,1
	ld	(XIZ+0x28),A
	ld	W,0x1B
	jrl	0x215356
TownNpcTalk.skip6:
	ld	A,(XIZ+0x15)
	cp	A,3
	jr	Z,TownNpcTalk.skip10
	ld	W,D
	cp	W,0x22
	jrl	C,0x215356
	calr	HelmutSkillOffer
	cp	A,0x14
	jr	Z,TownNpcTalk.skip10
	ld	(XIZ+0x29),A
	ld	W,4
	jrl	0x215356
TownNpcTalk.skip7:
	ld	W,D
	cp	W,0x1B
	jrl	NC,0x215356
	call	GetStageArenaRank
	cp	A,3
	jr	C,TownNpcTalk.skip10
	ld	HL,EVENT_COLLA_OFFERS_ENABLED
	call	CheckEventFlag
	cp	L,0
	jr	NZ,TownNpcTalk.skip8
	ld	W,0x1B
	jrl	0x215356
TownNpcTalk.skip8:
	push	W
	call	Random
	ld	W,0
	div	WA,0x64
	ld	A,W
	pop	W
	cp	A,0x3C
	jr	NC,TownNpcTalk.skip10
	ld	W,0x1C
	jr	0x215356
TownNpcTalk.skip9:
	ld	W,D
	cp	W,0x49
	jr	NC,0x215356
	jr	TownNpcTalk.skip10
TownNpcTalk.skip10:
	ld	D,0
	ld	HL,0x50
	ld	A,E
	extz	WA
	add	HL,WA
	call	CheckEventFlag
	cp	L,1
	jr	NZ,TownNpcTalk.skip11
	inc	1,D
TownNpcTalk.skip11:
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownNpcTalk.skip12
	ld	HL,EVENT_STAGE_WON_RANK_X
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownNpcTalk.skip12
	jr	TownNpcTalk.skip13
TownNpcTalk.skip12:
	inc	2,D
TownNpcTalk.skip13:
	cp	E,7
	jr	Z,TownNpcTalk.skip14
	cp	E,8
	jr	Z,TownNpcTalk.skip17
	jr	TownNpcTalk.skip18
TownNpcTalk.skip14:
	ld	A,(XIZ+0x15)
	cp	A,2
	jr	Z,TownNpcTalk.skip15
	cp	A,4
	jr	Z,TownNpcTalk.skip16
	jr	TownNpcTalk.skip18
TownNpcTalk.skip15:
	ld	E,0xE
	jr	TownNpcTalk.skip18
TownNpcTalk.skip16:
	ld	E,0xF
	jr	TownNpcTalk.skip18
TownNpcTalk.skip17:
	ld	A,(XIZ+0x15)
	cp	A,3
	jr	Z,TownNpcTalk.skip18
	ld	E,0x10
TownNpcTalk.skip18:
	ld	A,E
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,XWA
	ld	A,D
	extz	WA
	extz	XWA
	add	XHL,XWA
	ld	XWA,TalkNpcRows
	add	XHL,XWA
	ld	W,(XHL)
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21535A	section	code abs=0x21535A

dyn_21535A:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(XIZ+0x15)
	cp	A,5
	jr	Z,dyn_215379
	cp	A,6
	jrl	Z,loc_2154B2
	cp	A,7
	jrl	Z,dyn_2154EF
	cp	A,8
	jrl	Z,loc_2154F3
	ld	W,0xFF
	jrl	dyn_2154F7

c_215379	section	code abs=0x215379

dyn_215379:
	call	GetStoryStage
	cp	A,0xA
	jrl	Z,loc_21549F
	cp	A,8
	jr	Z,loc_215403
	cp	A,0
	jr	Z,dyn_215391
	ld	W,0xFF
	jrl	dyn_2154F7

c_215391	section	code abs=0x215391

dyn_215391:
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_2153FE
	ld	HL,EVENT_TALKED_JON
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	HL,EVENT_TALKED_LILY
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	HL,EVENT_TALKED_SHOP
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	HL,EVENT_TALKED_WYSE
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	HL,EVENT_TALKED_CEUS
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	HL,EVENT_TALKED_HELMUT
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	HL,EVENT_TALKED_CAMIL
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	HL,EVENT_TALKED_MEESE
	call	CheckEventFlag
	cp	L,0
	jr	Z,dyn_2153F9
	ld	W,2
	jrl	dyn_2154F7

c_2153F9	section	code abs=0x2153F9

dyn_2153F9:
	ld	W,1
	jrl	dyn_2154F7

c_2153FE	section	code abs=0x2153FE

loc_2153FE:
	ld	W,0
	jrl	dyn_2154F7

c_215403	section	code abs=0x215403

loc_215403:
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,0
	jrl	Z,loc_215403.skip2
	ld	HL,EVENT_TALKED_JON
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_CYRIUS
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_SHOP
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_WYSE
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_ZIGGY
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_CEUS
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_HELMUT
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_ALDA
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_CAMIL
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_MEESE
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_COLLA
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	HL,EVENT_TALKED_TETIS
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_215403.skip
	ld	W,5
	jr	dyn_2154F7
loc_215403.skip:
	ld	W,4
	jr	dyn_2154F7
loc_215403.skip2:
	ld	W,3
	jr	dyn_2154F7

c_21549F	section	code abs=0x21549F

loc_21549F:
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,0
	jr	Z,loc_21549F.skip
	ld	W,0xFF
	jr	dyn_2154F7
loc_21549F.skip:
	ld	W,0xE
	jr	dyn_2154F7

c_2154B2	section	code abs=0x2154B2

loc_2154B2:
	ld	HL,EVENT_TALKED_SHOP
	call	CheckEventFlag
	cp	L,1
	jr	Z,loc_2154B2.skip3
	call	GetStoryStage
	cp	A,8
	jr	Z,loc_2154B2.skip2
	cp	A,0
	jr	Z,loc_2154B2.skip
	ld	W,0xFF
	jr	dyn_2154F7
loc_2154B2.skip:
	ld	W,0
	jr	dyn_2154F7
loc_2154B2.skip2:
	ld	W,4
	jr	dyn_2154F7
loc_2154B2.skip3:
	call	GetStoryStage
	cp	A,8
	jr	Z,loc_2154B2.skip5
	cp	A,0
	jr	Z,loc_2154B2.skip4
	ld	W,0xFF
	jr	dyn_2154F7
loc_2154B2.skip4:
	ld	W,3
	jr	dyn_2154F7
loc_2154B2.skip5:
	ld	W,7
	jr	dyn_2154F7

c_2154EF	section	code abs=0x2154EF

dyn_2154EF:
	ld	W,0
	jr	dyn_2154F7

c_2154F3	section	code abs=0x2154F3

loc_2154F3:
	ld	W,0
	jr	dyn_2154F7

c_2154F7	section	code abs=0x2154F7

dyn_2154F7:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2154FB	section	code abs=0x2154FB

; [code] town talk row done: SetEventFlag(row +2), then per flag: 1 = Unitron fitted (3 FixIt1, 3 Tool1, 3 Steel, 500 GP), 9, 0x4D (Tetis), 0x4A (Camil: StageStatBonus); was LilyGivesFlowers (a [play] screen name, too narrow)
NpcTalkRowAction:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	dyn_215161
	ld	A,(XHL+2)
	cp	A,0
	jrl	Z,dyn_215609
	ld	L,A
	extz	HL
	push	A
	call	SetEventFlag
	pop	A
	cp	A,1
	jr	Z,NpcTalkRowAction.skip
	cp	A,9
	jr	Z,NpcTalkRowAction.skip2
	cp	A,0x4D
	jr	Z,NpcTalkRowAction.skip3
	cp	A,0x4A
	jrl	Z,NpcTalkRowAction.skip4
	jrl	dyn_215609
NpcTalkRowAction.skip:
	ld	HL,EVENT_STAGE_TOWN
	call	ClearEventFlag
	call	ClearTalkedFlags
	ld	A,1
	ld	(wArenaRank),A
	ld	WA,ITEM_FIXIT1
	call	AddItem
	ld	WA,ITEM_FIXIT1
	call	AddItem
	ld	WA,ITEM_FIXIT1
	call	AddItem
	ld	WA,ITEM_TOOL1
	call	AddItem
	ld	WA,ITEM_TOOL1
	call	AddItem
	ld	WA,ITEM_TOOL1
	call	AddItem
	ld	WA,ITEM_STEEL
	call	AddItem
	ld	WA,ITEM_STEEL
	call	AddItem
	ld	WA,ITEM_STEEL
	call	AddItem
	ld	WA,0x1F4
	call	AddGP
	jrl	dyn_215609
NpcTalkRowAction.skip2:
	ld	HL,EVENT_STAGE_WON_RANK_CS
	call	ClearEventFlag
	call	ClearTalkedFlags
	jr	dyn_215609
NpcTalkRowAction.skip3:
	call	GetStoryStage
	cp	A,2
	jr	C,dyn_215609
	cp	A,9
	jr	NC,dyn_215609
	push	WA
	ld	WA,0xFF
	call	AddItem
	pop	WA
	jr	dyn_215609
NpcTalkRowAction.skip4:
	call	GetStoryStage
	cp	A,1
	jr	C,dyn_215609
	cp	A,9
	jr	NC,dyn_215609
	sub	A,1
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,StageStatBonus
	add	XHL,XWA
	ld	A,(XHL)
	extz	WA
	ld	BC,(wPilotAP)
	add	WA,BC
	ld	(wPilotAP),WA
	inc	1,XHL
	ld	A,(XHL)
	extz	WA
	ld	BC,(wPilotSP)
	add	WA,BC
	ld	(wPilotSP),WA
	inc	1,XHL
	ld	A,(XHL)
	extz	WA
	ld	BC,(wPilotRP)
	add	WA,BC
	ld	(wPilotRP),WA
	inc	1,XHL
	ld	A,(XHL)
	extz	WA
	ld	BC,(wPilotMP)
	add	WA,BC
	ld	(wPilotMP),WA
	inc	1,XHL
	jr	dyn_215609

c_215609	section	code abs=0x215609

dyn_215609:
	calr	dyn_215161
	ld	A,(XHL+3)
	cp	A,0xFF
	jrl	Z,loc_21572F
	cp	A,0xFD
	jrl	Z,dyn_215721
	cp	A,0xFB
	jrl	Z,dyn_215721
	cp	A,0xF9
	jrl	Z,dyn_215721
	cp	A,0xF8
	jrl	Z,dyn_215721
	cp	A,0xF5
	jr	Z,dyn_215609.skip
	cp	A,0xF4
	jr	Z,dyn_215609.skip2
	cp	A,0xF3
	jr	Z,dyn_215609.skip3
	cp	A,0xF2
	jr	Z,dyn_215609.skip4
	cp	A,0xF0
	jr	Z,dyn_21569B
	cp	A,0xEF
	jr	Z,loc_2156A8
	cp	A,0xEE
	jr	Z,loc_2156B5
	cp	A,0xED
	jr	Z,loc_2156C1
	cp	A,0xEC
	jr	Z,loc_2156C6
	cp	A,0xEB
	jr	Z,loc_2156CD
	cp	A,0xEA
	jr	Z,loc_2156D2
	cp	A,0xE9
	jr	Z,loc_2156D9
	cp	A,0xE8
	jrl	Z,loc_2156F5
	cp	A,0xE7
	jrl	Z,loc_215704
	cp	A,0xE6
	jrl	Z,loc_21571A
	ld	(XIZ+0x12),A
	jrl	0x215739
dyn_215609.skip:
	ld	A,0
	ld	(XIZ+0x27),A
dyn_215609.skip2:
	ld	A,7
	ld	(XIZ+TASK_ARG),A
	jrl	0x215739
dyn_215609.skip3:
	ld	A,0
	ld	(XIZ+0x27),A
dyn_215609.skip4:
	ld	A,8
	ld	(XIZ+TASK_ARG),A
	jrl	0x215739

c_21569B	section	code abs=0x21569B

dyn_21569B:
	ld	A,0xF0
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jrl	0x215739

c_2156A8	section	code abs=0x2156A8

loc_2156A8:
	ld	A,0xEF
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jrl	0x215739

c_2156B5	section	code abs=0x2156B5

loc_2156B5:
	ld	A,0xEE
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jr	0x215739

c_2156C1	section	code abs=0x2156C1

loc_2156C1:
	ld	A,0
	ld	(XIZ+0x27),A

c_2156C6	section	code abs=0x2156C6

loc_2156C6:
	ld	A,9
	ld	(XIZ+TASK_ARG),A
	jr	0x215739

c_2156CD	section	code abs=0x2156CD

loc_2156CD:
	ld	A,1
	ld	(XIZ+0x27),A

c_2156D2	section	code abs=0x2156D2

loc_2156D2:
	ld	A,0xA
	ld	(XIZ+TASK_ARG),A
	jr	0x215739

c_2156D9	section	code abs=0x2156D9

loc_2156D9:
	push	W
	ld	WA,0xFF
	call	0x2061D6
	pop	W
	sub	A,2
	jr	C,loc_21572F
	cp	A,5
	jr	NC,loc_21572F
	add	A,0x4E
	ld	(XIZ+0x12),A
	jr	0x215739

c_2156F5	section	code abs=0x2156F5

loc_2156F5:
	call	GetStoryStage
	sub	A,3
	add	A,0x49
	ld	(XIZ+0x12),A
	jr	0x215739

c_215704	section	code abs=0x215704

loc_215704:
	push	W
	ld	WA,0xFF
	call	0x2061D6
	pop	W
	cp	A,0
	jr	Z,loc_21572F
	ld	A,0x53
	ld	(XIZ+0x12),A
	jr	0x215739

c_21571A	section	code abs=0x21571A

loc_21571A:
	ld	A,0xB
	ld	(XIZ+TASK_ARG),A
	jr	0x215739

c_215721	section	code abs=0x215721

dyn_215721:
	ld	W,0xFD
	sub	W,A
	ld	(XIZ+0x11),W
	ld	A,4
	ld	(XIZ+0xF),A
	jr	0x215739

c_21572F	section	code abs=0x21572F

loc_21572F:
	ld	A,4
	ld	(XIZ+0xF),A
	ld	A,0xFF
	ld	(XIZ+0x11),A
	calr	dyn_215741
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215741	section	code abs=0x215741

dyn_215741:
	push	A
	ld	A,0
	ld	(XIZ+0x25),A
	pop	A
	ret

c_215749	section	code abs=0x215749

dyn_215749:
	push	A
	ld	A,0xFF
	ld	(XIZ+0x12),A
	ld	A,0
	ld	(XIZ+0x25),A
	ld	A,2
	ld	(XIZ+0xF),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	pop	A
	ret

c_215760	section	code abs=0x215760

dyn_215760:
	calr	dyn_21535A
	cp	W,0xFF
	jr	NZ,dyn_21578A
	ld	A,(XIZ+0x15)
	cp	A,5
	jr	Z,dyn_215760.skip
	cp	A,6
	jr	Z,dyn_215760.skip2
	ld	A,0
	jr	dyn_215760.skip3
dyn_215760.skip:
	ld	A,1
	jr	dyn_215760.skip3
dyn_215760.skip2:
	ld	A,3
	jr	dyn_215760.skip3
dyn_215760.skip3:
	ld	(XIZ+0x11),A
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jrl	0x215821

c_21578A	section	code abs=0x21578A

dyn_21578A:
	calr	dyn_215749
	ld	(XIZ+0x12),W
	call	dyn_2167CF
	ld	A,(XIZ+0x15)
	cp	A,7
	jr	Z,dyn_2157E3
	cp	A,8
	jr	Z,dyn_2157E3
	calr	DrawTownPlace
	call	dyn_2167E4
	ld	A,0
	ld	(XIZ+0x13),A
	call	dyn_216EDE
	call	dyn_216FB1
	call	dyn_216F6B
	ld	A,(XIZ+0x15)
	cp	A,5
	jr	Z,dyn_2157D2
	cp	A,6
	jr	NZ,dyn_2157E1
	ld	XWA,3
	call	PlayMusic
	ld	WA,0x23
	call	SoundCommand
	jr	dyn_2157E1

c_215822	section	code abs=0x215822

dyn_215822:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,0x215847
	ld	B,(XIZ+0x24)
	dec	1,B
	ld	(XIZ+0x24),B
	jrl	NZ,0x21591F
	ld	A,1
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
	ld	A,1
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,dyn_2158BD
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	jr	NZ,0x215867
	ld	A,1
	ld	(XIZ+0x26),A
	ld	A,(wJoyPressed)
	cp	A,B_BUTTON
	jr	NZ,dyn_21588D
	ld	A,(XIZ+0x15)
	cp	A,7
	jr	NZ,dyn_21588D
	ld	A,1
	call	dyn_207611
	calr	dyn_215741
	ld	A,0xEF
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jrl	0x21591F

c_21588D	section	code abs=0x21588D

dyn_21588D:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jrl	Z,0x21591F
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,dyn_2158A5
	ld	A,0
	ld	(XIZ+0x26),A
	jr	0x21591F

c_2158A5	section	code abs=0x2158A5

dyn_2158A5:
	ld	A,1
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	inc	1,C
	ld	(XIZ+0x24),C
	ld	C,0
	ld	(XWA+0x10),C
	jr	0x21591F

c_2158BD	section	code abs=0x2158BD

dyn_2158BD:
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,dyn_2158CE
	ld	A,1
	ld	(XIZ+0x25),A
	calr	NpcTalkRowAction
	jr	0x21591F

c_2158CE	section	code abs=0x2158CE

dyn_2158CE:
	ld	W,(XIZ+0x12)
	cp	W,0xFF
	jr	NZ,0x2158DC
	calr	dyn_21535A
	ld	(XIZ+0x12),W
	ld	W,(XIZ+0x12)
	calr	TownNpcTalk
	ld	(XIZ+0x12),W
	calr	dyn_2151B8
	calr	dyn_215161
	ld	XHL,(XHL+4)
	cp	XHL,0x58
	jr	NC,0x21590C
	call	IsPlayerMale
	extz	WA
	extz	XWA
	sll	2,XWA
	add	XHL,XWA
	ld	XWA,TalkGenderTexts
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,2
	ld	(XIZ+0x25),A
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215924	section	code abs=0x215924

dyn_215924:
	ld	A,(XIZ+0xF)
	cp	A,1
	jr	NZ,dyn_215933
	ld	A,2
	ld	(XIZ+0xF),A
	jrl	0x215AE8

c_215933	section	code abs=0x215933

dyn_215933:
	cp	A,2
	jr	NZ,0x21593C
	ld	A,3
	ld	(XIZ+0xF),A
	cp	A,3
	jr	NZ,dyn_215946
	calr	dyn_215822
	jrl	0x215AE8

c_215946	section	code abs=0x215946

dyn_215946:
	cp	A,4
	jr	NZ,dyn_215980
	calr	dyn_21516D
	ld	A,(XIZ+0x11)
	cp	A,0
	jr	Z,dyn_215974
	cp	A,1
	jr	Z,dyn_215974
	cp	A,2
	jr	Z,dyn_215974
	cp	A,3
	jr	Z,dyn_215974
	cp	A,4
	jr	Z,dyn_215974
	cp	A,5
	jr	Z,dyn_215974
	calr	ShowTalkMenu
	ld	A,(XIZ+0x1B)
	ld	(XIZ+0x10),A
	jrl	0x215AE8

c_215974	section	code abs=0x215974

dyn_215974:
	call	dyn_2167F9
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jrl	0x215AE8

c_215980	section	code abs=0x215980

dyn_215980:
	cp	A,5
	jr	NZ,dyn_21598C
	ld	A,6
	ld	(XIZ+0xF),A
	jrl	0x215AE8

c_21598C	section	code abs=0x21598C

dyn_21598C:
	cp	A,6
	jr	NZ,dyn_215998
	ld	A,3
	ld	(XIZ+0xF),A
	jrl	0x215AE8

c_215998	section	code abs=0x215998

dyn_215998:
	cp	A,7
	jr	NZ,dyn_2159AF
	ld	A,2
	call	dyn_216E43
	cp	A,1
	jrl	Z,0x215AE8
	ld	A,3
	ld	(XIZ+0xF),A
	jrl	0x215AE8

c_2159AF	section	code abs=0x2159AF

dyn_2159AF:
	cp	A,8
	jrl	NZ,dyn_215AA1
	ld	A,2
	call	dyn_216E67
	cp	A,1
	jrl	Z,0x215AE8
	ld	A,(XIZ+0x11)
	cp	A,0xF0
	jr	Z,dyn_2159DB
	cp	A,0xEF
	jr	Z,dyn_215A26
	cp	A,0xEE
	jrl	Z,loc_215A64
	ld	A,3
	ld	(XIZ+0xF),A
	jrl	0x215AE8

c_2159DB	section	code abs=0x2159DB

dyn_2159DB:
	ld	A,1
	ld	(XIZ+0x12),A
	call	dyn_206803
	call	ClearTextBox1
	ld	W,(XIZ+0x15)
	ld	A,(XIZ+0x12)
	calr	GetTalkRow
	ld	L,(XHL+1)
	extz	HL
	call	dyn_216845
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	calr	dyn_215161
	ld	A,(XHL+0)
	ld	(XIZ+0x13),A
	ld	L,A
	exts	HL
	ld	BC,4
	ld	DE,0
	add	E,0x20
	call	dyn_216849
	call	DrawPortraitAt
	ld	A,7
	ld	(XIZ+0xF),A
	jrl	0x215AE8

c_215A26	section	code abs=0x215A26

dyn_215A26:
	call	dyn_206803
	call	ClearTextBox1
	call	dyn_216757
	call	dyn_21679E
	ld	A,5
	ld	(XIZ+0x15),A
	ld	A,0
	ld	(XIZ+0x12),A
	calr	DrawTownPlace
	calr	dyn_2151B8
	call	dyn_21712F
	call	dyn_216F8E
	call	dyn_216FB1
	call	dyn_216E31
	ld	XWA,2
	call	PlayMusic
	ld	A,9
	ld	(XIZ+0xF),A
	jrl	0x215AE8

c_215A64	section	code abs=0x215A64

loc_215A64:
	call	dyn_206803
	call	ClearTextBox1
	call	dyn_216757
	call	dyn_21679E
	ld	A,5
	ld	(XIZ+0x15),A
	ld	A,0xE
	ld	(XIZ+0x12),A
	calr	DrawTownPlace
	calr	dyn_2151B8
	call	sub_2170E4
	call	dyn_216F8E
	call	dyn_216FB1
	call	dyn_216E31
	ld	XWA,2
	call	PlayMusic
	ld	A,0xA
	ld	(XIZ+0xF),A
	jr	0x215AE8

c_215AA1	section	code abs=0x215AA1

dyn_215AA1:
	cp	A,9
	jr	NZ,dyn_215AA1.skip
	call	dyn_216FC3
	cp	A,1
	jr	Z,0x215AE8
	ld	XWA,2
	call	PlayMusic
	ld	WA,0x22
	call	SoundCommand
	ld	A,3
	ld	(XIZ+0xF),A
	jr	0x215AE8
dyn_215AA1.skip:
	cp	A,0xA
	jr	NZ,dyn_215AA1.skip2
	call	dyn_216FC3
	cp	A,1
	jr	Z,0x215AE8
	ld	XWA,2
	call	PlayMusic
	ld	WA,0x22
	call	SoundCommand
	ld	A,3
	ld	(XIZ+0xF),A
	jr	0x215AE8
dyn_215AA1.skip2:
	ld	A,1
	ld	(XIZ+0xF),A
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ret

c_215AF1	section	code abs=0x215AF1

sub_215AF1:
	ld	C,0
	ld	E,2
	ld	A,1
	call	sub_20768A
	ld	A,1
	ld	XHL,YesNoText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,1
	ld	(XIZ+0x27),A
	ret

c_215B16	section	code abs=0x215B16

; [code+play] Cyrius state 1: L/R between 2 options, A/B set the next talk row
CyriusTradeYesNo:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CyriusTradeYesNo.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	CyriusTradeYesNo.skip7
CyriusTradeYesNo.skip:
	bit	5,A
	jr	Z,CyriusTradeYesNo.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	jr	CyriusTradeYesNo.skip7
CyriusTradeYesNo.skip2:
	and	A,0xF
	jr	Z,CyriusTradeYesNo.skip6
	cp	A,4
	jr	NZ,CyriusTradeYesNo.skip4
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip3:
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip4:
	cp	A,8
	jr	NZ,CyriusTradeYesNo.skip6
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,CyriusTradeYesNo.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip5:
	jr	CyriusTradeYesNo.skip6
CyriusTradeYesNo.skip6:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x30
	add	WA,0x20
	ld	BC,WA
	ld	DE,0x84
	call	DrawMenuCursor
	jr	CyriusTradeYesNo.done
CyriusTradeYesNo.skip7:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip9
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip8
	ld	A,0x1C
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip8:
	ld	A,0x14
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip9:
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeYesNo.skip10
	ld	A,0x1D
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip10:
	ld	A,0x15
	jr	CyriusTradeYesNo.skip11
CyriusTradeYesNo.skip11:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+0x27),A
CyriusTradeYesNo.done:
	ret

c_215C14	section	code abs=0x215C14

sub_215C14:
	push	XWA
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	extz	WA
	extz	XWA
	mul	XWA,6
	sll	1,WA
	ld	XHL,CyriusTradeMenu
	add	XHL,XWA
	pop	XWA
	ld	C,6
	ld	E,0
sub_215C14.loop:
	push	C
	push	E
	push	XHL
	ld	C,0
	ld	A,2
	call	sub_20768A
	pop	XHL
	push	XHL
	ld	WA,(XHL)
	call	GetItemOrPartName
	ld	A,2
	call	DrawBoxString
	pop	XHL
	pop	E
	pop	C
	inc	1,E
	inc	2,XHL
	djnz	C,sub_215C14.loop
	ld	C,0
	ld	E,8
	ld	A,2
	call	sub_20768A
	ld	XHL,QuitText4
	ld	A,2
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	call	ClearTextBox1
	calr	DrawCyriusTradeDesc
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,3
	ld	(XIZ+0x27),A
	ret

c_215C88	section	code abs=0x215C88

; [code+play] cursor over the 6 CyriusTradeMenu entries + cancel, names via GetItemOrPartName
CyriusTradeMenuInput:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CyriusTradeMenuInput.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jrl	CyriusTradeMenuInput.skip11
CyriusTradeMenuInput.skip:
	bit	5,A
	jr	Z,CyriusTradeMenuInput.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,8
	ld	(XIZ+0x10),A
	jrl	CyriusTradeMenuInput.skip11
CyriusTradeMenuInput.skip2:
	and	A,0xF
	jr	Z,CyriusTradeMenuInput.skip8
	cp	A,1
	jr	NZ,CyriusTradeMenuInput.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTradeMenuInput.skip3
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip4
	dec	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip3:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip4:
	ld	A,5
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip5:
	cp	A,2
	jr	NZ,CyriusTradeMenuInput.skip8
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip6
	cp	A,5
	jr	Z,CyriusTradeMenuInput.skip7
	inc	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip6:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip7:
	ld	A,8
	ld	(XIZ+0x10),A
	jr	CyriusTradeMenuInput.skip9
CyriusTradeMenuInput.skip8:
	jr	CyriusTradeMenuInput.skip10
CyriusTradeMenuInput.skip9:
	calr	sub_214D82
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip10
	calr	DrawCyriusTradeDesc
CyriusTradeMenuInput.skip10:
	ld	BC,0x60
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	jrl	CyriusTradeMenuInput.done
CyriusTradeMenuInput.skip11:
	call	sub_216779
	calr	sub_214D82
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,CyriusTradeMenuInput.skip13
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	sub_20768A
	push	XHL
	push	XWA
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	extz	WA
	extz	XWA
	mul	XWA,6
	sll	1,WA
	ld	XHL,CyriusTradeMenu
	add	XHL,XWA
	pop	XWA
	ld	A,(XIZ+0x10)
	extz	WA
	extz	XWA
	sll	1,XWA
	add	XHL,XWA
	ld	WA,(XHL)
	pop	XHL
	ld	(XIZ+0x2A),WA
	call	GetItemOrPartName
	ld	A,2
	call	DrawBoxString
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeMenuInput.skip12
	ld	A,0x1F
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip12:
	ld	A,0x18
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip13:
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	sub_20768A
	ld	XHL,QuitText4
	ld	A,2
	call	DrawBoxString
	ld	WA,0
	ld	(XIZ+0x2A),WA
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTradeMenuInput.skip14
	ld	A,0x1E
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip14:
	ld	A,0x17
	jr	CyriusTradeMenuInput.skip15
CyriusTradeMenuInput.skip15:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+0x27),A
CyriusTradeMenuInput.done:
	ret

c_215DD9	section	code abs=0x215DD9

sub_215DD9:
	ld	C,0
	ld	E,2
	ld	A,1
	call	sub_20768A
	ld	A,1
	ld	XHL,YesNoText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,5
	ld	(XIZ+0x27),A
	ret

c_215DFE	section	code abs=0x215DFE

; [code+play] Cyrius's Emblem trade (dtown_cyrius_trade_* screens), GetStoryStage
CyriusTrade:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,CyriusTrade.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	CyriusTrade.skip7
CyriusTrade.skip:
	bit	5,A
	jr	Z,CyriusTrade.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	jr	CyriusTrade.skip7
CyriusTrade.skip2:
	and	A,0xF
	jr	Z,CyriusTrade.skip6
	cp	A,4
	jr	NZ,CyriusTrade.skip4
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTrade.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTrade.skip6
CyriusTrade.skip3:
	jr	CyriusTrade.skip6
CyriusTrade.skip4:
	cp	A,8
	jr	NZ,CyriusTrade.skip6
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,CyriusTrade.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	CyriusTrade.skip6
CyriusTrade.skip5:
	jr	CyriusTrade.skip6
CyriusTrade.skip6:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x30
	add	WA,0x20
	ld	BC,WA
	ld	DE,0x84
	call	DrawMenuCursor
	jr	CyriusTrade.done
CyriusTrade.skip7:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,CyriusTrade.skip9
	ld	A,2
	ld	(XIZ+0x27),A
	call	sub_216779
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTrade.skip8
	ld	A,0x20
	jr	CyriusTrade.skip13
CyriusTrade.skip8:
	ld	A,0x19
	jr	CyriusTrade.skip13
CyriusTrade.skip9:
	ld	WA,(XIZ+0x2A)
	call	AddItem
	jr	NC,CyriusTrade.skip10
	ld	A,2
	ld	(XIZ+0x27),A
	ld	A,0x48
	jr	CyriusTrade.skip13
CyriusTrade.skip10:
	call	ClearEmblemFlags
	call	GetStoryStage
	cp	A,0xA
	jr	C,CyriusTrade.skip11
	call	sub_216B51
CyriusTrade.skip11:
	ld	A,(XIZ+0x28)
	cp	A,0
	jr	Z,CyriusTrade.skip12
	ld	A,0x21
	jr	CyriusTrade.skip13
CyriusTrade.skip12:
	ld	A,0x1A
	jr	CyriusTrade.skip13
CyriusTrade.skip13:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
CyriusTrade.done:
	ret

c_215EDC	section	code abs=0x215EDC

sub_215EDC:
	ld	A,(XIZ+0x27)
	cp	A,0
	jr	NZ,sub_215EDC.skip
	calr	sub_215AF1
	jr	sub_215EDC.skip6
sub_215EDC.skip:
	cp	A,1
	jr	NZ,sub_215EDC.skip2
	calr	CyriusTradeYesNo
	jr	sub_215EDC.skip6
sub_215EDC.skip2:
	cp	A,2
	jr	NZ,sub_215EDC.skip3
	calr	sub_215C14
	jr	sub_215EDC.skip6
sub_215EDC.skip3:
	cp	A,3
	jr	NZ,sub_215EDC.skip4
	calr	CyriusTradeMenuInput
	jr	sub_215EDC.skip6
sub_215EDC.skip4:
	cp	A,4
	jr	NZ,sub_215EDC.skip5
	calr	sub_215DD9
	jr	sub_215EDC.skip6
sub_215EDC.skip5:
	cp	A,5
	jr	NZ,sub_215EDC.skip6
	calr	CyriusTrade
	jr	sub_215EDC.skip6
sub_215EDC.skip6:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ret

c_215F1E	section	code abs=0x215F1E

; [code+play] A = first skill of the pair Helmut offers (4r / 4r+2), 0x14 all learned, FF none yet (level < 20 / 30)
HelmutSkillOffer:
	push	XHL
	push	XDE
	push	XBC
	push	W
	call	CheckSkillPair1
	ld	W,A
	call	CheckSkillPair2
	and	A,W
	cp	A,1
	jr	Z,HelmutSkillOffer.skip
	ld	A,(wPlayerLevel)
	cp	A,0x14
	jr	C,HelmutSkillOffer.skip4
	call	CheckSkillPair1
	cp	A,0
	jr	Z,HelmutSkillOffer.skip3
	ld	A,(wPlayerLevel)
	cp	A,0x1E
	jr	C,HelmutSkillOffer.skip4
	call	CheckSkillPair2
	cp	A,0
	jr	Z,HelmutSkillOffer.skip2
HelmutSkillOffer.skip:
	ld	A,0x14
	jr	HelmutSkillOffer.skip5
HelmutSkillOffer.skip2:
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	extz	WA
	mul	WA,4
	add	A,2
	jr	HelmutSkillOffer.skip5
HelmutSkillOffer.skip3:
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	extz	WA
	mul	WA,4
	jr	HelmutSkillOffer.skip5
HelmutSkillOffer.skip4:
	ld	A,0xFF
HelmutSkillOffer.skip5:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215F84	section	code abs=0x215F84

sub_215F84:
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,1
	ld	(XIZ+0x27),A
	ret

c_215F8F	section	code abs=0x215F8F

sub_215F8F:
	ld	A,(XIZ+0x2D)
	cp	A,0x5A
	jr	C,sub_215F8F.done
	ld	A,(XIZ+0x29)
	cp	A,0xFF
	jr	Z,sub_215F8F.skip
	ld	A,7
	jr	sub_215F8F.skip2
sub_215F8F.skip:
	ld	A,6
sub_215F8F.skip2:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+0x27),A
sub_215F8F.done:
	ret

c_215FB3	section	code abs=0x215FB3

sub_215FB3:
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,7
	ld	XHL,NovaText
	add	XHL,XWA
	pop	XWA
	ret

c_215FC5	section	code abs=0x215FC5

sub_215FC5:
	push	XWA
	add	A,8
	ld	W,(XIZ+0x15)
	calr	GetTalkRow
	ld	XHL,(XHL+4)
	pop	XWA
	ret

c_215FD4	section	code abs=0x215FD4

sub_215FD4:
	push	XHL
	push	XWA
	ld	A,(XIZ+0x29)
	ld	W,(XIZ+0x10)
	add	A,W
	calr	sub_215FC5
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XHL
	ret

c_215FEA	section	code abs=0x215FEA

sub_215FEA:
	ld	A,(XIZ+0x29)
	ld	C,2
	ld	E,0
sub_215FEA.loop:
	push	C
	push	E
	push	A
	ld	C,0
	ld	A,2
	call	sub_20768A
	pop	A
	push	A
	calr	sub_215FB3
	ld	A,2
	call	DrawBoxString
	pop	A
	pop	E
	pop	C
	inc	1,E
	inc	1,A
	djnz	C,sub_215FEA.loop
	ld	A,0
	ld	(XIZ+0x10),A
	call	ClearTextBox1
	calr	sub_215FD4
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,3
	ld	(XIZ+0x27),A
	ret

c_21602C	section	code abs=0x21602C

; [code+play] Helmut state 3: U/D between the 2 skills with descriptions, A prints the choice
HelmutPickSkill:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,HelmutPickSkill.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	HelmutPickSkill.skip8
HelmutPickSkill.skip:
	and	A,0xF
	jr	Z,HelmutPickSkill.skip5
	cp	A,1
	jr	NZ,HelmutPickSkill.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,HelmutPickSkill.skip2
	dec	1,A
	ld	(XIZ+0x10),A
	jr	HelmutPickSkill.skip6
HelmutPickSkill.skip2:
	ld	A,1
	ld	(XIZ+0x10),A
	jr	HelmutPickSkill.skip6
HelmutPickSkill.skip3:
	cp	A,2
	jr	NZ,HelmutPickSkill.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,HelmutPickSkill.skip4
	inc	1,A
	ld	(XIZ+0x10),A
	jr	HelmutPickSkill.skip6
HelmutPickSkill.skip4:
	ld	A,0
	ld	(XIZ+0x10),A
	jr	HelmutPickSkill.skip6
HelmutPickSkill.skip5:
	jr	HelmutPickSkill.skip7
HelmutPickSkill.skip6:
	calr	sub_214D82
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,HelmutPickSkill.skip7
	calr	sub_215FD4
HelmutPickSkill.skip7:
	ld	BC,0x60
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,8
	add	WA,4
	ld	DE,WA
	call	DrawMenuCursor
	jr	HelmutPickSkill.done
HelmutPickSkill.skip8:
	call	sub_216779
	calr	sub_214D82
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,HelmutPickSkill.skip9
	ld	(XIZ+0x2A),A
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	sub_20768A
	ld	A,(XIZ+0x29)
	ld	W,(XIZ+0x2A)
	add	A,W
	calr	sub_215FB3
	ld	A,2
	call	DrawBoxString
	ld	A,0x1C
	jr	HelmutPickSkill.skip10
HelmutPickSkill.skip9:
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	sub_20768A
	ld	XHL,QuitText4
	ld	A,2
	call	DrawBoxString
	ld	WA,0
	ld	(XIZ+0x2A),WA
	ld	A,0x20
	jr	HelmutPickSkill.skip10
HelmutPickSkill.skip10:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+0x27),A
HelmutPickSkill.done:
	ret

c_216111	section	code abs=0x216111

sub_216111:
	ld	C,0
	ld	E,2
	ld	A,1
	call	sub_20768A
	ld	A,1
	ld	XHL,YesNoText
	call	DrawBoxString
	ld	A,0
	ld	(XIZ+0x10),A
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,5
	ld	(XIZ+0x27),A
	ret

c_216136	section	code abs=0x216136

; [code+play] Helmut's "Are you sure?" after picking a skill: CheckSkillPair1, sets the learned flag (helmut_skill_*_are_you_sure only)
HelmutSkillChoice:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,HelmutSkillChoice.skip
	push	WA
	ld	WA,0x81
	call	SoundCommand
	pop	WA
	jr	HelmutSkillChoice.skip7
HelmutSkillChoice.skip:
	bit	5,A
	jr	Z,HelmutSkillChoice.skip2
	push	WA
	ld	WA,0x82
	call	SoundCommand
	pop	WA
	ld	A,1
	ld	(XIZ+0x10),A
	jr	HelmutSkillChoice.skip7
HelmutSkillChoice.skip2:
	and	A,0xF
	jr	Z,HelmutSkillChoice.skip6
	cp	A,4
	jr	NZ,HelmutSkillChoice.skip4
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,HelmutSkillChoice.skip3
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	dec	1,A
	ld	(XIZ+0x10),A
	jr	HelmutSkillChoice.skip6
HelmutSkillChoice.skip3:
	jr	HelmutSkillChoice.skip6
HelmutSkillChoice.skip4:
	cp	A,8
	jr	NZ,HelmutSkillChoice.skip6
	ld	A,(XIZ+0x10)
	cp	A,1
	jr	Z,HelmutSkillChoice.skip5
	push	WA
	ld	WA,0x80
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x10),A
	jr	HelmutSkillChoice.skip6
HelmutSkillChoice.skip5:
	jr	HelmutSkillChoice.skip6
HelmutSkillChoice.skip6:
	ld	WA,0
	ld	A,(XIZ+0x10)
	mul	WA,0x30
	add	WA,0x20
	ld	BC,WA
	ld	DE,0x84
	call	DrawMenuCursor
	jr	HelmutSkillChoice.done
HelmutSkillChoice.skip7:
	call	ClearTextBox1
	ld	A,(XIZ+0x10)
	cp	A,0
	jr	Z,HelmutSkillChoice.skip8
	ld	A,2
	ld	(XIZ+0x27),A
	call	sub_216779
	ld	A,0x1D
	jr	HelmutSkillChoice.skip11
HelmutSkillChoice.skip8:
	ld	A,(XIZ+0x29)
	ld	W,(XIZ+0x2A)
	add	W,A
	inc	1,W
	call	CheckSkillPair1
	cp	A,1
	jr	Z,HelmutSkillChoice.skip9
	ld	(wSkill1),W
	ld	A,0x30
	jr	HelmutSkillChoice.skip10
HelmutSkillChoice.skip9:
	ld	(wSkill2),W
	ld	A,0x32
HelmutSkillChoice.skip10:
	ld	W,(XIZ+0x2A)
	add	A,W
	ld	L,A
	extz	HL
	call	SetEventFlag
	ld	A,0x1E
	jr	HelmutSkillChoice.skip11
HelmutSkillChoice.skip11:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
HelmutSkillChoice.done:
	ret

c_216208	section	code abs=0x216208

sub_216208:
	ld	A,(XIZ+0x27)
	cp	A,0
	jr	NZ,sub_216208.skip
	calr	sub_215F84
	jr	sub_216208.skip6
sub_216208.skip:
	cp	A,1
	jr	NZ,sub_216208.skip2
	calr	sub_215F8F
	jr	sub_216208.skip6
sub_216208.skip2:
	cp	A,2
	jr	NZ,sub_216208.skip3
	calr	sub_215FEA
	jr	sub_216208.skip6
sub_216208.skip3:
	cp	A,3
	jr	NZ,sub_216208.skip4
	calr	HelmutPickSkill
	jr	sub_216208.skip6
sub_216208.skip4:
	cp	A,4
	jr	NZ,sub_216208.skip5
	calr	sub_216111
	jr	sub_216208.skip6
sub_216208.skip5:
	cp	A,5
	jr	NZ,sub_216208.skip6
	calr	HelmutSkillChoice
	jr	sub_216208.skip6
sub_216208.skip6:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ret

c_21624A	section	code abs=0x21624A

sub_21624A:
	ld	XHL,swp_208C4C
	call	StartChildTask
	ldw	(XHL+0xE),0x78
	ld	WA,0x84
	call	SoundCommand
	ld	A,0
	ld	(XIZ+0x2C),A
	ld	A,1
	ld	(XIZ+0x27),A
	ret

c_21626A	section	code abs=0x21626A

sub_21626A:
	ld	A,6
	ld	(wShakeFlags),A
	ld	A,(XIZ+0x2C)
	inc	1,A
	ld	(XIZ+0x2C),A
	cp	A,0x39
	jr	C,sub_21626A.skip2
	ld	A,(wFadeLevel)
	add	A,2
	cp	A,0x7F
	jr	C,sub_21626A.skip
	ld	A,0x7F
sub_21626A.skip:
	ld	(wFadeLevel),A
sub_21626A.skip2:
	ld	WA,(XIZ+TASK_CHILDREN)
	cp	WA,0
	jr	NZ,sub_21626A.done
	call	dyn_206803
	call	dyn_21676A
	call	dyn_2167B1
	calr	dyn_21516D
	ld	A,0
	ld	(XIZ+0x13),A
	call	ClearTextBox1
	ld	HL,0x36
	call	dyn_216845
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	ld	XWA,0
	call	PlayMusic
	ld	WA,0x20
	call	SoundCommand
	ld	A,2
	ld	(XIZ+0x27),A
sub_21626A.done:
	ret

c_2162D0	section	code abs=0x2162D0

sub_2162D0:
	ld	A,2
	call	sub_216E95
	cp	A,1
	jr	Z,sub_2162D0.done
	ld	A,0xF
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,4
	ld	(XIZ+0x27),A
sub_2162D0.done:
	ret

c_2162EA	section	code abs=0x2162EA

sub_2162EA:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_2162EA.skip
	jr	sub_2162EA.skip4
sub_2162EA.skip:
	bit	5,A
	jr	Z,sub_2162EA.skip2
	jr	sub_2162EA.skip4
sub_2162EA.skip2:
	jr	sub_2162EA.skip3
sub_2162EA.skip3:
	jr	sub_2162EA.done
sub_2162EA.skip4:
	ld	A,4
	ld	(XIZ+0x27),A
sub_2162EA.done:
	ret

c_216306	section	code abs=0x216306

sub_216306:
	ld	A,2
	call	sub_216EB9
	cp	A,1
	jr	Z,sub_216306.done
	call	dyn_206803
	call	dyn_216757
	call	dyn_21679E
	call	ClearTextBox1
	calr	DrawTownPlace
	ld	XWA,2
	call	PlayMusic
	ld	WA,0x22
	call	SoundCommand
	ld	A,5
	ld	(XIZ+0x27),A
	call	dyn_216E31
	ld	A,9
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
sub_216306.done:
	ret

c_216344	section	code abs=0x216344

sub_216344:
	ld	A,9
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ret

c_21634F	section	code abs=0x21634F

sub_21634F:
	ld	A,(XIZ+0x27)
	cp	A,0
	jr	NZ,sub_21634F.skip
	calr	sub_21624A
	jr	sub_21634F.skip6
sub_21634F.skip:
	cp	A,1
	jr	NZ,sub_21634F.skip2
	calr	sub_21626A
	jr	sub_21634F.skip6
sub_21634F.skip2:
	cp	A,2
	jr	NZ,sub_21634F.skip3
	calr	sub_2162D0
	jr	sub_21634F.skip6
sub_21634F.skip3:
	cp	A,3
	jr	NZ,sub_21634F.skip4
	calr	sub_2162EA
	jr	sub_21634F.skip6
sub_21634F.skip4:
	cp	A,4
	jr	NZ,sub_21634F.skip5
	calr	sub_216306
	jr	sub_21634F.skip6
sub_21634F.skip5:
	cp	A,5
	jr	NZ,sub_21634F.skip6
	calr	sub_216344
	jr	sub_21634F.skip6
sub_21634F.skip6:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
	ret

c_216391	section	code abs=0x216391

; [code] task +0x28 = colla_offers.txt line by Random() % 100 against the rank column (GetStageArenaRank 3-8), +0x29 = price column by colla_price_odds.txt
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
	call	sub_20768A
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
	call	sub_216851
	call	DrawGPBox3
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,2
	ld	(XIZ+0x27),A
	ret

c_21648D	section	code abs=0x21648D

sub_21648D:
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,sub_21648D.skip
	jr	sub_21648D.skip3
sub_21648D.skip:
	bit	5,A
	jr	Z,sub_21648D.skip2
	jr	sub_21648D.skip3
sub_21648D.skip2:
	ld	A,(XIZ+0x2D)
	cp	A,0x3C
	jr	C,sub_21648D.done
sub_21648D.skip3:
	ld	A,0x1E
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,3
	ld	(XIZ+0x27),A
sub_21648D.done:
	ret

c_2164B7	section	code abs=0x2164B7

sub_2164B7:
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
	call	sub_20768A
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
	call	sub_20622F
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
	call	sub_20622F
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

; [code] town place task state 0xA: switch on +0x27: 1 ShowCollaOffer (sub_21640A), 2 sub_21648D, 3 sub_2164B7, 4 CollaBuy; +0x2D += 1; [play] colla_offer_*_buy_prompt
CollaTalkDispatch:
	ld	A,(XIZ+0x27)
	cp	A,1
	jr	NZ,CollaTalkDispatch.skip
	calr	ShowCollaOffer
	jr	CollaTalkDispatch.skip4
CollaTalkDispatch.skip:
	cp	A,2
	jr	NZ,CollaTalkDispatch.skip2
	calr	sub_21648D
	jr	CollaTalkDispatch.skip4
CollaTalkDispatch.skip2:
	cp	A,3
	jr	NZ,CollaTalkDispatch.skip3
	calr	sub_2164B7
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
	call	0x2061D6
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
	calr	dyn_215741
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
	call	0x2061D6
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

c_2169E5	section	code abs=0x2169E5

sub_2169E5:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_GREETED_LILY
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_CYRIUS
	call	ClearEventFlag
	ld	HL,0x53
	call	ClearEventFlag
	ld	HL,0x54
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_WYSE
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_ZIGGY
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_CEUS
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_HELMUT
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_ALDA
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_CAMIL
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_MEESE
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_COLLA
	call	ClearEventFlag
	ld	HL,EVENT_GREETED_TETIS
	call	ClearEventFlag
	ld	HL,0x5E
	call	ClearEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216B0C	section	code abs=0x216B0C

; [code] A = 1 if wPlayerRace is odd (male), else 0
IsPlayerMale:
	ld	A,(wPlayerRace)
	dec	1,A
	xor	A,1
	and	A,1
	ret

c_216B19	section	code abs=0x216B19

sub_216B19:
	push	XHL
	push	BC
	push	W
	ld	HL,0x10
	ld	A,0
	ld	W,4
sub_216B19.loop:
	push	HL
	push	WA
	call	CheckEventFlag
	pop	WA
	add	A,L
	pop	HL
	inc	1,HL
	djnz	W,sub_216B19.loop
	pop	W
	pop	BC
	pop	XHL
	ret

c_216B38	section	code abs=0x216B38

; [code] ClearEventFlag 0x10-0x13 (EVENT_EMBLEM_*); called by CyriusTrade
ClearEmblemFlags:
	push	XHL
	push	BC
	push	A
	ld	HL,0x10
	ld	A,4
ClearEmblemFlags.loop:
	push	HL
	push	A
	call	ClearEventFlag
	pop	A
	pop	HL
	inc	1,HL
	djnz	A,ClearEmblemFlags.loop
	pop	A
	pop	BC
	pop	XHL
	ret

c_216B51	section	code abs=0x216B51

sub_216B51:
	push	XHL
	push	BC
	push	A
	ld	HL,0x60
	ld	A,4
sub_216B51.loop:
	push	HL
	push	A
	call	ClearEventFlag
	pop	A
	pop	HL
	inc	1,HL
	djnz	A,sub_216B51.loop
	pop	A
	pop	BC
	pop	XHL
	ret

c_216B6A	section	code abs=0x216B6A

; [code] A = 1 if event flag 0x30 or 0x31 (first skill learned)
CheckSkillPair1:
	push	XHL
	push	BC
	push	W
	ld	W,0
	ld	HL,EVENT_SKILL1_A
	call	CheckEventFlag
	or	W,L
	ld	HL,EVENT_SKILL1_B
	call	CheckEventFlag
	or	W,L
	ld	A,W
	pop	W
	pop	BC
	pop	XHL
	ret

c_216B89	section	code abs=0x216B89

; [code] A = 1 if event flag 0x32 or 0x33 (second skill learned)
CheckSkillPair2:
	push	XHL
	push	BC
	push	W
	ld	W,0
	ld	HL,EVENT_SKILL2_A
	call	CheckEventFlag
	or	W,L
	ld	HL,EVENT_SKILL2_B
	call	CheckEventFlag
	or	W,L
	ld	A,W
	pop	W
	pop	BC
	pop	XHL
	ret

c_217054	section	code abs=0x217054

loc_217054:
	cp	A,2
	jr	NZ,loc_217054.skip13
	ld	A,0
	ld	B,(WBA_H)
	ld	C,(0x60F5)
	cp	B,C
	jr	Z,loc_217054.skip3
	jr	C,loc_217054.skip
	sub	B,(0x60F9)
	jr	loc_217054.skip2
loc_217054.skip:
	add	B,(0x60F9)
loc_217054.skip2:
	ld	(WBA_H),B
	ld	A,1
loc_217054.skip3:
	ld	B,(WBA_V)
	ld	C,(0x60F6)
	cp	B,C
	jr	Z,loc_217054.skip6
	jr	C,loc_217054.skip4
	sub	B,(0x60FA)
	jr	loc_217054.skip5
loc_217054.skip4:
	add	B,(0x60FA)
loc_217054.skip5:
	ld	(WBA_V),B
	ld	A,1
loc_217054.skip6:
	ld	B,(WSI_H)
	ld	C,(0x60F7)
	cp	B,C
	jr	Z,loc_217054.skip9
	jr	C,loc_217054.skip7
	add	B,(0x60FB)
	jr	loc_217054.skip8
loc_217054.skip7:
	sub	B,(0x60FB)
loc_217054.skip8:
	ld	(WSI_H),B
	ld	A,1
loc_217054.skip9:
	ld	B,(WSI_V)
	ld	C,(0x60F8)
	cp	B,C
	jr	Z,loc_217054.skip12
	jr	C,loc_217054.skip10
	add	B,(0x60FC)
	jr	loc_217054.skip11
loc_217054.skip10:
	sub	B,(0x60FC)
loc_217054.skip11:
	ld	(WSI_V),B
	ld	A,1
loc_217054.skip12:
	jr	0x2170D6
loc_217054.skip13:
	ld	A,0
	cp	A,0
	jr	NZ,0x2170E0
	ld	A,0
	ld	(0x60FD),A
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2170E4	section	code abs=0x2170E4

sub_2170E4:
	push	A
	ld	A,0
	ld	(0x60F1),A
	ld	A,0x50
	ld	(0x60F5),A
	ld	A,0xA0
	ld	(0x60F3),A
	ld	A,0
	ld	(0x60F7),A
	ld	A,0
	ld	(0x60F2),A
	ld	A,0
	ld	(0x60F6),A
	ld	A,0x98
	ld	(0x60F4),A
	ld	A,0x98
	ld	(0x60F8),A
	ld	A,2
	ld	(0x60F9),A
	ld	A,0
	ld	(0x60FA),A
	ld	A,0xFC
	ld	(0x60FB),A
	ld	A,0
	ld	(0x60FC),A
	pop	A
	ret

c_21712F	section	code abs=0x21712F

dyn_21712F:
	push	A
	ld	A,0
	ld	(0x60F1),A
	ld	A,0
	ld	(0x60F5),A
	ld	A,0xA0
	ld	(0x60F3),A
	ld	A,0xA0
	ld	(0x60F7),A
	ld	A,0
	ld	(0x60F2),A
	ld	A,0x4C
	ld	(0x60F6),A
	ld	A,0x98
	ld	(0x60F4),A
	ld	A,0
	ld	(0x60F8),A
	ld	A,0
	ld	(0x60F9),A
	ld	A,2
	ld	(0x60FA),A
	ld	A,0
	ld	(0x60FB),A
	ld	A,0xFC
	ld	(0x60FC),A
	pop	A
	ret

c_2175A7	section	code abs=0x2175A7

sub_2175A7:
	ret

c_2175A8	section	code abs=0x2175A8

swp_2175A8:
	ld	A,1
	ld	(wCursorVisible),A
	ret

c_2175AF	section	code abs=0x2175AF

swp_2175AF:
	xor	A,A
	ld	(wCursorVisible),A
	ret

c_2175B6	section	code abs=0x2175B6

swp_2175B6:
	ld	(0x610D),A
	ret

c_2175BB	section	code abs=0x2175BB

swp_2175BB:
	ld	(0x610E),B
	ld	(0x610F),C
	ret

c_2175C4	section	code abs=0x2175C4

swp_2175C4:
	ld	XWA,swp_2175C4.resume
	ld	(XIZ+TASK_FUNC),XWA
swp_2175C4.resume:
	ld	XWA,swp_2175C4.resume2
	ld	(XIZ+TASK_FUNC),XWA
swp_2175C4.resume2:
	incb	1,(0x6110)
	ld	A,(0x6110)
	srl	5,A
	ret	C
	ld	A,(wCursorVisible)
	or	A,A
	ret	Z
	ld	A,(0x610D)
	ld	B,(0x610E)
	ld	C,(0x610F)
	call	swp_21722F
	ret

c_2175FA	section	code abs=0x2175FA

swp_2175FA:
	ld	XWA,swp_2175FA.done
	ld	(XIZ+TASK_FUNC),XWA
swp_2175FA.done:
	ret

c_217603	section	code abs=0x217603

sub_217603:
	xor	A,A
	ld	(0x6115),A
	ld	(0x6116),A
	ld	(0x611C),A
	ld	XHL,swp_2177A9
	call	StartChildTask
	ld	(0x6111),XHL
	ret

c_21761F	section	code abs=0x21761F

sub_21761F:
	ret

c_21785A	section	code abs=0x21785A

sub_21785A:
	ret

c_21785B	section	code abs=0x21785B

loc_21785B:
	ld	W,0xFF
	ld	(0x6137),WA
	pop	XHL
	ld	(0x6131),XHL
	xor	WA,WA
	ld	(0x6135),WA
loc_21785B.loop:
	ld	WA,(0x6135)
	or	WA,WA
	jr	NZ,loc_21785B.skip
	call	TaskYield
	jr	loc_21785B.loop
loc_21785B.skip:
	call	TaskYield
	ld	WA,(0x6135)
	ld	XHL,(0x6131)
	jp	XHL

c_217888	section	code abs=0x217888

sub_217888:
	ld	A,1
	jp	loc_21785B

c_21788E	section	code abs=0x21788E

swp_21788E:
	ld	A,2
	jp	loc_21785B

c_217894	section	code abs=0x217894

sub_217894:
	ld	A,3
	jp	loc_21785B

c_21789A	section	code abs=0x21789A

sub_21789A:
	ld	A,4
	jp	loc_21785B

c_2178A0	section	code abs=0x2178A0

swp_2178A0:
	ld	A,5
	jp	loc_21785B

c_2178A6	section	code abs=0x2178A6

loc_2178A6:
	ld	A,(0x6137)
	cp	A,6
	jr	NC,loc_2178A6.skip
	ld	XHL,0x2178BD
	sll	2,A
	ld	XHL,(XHL+A)
	jp	XHL
	db	0xE4,0x78,0x21,0x00,0xEC,0x78,0x21,0x00,0x05,0x79,0x21,0x00,0x0B,0x79,0x21,0x00
	db	0x21,0x79,0x21,0x00,0x35,0x79,0x21,0x00
loc_2178A6.skip:
	ld	WA,0xFFFF
	ldw	(0x6137),0
	ld	W,0xFF
	ld	(0x6135),WA
	call	TaskYield
	jp	loc_2178A6

c_2178EC	section	code abs=0x2178EC

swp_2178EC:
	ld	A,2
	ld	C,8
	ld	E,0xB
	ld	HL,0x42
	call	OpenTextBox
	xor	A,A
	ld	(0x6130),A
	xor	A,A
	jp	0x2178D8

c_217905	section	code abs=0x217905

swp_217905:
	xor	A,A
	jp	0x2178D8

c_21790B	section	code abs=0x21790B

swp_21790B:
	ld	A,2
	call	ClearTextBox
	ld	A,2
	ld	C,0xC
	ld	E,0x20
	call	PlaceTextBox
	xor	A,A
	jp	0x2178D8

c_217921	section	code abs=0x217921

swp_217921:
	ld	A,(0x6130)
	or	A,A
	jr	NZ,swp_217921.skip
	ld	A,1
	ld	(0x6130),A
swp_217921.skip:
	xor	A,A
	jp	0x2178D8

c_217935	section	code abs=0x217935

swp_217935:
	ld	A,(0x6130)
	or	A,A
	jr	Z,swp_217935.skip
	xor	A,A
	ld	(0x6130),A
swp_217935.skip:
	xor	A,A
	jp	0x2178D8

c_217949	section	code abs=0x217949

sub_217949:
	xor	XWA,XWA
	ld	(0x6146),XWA
	ld	(0x613E),XWA
	ld	XHL,swp_217A04
	call	StartChildTask
	ret

c_21795D	section	code abs=0x21795D

sub_21795D:
	ret

c_217B56	section	code abs=0x217B56

swp_217B56:
	ld	A,(0x613D)
	or	A,A
	jr	Z,swp_217B56.skip
	call	swp_2175AF
	xor	A,A
	ld	(0x613D),A
swp_217B56.skip:
	xor	WA,WA
	jp	0x217A4D

c_217B8C	section	code abs=0x217B8C

sub_217B8C:
	ld	A,(0x6139)
	cp	A,(0x614A)
	jr	NC,sub_217B8C.done
	add	A,A
	ld	XHL,(0x6150)
	lda	XHL,XHL+A
	ld	B,(XHL+)
	ld	C,(XHL+)
	scf
sub_217B8C.done:
	ret

c_217BA9	section	code abs=0x217BA9

swp_217BA9:
	call	sub_217B8C
	jr	NC,swp_217BA9.done
	call	swp_2175BB
swp_217BA9.done:
	ret

c_217E6B	section	code abs=0x217E6B

sub_217E6B:
	ret

c_217E6C	section	code abs=0x217E6C

swp_217E6C:
	ld	XWA,(wListResult)
	or	XWA,XWA
	ret

c_217E73	section	code abs=0x217E73

swp_217E73:
	ld	(wListCommand),A
	xor	XWA,XWA
	ld	(wListResult),XWA
	ret

c_217E7E	section	code abs=0x217E7E

swp_217E7E:
	ld	A,1
	jp	swp_217E73

c_217E84	section	code abs=0x217E84

swp_217E84:
	ld	A,2
	jp	swp_217E73

c_218004	section	code abs=0x218004

swp_218004:
	xor	A,A
	ld	(0x615E),A
	ld	(wListPage),A
	ld	(wListRow),A
	xor	WA,WA
	jp	0x217FE9

c_218018	section	code abs=0x218018

swp_218018:
	ld	A,3
	call	swp_2175B6
	ld	XHL,(0x6162)
	call	swp_21717A
	xor	WA,WA
	jp	0x217FE9

c_21802C	section	code abs=0x21802C

swp_21802C:
	ld	A,(0x615E)
	or	A,A
	jr	NZ,swp_21802C.skip
	call	swp_2175A8
	call	sub_2181A1
	ldb	(0x615E),1
swp_21802C.skip:
	xor	WA,WA
	jp	0x217FE9

c_218047	section	code abs=0x218047

swp_218047:
	call	sub_2181A1
	call	swp_2175A8
swp_218047.loop:
	call	TaskYield
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jp	NZ,swp_218047.skip
	bit	5,A
	jp	NZ,swp_218047.skip3
	bit	1,A
	jp	NZ,swp_218047.skip4
	bit	0,A
	jp	NZ,swp_218047.skip6
	bit	3,A
	jp	NZ,swp_218047.skip8
	bit	2,A
	jp	NZ,swp_218047.skip10
	jp	swp_218047.skip14
swp_218047.skip:
	ld	XHL,(0x616E)
	call	swp_21717A
	jr	NC,swp_218047.skip2
	ld	WA,0x81
	call	CallSoundCommand
	ld	L,(wListPage)
	mul	HL,(0x615F)
	ld	A,(wListRow)
	extz	WA
	add	WA,HL
	jp	swp_218047.skip15
swp_218047.skip2:
	ld	WA,0x83
	call	CallSoundCommand
	jp	swp_218047.skip14
swp_218047.skip3:
	ld	WA,0x82
	call	CallSoundCommand
	ld	WA,0xFFFF
	jp	swp_218047.skip15
swp_218047.skip4:
	ld	A,(wListRow)
	inc	1,A
	cp	A,(0x615F)
	jr	C,swp_218047.skip5
	xor	A,A
swp_218047.skip5:
	ld	(wListRow),A
	jp	swp_218047.skip13
swp_218047.skip6:
	ld	A,(wListRow)
	dec	1,A
	jr	PL,swp_218047.skip7
	ld	A,(0x615F)
	dec	1,A
swp_218047.skip7:
	ld	(wListRow),A
	jp	swp_218047.skip13
swp_218047.skip8:
	ld	A,(wListPage)
	inc	1,A
	cp	A,(0x6161)
	jr	C,swp_218047.skip9
	xor	A,A
swp_218047.skip9:
	ld	(wListPage),A
	jp	swp_218047.skip12
swp_218047.skip10:
	ld	A,(wListPage)
	dec	1,A
	jr	PL,swp_218047.skip11
	ld	A,(0x6161)
	dec	1,A
swp_218047.skip11:
	ld	(wListPage),A
swp_218047.skip12:
	ld	XHL,(0x6162)
	call	swp_21717A
swp_218047.skip13:
	ld	XHL,(0x616A)
	call	swp_21717A
	ld	WA,0x80
	call	CallSoundCommand
swp_218047.skip14:
	call	sub_2181A1
	jp	swp_218047.loop
swp_218047.skip15:
	ld	(0x615B),WA
	ldb	(0x615D),0xFF
	call	swp_2175AF
	xor	WA,WA
	jp	0x217FE9

c_21814F	section	code abs=0x21814F

swp_21814F:
	ld	A,(0x615E)
	or	A,A
	jr	Z,swp_21814F.skip
	call	swp_2175AF
	ldb	(0x615E),0
swp_21814F.skip:
	xor	WA,WA
	jp	0x217FE9

c_218184	section	code abs=0x218184

swp_218184:
	ld	A,(wListRow)
	cp	A,(0x615F)
	jr	NC,swp_218184.done
	add	A,A
	ld	XHL,(0x6172)
	lda	XHL,XHL+A
	ld	B,(XHL+)
	ld	C,(XHL+)
	scf
swp_218184.done:
	ret

c_2181A1	section	code abs=0x2181A1

sub_2181A1:
	call	swp_218184
	jr	NC,sub_2181A1.done
	push	BC
	ld	A,3
	call	swp_2175B6
	pop	BC
	call	swp_2175BB
sub_2181A1.done:
	ret

c_218909	section	code abs=0x218909

sub_218909:
	ret

c_219431	section	code abs=0x219431

sub_219431:
	call	sub_219443
	call	sub_2194C5
	call	sub_2194C7
	ret

c_219443	section	code abs=0x219443

sub_219443:
	ret

c_2194C5	section	code abs=0x2194C5

sub_2194C5:
	ret

c_2194C7	section	code abs=0x2194C7

sub_2194C7:
	ret

c_21AA5D	section	code abs=0x21AA5D

loc_21AA5D:
	ld	XHL,SeeYouLaterTakeText
	ld	XDE,SeeYouLaterTakeText
	call	ShowPartnerGenderText
	call	Wait30Frames
	jp	EndMenuTask

c_21AB3F	section	code abs=0x21AB3F

; [code] common exit (jp from ShopMenu, Works menu, loc_21AA5D): empty cleanup stubs, dyn_20636D (task bit 6), posts 0xFFFF0000 | word (0x61F7) to 0x6212 (the result sub_21AAA5 waits for), EndTask
EndMenuTask:
	call	sub_219431
	call	sub_218909
	call	sub_217E6B
	call	sub_21795D
	call	sub_21785A
	call	sub_21761F
	call	sub_2175A7
	call	dyn_20636D
	call	TaskYield
	ld	XWA,0xFFFF0000
	ld	WA,(0x61F7)
	ld	(0x6212),XWA
	call	EndTask
EndMenuTask.loop:
	call	TaskYield
	jr	EndMenuTask.loop

c_21D758	section	code abs=0x21D758

; [code+play] full HP/EP, statuses cleared, street menu, then by 0x5DF4: Works, Shop, Arena, Square, World map
StreetTask:
	ldw	(wUnitHP),(wUnitMaxHP)
	ldw	(wUnitEP),(wUnitMaxEP)
	ld	A,0
	ld	(wStatusParalyzed),A
	ld	(wStatusRust),A
	ld	(wStatusEPLeak),A
	ld	(wStatusConfused),A
	ld	XHL,dyn_20D84E
	call	StartChildTask
	task_wait
	cpb	(wStreetMenuChoice),1
	ld	XHL,StreetGoWorks
	jr	C,0x21D7B8
	ld	XHL,swp_21D856
	jr	Z,0x21D7B8
	cpb	(wStreetMenuChoice),3
	ld	XHL,swp_21D8C0
	jr	C,0x21D7B8
	ld	XHL,swp_21D91C
	jr	Z,0x21D7B8
	ld	XHL,swp_21D7BC
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_21D7BC	section	code abs=0x21D7BC

swp_21D7BC:
	ld	XHL,swp_210443
	call	StartChildTask
	task_wait
	cpb	(0x5FF8),2
	ld	XHL,swp_21D93E
	jr	Z,swp_21D7BC.skip
	cpb	(0x5FF8),4
	ld	XHL,swp_21D95E
	jr	Z,swp_21D7BC.skip
	cpb	(0x5FF8),5
	ld	XHL,swp_21D980
	jr	Z,swp_21D7BC.skip
	ld	XHL,StreetTask
swp_21D7BC.skip:
	ld	(XIZ+TASK_FUNC),XHL
	ret

c_21D800	section	code abs=0x21D800

; [code] street choice 0 (Works), then back to StreetTask
StreetGoWorks:
	ld	XHL,dyn_214C0E
	call	StartChildTask
	task_wait
	call	ResetScr2Palettes
	cpb	(0x60F0),1
	jr	Z,StreetGoWorks.skip
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
StreetGoWorks.skip:
	ldw	(wEnemyAffinity),(wUnitAffinity)
	ld	A,1
	call	sub_21AAA5
	call	CalcUnitStats
	ldb	(wStreetMenuChoice),0
	ldw	(XIZ+TASK_FUNC),0xD758
	ldw	(XIZ+TASK_FUNC_HI),0x21
	ret
