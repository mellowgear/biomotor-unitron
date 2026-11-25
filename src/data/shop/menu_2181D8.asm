; the item list screens (Acce., Item, Tool, Mate.)
; list screen tables (ListReset): the caller sets 0x6172 = the cursor stops of the list rows
; (GetListCursorCell: column, row, 0x615F of them); lines are drawn by PrintStringTable (column, row, string)
d_2181D8	section	romdata abs=0x2181D8
; [code] ShopBuyItemAcceptHook / ShopSellItemMoveHook: 0x6172, 10 rows
ListCursor_2181D8:
	db	0,1, 0,2, 0,3, 0,4, 0,5, 0,6, 0,7, 0,8, 0,9, 0,10	; column, row
d_2181EC	section	romdata abs=0x2181EC
$include "src/data/shop/menu_texts_2181EC.asm"
d_218218	section	romdata abs=0x218218
; [code] DrawShopBuyItemPage: title per item group (0x6182), box 3 column 0 row 0
ItemGroupTitles:
	dl	AcceText2,ItemText7,ToolText2,MateText2
d_218228	section	romdata abs=0x218228
$include "src/data/shop/menu_texts_218228.asm"
d_218236	section	romdata abs=0x218236
; [code] the list page callbacks: PrintStringTable with B = 1 in box 3, the "/" between the page (column 5) and page count (column 8) on row 0xB
ItemListPageSlash:
	menu_item	7,0xB,SlashText3
