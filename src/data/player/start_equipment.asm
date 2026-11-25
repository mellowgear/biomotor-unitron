; StartingEquipment (start_equipment): 5 records of 6 bytes, one line per id; keep the order and count.
; NewGameSetup 0x21D647: line = race r + 1, r = (wPlayerRace - 1) / 2 (Human, Forester,
; Mariner, Birdian, Lizardman); copied to wEquipCore .. wEquipBack. Ids are per category
; (tables/parts/ id = body, core + 15, legs + 30, back + 74, arm + 94); the right arm also goes into
; the spare parts. (Play: start HP 45/55/65/40/75 = the sum of the six parts' hp, all 5 races.)
; id: core, body, right_arm, left_arm, legs, back
	db	1, 1, 1,46, 1,1	; 1 Core1, Body1, BtFist, Lancer, Human, Thrst1
	db	1, 4, 4,66, 5,1	; 2 Core1, Body1, SlkHnd, Disc, Forest, Thrst1
	db	1, 7, 7,62,10,1	; 3 Core1, Body1, H-Gun, HkClaw, Marinr, Thrst1
	db	1,10,10,56, 2,1	; 4 Core1, Body1, Hawk, Whip, Birdan, Thrst1
	db	1,13,13,36,14,1	; 5 Core1, Body1, Ogre, HndAxe, Lizard, Thrst1
