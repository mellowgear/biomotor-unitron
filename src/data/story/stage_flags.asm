; StageFlags (stage_flags): 10 records of 1 bytes, one line per id; keep the order and count.
; SetStoryStage 0x216AD4: clears event flags 0-11, then sets the flag on line A + 1 and
; updates wArenaRank from tables/stage_arena_rank.asm. AdvanceStoryStage 0x216AFA: A = stage + 1
; while the stage is below 9.
; id: flag
	db	EVENT_STAGE_TOWN	; 1
	db	EVENT_STAGE_ARENA_OPEN	; 2
	db	EVENT_STAGE_WON_RANK_E	; 3
	db	EVENT_STAGE_WON_RANK_D	; 4
	db	EVENT_STAGE_WON_RANK_C	; 5
	db	EVENT_STAGE_WON_RANK_B	; 6
	db	EVENT_STAGE_WON_RANK_A	; 7
	db	EVENT_STAGE_WON_RANK_S	; 8
	db	EVENT_STAGE_WON_RANK_CS	; 9
	db	EVENT_STAGE_WON_RANK_X	; 10
