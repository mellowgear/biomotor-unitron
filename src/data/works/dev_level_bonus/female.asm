; DevLevelBonusFemale (dev_level_bonus): 51 records of 1 bytes, one line per id; keep the order and count.
; Develop success bonus by engineer level (wEngineerLevel): line = level + 1 (level 0-50).
; The column is picked by the partner's gender (wPartnerRace odd = male, even = female;
; SplitRaceGender 0x21740E). See recipes.asm. [play] picked by the PARTNER's
; gender: RenaB (female partner of the male pilots) used this column; see male.asm.
; id: female
	db	 0	; 1
	db	 1	; 2
	db	 1	; 3
	db	 1	; 4
	db	 2	; 5
	db	 2	; 6
	db	 3	; 7
	db	 3	; 8
	db	 4	; 9
	db	 4	; 10
	db	 5	; 11
	db	 5	; 12
	db	 6	; 13
	db	 6	; 14
	db	 7	; 15
	db	 7	; 16
	db	 8	; 17
	db	 8	; 18
	db	 9	; 19
	db	 9	; 20
	db	10	; 21
	db	11	; 22
	db	12	; 23
	db	13	; 24
	db	14	; 25
	db	15	; 26
	db	16	; 27
	db	17	; 28
	db	18	; 29
	db	19	; 30
	db	20	; 31
	db	21	; 32
	db	22	; 33
	db	23	; 34
	db	24	; 35
	db	25	; 36
	db	26	; 37
	db	27	; 38
	db	28	; 39
	db	29	; 40
	db	30	; 41
	db	32	; 42
	db	34	; 43
	db	36	; 44
	db	38	; 45
	db	40	; 46
	db	42	; 47
	db	44	; 48
	db	46	; 49
	db	48	; 50
	db	50	; 51
