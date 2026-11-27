; DungeonSelectMoves (dungeon_select_moves): 5 records of 8 bytes, one line per id; keep the order and count.
; WorldMapInput / DungeonSelectMove: on the dungeon choice screen the d-pad moves the selection
; (DUNGEON_ID, line = id + 1) to the value in the column for that direction; 255 = no move.
; A on id 0 goes back (StartWorldMapExit), on another id enters (StartDungeonEntrance).
; id: up, down, left, right, up_right, down_right, down_left, up_left
	db	  4,  2,  3,  1,255,255,255,255	; 1 id 0
	db	  4,  2,  0,255,255,255,  2,  0	; 2 id 1: Forest
	db	  0,255,  3,  1,  1,255,255,  3	; 3 id 2: Blue
	db	  4,  2,255,  0,  0,  2,255,255	; 4 id 3: Wind
	db	255,  0,  3,  1,255,  0,  3,255	; 5 id 4: Stone
