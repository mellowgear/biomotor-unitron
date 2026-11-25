; the Setup screen (swp_218743): title, the 8 part slots (BD, RA, LA, UC, LG, BP, A1, A2)
; list screen tables (loc_217EEE): the caller sets 0x6172 = the cursor stops of the list rows
; (swp_218184: column, row, 0x615F of them); lines are drawn by swp_217207 (column, row, string)
d_2186D4	section	romdata abs=0x2186D4
; [code] swp_218743: 0x6172, 8 rows
ListCursor_2186D4:
	db	0,1, 0,3, 0,4, 0,5, 0,6, 0,7, 0,9, 0,10	; column, row
d_2186E4	section	romdata abs=0x2186E4
$include "build/data/works/menu_texts_2186E4.asm"	; src/data/works/menu_texts_2186E4.txt
d_218713	section	romdata abs=0x218713
; [code] swp_218743: swp_217207 with B = 8 in box 3 (the 8 slot names)
MenuLines_218713:
	menu_item	0,1,BDText
	menu_item	0,3,RAText
	menu_item	0,4,LAText
	menu_item	0,5,UCText
	menu_item	0,6,LGText
	menu_item	0,7,BPText
	menu_item	0,9,A1Text
	menu_item	0,10,A2Text
