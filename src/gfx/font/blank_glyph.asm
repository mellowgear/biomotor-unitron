; gfx/font/blank_glyph: raw data identified from the code (tools/regions.py), one section per piece

d_21F000	section	romdata abs=0x21F000
; [code] GetFontGlyph returns this tile for code 0 or a code past the font (text.s).
BlankGlyph:
	dfb	16,0x55
