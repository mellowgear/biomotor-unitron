; DevLevelExpMale (dev_level_exp): 50 records of 1 bytes, one line per id; keep the order and count.
; EngineerLevelUp 0x21A9FF: when wEngineerExp reaches 0 or below (CheckEngineerLevelUp
; 0x219785), the value for the current level (line) is added to it and the level goes
; up, until level 50 (then wEngineerExp = 0). Column by partner gender as dev_level_bonus.
; (Play: level 31 with 5 left, GrvHmr dev_exp 15 -> level 32 with 25 left = 5 - 15 + 35.)
; id: male
	db	 5	; 1
	db	 5	; 2
	db	 5	; 3
	db	 5	; 4
	db	 5	; 5
	db	 5	; 6
	db	 5	; 7
	db	 5	; 8
	db	 5	; 9
	db	 5	; 10
	db	10	; 11
	db	10	; 12
	db	10	; 13
	db	10	; 14
	db	10	; 15
	db	15	; 16
	db	15	; 17
	db	15	; 18
	db	15	; 19
	db	15	; 20
	db	20	; 21
	db	20	; 22
	db	20	; 23
	db	20	; 24
	db	20	; 25
	db	25	; 26
	db	25	; 27
	db	25	; 28
	db	25	; 29
	db	25	; 30
	db	30	; 31
	db	30	; 32
	db	30	; 33
	db	30	; 34
	db	30	; 35
	db	40	; 36
	db	40	; 37
	db	40	; 38
	db	40	; 39
	db	40	; 40
	db	50	; 41
	db	50	; 42
	db	50	; 43
	db	50	; 44
	db	50	; 45
	db	60	; 46
	db	60	; 47
	db	60	; 48
	db	60	; 49
	db	60	; 50
