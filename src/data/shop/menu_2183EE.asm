; the part list screens (Body, Core, Leg, BPack, Arm, Arm-Sel, Mate.-Sel, Tool-Sel)
; list screen tables (ListReset): the caller sets 0x6172 = the cursor stops of the list rows
; (GetListCursorCell: column, row, 0x615F of them); lines are drawn by PrintStringTable (column, row, string)
d_2183EE	section	romdata abs=0x2183EE
; [code] DrawShopBuyPartPage and works.asm: 0x6172, 10 rows
ListCursor_2183EE:
	db	0,1, 0,2, 0,3, 0,4, 0,5, 0,6, 0,7, 0,8, 0,9, 0,10	; column, row
d_218402	section	romdata abs=0x218402
$include "src/data/shop/menu_texts_218402.asm"
d_21845A	section	romdata abs=0x21845A
; [code] shop.asm / works.asm part lists: title per list (0x6182)
PartListTitles:
	dl	BodyText,CoreText2,LegText2,BPackText2,ArmText2,ArmSelText,MateSelText,ToolSelText
d_21847A	section	romdata abs=0x21847A
$include "src/data/shop/menu_texts_21847A.asm"
d_218488	section	romdata abs=0x218488
; [code] the list page callbacks: PrintStringTable with B = 1 in box 3, the "/" between the page (column 5) and page count (column 8) on row 0xB
PartListPageSlash:
	menu_item	7,0xB,SlashText4
