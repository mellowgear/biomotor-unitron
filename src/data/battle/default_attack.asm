; [code] EnemyChooseAttack: the attack slot an enemy uses when its EP is below every slot's cost
; (wEnemyAttackSlot = DefaultEnemyAttack), one enemy_attack record (fields: enemy_attacks.asm).
; Its effect list (DefaultEnemyAttack+SLOT_EFFECTS, effect 0xDE) is also played on its own
; by two battle.asm routines (ld XHL,DefaultEnemyAttack+SLOT_EFFECTS before PlayEffectList).
DefaultEnemyAttack:
	enemy_attack	255,0,13,0,0,100,2,0xDE,0xFF,0xFF,0xFF,0xFF,0xFF

; [code] battle effect lists for PlayEffectList (task +0x14: effect ids until 0xFF), one
; caller each in battle code (BattleEndEffects: two)
; [code] BattleVictory and BattleDefeat (was Data_22541A)
BattleEndEffects:
	db	0xCC,0x0E,0xFF
; [code] BattleStatusEffects at HP 0 with an ITEM_AUTORP accessory: the accessory is used up, HP = max HP / 2 (was Data_22541D)
AutoRPReviveEffects:
	db	0xE0,0xD7,0xFF
; [code] BattleStatusEffects when EP is below wMinEPCost with an ITEM_PROPLR accessory: the accessory is used up (was Data_225420)
PropellerEffects:
	db	0xDF,0xD6,0xFF
