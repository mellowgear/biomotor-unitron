; DevLevelExpFemale (dev_level_exp): 50 records of 1 bytes, one line per id; keep the order and count.
; EngineerLevelUp 0x21A9FF: when wEngineerExp reaches 0 or below (CheckEngineerLevelUp
; 0x219785), the value for the current level (line) is added to it and the level goes
; up, until level 50 (then wEngineerExp = 0). Column by partner gender as dev_level_bonus.
; (Play: level 31 with 5 left, GrvHmr dev_exp 15 -> level 32 with 25 left = 5 - 15 + 35.)
; id: female
	db	 5	; 1
	db	 5	; 2
	db	 5	; 3
	db	 5	; 4
	db	 5	; 5
	db	10	; 6
	db	10	; 7
	db	10	; 8
	db	10	; 9
	db	10	; 10
	db	15	; 11
	db	15	; 12
	db	15	; 13
	db	15	; 14
	db	15	; 15
	db	20	; 16
	db	20	; 17
	db	20	; 18
	db	20	; 19
	db	20	; 20
	db	25	; 21
	db	25	; 22
	db	25	; 23
	db	25	; 24
	db	25	; 25
	db	30	; 26
	db	30	; 27
	db	30	; 28
	db	30	; 29
	db	30	; 30
	db	35	; 31
	db	35	; 32
	db	35	; 33
	db	35	; 34
	db	35	; 35
	db	40	; 36
	db	40	; 37
	db	40	; 38
	db	40	; 39
	db	40	; 40
	db	45	; 41
	db	45	; 42
	db	45	; 43
	db	45	; 44
	db	45	; 45
	db	50	; 46
	db	50	; 47
	db	50	; 48
	db	50	; 49
	db	50	; 50
