; ArenaBracketSizes (arena_brackets): 8 records of 1 bytes, one line per id; keep the order and count.
; Arena opponents per rank. sub_213C2E: line = chosen rank - 1 (task +0x15 - 2); `count`
; opponents are fought in order o1, o2, ...; an enemy id (tables/enemies/) is fixed, 255 = a
; random pilot 98 + Random() % 15 (Alex .. Dupon), never one already drawn for this bracket.
; The pointer table to the rows is at 0x249D2E (still raw).
; (Play: fixed opponents and lists seen as here for Human, Mariner, Birdian, Forester; the
; random slots differ between runs. Mariner Rank A was noted with 4 opponents, the table has 5.)
; id: count
	db	3	; 1 Rank E: random, random, random
	db	4	; 2 Rank D: random, random, random, Fenril
	db	4	; 3 Rank C: random, random, random, Domino
	db	5	; 4 Rank B: random, random, random, random, Neptun
	db	5	; 5 Rank A: random, random, random, random, Oberon
	db	6	; 6 Rank S: random, random, random, random, random, Balrok
	db	6	; 7 Rank CS: Fenril, Domino, Neptun, Oberon, Balrok, Satana
	db	6	; 8 Rank X: Trifid, Catble, Squidl, Simrug, Satana, Uniti
