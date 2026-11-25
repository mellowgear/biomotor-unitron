; DevLevelBonusMale (dev_level_bonus): 51 records of 1 bytes, one line per id; keep the order and count.
; Develop success bonus by engineer level (wEngineerLevel): line = level + 1 (level 0-50).
; The column is picked by the partner's gender (wPartnerRace odd = male, even = female;
; SplitRaceGender 0x21740E). See recipes.asm. [play] the column is the PARTNER's gender: a female
; pilot's male partner (Rod, wPartnerRace 1) got this column (female-human A2, 12 develops, levels 1-50).
; id: male
	db	 0	; 1
	db	 1	; 2
	db	 1	; 3
	db	 2	; 4
	db	 2	; 5
	db	 3	; 6
	db	 3	; 7
	db	 4	; 8
	db	 4	; 9
	db	 5	; 10
	db	 5	; 11
	db	 6	; 12
	db	 7	; 13
	db	 8	; 14
	db	 9	; 15
	db	10	; 16
	db	11	; 17
	db	12	; 18
	db	13	; 19
	db	14	; 20
	db	15	; 21
	db	16	; 22
	db	17	; 23
	db	18	; 24
	db	19	; 25
	db	20	; 26
	db	21	; 27
	db	22	; 28
	db	23	; 29
	db	24	; 30
	db	25	; 31
	db	26	; 32
	db	27	; 33
	db	28	; 34
	db	29	; 35
	db	30	; 36
	db	31	; 37
	db	32	; 38
	db	33	; 39
	db	34	; 40
	db	35	; 41
	db	36	; 42
	db	37	; 43
	db	38	; 44
	db	39	; 45
	db	40	; 46
	db	41	; 47
	db	42	; 48
	db	43	; 49
	db	44	; 50
	db	45	; 51
