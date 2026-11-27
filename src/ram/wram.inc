; Work RAM names. Edit here: this is the source. Evidence in the comment.

; text and number buffers
wTextBuffer	equ	0x4000
wNumberBuffer	equ	0x4100

; random seeds, frame counter, boot time
wRandomSeeds	equ	0x5000
wFrameCounter	equ	0x5006
; [code] the main loop (Reset) sets 0xFF and spins until VBlankHandler clears it: one pass per frame
wVBlankWait	equ	0x500A
; [code] 7 bytes BIOS call 2 (RTC get, BCD year, month, day, hour, minute, second, ...) fills in Reset; Reset then seeds SetRandomSeeds from words +0 / +2 / +4 (+4 plus 1); nothing else reads it (wPlayerName follows)
wBootRtcTime	equ	0x500C

; save data: pilot, partner, GP, equipment, unit stats, event flags, items, parts, options (0x5013-0x5281, LoadGameSlot / SaveGameSlot)
wPlayerName	equ	0x5013
wPlayerRace	equ	0x5021
wPlayerLevel	equ	0x5022
wExpToNext	equ	0x5023
wSkill1	equ	0x5025
wSkill2	equ	0x5026
wPilotAP	equ	0x5027
wPilotSP	equ	0x5029
wPilotRP	equ	0x502B
wPilotMP	equ	0x502D
wPartnerName	equ	0x502F
wPartnerRace	equ	0x503D
wEngineerLevel	equ	0x503E
wEngineerExp	equ	0x503F
wGP	equ	0x5041
wArenaRank	equ	0x5045
wEquipCore	equ	0x5046
wEquipBody	equ	0x5047
wEquipRightArm	equ	0x5048
wEquipLeftArm	equ	0x5049
wEquipLegs	equ	0x504A
wEquipBack	equ	0x504B
wEquipAcc1	equ	0x504C
wEquipAcc2	equ	0x504D
wUnitAP	equ	0x504E
wUnitSP	equ	0x5050
wUnitRP	equ	0x5052
wUnitMP	equ	0x5054
wUnitHP	equ	0x5056
wUnitEP	equ	0x5058
wUnitAffinity	equ	0x505A
wUnitMaxHP	equ	0x505C
wUnitMaxEP	equ	0x505E
wEventFlags	equ	0x5060
wNpcTalked	equ	0x5068
wBodyUpgrades	equ	0x5074
; [code] save-data word (inside the 0x26D bytes LoadGameSlot copies): LoadGameSlot zeroes it after the copy; no reader found (?)
wUnk5076	equ	0x5076
wItemCounts	equ	0x507F
wTetisAutographs	equ	0x517E
wPartCounts	equ	0x517F
wOptionMessageSpeed	equ	0x5280
wOptionAnimation	equ	0x5281

; game mode, dungeon position and floor state
; [code] MAX_TASKS (0x20) task slots of TASK_SLOT_SIZE (0x2E) bytes, ending at wTaskList (InitTaskList, FindFreeTaskSlot)
wTasks	equ	0x5282
wGameMode	equ	0x52BF
wDungeonId	equ	0x52C0
wFloor	equ	0x52C1
wDungeonEntryState	equ	0x52C2
wDungeonX	equ	0x52C3
wDungeonY	equ	0x52C4
wDungeonFacing	equ	0x52C5
wFloorCount	equ	0x52C6
wFloorMaps	equ	0x52C7
wDungeonMenuScratch	equ	0x52D0
wCollaOffer	equ	0x52D8
wDungeonSubstate	equ	0x52DA
wStepsSinceBattle	equ	0x52DB
wModeTimer	equ	0x52DC

; help viewer
wHelpPage	equ	0x542E

; task list
wTaskList	equ	0x5842
wTaskCount	equ	0x584A

; map scroll and dungeon tiles
; [code] map scroll in pixels (16 per cell): UpdateMapScroll adds wMapScrollStepX / Y each frame and writes the low bytes to wScr1ScrollX / Y; SetMapScrollToPlayer sets them from DUNGEON_X / Y; CheckEncounter sets the steps to +-1 for 16 frames per move
wMapScrollX	equ	0x5BC7
wMapScrollY	equ	0x5BC9
wMapScrollStepX	equ	0x5BCB
wMapScrollStepY	equ	0x5BCD
; [code] LoadDungeonFloor sets 0x37 (the CHAR RAM tile its LoadCompressedTiles starts at); GetMetatileTiles adds it - 1; box openers add it to the sheet's tile count
wDungeonTileBase	equ	0x5BCF
wMapPtr	equ	0x5BD1
; [code] LoadDungeonFloor: DungeonData +0; GetMetatileTiles reads 8 bytes (4 tile words) per metatile from it
wMetatileTilesPtr	equ	0x5BD5

; joypad
wJoyHistoryIndex	equ	0x5BDD
wJoyHistory	equ	0x5BDE
wJoyHeld	equ	0x5CDE
wJoyPressed	equ	0x5CDF
wJoyReleased	equ	0x5CE0
wJoyResetCombo	equ	0x5CE1

; scene flag, text boxes
; [code] set 0 by IntroBackground and the story scene setups, 1 when they end (scenes.asm); no reader found (?)
wUnk5CE2	equ	0x5CE2
wTextBoxes	equ	0x5CE3

; battle: drawn parts, player buffs, statuses and turn counters
wDrawBody	equ	0x5D7B
wDrawRightArm	equ	0x5D7C
wDrawLeftArm	equ	0x5D7D
wDrawLegs	equ	0x5D7E
wDrawBack	equ	0x5D7F
wMinEPCost	equ	0x5D80
wCommandEPCosts	equ	0x5D82
; [code] ComputeStatBuffs: 100, +30 per non-zero counter 0x5D97 / 0x5D9B (the AP entry of 0x5D8A-0x5D8D, before wPlayerSPBuff)
wPlayerAPBuff	equ	0x5D8A
wPlayerSPBuff	equ	0x5D8B
wPlayerRPBuff	equ	0x5D8C
; [code] ComputeStatBuffs: 100, +30 per non-zero counter 0x5D9A / 0x5D9E; ApplyPlayerMPBuff
wPlayerMPBuff	equ	0x5D8D
wCritChance	equ	0x5D8E
wFleeChance	equ	0x5D8F
wStatusChance	equ	0x5D90
; [code] 100 at battle start (BattleStart), -10 / -20 / -30 from Cycl10 / Cycl20 / Cycl30 (AccBattleCycl*); ScaleEPCost multiplies every command EP cost by it / 100 (rounded down); [play] Cycl30 70, Cycl10 90
wEPCostPercent	equ	0x5D91
; [code] 30 at battle start (BattleStart), +15 / +30 / +50 from Panl15 / Panl30 / Panl50 (AccBattlePanl*); GetRechargeAmount = this % of wUnitMaxEP (BattleRecharge); the hit-result code also uses 0x5D92 + status id (1-4) as the address of wStatusParalyzed..wStatusConfused (written wStatusParalyzed-1 there); [play] Panl50 80: Charge adds 80 % of max EP; Cycl10+Panl15 45
wRechargePercent	equ	0x5D92
wStatusParalyzed	equ	0x5D93
wStatusRust	equ	0x5D94
wStatusEPLeak	equ	0x5D95
; [play] seen in play: 0x80 after "You've become confused!!" (a Pumper's Makeup), 0x81 after the next PlayerTurnEnd, 0 after Clear ("Your status
; returned to normal!!"); while non-zero every arm attack hits the unit itself (PlayerAttack -> ConfusedPlayerHitResult)
wStatusConfused	equ	0x5D96
; [code] skill effect 5 (ShowStatUp, skill record +4/+6/+8/+0xA): turns of AP/SP/RP/MP up; PlayerTurnEnd counts them down, ComputeStatBuffs +30 to wPlayerAPBuff.. while non-zero, 0 at BattleStart
wSkillAPUpTurns	equ	0x5D97
wSkillSPUpTurns	equ	0x5D98
wSkillRPUpTurns	equ	0x5D99
wSkillMPUpTurns	equ	0x5D9A
; [code] items PowDrv / EField / SitClr / Turbo (ItemPowDrv..ItemTurbo) set 5: turns of AP/SP/RP/MP up; counted down and used as wSkillAPUpTurns..
wItemAPUpTurns	equ	0x5D9B
wItemSPUpTurns	equ	0x5D9C
wItemRPUpTurns	equ	0x5D9D
wItemMPUpTurns	equ	0x5D9E
wAirbagActive	equ	0x5D9F
wFullChargeActive	equ	0x5DA0
wRecvrActive	equ	0x5DA1

; battle: enemy
wEnemyId	equ	0x5DA2
wEnemyImage	equ	0x5DA3
wEnemyMaxHP	equ	0x5DA5
wEnemyHP	equ	0x5DA7
wEnemyMaxEP	equ	0x5DA9
wEnemyEP	equ	0x5DAB
wEnemyMinAttackEP	equ	0x5DAD
wEnemyAP	equ	0x5DAF
wEnemySP	equ	0x5DB1
wEnemyRP	equ	0x5DB3
wEnemyMP	equ	0x5DB5
wEnemyAffinity	equ	0x5DB7
wEnemyLevel	equ	0x5DB9
wEnemyAPBuff	equ	0x5DBA
wEnemySPBuff	equ	0x5DBB
wEnemyRPBuff	equ	0x5DBC
; [code] ComputeStatBuffs: 100, -30 per non-zero counter (enemy MP entry after wEnemyRPBuff); ApplyEnemyMPBuff
wEnemyMPBuff	equ	0x5DBD
wEnemyCritChance	equ	0x5DBE
; [code] AddLevelGapChances adds LevelGapFlee[LevelGapIndex(enemy level - player level)] here (the enemy side of wFleeChance)
wEnemyFleeChance	equ	0x5DBF
wEnemyStatusChance	equ	0x5DC0
wEnemyEPCostBuff	equ	0x5DC1
; [code] 30 at battle start (battle.asm 1379); GetEnemyRechargeAmount = this % of wEnemyMaxEP (EnemyRecharge); 0x5DC2 + status id is also the enemy status byte base (written ld XHL,wEnemyParalyzed-1)
wEnemyRechargePercent	equ	0x5DC2
wEnemyParalyzed	equ	0x5DC3
wEnemyRusted	equ	0x5DC4
wEnemyEPLeak	equ	0x5DC5
; [play] seen in play (set to 0x80 by hand, and set by a Makeup that hit the enemy itself): "<ENEMY> is confused!!", the enemy's attack hits
; itself (ConfusedEnemyHitResult); 0x81 after the next EnemyTurnEnd
wEnemyConfused	equ	0x5DC6
; [code] EnemyStatUpAttack ("SP went up") sets 5; EnemyTurnEnd counts it down; ComputeStatBuffs: wEnemySPBuff +50 while non-zero; 0 at BattleStart
wEnemySPUpTurns	equ	0x5DC7
; [code] item Absorb (ItemAbsorb) sets 5 (the AP entry before wEnemySPDownTurns); EnemyTurnEnd counts it down; ComputeStatBuffs: wEnemyAPBuff -30 while non-zero
wEnemyAPDownTurns	equ	0x5DC8
wEnemySPDownTurns	equ	0x5DC9
wEnemyRPDownTurns	equ	0x5DCA
wEnemyMPDownTurns	equ	0x5DCB
; [code] skill effect 6 (ShowStatDown, skill record +4/+6/+8/+0xA): turns of enemy AP/SP/RP/MP down; EnemyTurnEnd counts them down, ComputeStatBuffs -30 to wEnemyAPBuff.. while non-zero
wSkillEnemyAPDownTurns	equ	0x5DCC
wSkillEnemySPDownTurns	equ	0x5DCD
wSkillEnemyRPDownTurns	equ	0x5DCE
wSkillEnemyMPDownTurns	equ	0x5DCF
wTimeStopTurns	equ	0x5DD0
wEnemyParts	equ	0x5DD1
wEnemyScaled	equ	0x5DD7
; [code] 0 at BattleStart, 0xFF from EnemyHealAttack (HP / EP fully restored); GetEnemySlotChance: a slot with chance 0x65 is taken only while 0 (and HP < half)
wEnemyFullHealUsed	equ	0x5DD8

; battle: result, area level, menu and the round's attack results
wBattleResult	equ	0x5DD9
wDungeonBattle	equ	0x5DDA
wAreaLevel	equ	0x5DDB
wEnemyAttackSlot	equ	0x5DDC
wBattleMenuCursor	equ	0x5DE0
wBattleChoice	equ	0x5DE1
; [code] StartBattleRound sets 0; PlayerTurnEnd / EnemyTurnEnd: when 0 set 1 and the other side's turn follows, when 1 BattleStatusEffects (end of the round); PlayerTurn picks its slide task by it
wRoundSecondTurn	equ	0x5DE3
wAttackEPCost	equ	0x5DE4
wPlayerDamage	equ	0x5DE6
wInflictStatus	equ	0x5DE8
wCritHit	equ	0x5DE9
wPlayerHitMargin	equ	0x5DEA
wEnemyAttackEPCost	equ	0x5DEB
wEnemyDamage	equ	0x5DED
wEnemyAttackStatus	equ	0x5DEF
wEnemyCritHit	equ	0x5DF0
wEnemyHitMargin	equ	0x5DF1

; main menu, config, street and save menus
wMainMenuCursor	equ	0x5DF2
wConfigCursor	equ	0x5DF3
wStreetMenuChoice	equ	0x5DF4
wSaveMenuMode	equ	0x5DF5
wSaveSlot	equ	0x5DF6
wYesNoChoice	equ	0x5DF7

; street / arena next scene, chests, arena pilots
; [code] what the street does after an arena / world map child task (StreetGoArena: 1 StreetGoWorks, 2 StreetAfterDungeonDefeat, 4 StreetEndingScenes, 5 StreetTheEnd, 6 StreetGameOver, else StreetTask; StreetGoWorldMap: only 2, 4, 5); 0xFF at ArenaTaskInit / WorldMapTaskInit, set at the end of ArenaTask (from wArenaNext) and DungeonTask (its DUNGEON_MODE)
; [play] seen in play: 2 after a lost world-dungeon boss battle (the Works, "Whew! I'm glad to see you're all right!"), 4 after beating Uniti (the ending), 5 after Yes to Uniti's offer (The End, GAME OVER), 6 after losing the Rank CS final (GAME OVER), 0 after a normal arena exit
wStreetNext	equ	0x5FF8
; [code] 0 at ArenaTaskInit; 1 from ArenaSceneEnd at stage arena rank 8, 6 from ArenaExitFade, 0xFF at CrystalMineTaskInit and the mine DungeonTask's DUNGEON_MODE at its end (ArenaWaitCrystalMine); ArenaTask copies it to wStreetNext when it ends
wArenaNext	equ	0x5FF9
wChestTable	equ	0x5FFA
; [code] RollArenaBracket: 6 part ids per bracket slot (6 slots) for the random pilots 0x62-0x70; LoadArenaOpponent / ArenaStartBattle pass wArenaPilotParts + 6 * slot to LoadEnemy
wArenaPilotParts	equ	0x60CC

; town place result, BCD scratch
; [code] the town place task's result: TownPlaceTaskEnd copies task +0x11 here; StreetGoWorks opens RunWorksScreen on 1 (TownPlaceEnter with no entry talk), StreetGoShop RunShopScreen on 3, 4 or 5 (3 = no entry talk; 4 / 5 from the talk nexts 0xF9 / 0xF8, TalkNextLeavePlace)
wTownPlaceResult	equ	0x60F0
; [code] AddBCD32 scratch: XWA stored here, XBC added into it byte by byte (adc + daa), the sum read back into XWA
wBcdSumA	equ	0x60FE
; [code] AddBCD32 scratch: the second 4-byte packed-BCD operand (XBC), read back unchanged
wBcdSumB	equ	0x6102

; cursor task, message task, yes/no prompt
; [code] DrawDevelopedArm reads it as the column (B) of the arm image block; nothing writes it (?)
wUnk6106	equ	0x6106
; [code] DrawDevelopedArm reads it as the row (D) of the arm image block; nothing writes it (?)
wUnk6107	equ	0x6107
; [code] StartCursorTask stores the CursorTask handle (StartChildTask XHL) here
wCursorTask	equ	0x6108
wCursorVisible	equ	0x610C
; [code] SetCursorBox; CursorTask draws the cursor sprite in this text box
wCursorBox	equ	0x610D
; [code] SetCursorPos B; cell column of the blinking cursor (CursorTask)
wCursorCol	equ	0x610E
; [code] SetCursorPos C; cell row of the blinking cursor (CursorTask)
wCursorRow	equ	0x610F
; [code] CursorTask counter, +1 per frame; cursor drawn while bit 4 is clear
wCursorBlink	equ	0x6110
; [code] StartMessageTask stores the MessageTask handle here
wMsgTask	equ	0x6111
; [code] SetMessageBox; the text box MessageTask, WaitMessage and ClearMessageBox use
wMsgBox	equ	0x6115
; [code] StartMessageTask zeroes it with wMsgBox and wMsgFastForward; no reader found (?)
wUnk6116	equ	0x6116
; [code] message pointer queued by ShowMessageFast / QueueMessage; MessageTask starts it in wMsgBox and clears it
wMsgPending	equ	0x6117
; [code] SetMessageSpeed; MessageTask's box speed for a new message and after each button wait
wMsgSpeed	equ	0x611B
; [code] set by ShowMessageFast and FlushMessage: MessageTask then sets the box speed 0 (rest of the page at once) and clears it
wMsgFastForward	equ	0x611C
; [code] MessageTask: 1 when the box reached a button wait, so the A/B press that ends the wait does not also fast-forward the next page; cleared on that press and when a new message starts
wMsgWaitPressed	equ	0x611D
; [code] AskYesNo cursor and answer: 0 Yes, 1 No (L / R move it), 0xFF on B; returned in A
wYesNoAnswer	equ	0x611E
; [code] AskYesNo: the question text pointer (XHL on entry), queued after ClearMessageBox
wYesNoPrompt	equ	0x611F

; menu wait coroutines, box 2 task
; [code] return address the menu wait coroutines pop and jump back to: AskYesNo, WaitFramesOrButton, WaitAOrB
wMenuWaitReturn	equ	0x6123
; [code] WaitFramesOrButton: frames left (A on entry, minus 1 per TaskYield)
wWaitFrameCount	equ	0x6127
; [code] WaitMessage: the caller return address it pops on entry and jumps back to
wWaitMessageReturn	equ	0x6128
; [code] FlushMessage: the caller return address it pops on entry and jumps back to
wFlushMessageReturn	equ	0x612C
; [code] Box2Task commands 1/5 set it 0, 4 sets it 1 (4 and 5 test it first); nothing else reads it
; [play] seen in play: read only by Box2CmdSetFlag, once on each entry to the Works ("Welcome back..."), always 0; command 5 (Box2CmdClearFlag) never runs
wBox2Flag	equ	0x6130
; [code] return address Box2CommandWait pops and jumps back to
wBox2Return	equ	0x6131
; [code] Box2Task's answer (0xFF00 | A) that Box2CommandWait waits for (0 = none yet)
wBox2Result	equ	0x6135
; [code] Box2Task's command (low byte 0-5; Box2CommandWait writes 0xFF00 | n, the task writes 0 when done)
wBox2Command	equ	0x6137

; menu commands
; [code] menu task cursor entry: MenuCmdDrawBox zeroes it, the command 4 input moves it over wMenuCount with U/D (wrapping); GetMenuCursorCell reads it
wMenuCursor	equ	0x6139
; [code] the menu box's answer byte: the command 4 input stores (wMenuValues)[wMenuCursor] (B: 0xFF) here with W = 0xFF; the Works / shop menus branch on it
wMenuChoice	equ	0x613B
; [code] 0xFF once the menu input stores its answer (the high byte of the word write to wMenuChoice, W = 0xFF), 0 when MenuBoxTask starts; DrawMenuCursorSprite only draws the box 2 cursor sprite while it is set
wMenuChoiceMade	equ	0x613C
; [code] 1 after MenuCmdShowCursor, 0 after MenuCmdReset / MenuCmdHideCursor; DrawMenuCursorSprite needs it
wMenuCursorOn	equ	0x613D
; [code] MenuBoxTask's answer to wMenuCommand (MenuCmdEnd: 0xFFFF0000 | 0x613B), read by MenuCommandWait, WaitMenuResult, GetMenuResult
wMenuResult	equ	0x613E
; [code] MenuCommandWait / WaitMenuResult: the caller return address they pop and jump back to
wMenuCmdReturn	equ	0x6142
; [code] command for MenuBoxTask (MenuBoxDispatch table MenuCommandJumps, 1-6), set by MenuCommandWait / PostMenuCommand, 0 once handled
wMenuCommand	equ	0x6146
; [code] entries the cursor wraps over (command 4 input, GetMenuCursorCell); set by the Setup*Menu routines (SetupItemPartsMenu: 3)
wMenuCount	equ	0x614A
; [code] PrintStringTable count for MenuCmdDrawBox; set by the Setup*Menu routines
wMenuTextCount	equ	0x614B
; [code] pointer to the PrintStringTable entries MenuCmdDrawBox draws; set by the Setup*Menu routines
wMenuTexts	equ	0x614C
; [code] pointer to 2 bytes (column, row) per entry: the cursor cell (GetMenuCursorCell); set by the Setup*Menu routines
wMenuCells	equ	0x6150
; [code] pointer to one byte per entry: the value A returns from the command 4 input; set by the Setup*Menu routines
wMenuValues	equ	0x6154

; lists
wListPage	equ	0x6158
wListRow	equ	0x6159
; [code] word: ListCmdInput's result, wListPage * wListRows + wListRow on A, 0xFFFF on B; ListCmdEnd posts it
wListChoice	equ	0x615B
; [code] 0xFF once ListCmdInput stores wListChoice (A or B), 0 when ListTask starts; DrawListCursorSprite only draws the box 3 cursor sprite while it is set
wListChoiceMade	equ	0x615D
; [code] 1 after ListCmdShowCursor, 0 after ListCmdReset / ListCmdHideCursor; DrawListCursorSprite needs it
wListCursorOn	equ	0x615E
; [code] rows per list page: ListCmdInput wraps wListRow over it and multiplies the page by it; set by the list setup routines (0xA)
wListRows	equ	0x615F
; [code] entries in the listed group (DrawItemListPage: GetItemGroupSize); rows past it are blanked
wListCount	equ	0x6160
; [code] page count ListCmdInput wraps wListPage over (L/R)
wListPages	equ	0x6161
; [code] callback that draws the current page (ListCmdRedraw and ListCmdInput on a page change); set by the list setup routines (e.g. DrawShopBuyItemPage)
wListDrawPage	equ	0x6162
; [code] 4-byte routine pointer every list setup stores next to wListDrawPage, always a bare ret (ItemListEmptyHook / EntryListEmptyHook); no reader found
wListUnusedHook	equ	0x6166
; [code] callback ListCmdInput (and CallListMoveHook) calls after every cursor move
wListMoveHook	equ	0x616A
; [code] callback ListCmdInput calls on A: carry accepts the row, no carry plays sound 0x83 and stays
wListAcceptHook	equ	0x616E
; [code] pointer to 2 bytes (column, row) per list row: the cursor cell (GetListCursorCell)
wListCells	equ	0x6172
wListResult	equ	0x6176
; [code] ListCommandWait / WaitListResult: the caller return address they pop and jump back to
wListCmdReturn	equ	0x617A
wListCommand	equ	0x617E

; Works and shop screens, development
; [code] 0-based item group of the item lists (SetupShopBuyItemList / SetupWorksItemList A); DrawItemListPage and GetSelectedListItem use it + 1
wListGroup	equ	0x6182
; [code] which entry list DrawPartListPage shows: 0 Body, 1 Core, 2 Leg, 3 BPack, 4 Arm, 5 Arm-Sel, 6 Mate.-Sel, 7 Tool-Sel (titles PartListTitles); GetListEntryGroup maps it to entry groups 1-5 / 9 / 8
wListEntryKind	equ	0x6183
; [code] Setup row picked (0 body, 1 right arm, 2 left arm, 3 core, 4 legs, 5 back, 6 / 7 accessories): SetupEquipSlotList writes it, StoreSelectedInWorksSlot picks the slot setter by it
wSetupSlot	equ	0x6184
; [code] copy of wGP (4-byte BCD) the Works / shop GP box prints (StoreShownGP, PrintShownGP)
wShownGP	equ	0x6185
; [code] part entry (group << 8 | index) DrawPartEpCostAndAffinity shows; SetShownPart writes it
wShownPart	equ	0x6189
; [code] ep_cost (record +0xC) of wShownPart, printed after "EP" (DrawPartEpCostAndAffinity)
wShownPartEpCost	equ	0x618B
; [code] affinity (record +0xE) of wShownPart, DrawAffinityIcons (DrawPartEpCostAndAffinity)
wShownPartAffinity	equ	0x618C
wDevelopArm	equ	0x618D
wDevelopMaterial	equ	0x618E
wDevelopTool	equ	0x618F
wDevelopChance	equ	0x6190
wDevelopResult	equ	0x6191
wDevelopExp	equ	0x6192
wSetupStats	equ	0x6193
; [code] the Chara stats page DrawCharaStatsPage draws: +0 name pointer, +4 rank, +5 race, +6 level, +7 emblem bits, +8 next (CopyMasterStatsInfo for the player, CopyEngineerStatsInfo for the partner)
wCharaPage	equ	0x61A3
; [code] the arm picked in WorksDevelopMenu (wListChoice + 1, copied to wDevelopArm), 0 = none; DrawDevelopChoices prints its name (group 5)
wDevelopPickArm	equ	0x61AC
; [code] the material picked in WorksDevelopMenu (wListChoice + 1), 0 = none; DrawDevelopChoices prints its name (group 9)
wDevelopPickMaterial	equ	0x61AD
; [code] the tool picked in WorksDevelopMenu, 0 = none, negative = "(none)"; DrawDevelopChoices prints its name (group 8)
wDevelopPickTool	equ	0x61AE
; [code] callback ShowSelectedPartStats stores (XHL): LoadSelectedPartStats shows the row only when it returns carry
wPanelPartFilter	equ	0x61AF
; [code] part entry the stats panel shows (0 = dashes): LoadSelectedPartStats, SetPartStatsPanel; read by LoadPartStatsPanel, DrawPartStatsPanel
wPanelPart	equ	0x61B3
; [code] 6 words hp ep ap sp rp mp + affinity byte (+12) of wPanelPart (LoadPartStatsPanel), printed by DrawPartStatsPanel
wPanelStats	equ	0x61B5
wDevelopArmImage	equ	0x61C2

; Works status and copies, help, trade
wWorksEquip	equ	0x61C3
wPlayerNamePtrCopy	equ	0x61D3
wArenaRankCopy	equ	0x61D7
wPlayerRaceCopy	equ	0x61D8
wPlayerLevelCopy	equ	0x61D9
wEmblemBits	equ	0x61DA
wPartnerNamePtrCopy	equ	0x61DB
wWorksPartnerRace	equ	0x61DF
wWorksEngineerLevel	equ	0x61E0
wEmblemBitsCopy	equ	0x61E1
; [code] AddGPBCD scratch: the 4-byte packed-BCD amount (XWA) added into wGP byte by byte
wGPBcdAddend	equ	0x61E2
; [code] 7-byte buffer of BIOS call 2 (RTC get, BCD: year, month, day, hour, minute, second, ...) that ReadRtc fills; GetRtcMonthDay reads +1 / +2
wRtcBuffer	equ	0x61E6
; [code] caller return address popped and jumped back to by Wait30Frames, WaitForButton and ShowMenuText
wTextWaitReturn	equ	0x61ED
; [code] ShowMenuText: the text pointer (XHL) kept across FlushMessage, then queued (QueueMessage)
wMenuTextPtr	equ	0x61F1
; [code] WaitForButton: frames left (0x3C at entry, minus 1 per frame once the message box is idle); 0 ends the wait
wWaitButtonTimer	equ	0x61F5
; [code] RunWorksScreen A: 1 StreetGoWorks, 2 LoadGameEnterWorks (main menu after a load), 3 StreetAfterDungeonDefeat, 4 camp Stats (WorksStatsMenu, then WorksExit), 5 camp Item list (WorksItemMenu), 6 list pick (WorksScreenEntry)
wWorksScreenMode	equ	0x61F6
; [code] word EndMenuTask posts as 0xFFFF0000 | it to wWorksScreenResult: 0 at WorksScreenEntry, mode 6 the picked list row + 1
wWorksScreenValue	equ	0x61F7
; [code] Works main menu cursor whose description is shown: WorksMenuCursorMoved compares wMenuCursor with it, 0xFF forces a redraw
wWorksMenuShownCursor	equ	0x61F9
; [code] word WorksTradeMenu passes to SetLinkOffer: low byte the picked list row + 1, high byte (+1) the group (part category + 1, item category + 6)
wTradeOffer	equ	0x61FA
; [code] return address WorksUnitStatus and WorksCharaStatus pop on entry and jump back to on A/B
wStatusReturn	equ	0x61FC
; [code] WorksUnitStatus / WorksCharaStatus page, toggled by L/R (xor 1): 0 ShowSetupStats / ShowMasterStats, 1 ShowWorksEquipNames / ShowEngineerStats
wStatusPage	equ	0x6200
; [code] 0 when WorksDataMenu starts RunWorksSaveTask / RunWorksLoadTask, set 1 by them when the save / load task ends; WorksDataMenu polls it
wWorksDataDone	equ	0x6201
; [code] WorksHelpMenu sets 0 and waits until it is non-zero; RunHelpViewerTask sets 1 after its HelpViewerTask child ends
wHelpDone	equ	0x6202
; [code] Works Trade wait counter: WorksTradeMenu zeroes it and gives up the cable check at 0x258 (600) calls; TradeWaitBlink adds 1 per call (bit 3 blinks WaitAMinuteText); StartTradeStatus zeroes it
wTradeWaitTimer	equ	0x6203
; [code] received packet word +4 that DrawTradeStatus last printed under "Self" (0xFFFF = redraw)
wTradeShownSelf	equ	0x6205
; [code] received packet word +2 that DrawTradeStatus last printed under "Other" (0xFFFF = redraw); GetTradeConfirmText checks its count (invalid or >= 9 -> YouHaveTooManyText); TradeSwapItems adds the same entry, read from the packet
wTradeShownOther	equ	0x6207
; [code] received packet byte +1 that DrawTradeStatus last turned into the "--" / "OK" / "NO" marks (0xFF = redraw)
wTradeShownFlags	equ	0x6209
; [code] the RunWorksScreen mode CampWorksScreenTask uses: 4 from CampMenuInput (Stats), 5 from CampItemSubmenuInput (List)
wCampWorksMode	equ	0x620A
; [code] CampWorksScreenTask stores the RunWorksScreen result (XWA) here; no reader found
wCampWorksResult	equ	0x620E
; [code] EndMenuTask posts 0xFFFF0000 | (0x61F7) here; RunWorksScreen waits for it
wWorksScreenResult	equ	0x6212
; [code] RunWorksScreen: the caller return address it pops and jumps back to once wWorksScreenResult is posted
wWorksScreenReturn	equ	0x6216
; [code] routine WorksScreenTask jumps to after setting up (RunWorksScreen: WorksScreenEntry; the shop entry: ShopTalk)
wWorksScreenEntry	equ	0x621A

; shop
; [code] 0 or 0x80 at random (PickShopClerk), 0 / 1 per greeting in ShopTalk: picks the clerk portrait (GetShopClerkPortrait 0x18 Galb / 0x19 Lana, [play]) and the line (PickShopClerkText: XHL or XDE)
wShopClerk	equ	0x621E
; [code] ShopMainMenu: the category picked in the buy / sell category menu (wMenuChoice), used for the part list and as the entry group - 1
wShopCategory	equ	0x621F
; [code] ShopMainMenu word: low byte list row + 1, high byte wShopCategory + 1; passed to GetEntryCountBy / GetEntryPrice / AddItemByCategory and the sell routines
wShopEntry	equ	0x6220

; link cable
; [code] handle of LinkCommTask (StartLinkTask); StopLinkTask marks it ended
wLinkTask	equ	0x6222
; [code] word sent as packet +2 (the entry offered for trade: SetLinkOffer, ResetLinkOffer clears); LinkCommTask copies it to wLinkSendPacket+2 every loop
wLinkOffer	equ	0x622B
; [code] own answer bits sent in packet byte +1: bits 0/2 from SetLinkAnswerBits (1 = yes, 5 = no), bits 1/3 = the partner's bits 0/2 echoed back (LinkCommTask)
wLinkFlags	equ	0x622D
; [code] routine LinkCommTask calls each loop when non-zero (SetLinkCallback; DrawTradeStatus during a trade)
wLinkCallback	equ	0x622E
; [code] LinkCommTask timeout (was wLinkRetries): reset to 0x1E (ClearLinkState, task start, after each packet or error), minus 1 per receive poll without a whole packet; at 0 wLinkStatus = 0 and wLinkErrorBits |= 8
wLinkTimeout	equ	0x6232
; [code] LinkCommTask: where the next received byte goes in wLinkPacketText (reset to its start each packet)
wLinkPacketWritePtr	equ	0x6233
; [code] LinkCommTask: bytes of the 0x10-byte packet still to receive; 0x10 = still looking for LinkSyncWord
wLinkPacketBytesLeft	equ	0x6237
; [code] LinkCommTask result: 1 = packet received and checksum good, 0 = timed out, 0xFF = COM status error, 0xFE = bad checksum, 0xFD = bad sync/hex (DecodeLinkPacket); CheckLinkStatus / CheckLinkError read it as a word with wLinkErrorBits
wLinkStatus	equ	0x6238
; [code] LinkCommTask error bits: 1 COM error (plus the receive-status bits 1-3 of COM call 0x18's W, << 4), 2 checksum, 4 decode, 8 timeout
wLinkErrorBits	equ	0x6239
; [code] 7-byte packet LinkCommTask sends: +0 counter (larger of own and received +0, plus 1), +1 wLinkFlags, +2 wLinkOffer, +4 the partner's offer echoed (received +2), +6 LinkChecksum; EncodeLinkPacket turns it into wLinkPacketText
wLinkSendPacket	equ	0x623A
; [code] 7-byte packet decoded from the partner (DecodeLinkPacket; zeroed on an error): +1 answer bits, +2 the partner's offer, +4 own offer as the partner echoes it, +6 checksum; GetLinkRecvPacket
wLinkRecvPacket	equ	0x6242
; [code] 0x40-byte receive buffer for BIOS COM call 0x1A (LinkCommTask), scanned for the sync word
wLinkRxBuffer	equ	0x6249
; [code] 16 bytes: sync word + 14 hex characters, assembled from wLinkRxBuffer, then reused for the encoded packet sent with COM call 0x19 (LinkCommTask)
wLinkPacketText	equ	0x6289

; sound queue, Z80 song loading
; [code] 16-byte ring of sound commands: QueueSoundCommand writes at wSoundQueueWrite, DequeueSoundCommand reads at wSoundQueueRead, SendQueuedSoundCommand (each main-loop frame) passes one to the Z80 port 0xBC
wSoundQueue	equ	0x629A
; [code] read index (0-15) of the sound command ring wSoundQueue: DequeueSoundCommand takes the byte there and advances it; equal to wSoundQueueWrite = empty (ResetSoundState zeroes both)
wSoundQueueRead	equ	0x62AA
; [code] write index (0-15) of wSoundQueue: QueueSoundCommand stores the command there and advances it (when the ring is full it first drops the oldest with DequeueSoundCommand)
wSoundQueueWrite	equ	0x62AB
; [code] bits 0/1 set by commands 0x80-0x82 and cleared by 0x83-0x85 (QueueSoundCommand); CheckSoundCommandBlocked tests bit 0 (command bit 0 set) or bit 1, and blocked commands are not queued or are dropped unsent
wSoundBlockMask	equ	0x62AC
; [code] value port 0xBC must hold before SendQueuedSoundCommand sends the next command: the complement of the last command sent (ResetSoundState copies 0xBC, PlaySong sets 0 after writing 0xFF)
wSoundAckExpected	equ	0x62AD
; [U2] PlaySong: 0x40 bytes, the Z80 addresses (words) of the music track blocks it copied
wMusicTrackIds	equ	0x62AE
; [U2] PlaySong: number of entries in wMusicTrackIds
wMusicTrackCount	equ	0x62EE
; [U2] PlaySong: 0x40 bytes, the Z80 addresses (words) of the sound effect track blocks
wSfxTrackIds	equ	0x62EF
; [U2] PlaySong: number of entries in wSfxTrackIds; tracks go there once it is non-zero or the id is below 0x7F
wSfxTrackCount	equ	0x632F
; [code] running Z80 RAM destination (0x7000 + offset, PlaySong): CopyToZ80 LDIRs to it and falls into SetZ80Pointer, which stores the advanced XDE back
wZ80CopyPointer	equ	0x6330
; [U2] Z80 RAM address of the song header (0x7000 + driver word +0x8F), set by UploadZ80Driver
wZ80SongHeader	equ	0x6334
; [U2] Z80 RAM address after the driver command table, where PlaySong copies the SoundInit voice records
wZ80Voices	equ	0x6338
; [U2] PlaySong: Z80 RAM address the next track block is copied to
wZ80SongWrite	equ	0x633C
; [U2] PlaySong: ROM read pointer inside the song data
wSongReadPtr	equ	0x6340
; [U2] PlaySong: length of the second part of a track block (swapped with BC)
wSongBlockLength	equ	0x6344

; stack top, BIOS system RAM
; [U2] top of the stack (the BIOS system area starts here)
wStackTop	equ	0x6C00
; [U2] BIOS: flash size byte of a card on CS1 (0 on a retail cartridge)
wBiosFlashSize2	equ	0x6C59
; [U2] BIOS: flash type byte of a card on CS1
wBiosFlashType2	equ	0x6C5B
; [U2] BIOS byte InitConsoleType zeroes on a mono NGP
wBios6DA0	equ	0x6DA0
; [U2] last joypad byte MergeCs1CardInput read from a CS1 card
wBiosCs1Input	equ	0x6E97
; [U2] BIOS byte whose bit 3 InitConsoleType clears on a mono NGP
wBios6F83	equ	0x6F83
