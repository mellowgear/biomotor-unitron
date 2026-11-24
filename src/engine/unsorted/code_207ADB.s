; engine/unsorted/code_207ADB: 23 routines (each keeps its ROM address with .org)

.org 0x207ADB

swp_207ADB:
    RET                                          [1]

.org 0x207ADC

swp_207ADC:
    ADDB      (wCritChance),5                    [5]
    RET                                          [1]

.org 0x207AE2

swp_207AE2:
    ADDB      (wCritChance),8                    [5]
    RET                                          [1]

.org 0x207AE8

swp_207AE8:
    ADDB      (wCritChance),0xA                  [5]
    RET                                          [1]

.org 0x207AEE

swp_207AEE:
    ADDB      (0x5D91),0xF6                      [5]
    RET                                          [1]

.org 0x207AF4

swp_207AF4:
    ADDB      (0x5D91),0xEC                      [5]
    RET                                          [1]

.org 0x207AFA

swp_207AFA:
    ADDB      (0x5D91),0xE2                      [5]
    RET                                          [1]

.org 0x207B00

swp_207B00:
    ADDB      (0x5D92),0xF                       [5]
    RET                                          [1]

.org 0x207B06

swp_207B06:
    ADDB      (0x5D92),0x1E                      [5]
    RET                                          [1]

.org 0x207B0C

swp_207B0C:
    ADDB      (0x5D92),0x32                      [5]
    RET                                          [1]

.org 0x207B23

dyn_207B23:
    CPW       (wExpToNext),0                     [6]
    JR        LE,LevelUpStatGains                [2]
    RCF                                          [1]
    RET                                          [1]

.org 0x207C0F

swp_207C0F:
    EXTZ      XDE                                [2]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    PUSH      BC                                 [1]
    PUSH      HL                                 [1]
    PUSH      XDE                                [1]
    LD        XHL,0x2C83DF                       [5]
    LD        BC,8                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    LD        XHL,(XSP)                          [2]
    LD        C,QC                               [3]
    DEC       1,C                                [2]
    JR        Z,.skip                            [2]
    LD        B,0                                [2]
    SLL       3,BC                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
.skip:
    POP       XDE                                [1]
    POP       HL                                 [1]
    POP       BC                                 [1]
    OR        BC,BC                              [2]
    RET       Z                                  [2]
    LD        QB,0                               [3]
    SLL       3,QBC                              [4]
    MUL       XBC,QBC                            [3]
    EXTZ      XHL                                [2]
    ADD       XBC,XHL                            [2]
    DEC       1,XBC                              [2]
    DIV       XBC,HL                             [2]
.loop:
    CP        BC,8                               [4]
    JR        C,.skip2                           [2]
    PUSH      BC                                 [1]
    LD        XHL,0x2C845F                       [5]
    LD        BC,8                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    POP       BC                                 [1]
    DEC       8,BC                               [2]
    JR        .loop                              [2]
.skip2:
    OR        BC,BC                              [2]
    RET       Z                                  [2]
    SLL       4,BC                               [3]
    LD        XHL,0x2C83DF                       [5]
    LDA       XHL,XHL+BC                         [5]
    LD        BC,8                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    RET                                          [1]

.org 0x207C7B

swp_207C7B:
    EXTZ      XDE                                [2]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    PUSH      BC                                 [1]
    PUSH      HL                                 [1]
    PUSH      XDE                                [1]
    LD        XHL,0x2C8471                       [5]
    LD        BC,8                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    POP       XHL                                [1]
    LD        C,QC                               [3]
    DEC       1,C                                [2]
    JR        Z,.skip                            [2]
    LD        B,0                                [2]
    SLL       3,BC                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    DEC       2,XDE                              [2]
.skip:
    POP       HL                                 [1]
    POP       BC                                 [1]
    OR        BC,BC                              [2]
    RET       Z                                  [2]
    LD        QB,0                               [3]
    SLL       3,QBC                              [4]
    MUL       XBC,QBC                            [3]
    EXTZ      XHL                                [2]
    ADD       XBC,XHL                            [2]
    DEC       1,XBC                              [2]
    DIV       XBC,HL                             [2]
.loop:
    CP        BC,8                               [4]
    JR        C,.skip2                           [2]
    PUSH      BC                                 [1]
    LD        XHL,0x2C84FF                       [5]
    LD        BC,8                               [3]
    LDDRW     (XDE-),(XHL-)                      [2]
    POP       BC                                 [1]
    DEC       8,BC                               [2]
    JR        .loop                              [2]
.skip2:
    OR        BC,BC                              [2]
    RET       Z                                  [2]
    SLL       4,BC                               [3]
    LD        XHL,0x2C847F                       [5]
    LDA       XHL,XHL+BC                         [5]
    LD        BC,8                               [3]
    LDDRW     (XDE-),(XHL-)                      [2]
    RET                                          [1]

.org 0x207CE7

swp_207CE7:
    EXTZ      XDE                                [2]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]

.org 0x207CF0

sub_207CF0:
    OR        BC,BC                              [2]
    JR        PL,.skip                           [2]
    LD        BC,0                               [2]
    JR        .skip2                             [2]
.skip:
    CP        BC,0x3E8                           [4]
    JR        C,.skip2                           [2]
    LD        BC,0x3E7                           [3]
.skip2:
    PUSH      BC                                 [1]
    PUSH      XDE                                [1]
    LD        L,(0x207D3E)                       [5]
    CALL      GetFontGlyph                       [4]
    LD        BC,8                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    POP       XHL                                [1]
    LD        BC,0x10                            [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    DEC       2,XDE                              [2]
    POP       BC                                 [1]
.loop:
    EXTZ      XBC                                [2]
    DIV       XBC,0xA                            [4]
    LD        HL,QBC                             [3]
    ADD       L,(0x207D3F)                       [5]
    CALL      GetFontGlyph                       [4]
    ADD       XHL,0xE                            [6]
    PUSH      BC                                 [1]
    LD        BC,8                               [3]
    LDDRW     (XDE-),(XHL-)                      [2]
    POP       BC                                 [1]
    OR        BC,BC                              [2]
    JR        NZ,.loop                           [2]
    RET                                          [1]
    .db 00 41

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

.org 0x208134

swp_208134:
    CALL      sub_208146                         [4]
    DEC       1,A                                [2]
    MUL{1}    WA,0xA                             [3]
    PUSH      WA                                 [1]
    CALL      sub_208146                         [4]
    ADD       WA,(XSP+)                          [3]
    RET                                          [1]

.org 0x208146

sub_208146:
    LD        WA,0xA                             [3]
    JP        RandomRange                        [4]

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

.org 0x208217

; [code] WA = affinity bits -> lowest set bit 0-7, 8 = none (BS1F)
AffinityIndex:
    OR        WA,0xFF00                          [4]
    BS1F      A,WA                               [2]
    LD        W,0                                [2]
    RET                                          [1]

.org 0x208475

swp_208475:
    LD        XHL,wEquipCore                     [5]
    CALL      SetRobotDrawParts                  [4]
    RET                                          [1]
