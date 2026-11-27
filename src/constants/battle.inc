; constants/battle.inc: wBattleResult values. BattleEnd copies its task argument here; the callers'
; wait loops (DungeonWaitBattleEnd, ArenaWaitBattleEnd, BossEncounter) poll it [code]
BATTLE_RESULT_WON	equ	0	; BattleVictory [code]
BATTLE_RESULT_ENEMY_FLED	equ	1	; the enemy got away (EnemyFleeSucceeded) [code]
BATTLE_RESULT_RETREAT	equ	2	; the player gave up (BattleRetreat) [code]
BATTLE_RESULT_LOST	equ	3	; BattleDefeat: the dungeon task leaves the dungeon [code]
BATTLE_RESULT_NONE	equ	0xFF	; still fighting (set by BattleStart) [code]
