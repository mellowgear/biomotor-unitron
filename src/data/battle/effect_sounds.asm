; BattleEffectSounds: 232 pointers, one per battle effect id (the BattleEffects index), to
; the effect's sound cue list. PlayBattleEffect (0x210214) keeps the list pointer at task
; +0x22 and, each frame, when the first entry's frame equals the frame counter (task +0x1A,
; from 0) calls SoundCommand with its word and steps to the next entry; a frame byte of 0xFF
; (compared sign-extended with 0xFFFF) ends the list. One sound_cue per entry
; (src/macros/tables.inc). List labels: the first effect id using it.
	dl	FxSounds00,FxSounds00,FxSounds00,FxSounds00	; 00-03
	dl	FxSounds00,FxSounds05,FxSounds05,FxSounds05	; 04-07
	dl	FxSounds05,FxSounds09,FxSounds09,FxSounds09	; 08-0B
	dl	FxSounds09,FxSounds0D,FxSounds0E,FxSounds0F	; 0C-0F
	dl	FxSounds0F,FxSounds0F,FxSounds0F,FxSounds13	; 10-13
	dl	FxSounds13,FxSounds13,FxSounds13,FxSounds17	; 14-17
	dl	FxSounds17,FxSounds17,FxSounds17,FxSounds1B	; 18-1B
	dl	FxSounds1B,FxSounds1B,FxSounds1B,FxSounds1F	; 1C-1F
	dl	FxSounds1F,FxSounds1F,FxSounds1F,FxSounds23	; 20-23
	dl	FxSounds23,FxSounds23,FxSounds23,FxSounds27	; 24-27
	dl	FxSounds27,FxSounds27,FxSounds27,FxSounds2B	; 28-2B
	dl	FxSounds2B,FxSounds2B,FxSounds2B,FxSounds2F	; 2C-2F
	dl	FxSounds2F,FxSounds2F,FxSounds2F,FxSounds33	; 30-33
	dl	FxSounds33,FxSounds33,FxSounds33,FxSounds37	; 34-37
	dl	FxSounds37,FxSounds37,FxSounds37,FxSounds3B	; 38-3B
	dl	FxSounds3B,FxSounds3B,FxSounds3B,FxSounds3F	; 3C-3F
	dl	FxSounds3F,FxSounds3F,FxSounds3F,FxSounds43	; 40-43
	dl	FxSounds43,FxSounds45,FxSounds45,FxSounds47	; 44-47
	dl	FxSounds47,FxSounds49,FxSounds49,FxSounds49	; 48-4B
	dl	FxSounds4C,FxSounds4C,FxSounds4C,FxSounds4F	; 4C-4F
	dl	FxSounds4F,FxSounds4F,FxSounds52,FxSounds53	; 50-53
	dl	FxSounds54,FxSounds54,FxSounds54,FxSounds54	; 54-57
	dl	FxSounds58,FxSounds58,FxSounds58,FxSounds58	; 58-5B
	dl	FxSounds5C,FxSounds5C,FxSounds5C,FxSounds5C	; 5C-5F
	dl	FxSounds60,FxSounds60,FxSounds60,FxSounds60	; 60-63
	dl	FxSounds64,FxSounds64,FxSounds64,FxSounds64	; 64-67
	dl	FxSounds68,FxSounds68,FxSounds68,FxSounds68	; 68-6B
	dl	FxSounds6C,FxSounds6D,FxSounds6D,FxSounds6D	; 6C-6F
	dl	FxSounds6D,FxSounds71,FxSounds72,FxSounds73	; 70-73
	dl	FxSounds74,FxSounds75,FxSounds75,FxSounds75	; 74-77
	dl	FxSounds78,FxSounds78,FxSounds7A,FxSounds7A	; 78-7B
	dl	FxSounds7A,FxSounds7A,FxSounds7E,FxSounds7E	; 7C-7F
	dl	FxSounds7E,FxSounds7E,FxSounds82,FxSounds82	; 80-83
	dl	FxSounds82,FxSounds82,FxSounds86,FxSounds86	; 84-87
	dl	FxSounds86,FxSounds86,FxSounds8A,FxSounds8A	; 88-8B
	dl	FxSounds8A,FxSounds8A,FxSounds8E,FxSounds8E	; 8C-8F
	dl	FxSounds8E,FxSounds8E,FxSounds92,FxSounds93	; 90-93
	dl	FxSounds94,FxSounds94,FxSounds96,FxSounds97	; 94-97
	dl	FxSounds98,FxSounds99,FxSounds9A,FxSounds9B	; 98-9B
	dl	FxSounds9C,FxSounds9D,FxSounds9E,FxSounds9F	; 9C-9F
	dl	FxSoundsA0,FxSoundsA1,FxSoundsA2,FxSoundsA3	; A0-A3
	dl	FxSoundsA4,FxSoundsA5,FxSoundsA6,FxSoundsA7	; A4-A7
	dl	FxSoundsA8,FxSoundsA8,FxSoundsA8,FxSoundsAB	; A8-AB
	dl	FxSoundsAC,FxSoundsAC,FxSoundsAC,FxSoundsAC	; AC-AF
	dl	FxSoundsB0,FxSoundsB0,FxSoundsB0,FxSoundsB0	; B0-B3
	dl	FxSoundsB4,FxSoundsB4,FxSoundsB4,FxSoundsB4	; B4-B7
	dl	FxSoundsB8,FxSoundsB9,FxSoundsB9,FxSoundsB9	; B8-BB
	dl	FxSoundsB9,FxSoundsBD,FxSoundsBE,FxSoundsBF	; BC-BF
	dl	FxSoundsC0,FxSoundsC1,FxSoundsC1,FxSoundsC3	; C0-C3
	dl	FxSoundsC3,FxSoundsC3,FxSoundsC3,FxSoundsC7	; C4-C7
	dl	FxSoundsC7,FxSoundsC7,FxSoundsC7,FxSoundsCB	; C8-CB
	dl	FxSoundsCC,FxSoundsCD,FxSoundsCE,FxSoundsCF	; CC-CF
	dl	FxSoundsCF,FxSoundsCF,FxSoundsCF,FxSoundsCF	; D0-D3
	dl	FxSounds2B,FxSounds2B,FxSounds2B,FxSounds2B	; D4-D7
	dl	FxSounds2F,FxSounds2F,FxSounds2F,FxSounds2F	; D8-DB
	dl	FxSounds60,FxSounds60,FxSounds60,FxSounds60	; DC-DF
	dl	FxSounds64,FxSounds64,FxSounds64,FxSounds64	; E0-E3
	dl	FxSounds68,FxSounds68,FxSounds68,FxSounds68	; E4-E7
FxSounds00:	; effect 0x00, 0x01, 0x02, 0x03, 0x04
	sound_cue	0,0x96
	db	0xFF	; end
FxSounds05:	; effect 0x05, 0x06, 0x07, 0x08
	sound_cue	0,0xA5
	db	0xFF	; end
FxSounds09:	; effect 0x09, 0x0A, 0x0B, 0x0C
	sound_cue	0,0x9F
	db	0xFF	; end
FxSounds0D:	; effect 0x0D
	sound_cue	0,0x9E
	db	0xFF	; end
FxSounds0E:	; effect 0x0E
	sound_cue	0,0xA3
	db	0xFF	; end
FxSounds0F:	; effect 0x0F, 0x10, 0x11, 0x12
	sound_cue	0,0xA2
	db	0xFF	; end
FxSounds13:	; effect 0x13, 0x14, 0x15, 0x16
	sound_cue	0,0xA0
	db	0xFF	; end
FxSounds17:	; effect 0x17, 0x18, 0x19, 0x1A
	sound_cue	0,0xA0
	sound_cue	5,0xA0
	db	0xFF	; end
FxSounds1B:	; effect 0x1B, 0x1C, 0x1D, 0x1E
	sound_cue	0,0xA0
	sound_cue	2,0xA0
	sound_cue	4,0xA0
	sound_cue	10,0x2A0
	db	0xFF	; end
FxSounds1F:	; effect 0x1F, 0x20, 0x21, 0x22
	sound_cue	0,0xA0
	sound_cue	1,0xA0
	sound_cue	2,0xA0
	sound_cue	8,0xA0
	sound_cue	9,0xA0
	sound_cue	10,0xA0
	db	0xFF	; end
FxSounds23:	; effect 0x23, 0x24, 0x25, 0x26
	sound_cue	0,0x9E
	sound_cue	4,0x9E
	sound_cue	8,0x9E
	sound_cue	12,0x9E
	db	0xFF	; end
FxSounds27:	; effect 0x27, 0x28, 0x29, 0x2A
	sound_cue	0,0x9E
	sound_cue	2,0x9E
	sound_cue	4,0x9E
	sound_cue	6,0x9E
	sound_cue	8,0x9E
	sound_cue	10,0x9E
	sound_cue	12,0x9E
	db	0xFF	; end
FxSounds2B:	; effect 0x2B, 0x2C, 0x2D, 0x2E, 0xD4, 0xD5, 0xD6, 0xD7
	sound_cue	0,0x97
	db	0xFF	; end
FxSounds2F:	; effect 0x2F, 0x30, 0x31, 0x32, 0xD8, 0xD9, 0xDA, 0xDB
	sound_cue	0,0xAA
	db	0xFF	; end
FxSounds33:	; effect 0x33, 0x34, 0x35, 0x36
	sound_cue	0,0x9B
	sound_cue	3,0x9B
	sound_cue	6,0x9B
	sound_cue	9,0x9B
	db	0xFF	; end
FxSounds37:	; effect 0x37, 0x38, 0x39, 0x3A
	sound_cue	0,0xA1
	db	0xFF	; end
FxSounds3B:	; effect 0x3B, 0x3C, 0x3D, 0x3E
	sound_cue	0,0xA5
	sound_cue	10,0xA5
	db	0xFF	; end
FxSounds3F:	; effect 0x3F, 0x40, 0x41, 0x42
	sound_cue	0,0xA6
	db	0xFF	; end
FxSounds43:	; effect 0x43, 0x44
	sound_cue	0,0xA7
	db	0xFF	; end
FxSounds45:	; effect 0x45, 0x46
	sound_cue	0,0xA7
	sound_cue	25,0xA7
	sound_cue	50,0xA7
	sound_cue	75,0xA7
	db	0xFF	; end
FxSounds47:	; effect 0x47, 0x48
	sound_cue	0,0xA7
	sound_cue	45,0xA7
	sound_cue	55,0xA7
	sound_cue	70,0xA7
	db	0xFF	; end
FxSounds49:	; effect 0x49, 0x4A, 0x4B
	sound_cue	0,0xA8
	sound_cue	47,0xA8
	db	0xFF	; end
FxSounds4C:	; effect 0x4C, 0x4D, 0x4E
	sound_cue	0,0xA8
	db	0xFF	; end
FxSounds4F:	; effect 0x4F, 0x50, 0x51
	sound_cue	0,0xA8
	db	0xFF	; end
FxSounds52:	; effect 0x52
	sound_cue	0,0x98
	sound_cue	25,0x96
	db	0xFF	; end
FxSounds53:	; effect 0x53
	sound_cue	0,0x98
	sound_cue	3,0x98
	sound_cue	6,0x98
	sound_cue	100,0x96
	sound_cue	115,0x96
	sound_cue	130,0x96
	sound_cue	145,0x96
	db	0xFF	; end
FxSounds54:	; effect 0x54, 0x55, 0x56, 0x57
	sound_cue	0,0xA9
	db	0xFF	; end
FxSounds58:	; effect 0x58, 0x59, 0x5A, 0x5B
	sound_cue	0,0xA9
	sound_cue	5,0xA9
	db	0xFF	; end
FxSounds5C:	; effect 0x5C, 0x5D, 0x5E, 0x5F
	sound_cue	0,0xA9
	sound_cue	5,0xA9
	sound_cue	50,0xA9
	db	0xFF	; end
FxSounds60:	; effect 0x60, 0x61, 0x62, 0x63, 0xDC, 0xDD, 0xDE, 0xDF
	sound_cue	0,0x95
	sound_cue	30,0x95
	db	0xFF	; end
FxSounds64:	; effect 0x64, 0x65, 0x66, 0x67, 0xE0, 0xE1, 0xE2, 0xE3
	sound_cue	0,0x98
	sound_cue	30,0x98
	db	0xFF	; end
FxSounds68:	; effect 0x68, 0x69, 0x6A, 0x6B, 0xE4, 0xE5, 0xE6, 0xE7
	sound_cue	0,0xAB
	sound_cue	50,0xAB
	db	0xFF	; end
FxSounds6C:	; effect 0x6C
	sound_cue	0,0xAA
	db	0xFF	; end
FxSounds6D:	; effect 0x6D, 0x6E, 0x6F, 0x70
	sound_cue	0,0xA7
	sound_cue	8,0xA6
	sound_cue	3,0xA6
	sound_cue	3,0xA6
	db	0xFF	; end
FxSounds71:	; effect 0x71
	sound_cue	0,0xA1
	db	0xFF	; end
FxSounds72:	; effect 0x72
	sound_cue	0,0x97
	db	0xFF	; end
FxSounds73:	; effect 0x73
	sound_cue	0,0xAA
	db	0xFF	; end
FxSounds74:	; effect 0x74
	sound_cue	0,0x98
	db	0xFF	; end
FxSounds75:	; effect 0x75, 0x76, 0x77
	sound_cue	0,0xA8
	sound_cue	4,0xA8
	db	0xFF	; end
FxSounds78:	; effect 0x78, 0x79
	sound_cue	0,0xA9
	db	0xFF	; end
FxSounds7A:	; effect 0x7A, 0x7B, 0x7C, 0x7D
	sound_cue	0,0xAA
	sound_cue	120,0xA6
	db	0xFF	; end
FxSounds7E:	; effect 0x7E, 0x7F, 0x80, 0x81
	sound_cue	0,0xA0
	sound_cue	6,0xA1
	db	0xFF	; end
FxSounds82:	; effect 0x82, 0x83, 0x84, 0x85
	sound_cue	0,0xA4
	db	0xFF	; end
FxSounds86:	; effect 0x86, 0x87, 0x88, 0x89
	sound_cue	0,0x98
	db	0xFF	; end
FxSounds8A:	; effect 0x8A, 0x8B, 0x8C, 0x8D
	sound_cue	0,0x97
	db	0xFF	; end
FxSounds8E:	; effect 0x8E, 0x8F, 0x90, 0x91
	sound_cue	0,0x98
	sound_cue	15,0x98
	sound_cue	30,0x98
	sound_cue	88,0xAB
	sound_cue	92,0x97
	db	0xFF	; end
FxSounds92:	; effect 0x92
	sound_cue	0,0xA4
	sound_cue	5,0xA7
	sound_cue	7,0xA7
	sound_cue	9,0xA7
	db	0xFF	; end
FxSounds93:	; effect 0x93
	sound_cue	0,0x99
	sound_cue	5,0x99
	db	0xFF	; end
FxSounds94:	; effect 0x94, 0x95
	db	0xFF	; end
FxSounds96:	; effect 0x96
	sound_cue	1,0x9E
	sound_cue	4,0xA1
	sound_cue	6,0xA1
	sound_cue	8,0xA1
	db	0xFF	; end
FxSounds97:	; effect 0x97
	sound_cue	0,0xA9
	sound_cue	25,0xA9
	db	0xFF	; end
FxSounds98:	; effect 0x98
	sound_cue	0,0x97
	sound_cue	50,0xAB
	sound_cue	55,0x98
	db	0xFF	; end
FxSounds99:	; effect 0x99
	sound_cue	0,0x98
	sound_cue	25,0x97
	db	0xFF	; end
FxSounds9A:	; effect 0x9A
	sound_cue	1,0xA1
	sound_cue	20,0xA1
	sound_cue	40,0xA1
	sound_cue	60,0xA1
	db	0xFF	; end
FxSounds9B:	; effect 0x9B
	sound_cue	0,0x98
	sound_cue	4,0x98
	db	0xFF	; end
FxSounds9C:	; effect 0x9C
	sound_cue	0,0xA1
	sound_cue	15,0xA1
	sound_cue	44,0xA1
	sound_cue	83,0xA9
	db	0xFF	; end
FxSounds9D:	; effect 0x9D
	sound_cue	18,0x97
	sound_cue	25,0x98
	db	0xFF	; end
FxSounds9E:	; effect 0x9E
	sound_cue	0,0xA9
	sound_cue	19,0xA0
	sound_cue	25,0xA0
	sound_cue	31,0xA0
	sound_cue	37,0xA0
	sound_cue	43,0xA0
	db	0xFF	; end
FxSounds9F:	; effect 0x9F
	sound_cue	0,0xA0
	sound_cue	18,0xA0
	sound_cue	20,0xA0
	sound_cue	22,0xA0
	sound_cue	24,0xA0
	sound_cue	26,0xA0
	sound_cue	28,0xA0
	sound_cue	30,0xA0
	sound_cue	32,0xA0
	sound_cue	34,0xA0
	sound_cue	36,0xA0
	sound_cue	38,0xA0
	sound_cue	40,0xA0
	db	0xFF	; end
FxSoundsA0:	; effect 0xA0
	sound_cue	0,0xA8
	sound_cue	30,0xA3
	db	0xFF	; end
FxSoundsA1:	; effect 0xA1
	db	0xFF	; end
FxSoundsA2:	; effect 0xA2
	sound_cue	0,0xAA
	sound_cue	34,0x2AA
	sound_cue	35,0x98
	sound_cue	43,0xAB
	sound_cue	50,0x99
	db	0xFF	; end
FxSoundsA3:	; effect 0xA3
	sound_cue	0,0xA3
	sound_cue	6,0xA6
	db	0xFF	; end
FxSoundsA4:	; effect 0xA4
	sound_cue	0,0xA7
	sound_cue	22,0x99
	db	0xFF	; end
FxSoundsA5:	; effect 0xA5
	sound_cue	0,0xA6
	sound_cue	99,0xAB
	sound_cue	108,0x97
	sound_cue	105,0x98
	db	0xFF	; end
FxSoundsA6:	; effect 0xA6
	sound_cue	0,0xAB
	sound_cue	1,0xA4
	sound_cue	2,0xA4
	sound_cue	3,0xA4
	sound_cue	4,0xA4
	sound_cue	5,0xA4
	db	0xFF	; end
FxSoundsA7:	; effect 0xA7
	sound_cue	0,0xA3
	sound_cue	18,0xAB
	sound_cue	42,0xA0
	sound_cue	46,0x99
	sound_cue	53,0x99
	db	0xFF	; end
FxSoundsA8:	; effect 0xA8, 0xA9, 0xAA
	sound_cue	0,0x96
	db	0xFF	; end
FxSoundsAB:	; effect 0xAB
	db	0xFF	; end
FxSoundsAC:	; effect 0xAC, 0xAD, 0xAE, 0xAF
	db	0xFF	; end
FxSoundsB0:	; effect 0xB0, 0xB1, 0xB2, 0xB3
	db	0xFF	; end
FxSoundsB4:	; effect 0xB4, 0xB5, 0xB6, 0xB7
	db	0xFF	; end
FxSoundsB8:	; effect 0xB8
	sound_cue	0,0xAA
	db	0xFF	; end
FxSoundsB9:	; effect 0xB9, 0xBA, 0xBB, 0xBC
	sound_cue	0,0xA7
	sound_cue	3,0xA7
	sound_cue	6,0xA7
	sound_cue	9,0xA7
	db	0xFF	; end
FxSoundsBD:	; effect 0xBD
	sound_cue	28,0x9E
	db	0xFF	; end
FxSoundsBE:	; effect 0xBE
	sound_cue	0,0x97
	sound_cue	5,0x97
	db	0xFF	; end
FxSoundsBF:	; effect 0xBF
	sound_cue	0,0xAA
	sound_cue	5,0xAA
	db	0xFF	; end
FxSoundsC0:	; effect 0xC0
	sound_cue	0,0x98
	sound_cue	10,0x98
	db	0xFF	; end
FxSoundsC1:	; effect 0xC1, 0xC2
	sound_cue	0,0xA9
	sound_cue	5,0x9B
	db	0xFF	; end
FxSoundsC3:	; effect 0xC3, 0xC4, 0xC5, 0xC6
	sound_cue	0,0xA7
	db	0xFF	; end
FxSoundsC7:	; effect 0xC7, 0xC8, 0xC9, 0xCA
	sound_cue	0,0xA4
	db	0xFF	; end
FxSoundsCB:	; effect 0xCB
	sound_cue	0,0xA4
	sound_cue	5,0xA4
	db	0xFF	; end
FxSoundsCC:	; effect 0xCC
	sound_cue	0,0x96
	sound_cue	3,0x96
	sound_cue	6,0xA3
	db	0xFF	; end
FxSoundsCD:	; effect 0xCD
	sound_cue	0,0xAA
	sound_cue	3,0xAA
	db	0xFF	; end
FxSoundsCE:	; effect 0xCE
	sound_cue	0,0xAB
	sound_cue	25,0xAB
	sound_cue	50,0xAB
	db	0xFF	; end
FxSoundsCF:	; effect 0xCF, 0xD0, 0xD1, 0xD2, 0xD3
	db	0xFF	; end
