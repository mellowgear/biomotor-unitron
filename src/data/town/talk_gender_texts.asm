; TalkGenderTexts (talk_gender_texts): 11 records of 8 bytes, one line per id; keep the order and count.
; dyn_2158CE: a talk row message below 0x58 is a byte offset into this table: the message
; is the female or male pointer (IsPlayerMale) of line offset / 8 + 1.
; Addresses are 4-byte ROM addresses (dd). [play] female-human A3 (Works partner talk): the five
; lines whose texts differ (3 Unitron fitted, 4 after the CS win, 9 the earthquake, 10 good luck,
; 11 post-game)
; were all seen with a female pilot; the male text of line 10 names "Zapper" outright.
; id: female, male
	dd	0x2575C2,0x2575C2	; 1 "Good morning. Sleep ..." / "Good morning. Sleep ..."
	dd	0x257793,0x257793	; 2 "Sorry--it's going to..." / "Sorry--it's going to..."
	dd	0x257816,0x2579AC	; 3 "Ah, there you are! G..." / "Ah, there you are! G..."
	dd	0x257B1A,0x257D91	; 4 "That was a good figh..." / "That was a good figh..."
	dd	0x257FA7,0x257FA7	; 5 "Oh, it's you. Sorry,..." / "Oh, it's you. Sorry,..."
	dd	0x258001,0x258001	; 6 "Welcome back. I just..." / "Welcome back. I just..."
	dd	0x2585EB,0x2585EB	; 7 "Lily...You're safe n..." / "Lily...You're safe n..."
	dd	0x258618,0x258618	; 8 "What's that!?" / "What's that!?"
	dd	0x25870C,0x258802	; 9 "I don't want you to ..." / "No! , don't go! No! ..."
	dd	0x258943,0x25898D	; 10 "It's not your fault,..." / "It's not your fault,..."
	dd	0x2589F1,0x258A7B	; 11 "It's been a while si..." / "It's been a while si..."
