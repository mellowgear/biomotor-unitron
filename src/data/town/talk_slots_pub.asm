; TalkSlotsPub (talk_slots_pub): 12 records of 4 bytes, one line per id; keep the order and count.
; The talk rows (0-based row of tables/talk_pub.asm, so line - 1) listed in the Pub for story stage
; line - 1 (GetStoryStage), in order; 255 ends the list early (sub_214F3D). Counts and list
; pointers: tables/talk_slot_lists/.
; id: s1, s2, s3, s4
	db	16,17,255,255	; 1
	db	18,19,255,255	; 2
	db	20,21, 22,255	; 3
	db	23,24, 25, 26	; 4
	db	27,28, 29,255	; 5
	db	30,31, 32,255	; 6
	db	33,34, 35, 36	; 7
	db	37,38, 39, 40	; 8
	db	41,42, 43, 44	; 9
	db	45,46, 47, 48	; 10
	db	49,50, 51, 52	; 11
	db	49,50, 51, 52	; 12
