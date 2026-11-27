; ItemPrices (items): 71 records of 4 bytes, one line per id; keep the order and count.
; Accessors 0x208272 / 0x208281. price: buy price in GP, stored as 4-byte BCD at 0x25B4DF
; (found from shop prices seen in play: FixIt1 100, Tngstn 10000, Gnome 150000, all
; match); selling gives half. Ids 1-37 are accessories (slots wEquipAcc1/2), 38-51 battle
; items, 52-56 tools, 57-71 materials (play: Works item list categories).
; Code (BattleStatusEffects 0x20C604, the only way to BattleDefeat): at 0 HP, Recvr
; (wRecvrActive) revives with 9999 HP (capped at max HP); otherwise an equipped AutoRp (36) is used up (its slot
; cleared; A1 checked before A2) and revives with max HP / 2; both clear all four statuses. With EP below the arm's
; cost, an equipped Proplr (37) is used up and refills EP. Descriptions say "Cures Paralysis"
; / "Cures EP shortage".
; (Play, Mariner: AutoRp in A1, HP 0 -> "You gained 270 HP!!" = max 540 / 2, slot -> 0; Proplr in
; A1, EP 5 below the cheapest command cost 15 at the end of a turn -> "Your EP are fully
; restored!!", EP = max, slot -> 0. Recvr from the Aqua skill: HP = max HP, not 9999.)
; BCD: written as 0x followed by the decimal digits (650000 = 0x650000).
; id: price (BCD)
	dd	  0x4800	; 1 FlrCt price 4800
	dd	  0x4800	; 2 RefCt price 4800
	dd	  0x4800	; 3 IceCt price 4800
	dd	  0x4800	; 4 WindCt price 4800
	dd	  0x4800	; 5 ErthCt price 4800
	dd	 0x22400	; 6 LghtCt price 22400
	dd	 0x22000	; 7 DarkCt price 22000
	dd	 0x26500	; 8 MirrCt price 26500
	dd	  0x5000	; 9 Radar5 price 5000
	dd	 0x12000	; 10 Radar8 price 12000
	dd	 0x42000	; 11 Radr10 price 42000
	dd	  0x4000	; 12 Cycl10 price 4000
	dd	 0x10000	; 13 Cycl20 price 10000
	dd	 0x32000	; 14 Cycl30 price 32000
	dd	  0x3000	; 15 Panl15 price 3000
	dd	  0x5000	; 16 Panl30 price 5000
	dd	 0x24500	; 17 Panl50 price 24500
	dd	  0x3600	; 18 Armr25 price 3600
	dd	  0x7500	; 19 Armr50 price 7500
	dd	 0x14000	; 20 Armr80 price 14000
	dd	  0x3000	; 21 Tank15 price 3000
	dd	  0x6200	; 22 Tank30 price 6200
	dd	 0x13000	; 23 Tank60 price 13000
	dd	  0x5000	; 24 Bst10 price 5000
	dd	 0x10000	; 25 Bst20 price 10000
	dd	 0x20000	; 26 Bst30 price 20000
	dd	  0x4000	; 27 Plt10 price 4000
	dd	  0x8000	; 28 Plt20 price 8000
	dd	 0x16000	; 29 Plt30 price 16000
	dd	  0x2500	; 30 Axel10 price 2500
	dd	  0x4000	; 31 Axel20 price 4000
	dd	  0x8000	; 32 Axel30 price 8000
	dd	  0x2000	; 33 Burn10 price 2000
	dd	  0x3500	; 34 Burn20 price 3500
	dd	  0x7000	; 35 Burn30 price 7000
	dd	 0x32000	; 36 AutoRp price 32000
	dd	  0x2800	; 37 Proplr price 2800
	dd	   0x100	; 38 FixIt1 price 100
	dd	   0x200	; 39 FixIt2 price 200
	dd	   0x420	; 40 FixIt3 price 420
	dd	   0x750	; 41 FixIt4 price 750
	dd	  0x1500	; 42 FullFx price 1500
	dd	   0x160	; 43 Clear price 160
	dd	   0x360	; 44 PowDrv price 360
	dd	   0x250	; 45 EField price 250
	dd	   0x180	; 46 SitClr price 180
	dd	   0x120	; 47 Turbo price 120
	dd	   0x280	; 48 Absorb price 280
	dd	   0x250	; 49 AcidBm price 250
	dd	   0x210	; 50 Jammer price 210
	dd	   0x110	; 51 MagFlr price 110
	dd	   0x300	; 52 Tool1 price 300
	dd	   0x500	; 53 Tool2 price 500
	dd	   0x800	; 54 Tool3 price 800
	dd	  0x1500	; 55 Tool4 price 1500
	dd	 0x50000	; 56 Myster price 50000
	dd	  0x1000	; 57 Steel price 1000
	dd	  0x1500	; 58 Silver price 1500
	dd	  0x5000	; 59 Gold price 5000
	dd	 0x10000	; 60 Tngstn price 10000
	dd	 0x18000	; 61 Platnm price 18000
	dd	 0x25000	; 62 Mithrl price 25000
	dd	0x150000	; 63 Slmndr price 150000
	dd	0x150000	; 64 Dryad price 150000
	dd	0x150000	; 65 Undine price 150000
	dd	0x150000	; 66 Sylph price 150000
	dd	0x150000	; 67 Gnome price 150000
	dd	0x200000	; 68 Hirokn price 200000
	dd	0x300000	; 69 Oricon price 300000
	dd	0x250000	; 70 Zeus price 250000
	dd	0x250000	; 71 Hades price 250000
