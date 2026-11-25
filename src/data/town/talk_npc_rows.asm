; TalkNpcRows (talk_npc_rows): 17 records of 4 bytes, one line per id; keep the order and count.
; TownNpcTalk, once EVENT_TALKED flag 0x40 + n is set for NPC n = speaker - 0x15: the talk row
; (0-based, in the place's talk_*.txt) to show instead. Line n + 1 for NPC n (0-13), line 15 =
; NPC 7 in D-town, 16 = NPC 7 at the Spring, 17 = NPC 8 outside the Forest. Column: greeted =
; EVENT_GREETED flag 0x50 + n set; late = EVENT_STAGE_ENDING or EVENT_STAGE_WON_RANK_X set.
; 255 = the default row ("Sorry, There is no data."). Some NPCs are handled before this
; (Cyrius trades, Helmut, Colla offers). Line 17 was read as text " abc" before.
; id: new, greeted, late_new, late_greeted
	db	255,255,255,255	; 1 Jon
	db	  8,  9, 16, 17	; 2 Lily
	db	  4,  5, 12, 13	; 3 Cyrius
	db	255,255,255,255	; 4 Galb
	db	255,255,255,255	; 5 Lana
	db	  2,  3, 10, 11	; 6 Wyse
	db	  6,  7, 14, 15	; 7 Ziggy
	db	  4,  5, 12, 13	; 8 Ceus
	db	  9,  9,  9,  9	; 9 Helmut
	db	  2,  3,  6,  7	; 10 Alda
	db	  0,  1,  8,  9	; 11 Camil
	db	  0,  1, 10, 11	; 12 Meese
	db	  0,  1,  4,  5	; 13 Colla
	db	  6,  7, 14, 15	; 14 Tetis
	db	  2,  3,255,255	; 15 Ceus in D-town
	db	 45, 45,255,255	; 16 Ceus at the Spring
	db	  0,  1,  2,  3	; 17 Helmut outside the Forest
