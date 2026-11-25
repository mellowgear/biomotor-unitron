; LevelGapCrit (level_gap_chances): 23 records of 1 bytes, one line per id; keep the order and count.
; Battle start (AddLevelGapChances 0x207F7C): line = your level - enemy level + 12, clamped to
; 1-23 (line 12 = same level). Adds crit to wCritChance (critical hit %), status to
; wStatusChance (an arm's status landing %), flee to wFleeChance (TryFlee %); the enemy gets
; the line for its own gap. Bosses (enemy ids 89-97 and 113+) get no flee or status chance.
; id: crit
	db	 0	; 1 you are 11+ levels below
	db	 0	; 2 you are 10 levels below
	db	 0	; 3 you are 9 levels below
	db	 0	; 4 you are 8 levels below
	db	 0	; 5 you are 7 levels below
	db	 0	; 6 you are 6 levels below
	db	 1	; 7 you are 5 levels below
	db	 1	; 8 you are 4 levels below
	db	 1	; 9 you are 3 levels below
	db	 1	; 10 you are 2 levels below
	db	 1	; 11 you are 1 level below
	db	 5	; 12 same level
	db	 7	; 13 you are 1 level above
	db	 9	; 14 you are 2 levels above
	db	11	; 15 you are 3 levels above
	db	13	; 16 you are 4 levels above
	db	15	; 17 you are 5 levels above
	db	17	; 18 you are 6 levels above
	db	19	; 19 you are 7 levels above
	db	21	; 20 you are 8 levels above
	db	23	; 21 you are 9 levels above
	db	25	; 22 you are 10 levels above
	db	25	; 23 you are 11+ levels above
