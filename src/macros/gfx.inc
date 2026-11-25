; Graphics macros: the K2GE register writes that game code does inline (no call in the ROM),
; named here so the hardware access stays in one place. Each expands to exactly the original bytes.

; set_scroll_priority: SCROLL_PRIORITY = value (bit 7 picks which scroll plane is in front).
; Expands to "ldb (SCROLL_PRIORITY),value".
?macro set_scroll_priority value
	ldb	(SCROLL_PRIORITY),?value
?endm

; window_off: window origin H 0, V 0xFF and size 0 (WBA_H/WBA_V, WSI_H/WSI_V), so nothing is shown.
; Expands to "ldw (WBA_H),0xFF00 / ldw (WSI_H),0".
?macro window_off
	ldw	(WBA_H),0xFF00
	ldw	(WSI_H),0
?endm

; clear_sprite_vram: zeroes the first 0x80 words of SPRITE_VRAM (sprites 0-0x3F) with an ldirw
; smear (WA = 0 after). Inline in CloseCampItemList.
?macro clear_sprite_vram
	ld	XHL,SPRITE_VRAM
	ld	XDE,SPRITE_VRAM+2
	ld	BC,0x80
	dec	1,BC
	ld	WA,0
	ld	(XHL),WA
	ldirw	(XDE+),(XHL+)
?endm

; clear_scr1_map: zeroes the 0x400 words of SCROLL1_VRAM (0x9000-0x97FF) with an ldirw smear.
; Inline in SetMaxPilotStats.
?macro clear_scr1_map
	ld	BC,0x400
	dec	1,BC
	ld	XHL,SCROLL1_VRAM
	ld	XDE,SCROLL1_VRAM+2
	ldw	(XHL),0
	ldirw	(XDE+),(XHL+)
?endm
