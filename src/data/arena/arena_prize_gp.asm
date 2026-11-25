; ArenaPrizeGP (arena_prize_gp): 7 records of 2 bytes, one line per id; keep the order and count.
; ArenaSceneEnd action 2 (rank won): AddGP(this) for the new GetStageArenaRank r = line + 1,
; r 2-7; at r 8 it adds 50000 twice instead, so line 7 is not read.
; id: gp
	dw	 1500	; 1 new rank 2
	dw	 3000	; 2 new rank 3
	dw	 5000	; 3 new rank 4
	dw	10000	; 4 new rank 5
	dw	25000	; 5 new rank 6
	dw	50000	; 6 new rank 7
	dw	65535	; 7 new rank 8 (not read)
