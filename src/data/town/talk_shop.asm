; TalkShop (talk_shop): 10 records of 8 bytes, one line per id; keep the order and count.
; Talk rows of the Shop (place 6), line = row + 1.
; One talk_row record per line (src/macros/tables.inc).
; Addresses are 4-byte ROM addresses (dd).
; id: speaker, portrait, flag, next, message
	talk_row	25,0, 0,  1,0x258B09	; 1 Lana: "Welcome to Lake's! Haven't s..."
	talk_row	24,0, 0,  2,0x258BC5	; 2 Galb: "What? Oh, a customer! And a ..."
	talk_row	25,0, 0,  8,0x258C73	; 3 Lana: "I'm sorry. My hus-band can b..."
	talk_row	25,0, 0,253,0x258F07	; 4 Lana: "Hello! I'm sorry--we're taki..."
	talk_row	24,0, 0,  5,0x258F51	; 5 Galb: "Good job, . Or should I call..."
	talk_row	25,0, 0,  6,0x258FDD	; 6 Lana: "I knew the moment we met tha..."
	talk_row	24,0,67,253,0x259040	; 7 Galb: "Keep up the good work, Maste..."
	talk_row	24,0, 0,253,0x259063	; 8 Galb: "Oh, hi . I'm sorry, but we'r..."
	talk_row	24,0, 0,  9,0x258D8B	; 9 Galb: "Hm? Oh...Forgot something......"
	talk_row	25,0,67,253,0x258E5B	; 10 Lana: "Well! That's a surprise! Oh ..."
