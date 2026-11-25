; [code] DrawEnteredNameTask (0x20F877): the blinking cursor character drawn after the entered
; characters (DrawTextChar, while fewer than 6 are entered): 0x5E = "_" in the charmap.
NameEntryCursorChar:
	db	0x5E
; [code] dyn_20FAC6 (name entry): DE (y) of the sprite sub_206BFF draws, word task +0x14 (0-1);
; word 0 = 0x0074, word 1 = 0x7C plus the first byte of the next text bank (0xFD: 0xFD7C, off
; screen for sub_206BFF, which skips y <= -8).
Data_226C12:
	db	0x74,0x00,0x7C
