; LevelGainsOdd (level_gains): 51 records of 4 bytes, one line per id; keep the order and count.
; TryLevelUp 0x207B12: on level up, pilot AP/SP/RP/MP (wPilotAP..wPilotMP) gain the row for the new
; level (line = level + 1); odd table if 0x5021 (race/gender) is odd, else even; then a random bonus
; from tables/level_bonus.asm.
; id: odd_ap, odd_sp, odd_rp, odd_mp
	db	3,3,2,2	; 1
	db	2,2,1,1	; 2
	db	2,2,1,1	; 3
	db	2,2,1,1	; 4
	db	2,2,1,1	; 5
	db	2,2,1,1	; 6
	db	3,2,1,1	; 7
	db	3,2,1,1	; 8
	db	3,2,1,1	; 9
	db	3,2,1,1	; 10
	db	3,2,1,1	; 11
	db	3,2,2,1	; 12
	db	3,2,2,1	; 13
	db	3,2,2,1	; 14
	db	3,2,2,1	; 15
	db	3,2,2,1	; 16
	db	3,2,2,2	; 17
	db	3,2,2,2	; 18
	db	3,2,2,2	; 19
	db	3,2,2,2	; 20
	db	3,2,2,2	; 21
	db	4,3,2,2	; 22
	db	4,3,2,2	; 23
	db	4,3,2,2	; 24
	db	4,3,2,2	; 25
	db	4,3,2,2	; 26
	db	4,4,2,2	; 27
	db	4,4,2,2	; 28
	db	4,4,2,2	; 29
	db	4,4,2,2	; 30
	db	4,4,2,2	; 31
	db	5,4,3,2	; 32
	db	5,4,3,2	; 33
	db	5,4,3,2	; 34
	db	5,4,3,2	; 35
	db	5,4,3,2	; 36
	db	5,5,3,3	; 37
	db	5,5,3,3	; 38
	db	5,5,3,3	; 39
	db	5,5,3,3	; 40
	db	5,5,3,3	; 41
	db	5,5,3,3	; 42
	db	5,5,3,3	; 43
	db	5,5,3,3	; 44
	db	5,5,3,3	; 45
	db	5,5,3,3	; 46
	db	5,5,4,3	; 47
	db	5,5,4,3	; 48
	db	5,5,4,3	; 49
	db	5,5,4,3	; 50
	db	5,5,4,3	; 51
