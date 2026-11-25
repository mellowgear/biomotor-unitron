; TalkDefaultRow (talk_default): 1 records of 8 bytes, one line per id; keep the order and count.
; GetTalkRow returns this talk row for row number 0xFF (format: tables/talk_pub.asm).
; One talk_row record per line (src/macros/tables.inc).
; Addresses are 4-byte ROM addresses (dd).
; id: speaker, portrait, flag, next, message
	talk_row	255,0,0,253,SorryThereIsNodataText	; 1 player: "Sorry, There is nodata."
