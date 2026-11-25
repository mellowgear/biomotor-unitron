; TalkPlaceRows (talk_places): 8 records of 4 bytes, one line per id; keep the order and count.
; GetTalkRow: talk row = rows[place - 1] + 8 * row; place = task +0x15 (1 Pub, 2 D-town, 3 Forest,
; 4 Spring, 5 Works, 6 Shop as the place names at 0x249EAB; 7 and 8 have no name there).
; Messages / lists are 4-byte ROM pointers (dd), written as their labels.
; id: rows
	dd	TalkPub	; 1 Pub
	dd	TalkDTown	; 2 D-town
	dd	TalkForest	; 3 Forest
	dd	TalkSpring	; 4 Spring
	dd	TalkWorks	; 5 Works
	dd	TalkShop	; 6 Shop
	dd	TalkPlace7	; 7 place 7
	dd	TalkPlace8	; 8 place 8
