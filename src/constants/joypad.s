; Joypad bits as ReadJoypad copies them from SYS_JOYPAD into wJoyHeld / wJoyPressed /
; wJoyReleased (NGPC hardware order). A+B+OPTION held for 60 frames = reset combo.
.equ D_UP           0x01
.equ D_DOWN         0x02
.equ D_LEFT         0x04
.equ D_RIGHT        0x08
.equ A_BUTTON       0x10
.equ B_BUTTON       0x20
.equ OPTION_BUTTON  0x40
.equ D_PAD          0x0F
.equ BIT_D_UP       0
.equ BIT_D_DOWN     1
.equ BIT_D_LEFT     2
.equ BIT_D_RIGHT    3
.equ BIT_A_BUTTON   4
.equ BIT_B_BUTTON   5
.equ BIT_OPTION_BUTTON 6
