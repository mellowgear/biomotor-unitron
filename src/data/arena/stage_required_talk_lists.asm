; StageRequiredTalkLists: the event flags per story stage; StageRequiredTalks (data/arena/
; pointers.asm) points at each stage's line (StageRequiredTalkLists + offset). A stage with
; count 0 points at a 0 byte that is never read.
	db	0	; stage 0 (+0x0): none
	db	0	; stage 1 (+0x1): none
	db	EVENT_TALKED_TETIS,EVENT_TALKED_COLLA,EVENT_TALKED_ZIGGY	; stage 2 (+0x2)
	db	EVENT_TALKED_ALDA,EVENT_TALKED_CYRIUS	; stage 3 (+0x5)
	db	0	; stage 4 (+0x7): none
	db	EVENT_TALKED_LILY	; stage 5 (+0x8)
	db	EVENT_TALKED_CYRIUS,EVENT_TALKED_MEESE	; stage 6 (+0x9)
	db	0	; stage 7 (+0xB): none
	db	0	; stage 8 (+0xC): none
	db	0	; stage 9 (+0xD): none
	db	EVENT_TALKED_CAMIL,EVENT_TALKED_WYSE,EVENT_TALKED_ZIGGY,EVENT_TALKED_CEUS,EVENT_TALKED_MEESE,EVENT_TALKED_LILY,EVENT_TALKED_TETIS,EVENT_TALKED_CYRIUS,EVENT_TALKED_COLLA,EVENT_TALKED_ALDA,EVENT_TALKED_HELMUT	; stage 10 (+0xE)
	db	0	; stage 11 (+0x19): none
