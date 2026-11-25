; SetupItemCategoryMenu (Item, Tool, Mate., Acce., Exit)
; menu tables of the shared menu runner (MenuReset): the caller sets 0x614A = cursor stops,
; 0x614B = lines, 0x614C = lines (PrintStringTable / PrintStringTableEntry: text box column, row, string),
; 0x6150 = cursor stops (GetMenuCursorCell: column, row), 0x6154 = the result per stop (MenuCmdShowCursor)
d_217D8B	section	romdata abs=0x217D8B
$include "build/data/works/menu_texts_217D8B.asm"	; src/data/works/menu_texts_217D8B.txt
d_217DA6	section	romdata abs=0x217DA6
; [code] SetupItemCategoryMenu: 0x614C
MenuLines_217DA6:
	menu_item	0,0,ItemText6
	menu_item	0,1,ToolText
	menu_item	0,2,MateText
	menu_item	0,3,AcceText
	menu_item	0,8,ExitText4
d_217DC4	section	romdata abs=0x217DC4
; [code] SetupItemCategoryMenu: 0x6150
MenuCursor_217DC4:
	db	0,0, 0,1, 0,2, 0,3, 0,8	; column, row
d_217DCE	section	romdata abs=0x217DCE
; [code] SetupItemCategoryMenu: 0x6154 (0xFF = Exit)
MenuResults_217DCE:
	db	1,2,3,0,0xFF
