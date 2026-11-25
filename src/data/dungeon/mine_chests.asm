; MineChests (mine_chests): 5 records of 6 bytes, one line per id; keep the order and count.
; Crystal Mine (dungeon 5) chests: fixed, one line per floor, c1..c6 = the floor's 6 chests
; (SetMineChests 0x21172A; a chest whose event flag is set is left opened). Codes as tables/chests.asm.
; (Play: all 30 opened; F1 Dryad, Armr80, AutoRp, Tank60, 7500G, FullFx.)
; id: c1, c2, c3, c4, c5, c6
	db	64,20,36,23,88,42	; 1 F1: Dryad, Armr80, AutoRp, Tank60, 7500G, FullFx
	db	10,88,26,67,32,42	; 2 F2: Radar8, 7500G, Bst30, Gnome, Axel30, FullFx
	db	29,17,63,89,65,35	; 3 F3: Plt30, Panl50, Slmndr, 10000G, Undine, Burn30
	db	68, 5,73,11,69,14	; 4 F4: Hirokn, ErthCt, Grav, Radr10, Oricon, Cycl30
	db	70,71, 6,72, 8,56	; 5 F5: Zeus, Hades, LghtCt, CoreX, MirrCt, Myster
