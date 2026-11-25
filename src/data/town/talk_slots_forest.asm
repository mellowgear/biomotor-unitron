; TalkSlotsForest (talk_slots_forest): 12 records of 2 bytes, one line per id; keep the order and count.
; The talk rows (0-based row of tables/talk_forest.asm, so line - 1) listed in the Forest for story stage
; line - 1 (GetStoryStage), in order; 255 ends the list early (sub_214F3D). Counts and list
; pointers: tables/talk_slot_lists/.
; id: s1, s2
	db	  8,255	; 1
	db	255,255	; 2
	db	 10,255	; 3
	db	 11, 12	; 4
	db	 13, 14	; 5
	db	 15, 16	; 6
	db	 17, 18	; 7
	db	 19, 20	; 8
	db	 21, 22	; 9
	db	 23, 24	; 10
	db	 25, 26	; 11
	db	 25, 26	; 12
