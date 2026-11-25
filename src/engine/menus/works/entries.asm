; engine/menus/works/entries.asm: entry (part or item group) lookups: names, descriptions, stats, affinity, inventory counts by group/category

c_217386	section	code abs=0x217386

; [code] item group W, index A: CheckItemGroupIndex, ItemGroupToIndex, GetItemNameWorks; invalid or 0 -> GetDashesText
GetItemEntryName:
	or	WA,WA
	jp	Z,GetDashesText
	call	CheckItemGroupIndex
	jp	NC,GetDashesText
	call	ItemGroupToIndex
	call	GetItemNameWorks
	ret

c_21739F	section	code abs=0x21739F

; [code] W < 6: part group (CheckPartGroupIndex, PartGroupToIndex, GetPartNameWorks), else GetItemEntryName(W - 5); invalid or 0 -> "------" (GetDashesText)
GetEntryName:
	cp	W,6
	jr	C,GetEntryName.skip
	sub	W,5
	jp	GetItemEntryName
GetEntryName.skip:
	or	WA,WA
	jp	Z,GetDashesText
	call	CheckPartGroupIndex
	jp	NC,GetDashesText
	call	PartGroupToIndex
	call	GetPartNameWorks
	ret

c_2173C3	section	code abs=0x2173C3

; [code] W < 6: GetPartGroupSize, else GetItemGroupSize(W - 5)
GetEntryGroupSize:
	cp	W,6
	jr	NC,GetEntryGroupSize.skip
	call	GetPartGroupSize
	jr	GetEntryGroupSize.done
GetEntryGroupSize.skip:
	sub	W,5
	call	GetItemGroupSize
GetEntryGroupSize.done:
	ret

c_2173D5	section	code abs=0x2173D5

; [code] W < 6: PartGroupToIndex + GetPartDescWorks, else ItemGroupToIndex(W - 5) + GetItemDescWorks
GetEntryDesc:
	cp	W,6
	jr	NC,GetEntryDesc.skip
	call	PartGroupToIndex
	call	GetPartDescWorks
	ret
GetEntryDesc.skip:
	sub	W,5
; [code] item group W, index A: ItemGroupToIndex + GetItemDescWorks (the item half of GetEntryDesc, called at 0x2173E5 by the item list move hooks)
GetItemEntryDesc:
	call	ItemGroupToIndex
	call	GetItemDescWorks
	ret

c_2173EE	section	code abs=0x2173EE

; [code] entry group W: < 6 CheckPartGroupIndex, else CheckItemGroupIndex(W - 5) (WA kept); carry when A is in range
CheckEntryGroupIndex:
	cp	W,6
	jr	NC,CheckEntryGroupIndex.skip
	call	CheckPartGroupIndex
	jr	CheckEntryGroupIndex.done
CheckEntryGroupIndex.skip:
	push	WA
	sub	W,5
	call	CheckItemGroupIndex
	pop	WA
CheckEntryGroupIndex.done:
	ret

c_217427	section	code abs=0x217427

; [code] XHL = "------" (DashText13)
GetDashesText:
	ld	XHL,DashText13
	ret
DashText13:
	db	0x59,0x59,0x59,0x59,0x59,0x59,0xFF	; "------"

c_217434	section	code abs=0x217434

; [code] part group W, index A: CheckPartGroupIndex, PartGroupToIndex, GetPartStatsWorks (XHL = record); carry when valid
GetPartStatsBy:
	call	CheckPartGroupIndex
	jr	NC,GetPartStatsBy.done
	call	PartGroupToIndex
	call	GetPartStatsWorks
	scf
GetPartStatsBy.done:
	ret

c_217444	section	code abs=0x217444

; [code] W < 6: part record +0xE (GetPartStatsBy), else GetItemAffinity(ItemGroupToIndex(W - 5)); carry when valid
GetEntryAffinity:
	cp	W,6
	jr	NC,GetEntryAffinity.skip
	call	CheckPartGroupIndex
	jr	NC,GetEntryAffinity.done
	call	PartGroupToIndex
	call	GetPartStatsWorks
	ld	WA,(XHL+0xE)
	jr	GetEntryAffinity.skip2
GetEntryAffinity.skip:
	sub	W,5
	call	CheckItemGroupIndex
	jr	NC,GetEntryAffinity.done
	call	ItemGroupToIndex
	call	GetItemAffinity
GetEntryAffinity.skip2:
	scf
GetEntryAffinity.done:
	ret

c_21746E	section	code abs=0x21746E

; [code] for each set bit of E (low first) draws the next glyph of AffinityIconChars2 (codes 0x6C 0x6E 0x6D 0x70 0x6F 0x6A 0x6B 0x73, the icon glyphs) with DrawCharAt, column B + 1 per icon
DrawAffinityIcons:
	ld	XHL,AffinityIconChars2
DrawAffinityIcons.loop:
	or	E,E
	jr	Z,DrawAffinityIcons.done
	srl	1,E
	jr	NC,DrawAffinityIcons.skip
	push	XHL
	push	DE
	push	BC
	push	WA
	ld	L,(XHL)
	call	DrawCharAt
	pop	WA
	pop	BC
	pop	DE
	pop	XHL
	inc	1,B
DrawAffinityIcons.skip:
	inc	1,XHL
	jr	DrawAffinityIcons.loop
DrawAffinityIcons.done:
	ret
AffinityIconChars2:
	db	0x6C,0x6E,0x6D,0x70,0x6F,0x6A,0x6B,0x73

c_21968B	section	code abs=0x21968B

; [code] item group W, index A: CheckItemGroupIndex (NC -> return), ItemGroupToIndex, carry
GetItemIndexBy:
	call	CheckItemGroupIndex
	ret	NC
	call	ItemGroupToIndex
	scf
	ret

c_219697	section	code abs=0x219697

; [code] item group W, index A -> XHL = 0x5080 + 0-based item id (wItemCounts + id), carry when valid
GetItemCountPtr:
	call	GetItemIndexBy
	ret	NC
	ld	XHL,0x5080
	lda	XHL,XHL+WA
	ret

c_2196A8	section	code abs=0x2196A8

; [code] A = the wItemCounts byte of item group W, index A (GetItemCountPtr); carry when valid
GetItemCountBy:
	call	GetItemCountPtr
	ret	NC
	ld	A,(XHL)
	ret

c_2196B1	section	code abs=0x2196B1

; [code] the wItemCounts byte of item group W, index A = B (GetItemCountPtr)
SetItemCountBy:
	call	GetItemCountPtr
	ret	NC
	ld	(XHL),B
	ret

c_2196BA	section	code abs=0x2196BA

; [code] W = item group, A = index: GetItemIndexBy (NC -> return), + 1, AddItem (the AddItem counterpart of RemoveGroupItem)
AddGroupItem:
	call	GetItemIndexBy
	ret	NC
	inc	1,WA
	call	AddItem
	ret

c_2196C7	section	code abs=0x2196C7

; [code] W = item group, A = index: CheckItemGroupIndex (NC -> return), ItemGroupToIndex + 1, RemoveItem; callers DevelopRoll, ShopMenu
RemoveGroupItem:
	call	GetItemIndexBy
	ret	NC
	inc	1,WA
	call	RemoveItem
	ret

c_2196D4	section	code abs=0x2196D4

; [code] entry group W: < 6 part group (CheckPartGroupIndex, PartGroupToIndex + 0x100), else GetItemIndexBy(W - 5); carry when valid; the index past wItemCounts reaches wPartCounts (0x5080 + 0x100 = 0x5180)
GetEntryInventoryIndex:
	cp	W,6
	jr	C,GetEntryInventoryIndex.skip
	sub	W,5
	jp	GetItemIndexBy
GetEntryInventoryIndex.skip:
	call	CheckPartGroupIndex
	ret	NC
	call	PartGroupToIndex
	add	WA,0x100
	scf
	ret

c_2196EF	section	code abs=0x2196EF

; [code] XHL = 0x5080 + GetEntryInventoryIndex (item or part count byte), carry when valid
GetEntryCountPtr:
	call	GetEntryInventoryIndex
	ret	NC
	ld	XHL,0x5080
	lda	XHL,XHL+WA
	scf
	ret

c_219701	section	code abs=0x219701

; [code] A = the count byte at GetEntryCountPtr; carry when valid
GetEntryCountBy:
	call	GetEntryCountPtr
	ret	NC
	ld	A,(XHL)
	ret

c_21970A	section	code abs=0x21970A

; [code] the count byte at GetEntryCountPtr = B
SetEntryCountBy:
	call	GetEntryCountPtr
	ret	NC
	ld	(XHL),B
	ret

c_219713	section	code abs=0x219713

; [code] W = category, A = id (Works list form) -> wItemCounts index, AddItem
AddItemByCategory:
	call	GetEntryInventoryIndex
	ret	NC
	inc	1,WA
	call	AddItem
	ret

c_219720	section	code abs=0x219720

; [code] same, RemoveItem
RemoveItemByCategory:
	call	GetEntryInventoryIndex
	ret	NC
	inc	1,WA
	call	RemoveItem
	ret
