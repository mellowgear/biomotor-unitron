; TalkWorks (talk_works): 16 records of 8 bytes, one line per id; keep the order and count.
; Talk rows of the Works (place 5), line = row + 1.
; One talk_row record per line (src/macros/tables.inc).
; Messages / lists are 4-byte ROM pointers (dd), written as their labels.
; id: speaker, portrait, flag, next, message
	talk_row	255, 0,78,253,0x000000	; 1 player: (by gender)
	talk_row	255, 0, 0,253,0x000008	; 2 player: (by gender)
	talk_row	255, 0, 1,253,0x000010	; 3 player: (by gender)
	talk_row	255, 0,78,253,0x000018	; 4 player: (by gender)
	talk_row	255, 0, 0,253,0x000020	; 5 player: (by gender)
	talk_row	255, 0, 0,  6,0x000028	; 6 player: (by gender)
	talk_row	 22, 0, 0,  7,HelloPlayerImSorryText	; 7 Lily: "Hello, . I'm sorry about wha..."
	talk_row	255, 0, 0,  8,0x000030	; 8 player: (by gender)
	talk_row	 22, 0, 0,237,ButIText	; 9 Lily: "But...I...!!??"
	talk_row	255, 0, 0, 10,0x000038	; 10 player: (by gender)
	talk_row	 22, 0, 0, 11,ThatsTheProtectorThatsText	; 11 Lily: "That's the Protector... That..."
	talk_row	255, 0, 0, 12,0x000040	; 12 player: (by gender)
	talk_row	 22, 0, 0, 13,ImSoSorryPlayerText	; 13 Lily: "I'm so sorry, ...I'm so sorr..."
	talk_row	255, 0, 9,253,0x000048	; 14 player: (by gender)
	talk_row	255, 0,78,253,0x000050	; 15 player: (by gender)
	talk_row	  0,54, 0,236,TheTimeHasComeText	; 16 -: "The time has come! The power..."
