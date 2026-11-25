; engine/menus/town/npc_talk.asm: talking to town NPCs: talk rows, row actions, talk-screen transitions

c_215161	section	code abs=0x215161

; [code] XHL = GetTalkRow(place +0x15, row +0x12): the talk row the place task is on (WA saved)
GetCurrentTalkRow:
	push	WA
	ld	W,(XIZ+0x15)
	ld	A,(XIZ+0x12)
	calr	GetTalkRow
	pop	WA
	ret

c_215179	section	code abs=0x215179

; [code] HL = talk row speaker: ClearTalkPortraitArea; 0 -> nothing; 0xFFFF (row speaker 255) -> DrawTalkSpeakerPlayer; else DrawPortraitAt HL at 0, 0x20 with first tile GetPortraitFirstTile (registers saved); the same as the start of DrawArenaParticipants
DrawTalkSpeakerPortrait:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	ClearTalkPortraitArea
	cp	HL,0
	jr	Z,DrawTalkSpeakerDraw.skip
	cp	HL,0xFFFF
	jr	Z,DrawTalkSpeakerPlayer
	ld	BC,0
	ld	DE,0
	add	E,0x20
	jr	DrawTalkSpeakerDraw

c_215193	section	code abs=0x215193

; [code] DrawTalkSpeakerPortrait for speaker 0xFFFF (the player): portrait 1 + ((wPlayerRace - 1) xor 1), then DrawTalkSpeakerDraw
DrawTalkSpeakerPlayer:
	ld	A,(wPlayerRace)
	dec	1,A
	xor	A,1
	extz	WA
	ld	HL,1
	add	HL,WA
	ld	BC,0
	ld	DE,0
	add	E,0x20
	jr	DrawTalkSpeakerDraw

c_2151AB	section	code abs=0x2151AB

; [code] DrawTalkSpeakerPortrait tail: DrawPortraitAt with first tile GetPortraitFirstTile, registers restored
DrawTalkSpeakerDraw:
	call	GetPortraitFirstTile
	call	DrawPortraitAt
DrawTalkSpeakerDraw.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2151B8	section	code abs=0x2151B8

; [code] speaker of GetCurrentTalkRow (+0); when it differs from the one shown (+0x13): +0x13 = speaker, DrawTalkSpeakerPortrait (registers saved)
UpdateTalkSpeakerPortrait:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	calr	GetCurrentTalkRow
	ld	A,(XHL+0)
	ld	W,(XIZ+0x13)
	cp	A,W
	jr	Z,UpdateTalkSpeakerPortrait.skip
	ld	(XIZ+0x13),A
	ld	L,A
	exts	HL
	calr	DrawTalkSpeakerPortrait
UpdateTalkSpeakerPortrait.skip:
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
	jrl	Z,TownNpcTalk.skip19
	cp	A,6
	jrl	Z,TownNpcTalk.skip19
	cp	A,7
	jrl	Z,TownNpcTalk.skip19
	cp	A,8
	jrl	Z,TownNpcTalk.skip19
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
	jrl	TownNpcTalk.skip19
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
	jrl	C,TownNpcTalk.skip19
	cp	W,0x48
	jrl	NC,TownNpcTalk.skip19
	call	CountEmblemFlags
	cp	A,0
	jrl	Z,TownNpcTalk.skip10
	ld	HL,EVENT_CYRIUS_TOLD_LORDS
	call	CheckEventFlag
	cp	L,0
	jr	Z,TownNpcTalk.skip3
	call	CountEmblemFlags
	cp	A,4
	jr	Z,TownNpcTalk.skip4
	jrl	TownNpcTalk.skip10
TownNpcTalk.skip3:
	ld	W,0x12
	jrl	TownNpcTalk.skip19
TownNpcTalk.skip4:
	ld	HL,EVENT_CYRIUS_TRADED
	call	CheckEventFlag
	cp	L,1
	jr	Z,TownNpcTalk.skip5
	ld	A,0
	ld	(XIZ+0x28),A
	ld	W,0x13
	jrl	TownNpcTalk.skip19
TownNpcTalk.skip5:
	ld	A,1
	ld	(XIZ+0x28),A
	ld	W,0x1B
	jrl	TownNpcTalk.skip19
TownNpcTalk.skip6:
	ld	A,(XIZ+0x15)
	cp	A,3
	jr	Z,TownNpcTalk.skip10
	ld	W,D
	cp	W,0x22
	jrl	C,TownNpcTalk.skip19
	calr	HelmutSkillOffer
	cp	A,0x14
	jr	Z,TownNpcTalk.skip10
	ld	(XIZ+0x29),A
	ld	W,4
	jrl	TownNpcTalk.skip19
TownNpcTalk.skip7:
	ld	W,D
	cp	W,0x1B
	jrl	NC,TownNpcTalk.skip19
	call	GetStageArenaRank
	cp	A,3
	jr	C,TownNpcTalk.skip10
	ld	HL,EVENT_COLLA_OFFERS_ENABLED
	call	CheckEventFlag
	cp	L,0
	jr	NZ,TownNpcTalk.skip8
	ld	W,0x1B
	jrl	TownNpcTalk.skip19
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
	jr	TownNpcTalk.skip19
TownNpcTalk.skip9:
	ld	W,D
	cp	W,0x49
	jr	NC,TownNpcTalk.skip19
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
TownNpcTalk.skip19:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21535A	section	code abs=0x21535A

; [code] W = the talk row that starts when a place is entered (TownPlaceEnter; TownTalkStartRow when +0x12 = 0xFF): place 5 WorksEntryTalkRow, 6 (Shop) by EVENT_TALKED_SHOP and story stage 0 / 8 (rows 0 / 4 not yet talked, 3 / 7 talked), 7 and 8 row 0, else 0xFF (none)
GetPlaceEntryTalkRow:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(XIZ+0x15)
	cp	A,5
	jr	Z,WorksEntryTalkRow
	cp	A,6
	jrl	Z,ShopEntryTalkRow
	cp	A,7
	jrl	Z,Place7EntryTalkRow
	cp	A,8
	jrl	Z,Place8EntryTalkRow
	ld	W,0xFF
	jrl	GetPlaceEntryTalkRowDone

c_215379	section	code abs=0x215379

; [code] GetPlaceEntryTalkRow for the Works (place 5), by GetStoryStage: 0 WorksEntryTalkRowStage0; 8 row 3 while EVENT_TALKED_RENAB is clear, row 5 once the 13 EVENT_TALKED flags Renab, Jon, Cyrius, Shop, Wyse, Ziggy, Ceus, Helmut, Alda, Camil, Meese, Colla, Tetis are all set, else row 4; 0xA row 0xE while EVENT_TALKED_RENAB is clear, else 0xFF; other stages 0xFF
WorksEntryTalkRow:
	call	GetStoryStage
	cp	A,0xA
	jrl	Z,WorksEntryTalkRowStageA
	cp	A,8
	jr	Z,WorksEntryTalkRowStage8
	cp	A,0
	jr	Z,WorksEntryTalkRowStage0
	ld	W,0xFF
	jrl	GetPlaceEntryTalkRowDone

c_215391	section	code abs=0x215391

; [code] WorksEntryTalkRow at story stage 0: row 0 while EVENT_TALKED_RENAB is clear; row 2 when EVENT_TALKED Jon, Lily, Shop, Wyse, Ceus, Helmut, Camil and Meese are all set; else WorksEntryTalkRow1
WorksEntryTalkRowStage0:
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow0
	ld	HL,EVENT_TALKED_JON
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	HL,EVENT_TALKED_LILY
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	HL,EVENT_TALKED_SHOP
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	HL,EVENT_TALKED_WYSE
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	HL,EVENT_TALKED_CEUS
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	HL,EVENT_TALKED_HELMUT
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	HL,EVENT_TALKED_CAMIL
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	HL,EVENT_TALKED_MEESE
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRow1
	ld	W,2
	jrl	GetPlaceEntryTalkRowDone

c_2153F9	section	code abs=0x2153F9

; [code] W = 1 (WorksEntryTalkRowStage0: someone of Jon, Lily, Shop, Wyse, Ceus, Helmut, Camil, Meese not talked to yet), then GetPlaceEntryTalkRowDone
WorksEntryTalkRow1:
	ld	W,1
	jrl	GetPlaceEntryTalkRowDone

c_2153FE	section	code abs=0x2153FE

; [code] WorksEntryTalkRowStage0 with EVENT_TALKED_RENAB clear: W = 0 (was loc_2153FE)
WorksEntryTalkRow0:
	ld	W,0
	jrl	GetPlaceEntryTalkRowDone

c_215403	section	code abs=0x215403

; [code] WorksEntryTalkRow at story stage 8: row 3 while EVENT_TALKED_RENAB is clear, 5 when the 13 EVENT_TALKED flags (Renab ... Tetis) are all set, else 4 (was loc_215403)
WorksEntryTalkRowStage8:
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,0
	jrl	Z,WorksEntryTalkRowStage8.skip2
	ld	HL,EVENT_TALKED_JON
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_CYRIUS
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_SHOP
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_WYSE
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_ZIGGY
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_CEUS
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_HELMUT
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_ALDA
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_CAMIL
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_MEESE
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_COLLA
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	HL,EVENT_TALKED_TETIS
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStage8.skip
	ld	W,5
	jr	GetPlaceEntryTalkRowDone
WorksEntryTalkRowStage8.skip:
	ld	W,4
	jr	GetPlaceEntryTalkRowDone
WorksEntryTalkRowStage8.skip2:
	ld	W,3
	jr	GetPlaceEntryTalkRowDone

c_21549F	section	code abs=0x21549F

; [code] WorksEntryTalkRow at story stage 0xA: row 0xE while EVENT_TALKED_RENAB is clear, else 0xFF (was loc_21549F)
WorksEntryTalkRowStageA:
	ld	HL,EVENT_TALKED_RENAB
	call	CheckEventFlag
	cp	L,0
	jr	Z,WorksEntryTalkRowStageA.skip
	ld	W,0xFF
	jr	GetPlaceEntryTalkRowDone
WorksEntryTalkRowStageA.skip:
	ld	W,0xE
	jr	GetPlaceEntryTalkRowDone

c_2154B2	section	code abs=0x2154B2

; [code] GetPlaceEntryTalkRow for place 6 (Shop): EVENT_TALKED_SHOP clear -> stage 0 row 0, stage 8 row 4; set -> stage 0 row 3, stage 8 row 7; other stages 0xFF (was loc_2154B2)
ShopEntryTalkRow:
	ld	HL,EVENT_TALKED_SHOP
	call	CheckEventFlag
	cp	L,1
	jr	Z,ShopEntryTalkRow.skip3
	call	GetStoryStage
	cp	A,8
	jr	Z,ShopEntryTalkRow.skip2
	cp	A,0
	jr	Z,ShopEntryTalkRow.skip
	ld	W,0xFF
	jr	GetPlaceEntryTalkRowDone
ShopEntryTalkRow.skip:
	ld	W,0
	jr	GetPlaceEntryTalkRowDone
ShopEntryTalkRow.skip2:
	ld	W,4
	jr	GetPlaceEntryTalkRowDone
ShopEntryTalkRow.skip3:
	call	GetStoryStage
	cp	A,8
	jr	Z,ShopEntryTalkRow.skip5
	cp	A,0
	jr	Z,ShopEntryTalkRow.skip4
	ld	W,0xFF
	jr	GetPlaceEntryTalkRowDone
ShopEntryTalkRow.skip4:
	ld	W,3
	jr	GetPlaceEntryTalkRowDone
ShopEntryTalkRow.skip5:
	ld	W,7
	jr	GetPlaceEntryTalkRowDone

c_2154EF	section	code abs=0x2154EF

; [code] GetPlaceEntryTalkRow for place 7: W = 0 (TalkPlace7 row 0 "At the capital of Rhafiace.....")
Place7EntryTalkRow:
	ld	W,0
	jr	GetPlaceEntryTalkRowDone

c_2154F3	section	code abs=0x2154F3

; [code] GetPlaceEntryTalkRow for place 8: W = 0 (was loc_2154F3)
Place8EntryTalkRow:
	ld	W,0
	jr	GetPlaceEntryTalkRowDone

c_2154F7	section	code abs=0x2154F7

; [code] GetPlaceEntryTalkRow exit: registers restored, ret (W = row)
GetPlaceEntryTalkRowDone:
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
	calr	GetCurrentTalkRow
	ld	A,(XHL+2)
	cp	A,0
	jrl	Z,NpcTalkRowNext
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
	jrl	NpcTalkRowNext
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
	jrl	NpcTalkRowNext
NpcTalkRowAction.skip2:
	ld	HL,EVENT_STAGE_WON_RANK_CS
	call	ClearEventFlag
	call	ClearTalkedFlags
	jr	NpcTalkRowNext
NpcTalkRowAction.skip3:
	call	GetStoryStage
	cp	A,2
	jr	C,NpcTalkRowNext
	cp	A,9
	jr	NC,NpcTalkRowNext
	push	WA
	ld	WA,0xFF
	call	AddItem
	pop	WA
	jr	NpcTalkRowNext
NpcTalkRowAction.skip4:
	call	GetStoryStage
	cp	A,1
	jr	C,NpcTalkRowNext
	cp	A,9
	jr	NC,NpcTalkRowNext
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
	jr	NpcTalkRowNext

c_215609	section	code abs=0x215609

; [code] second half of NpcTalkRowAction, by the next byte (+3) of GetCurrentTalkRow: 0xFF end of talk (state 4, +0x11 = 0xFF); 0xFD / 0xFB / 0xF9 / 0xF8 TalkNextLeavePlace; 0xF5 / 0xF4 Cyrius (TASK_ARG 7, 0xF5 from step 0); 0xF3 / 0xF2 Helmut (TASK_ARG 8, 0xF3 from step 0); 0xF0 TalkNextPictureRow1; 0xEF / 0xEE fade to black then TalkGoToWorksRow0 / Works row 0xE; 0xED / 0xEC WorksProtectorScene (TASK_ARG 9, 0xED from step 0); 0xEB / 0xEA Colla (TASK_ARG 0xA, 0xEB from step 1); 0xE9 / 0xE8 / 0xE7 Tetis rows by item 0xFF count and story stage; 0xE6 TetisGift (TASK_ARG 0xB); else the next row +0x12 = next
NpcTalkRowNext:
	calr	GetCurrentTalkRow
	ld	A,(XHL+3)
	cp	A,0xFF
	jrl	Z,NpcTalkEnd
	cp	A,0xFD
	jrl	Z,TalkNextLeavePlace
	cp	A,0xFB
	jrl	Z,TalkNextLeavePlace
	cp	A,0xF9
	jrl	Z,TalkNextLeavePlace
	cp	A,0xF8
	jrl	Z,TalkNextLeavePlace
	cp	A,0xF5
	jr	Z,NpcTalkRowNext.skip
	cp	A,0xF4
	jr	Z,NpcTalkRowNext.skip2
	cp	A,0xF3
	jr	Z,NpcTalkRowNext.skip3
	cp	A,0xF2
	jr	Z,NpcTalkRowNext.skip4
	cp	A,0xF0
	jr	Z,TalkNextPictureRow1
	cp	A,0xEF
	jr	Z,TalkNextWorksRow0
	cp	A,0xEE
	jr	Z,TalkNextWorksRowE
	cp	A,0xED
	jr	Z,TalkNextProtectorStep0
	cp	A,0xEC
	jr	Z,TalkNextProtector
	cp	A,0xEB
	jr	Z,TalkNextCollaStep1
	cp	A,0xEA
	jr	Z,TalkNextColla
	cp	A,0xE9
	jr	Z,TalkNextTetisByItemCount
	cp	A,0xE8
	jrl	Z,TalkNextTetisByStage
	cp	A,0xE7
	jrl	Z,TalkNextTetisIfItem
	cp	A,0xE6
	jrl	Z,TalkNextTetisGift
	ld	(XIZ+0x12),A
	jrl	NpcTalkEnd.skip
NpcTalkRowNext.skip:
	ld	A,0
	ld	(XIZ+0x27),A
NpcTalkRowNext.skip2:
	ld	A,7
	ld	(XIZ+TASK_ARG),A
	jrl	NpcTalkEnd.skip
NpcTalkRowNext.skip3:
	ld	A,0
	ld	(XIZ+0x27),A
NpcTalkRowNext.skip4:
	ld	A,8
	ld	(XIZ+TASK_ARG),A
	jrl	NpcTalkEnd.skip

c_21569B	section	code abs=0x21569B

; [code] talk next 0xF0: +0x11 = 0xF0, talk state +0xF = 8 (TownTalkFadeOut, then TalkShowRow1Picture); used by TalkPlace7 row 0 ("At the capital of Rhafiace.....")
TalkNextPictureRow1:
	ld	A,0xF0
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jrl	NpcTalkEnd.skip

c_2156A8	section	code abs=0x2156A8

; [code] talk next 0xEF: +0x11 = 0xEF, talk state 8 (TownTalkFadeOut, then TalkGoToWorksRow0) (was loc_2156A8)
TalkNextWorksRow0:
	ld	A,0xEF
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jrl	NpcTalkEnd.skip

c_2156B5	section	code abs=0x2156B5

; [code] talk next 0xEE: +0x11 = 0xEE, talk state 8 (TownTalkFadeOut, then TalkGoToWorksRowE) (was loc_2156B5)
TalkNextWorksRowE:
	ld	A,0xEE
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jr	NpcTalkEnd.skip

c_2156C1	section	code abs=0x2156C1

; [code] talk next 0xED: +0x27 = 0, then TalkNextProtector (was loc_2156C1)
TalkNextProtectorStep0:
	ld	A,0
	ld	(XIZ+0x27),A

c_2156C6	section	code abs=0x2156C6

; [code] talk next 0xEC: TASK_ARG 9 (WorksProtectorScene) (was loc_2156C6)
TalkNextProtector:
	ld	A,9
	ld	(XIZ+TASK_ARG),A
	jr	NpcTalkEnd.skip

c_2156CD	section	code abs=0x2156CD

; [code] talk next 0xEB: +0x27 = 1, then TalkNextColla (was loc_2156CD)
TalkNextCollaStep1:
	ld	A,1
	ld	(XIZ+0x27),A

c_2156D2	section	code abs=0x2156D2

; [code] talk next 0xEA: TASK_ARG 0xA (Colla) (was loc_2156D2)
TalkNextColla:
	ld	A,0xA
	ld	(XIZ+TASK_ARG),A
	jr	NpcTalkEnd.skip

c_2156D9	section	code abs=0x2156D9

; [code] talk next 0xE9: item 0xFF count (GetInventoryByte) 2-6 -> next row 0x4E-0x52, else NpcTalkEnd (was loc_2156D9)
TalkNextTetisByItemCount:
	push	W
	ld	WA,0xFF
	call	GetInventoryByte
	pop	W
	sub	A,2
	jr	C,NpcTalkEnd
	cp	A,5
	jr	NC,NpcTalkEnd
	add	A,0x4E
	ld	(XIZ+0x12),A
	jr	NpcTalkEnd.skip

c_2156F5	section	code abs=0x2156F5

; [code] talk next 0xE8: next row = 0x49 + story stage - 3 (was loc_2156F5)
TalkNextTetisByStage:
	call	GetStoryStage
	sub	A,3
	add	A,0x49
	ld	(XIZ+0x12),A
	jr	NpcTalkEnd.skip

c_215704	section	code abs=0x215704

; [code] talk next 0xE7: next row 0x53 when item 0xFF count != 0, else NpcTalkEnd (was loc_215704)
TalkNextTetisIfItem:
	push	W
	ld	WA,0xFF
	call	GetInventoryByte
	pop	W
	cp	A,0
	jr	Z,NpcTalkEnd
	ld	A,0x53
	ld	(XIZ+0x12),A
	jr	NpcTalkEnd.skip

c_21571A	section	code abs=0x21571A

; [code] talk next 0xE6: TASK_ARG 0xB (TetisGift) (was loc_21571A)
TalkNextTetisGift:
	ld	A,0xB
	ld	(XIZ+TASK_ARG),A
	jr	NpcTalkEnd.skip

c_215721	section	code abs=0x215721

; [code] talk nexts 0xFD / 0xFB / 0xF9 / 0xF8: +0x11 = 0xFD - next (0, 2, 4, 5), talk state +0xF = 4 (TownTalkEnded leaves the place with it: TownPlaceTaskEnd copies +0x11 to wTownPlaceResult)
TalkNextLeavePlace:
	ld	W,0xFD
	sub	W,A
	ld	(XIZ+0x11),W
	ld	A,4
	ld	(XIZ+0xF),A
	jr	NpcTalkEnd.skip

c_21572F	section	code abs=0x21572F

; [code] talk next 0xFF: talk state 4, +0x11 = 0xFF (end of talk); .skip is the common exit of NpcTalkRowNext (ResetTalkRowPhase, registers restored) (was loc_21572F)
NpcTalkEnd:
	ld	A,4
	ld	(XIZ+0xF),A
	ld	A,0xFF
	ld	(XIZ+0x11),A
NpcTalkEnd.skip:
	calr	ResetTalkRowPhase
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215741	section	code abs=0x215741

; [code] task +0x25 = 0: the talk text step (TownTalkMessageDone) starts row +0x12 next (TownTalkStartRow) instead of running its row action; A saved; byte-identical copy of ArenaSceneCmdDone (the ROM has each)
ResetTalkRowPhase:
	push	A
	ld	A,0
	ld	(XIZ+0x25),A
	pop	A
	ret

c_215749	section	code abs=0x215749

; [code] talk row +0x12 = 0xFF (GetPlaceEntryTalkRow picks it unless the caller sets one), +0x25 = 0, talk state +0xF = 2, TASK_ARG 6 (TownTalkDispatch); callers TalkMenuSelect, StartPlaceEntryTalk
StartTownTalk:
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

; [code] town place task state 5 (entering the Works or the Shop, places 5-8): GetPlaceEntryTalkRow; none (0xFF) -> +0x11 = 1 for the Works (StreetGoWorks opens RunWorksScreen), 3 for the Shop (RunShopScreen), else 0, TASK_ARG 0xC (TownPlaceTaskEnd); else StartPlaceEntryTalk
TownPlaceEnter:
	calr	GetPlaceEntryTalkRow
	cp	W,0xFF
	jr	NZ,StartPlaceEntryTalk
	ld	A,(XIZ+0x15)
	cp	A,5
	jr	Z,TownPlaceEnter.skip
	cp	A,6
	jr	Z,TownPlaceEnter.skip2
	ld	A,0
	jr	TownPlaceEnter.skip3
TownPlaceEnter.skip:
	ld	A,1
	jr	TownPlaceEnter.skip3
TownPlaceEnter.skip2:
	ld	A,3
	jr	TownPlaceEnter.skip3
TownPlaceEnter.skip3:
	ld	(XIZ+0x11),A
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jrl	StartRhafiacePictureTalk.done

c_21578A	section	code abs=0x21578A

; [code] W = row: StartTownTalk, +0x12 = W, OpenBoxes123; places 7 / 8 -> StartRhafiacePictureTalk; else DrawTownPlace, PlaceBoxes123, +0x13 = 0, SetupWindowIris / StartWindowAnimToA / ApplyWindowA, the Works (5) StartPlaceEntryTalkWorks, the Shop (6) PlayMusic 3 + sound 0x23
StartPlaceEntryTalk:
	calr	StartTownTalk
	ld	(XIZ+0x12),W
	call	OpenBoxes123
	ld	A,(XIZ+0x15)
	cp	A,7
	jr	Z,StartRhafiacePictureTalk
	cp	A,8
	jr	Z,StartRhafiacePictureTalk
	calr	DrawTownPlace
	call	PlaceBoxes123
	ld	A,0
	ld	(XIZ+0x13),A
	call	SetupWindowIris
	call	StartWindowAnimToA
	call	ApplyWindowA
	ld	A,(XIZ+0x15)
	cp	A,5
	jr	Z,StartPlaceEntryTalkWorks
	cp	A,6
	jr	NZ,StartPlaceEntryTalkDone
	ld	XWA,3
	call	PlayMusic
	ld	WA,0x23
	call	SoundCommand
	jr	StartPlaceEntryTalkDone

c_2157D2	section	code abs=0x2157D2

; [code] StartPlaceEntryTalk for the Works: PlayMusic 2, sound 0x22
StartPlaceEntryTalkWorks:
	ld	XWA,2
	call	PlayMusic
	ld	WA,0x22
	call	SoundCommand
	jr	StartPlaceEntryTalkDone

c_2157E1	section	code abs=0x2157E1

; [code] StartPlaceEntryTalk exit: jr to the ret
StartPlaceEntryTalkDone:
	jr	StartRhafiacePictureTalk.done

c_2157E3	section	code abs=0x2157E3

; [code] StartPlaceEntryTalk for places 7 / 8 (TalkPlace7 / TalkPlace8, both opening "At the capital of Rhafiace"): the row's picture (+1) full screen (DrawPortrait at 0, 0, GetPictureFirstTile), PlaceBox1, +0x13 = 0, PlayMusic 4, sound 0x24, SetFadeBlack, talk state +0xF = 7 (TownTalkFadeIn), +0x2D = 0
; [play] seen in play at the start of the game (Works at story stage 0): "At the capital of Rhafiace...", then the elder Helmut tells the player he took up his mantle 10 years ago
StartRhafiacePictureTalk:
	ld	W,(XIZ+0x15)
	ld	A,(XIZ+0x12)
	calr	GetTalkRow
	ld	L,(XHL+1)
	extz	HL
	call	GetPictureFirstTile
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	call	PlaceBox1
	ld	A,0
	ld	(XIZ+0x13),A
	ld	XWA,4
	call	PlayMusic
	ld	WA,0x24
	call	SoundCommand
	call	SetFadeBlack
	ld	A,7
	ld	(XIZ+0xF),A
	ld	A,0
	ld	(XIZ+0x2D),A
StartRhafiacePictureTalk.done:
	ret

c_215822	section	code abs=0x215822

; [code] talk state 3 (each frame), on text box 1: while +0x23 != 0xFF counts +0x24 down, then restores the box speed +0x10 from +0x23; message done (box pointer +8 = 0) -> TownTalkMessageDone; box waiting (+0x12 & 0x7F = 2) -> +0x26 = 1; B at place 7 -> ResetTextBox, ResetTalkRowPhase, +0x11 = 0xEF, state 8 (skips the capital scene to the Works); else TownTalkCheckSpeedUp
TownTalkTextStep:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	C,(XIZ+0x23)
	cp	C,0xFF
	jr	Z,TownTalkTextStep.skip
	ld	B,(XIZ+0x24)
	dec	1,B
	ld	(XIZ+0x24),B
	jrl	NZ,TownTalkStartRow.skip3
	ld	A,1
	call	GetTextBox
	ld	(XWA+0x10),C
	ld	A,0xFF
	ld	(XIZ+0x23),A
TownTalkTextStep.skip:
	ld	A,1
	call	GetTextBox
	ld	XHL,(XWA+8)
	cp	XHL,0
	jr	Z,TownTalkMessageDone
	ld	C,(XWA+0x12)
	and	C,0x7F
	cp	C,2
	jr	NZ,TownTalkTextStep.skip2
	ld	A,1
	ld	(XIZ+0x26),A
TownTalkTextStep.skip2:
	ld	A,(wJoyPressed)
	cp	A,B_BUTTON
	jr	NZ,TownTalkCheckSpeedUp
	ld	A,(XIZ+0x15)
	cp	A,7
	jr	NZ,TownTalkCheckSpeedUp
	ld	A,1
	call	ResetTextBox
	calr	ResetTalkRowPhase
	ld	A,0xEF
	ld	(XIZ+0x11),A
	ld	A,8
	ld	(XIZ+0xF),A
	jrl	TownTalkStartRow.skip3

c_21588D	section	code abs=0x21588D

; [code] A or B pressed: after a box wait (+0x26 = 1) only clears +0x26; else TownTalkSpeedUpText
TownTalkCheckSpeedUp:
	ld	A,(wJoyPressed)
	and	A,A_BUTTON|B_BUTTON
	jrl	Z,TownTalkStartRow.skip3
	ld	A,(XIZ+0x26)
	cp	A,0
	jr	Z,TownTalkSpeedUpText
	ld	A,0
	ld	(XIZ+0x26),A
	jr	TownTalkStartRow.skip3

c_2158A5	section	code abs=0x2158A5

; [code] A / B while text box 1 prints: +0x23 = its speed +0x10, +0x24 = speed + 1 frames, speed = 0 (TownTalkTextStep restores it after +0x24 frames)
TownTalkSpeedUpText:
	ld	A,1
	call	GetTextBox
	ld	C,(XWA+0x10)
	ld	(XIZ+0x23),C
	inc	1,C
	ld	(XIZ+0x24),C
	ld	C,0
	ld	(XWA+0x10),C
	jr	TownTalkStartRow.skip3

c_2158BD	section	code abs=0x2158BD

; [code] text box 1 message done: +0x25 != 0 -> +0x25 = 1, NpcTalkRowAction (the row's flag and next); else TownTalkStartRow
TownTalkMessageDone:
	ld	A,(XIZ+0x25)
	cp	A,0
	jr	Z,TownTalkStartRow
	ld	A,1
	ld	(XIZ+0x25),A
	calr	NpcTalkRowAction
	jr	TownTalkStartRow.skip3

c_2158CE	section	code abs=0x2158CE

; [code] row +0x12 (0xFF -> GetPlaceEntryTalkRow), passed through TownNpcTalk, UpdateTalkSpeakerPortrait, message +4 of GetCurrentTalkRow into text box 1 (below 0x58 an offset into TalkGenderTexts + 4 * IsPlayerMale), +0x26 = 0, +0x25 = 2
TownTalkStartRow:
	ld	W,(XIZ+0x12)
	cp	W,0xFF
	jr	NZ,TownTalkStartRow.skip
	calr	GetPlaceEntryTalkRow
	ld	(XIZ+0x12),W
TownTalkStartRow.skip:
	ld	W,(XIZ+0x12)
	calr	TownNpcTalk
	ld	(XIZ+0x12),W
	calr	UpdateTalkSpeakerPortrait
	calr	GetCurrentTalkRow
	ld	XHL,(XHL+4)
	cp	XHL,0x58
	jr	NC,TownTalkStartRow.skip2
	call	IsPlayerMale
	extz	WA
	extz	XWA
	sll	2,XWA
	add	XHL,XWA
	ld	XWA,TalkGenderTexts
	add	XHL,XWA
	ld	XHL,(XHL)
TownTalkStartRow.skip2:
	ld	A,1
	call	GetTextBox
	ld	(XWA+8),XHL
	ld	A,0
	ld	(XIZ+0x26),A
	ld	A,2
	ld	(XIZ+0x25),A
TownTalkStartRow.skip3:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_215924	section	code abs=0x215924

; [code] town place task state 6 (the talk), by talk state +0xF: 1 -> 2; 2 -> 3; 3 TownTalkTextStep; 4 TownTalkEnded; 5 -> 6; 6 -> 3; 7 TownTalkFadeIn; 8 TownTalkFadeOut; 9 / 0xA TownTalkWindowOpen; other -> 1; +0x2D += 1
TownTalkDispatch:
	ld	A,(XIZ+0xF)
	cp	A,1
	jr	NZ,TownTalkState2
	ld	A,2
	ld	(XIZ+0xF),A
	jrl	TownTalkWindowOpen.skip3

c_215933	section	code abs=0x215933

; [code] TownTalkDispatch case chain: talk state 2 -> 3, and state 3 runs TownTalkTextStep
TownTalkState2:
	cp	A,2
	jr	NZ,TownTalkState2.skip
	ld	A,3
	ld	(XIZ+0xF),A
TownTalkState2.skip:
	cp	A,3
	jr	NZ,TownTalkEnded
	calr	TownTalkTextStep
	jrl	TownTalkWindowOpen.skip3

c_215946	section	code abs=0x215946

; [code] talk state 4 (talk over): ClearTalkPortraitArea; +0x11 0-5 -> TownTalkLeavePlace; else ShowTalkMenu again with the cursor +0x10 on the NPC talked to (+0x1B)
TownTalkEnded:
	cp	A,4
	jr	NZ,TownTalkState5
	calr	ClearTalkPortraitArea
	ld	A,(XIZ+0x11)
	cp	A,0
	jr	Z,TownTalkLeavePlace
	cp	A,1
	jr	Z,TownTalkLeavePlace
	cp	A,2
	jr	Z,TownTalkLeavePlace
	cp	A,3
	jr	Z,TownTalkLeavePlace
	cp	A,4
	jr	Z,TownTalkLeavePlace
	cp	A,5
	jr	Z,TownTalkLeavePlace
	calr	ShowTalkMenu
	ld	A,(XIZ+0x1B)
	ld	(XIZ+0x10),A
	jrl	TownTalkWindowOpen.skip3

c_215974	section	code abs=0x215974

; [code] EraseBoxes123, TASK_ARG 0xC (TownPlaceTaskEnd: wTownPlaceResult = +0x11)
TownTalkLeavePlace:
	call	EraseBoxes123
	ld	A,0xC
	ld	(XIZ+TASK_ARG),A
	jrl	TownTalkWindowOpen.skip3

c_215980	section	code abs=0x215980

; [code] TownTalkDispatch case chain: talk state 5 -> 6
TownTalkState5:
	cp	A,5
	jr	NZ,TownTalkState6
	ld	A,6
	ld	(XIZ+0xF),A
	jrl	TownTalkWindowOpen.skip3

c_21598C	section	code abs=0x21598C

; [code] TownTalkDispatch case chain: talk state 6 -> 3
TownTalkState6:
	cp	A,6
	jr	NZ,TownTalkFadeIn
	ld	A,3
	ld	(XIZ+0xF),A
	jrl	TownTalkWindowOpen.skip3

c_215998	section	code abs=0x215998

; [code] talk state 7: FadeInFromBlackStep(2), when done state 3
TownTalkFadeIn:
	cp	A,7
	jr	NZ,TownTalkFadeOut
	ld	A,2
	call	FadeInFromBlackStep
	cp	A,1
	jrl	Z,TownTalkWindowOpen.skip3
	ld	A,3
	ld	(XIZ+0xF),A
	jrl	TownTalkWindowOpen.skip3

c_2159AF	section	code abs=0x2159AF

; [code] talk state 8: FadeToBlackStep(2); when black, by +0x11: 0xF0 TalkShowRow1Picture, 0xEF TalkGoToWorksRow0, 0xEE the Works row 0xE (window opening horizontally), else state 3
TownTalkFadeOut:
	cp	A,8
	jrl	NZ,TownTalkWindowOpen
	ld	A,2
	call	FadeToBlackStep
	cp	A,1
	jrl	Z,TownTalkWindowOpen.skip3
	ld	A,(XIZ+0x11)
	cp	A,0xF0
	jr	Z,TalkShowRow1Picture
	cp	A,0xEF
	jr	Z,TalkGoToWorksRow0
	cp	A,0xEE
	jrl	Z,TalkGoToWorksRowE
	ld	A,3
	ld	(XIZ+0xF),A
	jrl	TownTalkWindowOpen.skip3

c_2159DB	section	code abs=0x2159DB

; [code] after talk next 0xF0 and the fade to black: row +0x12 = 1, ClearScr1Tilemap, ClearTextBox1, the row's picture (+1) full screen (DrawPortrait), its speaker at 4, 0x20 (DrawPortraitAt, GetPortraitFirstTile), +0x13 = speaker, state 7 (TownTalkFadeIn); used by TalkPlace7 (row 1: Helmut "It has been 10 years since y...")
TalkShowRow1Picture:
	ld	A,1
	ld	(XIZ+0x12),A
	call	ClearScr1Tilemap
	call	ClearTextBox1
	ld	W,(XIZ+0x15)
	ld	A,(XIZ+0x12)
	calr	GetTalkRow
	ld	L,(XHL+1)
	extz	HL
	call	GetPictureFirstTile
	ld	BC,0
	ld	DE,0
	call	DrawPortrait
	calr	GetCurrentTalkRow
	ld	A,(XHL+0)
	ld	(XIZ+0x13),A
	ld	L,A
	exts	HL
	ld	BC,4
	ld	DE,0
	add	E,0x20
	call	GetPortraitFirstTile
	call	DrawPortraitAt
	ld	A,7
	ld	(XIZ+0xF),A
	jrl	TownTalkWindowOpen.skip3

c_215A26	section	code abs=0x215A26

; [code] after talk next 0xEF and the fade to black (TalkPlace7 row 1, or B in place 7): ClearScr1Tilemap, ClearTextBox1, PlaceBox2 / PlaceBox3, place +0x15 = 5 (Works), row +0x12 = 0, DrawTownPlace, UpdateTalkSpeakerPortrait, window opening vertically (SetupWindowOpenVertical, ApplyWindowB, StartWindowAnimToA), SetFadeNormal, PlayMusic 2, state 9 (TownTalkWindowOpen)
TalkGoToWorksRow0:
	call	ClearScr1Tilemap
	call	ClearTextBox1
	call	PlaceBox2
	call	PlaceBox3
	ld	A,5
	ld	(XIZ+0x15),A
	ld	A,0
	ld	(XIZ+0x12),A
	calr	DrawTownPlace
	calr	UpdateTalkSpeakerPortrait
	call	SetupWindowOpenVertical
	call	ApplyWindowB
	call	StartWindowAnimToA
	call	SetFadeNormal
	ld	XWA,2
	call	PlayMusic
	ld	A,9
	ld	(XIZ+0xF),A
	jrl	TownTalkWindowOpen.skip3

c_215A64	section	code abs=0x215A64

; [code] after talk next 0xEE and the fade to black: like TalkGoToWorksRow0 but row +0x12 = 0xE, window opening horizontally (SetupWindowOpenHorizontal), state 0xA (was loc_215A64)
TalkGoToWorksRowE:
	call	ClearScr1Tilemap
	call	ClearTextBox1
	call	PlaceBox2
	call	PlaceBox3
	ld	A,5
	ld	(XIZ+0x15),A
	ld	A,0xE
	ld	(XIZ+0x12),A
	calr	DrawTownPlace
	calr	UpdateTalkSpeakerPortrait
	call	SetupWindowOpenHorizontal
	call	ApplyWindowB
	call	StartWindowAnimToA
	call	SetFadeNormal
	ld	XWA,2
	call	PlayMusic
	ld	A,0xA
	ld	(XIZ+0xF),A
	jr	TownTalkWindowOpen.skip3

c_215AA1	section	code abs=0x215AA1

; [code] talk states 9 / 0xA: UpdateWindowAnim until done, then PlayMusic 2, sound 0x22, state 3; any other state -> 1 (and +0x2D += 1)
TownTalkWindowOpen:
	cp	A,9
	jr	NZ,TownTalkWindowOpen.skip
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,TownTalkWindowOpen.skip3
	ld	XWA,2
	call	PlayMusic
	ld	WA,0x22
	call	SoundCommand
	ld	A,3
	ld	(XIZ+0xF),A
	jr	TownTalkWindowOpen.skip3
TownTalkWindowOpen.skip:
	cp	A,0xA
	jr	NZ,TownTalkWindowOpen.skip2
	call	UpdateWindowAnim
	cp	A,1
	jr	Z,TownTalkWindowOpen.skip3
	ld	XWA,2
	call	PlayMusic
	ld	WA,0x22
	call	SoundCommand
	ld	A,3
	ld	(XIZ+0xF),A
	jr	TownTalkWindowOpen.skip3
TownTalkWindowOpen.skip2:
	ld	A,1
	ld	(XIZ+0xF),A
TownTalkWindowOpen.skip3:
	ld	A,(XIZ+0x2D)
	inc	1,A
	ld	(XIZ+0x2D),A
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

; [code] A = how many of event flags 0x10-0x13 (EVENT_EMBLEM_*) are set; caller TownNpcTalk (Cyrius: 0 -> his usual rows; 4 with EVENT_CYRIUS_TOLD_LORDS set -> trade rows 0x13 / 0x1B)
CountEmblemFlags:
	push	XHL
	push	BC
	push	W
	ld	HL,0x10
	ld	A,0
	ld	W,4
CountEmblemFlags.loop:
	push	HL
	push	WA
	call	CheckEventFlag
	pop	WA
	add	A,L
	pop	HL
	inc	1,HL
	djnz	W,CountEmblemFlags.loop
	pop	W
	pop	BC
	pop	XHL
	ret
