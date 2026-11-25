; ArenaSceneNext (arena_scenes): 70 records of 1 bytes, one line per id; keep the order and count.
; Arena talk scenes, line = scene + 1 (task +0x12); the message is ArenaTalkTexts[scene].
; end_action (ArenaSceneEnd): 1 SetTalkedJon, 2 rank won (AdvanceStoryStage, ClearTalkedFlags,
; prize item arena_prizes.txt, prize GP), 3 SetJonNotReadySeen, else nothing.
; next (ArenaSceneEnd): below 0x50 = the next scene; 0x50-0x6F = a pair in
; tables/arena_gender_scenes.asm; 0xF2-0xFE = commands (ArenaSceneEnd's jump list), 0xFF = end.
; cast: DrawArenaSceneCast passes it to DrawArenaParticipants (only when it changes): 0 = none,
; 255 / 254 = the player's own portrait (1 or 0x0B + race/gender), 0x38 / 0x3A handled apart.
; id: next
	db	252	; 1 scene 0
	db	252	; 2 scene 1
	db	255	; 3 scene 2
	db	255	; 4 scene 3
	db	255	; 5 scene 4
	db	244	; 6 scene 5
	db	255	; 7 scene 6
	db	249	; 8 scene 7
	db	255	; 9 scene 8
	db	248	; 10 scene 9
	db	255	; 11 scene 10
	db	247	; 12 scene 11
	db	254	; 13 scene 12
	db	255	; 14 scene 13
	db	255	; 15 scene 14
	db	253	; 16 scene 15
	db	 80	; 17 scene 16
	db	255	; 18 scene 17
	db	255	; 19 scene 18
	db	 82	; 20 scene 19
	db	255	; 21 scene 20
	db	255	; 22 scene 21
	db	 84	; 23 scene 22
	db	255	; 24 scene 23
	db	255	; 25 scene 24
	db	 86	; 26 scene 25
	db	255	; 27 scene 26
	db	255	; 28 scene 27
	db	 88	; 29 scene 28
	db	255	; 30 scene 29
	db	255	; 31 scene 30
	db	 33	; 32 scene 31
	db	 33	; 33 scene 32
	db	 92	; 34 scene 33
	db	255	; 35 scene 34
	db	255	; 36 scene 35
	db	 38	; 37 scene 36
	db	 38	; 38 scene 37
	db	 96	; 39 scene 38
	db	 41	; 40 scene 39
	db	 41	; 41 scene 40
	db	 98	; 42 scene 41
	db	246	; 43 scene 42
	db	246	; 44 scene 43
	db	100	; 45 scene 44
	db	 47	; 46 scene 45
	db	 47	; 47 scene 46
	db	102	; 48 scene 47
	db	 50	; 49 scene 48
	db	 50	; 50 scene 49
	db	104	; 51 scene 50
	db	 53	; 52 scene 51
	db	 53	; 53 scene 52
	db	106	; 54 scene 53
	db	255	; 55 scene 54
	db	255	; 56 scene 55
	db	255	; 57 scene 56
	db	245	; 58 scene 57
	db	244	; 59 scene 58
	db	255	; 60 scene 59
	db	108	; 61 scene 60
	db	255	; 62 scene 61
	db	255	; 63 scene 62
	db	255	; 64 scene 63
	db	255	; 65 scene 64
	db	243	; 66 scene 65
	db	110	; 67 scene 66
	db	 69	; 68 scene 67
	db	 69	; 69 scene 68
	db	242	; 70 scene 69
