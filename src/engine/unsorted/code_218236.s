; engine/unsorted/code_218236: 7 routines (each keeps its ROM address with .org)

.org 0x218236

swp_218236:
    RETI                                         [1]

.org 0x218237

swp_218237:
    PUSHW     0x8229                             [3]
    LD        A,0                                [2]

.org 0x21823C

loc_21823C:
    LD        W,(0x6182)                         [4]
    INC       1,W                                [2]
    CALL      swp_21B8D5                         [4]
    LD        (0x6160),A                         [4]
    LD        A,(0x6160)                         [4]
    EXTZ      WA                                 [2]
    ADD       WA,9                               [4]
    DIV{1}    WA,0xA                             [3]
    LD        (0x6161),A                         [4]
    LD        A,(0x6182)                         [4]
    SLL       2,A                                [3]
    LD        XHL,0x218218                       [5]
    LD        XHL,(XHL+A)                        [5]
    LD        BC,0                               [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    LD        BC,0x50B                           [3]
    LD        E,(0x6158)                         [4]
    INC       1,E                                [2]
    LD        WA,0x203                           [3]
    CALL      swp_2172A7                         [4]
    LD        BC,0x80B                           [3]
    LD        E,(0x6161)                         [4]
    LD        WA,0x203                           [3]
    CALL      swp_2172A7                         [4]
    LD        A,3                                [2]
    LD        B,1                                [2]
    LD        XHL,swp_218236                     [5]
    CALL      swp_217207                         [4]
    LD        A,(0x6182)                         [4]
    INC       1,A                                [2]
    LD        B,A                                [2]
    LD        A,(0x6158)                         [4]
    MUL{1}    WA,0xA                             [3]
    INC       1,A                                [2]
    LD        C,A                                [2]
    LD        DE,1                               [2]
    LD        WA,0xA                             [3]
.loop:
    PUSH      WA                                 [1]
    PUSH      BC                                 [1]
    PUSH      DE                                 [1]
    LD{1}     A,C                                [2]
    DEC       1,A                                [2]
    CP        A,(0x6160)                         [4]
    JR        C,.skip                            [2]
    CALL      swp_217F59                         [4]
    JP        .skip3                             [4]
.skip:
    LD{1}     WA,BC                              [2]
    CALL      sub_2183A2                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip2                          [2]
    LD        XHL,0x21822B                       [5]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    JP        .skip3                             [4]
.skip2:
    AND       A,0xF                              [3]
    PUSH      WA                                 [1]
    LD{1}     WA,BC                              [2]
    CALL      sub_21B8C0                         [4]
    CALL      swp_21B8E4                         [4]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      sub_217F78                         [4]
    POP       DE                                 [1]
    LD        B,8                                [2]
    LD{1}     C,E                                [2]
    LD        L,(0x218228)                       [5]
    EXTS      HL                                 [2]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      swp_2171B9                         [4]
    POP       DE                                 [1]
    POP       WA                                 [1]
    LD        B,9                                [2]
    LD{1}     C,E                                [2]
    LD        E,A                                [2]
    EXTZ      DE                                 [2]
    LD        WA,0x103                           [3]
    CALL      swp_2172A7                         [4]
.skip3:
    POP       DE                                 [1]
    POP       BC                                 [1]
    INC       1,C                                [2]
    INC       1,E                                [2]
    POP       WA                                 [1]
    DJNZ      WA,.loop                           [3]
    RET                                          [1]

.org 0x218331

swp_218331:
    RET                                          [1]

.org 0x21838A

sub_21838A:
    LD        A,(0x6158)                         [4]
    MUL{1}    WA,0xA                             [3]
    ADD       A,(0x6159)                         [4]
    INC       1,A                                [2]
    LD        W,(0x6182)                         [4]
    INC       1,W                                [2]
    CALL      sub_21B8A7                         [4]
    RET                                          [1]

.org 0x2183A2

sub_2183A2:
    CALL      sub_2196A8                         [4]
    RET                                          [1]

.org 0x2183A7

loc_2183A7:
    LD        XHL,swp_218332                     [5]
    LD        XDE,swp_218377                     [5]
    JR        0x2183BD                           [2]
