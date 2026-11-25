; data/story/tables.asm: the story tables in ROM order, one section per part; each part is a
; file in src/data/story/: numbers as asm900 records (#include), names as a slot file that
; unitron text turns into build/data/story/<file>.asm ($include). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_24A1DC	section	romdata abs=0x24A1DC
StageStatBonus:
#include "src/data/story/stage_stat_bonus.asm"
d_24A212	section	romdata abs=0x24A212
StageArenaRank:
#include "src/data/story/stage_arena_rank.asm"
d_24A21E	section	romdata abs=0x24A21E
StageFlags:
#include "src/data/story/stage_flags.asm"
