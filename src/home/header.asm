; home/header.asm: the cartridge header, 0x200000-0x20003F (64 B). Layout from SNK's NGPC
; system programming manual, "Software cassette recognition header information format"
; (ngpc-project-template/official-docs/SysPro/SysPro.md l.172-186).
d_200000	section	romdata abs=0x200000
Header:
	db	" LICENSED BY SNK CORPORATION"	; recognition code, third-party form (28 B)
	dl	Start		; startup address (little endian)
HeaderCartId:			; 0x200020: copied into every save slot header (loc_20DBDE, data/save/flash.asm)
	dw	0x0053		; software ID code (little-endian BCD)
	db	0x00		; ID sub-code (version)
	db	0x10		; compatible system: 0x10 = colour
	db	"B.M.Unitron1"	; title name (12 B, ASCII)
	dfb	16,0		; reserved, written as 0
