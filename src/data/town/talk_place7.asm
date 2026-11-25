; TalkPlace7 (talk_place7): 2 records of 8 bytes, one line per id; keep the order and count.
; Talk rows of the place (place 7), line = row + 1.
; One talk_row record per line (src/macros/tables.inc).
; Messages / lists are 4-byte ROM pointers (dd), written as their labels.
; id: speaker, portrait, flag, next, message
	talk_row	 0,35,0,240,AtTheCapitalOfText	; 1 -: "At the capital of Rhafiace....."
	talk_row	29,67,0,239,ItHasBeen10Text	; 2 Helmut: "It has been 10 years since y..."
