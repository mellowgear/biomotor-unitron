; TalkPlace8 (talk_place8): 1 records of 8 bytes, one line per id; keep the order and count.
; Talk rows of the place (place 8), line = row + 1.
; One talk_row record per line (src/macros/tables.inc).
; Messages / lists are 4-byte ROM pointers (dd), written as their labels.
; id: speaker, portrait, flag, next, message
	talk_row	0,35,0,238,OneYearLaterAtText	; 1 -: "One year later... At the cap..."
