; data/shop/tables.asm: the shop tables in ROM order, one section per part; each part is a
; file in src/data/shop/: numbers as asm900 records (#include), names as text slot
; files ($include, character codes from the charmap). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

#include "src/data/shop/menu_217D1B.asm"
#include "src/data/shop/menu_2181D8.asm"
#include "src/data/shop/menu_2183EE.asm"
d_25E4B9	section	romdata abs=0x25E4B9
ShopItemStock:
#include "src/data/shop/shop_item_stock.asm"
d_25E500	section	romdata abs=0x25E500
ShopPartStock:
#include "src/data/shop/shop_part_stock.asm"
