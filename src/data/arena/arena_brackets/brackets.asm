; ArenaBrackets (arena_brackets): 8 records of 6 bytes, one line per id; keep the order and count.
; Arena opponents per rank. RollArenaBracket: line = chosen rank - 1 (task +0x15 - 2); `count`
; opponents are fought in order o1, o2, ...; an enemy id (tables/enemies/) is fixed, 255 = a
; random pilot 98 + Random() % 15 (Alex .. Dupon), never one already drawn for this bracket.
; The pointer table to the rows is at 0x249D2E (still raw).
; (Play: fixed opponents and lists seen as here for Human, Mariner, Birdian, Forester; the
; random slots differ between runs. Mariner Rank A was noted with 4 opponents, the table has 5.)
; id: o1, o2, o3, o4, o5, o6
	db	255,255,255,0,0,0	; 1 Rank E: random, random, random
	db	255,255,255,ENEMY_FENRIL,0,0	; 2 Rank D: random, random, random, Fenril
	db	255,255,255,ENEMY_DOMINO,0,0	; 3 Rank C: random, random, random, Domino
	db	255,255,255,255,ENEMY_NEPTUN,0	; 4 Rank B: random, random, random, random, Neptun
	db	255,255,255,255,ENEMY_OBERON,0	; 5 Rank A: random, random, random, random, Oberon
	db	255,255,255,255,255,ENEMY_BALROK	; 6 Rank S: random, random, random, random, random, Balrok
	db	ENEMY_FENRIL,ENEMY_DOMINO,ENEMY_NEPTUN,ENEMY_OBERON,ENEMY_BALROK,ENEMY_SATANA	; 7 Rank CS: Fenril, Domino, Neptun, Oberon, Balrok, Satana
	db	ENEMY_TRIFID,ENEMY_CATBLE,ENEMY_SQUIDL,ENEMY_SIMRUG,ENEMY_SATANA,ENEMY_UNITI	; 8 Rank X: Trifid, Catble, Squidl, Simrug, Satana, Uniti
