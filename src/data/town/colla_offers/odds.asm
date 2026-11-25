; CollaOdds (colla_offers): 10 records of 6 bytes, one line per id; keep the order and count.
; Colla's offer (sub_216391, sub_21640A, CollaBuy). Offer = the line picked with a random 0-99
; against the column for GetStageArenaRank clamped to 3-8 (each column sums to 100);
; price = price<k>, k from tables/colla_price_odds.asm. item: id in tables/items/. The prices are 50, 75,
; 100, 125 and 150 % of the shop price.
; id: rank3, rank4, rank5, rank6, rank7, rank8
	db	30,25,20,15,15,15	; 1
	db	20,15,15,15,15,15	; 2
	db	10,10,15,15,15,10	; 3
	db	 8,10,10,10,10,10	; 4
	db	 8,10,10,10,10,10	; 5
	db	 8,10,10,10,10,10	; 6
	db	 8,10,10,10,10,10	; 7
	db	 8,10,10,10,10,10	; 8
	db	 0, 0, 0, 3, 3, 5	; 9
	db	 0, 0, 0, 2, 2, 5	; 10
