; ArenaEntryCosts (arena_entry_costs): 8 records of 2 bytes, one line per id; keep the order and count.
; ArenaRankListChoose / ArenaFightQuitChoose: GP to enter the rank picked in the menu (line = choice + 1, ranks
; E D C B A S CS X; the names are the pointers at 0x249C0F), compared with and taken from wGP.
; id: gp
	dw	  200	; 1 Rank E
	dw	  500	; 2 Rank D
	dw	 1000	; 3 Rank C
	dw	 2000	; 4 Rank B
	dw	 3000	; 5 Rank A
	dw	 5000	; 6 Rank S
	dw	10000	; 7 Rank CS
	dw	    0	; 8 Rank X
