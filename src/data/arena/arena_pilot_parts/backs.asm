; ArenaPilotBacks: 6 ranks x 5 pilot groups x 3 back ids; entry (line * 5 + g) * 3 + Random() % count
; (the count per rank is the table before this one; 0 = unused choice).
; How RollArenaBracket builds a random pilot's parts, and the line order: body_base.asm.
; one line per rank and pilot group: 3 ids
	db	 7,15, 0	; Rank S, Alex/Crofrd/Lester: Seraph, Grav
	db	 9,11, 0	; Rank S, Kaldrl/Fandel/Leygos: Bardos, Seed
	db	 9,13, 0	; Rank S, Loxia/Legaea/Palten: Bardos, Cape
	db	 7,11, 0	; Rank S, Hawki/Crawel/Eegle: Seraph, Seed
	db	 9,15, 0	; Rank S, MJ/Vasky/Dupon: Bardos, Grav
	db	 5, 6,14	; Rank A, Alex/Crofrd/Lester: Thrst5, Bird, SJW
	db	 5, 8,10	; Rank A, Kaldrl/Fandel/Leygos: Thrst5, Fin, Bug
	db	 5, 8,12	; Rank A, Loxia/Legaea/Palten: Thrst5, Fin, Robe
	db	 5, 6,10	; Rank A, Hawki/Crawel/Eegle: Thrst5, Bird, Bug
	db	 5, 8,14	; Rank A, MJ/Vasky/Dupon: Thrst5, Fin, SJW
	db	 4, 6,14	; Rank B, Alex/Crofrd/Lester: Thrst4, Bird, SJW
	db	 4, 8,10	; Rank B, Kaldrl/Fandel/Leygos: Thrst4, Fin, Bug
	db	 4, 8,12	; Rank B, Loxia/Legaea/Palten: Thrst4, Fin, Robe
	db	 4, 6,10	; Rank B, Hawki/Crawel/Eegle: Thrst4, Bird, Bug
	db	 4, 8,14	; Rank B, MJ/Vasky/Dupon: Thrst4, Fin, SJW
	db	 3, 4, 0	; Rank C, Alex/Crofrd/Lester: Thrst3, Thrst4
	db	 3, 4, 0	; Rank C, Kaldrl/Fandel/Leygos: Thrst3, Thrst4
	db	 3, 4, 0	; Rank C, Loxia/Legaea/Palten: Thrst3, Thrst4
	db	 3, 4, 0	; Rank C, Hawki/Crawel/Eegle: Thrst3, Thrst4
	db	 3, 4, 0	; Rank C, MJ/Vasky/Dupon: Thrst3, Thrst4
	db	 2, 3, 0	; Rank D, Alex/Crofrd/Lester: Thrst2, Thrst3
	db	 2, 3, 0	; Rank D, Kaldrl/Fandel/Leygos: Thrst2, Thrst3
	db	 2, 3, 0	; Rank D, Loxia/Legaea/Palten: Thrst2, Thrst3
	db	 2, 3, 0	; Rank D, Hawki/Crawel/Eegle: Thrst2, Thrst3
	db	 2, 3, 0	; Rank D, MJ/Vasky/Dupon: Thrst2, Thrst3
	db	 1, 0, 0	; Rank E, Alex/Crofrd/Lester: Thrst1
	db	 1, 0, 0	; Rank E, Kaldrl/Fandel/Leygos: Thrst1
	db	 1, 0, 0	; Rank E, Loxia/Legaea/Palten: Thrst1
	db	 1, 0, 0	; Rank E, Hawki/Crawel/Eegle: Thrst1
	db	 1, 0, 0	; Rank E, MJ/Vasky/Dupon: Thrst1
