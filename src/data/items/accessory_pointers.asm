; data/items/accessory_pointers: pointer tables read by the code, one section each

d_207A43	section	romdata abs=0x207A43
; [code] ApplyBattleAccessory: per accessor id (wEquipAcc1/2, 0 = none) a routine pointer
Pointers_207A43:
	dl	AccBattleNone,AccBattleNone,AccBattleNone,AccBattleNone
	dl	AccBattleNone,AccBattleNone,AccBattleNone,AccBattleNone
	dl	AccBattleNone,AccBattleRadar5,AccBattleRadar8,AccBattleRadr10
	dl	AccBattleCycl10,AccBattleCycl20,AccBattleCycl30,AccBattlePanl15
	dl	AccBattlePanl30,AccBattlePanl50,AccBattleNone,AccBattleNone
	dl	AccBattleNone,AccBattleNone,AccBattleNone,AccBattleNone
	dl	AccBattleNone,AccBattleNone,AccBattleNone,AccBattleNone
	dl	AccBattleNone,AccBattleNone,AccBattleNone,AccBattleNone
	dl	AccBattleNone,AccBattleNone,AccBattleNone,AccBattleNone
	dl	AccBattleNone,AccBattleNone

d_20888E	section	romdata abs=0x20888E
; [code] CalcUnitStats -> ApplyAccessoryStats: jp through entry wEquipAcc1/2 (accessory id; 0 returns first)
Pointers_20888E:
	dl	AccStatsNone,AccStatsFlrCt,AccStatsRefCt,AccStatsIceCt
	dl	AccStatsWindCt,AccStatsErthCt,AccStatsLghtCt,AccStatsDarkCt
	dl	AccStatsMirrCt,AccStatsNone,AccStatsNone,AccStatsNone
	dl	AccStatsNone,AccStatsNone,AccStatsNone,AccStatsNone
	dl	AccStatsNone,AccStatsNone,AccStatsArmr25,AccStatsArmr50
	dl	AccStatsArmr80,AccStatsTank15,AccStatsTank30,AccStatsTank60
	dl	AccStatsBst10,AccStatsBst20,AccStatsBst30,AccStatsPlt10
	dl	AccStatsPlt20,AccStatsPlt30,AccStatsAxel10,AccStatsAxel20
	dl	AccStatsAxel30,AccStatsBurn10,AccStatsBurn20,AccStatsBurn30
	dl	AccStatsNone,AccStatsNone
