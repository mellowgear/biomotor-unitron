; data/arena/tables.asm: the arena tables in ROM order, one section per part; each part is a
; file in src/data/arena/: numbers as asm900 records (#include), names as a slot file that
; unitron text turns into build/data/arena/<file>.asm ($include). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_249A5E	section	romdata abs=0x249A5E
ArenaGenderScenes:
#include "src/data/arena/arena_gender_scenes.asm"
d_249A7E	section	romdata abs=0x249A7E
ArenaSceneEndActions:
#include "src/data/arena/arena_scenes/end_actions.asm"
d_249AC4	section	romdata abs=0x249AC4
ArenaRankFirstScene:
#include "src/data/arena/arena_first_scenes.asm"
d_249ACC	section	romdata abs=0x249ACC
ArenaSceneNext:
#include "src/data/arena/arena_scenes/next.asm"
d_249B12	section	romdata abs=0x249B12
ArenaSceneCast:
#include "src/data/arena/arena_scenes/cast.asm"
d_249B66	section	romdata abs=0x249B66
StageRequiredTalkCounts:
#include "src/data/arena/stage_required_talk_counts.asm"
d_249B72	section	romdata abs=0x249B72
StageRequiredTalkLists:
#include "src/data/arena/stage_required_talk_lists.asm"
d_249C2F	section	romdata abs=0x249C2F
ArenaEntryCosts:
#include "src/data/arena/arena_entry_costs.asm"
d_249CE1	section	romdata abs=0x249CE1
ArenaPrizeGP:
#include "src/data/arena/arena_prize_gp.asm"
d_249CEF	section	romdata abs=0x249CEF
ArenaPrizeItems:
#include "src/data/arena/arena_prize_items.asm"
d_249CF6	section	romdata abs=0x249CF6
ArenaBracketSizes:
#include "src/data/arena/arena_brackets/sizes.asm"
d_249CFE	section	romdata abs=0x249CFE
ArenaBrackets:
#include "src/data/arena/arena_brackets/brackets.asm"
d_249D4E	section	romdata abs=0x249D4E
ArenaPilotBodyBase:
#include "src/data/arena/arena_pilot_parts/body_base.asm"
d_249D54	section	romdata abs=0x249D54
ArenaPilotCores:
#include "src/data/arena/arena_pilot_parts/cores.asm"
d_249D5A	section	romdata abs=0x249D5A
ArenaPilotLegCounts:
#include "src/data/arena/arena_pilot_parts/leg_counts.asm"
d_249D60	section	romdata abs=0x249D60
ArenaPilotLegs:
#include "src/data/arena/arena_pilot_parts/legs.asm"
d_249DBA	section	romdata abs=0x249DBA
ArenaPilotBackCounts:
#include "src/data/arena/arena_pilot_parts/back_counts.asm"
d_249DC0	section	romdata abs=0x249DC0
ArenaPilotBacks:
#include "src/data/arena/arena_pilot_parts/backs.asm"
d_249E1A	section	romdata abs=0x249E1A
ArenaPilotArmCounts:
#include "src/data/arena/arena_pilot_parts/arm_counts.asm"
d_249E20	section	romdata abs=0x249E20
ArenaPilotArms:
#include "src/data/arena/arena_pilot_parts/arms.asm"
