; TalkShop (talk_shop): 10 records of 8 bytes, one line per id; keep the order and count.
; Talk rows of the Shop (place 6), line = row + 1.
; One talk_row record per line (src/macros/tables.inc).
; Messages / lists are 4-byte ROM pointers (dd), written as their labels.
; id: speaker, portrait, flag, next, message
	talk_row	25,0,0,  1,WelcomeToLakesHaventText	; 1 Lana: "Welcome to Lake's! Haven't s..."
	talk_row	24,0,0,  2,WhatOhACustomerText	; 2 Galb: "What? Oh, a customer! And a ..."
	talk_row	25,0,0,  8,ImSorryMyHusText	; 3 Lana: "I'm sorry. My hus-band can b..."
	talk_row	25,0,0,253,HelloImSorryWereText	; 4 Lana: "Hello! I'm sorry--we're taki..."
	talk_row	24,0,0,  5,GoodJobPlayerOrText	; 5 Galb: "Good job, . Or should I call..."
	talk_row	25,0,0,  6,IKnewTheMomentText	; 6 Lana: "I knew the moment we met tha..."
	talk_row	24,0,EVENT_TALKED_SHOP,253,KeepUpTheGoodText2	; 7 Galb: "Keep up the good work, Maste..."
	talk_row	24,0,0,253,OhHiPlayerImText	; 8 Galb: "Oh, hi . I'm sorry, but we'r..."
	talk_row	24,0,0,  9,HmOhForgotSomethingText	; 9 Galb: "Hm? Oh...Forgot something......"
	talk_row	25,0,EVENT_TALKED_SHOP,253,WellThatsASurpriseText	; 10 Lana: "Well! That's a surprise! Oh ..."
