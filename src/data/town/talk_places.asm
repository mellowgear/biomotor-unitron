; TalkPlaceRows (talk_places): 8 records of 4 bytes, one line per id; keep the order and count.
; dyn_214D97: talk row = rows[place - 1] + 8 * row; place = task +0x15 (1 Pub, 2 D-town, 3 Forest,
; 4 Spring, 5 Works, 6 Shop as the place names at 0x249EAB; 7 and 8 have no name there).
; Addresses are 4-byte ROM addresses (dd).
; id: rows
	dd	0x25945B	; 1 Pub
	dd	0x253E31	; 2 D-town
	dd	0x254131	; 3 Forest
	dd	0x254251	; 4 Spring
	dd	0x259603	; 5 Works
	dd	0x2596DB	; 6 Shop
	dd	0x25972B	; 7 place 7
	dd	0x25973B	; 8 place 8
