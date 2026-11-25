; ArenaPilotLegCounts: 6 x u8, how many of the 3 choices per pilot group in ArenaPilotLegs
; the rank picks from (Random() % count).
; How RollArenaBracket builds a random pilot's parts, and the line order: body_base.asm.
; id: count
	db	2	; 1 Rank S
	db	3	; 2 Rank A
	db	2	; 3 Rank B
	db	3	; 4 Rank C
	db	3	; 5 Rank D
	db	1	; 6 Rank E
