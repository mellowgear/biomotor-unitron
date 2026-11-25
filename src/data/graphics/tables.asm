; data/graphics/tables.asm: the graphics tables in ROM order, one section per part; each part is a
; file in src/data/graphics/: numbers as asm900 records (#include), names as a slot file that
; unitron text turns into build/data/graphics/<file>.asm ($include). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_226B2D	section	romdata abs=0x226B2D
#include "src/data/graphics/intro_frames.asm"
d_227419	section	romdata abs=0x227419
PortraitOffsets:
#include "src/data/graphics/portrait_offsets.asm"
d_24A228	section	romdata abs=0x24A228
PixelFillBytes:
#include "src/data/graphics/pixel_fill_bytes.asm"
d_2C7B6E	section	romdata abs=0x2C7B6E
PortraitTable:
#include "src/data/graphics/portraits.asm"
