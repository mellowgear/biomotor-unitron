; ArenaPilotLegs: 6 ranks x 5 pilot groups x 3 legs ids; entry (line * 5 + g) * 3 + Random() % count
; (the count per rank is the table before this one; 0 = unused choice).
; How RollArenaBracket builds a random pilot's parts, and the line order: body_base.asm.
; one line per rank and pilot group: 3 ids
	db	 4,18, 0	; Rank S, Alex/Crofrd/Lester: Paladn, Hero
	db	 8, 9, 0	; Rank S, Kaldrl/Fandel/Leygos: Jester, Kalon
	db	12,13, 0	; Rank S, Loxia/Legaea/Palten: Dolphn, Serpnt
	db	 4, 8, 0	; Rank S, Hawki/Crawel/Eegle: Paladn, Jester
	db	17,18, 0	; Rank S, MJ/Vasky/Dupon: Dragon, Hero
	db	20,26,28	; Rank A, Alex/Crofrd/Lester: Dino2, Scout2, Worm2
	db	22,26,30	; Rank A, Kaldrl/Fandel/Leygos: Wyrm2, Scout2, Boost2
	db	20,22,24	; Rank A, Loxia/Legaea/Palten: Dino2, Wyrm2, Flier2
	db	24,26,30	; Rank A, Hawki/Crawel/Eegle: Flier2, Scout2, Boost2
	db	20,22,28	; Rank A, MJ/Vasky/Dupon: Dino2, Wyrm2, Worm2
	db	 3,16, 0	; Rank B, Alex/Crofrd/Lester: Knight, Fightr
	db	 6, 7, 0	; Rank B, Kaldrl/Fandel/Leygos: Marble, Obsedn
	db	11, 6, 0	; Rank B, Loxia/Legaea/Palten: Siren, Marble
	db	 3, 7, 0	; Rank B, Hawki/Crawel/Eegle: Knight, Obsedn
	db	15,16, 0	; Rank B, MJ/Vasky/Dupon: Turtle, Fightr
	db	33,36,38	; Rank C, Alex/Crofrd/Lester: Tiger, MultiL, Rivet
	db	34,39,43	; Rank C, Kaldrl/Fandel/Leygos: Insect, Centar, Wasp
	db	35,41,43	; Rank C, Loxia/Legaea/Palten: Manta, Tntacl, Wasp
	db	31,32,44	; Rank C, Hawki/Crawel/Eegle: Craftr, Wing, Magic
	db	37,38,40	; Rank C, MJ/Vasky/Dupon: Wheel, Rivet, Saurus
	db	19,25,27	; Rank D, Alex/Crofrd/Lester: Dino1, Scout1, Worm1
	db	21,25,29	; Rank D, Kaldrl/Fandel/Leygos: Wyrm1, Scout1, Boost1
	db	19,21,23	; Rank D, Loxia/Legaea/Palten: Dino1, Wyrm1, Flier1
	db	23,25,29	; Rank D, Hawki/Crawel/Eegle: Flier1, Scout1, Boost1
	db	19,21,27	; Rank D, MJ/Vasky/Dupon: Dino1, Wyrm1, Worm1
	db	 1, 0, 0	; Rank E, Alex/Crofrd/Lester: Human
	db	 5, 0, 0	; Rank E, Kaldrl/Fandel/Leygos: Forest
	db	10, 0, 0	; Rank E, Loxia/Legaea/Palten: Marinr
	db	 2, 0, 0	; Rank E, Hawki/Crawel/Eegle: Birdan
	db	14, 0, 0	; Rank E, MJ/Vasky/Dupon: Lizard
