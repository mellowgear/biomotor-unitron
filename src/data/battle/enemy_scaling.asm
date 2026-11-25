; EnemyScaling (enemy_scaling): 16 records of 14 bytes, one line per id; keep the order and count.
; sub_20840A: stats of scaled enemies (level 255) x pct / 100, level = base + 1..rand.
; Row = area level (0x5DDB) - 1, clamped to 1-8. Rows 1-8 are used before event flag 0xA
; or 0xB is set, rows 9-16 after. Row 16 is also used for enemy ids 0x59-0x61 and 0x71+
; once a flag is set.
; One enemy_scaling record per line (src/macros/tables.inc).
; id: hp_pct, ep_pct, ap_pct, sp_pct, rp_pct, mp_pct, level_base, level_rand
	enemy_scaling	 100, 100,150,100,100,100, 0, 4	; 1
	enemy_scaling	 200, 200,200,150,150,150, 4, 5	; 2
	enemy_scaling	 300, 300,250,200,200,200, 9, 5	; 3
	enemy_scaling	 400, 400,300,250,250,250,14, 5	; 4
	enemy_scaling	 500, 500,350,300,300,300,19, 5	; 5
	enemy_scaling	 600, 600,450,400,400,400,24, 5	; 6
	enemy_scaling	1000,1000,750,600,600,600,34, 5	; 7
	enemy_scaling	 800, 800,600,500,500,500,29,10	; 8
	enemy_scaling	 500, 500,400,300,400,300,14, 5	; 9
	enemy_scaling	 600, 600,450,350,450,350,19, 5	; 10
	enemy_scaling	 700, 700,500,400,500,400,24, 5	; 11
	enemy_scaling	 800, 800,550,450,550,450,29, 5	; 12
	enemy_scaling	 900, 900,600,500,600,500,34, 5	; 13
	enemy_scaling	1000,1000,700,600,700,600,39, 5	; 14
	enemy_scaling	1200,1200,800,700,800,700,44, 5	; 15
	enemy_scaling	 150, 150,150,100,150,100,50, 0	; 16
