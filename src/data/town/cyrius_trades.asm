; CyriusTradeMenu (cyrius_trades): 5 records of 12 bytes, one line per id; keep the order and count.
; Cyrius's Emblem trade menu, line = race r + 1 (as start_equipment). Value <= 0x100 = item id
; (tables/items/), else part id = value - 0x100 (GetItemOrPartName / GetItemOrPartDesc); the pick goes to AddItem.
; After a trade CyriusTrade clears the emblem flags 0x10-0x13 and, at story stage >= 0x0A, the
; Lords flags 0x60-0x63 (they respawn). (Play: all five race menus match.)
; id: t1, t2, t3, t4, t5, t6
	dw	282,290,346, 69,70,71	; 1 FireB, Paladn, Fuzion, Oricon, Zeus, Hades
	dw	283,294,295,347,70,71	; 2 WoodB, Jester, Kalon, Titan, Zeus, Hades
	dw	284,298,299,348,70,71	; 3 WaterB, Dolphn, Serpnt, C-Lion, Zeus, Hades
	dw	285,290,349, 68,70,71	; 4 WindB, Paladn, Mikal, Hirokn, Zeus, Hades
	dw	286,303,304,350,70,71	; 5 EarthB, Dragon, Hero, DWing, Zeus, Hades
