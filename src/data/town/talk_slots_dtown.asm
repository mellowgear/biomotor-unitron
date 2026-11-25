; TalkSlotsDTown (talk_slots_dtown): 12 records of 4 bytes, one line per id; keep the order and count.
; The talk rows (0-based row of tables/talk_dtown.asm, so line - 1) listed in the D-town for story stage
; line - 1 (GetStoryStage), in order; 255 ends the list early (LoadTalkSlots). Counts and list
; pointers: tables/talk_slot_lists/.
; id: s1, s2, s3, s4
	db	34,35,255,255	; 1
	db	36,38, 37,255	; 2
	db	39,42, 41, 40	; 3
	db	43,46, 44, 45	; 4
	db	47,50, 48, 49	; 5
	db	51,54, 52, 53	; 6
	db	55,56, 57,255	; 7
	db	58,59, 60,255	; 8
	db	61,62, 63,255	; 9
	db	64,67, 65, 66	; 10
	db	68,71, 69, 70	; 11
	db	68,71, 69, 70	; 12
