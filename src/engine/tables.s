; engine/tables: 43 routines (each keeps its ROM address with .org)

.org 0x208220

; [code] affinity -> glyph code from 0x208235 (the AT icon)
GetAffinityIcon:
    PUSH      WA                                 [1]
    LD{1}     WA,HL                              [2]
    CALL      AffinityIndex                      [4]
    LD        XHL,0x208235                       [5]
    LD        L,(XHL+WA)                         [5]
    EXTZ      HL                                 [2]
    POP       WA                                 [1]
    RET                                          [1]
    .db 6C 6E 6D 70 6F 6A 6B 73

.org 0x20823D

; [code] HL = attack affinity (else wEnemyAffinity, else the body's) -> XHL = AffinityPalettes + 8 * AffinityIndex
GetAffinityPalette:
    PUSH      XWA                                [1]
    LD{1}     WA,HL                              [2]
    CALL      AffinityIndex                      [4]
    CP        WA,7                               [2]
    JR        C,.skip                            [2]
    LD        WA,(wEnemyAffinity)                [4]
    CALL      AffinityIndex                      [4]
    CP        WA,7                               [2]
    JR        C,.skip                            [2]
    LD        L,(wEquipBody)                     [4]
    CALL      GetBodyRecord                      [4]
    LD        WA,(XHL+PART_AFFINITY)             [3]
    CALL      AffinityIndex                      [4]
.skip:
    EXTZ      XWA                                [2]
    SLL       3,XWA                              [3]
    ADD       XWA,AffinityPalettes               [6]
    LD        XHL,XWA                            [2]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x208272

; L = item id -> ItemNames + 7*(id-1)
GetItemName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,7                              [4]
    ADD       XHL,ItemNames                      [6]
    RET                                          [1]

.org 0x208281

; -> ItemDescs + 19*(id-1)
GetItemDesc:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,0x13                           [4]
    ADD       XHL,ItemDescs                      [6]
    RET                                          [1]

.org 0x208290

; [code] L = item id (38+) -> 0x224612 + 4*(id-38)
GetBattleItemEffect:
    SUB       L,0x26                             [3]
    LD        H,0                                [2]
    MUL       XHL,4                              [4]
    ADD       XHL,BattleItemEffects              [6]
    RET                                          [1]

.org 0x2082A0

; L = enemy id -> XHL = EnemyNames + 7*(id-1)
GetEnemyName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,7                              [4]
    ADD       XHL,EnemyNames                     [6]
    RET                                          [1]

.org 0x2082AF

; L = enemy id -> XHL = EnemyStats + 26*(id-1)
GetEnemyRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,0x1A                           [4]
    ADD       XHL,EnemyStats                     [6]
    RET                                          [1]

.org 0x2082BE

; HL = image id -> XHL = ImageTable[235 + id-1] (pointer read)
GetMonsterImage:
    DEC       1,HL                               [2]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,0x220FAC                       [6]
    LD        XHL,(XHL)                          [2]
    RET                                          [1]

.org 0x2082CE

; [code] HL = image id -> MonsterPalettes + 8*(id-1)
GetMonsterPalette:
    DEC       1,HL                               [2]
    EXTZ      XHL                                [2]
    SLL       3,XHL                              [3]
    ADD       XHL,MonsterPalettes                [6]
    RET                                          [1]

.org 0x2082DC

; L = attack id -> AttackNames + 7*(id-1)
GetAttackName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,7                              [4]
    ADD       XHL,AttackNames                    [6]
    RET                                          [1]

.org 0x2082EB

; L = enemy id -> EnemyAttacks + 60*(id-1)
GetEnemyAttackSlots:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,0x3C                           [4]
    ADD       XHL,EnemyAttacks                   [6]
    RET                                          [1]

.org 0x2082FA

; L = part id -> PartNames + 7*(id-1)
GetPartName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,7                              [4]
    ADD       XHL,PartNames                      [6]
    RET                                          [1]

.org 0x208309

; L = id within category -> PartName(id + first id of category)
GetBodyName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271882)                      [5]
    JP        0x2082FC                           [4]

.org 0x208316

GetCoreName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271884)                      [5]
    JP        0x2082FC                           [4]

.org 0x208323

GetLegsName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271886)                      [5]
    JP        0x2082FC                           [4]

.org 0x208330

GetBackName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271888)                      [5]
    JP        0x2082FC                           [4]

.org 0x20833D

GetArmName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x27188A)                      [5]
    JP        0x2082FC                           [4]

.org 0x20834A

; -> PartDescs entry of an arm
GetArmDesc:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x27188A)                      [5]
    DEC       1,HL                               [2]
    MUL       XHL,0x13                           [4]
    ADD       XHL,PartDescs                      [6]
    RET                                          [1]

.org 0x208360

; L = part id -> PartStats + 24*(id-1)
GetPartRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,0x18                           [4]
    ADD       XHL,PartStats                      [6]
    RET                                          [1]

.org 0x20836F

; category-relative PartRecord
GetBodyRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271882)                      [5]
    JP        0x208362                           [4]

.org 0x20837C

GetCoreRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271884)                      [5]
    JP        0x208362                           [4]

.org 0x208389

GetLegsRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271886)                      [5]
    JP        0x208362                           [4]

.org 0x208396

GetBackRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x271888)                      [5]
    JP        0x208362                           [4]

.org 0x2083A3

GetArmRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    ADD       HL,(0x27188A)                      [5]
    JP        0x208362                           [4]

.org 0x2083B0

; [code] L = arm -> ArmEffects + 7*(arm-1)
GetArmEffects:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,7                              [4]
    ADD       XHL,ArmEffects                     [6]
    RET                                          [1]

.org 0x2083BF

; L = skill id -> SkillNames + 7*(id-1)
GetSkillName:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,7                              [4]
    ADD       XHL,SkillNames                     [6]
    RET                                          [1]

.org 0x2083CE

; -> SkillDescs + 19*(id-1)
GetSkillDesc:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,0x13                           [4]
    ADD       XHL,SkillDescs                     [6]
    RET                                          [1]

.org 0x2083DD

; -> SkillStats + 18*(id-1)
GetSkillRecord:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,0x12                           [4]
    ADD       XHL,SkillStats                     [6]
    RET                                          [1]

.org 0x2083EC

; -> SkillData + 8*(id-1)
GetSkillData:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,8                              [4]
    ADD       XHL,SkillData                      [6]
    RET                                          [1]

.org 0x2083FB

; [code] L = turns -> L = StatusRecovery[turns]
GetStatusRecovery:
    LD        H,0                                [2]
    EXTZ      XHL                                [2]
    ADD       XHL,StatusRecovery                 [6]
    LD        L,(XHL)                            [2]
    LD        H,0                                [2]
    RET                                          [1]

.org 0x20840A

; -> XHL = EnemyScaling row for wAreaLevel (and event flags)
GetEnemyScaling:
    PUSH      XBC                                [1]
    PUSH      XDE                                [1]
    LD        XBC,0                              [2]
    LD        C,(wAreaLevel)                     [4]
    DEC       1,C                                [2]
    JR        PL,.skip                           [2]
    LD        C,0                                [2]
.skip:
    CP        C,7                                [2]
    JR        C,.skip2                           [2]
    LD        C,7                                [2]
.skip2:
    MUL       XBC,0xE                            [4]
    LD        XDE,0x22475C                       [5]
    LD        HL,0xA                             [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip3                          [2]
    LD        HL,0xB                             [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip3                          [2]
    LD        XDE,EnemyScaling                   [5]
.skip3:
    ADD       XBC,XDE                            [2]
    LD        XHL,XBC                            [2]
    POP       XDE                                [1]
    POP       XBC                                [1]
    CPB       (wEnemyId),0x59                    [5]
    RET       C                                  [2]
    CPB       (wEnemyId),0x62                    [5]
    JR        C,.skip4                           [2]
    CPB       (wEnemyId),0x71                    [5]
    RET       C                                  [2]
.skip4:
    PUSH      XHL                                [1]
    LD        HL,0xA                             [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip5                          [2]
    LD        HL,0xB                             [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip5                          [2]
    POP       XHL                                [1]
    RET                                          [1]
.skip5:
    POP       XHL                                [1]
    LD        XHL,0x2247BE                       [5]
    RET                                          [1]

.org 0x2119DE

; [code] chest code -> WA = item id, or part CoreX (72) / Grav (73)
GetChestContent:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    CP        A,0x48                             [3]
    JR        NZ,.skip                           [2]
    LD        WA,0x119                           [3]
    JR        .skip3                             [2]
.skip:
    CP        A,0x49                             [3]
    JR        NZ,.skip2                          [2]
    LD        WA,0x159                           [3]
    JR        .skip3                             [2]
.skip2:
    EXTZ      WA                                 [2]
.skip3:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2119FB

; [code] gold code 74-89 -> WA = ChestGold
GetChestGold:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    SUB       A,0x4A                             [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    LD        XHL,ChestGold                      [5]
    ADD       XHL,XWA                            [2]
    LD        WA,(XHL)                           [2]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x211A15

; [code] gold code 74-89 -> XHL = ChestGoldText
GetChestGoldText:
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    SUB       A,0x4A                             [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    LD        XHL,ChestGoldText                  [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    RET                                          [1]

.org 0x216AA2

; [code] A = highest event flag 1-11 that is set, else 0
GetStoryStage:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    LD        HL,0xB                             [3]
    PUSH      HL                                 [1]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    POP       HL                                 [1]
    JR        Z,0x216AB7                         [2]
    SUB       HL,1                               [4]
    JR        NZ,0x216AA7                        [2]
    LD{1}     A,L                                [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216ABC

; [code] A = StageArenaRank[GetStoryStage]
GetStageArenaRank:
    PUSH      XHL                                [1]
    PUSH      W                                  [2]
    CALL      GetStoryStage                      [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,StageArenaRank                 [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    POP       W                                  [2]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x217499

; [code] W = gender, A = engineer level -> DevLevelExpMale/Female
GetDevLevelExp:
    OR        W,W                                [2]
    JR        NZ,.skip                           [2]
    CALL      swp_21B9DE                         [4]
    JR        .done                              [2]
.skip:
    CALL      swp_21B9EB                         [4]
.done:
    RET                                          [1]

.org 0x2174A8

; [code] W = gender, A = engineer level -> DevLevelBonusMale/Female
GetDevLevelBonus:
    OR        W,W                                [2]
    JR        NZ,.skip                           [2]
    CALL      swp_21B9F8                         [4]
    JR        .done                              [2]
.skip:
    CALL      swp_21BA05                         [4]
.done:
    RET                                          [1]

.org 0x2174B7

; [code] A = partner race/gender -> DevPartnerBonus
GetDevPartnerBonus:
    CALL      swp_21BA12                         [4]
    RET                                          [1]

.org 0x2174BC

; [code] A = tool 1-5 -> 5/10/15/20/100 (0x21BA1F)
GetDevToolBonus:
    CALL      sub_21BA24                         [4]
    RET                                          [1]

.org 0x21B9DE

swp_21B9DE:
    PUSH      XHL                                [1]
    LD        XHL,0x25E648                       [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B9F8

swp_21B9F8:
    PUSH      XHL                                [1]
    LD        XHL,DevLevelBonusMale              [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21D192

; [code] W = arm, A = material -> XHL = Recipes entry (pct, result, dev_exp)
GetRecipe:
    LD        L,W                                [2]
    DEC       1,L                                [2]
    MUL{1}    HL,0xF                             [3]
    DEC       1,A                                [2]
    EXTZ      WA                                 [2]
    ADD       WA,HL                              [2]
    MUL       XWA,3                              [4]
    LD        XHL,Recipes                        [5]
    LDA       XHL,XHL+WA                         [5]
    RET                                          [1]
