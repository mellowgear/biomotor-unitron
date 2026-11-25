; engine/dungeon/load.asm: dungeon floor loading: LoadDungeonFloor, GetDungeonTilesPtr, dungeon palettes, boss and player map sprites (loading and DrawPlayerMapSprite)

c_2115AC	section	code abs=0x2115AC

; [code] GetFloorBossBeaten (FF = no boss on this floor) / boss index GetBossIndex: beaten -> 0x228641[i] record at 0x228539 + palette 0x2275D9 + 8*(rec+8); alive -> 0x227813 + 0x42*(3i + frame) ((+0x2D>>3)&3) + palette 0x2275D9 + 8i; index 8 (mine floor 5) -> 9 records from 0x227E43; LoadRawTiles to tile 0x182 / 0x19B, LoadPalettes A=0x19
LoadBossMapSprite:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	call	GetFloorBossBeaten
	cp	A,0xFF
	jrl	Z,LoadBossMapSprite.skip6
	cp	A,0
	jr	Z,LoadBossMapSprite.skip
	call	GetBossIndex
	cp	A,8
	jrl	Z,LoadBossMapSprite.skip6
	extz	WA
	extz	XWA
	ld	XHL,BossBeatenSprites
	add	XHL,XWA
	ld	A,(XHL)
	extz	WA
	extz	XWA
	mul	XWA,0x42
	ld	XDE,MapSpriteBeaten0
	add	XDE,XWA
	ld	A,(XHL)
	add	A,8
	extz	WA
	extz	XWA
	sll	3,XWA
	ld	XHL,BossMapSpritePalettes
	add	XHL,XWA
	ld	WA,0x182
	jrl	LoadBossMapSprite.skip5
LoadBossMapSprite.skip:
	call	GetBossIndex
	cp	A,8
	jr	NZ,LoadBossMapSprite.skip3
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	3,A
	and	A,3
	cp	A,3
	jr	NZ,LoadBossMapSprite.skip2
	ld	A,1
LoadBossMapSprite.skip2:
	mul	XWA,9
	mul	XWA,0x42
	ld	XDE,MapSpriteUniti0_0
	add	XDE,XWA
	ld	XHL,0
	ld	WA,0x19B
	ld	XHL,XDE
	ld	C,9
LoadBossMapSprite.loop:
	push	XHL
	push	WA
	push	C
	call	LoadRawTiles
	pop	C
	pop	WA
	pop	XHL
	add	XHL,0x42
	add	WA,4
	djnz	C,LoadBossMapSprite.loop
	jr	LoadBossMapSprite.skip6
LoadBossMapSprite.skip3:
	extz	WA
	extz	XWA
	push	XWA
	mul	XWA,3
	ld	XDE,XWA
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	3,A
	and	A,3
	cp	A,3
	jr	NZ,LoadBossMapSprite.skip4
	ld	A,1
LoadBossMapSprite.skip4:
	add	XDE,XWA
	mul	XDE,0x42
	ld	XWA,MapSpriteEnt0
	add	XDE,XWA
	pop	XWA
	sll	3,XWA
	ld	XHL,BossMapSpritePalettes
	add	XHL,XWA
	ld	WA,0x182
LoadBossMapSprite.skip5:
	push	XHL
	ld	XHL,XDE
	call	LoadRawTiles
	pop	XHL
	cp	XHL,0
	jr	Z,LoadBossMapSprite.skip6
	ld	A,0x19
	ld	C,1
	call	LoadPalettes
	ld	XHL,UnusedBossMapSpriteMonoPal
	ld	A,2
	ld	C,1
LoadBossMapSprite.skip6:
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211B13	section	code abs=0x211B13

; [code] XHL = DungeonMaps + DUNGEON_MAP_SIZE * (DUNGEON_FLOOR_MAPS byte of DUNGEON_FLOOR - 1); LoadDungeonFloor
GetFloorDungeonMap:
	push	XWA
	xor	XWA,XWA
	ld	A,(XIZ+0x11)
	dec	1,A
	ld	XHL,XIZ
	add	XHL,0x17
	add	XHL,XWA
	xor	XWA,XWA
	ld	A,(XHL)
	mul	WA,DUNGEON_MAP_SIZE
	ld	XHL,DungeonMaps
	add	XHL,XWA
	pop	XWA
	ret

c_211B35	section	code abs=0x211B35

; [code] DungeonPalettes/MonoPalettes, DungeonData metatiles/tiles/attrs, wMapPtr from DungeonMaps, chests
LoadDungeonFloor:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	A,(XIZ+0x10)
	sub	A,1
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DungeonPalettes
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	C,0xF
	ld	A,0x10
	call	LoadPalettes
	ld	A,(XIZ+0x10)
	sub	A,1
	extz	WA
	extz	XWA
	sll	2,XWA
	ld	XHL,DungeonMonoPalettes
	add	XHL,XWA
	ld	XHL,(XHL)
	ld	C,1
	ld	A,2
	call	LoadMonoPalettes
	ld	XHL,DungeonData
	ld	XWA,(XHL)
	ld	(wMetatileTilesPtr),XWA
	add	XHL,4
	ld	XWA,(XHL)
	ld	XDE,XWA
	add	XHL,4
	ld	XWA,(XHL)
	ld	(wMetatileAttrPtr),XWA
	add	XHL,4
	ld	XHL,XDE
	ld	WA,0x37
	ld	(wDungeonTileBase),WA
	call	LoadCompressedTiles
	calr	GetFloorDungeonMap
	ld	XWA,(XHL)
	ld	(wMapPtr),XWA
	add	XHL,4
	calr	LoadFloorChestSprites
	call	LoadBossMapSprite
	ld	WA,0
	ld	(wMapScrollStepX),WA
	ld	(wMapScrollStepY),WA
	call	RedrawMapAtScroll
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211BD2	section	code abs=0x211BD2

; [code] XHL = DungeonData +4, the tile sheet LoadDungeonFloor loads (u16 count first) to wDungeonTileBase; the box openers use count + wDungeonTileBase as their tile
GetDungeonTilesPtr:
	ld	XHL,DungeonData
	add	XHL,4
	ld	XHL,(XHL)
	ret

c_211C7F	section	code abs=0x211C7F

; [play] every dungeon screen; palettes by race
LoadDungeonPalettes:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,PlayerDungeonSprites
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	mul	WA,0x78
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+0x15)
	cp	A,0
	jr	NZ,LoadDungeonPalettes.skip
	ld	A,1
	jr	LoadDungeonPalettes.skip2
LoadDungeonPalettes.skip:
	cp	A,1
	jr	NZ,LoadDungeonPalettes.skip2
	ld	A,0
LoadDungeonPalettes.skip2:
	mul	WA,0x1E
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	3,A
	and	A,3
	cp	A,3
	jr	NZ,LoadDungeonPalettes.skip3
	ld	A,1
LoadDungeonPalettes.skip3:
	mul	WA,0xA
	add	XHL,XWA
	ld	XDE,XHL
	ld	XHL,PlayerDungeonTiles
	ld	WA,0xC
	call	LoadMappedTiles
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	sll	3,A
	ld	XHL,PlayerDungeonSpritePalettes
	add	XHL,XWA
	ld	A,0
	ld	C,1
	call	LoadPalettes
	ld	XHL,PlayerDungeonSpriteMonoPal
	ld	A,0
	ld	C,1
	call	LoadMonoPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211D03	section	code abs=0x211D03

; [code] sprite maps 0x26FE0B + race*0x78 + frame*0x1E, tiles from 0x270063, PlayerDungeonSpritePalettes per race
LoadPlayerDungeonSprite:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	XHL,PlayerDungeonSprites
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	mul	WA,0x78
	add	XHL,XWA
	ld	XWA,0
	ld	A,(XIZ+0x2D)
	sra	4,A
	and	A,3
	cp	A,1
	jr	NZ,LoadPlayerDungeonSprite.skip
	ld	A,2
	jr	LoadPlayerDungeonSprite.skip2
LoadPlayerDungeonSprite.skip:
	cp	A,2
	jr	NZ,LoadPlayerDungeonSprite.skip2
	ld	A,1
LoadPlayerDungeonSprite.skip2:
	mul	WA,0x1E
	add	XHL,XWA
	ld	XWA,1
	cp	A,3
	mul	WA,0xA
	add	XHL,XWA
	ld	XDE,XHL
	ld	XHL,PlayerDungeonTiles
	ld	WA,0xC
	call	LoadMappedTiles
	ld	XWA,0
	ld	A,(wPlayerRace)
	dec	1,A
	srl	1,A
	sll	3,A
	ld	XHL,PlayerDungeonSpritePalettes
	add	XHL,XWA
	ld	A,0
	ld	C,1
	call	LoadPalettes
	ld	XHL,PlayerDungeonSpriteMonoPal
	ld	A,0
	ld	C,1
	call	LoadMonoPalettes
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211D80	section	code abs=0x211D80

; [code] DrawPlayerMapSprite at 0x50, 0x50 (screen centre); every DungeonStep frame
DrawPlayerDungeonSprite:
	push	XHL
	push	XDE
	push	XBC
	push	XWA
	ld	BC,0x50
	ld	DE,0x50
	calr	DrawPlayerMapSprite
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret

c_211D92	section	code abs=0x211D92

; [code] DrawSpriteGrid 2 x 2 of tile 0xC (where LoadPlayerDungeonSprite loads the player sprite) at BC - 8, DE - 0xC; DrawPlayerDungeonSprite, WorldMapDispatch
DrawPlayerMapSprite:
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
	call	DrawSpriteGrid
	pop	XWA
	pop	XBC
	pop	XDE
	pop	XHL
	ret
