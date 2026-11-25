; TetisGiftIndex (tetis_gift_index): 7 records of 2 bytes, one line per id; keep the order and count.
; Line = number of Tetis autographs (item 0xFF count, wTetisAutographs); value = tetis_gifts
; line - 1, by gender (IsPlayerMale 0x216B0C: odd wPlayerRace = male). [play] female column confirmed: 4-7
; autographs gave Sthrn+ / Indra / 3DDvr / GodHnd (female-human A1; 7 genuine, 4-6 with 0x517E poked).
; id: male, female
	db	0, 0	; 1 Proplr / Proplr
	db	1, 1	; 2 AutoRp / AutoRp
	db	2, 2	; 3 Myster / Myster
	db	3, 4	; 4 DvlClw / Sthrn+
	db	5, 6	; 5 Agni / Indra
	db	7, 8	; 6 GrvHmr / 3DDvr
	db	9,10	; 7 Crsadr / GodHnd
