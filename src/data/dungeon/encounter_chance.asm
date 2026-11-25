; EncounterChance (encounter_chance): 25 records of 1 bytes, one line per id; keep the order and count.
; CheckEncounter 0x211202: on each dungeon step wStepsSinceBattle (0x52DB) goes up by 1 and a
; battle starts if a random 0-99 is below the value on that line (line = steps); the count
; restarts at 0 after a battle. The last line must stay 100: the code has no limit.
; id: pct
	db	  0	; 1
	db	  0	; 2
	db	  0	; 3
	db	  0	; 4
	db	  0	; 5
	db	  1	; 6
	db	  1	; 7
	db	  1	; 8
	db	  1	; 9
	db	  1	; 10
	db	  3	; 11
	db	  3	; 12
	db	  3	; 13
	db	  3	; 14
	db	  3	; 15
	db	  5	; 16
	db	  5	; 17
	db	  7	; 18
	db	 10	; 19
	db	 15	; 20
	db	 25	; 21
	db	 40	; 22
	db	 60	; 23
	db	 90	; 24
	db	100	; 25
