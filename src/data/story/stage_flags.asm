; StageFlags (stage_flags): 10 records of 1 bytes, one line per id; keep the order and count.
; SetStoryStage 0x216AD4: clears event flags 0-11, then sets the flag on line A + 1 and
; updates wArenaRank from tables/stage_arena_rank.asm. AdvanceStoryStage 0x216AFA: A = stage + 1
; while the stage is below 9.
; id: flag
	db	 0	; 1
	db	 1	; 2
	db	 2	; 3
	db	 3	; 4
	db	 4	; 5
	db	 5	; 6
	db	 6	; 7
	db	 7	; 8
	db	 8	; 9
	db	11	; 10
