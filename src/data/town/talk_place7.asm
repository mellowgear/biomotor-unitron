; TalkPlace7 (talk_place7): 2 records of 8 bytes, one line per id; keep the order and count.
; Talk rows of the place (place 7), line = row + 1.
; One talk_row record per line (src/macros/tables.inc).
; Addresses are 4-byte ROM addresses (dd).
; id: speaker, portrait, flag, next, message
	talk_row	 0,35,0,240,0x2590DB	; 1 -: "At the capital of Rhafiace....."
	talk_row	29,67,0,239,0x2590FB	; 2 Helmut: "It has been 10 years since y..."
