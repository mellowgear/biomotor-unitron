; StageStatBonus (stage_stat_bonus): 8 records of 4 bytes, one line per id; keep the order and count.
; Added to the pilot's wPilotAP/SP/RP/MP by NpcTalkRowAction when Camil's row sets flag 0x4A, line = story stage
; 1-8. (Play: after the Rank CS win, stage 8, Camil's cake gave +5 to all four.)
; id: ap, sp, rp, mp
	db	0,0,0,0	; 1
	db	0,0,5,0	; 2
	db	0,5,0,0	; 3
	db	5,0,0,0	; 4
	db	0,0,0,5	; 5
	db	0,5,0,5	; 6
	db	5,0,5,0	; 7
	db	5,5,5,5	; 8
