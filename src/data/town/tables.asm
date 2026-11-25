; data/town/tables.asm: the town tables in ROM order, one section per part; each part is a
; file in src/data/town/: numbers as asm900 records (#include), names as a slot file that
; unitron text turns into build/data/town/<file>.asm ($include). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_249EC7	section	romdata abs=0x249EC7
PlacePortraits:
#include "src/data/town/place_portraits.asm"
d_249FB8	section	romdata abs=0x249FB8
CyriusTradeMenu:
#include "src/data/town/cyrius_trades.asm"
d_24A094	section	romdata abs=0x24A094
CollaItems:
#include "src/data/town/colla_offers/items.asm"
d_24A09E	section	romdata abs=0x24A09E
CollaOdds:
#include "src/data/town/colla_offers/odds.asm"
d_24A0DA	section	romdata abs=0x24A0DA
CollaPriceOdds:
#include "src/data/town/colla_price_odds.asm"
d_24A0DF	section	romdata abs=0x24A0DF
CollaPrices:
#include "src/data/town/colla_offers/prices.asm"
d_24A1B8	section	romdata abs=0x24A1B8
TetisGifts:
#include "src/data/town/tetis_gifts.asm"
d_24A1CE	section	romdata abs=0x24A1CE
TetisGiftIndex:
#include "src/data/town/tetis_gift_index.asm"
d_24A248	section	romdata abs=0x24A248
TalkDefaultRow:
#include "src/data/town/talk_default.asm"
d_24A250	section	romdata abs=0x24A250
TalkPlaceRows:
#include "src/data/town/talk_places.asm"
d_24A270	section	romdata abs=0x24A270
TalkSlotsPub:
#include "src/data/town/talk_slots_pub.asm"
d_24A2A0	section	romdata abs=0x24A2A0
TalkSlotsDTown:
#include "src/data/town/talk_slots_dtown.asm"
d_24A2D0	section	romdata abs=0x24A2D0
TalkSlotsForest:
#include "src/data/town/talk_slots_forest.asm"
d_24A2E8	section	romdata abs=0x24A2E8
TalkSlotsSpring:
#include "src/data/town/talk_slots_spring.asm"
d_24A2F4	section	romdata abs=0x24A2F4
TalkSlotLists:
#include "src/data/town/talk_slot_lists/lists.asm"
d_24A304	section	romdata abs=0x24A304
TalkSlotCounts:
#include "src/data/town/talk_slot_lists/counts.asm"
d_24A308	section	romdata abs=0x24A308
TalkNpcRows:
#include "src/data/town/talk_npc_rows.asm"
d_253E31	section	romdata abs=0x253E31
TalkDTown:
#include "src/data/town/talk_dtown.asm"
d_254131	section	romdata abs=0x254131
TalkForest:
#include "src/data/town/talk_forest.asm"
d_254251	section	romdata abs=0x254251
TalkSpring:
#include "src/data/town/talk_spring.asm"
d_25945B	section	romdata abs=0x25945B
TalkPub:
#include "src/data/town/talk_pub.asm"
d_259603	section	romdata abs=0x259603
TalkWorks:
#include "src/data/town/talk_works.asm"
d_259683	section	romdata abs=0x259683
TalkGenderTexts:
#include "src/data/town/talk_gender_texts.asm"
d_2596DB	section	romdata abs=0x2596DB
TalkShop:
#include "src/data/town/talk_shop.asm"
d_25972B	section	romdata abs=0x25972B
TalkPlace7:
#include "src/data/town/talk_place7.asm"
d_25973B	section	romdata abs=0x25973B
TalkPlace8:
#include "src/data/town/talk_place8.asm"
