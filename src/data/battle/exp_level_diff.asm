; ExpLevelDiff (exp_level_diff): 11 records of 1 bytes, one line per id; keep the order and count.
; EXP per kill, by how the enemy's level compares with yours (swp_208A36):
;   exp gained = enemy exp (tables/enemies/) x exp_pct / 100, rounded up.
; Line 1 = enemy 5 or more levels below you ... line 6 = same level ... line 11 = enemy
; 5 or more above you (difference clamped to -5..+5).
; Checked in play: 46 of 46 kills matched (e.g. exp 10: enemy -2 levels -> 8, +6 -> 13).
; Together with tables/exp_curves/ (a flat 150 EXP per level) this is the whole EXP system: the
; cost of a level never changes, the EXP per kill does.
; id: exp_pct
	db	 10	; 1 enemy 5+ levels below you
	db	 25	; 2 enemy 4 levels below you
	db	 50	; 3 enemy 3 levels below you
	db	 75	; 4 enemy 2 levels below you
	db	 90	; 5 enemy 1 level below you
	db	100	; 6 enemy same level
	db	110	; 7 enemy 1 level above you
	db	115	; 8 enemy 2 levels above you
	db	120	; 9 enemy 3 levels above you
	db	125	; 10 enemy 4 levels above you
	db	130	; 11 enemy 5+ levels above you
