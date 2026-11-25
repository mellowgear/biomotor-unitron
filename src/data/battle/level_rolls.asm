; LevelRolls (level_rolls): 11 records of 2 bytes, one line per id; keep the order and count.
; LevelRoll 0x208108: A = level -> random 1..rand + base, line = (level - 1) / 5 + 1.
; Added to both sides of the hit check (HitMargin 0x20818A: RP + LevelRoll against
; (enemy RP + 3) / 4 + enemy level; below = a miss) and of the damage (tables/damage.asm).
; id: rand, base
	db	10, 10	; 1
	db	10, 20	; 2
	db	10, 30	; 3
	db	10, 40	; 4
	db	10, 50	; 5
	db	10, 60	; 6
	db	10, 70	; 7
	db	10, 80	; 8
	db	10, 90	; 9
	db	10,100	; 10
	db	10,110	; 11
