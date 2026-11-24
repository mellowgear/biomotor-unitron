; engine/tables: 28 routines (each keeps its ROM address with .org)

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
    .db 0x6C, 0x6E, 0x6D, 0x70, 0x6F, 0x6A, 0x6B, 0x73

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
    LD        HL,EVENT_STAGE_ENDING              [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip3                          [2]
    LD        HL,EVENT_STAGE_WON_RANK_X          [3]
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
    LD        HL,EVENT_STAGE_ENDING              [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip5                          [2]
    LD        HL,EVENT_STAGE_WON_RANK_X          [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip5                          [2]
    POP       XHL                                [1]
    RET                                          [1]
.skip5:
    POP       XHL                                [1]
    LD        XHL,0x2247BE                       [5]
    RET                                          [1]
