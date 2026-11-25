; ItemAffinity (item_works): 71 records of 2 bytes, one line per id; keep the order and count.
; Per item (line = item id), in the Works copy of the database.
; index, group: the item's place in tables/item_groups.asm (group 1-4, index from 1); swp_21B902 reads
; it, but nothing calls swp_21B902.
; u379: no reader found (swp_21B911 has no caller): 1 for ids 1-37, 6 for 38-43, 2 for 44-51, 8 for 52-71.
; affinity: swp_217444 (no caller) returns this for items where it returns the part's affinity
; (tables/parts/) for parts; the eight affinity chips FlrCt..MirrCt hold the affinity bits 1..128.
; id: affinity
	dw	  1	; 1 FlrCt
	dw	  2	; 2 RefCt
	dw	  4	; 3 IceCt
	dw	  8	; 4 WindCt
	dw	 16	; 5 ErthCt
	dw	 32	; 6 LghtCt
	dw	 64	; 7 DarkCt
	dw	128	; 8 MirrCt
	dw	  0	; 9 Radar5
	dw	  0	; 10 Radar8
	dw	  0	; 11 Radr10
	dw	  0	; 12 Cycl10
	dw	  0	; 13 Cycl20
	dw	  0	; 14 Cycl30
	dw	  0	; 15 Panl15
	dw	  0	; 16 Panl30
	dw	  0	; 17 Panl50
	dw	  0	; 18 Armr25
	dw	  0	; 19 Armr50
	dw	  0	; 20 Armr80
	dw	  0	; 21 Tank15
	dw	  0	; 22 Tank30
	dw	  0	; 23 Tank60
	dw	  0	; 24 Bst10
	dw	  0	; 25 Bst20
	dw	  0	; 26 Bst30
	dw	  0	; 27 Plt10
	dw	  0	; 28 Plt20
	dw	  0	; 29 Plt30
	dw	  0	; 30 Axel10
	dw	  0	; 31 Axel20
	dw	  0	; 32 Axel30
	dw	  0	; 33 Burn10
	dw	  0	; 34 Burn20
	dw	  0	; 35 Burn30
	dw	  0	; 36 AutoRp
	dw	  0	; 37 Proplr
	dw	  0	; 38 FixIt1
	dw	  0	; 39 FixIt2
	dw	  0	; 40 FixIt3
	dw	  0	; 41 FixIt4
	dw	  0	; 42 FullFx
	dw	  0	; 43 Clear
	dw	  0	; 44 PowDrv
	dw	  0	; 45 EField
	dw	  0	; 46 SitClr
	dw	  0	; 47 Turbo
	dw	  0	; 48 Absorb
	dw	  0	; 49 AcidBm
	dw	  0	; 50 Jammer
	dw	  0	; 51 MagFlr
	dw	  0	; 52 Tool1
	dw	  0	; 53 Tool2
	dw	  0	; 54 Tool3
	dw	  0	; 55 Tool4
	dw	  0	; 56 Myster
	dw	  0	; 57 Steel
	dw	  0	; 58 Silver
	dw	  0	; 59 Gold
	dw	  0	; 60 Tngstn
	dw	  0	; 61 Platnm
	dw	  0	; 62 Mithrl
	dw	  0	; 63 Slmndr
	dw	  0	; 64 Dryad
	dw	  0	; 65 Undine
	dw	  0	; 66 Sylph
	dw	  0	; 67 Gnome
	dw	  0	; 68 Hirokn
	dw	  0	; 69 Oricon
	dw	  0	; 70 Zeus
	dw	  0	; 71 Hades
