; sub_217D60 (Core, Leg, BPack, Arm, Exit)
; menu tables of the shared menu runner (loc_2179E0): the caller sets 0x614A = cursor stops,
; 0x614B = lines, 0x614C = lines (swp_217207 / swp_2171F0: text box column, row, string),
; 0x6150 = cursor stops (sub_217B8C: column, row), 0x6154 = the result per stop (swp_217AA4)
d_217D1B	section	romdata abs=0x217D1B
$include "build/data/shop/menu_texts_217D1B.asm"	; src/data/shop/menu_texts_217D1B.txt
d_217D33	section	romdata abs=0x217D33
; [code] sub_217D60: 0x614C
MenuLines_217D33:
	menu_item	0,0,CoreText
	menu_item	0,1,LegText
	menu_item	0,2,BPackText
	menu_item	0,3,ArmText
	menu_item	0,8,ExitText3
d_217D51	section	romdata abs=0x217D51
; [code] sub_217D60: 0x6150
MenuCursor_217D51:
	db	0,0, 0,1, 0,2, 0,3, 0,8	; column, row
d_217D5B	section	romdata abs=0x217D5B
; [code] sub_217D60: 0x6154 (0xFF = Exit)
MenuResults_217D5B:
	db	1,2,3,4,0xFF
