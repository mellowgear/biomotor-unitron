; 8 stat lines (HP, EP, RA, LA, SP, RP, MP, AT with "---")
d_218A70	section	romdata abs=0x218A70
$include "src/data/works/menu_texts_218A70.asm"
d_218AA8	section	romdata abs=0x218AA8
; [code] works.asm (2 callers): PrintStringTable with B = 8 in box 2
MenuLines_218AA8:
	menu_item	0,0,HPText2
	menu_item	0,1,EPText
	menu_item	0,2,RAText2
	menu_item	0,3,LAText2
	menu_item	0,4,SPText
	menu_item	0,5,RPText
	menu_item	0,6,MPText
	menu_item	0,8,ATText
