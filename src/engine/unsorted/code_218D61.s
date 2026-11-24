; engine/unsorted/code_218D61: 35 routines (each keeps its ROM address with .org)

.org 0x218D61

swp_218D61:
    RET                                          [1]

.org 0x218D62

swp_218D62:
    OR        BC,1                               [4]
    RET                                          [1]

.org 0x218D6C

swp_218D6C:
    OR        BC,4                               [4]
    RET                                          [1]

.org 0x218D71

swp_218D71:
    OR        BC,8                               [4]
    RET                                          [1]

.org 0x218D76

swp_218D76:
    OR        BC,0x10                            [4]
    RET                                          [1]

.org 0x218D85

swp_218D85:
    OR        BC,0x80                            [4]
    RET                                          [1]

.org 0x218D8A

swp_218D8A:
    ADDW      (0x6193),0x19                      [6]
    RET                                          [1]

.org 0x218D91

swp_218D91:
    ADDW      (0x6193),0x32                      [6]
    RET                                          [1]

.org 0x218D9F

swp_218D9F:
    ADDW      (0x6195),0xF                       [6]
    RET                                          [1]

.org 0x218DA6

swp_218DA6:
    ADDW      (0x6195),0x1E                      [6]
    RET                                          [1]

.org 0x218DAD

swp_218DAD:
    ADDW      (0x6195),0x3C                      [6]
    RET                                          [1]

.org 0x218DB4

swp_218DB4:
    ADDW      (0x6197),0xA                       [6]
    ADDW      (0x6199),0xA                       [6]
    RET                                          [1]

.org 0x218DC1

swp_218DC1:
    ADDW      (0x6197),0x14                      [6]
    ADDW      (0x6199),0x14                      [6]
    RET                                          [1]

.org 0x218DCE

swp_218DCE:
    ADDW      (0x6197),0x1E                      [6]
    ADDW      (0x6199),0x1E                      [6]
    RET                                          [1]

.org 0x218DDB

swp_218DDB:
    ADDW      (0x619B),0xA                       [6]
    RET                                          [1]

.org 0x218DE2

swp_218DE2:
    ADDW      (0x619B),0x14                      [6]
    RET                                          [1]

.org 0x218DE9

swp_218DE9:
    ADDW      (0x619B),0x1E                      [6]
    RET                                          [1]

.org 0x218DF0

swp_218DF0:
    ADDW      (0x619D),0xA                       [6]
    RET                                          [1]

.org 0x218DF7

swp_218DF7:
    ADDW      (0x619D),0x14                      [6]
    RET                                          [1]

.org 0x218DFE

swp_218DFE:
    ADDW      (0x619D),0x1E                      [6]
    RET                                          [1]

.org 0x218E05

swp_218E05:
    ADDW      (0x619F),0xA                       [6]
    RET                                          [1]

.org 0x218E0C

swp_218E0C:
    ADDW      (0x619F),0x14                      [6]
    RET                                          [1]

.org 0x218E13

swp_218E13:
    ADDW      (0x619F),0x1E                      [6]
    RET                                          [1]

.org 0x218E1A

sub_218E1A:
    LD        A,2                                [2]
    CALL      sub_21734E                         [4]
    LD        A,2                                [2]
    LD        B,8                                [2]
    LD        XHL,0x218AA8                       [5]
    CALL      swp_217207                         [4]
    CALL      sub_218EA7                         [4]
    JP        NC,.done                           [5]
    LD        BC,0x300                           [3]
    LD        DE,(0x6193)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x301                           [3]
    LD        DE,(0x6195)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x302                           [3]
    LD        DE,(0x6199)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x303                           [3]
    LD        DE,(0x6197)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x304                           [3]
    LD        DE,(0x619B)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x305                           [3]
    LD        DE,(0x619D)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x306                           [3]
    LD        DE,(0x619F)                        [4]
    LD        WA,0x302                           [3]
    CALL      swp_21729F                         [4]
    LD        BC,0x308                           [3]
    LD        E,(0x61A1)                         [4]
    LD        WA,0x302                           [3]
    CALL      swp_21746E                         [4]
.done:
    RET                                          [1]

.org 0x218EA7

sub_218EA7:
    CALL      swp_21963B                         [4]
    CALL      sub_218EFD                         [4]
    RET       NC                                 [2]
    CALL      swp_219640                         [4]
    CALL      sub_218EFD                         [4]
    RET       NC                                 [2]
    CALL      swp_219645                         [4]
    CALL      sub_218EFD                         [4]
    RET       NC                                 [2]
    CALL      swp_21964A                         [4]
    CALL      sub_218EFD                         [4]
    RET       NC                                 [2]
    CALL      swp_21964F                         [4]
    CALL      sub_218EFD                         [4]
    RET       NC                                 [2]
    CALL      swp_219654                         [4]
    CALL      sub_218EFD                         [4]
    RET       NC                                 [2]
    CALL      sub_219659                         [4]
    CALL      sub_218EF8                         [4]
    RET       NC                                 [2]
    CALL      sub_21965E                         [4]
    CALL      sub_218EF8                         [4]
    RET       NC                                 [2]
    RET                                          [1]

.org 0x218EF8

sub_218EF8:
    OR        WA,WA                              [2]
    SCF                                          [1]
    RET       Z                                  [2]

.org 0x218EFD

sub_218EFD:
    CALL      sub_219701                         [4]
    RET       NC                                 [2]
    OR        A,A                                [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x218F09

sub_218F09:
    CALL      sub_218F12                         [4]
    CALL      sub_218F17                         [4]
    RET                                          [1]

.org 0x218F12

sub_218F12:
    CALL      CopyEquipToWorks                   [4]
    RET                                          [1]

.org 0x218F17

sub_218F17:
    LD        A,2                                [2]
    CALL      sub_21734E                         [4]
    CALL      swp_21963B                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_219645                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,1                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_219640                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,2                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_21964A                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,3                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_21964F                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,4                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_219654                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,5                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    CALL      sub_219659                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,7                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    CALL      sub_21965E                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,8                               [3]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    RET                                          [1]
    .db 2D 01 13 14 05 12 FF

.org 0x218FA6

loc_218FA6:
    NOP                                          [1]
    LD        E,0xE                              [2]
    RETI                                         [1]
    .db 5A FF 2C 05 16 FF 2E 18 14 FF 59 59 59 59 59 59
    .db FF 00 04 AC 8F 21 00

.org 0x21911A

sub_21911A:
    LDB       (0x61AC),0                         [5]
    LDB       (0x61AD),0                         [5]
    LDB       (0x61AE),0                         [5]
    LDB       (wDevelopArm),0                    [5]
    LDB       (wDevelopMaterial),0               [5]
    LDB       (wDevelopTool),0                   [5]
    RET                                          [1]

.org 0x219139

sub_219139:
    CALL      sub_219142                         [4]
    CALL      sub_219143                         [4]
    RET                                          [1]

.org 0x219142

sub_219142:
    RET                                          [1]

.org 0x219143

sub_219143:
    LD        A,2                                [2]
    CALL      sub_21734E                         [4]
    LD        A,2                                [2]
    LD        B,3                                [2]
    LD        XHL,0x219108                       [5]
    CALL      swp_217207                         [4]
    LD        XHL,0x2190EB                       [5]
    LD        A,(0x61AC)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    LD        W,5                                [2]
    CALL      sub_21739F                         [4]
.skip:
    LD        A,2                                [2]
    LD        BC,1                               [2]
    CALL      swp_2171DF                         [4]
    LD        XHL,0x2190EB                       [5]
    LD        A,(0x61AD)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip2                           [2]
    LD        W,9                                [2]
    CALL      sub_21739F                         [4]
.skip2:
    LD        A,2                                [2]
    LD        BC,4                               [2]
    CALL      swp_2171DF                         [4]
    LD        XHL,0x2190EB                       [5]
    LD        A,(0x61AE)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip3                           [2]
    LD        XHL,0x2190F2                       [5]
    JR        MI,.skip3                          [2]
    LD        W,8                                [2]
    CALL      sub_21739F                         [4]
.skip3:
    LD        A,2                                [2]
    LD        BC,7                               [2]
    CALL      swp_2171DF                         [4]
    RET                                          [1]
