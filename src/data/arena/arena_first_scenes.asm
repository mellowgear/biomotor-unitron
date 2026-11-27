; ArenaRankFirstScene (arena_first_scenes): 8 records of 1 bytes, one line per id; keep the order and count.
; GetArenaRankFirstScene: when the chosen rank (task +0x15 = choice + 2) is above GetStageArenaRank, the
; scene for line rank - 1 (values 0x50+ through tables/arena_gender_scenes.asm); otherwise 2, or 3 at
; rank 9.
; id: scene
	db	16	; 1
	db	19	; 2
	db	22	; 3
	db	25	; 4
	db	28	; 5
	db	90	; 6
	db	44	; 7
	db	60	; 8
