; data/parts/tables.asm: the parts tables in ROM order, one section per part; each part is a
; file in src/data/parts/: numbers as asm900 records (#include), names as a slot file that
; unitron text turns into build/data/parts/<file>.asm ($include). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_21F01C	section	romdata abs=0x21F01C
PartOffsetsBody:
#include "src/data/parts/part_offsets_body.asm"
d_21F03C	section	romdata abs=0x21F03C
PartOffsetsRightArm:
#include "src/data/parts/part_offsets_arm_r.asm"
d_21FA5C	section	romdata abs=0x21FA5C
PartOffsetsLeftArm:
#include "src/data/parts/part_offsets_arm_l.asm"
d_22047C	section	romdata abs=0x22047C
PartOffsetsLegs:
#include "src/data/parts/part_offsets_legs.asm"
d_220ABC	section	romdata abs=0x220ABC
PartOffsetsBack:
#include "src/data/parts/part_offsets_back.asm"
d_22426F	section	romdata abs=0x22426F
ArmEffects:
#include "src/data/parts/arm_effects.asm"
d_25B619	section	romdata abs=0x25B619
PartCategoryStartWorks:
#include "src/data/parts/category_start.asm"
d_25B623	section	romdata abs=0x25B623
PartNamesWorks:
$include "build/data/parts/names.asm"	; src/data/parts/names.txt
d_25BC58	section	romdata abs=0x25BC58
PartDescsWorks:
$include "build/data/parts/descs.asm"	; src/data/parts/descs.txt
d_25CD31	section	romdata abs=0x25CD31
PartIdWords:
#include "src/data/parts/part_id_words.asm"
d_25CF0F	section	romdata abs=0x25CF0F
PartStatsWorks:
#include "src/data/parts/stats.asm"
d_271882	section	romdata abs=0x271882
PartCategoryStart:
#include "src/data/parts/category_start.asm"
d_27188C	section	romdata abs=0x27188C
PartNames:
$include "build/data/parts/names.asm"	; src/data/parts/names.txt
d_271EC1	section	romdata abs=0x271EC1
PartDescs:
$include "build/data/parts/descs.asm"	; src/data/parts/descs.txt
d_272F9A	section	romdata abs=0x272F9A
PartIdWordsCopy:
#include "src/data/parts/part_id_words.asm"
d_273178	section	romdata abs=0x273178
PartStats:
#include "src/data/parts/stats.asm"
