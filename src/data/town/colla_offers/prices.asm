; CollaPrices (colla_offers): 10 records of 20 bytes, one line per id; keep the order and count.
; Colla's offer (sub_216391, sub_21640A, CollaBuy). Offer = the line picked with a random 0-99
; against the column for GetStageArenaRank clamped to 3-8 (each column sums to 100);
; price = price<k>, k from tables/colla_price_odds.asm. item: id in tables/items/. The prices are 50, 75,
; 100, 125 and 150 % of the shop price.
; BCD: written as 0x followed by the decimal digits (650000 = 0x650000).
; id: price1 (BCD), price2 (BCD), price3 (BCD), price4 (BCD), price5 (BCD)
	dd	  0x5000,  0x7500, 0x10000, 0x12500, 0x15000	; 1 price1 5000 price2 7500 price3 10000 price4 12500 price5 15000
	dd	 0x12500, 0x18750, 0x25000, 0x31250, 0x37500	; 2 price1 12500 price2 18750 price3 25000 price4 31250 price5 37500
	dd	 0x12500, 0x18750, 0x25000, 0x31250, 0x37500	; 3 price1 12500 price2 18750 price3 25000 price4 31250 price5 37500
	dd	 0x75000,0x112500,0x150000,0x187500,0x225000	; 4 price1 75000 price2 112500 price3 150000 price4 187500 price5 225000
	dd	 0x75000,0x112500,0x150000,0x187500,0x225000	; 5 price1 75000 price2 112500 price3 150000 price4 187500 price5 225000
	dd	 0x75000,0x112500,0x150000,0x187500,0x225000	; 6 price1 75000 price2 112500 price3 150000 price4 187500 price5 225000
	dd	 0x75000,0x112500,0x150000,0x187500,0x225000	; 7 price1 75000 price2 112500 price3 150000 price4 187500 price5 225000
	dd	 0x75000,0x112500,0x150000,0x187500,0x225000	; 8 price1 75000 price2 112500 price3 150000 price4 187500 price5 225000
	dd	0x100000,0x150000,0x200000,0x250000,0x300000	; 9 price1 100000 price2 150000 price3 200000 price4 250000 price5 300000
	dd	0x150000,0x225000,0x300000,0x375000,0x450000	; 10 price1 150000 price2 225000 price3 300000 price4 375000 price5 450000
