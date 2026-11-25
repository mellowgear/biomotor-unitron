; AffinityTable (affinity): 9 records of 18 bytes, one line per id; keep the order and count.
; ApplyAffinity 0x2081E7: damage x table[attacker][defender] / 100 (at least 1).
; Line = the attacker's affinity, column = the defender's. AffinityIndex 0x208217 turns an
; affinity bit mask into its lowest set bit: 1 Fire, 2 Wood, 4 Water, 8 Wind, 16 Earth,
; 32 Light, 64 Dark, 128 Mirror; no bit = none (line 9). (Play: matches the Help pages and
; fights, e.g. Light GrvHmr x3 on Dark Satana.)
; id: vs_fire, vs_wood, vs_water, vs_wind, vs_earth, vs_light, vs_dark, vs_mirror, vs_none
	dw	100,200, 50, 75,125,100, 75,100,100	; 1 Fire attacks
	dw	 50,100, 75,125,200,100, 75,100,100	; 2 Wood attacks
	dw	200,125,100, 50, 75,100, 75,100,100	; 3 Water attacks
	dw	125, 75,200,100, 50,100, 75,100,100	; 4 Wind attacks
	dw	 75, 50,125,200,100,100, 75,100,100	; 5 Earth attacks
	dw	100,100,100,100,100,100,300,100,100	; 6 Light attacks
	dw	150,150,150,150,150, 50,100,100,100	; 7 Dark attacks
	dw	100,100,100,100,100,100,100,100,100	; 8 Mirror attacks
	dw	100,100,100,100,100,100,100,100,100	; 9 none attacks
