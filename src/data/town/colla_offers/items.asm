; CollaItems (colla_offers): 10 records of 1 bytes, one line per id; keep the order and count.
; Colla's offer (RollCollaOffer, ShowCollaOffer, CollaBuy). Offer = the line picked with a random 0-99
; against the column for GetStageArenaRank clamped to 3-8 (each column sums to 100);
; price = price<k>, k from tables/colla_price_odds.asm. item: id in tables/items/. The prices are 50, 75,
; 100, 125 and 150 % of the shop price.
; id: item
	db	60	; 1
	db	61	; 2
	db	62	; 3
	db	63	; 4
	db	64	; 5
	db	65	; 6
	db	66	; 7
	db	67	; 8
	db	68	; 9
	db	69	; 10
