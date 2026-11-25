; WorldChests (chests): 28 records of 7 bytes, one line per id; keep the order and count.
; World dungeon chests, rolled for all 7 floors on entering (RollFloorChests 0x2117E2 ->
; wChestTable 0x5FFA). Line = 7 * (dungeon - 1) + floor (dungeons: 1 Forest of Verdure,
; 2 Corridor of Blue, 3 Ruins of Wind, 4 Maze of Stone). Of a floor's 6 chests one is
; empty; each of the others gets c1..c7 with chances tables/chest_odds.asm (30 25 15 12 10 5 3 %).
; Content code: 1-71 = item id (tables/items/), 72 = part CoreX, 73 = part Grav
; (GetChestContent 0x2119DE), 74-89 = gold (tables/chest_gold/ line code - 73).
; (Play: Forest F1 740G/1080G, F2 1240G/1640G, F4 FixIt3/Tool3.)
; id: c1, c2, c3, c4, c5, c6, c7
	db	74,75,38,52,43,57,58	; 1 Forest F1: 740G, 1080G, FixIt1, Tool1, Clear, Steel, Silver
	db	76,77,38,53,43,58,59	; 2 Forest F2: 1240G, 1640G, FixIt1, Tool2, Clear, Silver, Gold
	db	78,79,39,54,40,61,62	; 3 Forest F3: 1720G, 2150G, FixIt2, Tool3, FixIt3, Platnm, Mithrl
	db	80,81,40,54,41,62,64	; 4 Forest F4: 2380G, 3500G, FixIt3, Tool3, FixIt4, Mithrl, Dryad
	db	82,83,54,55,41,64,64	; 5 Forest F5: 3500G, 4000G, Tool3, Tool4, FixIt4, Dryad, Dryad
	db	84,85,41,55,42,64,69	; 6 Forest F6: 4300G, 5200G, FixIt4, Tool4, FullFx, Dryad, Oricon
	db	86,87,55,42, 7,68,69	; 7 Forest F7: 5500G, 7000G, Tool4, FullFx, DarkCt, Hirokn, Oricon
	db	74,75,38,52,43,57,58	; 8 Blue F1: 740G, 1080G, FixIt1, Tool1, Clear, Steel, Silver
	db	76,77,38,53,43,58,59	; 9 Blue F2: 1240G, 1640G, FixIt1, Tool2, Clear, Silver, Gold
	db	78,79,39,54,40,61,62	; 10 Blue F3: 1720G, 2150G, FixIt2, Tool3, FixIt3, Platnm, Mithrl
	db	80,81,40,54,41,62,65	; 11 Blue F4: 2380G, 3500G, FixIt3, Tool3, FixIt4, Mithrl, Undine
	db	82,83,54,55,41,65,65	; 12 Blue F5: 3500G, 4000G, Tool3, Tool4, FixIt4, Undine, Undine
	db	84,85,41,55,42,65,69	; 13 Blue F6: 4300G, 5200G, FixIt4, Tool4, FullFx, Undine, Oricon
	db	86,87,55,42, 7,68,69	; 14 Blue F7: 5500G, 7000G, Tool4, FullFx, DarkCt, Hirokn, Oricon
	db	74,75,38,52,43,57,58	; 15 Wind F1: 740G, 1080G, FixIt1, Tool1, Clear, Steel, Silver
	db	76,77,38,53,43,58,59	; 16 Wind F2: 1240G, 1640G, FixIt1, Tool2, Clear, Silver, Gold
	db	78,79,39,54,40,61,62	; 17 Wind F3: 1720G, 2150G, FixIt2, Tool3, FixIt3, Platnm, Mithrl
	db	80,81,40,54,41,62,66	; 18 Wind F4: 2380G, 3500G, FixIt3, Tool3, FixIt4, Mithrl, Sylph
	db	82,83,54,55,41,66,66	; 19 Wind F5: 3500G, 4000G, Tool3, Tool4, FixIt4, Sylph, Sylph
	db	84,85,41,55,42,66,69	; 20 Wind F6: 4300G, 5200G, FixIt4, Tool4, FullFx, Sylph, Oricon
	db	86,87,55,42, 7,68,69	; 21 Wind F7: 5500G, 7000G, Tool4, FullFx, DarkCt, Hirokn, Oricon
	db	74,75,38,52,43,57,58	; 22 Stone F1: 740G, 1080G, FixIt1, Tool1, Clear, Steel, Silver
	db	76,77,38,53,43,58,59	; 23 Stone F2: 1240G, 1640G, FixIt1, Tool2, Clear, Silver, Gold
	db	78,79,39,54,40,61,62	; 24 Stone F3: 1720G, 2150G, FixIt2, Tool3, FixIt3, Platnm, Mithrl
	db	80,81,40,54,41,62,67	; 25 Stone F4: 2380G, 3500G, FixIt3, Tool3, FixIt4, Mithrl, Gnome
	db	82,83,54,55,41,67,67	; 26 Stone F5: 3500G, 4000G, Tool3, Tool4, FixIt4, Gnome, Gnome
	db	84,85,41,55,42,67,69	; 27 Stone F6: 4300G, 5200G, FixIt4, Tool4, FullFx, Gnome, Oricon
	db	86,87,55,42, 7,68,69	; 28 Stone F7: 5500G, 7000G, Tool4, FullFx, DarkCt, Hirokn, Oricon
