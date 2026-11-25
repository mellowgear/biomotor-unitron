; StageRequiredTalkCounts: 12 x u8, one per story stage 0-11 (GetStoryStage).
; [code] GetArenaTalkRow: the number of event flags in the stage's StageRequiredTalks list
; that must all be set (CheckEventFlag, ANDed); 0 = no check.
; id: count
	db	0	; stage 0
	db	0	; stage 1
	db	3	; stage 2
	db	2	; stage 3
	db	0	; stage 4
	db	1	; stage 5
	db	2	; stage 6
	db	0	; stage 7
	db	0	; stage 8
	db	0	; stage 9
	db	11	; stage 10
	db	0	; stage 11
