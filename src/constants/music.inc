; constants/music.inc: song and sound ids.
; A song (SONG_*) is a SongTable entry: PlayMusic / PlaySong (XWA) load its tracks into the Z80
; (src/audio/songs.asm). SoundCommand (WA) then starts a music track (MUSIC_*, 0x20 + song for
; songs 0-17) or a sound effect (SFX_*, 0x80 up) the loaded song lists. Names come from the call
; sites ([code]); unsure ones are (?) or numbered.

; songs (SongTable index)
SONG_EVENT	equ	0	; Reset; arena gate and results (ArenaPreDuelGateOpen, ArenaRoundsComplete, ArenaBattleLost, ArenaDuel6Scene), WorksProtectorShakeToWhite [code] (?)
SONG_TOWN	equ	1	; the street and the square (StreetMenuTask, OpenSquareMenu) [code]
SONG_WORKS	equ	2	; the Works (PlayMusic2, StartPlaceEntryTalkWorks, TownTalkWindowOpen) [code]
SONG_SHOP	equ	3	; the shop (PlayMusic3 from ShopTalk), StartPlaceEntryTalk [code]
SONG_STORY	equ	4	; story scenes (StorySceneUniticeSetup, StartRhafiacePictureTalk, the arena scenes) [code] (?)
SONG_FOREST_OF_VERDURE	equ	5	; dungeon 1 (PlayDungeonMusic: 5 + DUNGEON_ID - 1) [code]
SONG_CORRIDOR_OF_BLUE	equ	6	; dungeon 2 [code]
SONG_RUINS_OF_WIND	equ	7	; dungeon 3 [code]
SONG_MAZE_OF_STONE	equ	8	; dungeon 4 [code]
SONG_CRYSTAL_MINE	equ	9	; dungeon 5, the Crystal Mine [code]
SONG_BATTLE	equ	10	; BattleStart: wEnemyId below ENEMY_ENT [code][play: random battle]
SONG_PILOT_BATTLE	equ	11	; BattleStart: the pilots ENEMY_ALEX..ENEMY_BALROK (?); ArenaDuelTitleSlideIn [code]
SONG_BOSS_BATTLE	equ	12	; BattleStart: ENEMY_ENT..ENEMY_CATBLE and ENEMY_SATANA up [code][play: Ent, Kraken]
SONG_UNITI_BATTLE	equ	13	; BattleStart: ENEMY_UNITI only [code]
SONG_ENCOUNTER	equ	14	; PlayEncounterMusic, BossBattleIntro [code]
SONG_VICTORY	equ	15	; BattleVictory [code]
SONG_DEFEAT	equ	16	; BattleDefeat; StorySceneTheEnd [code]
SONG_INTRO	equ	17	; IntroSequence, TitleRevealSequence (two music tracks) [code]
SONG_DESTRUCTION	equ	18	; StorySceneDestructionSetup (no SFX) [code]
SONG_CREDITS	equ	19	; CreditsScreen (no SFX) [code]
SONG_MAIN_MENU	equ	20	; MainMenuSetup, SelectPlayerTask, WorldMapOpen [code]
SONG_NONE	equ	21	; the 0 entry: PlaySong returns with carry; no caller [code]

; music tracks (SoundCommand): 0x20 + song, except song 17's second track (0x32) and songs 18-20 (0x21 + song)
MUSIC_EVENT	equ	SONG_EVENT + 0x20
MUSIC_TOWN	equ	SONG_TOWN + 0x20
MUSIC_WORKS	equ	SONG_WORKS + 0x20
MUSIC_SHOP	equ	SONG_SHOP + 0x20
MUSIC_STORY	equ	SONG_STORY + 0x20
MUSIC_FOREST_OF_VERDURE	equ	SONG_FOREST_OF_VERDURE + 0x20	; PlayDungeonMusic: + DUNGEON_ID - 1
MUSIC_BATTLE	equ	SONG_BATTLE + 0x20
MUSIC_PILOT_BATTLE	equ	SONG_PILOT_BATTLE + 0x20
MUSIC_BOSS_BATTLE	equ	SONG_BOSS_BATTLE + 0x20
MUSIC_UNITI_BATTLE	equ	SONG_UNITI_BATTLE + 0x20
MUSIC_ENCOUNTER	equ	SONG_ENCOUNTER + 0x20
MUSIC_VICTORY	equ	SONG_VICTORY + 0x20
MUSIC_DEFEAT	equ	SONG_DEFEAT + 0x20
MUSIC_INTRO	equ	0x31	; IntroSequence [code]
MUSIC_TITLE	equ	0x32	; TitleRevealSequence, song 17's second track [code]
MUSIC_DESTRUCTION	equ	0x33
MUSIC_CREDITS	equ	0x34
MUSIC_MAIN_MENU	equ	0x35
MUSIC_STOP	equ	0x7F	; stops the music (BattleEnd) [code]

; other SoundCommand words
SOUND_CMD_86	equ	0x8086	; driver command 0x86 sent as is (0x8000 up): stops all SFX, BattleEnd [code] (?)
SFX_ALT	equ	0x200	; or'ed onto an SFX id (develop roll, two battle cues): another driver command form [U2] (?)

; sound effects in songs 0-17 and 20
SFX_CURSOR	equ	0x80	; cursor moved [code]
SFX_CONFIRM	equ	0x81	; choice taken (A) [code]
SFX_CANCEL	equ	0x82	; backed out (B) [code]
SFX_BUZZER	equ	0x83	; refused: not enough EP, a bad name [code]
; songs 0, 2, 20
SFX_SHAKE	equ	0x84	; WorksProtectorShakeStart, ArenaPreDuelGateOpen [code] (?)
; songs 1, 5-9, 20
SFX_FLOOR_CHANGE	equ	0x85	; StartDungeonFloor, StartFloorChange [code]
SFX_86	equ	0x86	; no reference found
; song 2 (the Works)
SFX_EQUIP	equ	0x87	; a part equipped (WorksSetupMenu) [code]
SFX_DEVELOP_START	equ	0x88	; "Here we go" (WorksDevelopMenu); | SFX_ALT during the roll [code]
SFX_DEVELOP_DONE	equ	0x89	; after the roll, before DevelopSuccess [code] (?)
SFX_DEVELOP_FAIL	equ	0x8A	; "Sorry, it didn't work" [code]
SFX_8B	equ	0x8B	; no reference found
SFX_8C	equ	0x8C	; no reference found
SFX_8D	equ	0x8D	; no reference found
; song 3 (the shop)
SFX_PURCHASE	equ	0x8E	; "Thanks" after a buy or sale (ShopScreen) [code]
SFX_SHORT_OF_MONEY	equ	0x8F	; "Looks like you're short" [code]
; songs 4, 20
SFX_90	equ	0x90	; no reference found
SFX_91	equ	0x91	; no reference found
; the dungeon songs 5-9
SFX_BUMP	equ	0x92	; a step into a wall (CheckEncounter) [code]
SFX_CHEST_OPEN	equ	0x93	; OpenChest [code]
SFX_CAMP_OPEN	equ	0x94	; B in a dungeon opens the camp (CheckEncounter) [code]
SFX_RECOVER	equ	0x97	; CampUseHealItem: full heal and status cure [code]
SFX_HEAL	equ	0x98	; CampUseHealItem: a Fix It [code]
; the battle songs 10-13: 0x95-0xAB, battle effect cues (BattleEffectSounds), numbered
SFX_BATTLE_95	equ	0x95
SFX_BATTLE_96	equ	0x96
SFX_BATTLE_97	equ	0x97
SFX_BATTLE_98	equ	0x98
SFX_BATTLE_99	equ	0x99
SFX_BATTLE_9A	equ	0x9A
SFX_BATTLE_9B	equ	0x9B
SFX_BATTLE_9C	equ	0x9C
SFX_BATTLE_9D	equ	0x9D
SFX_BATTLE_9E	equ	0x9E
SFX_BATTLE_9F	equ	0x9F
SFX_BATTLE_A0	equ	0xA0	; also ArenaDuelTitleSlideIn (song 11) [code]
SFX_BATTLE_A1	equ	0xA1
SFX_BATTLE_A2	equ	0xA2
SFX_BATTLE_A3	equ	0xA3
SFX_BATTLE_A4	equ	0xA4
SFX_BATTLE_A5	equ	0xA5
SFX_BATTLE_A6	equ	0xA6
SFX_BATTLE_A7	equ	0xA7
SFX_BATTLE_A8	equ	0xA8
SFX_BATTLE_A9	equ	0xA9
SFX_BATTLE_AA	equ	0xAA
SFX_BATTLE_AB	equ	0xAB
; songs 15, 16
SFX_LEVEL_UP	equ	0xAC	; "You gained a level" (BattleVictory) [code]
SFX_AD	equ	0xAD	; no reference found
SFX_BOSS_SHAKE	equ	0xAE	; the screen shakes as a boss appears (BossEncounter) [code] (?)
; song 17
SFX_INTRO_IMPACT	equ	0xAF	; IntroSequence, with IntroImpactTask [code]
