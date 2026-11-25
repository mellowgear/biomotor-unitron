; ExpCurve2 (exp_curves): 50 records of 2 bytes, one line per id; keep the order and count.
; Line = your level; value = EXP needed to reach the next level (0 = max level 50).
; dyn_207B12 (level up): when EXP-to-next (0x5023) reaches 0, it adds the value for the
; new level and the level (0x5022) goes up; a new game starts at level 0 and levels once.
; One curve per race: ExpCurves pointer table 0x224FF5 [(0x5021 - 1) / 2], 0x5021 =
; race/gender 1-10 (1 = Human male confirmed in play; the rest in Select Player order).
; Every curve is a flat 150 per level. Checked in play: Rod (Human) at level 3 with 11 to
; go got 12 EXP and showed level 4 with 149 to go (11 - 12 + 150).
; What changes with your level is the EXP per kill: see tables/exp_level_diff.asm (10%-130%
; of the enemy's exp, by enemy level - your level), and scaled enemies' levels rise
; with the area (tables/enemy_scaling.asm).
; id: forester
	dw	150	; 1
	dw	150	; 2
	dw	150	; 3
	dw	150	; 4
	dw	150	; 5
	dw	150	; 6
	dw	150	; 7
	dw	150	; 8
	dw	150	; 9
	dw	150	; 10
	dw	150	; 11
	dw	150	; 12
	dw	150	; 13
	dw	150	; 14
	dw	150	; 15
	dw	150	; 16
	dw	150	; 17
	dw	150	; 18
	dw	150	; 19
	dw	150	; 20
	dw	150	; 21
	dw	150	; 22
	dw	150	; 23
	dw	150	; 24
	dw	150	; 25
	dw	150	; 26
	dw	150	; 27
	dw	150	; 28
	dw	150	; 29
	dw	150	; 30
	dw	150	; 31
	dw	150	; 32
	dw	150	; 33
	dw	150	; 34
	dw	150	; 35
	dw	150	; 36
	dw	150	; 37
	dw	150	; 38
	dw	150	; 39
	dw	150	; 40
	dw	150	; 41
	dw	150	; 42
	dw	150	; 43
	dw	150	; 44
	dw	150	; 45
	dw	150	; 46
	dw	150	; 47
	dw	150	; 48
	dw	150	; 49
	dw	  0	; 50
