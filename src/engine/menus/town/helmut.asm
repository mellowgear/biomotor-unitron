; engine/menus/town/helmut.asm: Helmut's skill offer

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

; [code] Helmut step 0 (talk next 0xF3, TalkSpring line 6 "All right, look into my eyes..."): +0x2D = 0, step 1 (HelmutEyesWait)
HelmutEyesStart:
	ld	A,0
	ld	(XIZ+0x2D),A
	ld	A,1
	ld	(XIZ+0x27),A
	ret

c_215F8F	section	code abs=0x215F8F

; [code] Helmut step 1: after 0x5A frames (+0x2D): talk row +0x12 = 7 (TalkSpring line 8 "Looks like you've been train...") when +0x29 (HelmutSkillOffer, set by TownNpcTalk) != 0xFF, else row 6 (line 7 "Humph. Looks like you need s..."); TASK_ARG 6, step 2
HelmutEyesWait:
	ld	A,(XIZ+0x2D)
	cp	A,0x5A
	jr	C,HelmutEyesWait.done
	ld	A,(XIZ+0x29)
	cp	A,0xFF
	jr	Z,HelmutEyesWait.skip
	ld	A,7
	jr	HelmutEyesWait.skip2
HelmutEyesWait.skip:
	ld	A,6
HelmutEyesWait.skip2:
	ld	(XIZ+0x12),A
	ld	A,6
	ld	(XIZ+TASK_ARG),A
	ld	A,2
	ld	(XIZ+0x27),A
HelmutEyesWait.done:
	ret

c_215FB3	section	code abs=0x215FB3

; [code] XHL = NovaText + 7 * A (the 20 skill name strings of nova.asm: Nova, Burst, Ragnok ...)
GetSkillNameText:
	push	XWA
	extz	WA
	extz	XWA
	mul	XWA,7
	ld	XHL,NovaText
	add	XHL,XWA
	pop	XWA
	ret

c_215FC5	section	code abs=0x215FC5

; [code] XHL = message (+4) of talk row A + 8 (table W = +0x15, GetTalkRow); caller DrawHelmutSkillDesc
GetHelmutSkillDesc:
	push	XWA
	add	A,8
	ld	W,(XIZ+0x15)
	calr	GetTalkRow
	ld	XHL,(XHL+4)
	pop	XWA
	ret

c_215FD4	section	code abs=0x215FD4

; [code] DrawBoxString GetHelmutSkillDesc(+0x29 + cursor +0x10) into box 1 (registers saved); callers DrawHelmutSkillPair, HelmutPickSkill
DrawHelmutSkillDesc:
	push	XHL
	push	XWA
	ld	A,(XIZ+0x29)
	ld	W,(XIZ+0x10)
	add	A,W
	calr	GetHelmutSkillDesc
	ld	A,1
	call	DrawBoxString
	pop	XWA
	pop	XHL
	ret

c_215FEA	section	code abs=0x215FEA

; [code] Helmut state 2: box 2 the skill names GetSkillNameText(+0x29) and (+0x29 + 1) on rows 0, 1; cursor 0, ClearTextBox1, DrawHelmutSkillDesc, state 3 (HelmutPickSkill)
DrawHelmutSkillPair:
	ld	A,(XIZ+0x29)
	ld	C,2
	ld	E,0
DrawHelmutSkillPair.loop:
	push	C
	push	E
	push	A
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	pop	A
	push	A
	calr	GetSkillNameText
	ld	A,2
	call	DrawBoxString
	pop	A
	pop	E
	pop	C
	inc	1,E
	inc	1,A
	djnz	C,DrawHelmutSkillPair.loop
	ld	A,0
	ld	(XIZ+0x10),A
	call	ClearTextBox1
	calr	DrawHelmutSkillDesc
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
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	jr	HelmutPickSkill.skip8
HelmutPickSkill.skip:
	and	A,0xF
	jr	Z,HelmutPickSkill.skip5
	cp	A,1
	jr	NZ,HelmutPickSkill.skip3
	push	WA
	ld	WA,SFX_CURSOR
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
	ld	WA,SFX_CURSOR
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
	calr	ResetTextBox1
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,HelmutPickSkill.skip7
	calr	DrawHelmutSkillDesc
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
	call	ClearBox2
	calr	ResetTextBox1
	ld	A,(XIZ+0x10)
	cp	A,8
	jr	Z,HelmutPickSkill.skip9
	ld	(XIZ+0x2A),A
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
	ld	A,(XIZ+0x29)
	ld	W,(XIZ+0x2A)
	add	A,W
	calr	GetSkillNameText
	ld	A,2
	call	DrawBoxString
	ld	A,0x1C
	jr	HelmutPickSkill.skip10
HelmutPickSkill.skip9:
	ld	E,0
	add	E,A
	ld	C,0
	ld	A,2
	call	SetTextBoxCursor
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

; [code] Helmut state 4: YesNoText at 0,2 in box 1, cursor 0, +0x2D = 0, state 5 (HelmutSkillChoice); [play] spring_helmut_skill_learn_* screens; byte-identical copy of DrawCyriusConfirmYesNo (the ROM has each)
DrawHelmutYesNo:
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
	ld	WA,SFX_CONFIRM
	call	SoundCommand
	pop	WA
	jr	HelmutSkillChoice.skip7
HelmutSkillChoice.skip:
	bit	5,A
	jr	Z,HelmutSkillChoice.skip2
	push	WA
	ld	WA,SFX_CANCEL
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
	ld	WA,SFX_CURSOR
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
	ld	WA,SFX_CURSOR
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
	call	ClearBox2
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
	ld	A,EVENT_SKILL1_A
	jr	HelmutSkillChoice.skip10
HelmutSkillChoice.skip9:
	ld	(wSkill2),W
	ld	A,EVENT_SKILL2_A
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

; [code] town place task state 8 (TownPlaceTaskState6): switch on +0x27: 0 HelmutEyesStart, 1 HelmutEyesWait, 2 DrawHelmutSkillPair, 3 HelmutPickSkill, 4 DrawHelmutYesNo, 5 HelmutSkillChoice; +0x2D += 1; [play] spring_helmut_skill_* screens
HelmutTalkDispatch:
	ld	A,(XIZ+0x27)
	cp	A,0
	jr	NZ,HelmutTalkDispatch.skip
	calr	HelmutEyesStart
	jr	HelmutTalkDispatch.skip6
HelmutTalkDispatch.skip:
	cp	A,1
	jr	NZ,HelmutTalkDispatch.skip2
	calr	HelmutEyesWait
	jr	HelmutTalkDispatch.skip6
HelmutTalkDispatch.skip2:
	cp	A,2
	jr	NZ,HelmutTalkDispatch.skip3
	calr	DrawHelmutSkillPair
	jr	HelmutTalkDispatch.skip6
HelmutTalkDispatch.skip3:
	cp	A,3
	jr	NZ,HelmutTalkDispatch.skip4
	calr	HelmutPickSkill
	jr	HelmutTalkDispatch.skip6
HelmutTalkDispatch.skip4:
	cp	A,4
	jr	NZ,HelmutTalkDispatch.skip5
	calr	DrawHelmutYesNo
	jr	HelmutTalkDispatch.skip6
HelmutTalkDispatch.skip5:
	cp	A,5
	jr	NZ,HelmutTalkDispatch.skip6
	calr	HelmutSkillChoice
	jr	HelmutTalkDispatch.skip6
HelmutTalkDispatch.skip6:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
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
