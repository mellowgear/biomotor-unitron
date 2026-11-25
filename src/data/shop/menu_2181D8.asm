; the item list screens (Acce., Item, Tool, Mate.)
; list screen tables (loc_217EEE): the caller sets 0x6172 = the cursor stops of the list rows
; (swp_218184: column, row, 0x615F of them); lines are drawn by swp_217207 (column, row, string)
d_2181D8	section	romdata abs=0x2181D8
; [code] swp_21B4D1 / swp_21B51E: 0x6172, 10 rows
ListCursor_2181D8:
	db	0,1, 0,2, 0,3, 0,4, 0,5, 0,6, 0,7, 0,8, 0,9, 0,10	; column, row
d_2181EC	section	romdata abs=0x2181EC
$include "build/data/shop/menu_texts_2181EC.asm"	; src/data/shop/menu_texts_2181EC.txt
d_218218	section	romdata abs=0x218218
; [code] swp_21B394: title per item group (0x6182), box 3 column 0 row 0
ItemGroupTitles:
	dl	AcceText2,ItemText7,ToolText2,MateText2
d_218228	section	romdata abs=0x218228
$include "build/data/shop/menu_texts_218228.asm"	; src/data/shop/menu_texts_218228.txt
