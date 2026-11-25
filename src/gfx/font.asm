; gfx/font.asm: the font (GetFontGlyph), in ROM order (written once by tools/assets.py extract; edited by hand since). Each keeps its address in its own section;
; the included product says how the Makefile builds it (see README).

d_2C8DA7	section	romdata abs=0x2C8DA7
Font:    ; GetFontGlyph 0x207073: glyph count, then 2bpp glyphs (code n = glyph n - 1)
	dw	128	; glyph count (the Makefile's --count for the font must match)
$include "build/gfx/font/font.2bpp.asm"	; build/gfx/font/font.2bpp
