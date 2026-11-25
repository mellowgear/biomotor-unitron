; SkillStats (skills): 20 records of 18 bytes, one line per id; keep the order and count.
; Accessors 0x2083BF / 0x2083CE / 0x2083DD / 0x2083EC (id 1-based).
; Taught by Helmut (HelmutSkillOffer 0x215F1E): race r = (wPlayerRace - 1) / 2 (0 Human ..
; 4 Lizardman) gets skills 4r+1..4r+4; at level 20 a choice of 4r+1 / 4r+2, at level 30 of
; 4r+3 / 4r+4 (event flags 0x30-0x33 = learned). (Play: Human Rod got Nova/Burst, Ragnok/Giga;
; Mariner Zappa was offered Edge/Maze at L22 and Wall/Aqua at L30, Edge -> wSkill1 9, Aqua -> 12.)
; effect: battle handler for effect 5-11 (CheckCanAttack 0x209E9E -> SkillEffects 0x209F95):
; 5 stats up, 6 enemy stats down, 7 full heal, 8 time stop, 9 Recvr (auto-revive at 0 HP),
; 10 Airbag (enemy damage halved), 11 Full charge (EP costs 0), both for the rest of the battle
; (s04 is stored in wAirbagActive / wFullChargeActive but never counted down; play: Vapor, Breath);
; 0 = an attack (power s04).
; (Play, Mariner: Aqua shows "Recvr activated!!" and sets wRecvrActive; at 0 HP "Your HP are
; fully restored!!", HP = max HP, wRecvrActive -> 0.)
; id: s00, s02, s04, s06, s08, s0A, s0C, s0E, effect
	dw	   0,   0,200,0,0,0, 30, 1, 0	; 1 Nova
	dw	   0,   0,  5,0,5,0, 15, 0, 5	; 2 Burst
	dw	   0,   0,500,0,0,0,100, 1, 0	; 3 Ragnok
	dw	   0,   0,  5,5,5,5, 50, 0, 5	; 4 Giga
	dw	   0,   0,200,0,0,0, 30, 2, 0	; 5 Roots
	dw	   0,   0,  0,5,5,0, 15, 0, 5	; 6 Reed
	dw	9999,9999,  0,0,0,0, 70, 0, 7	; 7 Leaf
	dw	   0,   0,  3,0,0,0,120, 0, 8	; 8 August
	dw	   0,   0,200,0,0,0, 30, 4, 0	; 9 Edge
	dw	   0,   0,  5,5,5,5, 20, 0, 6	; 10 Maze
	dw	   0,   0,500,0,0,0,100, 4, 0	; 11 Wall
	dw	   0,   0,  0,0,0,0,120, 0, 9	; 12 Aqua
	dw	   0,   0,200,0,0,0, 30, 8, 0	; 13 Slice
	dw	   0,   0,  0,0,5,5, 15, 0, 5	; 14 Cloud
	dw	   0,   0,500,0,0,0,100, 8, 0	; 15 Jolt
	dw	   0,   0,  5,0,0,0,100, 0,10	; 16 Vapor
	dw	   0,   0,200,0,0,0, 30,16, 0	; 17 Gash
	dw	   0,   0,  5,5,0,0, 15, 0, 5	; 18 Shield
	dw	   0,   0,500,0,0,0,100,16, 0	; 19 Teeth
	dw	   0,   0,  5,0,0,0,100, 0,11	; 20 Breath
