; engine/tables: 61 routines (each keeps its ROM address in its own section)

c_208220	section	code abs=0x208220

; [code] affinity -> glyph code from AffinityIconChars (the AT icon)
GetAffinityIcon:
	push	WA
	ld	WA,HL
	call	AffinityIndex
	ld	XHL,AffinityIconChars
	ld	L,(XHL+WA)
	extz	HL
	pop	WA
	ret
AffinityIconChars:
	db	0x6C,0x6E,0x6D,0x70,0x6F,0x6A,0x6B,0x73

c_208272	section	code abs=0x208272

; L = item id -> ItemNames + 7*(id-1)
GetItemName:
	ld	H,0
	dec	1,HL
	mul	XHL,7
	add	XHL,ItemNames
	ret

c_208281	section	code abs=0x208281

; -> ItemDescs + 19*(id-1)
GetItemDesc:
	ld	H,0
	dec	1,HL
	mul	XHL,0x13
	add	XHL,ItemDescs
	ret

c_208290	section	code abs=0x208290

; [code] L = item id (38+) -> 0x224612 + 4*(id-38)
GetBattleItemEffect:
	sub	L,0x26
	ld	H,0
	mul	XHL,4
	add	XHL,BattleItemEffects
	ret

c_2082A0	section	code abs=0x2082A0

; L = enemy id -> XHL = EnemyNames + 7*(id-1)
GetEnemyName:
	ld	H,0
	dec	1,HL
	mul	XHL,7
	add	XHL,EnemyNames
	ret

c_2082AF	section	code abs=0x2082AF

; L = enemy id -> XHL = EnemyStats + 26*(id-1)
GetEnemyRecord:
	ld	H,0
	dec	1,HL
	mul	XHL,0x1A
	add	XHL,EnemyStats
	ret

c_2082BE	section	code abs=0x2082BE

; HL = image id -> XHL = ImageTable[235 + id-1] (pointer read)
GetMonsterImage:
	dec	1,HL
	extz	XHL
	sll	2,XHL
	add	XHL,MonsterImages
	ld	XHL,(XHL)
	ret

c_2082CE	section	code abs=0x2082CE

; [code] HL = image id -> MonsterPalettes + 8*(id-1)
GetMonsterPalette:
	dec	1,HL
	extz	XHL
	sll	3,XHL
	add	XHL,MonsterPalettes
	ret

c_2082DC	section	code abs=0x2082DC

; L = attack id -> AttackNames + 7*(id-1)
GetAttackName:
	ld	H,0
	dec	1,HL
	mul	XHL,7
	add	XHL,AttackNames
	ret

c_2082EB	section	code abs=0x2082EB

; L = enemy id -> EnemyAttacks + 60*(id-1)
GetEnemyAttackSlots:
	ld	H,0
	dec	1,HL
	mul	XHL,0x3C
	add	XHL,EnemyAttacks
	ret

c_2082FA	section	code abs=0x2082FA

; L = part id -> PartNames + 7*(id-1)
GetPartName:
	ld	H,0
GetPartName.withHL:
	dec	1,HL
	mul	XHL,7
	add	XHL,PartNames
	ret

c_208309	section	code abs=0x208309

; L = id within category -> PartName(id + first id of category)
GetBodyName:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart)
	jp	GetPartName.withHL

c_208316	section	code abs=0x208316

GetCoreName:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x2)
	jp	GetPartName.withHL

c_208323	section	code abs=0x208323

GetLegsName:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x4)
	jp	GetPartName.withHL

c_208330	section	code abs=0x208330

GetBackName:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x6)
	jp	GetPartName.withHL

c_20833D	section	code abs=0x20833D

GetArmName:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x8)
	jp	GetPartName.withHL

c_20834A	section	code abs=0x20834A

; -> PartDescs entry of an arm
GetArmDesc:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x8)
	dec	1,HL
	mul	XHL,0x13
	add	XHL,PartDescs
	ret

c_208360	section	code abs=0x208360

; L = part id -> PartStats + 24*(id-1)
GetPartRecord:
	ld	H,0

c_208362	section	code abs=0x208362

; [code] HL = part id (1-based) -> XHL = PartStats + 24 * (id - 1); tail of GetPartRecord and the Get*Record category routines (was loc_208362)
GetPartRecordHL:
	dec	1,HL
	mul	XHL,0x18
	add	XHL,PartStats
	ret

c_20836F	section	code abs=0x20836F

; category-relative PartRecord
GetBodyRecord:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart)
	jp	GetPartRecordHL

c_20837C	section	code abs=0x20837C

GetCoreRecord:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x2)
	jp	GetPartRecordHL

c_208389	section	code abs=0x208389

GetLegsRecord:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x4)
	jp	GetPartRecordHL

c_208396	section	code abs=0x208396

GetBackRecord:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x6)
	jp	GetPartRecordHL

c_2083A3	section	code abs=0x2083A3

GetArmRecord:
	ld	H,0
	dec	1,HL
	add	HL,(PartCategoryStart+0x8)
	jp	GetPartRecordHL

c_2083BF	section	code abs=0x2083BF

; L = skill id -> SkillNames + 7*(id-1)
GetSkillName:
	ld	H,0
	dec	1,HL
	mul	XHL,7
	add	XHL,SkillNames
	ret

c_2083CE	section	code abs=0x2083CE

; -> SkillDescs + 19*(id-1)
GetSkillDesc:
	ld	H,0
	dec	1,HL
	mul	XHL,0x13
	add	XHL,SkillDescs
	ret

c_2083DD	section	code abs=0x2083DD

; -> SkillStats + 18*(id-1)
GetSkillRecord:
	ld	H,0
	dec	1,HL
	mul	XHL,0x12
	add	XHL,SkillStats
	ret

c_2083EC	section	code abs=0x2083EC

; -> SkillData + 8*(id-1)
GetSkillData:
	ld	H,0
	dec	1,HL
	mul	XHL,8
	add	XHL,SkillData
	ret

c_20840A	section	code abs=0x20840A

; -> XHL = EnemyScaling row for wAreaLevel (and event flags)
GetEnemyScaling:
	push	XBC
	push	XDE
	ld	XBC,0
	ld	C,(wAreaLevel)
	dec	1,C
	jr	PL,GetEnemyScaling.skip
	ld	C,0
GetEnemyScaling.skip:
	cp	C,7
	jr	C,GetEnemyScaling.skip2
	ld	C,7
GetEnemyScaling.skip2:
	mul	XBC,0xE
	ld	XDE,EnemyScaling+0x70
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	jr	NZ,GetEnemyScaling.skip3
	ld	HL,EVENT_STAGE_WON_RANK_X
	call	CheckEventFlag
	jr	NZ,GetEnemyScaling.skip3
	ld	XDE,EnemyScaling
GetEnemyScaling.skip3:
	add	XBC,XDE
	ld	XHL,XBC
	pop	XDE
	pop	XBC
	cpb	(wEnemyId),ENEMY_ENT
	ret	C
	cpb	(wEnemyId),ENEMY_ALEX
	jr	C,GetEnemyScaling.skip4
	cpb	(wEnemyId),ENEMY_FENRIL
	ret	C
GetEnemyScaling.skip4:
	push	XHL
	ld	HL,EVENT_STAGE_ENDING
	call	CheckEventFlag
	jr	NZ,GetEnemyScaling.skip5
	ld	HL,EVENT_STAGE_WON_RANK_X
	call	CheckEventFlag
	jr	NZ,GetEnemyScaling.skip5
	pop	XHL
	ret
GetEnemyScaling.skip5:
	pop	XHL
	ld	XHL,EnemyScaling+0xD2
	ret

c_2106A1	section	code abs=0x2106A1

; [code] BC, DE = DungeonSelectCursor[DUNGEON_ID] (x, y)
GetDungeonSelectCursor:
	push	XHL
	push	XWA
	ld	XWA,0
	ld	A,(XIZ+0x10)
	sll	2,XWA
	ld	XHL,DungeonSelectCursor
	add	XHL,XWA
	ld	BC,(XHL)
	inc	2,XHL
	ld	DE,(XHL)
	pop	XWA
	pop	XHL
	ret

c_212BAB	section	code abs=0x212BAB

; [code] A = encounter_enemies list (encounters/ line (DUNGEON_ID-1)*7 + floor)[Random() % count]
GetEncounterEnemy:
	push	XHL
	push	XDE
	push	XBC
	ld	XWA,0
	ld	A,(XIZ+0x10)
	sub	A,1
	mul	XWA,7
	ld	XDE,XWA
	ld	XWA,0
	ld	A,(XIZ+0x11)
	sub	A,1
	add	XDE,XWA
	ld	XHL,EncounterCounts
	add	XHL,XDE
	ld	B,(XHL)
	call	Random
	ld	W,0
	div	WA,B
	ld	B,W
	ld	XHL,EncounterLists
	sll	2,XDE
	add	XHL,XDE
	ld	XHL,(XHL)
	ld	XWA,0
	ld	A,B
	add	XHL,XWA
	ld	A,(XHL)
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2132FC	section	code abs=0x2132FC

; [code] A = scene; A < 0x50 returned as is, else A = ArenaGenderScenes[(A-0x50) + IsPlayerMale] (female/male byte pairs, arena_gender_scenes.asm header already documents this routine); ArenaSceneEnd (ArenaSceneCmdGenderScene) stores the result in task +0x12 (scene)
GetArenaGenderScene:
	push	XHL
	push	XDE
	push	XBC
	push	W
	cp	A,0x50
	jr	C,GetArenaGenderScene.skip
	sub	A,0x50
	extz	WA
	extz	XWA
	ld	XHL,ArenaGenderScenes
	add	XHL,XWA
	call	IsPlayerMale
	extz	WA
	extz	XWA
	add	XHL,XWA
	ld	A,(XHL)
GetArenaGenderScene.skip:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213326	section	code abs=0x213326

; [code] W = Arena talk row (StageRequiredTalks, EVENT_JON_NOT_READY_SEEN 0x3F/0x40, stage, rank); FF unless TASK_ARG 3
GetArenaTalkRow:
	push	XHL
	push	XDE
	push	XBC
	ld	A,(XIZ+TASK_ARG)
	cp	A,3
	jr	Z,GetArenaTalkRow.skip
	ld	W,0xFF
	jrl	GetArenaTalkRow.skip15
GetArenaTalkRow.skip:
	call	CheckStageEnding
	cp	A,1
	jr	NZ,GetArenaTalkRow.skip2
	call	CheckTalkedJon
	cp	A,0
	jrl	Z,GetArenaTalkRow.skip14
GetArenaTalkRow.skip2:
	call	GetStoryStage
	extz	WA
	extz	XWA
	ld	XHL,StageRequiredTalkCounts
	add	XHL,XWA
	ld	C,(XHL)
	cp	C,0
	jr	Z,GetArenaTalkRow.skip4
	sll	2,XWA
	ld	XHL,StageRequiredTalks
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	B,1
GetArenaTalkRow.loop:
	push	XHL
	push	BC
	ld	L,(XHL)
	extz	HL
	call	CheckEventFlag
	pop	BC
	and	B,L
	pop	XHL
	inc	1,XHL
	djnz	C,GetArenaTalkRow.loop
	cp	B,1
	jr	Z,GetArenaTalkRow.skip4
	call	CheckJonNotReadySeen
	cp	A,1
	jr	Z,GetArenaTalkRow.skip3
	ld	W,0x3F
	jrl	GetArenaTalkRow.skip15
GetArenaTalkRow.skip3:
	ld	W,0x40
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip4:
	call	GetStageArenaRank
	cp	A,9
	jr	Z,GetArenaTalkRow.skip5
	call	CheckStageEnding
	cp	A,1
	jr	Z,GetArenaTalkRow.skip13
	call	CheckStageLily
	cp	A,1
	jr	Z,GetArenaTalkRow.skip11
	call	GetStageArenaRank
	cp	A,8
	jr	Z,GetArenaTalkRow.skip9
	call	GetStageArenaRank
	cp	A,0
	jr	Z,GetArenaTalkRow.skip7
	cp	A,2
	jr	NC,GetArenaTalkRow.skip5
	call	CheckTalkedJon
	cp	A,0
	jr	Z,GetArenaTalkRow.skip6
GetArenaTalkRow.skip5:
	ld	W,0
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip6:
	ld	W,0xF
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip7:
	call	CheckTalkedJon
	cp	A,0
	jr	Z,GetArenaTalkRow.skip8
	ld	W,0xE
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip8:
	ld	W,0xD
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip9:
	call	CheckTalkedJon
	cp	A,0
	jr	Z,GetArenaTalkRow.skip10
	ld	W,0x38
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip10:
	ld	W,0x38
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip11:
	call	CheckTalkedJon
	cp	A,0
	jr	Z,GetArenaTalkRow.skip12
	ld	W,5
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip12:
	ld	W,0x39
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip13:
	call	CheckTalkedJon
	cp	A,0
	jr	Z,GetArenaTalkRow.skip14
	ld	W,0
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip14:
	ld	W,0x3B
	jr	GetArenaTalkRow.skip15
GetArenaTalkRow.skip15:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_213413	section	code abs=0x213413

; [code] W = ArenaRankFirstScene[task+0x15 - 2] (through GetArenaGenderScene when < 0x70) if the chosen rank task+0x15 > GetStageArenaRank, else scene 2 (scene 3 when stage rank = 9); only caller ArenaRoundsComplete stores W in task +0x12 (scene); matches arena_first_scenes.asm header
GetArenaRankFirstScene:
	push	XHL
	push	XDE
	push	XBC
	call	GetStageArenaRank
	ld	W,(XIZ+0x15)
	cp	A,W
	jr	NC,GetArenaRankFirstScene.skip
	ld	A,W
	sub	A,2
	extz	WA
	extz	XWA
	ld	XHL,ArenaRankFirstScene
	add	XHL,XWA
	ld	W,(XHL)
	cp	W,0x70
	jr	NC,GetArenaRankFirstScene.skip3
	ld	A,W
	calr	GetArenaGenderScene
	ld	W,A
	jr	GetArenaRankFirstScene.skip3
GetArenaRankFirstScene.skip:
	cp	A,9
	jr	Z,GetArenaRankFirstScene.skip2
	ld	W,2
	jr	GetArenaRankFirstScene.skip3
GetArenaRankFirstScene.skip2:
	ld	W,3
GetArenaRankFirstScene.skip3:
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_214D97	section	code abs=0x214D97

; [code] XHL = TalkPlaceRows[W - 1] + 8 * A (place W, row A); A = 0xFF -> TalkDefaultRow
GetTalkRow:
	push	XDE
	push	XBC
	push	XWA
	cp	A,0xFF
	jr	Z,GetTalkRow.skip
	push	A
	ld	A,W
	dec	1,A
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,TalkPlaceRows
	add	XHL,XWA
	ld	XHL,(XHL)
	pop	A
	extz	WA
	extz	XWA
	mul	XWA,8
	add	XHL,XWA
	jr	GetTalkRow.skip2
GetTalkRow.skip:
	ld	XHL,TalkDefaultRow
GetTalkRow.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	ret

c_216A6A	section	code abs=0x216A6A

; [code] A = EVENT_JON_NOT_READY_SEEN
CheckJonNotReadySeen:
	push	XHL
	push	BC
	ld	HL,EVENT_JON_NOT_READY_SEEN
	call	CheckEventFlag
	ld	A,L
	pop	BC
	pop	XHL
	ret

c_216BA8	section	code abs=0x216BA8

; [code] WA <= 0x100: GetItemName, else GetPartName(WA - 0x100)
GetItemOrPartName:
	push	XDE
	push	XBC
	push	XWA
	cp	WA,0x101
	jr	NC,GetItemOrPartName.skip
	ld	L,A
	call	GetItemName
	jr	GetItemOrPartName.skip2
GetItemOrPartName.skip:
	sub	WA,0x101
	inc	1,WA
	ld	L,A
	call	GetPartName
GetItemOrPartName.skip2:
	pop	XWA
	pop	XBC
	pop	XDE
	ret

c_216BC9	section	code abs=0x216BC9

; [code] WA <= 0x100: XHL = ItemDescs + 0x13*(WA-1), else PartDescs + 0x13*(WA-0x101) (same id split as GetItemOrPartName, cyrius_trades.asm)
GetItemOrPartDesc:
	push	XWA
	cp	WA,0x101
	jr	NC,GetItemOrPartDesc.skip
	ld	XHL,ItemDescs
	jr	GetItemOrPartDesc.skip2
GetItemOrPartDesc.skip:
	sub	WA,0x101
	inc	1,WA
	ld	XHL,PartDescs
GetItemOrPartDesc.skip2:
	dec	1,WA
	extz	XWA
	mul	XWA,0x13
	add	XHL,XWA
	pop	XWA
	ret

c_21752D	section	code abs=0x21752D

; [code] item group W, index A -> CheckItemGroupIndex, ItemGroupToIndex, GetShopItemTier; carry when valid
GetShopItemTierBy:
	call	CheckItemGroupIndex
	ret	NC
	call	ItemGroupToIndex
	call	GetShopItemTier
	scf
	ret

c_21753D	section	code abs=0x21753D

; [code] W < 6: part group W (GetShopPartTier), else item group W - 5 (GetShopItemTierBy); carry when valid
GetShopTier:
	cp	W,6
	jr	NC,GetShopTier.skip
	call	CheckPartGroupIndex
	ret	NC
	call	PartGroupToIndex
	call	GetShopPartTier
	scf
	ret
GetShopTier.skip:
	sub	W,5
	jp	GetShopItemTierBy

c_21A2E2	section	code abs=0x21A2E2

; [code] count of item wTradeShownOther (the entry the partner offers) invalid or >= 9: YouHaveTooManyText, else AreYouSureText
GetTradeConfirmText:
	ld	WA,(wTradeShownOther)
	call	GetEntryCountBy
	ld	XHL,YouHaveTooManyText
	ld	XDE,YouHaveTooManyText
	ret	NC
	and	A,0x7F
	cp	A,9
	ret	NC
	ld	XHL,AreYouSureText
	ld	XDE,AreYouSureText
	ret
SelfText:
	text "Self"
	done
OtherText:
	text "Other"
	done
DashText15:
	db	0x59,0x59,0xFF	; "--"
OKText:
	text "OK"
	done
NOText:
	text "NO"
	done
BlankText5:
	db	0x00,0x00,0x00,0x00,0x00,0x00,0xFF	; "      "
BlankText6:
	db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF	; "        "

c_21B8A7	section	code abs=0x21B8A7

; [code] carry when W is item group 1-4 and 1 <= A <= ItemGroupSizes[W]
CheckItemGroupIndex:
	dec	1,W
	cp	W,4
	inc	1,W
	jr	NC,CheckItemGroupIndex.done
	push	XHL
	ld	XHL,ItemGroupSizes
	dec	1,A
	cp	A,(XHL+W)
	inc	1,A
	pop	XHL
CheckItemGroupIndex.done:
	ret

c_21B8C0	section	code abs=0x21B8C0

; [code] WA = ItemGroupStarts[W] + A - 1 (0-based item id from group W, index A)
ItemGroupToIndex:
	push	XHL
	ld	XHL,ItemGroupStarts-1
	ld	L,(XHL+W)
	extz	HL
	dec	1,A
	extz	WA
	add	WA,HL
	pop	XHL
	ret

c_21B8D5	section	code abs=0x21B8D5

; [code] A = ItemGroupSizes[W] (W = 0: all items)
GetItemGroupSize:
	push	XHL
	ld	A,W
	ld	XHL,ItemGroupSizes
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21B8E4	section	code abs=0x21B8E4

; [code] XHL = ItemNamesWorks + 7 * XWA
GetItemNameWorks:
	mul	XWA,7
	ld	XHL,ItemNamesWorks
	lda	XHL,XHL+WA
	ret

c_21B8F3	section	code abs=0x21B8F3

; [code] XHL = ItemDescsWorks + 0x13 * XWA
GetItemDescWorks:
	mul	XWA,0x13
	ld	XHL,ItemDescsWorks
	lda	XHL,XHL+WA
	ret

c_21B902	section	code abs=0x21B902

; [code] WA = ItemGroupIds[WA] (item_works/ index, group); no caller
GetItemGroupIds:
	push	XHL
	add	WA,WA
	ld	XHL,ItemGroupIds
	ld	WA,(XHL+WA)
	pop	XHL
	ret

c_21B911	section	code abs=0x21B911

; [code] WA = ItemValues_25B379[WA] (no other reader of that column); no callers
Unused_21B911:
	push	XHL
	add	WA,WA
	ld	XHL,ItemValues_25B379
	ld	WA,(XHL+WA)
	pop	XHL
	ret

c_21B920	section	code abs=0x21B920

; [code] WA = ItemAffinity[WA] (item_works/); called only by GetEntryAffinity (no caller)
GetItemAffinity:
	push	XHL
	add	WA,WA
	ld	XHL,ItemAffinity
	ld	WA,(XHL+WA)
	pop	XHL
	ret

c_21B92F	section	code abs=0x21B92F

; [code] XWA = ItemPrices[WA] (u32, packed BCD as HalveBCD treats it)
GetItemPrice:
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

c_21B963	section	code abs=0x21B963

; [code] WA = PartGroupFirstIds[W] (0, 15, 30, 74, 94) + A - 1 (0-based part id)
PartGroupToIndex:
	push	XHL
	ld	XHL,PartGroupFirstIds
	ld	L,(XHL+W)
	extz	HL
	dec	1,A
	extz	WA
	add	WA,HL
	pop	XHL
	ret

c_21B978	section	code abs=0x21B978

; [code] A = PartGroupSizes[W] (W = 0: all parts)
GetPartGroupSize:
	push	XHL
	ld	A,W
	ld	XHL,PartGroupSizes
	ld	A,(XHL+A)
	pop	XHL
	ret

c_21B987	section	code abs=0x21B987

; [code] XHL = PartNamesWorks + 7 * XWA
GetPartNameWorks:
	mul	XWA,7
	ld	XHL,PartNamesWorks
	lda	XHL,XHL+WA
	ret

c_21B996	section	code abs=0x21B996

; [code] XHL = PartDescsWorks + 0x13 * XWA
GetPartDescWorks:
	mul	XWA,0x13
	ld	XHL,PartDescsWorks
	lda	XHL,XHL+WA
	ret

c_21B9A5	section	code abs=0x21B9A5

; [code] WA = PartIdWords[WA] (part_id_words.asm); no caller
GetPartIdWord:
	push	XHL
	add	WA,WA
	ld	XHL,PartIdWords
	ld	WA,(XHL+WA)
	pop	XHL
	ret

c_21B9B4	section	code abs=0x21B9B4

; [code] XHL = PartStatsWorks + 0x18 * WA
GetPartStatsWorks:
	mul	WA,0x18
	ld	XHL,PartStatsWorks
	lda	XHL,XHL+WA
	ret

c_21B9C2	section	code abs=0x21B9C2

; [code] XHL = rank_titles.asm string WA (0x25E450 + 7 * WA)
GetRankTitle:
	mul	WA,7
	ld	XHL,RankTitles-7
	lda	XHL,XHL+WA
	ret

c_21B9D0	section	code abs=0x21B9D0

; [code] XHL = race_names.asm string WA (0x25E48F + 7 * WA)
GetRaceName:
	mul	WA,7
	ld	XHL,RaceNames-7
	lda	XHL,XHL+WA
	ret

c_21D1AE	section	code abs=0x21D1AE

; [code] A = ShopItemStock[WA] (WA = 0-based item id)
GetShopItemTier:
	push	XHL
	ld	XHL,ShopItemStock
	ld	A,(XHL+WA)
	pop	XHL
	ret

c_21D1BB	section	code abs=0x21D1BB

; [code] A = ShopPartStock[WA] (WA = 0-based part id)
GetShopPartTier:
	push	XHL
	ld	XHL,ShopPartStock
	ld	A,(XHL+WA)
	pop	XHL
	ret
