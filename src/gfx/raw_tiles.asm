; gfx/raw_tiles.asm: raw tile sets read by LoadRawTiles (XHL = u16 count + 2bpp tiles, WA =
; first tile), or copied by address. Each record: the count, then the tiles (a PNG of one row,
; in storage order; gfx.mk rule build/gfx/raw_tiles/%.2bpp).

d_2C83B9	section	romdata abs=0x2C83B9
RawTiles_2C83B9:    ; [code] UpdateTextBoxes (text engine): blinks with RawTiles_2C83CB every 8 frames (wFrameCounter bit 3), to tile 0xB
	dw	1
$include "build/gfx/raw_tiles/2C83B9.2bpp.asm"	; build/gfx/raw_tiles/2C83B9.2bpp
d_2C83CB	section	romdata abs=0x2C83CB
RawTiles_2C83CB:    ; [code] UpdateTextBoxes: the other blink frame, to tile 0xB
	dw	1
$include "build/gfx/raw_tiles/2C83CB.2bpp.asm"	; build/gfx/raw_tiles/2C83CB.2bpp
d_2C83DD	section	romdata abs=0x2C83DD
RawTiles_2C83DD:    ; [code] DrawBarTiles copies tiles from here by address (+2, +0x82 = tile 8); no LoadRawTiles of the record itself
	dw	9
$include "build/gfx/raw_tiles/2C83DD.2bpp.asm"	; build/gfx/raw_tiles/2C83DD.2bpp
d_2C846F	section	romdata abs=0x2C846F
RawTiles_2C846F:    ; [code] DrawBarTilesReversed copies tiles from here by address (+2, +0x10, +0x90, the last backwards); no LoadRawTiles of the record itself
	dw	9
$include "build/gfx/raw_tiles/2C846F.2bpp.asm"	; build/gfx/raw_tiles/2C846F.2bpp
d_2C8501	section	romdata abs=0x2C8501
RawTiles_2C8501:    ; [code] BattleStart (before Pal_2C82CE): to tile 0x15F
	dw	2
$include "build/gfx/raw_tiles/2C8501.2bpp.asm"	; build/gfx/raw_tiles/2C8501.2bpp
d_2C8523	section	romdata abs=0x2C8523
RawTiles_2C8523:    ; [code] BattleStart: to tile 0x173
	dw	2
$include "build/gfx/raw_tiles/2C8523.2bpp.asm"	; build/gfx/raw_tiles/2C8523.2bpp
d_2C8545	section	romdata abs=0x2C8545
RawTiles_2C8545:    ; [code] BattleStart: to tiles 0x164 and 0x178
	dw	1
$include "build/gfx/raw_tiles/2C8545.2bpp.asm"	; build/gfx/raw_tiles/2C8545.2bpp
d_2C8557	section	romdata abs=0x2C8557
RawTiles_2C8557:    ; [code] BattleStart: to tiles 0x15B and 0x16F
	dw	1
$include "build/gfx/raw_tiles/2C8557.2bpp.asm"	; build/gfx/raw_tiles/2C8557.2bpp
d_2C8569	section	romdata abs=0x2C8569
RawTiles_2C8569:    ; [code] InitTextBoxes: the text box tiles (PNG in Pal_21F010's colours)
	dw	11
$include "build/gfx/raw_tiles/2C8569.2bpp.asm"	; build/gfx/raw_tiles/2C8569.2bpp
d_2C861B	section	romdata abs=0x2C861B
RawTiles_2C861B:    ; [code] OpenSelectPlayerBoxes (title.asm): Select Player / name confirm boxes
	dw	4
$include "build/gfx/raw_tiles/2C861B.2bpp.asm"	; build/gfx/raw_tiles/2C861B.2bpp
