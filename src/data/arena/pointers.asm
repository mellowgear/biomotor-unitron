; data/arena/pointers: pointer tables read by the code, one section each

d_249B8C	section	romdata abs=0x249B8C
; [code] stage 0-11 -> its list in StageRequiredTalkLists (sub_213326)
StageRequiredTalks:
	dl	StageRequiredTalkLists,StageRequiredTalkLists+0x1,StageRequiredTalkLists+0x2,StageRequiredTalkLists+0x5
	dl	StageRequiredTalkLists+0x7,StageRequiredTalkLists+0x8,StageRequiredTalkLists+0x9,StageRequiredTalkLists+0xB
	dl	StageRequiredTalkLists+0xC,StageRequiredTalkLists+0xD,StageRequiredTalkLists+0xE,StageRequiredTalkLists+0x19

d_249BC9	section	romdata abs=0x249BC9
; [code] ArenaEntryMenuInput / ArenaEntryMenuChoose: string per cursor (Entry, Quit)
ArenaEntryMenuTexts:
	dl	EntryText,QuitText2

d_249C0F	section	romdata abs=0x249C0F
; [code] ArenaRankListChoose / ShowArenaRankList / ShowArenaBracket: rank name per menu choice
ArenaRankNames:
	dl	RankEText,RankDText,RankCText,RankBText
	dl	RankAText,RankSText,CSText,RankXText

d_249C63	section	romdata abs=0x249C63
; [code] DrawArenaEntryCost: entry cost string per menu choice
ArenaEntryCostTexts:
	dl	EntryCost200Text,EntryCost500Text,EntryCost1000Text,EntryCost2000Text
	dl	EntryCost3000Text,EntryCost5000Text,EntryCost10000Text,EntryCost0Text

d_249CB8	section	romdata abs=0x249CB8
; [code] GetArenaBracketLine: string per entry (index clamped to 5)
Pointers_249CB8:
	dl	Round1Text,Round2Text,Round3Text,Round4Text
	dl	Round5Text,FinalText

d_249D2E	section	romdata abs=0x249D2E
; [code] RollArenaBracket: ArenaBrackets row per rank - 2
ArenaBracketRows:
	dl	ArenaBrackets,ArenaBrackets+0x6,ArenaBrackets+0xC,ArenaBrackets+0x12
	dl	ArenaBrackets+0x18,ArenaBrackets+0x1E,ArenaBrackets+0x24,ArenaBrackets+0x2A

d_24DF5D	section	romdata abs=0x24DF5D
; [code] GetArenaTalkRow: message per arena scene
ArenaTalkTexts:
	dl	D4DRText+0x1C,WhatDoYouWantText,YoureGettingPrettyGoodText,ThatsItThatsOurText
	dl	CloseButNoCigarText,IfItIsntPlayerText,LooksLikeYouMadeText,WellPickYourRankText
	dl	AllRightThenComeText,GotItHeresTheText,WhoopsSorryButYouText,AllRightGoInText
	dl	YouWantToQuitText,WelcomeToTheArenaText,WereStillNotReadyText,HeyTherePlayerYoureText
	dl	GoodWorkPlayerHeresText,CongratulationsPlayerThatWasText,CongratulationsPlayerThatWasText,HeyPlayerNotBadText
	dl	PlayerNiceJobLooksText,PlayerNiceJobLooksText,PlayerWayToGoText,YouDidItPlayerText
	dl	YouDidItPlayerText,WayToGoPlayerText,IKnowWhatYoureText,YouDidItPlayerText2
	dl	PlayerFirstLetMeText,WellPlayerYouWonText,OhHelloPlayerCongratulationsText,CongratulationsOnWinningRankText
	dl	YouDidItPlayerText3,PlayerYoullNeverBelieveText,WhoCouldHaveImaginedText,WhoCouldHaveImaginedText
	dl	HeyPlayerWereGettingText,HeyPlayerWereGettingText,PlayerText2,LilyPlayerIsntThatText
	dl	PlayerWhatsGoingOnText,PlayerWhyWhyAmText,UhOhPlayerSatanachiasText,WhatPlayerWatchOutText
	dl	ImSorryIWhaText,PlayerText4,PlayerText4,WowPlayerThatWasText
	dl	JonSatanachiaspilotIsSheText,JonWhatAboutSatanachiaspilotText,OhHerShesAText,ThatsAReliefImText
	dl	ThatsGoodNewsIText,StillIWasSurprisedText,ThanksJonComeOnText,ThanksJonComeOnText
	dl	HeyChampOutForText,PlayerTheresAProblemText,YouCanGetToText,LongTimeNoSeeText
	dl	ThatsTheChampYouText,HowWasRankXText,HowWasRankXText,HeyPlayerYoureLookingText
	dl	HuhNoWereStillText,LooksLikeYoureAText,ItIsFinishedYourText,PlayerPlayerWhatsTheText
	dl	PlayerPlayerWhatsTheText2,ANewWorldAwaitsText
