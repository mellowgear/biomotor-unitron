; StageArenaRank (stage_arena_rank): 12 records of 1 bytes, one line per id; keep the order and count.
; Story stage -> wArenaRank (GetStageArenaRank 0x216ABC). Line = stage + 1; the stage is
; the highest event flag 1-11 that is set (GetStoryStage 0x216AA2; 0 if none).
; (Play: flags 0x5060 bit 3 -> 4 on winning Rank C, 0x5061 bit 0 after CS, bit 1 Lily scene,
; bit 2 after the ending, bit 3 Rank X; wArenaRank 3 -> 4 ... 8 -> 9.)
; id: rank
	db	0	; 1
	db	1	; 2
	db	2	; 3
	db	3	; 4
	db	4	; 5
	db	5	; 6
	db	6	; 7
	db	7	; 8
	db	8	; 9
	db	8	; 10
	db	8	; 11
	db	9	; 12
