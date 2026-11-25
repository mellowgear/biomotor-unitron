; StatusRecovery (status_recovery): 22 records of 1 bytes, one line per id; keep the order and count.
; Paralysis and confusion (player and enemy) wear off at the start of a turn with this chance
; (RollStatusRecovery 0x20B440); line = turns so far + 1 (the status byte's low bits, bit 7 =
; on; the count stops at 21 turns = 0x95). Rust and EP leak do not use it.
; id: pct
	db	  0	; 1
	db	  5	; 2
	db	 10	; 3
	db	 25	; 4
	db	 50	; 5
	db	 60	; 6
	db	 70	; 7
	db	 72	; 8
	db	 74	; 9
	db	 76	; 10
	db	 78	; 11
	db	 80	; 12
	db	 82	; 13
	db	 84	; 14
	db	 86	; 15
	db	 88	; 16
	db	 90	; 17
	db	 92	; 18
	db	 94	; 19
	db	 96	; 20
	db	 98	; 21
	db	100	; 22
