; data/items/tables.asm: the items tables in ROM order, one section per part; each part is a
; file in src/data/items/: numbers as asm900 records (#include), names as text slot
; files ($include, character codes from the charmap). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_224612	section	romdata abs=0x224612
BattleItemEffects:
#include "src/data/items/battle_item_effects.asm"
d_2497CB	section	romdata abs=0x2497CB
FixItHP:
#include "src/data/items/fixit_hp.asm"
d_24982A	section	romdata abs=0x24982A
; [code] dungeon.asm (camp item use, after CampUseHealItem): message per item - 0x26 (FixIt1-4,
; FullFx, Clear); the
; first entry points one byte into its string, past the line command
ItemUseTexts:
	dl	T30HPRestoredText+1,T50HPRestoredText,T100HPRestoredText,T150HPRestoredText
	dl	AllHPRestoredText,StatusClearedText
d_25ABAC	section	romdata abs=0x25ABAC
ItemNamesWorks:
$include "src/data/items/names.asm"
d_25AD9D	section	romdata abs=0x25AD9D
ItemDescsWorks:
$include "src/data/items/descs.asm"
d_25B2E2	section	romdata abs=0x25B2E2
ItemGroupSizes:
#include "src/data/items/item_groups.asm"
d_25B2E7	section	romdata abs=0x25B2E7
ItemGroupStarts:
#include "src/data/items/item_group_starts.asm"
d_25B2EB	section	romdata abs=0x25B2EB
ItemGroupIds:
#include "src/data/items/item_works/group_ids.asm"
d_25B379	section	romdata abs=0x25B379
ItemValues_25B379:
#include "src/data/items/item_works/values_25B379.asm"
d_25B407	section	romdata abs=0x25B407
ItemAffinity:
#include "src/data/items/item_works/affinity.asm"
d_25B495	section	romdata abs=0x25B495
AccessoryData:
#include "src/data/items/accessory_data.asm"
d_25B4DF	section	romdata abs=0x25B4DF
ItemPrices:
#include "src/data/items/prices.asm"
d_270E15	section	romdata abs=0x270E15
ItemNames:
$include "src/data/items/names.asm"
d_271006	section	romdata abs=0x271006
ItemDescs:
$include "src/data/items/descs.asm"
d_27154B	section	romdata abs=0x27154B
ItemGroupSizesCopy:
#include "src/data/items/item_groups.asm"
d_271550	section	romdata abs=0x271550
ItemGroupStartsCopy:
#include "src/data/items/item_group_starts.asm"
d_271554	section	romdata abs=0x271554
ItemGroupIdsCopy:
#include "src/data/items/item_works/group_ids.asm"
d_2715E2	section	romdata abs=0x2715E2
ItemValues_25B379Copy:
#include "src/data/items/item_works/values_25B379.asm"
d_271670	section	romdata abs=0x271670
ItemAffinityCopy:
#include "src/data/items/item_works/affinity.asm"
d_2716FE	section	romdata abs=0x2716FE
AccessoryDataCopy:
#include "src/data/items/accessory_data.asm"
d_271748	section	romdata abs=0x271748
ItemPricesCopy:
#include "src/data/items/prices.asm"
