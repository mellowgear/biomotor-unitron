; audio/songs.asm: SongTable and the 21 song headers (PlaySong 0x200122).
; Format read from the code: evidence/songs_2026-11-25.md sections 1, 2 and 3.1; the
; tracks themselves are in audio/tracks.asm.
; Song_NN: NN = the song id in decimal (PlayMusic WA). Track_XX: XX = the track id in hex
; (the u16 at the start of the track; game sound ids 0x20-0x7E music, >= 0x80 SFX).

d_200E86	section	romdata abs=0x200E86
; [code] PlaySong: entry = SongTable + 4*id, no bounds check. The 0 entry (id 21) is "no song":
; PlaySong returns with carry set before touching the Z80. No call site passes 21.
SongTable:
	dl	Song_00,Song_01,Song_02,Song_03
	dl	Song_04,Song_05,Song_06,Song_07
	dl	Song_08,Song_09,Song_10,Song_11
	dl	Song_12,Song_13,Song_14,Song_15
	dl	Song_16,Song_17,Song_18,Song_19
	dl	Song_20
	dl	0

; [code] song header (PlaySong):
;   dw  3 Z80 addresses copied to Z80 0x0AB5: the voice records (always 0x0ABD), the music
;       blocks (0x0ABD + 9 * voices), the SFX blocks (music + the music blocks' lengths);
;       the second word + 0x7000 is also where PlaySong copies the first block
;   db  voice count, then the voice ids (SoundInit + 9*id is copied to the Z80)
;   then per track: dl the track, db n + n map bytes (PlaySong copies them into the block
;       at offset E, over the track's own map; music tracks must come before SFX tracks)
;   dl  0 ends the list

d_200EDE	section	romdata abs=0x200EDE
; [code] Reset (PlaySong direct, no start), the Arena and battle callers, town; started as track 0x20 (evidence/songs_2026-11-25.md section 5)
Song_00:
	dw	0x0ABD,0x0AD8,0x0EF1
	db	3,0,1,2	; 3 voices
	dl	Track_20
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_84
	db	1,0
	dl	0

d_200F12	section	romdata abs=0x200F12
; [code] town (OpenSquareMenu ...); track 0x21 (evidence/songs_2026-11-25.md section 5)
Song_01:
	dw	0x0ABD,0x0AD8,0x0EE9
	db	3,0,1,2	; 3 voices
	dl	Track_21
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_85
	db	1,0
	dl	Track_86
	db	1,2
	dl	0

d_200F4C	section	romdata abs=0x200F4C
; [code] shop and town callers; track 0x22 (evidence/songs_2026-11-25.md section 5)
Song_02:
	dw	0x0ABD,0x0AD8,0x0E3F
	db	3,0,1,2	; 3 voices
	dl	Track_22
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_87
	db	2,0,2
	dl	Track_88
	db	2,0,2
	dl	Track_89
	db	1,2
	dl	Track_8A
	db	1,0
	dl	Track_8B
	db	1,2
	dl	Track_8C
	db	1,2
	dl	Track_8D
	db	1,1
	dl	Track_84
	db	1,0
	dl	0

d_200FAC	section	romdata abs=0x200FAC
; [code] town and shop callers; track 0x23 (evidence/songs_2026-11-25.md section 5)
Song_03:
	dw	0x0ABD,0x0AD8,0x0F3B
	db	3,0,1,2	; 3 voices
	dl	Track_23
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_8E
	db	2,0,2
	dl	Track_8F
	db	1,1
	dl	0

d_200FE7	section	romdata abs=0x200FE7
; [code] Arena (SetupArenaScreen ...), shop, StorySceneUniticeSetup; track 0x24 (evidence/songs_2026-11-25.md section 5)
Song_04:
	dw	0x0ABD,0x0AD8,0x0DD6
	db	3,0,1,2	; 3 voices
	dl	Track_24
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_90
	db	1,2
	dl	Track_91
	db	1,0
	dl	0

d_201021	section	romdata abs=0x201021
; [code] PlayDungeonMusic: song 5 + (DUNGEON_ID - 1), track 0x25 + (DUNGEON_ID - 1); songs 5-9 share the dungeon SFX (0x85, 0x86, 0x92-0x98) (evidence/songs_2026-11-25.md section 5)
Song_05:
	dw	0x0ABD,0x0AD8,0x0E6A
	db	3,0,1,2	; 3 voices
	dl	Track_25
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_85
	db	1,0
	dl	Track_86
	db	1,2
	dl	Track_92
	db	1,1
	dl	Track_93
	db	1,2
	dl	Track_94
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_98
	db	1,2
	dl	0

d_201085	section	romdata abs=0x201085
; [code] PlayDungeonMusic: song 5 + (DUNGEON_ID - 1), track 0x25 + (DUNGEON_ID - 1); songs 5-9 share the dungeon SFX (0x85, 0x86, 0x92-0x98) (evidence/songs_2026-11-25.md section 5)
Song_06:
	dw	0x0ABD,0x0AD8,0x0E37
	db	3,0,1,2	; 3 voices
	dl	Track_26
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_85
	db	1,0
	dl	Track_86
	db	1,2
	dl	Track_92
	db	1,1
	dl	Track_93
	db	1,2
	dl	Track_94
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_98
	db	1,2
	dl	0

d_2010E9	section	romdata abs=0x2010E9
; [code] PlayDungeonMusic: song 5 + (DUNGEON_ID - 1), track 0x25 + (DUNGEON_ID - 1); songs 5-9 share the dungeon SFX (0x85, 0x86, 0x92-0x98) (evidence/songs_2026-11-25.md section 5)
Song_07:
	dw	0x0ABD,0x0AD8,0x0E6A
	db	3,0,1,2	; 3 voices
	dl	Track_27
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_85
	db	1,0
	dl	Track_86
	db	1,2
	dl	Track_92
	db	1,1
	dl	Track_93
	db	1,2
	dl	Track_94
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_98
	db	1,2
	dl	0

d_20114D	section	romdata abs=0x20114D
; [code] PlayDungeonMusic: song 5 + (DUNGEON_ID - 1), track 0x25 + (DUNGEON_ID - 1); songs 5-9 share the dungeon SFX (0x85, 0x86, 0x92-0x98) (evidence/songs_2026-11-25.md section 5)
Song_08:
	dw	0x0ABD,0x0AD8,0x0E65
	db	3,0,1,2	; 3 voices
	dl	Track_28
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_85
	db	1,0
	dl	Track_86
	db	1,2
	dl	Track_92
	db	1,1
	dl	Track_93
	db	1,2
	dl	Track_94
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_98
	db	1,2
	dl	0

d_2011B1	section	romdata abs=0x2011B1
; [code] PlayDungeonMusic: song 5 + (DUNGEON_ID - 1), track 0x25 + (DUNGEON_ID - 1); songs 5-9 share the dungeon SFX (0x85, 0x86, 0x92-0x98) (evidence/songs_2026-11-25.md section 5)
Song_09:
	dw	0x0ABD,0x0AD8,0x0E16
	db	3,0,1,2	; 3 voices
	dl	Track_29
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_85
	db	1,0
	dl	Track_86
	db	1,2
	dl	Track_92
	db	1,1
	dl	Track_93
	db	1,2
	dl	Track_94
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_98
	db	1,2
	dl	0

d_201215	section	romdata abs=0x201215
; [code] BattleStart by wEnemyId: < 0x59 -> 10, 0x59-0x60 -> 12, 0x61 -> 13, 0x62-0x75 -> 11, >= 0x76 -> 12 (track = 0x20 + song); songs 10-13 load the battle SFX 0x95-0xAB (evidence/songs_2026-11-25.md section 5)
Song_10:
	dw	0x0ABD,0x0AD8,0x0D0C
	db	3,0,1,2	; 3 voices
	dl	Track_2A
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_99
	db	1,0
	dl	Track_9A
	db	1,2
	dl	Track_9B
	db	1,0
	dl	Track_9C
	db	1,2
	dl	Track_9D
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_9E
	db	1,0
	dl	Track_9F
	db	1,2
	dl	Track_A0
	db	2,0,2
	dl	Track_A1
	db	1,0
	dl	Track_A2
	db	2,0,2
	dl	Track_A3
	db	1,0
	dl	Track_A4
	db	1,2
	dl	Track_A5
	db	1,0
	dl	Track_A6
	db	1,0
	dl	Track_A7
	db	1,0
	dl	Track_A8
	db	1,0
	dl	Track_98
	db	1,2
	dl	Track_A9
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_AA
	db	1,2
	dl	Track_AB
	db	1,2
	dl	0

d_2012CF	section	romdata abs=0x2012CF
; [code] BattleStart by wEnemyId: < 0x59 -> 10, 0x59-0x60 -> 12, 0x61 -> 13, 0x62-0x75 -> 11, >= 0x76 -> 12 (track = 0x20 + song); songs 10-13 load the battle SFX 0x95-0xAB (evidence/songs_2026-11-25.md section 5)
Song_11:
	dw	0x0ABD,0x0AD8,0x0D00
	db	3,0,1,2	; 3 voices
	dl	Track_2B
	db	2,0,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_99
	db	1,0
	dl	Track_9A
	db	1,2
	dl	Track_9B
	db	1,0
	dl	Track_9C
	db	1,2
	dl	Track_9D
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_9E
	db	1,0
	dl	Track_9F
	db	1,2
	dl	Track_A0
	db	2,0,2
	dl	Track_A1
	db	1,0
	dl	Track_A2
	db	2,0,2
	dl	Track_A3
	db	1,0
	dl	Track_A4
	db	1,2
	dl	Track_A5
	db	1,0
	dl	Track_A6
	db	1,0
	dl	Track_A7
	db	1,0
	dl	Track_A8
	db	1,0
	dl	Track_98
	db	1,2
	dl	Track_A9
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_AA
	db	1,2
	dl	Track_AB
	db	1,2
	dl	0

d_201388	section	romdata abs=0x201388
; [code] BattleStart by wEnemyId: < 0x59 -> 10, 0x59-0x60 -> 12, 0x61 -> 13, 0x62-0x75 -> 11, >= 0x76 -> 12 (track = 0x20 + song); songs 10-13 load the battle SFX 0x95-0xAB (evidence/songs_2026-11-25.md section 5)
Song_12:
	dw	0x0ABD,0x0AD8,0x0C8D
	db	3,0,1,2	; 3 voices
	dl	Track_2C
	db	2,0,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_99
	db	1,0
	dl	Track_9A
	db	1,2
	dl	Track_9B
	db	1,0
	dl	Track_9C
	db	1,2
	dl	Track_9D
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_9E
	db	1,0
	dl	Track_9F
	db	1,2
	dl	Track_A0
	db	2,0,2
	dl	Track_A1
	db	1,0
	dl	Track_A2
	db	2,0,2
	dl	Track_A3
	db	1,0
	dl	Track_A4
	db	1,2
	dl	Track_A5
	db	1,0
	dl	Track_A6
	db	1,0
	dl	Track_A7
	db	1,0
	dl	Track_A8
	db	1,0
	dl	Track_98
	db	1,2
	dl	Track_A9
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_AA
	db	1,2
	dl	Track_AB
	db	1,2
	dl	0

d_201441	section	romdata abs=0x201441
; [code] BattleStart by wEnemyId: < 0x59 -> 10, 0x59-0x60 -> 12, 0x61 -> 13, 0x62-0x75 -> 11, >= 0x76 -> 12 (track = 0x20 + song); songs 10-13 load the battle SFX 0x95-0xAB (evidence/songs_2026-11-25.md section 5)
Song_13:
	dw	0x0ABD,0x0AD8,0x0CF7
	db	3,0,1,2	; 3 voices
	dl	Track_2D
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_95
	db	1,2
	dl	Track_99
	db	1,0
	dl	Track_9A
	db	1,2
	dl	Track_9B
	db	1,0
	dl	Track_9C
	db	1,2
	dl	Track_9D
	db	1,2
	dl	Track_96
	db	1,0
	dl	Track_9E
	db	1,0
	dl	Track_9F
	db	1,2
	dl	Track_A0
	db	2,0,2
	dl	Track_A1
	db	1,0
	dl	Track_A2
	db	2,0,2
	dl	Track_A3
	db	1,0
	dl	Track_A4
	db	1,2
	dl	Track_A5
	db	1,0
	dl	Track_A6
	db	1,0
	dl	Track_A7
	db	1,0
	dl	Track_A8
	db	1,0
	dl	Track_98
	db	1,2
	dl	Track_A9
	db	1,0
	dl	Track_97
	db	1,1
	dl	Track_AA
	db	1,2
	dl	Track_AB
	db	1,2
	dl	0

d_2014FB	section	romdata abs=0x2014FB
; [code] two dungeon callers; track 0x2E (evidence/songs_2026-11-25.md section 5)
Song_14:
	dw	0x0ABD,0x0AD8,0x0B70
	db	3,0,1,2	; 3 voices
	dl	Track_2E
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	0

d_201529	section	romdata abs=0x201529
; [code] BattleVictory; track 0x2F (SFX 0xAC in BattleVictory.loop) (evidence/songs_2026-11-25.md section 5)
Song_15:
	dw	0x0ABD,0x0AD8,0x0CA2
	db	3,0,1,2	; 3 voices
	dl	Track_2F
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_AC
	db	3,0,1,2
	dl	Track_AD
	db	1,0
	dl	Track_AE
	db	1,0
	dl	0

d_20156B	section	romdata abs=0x20156B
; [code] BattleDefeat, StorySceneTheEnd; track 0x30 (evidence/songs_2026-11-25.md section 5)
Song_16:
	dw	0x0ABD,0x0AD8,0x0CDE
	db	3,0,1,2	; 3 voices
	dl	Track_30
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_AC
	db	3,0,1,2
	dl	Track_AD
	db	1,0
	dl	Track_AE
	db	1,0
	dl	0

d_2015AD	section	romdata abs=0x2015AD
; [code] IntroSequence (track 0x31, SFX 0xAF), TitleRevealSequence (track 0x32) (evidence/songs_2026-11-25.md section 5)
Song_17:
	dw	0x0ABD,0x0AD8,0x0E62
	db	3,0,1,2	; 3 voices
	dl	Track_31
	db	3,0,1,2
	dl	Track_32
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_AF
	db	1,0
	dl	0

d_2015E9	section	romdata abs=0x2015E9
; [code] one caller (0x20F179); track 0x33 (evidence/songs_2026-11-25.md section 5)
Song_18:
	dw	0x0ABD,0x0ACF,0x0ACF
	db	2,0,2	; 2 voices
	dl	Track_33
	db	2,0,1
	dl	0

d_2015FD	section	romdata abs=0x2015FD
; [code] CreditsScreen; track 0x34 (evidence/songs_2026-11-25.md section 5)
Song_19:
	dw	0x0ABD,0x0AD8,0x0AD8
	db	3,0,1,2	; 3 voices
	dl	Track_34
	db	3,0,1,2
	dl	0

d_201613	section	romdata abs=0x201613
; [code] MainMenuSetup, SelectPlayerTask, a dungeon caller; track 0x35 (evidence/songs_2026-11-25.md section 5)
Song_20:
	dw	0x0ABD,0x0AD8,0x0E06
	db	3,0,1,2	; 3 voices
	dl	Track_35
	db	3,0,1,2
	dl	Track_80
	db	1,1
	dl	Track_81
	db	1,2
	dl	Track_82
	db	1,1
	dl	Track_83
	db	1,1
	dl	Track_85
	db	1,0
	dl	Track_90
	db	1,2
	dl	Track_84
	db	1,0
	dl	Track_91
	db	1,0
	dl	0
