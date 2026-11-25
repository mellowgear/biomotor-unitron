; ArenaSceneCast (arena_scenes): 70 records of 1 bytes, one line per id; keep the order and count.
; Arena talk scenes, line = scene + 1 (task +0x12); the message is ArenaTalkTexts[scene].
; end_action (ArenaSceneEnd): 1 SetTalkedJon, 2 rank won (AdvanceStoryStage, ClearTalkedFlags,
; prize item arena_prizes.txt, prize GP), 3 SetJonNotReadySeen, else nothing.
; next (ArenaSceneEnd): below 0x50 = the next scene; 0x50-0x6F = a pair in
; tables/arena_gender_scenes.asm; 0xF2-0xFE = commands (ArenaSceneEnd's jump list), 0xFF = end.
; cast: DrawArenaSceneCast passes it to DrawArenaParticipants (only when it changes): 0 = none,
; 255 / 254 = the player's own portrait (1 or 0x0B + race/gender), 0x38 / 0x3A handled apart.
; id: cast
	db	 21	; 1 scene 0
	db	 21	; 2 scene 1
	db	 21	; 3 scene 2
	db	 21	; 4 scene 3
	db	 21	; 5 scene 4
	db	 21	; 6 scene 5
	db	 21	; 7 scene 6
	db	 21	; 8 scene 7
	db	 21	; 9 scene 8
	db	 21	; 10 scene 9
	db	 21	; 11 scene 10
	db	 21	; 12 scene 11
	db	 21	; 13 scene 12
	db	 21	; 14 scene 13
	db	 21	; 15 scene 14
	db	 21	; 16 scene 15
	db	 21	; 17 scene 16
	db	255	; 18 scene 17
	db	255	; 19 scene 18
	db	 21	; 20 scene 19
	db	255	; 21 scene 20
	db	255	; 22 scene 21
	db	 21	; 23 scene 22
	db	255	; 24 scene 23
	db	255	; 25 scene 24
	db	 21	; 26 scene 25
	db	255	; 27 scene 26
	db	255	; 28 scene 27
	db	 21	; 29 scene 28
	db	255	; 30 scene 29
	db	255	; 31 scene 30
	db	255	; 32 scene 31
	db	255	; 33 scene 32
	db	 21	; 34 scene 33
	db	255	; 35 scene 34
	db	255	; 36 scene 35
	db	254	; 37 scene 36
	db	254	; 38 scene 37
	db	 56	; 39 scene 38
	db	254	; 40 scene 39
	db	254	; 41 scene 40
	db	 56	; 42 scene 41
	db	254	; 43 scene 42
	db	254	; 44 scene 43
	db	 58	; 45 scene 44
	db	255	; 46 scene 45
	db	255	; 47 scene 46
	db	 21	; 48 scene 47
	db	255	; 49 scene 48
	db	255	; 50 scene 49
	db	 21	; 51 scene 50
	db	255	; 52 scene 51
	db	255	; 53 scene 52
	db	 21	; 54 scene 53
	db	255	; 55 scene 54
	db	255	; 56 scene 55
	db	 21	; 57 scene 56
	db	 21	; 58 scene 57
	db	 21	; 59 scene 58
	db	 21	; 60 scene 59
	db	 21	; 61 scene 60
	db	255	; 62 scene 61
	db	255	; 63 scene 62
	db	 21	; 64 scene 63
	db	 21	; 65 scene 64
	db	 21	; 66 scene 65
	db	 56	; 67 scene 66
	db	254	; 68 scene 67
	db	254	; 69 scene 68
	db	 56	; 70 scene 69
