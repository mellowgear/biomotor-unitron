; SetupPartCategoryMenu (Core, Leg, BPack, Arm, Exit)
; menu tables of the shared menu runner (MenuReset): the caller sets 0x614A = cursor stops,
; 0x614B = lines, 0x614C = lines (PrintStringTable / PrintStringTableEntry: text box column, row, string),
; 0x6150 = cursor stops (GetMenuCursorCell: column, row), 0x6154 = the result per stop (MenuCmdShowCursor)
d_217D1B	section	romdata abs=0x217D1B
$include "src/data/shop/menu_texts_217D1B.asm"
d_217D33	section	romdata abs=0x217D33
; [code] SetupPartCategoryMenu: 0x614C
MenuLines_217D33:
	menu_item	0,0,CoreText
	menu_item	0,1,LegText
	menu_item	0,2,BPackText
	menu_item	0,3,ArmText
	menu_item	0,8,ExitText3
d_217D51	section	romdata abs=0x217D51
; [code] SetupPartCategoryMenu: 0x6150
MenuCursor_217D51:
	db	0,0, 0,1, 0,2, 0,3, 0,8	; column, row
d_217D5B	section	romdata abs=0x217D5B
; [code] SetupPartCategoryMenu: 0x6154 (0xFF = Exit)
MenuResults_217D5B:
	db	1,2,3,4,0xFF
