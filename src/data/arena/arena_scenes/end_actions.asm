; ArenaSceneEndActions (arena_scenes): 70 records of 1 bytes, one line per id; keep the order and count.
; Arena talk scenes, line = scene + 1 (task +0x12); the message is ArenaTalkTexts[scene].
; end_action (ArenaSceneEnd): 1 SetTalkedJon, 2 rank won (AdvanceStoryStage, ClearTalkedFlags,
; prize item arena_prizes.txt, prize GP), 3 SetJonNotReadySeen, else nothing.
; next (ArenaSceneEnd): below 0x50 = the next scene; 0x50-0x6F = a pair in
; tables/arena_gender_scenes.asm; 0xF2-0xFE = commands (ArenaSceneEnd's jump list), 0xFF = end.
; cast: DrawArenaSceneCast passes it to DrawArenaParticipants (only when it changes): 0 = none,
; 255 / 254 = the player's own portrait (1 or 0x0B + race/gender), 0x38 / 0x3A handled apart.
; id: end_action
	db	0	; 1 scene 0
	db	0	; 2 scene 1
	db	0	; 3 scene 2
	db	0	; 4 scene 3
	db	0	; 5 scene 4
	db	0	; 6 scene 5
	db	0	; 7 scene 6
	db	0	; 8 scene 7
	db	0	; 9 scene 8
	db	0	; 10 scene 9
	db	0	; 11 scene 10
	db	0	; 12 scene 11
	db	0	; 13 scene 12
	db	1	; 14 scene 13
	db	0	; 15 scene 14
	db	1	; 16 scene 15
	db	0	; 17 scene 16
	db	2	; 18 scene 17
	db	2	; 19 scene 18
	db	0	; 20 scene 19
	db	2	; 21 scene 20
	db	2	; 22 scene 21
	db	0	; 23 scene 22
	db	2	; 24 scene 23
	db	2	; 25 scene 24
	db	0	; 26 scene 25
	db	2	; 27 scene 26
	db	2	; 28 scene 27
	db	0	; 29 scene 28
	db	2	; 30 scene 29
	db	2	; 31 scene 30
	db	0	; 32 scene 31
	db	0	; 33 scene 32
	db	0	; 34 scene 33
	db	2	; 35 scene 34
	db	2	; 36 scene 35
	db	0	; 37 scene 36
	db	0	; 38 scene 37
	db	0	; 39 scene 38
	db	0	; 40 scene 39
	db	0	; 41 scene 40
	db	0	; 42 scene 41
	db	0	; 43 scene 42
	db	0	; 44 scene 43
	db	0	; 45 scene 44
	db	0	; 46 scene 45
	db	0	; 47 scene 46
	db	0	; 48 scene 47
	db	0	; 49 scene 48
	db	0	; 50 scene 49
	db	0	; 51 scene 50
	db	0	; 52 scene 51
	db	0	; 53 scene 52
	db	0	; 54 scene 53
	db	2	; 55 scene 54
	db	2	; 56 scene 55
	db	1	; 57 scene 56
	db	1	; 58 scene 57
	db	0	; 59 scene 58
	db	1	; 60 scene 59
	db	0	; 61 scene 60
	db	2	; 62 scene 61
	db	2	; 63 scene 62
	db	3	; 64 scene 63
	db	0	; 65 scene 64
	db	0	; 66 scene 65
	db	0	; 67 scene 66
	db	0	; 68 scene 67
	db	0	; 69 scene 68
	db	0	; 70 scene 69
