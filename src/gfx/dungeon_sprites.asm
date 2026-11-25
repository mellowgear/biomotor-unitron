; gfx/dungeon_sprites.asm: raw tile sets of the dungeon screen
; Each record: the u16 tile count LoadRawTiles reads, then the tiles (a PNG in storage order).

d_2275D9	section	romdata abs=0x2275D9
BossMapSpritePalettes:    ; LoadBossMapSprite: 0-7 boss alive, 8-11 beaten, 12 no reader
	dw	0xFFF,0x5AB,0x176,0x040
	dw	0xFFF,0xEBA,0xFBD,0x641
	dw	0xFFF,0x7CC,0x26B,0x113
	dw	0xFFF,0x5AB,0x26B,0x113
	dw	0xFFF,0x5AB,0x176,0x030
	dw	0xFFF,0x5AB,0xFBD,0x641
	dw	0xFFF,0x5AB,0xF85,0xB04
	dw	0xFFF,0x952,0x26B,0x113
	dw	0xFFF,0x5AB,0x045,0x112
	dw	0xFFF,0x7CC,0x378,0x033
	dw	0xFFF,0x952,0x940,0x421
	dw	0xFFF,0xEBA,0x842,0x410
	dw	0xFFF,0xABC,0xB95,0x641
d_227641	section	romdata abs=0x227641
; [code] LoadBossMapSprite, after LoadPalettes A = 0x19, C = 1: XHL = 0x227641, A = 2, C = 1 (the arguments
; of LoadMonoPalettes, the slot LoadDungeonFloor gives DungeonMonoPalettes) and returns without the call, so
; it is never read: a mono palette (4 shades 0-7)
UnusedBossMapSpriteMonoPal:
	db	0x00,0x02,0x04,0x06
MapSpriteChest:    ; LoadFloorChestSprites: chest content not 0xFD / 0xFE
	dw	4
$include "build/gfx/dungeon_sprites/chest.2bpp.asm"	; build/gfx/dungeon_sprites/chest.2bpp
d_227687	section	romdata abs=0x227687
MapSpriteChestOpened:    ; LoadFloorChestSprites: content 0xFD (MarkChestOpened)
	dw	4
$include "build/gfx/dungeon_sprites/chest_opened.2bpp.asm"	; build/gfx/dungeon_sprites/chest_opened.2bpp
d_2276C9	section	romdata abs=0x2276C9
MapSpriteChestFE1:    ; LoadFloorChestSprites: content 0xFE, DUNGEON_ID 1
	dw	4
$include "build/gfx/dungeon_sprites/chest_fe_1.2bpp.asm"	; build/gfx/dungeon_sprites/chest_fe_1.2bpp
d_22770B	section	romdata abs=0x22770B
MapSpriteChestFE2:    ; LoadFloorChestSprites: content 0xFE, DUNGEON_ID 2
	dw	4
$include "build/gfx/dungeon_sprites/chest_fe_2.2bpp.asm"	; build/gfx/dungeon_sprites/chest_fe_2.2bpp
d_22774D	section	romdata abs=0x22774D
MapSpriteChestFE3:    ; LoadFloorChestSprites: content 0xFE, DUNGEON_ID 3
	dw	4
$include "build/gfx/dungeon_sprites/chest_fe_3.2bpp.asm"	; build/gfx/dungeon_sprites/chest_fe_3.2bpp
d_22778F	section	romdata abs=0x22778F
MapSpriteChestFE4:    ; LoadFloorChestSprites: content 0xFE, DUNGEON_ID 4
	dw	4
$include "build/gfx/dungeon_sprites/chest_fe_4.2bpp.asm"	; build/gfx/dungeon_sprites/chest_fe_4.2bpp
d_2277D1	section	romdata abs=0x2277D1
MapSpriteChestFE5:    ; LoadFloorChestSprites: content 0xFE, DUNGEON_ID 5
	dw	4
$include "build/gfx/dungeon_sprites/chest_fe_5.2bpp.asm"	; build/gfx/dungeon_sprites/chest_fe_5.2bpp
d_227813	section	romdata abs=0x227813
MapSpriteEnt0:    ; LoadBossMapSprite: boss 0 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/ent_0.2bpp.asm"	; build/gfx/dungeon_sprites/ent_0.2bpp
d_227855	section	romdata abs=0x227855
MapSpriteEnt1:    ; LoadBossMapSprite: boss 0 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/ent_1.2bpp.asm"	; build/gfx/dungeon_sprites/ent_1.2bpp
d_227897	section	romdata abs=0x227897
MapSpriteEnt2:    ; LoadBossMapSprite: boss 0 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/ent_2.2bpp.asm"	; build/gfx/dungeon_sprites/ent_2.2bpp
d_2278D9	section	romdata abs=0x2278D9
MapSpriteKraken0:    ; LoadBossMapSprite: boss 1 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/kraken_0.2bpp.asm"	; build/gfx/dungeon_sprites/kraken_0.2bpp
d_22791B	section	romdata abs=0x22791B
MapSpriteKraken1:    ; LoadBossMapSprite: boss 1 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/kraken_1.2bpp.asm"	; build/gfx/dungeon_sprites/kraken_1.2bpp
d_22795D	section	romdata abs=0x22795D
MapSpriteKraken2:    ; LoadBossMapSprite: boss 1 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/kraken_2.2bpp.asm"	; build/gfx/dungeon_sprites/kraken_2.2bpp
d_22799F	section	romdata abs=0x22799F
MapSpriteRoc0:    ; LoadBossMapSprite: boss 2 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/roc_0.2bpp.asm"	; build/gfx/dungeon_sprites/roc_0.2bpp
d_2279E1	section	romdata abs=0x2279E1
MapSpriteRoc1:    ; LoadBossMapSprite: boss 2 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/roc_1.2bpp.asm"	; build/gfx/dungeon_sprites/roc_1.2bpp
d_227A23	section	romdata abs=0x227A23
MapSpriteRoc2:    ; LoadBossMapSprite: boss 2 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/roc_2.2bpp.asm"	; build/gfx/dungeon_sprites/roc_2.2bpp
d_227A65	section	romdata abs=0x227A65
MapSpriteBehemt0:    ; LoadBossMapSprite: boss 3 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/behemt_0.2bpp.asm"	; build/gfx/dungeon_sprites/behemt_0.2bpp
d_227AA7	section	romdata abs=0x227AA7
MapSpriteBehemt1:    ; LoadBossMapSprite: boss 3 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/behemt_1.2bpp.asm"	; build/gfx/dungeon_sprites/behemt_1.2bpp
d_227AE9	section	romdata abs=0x227AE9
MapSpriteBehemt2:    ; LoadBossMapSprite: boss 3 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/behemt_2.2bpp.asm"	; build/gfx/dungeon_sprites/behemt_2.2bpp
d_227B2B	section	romdata abs=0x227B2B
MapSpriteTrifid0:    ; LoadBossMapSprite: boss 4 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/trifid_0.2bpp.asm"	; build/gfx/dungeon_sprites/trifid_0.2bpp
d_227B6D	section	romdata abs=0x227B6D
MapSpriteTrifid1:    ; LoadBossMapSprite: boss 4 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/trifid_1.2bpp.asm"	; build/gfx/dungeon_sprites/trifid_1.2bpp
d_227BAF	section	romdata abs=0x227BAF
MapSpriteTrifid2:    ; LoadBossMapSprite: boss 4 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/trifid_2.2bpp.asm"	; build/gfx/dungeon_sprites/trifid_2.2bpp
d_227BF1	section	romdata abs=0x227BF1
MapSpriteCatble0:    ; LoadBossMapSprite: boss 5 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/catble_0.2bpp.asm"	; build/gfx/dungeon_sprites/catble_0.2bpp
d_227C33	section	romdata abs=0x227C33
MapSpriteCatble1:    ; LoadBossMapSprite: boss 5 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/catble_1.2bpp.asm"	; build/gfx/dungeon_sprites/catble_1.2bpp
d_227C75	section	romdata abs=0x227C75
MapSpriteCatble2:    ; LoadBossMapSprite: boss 5 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/catble_2.2bpp.asm"	; build/gfx/dungeon_sprites/catble_2.2bpp
d_227CB7	section	romdata abs=0x227CB7
MapSpriteSquidl0:    ; LoadBossMapSprite: boss 6 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/squidl_0.2bpp.asm"	; build/gfx/dungeon_sprites/squidl_0.2bpp
d_227CF9	section	romdata abs=0x227CF9
MapSpriteSquidl1:    ; LoadBossMapSprite: boss 6 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/squidl_1.2bpp.asm"	; build/gfx/dungeon_sprites/squidl_1.2bpp
d_227D3B	section	romdata abs=0x227D3B
MapSpriteSquidl2:    ; LoadBossMapSprite: boss 6 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/squidl_2.2bpp.asm"	; build/gfx/dungeon_sprites/squidl_2.2bpp
d_227D7D	section	romdata abs=0x227D7D
MapSpriteSimrug0:    ; LoadBossMapSprite: boss 7 alive, frame 0
	dw	4
$include "build/gfx/dungeon_sprites/simrug_0.2bpp.asm"	; build/gfx/dungeon_sprites/simrug_0.2bpp
d_227DBF	section	romdata abs=0x227DBF
MapSpriteSimrug1:    ; LoadBossMapSprite: boss 7 alive, frame 1
	dw	4
$include "build/gfx/dungeon_sprites/simrug_1.2bpp.asm"	; build/gfx/dungeon_sprites/simrug_1.2bpp
d_227E01	section	romdata abs=0x227E01
MapSpriteSimrug2:    ; LoadBossMapSprite: boss 7 alive, frame 2
	dw	4
$include "build/gfx/dungeon_sprites/simrug_2.2bpp.asm"	; build/gfx/dungeon_sprites/simrug_2.2bpp
d_227E43	section	romdata abs=0x227E43
MapSpriteUniti0_0:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 0 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_0.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_0.2bpp
d_227E85	section	romdata abs=0x227E85
MapSpriteUniti0_1:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 1 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_1.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_1.2bpp
d_227EC7	section	romdata abs=0x227EC7
MapSpriteUniti0_2:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 2 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_2.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_2.2bpp
d_227F09	section	romdata abs=0x227F09
MapSpriteUniti0_3:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 3 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_3.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_3.2bpp
d_227F4B	section	romdata abs=0x227F4B
MapSpriteUniti0_4:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 4 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_4.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_4.2bpp
d_227F8D	section	romdata abs=0x227F8D
MapSpriteUniti0_5:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 5 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_5.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_5.2bpp
d_227FCF	section	romdata abs=0x227FCF
MapSpriteUniti0_6:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 6 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_6.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_6.2bpp
d_228011	section	romdata abs=0x228011
MapSpriteUniti0_7:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 7 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_7.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_7.2bpp
d_228053	section	romdata abs=0x228053
MapSpriteUniti0_8:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 0, record 8 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_0_8.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_0_8.2bpp
d_228095	section	romdata abs=0x228095
MapSpriteUniti1_0:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 0 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_0.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_0.2bpp
d_2280D7	section	romdata abs=0x2280D7
MapSpriteUniti1_1:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 1 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_1.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_1.2bpp
d_228119	section	romdata abs=0x228119
MapSpriteUniti1_2:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 2 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_2.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_2.2bpp
d_22815B	section	romdata abs=0x22815B
MapSpriteUniti1_3:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 3 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_3.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_3.2bpp
d_22819D	section	romdata abs=0x22819D
MapSpriteUniti1_4:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 4 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_4.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_4.2bpp
d_2281DF	section	romdata abs=0x2281DF
MapSpriteUniti1_5:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 5 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_5.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_5.2bpp
d_228221	section	romdata abs=0x228221
MapSpriteUniti1_6:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 6 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_6.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_6.2bpp
d_228263	section	romdata abs=0x228263
MapSpriteUniti1_7:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 7 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_7.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_7.2bpp
d_2282A5	section	romdata abs=0x2282A5
MapSpriteUniti1_8:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 1, record 8 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_1_8.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_1_8.2bpp
d_2282E7	section	romdata abs=0x2282E7
MapSpriteUniti2_0:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 0 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_0.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_0.2bpp
d_228329	section	romdata abs=0x228329
MapSpriteUniti2_1:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 1 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_1.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_1.2bpp
d_22836B	section	romdata abs=0x22836B
MapSpriteUniti2_2:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 2 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_2.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_2.2bpp
d_2283AD	section	romdata abs=0x2283AD
MapSpriteUniti2_3:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 3 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_3.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_3.2bpp
d_2283EF	section	romdata abs=0x2283EF
MapSpriteUniti2_4:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 4 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_4.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_4.2bpp
d_228431	section	romdata abs=0x228431
MapSpriteUniti2_5:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 5 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_5.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_5.2bpp
d_228473	section	romdata abs=0x228473
MapSpriteUniti2_6:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 6 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_6.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_6.2bpp
d_2284B5	section	romdata abs=0x2284B5
MapSpriteUniti2_7:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 7 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_7.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_7.2bpp
d_2284F7	section	romdata abs=0x2284F7
MapSpriteUniti2_8:    ; LoadBossMapSprite: boss 8 (mine floor 5), frame 2, record 8 of 9
	dw	4
$include "build/gfx/dungeon_sprites/uniti_2_8.2bpp.asm"	; build/gfx/dungeon_sprites/uniti_2_8.2bpp
d_228539	section	romdata abs=0x228539
MapSpriteBeaten0:    ; LoadBossMapSprite: beaten boss record 0
	dw	4
$include "build/gfx/dungeon_sprites/beaten_0.2bpp.asm"	; build/gfx/dungeon_sprites/beaten_0.2bpp
d_22857B	section	romdata abs=0x22857B
MapSpriteBeaten1:    ; LoadBossMapSprite: beaten boss record 1
	dw	4
$include "build/gfx/dungeon_sprites/beaten_1.2bpp.asm"	; build/gfx/dungeon_sprites/beaten_1.2bpp
d_2285BD	section	romdata abs=0x2285BD
MapSpriteBeaten2:    ; LoadBossMapSprite: beaten boss record 2
	dw	4
$include "build/gfx/dungeon_sprites/beaten_2.2bpp.asm"	; build/gfx/dungeon_sprites/beaten_2.2bpp
d_2285FF	section	romdata abs=0x2285FF
MapSpriteBeaten3:    ; LoadBossMapSprite: beaten boss record 3
	dw	4
$include "build/gfx/dungeon_sprites/beaten_3.2bpp.asm"	; build/gfx/dungeon_sprites/beaten_3.2bpp
d_270063	section	romdata abs=0x270063
PlayerDungeonTiles:    ; LoadPlayerDungeonSprite / LoadDungeonPalettes (LoadMappedTiles copies the tiles the sprite maps name); colours: race 0 (Human)
	dw	PLAYER_DUNGEON_TILE_COUNT	; tile count (gfx.mk's --count for player.png must match)
$include "build/gfx/dungeon_sprites/player.2bpp.asm"	; build/gfx/dungeon_sprites/player.2bpp
