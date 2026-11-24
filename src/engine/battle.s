; engine/battle: 169 routines (each keeps its ROM address with .org)

.org 0x206A7B

swp_206A7B:
    CP        DE,0x98                            [4]
    RET       GE                                 [2]
    CP        BC,0xA0                            [4]
    RET       GE                                 [2]
    DEC       1,WA                               [2]
    OR        W,0x18                             [3]
    XOR       W,0x80                             [3]
    PUSH      WA                                 [1]
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    LD        A,(XHL+)                           [3]
    LD        QC,A                               [3]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    ADD       BC,WA                              [2]
    JRL       MI,.skip2                          [3]
    DEC       8,BC                               [2]
    LD        (XSP),BC                           [2]
    LD        A,(XHL+)                           [3]
    LD        QB,A                               [3]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    ADD       DE,WA                              [2]
    JR        MI,.skip2                          [2]
    LD        BC,0                               [2]
    LD        XDE,0                              [2]
.loop:
    CPW       (0x5A82),0x5B86                    [6]
    JR        NC,.skip2                          [2]
    LD        WA,(XHL)                           [2]
    AND       WA,0x1FF                           [4]
    JR        Z,.skip                            [2]
    LD{1}     A,B                                [2]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    ADD       WA,(XSP+2)                         [3]
    CP        WA,0xFFF8                          [4]
    JR        LE,.skip                           [2]
    CP        WA,0xA0                            [4]
    JR        GE,.skip2                          [2]
    LD        QW,A                               [3]
    LD{1}     A,C                                [2]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    NEG       WA                                 [2]
    ADD       WA,(XSP)                           [2]
    CP        WA,0xFFF8                          [4]
    JR        LE,.skip                           [2]
    CP        WA,0xA8                            [4]
    JR        GE,.skip                           [2]
    LD        QA,A                               [3]
    LD        WA,(XHL)                           [2]
    AND       W,0xE1                             [3]
    ADD       WA,(XSP+4)                         [3]
    LD        DE,(0x5A82)                        [4]
    LD{1}     (XDE+),XWA                         [3]
    LD        (0x5A82),DE                        [4]
    LD        WA,(XHL)                           [2]
    SRL       1,W                                [3]
    AND       W,0xF                              [3]
    LD        DE,(0x5A84)                        [4]
    LD        (XDE+),W                           [3]
    LD        (0x5A84),DE                        [4]
.skip:
    INC       2,XHL                              [2]
    INC       1,C                                [2]
    CP        C,QC                               [3]
    JR        C,.loop                            [2]
    LD        C,0                                [2]
    INC       1,B                                [2]
    CP        B,QB                               [3]
    JR        C,.loop                            [2]
.skip2:
    INC       6,XSP                              [2]
    RET                                          [1]

.org 0x2077A6

sub_2077A6:
    PUSH      XHL                                [1]
    CALR      dyn_2077BE                         [3]
    ADD       (XSP),XHL                          [2]
    POP       XHL                                [1]
    LD{1}     WA,BC                              [2]
.loop:
    LD        BC,0x80                            [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    DJNZ      WA,.loop                           [3]
    LD        RA3,0                              [3]
    LD        A,RA3                              [3]
    RET                                          [1]

.org 0x2077BE

dyn_2077BE:
    CPW       (0x200020),0xFFFE                  [7]
    LD        XHL,0x200000                       [5]
    RET       NZ                                 [2]
    LD        QL,0x80                            [4]
    RET                                          [1]

.org 0x2077D1

; A = enemy id: copies its record into battle RAM 0x5DA3-0x5DB9
LoadEnemy:
    LD        (wEnemyId),A                       [4]
    LD        XWA,0                              [2]
    LD        (wEnemyParts),XWA                  [4]
    LD        (0x5DD5),WA                        [4]
    OR        XHL,XHL                            [2]
    JR        Z,.skip                            [2]
    LD        XDE,wEnemyParts                    [5]
    LD        BC,6                               [2]
    LDIR      (XDE+),(XHL+)                      [2]
.skip:
    LD        L,(wEnemyId)                       [4]
    CALL      GetEnemyRecord                     [4]
    LD        A,(XHL+ENEMY_LEVEL)                [3]
    LD        (wEnemyLevel),A                    [4]
    LD        WA,(XHL+ENEMY_HP)                  [3]
    LD        (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+ENEMY_EP)                  [3]
    LD        (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+ENEMY_AP)                  [3]
    LD        (wEnemyAP),WA                      [4]
    LD        WA,(XHL+ENEMY_SP)                  [3]
    LD        (wEnemySP),WA                      [4]
    LD        WA,(XHL+ENEMY_RP)                  [3]
    LD        (wEnemyRP),WA                      [4]
    LD        WA,(XHL+ENEMY_MP)                  [3]
    LD        (wEnemyMP),WA                      [4]
    LD        WA,(XHL+ENEMY_AFFINITY)            [3]
    LD        (wEnemyAffinity),WA                [4]
    LD        WA,(XHL+ENEMY_IMAGE)               [3]
    LD        (wEnemyImage),WA                   [4]
    LDB       (wEnemyScaled),0                   [5]
    LD        A,(wEnemyLevel)                    [4]
    OR        A,A                                [2]
    JRL       PL,.skip3                          [3]
    LDB       (wEnemyScaled),0xFF                [5]
    CPB       (wEnemyId),0x62                    [5]
    JR        NC,.skip2                          [2]
    LD        WA,0xB                             [3]
    CALL      RandomRange                        [4]
    DEC       6,WA                               [2]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,0xB                             [3]
    CALL      RandomRange                        [4]
    DEC       6,WA                               [2]
    ADD       (wEnemyMaxEP),WA                   [4]
.skip2:
    CALL      GetEnemyScaling                    [4]
    LD        WA,(XHL+0)                         [3]
    MUL       XWA,(wEnemyMaxHP)                  [4]
    DIV       XWA,0x64                           [4]
    LD        (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+2)                         [3]
    MUL       XWA,(wEnemyMaxEP)                  [4]
    DIV       XWA,0x64                           [4]
    LD        (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+4)                         [3]
    MUL       XWA,(wEnemyAP)                     [4]
    DIV       XWA,0x64                           [4]
    LD        (wEnemyAP),WA                      [4]
    LD        WA,(XHL+6)                         [3]
    MUL       XWA,(wEnemySP)                     [4]
    DIV       XWA,0x64                           [4]
    LD        (wEnemySP),WA                      [4]
    LD        WA,(XHL+8)                         [3]
    MUL       XWA,(wEnemyRP)                     [4]
    DIV       XWA,0x64                           [4]
    LD        (wEnemyRP),WA                      [4]
    LD        WA,(XHL+0xA)                       [3]
    MUL       XWA,(wEnemyMP)                     [4]
    DIV       XWA,0x64                           [4]
    LD        (wEnemyMP),WA                      [4]
    LD        A,(XHL+0xD)                        [3]
    LD        W,0                                [2]
    CALL      RandomRange                        [4]
    ADD       A,(XHL+0xC)                        [3]
    LD        (wEnemyLevel),A                    [4]
    CPB       (wEnemyId),0x62                    [5]
    JR        NC,.skip3                          [2]
    LD        WA,0xB                             [3]
    CALL      RandomRange                        [4]
    DEC       6,WA                               [2]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,0xB                             [3]
    CALL      RandomRange                        [4]
    DEC       6,WA                               [2]
    ADD       (wEnemyMaxEP),WA                   [4]
.skip3:
    CPB       (wEnemyId),0x71                    [5]
    JRL       NC,.done                           [3]
    LD        L,(0x5DD2)                         [4]
    OR        L,L                                [2]
    JRL       Z,.done                            [3]
    CALL      GetBodyRecord                      [4]
    LDW       (wEnemyAffinity),(XHL+PART_AFFINITY) [5]
    LD        WA,(XHL+PART_HP)                   [3]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+PART_EP)                   [3]
    ADD       (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+PART_AP)                   [3]
    ADD       (wEnemyAP),WA                      [4]
    LD        WA,(XHL+PART_SP)                   [3]
    ADD       (wEnemySP),WA                      [4]
    LD        WA,(XHL+PART_RP)                   [3]
    ADD       (wEnemyRP),WA                      [4]
    LD        WA,(XHL+PART_MP)                   [3]
    ADD       (wEnemyMP),WA                      [4]
    LD        L,(wEnemyParts)                    [4]
    CALL      GetCoreRecord                      [4]
    LD        WA,(XHL+PART_HP)                   [3]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+PART_EP)                   [3]
    ADD       (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+PART_AP)                   [3]
    ADD       (wEnemyAP),WA                      [4]
    LD        WA,(XHL+PART_SP)                   [3]
    ADD       (wEnemySP),WA                      [4]
    LD        WA,(XHL+PART_RP)                   [3]
    ADD       (wEnemyRP),WA                      [4]
    LD        WA,(XHL+PART_MP)                   [3]
    ADD       (wEnemyMP),WA                      [4]
    LD        L,(0x5DD3)                         [4]
    CALL      GetArmRecord                       [4]
    LD        WA,(XHL+PART_HP)                   [3]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+PART_EP)                   [3]
    ADD       (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+PART_SP)                   [3]
    ADD       (wEnemySP),WA                      [4]
    LD        WA,(XHL+PART_RP)                   [3]
    ADD       (wEnemyRP),WA                      [4]
    LD        WA,(XHL+PART_MP)                   [3]
    ADD       (wEnemyMP),WA                      [4]
    LD        L,(0x5DD4)                         [4]
    CALL      GetArmRecord                       [4]
    LD        WA,(XHL+PART_HP)                   [3]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+PART_EP)                   [3]
    ADD       (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+PART_SP)                   [3]
    ADD       (wEnemySP),WA                      [4]
    LD        WA,(XHL+PART_RP)                   [3]
    ADD       (wEnemyRP),WA                      [4]
    LD        WA,(XHL+PART_MP)                   [3]
    ADD       (wEnemyMP),WA                      [4]
    LD        L,(0x5DD5)                         [4]
    CALL      GetLegsRecord                      [4]
    LD        WA,(XHL+PART_HP)                   [3]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+PART_EP)                   [3]
    ADD       (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+PART_AP)                   [3]
    ADD       (wEnemyAP),WA                      [4]
    LD        WA,(XHL+PART_SP)                   [3]
    ADD       (wEnemySP),WA                      [4]
    LD        WA,(XHL+PART_RP)                   [3]
    ADD       (wEnemyRP),WA                      [4]
    LD        WA,(XHL+PART_MP)                   [3]
    ADD       (wEnemyMP),WA                      [4]
    LD        L,(0x5DD6)                         [4]
    CALL      GetBackRecord                      [4]
    LD        WA,(XHL+PART_HP)                   [3]
    ADD       (wEnemyMaxHP),WA                   [4]
    LD        WA,(XHL+PART_EP)                   [3]
    ADD       (wEnemyMaxEP),WA                   [4]
    LD        WA,(XHL+PART_AP)                   [3]
    ADD       (wEnemyAP),WA                      [4]
    LD        WA,(XHL+PART_SP)                   [3]
    ADD       (wEnemySP),WA                      [4]
    LD        WA,(XHL+PART_RP)                   [3]
    ADD       (wEnemyRP),WA                      [4]
    LD        WA,(XHL+PART_MP)                   [3]
    ADD       (wEnemyMP),WA                      [4]
.done:
    RET                                          [1]

.org 0x207A27

swp_207A27:
    LD        A,(wEquipAcc1)                     [4]
    CALR      sub_207A32                         [3]
    LD        A,(wEquipAcc2)                     [4]

.org 0x207A32

sub_207A32:
    LD        XHL,0                              [2]
    LD        L,A                                [2]
    SLL       2,HL                               [3]
    ADD       XHL,0x207A43                       [6]
    LD        XHL,(XHL)                          [2]
    JP        (XHL)                              [2]

.org 0x207E77

sub_207E77:
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    PUSH      WA                                 [1]
    CALL      swp_208475                         [4]
    LD        HL,(XSP)                           [2]
    CALL      DrawRobot                          [4]
    POP       WA                                 [1]
    POP       BC                                 [1]
    LD        DE,(XSP)                           [2]
    CALL      swp_206C7B                         [4]
    LD        HL,(wUnitAffinity)                 [4]
    CALL      GetAffinityPalette                 [4]
    POP       DE                                 [1]
    CALL      sub_207F30                         [4]
    RET                                          [1]

.org 0x207E9A

; wEnemyImage -> MonsterImage, LoadMonsterImage; images 0x5E+ are portraits (EnemyImagePortraits)
LoadEnemyImage:
    LD        HL,(wEnemyImage)                   [4]
    CP        HL,0xFFFF                          [4]
    JR        Z,.skip2                           [2]
    CP        HL,0x5E                            [4]
    JR        NC,.skip3                          [2]
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    PUSH      WA                                 [1]
    CALL      GetMonsterImage                    [4]
    CALL      LoadMonsterImage                   [4]
    LD        QB,B                               [3]
    LD        QD,D                               [3]
    POP       WA                                 [1]
    POP       BC                                 [1]
    LD        DE,(XSP)                           [2]
    CP        QB,6                               [3]
    JR        GT,.skip                           [2]
    INC       2,BC                               [2]
    INC       2,DE                               [2]
.skip:
    CALL      swp_206C7B                         [4]
    LD        HL,(wEnemyImage)                   [4]
    CALL      GetMonsterPalette                  [4]
    POP       DE                                 [1]
    CALL      sub_207F30                         [4]
    RET                                          [1]
.skip2:
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    PUSH      WA                                 [1]
    LD        QA,0                               [3]
    LD        BC,0x84                            [3]
    CALL      FillTiles                          [4]
    CALL      swp_20847F                         [4]
    LD        HL,(XSP)                           [2]
    CALL      DrawRobot                          [4]
    POP       WA                                 [1]
    POP       BC                                 [1]
    LD        DE,(XSP)                           [2]
    INC       1,DE                               [2]
    OR        WA,0x8000                          [4]
    LD        QB,0xC                             [4]
    LD        QD,0xB                             [4]
    CALL      swp_206C7B                         [4]
    LD        HL,(wEnemyAffinity)                [4]
    CALL      GetAffinityPalette                 [4]
    POP       DE                                 [1]
    CALL      sub_207F30                         [4]
    RET                                          [1]
.skip3:
    SUB       HL,0x5E                            [4]
    EXTZ      XHL                                [2]
    ADD       XHL,EnemyImagePortraits            [6]
    LD        L,(XHL)                            [2]
    LD        H,0                                [2]
    CALL      DrawPortraitAt                     [4]
    RET                                          [1]

.org 0x207F2A
EnemyImagePortraits:
    .db 0x3E, 0x40, 0x3D, 0x3F, 0x41, 0x42

.org 0x207F30

sub_207F30:
    CP        DE,0x20                            [4]
    JR        C,.skip                            [2]
    LD        A,0x20                             [2]
    LD        C,1                                [2]
    CALL      LoadPalettes                       [4]
    LD        A,4                                [2]
    LD        C,1                                [2]
    LD        XHL,MonoPal_220BFC                 [5]
    CALL      LoadMonoPalettes                   [4]
    LD        A,5                                [2]
    LD        C,1                                [2]
    LD        XHL,MonoPal_21F018                 [5]
    CALL      LoadMonoPalettes                   [4]
    RET                                          [1]
.skip:
    LD        A,0x10                             [2]
    LD        C,1                                [2]
    CALL      LoadPalettes                       [4]
    LD        A,2                                [2]
    LD        C,1                                [2]
    LD        XHL,MonoPal_220BFC                 [5]
    CALL      LoadMonoPalettes                   [4]
    LD        A,3                                [2]
    LD        C,1                                [2]
    LD        XHL,MonoPal_21F018                 [5]
    CALL      LoadMonoPalettes                   [4]
    RET                                          [1]

.org 0x207F7C

; [code] adds LevelGapCrit/Flee/Status[clamp(level gap + 11, 0, 22)] to both sides' chances
AddLevelGapChances:
    LD        XHL,LevelGapCrit                   [5]
    LD        XDE,LevelGapFlee                   [5]
    LD        XBC,LevelGapStatus                 [5]
    LD        A,(wPlayerLevel)                   [4]
    SUB       A,(wEnemyLevel)                    [4]
    CALR      sub_207FF7                         [3]
    LD        W,(XHL+A)                          [5]
    ADD       (wCritChance),W                    [4]
    LD        W,(XDE+A)                          [5]
    ADD       (wFleeChance),W                    [4]
    LD        W,(XBC+A)                          [5]
    ADD       (wStatusChance),W                  [4]
    LD        A,(wEnemyLevel)                    [4]
    SUB       A,(wPlayerLevel)                   [4]
    CALR      sub_207FF7                         [3]
    LD        W,(XHL+A)                          [5]
    ADD       (wEnemyCritChance),W               [4]
    LD        W,(XDE+A)                          [5]
    ADD       (0x5DBF),W                         [4]
    LD        W,(XBC+A)                          [5]
    ADD       (wEnemyStatusChance),W             [4]
    CPB       (wEnemyId),0x59                    [5]
    RET       C                                  [2]
    CPB       (wEnemyId),0x62                    [5]
    JR        C,.skip                            [2]
    CPB       (wEnemyId),0x71                    [5]
    RET       C                                  [2]
.skip:
    LDB       (wFleeChance),0                    [5]
    LDB       (wStatusChance),0                  [5]
    RET                                          [1]

.org 0x207FF7

sub_207FF7:
    ADD       A,0xB                              [3]
    JR        MI,.skip                           [2]
    CP        A,0x16                             [3]
    RET       LE                                 [2]
    LD        A,0x16                             [2]
    RET                                          [1]
.skip:
    LD        A,0                                [2]
    RET                                          [1]

.org 0x208007

; cheapest enemy attack -> wEnemyMinAttackEP
CalcEnemyMinAttackEP:
    LD        WA,0xFFFF                          [3]
    LD        (wCommandEPCosts),WA               [4]
    LD        (0x5D84),WA                        [4]
    LD        (0x5D86),WA                        [4]
    LD        (0x5D88),WA                        [4]
    LD        (wMinEPCost),WA                    [4]
    LD        (wEnemyMinAttackEP),WA             [4]
    LD        L,(wEnemyId)                       [4]
    CALL      GetEnemyAttackSlots                [4]
    LD        C,4                                [2]
.loop:
    LD        A,(XHL+3)                          [3]
    CP        A,0xB                              [3]
    LD        W,(0x5DD3)                         [4]
    JR        Z,.skip                            [2]
    CP        A,0xC                              [3]
    LD        W,(0x5DD4)                         [4]
    JR        Z,.skip                            [2]
    LD        WA,(XHL+4)                         [3]
    JR        .skip2                             [2]
.skip:
    PUSH      XHL                                [1]
    LD        L,W                                [2]
    CALL      GetArmRecord                       [4]
    LD        WA,(XHL+PART_EP_COST)              [3]
    POP       XHL                                [1]
.skip2:
    CP        WA,0xFFFF                          [4]
    JR        Z,.skip4                           [2]
    OR        WA,WA                              [2]
    JR        Z,.skip3                           [2]
    CP        (wEnemyMinAttackEP),WA             [4]
    JR        C,.skip3                           [2]
    LD        (wEnemyMinAttackEP),WA             [4]
.skip3:
    ADD       XHL,0xF                            [6]
    DJNZ      C,.loop                            [3]
.skip4:
    LD        L,(wEquipRightArm)                 [4]
    CALL      GetArmRecord                       [4]
    LD        WA,(XHL+PART_EP_COST)              [3]
    CALL      sub_2089DC                         [4]
    LD        (wCommandEPCosts),WA               [4]
    CP        (wMinEPCost),WA                    [4]
    JR        C,.skip5                           [2]
    LD        (wMinEPCost),WA                    [4]
.skip5:
    LD        L,(wEquipLeftArm)                  [4]
    CALL      GetArmRecord                       [4]
    LD        WA,(XHL+PART_EP_COST)              [3]
    CALL      sub_2089DC                         [4]
    LD        (0x5D84),WA                        [4]
    CP        (wMinEPCost),WA                    [4]
    JR        C,.skip6                           [2]
    LD        (wMinEPCost),WA                    [4]
.skip6:
    LD        L,(wSkill1)                        [4]
    OR        L,L                                [2]
    JR        Z,.skip7                           [2]
    CALL      GetSkillRecord                     [4]
    LD        WA,(XHL+0xC)                       [3]
    CALL      sub_2089DC                         [4]
    LD        (0x5D86),WA                        [4]
    CP        (wMinEPCost),WA                    [4]
    JR        C,.skip7                           [2]
    LD        (wMinEPCost),WA                    [4]
.skip7:
    LD        L,(wSkill2)                        [4]
    OR        L,L                                [2]
    JR        Z,.skip8                           [2]
    CALL      GetSkillRecord                     [4]
    LD        WA,(XHL+0xC)                       [3]
    CALL      sub_2089DC                         [4]
    LD        (0x5D88),WA                        [4]
    CP        (wMinEPCost),WA                    [4]
    JR        C,.skip8                           [2]
    LD        (wMinEPCost),WA                    [4]
.skip8:
    CPB       (wFullChargeActive),0              [5]
    JR        Z,.done                            [2]
    LD        WA,0                               [2]
    LD        (wCommandEPCosts),WA               [4]
    LD        (0x5D84),WA                        [4]
    LD        (0x5D86),WA                        [4]
    LD        (0x5D88),WA                        [4]
    LD        (wMinEPCost),WA                    [4]
.done:
    RET                                          [1]

.org 0x208108

; [code] A = level -> WA = random 1..rand + base (LevelRolls[(level-1)/5])
LevelRoll:
    DEC       1,A                                [2]
    LD        W,0                                [2]
    DIV{1}    WA,5                               [3]
    LD        W,0                                [2]
    SLL       1,WA                               [3]
    EXTZ      XWA                                [2]
    ADD       XWA,LevelRolls                     [6]
    PUSH      WA                                 [1]
    PUSH      XWA                                [1]
    LD        A,(XWA)                            [2]
    LD        W,0                                [2]
    CALL      RandomRange                        [4]
    LD        (XSP+4),WA                         [3]
    POP       XWA                                [1]
    INC       1,XWA                              [2]
    LD        A,(XWA)                            [2]
    LD        W,0                                [2]
    ADD       WA,(XSP+)                          [3]
    RET                                          [1]

.org 0x20815F

swp_20815F:
    LD        WA,(wUnitMP)                       [4]
    CALL      sub_208A27                         [4]
    PUSH      WA                                 [1]
    LD        A,(wPlayerLevel)                   [4]
    CALL      LevelRoll                          [4]
    ADD       (XSP),WA                           [2]
    LD        WA,(wEnemyMP)                      [4]
    CALL      sub_208AD5                         [4]
    PUSH      WA                                 [1]
    LD        A,(wEnemyLevel)                    [4]
    CALL      LevelRoll                          [4]
    ADD       (XSP),WA                           [2]
    POP       WA                                 [1]
    SUB       (XSP),WA                           [2]
    POP       WA                                 [1]
    RET                                          [1]

.org 0x20818A

; [code] BC = attacker RP, DE = defender RP, A/W = levels -> WA = BC + LevelRoll - ((DE+3)/4 + W); negative = miss
HitMargin:
    INC       3,DE                               [2]
    SRL       2,DE                               [3]
    PUSH      W                                  [2]
    CALL      LevelRoll                          [4]
    ADD       BC,WA                              [2]
    POP       A                                  [1]
    ADD       DE,WA                              [2]
    SUB       BC,DE                              [2]
    LD{1}     WA,BC                              [2]
    RET                                          [1]

.org 0x20819F

; [code] BC = attack, DE = defence, A = level -> WA = DamageTable[row][random 0-4]
DamageRoll:
    PUSH      A                                  [1]
    CALL      LevelRoll                          [4]
    ADD       BC,WA                              [2]
    POP       A                                  [1]
    CALL      LevelRoll                          [4]
    ADD       DE,WA                              [2]
    SUB       BC,DE                              [2]
    JR        NC,.skip                           [2]
    LD        BC,0xFFFB                          [3]
.skip:
    ADD       BC,9                               [4]
    EXTZ      XBC                                [2]
    DIV       XBC,5                              [4]
    CP        BC,0xC9                            [4]
    JR        LE,.skip2                          [2]
    LD        BC,0xC9                            [3]
.skip2:
    LD        WA,0xA                             [3]
    CALL      RandomRange                        [4]
    DEC       1,WA                               [2]
    SRL       1,WA                               [3]
    MUL       XBC,5                              [4]
    ADD       BC,WA                              [2]
    SLL       1,BC                               [3]
    LD        XDE,DamageTable                    [5]
    LD        WA,(XDE+BC)                        [5]
    RET                                          [1]

.org 0x2081E7

; [code] WA = damage, BC/DE = attacker/defender affinity -> WA x AffinityTable / 100, min 1
ApplyAffinity:
    PUSH      XHL                                [1]
    PUSH      WA                                 [1]
    LD{1}     WA,BC                              [2]
    CALL      AffinityIndex                      [4]
    LD        HL,WA                              [2]
    MUL       XHL,9                              [4]
    LD{1}     WA,DE                              [2]
    CALL      AffinityIndex                      [4]
    ADD       HL,WA                              [2]
    SLL       1,XHL                              [3]
    ADD       XHL,AffinityTable                  [6]
    LD        HL,(XHL)                           [2]
    POP       WA                                 [1]
    MUL       XWA,HL                             [2]
    DIV       XWA,0x64                           [4]
    POP       XHL                                [1]
    OR        WA,WA                              [2]
    RET       NZ                                 [2]
    INC       1,WA                               [2]
    RET                                          [1]

.org 0x208217

; [code] WA = affinity bits -> lowest set bit 0-7, 8 = none (BS1F)
AffinityIndex:
    OR        WA,0xFF00                          [4]
    BS1F      A,WA                               [2]
    LD        W,0                                [2]
    RET                                          [1]

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

.org 0x2083B0

; [code] L = arm -> ArmEffects + 7*(arm-1)
GetArmEffects:
    LD        H,0                                [2]
    DEC       1,HL                               [2]
    MUL       XHL,7                              [4]
    ADD       XHL,ArmEffects                     [6]
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

.org 0x20847F

swp_20847F:
    LD        XHL,wEnemyParts                    [5]
    CALL      SetRobotDrawParts                  [4]
    RET                                          [1]

.org 0x20898E

swp_20898E:
    ADDW      (wUnitSP),0xA                      [6]
    RET                                          [1]

.org 0x208995

swp_208995:
    ADDW      (wUnitSP),0x14                     [6]
    RET                                          [1]

.org 0x20899C

swp_20899C:
    ADDW      (wUnitSP),0x1E                     [6]
    RET                                          [1]

.org 0x2089A3

swp_2089A3:
    ADDW      (wUnitRP),0xA                      [6]
    RET                                          [1]

.org 0x2089AA

swp_2089AA:
    ADDW      (wUnitRP),0x14                     [6]
    RET                                          [1]

.org 0x2089B1

swp_2089B1:
    ADDW      (wUnitRP),0x1E                     [6]
    RET                                          [1]

.org 0x2089B8

swp_2089B8:
    ADDW      (wUnitMP),0xA                      [6]
    RET                                          [1]

.org 0x2089BF

swp_2089BF:
    ADDW      (wUnitMP),0x14                     [6]
    RET                                          [1]

.org 0x2089C6

swp_2089C6:
    ADDW      (wUnitMP),0x1E                     [6]
    RET                                          [1]

.org 0x2089CD

sub_2089CD:
    CPB       (wAirbagActive),0                  [5]
    RET       Z                                  [2]
    SRL       1,WA                               [3]
    RET       NZ                                 [2]
    LD        WA,1                               [2]
    RET                                          [1]

.org 0x2089DC

sub_2089DC:
    PUSH      WA                                 [1]
    LD        A,(0x5D91)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x2089EB

swp_2089EB:
    LD        A,(0x5D92)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(wUnitMaxEP)                   [4]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x2089FA

swp_2089FA:
    PUSH      WA                                 [1]
    LD        A,(0x5D8A)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208A09

swp_208A09:
    PUSH      WA                                 [1]
    LD        A,(wPlayerSPBuff)                  [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208A18

swp_208A18:
    PUSH      WA                                 [1]
    LD        A,(wPlayerRPBuff)                  [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208A27

sub_208A27:
    PUSH      WA                                 [1]
    LD        A,(0x5D8D)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208A36

; WA = enemy exp -> exp x ExpLevelDiff % (rounded up)
ExpForKill:
    PUSH      WA                                 [1]
    LD        XWA,0                              [2]
    LD        A,(wPlayerLevel)                   [4]
    SUB       A,(wEnemyLevel)                    [4]
    CP        A,0xFB                             [3]
    JR        GE,.skip                           [2]
    LD        A,0xFB                             [2]
    JR        .skip2                             [2]
.skip:
    CP        A,5                                [2]
    JR        LE,.skip2                          [2]
    LD        A,5                                [2]
.skip2:
    NEG       A                                  [2]
    INC       5,A                                [2]
    ADD       XWA,ExpLevelDiff                   [6]
    LD        A,(XWA)                            [2]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    ADD       XWA,0x63                           [6]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208A6C

swp_208A6C:
    OR        WA,WA                              [2]
    RET       NZ                                 [2]
    LD        WA,1                               [2]
    RET                                          [1]

.org 0x208A82

swp_208A82:
    LD        A,(0x5DC2)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(wEnemyMaxEP)                  [4]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208A91

swp_208A91:
    PUSH      XHL                                [1]
    PUSH      WA                                 [1]
    LD        A,(wEnemyAPBuff)                   [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x208AA2

swp_208AA2:
    CPB       (wEnemyScaled),0                   [5]
    RET       Z                                  [2]
    PUSH      XHL                                [1]
    CALL      GetEnemyScaling                    [4]
    MUL       XWA,(XHL+4)                        [3]
    DIV       XWA,0x64                           [4]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x208AB7

swp_208AB7:
    PUSH      WA                                 [1]
    LD        A,(0x5DBB)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208AC6

swp_208AC6:
    PUSH      WA                                 [1]
    LD        A,(wEnemyRPBuff)                   [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208AD5

sub_208AD5:
    PUSH      WA                                 [1]
    LD        A,(0x5DBD)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208FBF

swp_208FBF:
    LD        WA,(wEnemyEP)                      [4]
    ADD       WA,(XIZ+TASK_ARG)                  [3]
    CP        WA,(wEnemyMaxEP)                   [4]
    JR        LE,.skip                           [2]
    LD        WA,(wEnemyMaxEP)                   [4]
    SUB       WA,(wEnemyEP)                      [4]
    JR        Z,.skip2                           [2]
    LD        (XIZ+TASK_ARG),WA                  [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wEnemyEP)              [5]
    LDW       (XIZ+TASK_FUNC),0x8FED             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wEnemyEP),WA                      [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
.skip2:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20900D

swp_20900D:
    LD        WA,(wEnemyEP)                      [4]
    CP        WA,(XIZ+TASK_ARG)                  [3]
    JR        PL,.skip                           [2]
    LD        (XIZ+TASK_ARG),WA                  [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wEnemyEP)              [5]
    LDW       (XIZ+TASK_FUNC),0x902D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    NEG       WA                                 [2]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wEnemyEP),WA                      [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20904F

swp_20904F:
    LDB       (0x584D),0                         [5]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+TASK_FUNC),0x906F             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    NEG       A                                  [2]
    ADD       A,0xC0                             [3]
    LD        (0x584B),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x209089

swp_209089:
    LDB       (0x584D),0                         [5]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+TASK_FUNC),0x90A9             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0xA0                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    NEG       A                                  [2]
    LD        (0x584B),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x2090C0

swp_2090C0:
    LDB       (0x584D),0                         [5]
    LDB       (XIZ+0x10),0                       [4]
    LDW       (XIZ+TASK_FUNC),0x90E0             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
.skip:
    LD        A,0xA0                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    ADD       A,0xC0                             [3]
    LD        (0x584B),A                         [4]
    INCB      1,(XIZ+0x10)                       [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,(XIZ+TASK_ARG)                   [3]
    JP        GT,EndTask                         [5]
    RET                                          [1]

.org 0x2090FE

swp_2090FE:
    LDB       (0x584D),0                         [5]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+TASK_FUNC),0x911E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    ADD       A,0x60                             [3]
    LD        (0x584B),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x209136

swp_209136:
    LDB       (0x584D),0                         [5]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+TASK_FUNC),0x9156             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x40                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    ADD       A,0xC0                             [3]
    LD        (0x584B),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x20916E

swp_20916E:
    LDB       (0x5855),0                         [5]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+TASK_FUNC),0x918E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    LD        (0x5853),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x2091A3

swp_2091A3:
    LDB       (0x5855),0                         [5]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+TASK_FUNC),0x91C3             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    NEG       A                                  [2]
    ADD       A,0x60                             [3]
    LD        (0x5853),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x2091DD

swp_2091DD:
    LDB       (0x5855),0                         [5]
    LDB       (XIZ+0x10),0                       [4]
    LDW       (XIZ+TASK_FUNC),0x91FD             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (wOptionAnimation),0               [5]
    JR        NZ,.skip                           [2]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (XIZ+0x10),A                       [3]
.skip:
    LD        A,0xA0                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+TASK_ARG)                  [3]
    NEG       A                                  [2]
    LD        (0x5853),A                         [4]
    INCB      1,(XIZ+0x10)                       [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,(XIZ+TASK_ARG)                   [3]
    JP        GT,EndTask                         [5]
    RET                                          [1]

.org 0x20921A

swp_20921A:
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    LD        (XIZ+TASK_ARG),XWA                 [3]
    LDW       (XIZ+TASK_FUNC),0x922D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        XWA,(XIZ+TASK_ARG)                 [3]
    LD        L,(wJoyPressed)                    [4]
    AND       L,0x30                             [3]
    JR        Z,.skip                            [2]
    LDB       (XWA+0x10),0                       [4]
.skip:
    LD        XHL,(XWA+8)                        [3]
    OR        XHL,XHL                            [2]
    RET       NZ                                 [2]
    LDW       (XIZ+TASK_FUNC),0x924F             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20924F

swp_20924F:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x209254

; [code] task: plays each effect id of the list at task +0x14 until FF
PlayEffectList:
    CPB       (wOptionAnimation),0               [5]
    JR        Z,.skip                            [2]
    LD        XBC,(XIY+0x14)                     [3]
    LD        A,(XBC+)                           [3]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        (XIY+0x14),XBC                     [3]
    LD        XHL,swp_2092D4                     [5]
    PUSH      A                                  [1]
    CALL      StartChildTask                     [4]
    POP       A                                  [1]
    LD        W,0                                [2]
    LD        (XHL+0x20),WA                      [3]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    LD        (XHL+0x1E),WA                      [3]
    task_wait
    JP        PlayEffectList                     [4]
.skip:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x2092FB

swp_2092FB:
    DECW      1,(XIZ+TASK_ARG)                   [3]
    JR        Z,.skip                            [2]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    RR        4,WA                               [3]
    SBC       A,A                                [2]
    AND       A,0x7F                             [3]
    LD        (wFadeLevel),A                     [4]
    RET                                          [1]
.skip:
    LDB       (wFadeLevel),0                     [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20931A

swp_20931A:
    DECW      1,(XIZ+TASK_ARG)                   [3]
    JR        Z,.skip                            [2]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    RR        4,WA                               [3]
    SBC       A,A                                [2]
    AND       A,0x7F                             [3]
    NEG       A                                  [2]
    LD        (wFadeLevel),A                     [4]
    RET                                          [1]
.skip:
    LDB       (wFadeLevel),0                     [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20933B

; [code+play] battle screen setup: enemy image, battle RAM reset, AddLevelGapChances, PlayMusic (every encounter screen)
BattleStart:
    LD        XHL,swp_208BA1                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CALL      sub_2072CD                         [4]
    CALL      sub_2067E1                         [4]
    CALL      sub_206847                         [4]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x584F),0                         [5]
    LDB       (0x5851),0x60                      [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x5857),0                         [5]
    LDB       (0x5859),0x68                      [5]
    LDB       (0x5A76),0x61                      [5]
    LD        A,0                                [2]
    LD        C,0x14                             [2]
    LD        E,5                                [2]
    LD        HL,0x120                           [3]
    CALL      dyn_207494                         [4]
    LD        C,0                                [2]
    LD        E,0x1A                             [2]
    CALL      0x2074C4                           [4]
    LD        A,1                                [2]
    LD        C,0x14                             [2]
    LD        E,2                                [2]
    LD        HL,0x156                           [3]
    CALL      OpenTextBoxNoWait                  [4]
    LD        C,6                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x2095E3                       [5]
    CALL      0x2076F7                           [4]
    LD        C,6                                [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x2095E3                       [5]
    CALL      0x2076F7                           [4]
    LD        C,0                                [2]
    LD        E,0x18                             [2]
    CALL      0x2074C4                           [4]
    LD        WA,0x15B                           [3]
    LD        XHL,0x2C8557                       [5]
    CALL      LoadRawTiles                       [4]
    LD        WA,0x16F                           [3]
    LD        XHL,0x2C8557                       [5]
    CALL      LoadRawTiles                       [4]
    LD        WA,0x164                           [3]
    LD        XHL,0x2C8545                       [5]
    CALL      LoadRawTiles                       [4]
    LD        WA,0x178                           [3]
    LD        XHL,0x2C8545                       [5]
    CALL      LoadRawTiles                       [4]
    LD        WA,0x15F                           [3]
    LD        XHL,0x2C8501                       [5]
    CALL      LoadRawTiles                       [4]
    LD        WA,0x173                           [3]
    LD        XHL,0x2C8523                       [5]
    CALL      LoadRawTiles                       [4]
    LD        XHL,Pal_2C82CE                     [5]
    LD        A,0x1D                             [2]
    LD        C,2                                [2]
    CALL      LoadPalettes                       [4]
    LD        WA,0x1B56                          [3]
    LD        BC,0                               [2]
    LD        DE,0x18                            [3]
    LD        QB,0x14                            [4]
    LD        QD,1                               [3]
    CALL      swp_206C7B                         [4]
    LD        WA,0x3F5B                          [3]
    LD        BC,5                               [2]
    LD        DE,0x18                            [3]
    LD        QB,4                               [3]
    LD        QD,1                               [3]
    CALL      swp_206C7B                         [4]
    LD        WA,0x3F61                          [3]
    LD        BC,0xB                             [3]
    LD        DE,0x18                            [3]
    LD        QB,4                               [3]
    LD        QD,1                               [3]
    CALL      swp_206C7B                         [4]
    LD        WA,0x1D6A                          [3]
    LD        BC,0                               [2]
    LD        DE,0x19                            [3]
    LD        QB,0x14                            [4]
    LD        QD,1                               [3]
    CALL      swp_206C7B                         [4]
    LD        WA,0x3F6F                          [3]
    LD        BC,5                               [2]
    LD        DE,0x19                            [3]
    LD        QB,4                               [3]
    LD        QD,1                               [3]
    CALL      swp_206C7B                         [4]
    LD        WA,0x3F75                          [3]
    LD        BC,0xB                             [3]
    LD        DE,0x19                            [3]
    LD        QB,4                               [3]
    LD        QD,1                               [3]
    CALL      swp_206C7B                         [4]
    LD        WA,0xC                             [3]
    LD        BC,0                               [2]
    LD        DE,1                               [2]
    CALL      sub_207E77                         [4]
    LD        WA,0x90                            [3]
    LD        BC,0                               [2]
    LD        DE,0x20                            [3]
    CALL      LoadEnemyImage                     [4]
    LDW       (wUnitEP),(wUnitMaxEP)             [6]
    LD        A,0                                [2]
    LD        (wCritChance),A                    [4]
    LD        (wFleeChance),A                    [4]
    LDB       (0x5D91),0x64                      [5]
    LDB       (0x5D92),0x1E                      [5]
    LD        (wStatusChance),A                  [4]
    LD        (wStatusParalyzed),A               [4]
    LD        (wStatusEPLeak),A                  [4]
    LD        (wStatusConfused),A                [4]
    LD        (0x5D97),A                         [4]
    LD        (0x5D98),A                         [4]
    LD        (0x5D99),A                         [4]
    LD        (0x5D9A),A                         [4]
    LD        (0x5D9B),A                         [4]
    LD        (0x5D9C),A                         [4]
    LD        (0x5D9D),A                         [4]
    LD        (0x5D9E),A                         [4]
    LD        (wAirbagActive),A                  [4]
    LD        (wFullChargeActive),A              [4]
    LD        (wRecvrActive),A                   [4]
    LDW       (wEnemyHP),(wEnemyMaxHP)           [6]
    LDW       (wEnemyEP),(wEnemyMaxEP)           [6]
    LD        (wEnemyCritChance),A               [4]
    LD        (0x5DBF),A                         [4]
    LDB       (wEnemyEPCostBuff),0x64            [5]
    LDB       (0x5DC2),0x1E                      [5]
    LD        (wEnemyStatusChance),A             [4]
    LD        (wEnemyParalyzed),A                [4]
    LD        (wEnemyRusted),A                   [4]
    LD        (wEnemyEPLeak),A                   [4]
    LD        (wEnemyConfused),A                 [4]
    LD        (0x5DC7),A                         [4]
    LD        (0x5DC8),A                         [4]
    LD        (0x5DC9),A                         [4]
    LD        (0x5DCA),A                         [4]
    LD        (0x5DCB),A                         [4]
    LD        (0x5DCC),A                         [4]
    LD        (0x5DCD),A                         [4]
    LD        (0x5DCE),A                         [4]
    LD        (0x5DCF),A                         [4]
    LD        (0x5DD8),A                         [4]
    LD        (wTimeStopTurns),A                 [4]
    LDB       (0x5DD9),0xFF                      [5]
    CALL      swp_207A27                         [4]
    CALL      AddLevelGapChances                 [4]
    LD        XHL,loc_208CB6                     [5]
    CALL      sub_2062F5                         [4]
    LD        (XIZ+0x2C),HL                      [3]
    LD        E,(wEnemyId)                       [4]
    CP        E,0x59                             [3]
    LD        WA,0xA                             [3]
    LD        BC,0x2A                            [3]
    JR        C,.skip2                           [2]
    CP        E,0x61                             [3]
    JR        C,.skip                            [2]
    LD        WA,0xD                             [3]
    LD        BC,0x2D                            [3]
    JR        Z,.skip2                           [2]
    CP        E,0x76                             [3]
    LD        WA,0xB                             [3]
    LD        BC,0x2B                            [3]
    JR        C,.skip2                           [2]
.skip:
    LD        WA,0xC                             [3]
    LD        BC,0x2C                            [3]
.skip2:
    PUSH      BC                                 [1]
    CALL      PlayMusic                          [4]
    POP       WA                                 [1]
    CALL      SoundCommand                       [4]
    LD        XHL,swp_208B74                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    LDW       (XIZ+TASK_FUNC),0x95E6             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
    .db 0x64, 0x64, 0xFF, 0x43, 0x6E, 0x91, 0x20, 0x00, 0x1D, 0x24, 0x63, 0x20, 0xBB, 0x0E, 0x00, 0x0F

.org 0x2095F3
    task_wait
    LD        XHL,0x22544C                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_2091A3                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0x9647             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x209647

; [code] battle tiles, palettes, status icon maps
DrawBattleScreen:
    CALR      0x20CE3F                           [3]
    LDW       (wAttackEPCost),0                  [6]
    LDW       (wEnemyAttackEPCost),0             [6]
    LD        XHL,Pal_2C82AE                     [5]
    LD        A,0x11                             [2]
    LD        C,4                                [2]
    CALL      LoadPalettes                       [4]
    LD        WA,0x1CC                           [3]
    LD        XHL,Gfx_2C8306                     [5]
    CALL      LoadCompressedTiles                [4]
    CALL      CalcEnemyMinAttackEP               [4]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,swp_209089                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0x14                     [4]
    task_wait
    LD        A,3                                [2]
    LD        C,4                                [2]
    LD        E,1                                [2]
    LD        HL,0x180                           [3]
    CALL      OpenTextBoxNoWait                  [4]
    LD        C,1                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        C,(wPlayerLevel)                   [4]
    LD        B,0                                [2]
    CALL      sub_207CF0                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,BattleCommandMenu              [5]
    CALL      0x2076F7                           [4]
    LD        C,6                                [2]
    LD        E,0x38                             [2]
    CALL      0x2074C4                           [4]
    CPB       (wStatusParalyzed),0               [5]
    JR        Z,.skip                            [2]
    LD        WA,0x1CC                           [3]
    LD        BC,0xC                             [3]
    LD        DE,9                               [3]
    LD        XHL,Map_2C82DE                     [5]
    CALL      DrawTilemap                        [4]
.skip:
    CPB       (wStatusRust),0                    [5]
    JR        Z,.skip2                           [2]
    LD        WA,0x1CC                           [3]
    LD        BC,0xE                             [3]
    LD        DE,9                               [3]
    LD        XHL,Map_2C82FC                     [5]
    CALL      DrawTilemap                        [4]
.skip2:
    CPB       (wStatusEPLeak),0                  [5]
    JR        Z,.skip3                           [2]
    LD        WA,0x1CC                           [3]
    LD        BC,0x10                            [3]
    LD        DE,9                               [3]
    LD        XHL,Map_2C82F2                     [5]
    CALL      DrawTilemap                        [4]
.skip3:
    CPB       (wStatusConfused),0                [5]
    JR        Z,.skip4                           [2]
    LD        WA,0x1CC                           [3]
    LD        BC,0x12                            [3]
    LD        DE,9                               [3]
    LD        XHL,Map_2C82E8                     [5]
    CALL      DrawTilemap                        [4]
.skip4:
    LDW       (wBattleChoice),0                  [6]
    LDB       (0x5DE0),0                         [5]
    LDW       (XIZ+TASK_FUNC),0x974E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20974E

; pick a slot by chance, or the default attack if EP is short
EnemyChooseAttack:
    LD        WA,(wEnemyMinAttackEP)             [4]
    CP        (wEnemyEP),WA                      [4]
    LD        XHL,0x22540B                       [5]
    JR        C,.skip                            [2]
    LD        L,(wEnemyId)                       [4]
    CALL      GetEnemyAttackSlots                [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
.loop:
    LD        B,(XHL+7)                          [3]
    CALR      swp_20984D                         [3]
    CP        B,0x64                             [3]
    JR        Z,.skip                            [2]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    SUB       WA,BC                              [2]
    JR        C,.skip                            [2]
    ADD       XHL,0xF                            [6]
    JR        .loop                              [2]
.skip:
    LD        A,(XHL+3)                          [3]
    CP        A,0xB                              [3]
    LD        W,(0x5DD3)                         [4]
    JR        Z,.skip2                           [2]
    CP        A,0xC                              [3]
    LD        W,(0x5DD4)                         [4]
    JR        Z,.skip2                           [2]
    LD        WA,(XHL+4)                         [3]
    JR        .skip3                             [2]
.skip2:
    PUSH      XHL                                [1]
    LD        L,W                                [2]
    CALL      GetArmRecord                       [4]
    LD        WA,(XHL+PART_EP_COST)              [3]
    POP       XHL                                [1]
.skip3:
    CP        (wEnemyEP),WA                      [4]
    JR        NC,.skip4                          [2]
    LD        XHL,0x22540B                       [5]
.skip4:
    LD        (wEnemyAttackSlot),XHL             [4]
    LD        XHL,0x225462                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,2                                [2]
    LD        C,8                                [2]
    LD        E,9                                [2]
    LD        HL,0x194                           [3]
    CALL      dyn_207494                         [4]
    LD        XHL,AttackItemChargeText           [5]
    CALL      ExpandMessage                      [4]
    CALL      0x2076F7                           [4]
    CPB       (wEnemyId),0x76                    [5]
    JR        NZ,.skip5                          [2]
    LD        HL,EVENT_STAGE_ENDING              [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip5                          [2]
    LD        HL,EVENT_STAGE_WON_RANK_X          [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip5                          [2]
    JR        .skip6                             [2]
.skip5:
    CPB       (0x5DDA),0                         [5]
    LD        XHL,QuitText                       [5]
    JR        Z,.skip7                           [2]
.skip6:
    LD        XHL,FleeText                       [5]
.skip7:
    CALL      ExpandMessage                      [4]
    CALL      0x2076F7                           [4]
    LD        C,2                                [2]
    LD        E,0x2D                             [2]
    CALL      0x2074C4                           [4]
    LDB       (0x5853),0xB0                      [5]
    LDB       (0x5855),0x68                      [5]
    LDW       (XIZ+TASK_FUNC),0x9872             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20984D

swp_20984D:
    CP        B,0x65                             [3]
    RET       C                                  [2]
    JR        Z,.skip                            [2]
    LD        B,0                                [2]
    RET                                          [1]
.skip:
    LD        B,0                                [2]
    CPB       (0x5DD8),0                         [5]
    RET       NZ                                 [2]
    LD        BC,(wEnemyMaxHP)                   [4]
    SRL       1,BC                               [3]
    CP        (wEnemyHP),BC                      [4]
    LD        B,0                                [2]
    RET       NC                                 [2]
    LD        B,0x64                             [2]
    RET                                          [1]

.org 0x209872

swp_209872:
    BIT       4,(wFrameCounter)                  [4]
    JR        Z,.skip                            [2]
    LD        E,(0x5DE0)                         [4]
    LD        D,0                                [2]
    SLL       4,DE                               [3]
    INC       4,DE                               [2]
    LD        BC,0x60                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
.skip:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_UP,A                         [3]
    JR        NZ,.skip2                          [2]
    BIT       1,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip4                          [2]
    RET                                          [1]
.skip2:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,(0x5DE0)                         [4]
    DEC       1,A                                [2]
    AND       A,3                                [3]
    LD        (0x5DE0),A                         [4]
    RET                                          [1]
.skip3:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,(0x5DE0)                         [4]
    INC       1,A                                [2]
    AND       A,3                                [3]
    LD        (0x5DE0),A                         [4]
    RET                                          [1]
.skip4:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        XHL,0                              [2]
    LD        L,(0x5DE0)                         [4]
    SLL       2,XHL                              [3]
    ADD       XHL,0x2098FF                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
    .db 0x52, 0x99, 0x20, 0x00, 0x8B, 0x9B, 0x20, 0x00, 0x0F, 0x99, 0x20, 0x00, 0x01, 0x9E, 0x20, 0x00

.org 0x20990F

; [code] "EP at max"
ShowEPAtMax:
    LD        WA,(wUnitEP)                       [4]
    CP        WA,(wUnitMaxEP)                    [4]
    JR        C,.skip                            [2]
    LD        XHL,EPAtMaxText                    [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0x974E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LDW       (XIZ+TASK_FUNC),0x9E01             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20994F

; [code+play] battle_command_menu; ShowWeaponInfo
BattleCommandMenu:
    PUSH      IX                                 [1]
    LD        IZ,0x21FF                          [3]
    PUSH      SR                                 [1]
    LD        C,8                                [2]
    LD        E,9                                [2]
    LD        HL,0x194                           [3]
    CALL      dyn_207494                         [4]
    LD        XHL,TText                          [5]
    CALL      ExpandMessage                      [4]
    CALL      0x2076F7                           [4]
    LD        XHL,0x225446                       [5]
    CALL      ExpandMessage                      [4]
    LDB       (XWA+6),0                          [4]
    LDB       (XWA+7),2                          [4]
    CALL      0x2076F7                           [4]
    LD        XHL,0x225448                       [5]
    CALL      ExpandMessage                      [4]
    LDB       (XWA+6),0                          [4]
    LDB       (XWA+7),4                          [4]
    CALL      0x2076F7                           [4]
    LD        XHL,0x22544A                       [5]
    CALL      ExpandMessage                      [4]
    LDB       (XWA+6),0                          [4]
    LDB       (XWA+7),6                          [4]
    CALL      0x2076F7                           [4]
    LD        C,2                                [2]
    LD        E,0x2D                             [2]
    CALL      0x2074C4                           [4]
    CALR      ShowWeaponInfo                     [3]
    LDW       (XIZ+TASK_FUNC),0x99C1             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
    .db 0xF1, 0x06, 0x50, 0xCC, 0x66, 0x19, 0xD1, 0xE1, 0x5D, 0x22, 0xDA, 0xEE, 0x04, 0xDA, 0x64, 0x31
    .db 0x60, 0x00, 0x30, 0x04, 0x3E, 0xC7, 0xE7, 0xA9, 0xC7, 0xEB, 0xAA, 0x1D, 0xFF, 0x6B, 0x20, 0xC1
    .db 0xDF, 0x5C, 0x21, 0xC9, 0x33

.org 0x2099E6

swp_2099E6:
    NOP                                          [1]
    JR        NZ,.skip                           [2]
    BIT       1,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip5                          [2]
    BIT       5,A                                [3]
    JRL       NZ,loc_209AE0                      [3]
    RET                                          [1]
.skip:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        WA,(wBattleChoice)                 [4]
    DEC       1,WA                               [2]
    AND       WA,3                               [4]
.loop:
    LD        (wBattleChoice),WA                 [4]
    CP        WA,2                               [2]
    JRL       C,ShowWeaponInfo                   [3]
    JR        Z,.skip2                           [2]
    CPB       (wSkill2),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        WA,2                               [2]
    JR        .loop                              [2]
.skip2:
    CPB       (wSkill1),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        WA,1                               [2]
    JR        .loop                              [2]
.skip3:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        WA,(wBattleChoice)                 [4]
    INC       1,WA                               [2]
    AND       WA,3                               [4]
.loop2:
    LD        (wBattleChoice),WA                 [4]
    CP        WA,2                               [2]
    JRL       C,ShowWeaponInfo                   [3]
    JR        Z,.skip4                           [2]
    CPB       (wSkill2),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        A,0                                [2]
    JR        .loop2                             [2]
.skip4:
    CPB       (wSkill1),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        WA,3                               [2]
    JR        .loop2                             [2]
.skip5:
    LD        XHL,wCommandEPCosts                [5]
    LD        WA,(wBattleChoice)                 [4]
    SLL       1,WA                               [3]
    LD        WA,(XHL+WA)                        [5]
    CP        (wUnitEP),WA                       [4]
    JR        C,.skip6                           [2]
    LD        (wAttackEPCost),WA                 [4]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    LDW       (XIZ+TASK_FUNC),0x9E01             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip6:
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+TASK_FUNC),0x9AB5             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x209AB5

; [code]
ShowNotEnoughEP:
    LD        XHL,NotEnoughEPText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0x9952             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x209AE0

loc_209AE0:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    LDW       (XIZ+TASK_FUNC),0x974E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x209B02

; [code] arm / skill record and description in battle
ShowWeaponInfo:
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    CPW       (wBattleChoice),1                  [6]
    LD        L,(wEquipRightArm)                 [4]
    JR        C,.skip2                           [2]
    LD        L,(wEquipLeftArm)                  [4]
    JR        Z,.skip2                           [2]
    CPW       (wBattleChoice),3                  [6]
    LD        L,(wSkill1)                        [4]
    JR        C,.skip                            [2]
    LD        L,(wSkill2)                        [4]
.skip:
    PUSH      L                                  [2]
    CALL      GetSkillRecord                     [4]
    LD        WA,(XHL+0xE)                       [3]
    POP       L                                  [2]
    CALL      GetSkillDesc                       [4]
    JR        .skip3                             [2]
.skip2:
    PUSH      L                                  [2]
    CALL      GetArmRecord                       [4]
    LD        WA,(XHL+PART_AFFINITY)             [3]
    POP       L                                  [2]
    CALL      GetArmDesc                         [4]
.skip3:
    PUSH      WA                                 [1]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,wCommandEPCosts                [5]
    LD        WA,(wBattleChoice)                 [4]
    SLL       1,WA                               [3]
    LD        WA,(XHL+WA)                        [5]
    LD        (XIZ+0x14),WA                      [3]
    LD        XHL,0x225474                       [5]
    CALL      ExpandMessage                      [4]
    LD        A,0                                [2]
    CALL      dyn_2076F3                         [4]
    POP       WA                                 [1]
    OR        WA,WA                              [2]
    RET       Z                                  [2]
    PUSH      WA                                 [1]
    LD        A,0                                [2]
    LD        C,0x11                             [2]
    LD        E,2                                [2]
    CALL      sub_20768A                         [4]
    POP       HL                                 [1]
    CALL      GetAffinityIcon                    [4]
    CALL      DrawTextChar                       [4]
    RET                                          [1]

.org 0x209B8B

swp_209B8B:
    LD        A,2                                [2]
    LD        C,0xA                              [2]
    LD        E,9                                [2]
    LD        HL,0x194                           [3]
    CALL      dyn_207494                         [4]
    CALR      sub_209D2F                         [3]
    LD        C,0                                [2]
    LD        E,0x2D                             [2]
    CALL      0x2074C4                           [4]
    LDB       (0x5853),0xB0                      [5]
    LDB       (0x5855),0x68                      [5]
    LDW       (wBattleChoice),0                  [6]
    CALR      sub_209CCE                         [3]
    CALR      sub_209CDC                         [3]
    LDW       (XIZ+TASK_FUNC),0x9BC4             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x209BC4

swp_209BC4:
    CALR      sub_209CCE                         [3]
    BIT       4,(wFrameCounter)                  [4]
    JR        Z,.skip                            [2]
    SLL       3,DE                               [3]
    INC       4,DE                               [2]
    LD        BC,0x50                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
.skip:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_UP,A                         [3]
    JR        NZ,.skip2                          [2]
    BIT       1,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       2,A                                [3]
    JR        NZ,.skip4                          [2]
    BIT       3,A                                [3]
    JR        NZ,.skip6                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip8                          [2]
    BIT       5,A                                [3]
    JRL       NZ,.skip11                         [3]
    RET                                          [1]
.skip2:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    CALR      sub_209CCE                         [3]
    DEC       1,DE                               [2]
    OR        DE,DE                              [2]
    JRL       PL,sub_209CDC                      [3]
    LD        DE,5                               [2]
    JRL       sub_209CDC                         [3]
.skip3:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    CALR      sub_209CCE                         [3]
    INC       1,DE                               [2]
    CP        DE,6                               [2]
    JRL       C,sub_209CDC                       [3]
    LD        DE,0                               [2]
    JRL       sub_209CDC                         [3]
.skip4:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALR      sub_209CCE                         [3]
    DEC       1,WA                               [2]
    OR        WA,WA                              [2]
    JR        PL,.skip5                          [2]
    LD        WA,2                               [2]
.skip5:
    CALR      sub_209CDC                         [3]
    JRL       sub_209D2F                         [3]
.skip6:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALR      sub_209CCE                         [3]
    INC       1,WA                               [2]
    CP        WA,3                               [2]
    JR        C,.skip7                           [2]
    LD        WA,0                               [2]
.skip7:
    CALR      sub_209CDC                         [3]
    JRL       sub_209D2F                         [3]
.skip8:
    LD        WA,(wBattleChoice)                 [4]
    CP        WA,0xE                             [4]
    JR        NC,.skip9                          [2]
    ADD       WA,0x26                            [4]
    CALL      0x2061D6                           [4]
    OR        A,A                                [2]
    JR        NZ,.skip10                         [2]
.skip9:
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    RET                                          [1]
.skip10:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    ADDW      (wBattleChoice),0x26               [6]
    LDW       (XIZ+TASK_FUNC),0x9E01             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip11:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LDW       (wBattleChoice),0                  [6]
    LDW       (XIZ+TASK_FUNC),0x974E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x209CCE

sub_209CCE:
    LD        WA,(wBattleChoice)                 [4]
    EXTZ      XWA                                [2]
    DIV       XWA,6                              [4]
    LD        DE,QWA                             [3]
    RET                                          [1]

.org 0x209CDC

sub_209CDC:
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    ADD       WA,DE                              [2]
    LD        (wBattleChoice),WA                 [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    LD        WA,(wBattleChoice)                 [4]
    CP        WA,0xE                             [4]
    RET       NC                                 [2]
    ADD       WA,0x26                            [4]
    PUSH      WA                                 [1]
    CALL      0x2061D6                           [4]
    POP       HL                                 [1]
    RET       C                                  [2]
    CALL      GetItemDesc                        [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,wCommandEPCosts                [5]
    LD        WA,(wBattleChoice)                 [4]
    SLL       1,WA                               [3]
    LD        WA,(XHL+WA)                        [5]
    LD        (XIZ+0x14),WA                      [3]
    LD        XHL,0x225492                       [5]
    CALL      ExpandMessage                      [4]
    LD        A,0                                [2]
    CALL      dyn_2076F3                         [4]
    RET                                          [1]

.org 0x209D2F

sub_209D2F:
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        C,5                                [2]
    LD        E,6                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DEF                       [5]
    CALL      0x2076F7                           [4]
    LD        C,2                                [2]
    LD        E,6                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        BC,(wBattleChoice)                 [4]
    EXTZ      XBC                                [2]
    DIV       XBC,6                              [4]
    PUSH      BC                                 [1]
    INC       1,BC                               [2]
    CALL      sub_207CF0                         [4]
    LD        C,2                                [2]
    LD        E,6                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DF3                       [5]
    CALL      0x2076F7                           [4]
    POP       BC                                 [1]
    MUL       XBC,6                              [4]
    LD        B,0                                [2]
.loop:
    PUSH      BC                                 [1]
    PUSH      XWA                                [1]
    LD        A,(XSP+4)                          [3]
    ADD       A,0x26                             [3]
    EXTZ      WA                                 [2]
    CALL      0x2061D6                           [4]
    LD        C,A                                [2]
    LD        B,0                                [2]
    POP       XWA                                [1]
    JR        NC,.skip                           [2]
    LD        C,0                                [2]
    LD        E,(XSP+1)                          [3]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DF8                       [5]
    CALL      0x2076F7                           [4]
    JR        .skip2                             [2]
.skip:
    PUSH      BC                                 [1]
    LD        C,5                                [2]
    LD        E,(XSP+3)                          [3]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    POP       BC                                 [1]
    CALL      sub_207CF0                         [4]
    LD        C,0                                [2]
    LD        E,(XSP+1)                          [3]
    CALL      0x20768E                           [4]
    LD        L,(XSP+0)                          [3]
    ADD       L,0x26                             [3]
    CALL      GetItemName                        [4]
    CALL      0x2076F7                           [4]
    LD        C,6                                [2]
    LD        E,(XSP+1)                          [3]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DF6                       [5]
    CALL      0x2076F7                           [4]
.skip2:
    POP       BC                                 [1]
    INC       1,C                                [2]
    CP        C,0xE                              [3]
    JR        NC,.done                           [2]
    INC       1,B                                [2]
    CP        B,6                                [2]
    JR        C,.loop                            [2]
.done:
    RET                                          [1]
    .db 0x5B, 0x41, 0x44, 0xFF, 0x00, 0x41, 0xFF, 0x69, 0xFF, 0x59, 0x59, 0x59, 0x59, 0x59, 0x59, 0x59
    .db 0x59, 0xFF

.org 0x209E01

swp_209E01:
    LD        A,3                                [2]
    CALL      dyn_207598                         [4]
    LD        WA,0                               [2]
    LD        C,0xC                              [2]
    LD        E,9                                [2]
    LD        B,8                                [2]
    LD        D,2                                [2]
    CALL      dyn_206768                         [4]
    LDB       (0x5DE3),0                         [5]
    CPB       (0x5DDA),0                         [5]
    JR        NZ,.skip                           [2]
    CPB       (0x5DE0),3                         [5]
    JR        NZ,.skip                           [2]
    LD        XHL,swp_209E45                     [5]
    JR        .skip2                             [2]
.skip:
    CALL      swp_20815F                         [4]
    OR        WA,WA                              [2]
    LD        XHL,swp_209E45                     [5]
    JR        PL,.skip2                          [2]
    LD        XHL,EnemyTurn                      [5]
.skip2:
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]

.org 0x209E45

swp_209E45:
    CALR      0x20CE3F                           [3]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    CPB       (0x5DE3),0                         [5]
    LD        XHL,swp_20904F                     [5]
    JR        NZ,.skip                           [2]
    LD        XHL,swp_209136                     [5]
.skip:
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LD        XHL,0                              [2]
    LD        L,(0x5DE0)                         [4]
    SLL       2,HL                               [3]
    ADD       XHL,0x209E8E                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
    .db 0x9E, 0x9E, 0x20, 0x00, 0xD6, 0xA1, 0x20, 0x00, 0x6A, 0xA2, 0x20, 0x00, 0x08, 0xA3, 0x20, 0x00

.org 0x209E9E

; [code] Not enough EP / Confused / You can't attack
CheckCanAttack:
    CPB       (wStatusParalyzed),0               [5]
    JR        NZ,.skip2                          [2]
    LD        WA,(wAttackEPCost)                 [4]
    CP        (wUnitEP),WA                       [4]
    JR        NC,.skip                           [2]
    LD        XHL,NotEnoughEPText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wAttackEPCost),0                  [6]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    CPB       (wStatusConfused),0                [5]
    JR        Z,.skip2                           [2]
    LD        XHL,YoureConfusedText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip2:
    LD        XHL,0                              [2]
    CPW       (wBattleChoice),1                  [6]
    LD        L,(wEquipRightArm)                 [4]
    JRL       C,loc_209FB1                       [3]
    LD        L,(wEquipLeftArm)                  [4]
    JRL       Z,loc_209FB1                       [3]
    CPW       (wBattleChoice),3                  [6]
    LD        L,(wSkill1)                        [4]
    JR        C,.skip3                           [2]
    LD        L,(wSkill2)                        [4]
.skip3:
    PUSH      L                                  [2]
    CALL      GetSkillData                       [4]
    LD        (XIZ+0x14),XHL                     [3]
    POP       L                                  [2]
    CALL      GetSkillRecord                     [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XWA,0                              [2]
    LD        A,(XHL+0x10)                       [3]
    CP        A,0xFF                             [3]
    JR        Z,loc_209FC3                       [2]
    CP        A,5                                [2]
    JR        C,loc_209FC3                       [2]
    LD        XHL,0                              [2]
    LD        HL,(wBattleChoice)                 [4]
    SLL       2,HL                               [3]
    ADD       XHL,0x225BD2                       [6]
    LD        XHL,(XHL)                          [2]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+0x10)                       [3]
    SUB       A,5                                [3]
    LD        W,0                                [2]
    SLL       2,WA                               [3]
    EXTZ      XWA                                [2]
    ADD       XWA,SkillEffects                   [6]
    LD        XWA,(XWA)                          [2]
    LD        (XIZ+TASK_FUNC),XWA                [3]
    RET                                          [1]

.org 0x209F95
SkillEffects:
    .db 0x47, 0xAA, 0x20, 0x00, 0x2E, 0xAB, 0x20, 0x00, 0x29, 0xAC, 0x20, 0x00, 0xCB, 0xAC, 0x20, 0x00
    .db 0x38, 0xAD, 0x20, 0x00, 0xC4, 0xAD, 0x20, 0x00, 0x4F, 0xAE, 0x20, 0x00

.org 0x209FB1

loc_209FB1:
    PUSH      L                                  [2]
    CALL      GetArmEffects                      [4]
    LD        (XIZ+0x14),XHL                     [3]
    POP       L                                  [2]
    CALL      GetArmRecord                       [4]
    LD        (XIZ+0x10),XHL                     [3]

.org 0x209FC3

loc_209FC3:
    CPB       (wStatusParalyzed),0               [5]
    JR        Z,PlayerAttack                     [2]
    LD        XHL,YouCantAttackText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wAttackEPCost),0                  [6]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x209FFB

; [code] HitMargin, then DamageRoll (damage.txt: about 0.4 x (attack - defence) + 8) x affinity, x2 crit (play)
PlayerAttack:
    LD        XHL,0                              [2]
    LD        HL,(wBattleChoice)                 [4]
    SLL       2,HL                               [3]
    ADD       XHL,0x225BD2                       [6]
    LD        XHL,(XHL)                          [2]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    CPB       (wStatusConfused),0                [5]
    JRL       NZ,.skip3                          [3]
    LD        WA,(wUnitRP)                       [4]
    CALL      swp_208A18                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wEnemyRP)                      [4]
    CALL      swp_208AC6                         [4]
    LD        DE,WA                              [2]
    LD        A,(wPlayerLevel)                   [4]
    LD        W,(wEnemyLevel)                    [4]
    CALL      HitMargin                          [4]
    LD        (wPlayerHitMargin),W               [4]
    LD        WA,(XHL+4)                         [3]
    ADD       WA,(wUnitAP)                       [4]
    CALL      swp_2089FA                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wEnemySP)                      [4]
    CALL      swp_208AB7                         [4]
    LD        DE,WA                              [2]
    LD        A,(wPlayerLevel)                   [4]
    LD        W,(wEnemyLevel)                    [4]
    CALL      DamageRoll                         [4]
    LD        BC,(XHL+0xE)                       [3]
    LD        DE,(wEnemyAffinity)                [4]
    CALL      ApplyAffinity                      [4]
    CALL      swp_208A6C                         [4]
    LD        (wPlayerDamage),WA                 [4]
    LD        B,(wCritChance)                    [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    SCC       C,A                                [2]
    LD        (wCritHit),A                       [4]
    LDB       (wInflictStatus),0xFF              [5]
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+0x10)                       [3]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LDB       (wInflictStatus),0                 [5]
    LD        B,(wStatusChance)                  [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        NC,.skip                           [2]
    LD        A,(XHL+0x10)                       [3]
    LD        (wInflictStatus),A                 [4]
.skip:
    LD        XHL,(XIZ+0x14)                     [3]
    LD        A,(XHL+)                           [3]
    LD        (XIZ+0x14),XHL                     [3]
    CP        A,1                                [2]
    LD        XHL,PlayerHitResult1               [5]
    JR        C,.skip2                           [2]
    LD        XHL,PlayerHitResult2               [5]
    JR        Z,.skip2                           [2]
    LD        XHL,PlayerHitResult3               [5]
.skip2:
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
.skip3:
    LD        WA,(wUnitRP)                       [4]
    CALL      swp_208A18                         [4]
    LD        BC,WA                              [2]
    LD        DE,WA                              [2]
    LD        A,(wPlayerLevel)                   [4]
    LD{1}     W,A                                [2]
    CALL      HitMargin                          [4]
    LD        (wPlayerHitMargin),W               [4]
    LD        WA,(XHL+4)                         [3]
    ADD       WA,(wUnitAP)                       [4]
    CALL      swp_2089FA                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wUnitSP)                       [4]
    CALL      swp_208A09                         [4]
    LD        DE,WA                              [2]
    LD        A,(wPlayerLevel)                   [4]
    LD{1}     W,A                                [2]
    CALL      DamageRoll                         [4]
    LD        BC,(XHL+0xE)                       [3]
    LD        DE,(wUnitAffinity)                 [4]
    CALL      ApplyAffinity                      [4]
    CALL      sub_2089CD                         [4]
    INC       3,WA                               [2]
    SRL       2,WA                               [3]
    LD        (wPlayerDamage),WA                 [4]
    LD        B,(wCritChance)                    [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    SCC       C,A                                [2]
    LD        (wCritHit),A                       [4]
    LDB       (wInflictStatus),0xFF              [5]
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+0x10)                       [3]
    OR        A,A                                [2]
    JR        Z,.skip4                           [2]
    CP        A,0xFF                             [3]
    JR        Z,.skip4                           [2]
    LDB       (wInflictStatus),0                 [5]
    LD        B,(wStatusChance)                  [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        NC,.skip4                          [2]
    LD        A,(XHL+0x10)                       [3]
    LD        (wInflictStatus),A                 [4]
.skip4:
    LD        XHL,(XIZ+0x14)                     [3]
    LD        A,(XHL+)                           [3]
    CP        A,1                                [2]
    LD        W,0                                [2]
    JR        C,.skip5                           [2]
    LD        W,2                                [2]
    JR        Z,.skip5                           [2]
    LD        W,0                                [2]
.skip5:
    LDA       XHL,XHL+W                          [5]
    LD        (XIZ+0x14),XHL                     [3]
    LDW       (XIZ+TASK_FUNC),0xA8BD             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20A1D6

; [code] "You used <item>"
BattleUseItem:
    LD        WA,(wBattleChoice)                 [4]
    CALL      RemoveItem                         [4]
    LD        L,(wBattleChoice)                  [4]
    CALL      GetItemName                        [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,YouUsedText                    [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        L,(wBattleChoice)                  [4]
    CALL      GetBattleItemEffect                [4]
    LD        (XIZ+0x14),XHL                     [3]
    LDW       (wAttackEPCost),0                  [6]
    LD        XHL,0                              [2]
    LD        L,(wBattleChoice)                  [4]
    SUB       L,0x26                             [3]
    SLL       2,HL                               [3]
    ADD       XHL,0x20A232                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
    .db 0xDA, 0xAE, 0x20, 0x00, 0xEA, 0xAE, 0x20, 0x00, 0xFA, 0xAE, 0x20, 0x00, 0x0A, 0xAF, 0x20, 0x00
    .db 0x1A, 0xAF, 0x20, 0x00, 0xFC, 0xAF, 0x20, 0x00, 0x5D, 0xB0, 0x20, 0x00, 0xB1, 0xB0, 0x20, 0x00
    .db 0x05, 0xB1, 0x20, 0x00, 0x59, 0xB1, 0x20, 0x00, 0xAD, 0xB1, 0x20, 0x00, 0x15, 0xB2, 0x20, 0x00
    .db 0x7D, 0xB2, 0x20, 0x00, 0xE5, 0xB2, 0x20, 0x00

.org 0x20A26A

swp_20A26A:
    LD        XHL,YouRechargedYourEnergyText     [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,0x225414                       [5]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    CALL      swp_2089EB                         [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        HL,WA                              [2]
    CALR      sub_20CE00                         [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E9F                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (wAttackEPCost),0                  [6]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20A308

; [code] You fled / But it chases you (event flags, Random)
TryFlee:
    CPB       (wEnemyId),0x76                    [5]
    JR        NZ,.skip                           [2]
    LD        HL,EVENT_STAGE_ENDING              [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip                           [2]
    LD        HL,EVENT_STAGE_WON_RANK_X          [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip                           [2]
    JR        .skip2                             [2]
.skip:
    CPB       (0x5DDA),0                         [5]
    JR        Z,.skip3                           [2]
    CPB       (wEnemyParalyzed),0                [5]
    JR        NZ,.skip3                          [2]
    LD        XHL,YouFledText                    [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        B,(wFleeChance)                    [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        C,.skip3                           [2]
.skip2:
    LD        XHL,ButChasesYouText               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wAttackEPCost),0                  [6]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip3:
    LDW       (XIZ+TASK_FUNC),0xCD32             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20A3A7

; [code] You missed / Critical hit / can't damage / takes damage (variant 1 of 4)
PlayerHitResult1:
    LD        XHL,swp_2090C0                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,swp_20904F                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    CPB       (wPlayerHitMargin),0               [5]
    JR        PL,.skip                           [2]
    LD        XHL,YouMissedText                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    LD        XHL,swp_208C4C                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C60                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wPlayerDamage)                 [4]
    SLL       1,WA                               [3]
    LD        (wPlayerDamage),WA                 [4]
    LD        XHL,CriticalHitText2               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wPlayerDamage),0                  [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,YouCantDamageText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,TakesDamageText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F7D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wInflictStatus),0xFF              [5]
    JR        Z,.skip5                           [2]
    CPW       (wEnemyHP),0                       [6]
    JR        Z,.skip5                           [2]
    LD        A,(wInflictStatus)                 [4]
    SLL       2,A                                [3]
    LD        XHL,StatusInflictedTexts           [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wInflictStatus)                 [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5DC2                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20A55D

; [code] (variant 2)
PlayerHitResult2:
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,swp_209296                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,swp_209296                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    CPB       (wPlayerHitMargin),0               [5]
    JR        PL,.skip                           [2]
    LD        XHL,YouMissedText                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    LD        XHL,swp_208C4C                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C60                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wPlayerDamage)                 [4]
    SLL       1,WA                               [3]
    LD        (wPlayerDamage),WA                 [4]
    LD        XHL,CriticalHitText2               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wPlayerDamage),0                  [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,YouCantDamageText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,TakesDamageText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F7D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wInflictStatus),0xFF              [5]
    JR        Z,.skip5                           [2]
    CPW       (wEnemyHP),0                       [6]
    JR        Z,.skip5                           [2]
    LD        A,(wInflictStatus)                 [4]
    SLL       2,A                                [3]
    LD        XHL,StatusInflictedTexts           [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wInflictStatus)                 [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5DC2                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20A733

; [code] (variant 3)
PlayerHitResult3:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    CPB       (wPlayerHitMargin),0               [5]
    JR        PL,.skip                           [2]
    LD        XHL,YouMissedText                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    LD        XHL,swp_208C4C                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C60                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wPlayerDamage)                 [4]
    SLL       1,WA                               [3]
    LD        (wPlayerDamage),WA                 [4]
    LD        XHL,CriticalHitText2               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wPlayerDamage),0                  [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,YouCantDamageText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,TakesDamageText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F7D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wInflictStatus),0xFF              [5]
    JR        Z,.skip5                           [2]
    CPW       (wEnemyHP),0                       [6]
    JR        Z,.skip5                           [2]
    LD        A,(wInflictStatus)                 [4]
    SLL       2,A                                [3]
    LD        XHL,StatusInflictedTexts           [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wInflictStatus)                 [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5DC2                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20A8BD

; [code] You dodged / Critical hit / took no damage / takes damage (variant 1 of 4)
EnemyHitResult1:
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    CPB       (wPlayerHitMargin),0               [5]
    JR        PL,.skip                           [2]
    LD        XHL,YouDodgedTheAttackText         [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    LD        XHL,swp_208C24                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C38                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wCritHit),0                       [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wPlayerDamage)                 [4]
    SLL       1,WA                               [3]
    LD        (wPlayerDamage),WA                 [4]
    LD        XHL,CriticalHitText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wPlayerDamage),0                  [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,YouTookNoDamageText            [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,PlayerTakesDamageText          [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E5D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wPlayerDamage)                 [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wInflictStatus),0xFF              [5]
    JR        Z,.skip5                           [2]
    CPW       (wUnitHP),0                        [6]
    JR        Z,.skip5                           [2]
    LD        A,(wInflictStatus)                 [4]
    SLL       2,A                                [3]
    LD        XHL,0x225BAA                       [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wInflictStatus)                 [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5D92                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AA47

; [code] AP/SP/RP/MP went up
ShowStatUp:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    LD        (0x5D97),A                         [4]
    LD        XHL,APWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip:
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+6)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip2                           [2]
    LD        (0x5D98),A                         [4]
    LD        XHL,SPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip2:
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+8)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip3                           [2]
    LD        (0x5D99),A                         [4]
    LD        XHL,RPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+0xA)                        [3]
    OR        A,A                                [2]
    JR        Z,.skip4                           [2]
    LD        (0x5D9A),A                         [4]
    LD        XHL,MPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip4:
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AB2E

; [code] effect 6: "... went down" messages
ShowStatDown:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    LD        (0x5DCC),A                         [4]
    LD        XHL,APWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip:
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+6)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip2                           [2]
    LD        (0x5DCD),A                         [4]
    LD        XHL,SPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip2:
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+8)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip3                           [2]
    LD        (0x5DCE),A                         [4]
    LD        XHL,RPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+0xA)                        [3]
    OR        A,A                                [2]
    JR        Z,.skip4                           [2]
    LD        (0x5DCF),A                         [4]
    LD        XHL,MPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip4:
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AC29

; [code] effect 7: "Your HP are fully restored" / status returned to normal
ShowFullHeal:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,YourHPAreFullyText             [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,loc_208E0F                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x270F                   [5]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LD        XHL,YourStatusReturnedToText       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,0                                [2]
    LD        (wStatusParalyzed),A               [4]
    LD        (wStatusRust),A                    [4]
    LD        (wStatusEPLeak),A                  [4]
    LD        (wStatusConfused),A                [4]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20ACCB

; [code] effect 8: "Time stopped! Can't move" (August)
SkillTimeStop:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,TimeStoppedCantMoveText        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    LD        (wTimeStopTurns),A                 [4]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AD38

; [code] effect 9: "Recvr activated!! Auto-recover at 0 HP!!" (Aqua); once per battle
SkillRecvr:
    CPB       (wRecvrActive),0                   [5]
    JR        Z,.skip                            [2]
    LD        XHL,NoEffectText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,RecvrActivatedAutoRecoverText  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    INCB      1,(wRecvrActive)                   [4]
    RET       NZ                                 [2]
    LDB       (wRecvrActive),0xFF                [5]
    RET                                          [1]

.org 0x20ADC4

; [code] effect 10: "Airbag activated! Damage is halved!" (Vapor); turns = skill s04
SkillAirbag:
    CPB       (wAirbagActive),0                  [5]
    JR        Z,.skip                            [2]
    LD        XHL,NoEffectText3                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,AirbagActivatedDamageIsText    [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    LD        (wAirbagActive),A                  [4]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AE4F

; [code] effect 11: "Fully charged!! EP costs reduced to 0!!" (Breath); turns = skill s04
SkillFullCharge:
    CPB       (wFullChargeActive),0              [5]
    JR        Z,.skip                            [2]
    LD        XHL,NoEffectText2                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,FullyChargedEPCostsText        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    LD        (wFullChargeActive),A              [4]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AEDA

swp_20AEDA:
    LDW       (XIZ+0x10),0x1E                    [5]
    LDW       (XIZ+TASK_FUNC),0xAF8A             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AEEA

swp_20AEEA:
    LDW       (XIZ+0x10),0x32                    [5]
    LDW       (XIZ+TASK_FUNC),0xAF8A             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AEFA

swp_20AEFA:
    LDW       (XIZ+0x10),0x64                    [5]
    LDW       (XIZ+TASK_FUNC),0xAF8A             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AF0A

swp_20AF0A:
    LDW       (XIZ+0x10),0x96                    [5]
    LDW       (XIZ+TASK_FUNC),0xAF8A             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AF1A

swp_20AF1A:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,YourHPAreFullyText             [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,loc_208E0F                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x270F                   [5]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AF8A

swp_20AF8A:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        HL,(XIZ+0x10)                      [3]
    CALR      ShowHPGain                         [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,loc_208E0F                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20AFFC

; [code] "Your status returned to normal"
ShowStatusCured:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,YourStatusReturnedToText       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,0                                [2]
    LD        (wStatusParalyzed),A               [4]
    LD        (wStatusRust),A                    [4]
    LD        (wStatusEPLeak),A                  [4]
    LD        (wStatusConfused),A                [4]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B05D

swp_20B05D:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,APWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9B),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B0B1

swp_20B0B1:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,SPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9C),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B105

swp_20B105:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,RPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9D),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B159

swp_20B159:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,MPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9E),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B1AD

swp_20B1AD:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,APWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DC8),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B215

swp_20B215:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,SPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DC9),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B27D

swp_20B27D:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,RPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DCA),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B2E5

swp_20B2E5:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,MPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DCB),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xB34D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B34D

swp_20B34D:
    CPB       (wStatusParalyzed),0               [5]
    JR        Z,.loop                            [2]
    LD        A,(wStatusParalyzed)               [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip                           [2]
    LDB       (wStatusParalyzed),0               [5]
    JR        .loop                              [2]
.skip:
    CPB       (wStatusParalyzed),0x95            [5]
    JR        NC,.loop                           [2]
    INCB      1,(wStatusParalyzed)               [4]
.loop:
    CPB       (wStatusConfused),0                [5]
    JR        Z,.skip3                           [2]
    LD        A,(wStatusConfused)                [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip2                          [2]
    LDB       (wStatusConfused),0                [5]
    JR        .loop                              [2]
.skip2:
    CPB       (wStatusConfused),0x95             [5]
    JR        NC,.skip3                          [2]
    INCB      1,(wStatusConfused)                [4]
.skip3:
    CPB       (0x5D97),0                         [5]
    JR        Z,.skip4                           [2]
    DECB      1,(0x5D97)                         [4]
.skip4:
    CPB       (0x5D98),0                         [5]
    JR        Z,.skip5                           [2]
    DECB      1,(0x5D98)                         [4]
.skip5:
    CPB       (0x5D99),0                         [5]
    JR        Z,.skip6                           [2]
    DECB      1,(0x5D99)                         [4]
.skip6:
    CPB       (0x5D9A),0                         [5]
    JR        Z,.skip7                           [2]
    DECB      1,(0x5D9A)                         [4]
.skip7:
    CPB       (0x5D9B),0                         [5]
    JR        Z,.skip8                           [2]
    DECB      1,(0x5D9B)                         [4]
.skip8:
    CPB       (0x5D9C),0                         [5]
    JR        Z,.skip9                           [2]
    DECB      1,(0x5D9C)                         [4]
.skip9:
    CPB       (0x5D9D),0                         [5]
    JR        Z,.skip10                          [2]
    DECB      1,(0x5D9D)                         [4]
.skip10:
    CPB       (0x5D9E),0                         [5]
    JR        Z,.skip11                          [2]
    DECB      1,(0x5D9E)                         [4]
.skip11:
    LD        XHL,swp_208EED                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wAttackEPCost)                 [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPW       (wEnemyHP),0                       [6]
    JR        Z,.skip12                          [2]
    CPW       (wUnitHP),0                        [6]
    JR        NZ,.skip13                         [2]
.skip12:
    LDW       (XIZ+TASK_FUNC),0xC604             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip13:
    CPB       (0x5DE3),0                         [5]
    LD        XHL,BattleStatusEffects            [5]
    JR        NZ,.skip14                         [2]
    INCB      1,(0x5DE3)                         [4]
    LD        XHL,EnemyTurn                      [5]
.skip14:
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]

.org 0x20B440

; [code] A = status byte -> C if the status wears off (StatusRecovery[turns])
RollStatusRecovery:
    AND       A,0x7F                             [3]
    LD        L,A                                [2]
    CALL      GetStatusRecovery                  [4]
    LD{1}     H,L                                [2]
    LD        L,0                                [2]
    ADD       HL,0x63                            [4]
    EXTZ      XHL                                [2]
    DIV       XHL,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,HL                              [2]
    RET                                          [1]

.org 0x20B460

; [code] enemy's turn: "can't attack" while wTimeStopTurns, else EP check and attack
EnemyTurn:
    CALR      0x20CE3F                           [3]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,swp_20916E                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    CPB       (wTimeStopTurns),0                 [5]
    JR        Z,.skip                            [2]
    LD        XHL,CantAttackText2                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wEnemyAttackEPCost),0             [6]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        WA,(XHL+SLOT_EP)                   [3]
    CALL      swp_208A73                         [4]
    LD        (wEnemyAttackEPCost),WA            [4]
    LD        XWA,0                              [2]
    LD        A,(XHL+3)                          [3]
    INC       1,A                                [2]
    SLL       2,WA                               [3]
    ADD       XWA,0x20B4E5                       [6]
    LD        XWA,(XWA)                          [2]
    LD        (XIZ+TASK_FUNC),XWA                [3]
    RET                                          [1]
    .db 0x21, 0xB5, 0x20, 0x00, 0x21, 0xB5, 0x20, 0x00, 0x21, 0xB5, 0x20, 0x00, 0x21, 0xB5, 0x20, 0x00
    .db 0x21, 0xB5, 0x20, 0x00, 0x21, 0xB5, 0x20, 0x00, 0xB1, 0xC0, 0x20, 0x00, 0x21, 0xC1, 0x20, 0x00
    .db 0xA5, 0xC1, 0x20, 0x00, 0xE3, 0xC1, 0x20, 0x00, 0x74, 0xC2, 0x20, 0x00, 0x60, 0xC3, 0x20, 0x00
    .db 0xAF, 0xB7, 0x20, 0x00, 0x26, 0xB8, 0x20, 0x00, 0x12, 0xC4, 0x20, 0x00

.org 0x20B521

; [code] enemy: Can't attack / Not enough EP / Is confused
EnemyCheckCanAttack:
    CPB       (wEnemyParalyzed),0                [5]
    JR        Z,.skip                            [2]
    LD        XHL,CantAttackText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wEnemyAttackEPCost),0             [6]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,(wEnemyAttackSlot)             [4]
    CPW       (wEnemyEP),0                       [6]
    JR        Z,.skip2                           [2]
    LD        WA,(wEnemyAttackEPCost)            [4]
    CP        (wEnemyEP),WA                      [4]
    JR        NC,.skip3                          [2]
.skip2:
    LD        XHL,NotEnoughEPText2               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wEnemyAttackEPCost),0             [6]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip3:
    CPB       (wEnemyConfused),0                 [5]
    JR        Z,EnemyAttack                      [2]
    LD        XHL,IsConfusedText2                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait

.org 0x20B5C7

EnemyAttack:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (wEnemyConfused),0                 [5]
    JRL       NZ,.skip3                          [3]
    LD        WA,(wEnemyRP)                      [4]
    CALL      swp_208AC6                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wUnitRP)                       [4]
    CALL      swp_208A18                         [4]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD        W,(wPlayerLevel)                   [4]
    CALL      HitMargin                          [4]
    LD        (wEnemyHitMargin),W                [4]
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        WA,(XHL+SLOT_POWER)                [3]
    CALL      swp_208AA2                         [4]
    ADD       WA,(wEnemyAP)                      [4]
    CALL      swp_208A91                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wUnitSP)                       [4]
    CALL      swp_208A09                         [4]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD        W,(wPlayerLevel)                   [4]
    CALL      DamageRoll                         [4]
    LD        C,(XHL+6)                          [3]
    LD        B,0                                [2]
    LD        DE,(wUnitAffinity)                 [4]
    CALL      ApplyAffinity                      [4]
    CALL      sub_2089CD                         [4]
    LD        (wEnemyDamage),WA                  [4]
    LD        B,(wEnemyCritChance)               [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    SCC       C,A                                [2]
    LD        (wEnemyCritHit),A                  [4]
    LDB       (wEnemyAttackStatus),0xFF          [5]
    LD        A,(XHL+3)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LDB       (wEnemyAttackStatus),0             [5]
    LD        B,(wEnemyStatusChance)             [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        NC,.skip                           [2]
    LD        A,(XHL+3)                          [3]
    LD        (wEnemyAttackStatus),A             [4]
.skip:
    LD        A,(XHL+8)                          [3]
    LDA       XHL,XHL+9                          [3]
    LD        (XIZ+0x14),XHL                     [3]
    CP        A,1                                [2]
    LD        XHL,EnemyHitResult2                [5]
    JR        C,.skip2                           [2]
    LD        XHL,EnemyHitResult3                [5]
    JR        Z,.skip2                           [2]
    LD        XHL,EnemyHitResult4                [5]
.skip2:
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
.skip3:
    LD        WA,(wEnemyRP)                      [4]
    CALL      swp_208AC6                         [4]
    LD        BC,WA                              [2]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD{1}     W,A                                [2]
    CALL      HitMargin                          [4]
    LD        (wEnemyHitMargin),W                [4]
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        WA,(XHL+SLOT_POWER)                [3]
    CALL      swp_208AA2                         [4]
    ADD       WA,(wEnemyAP)                      [4]
    CALL      swp_208A91                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wEnemySP)                      [4]
    CALL      swp_208AB7                         [4]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD{1}     W,A                                [2]
    CALL      DamageRoll                         [4]
    LD        C,(XHL+6)                          [3]
    LD        B,0                                [2]
    LD        DE,(wEnemyAffinity)                [4]
    CALL      ApplyAffinity                      [4]
    CALL      swp_208A6C                         [4]
    INC       3,WA                               [2]
    SRL       2,WA                               [3]
    LD        (wEnemyDamage),WA                  [4]
    LD        B,(wEnemyCritChance)               [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    SCC       C,A                                [2]
    LD        (wEnemyCritHit),A                  [4]
    LDB       (wEnemyAttackStatus),0xFF          [5]
    LD        A,(XHL+3)                          [3]
    OR        A,A                                [2]
    JR        Z,.skip4                           [2]
    CP        A,0xFF                             [3]
    JR        Z,.skip4                           [2]
    LDB       (wEnemyAttackStatus),0             [5]
    LD        B,(wEnemyStatusChance)             [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        NC,.skip4                          [2]
    LD        A,(XHL+3)                          [3]
    LD        (wEnemyAttackStatus),A             [4]
.skip4:
    LD        A,(XHL+8)                          [3]
    LDA       XHL,XHL+9                          [3]
    CP        A,1                                [2]
    LD        W,0                                [2]
    JR        C,.skip5                           [2]
    LD        W,2                                [2]
    JR        Z,.skip5                           [2]
    LD        W,0                                [2]
.skip5:
    LDA       XHL,XHL+W                          [5]
    LD        (XIZ+0x14),XHL                     [3]
    LDW       (XIZ+TASK_FUNC),0xBF27             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B7AF

; [code] "<arm> can't attack" (one per arm; which is which not read)
ArmCantAttack1:
    CPB       (wEnemyParalyzed),0                [5]
    JR        Z,.skip                            [2]
    LD        XHL,CantAttackText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wEnemyAttackEPCost),0             [6]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        L,(0x5DD3)                         [4]
    CALL      GetArmName                         [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        L,(0x5DD3)                         [4]
    LD        H,0                                [2]
    LD        (XIZ+0x10),HL                      [3]
    LDW       (XIZ+TASK_FUNC),0xB89D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B826

; [code]
ArmCantAttack2:
    CPB       (wEnemyParalyzed),0                [5]
    JR        Z,.skip                            [2]
    LD        XHL,CantAttackText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wEnemyAttackEPCost),0             [6]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        L,(0x5DD4)                         [4]
    CALL      GetArmName                         [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        L,(0x5DD4)                         [4]
    LD        H,0                                [2]
    LD        (XIZ+0x10),HL                      [3]
    LDW       (XIZ+TASK_FUNC),0xB89D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20B89D

; [code+play] enemy attack action 11/12: a robot enemy attacks with an arm (GetArmRecord, HitMargin, DamageRoll); Arena robots
EnemyArmAttack:
    LD        HL,(XIZ+0x10)                      [3]
    PUSH      HL                                 [1]
    CALL      GetArmEffects                      [4]
    LD        (XIZ+0x14),XHL                     [3]
    POP       HL                                 [1]
    CALL      GetArmRecord                       [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,(XIZ+0x10)                     [3]
    LD        WA,(XHL+0xC)                       [3]
    CALL      swp_208A73                         [4]
    LD        (wEnemyAttackEPCost),WA            [4]
    LD        B,(wEnemyCritChance)               [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    SCC       C,A                                [2]
    LD        (wEnemyCritHit),A                  [4]
    LDB       (wEnemyAttackStatus),0xFF          [5]
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+0x10)                       [3]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LDB       (wEnemyAttackStatus),0             [5]
    LD        B,(wEnemyStatusChance)             [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        NC,.skip                           [2]
    LD        A,(XHL+0x10)                       [3]
    LD        (wEnemyAttackStatus),A             [4]
.skip:
    CPB       (wEnemyConfused),0                 [5]
    JR        NZ,.skip3                          [2]
    LD        WA,(wEnemyRP)                      [4]
    CALL      swp_208AC6                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wUnitRP)                       [4]
    CALL      swp_208A18                         [4]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD        W,(wPlayerLevel)                   [4]
    CALL      HitMargin                          [4]
    LD        (wEnemyHitMargin),W                [4]
    LD        WA,(XHL+4)                         [3]
    ADD       WA,(wEnemyAP)                      [4]
    CALL      swp_208A91                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wUnitSP)                       [4]
    CALL      swp_208A09                         [4]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD        W,(wPlayerLevel)                   [4]
    CALL      DamageRoll                         [4]
    LD        BC,(XHL+0xE)                       [3]
    LD        DE,(wUnitAffinity)                 [4]
    CALL      ApplyAffinity                      [4]
    CALL      sub_2089CD                         [4]
    LD        (wEnemyDamage),WA                  [4]
    LD        XHL,(XIZ+0x14)                     [3]
    LD        A,(XHL+)                           [3]
    LD        (XIZ+0x14),XHL                     [3]
    CP        A,1                                [2]
    LD        XHL,EnemyHitResult2                [5]
    JR        C,.skip2                           [2]
    LD        XHL,EnemyHitResult3                [5]
    JR        Z,.skip2                           [2]
    LD        XHL,EnemyHitResult4                [5]
.skip2:
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
.skip3:
    LD        WA,(wEnemyRP)                      [4]
    CALL      swp_208AC6                         [4]
    LD        BC,WA                              [2]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD{1}     W,A                                [2]
    CALL      HitMargin                          [4]
    LD        (wEnemyHitMargin),W                [4]
    LD        WA,(XHL+4)                         [3]
    ADD       WA,(wEnemyAP)                      [4]
    CALL      swp_208A91                         [4]
    LD        BC,WA                              [2]
    LD        WA,(wEnemySP)                      [4]
    CALL      swp_208AB7                         [4]
    LD        DE,WA                              [2]
    LD        A,(wEnemyLevel)                    [4]
    LD{1}     W,A                                [2]
    CALL      DamageRoll                         [4]
    LD        BC,(XHL+0xE)                       [3]
    LD        DE,(wEnemyAffinity)                [4]
    CALL      ApplyAffinity                      [4]
    CALL      swp_208A6C                         [4]
    INC       3,WA                               [2]
    SRL       2,WA                               [3]
    LD        (wEnemyDamage),WA                  [4]
    LD        XHL,(XIZ+0x14)                     [3]
    LD        A,(XHL+)                           [3]
    CP        A,1                                [2]
    LD        W,0                                [2]
    JR        C,.skip4                           [2]
    LD        W,2                                [2]
    JR        Z,.skip4                           [2]
    LD        W,0                                [2]
.skip4:
    LDA       XHL,XHL+W                          [5]
    LD        (XIZ+0x14),XHL                     [3]
    LDW       (XIZ+TASK_FUNC),0xBF27             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20BA11

; [code] (variant 2)
EnemyHitResult2:
    LD        XHL,swp_2091DD                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,swp_20916E                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    CPB       (wEnemyHitMargin),0                [5]
    JR        PL,.skip                           [2]
    LD        XHL,YouDodgedTheAttackText         [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    LD        XHL,swp_208C24                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C38                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wEnemyDamage)                  [4]
    SLL       1,WA                               [3]
    LD        (wEnemyDamage),WA                  [4]
    LD        XHL,CriticalHitText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wEnemyDamage),0                   [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,YouTookNoDamageText            [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,PlayerTakesDamageText          [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E5D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wEnemyAttackStatus),0xFF          [5]
    JR        Z,.skip5                           [2]
    CPW       (wUnitHP),0                        [6]
    JR        Z,.skip5                           [2]
    LD        A,(wEnemyAttackStatus)             [4]
    SLL       2,A                                [3]
    LD        XHL,0x225BAA                       [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wEnemyAttackStatus)             [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5D92                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20BBC7

; [code] (variant 3)
EnemyHitResult3:
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,swp_209296                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,swp_209296                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    CPB       (wEnemyHitMargin),0                [5]
    JR        PL,.skip                           [2]
    LD        XHL,YouDodgedTheAttackText         [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    LD        XHL,swp_208C24                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C38                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wEnemyDamage)                  [4]
    SLL       1,WA                               [3]
    LD        (wEnemyDamage),WA                  [4]
    LD        XHL,CriticalHitText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wEnemyDamage),0                   [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,YouTookNoDamageText            [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,PlayerTakesDamageText          [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E5D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wEnemyAttackStatus),0xFF          [5]
    JR        Z,.skip5                           [2]
    CPW       (wUnitHP),0                        [6]
    JR        Z,.skip5                           [2]
    LD        A,(wEnemyAttackStatus)             [4]
    SLL       2,A                                [3]
    LD        XHL,0x225BAA                       [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wEnemyAttackStatus)             [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5D92                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20BD9D

; [code] (variant 4)
EnemyHitResult4:
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    CPB       (wEnemyHitMargin),0                [5]
    JR        PL,.skip                           [2]
    LD        XHL,YouDodgedTheAttackText         [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    LD        XHL,swp_208C24                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C38                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wEnemyDamage)                  [4]
    SLL       1,WA                               [3]
    LD        (wEnemyDamage),WA                  [4]
    LD        XHL,CriticalHitText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wEnemyDamage),0                   [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,YouTookNoDamageText            [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,PlayerTakesDamageText          [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E5D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wEnemyAttackStatus),0xFF          [5]
    JR        Z,.skip5                           [2]
    CPW       (wUnitHP),0                        [6]
    JR        Z,.skip5                           [2]
    LD        A,(wEnemyAttackStatus)             [4]
    SLL       2,A                                [3]
    LD        XHL,0x225BAA                       [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wEnemyAttackStatus)             [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5D92                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20BF27

; [code] (variant 4: "dodged the attack")
PlayerHitResult4:
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    CPB       (wEnemyHitMargin),0                [5]
    JR        PL,.skip                           [2]
    LD        XHL,DodgedTheAttackText            [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    LD        XHL,swp_208C4C                     [5]
    JR        Z,.skip2                           [2]
    LD        XHL,swp_208C60                     [5]
.skip2:
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0xF                      [5]
    task_wait
    CPB       (wEnemyCritHit),0                  [5]
    JR        Z,.skip3                           [2]
    LD        WA,(wEnemyDamage)                  [4]
    SLL       1,WA                               [3]
    LD        (wEnemyDamage),WA                  [4]
    LD        XHL,CriticalHitText2               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip3:
    CPW       (wEnemyDamage),0                   [6]
    JR        NZ,.skip4                          [2]
    LD        XHL,TookNoDamageText               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JRL       .skip5                             [3]
.skip4:
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,TakesDamageText2               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F7D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wEnemyDamage)                  [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPB       (wEnemyAttackStatus),0xFF          [5]
    JR        Z,.skip5                           [2]
    CPW       (wEnemyHP),0                       [6]
    JR        Z,.skip5                           [2]
    LD        A,(wEnemyAttackStatus)             [4]
    SLL       2,A                                [3]
    LD        XHL,StatusInflictedTexts           [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,(wEnemyAttackStatus)             [4]
    OR        A,A                                [2]
    JR        Z,.skip5                           [2]
    LD        XHL,0x5DC2                         [5]
    ORB       (XHL+A),0x80                       [6]
.skip5:
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C0B1

; [code] enemy action: "<ENEMY> fled!!", unless a roll >= wFleeChance: "But you are able to chase it!!"
EnemyFlee:
    LD        XHL,0x225992                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        B,(wFleeChance)                    [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        C,.skip                            [2]
    LD        XHL,ButYouAreAbleText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LDW       (XIZ+TASK_FUNC),0xC4B0             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C121

; [code] "<enemy>'s SP went up" via its attack
EnemyStatUpAttack:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(wEnemyAttackSlot)             [4]
    LDA       XHL,XHL+9                          [3]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    LD        XHL,SPWentUpText2                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DC7),5                         [5]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C1A5

swp_20C1A5:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+0x10),0x32                    [5]
    LDW       (XIZ+TASK_FUNC),0xC39E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C1E3

; [code] "<enemy>'s status returned to normal"
EnemyCureAttack:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(wEnemyAttackSlot)             [4]
    LDA       XHL,XHL+9                          [3]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    LD        XHL,SStatusReturnedToText          [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,0                                [2]
    LD        (wEnemyParalyzed),A                [4]
    LD        (wEnemyRusted),A                   [4]
    LD        (wEnemyEPLeak),A                   [4]
    LD        (wEnemyConfused),A                 [4]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C274

; [code] '<ENEMY>'s HP / EP are fully restored'
EnemyHealAttack:
    LDB       (0x5DD8),0xFF                      [5]
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(wEnemyAttackSlot)             [4]
    LDA       XHL,XHL+9                          [3]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    LD        XHL,SHPAreFullyText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F2F                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x270F                   [5]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LD        XHL,SEPAreFullyText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208FBF                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x270F                   [5]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (wEnemyAttackEPCost),0             [6]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C360

swp_20C360:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+0x10),0x64                    [5]
    LDW       (XIZ+TASK_FUNC),0xC39E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C39E

swp_20C39E:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LDA       XHL,XHL+9                          [3]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    LD        HL,(XIZ+0x10)                      [3]
    CALR      sub_20CE15                         [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F2F                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C412

; [code] "recharged its energy"
EnemyRecharge:
    LD        XHL,RechargedItsEnergyText         [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,0x225414                       [5]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    CALL      swp_208A82                         [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        HL,WA                              [2]
    CALR      ShowEnemyEPGain                    [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208FBF                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (wEnemyAttackEPCost),0             [6]
    LDW       (XIZ+TASK_FUNC),0xC4FB             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C4B0

swp_20C4B0:
    LD        XHL,swp_2091A3                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LD        XHL,0x2259BC                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_ARG),1                   [5]
    LDW       (XIZ+TASK_FUNC),0xCD89             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20C4FB

swp_20C4FB:
    CPB       (wEnemyParalyzed),0                [5]
    JR        Z,.loop                            [2]
    LD        A,(wEnemyParalyzed)                [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip                           [2]
    LDB       (wEnemyParalyzed),0                [5]
    JR        .loop                              [2]
.skip:
    CPB       (wEnemyParalyzed),0x95             [5]
    JR        NC,.loop                           [2]
    INCB      1,(wEnemyParalyzed)                [4]
.loop:
    CPB       (wEnemyConfused),0                 [5]
    JR        Z,.skip3                           [2]
    LD        A,(wEnemyConfused)                 [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip2                          [2]
    LDB       (wEnemyConfused),0                 [5]
    JR        .loop                              [2]
.skip2:
    CPB       (wEnemyConfused),0x95              [5]
    JR        NC,.skip3                          [2]
    INCB      1,(wEnemyConfused)                 [4]
.skip3:
    CPB       (0x5DC8),0                         [5]
    JR        Z,.skip4                           [2]
    DECB      1,(0x5DC8)                         [4]
.skip4:
    CPB       (0x5DCC),0                         [5]
    JR        Z,.skip5                           [2]
    DECB      1,(0x5DCC)                         [4]
.skip5:
    CPB       (0x5DC7),0                         [5]
    JR        Z,.skip6                           [2]
    DECB      1,(0x5DC7)                         [4]
.skip6:
    CPB       (0x5DC9),0                         [5]
    JR        Z,.skip7                           [2]
    DECB      1,(0x5DC9)                         [4]
.skip7:
    CPB       (0x5DCD),0                         [5]
    JR        Z,.skip8                           [2]
    DECB      1,(0x5DCD)                         [4]
.skip8:
    CPB       (0x5DCA),0                         [5]
    JR        Z,.skip9                           [2]
    DECB      1,(0x5DCA)                         [4]
.skip9:
    CPB       (0x5DCE),0                         [5]
    JR        Z,.skip10                          [2]
    DECB      1,(0x5DCE)                         [4]
.skip10:
    CPB       (0x5DCB),0                         [5]
    JR        Z,.skip11                          [2]
    DECB      1,(0x5DCB)                         [4]
.skip11:
    CPB       (0x5DCF),0                         [5]
    JR        Z,.skip12                          [2]
    DECB      1,(0x5DCF)                         [4]
.skip12:
    CPB       (wTimeStopTurns),0                 [5]
    JR        Z,.skip13                          [2]
    DECB      1,(wTimeStopTurns)                 [4]
.skip13:
    LD        XHL,swp_20900D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(wEnemyAttackEPCost)            [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPW       (wUnitHP),0                        [6]
    JR        Z,.skip14                          [2]
    CPW       (wEnemyHP),0                       [6]
    JR        NZ,.skip15                         [2]
.skip14:
    LDW       (XIZ+TASK_FUNC),0xC604             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip15:
    CPB       (0x5DE3),0                         [5]
    LD        XHL,BattleStatusEffects            [5]
    JR        NZ,.skip16                         [2]
    INCB      1,(0x5DE3)                         [4]
    LD        XHL,swp_209E45                     [5]
.skip16:
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]

.org 0x20C604

; [code] Rust/Paralyzed/EP leak/Confused messages, HP/EP changes
BattleStatusEffects:
    CPW       (wEnemyHP),0                       [6]
    JRL       Z,.skip17                          [3]
    CPW       (wUnitHP),0                        [6]
    JRL       Z,.skip                            [3]
    CPB       (wStatusRust),0                    [5]
    JRL       Z,.skip                            [3]
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,YoureTotallyRustedText         [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        WA,(wUnitMaxHP)                    [4]
    ADD       WA,0x13                            [4]
    EXTZ      XWA                                [2]
    DIV       XWA,0x14                           [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,PlayerTakesDamageText          [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E5D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
.skip:
    CPW       (wUnitHP),0                        [6]
    JRL       NZ,.skip5                          [3]
    CPB       (wRecvrActive),0                   [5]
    JR        NZ,.skip2                          [2]
    LD        XBC,wEquipAcc1                     [5]
    CPB       (XBC),ITEM_AUTORP                  [3]
    JR        Z,.skip3                           [2]
    LD        XBC,wEquipAcc2                     [5]
    CPB       (XBC),ITEM_AUTORP                  [3]
    JR        Z,.skip3                           [2]
    LDW       (XIZ+TASK_FUNC),0xCC9C             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip2:
    DECB      1,(wRecvrActive)                   [4]
    LDW       (XIZ+0x10),0x270F                  [5]
    JR        .skip4                             [2]
.skip3:
    LDB       (XBC),0                            [3]
    LD        WA,(wUnitMaxHP)                    [4]
    SRL       1,WA                               [3]
    LD        (XIZ+0x10),WA                      [3]
.skip4:
    LD        A,0                                [2]
    LD        (wStatusParalyzed),A               [4]
    LD        (wStatusRust),A                    [4]
    LD        (wStatusEPLeak),A                  [4]
    LD        (wStatusConfused),A                [4]
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,0x22541D                       [5]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        HL,(XIZ+0x10)                      [3]
    CALR      ShowHPGain                         [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,loc_208E0F                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    JRL       .skip11                            [3]
.skip5:
    CPB       (wStatusEPLeak),0                  [5]
    JRL       Z,.skip7                           [3]
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,YoureLeakingEnergyText2        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPW       (wUnitEP),0                        [6]
    JR        Z,.skip7                           [2]
    LD        WA,(wUnitMaxEP)                    [4]
    ADD       WA,0x13                            [4]
    EXTZ      XWA                                [2]
    DIV       XWA,0x14                           [4]
    CP        WA,(wUnitEP)                       [4]
    JR        C,.skip6                           [2]
    LD        WA,(wUnitEP)                       [4]
.skip6:
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,YouLostEPText                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208EED                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
.skip7:
    LD        WA,(wMinEPCost)                    [4]
    CP        (wUnitEP),WA                       [4]
    JR        NC,.skip9                          [2]
    LD        XBC,wEquipAcc1                     [5]
    CPB       (XBC),ITEM_PROPLR                  [3]
    JR        Z,.skip8                           [2]
    LD        XBC,wEquipAcc2                     [5]
    CPB       (XBC),ITEM_PROPLR                  [3]
    JR        Z,.skip8                           [2]
    JR        .skip9                             [2]
.skip8:
    LDB       (XBC),0                            [3]
    LD        XHL,0x225420                       [5]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,YourEPAreFullyText             [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E9F                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x270F                   [5]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
.skip9:
    CPB       (wStatusParalyzed),0               [5]
    JR        Z,.skip10                          [2]
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,YoureParalyzedText             [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip10:
    CPB       (wStatusConfused),0                [5]
    JR        Z,.skip11                          [2]
    LDB       (0x584B),0xC0                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,YoureConfusedText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip11:
    CPB       (wEnemyRusted),0                   [5]
    JRL       Z,.skip12                          [3]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,IsTotallyRustedText            [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        WA,(wEnemyHP)                      [4]
    ADD       WA,0x13                            [4]
    EXTZ      XWA                                [2]
    DIV       XWA,0x14                           [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,TakesDamageText                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F7D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
.skip12:
    CPW       (wEnemyHP),0                       [6]
    JRL       Z,.skip17                          [3]
    CPB       (wEnemyEPLeak),0                   [5]
    JRL       Z,.skip14                          [3]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,IsLeakingEnergyText2           [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPW       (wEnemyEP),0                       [6]
    JR        Z,.skip14                          [2]
    LD        WA,(wEnemyMaxEP)                   [4]
    ADD       WA,0x13                            [4]
    EXTZ      XWA                                [2]
    DIV       XWA,0x14                           [4]
    CP        WA,(wEnemyEP)                      [4]
    JR        C,.skip13                          [2]
    LD        WA,(wEnemyEP)                      [4]
.skip13:
    LD        (XIZ+0x10),WA                      [3]
    LD        XHL,LostEPText                     [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_20900D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
.skip14:
    CPB       (wEnemyParalyzed),0                [5]
    JR        Z,.skip15                          [2]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,IsParalyzedText2               [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip15:
    CPB       (wEnemyConfused),0                 [5]
    JR        Z,.skip16                          [2]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LD        XHL,IsConfusedText2                [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.skip16:
    LDW       (XIZ+TASK_FUNC),0x9647             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip17:
    LDW       (XIZ+TASK_FUNC),0xCAE0             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20CAE0

; [code] You win, EXP, GP, drop, level up
BattleVictory:
    LD        XHL,swp_208C60                     [5]
    CALL      sub_2062F5                         [4]
    LDW       (XHL+0xE),0xF                      [5]
    LD        XHL,0x22541A                       [5]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0xC                              [2]
    LD        D,0xC                              [2]
    CALL      swp_206781                         [4]
    LD        WA,0xF                             [3]
    CALL      PlayMusic                          [4]
    LD        WA,0x2F                            [3]
    CALL      SoundCommand                       [4]
    LD        XHL,YouWinText                     [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_ARG),0                   [5]
    LD        L,(wEnemyId)                       [4]
    CALL      GetEnemyRecord                     [4]
    LD        WA,(XHL+ENEMY_EXP)                 [3]
    CALL      ExpForKill                         [4]
    OR        WA,WA                              [2]
    JR        Z,.skip                            [2]
    LD        (XIZ+0x10),WA                      [3]
    SUB       (wExpToNext),WA                    [4]
    LD        XHL,YouGainEXPText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    INCW      1,(XIZ+TASK_ARG)                   [3]
.skip:
    CPB       (0x5DDA),0                         [5]
    JRL       Z,.skip6                           [3]
    LD        L,(wEnemyId)                       [4]
    CALL      GetEnemyRecord                     [4]
    LD        WA,(XHL+ENEMY_GP)                  [3]
    OR        WA,WA                              [2]
    JR        Z,.skip2                           [2]
    LD        (XIZ+0x10),WA                      [3]
    CALL      AddGP                              [4]
    LD        XHL,YouGotGPText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    INCW      1,(XIZ+TASK_ARG)                   [3]
.skip2:
    LD        L,(wEnemyId)                       [4]
    CALL      GetEnemyRecord                     [4]
    LD        B,(XHL+ENEMY_DROP_PCT)             [3]
    CP        B,0x64                             [3]
    JR        NC,.skip3                          [2]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        NC,.skip6                          [2]
.skip3:
    LD        WA,(XHL+0x16)                      [3]
    PUSH      WA                                 [1]
    CALL      AddItem                            [4]
    POP       HL                                 [1]
    JR        C,.skip6                           [2]
    OR        H,H                                [2]
    JR        Z,.skip4                           [2]
    CALL      GetPartName                        [4]
    JR        .skip5                             [2]
.skip4:
    CALL      GetItemName                        [4]
.skip5:
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,YouFoundText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    INCW      1,(XIZ+TASK_ARG)                   [3]
.skip6:
    CPW       (XIZ+TASK_ARG),0                   [5]
    JR        Z,.loop                            [2]
    LD        XHL,0x225A7A                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
.loop:
    CALL      TryLevelUp                         [4]
    JR        NC,.skip7                          [2]
    LD        WA,0xAC                            [3]
    CALL      SoundCommand                       [4]
    LD        XHL,YouGainedALevelText            [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JR        .loop                              [2]
.skip7:
    LDW       (XIZ+TASK_ARG),0                   [5]
    LDW       (XIZ+TASK_FUNC),0xCD89             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20CC9C

; [code] You lost / You are unable to move
BattleDefeat:
    LD        XHL,swp_208C38                     [5]
    CALL      sub_2062F5                         [4]
    LDW       (XHL+0xE),0xF                      [5]
    LD        XHL,0x22541A                       [5]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,1                                [2]
    LD        B,0xC                              [2]
    LD        D,0xB                              [2]
    CALL      swp_20677A                         [4]
    LD        WA,0x10                            [3]
    CALL      PlayMusic                          [4]
    LD        WA,0x30                            [3]
    CALL      SoundCommand                       [4]
    CPB       (0x5DDA),0                         [5]
    LD        XHL,YouLostText                    [5]
    JR        Z,.skip                            [2]
    LD        XHL,YouAreUnableToText             [5]
.skip:
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (wUnitHP),(wUnitMaxHP)             [6]
    LDW       (wUnitEP),(wUnitMaxEP)             [6]
    LDW       (XIZ+TASK_ARG),3                   [5]
    LDW       (XIZ+TASK_FUNC),0xCD89             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20CD32

swp_20CD32:
    LD        XHL,swp_2090FE                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    CPB       (0x5DDA),0                         [5]
    LD        XHL,YouGaveUpText                  [5]
    JR        Z,.skip                            [2]
    LD        XHL,0x22599D                       [5]
.skip:
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_ARG),2                   [5]
    LDW       (XIZ+TASK_FUNC),0xCD89             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20CD89

swp_20CD89:
    LD        A,0                                [2]
    LD        (wStatusParalyzed),A               [4]
    LD        (wStatusEPLeak),A                  [4]
    LD        (wStatusConfused),A                [4]
    LD        HL,(XIZ+0x2C)                      [3]
    EXTZ      XHL                                [2]
    SET       7,(XHL+7)                          [3]
    CALL      sub_2067E1                         [4]
    CALL      sub_206847                         [4]
    CALL      sub_2072CD                         [4]
    LD        A,0                                [2]
    LD        (0x5A76),A                         [4]
    LD        (0x584B),A                         [4]
    LD        (0x584D),A                         [4]
    LD        (0x584F),A                         [4]
    LD        (0x5851),A                         [4]
    LD        (0x5853),A                         [4]
    LD        (0x5855),A                         [4]
    LD        (0x5857),A                         [4]
    LD        (0x5859),A                         [4]
    LD        WA,0x7F                            [3]
    CALL      SoundCommand                       [4]
    LD        WA,0x8086                          [3]
    CALL      SoundCommand                       [4]
    LD        A,(XIZ+TASK_ARG)                   [3]
    LD        (0x5DD9),A                         [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20CDEB

; [code] HP fully restored / gained HP
ShowHPGain:
    ADD       HL,(wUnitHP)                       [4]
    CP        HL,(wUnitMaxHP)                    [4]
    LD        XHL,YourHPAreFullyText             [5]
    RET       NC                                 [2]
    LD        XHL,YouGainedHPText                [5]
    RET                                          [1]

.org 0x20CE00

sub_20CE00:
    ADD       HL,(wUnitEP)                       [4]
    CP        HL,(wUnitMaxEP)                    [4]
    LD        XHL,YourEPAreFullyText             [5]
    RET       NC                                 [2]
    LD        XHL,YouGainedEPText                [5]
    RET                                          [1]

.org 0x20CE15

sub_20CE15:
    ADD       HL,(wEnemyHP)                      [4]
    CP        HL,(wEnemyMaxHP)                   [4]
    LD        XHL,SHPAreFullyText                [5]
    RET       NC                                 [2]
    LD        XHL,GainedHPText                   [5]
    RET                                          [1]

.org 0x20CE2A

; [code] EP fully restored / gained EP
ShowEnemyEPGain:
    ADD       HL,(wEnemyEP)                      [4]
    CP        HL,(wEnemyMaxEP)                   [4]
    LD        XHL,SEPAreFullyText                [5]
    RET       NC                                 [2]
    LD        XHL,GainedEPText                   [5]
    RET                                          [1]

.org 0x210213

swp_210213:
    RET                                          [1]

.org 0x210214

; [code] effect id -> loads its tiles (0x180) and palette (14) from BattleEffects
PlayBattleEffect:
    LDW       (XIZ+0x1A),0                       [5]
    LD        HL,(XIZ+0x20)                      [3]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,0x226DCE                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+0x22),XHL                     [3]
    LD        HL,(XIZ+0x20)                      [3]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,BattleEffects                  [6]
    LD        XHL,(XHL)                          [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+TASK_ARG),XHL                 [3]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        WA,0x180                           [3]
    CALL      LoadCompressedTiles                [4]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        A,0xE                              [2]
    LD        C,1                                [2]
    CALL      LoadPalettes                       [4]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        A,0xE                              [2]
    LD        C,1                                [2]
    CALL      LoadMonoPalettes                   [4]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    LD        XHL,(XHL)                          [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    LD        (XIZ+0x16),WA                      [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x12),XHL                     [3]
    LDW       (XIZ+0x1C),0                       [5]
    LDW       (XIZ+0x18),0                       [5]
.loop:
    LD        XIY,(XIZ+0x12)                     [3]
    LD        WA,(XIZ+0x18)                      [3]
    INCW      1,(XIZ+0x18)                       [3]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    ADD       XIY,XWA                            [2]
    LD        A,(XIY+0)                          [3]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CPB       (XIZ+0x1C),0                       [4]
    JR        NZ,.skip                           [2]
    EXTZ      WA                                 [2]
    LD        (XIZ+0x1C),WA                      [3]
.skip:
    LD        C,(XIY+2)                          [3]
    EXTS      BC                                 [2]
    CPW       (XIZ+0x1E),0                       [5]
    JR        Z,.skip2                           [2]
    NEG       BC                                 [2]
.skip2:
    ADD       BC,0x50                            [4]
    LD        E,(XIY+3)                          [3]
    EXTS      DE                                 [2]
    ADD       DE,0x30                            [4]
    LD        A,(XIY+1)                          [3]
    CP        A,0xFF                             [3]
    JR        Z,.skip5                           [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,(XIZ+TASK_ARG)                 [3]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,(XHL+0)                          [3]
    EXTZ      WA                                 [2]
    SLL       2,WA                               [3]
    SUB       BC,WA                              [2]
    LD        A,(XHL+1)                          [3]
    EXTZ      WA                                 [2]
    SLL       2,WA                               [3]
    SUB       DE,WA                              [2]
    LD        WA,0x180                           [3]
    CPW       (XIZ+0x1E),0                       [5]
    JR        NZ,.skip3                          [2]
    CALL      dyn_2069C8                         [4]
    JR        .skip5                             [2]
.skip3:
    CPW       (XIZ+0x20),0x72                    [5]
    JR        Z,.skip4                           [2]
    CPW       (XIZ+0x20),0x73                    [5]
    JR        Z,.skip4                           [2]
    CPW       (XIZ+0x20),0xBE                    [5]
    JR        Z,.skip4                           [2]
    CPW       (XIZ+0x20),0xBF                    [5]
    JR        Z,.skip4                           [2]
    CALL      swp_206A7B                         [4]
    JR        .skip5                             [2]
.skip4:
    CALL      dyn_2069C8                         [4]
.skip5:
    LD        A,(XIY+0)                          [3]
    CP        A,0                                [2]
    JRL       Z,.loop                            [3]
    LD        XHL,(XIZ+0x22)                     [3]
    LD        A,(XHL)                            [2]
    EXTS      WA                                 [2]
    CP        WA,0xFFFF                          [4]
    JR        Z,.skip6                           [2]
    CP        (XIZ+0x1A),WA                      [3]
    JR        NZ,.skip6                          [2]
    LD        WA,(XHL+1)                         [3]
    CALL      SoundCommand                       [4]
    INC       3,XHL                              [2]
    LD        (XIZ+0x22),XHL                     [3]
.skip6:
    INCW      1,(XIZ+0x1A)                       [3]
    DECW      1,(XIZ+0x16)                       [3]
    DECW      1,(XIZ+0x1C)                       [3]
    JR        Z,.skip7                           [2]
    LDW       (XIZ+TASK_FUNC),0x281              [5]
    LDW       (XIZ+TASK_FUNC_HI),0x21            [5]
    RET                                          [1]
.skip7:
    CPW       (XIZ+0x16),0                       [5]
    JR        NZ,.skip8                          [2]
    CALL      EndTask                            [4]
    RET                                          [1]
.skip8:
    LD        WA,(XIZ+0x18)                      [3]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    ADD       (XIZ+0x12),XWA                     [3]
    LDW       (XIZ+TASK_FUNC),0x27C              [5]
    LDW       (XIZ+TASK_FUNC_HI),0x21            [5]
    RET                                          [1]

.org 0x210EE8

sub_210EE8:
    CALL      sub_212B32                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    CALR      sub_210EF9                         [3]
    LD        A,6                                [2]
    LD        (XIZ+0xF),A                        [3]
.done:
    RET                                          [1]

.org 0x210EF9

sub_210EF9:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      sub_212B66                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x210F06

sub_210F06:
    CALL      sub_212B80                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    CALL      sub_212BAB                         [4]
    LD        XHL,0                              [2]
    LD        W,(XIZ+0x10)                       [3]
    CP        W,5                                [2]
    JR        Z,.skip                            [2]
    LD        W,(XIZ+0x11)                       [3]
    JR        .skip2                             [2]
.skip:
    LD        W,8                                [2]
.skip2:
    LD        (wAreaLevel),W                     [4]
    CALL      LoadEnemy                          [4]
    LDB       (0x5DDA),1                         [5]
    CALL      swp_207C00                         [4]
    LD        A,7                                [2]
    LD        (XIZ+0xF),A                        [3]
.done:
    RET                                          [1]

.org 0x212B32

sub_212B32:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        A,(XIZ+0x2C)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2C),A                       [3]
    CP        A,0x40                             [3]
    JR        Z,.skip                            [2]
    SRL       1,A                                [3]
    AND       A,7                                [3]
    EXTZ      WA                                 [2]
    MUL{1}    WA,0x10                            [3]
    LD        (wFadeLevel),A                     [4]
    LD        A,1                                [2]
    JR        .skip2                             [2]
.skip:
    LD        A,0                                [2]
    LD        (wFadeLevel),A                     [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,0                                [2]
.skip2:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x212B66

sub_212B66:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        XHL,0x9800                         [5]
    LD        WA,0x10                            [3]
    CALL      swp_216D66                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x212BAB

sub_212BAB:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    SUB       A,1                                [3]
    MUL       XWA,7                              [4]
    LD        XDE,XWA                            [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x11)                       [3]
    SUB       A,1                                [3]
    ADD       XDE,XWA                            [2]
    LD        XHL,0x24998E                       [5]
    ADD       XHL,XDE                            [2]
    LD        B,(XHL)                            [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV       WA,B                               [2]
    LD        B,W                                [2]
    LD        XHL,0x2499AF                       [5]
    SLL       2,XDE                              [3]
    ADD       XHL,XDE                            [2]
    LD        XHL,(XHL)                          [2]
    LD        XWA,0                              [2]
    LD{1}     A,B                                [2]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21452D

sub_21452D:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2166B3                         [4]
    CALL      dyn_2166C9                         [4]
    LD        A,0x5E                             [2]
    CALR      sub_2132FC                         [3]
    LD        (XIZ+0x12),A                       [3]
    PUSH      XWA                                [1]
    LD        XWA,0                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x20                            [3]
    CALL      SoundCommand                       [4]
    POP       XWA                                [1]
    LD        A,3                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,0                                [2]
    LD        (XIZ+0x1F),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21455F

swp_21455F:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        BC,0x14                            [3]
    LD        A,(XHL+0)                          [3]
    EXTZ      WA                                 [2]
    SUB       BC,WA                              [2]
    SRA       1,BC                               [3]
    LD        DE,0x13                            [3]
    LD        A,(XHL+1)                          [3]
    EXTZ      WA                                 [2]
    SUB       DE,WA                              [2]
    SRA       1,DE                               [3]
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21457E

sub_21457E:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        C,6                                [2]
    LD        XHL,Pal_2C8772                     [5]
    CALL      LoadPalettes                       [4]
    LD        A,0x10                             [2]
    LD        C,6                                [2]
    LD        XHL,Pal_2C8772                     [5]
    CALL      LoadPalettes                       [4]
    LD        A,0x20                             [2]
    LD        C,6                                [2]
    LD        XHL,Pal_2C8772                     [5]
    CALL      LoadPalettes                       [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2145AE

sub_2145AE:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        C,2                                [2]
    LD        XHL,MonoPal_2C87A2                 [5]
    CALL      LoadMonoPalettes                   [4]
    LD        A,2                                [2]
    LD        C,2                                [2]
    LD        XHL,MonoPal_2C87A2                 [5]
    CALL      LoadMonoPalettes                   [4]
    LD        A,4                                [2]
    LD        C,2                                [2]
    LD        XHL,MonoPal_2C87A2                 [5]
    CALL      LoadMonoPalettes                   [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2145DE

sub_2145DE:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0x98                             [2]
    LD        (0x584B),A                         [4]
    NEG       A                                  [2]
    LD        (0x5853),A                         [4]
    LD        A,0xFF                             [2]
    LD        (0x5855),A                         [4]
    LD        XHL,0x2C8A0A                       [5]
    CALL      dyn_216845                         [4]
    CALL      LoadCompressedTiles                [4]
    LD        A,(wColorFlags)                    [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CALR      sub_21457E                         [3]
    JR        .skip2                             [2]
.skip:
    CALR      sub_2145AE                         [3]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214616

sub_214616:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x1E)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,0xA                            [4]
    LD        XHL,0x2C8992                       [5]
    ADD       XHL,XWA                            [2]
    CALL      dyn_216845                         [4]
    CALL      dyn_2069C8                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214639

sub_214639:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x1E)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,0xA                            [4]
    LD        XHL,0x2C89CE                       [5]
    ADD       XHL,XWA                            [2]
    CALL      dyn_216845                         [4]
    CALL      dyn_2069C8                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21465C

sub_21465C:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(wColorFlags)                    [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CALR      sub_214616                         [3]
    JR        .skip2                             [2]
.skip:
    CALR      sub_214639                         [3]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214675

sub_214675:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    SRL       3,A                                [3]
    DEC       1,A                                [2]
    CP        A,1                                [2]
    JR        C,.skip4                           [2]
    CP        A,0x13                             [3]
    JR        NC,.skip4                          [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    PUSH      XWA                                [1]
    SLL       1,XWA                              [3]
    LD        XDE,7                              [2]
    MUL       XDE,0x40                           [4]
    ADD       XDE,XWA                            [2]
    LD        XWA,0x9000                         [5]
    ADD       XDE,XWA                            [2]
    LD        A,(wColorFlags)                    [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    LD        XHL,0x2C87AA                       [5]
    JR        .skip2                             [2]
.skip:
    LD        XHL,0x2C8860                       [5]
.skip2:
    INC       2,XHL                              [2]
    POP       XWA                                [1]
    SUB       XWA,1                              [6]
    SLL       1,XWA                              [3]
    ADD       XHL,XWA                            [2]
    CALL      dyn_216845                         [4]
    DEC       1,WA                               [2]
    LD        C,5                                [2]
.loop:
    PUSH      C                                  [2]
    LD        BC,(XHL)                           [2]
    AND       BC,0x1FF                           [4]
    LD        BC,(XHL)                           [2]
    JR        Z,.skip3                           [2]
    ADD       BC,WA                              [2]
.skip3:
    LD        (XDE),BC                           [2]
    POP       C                                  [2]
    ADD       XHL,0x24                           [6]
    ADD       XDE,0x40                           [6]
    DJNZ      C,.loop                            [3]
.skip4:
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    LD        (0x584B),A                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214700

sub_214700:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x2C)                       [3]
    SRL       3,A                                [3]
    INC       1,A                                [2]
    CP        A,5                                [2]
    JR        C,.skip4                           [2]
    CP        A,0xF                              [3]
    JR        NC,.skip4                          [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    PUSH      XWA                                [1]
    SLL       1,XWA                              [3]
    LD        XDE,8                              [5]
    MUL       XDE,0x40                           [4]
    ADD       XDE,XWA                            [2]
    LD        XWA,0x9800                         [5]
    ADD       XDE,XWA                            [2]
    LD        A,(wColorFlags)                    [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    LD        XHL,0x2C8916                       [5]
    JR        .skip2                             [2]
.skip:
    LD        XHL,0x2C8954                       [5]
.skip2:
    INC       2,XHL                              [2]
    POP       XWA                                [1]
    SUB       XWA,5                              [6]
    SLL       1,XWA                              [3]
    ADD       XHL,XWA                            [2]
    CALL      dyn_216845                         [4]
    DEC       1,WA                               [2]
    LD        C,3                                [2]
.loop:
    PUSH      C                                  [2]
    LD        BC,(XHL)                           [2]
    AND       BC,0x1FF                           [4]
    LD        BC,(XHL)                           [2]
    JR        Z,.skip3                           [2]
    ADD       BC,WA                              [2]
.skip3:
    LD        (XDE),BC                           [2]
    POP       C                                  [2]
    ADD       XHL,0x14                           [6]
    ADD       XDE,0x40                           [6]
    DJNZ      C,.loop                            [3]
.skip4:
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    NEG       A                                  [2]
    LD        (0x5853),A                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21478C

sub_21478C:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    SRL       3,A                                [3]
    DEC       2,A                                [2]
    CP        A,1                                [2]
    JR        C,.skip                            [2]
    CP        A,0x13                             [3]
    JR        NC,.skip                           [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    LD        XDE,7                              [2]
    MUL       XDE,0x40                           [4]
    ADD       XDE,XWA                            [2]
    LD        XWA,0x9000                         [5]
    ADD       XDE,XWA                            [2]
    LD        WA,0                               [2]
    LD        C,5                                [2]
.loop:
    LD        (XDE),WA                           [2]
    ADD       XDE,0x40                           [6]
    DJNZ      C,.loop                            [3]
.skip:
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    LD        (0x584B),A                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2147DA

sub_2147DA:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x2C)                       [3]
    SRL       3,A                                [3]
    INC       2,A                                [2]
    CP        A,5                                [2]
    JR        C,.skip                            [2]
    CP        A,0xF                              [3]
    JR        NC,.skip                           [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    LD        XDE,8                              [5]
    MUL       XDE,0x40                           [4]
    ADD       XDE,XWA                            [2]
    LD        XWA,0x9800                         [5]
    ADD       XDE,XWA                            [2]
    LD        WA,0                               [2]
    LD        C,3                                [2]
.loop:
    LD        (XDE),WA                           [2]
    ADD       XDE,0x40                           [6]
    DJNZ      C,.loop                            [3]
.skip:
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    NEG       A                                  [2]
    LD        (0x5853),A                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214829

sub_214829:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x1F)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CALR      sub_21452D                         [3]
    JR        .skip2                             [2]
.skip:
    CALR      sub_2145DE                         [3]
    LD        A,4                                [2]
    LD        (XIZ+0x20),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        (XIZ+0x22),A                       [3]
    LD        (XIZ+0x21),A                       [3]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214859

sub_214859:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      sub_214675                         [3]
    CALR      sub_214700                         [3]
    LD        BC,0x48                            [3]
    LD        DE,0xFFEC                          [3]
    LD        A,(XIZ+0x2C)                       [3]
    EXTZ      WA                                 [2]
    SRL       1,WA                               [3]
    ADD       DE,WA                              [2]
    CALR      sub_21465C                         [3]
    LD        A,(XIZ+0x2C)                       [3]
    CP        A,0x5C                             [3]
    JR        C,.skip                            [2]
    SUB       A,0x5C                             [3]
    EXTZ      WA                                 [2]
    DIV{1}    WA,0x14                            [3]
    INC       1,A                                [2]
    LD        W,4                                [2]
    SUB       W,A                                [2]
    LD        (XIZ+0x20),W                       [3]
.skip:
    LD        A,(XIZ+0x21)                       [3]
    LD        (XIZ+0x22),A                       [3]
    LD        A,(XIZ+0x2C)                       [3]
    LD        W,(XIZ+0x20)                       [3]
    ADD       A,W                                [2]
    LD        (XIZ+0x2C),A                       [3]
    CP        A,0x98                             [3]
    JR        C,.skip2                           [2]
    LD        XWA,0xB                            [5]
    CALL      PlayMusic                          [4]
    LD        WA,0xA0                            [3]
    CALL      SoundCommand                       [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,4                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2148C4

sub_2148C4:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        BC,0x48                            [3]
    LD        DE,0x38                            [3]
    CALR      sub_21465C                         [3]
    LD        A,(XIZ+0x2C)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2C),A                       [3]
    CP        A,0x4B                             [3]
    JR        C,.skip                            [2]
    LD        A,0x98                             [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,5                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]
