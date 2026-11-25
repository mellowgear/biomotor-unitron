; ItemGroupIds (item_works): 71 records of 2 bytes, one line per id; keep the order and count.
; Per item (line = item id), in the Works copy of the database.
; index, group: the item's place in tables/item_groups.asm (group 1-4, index from 1); swp_21B902 reads
; it, but nothing calls swp_21B902.
; u379: no reader found (swp_21B911 has no caller): 1 for ids 1-37, 6 for 38-43, 2 for 44-51, 8 for 52-71.
; affinity: swp_217444 (no caller) returns this for items where it returns the part's affinity
; (tables/parts/) for parts; the eight affinity chips FlrCt..MirrCt hold the affinity bits 1..128.
; id: index, group
	db	 1,1	; 1 FlrCt
	db	 2,1	; 2 RefCt
	db	 3,1	; 3 IceCt
	db	 4,1	; 4 WindCt
	db	 5,1	; 5 ErthCt
	db	 6,1	; 6 LghtCt
	db	 7,1	; 7 DarkCt
	db	 8,1	; 8 MirrCt
	db	 9,1	; 9 Radar5
	db	10,1	; 10 Radar8
	db	11,1	; 11 Radr10
	db	12,1	; 12 Cycl10
	db	13,1	; 13 Cycl20
	db	14,1	; 14 Cycl30
	db	15,1	; 15 Panl15
	db	16,1	; 16 Panl30
	db	17,1	; 17 Panl50
	db	18,1	; 18 Armr25
	db	19,1	; 19 Armr50
	db	20,1	; 20 Armr80
	db	21,1	; 21 Tank15
	db	22,1	; 22 Tank30
	db	23,1	; 23 Tank60
	db	24,1	; 24 Bst10
	db	25,1	; 25 Bst20
	db	26,1	; 26 Bst30
	db	27,1	; 27 Plt10
	db	28,1	; 28 Plt20
	db	29,1	; 29 Plt30
	db	30,1	; 30 Axel10
	db	31,1	; 31 Axel20
	db	32,1	; 32 Axel30
	db	33,1	; 33 Burn10
	db	34,1	; 34 Burn20
	db	35,1	; 35 Burn30
	db	36,1	; 36 AutoRp
	db	37,1	; 37 Proplr
	db	 1,2	; 38 FixIt1
	db	 2,2	; 39 FixIt2
	db	 3,2	; 40 FixIt3
	db	 4,2	; 41 FixIt4
	db	 5,2	; 42 FullFx
	db	 6,2	; 43 Clear
	db	 7,2	; 44 PowDrv
	db	 8,2	; 45 EField
	db	 9,2	; 46 SitClr
	db	10,2	; 47 Turbo
	db	11,2	; 48 Absorb
	db	12,2	; 49 AcidBm
	db	13,2	; 50 Jammer
	db	14,2	; 51 MagFlr
	db	 1,3	; 52 Tool1
	db	 2,3	; 53 Tool2
	db	 3,3	; 54 Tool3
	db	 4,3	; 55 Tool4
	db	 5,3	; 56 Myster
	db	 1,4	; 57 Steel
	db	 2,4	; 58 Silver
	db	 3,4	; 59 Gold
	db	 4,4	; 60 Tngstn
	db	 5,4	; 61 Platnm
	db	 6,4	; 62 Mithrl
	db	 7,4	; 63 Slmndr
	db	 8,4	; 64 Dryad
	db	 9,4	; 65 Undine
	db	10,4	; 66 Sylph
	db	11,4	; 67 Gnome
	db	12,4	; 68 Hirokn
	db	13,4	; 69 Oricon
	db	14,4	; 70 Zeus
	db	15,4	; 71 Hades
