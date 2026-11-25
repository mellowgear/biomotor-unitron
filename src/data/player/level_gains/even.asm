; LevelGainsEven (level_gains): 51 records of 4 bytes, one line per id; keep the order and count.
; TryLevelUp 0x207B12: on level up, pilot AP/SP/RP/MP (wPilotAP..wPilotMP) gain the row for the new
; level (line = level + 1); odd table if 0x5021 (race/gender) is odd, else even; then a random bonus
; from tables/level_bonus.asm.
; id: even_ap, even_sp, even_rp, even_mp
	db	2,2,3,3	; 1
	db	1,1,2,2	; 2
	db	1,1,2,2	; 3
	db	1,1,2,2	; 4
	db	1,1,2,2	; 5
	db	1,1,2,2	; 6
	db	1,1,3,2	; 7
	db	1,1,3,2	; 8
	db	1,1,3,2	; 9
	db	1,1,3,2	; 10
	db	1,1,3,2	; 11
	db	2,1,3,2	; 12
	db	2,1,3,2	; 13
	db	2,1,3,2	; 14
	db	2,1,3,2	; 15
	db	2,1,3,2	; 16
	db	2,2,3,2	; 17
	db	2,2,3,2	; 18
	db	2,2,3,2	; 19
	db	2,2,3,2	; 20
	db	2,2,3,2	; 21
	db	2,2,4,3	; 22
	db	2,2,4,3	; 23
	db	2,2,4,3	; 24
	db	2,2,4,3	; 25
	db	2,2,4,3	; 26
	db	2,2,4,4	; 27
	db	2,2,4,4	; 28
	db	2,2,4,4	; 29
	db	2,2,4,4	; 30
	db	2,2,4,4	; 31
	db	3,2,5,4	; 32
	db	3,2,5,4	; 33
	db	3,2,5,4	; 34
	db	3,2,5,4	; 35
	db	3,2,5,4	; 36
	db	3,3,5,5	; 37
	db	3,3,5,5	; 38
	db	3,3,5,5	; 39
	db	3,3,5,5	; 40
	db	3,3,5,5	; 41
	db	3,3,5,5	; 42
	db	3,3,5,5	; 43
	db	3,3,5,5	; 44
	db	3,3,5,5	; 45
	db	3,3,5,5	; 46
	db	4,3,5,5	; 47
	db	4,3,5,5	; 48
	db	4,3,5,5	; 49
	db	4,3,5,5	; 50
	db	4,3,5,5	; 51
