; data/works/tables.asm: the works tables in ROM order, one section per part; each part is a
; file in src/data/works/: numbers as asm900 records (#include), names as a slot file that
; unitron text turns into build/data/works/<file>.asm ($include). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

#include "src/data/works/menu_217BCF.asm"
#include "src/data/works/menu_217D8B.asm"
#include "src/data/works/menu_2186D4.asm"
#include "src/data/works/menu_218A70.asm"
#include "src/data/works/menu_218F9F.asm"
#include "src/data/works/menu_2191AF.asm"
d_21BA31	section	romdata abs=0x21BA31
Recipes:
#include "src/data/works/recipes.asm"
d_25E5E3	section	romdata abs=0x25E5E3
DevLevelBonusMale:
#include "src/data/works/dev_level_bonus/male.asm"
d_25E616	section	romdata abs=0x25E616
DevLevelBonusFemale:
#include "src/data/works/dev_level_bonus/female.asm"
d_25E649	section	romdata abs=0x25E649
DevLevelExpMale:
#include "src/data/works/dev_level_exp/male.asm"
d_25E67B	section	romdata abs=0x25E67B
DevLevelExpFemale:
#include "src/data/works/dev_level_exp/female.asm"
d_25E6AD	section	romdata abs=0x25E6AD
DevPartnerBonus:
#include "src/data/works/dev_partner_bonus.asm"
