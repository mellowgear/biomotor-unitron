; data/battle/tables.asm: the battle tables in ROM order, one section per part; each part is a
; file in src/data/battle/: numbers as asm900 records (#include), names as text slot
; files ($include, character codes from the charmap). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_221120	section	romdata abs=0x221120
SkillNames:
$include "src/data/battle/skills/names.asm"
d_2211AC	section	romdata abs=0x2211AC
SkillDescs:
$include "src/data/battle/skills/descs.asm"
d_221328	section	romdata abs=0x221328
SkillStats:
#include "src/data/battle/skills/stats.asm"
d_221490	section	romdata abs=0x221490
SkillData:
#include "src/data/battle/skills/data.asm"
d_221530	section	romdata abs=0x221530
EnemyNames:
$include "src/data/battle/enemies/names.asm"
d_22186A	section	romdata abs=0x22186A
EnemyStats:
#include "src/data/battle/enemies/stats.asm"
d_222466	section	romdata abs=0x222466
AttackNames:
$include "src/data/battle/attack_names.asm"
d_2226C7	section	romdata abs=0x2226C7
EnemyAttacks:
#include "src/data/battle/enemy_attacks.asm"
d_22464A	section	romdata abs=0x22464A
AffinityTable:
#include "src/data/battle/affinity.asm"
d_2246EC	section	romdata abs=0x2246EC
EnemyScaling:
#include "src/data/battle/enemy_scaling.asm"
d_2247CC	section	romdata abs=0x2247CC
DamageTable:
#include "src/data/battle/damage.asm"
d_224FB0	section	romdata abs=0x224FB0
LevelGapCrit:
#include "src/data/battle/level_gap_chances/crit.asm"
d_224FC7	section	romdata abs=0x224FC7
LevelGapStatus:
#include "src/data/battle/level_gap_chances/status.asm"
d_224FDE	section	romdata abs=0x224FDE
LevelGapFlee:
#include "src/data/battle/level_gap_chances/flee.asm"
d_2253BD	section	romdata abs=0x2253BD
LevelRolls:
#include "src/data/battle/level_rolls.asm"
d_2253D3	section	romdata abs=0x2253D3
ExpLevelDiff:
#include "src/data/battle/exp_level_diff.asm"
d_2253F5	section	romdata abs=0x2253F5
StatusRecovery:
#include "src/data/battle/status_recovery.asm"
d_22540B	section	romdata abs=0x22540B
#include "src/data/battle/default_attack.asm"
d_225BAA	section	romdata abs=0x225BAA
; [code] EnemyHitResult2-4 (wEnemyAttackStatus) and ConfusedPlayerHitResult (wInflictStatus): message per status (0-4) when a hit
; inflicts a status on the player's unit
PlayerStatusTexts:
	dl	YouDodgedTheExtraText,YouveBeenParalyzedText,YourUNITRONRustedText,YoureLeakingEnergyText
	dl	YouveBecomeConfusedText
d_225BBE	section	romdata abs=0x225BBE
; [code] the same for the player's hits on the enemy (status 0-4)
StatusInflictedTexts:
	dl	DodgedTheExtraAttackText,IsParalyzedText,RustedText,IsLeakingEnergyText
	dl	IsConfusedText
d_225BD2	section	romdata abs=0x225BD2
; [code] the attack line per wBattleChoice (0 right arm, 1 left arm, 2-3 the two special
; attacks: <SKILL1> / <SKILL2>), ShowMessage (battle.asm 0x209F9x and 0x20A0xx)
BattleChoiceTexts:
	dl	PlayersRightArmText,PlayersLeftArmText,PlayerSSpecialAttackText,PlayerSSpecialAttackText2
d_226DCE	section	romdata abs=0x226DCE
BattleEffectSounds:
#include "src/data/battle/effect_sounds.asm"
