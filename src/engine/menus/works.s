; engine/menus/works: 154 routines (each keeps its ROM address with .org)

.org 0x206179

swp_206179:
    PUSH      A                                  [1]
    PUSH      BC                                 [1]
    LD        H,0                                [2]
    LD{1}     A,L                                [2]
    SRL       4,HL                               [3]
    SLL       1,HL                               [3]
    LD        BC,1                               [2]
    RLC       A,BC                               [2]
    LD        HL,(XDE+HL)                        [5]
    AND       HL,BC                              [2]
    SCC       NZ,HL                              [2]
    POP       BC                                 [1]
    POP       A                                  [1]
    RET                                          [1]

.org 0x206371

swp_206371:
    SET       7,(XHL+7)                          [3]
    RET                                          [1]

.org 0x206C8F

swp_206C8F:
    LD        XHL,0x9000                         [5]
    JR        loc_206C9D                         [2]

.org 0x20892C

swp_20892C:
    OR        WA,2                               [4]
    RET                                          [1]

.org 0x208936

swp_208936:
    OR        WA,8                               [4]
    RET                                          [1]

.org 0x20893B

swp_20893B:
    OR        WA,0x10                            [4]
    RET                                          [1]

.org 0x208945

swp_208945:
    OR        WA,0x40                            [4]
    RET                                          [1]

.org 0x20DB57

dyn_20DB57:
    CALL      dyn_20DAB9                         [4]
    LD        XDE,0x200020                       [5]
    LD        A,(XDE+)                           [3]
    CP        A,(XHL+)                           [3]
    RET       NZ                                 [2]
    CP        XDE,0x200030                       [6]
    RET       Z                                  [2]
    JR        0x20DB60                           [2]

.org 0x20DDBC

sub_20DDBC:
    PUSHW     (XIZ+0xE)                          [3]
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0xA                              [2]
    LD        E,3                                [2]
    LD        HL,(XIZ+0xE)                       [3]
    CALL      dyn_207494                         [4]
    CPB       (0x5DF5),1                         [5]
    LD        XHL,swp_20DF5B                     [5]
    JR        C,.skip                            [2]
    LD        XHL,0x20DF61                       [5]
    JR        Z,.skip                            [2]
    LD        XHL,0x20DF67                       [5]
.skip:
    CALL      0x2076F7                           [4]
    LD        C,0                                [2]
    LD        E,0x20                             [2]
    LD        A,(XIZ+0x10)                       [3]
    CALL      dyn_2074C0                         [4]
    ADDW      (XIZ+0xE),8                        [5]
    LD        A,1                                [2]
.loop:
    PUSH      A                                  [1]
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0x12                             [2]
    LD        E,5                                [2]
    LD        HL,(XIZ+0xE)                       [3]
    CALL      dyn_207494                         [4]
    LD        A,(XSP)                            [2]
    CALL      dyn_20DB57                         [4]
    JR        Z,.skip2                           [2]
    LD        A,(XIZ+0x10)                       [3]
    LD        XHL,0x20DF6E                       [5]
    CALL      dyn_2076F3                         [4]
    JRL       .skip7                             [3]
.skip2:
    LD        A,(XSP)                            [2]
    CALL      dyn_20DAB9                         [4]
    ADD       XHL,0x10                           [6]
    PUSH      XHL                                [1]
    LD        A,(XIZ+0x10)                       [3]
    LD        C,8                                [2]
    LD        E,0                                [2]
    CALL      sub_20768A                         [4]
    CALL      0x207720                           [4]
    LD        XHL,(XSP)                          [2]
    LD{1}     C,(XHL+0xF)                        [5]
    LD        B,0                                [2]
    CALL      sub_207CF0                         [4]
    LD        C,8                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        L,(0x20DF7B)                       [5]
    CALL      DrawTextChar                       [4]
    LD        C,8                                [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        XHL,(XSP)                          [2]
    LD{1}     C,(XHL+0x2B)                       [5]
    LD        B,0                                [2]
    CALL      sub_207CF0                         [4]
    LD        C,8                                [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    LD        L,(0x20DF7B)                       [5]
    CALL      DrawTextChar                       [4]
    LD        C,1                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,(XSP)                          [2]
    ADD       XHL,0                              [6]
    CALL      0x2076F7                           [4]
    LD        C,1                                [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,(XSP)                          [2]
    ADD       XHL,0x1C                           [6]
    CALL      0x2076F7                           [4]
    LD        XDE,(XSP)                          [2]
    ADD       XDE,0x4D                           [6]
    LD        L,0x10                             [2]
    CALL      swp_206179                         [4]
    JR        Z,.skip3                           [2]
    PUSH      XDE                                [1]
    LD        C,0xC                              [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        L,(0x20DF7C)                       [5]
    CALL      DrawTextChar                       [4]
    POP       XDE                                [1]
.skip3:
    LD        L,0x11                             [2]
    CALL      swp_206179                         [4]
    JR        Z,.skip4                           [2]
    PUSH      XDE                                [1]
    LD        C,0xD                              [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        L,(0x20DF7D)                       [5]
    CALL      DrawTextChar                       [4]
    POP       XDE                                [1]
.skip4:
    LD        L,0x12                             [2]
    CALL      swp_206179                         [4]
    JR        Z,.skip5                           [2]
    PUSH      XDE                                [1]
    LD        C,0xE                              [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        L,(0x20DF7E)                       [5]
    CALL      DrawTextChar                       [4]
    POP       XDE                                [1]
.skip5:
    LD        L,0x13                             [2]
    CALL      swp_206179                         [4]
    JR        Z,.skip6                           [2]
    PUSH      XDE                                [1]
    LD        C,0xF                              [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        L,(0x20DF7F)                       [5]
    CALL      DrawTextChar                       [4]
    POP       XDE                                [1]
.skip6:
    LD        C,9                                [2]
    LD        E,2                                [2]
    CALL      0x20768E                           [4]
    POP       XHL                                [1]
    PUSH      XWA                                [1]
    LD{1}     A,(XHL+0x32)                       [5]
    CALL      sub_21B9C2                         [4]
    POP       XWA                                [1]
    CALL      0x2076F7                           [4]
.skip7:
    LD        E,(XSP)                            [2]
    DEC       1,E                                [2]
    MUL{1}    DE,5                               [3]
    ADD       DE,0x24                            [4]
    LD        C,1                                [2]
    CALL      0x2074C4                           [4]
    ADDW      (XIZ+0xE),0x30                     [5]
    POP       A                                  [1]
    INC       1,A                                [2]
    CP        A,4                                [2]
    JRL       C,.loop                            [3]
    POPW      (XIZ+0xE)                          [3]
    RET                                          [1]

.org 0x217427

loc_217427:
    LD        XHL,0x21742D                       [5]
    RET                                          [1]
    .db 59 59 59 59 59 59 FF

.org 0x2174C1

; [code] A = min(A, 100)
Cap100:
    CP        A,0x64                             [3]
    JR        C,.done                            [2]
    LD        A,0x64                             [2]
.done:
    RET                                          [1]

.org 0x2174C9

sub_2174C9:
    CALL      Random                             [4]
    MUL       XWA,0x100                          [4]
    DIV       XWA,0x7530                         [4]
    SRL       16,XWA                             [3]
    RET                                          [1]

.org 0x217757

sub_217757:
    POP       XHL                                [1]
    LD        (0x6123),XHL                       [4]
.loop:
    CALL      sub_2171A8                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        NZ,.skip                           [2]
    BIT       5,A                                [3]
    JR        NZ,.skip2                          [2]
    JR        .loop                              [2]
.skip:
    LD        A,0                                [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,0xFF                             [2]
.skip3:
    LD        XHL,(0x6123)                       [4]
    JP        (XHL)                              [2]

.org 0x21795E

swp_21795E:
    LD        XWA,(0x613E)                       [4]
    OR        XWA,XWA                            [2]
    RET                                          [1]

.org 0x217965

swp_217965:
    LD        (0x6146),A                         [4]
    XOR       XWA,XWA                            [2]
    LD        (0x613E),XWA                       [4]
    RET                                          [1]

.org 0x217982

swp_217982:
    LD        A,4                                [2]
    JP        swp_217965                         [4]

.org 0x217C44

sub_217C44:
    LD        A,8                                [2]
    LD        (0x614A),A                         [4]
    LD        A,8                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x217BFC                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x217C2C                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x217C3C                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]
    .db 23 08 01 12 01 FF 35 2E 29 34 FF 25 18 09 14 FF
    .db 00 00 6F 7C 21 00 00 01 75 7C 21 00 00 08 7A 7C
    .db 21 00 00 00 00 01 00 08 00 01 FF

.org 0x217E28

sub_217E28:
    LD        A,3                                [2]
    LD        (0x614A),A                         [4]
    LD        A,3                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x217E0D                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x217E1F                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x217E25                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]

.org 0x218332

swp_218332:
    CALL      sub_21838A                         [4]
    JR        NC,.skip                           [2]
    CALL      sub_2188A9                         [4]
    CALL      sub_218AD8                         [4]
    JR        loc_218352                         [2]
.skip:
    CALR      sub_218A69                         [3]
    LD        A,2                                [2]
    LD        B,8                                [2]
    LD        XHL,0x218AA8                       [5]
    CALL      swp_217207                         [4]

.org 0x218352

loc_218352:
    CALL      swp_217684                         [4]
    CALL      sub_21838A                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_2183A2                         [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    LD{1}     WA,BC                              [2]
    CALL      sub_21B8C0                         [4]
    CALL      swp_21B8F3                         [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
.done:
    RET                                          [1]

.org 0x218377

swp_218377:
    CALL      sub_21838A                         [4]
    JR        NC,loc_218389                      [2]
    LD        BC,WA                              [2]
    CALL      sub_2183A2                         [4]
    AND       A,0xF                              [3]
    JR        Z,loc_218389                       [2]

.org 0x218388

loc_218388:
    SCF                                          [1]

.org 0x218389

loc_218389:
    RET                                          [1]

.org 0x2183B3

sub_2183B3:
    LD        XHL,loc_218352                     [5]
    LD        XDE,loc_218388                     [5]
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

.org 0x218578

swp_218578:
    CALL      swp_218932                         [4]
    CALL      swp_21861D                         [4]
    JR        NC,.skip                           [2]
    CALL      sub_21862D                         [4]
    CALL      sub_21895C                         [4]
.skip:
    JR        loc_2185E9                         [2]

.org 0x21858C

swp_21858C:
    CALL      swp_218932                         [4]
    LD        XHL,(0x616E)                       [4]
    CALL      swp_21717A                         [4]
    JR        NC,.skip                           [2]
    CALL      sub_21862D                         [4]
    LD        (wDevelopMaterial),A               [4]
    CALL      sub_2189B4                         [4]
.skip:
    JR        loc_2185E9                         [2]

.org 0x2185A8

swp_2185A8:
    CALL      swp_218932                         [4]
    LD        XHL,(0x616E)                       [4]
    CALL      swp_21717A                         [4]
    JR        NC,.skip                           [2]
    CALL      sub_21862D                         [4]
    LD        (wDevelopTool),A                   [4]
    CALL      sub_2189B4                         [4]
.skip:
    JR        loc_2185E9                         [2]

.org 0x2185C4

swp_2185C4:
    CALL      sub_2188A9                         [4]
    CALL      sub_218AD8                         [4]
    CALL      swp_218932                         [4]
    CALL      swp_21861D                         [4]
    JR        NC,.skip                           [2]
    CALL      sub_21862D                         [4]
    CALL      sub_21895C                         [4]
.skip:
    JR        loc_2185E9                         [2]

.org 0x2185E0

swp_2185E0:
    LD        XHL,swp_21861D                     [5]
    CALL      sub_219238                         [4]

.org 0x2185E9

loc_2185E9:
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

.org 0x21860A

swp_21860A:
    CALL      sub_21862D                         [4]
    JR        NC,loc_21861C                      [2]
    LD        BC,WA                              [2]
    CALL      sub_218645                         [4]
    AND       A,0xF                              [3]
    JR        Z,loc_21861C                       [2]

.org 0x21861B

loc_21861B:
    SCF                                          [1]

.org 0x21861C

loc_21861C:
    RET                                          [1]

.org 0x21861D

swp_21861D:
    CALL      sub_21862D                         [4]
    RET       NC                                 [2]
    CALL      sub_218645                         [4]
    OR        A,A                                [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21868B

sub_21868B:
    LD        A,7                                [2]
    LD        XHL,swp_2185A8                     [5]
    LD        XDE,swp_21860A                     [5]
    JR        loc_2186A3                         [2]

.org 0x218699

sub_218699:
    LD        XHL,swp_2185E0                     [5]
    LD        XDE,loc_21861B                     [5]

.org 0x218743

swp_218743:
    LD        A,1                                [2]
    LD        (0x6161),A                         [4]
    LD        XHL,0x2186E4                       [5]
    LD        A,3                                [2]
    LD        BC,0                               [2]
    CALL      swp_2171DF                         [4]
    LD        A,3                                [2]
    LD        B,8                                [2]
    LD        XHL,0x218713                       [5]
    CALL      swp_217207                         [4]
    CALL      swp_21963B                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x301                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_219645                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x303                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_219640                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x304                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_21964A                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x305                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_21964F                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x306                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    CALL      swp_219654                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x307                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    CALL      sub_219659                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x309                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    CALL      sub_21965E                         [4]
    CALL      sub_21739F                         [4]
    LD        BC,0x30A                           [3]
    LD        WA,3                               [2]
    CALL      swp_2171DF                         [4]
    RET                                          [1]

.org 0x2187ED

swp_2187ED:
    CALL      swp_217684                         [4]
    CALL      sub_21880C                         [4]
    JR        NC,.done                           [2]
    CALL      sub_218846                         [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
.done:
    RET                                          [1]

.org 0x218802

swp_218802:
    LD        A,(0x6159)                         [4]
    CP        A,0                                [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21880C

sub_21880C:
    LD        A,(0x6159)                         [4]
    SLL       2,A                                [3]
    LD        XHL,0x218826                       [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      swp_21717A                         [4]
    CALL      swp_2173EE                         [4]
    RET                                          [1]
    .db 3B 96 21 00 45 96 21 00 40 96 21 00 4A 96 21 00
    .db 4F 96 21 00 54 96 21 00 59 96 21 00 5E 96 21 00

.org 0x218846

sub_218846:
    CALL      sub_2173D5                         [4]
    RET                                          [1]

.org 0x21884B

sub_21884B:
    LD        A,8                                [2]
    LD        (0x615F),A                         [4]
    LD        XHL,swp_218743                     [5]
    LD        (0x6162),XHL                       [4]
    LD        XHL,swp_2187EC                     [5]
    LD        (0x6166),XHL                       [4]
    LD        XHL,swp_2187ED                     [5]
    LD        (0x616A),XHL                       [4]
    LD        XHL,swp_218802                     [5]
    LD        (0x616E),XHL                       [4]
    LD        XHL,0x2186D4                       [5]
    LD        (0x6172),XHL                       [4]
    JP        loc_217EEE                         [4]

.org 0x218882

sub_218882:
    LD        (0x6184),A                         [4]
    LD        XHL,0x2188A1                       [5]
    LD        A,(XHL+A)                          [5]
    CP        A,5                                [2]
    JP        NC,.skip                           [5]
    JP        loc_218663                         [4]
.skip:
    LD        A,0                                [2]
    JP        loc_2183A7                         [4]
    .db 00 04 04 01 02 03 05 05

.org 0x2188A9

sub_2188A9:
    CPB       (0x6184),6                         [5]
    JR        NC,.skip                           [2]
    CALL      sub_21862D                         [4]
    JR        NC,.skip2                          [2]
    JR        .skip3                             [2]
.skip:
    CALL      sub_21838A                         [4]
    JR        NC,.skip2                          [2]
    ADD       W,5                                [3]
    JR        .skip3                             [2]
.skip2:
    LD        WA,0                               [2]
.skip3:
    LD        BC,WA                              [2]
    LD        A,(0x6184)                         [4]
    SLL       2,A                                [3]
    LD        XHL,0x2188DF                       [5]
    LD        XHL,(XHL+A)                        [5]
    LD{1}     WA,BC                              [2]
    CALL      swp_21717A                         [4]
    RET                                          [1]
    .db 63 96 21 00 6D 96 21 00 68 96 21 00 72 96 21 00
    .db 77 96 21 00 7C 96 21 00 81 96 21 00 86 96 21 00

.org 0x218932

swp_218932:
    LD        A,4                                [2]
    CALL      sub_21734E                         [4]
    RET                                          [1]

.org 0x21895C

sub_21895C:
    CALL      sub_218965                         [4]
    CALL      sub_21896A                         [4]
    RET                                          [1]

.org 0x218965

sub_218965:
    LD        (0x6189),WA                        [4]
    RET                                          [1]

.org 0x21896A

sub_21896A:
    LD        A,4                                [2]
    CALL      sub_21734E                         [4]
    LD        WA,(0x6189)                        [4]
    OR        WA,WA                              [2]
    JR        Z,.done                            [2]
    CALL      sub_217434                         [4]
    LD        WA,(XHL+0xC)                       [3]
    LD        (0x618B),A                         [4]
    LD        WA,(XHL+0xE)                       [3]
    LD        (0x618C),A                         [4]
    LD        XHL,0x218959                       [5]
    LD        WA,4                               [2]
    CALL      swp_2171DF                         [4]
    LD        BC,0x200                           [3]
    LD        E,(0x618B)                         [4]
    LD        WA,0x204                           [3]
    CALL      swp_2172A7                         [4]
    LD        BC,0x500                           [3]
    LD        E,(0x618C)                         [4]
    LD        WA,0x304                           [3]
    CALL      swp_21746E                         [4]
.done:
    RET                                          [1]
    .db 52 FF

.org 0x2189B4

sub_2189B4:
    CALL      UpdateDevelopChance                [4]
    CALL      sub_218A34                         [4]
    RET                                          [1]

.org 0x2189BD

; [code+play] wDevelopChance = recipe pct + level/partner/tool bonuses (0x6190 in play)
UpdateDevelopChance:
    LD        W,(wDevelopArm)                    [4]
    LD        A,(wDevelopMaterial)               [4]
    CALL      GetRecipe                          [4]
    LD        A,(XHL+0)                          [3]
    LD        (wDevelopChance),A                 [4]
    LD        A,(XHL+1)                          [3]
    LD        (wDevelopResult),A                 [4]
    LD        A,(XHL+2)                          [3]
    LD        (wDevelopExp),A                    [4]
    LD        A,(wDevelopChance)                 [4]
    OR        A,A                                [2]
    JP        MI,.done                           [5]
    LD        A,(wWorksPartnerRace)              [4]
    CALL      SplitRaceGender                    [4]
    LD        A,(wWorksEngineerLevel)            [4]
    CALL      GetDevLevelBonus                   [4]
    ADD       A,(wDevelopChance)                 [4]
    CALL      Cap100                             [4]
    LD        (wDevelopChance),A                 [4]
    LD        A,(wWorksPartnerRace)              [4]
    CALL      GetDevPartnerBonus                 [4]
    ADD       A,(wDevelopChance)                 [4]
    CALL      Cap100                             [4]
    LD        (wDevelopChance),A                 [4]
    LD        A,(wDevelopTool)                   [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    JR        MI,.done                           [2]
    CALL      GetDevToolBonus                    [4]
    ADD       A,(wDevelopChance)                 [4]
    CALL      Cap100                             [4]
    LD        (wDevelopChance),A                 [4]
.done:
    RET                                          [1]

.org 0x218A34

sub_218A34:
    LD        A,4                                [2]
    CALL      sub_21734E                         [4]
    LD        A,(wDevelopChance)                 [4]
    OR        A,A                                [2]
    JP        MI,.done                           [5]
    LD        BC,0x400                           [3]
    LD        XHL,0x2189B2                       [5]
    LD        WA,4                               [2]
    CALL      swp_2171DF                         [4]
    LD        BC,0x100                           [3]
    LD        E,(wDevelopChance)                 [4]
    LD        WA,0x304                           [3]
    CALL      swp_217299                         [4]
.done:
    RET                                          [1]

.org 0x218A69

sub_218A69:
    LD        A,2                                [2]
    CALL      sub_21734E                         [4]
    RET                                          [1]

.org 0x218D67

swp_218D67:
    OR        BC,2                               [4]
    RET                                          [1]

.org 0x218D7B

swp_218D7B:
    OR        BC,0x20                            [4]
    RET                                          [1]

.org 0x218D80

swp_218D80:
    OR        BC,0x40                            [4]
    RET                                          [1]

.org 0x218D98

swp_218D98:
    ADDW      (0x6193),0x50                      [6]
    RET                                          [1]

.org 0x218FFB

sub_218FFB:
    CALL      sub_219004                         [4]
    CALL      sub_219048                         [4]
    RET                                          [1]

.org 0x219004

sub_219004:
    LD        XHL,(0x61DB)                       [4]
    LD        (0x61A3),XHL                       [4]
    XOR       A,A                                [2]
    LD        (0x61A7),A                         [4]
    LD        A,(wWorksPartnerRace)              [4]
    LD        (0x61A8),A                         [4]
    LD        A,(wWorksEngineerLevel)            [4]
    LD        (0x61A9),A                         [4]
    LD        A,(0x61E1)                         [4]
    LD        (0x61AA),A                         [4]
    LD        WA,(wEngineerExp)                  [4]
    LD        (0x61AB),A                         [4]
    RET                                          [1]

.org 0x219048

sub_219048:
    LD        A,2                                [2]
    CALL      sub_21734E                         [4]
    LD        XHL,loc_218FA6                     [5]
    LD        BC,2                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]

.org 0x219245

sub_219245:
    CALL      sub_21924E                         [4]
    CALL      sub_2192DE                         [4]
    RET                                          [1]

.org 0x21924E

sub_21924E:
    LD        (0x61B3),WA                        [4]
    JP        loc_219273                         [4]

.org 0x2193A3

sub_2193A3:
    CALL      sub_2193AC                         [4]
    CALL      sub_2193C5                         [4]
    RET                                          [1]

.org 0x2193AC

sub_2193AC:
    LDB       (0x61C2),1                         [5]
    LD        A,(wDevelopResult)                 [4]
    LD        W,5                                [2]
    CALL      sub_217434                         [4]
    JR        NC,.done                           [2]
    LD        WA,(XHL+0x12)                      [3]
    LD        (0x61C2),A                         [4]
.done:
    RET                                          [1]

.org 0x2193C5

sub_2193C5:
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
    LD        B,(0x6106)                         [4]
    LD        D,(0x6107)                         [4]
    LD        QB,0xC                             [4]
    LD        QD,0xB                             [4]
    LD        WA,0x7E                            [3]
    LD        BC,0                               [2]
    LD        DE,2                               [2]
    CALL      swp_206C8F                         [4]
    LD        HL,0x7E                            [3]
    LD        B,(0x61C2)                         [4]
    LD        C,1                                [2]
    CALL      DrawRightArmPart                   [4]
    LD        HL,0x7E                            [3]
    LD        B,(0x61C2)                         [4]
    LD        C,1                                [2]
    CALL      DrawLeftArmPart                    [4]
    RET                                          [1]

.org 0x219424

sub_219424:
    CALL      sub_21943E                         [4]
    CALL      sub_219444                         [4]
    CALL      sub_2194C6                         [4]
    RET                                          [1]

.org 0x21943E

sub_21943E:
    CALL      CopyEquipToWorks                   [4]
    RET                                          [1]

.org 0x219444

sub_219444:
    LD        XHL,wPlayerName                    [5]
    LD        (0x61D3),XHL                       [4]
    LD        A,(wArenaRank)                     [4]
    LD        (0x61D7),A                         [4]
    LD        A,(wPlayerRace)                    [4]
    LD        (0x61D8),A                         [4]
    LD        A,(wPlayerLevel)                   [4]
    LD        (0x61D9),A                         [4]
    CALL      sub_21948B                         [4]
    LD        XHL,wPartnerName                   [5]
    LD        (0x61DB),XHL                       [4]
    LD        A,(wPartnerRace)                   [4]
    LD        (wWorksPartnerRace),A              [4]
    LD        A,(wEngineerLevel)                 [4]
    LD        (wWorksEngineerLevel),A            [4]
    LD        A,(0x61DA)                         [4]
    LD        (0x61E1),A                         [4]
    RET                                          [1]

.org 0x21948B

sub_21948B:
    LDB       (0x61DA),0                         [5]
    LD        A,0x10                             [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip                           [2]
    ORB       (0x61DA),2                         [5]
.skip:
    LD        A,0x11                             [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip2                          [2]
    ORB       (0x61DA),4                         [5]
.skip2:
    LD        A,0x12                             [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip3                          [2]
    ORB       (0x61DA),8                         [5]
.skip3:
    LD        A,0x13                             [2]
    CALL      sub_219823                         [4]
    JR        NC,.done                           [2]
    ORB       (0x61DA),0x10                      [5]
.done:
    RET                                          [1]

.org 0x2194C6

sub_2194C6:
    RET                                          [1]

.org 0x2194C8

; [code] equipment slots -> Works list 0x61C3 (category << 8 | id: body, RA, LA, core, legs, back, A1, A2)
CopyEquipToWorks:
    LDW       (0x61C3),0                         [6]
    LDW       (0x61C5),0                         [6]
    LDW       (0x61C7),0                         [6]
    LDW       (0x61C9),0                         [6]
    LDW       (0x61CB),0                         [6]
    LDW       (0x61CD),0                         [6]
    LDW       (0x61CF),0                         [6]
    LDW       (0x61D1),0                         [6]
    LD        WA,0x200                           [3]
    OR        A,(wEquipCore)                     [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61C9),WA                        [4]
    LD        WA,0x100                           [3]
    OR        A,(wEquipBody)                     [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61C3),WA                        [4]
    LD        WA,0x500                           [3]
    OR        A,(wEquipLeftArm)                  [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61C5),WA                        [4]
    LD        WA,0x500                           [3]
    OR        A,(wEquipRightArm)                 [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61C7),WA                        [4]
    LD        WA,0x300                           [3]
    OR        A,(wEquipLegs)                     [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61CB),WA                        [4]
    LD        WA,0x400                           [3]
    OR        A,(wEquipBack)                     [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61CD),WA                        [4]
    LD        WA,0x600                           [3]
    OR        A,(wEquipAcc1)                     [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61CF),WA                        [4]
    LD        WA,0x600                           [3]
    OR        A,(wEquipAcc2)                     [4]
    CALL      Z,sub_219579                       [5]
    LD        (0x61D1),WA                        [4]
    RET                                          [1]

.org 0x219579

sub_219579:
    LD        WA,0                               [2]
    RET                                          [1]

.org 0x2195BD

swp_2195BD:
    LD        WA,(0x61C9)                        [4]
    LD        XHL,wEquipCore                     [5]
    CALL      sub_219626                         [4]
    LD        WA,(0x61C3)                        [4]
    LD        XHL,wEquipBody                     [5]
    CALL      sub_219626                         [4]
    LD        WA,(0x61C5)                        [4]
    LD        XHL,wEquipLeftArm                  [5]
    CALL      sub_219626                         [4]
    LD        WA,(0x61C7)                        [4]
    LD        XHL,wEquipRightArm                 [5]
    CALL      sub_219626                         [4]
    LD        WA,(0x61CB)                        [4]
    LD        XHL,wEquipLegs                     [5]
    CALL      sub_219626                         [4]
    LD        WA,(0x61CD)                        [4]
    LD        XHL,wEquipBack                     [5]
    CALL      sub_219626                         [4]
    LD        WA,(0x61CF)                        [4]
    LD        XHL,wEquipAcc1                     [5]
    CALL      sub_219626                         [4]
    LD        WA,(0x61D1)                        [4]
    LD        XHL,wEquipAcc2                     [5]
    CALL      sub_219626                         [4]
    RET                                          [1]

.org 0x219626

sub_219626:
    CP        (XHL),A                            [2]
    RET       Z                                  [2]
    LD        B,W                                [2]
    LD        C,(XHL)                            [2]
    LD        (XHL),A                            [2]
    PUSH      BC                                 [1]
    CALL      sub_219720                         [4]
    POP       WA                                 [1]
    CALL      sub_219713                         [4]
    RET                                          [1]

.org 0x219668

swp_219668:
    LD        (0x61C5),WA                        [4]
    RET                                          [1]

.org 0x21966D

swp_21966D:
    LD        (0x61C7),WA                        [4]
    RET                                          [1]

.org 0x219672

swp_219672:
    LD        (0x61C9),WA                        [4]
    RET                                          [1]

.org 0x219677

swp_219677:
    LD        (0x61CB),WA                        [4]
    RET                                          [1]

.org 0x21967C

swp_21967C:
    LD        (0x61CD),WA                        [4]
    RET                                          [1]

.org 0x219681

swp_219681:
    LD        (0x61CF),WA                        [4]
    RET                                          [1]

.org 0x219686

swp_219686:
    LD        (0x61D1),WA                        [4]
    RET                                          [1]

.org 0x2196C7

sub_2196C7:
    CALL      loc_21968B                         [4]
    RET       NC                                 [2]
    INC       1,WA                               [2]
    CALL      RemoveItem                         [4]
    RET                                          [1]

.org 0x219720

sub_219720:
    CALL      sub_2196D4                         [4]
    RET       NC                                 [2]
    INC       1,WA                               [2]
    CALL      RemoveItem                         [4]
    RET                                          [1]

.org 0x219785

; [code+play] C if engineer level < 50 and wEngineerExp <= 0
CheckEngineerLevelUp:
    CPB       (wWorksEngineerLevel),0x32         [5]
    JR        NC,.done                           [2]
    LD        WA,(wEngineerExp)                  [4]
    CP        WA,1                               [2]
    JR        PL,.done                           [2]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x2197B5

swp_2197B5:
    LD        BC,0                               [2]
    LD        DE,0x20                            [3]

.org 0x2197CC

swp_2197CC:
    CALL      sub_2197DD                         [4]
    LD        A,0x35                             [2]
    CALL      sub_2197C1                         [4]
    LD        A,0xFF                             [2]
    CALL      swp_2197B5                         [4]
    RET                                          [1]

.org 0x219823

sub_219823:
    LD        L,A                                [2]
    EXTZ      HL                                 [2]
    CALL      CheckEventFlag                     [4]
    OR        HL,HL                              [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x219831

swp_219831:
    LD        L,A                                [2]
    EXTZ      HL                                 [2]
    CALL      SetEventFlag                       [4]
    RET                                          [1]

.org 0x219911

swp_219911:
    LD        XWA,2                              [2]
    JP        loc_219907                         [4]

.org 0x219947

; [code] partner's greeting by time of day / story
WorksGreeting:
    CPB       (0x61F6),4                         [5]
    JR        Z,.skip                            [2]
    CPB       (0x61F6),5                         [5]
    JR        Z,.skip                            [2]
    CALL      swp_2197CC                         [4]
    JR        .done                              [2]
.skip:
    CALL      sub_2197DD                         [4]
.done:
    RET                                          [1]

.org 0x219960

loc_219960:
    CALL      WorksGreeting                      [4]
    CALL      swp_218939                         [4]
    CPB       (0x61F6),4                         [5]
    JP        Z,loc_219BA3                       [5]
    CPB       (0x61F6),5                         [5]
    JP        Z,loc_219D1A                       [5]
    CALL      swp_219911                         [4]
    LD        WA,0x22                            [3]
    CALL      sub_21990C                         [4]
    CPB       (0x61F6),3                         [5]
    JP        Z,loc_21AA73                       [5]
    CPB       (wWorksEngineerLevel),0xA          [5]
    JR        C,.skip                            [2]
    LD        A,0xA0                             [2]
    CALL      sub_219823                         [4]
    JR        NZ,.skip                           [2]
    LD        XHL,JustThePersonIText             [5]
    LD        XDE,JustThePersonIText2            [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_219A40                         [4]
    LD        A,0xA0                             [2]
    CALL      swp_219831                         [4]
    JP        .skip5                             [4]
.skip:
    CPB       (wWorksEngineerLevel),0x1E         [5]
    JR        C,.skip2                           [2]
    LD        A,0xA1                             [2]
    CALL      sub_219823                         [4]
    JR        NZ,.skip2                          [2]
    LD        XHL,IveGotSomeGoodText             [5]
    LD        XDE,IveGotSomeGoodText2            [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_219A40                         [4]
    LD        A,0xA1                             [2]
    CALL      swp_219831                         [4]
    JP        .skip5                             [4]
.skip2:
    LD        A,9                                [2]
    CALL      sub_219823                         [4]
    JR        Z,.skip3                           [2]
    LD        XHL,ImGladToSeeText                [5]
    LD        XDE,ImSoGladToText                 [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        .skip5                             [4]
.skip3:
    CPB       (0x61F6),2                         [5]
    JR        NZ,.skip4                          [2]
    LD        XHL,GoodMorningHowDoText           [5]
    LD        XDE,GoodMorningPlayerIText         [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        .skip5                             [4]
.skip4:
    LD        XHL,WelcomeBackEverythingHeresText [5]
    LD        XDE,WelcomeBackIJustText2          [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
.skip5:
    JP        loc_219A5B                         [4]

.org 0x219A40

sub_219A40:
    LD        WA,(0x61C3)                        [4]
    INC       1,A                                [2]
    LD        (0x61C3),WA                        [4]
    CALL      sub_219713                         [4]
    CALL      swp_2195BD                         [4]
    RET                                          [1]

.org 0x219A5B

loc_219A5B:
    CALL      swp_218939                         [4]
    CALL      sub_217C44                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217982                         [4]
    LD        XHL,WhatDoYouWantText2             [5]
    LD        XDE,WhatDoYouWantText2             [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    LDB       (0x61F9),0xFF                      [5]

.org 0x219A8A

loc_219A8A:
    CALL      swp_21795E                         [4]
    JP        Z,loc_219ADB                       [5]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,loc_21AA5D                      [5]
    CP        A,0                                [2]
    JP        Z,loc_219BA3                       [5]
    CP        A,1                                [2]
    JP        Z,loc_219D1A                       [5]
    CP        A,2                                [2]
    JP        Z,loc_219E5F                       [5]
    CP        A,3                                [2]
    JP        Z,loc_21A005                       [5]
    CP        A,4                                [2]
    JP        Z,loc_21A570                       [5]
    CP        A,5                                [2]
    JP        Z,loc_21A68F                       [5]
    CP        A,6                                [2]
    JP        Z,loc_219F7C                       [5]
    JP        loc_21AA5D                         [4]

.org 0x219AD3

loc_219AD3:
    CALL      sub_2171A8                         [4]
    JP        loc_219A8A                         [4]

.org 0x219ADB

loc_219ADB:
    LD        A,(0x6139)                         [4]
    CP        A,(0x61F9)                         [4]
    JP        Z,loc_219AD3                       [5]
    LD        (0x61F9),A                         [4]
    CALL      swp_217657                         [4]
    LD        A,(0x61F9)                         [4]
    CP        A,8                                [3]
    JP        NC,loc_219AD3                      [5]
    SLL       2,A                                [3]
    LD        XHL,0x219B0B                       [5]
    LD        XHL,(XHL+A)                        [5]
    JP        (XHL)                              [2]
    .db 63 9B 21 00 71 9B 21 00 39 9B 21 00 2B 9B 21 00
    .db 55 9B 21 00 8D 9B 21 00 47 9B 21 00 7F 9B 21 00

.org 0x219B55

swp_219B55:
    LD        XHL,IfYouAttachAText               [5]
    LD        XDE,IfYouAttachAText               [5]
    JP        loc_219B97                         [4]

.org 0x219B63

swp_219B63:
    LD        XHL,YouCanChangeYourText           [5]
    LD        XDE,YouCanChangeYourText           [5]
    JP        loc_219B97                         [4]

.org 0x219B71

swp_219B71:
    LD        XHL,YouCanMakeNewText              [5]
    LD        XDE,YouCanMakeNewText              [5]
    JP        loc_219B97                         [4]

.org 0x219B8D

; [code+play] "This is your UNITRON's..." / help; Works and Camp stats screens
StatsMenu:
    LD        XHL,DisplaysHelpFilesText          [5]
    LD        XDE,DisplaysHelpFilesText          [5]

.org 0x219B97

loc_219B97:
    CALL      sub_2198EB                         [4]
    CALL      swp_217699                         [4]
    JP        loc_219AD3                         [4]

.org 0x219C86

; [code] Stats (your / my status), item data, data list, edit
WorksInfoMenus:
    POP       XHL                                [1]
    LD        (0x61FC),XHL                       [4]
    CALL      sub_2179FE                         [4]
    XOR       A,A                                [2]
    LD        (0x6200),A                         [4]
    CALL      swp_218939                         [4]
.loop:
    CALL      swp_217657                         [4]
    LD        A,(0x6200)                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip                           [2]
    LD        XHL,ThisIsYourStatusText           [5]
    LD        XDE,ThisIsYourStatusText           [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_219807                         [4]
    LD        A,0xFE                             [2]
    CALL      swp_2197B5                         [4]
    CALL      sub_218FC1                         [4]
    JR        .loop2                             [2]
.skip:
    LD        XHL,ThisIsMyStatusText             [5]
    LD        XDE,ThisIsMyStatusText             [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_219807                         [4]
    LD        A,0xFF                             [2]
    CALL      swp_2197B5                         [4]
    CALL      sub_218FFB                         [4]
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

.org 0x219F73

; [code+play] "Opening help files"; help_p* screens
WorksHelpMenu:
    CALL      sub_21ABDA                         [4]
    CALL      swp_2175AF                         [4]
    RET                                          [1]

.org 0x219F7C

loc_219F7C:
    LD        XHL,OpeningHelpFilesText           [5]
    LD        XDE,OpeningHelpFilesText           [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      WorksTradeMenu                     [4]
    LDB       (0x6202),0                         [5]
    LD        XHL,swp_219FCD                     [5]
    CALL      StartChildTask                     [4]
.loop:
    CALL      sub_2171A8                         [4]
    CPB       (0x6202),0                         [5]
    JR        Z,.loop                            [2]
    CALL      swp_21AB7A                         [4]
    CALL      swp_2197CC                         [4]
    CALL      swp_218939                         [4]
    LD        XHL,FinishedText                   [5]
    LD        XDE,FinishedText                   [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        loc_219A5B                         [4]

.org 0x219FCD

swp_219FCD:
    LD        XHL,swp_21D509                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x7E                     [5]
    LDW       (XHL+0x10),8                       [5]
    task_wait
    LDB       (0x6202),1                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x219FF8

; [code] link-cable trade (no cable / transmission error)
WorksTradeMenu:
    CALL      sub_2179FE                         [4]
    CALL      sub_21ABDA                         [4]
    CALL      swp_2175AF                         [4]
    RET                                          [1]

.org 0x21A005

loc_21A005:
    LD        XHL,YouWantToTradeText             [5]
    LD        XDE,YouWantToTradeText             [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_21D1CF                         [4]
    CALL      sub_21D1F6                         [4]
    CALL      sub_21D25C                         [4]
    LD        XHL,CheckingText                   [5]
    LD        XDE,CheckingText                   [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    LDW       (0x6203),0                         [6]
.loop:
    CPW       (0x6203),0x258                     [6]
    JR        NC,.skip                           [2]
    CALL      sub_21D218                         [4]
    JR        C,.skip                            [2]
    CALL      sub_2171A8                         [4]
    CALL      sub_21A443                         [4]
    JR        NC,.loop                           [2]
.skip:
    CALL      sub_21D218                         [4]
    JP        NC,.skip10                         [5]
    LD        XHL,LooksLikeTheresNoText          [5]
    LD        XDE,LooksLikeTheresNoText          [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    LD        XHL,ReadyToTradeText               [5]
    LD        XDE,ReadyToTradeText               [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JP        NZ,.skip9                          [5]
.loop2:
    CALL      sub_21D210                         [4]
    CALL      sub_21A32D                         [4]
    CALL      sub_21D25C                         [4]
    CALL      sub_217CF0                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,WhatItemDoYouText              [5]
    LD        XDE,WhatItemDoYouText              [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.skip9                          [5]
    CP        A,0                                [2]
    JP        Z,.loop3                           [5]
    CP        A,1                                [2]
    JP        Z,.loop4                           [5]
    JP        .skip9                             [4]
.loop3:
    CALL      sub_217D60                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,WhichPartDoYouText             [5]
    LD        XDE,WhichPartDoYouText             [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.loop2                          [5]
    INC       1,A                                [2]
    LD        (0x61FB),A                         [4]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x613B)                         [4]
    CALL      sub_21B86C                         [4]
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,WhichDoYouChooseText           [5]
    LD        XDE,WhichDoYouChooseText           [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    CALL      sub_217F0C                         [4]
    CALL      swp_2197CC                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop3                          [5]
    JP        .skip2                             [4]
.loop4:
    CALL      sub_217DD3                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,WhichItemDoYouText2            [5]
    LD        XDE,WhichItemDoYouText2            [5]
    CALL      sub_2198E3                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.loop2                          [5]
    ADD       A,6                                [3]
    LD        (0x61FB),A                         [4]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x613B)                         [4]
    CALL      sub_21B7F2                         [4]
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,WhichDoYouChooseText           [5]
    LD        XDE,WhichDoYouChooseText           [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    CALL      sub_217F0C                         [4]
    CALL      swp_2197CC                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop4                          [5]
.skip2:
    INC       1,A                                [2]
    LD        (0x61FA),A                         [4]
    LD        WA,(0x61FA)                        [4]
    CALL      sub_21D236                         [4]
    CALL      sub_21A334                         [4]
.loop5:
    CALL      sub_21A50D                         [4]
    JR        C,.skip3                           [2]
    CALL      sub_2171A8                         [4]
    CALL      sub_21A443                         [4]
    JR        .loop5                             [2]
.skip3:
    CALL      sub_21A374                         [4]
    CALL      sub_21A50D                         [4]
    JP        MI,.skip10                         [5]
    CALL      sub_21A2E2                         [4]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    CALL      sub_21A4CC                         [4]
.loop6:
    CALL      sub_21A4EC                         [4]
    JR        C,.skip4                           [2]
    CALL      sub_2171A8                         [4]
    CALL      sub_21A443                         [4]
    JR        .loop6                             [2]
.skip4:
    CALL      sub_21A374                         [4]
    CALL      sub_21A4EC                         [4]
    JP        MI,.skip6                          [5]
    JP        NZ,.skip5                          [5]
    CALL      WorksSetupMenu                     [4]
    LD        XHL,TheTradeWasSuccessfulText      [5]
    LD        XDE,TradingCompleteText            [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JR        .skip7                             [2]
.skip5:
    LD        XHL,LooksLikeItsNotText            [5]
    LD        XDE,LooksLikeItsNotText            [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JR        .skip7                             [2]
.skip6:
    LD        XHL,TransmissionErrorTryAgainText  [5]
    LD        XDE,TransmissionErrorTryAgainText  [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        .skip11                            [4]
.skip7:
    LD        XHL,DoYouWantToText4               [5]
    LD        XDE,DoYouWantToText4               [5]
    CALL      sub_2198EB                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JP        NZ,.skip9                          [5]
    CALL      sub_21D25C                         [4]
.loop7:
    CALL      sub_21A533                         [4]
    JR        C,.skip8                           [2]
    CALL      sub_2171A8                         [4]
    CALL      sub_21A443                         [4]
    JR        NC,.loop7                          [2]
.skip8:
    CALL      sub_21A533                         [4]
    JP        MI,.skip10                         [5]
    JP        .loop2                             [4]
.skip9:
    LD        XHL,ReadyToQuitIllText             [5]
    LD        XDE,ReadyToQuitIllText             [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JR        .skip11                            [2]
.skip10:
    LD        XHL,LooksLikeTheresNoText2         [5]
    LD        XDE,LooksLikeTheresNoText2         [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
.skip11:
    CALL      sub_21D1E7                         [4]
    JP        loc_219A5B                         [4]

.org 0x21A2E2

sub_21A2E2:
    LD        WA,(0x6207)                        [4]
    CALL      sub_219701                         [4]
    LD        XHL,YouHaveTooManyText             [5]
    LD        XDE,YouHaveTooManyText             [5]
    RET       NC                                 [2]
    AND       A,0x7F                             [3]
    CP        A,9                                [3]
    RET       NC                                 [2]
    LD        XHL,AreYouSureText                 [5]
    LD        XDE,AreYouSureText                 [5]
    RET                                          [1]
    .db 33 05 0C 06 FF 2F 14 08 05 12 FF 59 59 FF 2F 2B
    .db FF 2E 2F FF 00 00 00 00 00 00 FF 00 00 00 00 00
    .db 00 00 00 FF

.org 0x21A32D

sub_21A32D:
    XOR       XHL,XHL                            [2]
    CALL      sub_21D26B                         [4]
    RET                                          [1]

.org 0x21A334

sub_21A334:
    LD        XHL,sub_21A374                     [5]
    CALL      sub_21D26B                         [4]
    LD        A,2                                [2]
    CALL      sub_21734E                         [4]
    LD        XHL,0x21A309                       [5]
    LD        BC,0                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    LD        XHL,0x21A30E                       [5]
    LD        BC,3                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    LDW       (0x6203),0                         [6]
    LDW       (0x6205),0xFFFF                    [6]
    LDW       (0x6207),0xFFFF                    [6]
    LDB       (0x6209),0xFF                      [5]

.org 0x21A374

sub_21A374:
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+4)                         [3]
    CP        (0x6205),WA                        [4]
    JR        Z,.skip                            [2]
    LD        (0x6205),WA                        [4]
    LD        XHL,0x21A31D                       [5]
    LD        BC,1                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    LD        WA,(0x6205)                        [4]
    CALL      sub_21739F                         [4]
    LD        BC,1                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
.skip:
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+2)                         [3]
    CP        (0x6207),WA                        [4]
    JR        Z,.skip2                           [2]
    LD        (0x6207),WA                        [4]
    LD        XHL,0x21A31D                       [5]
    LD        BC,4                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    LD        WA,(0x6207)                        [4]
    CALL      sub_21739F                         [4]
    LD        BC,4                               [2]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
.skip2:
    CALL      sub_21D256                         [4]
    LD        A,(XHL+1)                          [3]
    CP        (0x6209),A                         [4]
    JR        Z,.done                            [2]
    LD        (0x6209),A                         [4]
    AND       A,8                                [3]
    LD        XHL,0x21A317                       [5]
    LD        XDE,0x21A31A                       [5]
    CALL      sub_21A43E                         [4]
    LD        A,(0x6209)                         [4]
    AND       A,2                                [3]
    LD{1}     XDE,XHL                            [2]
    LD        XHL,0x21A314                       [5]
    CALL      sub_21A43E                         [4]
    LD        BC,0x400                           [3]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
    LD        A,(0x6209)                         [4]
    AND       A,4                                [3]
    LD        XHL,0x21A317                       [5]
    LD        XDE,0x21A31A                       [5]
    CALL      sub_21A43E                         [4]
    LD        A,(0x6209)                         [4]
    AND       A,1                                [3]
    LD{1}     XDE,XHL                            [2]
    LD        XHL,0x21A314                       [5]
    CALL      sub_21A43E                         [4]
    LD        BC,0x403                           [3]
    LD        WA,2                               [2]
    CALL      swp_2171DF                         [4]
.done:
    RET                                          [1]

.org 0x21A43E

sub_21A43E:
    RET       Z                                  [2]
    LD        XHL,XDE                            [2]
    RET                                          [1]

.org 0x21A443

sub_21A443:
    LD        WA,(0x6203)                        [4]
    AND       WA,7                               [4]
    JR        NZ,.skip                           [2]
    CALL      swp_217684                         [4]
    LD        XHL,WaitAMinuteText                [5]
    LD        XDE,WaitAMinuteText                [5]
    CALL      sub_2198EB                         [4]
    LD        WA,(0x6203)                        [4]
    AND       WA,8                               [4]
    LD        XDE,0x21A324                       [5]
    CALL      sub_21A43E                         [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
.skip:
    INCW      1,(0x6203)                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_B_BUTTON,A                     [3]
    JR        NZ,.skip2                          [2]
    RCF                                          [1]
    JR        .done                              [2]
.skip2:
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x21A4CC

sub_21A4CC:
    OR        A,A                                [2]
    CALL      sub_21A4D7                         [4]
    CALL      sub_21D245                         [4]
    RET                                          [1]

.org 0x21A4D7

sub_21A4D7:
    LD        A,1                                [2]
    RET       Z                                  [2]
    LD        A,5                                [2]
    RET                                          [1]

.org 0x21A4DE

sub_21A4DE:
    CALL      sub_21D218                         [4]
    CP        WA,1                               [2]
    RET       Z                                  [2]
    LD        A,0xFF                             [2]
    OR        A,A                                [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21A4EC

sub_21A4EC:
    CALL      sub_21A4DE                         [4]
    RET       C                                  [2]
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+1)                         [3]
    AND       A,3                                [3]
    CP        A,3                                [2]
    CCF                                          [1]
    RET       NC                                 [2]
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+1)                         [3]
    AND       A,0xC                              [3]
    SCF                                          [1]
    RET                                          [1]

.org 0x21A50D

sub_21A50D:
    CALL      sub_21A4DE                         [4]
    RET       C                                  [2]
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+1)                         [3]
    AND       A,0xF                              [3]
    RET       NZ                                 [2]
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+4)                         [3]
    OR        WA,WA                              [2]
    RET       Z                                  [2]
    LD        WA,(XHL+2)                         [3]
    OR        WA,WA                              [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21A533

sub_21A533:
    CALL      sub_21A4DE                         [4]
    RET       C                                  [2]
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+1)                         [3]
    AND       A,0xF                              [3]
    RET       NZ                                 [2]
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+4)                         [3]
    OR        WA,WA                              [2]
    RET       NZ                                 [2]
    LD        WA,(XHL+2)                         [3]
    OR        WA,WA                              [2]
    RET       NZ                                 [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21A559

; [code+play] "You want to equip..." / Choose a part; works_setup_* screens
WorksSetupMenu:
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+4)                         [3]
    CALL      sub_219720                         [4]
    CALL      sub_21D256                         [4]
    LD        WA,(XHL+2)                         [3]
    CALL      sub_219713                         [4]
    RET                                          [1]

.org 0x21A570

loc_21A570:
    CALL      sub_218A62                         [4]
    LD        XHL,YouWantToEquipText             [5]
    LD        XDE,YouWantToEquipText             [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_2179FE                         [4]
    CALL      CopyEquipToWorks                   [4]
    CALL      sub_218AD8                         [4]
.loop:
    CALL      swp_217F20                         [4]
.loop2:
    CALL      sub_218A62                         [4]
    CALL      sub_21884B                         [4]
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,WhatDoYouWantText4             [5]
    LD        XDE,WhatDoYouWantText4             [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    CALL      sub_217F0C                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.skip2                          [5]
    JR        .skip                              [2]
.loop3:
    CALL      CopyEquipToWorks                   [4]
    CALL      sub_218AD8                         [4]
    CALL      swp_217F20                         [4]
    JP        .loop2                             [4]
.skip:
    LD        WA,(0x615B)                        [4]
    CALL      sub_21A66B                         [4]
    CALL      swp_2195BD                         [4]
    CALL      swp_217F20                         [4]
    LD        WA,(0x615B)                        [4]
    CALL      sub_218882                         [4]
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,ChooseAPartText                [5]
    LD        XDE,ChooseAPartText                [5]
    CALL      sub_2198E3                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    CALL      sub_217F0C                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop3                          [5]
    CALL      swp_217684                         [4]
    LD        WA,0x87                            [3]
    CALL      sub_21990C                         [4]
    CALL      swp_2195BD                         [4]
    CALL      sub_219C22                         [4]
    JP        .loop                              [4]
.skip2:
    LD        XHL,OKLetsGoBackText               [5]
    LD        XDE,OKLetsGoBackText               [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_217F0C                         [4]
    JP        loc_219A53                         [4]

.org 0x21A66B

sub_21A66B:
    SUB       WA,6                               [4]
    JR        C,.done                            [2]
    LD        XHL,0x61CF                         [5]
    LD        XDE,0x61D1                         [5]
    CALL      WorksDevelopMenu                   [4]
    LD        WA,(XHL)                           [2]
    LDW       (XHL),0                            [4]
    CALL      sub_219713                         [4]
.done:
    RET                                          [1]

.org 0x21A68A

; [code] You want to develop... / new arm / development level
WorksDevelopMenu:
    RET       Z                                  [2]
    LD        XHL,XDE                            [2]
    RET                                          [1]

.org 0x21A9A9

; [code+play] removes the arm, material and tool; C if a random 0-99 < wDevelopChance
DevelopRoll:
    LD        A,(0x61AC)                         [4]
    LD        W,5                                [2]
    CALL      sub_219720                         [4]
    LD        A,(0x61AD)                         [4]
    LD        W,4                                [2]
    CALL      sub_2196C7                         [4]
    LD        A,(0x61AE)                         [4]
    LD        W,3                                [2]
    CALL      sub_2196C7                         [4]
    CALL      sub_2174C9                         [4]
    EXTZ      WA                                 [2]
    DIV{1}    WA,0x64                            [3]
    CP        W,(wDevelopChance)                 [4]
    RET                                          [1]

.org 0x21A9D5

; [code] gives wDevelopResult, takes wDevelopExp off wEngineerExp below level 50
DevelopSuccess:
    LD        A,(wDevelopResult)                 [4]
    LD        W,5                                [2]
    CALL      sub_219713                         [4]
    LD        A,(wDevelopExp)                    [4]
    LD        A,(0x61AC)                         [4]
    CP        A,(wDevelopResult)                 [4]
    RCF                                          [1]
    CPB       (wWorksEngineerLevel),0x32         [5]
    JR        NC,.skip                           [2]
    LD        A,(wDevelopExp)                    [4]
    EXTZ      WA                                 [2]
    SUB       (wEngineerExp),WA                  [4]
.skip:
    SCF                                          [1]
    RET                                          [1]

.org 0x21A9FF

; [code+play] wEngineerExp += GetDevLevelExp, level + 1 (max 50)
EngineerLevelUp:
    LD        A,(wWorksPartnerRace)              [4]
    CALL      SplitRaceGender                    [4]
    LD        A,(wWorksEngineerLevel)            [4]
    CALL      GetDevLevelExp                     [4]
    EXTZ      WA                                 [2]
    ADD       (wEngineerExp),WA                  [4]
    LD        A,(wWorksEngineerLevel)            [4]
    CP        A,0x32                             [3]
    JR        NC,.skip                           [2]
    INC       1,A                                [2]
    LD        (wWorksEngineerLevel),A            [4]
    LD        (wEngineerLevel),A                 [4]
    CP        A,0x32                             [3]
    JR        C,.done                            [2]
.skip:
    LDW       (wEngineerExp),0                   [6]
.done:
    RET                                          [1]

.org 0x21AA34

; [code+play] "See you later" / "Whew, I'm glad to..."
WorksDevelopDone:
    CALL      swp_217684                         [4]
    LD        A,(wDevelopResult)                 [4]
    LD        W,5                                [2]
    CALL      sub_21739F                         [4]
    LD        BC,0                               [2]
    LD        WA,1                               [2]
    CALL      swp_2171DF                         [4]
    LD        A,(wDevelopResult)                 [4]
    LD        W,5                                [2]
    CALL      sub_2173D5                         [4]
    LD        BC,2                               [2]
    LD        WA,1                               [2]
    CALL      swp_2171DF                         [4]
    RET                                          [1]

.org 0x21AB7A

swp_21AB7A:
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
    LD        A,2                                [2]
    LD        C,8                                [2]
    LD        E,0xB                              [2]
    LD        HL,0x42                            [3]
    CALL      dyn_207494                         [4]
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,2                                [2]
    LD        C,0xC                              [2]
    LD        E,0x20                             [2]
    CALL      dyn_2074C0                         [4]
    LD        A,4                                [2]
    LD        C,8                                [2]
    LD        E,3                                [2]
    LD        HL,0x78                            [3]
    CALL      dyn_207494                         [4]
    LD        A,4                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,4                                [2]
    LD        C,0xC                              [2]
    LD        E,0xB                              [2]
    CALL      dyn_2074C0                         [4]
    CALL      sub_219424                         [4]
    RET                                          [1]

.org 0x21ABDA

sub_21ABDA:
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
    LD        XHL,0x9000                         [5]
    LD        XDE,0x9001                         [5]
    LD        XBC,0x7FF                          [5]
    XOR       A,A                                [2]
    LD        (XHL),A                            [2]
    LDIR      (XDE+),(XHL+)                      [2]
    LD        XHL,0x9800                         [5]
    LD        XDE,0x9801                         [5]
    LD        XBC,0x7FF                          [5]
    XOR       A,A                                [2]
    LD        (XHL),A                            [2]
    LDIR      (XDE+),(XHL+)                      [2]
    RET                                          [1]

.org 0x21B86C

sub_21B86C:
    LD        XHL,swp_21B82D                     [5]
    LD        XDE,swp_21B857                     [5]
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

.org 0x21B9EB

swp_21B9EB:
    PUSH      XHL                                [1]
    LD        XHL,0x25E67A                       [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21BA05

swp_21BA05:
    PUSH      XHL                                [1]
    LD        XHL,DevLevelBonusFemale            [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21BA12

swp_21BA12:
    PUSH      XHL                                [1]
    LD        XHL,0x25E6AC                       [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]

.org 0x21BA1E

loc_21BA1E:
    RET                                          [1]
    .db 05 0A 0F 14 64

.org 0x21BA24

sub_21BA24:
    PUSH      XHL                                [1]
    LD        XHL,loc_21BA1E                     [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21D1C8

swp_21D1C8:
    POP       XWA                                [1]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]
    .db 55 54

.org 0x21D1CF

sub_21D1CF:
    ORB       (TRUN),0x80                        [4]
    XOR       XHL,XHL                            [2]
    LD        (0x622E),XHL                       [4]
    LD        XHL,swp_21D270                     [5]
    CALL      StartChildTask                     [4]
    LD        (0x6222),XHL                       [4]
    RET                                          [1]

.org 0x21D1E7

sub_21D1E7:
    LD        XHL,(0x6222)                       [4]
    CALL      swp_206371                         [4]
    XOR       XHL,XHL                            [2]
    LD        (0x622E),XHL                       [4]
    RET                                          [1]

.org 0x21D1F6

sub_21D1F6:
    LD        XHL,0x622B                         [5]
    LD        XDE,0x622C                         [5]
    LD        XBC,0x6D                           [5]
    LDB       (XHL),0                            [3]
    LDIR      (XDE+),(XHL+)                      [2]
    LDB       (0x6232),0x1E                      [5]
    RET                                          [1]

.org 0x21D210

sub_21D210:
    XOR       WA,WA                              [2]
    LD        (0x6238),WA                        [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D218

sub_21D218:
    LD        WA,(0x6238)                        [4]
    OR        A,A                                [2]
    RET       MI                                 [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D236

sub_21D236:
    LD        (0x622B),WA                        [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D245

sub_21D245:
    ANDB      (0x622D),0xFA                      [5]
    OR        (0x622D),A                         [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D256

sub_21D256:
    LD        XHL,0x6242                         [5]
    RET                                          [1]

.org 0x21D25C

sub_21D25C:
    XOR       XWA,XWA                            [2]
    LD        (0x622B),WA                        [4]
    LD        (0x622D),A                         [4]
    LD        (0x622E),XWA                       [4]
    RET                                          [1]

.org 0x21D26B

sub_21D26B:
    LD        (0x622E),XHL                       [4]
    RET                                          [1]

.org 0x21D270

swp_21D270:
    LD        XHL,0x622B                         [5]
    LD        XDE,0x622C                         [5]
    LD        XBC,0x6D                           [5]
    LDB       (XHL),0                            [3]
    LDIR      (XDE+),(XHL+)                      [2]
    LDB       (0x6232),0x1E                      [5]
    LD        RW3,0x10                           [4]
    CALR      BiosCall                           [3]
.loop:
    LD        XHL,(0x622E)                       [4]
    OR        XHL,XHL                            [2]
    JR        Z,.skip                            [2]
    CALL      (XHL)                              [2]
.skip:
    LD        RW3,0x12                           [4]
    CALR      BiosCall                           [3]
    LD        RW3,0x15                           [4]
    CALL      BiosCall                           [4]
    CALL      swp_21D1C8                         [4]
    LD        XHL,0x6289                         [5]
    LD        (0x6233),XHL                       [4]
    LD        B,0x10                             [2]
    LD        (0x6237),B                         [4]
.loop2:
    LD        RW3,0x18                           [4]
    CALL      BiosCall                           [4]
    LD        WA,RWA3                            [3]
    AND       W,0xE                              [3]
    JP        NZ,.skip7                          [5]
    OR        A,A                                [2]
    JP        Z,.skip4                           [5]
    LD        XHL,0x6249                         [5]
    LD        XHL3,XHL                           [3]
    LD        B,0x40                             [2]
    LD        RB3,B                              [3]
    LD        RW3,0x1A                           [4]
    CALR      BiosCall                           [3]
    LD        A,RB3                              [3]
    LD        B,0x40                             [2]
    SUB       B,A                                [2]
    LD        XHL,0x6249                         [5]
    LD        XDE,(0x6233)                       [4]
    LD        C,(0x6237)                         [4]
    CP        C,0x10                             [3]
    JR        NZ,.loop4                          [2]
.loop3:
    CP        B,2                                [2]
    JR        C,.skip3                           [2]
    LD        WA,(0x21D1CD)                      [5]
    CP        WA,(XHL)                           [2]
    JR        Z,.skip2                           [2]
    INC       1,XHL                              [2]
    DEC       1,B                                [2]
    JR        .loop3                             [2]
.skip2:
    LD{1}     (XDE+),WA                          [3]
    INC       2,XHL                              [2]
    DEC       2,B                                [2]
    DEC       2,C                                [2]
.loop4:
    OR        C,C                                [2]
    JR        Z,.skip5                           [2]
    OR        B,B                                [2]
    JR        Z,.skip3                           [2]
    LD        A,(XHL+)                           [3]
    LD        (XDE+),A                           [3]
    DEC       1,B                                [2]
    DEC       1,C                                [2]
    JR        .loop4                             [2]
.skip3:
    LD        (0x6233),XDE                       [4]
    LD        (0x6237),C                         [4]
    CPB       (0x6232),0                         [5]
    JP        Z,.skip6                           [5]
    DECB      1,(0x6232)                         [4]
    CALL      swp_21D1C8                         [4]
    JP        .loop2                             [4]
.skip4:
    CPB       (0x6232),0                         [5]
    JP        Z,.skip6                           [5]
    DECB      1,(0x6232)                         [4]
    JP        .skip13                            [4]
.skip5:
    LD        XHL,0x6289                         [5]
    LD        XDE,0x6242                         [5]
    CALL      sub_21D487                         [4]
    JR        NC,.skip9                          [2]
    LD        XHL,0x6242                         [5]
    CALL      sub_21D47C                         [4]
    CP        A,(XHL)                            [2]
    JR        NZ,.skip8                          [2]
    JP        .skip11                            [4]
.skip6:
    ORB       (0x6239),8                         [5]
    LDB       (0x6238),0                         [5]
    JR        .skip10                            [2]
.skip7:
    SLL       4,W                                [3]
    OR        (0x6239),W                         [4]
    LDB       (0x6238),0xFF                      [5]
    ORB       (0x6239),1                         [5]
    JR        .skip10                            [2]
.skip8:
    LDB       (0x6238),0xFE                      [5]
    ORB       (0x6239),2                         [5]
    JR        .skip10                            [2]
.skip9:
    LDB       (0x6238),0xFD                      [5]
    ORB       (0x6239),4                         [5]
.skip10:
    LD        XHL,0x6242                         [5]
    LD        XDE,0x6243                         [5]
    LD        XBC,6                              [2]
    LDB       (XHL),0                            [3]
    LDIR      (XDE+),(XHL+)                      [2]
    JR        .skip12                            [2]
.skip11:
    LDB       (0x6238),1                         [5]
.skip12:
    LDB       (0x6232),0x1E                      [5]
.skip13:
    CPB       (0x6238),1                         [5]
    JR        NZ,.skip14                         [2]
    LD        WA,(0x6244)                        [4]
    LD        (0x623E),WA                        [4]
    LD        A,(0x6243)                         [4]
    SLL       1,A                                [3]
    AND       A,0xA                              [3]
    ANDB      (0x623B),0xF5                      [5]
    OR        (0x623B),A                         [4]
.skip14:
    LD        WA,(0x622B)                        [4]
    LD        (0x623C),WA                        [4]
    LD        A,(0x622D)                         [4]
    AND       A,5                                [3]
    ANDB      (0x623B),0xFA                      [5]
    OR        (0x623B),A                         [4]
    LD        A,(0x6242)                         [4]
    CP        A,(0x623A)                         [4]
    JR        PL,.skip15                         [2]
    LD        A,(0x623A)                         [4]
.skip15:
    INC       1,A                                [2]
    LD        (0x623A),A                         [4]
    LD        XHL,0x623A                         [5]
    CALL      sub_21D47C                         [4]
    LD        (XHL),A                            [2]
    LD        XHL,0x623A                         [5]
    LD        XDE,0x6289                         [5]
    CALL      sub_21D4D1                         [4]
    LD        RW3,0x17                           [4]
    CALR      BiosCall                           [3]
    LD        WA,RWA3                            [3]
    OR        A,A                                [2]
    JR        NZ,.skip16                         [2]
    LD        XHL,0x6289                         [5]
    LD        XHL3,XHL                           [3]
    LD        B,0x10                             [2]
    LD        RB3,B                              [3]
    LD        RW3,0x19                           [4]
    CALR      BiosCall                           [3]
    CP        RB3,0                              [3]
    JR        Z,.skip16                          [2]
.skip16:
    LD        RW3,0x11                           [4]
    CALR      BiosCall                           [3]
    LD        A,(0x623B)                         [4]
    ANDB      (0x622D),0xF5                      [5]
    OR        (0x622D),A                         [4]
    JP        .loop                              [4]

.org 0x21D47C

sub_21D47C:
    LD        B,6                                [2]
    XOR       A,A                                [2]
.loop:
    XOR       A,(XHL+)                           [3]
    DJNZ      B,.loop                            [3]
    RET                                          [1]

.org 0x21D487

sub_21D487:
    LD        WA,(0x21D1CD)                      [5]
    CP        WA,(XHL+)                          [3]
    JR        NZ,.skip                           [2]
    LD        B,7                                [2]
.loop:
    LD        A,(XHL+)                           [3]
    CALL      sub_21D4BF                         [4]
    JR        NC,.skip2                          [2]
    LD{1}     W,A                                [2]
    LD        A,(XHL+)                           [3]
    CALL      sub_21D4BF                         [4]
    JR        NC,.skip2                          [2]
    SLL       4,W                                [3]
    OR        A,W                                [2]
    LD        (XDE+),A                           [3]
    DJNZ      B,.loop                            [3]
    XOR       A,A                                [2]
    SCF                                          [1]
    JR        .done                              [2]
.skip:
    LD        A,1                                [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,2                                [2]
.skip3:
    RCF                                          [1]
.done:
    RET                                          [1]

.org 0x21D4BF

sub_21D4BF:
    SUB       A,0x30                             [3]
    CCF                                          [1]
    RET       NC                                 [2]
    CP        A,0xA                              [3]
    RET       C                                  [2]
    SUB       A,7                                [3]
    CP        A,0x10                             [3]
    RET                                          [1]

.org 0x21D4D1

sub_21D4D1:
    LD        WA,(0x21D1CD)                      [5]
    LD{1}     (XDE+),WA                          [3]
    LD        B,7                                [2]
.loop:
    LD        W,(XHL+)                           [3]
    LD        A,W                                [2]
    SRL       4,A                                [3]
    CALL      sub_21D4FD                         [4]
    LD        (XDE+),A                           [3]
    LD        A,W                                [2]
    AND       A,0xF                              [3]
    CALL      sub_21D4FD                         [4]
    LD        (XDE+),A                           [3]
    DJNZ      B,.loop                            [3]
    XOR       A,A                                [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D4FD

sub_21D4FD:
    ADD       A,0x30                             [3]
    CP        A,0x3A                             [3]
    RET       C                                  [2]
    ADD       A,7                                [3]
    RET                                          [1]

.org 0x21D509

swp_21D509:
    CALL      sub_2067E1                         [4]
    CALL      sub_2072CD                         [4]
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0x14                             [2]
    LD        E,0x13                             [2]
    LD        HL,(XIZ+0xE)                       [3]
    CALL      dyn_207494                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x2074C4                           [4]
    LDW       (XIZ+0xE),0                        [5]
    LDW       (XIZ+8),0xD538                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    JR        loc_21D5A8                         [2]

.org 0x21D538

swp_21D538:
    INCW      1,(XIZ+0x2A)                       [3]
    LD        WA,(XIZ+0x2A)                      [3]
    AND       WA,0x10                            [4]
    JR        Z,.skip                            [2]
    LD        BC,0                               [2]
    LD        DE,4                               [2]
    LD        WA,0xBE04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        BC,0x98                            [3]
    LD        DE,4                               [2]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
.skip:
    LD        A,(wJoyPressed)                    [4]
    AND       A,B_BUTTON                         [3]
    JR        NZ,loc_21D5C0                      [2]
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_LEFT|D_RIGHT                   [3]
    RET       Z                                  [2]
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_LEFT                           [3]
    JR        Z,.skip2                           [2]
    DECW      1,(XIZ+0xE)                        [3]
    JR        .skip3                             [2]
.skip2:
    INCW      1,(XIZ+0xE)                        [3]
.skip3:
    LD        WA,(XIZ+0xE)                       [3]
    CP        WA,0xFFFF                          [4]
    JR        GT,.skip4                          [2]
    LDW       (XIZ+0xE),9                        [5]
    JR        loc_21D5A8                         [2]
.skip4:
    LD        WA,(XIZ+0xE)                       [3]
    CP        WA,0xA                             [4]
    JR        LT,loc_21D5A8                      [2]
    LDW       (XIZ+0xE),0                        [5]

.org 0x21D5A8

loc_21D5A8:
    LD        HL,(XIZ+0xE)                       [3]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,0x25E6B7                       [6]
    LD        XHL,(XHL)                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CALL      dyn_2076F3                         [4]
    RET                                          [1]
