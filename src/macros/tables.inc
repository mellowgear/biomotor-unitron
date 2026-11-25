; Table record macros (Toshiba's ?macro ... ?endm), one per record layout that mixes byte,
; word and long fields. Each call is one record, the fields in ROM order; see the table files
; in src/data/<subject>/ for what the fields mean.

; enemy_stat: one record of 26 bytes (EnemyStats)
?macro enemy_stat level,f01,hp,ep,ap,sp,rp,mp,affinity,image,exp,gp,drop,drop_pct,f19
	db	?level,?f01
	dw	?hp,?ep,?ap,?sp,?rp,?mp,?affinity,?image,?exp,?gp,?drop
	db	?drop_pct,?f19
?endm

; enemy_attack: one record of 15 bytes (EnemyAttacks)
?macro enemy_attack attack,power,action,ep,affinity,pct,f0,effects1,effects2,effects3,effects4,effects5,effects6
	db	?attack
	dw	?power
	db	?action
	dw	?ep
	db	?affinity,?pct,?f0,?effects1,?effects2,?effects3,?effects4,?effects5,?effects6
?endm

; enemy_scaling: one record of 14 bytes (EnemyScaling)
?macro enemy_scaling hp_pct,ep_pct,ap_pct,sp_pct,rp_pct,mp_pct,level_base,level_rand
	dw	?hp_pct,?ep_pct,?ap_pct,?sp_pct,?rp_pct,?mp_pct
	db	?level_base,?level_rand
?endm

; part_stat: one record of 24 bytes (PartStats)
?macro part_stat hp,ep,ap,sp,rp,mp,ep_cost,affinity,status,image,p13,price
	dw	?hp,?ep,?ap,?sp,?rp,?mp,?ep_cost,?affinity,?status
	db	?image,?p13
	dd	?price
?endm

; talk_row: one record of 8 bytes (TalkDefaultRow, TalkDTown, TalkForest, TalkSpring, TalkPub, TalkWorks, TalkShop, TalkPlace7, TalkPlace8)
?macro talk_row speaker,portrait,flag,next,message
	db	?speaker,?portrait,?flag,?next
	dd	?message
?endm

; player_dungeon_sprite: one record of 10 bytes (PlayerDungeonSprites)
?macro player_dungeon_sprite w,h,t1,t2,t3,t4
	db	?w,?h
	dw	?t1,?t2,?t3,?t4
?endm

; sound_cue: one entry of 3 bytes (BattleEffectSounds lists): frame, then the SoundCommand word
?macro sound_cue frame,sound
	db	?frame
	dw	?sound
?endm

; menu_item: one menu line of 6 bytes (the menu tables read by swp_2171F0 / swp_217207):
; text box column and row, then the string
?macro menu_item column,row,text
	db	?column,?row
	dl	?text
?endm
