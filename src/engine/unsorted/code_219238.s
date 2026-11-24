; engine/unsorted/code_219238: 78 routines (each keeps its ROM address with .org)

.org 0x219238

sub_219238:
    LD        (0x61AF),XHL                       [4]
    CALL      swp_219256                         [4]
    CALL      sub_2192DE                         [4]
    RET                                          [1]

.org 0x219256

swp_219256:
    LDW       (0x61B3),0                         [6]
    CALL      sub_21862D                         [4]
    JP        NC,loc_2192D7                      [5]
    LD        (0x61B3),WA                        [4]
    LD        XHL,(0x61AF)                       [4]
    CALL      swp_21717A                         [4]
    JR        NC,loc_2192D7                      [2]

.org 0x219273

loc_219273:
    LDW       (0x61B5),0                         [6]
    LDW       (0x61B7),0                         [6]
    LDW       (0x61B9),0                         [6]
    LDW       (0x61BB),0                         [6]
    LDW       (0x61BD),0                         [6]
    LDW       (0x61BF),0                         [6]
    LDB       (0x61C1),0                         [5]
    LD        WA,(0x61B3)                        [4]
    CALL      sub_217434                         [4]
    LD        WA,(XHL+0)                         [3]
    LD        (0x61B5),WA                        [4]
    LD        WA,(XHL+2)                         [3]
    LD        (0x61B7),WA                        [4]
    LD        WA,(XHL+4)                         [3]
    LD        (0x61B9),WA                        [4]
    LD        WA,(XHL+6)                         [3]
    LD        (0x61BB),WA                        [4]
    LD        WA,(XHL+8)                         [3]
    LD        (0x61BD),WA                        [4]
    LD        WA,(XHL+0xA)                       [3]
    LD        (0x61BF),WA                        [4]
    LD        WA,(XHL+0xE)                       [3]
    LD        (0x61C1),A                         [4]
    JR        loc_2192DD                         [2]

.org 0x2192D7

loc_2192D7:
    LDW       (0x61B3),0                         [6]

.org 0x2192DD

loc_2192DD:
    RET                                          [1]

.org 0x2192DE

sub_2192DE:
    LD        A,2                                [2]
    LD        B,7                                [2]
    LD        XHL,0x2191C8                       [5]
    CALL      swp_217207                         [4]
    CPW       (0x61B3),0                         [6]
    JP        NZ,.skip                           [5]
    LD        A,2                                [2]
    LD        B,7                                [2]
    LD        XHL,0x21920E                       [5]
    CALL      swp_217207                         [4]
    JP        .done                              [4]
.skip:
    LD        BC,0x300                           [3]
    LD        DE,(0x61B5)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x301                           [3]
    LD        DE,(0x61B7)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x302                           [3]
    LD        DE,(0x61B9)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x303                           [3]
    LD        DE,(0x61BB)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x304                           [3]
    LD        DE,(0x61BD)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x305                           [3]
    LD        DE,(0x61BF)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x308                           [3]
    LD        E,(0x61C1)                         [4]
    LD        WA,0x302                           [3]
    CALL      swp_21746E                         [4]
.done:
    RET                                          [1]

.org 0x21936A

sub_21936A:
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0xC                              [2]
    LD        D,0xE                              [2]
    CALL      swp_20677A                         [4]
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0xC                              [2]
    LD        D,0xE                              [2]
    CALL      swp_206781                         [4]
    LD        WA,0x7E                            [3]
    LD        QA,0                               [3]
    LD        BC,0x1C2                           [3]
    CALL      FillTiles                          [4]
    CALL      CalcUnitStats                      [4]
    LD        WA,0x7E                            [3]
    LD        BC,0                               [2]
    LD        DE,2                               [2]
    CALL      sub_207E77                         [4]
    RET                                          [1]

.org 0x21957C

swp_21957C:
    LD        WA,(0x61C9)                        [4]
    LD        (wEquipCore),A                     [4]
    LD        WA,(0x61C3)                        [4]
    LD        (wEquipBody),A                     [4]
    LD        WA,(0x61C5)                        [4]
    LD        (wEquipLeftArm),A                  [4]
    LD        WA,(0x61C7)                        [4]
    LD        (wEquipRightArm),A                 [4]
    LD        WA,(0x61CB)                        [4]
    LD        (wEquipLegs),A                     [4]
    LD        WA,(0x61CD)                        [4]
    LD        (wEquipBack),A                     [4]
    LD        WA,(0x61CF)                        [4]
    LD        (wEquipAcc1),A                     [4]
    LD        WA,(0x61D1)                        [4]
    LD        (wEquipAcc2),A                     [4]
    RET                                          [1]

.org 0x21963B

swp_21963B:
    LD        WA,(0x61C3)                        [4]
    RET                                          [1]

.org 0x219640

swp_219640:
    LD        WA,(0x61C5)                        [4]
    RET                                          [1]

.org 0x219645

swp_219645:
    LD        WA,(0x61C7)                        [4]
    RET                                          [1]

.org 0x21964A

swp_21964A:
    LD        WA,(0x61C9)                        [4]
    RET                                          [1]

.org 0x21964F

swp_21964F:
    LD        WA,(0x61CB)                        [4]
    RET                                          [1]

.org 0x219654

swp_219654:
    LD        WA,(0x61CD)                        [4]
    RET                                          [1]

.org 0x219659

sub_219659:
    LD        WA,(0x61CF)                        [4]
    RET                                          [1]

.org 0x21965E

sub_21965E:
    LD        WA,(0x61D1)                        [4]
    RET                                          [1]

.org 0x219663

swp_219663:
    LD        (0x61C3),WA                        [4]
    RET                                          [1]

.org 0x21968B

loc_21968B:
    CALL      sub_21B8A7                         [4]
    RET       NC                                 [2]
    CALL      sub_21B8C0                         [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x219697

swp_219697:
    CALL      loc_21968B                         [4]
    RET       NC                                 [2]
    LD        XHL,0x5080                         [5]
    LDA       XHL,XHL+WA                         [5]
    RET                                          [1]

.org 0x2196A8

sub_2196A8:
    CALL      swp_219697                         [4]
    RET       NC                                 [2]
    LD        A,(XHL)                            [2]
    RET                                          [1]

.org 0x2196B1

swp_2196B1:
    CALL      swp_219697                         [4]
    RET       NC                                 [2]
    LD        (XHL),B                            [2]
    RET                                          [1]

.org 0x2196D4

sub_2196D4:
    CP        W,6                                [2]
    JR        C,.skip                            [2]
    SUB       W,5                                [3]
    JP        loc_21968B                         [4]
.skip:
    CALL      sub_21B94A                         [4]
    RET       NC                                 [2]
    CALL      sub_21B963                         [4]
    ADD       WA,0x100                           [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x2196EF

swp_2196EF:
    CALL      sub_2196D4                         [4]
    RET       NC                                 [2]
    LD        XHL,0x5080                         [5]
    LDA       XHL,XHL+WA                         [5]
    SCF                                          [1]
    RET                                          [1]

.org 0x219701

sub_219701:
    CALL      swp_2196EF                         [4]
    RET       NC                                 [2]
    LD        A,(XHL)                            [2]
    RET                                          [1]

.org 0x21970A

swp_21970A:
    CALL      swp_2196EF                         [4]
    RET       NC                                 [2]
    LD        (XHL),B                            [2]
    RET                                          [1]

.org 0x219713

sub_219713:
    CALL      sub_2196D4                         [4]
    RET       NC                                 [2]
    INC       1,WA                               [2]
    CALL      AddItem                            [4]
    RET                                          [1]

.org 0x219776

swp_219776:
    LD        XHL3,0x61E6                        [7]
    LD        RW3,2                              [3]
    CALL      BiosCall                           [4]
    RET                                          [1]

.org 0x219796

loc_219796:
    CP        A,0xFE                             [3]
    JR        NZ,.skip                           [2]
    LD        A,(0x61D8)                         [4]
    JR        .skip2                             [2]
.skip:
    CP        A,0xFF                             [3]
    JR        NZ,.skip2                          [2]
    LD        A,(wWorksPartnerRace)              [4]
.skip2:
    EXTZ      WA                                 [2]
    PUSH      WA                                 [1]
    LD{1}     WA,HL                              [2]
    POP       HL                                 [1]
    CALL      DrawPortraitAt                     [4]
    RET                                          [1]

.org 0x2197C1

sub_2197C1:
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    LD        HL,0x7E                            [3]
    JP        loc_219796                         [4]

.org 0x2197DD

sub_2197DD:
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0xC                              [2]
    LD        D,0xE                              [2]
    CALL      swp_20677A                         [4]
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0xC                              [2]
    LD        D,0xE                              [2]
    CALL      swp_206781                         [4]
    LD        WA,0x7E                            [3]
    LD        QA,0                               [3]
    LD        BC,0x1C2                           [3]
    CALL      FillTiles                          [4]
    RET                                          [1]

.org 0x219807

sub_219807:
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0xC                              [2]
    LD        D,0xE                              [2]
    CALL      swp_206781                         [4]
    LD        WA,0x126                           [3]
    LD        QA,0                               [3]
    LD        BC,0xA8                            [3]
    CALL      FillTiles                          [4]
    RET                                          [1]

.org 0x21983A

swp_21983A:
    LD        L,A                                [2]
    EXTZ      HL                                 [2]
    CALL      ClearEventFlag                     [4]
    RET                                          [1]

.org 0x219843

swp_219843:
    LD        A,0x1E                             [2]
    JP        loc_21777C                         [4]

.org 0x2198E3

sub_2198E3:
    CALL      sub_2198EB                         [4]
    JP        swp_219849                         [4]

.org 0x2198EB

sub_2198EB:
    LD        A,(wWorksPartnerRace)              [4]
    CALL      SplitRaceGender                    [4]
    OR        W,W                                [2]
    RET       Z                                  [2]
    LD        XHL,XDE                            [2]
    RET                                          [1]

.org 0x2198FA

swp_2198FA:
    CALL      swp_219776                         [4]
    LD        W,(0x61E7)                         [4]
    LD        A,(0x61E8)                         [4]
    RET                                          [1]

.org 0x219907

loc_219907:
    CALL      PlayMusic                          [4]
    RET                                          [1]

.org 0x21990C

sub_21990C:
    CALL      SoundCommand                       [4]
    RET                                          [1]

.org 0x219917

swp_219917:
    LDW       (0x61F7),0                         [6]
    CPB       (0x61F6),6                         [5]
    JP        NZ,loc_219960                      [5]
    LD        A,1                                [2]
    CALL      sub_21B7F2                         [4]
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_217F00                         [4]
    LD        A,(0x615B)                         [4]
    INC       1,A                                [2]
    LD        (0x61F7),A                         [4]
    JP        swp_21AB3F                         [4]

.org 0x219A53

loc_219A53:
    CALL      sub_2171A8                         [4]
    CALL      swp_2197CC                         [4]

.org 0x219B2B

swp_219B2B:
    LD        XHL,ThisLetsYouSeeText             [5]
    LD        XDE,ThisLetsYouSeeText             [5]
    JP        loc_219B97                         [4]

.org 0x219B39

swp_219B39:
    LD        XHL,ThisLetsYouSeeText2            [5]
    LD        XDE,ThisLetsYouSeeText2            [5]
    JP        loc_219B97                         [4]

.org 0x219B47

swp_219B47:
    LD        XHL,ThisLetsYouSaveText            [5]
    LD        XDE,ThisLetsYouSaveText            [5]
    JP        loc_219B97                         [4]

.org 0x219B7F

swp_219B7F:
    LD        XHL,ThisTakesYouBackText           [5]
    LD        XDE,ThisTakesYouBackText           [5]
    JP        loc_219B97                         [4]

.org 0x219BA3

loc_219BA3:
    CALL      sub_217C9A                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,WhatDoYouWantText3             [5]
    LD        XDE,WhatDoYouWantText3             [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.skip3                          [5]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CP        A,1                                [2]
    JR        Z,.skip2                           [2]
    JP        .skip3                             [4]
.skip:
    CALL      WorksInfoMenus                     [4]
    JP        .skip3                             [4]
.skip2:
    LD        XHL,ThisIsYourUNITRONsText         [5]
    LD        XDE,ThisIsYourUNITRONsText         [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      CopyEquipToWorks                   [4]
    CALL      sub_219C22                         [4]
    JP        .skip3                             [4]
.skip3:
    LD        XHL,FinishedText                   [5]
    LD        XDE,FinishedText                   [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CPB       (0x61F6),4                         [5]
    JP        Z,loc_21AA5D                       [5]
    JP        loc_219A53                         [4]

.org 0x219C22

sub_219C22:
    POP       XHL                                [1]
    LD        (0x61FC),XHL                       [4]
    CALL      sub_2179FE                         [4]
    CALL      sub_21936A                         [4]
    XOR       A,A                                [2]
    LD        (0x6200),A                         [4]
    CALL      swp_218939                         [4]
.loop:
    LD        A,(0x6200)                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip                           [2]
    CALL      sub_218AD8                         [4]
    JR        .loop2                             [2]
.skip:
    CALL      sub_218F09                         [4]
.loop2:
    CALL      sub_2171A8                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JP        NZ,.skip3                          [5]
    BIT       5,A                                [3]
    JP        NZ,.skip3                          [5]
    BIT       2,A                                [3]
    JP        NZ,.skip2                          [5]
    BIT       3,A                                [3]
    JP        NZ,.skip2                          [5]
    JP        .loop2                             [4]
.skip2:
    XORB      (0x6200),1                         [5]
    JP        .loop                              [4]
.skip3:
    LD        XHL,(0x61FC)                       [4]
    JP        (XHL)                              [2]

.org 0x219D1A

loc_219D1A:
    CALL      sub_217CF0                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,HeresTheItemDataText           [5]
    LD        XDE,HeresTheItemDataText           [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.skip                           [5]
    CP        A,0                                [2]
    JP        Z,.loop                            [5]
    CP        A,1                                [2]
    JP        Z,.loop2                           [5]
    JP        .skip                              [4]
.loop:
    CALL      sub_217D60                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,WhichPartsDoYouText            [5]
    LD        XDE,WhichPartsDoYouText            [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,loc_219D1A                      [5]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x613B)                         [4]
    CALL      sub_218699                         [4]
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,HeresTheDataListText           [5]
    LD        XDE,HeresTheDataListText           [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    CALL      sub_217F0C                         [4]
    CALL      WorksGreeting                      [4]
    JP        .loop                              [4]
.loop2:
    CALL      sub_217DD3                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,WhichItemDoYouText             [5]
    LD        XDE,WhichItemDoYouText             [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,loc_219D1A                      [5]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x613B)                         [4]
    CALL      sub_2183B3                         [4]
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,HeresTheDataListText           [5]
    LD        XDE,HeresTheDataListText           [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    CALL      sub_217F0C                         [4]
    CALL      WorksGreeting                      [4]
    JP        .loop2                             [4]
.skip:
    LD        XHL,FinishedText                   [5]
    LD        XDE,FinishedText                   [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CPB       (0x61F6),5                         [5]
    JP        Z,loc_21AA5D                       [5]
    JP        loc_219A5B                         [4]

.org 0x219E5F

loc_219E5F:
    LD        XHL,YouWantToEditText              [5]
    LD        XDE,YouWantToEditText              [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
.loop:
    CALL      sub_217E28                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,DoYouWantToText2               [5]
    LD        XDE,DoYouWantToText2               [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.skip3                          [5]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CP        A,1                                [2]
    JR        Z,.skip2                           [2]
    JP        .skip3                             [4]
.skip:
    CALL      WorksHelpMenu                      [4]
    LDB       (0x6201),0                         [5]
    LD        XHL,swp_219F1D                     [5]
    CALL      StartChildTask                     [4]
.loop2:
    CALL      sub_2171A8                         [4]
    CPB       (0x6201),0                         [5]
    JR        Z,.loop2                           [2]
    CALL      swp_21AB7A                         [4]
    CALL      swp_2197CC                         [4]
    JP        .loop                              [4]
.skip2:
    CALL      WorksHelpMenu                      [4]
    LDB       (0x6201),0                         [5]
    LD        XHL,swp_219F48                     [5]
    CALL      StartChildTask                     [4]
.loop3:
    CALL      sub_2171A8                         [4]
    CPB       (0x6201),0                         [5]
    JR        Z,.loop3                           [2]
    CALL      swp_21AB7A                         [4]
    CALL      swp_2197CC                         [4]
    LD        A,(0x5DF6)                         [4]
    OR        A,A                                [2]
    JP        NZ,loc_219A5B                      [5]
    JP        .loop                              [4]
.skip3:
    LD        XHL,FinishedText                   [5]
    LD        XDE,FinishedText                   [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        loc_219A5B                         [4]

.org 0x219F1D

swp_219F1D:
    LD        XHL,swp_20DD24                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x7E                     [5]
    LDW       (XHL+0x10),8                       [5]
    task_wait
    LDB       (0x6201),1                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x219F48

swp_219F48:
    LD        XHL,swp_20DCA0                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x7E                     [5]
    LDW       (XHL+0x10),8                       [5]
    task_wait
    LDB       (0x6201),1                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x21A488

swp_21A488:
    PUSH      WA                                 [1]
    PUSH      XHL                                [1]
    LD        A,1                                [2]
    CALL      sub_21734E                         [4]
    POP       XHL                                [1]
    POP       WA                                 [1]
    LD        DE,WA                              [2]
    LD        WA,0x401                           [3]
    LD        BC,0                               [2]
    PUSH      XHL                                [1]
    CALL      swp_217309                         [4]
    POP       XHL                                [1]
    LD        C,1                                [2]
.loop:
    LD        B,0                                [2]
.loop2:
    LD        E,(XHL+)                           [3]
    PUSH      BC                                 [1]
    PUSH      XHL                                [1]
    LD        WA,0x201                           [3]
    CALL      swp_217309                         [4]
    POP       XHL                                [1]
    POP       BC                                 [1]
    INC       2,B                                [2]
    CP        B,0xE                              [3]
    JR        C,.loop2                           [2]
    INC       1,C                                [2]
    CP        C,3                                [2]
    JR        C,.loop                            [2]
    RET                                          [1]

.org 0x21A4BF

swp_21A4BF:
    LD        DE,WA                              [2]
    LD        WA,0x402                           [3]
    LD        BC,0x208                           [3]
    CALL      swp_217309                         [4]
    RET                                          [1]

.org 0x21A68F

loc_21A68F:
    CALL      sub_2179FE                         [4]
    CALL      CopyEquipToWorks                   [4]
    CALL      sub_21911A                         [4]
    CALL      sub_219139                         [4]
    LD        XHL,YouWantToDevelopText           [5]
    LD        XDE,YouWantToDevelopText           [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
.loop:
    CALL      swp_217F20                         [4]
.loop2:
    CALL      sub_21866F                         [4]
.loop3:
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,WhatDoYouWantText5             [5]
    LD        XDE,WhatDoYouWantText5             [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.skip7                          [5]
    INC       1,A                                [2]
    LD        (0x61AC),A                         [4]
    CALL      sub_219139                         [4]
    LD        A,(0x61AC)                         [4]
    LD        (wDevelopArm),A                    [4]
    LDB       (wDevelopMaterial),0               [5]
    LDB       (wDevelopTool),0                   [5]
    LD        XHL,AreYouSureText                 [5]
    LD        XDE,AreYouSureText                 [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        Z,.loop5                           [2]
    XOR       A,A                                [2]
    LD        (0x61AC),A                         [4]
    CALL      sub_219139                         [4]
    JP        .loop3                             [4]
.loop4:
    XOR       A,A                                [2]
    LD        (0x61AC),A                         [4]
    CALL      sub_219139                         [4]
    CALL      sub_218A62                         [4]
    JP        .loop2                             [4]
.loop5:
    CALL      sub_21867D                         [4]
.loop6:
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,WhatDoYouWantText6             [5]
    LD        XDE,WhatDoYouWantText6             [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop4                          [5]
    LD        A,(wDevelopChance)                 [4]
    OR        A,A                                [2]
    JR        PL,.skip                           [2]
    LD        XHL,YouCantMakeAnText              [5]
    LD        XDE,YouCantMakeAnText              [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop6                             [4]
.skip:
    LD        WA,(0x615B)                        [4]
    INC       1,A                                [2]
    LD        (0x61AD),A                         [4]
    CALL      sub_219139                         [4]
    LD        XHL,AreYouSureText                 [5]
    LD        XDE,AreYouSureText                 [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        Z,.loop7                           [2]
    XOR       A,A                                [2]
    LD        (0x61AD),A                         [4]
    CALL      sub_219139                         [4]
    LDB       (wDevelopMaterial),0               [5]
    LDB       (wDevelopTool),0                   [5]
    CALL      sub_2189B4                         [4]
    JP        .loop6                             [4]
.loop7:
    LD        XHL,DoYouWantToText5               [5]
    LD        XDE,DoYouWantToText5               [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JP        NZ,.skip2                          [5]
    CALL      sub_21868B                         [4]
.loop8:
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,SelectAToolText                [5]
    LD        XDE,SelectAToolText                [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop7                          [5]
    INC       1,A                                [2]
    LD        (0x61AE),A                         [4]
    CALL      sub_219139                         [4]
    LD        XHL,AreYouSureText                 [5]
    LD        XDE,AreYouSureText                 [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        Z,.skip3                           [2]
    XOR       A,A                                [2]
    LD        (0x61AE),A                         [4]
    CALL      sub_219139                         [4]
    LDB       (wDevelopTool),0                   [5]
    CALL      sub_2189B4                         [4]
    JP        .loop8                             [4]
.skip2:
    LDB       (0x61AE),0xFF                      [5]
    CALL      sub_219139                         [4]
    LDB       (wDevelopTool),0xFF                [5]
    CALL      sub_2189B4                         [4]
.skip3:
    LD        XHL,AllRightWereReadyText          [5]
    LD        XDE,AllRightWereReadyText          [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        Z,.skip4                           [2]
    XOR       A,A                                [2]
    LD        (0x61AD),A                         [4]
    LD        (0x61AE),A                         [4]
    CALL      sub_219139                         [4]
    LDB       (wDevelopMaterial),0               [5]
    LDB       (wDevelopTool),0                   [5]
    CALL      sub_2189B4                         [4]
    JP        .loop5                             [4]
.skip4:
    LD        WA,0x88                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,HereWeGoText                   [5]
    LD        XDE,HereWeGoText                   [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    LD        A,0x1E                             [2]
    CALL      loc_21777C                         [4]
    LD        WA,0x288                           [3]
    CALL      sub_21990C                         [4]
    CALL      DevelopRoll                        [4]
    JR        NC,.skip6                          [2]
    LD        WA,0x89                            [3]
    CALL      sub_21990C                         [4]
    CALL      DevelopSuccess                     [4]
    JR        C,.skip5                           [2]
    LD        XHL,ImSorryButIText                [5]
    LD        XDE,ImSorryButIText                [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JR        .skip7                             [2]
.skip5:
    LD        XHL,TheNewArmIsText                [5]
    LD        XDE,TheNewArmIsText                [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_217F0C                         [4]
    CALL      sub_2193A3                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(wDevelopResult)                 [4]
    LD        W,5                                [2]
    CALL      sub_219245                         [4]
    LD        A,(wDevelopResult)                 [4]
    LD        W,5                                [2]
    CALL      sub_21895C                         [4]
    CALL      WorksDevelopDone                   [4]
    CALL      sub_217757                         [4]
.loop9:
    CALL      CheckEngineerLevelUp               [4]
    JP        NC,.skip7                          [5]
    CALL      EngineerLevelUp                    [4]
    LD        XHL,PartnerSDevelopmentLevelText   [5]
    LD        XDE,PartnerSDevelopmentLevelText   [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JR        .loop9                             [2]
.skip6:
    LD        WA,0x8A                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,SorryItDidntWorkText           [5]
    LD        XDE,SorryItDidntWorkText           [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
.skip7:
    LD        XHL,DoYouWantToText6               [5]
    LD        XDE,DoYouWantToText6               [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip8                          [2]
    CALL      sub_218A62                         [4]
    CALL      sub_21911A                         [4]
    CALL      sub_219139                         [4]
    JP        .loop                              [4]
.skip8:
    LD        XHL,AllForNowLetText               [5]
    LD        XDE,AllForNowLetText               [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_217F0C                         [4]
    JP        loc_219A53                         [4]

.org 0x21AA73

loc_21AA73:
    LD        XHL,WhewImGladToText               [5]
    LD        XDE,WhewImGladToText               [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        loc_219A5B                         [4]

.org 0x21AA89

swp_21AA89:
    LD        A,(0x620A)                         [4]
    CALL      sub_21AAA5                         [4]
    LD        (0x620E),XWA                       [4]
    CALL      dyn_20636D                         [4]
    CALL      EndTask                            [4]
.loop:
    CALL      sub_2171A8                         [4]
    JP        .loop                              [4]

.org 0x21AAA5

sub_21AAA5:
    LD        XHL,swp_219917                     [5]
    LD        (0x621A),XHL                       [4]
    LD        (0x61F6),A                         [4]
    POP       XHL                                [1]
    LD        (0x6216),XHL                       [4]
    XOR       XWA,XWA                            [2]
    LD        (0x6212),XWA                       [4]
    LD        XHL,swp_21AAE2                     [5]
    CALL      StartChildTask                     [4]
.loop:
    LD        XWA,(0x6212)                       [4]
    OR        XWA,XWA                            [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip:
    CALL      sub_2171A8                         [4]
    LD        XWA,(0x6212)                       [4]
    LD        XHL,(0x6216)                       [4]
    JP        (XHL)                              [2]

.org 0x21AAE2

swp_21AAE2:
    CALL      sub_21ABDA                         [4]
    LD        A,1                                [2]
    LD        C,0x14                             [2]
    LD        E,5                                [2]
    LD        HL,0xC                             [3]
    CALL      dyn_207494                         [4]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,1                                [2]
    LD        C,0                                [2]
    LD        E,0xE                              [2]
    CALL      dyn_2074C0                         [4]
    CALL      sub_217583                         [4]
    CALL      sub_217603                         [4]
    CALL      sub_217846                         [4]
    CALL      sub_217949                         [4]
    CALL      sub_217E53                         [4]
    CALL      sub_2188FF                         [4]
    CALL      sub_219424                         [4]
    LD        A,1                                [2]
    CALL      sub_217620                         [4]
    LD        A,(0x5280)                         [4]
    CALL      sub_217625                         [4]
    CALL      sub_217888                         [4]
    CALL      sub_217894                         [4]
    CALL      sub_21789A                         [4]
    LD        XHL,(0x621A)                       [4]
    JP        (XHL)                              [2]

.org 0x21B551

swp_21B551:
    CALL      sub_21838A                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_2183A2                         [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x21B7BC

swp_21B7BC:
    CALL      swp_217684                         [4]
    CALL      sub_21838A                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_2183A2                         [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    LD{1}     WA,BC                              [2]
    CALL      0x2173E5                           [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
.done:
    RET                                          [1]

.org 0x21B7DD

swp_21B7DD:
    CALL      sub_21838A                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_2183A2                         [4]
    AND       A,0xF                              [3]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x21B7F2

sub_21B7F2:
    LD        XHL,swp_21B7BC                     [5]
    LD        XDE,swp_21B7DD                     [5]
    LD        (0x616A),XHL                       [4]
    LD        (0x616E),XDE                       [4]
    LD        (0x6182),A                         [4]
    LD        A,0xA                              [2]
    LD        (0x615F),A                         [4]
    LD        XHL,loc_21823C                     [5]
    LD        (0x6162),XHL                       [4]
    LD        XHL,swp_218331                     [5]
    LD        (0x6166),XHL                       [4]
    LD        XHL,0x2181D8                       [5]
    LD        (0x6172),XHL                       [4]
    JP        loc_217EEE                         [4]

.org 0x21B82D

swp_21B82D:
    LD        XHL,swp_21861D                     [5]
    CALL      sub_219238                         [4]
    CALL      swp_217684                         [4]
    CALL      sub_21862D                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_218645                         [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    LD{1}     WA,BC                              [2]
    CALL      sub_2173D5                         [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
.done:
    RET                                          [1]

.org 0x21B857

swp_21B857:
    CALL      sub_21862D                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_218645                         [4]
    AND       A,0xF                              [3]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x21B8A7

sub_21B8A7:
    DEC       1,W                                [2]
    CP        W,4                                [2]
    INC       1,W                                [2]
    JR        NC,.done                           [2]
    PUSH      XHL                                [1]
    LD        XHL,0x25B2E2                       [5]
    DEC       1,A                                [2]
    CP        A,(XHL+W)                          [5]
    INC       1,A                                [2]
    POP       XHL                                [1]
.done:
    RET                                          [1]

.org 0x21B8C0

sub_21B8C0:
    PUSH      XHL                                [1]
    LD        XHL,0x25B2E6                       [5]
    LD        L,(XHL+W)                          [5]
    EXTZ      HL                                 [2]
    DEC       1,A                                [2]
    EXTZ      WA                                 [2]
    ADD       WA,HL                              [2]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B8D5

swp_21B8D5:
    PUSH      XHL                                [1]
    LD        A,W                                [2]
    LD        XHL,0x25B2E2                       [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B8E4

swp_21B8E4:
    MUL       XWA,7                              [4]
    LD        XHL,0x25ABAC                       [5]
    LDA       XHL,XHL+WA                         [5]
    RET                                          [1]

.org 0x21B8F3

swp_21B8F3:
    MUL       XWA,0x13                           [4]
    LD        XHL,0x25AD9D                       [5]
    LDA       XHL,XHL+WA                         [5]
    RET                                          [1]

.org 0x21B902

swp_21B902:
    PUSH      XHL                                [1]
    ADD       WA,WA                              [2]
    LD        XHL,0x25B2EB                       [5]
    LD        WA,(XHL+WA)                        [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B911

swp_21B911:
    PUSH      XHL                                [1]
    ADD       WA,WA                              [2]
    LD        XHL,0x25B379                       [5]
    LD        WA,(XHL+WA)                        [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B920

sub_21B920:
    PUSH      XHL                                [1]
    ADD       WA,WA                              [2]
    LD        XHL,0x25B407                       [5]
    LD        WA,(XHL+WA)                        [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B94A

sub_21B94A:
    DEC       1,W                                [2]
    CP        W,5                                [2]
    INC       1,W                                [2]
    JR        NC,.done                           [2]
    PUSH      XHL                                [1]
    LD        XHL,0x21B93F                       [5]
    DEC       1,A                                [2]
    CP        A,(XHL+W)                          [5]
    INC       1,A                                [2]
    POP       XHL                                [1]
.done:
    RET                                          [1]

.org 0x21B963

sub_21B963:
    PUSH      XHL                                [1]
    LD        XHL,0x21B944                       [5]
    LD        L,(XHL+W)                          [5]
    EXTZ      HL                                 [2]
    DEC       1,A                                [2]
    EXTZ      WA                                 [2]
    ADD       WA,HL                              [2]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B978

swp_21B978:
    PUSH      XHL                                [1]
    LD        A,W                                [2]
    LD        XHL,0x21B93F                       [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B987

swp_21B987:
    MUL       XWA,7                              [4]
    LD        XHL,0x25B623                       [5]
    LDA       XHL,XHL+WA                         [5]
    RET                                          [1]

.org 0x21B996

swp_21B996:
    MUL       XWA,0x13                           [4]
    LD        XHL,0x25BC58                       [5]
    LDA       XHL,XHL+WA                         [5]
    RET                                          [1]

.org 0x21B9A5

swp_21B9A5:
    PUSH      XHL                                [1]
    ADD       WA,WA                              [2]
    LD        XHL,0x25CD31                       [5]
    LD        WA,(XHL+WA)                        [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B9B4

sub_21B9B4:
    MUL{1}    WA,0x18                            [3]
    LD        XHL,0x25CF0F                       [5]
    LDA       XHL,XHL+WA                         [5]
    RET                                          [1]
