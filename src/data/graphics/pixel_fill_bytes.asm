; PixelFillBytes (pixel_fill_bytes): 5 records of 1 bytes, one line per id; keep the order and count.
; sub_216DCD writes this byte for a fill of line - 1 pixels (0-4, clamped): 2 bits per pixel,
; colour 3 from the right.
; id: byte
	db	0x00	; 1
	db	0x03	; 2
	db	0x0F	; 3
	db	0x3F	; 4
	db	0xFF	; 5
