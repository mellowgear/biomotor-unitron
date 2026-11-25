; SetupWorksMenu (Setup, Develp, Item, Stats, Trade, Help, Data, Exit)
; menu tables of the shared menu runner (MenuReset): the caller sets 0x614A = cursor stops,
; 0x614B = lines, 0x614C = lines (PrintStringTable / PrintStringTableEntry: text box column, row, string),
; 0x6150 = cursor stops (GetMenuCursorCell: column, row), 0x6154 = the result per stop (MenuCmdShowCursor)
d_217BCF	section	romdata abs=0x217BCF
$include "src/data/works/menu_texts_217BCF.asm"
d_217BFC	section	romdata abs=0x217BFC
; [code] SetupWorksMenu: 0x614C
MenuLines_217BFC:
	menu_item	0,0,SetupText
	menu_item	0,1,DevelpText
	menu_item	0,2,ItemText5
	menu_item	0,3,StatsText2
	menu_item	0,4,TradeText
	menu_item	0,5,HelpText
	menu_item	0,6,DataText
	menu_item	0,8,ExitText2
d_217C2C	section	romdata abs=0x217C2C
; [code] SetupWorksMenu: 0x6150
MenuCursor_217C2C:
	db	0,0, 0,1, 0,2, 0,3, 0,4, 0,5, 0,6, 0,8	; column, row
d_217C3C	section	romdata abs=0x217C3C
; [code] SetupWorksMenu: 0x6154 (0xFF = Exit)
MenuResults_217C3C:
	db	4,5,1,0,3,6,2,0xFF
