; ArenaPilotArmCounts: 6 x u8, how many of the 15 choices in ArenaPilotArms the rank picks
; from (Random() % count, once per arm).
; How RollArenaBracket builds a random pilot's parts, and the line order: body_base.asm.
; id: count
	db	14	; 1 Rank S
	db	15	; 2 Rank A
	db	8	; 3 Rank B
	db	15	; 4 Rank C
	db	10	; 5 Rank D
	db	10	; 6 Rank E
