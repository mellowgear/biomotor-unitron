; Event flags: CheckEventFlag / SetEventFlag / ClearEventFlag (HL = flag; the ...A variants take A) test
; bit flag & 15 of wEventFlags[flag >> 4] (0x5060, 16 x u16); NewGameSetup clears them all. Each comment
; names who sets (S), clears (C) and tests (T) the flag. "talk row" = the flag byte of a talk_row in
; data/town/talk_*.asm, set by NpcTalkRowAction when the row is shown. All evidence is [code] unless
; marked; U2 keeps different flags, so nothing here is [U2].
; Never set (only cleared): 0x44, 0x53, 0x54, 0x5E (the slots of Galb/Lana, which share 0x43, and of the Works).
; Never tested on their own: 0x02, 0x04, 0x06 (read only through GetStoryStage). Every other flag is tested.

; Story stage (exactly one of 0x00-0x0B is set; GetStoryStage = the highest of 1-11 set, 0 if none;
; ClearStoryStage clears them all; SetStoryStage sets StageFlags[stage] and wArenaRank).
EVENT_STAGE_TOWN	equ	0x00	; stage 0, before the arena. S: StorySceneUnitice (new game). C: NpcTalkRowAction (flag 1 row). T: StreetMenuSelect
EVENT_STAGE_ARENA_OPEN	equ	0x01	; stage 1: S: Works talk row 2 (the Unitron fitted; NpcTalkRowAction clears 0x00, ClearTalkedFlags, gives 3 FixIt1, 3 Tool1, 3 Steel, 500 GP)
EVENT_STAGE_WON_RANK_E	equ	0x02	; stages 2-8: S: SetStoryStage via AdvanceStoryStage (ArenaSceneEnd, end action 2: rank won)
EVENT_STAGE_WON_RANK_D	equ	0x03	; T: ShopTalk (stage greeting)
EVENT_STAGE_WON_RANK_C	equ	0x04
EVENT_STAGE_WON_RANK_B	equ	0x05	; T: ShopTalk
EVENT_STAGE_WON_RANK_A	equ	0x06
EVENT_STAGE_WON_RANK_S	equ	0x07	; T: ShopTalk
EVENT_STAGE_WON_RANK_CS	equ	0x08	; T: StreetMenuSelect; C: NpcTalkRowAction (flag 9 row)
EVENT_STAGE_LILY	equ	0x09	; S: Works talk row 13 (after Lily and the Protector; NpcTalkRowAction clears 0x08 and ClearTalkedFlags). C: CreditsScreen. T: CheckStageLily (arena scenes), ShopTalk, WorksScreenModes
EVENT_STAGE_ENDING	equ	0x0A	; S: CreditsScreen. T: CheckStageEnding, GetEnemyScaling, EnemyChooseAttack, TryFlee, GetFloorBossBeaten (mine boss 8), TownNpcTalk (late rows), ShopTalk
EVENT_STAGE_WON_RANK_X	equ	0x0B	; S: SetStoryStage (StageFlags line 10, from rank 8). T: GetStoryStage (top), GetEnemyScaling, EnemyChooseAttack, TryFlee, TownNpcTalk (late rows)

; Emblems: EMBLEM_GREEN + DUNGEON_ID - 1, S: BossEncounter after the dungeon boss (not the Crystal Mine).
; C: ClearEmblemFlags (CyriusTrade). T: CountEmblemFlags (Cyrius talk), SetEmblemBits (Works info)
EVENT_EMBLEM_GREEN	equ	0x10
EVENT_EMBLEM_BLUE	equ	0x11
EVENT_EMBLEM_WHITE	equ	0x12
EVENT_EMBLEM_BLACK	equ	0x13
EVENT_CYRIUS_TOLD_LORDS	equ	0x14	; S: D-town talk row 18 (Cyrius "Well, well... That's an interesting..."). T: TownNpcTalk (Cyrius, once an Emblem is held: row 0x12 while clear)
EVENT_COLLA_OFFERS_ENABLED	equ	0x15	; S: Forest talk row 27 (Colla). T: TownNpcTalk (Colla from rank 3: row 0x1B while clear, then the random offer row 0x1C)
EVENT_CYRIUS_TRADED	equ	0x20	; S: D-town talk row 26 (Cyrius "All right, then! Thanks again"). T: TownNpcTalk (Cyrius with 4 Emblems), CreditsScreen

; Helmut's skills: S: HelmutSkillChoice (SKILL1_A / SKILL2_A + the option index +0x2A, 0 or 1 (?)). T: CheckSkillPair1 / 2
EVENT_SKILL1_A	equ	0x30
EVENT_SKILL1_B	equ	0x31
EVENT_SKILL2_A	equ	0x32
EVENT_SKILL2_B	equ	0x33

; Talked this stage: flag TALKED_BASE + n for NPC n = talk speaker - 0x15. S: that NPC's stage talk rows;
; SetTalkedFlags (all but 0x43, 0x44, 0x4E; after paying the arena fee). C: ClearTalkedFlags (stage change).
; T: TownNpcTalk (set -> the TalkNpcRows row), GetArenaTalkRow (StageRequiredTalkLists), WorksEntryTalkRowStage0 / 8
EVENT_TALKED_BASE	equ	0x40
EVENT_TALKED_JON	equ	0x40	; S: also SetTalkedJon (arena end action 1). T: also CheckTalkedJon
EVENT_TALKED_LILY	equ	0x41
EVENT_TALKED_CYRIUS	equ	0x42
EVENT_TALKED_SHOP	equ	0x43	; Galb's slot, set by Galb's and Lana's rows and by ShopTalk (SetEventFlagA). T: ShopTalk, ShopEntryTalkRow
EVENT_TALKED_LANA	equ	0x44	; Lana's slot: only cleared (ClearTalkedFlags); never set, Lana's rows set 0x43
EVENT_TALKED_WYSE	equ	0x45
EVENT_TALKED_ZIGGY	equ	0x46
EVENT_TALKED_CEUS	equ	0x47
EVENT_TALKED_HELMUT	equ	0x48
EVENT_TALKED_ALDA	equ	0x49
EVENT_TALKED_CAMIL	equ	0x4A	; also NpcTalkRowAction: the row grants StageStatBonus
EVENT_TALKED_MEESE	equ	0x4B
EVENT_TALKED_COLLA	equ	0x4C
EVENT_TALKED_TETIS	equ	0x4D	; also NpcTalkRowAction: the Tetis gift at stages 2-8
EVENT_TALKED_WORKS	equ	0x4E	; the player's Works arrival talk this stage: S: Works talk rows 0, 3, 14. T: TownPlaceTaskWorks (place 7 / 8 intro while clear), WorksEntryTalkRow (was EVENT_TALKED_RENAB, no such NPC)

; Greeted: flag GREETED_BASE + n set by the NPC's repeat talk rows; picks the "greeted" column of TalkNpcRows.
; C: ClearGreetedFlags (each time the Square menu is drawn). T: TownNpcTalk
EVENT_GREETED_BASE	equ	0x50
EVENT_JON_NOT_READY_SEEN	equ	0x50	; Jon's greeted slot, used apart: S: SetJonNotReadySeen (arena end action 3). C: ArenaSceneEnd (rank won). T: CheckJonNotReadySeen; also TownNpcTalk for Jon, whose rows are all 255
EVENT_GREETED_LILY	equ	0x51
EVENT_GREETED_CYRIUS	equ	0x52
EVENT_GREETED_GALB	equ	0x53	; only cleared (ClearGreetedFlags); never set
EVENT_GREETED_LANA	equ	0x54	; only cleared; never set
EVENT_GREETED_WYSE	equ	0x55
EVENT_GREETED_ZIGGY	equ	0x56
EVENT_GREETED_CEUS	equ	0x57
EVENT_GREETED_HELMUT	equ	0x58
EVENT_GREETED_ALDA	equ	0x59
EVENT_GREETED_CAMIL	equ	0x5A
EVENT_GREETED_MEESE	equ	0x5B
EVENT_GREETED_COLLA	equ	0x5C
EVENT_GREETED_TETIS	equ	0x5D
EVENT_GREETED_WORKS	equ	0x5E	; slot 14: only cleared; never set

; Bosses beaten: BEAT_ENT + GetBossIndex. 0-3 (dungeon bosses): S: BossEncounter after the boss talk (with the
; Emblem); C: ClearBeatenDungeonFlags (CyriusTrade), CreditsScreen. 4-7 (Crystal Mine floors 1-4): S: BossEncounter
; on the fade-in after the won battle; never cleared. T: GetFloorBossBeaten (LoadBossMapSprite), DrawBeatenDungeonMarkers (0-3)
EVENT_BEAT_ENT	equ	0x60
EVENT_BEAT_KRAKEN	equ	0x61
EVENT_BEAT_ROC	equ	0x62
EVENT_BEAT_BEHEMOTH	equ	0x63
EVENT_BEAT_TRIFID	equ	0x64
EVENT_BEAT_CATBLE	equ	0x65
EVENT_BEAT_SQUIDL	equ	0x66
EVENT_BEAT_SIMRUG	equ	0x67
EVENT_MINE_CHESTS	equ	0x70	; first of the Crystal Mine chest flags, + 7 * (floor - 1) + chest: S: MarkChestOpened. T: SetMineChests
EVENT_BODY2	equ	0xA0	; S/T: WorksScreenModes (UpgradeBody at engineer level 10)
EVENT_BODY3	equ	0xA1	; S/T: WorksScreenModes (UpgradeBody at engineer level 30)
