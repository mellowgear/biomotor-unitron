; RankTitles (rank_titles): 9 strings, 7-byte slots (6 characters + done),
; one per id; keep the order and count. Character codes from the charmap ($charmap).
; GetRankTitle: string 0x25E450 + 7 * n, so line = n (n = 0 would be the bytes before this table).
; Drawn by the save-slot list (DrawSaveSlotList, slot byte +0x32) and the status page (GetRankTitleOrDashes,
; from 0x61A7; nothing is drawn when it is 0).

	slot	7 FF
	text "------"	; 1
	done
	text "Rookie"	; 2
	done
	text "Viscnt"	; 3
	done
	text "Marqis"	; 4
	done
	text "Duke"	; 5
	done
	text "Lord"	; 6
	done
	text "HiMstr"	; 7
	done
	text "M.O.M."	; 8
	done
	text "Legend"	; 9
	done
	slot	0
