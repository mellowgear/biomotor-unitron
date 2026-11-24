; gfx/font/blank_glyph.s: raw data identified from the code (tools/regions.py); each piece keeps its .org

.org 0x21F000
; [code] GetFontGlyph returns this tile for code 0 or a code past the font (text.s).
BlankGlyph:
    .fill 16, 0x55
