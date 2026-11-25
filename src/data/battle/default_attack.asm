; [code] EnemyChooseAttack: the attack slot an enemy uses when its EP is below every slot's cost
; (wEnemyAttackSlot = DefaultEnemyAttack), one enemy_attack record (fields: enemy_attacks.asm).
; Its effect list (DefaultEnemyAttack+SLOT_EFFECTS, effect 0xDE) is also played on its own
; by two battle.asm routines (ld XHL,DefaultEnemyAttack+SLOT_EFFECTS before PlayEffectList).
DefaultEnemyAttack:
	enemy_attack	255,0,13,0,0,100,2,0xDE,0xFF,0xFF,0xFF,0xFF,0xFF

; [code] battle effect lists for PlayEffectList (task +0x14: effect ids until 0xFF), one
; caller each in battle.asm (Data_22541A: two)
Data_22541A:
	db	0xCC,0x0E,0xFF
Data_22541D:
	db	0xE0,0xD7,0xFF
Data_225420:
	db	0xDF,0xD6,0xFF
