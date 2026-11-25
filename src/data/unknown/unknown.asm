; data/unknown/unknown.asm: data blocks not identified yet, in ROM order (one section each)

; no reader found: 23 bytes rising from 1 to 100 (1,1,1,5,10,15,20,25,35,40,..,95,100,100), right after
; ExpLevelDiff
d_2253DE	section	romdata abs=0x2253DE
Data_2253DE:
$include "build/src/data/unknown/2253DE.bin.asm"	; src/data/unknown/2253DE.bin
; LoadBossMapSprite loads XHL = 0x227641, A = 2, C = 1 (the LoadMonoPalettes arguments) but no call
; follows (it returns): read into a register only. Shaped like a mono palette (00 02 04 06)
d_227641	section	romdata abs=0x227641
Data_227641:
$include "build/src/data/unknown/227641.bin.asm"	; src/data/unknown/227641.bin
; no reader found: 2 words (0x016C, 0x019E) before DungeonMaps
d_249420	section	romdata abs=0x249420
Data_249420:
$include "build/src/data/unknown/249420.bin.asm"	; src/data/unknown/249420.bin
; no reader found (the lead said so too): 20 bytes 0x08-0x1B counting up, before CollaItems
d_24A080	section	romdata abs=0x24A080
Data_24A080:
$include "build/src/data/unknown/24A080.bin.asm"	; src/data/unknown/24A080.bin
; no reader found: 5 colour palettes (0x0BGR words) between Pal_26FDD7 and MonoPal_26FE07
d_26FDDF	section	romdata abs=0x26FDDF
Data_26FDDF:
$include "build/src/data/unknown/26FDDF.bin.asm"	; src/data/unknown/26FDDF.bin
; no reader found (no immediate or pointer in the range): 4 bytes shaped like a mono palette
; (00 00 04 06) after Pal_2C865D, then four 2x2 sprite maps of tiles 1-16 (the layout sub_210622
; draws from Gfx_2C8691 with sub_206BFF, which does not read these)
d_2C8665	section	romdata abs=0x2C8665
Data_2C8665:
$include "build/src/data/unknown/2C8665.bin.asm"	; src/data/unknown/2C8665.bin
; no reader found: 1 colour palette (0xFFF, 0xBBB, 0x666, 0x222) between Pal_2DE017 and MonoPal_2DE027
d_2DE01F	section	romdata abs=0x2DE01F
Data_2DE01F:
$include "build/src/data/unknown/2DE01F.bin.asm"	; src/data/unknown/2DE01F.bin
; no reader found: 8 colour palettes right after Pal_2E6618 (whose 8 StorySceneSunBegan loads,
; C = 8): the same layout in greys (0x999, 0x888, ...); maybe a faded set
d_2E6658	section	romdata abs=0x2E6658
Data_2E6658:
$include "build/src/data/unknown/2E6658.bin.asm"	; src/data/unknown/2E6658.bin
; no reader found: 7 colour palettes right after Pal_2E766D (whose 7 StorySceneDestruction loads,
; C = 7), in greys (0x999 first); maybe a faded set
d_2E76A5	section	romdata abs=0x2E76A5
Data_2E76A5:
$include "build/src/data/unknown/2E76A5.bin.asm"	; src/data/unknown/2E76A5.bin
