; LevelGapStatus (level_gap_chances): 23 records of 1 bytes, one line per id; keep the order and count.
; Battle start (AddLevelGapChances 0x207F7C): line = your level - enemy level + 12, clamped to
; 1-23 (line 12 = same level). Adds crit to wCritChance (critical hit %), status to
; wStatusChance (an arm's status landing %), flee to wFleeChance (TryFlee %); the enemy gets
; the line for its own gap. Bosses (enemy ids 89-97 and 113+) get no flee or status chance.
; id: status
	db	 5	; 1 you are 11+ levels below
	db	 5	; 2 you are 10 levels below
	db	 6	; 3 you are 9 levels below
	db	 7	; 4 you are 8 levels below
	db	 8	; 5 you are 7 levels below
	db	 9	; 6 you are 6 levels below
	db	10	; 7 you are 5 levels below
	db	11	; 8 you are 4 levels below
	db	12	; 9 you are 3 levels below
	db	13	; 10 you are 2 levels below
	db	14	; 11 you are 1 level below
	db	15	; 12 same level
	db	17	; 13 you are 1 level above
	db	19	; 14 you are 2 levels above
	db	21	; 15 you are 3 levels above
	db	23	; 16 you are 4 levels above
	db	25	; 17 you are 5 levels above
	db	27	; 18 you are 6 levels above
	db	29	; 19 you are 7 levels above
	db	31	; 20 you are 8 levels above
	db	33	; 21 you are 9 levels above
	db	35	; 22 you are 10 levels above
	db	35	; 23 you are 11+ levels above
