; ItemValues_25B379 (item_works): 71 records of 2 bytes, one line per id; keep the order and count.
; Per item (line = item id), in the Works copy of the database.
; index, group: the item's place in tables/item_groups.asm (group 1-4, index from 1); swp_21B902 reads
; it, but nothing calls swp_21B902.
; u379: no reader found (swp_21B911 has no caller): 1 for ids 1-37, 6 for 38-43, 2 for 44-51, 8 for 52-71.
; affinity: swp_217444 (no caller) returns this for items where it returns the part's affinity
; (tables/parts/) for parts; the eight affinity chips FlrCt..MirrCt hold the affinity bits 1..128.
; id: u379
	dw	1	; 1 FlrCt
	dw	1	; 2 RefCt
	dw	1	; 3 IceCt
	dw	1	; 4 WindCt
	dw	1	; 5 ErthCt
	dw	1	; 6 LghtCt
	dw	1	; 7 DarkCt
	dw	1	; 8 MirrCt
	dw	1	; 9 Radar5
	dw	1	; 10 Radar8
	dw	1	; 11 Radr10
	dw	1	; 12 Cycl10
	dw	1	; 13 Cycl20
	dw	1	; 14 Cycl30
	dw	1	; 15 Panl15
	dw	1	; 16 Panl30
	dw	1	; 17 Panl50
	dw	1	; 18 Armr25
	dw	1	; 19 Armr50
	dw	1	; 20 Armr80
	dw	1	; 21 Tank15
	dw	1	; 22 Tank30
	dw	1	; 23 Tank60
	dw	1	; 24 Bst10
	dw	1	; 25 Bst20
	dw	1	; 26 Bst30
	dw	1	; 27 Plt10
	dw	1	; 28 Plt20
	dw	1	; 29 Plt30
	dw	1	; 30 Axel10
	dw	1	; 31 Axel20
	dw	1	; 32 Axel30
	dw	1	; 33 Burn10
	dw	1	; 34 Burn20
	dw	1	; 35 Burn30
	dw	1	; 36 AutoRp
	dw	1	; 37 Proplr
	dw	6	; 38 FixIt1
	dw	6	; 39 FixIt2
	dw	6	; 40 FixIt3
	dw	6	; 41 FixIt4
	dw	6	; 42 FullFx
	dw	6	; 43 Clear
	dw	2	; 44 PowDrv
	dw	2	; 45 EField
	dw	2	; 46 SitClr
	dw	2	; 47 Turbo
	dw	2	; 48 Absorb
	dw	2	; 49 AcidBm
	dw	2	; 50 Jammer
	dw	2	; 51 MagFlr
	dw	8	; 52 Tool1
	dw	8	; 53 Tool2
	dw	8	; 54 Tool3
	dw	8	; 55 Tool4
	dw	8	; 56 Myster
	dw	8	; 57 Steel
	dw	8	; 58 Silver
	dw	8	; 59 Gold
	dw	8	; 60 Tngstn
	dw	8	; 61 Platnm
	dw	8	; 62 Mithrl
	dw	8	; 63 Slmndr
	dw	8	; 64 Dryad
	dw	8	; 65 Undine
	dw	8	; 66 Sylph
	dw	8	; 67 Gnome
	dw	8	; 68 Hirokn
	dw	8	; 69 Oricon
	dw	8	; 70 Zeus
	dw	8	; 71 Hades
