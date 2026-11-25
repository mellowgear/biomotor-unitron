; Joypad bits as ReadJoypad copies them from SYS_LEVER into wJoyHeld / wJoyPressed /
; wJoyReleased (NGPC hardware order). A+B+OPTION held for 60 frames = reset combo.
D_UP	equ	0x01
D_DOWN	equ	0x02
D_LEFT	equ	0x04
D_RIGHT	equ	0x08
A_BUTTON	equ	0x10
B_BUTTON	equ	0x20
OPTION_BUTTON	equ	0x40
D_PAD	equ	0x0F
BIT_D_UP	equ	0
BIT_D_DOWN	equ	1
BIT_D_LEFT	equ	2
BIT_D_RIGHT	equ	3
BIT_A_BUTTON	equ	4
BIT_B_BUTTON	equ	5
BIT_OPTION_BUTTON	equ	6
