; data/tables.s: game database tables (src/tables/*.txt), in ROM order (each keeps its address with .org)

.org 0x21BA31
Recipes:
.incbin "../../build/tables/recipes.Recipes.bin"
.org 0x221120
SkillNames:
.incbin "../../build/tables/skills.SkillNames.bin"
.org 0x2211AC
SkillDescs:
.incbin "../../build/tables/skills.SkillDescs.bin"
.org 0x221328
SkillStats:
.incbin "../../build/tables/skills.SkillStats.bin"
.org 0x221490
SkillData:
.incbin "../../build/tables/skills.SkillData.bin"
.org 0x221530
EnemyNames:
.incbin "../../build/tables/enemies.EnemyNames.bin"
.org 0x22186A
EnemyStats:
.incbin "../../build/tables/enemies.EnemyStats.bin"
.org 0x222466
AttackNames:
.incbin "../../build/tables/attack_names.AttackNames.bin"
.org 0x2226C7
EnemyAttacks:
.incbin "../../build/tables/enemy_attacks.EnemyAttacks.bin"
.org 0x22426F
ArmEffects:
.incbin "../../build/tables/arm_effects.ArmEffects.bin"
.org 0x224612
BattleItemEffects:
.incbin "../../build/tables/battle_item_effects.BattleItemEffects.bin"
.org 0x22464A
AffinityTable:
.incbin "../../build/tables/affinity.AffinityTable.bin"
.org 0x2246EC
EnemyScaling:
.incbin "../../build/tables/enemy_scaling.EnemyScaling.bin"
.org 0x2247CC
DamageTable:
.incbin "../../build/tables/damage.DamageTable.bin"
.org 0x224FB0
LevelGapCrit:
.incbin "../../build/tables/level_gap_chances.LevelGapCrit.bin"
.org 0x224FC7
LevelGapStatus:
.incbin "../../build/tables/level_gap_chances.LevelGapStatus.bin"
.org 0x224FDE
LevelGapFlee:
.incbin "../../build/tables/level_gap_chances.LevelGapFlee.bin"
.org 0x225009
ExpCurve1:
.incbin "../../build/tables/exp_curves.ExpCurve1.bin"
.org 0x22506D
ExpCurve2:
.incbin "../../build/tables/exp_curves.ExpCurve2.bin"
.org 0x2250D1
ExpCurve3:
.incbin "../../build/tables/exp_curves.ExpCurve3.bin"
.org 0x225135
ExpCurve4:
.incbin "../../build/tables/exp_curves.ExpCurve4.bin"
.org 0x225199
ExpCurve5:
.incbin "../../build/tables/exp_curves.ExpCurve5.bin"
.org 0x2251FD
LevelGainsOdd:
.incbin "../../build/tables/level_gains.LevelGainsOdd.bin"
.org 0x2252C9
LevelGainsEven:
.incbin "../../build/tables/level_gains.LevelGainsEven.bin"
.org 0x225395
LevelBonus:
.incbin "../../build/tables/level_bonus.LevelBonus.bin"
.org 0x2253BD
LevelRolls:
.incbin "../../build/tables/level_rolls.LevelRolls.bin"
.org 0x2253D3
ExpLevelDiff:
.incbin "../../build/tables/exp_level_diff.ExpLevelDiff.bin"
.org 0x2253F5
StatusRecovery:
.incbin "../../build/tables/status_recovery.StatusRecovery.bin"
.org 0x2275C0
EncounterChance:
.incbin "../../build/tables/encounter_chance.EncounterChance.bin"
.org 0x2495EC
WorldChests:
.incbin "../../build/tables/chests.WorldChests.bin"
.org 0x2496B0
MineChests:
.incbin "../../build/tables/mine_chests.MineChests.bin"
.org 0x2496CE
ChestGold:
.incbin "../../build/tables/chest_gold.ChestGold.bin"
.org 0x2496EE
ChestGoldText:
.incbin "../../build/tables/chest_gold.ChestGoldText.bin"
.org 0x24974E
ChestOdds:
.incbin "../../build/tables/chest_odds.ChestOdds.bin"
.org 0x2497CB
FixItHP:
.incbin "../../build/tables/fixit_hp.FixItHP.bin"
.org 0x249CF6
ArenaBracketSizes:
.incbin "../../build/tables/arena_brackets.ArenaBracketSizes.bin"
.org 0x249CFE
ArenaBrackets:
.incbin "../../build/tables/arena_brackets.ArenaBrackets.bin"
.org 0x249FB8
CyriusTradeMenu:
.incbin "../../build/tables/cyrius_trades.CyriusTradeMenu.bin"
.org 0x24A1B8
TetisGifts:
.incbin "../../build/tables/tetis_gifts.TetisGifts.bin"
.org 0x24A1CE
TetisGiftIndex:
.incbin "../../build/tables/tetis_gift_index.TetisGiftIndex.bin"
.org 0x24A1DC
StageStatBonus:
.incbin "../../build/tables/stage_stat_bonus.StageStatBonus.bin"
.org 0x24A212
StageArenaRank:
.incbin "../../build/tables/stage_arena_rank.StageArenaRank.bin"
.org 0x24A21E
StageFlags:
.incbin "../../build/tables/stage_flags.StageFlags.bin"
.org 0x25B4DF
ItemPrices:
.incbin "../../build/tables/items.ItemPrices.bin"
.org 0x25E5E3
DevLevelBonusMale:
.incbin "../../build/tables/dev_level_bonus.DevLevelBonusMale.bin"
.org 0x25E616
DevLevelBonusFemale:
.incbin "../../build/tables/dev_level_bonus.DevLevelBonusFemale.bin"
.org 0x25E649
DevLevelExpMale:
.incbin "../../build/tables/dev_level_exp.DevLevelExpMale.bin"
.org 0x25E67B
DevLevelExpFemale:
.incbin "../../build/tables/dev_level_exp.DevLevelExpFemale.bin"
.org 0x25E6AD
DevPartnerBonus:
.incbin "../../build/tables/dev_partner_bonus.DevPartnerBonus.bin"
.org 0x270E15
ItemNames:
.incbin "../../build/tables/items.ItemNames.bin"
.org 0x271006
ItemDescs:
.incbin "../../build/tables/items.ItemDescs.bin"
.org 0x271864
StartingEquipment:
.incbin "../../build/tables/start_equipment.StartingEquipment.bin"
.org 0x27188C
PartNames:
.incbin "../../build/tables/parts.PartNames.bin"
.org 0x271EC1
PartDescs:
.incbin "../../build/tables/parts.PartDescs.bin"
.org 0x273178
PartStats:
.incbin "../../build/tables/parts.PartStats.bin"
