; ItemGroupSizes (item_groups): 5 records of 1 bytes, one line per id; keep the order and count.
; Line 1 = all items (GetItemGroupSize with W = 0), lines 2-5 = the size of item groups 1-4 (CheckItemGroupIndex:
; a (group, index) pair is valid when index <= this). Groups (play: Works item list): 1 accessories
; (ids 1-37), 2 battle items (38-51), 3 tools (52-56), 4 materials (57-71). The part version is in
; engine/menus/shop.asm (PartGroupSizes, PartGroupFirstIds). The Works copy (0x25ABAC) is read; this is inside it.
; id: count
	db	71	; 1 all items
	db	37	; 2 group 1: accessories
	db	14	; 3 group 2: battle items
	db	 5	; 4 group 3: tools
	db	15	; 5 group 4: materials
