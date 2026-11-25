; [code] DrawEnteredNameTask (0x20F877): the blinking cursor character drawn after the entered
; characters (DrawTextChar, while fewer than 6 are entered): 0x5E = "_" in the charmap.
NameEntryCursorChar:
	db	0x5E
; [code] NameEntryCancelEndCursor (name entry): DE (y) of the sprite DrawSpriteGrid draws, word task +0x14 (0-1);
; word 0 = 0x0074 (the cursor next to "Cancel"), word 1 = 0x007C (next to "End"): its high byte 0x00 is
; the first byte of the next text bank (0x226C15). [play] +0x14 = 1 after Down from the digits row or
; from Cancel; the blinking cursor then sits at "End" (the earlier reading 0xFD7C took one byte too many). (was Data_226C12)
NameEntryCancelEndCursorY:
	db	0x74,0x00,0x7C
