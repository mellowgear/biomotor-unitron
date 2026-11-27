; engine/dungeon/chests.asm: chests: RollFloorMaps, RollFloorChests, chest lookup (GetChestAt), OpenChest

c_2116BC	section	code abs=0x2116BC

; Rolls one chest's content for floor XIZ+0x22 of this dungeon: row WorldChests[(dungeon - 1) * 7 + floor]
; of 7 codes, column by Random % 100 against the cumulative ChestOdds -> A = chest code [code]
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
	; r % 100 walks down ChestOdds until it goes negative
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

; Crystal Mine floor XIZ+0x22: the 6 chests are fixed (MineChests[floor * 6 + i]); one already opened
; (event flag 0x70 + 7 * floor + its attr word) stays 0xFD. Fills code, x, y, attr from the map's chest list [code]
SetMineChests:
	push	XHL
	; the floor's chest position list from its map record
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
	; still closed unless its event flag says it was opened before
	ld	A,(XIZ+0x22)
	extz	WA
	mul	WA,7
	push	XHL
	ld	HL,(XDE+4)
	extz	HL
	add	HL,WA
	add	HL,EVENT_MINE_CHESTS
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
	; x, y, attr words from the map (bytes for x / y)
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

; Rolls the chests of floor A (0-based, kept in XIZ+0x22): the mine uses SetMineChests; elsewhere 5 of the
; 6 map chest spots get a PickWorldChest code and one stays 0xFC (empty). Writes wChestTable [code]
RollFloorChests:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	(XIZ+0x22),A
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
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
	; all 6 slots start as 0xFC (empty)
RollFloorChests.loop:
	ld	A,0xFC
	ld	(XHL+0),A
	inc	5,XHL
	djnz	C,RollFloorChests.loop
	pop	XHL
	ld	C,6
	ld	B,5
	; mark 5 distinct random slots 0xFD (to fill)
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
	; fill the marked slots, and copy every spot's position from the map
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

; C / E = cell -> W = the code of the current floor's chest there (0xFC empty, 0xFD opened, 0xFE (?)
; special, else contents), 0xFF if none; stops at an 0xFF slot [code]
GetChestAt:
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
GetChestAt.loop:
	ld	W,(XHL+0)
	cp	W,0xFF
	jr	Z,GetChestAt.skip2
	ld	A,(XHL+1)
	cp	C,A
	jr	NZ,GetChestAt.skip
	ld	A,(XHL+2)
	cp	E,A
	jr	NZ,GetChestAt.skip
	jr	GetChestAt.skip2
GetChestAt.skip:
	inc	5,XHL
	djnz	D,GetChestAt.loop
	ld	W,0xFF
GetChestAt.skip2:
	pop	A
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2118F4	section	code abs=0x2118F4

; Loads the sprite of each current-floor chest (stops at 0xFF): 0xFE a per-dungeon one (MapSpriteChestFE1),
; 0xFD opened, else closed; to tile 0x169 + 4 * (attr & 0xF) [code]
LoadFloorChestSprites:
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
LoadFloorChestSprites.loop:
	ld	W,(XHL+0)
	cp	W,0xFF
	jr	Z,LoadFloorChestSprites.skip4
	cp	W,0xFE
	jr	NZ,LoadFloorChestSprites.skip
	ld	XWA,0
	ld	A,(XIZ+DUNGEON_ID)
	dec	1,XWA
	mul	XWA,0x42
	ld	XDE,MapSpriteChestFE1
	add	XDE,XWA
	jr	LoadFloorChestSprites.skip3
LoadFloorChestSprites.skip:
	cp	W,0xFD
	jr	NZ,LoadFloorChestSprites.skip2
	ld	XDE,MapSpriteChestOpened
	jr	LoadFloorChestSprites.skip3
LoadFloorChestSprites.skip2:
	ld	XDE,MapSpriteChest
LoadFloorChestSprites.skip3:
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
	djnz	C,LoadFloorChestSprites.loop
LoadFloorChestSprites.skip4:
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

; [code] A = chest code -> A = 1 when >= 0x4A (OpenChest then shows GetChestGoldText and AddGP of GetChestGold), else 0 (an item: GetChestContent, AddItem)
IsGoldChestCode:
	; codes 0x4A-0x59 are gold, below are items / parts
	push	XHL
	push	XDE
	push	XBC
	push	W
	cp	A,0x4A
	jr	C,IsGoldChestCode.skip
	ld	A,1
	jr	IsGoldChestCode.skip2
IsGoldChestCode.skip:
	ld	A,0
IsGoldChestCode.skip2:
	pop	W
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_2119DE	section	code abs=0x2119DE

; [code] chest code -> WA = item id, or part CoreX (72) / Grav (73)
GetChestContent:
	; 0x48 / 0x49 are the parts CoreX / Grav
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
	cp	A,DUNGEON_CRYSTAL_MINE
	jr	NZ,MarkChestOpened.skip
	ld	A,(XIZ+DUNGEON_FLOOR)
	dec	1,A
	extz	WA
	mul	WA,7
	ld	HL,(XHL+3)
	extz	HL
	add	HL,WA
	add	HL,EVENT_MINE_CHESTS
	call	SetEventFlag
MarkChestOpened.skip:
	calr	LoadFloorChestSprites
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211A80	section	code abs=0x211A80

; On dungeon entry: picks floors 1-6 from 6 distinct random maps of 12 and floor 7 = map 12 (the boss),
; offset by (dungeon - 1) * 13; the mine has 5 fixed floors (maps 0x34-0x38). Then rolls every floor's
; chests. Writes DUNGEON_FLOOR_COUNT, DUNGEON_FLOOR_MAPS, wChestTable [code]
RollFloorMaps:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+DUNGEON_ID)
	cp	A,DUNGEON_CRYSTAL_MINE
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
	; re-roll while it matches an earlier floor
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
	; floor 7: the boss map
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

c_212622	section	code abs=0x212622

; [code+play] text box 5: DoYouOpenYesText
ShowOpenChestPrompt:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	GetDungeonTilesPtr
	ld	HL,(XHL)
	ld	WA,(wDungeonTileBase)
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

; [code] PlaceTextBox 5 at 2, 0x2C (the OpenChest box)
PlaceChestBox:
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

; [code] EraseTextBox 5
EraseChestBox:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,5
	call	EraseTextBox
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_21266E	section	code abs=0x21266E

; [code] OpenChest state +0x2A = 1; StartDungeonChest; byte-identical copy of InitBossEncounterState (the ROM has each)
StartOpenChest:
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

; DUNGEON_MODE 0xC, per frame, state XIZ+0x2A: 1-2 "Do you open? Yes No" (cursor +0x20), 3 input, 4 open
; chest XIZ+0x21: item (AddItem; full bag leaves it closed), gold (AddGP) or empty (0xFC), 5-7 the result
; box (OpenChestShowResult) [code+play]
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
	jrl	OpenChestEnd
OpenChest.skip:
	cp	A,2
	jr	NZ,OpenChest.skip2
	calr	PlaceChestBox
	ld	A,3
	ld	(XIZ+0x2A),A
	jrl	OpenChestEnd
OpenChest.skip2:
	cp	A,3
	jr	NZ,OpenChest.skip9
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,OpenChest.skip3
	ld	A,4
	ld	(XIZ+0x2A),A
	jrl	OpenChestEnd
OpenChest.skip3:
	; B = No
	bit	BIT_B_BUTTON,A
	jr	Z,OpenChest.skip4
	ld	A,1
	ld	(XIZ+0x20),A
	ld	A,4
	ld	(XIZ+0x2A),A
	jrl	OpenChestEnd
OpenChest.skip4:
	and	A,0xF
	jrl	Z,OpenChestEnd
	cp	A,4
	jr	NZ,OpenChest.skip6
	ld	A,(XIZ+0x20)
	cp	A,0
	jr	Z,OpenChest.skip5
	push	WA
	ld	WA,SFX_CURSOR
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
	ld	WA,SFX_CURSOR
	call	SoundCommand
	pop	WA
	inc	1,A
	ld	(XIZ+0x20),A
	jr	OpenChest.skip8
OpenChest.skip7:
	jr	OpenChest.skip8
OpenChest.skip8:
	jrl	OpenChestEnd
OpenChest.skip9:
	cp	A,4
	jrl	NZ,OpenChestShowResult
	calr	EraseChestBox
	ld	A,(XIZ+0x20)
	cp	A,0
	jrl	NZ,OpenChestDeclined
	ld	A,5
	call	ClearTextBox
	ld	A,(XIZ+0x21)
	call	GetChestCode
	; 0xFC: an empty chest
	cp	A,0xFC
	jrl	Z,OpenChest.skip12
	push	A
	call	IsGoldChestCode
	cp	A,1
	pop	A
	jr	Z,OpenChest.skip11
	push	A
	call	GetChestContent
	call	AddItem
	pop	A
	; carry = bag full: say so and leave the chest closed (not marked)
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
	; gold
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
	ld	WA,SFX_CHEST_OPEN
	call	SoundCommand
OpenChest.skip14:
	ld	A,5
	ld	(XIZ+0x2A),A
	jr	OpenChestShowResult

c_2127F3	section	code abs=0x2127F3

; [code] jr OpenChestEnd, right after OpenChest's own jr; no callers
OpenChestEnd2:
	jr	OpenChestEnd

c_2127F5	section	code abs=0x2127F5

; [code] OpenChest state 4 with the prompt cursor +0x20 not 0: state 7 (close without opening)
OpenChestDeclined:
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	OpenChestEnd

c_2127FC	section	code abs=0x2127FC

; [code] OpenChest states 5 (PlaceChestBox, SetTextBoxWait, -> 6), 6 (A or B -> 7), 7 (EraseChestBox, EndDungeonChest), else state 1
OpenChestShowResult:
	cp	A,5
	jr	NZ,OpenChestShowResult.skip
	calr	PlaceChestBox
	ld	A,5
	call	SetTextBoxWait
	ld	A,6
	ld	(XIZ+0x2A),A
	jr	OpenChestEnd
OpenChestShowResult.skip:
	cp	A,6
	jr	NZ,OpenChestShowResult.skip4
	ld	A,(wJoyPressed)
	bit	BIT_A_BUTTON,A
	jr	Z,OpenChestShowResult.skip2
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	OpenChestEnd
OpenChestShowResult.skip2:
	bit	BIT_B_BUTTON,A
	jr	Z,OpenChestShowResult.skip3
	ld	A,7
	ld	(XIZ+0x2A),A
	jr	OpenChestEnd
OpenChestShowResult.skip3:
	jr	OpenChestEnd
OpenChestShowResult.skip4:
	cp	A,7
	jr	NZ,OpenChestShowResult.skip5
	calr	EraseChestBox
	call	EndDungeonChest
	jr	OpenChestEnd
OpenChestShowResult.skip5:
	ld	A,1
	ld	(XIZ+0x2A),A

c_212844	section	code abs=0x212844

; [code] OpenChest's common exit: in state 3 DrawMenuCursor at x = 0x28 + 0x28 * cursor +0x20, y = 0x74; pops and returns
OpenChestEnd:
	ld	A,(XIZ+0x2A)
	cp	A,3
	jr	NZ,OpenChestEnd.skip
	ld	XWA,0
	ld	A,(XIZ+0x20)
	mul	WA,0x28
	add	WA,0x28
	ld	BC,WA
	ld	DE,0x74
	call	DrawMenuCursor
	jr	OpenChestEnd.skip
OpenChestEnd.skip:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
