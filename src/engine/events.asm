; engine/events: 7 routines (each keeps its ROM address in its own section)

c_2168C7	section	code abs=0x2168C7

; [code] clears event flags 0-11
ClearStoryStage:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_STAGE_TOWN
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_ARENA_OPEN
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_E
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_D
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_C
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_B
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_A
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_S
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_CS
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_LILY
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_ENDING
	call	ClearEventFlag
	ld	HL,EVENT_STAGE_WON_RANK_X
	call	ClearEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_21691A	section	code abs=0x21691A

; [code] clears every EVENT_TALKED_* flag 0x40-0x4E; ArenaSceneEnd, NpcTalkRowAction, CreditsScreen
ClearTalkedFlags:
	push	XHL
	push	BC
	push	A
	ld	HL,EVENT_TALKED_JON
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_LILY
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_CYRIUS
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_SHOP
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_LANA
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_WYSE
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_ZIGGY
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_CEUS
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_HELMUT
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_ALDA
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_CAMIL
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_MEESE
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_COLLA
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_TETIS
	call	ClearEventFlag
	ld	HL,EVENT_TALKED_WORKS
	call	ClearEventFlag
	pop	A
	pop	BC
	pop	XHL
	ret

c_216A94	section	code abs=0x216A94

; [code] A = EVENT_STAGE_ENDING
CheckStageEnding:
	push	XHL
	push	BC
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	ld	A,L
	pop	BC
	pop	XHL
	ret

c_216AA2	section	code abs=0x216AA2

; [code] A = highest event flag 1-11 that is set, else 0
GetStoryStage:
	push	XHL
	push	BC
	ld	HL,EVENT_STAGE_WON_RANK_X
GetStoryStage.loop:
	push	HL
	call	CheckEventFlag
	cp	L,1
	pop	HL
	jr	Z,GetStoryStage.skip
	sub	HL,1
	jr	NZ,GetStoryStage.loop
GetStoryStage.skip:
	ld	A,L
	pop	BC
	pop	XHL
	ret

c_216ABC	section	code abs=0x216ABC

; [code] A = StageArenaRank[GetStoryStage]
GetStageArenaRank:
	push	XHL
	push	W
	call	GetStoryStage
	extz	WA
	extz	XWA
	ld	XHL,StageArenaRank
	add	XHL,XWA
	ld	A,(XHL)
	pop	W
	pop	XHL
	ret

c_216AD4	section	code abs=0x216AD4

; [code+play] sets flag StageFlags[A], wArenaRank from the new stage
SetStoryStage:
	push	XHL
	push	BC
	push	XWA
	call	ClearStoryStage
	extz	WA
	extz	XWA
	ld	XHL,StageFlags
	add	XHL,XWA
	ld	L,(XHL)
	extz	HL
	call	SetEventFlag
	call	GetStageArenaRank
	ld	(wArenaRank),A
	pop	XWA
	pop	BC
	pop	XHL
	ret

c_216AFA	section	code abs=0x216AFA

; [code] stage + 1 while below 9
AdvanceStoryStage:
	push	A
	call	GetStageArenaRank
	cp	A,9
	jr	NC,AdvanceStoryStage.skip
	inc	1,A
	call	SetStoryStage
AdvanceStoryStage.skip:
	pop	A
	ret
