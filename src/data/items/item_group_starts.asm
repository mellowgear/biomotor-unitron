; ItemGroupStarts (item_group_starts): 4 records of 1 bytes, one line per id; keep the order and count.
; ItemGroupToIndex: item id - 1 = this + index - 1, line = group 1-4 (see tables/item_groups.asm).
; id: first
	db	 0	; 1 group 1: accessories
	db	37	; 2 group 2: battle items
	db	51	; 3 group 3: tools
	db	56	; 4 group 4: materials
