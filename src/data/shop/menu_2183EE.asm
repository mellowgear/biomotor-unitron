; the part list screens (Body, Core, Leg, BPack, Arm, Arm-Sel, Mate.-Sel, Tool-Sel)
; list screen tables (loc_217EEE): the caller sets 0x6172 = the cursor stops of the list rows
; (swp_218184: column, row, 0x615F of them); lines are drawn by swp_217207 (column, row, string)
d_2183EE	section	romdata abs=0x2183EE
; [code] swp_21B5A2 and works.asm: 0x6172, 10 rows
ListCursor_2183EE:
	db	0,1, 0,2, 0,3, 0,4, 0,5, 0,6, 0,7, 0,8, 0,9, 0,10	; column, row
d_218402	section	romdata abs=0x218402
$include "build/data/shop/menu_texts_218402.asm"	; src/data/shop/menu_texts_218402.txt
d_21845A	section	romdata abs=0x21845A
; [code] shop.asm / works.asm part lists: title per list (0x6182)
PartListTitles:
	dl	BodyText,CoreText2,LegText2,BPackText2,ArmText2,ArmSelText,MateSelText,ToolSelText
d_21847A	section	romdata abs=0x21847A
$include "build/data/shop/menu_texts_21847A.asm"	; src/data/shop/menu_texts_21847A.txt
