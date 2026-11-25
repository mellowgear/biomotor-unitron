; PortraitOffsets (portrait_offsets): 25 records of 2 bytes, one line per id; keep the order and count.
; DrawPortraitAt 0x210383: added to the position (BC, DE) before DrawPortrait. Lines 1-11 =
; portraits 0-10, lines 12-25 = portraits 0x15-0x22; portraits 0x0B-0x14 and above 0x22 get
; no offset.
; id: dx, dy
	db	3,2	; 1 portrait 0x00
	db	3,2	; 2 portrait 0x01
	db	2,2	; 3 portrait 0x02
	db	1,2	; 4 portrait 0x03
	db	2,2	; 5 portrait 0x04
	db	0,2	; 6 portrait 0x05
	db	1,2	; 7 portrait 0x06
	db	0,2	; 8 portrait 0x07
	db	0,2	; 9 portrait 0x08
	db	0,2	; 10 portrait 0x09
	db	1,3	; 11 portrait 0x0a
	db	0,3	; 12 portrait 0x15
	db	0,2	; 13 portrait 0x16
	db	0,2	; 14 portrait 0x17
	db	1,2	; 15 portrait 0x18
	db	2,2	; 16 portrait 0x19
	db	1,2	; 17 portrait 0x1a
	db	1,3	; 18 portrait 0x1b
	db	0,3	; 19 portrait 0x1c
	db	0,3	; 20 portrait 0x1d
	db	0,2	; 21 portrait 0x1e
	db	0,2	; 22 portrait 0x1f
	db	0,2	; 23 portrait 0x20
	db	0,2	; 24 portrait 0x21
	db	0,2	; 25 portrait 0x22
