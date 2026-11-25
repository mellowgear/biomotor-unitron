; TalkGenderTexts (talk_gender_texts): 11 records of 8 bytes, one line per id; keep the order and count.
; TownTalkStartRow: a talk row message below 0x58 is a byte offset into this table: the message
; is the female or male pointer (IsPlayerMale) of line offset / 8 + 1.
; Messages / lists are 4-byte ROM pointers (dd), written as their labels. [play] female-human A3 (Works partner talk): the five
; lines whose texts differ (3 Unitron fitted, 4 after the CS win, 9 the earthquake, 10 good luck,
; 11 post-game)
; were all seen with a female pilot; the male text of line 10 names "Zapper" outright.
; id: female, male
	dd	GoodMorningSleepWellText,GoodMorningSleepWellText	; 1 "Good morning. Sleep ..." / "Good morning. Sleep ..."
	dd	SorryItsGoingToText,SorryItsGoingToText	; 2 "Sorry--it's going to..." / "Sorry--it's going to..."
	dd	AhThereYouAreText,AhThereYouAreText2	; 3 "Ah, there you are! G..." / "Ah, there you are! G..."
	dd	ThatWasAGoodText,ThatWasAGoodText2	; 4 "That was a good figh..." / "That was a good figh..."
	dd	OhItsYouSorryText,OhItsYouSorryText	; 5 "Oh, it's you. Sorry,..." / "Oh, it's you. Sorry,..."
	dd	WelcomeBackIJustText,WelcomeBackIJustText	; 6 "Welcome back. I just..." / "Welcome back. I just..."
	dd	LilyYoureSafeNowText,LilyYoureSafeNowText	; 7 "Lily...You're safe n..." / "Lily...You're safe n..."
	dd	WhatsThatText,WhatsThatText	; 8 "What's that!?" / "What's that!?"
	dd	IDontWantYouText,NoPlayerDontGoText	; 9 "I don't want you to ..." / "No! , don't go! No! ..."
	dd	ItsNotYourFaultText,ItsNotYourFaultText2	; 10 "It's not your fault,..." / "It's not your fault,..."
	dd	ItsBeenAWhileText,ItsBeenAWhileText2	; 11 "It's been a while si..." / "It's been a while si..."
