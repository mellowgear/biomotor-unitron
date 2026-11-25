; 7 stat lines (HP, EP, AP, SP, RP, MP, AT) and their "---" values
d_2191AF	section	romdata abs=0x2191AF
$include "src/data/works/menu_texts_2191AF.asm"
d_2191C8	section	romdata abs=0x2191C8
; [code] works.asm (ld XHL,0x2191C8): PrintStringTable, 7 lines
MenuLines_2191C8:
	menu_item	0,0,HPText3
	menu_item	0,1,EPText2
	menu_item	0,2,APText
	menu_item	0,3,SPText2
	menu_item	0,4,RPText2
	menu_item	0,5,MPText2
	menu_item	0,8,ATText2
d_2191F2	section	romdata abs=0x2191F2
$include "src/data/works/menu_texts_2191F2.asm"
d_21920E	section	romdata abs=0x21920E
; [code] works.asm (ld XHL,0x21920E): PrintStringTable, 7 lines at column 3
MenuLines_21920E:
	menu_item	3,0,DashText4
	menu_item	3,1,DashText5
	menu_item	3,2,DashText6
	menu_item	3,3,DashText7
	menu_item	3,4,DashText8
	menu_item	3,5,DashText9
	menu_item	3,8,DashText10
