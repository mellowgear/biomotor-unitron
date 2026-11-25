; AccessoryData (accessory_data): 37 records of 2 bytes, one line per id; keep the order and count.
; One u16 per accessory (items 1-37), no reader found. Pattern: b1 = 0x80 with b0 = the
; affinity bit for FlrCt..MirrCt; b1 = 0x81-0x86 for the HP/EP/AP/SP/RP/MP items Armr..Burn;
; 7/8/9 for Radar/Cycl/Panl; AutoRp 0x0A, Proplr 0x0B. b0 is not always the number in the
; description (Armr25 has 10).
; id: b0, b1
	db	  1,128	; 1 FlrCt
	db	  2,128	; 2 RefCt
	db	  4,128	; 3 IceCt
	db	  8,128	; 4 WindCt
	db	 16,128	; 5 ErthCt
	db	 32,128	; 6 LghtCt
	db	 64,128	; 7 DarkCt
	db	128,128	; 8 MirrCt
	db	  3,  7	; 9 Radar5
	db	  5,  7	; 10 Radar8
	db	 10,  7	; 11 Radr10
	db	  5,  8	; 12 Cycl10
	db	 10,  8	; 13 Cycl20
	db	 25,  8	; 14 Cycl30
	db	 10,  9	; 15 Panl15
	db	 30,  9	; 16 Panl30
	db	 50,  9	; 17 Panl50
	db	 10,129	; 18 Armr25
	db	 25,129	; 19 Armr50
	db	 50,129	; 20 Armr80
	db	 10,130	; 21 Tank15
	db	 25,130	; 22 Tank30
	db	 50,130	; 23 Tank60
	db	  5,131	; 24 Bst10
	db	 15,131	; 25 Bst20
	db	 30,131	; 26 Bst30
	db	  5,132	; 27 Plt10
	db	 15,132	; 28 Plt20
	db	 30,132	; 29 Plt30
	db	  5,133	; 30 Axel10
	db	 15,133	; 31 Axel20
	db	 30,133	; 32 Axel30
	db	  5,134	; 33 Burn10
	db	 15,134	; 34 Burn20
	db	 30,134	; 35 Burn30
	db	  0, 10	; 36 AutoRp
	db	  0, 11	; 37 Proplr
