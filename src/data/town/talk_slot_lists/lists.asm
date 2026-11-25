; TalkSlotLists (talk_slot_lists): 4 records of 4 bytes, one line per id; keep the order and count.
; LoadTalkSlots: for place 1-4 (line; Pub, D-town, Forest, Spring) the lists talk_slots_*.asm,
; count entries per story stage.
; Messages / lists are 4-byte ROM pointers (dd), written as their labels.
; id: list
	dd	TalkSlotsPub	; 1
	dd	TalkSlotsDTown	; 2
	dd	TalkSlotsForest	; 3
	dd	TalkSlotsSpring	; 4
