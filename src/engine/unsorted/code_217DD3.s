; engine/unsorted/code_217DD3: 35 routines (each keeps its ROM address with .org)

.org 0x217DD3

sub_217DD3:
    LD        A,5                                [2]
    LD        (0x614A),A                         [4]
    LD        A,5                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x217DA6                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x217DC4                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x217DCE                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]
    .db 33 01 16 05 FF
    PUSH      IX                                 [1]
    RETD      1025                               [3]
    .db FF 25 18 09 14 FF 00 00 FE 7D 21 00 00 01 03 7E
    .db 21 00 00 08 08 7E 21 00 00 00 00 01 00 08 00 01
    .db FF

.org 0x217E53

sub_217E53:
    XOR       XWA,XWA                            [2]
    LD        (0x617E),XWA                       [4]
    LD        (0x6176),XWA                       [4]
    CALL      sub_217F12                         [4]
    LD        XHL,swp_217FA0                     [5]
    CALL      StartChildTask                     [4]
    RET                                          [1]

.org 0x217E6C

swp_217E6C:
    LD        XWA,(0x6176)                       [4]
    OR        XWA,XWA                            [2]
    RET                                          [1]

.org 0x217E73

swp_217E73:
    LD        (0x617E),A                         [4]
    XOR       XWA,XWA                            [2]
    LD        (0x6176),XWA                       [4]
    RET                                          [1]

.org 0x217E7E

swp_217E7E:
    LD        A,1                                [2]
    JP        swp_217E73                         [4]

.org 0x217E84

swp_217E84:
    LD        A,2                                [2]
    JP        swp_217E73                         [4]

.org 0x217E8A

swp_217E8A:
    LD        A,3                                [2]
    JP        swp_217E73                         [4]

.org 0x217E90

swp_217E90:
    LD        A,4                                [2]
    JP        swp_217E73                         [4]

.org 0x217E96

swp_217E96:
    LD        A,5                                [2]
    JP        swp_217E73                         [4]

.org 0x217E9C

swp_217E9C:
    LD        A,6                                [2]
    JP        swp_217E73                         [4]

.org 0x217EA2

sub_217EA2:
    POP       XHL                                [1]
    LD        (0x617A),XHL                       [4]
.loop:
    LD        XWA,(0x6176)                       [4]
    OR        XWA,XWA                            [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip:
    CALL      sub_2171A8                         [4]
    LD        XWA,(0x6176)                       [4]
    LD        XHL,(0x617A)                       [4]
    JP        (XHL)                              [2]

.org 0x217EC3

loc_217EC3:
    LD        (0x617E),A                         [4]
    POP       XHL                                [1]
    LD        (0x617A),XHL                       [4]
    XOR       XWA,XWA                            [2]
    LD        (0x6176),XWA                       [4]
.loop:
    LD        XWA,(0x6176)                       [4]
    OR        XWA,XWA                            [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip:
    CALL      sub_2171A8                         [4]
    LD        XWA,(0x6176)                       [4]
    LD        XHL,(0x617A)                       [4]
    JP        (XHL)                              [2]

.org 0x217EEE

loc_217EEE:
    LD        A,1                                [2]
    JP        loc_217EC3                         [4]

.org 0x217EF4

swp_217EF4:
    LD        A,2                                [2]
    JP        loc_217EC3                         [4]

.org 0x217EFA

sub_217EFA:
    LD        A,3                                [2]
    JP        loc_217EC3                         [4]

.org 0x217F00

sub_217F00:
    LD        A,4                                [2]
    JP        loc_217EC3                         [4]

.org 0x217F06

sub_217F06:
    LD        A,5                                [2]
    JP        loc_217EC3                         [4]

.org 0x217F0C

sub_217F0C:
    LD        A,6                                [2]
    JP        loc_217EC3                         [4]

.org 0x217F12

sub_217F12:
    LD        A,3                                [2]
    LD        C,0xC                              [2]
    LD        E,0xE                              [2]
    LD        HL,0x7E                            [3]
    CALL      dyn_207494                         [4]
    RET                                          [1]

.org 0x217F20

swp_217F20:
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0xC                              [2]
    LD        D,0xE                              [2]
    CALL      swp_20677A                         [4]
    LD        WA,0x7E                            [3]
    LD        QA,0                               [3]
    LD        BC,0x1C2                           [3]
    CALL      FillTiles                          [4]
    LD        A,3                                [2]
    LD        C,0xC                              [2]
    LD        E,0xE                              [2]
    LD        HL,0x7E                            [3]
    CALL      dyn_207494                         [4]
    LD        A,3                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,3                                [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      dyn_2074C0                         [4]
    RET                                          [1]

.org 0x217F59

swp_217F59:
    PUSH      BC                                 [1]
    PUSH      DE                                 [1]
    LD        XHL,0x217F6D                       [5]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    POP       DE                                 [1]
    POP       BC                                 [1]
    RET                                          [1]
    .db 00 00 00 00 00 00 00 00 00 00 FF

.org 0x217F78

sub_217F78:
    PUSH      WA                                 [1]
    PUSH      BC                                 [1]
    PUSH      XHL                                [1]
    CALL      swp_2171DF                         [4]
    POP       XHL                                [1]
    CALL      swp_2171AD                         [4]
    POP       BC                                 [1]
    ADD       B,A                                [2]
    LD        XHL,0x217F97                       [5]
    LDA       XHL,XHL+A                          [5]
    POP       WA                                 [1]
    CALL      swp_2171DF                         [4]
    RET                                          [1]
    .db 00 00 00 00 00 00 00 00 FF

.org 0x217FA0

swp_217FA0:
    XOR       WA,WA                              [2]
    LD        (0x615B),WA                        [4]
    LD        (0x615D),A                         [4]
    LD        (0x615E),A                         [4]

.org 0x217FAE

loc_217FAE:
    LD        A,(0x617E)                         [4]
    CP        A,8                                [3]
    JR        NC,.skip                           [2]
    LD        XHL,0x217FC6                       [5]
    SLL       2,A                                [3]
    LD        XHL,(XHL+A)                        [5]
    JP        (XHL)                              [2]
    .db F8 7F 21 00 04 80 21 00 72 81 21 00 18 80 21 00
    .db 47 80 21 00 2C 80 21 00 4F 81 21 00 F8 7F 21 00
.skip:
    LD        WA,0xFFFF                          [3]
    LDB       (0x617E),0                         [5]
    OR        XWA,0xFFFF0000                     [6]
    LD        (0x6176),XWA                       [4]
    CALL      sub_2171A8                         [4]
    CALL      sub_2181B4                         [4]
    JP        loc_217FAE                         [4]

.org 0x218004

swp_218004:
    XOR       A,A                                [2]
    LD        (0x615E),A                         [4]
    LD        (0x6158),A                         [4]
    LD        (0x6159),A                         [4]
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x218018

swp_218018:
    LD        A,3                                [2]
    CALL      swp_2175B6                         [4]
    LD        XHL,(0x6162)                       [4]
    CALL      swp_21717A                         [4]
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x21802C

swp_21802C:
    LD        A,(0x615E)                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip                           [2]
    CALL      swp_2175A8                         [4]
    CALL      sub_2181A1                         [4]
    LDB       (0x615E),1                         [5]
.skip:
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x218047

swp_218047:
    CALL      sub_2181A1                         [4]
    CALL      swp_2175A8                         [4]
.loop:
    CALL      sub_2171A8                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JP        NZ,.skip                           [5]
    BIT       5,A                                [3]
    JP        NZ,.skip3                          [5]
    BIT       1,A                                [3]
    JP        NZ,.skip4                          [5]
    BIT       0,A                                [3]
    JP        NZ,.skip6                          [5]
    BIT       3,A                                [3]
    JP        NZ,.skip8                          [5]
    BIT       2,A                                [3]
    JP        NZ,.skip10                         [5]
    JP        .skip14                            [4]
.skip:
    LD        XHL,(0x616E)                       [4]
    CALL      swp_21717A                         [4]
    JR        NC,.skip2                          [2]
    LD        WA,0x81                            [3]
    CALL      sub_21990C                         [4]
    LD        L,(0x6158)                         [4]
    MUL       HL,(0x615F)                        [4]
    LD        A,(0x6159)                         [4]
    EXTZ      WA                                 [2]
    ADD       WA,HL                              [2]
    JP        .skip15                            [4]
.skip2:
    LD        WA,0x83                            [3]
    CALL      sub_21990C                         [4]
    JP        .skip14                            [4]
.skip3:
    LD        WA,0x82                            [3]
    CALL      sub_21990C                         [4]
    LD        WA,0xFFFF                          [3]
    JP        .skip15                            [4]
.skip4:
    LD        A,(0x6159)                         [4]
    INC       1,A                                [2]
    CP        A,(0x615F)                         [4]
    JR        C,.skip5                           [2]
    XOR       A,A                                [2]
.skip5:
    LD        (0x6159),A                         [4]
    JP        .skip13                            [4]
.skip6:
    LD        A,(0x6159)                         [4]
    DEC       1,A                                [2]
    JR        PL,.skip7                          [2]
    LD        A,(0x615F)                         [4]
    DEC       1,A                                [2]
.skip7:
    LD        (0x6159),A                         [4]
    JP        .skip13                            [4]
.skip8:
    LD        A,(0x6158)                         [4]
    INC       1,A                                [2]
    CP        A,(0x6161)                         [4]
    JR        C,.skip9                           [2]
    XOR       A,A                                [2]
.skip9:
    LD        (0x6158),A                         [4]
    JP        .skip12                            [4]
.skip10:
    LD        A,(0x6158)                         [4]
    DEC       1,A                                [2]
    JR        PL,.skip11                         [2]
    LD        A,(0x6161)                         [4]
    DEC       1,A                                [2]
.skip11:
    LD        (0x6158),A                         [4]
.skip12:
    LD        XHL,(0x6162)                       [4]
    CALL      swp_21717A                         [4]
.skip13:
    LD        XHL,(0x616A)                       [4]
    CALL      swp_21717A                         [4]
    LD        WA,0x80                            [3]
    CALL      sub_21990C                         [4]
.skip14:
    CALL      sub_2181A1                         [4]
    JP        .loop                              [4]
.skip15:
    LD        (0x615B),WA                        [4]
    LDB       (0x615D),0xFF                      [5]
    CALL      swp_2175AF                         [4]
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x21814F

swp_21814F:
    LD        A,(0x615E)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    CALL      swp_2175AF                         [4]
    LDB       (0x615E),0                         [5]
.skip:
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x218166

swp_218166:
    CALL      sub_2181B4                         [4]
    CALL      sub_2171A8                         [4]
    JP        loc_217FAE                         [4]

.org 0x218172

swp_218172:
    LD        XWA,0xFFFF0000                     [5]
    LD        WA,(0x615B)                        [4]
    LD        (0x6176),XWA                       [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x218184

swp_218184:
    LD        A,(0x6159)                         [4]
    CP        A,(0x615F)                         [4]
    JR        NC,.done                           [2]
    ADD       A,A                                [2]
    LD        XHL,(0x6172)                       [4]
    LDA       XHL,XHL+A                          [5]
    LD        B,(XHL+)                           [3]
    LD        C,(XHL+)                           [3]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x2181A1

sub_2181A1:
    CALL      swp_218184                         [4]
    JR        NC,.done                           [2]
    PUSH      BC                                 [1]
    LD        A,3                                [2]
    CALL      swp_2175B6                         [4]
    POP       BC                                 [1]
    CALL      swp_2175BB                         [4]
.done:
    RET                                          [1]

.org 0x2181B4

sub_2181B4:
    CPB       (0x615E),0                         [5]
    JR        Z,.done                            [2]
    CPB       (0x615D),0                         [5]
    JR        Z,.done                            [2]
    CALL      swp_218184                         [4]
    JR        NC,.done                           [2]
    LD        A,3                                [2]
    CALL      swp_21722F                         [4]
.done:
    RET                                          [1]

.org 0x2181CF

sub_2181CF:
    LD        XHL,(0x616A)                       [4]
    CALL      swp_21717A                         [4]
    RET                                          [1]
