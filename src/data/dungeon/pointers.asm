; data/dungeon/pointers: pointer tables read by the code, one section each

d_2274D7	section	romdata abs=0x2274D7
; [code] dungeon.asm (sub_2105xx area, 2 readers): name per DUNGEON_ID 0-4 (DrawBoxString). Name 0
; starts at DungeonSelectCursor+0x14: the cursor table's last record (0, 0) is 4 zero bytes =
; spaces, so the game draws 4 + 3 spaces and "Town" (TownText, src/text/town.txt).
DungeonNames:
	dl	DungeonSelectCursor+0x14,ForestOfVerdureText,CorridorOfBlueText,RuinsOfWindText
	dl	MazeOfStoneText

d_227580	section	romdata abs=0x227580
; [code] WorldMapDungeonTextBox2 / dungeon.asm: description per DUNGEON_ID - 1 (box 2)
DungeonDescriptions:
	dl	DungeonMadeOfTreesText,CaveOnSeaFloorText,FloatingRuinsWindAffinityText,BuriedDeepInTheText

d_2493F8	section	romdata abs=0x2493F8
; [code] sub_211B35: colour palettes per dungeon 1-5
DungeonPalettes:
	dl	Pal_228649,Pal_228649,Pal_2286C5,Pal_2286C5
	dl	Pal_2286C5

d_24940C	section	romdata abs=0x24940C
; [code] mono palette per dungeon 1-5
DungeonMonoPalettes:
	dl	MonoPal_2286C1,MonoPal_2286C1,MonoPal_22873D,MonoPal_22873D
	dl	MonoPal_22873D

d_249424	section	romdata abs=0x249424
; [code] DungeonMaps: per map id (map pointer, chest position list)
DungeonMaps:
	dl	DungeonMap_00,DungeonChests_00,DungeonMap_01,DungeonChests_01
	dl	DungeonMap_02,DungeonChests_02,DungeonMap_03,DungeonChests_03
	dl	DungeonMap_04,DungeonChests_04,DungeonMap_05,DungeonChests_05
	dl	DungeonMap_06,DungeonChests_06,DungeonMap_07,DungeonChests_07
	dl	DungeonMap_08,DungeonChests_08,DungeonMap_09,DungeonChests_09
	dl	DungeonMap_10,DungeonChests_10,DungeonMap_11,DungeonChests_11
	dl	DungeonMap_12,DungeonChests_12,DungeonMap_13,DungeonChests_13
	dl	DungeonMap_14,DungeonChests_14,DungeonMap_15,DungeonChests_15
	dl	DungeonMap_16,DungeonChests_16,DungeonMap_17,DungeonChests_17
	dl	DungeonMap_18,DungeonChests_18,DungeonMap_19,DungeonChests_19
	dl	DungeonMap_20,DungeonChests_20,DungeonMap_21,DungeonChests_21
	dl	DungeonMap_22,DungeonChests_22,DungeonMap_23,DungeonChests_23
	dl	DungeonMap_24,DungeonChests_24,DungeonMap_25,DungeonChests_25
	dl	DungeonMap_26,DungeonChests_26,DungeonMap_27,DungeonChests_27
	dl	DungeonMap_28,DungeonChests_28,DungeonMap_29,DungeonChests_29
	dl	DungeonMap_30,DungeonChests_30,DungeonMap_31,DungeonChests_31
	dl	DungeonMap_32,DungeonChests_32,DungeonMap_33,DungeonChests_33
	dl	DungeonMap_34,DungeonChests_34,DungeonMap_35,DungeonChests_35
	dl	DungeonMap_36,DungeonChests_36,DungeonMap_37,DungeonChests_37
	dl	DungeonMap_38,DungeonChests_38,DungeonMap_39,DungeonChests_39
	dl	DungeonMap_40,DungeonChests_40,DungeonMap_41,DungeonChests_41
	dl	DungeonMap_42,DungeonChests_42,DungeonMap_43,DungeonChests_43
	dl	DungeonMap_44,DungeonChests_44,DungeonMap_45,DungeonChests_45
	dl	DungeonMap_46,DungeonChests_46,DungeonMap_47,DungeonChests_47
	dl	DungeonMap_48,DungeonChests_48,DungeonMap_49,DungeonChests_49
	dl	DungeonMap_50,DungeonChests_50,DungeonMap_51,DungeonChests_51
	dl	DungeonMap_52,DungeonChests_52,DungeonMap_53,DungeonChests_53
	dl	DungeonMap_54,DungeonChests_54,DungeonMap_55,DungeonChests_55
	dl	DungeonMap_56,DungeonChests_56

d_249903	section	romdata abs=0x249903
; [code] DrawAreaName: floor name per DUNGEON_FLOOR
AreaNames:
	dl	Area0Text,Area1Text,Area2Text,Area3Text
	dl	Area4Text,Area5Text,Area6Text,Area7Text

d_24B37A	section	romdata abs=0x24B37A
; [code] the BossEncounter talk runner (0x212CD5): message per boss index (GetBossIndex) * 4 +
; (task +0x2A - 3); 0 = none. Bosses 4-6 have one message, boss 7 the last entry.
BossTalkTexts:
	dl	IAmEntIText,TheAnswerHasBeenText,YourTaskIsToText,YouHaveDefeatedMeText
	dl	IAmKrakenIText,TheAnswerHasBeenText,YourTaskIsToText,YouHaveDefeatedMeText2
	dl	IAmRocIText,TheAnswerHasBeenText,YourTaskIsToText,YouHaveDefeatedMeText3
	dl	IAmBehemothIText,TheAnswerHasBeenText,YourTaskIsToText,YouHaveDefeatedMeText4
	dl	WhoAreYouThisText,0,0,0
	dl	ISmellALivingText,0,0,0
	dl	WhoALivingBeingText,0,0,0
	dl	YouYouHaveKilledText
