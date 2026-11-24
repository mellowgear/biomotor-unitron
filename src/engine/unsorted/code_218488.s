; engine/unsorted/code_218488: 11 routines (each keeps its ROM address with .org)

.org 0x218488

swp_218488:
    RETI                                         [1]

.org 0x218489

swp_218489:
    PUSHW     0x847B                             [3]
    LD        A,0                                [2]

.org 0x21848E

loc_21848E:
    CALL      sub_21864A                         [4]
    CALL      swp_2173C3                         [4]
    LD        (0x6160),A                         [4]
    LD        A,(0x6160)                         [4]
    EXTZ      WA                                 [2]
    ADD       WA,9                               [4]
    DIV{1}    WA,0xA                             [3]
    LD        (0x6161),A                         [4]
    LD        A,(0x6183)                         [4]
    SLL       2,A                                [3]
    LD        XHL,0x21845A                       [5]
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
    LD        XHL,swp_218488                     [5]
    CALL      swp_217207                         [4]
    CALL      sub_21864A                         [4]
    LD        B,W                                [2]
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
    CALL      sub_218645                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip2                          [2]
    LD        XHL,0x21847D                       [5]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    JP        .skip3                             [4]
.skip2:
    AND       A,0xF                              [3]
    PUSH      WA                                 [1]
    LD{1}     WA,BC                              [2]
    CALL      sub_21739F                         [4]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      sub_217F78                         [4]
    POP       DE                                 [1]
    LD        B,8                                [2]
    LD{1}     C,E                                [2]
    LD        L,(0x21847A)                       [5]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      swp_2171B9                         [4]
    POP       DE                                 [1]
    POP       WA                                 [1]
    LD        B,9                                [2]
    LD{1}     C,E                                [2]
    LD        E,A                                [2]
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

.org 0x218577

swp_218577:
    RET                                          [1]

.org 0x21862D

sub_21862D:
    LD        A,(0x6158)                         [4]
    MUL{1}    WA,0xA                             [3]
    ADD       A,(0x6159)                         [4]
    INC       1,A                                [2]
    CALL      sub_21864A                         [4]
    PUSH      WA                                 [1]
    CALL      swp_2173EE                         [4]
    POP       WA                                 [1]
    RET                                          [1]

.org 0x218645

sub_218645:
    CALL      sub_219701                         [4]
    RET                                          [1]

.org 0x21864A

sub_21864A:
    PUSH      XHL                                [1]
    LD        XHL,0x21865B                       [5]
    LD        W,(0x6183)                         [4]
    LD        W,(XHL+W)                          [5]
    POP       XHL                                [1]
    RET                                          [1]
    .db 01 02 03 04 05 05 09 08

.org 0x218663

loc_218663:
    LD        XHL,swp_2185C4                     [5]
    LD        XDE,swp_21860A                     [5]
    JR        loc_2186A3                         [2]

.org 0x21866F

sub_21866F:
    LD        A,5                                [2]
    LD        XHL,swp_218578                     [5]
    LD        XDE,swp_21860A                     [5]
    JR        loc_2186A3                         [2]

.org 0x21867D

sub_21867D:
    LD        A,6                                [2]
    LD        XHL,swp_21858C                     [5]
    LD        XDE,swp_21860A                     [5]
    JR        loc_2186A3                         [2]

.org 0x2186A3

loc_2186A3:
    LD        (0x616A),XHL                       [4]
    LD        (0x616E),XDE                       [4]
    LD        (0x6183),A                         [4]
    LD        A,0xA                              [2]
    LD        (0x615F),A                         [4]
    LD        XHL,loc_21848E                     [5]
    LD        (0x6162),XHL                       [4]
    LD        XHL,swp_218577                     [5]
    LD        (0x6166),XHL                       [4]
    LD        XHL,0x2183EE                       [5]
    LD        (0x6172),XHL                       [4]
    JP        loc_217EEE                         [4]
