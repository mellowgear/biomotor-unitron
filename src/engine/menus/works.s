; engine/menus/works: 383 routines (each keeps its ROM address with .org)

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

.org 0x206375

swp_206375:
    SET       6,(XHL+7)                          [3]
    RET                                          [1]

.org 0x206379

sub_206379:
    LDB       (wColorFlags),0                    [5]
    CPB       (SYS_OS_VERSION),0x10              [5]
    JR        C,.skip                            [2]
    LDB       (wColorFlags),0x10                 [5]
    LD        RW3,0xE                            [4]
    LD        RA3,0x10                           [4]
    CALL      BiosCall                           [4]
.skip:
    LDB       (GE_PLANE_PRIO),0x80               [5]
    LDB       (GE_BGC),0x80                      [5]
    LDB       (GE_2D_CTL),7                      [5]
    ANDB      (TRUN),0x8E                        [4]
    LDB       (T01MOD),0                         [3]
    LDB       (TREG0),1                          [3]
    ORB       (TRUN),1                           [4]
    LD        RW3,4                              [3]
    LD        RB3,0                              [3]
    LD        RC3,2                              [3]
    CALL      BiosCall                           [4]
    CALL      sub_2067E1                         [4]
    CALL      sub_206847                         [4]
    CALL      sub_2063EE                         [4]
    LDB       (wFadeLevel),0x81                  [5]
    LD        XHL,0x8200                         [5]
    LD        BC,0x100                           [3]
.loop:
    LDW{1}    (XHL+),0                           [5]
    DJNZ      BC,.loop                           [3]
    LDW       (GE_WBA_H),0                       [6]
    LDW       (GE_WSI_H),0x98A0                  [6]
    RET                                          [1]

.org 0x2063EE

sub_2063EE:
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
    LD        (0x5A7B),A                         [4]
    LD        (0x5A7D),A                         [4]
    LD        (0x5A7F),A                         [4]
    LD        (0x5A80),A                         [4]
    LD        (0x5A81),A                         [4]
    LD        XWA,0                              [2]
    LD        XHL,0x5A86                         [5]
    LD        (0x5A82),HL                        [4]
    LD        XDE,0x5B86                         [5]
    LD        (0x5A84),DE                        [4]
    LD        C,0x40                             [2]
.loop:
    LD{1}     (XHL+),XWA                         [3]
    LD        (XDE+),A                           [3]
    DJNZ      C,.loop                            [3]
    LDB       (wFadeLevel),0                     [5]
    LDB       (0x585C),0xFF                      [5]
    LDW       (0x5A56),0xFFF                     [6]
    LDW       (0x5A58),0xDDD                     [6]
    LDW       (0x5A5A),0xBBB                     [6]
    LDW       (0x5A5C),0x999                     [6]
    LDW       (0x5A5E),0x666                     [6]
    LDW       (0x5A60),0x444                     [6]
    LDW       (0x5A62),0x222                     [6]
    LDW       (0x5A64),0                         [6]
    LDW       (0x5A66),0xFFF                     [6]
    LDW       (0x5A68),0xDDD                     [6]
    LDW       (0x5A6A),0xBBB                     [6]
    LDW       (0x5A6C),0x999                     [6]
    LDW       (0x5A6E),0x666                     [6]
    LDW       (0x5A70),0x444                     [6]
    LDW       (0x5A72),0x222                     [6]
    LDW       (0x5A74),0                         [6]
    LD        XHL,0x8100                         [5]
    LD        XDE,wMonoPalShadow                 [5]
    LD        BC,0x19                            [3]
    LDIR      (XDE+),(XHL+)                      [2]
    LDB       (0x5875),0x80                      [5]
    RET                                          [1]

.org 0x2064C6

sub_2064C6:
    LD        W,(0x5A7F)                         [4]
    LD        A,(0x5A76)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip3                           [2]
    CP        A,0x98                             [3]
    JR        NC,.skip3                          [2]
    LD        C,(0x584F)                         [4]
    LD        E,(0x5851)                         [4]
    BIT       3,W                                [3]
    JR        Z,.skip                            [2]
    ADD       C,(0x5A80)                         [4]
    ADD       E,(0x5A81)                         [4]
.skip:
    LD        (0x5A77),C                         [4]
    LD        (0x5A78),E                         [4]
    LD        C,(0x5857)                         [4]
    LD        E,(0x5859)                         [4]
    BIT       4,W                                [3]
    JR        Z,.skip2                           [2]
    ADD       C,(0x5A80)                         [4]
    ADD       E,(0x5A81)                         [4]
.skip2:
    LD        (0x5A79),C                         [4]
    LD        (0x5A7A),E                         [4]
    LD        W,0                                [2]
    LDC       DMAC0,WA                           [3]
    LD        A,0x14                             [2]
    LDC       DMAM0,A                            [3]
    LDB       (DMA0V),0x10                       [3]
    LD        XWA,0x5A77                         [5]
    LDC       DMAS1,XWA                          [3]
    LD        XWA,0x8032                         [5]
    LDC       DMAD1,XWA                          [3]
    LD        WA,1                               [2]
    LDC       DMAC1,WA                           [3]
    LD        A,0xA                              [2]
    LDC       DMAM1,A                            [3]
    LDB       (DMA1V),0x10                       [3]
.skip3:
    LD        W,(0x5A7F)                         [4]
    LD        C,(0x584B)                         [4]
    LD        E,(0x584D)                         [4]
    BIT       1,W                                [3]
    JR        Z,.skip4                           [2]
    ADD       C,(0x5A80)                         [4]
    ADD       E,(0x5A81)                         [4]
.skip4:
    LD        (GE_S1SO_H),C                      [4]
    LD        (GE_S1SO_V),E                      [4]
    LD        C,(0x5853)                         [4]
    LD        E,(0x5855)                         [4]
    BIT       2,W                                [3]
    JR        Z,.skip5                           [2]
    ADD       C,(0x5A80)                         [4]
    ADD       E,(0x5A81)                         [4]
.skip5:
    LD        (GE_S2SO_H),C                      [4]
    LD        (GE_S2SO_V),E                      [4]
    LD        C,(0x5A7B)                         [4]
    LD        E,(0x5A7D)                         [4]
    BIT       0,W                                [3]
    JR        Z,.skip6                           [2]
    ADD       C,(0x5A80)                         [4]
    ADD       E,(0x5A81)                         [4]
.skip6:
    NEG       C                                  [2]
    NEG       E                                  [2]
    LD        (GE_PO_H),C                        [4]
    LD        (GE_PO_V),E                        [4]
    RET                                          [1]

.org 0x206BFF

dyn_206BFF:
    PUSH      WA                                 [1]
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    LD        XHL,0                              [2]
    CPW       (0x5A82),0x5B86                    [6]
    JR        NC,0x206C78                        [2]
    LD{1}     WA,DE                              [2]
    SLL       3,WA                               [3]
    ADD       WA,(XSP+2)                         [3]
    CP        WA,0xFFF8                          [4]
    JR        LE,0x206C65                        [2]
    CP        WA,0xA0                            [4]
    JR        GE,0x206C78                        [2]
    LD        QW,A                               [3]
    LD{1}     WA,BC                              [2]
    SLL       3,WA                               [3]
    ADD       WA,(XSP)                           [2]
    CP        WA,0xFFF8                          [4]
    JR        LE,0x206C65                        [2]
    CP        WA,0xA8                            [4]
    JR        GE,0x206C65                        [2]
    LD        QA,A                               [3]
    LD        WA,(XSP+4)                         [3]
    AND       W,0xE1                             [3]
    OR        W,0x18                             [3]
    LD        HL,(0x5A82)                        [4]
    LD{1}     (XHL+),XWA                         [3]
    LD        (0x5A82),HL                        [4]
    LD        WA,(XSP+4)                         [3]
    AND       W,0x1E                             [3]
    SRL       1,W                                [3]
    LD        HL,(0x5A84)                        [4]
    LD        (XHL+),W                           [3]
    LD        (0x5A84),HL                        [4]
    INCW      1,(XSP+4)                          [3]
    INC       1,C                                [2]
    CP        C,QB                               [3]
    JR        C,0x206C08                         [2]
    LD        C,0                                [2]
    INC       1,E                                [2]
    CP        E,QD                               [3]
    JR        C,0x206C08                         [2]
    INC       6,XSP                              [2]
    RET                                          [1]

.org 0x206C7B

swp_206C7B:
    CP        DE,0x20                            [4]
    LD        XHL,0x9000                         [5]
    JR        C,loc_206C9D                       [2]
    SUB       DE,0x20                            [4]
    LD        HL,0x9800                          [3]
    JR        loc_206C9D                         [2]

.org 0x206C8F

swp_206C8F:
    LD        XHL,0x9000                         [5]
    JR        loc_206C9D                         [2]

.org 0x206C96

swp_206C96:
    LD        XHL,0x9800                         [5]
    JR        loc_206C9D                         [2]

.org 0x206C9D

loc_206C9D:
    CP        DE,0x20                            [4]
    RET       GE                                 [2]
    CP        BC,0x20                            [4]
    RET       GE                                 [2]
    LD        QWA,WA                             [3]
    LD        A,QD                               [3]
    LD        W,0                                [2]
    DEC       1,WA                               [2]
    ADD       WA,DE                              [2]
    RET       MI                                 [2]
    BIT       6,QW                               [4]
    JR        Z,.skip                            [2]
    LD        DE,WA                              [2]
.skip:
    LD        A,QB                               [3]
    LD        W,0                                [2]
    DEC       1,WA                               [2]
    ADD       WA,BC                              [2]
    RET       MI                                 [2]
    BIT       7,QW                               [4]
    JR        Z,.skip2                           [2]
    LD        BC,WA                              [2]
.skip2:
    LD        WA,QWA                             [3]
    PUSH      WA                                 [1]
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
.loop:
    LD{1}     WA,DE                              [2]
    BIT       6,(XSP+5)                          [3]
    JR        Z,.skip3                           [2]
    NEG       WA                                 [2]
.skip3:
    ADD       WA,(XSP+2)                         [3]
    JR        MI,.skip5                          [2]
    CP        WA,0x20                            [4]
    JR        NC,.skip6                          [2]
    AND       A,0x1F                             [3]
    LD        QA,A                               [3]
    LD{1}     WA,BC                              [2]
    BIT       7,(XSP+5)                          [3]
    JR        Z,.skip4                           [2]
    NEG       WA                                 [2]
.skip4:
    ADD       WA,(XSP)                           [2]
    JR        MI,.skip5                          [2]
    CP        WA,0x20                            [4]
    JR        NC,.skip5                          [2]
    LD        QW,0                               [3]
    SLL       11,WA                              [3]
    SLL       6,XWA                              [3]
    LD        WA,(XSP+4)                         [3]
    LD        (XHL+QWA),WA                       [5]
.skip5:
    INCW      1,(XSP+4)                          [3]
    INC       1,C                                [2]
    CP        C,QB                               [3]
    JR        C,.loop                            [2]
    LD        C,0                                [2]
    INC       1,E                                [2]
    CP        E,QD                               [3]
    JR        C,.loop                            [2]
.skip6:
    INC       6,XSP                              [2]
    RET                                          [1]

.org 0x208926

swp_208926:
    RET                                          [1]

.org 0x208927

swp_208927:
    OR        WA,1                               [4]
    RET                                          [1]

.org 0x20892C

swp_20892C:
    OR        WA,2                               [4]
    RET                                          [1]

.org 0x208931

swp_208931:
    OR        WA,4                               [4]
    RET                                          [1]

.org 0x208936

swp_208936:
    OR        WA,8                               [4]
    RET                                          [1]

.org 0x20893B

swp_20893B:
    OR        WA,0x10                            [4]
    RET                                          [1]

.org 0x208940

swp_208940:
    OR        WA,0x20                            [4]
    RET                                          [1]

.org 0x208945

swp_208945:
    OR        WA,0x40                            [4]
    RET                                          [1]

.org 0x20894A

swp_20894A:
    OR        WA,0x80                            [4]
    RET                                          [1]

.org 0x20894F

swp_20894F:
    ADDW      (wUnitMaxHP),0x19                  [6]
    RET                                          [1]

.org 0x208956

swp_208956:
    ADDW      (wUnitMaxHP),0x32                  [6]
    RET                                          [1]

.org 0x20895D

swp_20895D:
    ADDW      (wUnitMaxHP),0x50                  [6]
    RET                                          [1]

.org 0x208964

swp_208964:
    ADDW      (wUnitMaxEP),0xF                   [6]
    RET                                          [1]

.org 0x20896B

swp_20896B:
    ADDW      (wUnitMaxEP),0x1E                  [6]
    RET                                          [1]

.org 0x208972

swp_208972:
    ADDW      (wUnitMaxEP),0x3C                  [6]
    RET                                          [1]

.org 0x208979

swp_208979:
    ADDW      (wUnitAP),0xA                      [6]
    RET                                          [1]

.org 0x208980

swp_208980:
    ADDW      (wUnitAP),0x14                     [6]
    RET                                          [1]

.org 0x208987

swp_208987:
    ADDW      (wUnitAP),0x1E                     [6]
    RET                                          [1]

.org 0x20D59E

swp_20D59E:
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_ARG),0xC                 [5]
    LDW       (XIZ+0x10),0                       [5]
    CALL      swp_20DC8E                         [4]
    LD        XHL,dyn_20D6DF                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_20E084                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5DF6),0                         [5]
    JR        Z,.skip2                           [2]
    CALL      sub_20DF80                         [4]
    LD        XHL,swp_20E131                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CALL      sub_20DDBC                         [4]
    CPB       (0x5DF7),1                         [5]
    JR        Z,.skip                            [2]
    LDW       (XIZ+TASK_FUNC),0xD5DA             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        A,(0x5DF6)                         [4]
    CALL      swp_20DAFD                         [4]
    CALL      sub_20E012                         [4]
    LD        XHL,swp_20E1BC                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CALL      sub_20DDBC                         [4]
    LDW       (XIZ+TASK_FUNC),0xD5DA             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip2:
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xD1BD             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20DAFD

swp_20DAFD:
    PUSH      A                                  [1]
    LD        RW3,0x16                           [4]
    CALL      BiosCall                           [4]
    LD        BC,8                               [3]
    LD        XDE,wTextBuffer                    [5]
    LD        XHL,0xFA000                        [5]
    CALL      sub_2077A6                         [4]
    POP       A                                  [1]
    CALL      dyn_20DACC                         [4]
    ADD       XHL,0x4000                         [6]
    LD        BC,0x27D                           [3]
    LD        A,0xFF                             [2]
.loop:
    LD        (XHL+),A                           [3]
    DJNZ      BC,.loop                           [3]
.loop2:
    LD        B,0x11                             [2]
    CALL      swp_20776F                         [4]
    CP        RA3,0                              [3]
    JR        NZ,.loop2                          [2]
    LD        BC,8                               [3]
    LD        XDE,0xFA000                        [5]
    LD        XHL,wTextBuffer                    [5]
    CALL      sub_207788                         [4]
    CP        RA3,0                              [3]
    JR        NZ,.loop2                          [2]
    LD        RW3,0x15                           [4]
    CALL      BiosCall                           [4]
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

.org 0x20DB72

swp_20DB72:
    OR        A,A                                [2]
    JP        Z,loc_20DBDE                       [5]
    PUSH      A                                  [1]
    LD        RW3,0x16                           [4]
    CALL      BiosCall                           [4]
    LD        BC,8                               [3]
    LD        XDE,wTextBuffer                    [5]
    LD        XHL,0xFA000                        [5]
    CALL      sub_2077A6                         [4]
    POP       A                                  [1]
    CALL      dyn_20DACC                         [4]
    ADD       XHL,0x4000                         [6]
    LD{1}     XDE,XHL                            [2]
    LD        XHL,0x200020                       [5]
    LD        BC,0x10                            [3]
    LDIR      (XDE+),(XHL+)                      [2]
    LD        XHL,wPlayerName                    [5]
    LD        BC,0x26D                           [3]
    LDIR      (XDE+),(XHL+)                      [2]
.loop:
    LD        B,0x11                             [2]
    CALL      swp_20776F                         [4]
    CP        RA3,0                              [3]
    JR        NZ,.loop                           [2]
    LD        BC,8                               [3]
    LD        XDE,0xFA000                        [5]
    LD        XHL,wTextBuffer                    [5]
    CALL      sub_207788                         [4]
    CP        RA3,0                              [3]
    JR        NZ,.loop                           [2]
    LD        RW3,0x15                           [4]
    CALL      BiosCall                           [4]
    RET                                          [1]

.org 0x20DC43

sub_20DC43:
    OR        A,A                                [2]
    JP        Z,dyn_20DC65                       [5]
    CALL      dyn_20DAB9                         [4]
    ADD       XHL,0x10                           [6]
    LD        XDE,wPlayerName                    [5]
    LD        BC,0x26D                           [3]
    LDIR      (XDE+),(XHL+)                      [2]
    LDW       (0x5076),0                         [6]
    RET                                          [1]

.org 0x20DC65

dyn_20DC65:
    LD        A,0                                [2]
    CALL      dyn_20DAB9                         [4]
    ADD       XHL,0x10                           [6]
    LD        XDE,wOptionMessageSpeed            [5]
    LD{1}     BC,2                               [3]
    LDIR      (XDE+),(XHL+)                      [2]
    RET                                          [1]

.org 0x20DC7C

swp_20DC7C:
    LDB       (0x5DF5),0                         [5]
    LDB       (0x5DF6),1                         [5]
    CALL      dyn_206825                         [4]
    CALR      sub_20DDBC                         [3]
    RET                                          [1]

.org 0x20DC8E

swp_20DC8E:
    LDB       (0x5DF5),2                         [5]
    LDB       (0x5DF6),1                         [5]
    CALL      dyn_206825                         [4]
    CALR      sub_20DDBC                         [3]
    RET                                          [1]

.org 0x20DCA0

swp_20DCA0:
    CALR      swp_20DC7C                         [3]
    LDW       (XIZ+TASK_FUNC),0xDCAD             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        XHL,swp_20E084                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5DF6),0                         [5]
    JP        Z,EndTask                          [5]
    CALR      sub_20DF80                         [3]
    LD        XHL,swp_20E131                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5DF7),1                         [5]
    JR        Z,.skip                            [2]
    CALR      sub_20DDBC                         [3]
    LDW       (XIZ+TASK_FUNC),0xDCAD             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        A,(0x5DF6)                         [4]
    CALL      sub_20DC43                         [4]
    CALR      sub_20E012                         [3]
    LD        XHL,swp_20E1BC                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20DD24

swp_20DD24:
    LDB       (0x5DF5),1                         [5]
    LDB       (0x5DF6),1                         [5]
    CALL      dyn_206825                         [4]
    CALR      sub_20DDBC                         [3]
    LDW       (XIZ+TASK_FUNC),0xDD3F             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        XHL,swp_20E084                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5DF6),0                         [5]
    JP        Z,EndTask                          [5]
    CALR      sub_20DF80                         [3]
    LD        XHL,swp_20E131                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5DF7),1                         [5]
    JR        Z,.skip                            [2]
    CALR      sub_20DDBC                         [3]
    LDW       (XIZ+TASK_FUNC),0xDD3F             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        A,(0x5DF6)                         [4]
    CALL      swp_20DB72                         [4]
    CALR      sub_20E012                         [3]
    LD        XHL,swp_20E1BC                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xDD24             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20DDBC

sub_20DDBC:
    PUSHW     (XIZ+TASK_ARG)                     [3]
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0xA                              [2]
    LD        E,3                                [2]
    LD        HL,(XIZ+TASK_ARG)                  [3]
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
    ADDW      (XIZ+TASK_ARG),8                   [5]
    LD        A,1                                [2]
.loop:
    PUSH      A                                  [1]
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0x12                             [2]
    LD        E,5                                [2]
    LD        HL,(XIZ+TASK_ARG)                  [3]
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
    ADDW      (XIZ+TASK_ARG),0x30                [5]
    POP       A                                  [1]
    INC       1,A                                [2]
    CP        A,4                                [2]
    JRL       C,.loop                            [3]
    POPW      (XIZ+TASK_ARG)                     [3]
    RET                                          [1]

.org 0x20DF5B

swp_20DF5B:
    NOP                                          [1]
    PUSH      IX                                 [1]
    RETD      1025                               [3]
    .db 0xFF, 0x00, 0x33, 0x01, 0x16, 0x05, 0xFF, 0x00, 0x23, 0x0C, 0x05, 0x01, 0x12, 0xFF, 0xFE, 0x00
    .db 0x00, 0x00, 0x00, 0x00, 0x65, 0x2E, 0x2F, 0x2E, 0x25, 0x65, 0xFF, 0x2C, 0x6E, 0x6D, 0x70, 0x6F

.org 0x20DF80

sub_20DF80:
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0x12                             [2]
    LD        E,3                                [2]
    LD        HL,(XIZ+TASK_ARG)                  [3]
    ADD       HL,0x98                            [4]
    CALL      dyn_207494                         [4]
    CPB       (0x5DF5),0                         [5]
    LD        XHL,swp_20DFCE                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5DF5),2                         [5]
    LD        XHL,0x20DFDF                       [5]
    JR        Z,.skip                            [2]
    LD        A,(0x5DF6)                         [4]
    CALL      dyn_20DB57                         [4]
    LD        XHL,0x20E001                       [5]
    JR        Z,.skip                            [2]
    LD        XHL,0x20DFF0                       [5]
.skip:
    LD        A,(XIZ+0x10)                       [3]
    CALL      dyn_2076F3                         [4]
    LD        C,1                                [2]
    LD        E,0x28                             [2]
    CALL      0x2074C4                           [4]
    RET                                          [1]

.org 0x20DFCE

swp_20DFCE:
    PUSH      IX                                 [1]
    RETD      1025                               [3]

.org 0x20E012

sub_20E012:
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0x12                             [2]
    LD        E,3                                [2]
    LD        HL,(XIZ+TASK_ARG)                  [3]
    ADD       HL,0x98                            [4]
    CALL      dyn_207494                         [4]
    CPB       (0x5DF5),0                         [5]
    LD        XHL,swp_20E051                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5DF5),2                         [5]
    LD        XHL,0x20E062                       [5]
    JR        Z,.skip                            [2]
    LD        XHL,0x20E073                       [5]
.skip:
    LD        A,(XIZ+0x10)                       [3]
    CALL      dyn_2076F3                         [4]
    LD        C,1                                [2]
    LD        E,0x28                             [2]
    CALL      0x2074C4                           [4]
    RET                                          [1]

.org 0x20E051

swp_20E051:
    NOP                                          [1]
    PUSH      IX                                 [1]
    RETD      1025                               [3]
    .db 0x00, 0x23, 0x0F, 0x0D, 0x10, 0x0C, 0x05, 0x14, 0x05, 0x00, 0x00, 0xFF, 0x00, 0x23, 0x0C, 0x05
    .db 0x01, 0x12, 0x00, 0x23, 0x0F, 0x0D, 0x10, 0x0C, 0x05, 0x14, 0x05, 0x00, 0xFF, 0x00, 0x33, 0x01
    .db 0x16, 0x05, 0x00, 0x23, 0x0F, 0x0D, 0x10, 0x0C, 0x05, 0x14, 0x05, 0x00, 0x00, 0xFF

.org 0x20E084

swp_20E084:
    LDW       (XIZ+TASK_FUNC),0xE09A             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPB       (0x5DF6),0                         [5]
    JR        NZ,.skip                           [2]
    LDB       (0x5DF6),1                         [5]
.skip:
    LD        E,(0x5DF6)                         [4]
    DEC       1,E                                [2]
    MUL{1}    DE,0x28                            [3]
    ADD       DE,0x2C                            [4]
    LD        BC,8                               [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_UP,A                         [3]
    JR        NZ,.skip2                          [2]
    BIT       1,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip4                          [2]
    BIT       5,A                                [3]
    JR        NZ,.skip6                          [2]
    RET                                          [1]
.skip2:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    DECB      1,(0x5DF6)                         [4]
    RET       NZ                                 [2]
    LDB       (0x5DF6),3                         [5]
    RET                                          [1]
.skip3:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    INCB      1,(0x5DF6)                         [4]
    CPB       (0x5DF6),4                         [5]
    RET       C                                  [2]
    LDB       (0x5DF6),1                         [5]
    RET                                          [1]
.skip4:
    CPB       (0x5DF5),1                         [5]
    JR        Z,.skip5                           [2]
    LD        A,(0x5DF6)                         [4]
    CALL      dyn_20DB57                         [4]
    JR        Z,.skip5                           [2]
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    RET                                          [1]
.skip5:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CALL      EndTask                            [4]
    RET                                          [1]
.skip6:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LDB       (0x5DF6),0                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20E131

swp_20E131:
    LDB       (0x5DF7),2                         [5]
    LDW       (XIZ+TASK_FUNC),0xE141             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x2173C3

swp_2173C3:
    CP        W,6                                [2]
    JR        NC,.skip                           [2]
    CALL      swp_21B978                         [4]
    JR        .done                              [2]
.skip:
    SUB       W,5                                [3]
    CALL      swp_21B8D5                         [4]
.done:
    RET                                          [1]

.org 0x2173D5

sub_2173D5:
    CP        W,6                                [2]
    JR        NC,.skip                           [2]
    CALL      sub_21B963                         [4]
    CALL      swp_21B996                         [4]
    RET                                          [1]
.skip:
    SUB       W,5                                [3]
    CALL      sub_21B8C0                         [4]
    CALL      swp_21B8F3                         [4]
    RET                                          [1]

.org 0x2173EE

swp_2173EE:
    CP        W,6                                [2]
    JR        NC,.skip                           [2]
    CALL      sub_21B94A                         [4]
    JR        .done                              [2]
.skip:
    PUSH      WA                                 [1]
    SUB       W,5                                [3]
    CALL      sub_21B8A7                         [4]
    POP       WA                                 [1]
.done:
    RET                                          [1]

.org 0x21740E

; [code] A = race/gender 1-10 -> W = gender bit (0 odd/male), A = race 1-5
SplitRaceGender:
    DEC       1,A                                [2]
    LD{1}     W,A                                [2]
    AND       W,1                                [3]
    SRL       1,A                                [3]
    INC       1,A                                [2]
    RET                                          [1]

.org 0x217427

loc_217427:
    LD        XHL,0x21742D                       [5]
    RET                                          [1]
    .db 0x59, 0x59, 0x59, 0x59, 0x59, 0x59, 0xFF

.org 0x217434

sub_217434:
    CALL      sub_21B94A                         [4]
    JR        NC,.done                           [2]
    CALL      sub_21B963                         [4]
    CALL      sub_21B9B4                         [4]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x217444

swp_217444:
    CP        W,6                                [2]
    JR        NC,.skip                           [2]
    CALL      sub_21B94A                         [4]
    JR        NC,.done                           [2]
    CALL      sub_21B963                         [4]
    CALL      sub_21B9B4                         [4]
    LD        WA,(XHL+0xE)                       [3]
    JR        .skip2                             [2]
.skip:
    SUB       W,5                                [3]
    CALL      sub_21B8A7                         [4]
    JR        NC,.done                           [2]
    CALL      sub_21B8C0                         [4]
    CALL      sub_21B920                         [4]
.skip2:
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x21746E

swp_21746E:
    LD        XHL,0x217491                       [5]
.loop:
    OR        E,E                                [2]
    JR        Z,.done                            [2]
    SRL       1,E                                [3]
    JR        NC,.skip                           [2]
    PUSH      XHL                                [1]
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    PUSH      WA                                 [1]
    LD        L,(XHL)                            [2]
    CALL      swp_2171B9                         [4]
    POP       WA                                 [1]
    POP       BC                                 [1]
    POP       DE                                 [1]
    POP       XHL                                [1]
    INC       1,B                                [2]
.skip:
    INC       1,XHL                              [2]
    JR        .loop                              [2]
.done:
    RET                                          [1]
    .db 0x6C, 0x6E, 0x6D, 0x70, 0x6F, 0x6A, 0x6B, 0x73

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

.org 0x217583

sub_217583:
    XOR       A,A                                [2]
    LD        (0x610C),A                         [4]
    LD        (0x610D),A                         [4]
    LD        (0x610E),A                         [4]
    LD        (0x610F),A                         [4]
    LD        (0x6110),A                         [4]
    LD        XHL,swp_2175C4                     [5]
    CALL      StartChildTask                     [4]
    LD        (0x6108),XHL                       [4]
    RET                                          [1]

.org 0x217620

sub_217620:
    LD        (0x6115),A                         [4]
    RET                                          [1]

.org 0x217625

sub_217625:
    LD        (0x611B),A                         [4]
    RET                                          [1]

.org 0x21762A

swp_21762A:
    LDB       (0x611C),1                         [5]
    LD        (0x6117),XHL                       [4]
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

.org 0x21783D

swp_21783D:
    LD        XWA,.done                          [5]
    LD        (XIZ+TASK_FUNC),XWA                [3]
.done:
    RET                                          [1]

.org 0x217846

sub_217846:
    XOR       WA,WA                              [2]
    LD        (0x6137),WA                        [4]
    LD        (0x6135),WA                        [4]
    LD        XHL,loc_2178A6                     [5]
    CALL      StartChildTask                     [4]
    RET                                          [1]

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

.org 0x217970

swp_217970:
    LD        A,1                                [2]
    JP        swp_217965                         [4]

.org 0x217976

swp_217976:
    LD        A,2                                [2]
    JP        swp_217965                         [4]

.org 0x21797C

swp_21797C:
    LD        A,3                                [2]
    JP        swp_217965                         [4]

.org 0x217982

swp_217982:
    LD        A,4                                [2]
    JP        swp_217965                         [4]

.org 0x217988

swp_217988:
    LD        A,5                                [2]
    JP        swp_217965                         [4]

.org 0x21798E

swp_21798E:
    LD        A,6                                [2]
    JP        swp_217965                         [4]

.org 0x217994

swp_217994:
    POP       XHL                                [1]
    LD        (0x6142),XHL                       [4]
.loop:
    LD        XWA,(0x613E)                       [4]
    OR        XWA,XWA                            [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip:
    CALL      sub_2171A8                         [4]
    LD        XWA,(0x613E)                       [4]
    LD        XHL,(0x6142)                       [4]
    JP        (XHL)                              [2]

.org 0x2179B5

loc_2179B5:
    LD        (0x6146),A                         [4]
    POP       XHL                                [1]
    LD        (0x6142),XHL                       [4]
    XOR       XWA,XWA                            [2]
    LD        (0x613E),XWA                       [4]
.loop:
    LD        XWA,(0x613E)                       [4]
    OR        XWA,XWA                            [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip:
    CALL      sub_2171A8                         [4]
    LD        XWA,(0x613E)                       [4]
    LD        XHL,(0x6142)                       [4]
    JP        (XHL)                              [2]

.org 0x2179E0

loc_2179E0:
    LD        A,1                                [2]
    JP        loc_2179B5                         [4]

.org 0x2179E6

swp_2179E6:
    LD        A,2                                [2]
    JP        loc_2179B5                         [4]

.org 0x2179EC

sub_2179EC:
    LD        A,3                                [2]
    JP        loc_2179B5                         [4]

.org 0x2179F2

sub_2179F2:
    LD        A,4                                [2]
    JP        loc_2179B5                         [4]

.org 0x2179F8

sub_2179F8:
    LD        A,5                                [2]
    JP        loc_2179B5                         [4]

.org 0x2179FE

sub_2179FE:
    LD        A,6                                [2]
    JP        loc_2179B5                         [4]

.org 0x217A04

swp_217A04:
    XOR       A,A                                [2]
    LD        (0x613B),A                         [4]
    LD        (0x613C),A                         [4]
    LD        (0x613D),A                         [4]

.org 0x217A12

loc_217A12:
    LD        A,(0x6146)                         [4]
    CP        A,8                                [3]
    JR        NC,.skip                           [2]
    LD        XHL,0x217A2A                       [5]
    SLL       2,A                                [3]
    LD        XHL,(XHL+A)                        [5]
    JP        (XHL)                              [2]
    .db 0x5C, 0x7A, 0x21, 0x00, 0x68, 0x7A, 0x21, 0x00, 0x7A, 0x7B, 0x21, 0x00, 0x74, 0x7A, 0x21, 0x00
    .db 0xC0, 0x7A, 0x21, 0x00, 0xA4, 0x7A, 0x21, 0x00, 0x56, 0x7B, 0x21, 0x00, 0x5C, 0x7A, 0x21, 0x00
.skip:
    LD        WA,0xFFFF                          [3]
    LDB       (0x6146),0                         [5]
    OR        XWA,0xFFFF0000                     [6]
    LD        (0x613E),XWA                       [4]
    CALL      sub_2171A8                         [4]
    CALL      sub_217BB4                         [4]
    JP        loc_217A12                         [4]

.org 0x217A68

swp_217A68:
    XOR       A,A                                [2]
    LD        (0x613D),A                         [4]
    XOR       WA,WA                              [2]
    JP        0x217A4D                           [4]

.org 0x217A74

swp_217A74:
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,2                                [2]
    LD        C,0xC                              [2]
    LD        E,0x20                             [2]
    CALL      dyn_2074C0                         [4]
    LD        A,2                                [2]
    LD        B,(0x614B)                         [4]
    LD        XHL,(0x614C)                       [4]
    CALL      swp_217207                         [4]
    LD        A,2                                [2]
    CALL      swp_2175B6                         [4]
    XOR       A,A                                [2]
    LD        (0x6139),A                         [4]
    XOR       WA,WA                              [2]
    JP        0x217A4D                           [4]

.org 0x217AA4

swp_217AA4:
    LD        A,(0x613D)                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip                           [2]
    CALL      swp_2175A8                         [4]
    CALL      swp_217BA9                         [4]
    LD        A,1                                [2]
    LD        (0x613D),A                         [4]
.skip:
    XOR       WA,WA                              [2]
    JP        0x217A4D                           [4]
.loop:
    CALL      sub_2171A8                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JP        NZ,.skip2                          [5]
    BIT       5,A                                [3]
    JP        NZ,.skip3                          [5]
    BIT       1,A                                [3]
    JP        NZ,.skip4                          [5]
    BIT       0,A                                [3]
    JP        NZ,.skip6                          [5]
    JP        .skip8                             [4]
.skip2:
    LD        WA,0x81                            [3]
    CALL      sub_21990C                         [4]
    LD        A,(0x6139)                         [4]
    JP        .skip9                             [4]
.skip3:
    LD        WA,0x82                            [3]
    CALL      sub_21990C                         [4]
    LD        A,0xFF                             [2]
    JP        .skip9                             [4]
.skip4:
    LD        A,(0x6139)                         [4]
    INC       1,A                                [2]
    CP        A,(0x614A)                         [4]
    JR        C,.skip5                           [2]
    XOR       A,A                                [2]
.skip5:
    JP        .skip7                             [4]
.skip6:
    LD        A,(0x6139)                         [4]
    DEC       1,A                                [2]
    JR        PL,.skip7                          [2]
    LD        A,(0x614A)                         [4]
    DEC       1,A                                [2]
.skip7:
    LD        (0x6139),A                         [4]
    LD        WA,0x80                            [3]
    CALL      sub_21990C                         [4]
.skip8:
    CALL      swp_217BA9                         [4]
    JP        .loop                              [4]
.skip9:
    CP        A,(0x614A)                         [4]
    JR        NC,.skip10                         [2]
    LD        XHL,(0x6154)                       [4]
    LD        A,(XHL+A)                          [5]
.skip10:
    LD        W,0xFF                             [2]
    LD        (0x613B),WA                        [4]
    XOR       WA,WA                              [2]
    JP        0x217A4D                           [4]

.org 0x217B56

swp_217B56:
    LD        A,(0x613D)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    CALL      swp_2175AF                         [4]
    XOR       A,A                                [2]
    LD        (0x613D),A                         [4]
.skip:
    XOR       WA,WA                              [2]
    JP        0x217A4D                           [4]

.org 0x217B6E

swp_217B6E:
    CALL      sub_217BB4                         [4]
    CALL      sub_2171A8                         [4]
    JP        loc_217A12                         [4]

.org 0x217B7A

swp_217B7A:
    LD        XWA,0xFFFF0000                     [5]
    LD        A,(0x613B)                         [4]
    LD        (0x613E),XWA                       [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x217B8C

sub_217B8C:
    LD        A,(0x6139)                         [4]
    CP        A,(0x614A)                         [4]
    JR        NC,.done                           [2]
    ADD       A,A                                [2]
    LD        XHL,(0x6150)                       [4]
    LDA       XHL,XHL+A                          [5]
    LD        B,(XHL+)                           [3]
    LD        C,(XHL+)                           [3]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x217BA9

swp_217BA9:
    CALL      sub_217B8C                         [4]
    JR        NC,.done                           [2]
    CALL      swp_2175BB                         [4]
.done:
    RET                                          [1]

.org 0x217BB4

sub_217BB4:
    CPB       (0x613D),0                         [5]
    JR        Z,.done                            [2]
    CPB       (0x613C),0                         [5]
    JR        Z,.done                            [2]
    CALL      sub_217B8C                         [4]
    JR        NC,.done                           [2]
    LD        A,2                                [2]
    CALL      swp_21722F                         [4]
.done:
    RET                                          [1]

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
    .db 0x23, 0x08, 0x01, 0x12, 0x01, 0xFF, 0x35, 0x2E, 0x29, 0x34, 0xFF, 0x25, 0x18, 0x09, 0x14, 0xFF
    .db 0x00, 0x00, 0x6F, 0x7C, 0x21, 0x00, 0x00, 0x01, 0x75, 0x7C, 0x21, 0x00, 0x00, 0x08, 0x7A, 0x7C
    .db 0x21, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01, 0xFF

.org 0x217C9A

sub_217C9A:
    LD        A,3                                [2]
    LD        (0x614A),A                         [4]
    LD        A,3                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x217C7F                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x217C91                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x217C97                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]
    .db 0x29, 0x14, 0x05, 0x0D, 0xFF, 0x30, 0x01, 0x12, 0x14, 0x13, 0xFF, 0x25, 0x18, 0x09, 0x14, 0xFF
    .db 0x00, 0x00, 0xC5, 0x7C, 0x21, 0x00, 0x00, 0x01, 0xCA, 0x7C, 0x21, 0x00, 0x00, 0x08, 0xD0, 0x7C
    .db 0x21, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x01, 0x00, 0xFF

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
    .db 0x33, 0x01, 0x16, 0x05, 0xFF
    PUSH      IX                                 [1]
    RETD      1025                               [3]
    .db 0xFF, 0x25, 0x18, 0x09, 0x14, 0xFF, 0x00, 0x00, 0xFE, 0x7D, 0x21, 0x00, 0x00, 0x01, 0x03, 0x7E
    .db 0x21, 0x00, 0x00, 0x08, 0x08, 0x7E, 0x21, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01
    .db 0xFF

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

.org 0x217E53

sub_217E53:
    XOR       XWA,XWA                            [2]
    LD        (0x617E),XWA                       [4]
    LD        (0x6176),XWA                       [4]
    CALL      sub_217F12                         [4]
    LD        XHL,swp_217FA0                     [5]
    CALL      StartChildTask                     [4]
    RET                                          [1]

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
    LD        E,(wListPage)                      [4]
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
    LD        A,(wListPage)                      [4]
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

.org 0x21838A

sub_21838A:
    LD        A,(wListPage)                      [4]
    MUL{1}    WA,0xA                             [3]
    ADD       A,(wListRow)                       [4]
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
    LD        E,(wListPage)                      [4]
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
    LD        A,(wListPage)                      [4]
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

.org 0x21862D

sub_21862D:
    LD        A,(wListPage)                      [4]
    MUL{1}    WA,0xA                             [3]
    ADD       A,(wListRow)                       [4]
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
    .db 0x01, 0x02, 0x03, 0x04, 0x05, 0x05, 0x09, 0x08

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

.org 0x2187EC

swp_2187EC:
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
    LD        A,(wListRow)                       [4]
    CP        A,0                                [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21880C

sub_21880C:
    LD        A,(wListRow)                       [4]
    SLL       2,A                                [3]
    LD        XHL,0x218826                       [5]
    LD        XHL,(XHL+A)                        [5]
    CALL      swp_21717A                         [4]
    CALL      swp_2173EE                         [4]
    RET                                          [1]
    .db 0x3B, 0x96, 0x21, 0x00, 0x45, 0x96, 0x21, 0x00, 0x40, 0x96, 0x21, 0x00, 0x4A, 0x96, 0x21, 0x00
    .db 0x4F, 0x96, 0x21, 0x00, 0x54, 0x96, 0x21, 0x00, 0x59, 0x96, 0x21, 0x00, 0x5E, 0x96, 0x21, 0x00

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
    .db 0x00, 0x04, 0x04, 0x01, 0x02, 0x03, 0x05, 0x05

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
    .db 0x63, 0x96, 0x21, 0x00, 0x6D, 0x96, 0x21, 0x00, 0x68, 0x96, 0x21, 0x00, 0x72, 0x96, 0x21, 0x00
    .db 0x77, 0x96, 0x21, 0x00, 0x7C, 0x96, 0x21, 0x00, 0x81, 0x96, 0x21, 0x00, 0x86, 0x96, 0x21, 0x00

.org 0x2188FF

sub_2188FF:
    LD        XHL,swp_21890A                     [5]
    CALL      StartChildTask                     [4]
    RET                                          [1]

.org 0x21892D

swp_21892D:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x218932

swp_218932:
    LD        A,4                                [2]
    CALL      sub_21734E                         [4]
    RET                                          [1]

.org 0x218939

swp_218939:
    CALL      sub_218942                         [4]
    CALL      sub_21894B                         [4]
    RET                                          [1]

.org 0x218942

sub_218942:
    LD        XWA,(wGP)                          [4]
    LD        (0x6185),XWA                       [4]
    RET                                          [1]

.org 0x21894B

sub_21894B:
    LD        XDE,(0x6185)                       [4]
    LD        BC,0                               [2]
    LD        WA,0x604                           [3]
    CALL      sub_217303                         [4]
    RET                                          [1]
    .db 0x25, 0x30, 0xFF

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
    .db 0x52, 0xFF

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

.org 0x218A62

sub_218A62:
    LD        A,4                                [2]
    CALL      sub_21734E                         [4]
    RET                                          [1]

.org 0x218A69

sub_218A69:
    LD        A,2                                [2]
    CALL      sub_21734E                         [4]
    RET                                          [1]

.org 0x218AD8

sub_218AD8:
    CALL      sub_218AE1                         [4]
    CALL      sub_218E1A                         [4]
    RET                                          [1]

.org 0x218AE1

sub_218AE1:
    LDW       (wSetupStats),0                    [6]
    LDW       (0x6195),0                         [6]
    LDW       (0x6197),0                         [6]
    LDW       (0x6199),0                         [6]
    LDW       (0x619B),0                         [6]
    LDW       (0x619D),0                         [6]
    LDW       (0x619F),0                         [6]
    LDW       (0x61A1),0                         [6]
    CALL      sub_218EA7                         [4]
    JP        NC,.done                           [5]
    CALL      sub_218B1F                         [4]
.done:
    RET                                          [1]

.org 0x218B1F

sub_218B1F:
    LDW       (0x6197),(wPilotAP)                [6]
    LDW       (0x6199),(wPilotAP)                [6]
    LDW       (0x619B),(wPilotSP)                [6]
    LDW       (0x619D),(wPilotRP)                [6]
    LDW       (0x619F),(wPilotMP)                [6]
    CALL      swp_21963B                         [4]
    OR        WA,WA                              [2]
    JR        Z,.skip                            [2]
    CALL      sub_217434                         [4]
    LDW       (wSetupStats),(XHL+0)              [5]
    LDW       (0x6195),(XHL+2)                   [5]
    LDW       (0x61A1),(XHL+0xE)                 [5]
    LD        WA,(XHL+4)                         [3]
    ADD       (0x6197),WA                        [4]
    ADD       (0x6199),WA                        [4]
    LD        WA,(XHL+6)                         [3]
    ADD       (0x619B),WA                        [4]
    LD        WA,(XHL+8)                         [3]
    ADD       (0x619D),WA                        [4]
    LD        WA,(XHL+0xA)                       [3]
    ADD       (0x619F),WA                        [4]
.skip:
    CALL      swp_21964A                         [4]
    OR        WA,WA                              [2]
    JR        Z,.skip2                           [2]
    CALL      sub_217434                         [4]
    LD        WA,(XHL+0)                         [3]
    ADD       (wSetupStats),WA                   [4]
    LD        WA,(XHL+2)                         [3]
    ADD       (0x6195),WA                        [4]
    LD        WA,(XHL+4)                         [3]
    ADD       (0x6197),WA                        [4]
    ADD       (0x6199),WA                        [4]
    LD        WA,(XHL+6)                         [3]
    ADD       (0x619B),WA                        [4]
    LD        WA,(XHL+8)                         [3]
    ADD       (0x619D),WA                        [4]
    LD        WA,(XHL+0xA)                       [3]
    ADD       (0x619F),WA                        [4]
.skip2:
    CALL      swp_219645                         [4]
    OR        WA,WA                              [2]
    JR        Z,.skip3                           [2]
    CALL      sub_217434                         [4]
    LD        WA,(XHL+0)                         [3]
    ADD       (wSetupStats),WA                   [4]
    LD        WA,(XHL+2)                         [3]
    ADD       (0x6195),WA                        [4]
    LD        WA,(XHL+4)                         [3]
    ADD       (0x6199),WA                        [4]
    LD        WA,(XHL+6)                         [3]
    ADD       (0x619B),WA                        [4]
    LD        WA,(XHL+8)                         [3]
    ADD       (0x619D),WA                        [4]
    LD        WA,(XHL+0xA)                       [3]
    ADD       (0x619F),WA                        [4]
.skip3:
    CALL      swp_219640                         [4]
    OR        WA,WA                              [2]
    JR        Z,.skip4                           [2]
    CALL      sub_217434                         [4]
    LD        WA,(XHL+0)                         [3]
    ADD       (wSetupStats),WA                   [4]
    LD        WA,(XHL+2)                         [3]
    ADD       (0x6195),WA                        [4]
    LD        WA,(XHL+4)                         [3]
    ADD       (0x6197),WA                        [4]
    LD        WA,(XHL+6)                         [3]
    ADD       (0x619B),WA                        [4]
    LD        WA,(XHL+8)                         [3]
    ADD       (0x619D),WA                        [4]
    LD        WA,(XHL+0xA)                       [3]
    ADD       (0x619F),WA                        [4]
.skip4:
    CALL      swp_21964F                         [4]
    OR        WA,WA                              [2]
    JR        Z,.skip5                           [2]
    CALL      sub_217434                         [4]
    LD        WA,(XHL+0)                         [3]
    ADD       (wSetupStats),WA                   [4]
    LD        WA,(XHL+2)                         [3]
    ADD       (0x6195),WA                        [4]
    LD        WA,(XHL+4)                         [3]
    ADD       (0x6197),WA                        [4]
    ADD       (0x6199),WA                        [4]
    LD        WA,(XHL+6)                         [3]
    ADD       (0x619B),WA                        [4]
    LD        WA,(XHL+8)                         [3]
    ADD       (0x619D),WA                        [4]
    LD        WA,(XHL+0xA)                       [3]
    ADD       (0x619F),WA                        [4]
.skip5:
    CALL      swp_219654                         [4]
    OR        WA,WA                              [2]
    JR        Z,.skip6                           [2]
    CALL      sub_217434                         [4]
    LD        WA,(XHL+0)                         [3]
    ADD       (wSetupStats),WA                   [4]
    LD        WA,(XHL+2)                         [3]
    ADD       (0x6195),WA                        [4]
    LD        WA,(XHL+4)                         [3]
    ADD       (0x6197),WA                        [4]
    ADD       (0x6199),WA                        [4]
    LD        WA,(XHL+6)                         [3]
    ADD       (0x619B),WA                        [4]
    LD        WA,(XHL+8)                         [3]
    ADD       (0x619D),WA                        [4]
    LD        WA,(XHL+0xA)                       [3]
    ADD       (0x619F),WA                        [4]
.skip6:
    LD        BC,0                               [2]
    CALL      sub_219659                         [4]
    CALL      sub_218CAD                         [4]
    CALL      sub_21965E                         [4]
    CALL      sub_218CAD                         [4]
    OR        BC,BC                              [2]
    RET       OV                                 [2]
    LD        (0x61A1),BC                        [4]
    RET                                          [1]

.org 0x218CAD

sub_218CAD:
    OR        WA,WA                              [2]
    RET       Z                                  [2]
    CP        A,0x26                             [3]
    RET       NC                                 [2]
    EXTZ      WA                                 [2]
    SLL       2,WA                               [3]
    LD        XHL,0x218CC9                       [5]
    LDA       XHL,XHL+WA                         [5]
    LD        XHL,(XHL)                          [2]
    JP        (XHL)                              [2]

.org 0x218D61

swp_218D61:
    RET                                          [1]

.org 0x218D62

swp_218D62:
    OR        BC,1                               [4]
    RET                                          [1]

.org 0x218D67

swp_218D67:
    OR        BC,2                               [4]
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

.org 0x218D7B

swp_218D7B:
    OR        BC,0x20                            [4]
    RET                                          [1]

.org 0x218D80

swp_218D80:
    OR        BC,0x40                            [4]
    RET                                          [1]

.org 0x218D85

swp_218D85:
    OR        BC,0x80                            [4]
    RET                                          [1]

.org 0x218D8A

swp_218D8A:
    ADDW      (wSetupStats),0x19                 [6]
    RET                                          [1]

.org 0x218D91

swp_218D91:
    ADDW      (wSetupStats),0x32                 [6]
    RET                                          [1]

.org 0x218D98

swp_218D98:
    ADDW      (wSetupStats),0x50                 [6]
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
    LD        DE,(wSetupStats)                   [4]
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
    .db 0x2D, 0x01, 0x13, 0x14, 0x05, 0x12, 0xFF

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

.org 0x219238

sub_219238:
    LD        (0x61AF),XHL                       [4]
    CALL      swp_219256                         [4]
    CALL      sub_2192DE                         [4]
    RET                                          [1]

.org 0x219245

sub_219245:
    CALL      sub_21924E                         [4]
    CALL      sub_2192DE                         [4]
    RET                                          [1]

.org 0x21924E

sub_21924E:
    LD        (0x61B3),WA                        [4]
    JP        loc_219273                         [4]

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
    LD        A,EVENT_EMBLEM_GREEN               [2]
    CALL      CheckEventFlagA                    [4]
    JR        NC,.skip                           [2]
    ORB       (0x61DA),2                         [5]
.skip:
    LD        A,EVENT_EMBLEM_BLUE                [2]
    CALL      CheckEventFlagA                    [4]
    JR        NC,.skip2                          [2]
    ORB       (0x61DA),4                         [5]
.skip2:
    LD        A,EVENT_EMBLEM_WHITE               [2]
    CALL      CheckEventFlagA                    [4]
    JR        NC,.skip3                          [2]
    ORB       (0x61DA),8                         [5]
.skip3:
    LD        A,EVENT_EMBLEM_BLACK               [2]
    CALL      CheckEventFlagA                    [4]
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

.org 0x2196C7

sub_2196C7:
    CALL      loc_21968B                         [4]
    RET       NC                                 [2]
    INC       1,WA                               [2]
    CALL      RemoveItem                         [4]
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

.org 0x219720

sub_219720:
    CALL      sub_2196D4                         [4]
    RET       NC                                 [2]
    INC       1,WA                               [2]
    CALL      RemoveItem                         [4]
    RET                                          [1]

.org 0x219776

swp_219776:
    LD        XHL3,0x61E6                        [7]
    LD        RW3,2                              [3]
    CALL      BiosCall                           [4]
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

.org 0x219911

swp_219911:
    LD        XWA,2                              [2]
    JP        loc_219907                         [4]

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
    LD        A,EVENT_BODY2                      [2]
    CALL      CheckEventFlagA                    [4]
    JR        NZ,.skip                           [2]
    LD        XHL,JustThePersonIText             [5]
    LD        XDE,JustThePersonIText2            [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_219A40                         [4]
    LD        A,EVENT_BODY2                      [2]
    CALL      SetEventFlagA                      [4]
    JP        .skip5                             [4]
.skip:
    CPB       (wWorksEngineerLevel),0x1E         [5]
    JR        C,.skip2                           [2]
    LD        A,EVENT_BODY3                      [2]
    CALL      CheckEventFlagA                    [4]
    JR        NZ,.skip2                          [2]
    LD        XHL,IveGotSomeGoodText             [5]
    LD        XDE,IveGotSomeGoodText2            [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    CALL      sub_219A40                         [4]
    LD        A,EVENT_BODY3                      [2]
    CALL      SetEventFlagA                      [4]
    JP        .skip5                             [4]
.skip2:
    LD        A,EVENT_STAGE_LILY                 [2]
    CALL      CheckEventFlagA                    [4]
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

.org 0x219A53

loc_219A53:
    CALL      sub_2171A8                         [4]
    CALL      swp_2197CC                         [4]

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
    .db 0x63, 0x9B, 0x21, 0x00, 0x71, 0x9B, 0x21, 0x00, 0x39, 0x9B, 0x21, 0x00, 0x2B, 0x9B, 0x21, 0x00
    .db 0x55, 0x9B, 0x21, 0x00, 0x8D, 0x9B, 0x21, 0x00, 0x47, 0x9B, 0x21, 0x00, 0x7F, 0x9B, 0x21, 0x00

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

.org 0x219B7F

swp_219B7F:
    LD        XHL,ThisTakesYouBackText           [5]
    LD        XDE,ThisTakesYouBackText           [5]
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
    .db 0x33, 0x05, 0x0C, 0x06, 0xFF, 0x2F, 0x14, 0x08, 0x05, 0x12, 0xFF, 0x59, 0x59, 0xFF, 0x2F, 0x2B
    .db 0xFF, 0x2E, 0x2F, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
    .db 0x00, 0x00, 0x00, 0xFF

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

.org 0x21AA73

loc_21AA73:
    LD        XHL,WhewImGladToText               [5]
    LD        XDE,WhewImGladToText               [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        loc_219A5B                         [4]

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
    LD        A,(wOptionMessageSpeed)            [4]
    CALL      sub_217625                         [4]
    CALL      sub_217888                         [4]
    CALL      sub_217894                         [4]
    CALL      sub_21789A                         [4]
    LD        XHL,(0x621A)                       [4]
    JP        (XHL)                              [2]

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

.org 0x21B9DE

swp_21B9DE:
    PUSH      XHL                                [1]
    LD        XHL,0x25E648                       [5]
    LD        A,(XHL+A)                          [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21B9EB

swp_21B9EB:
    PUSH      XHL                                [1]
    LD        XHL,0x25E67A                       [5]
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
    .db 0x05, 0x0A, 0x0F, 0x14, 0x64

.org 0x21BA24

sub_21BA24:
    PUSH      XHL                                [1]
    LD        XHL,loc_21BA1E                     [5]
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

.org 0x21D1C8

swp_21D1C8:
    POP       XWA                                [1]
    LD        (XIZ+TASK_FUNC),XWA                [3]
    RET                                          [1]
    .db 0x55, 0x54

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

.org 0x21D224

swp_21D224:
    LD        BC,(0x6244)                        [4]
    OR        BC,BC                              [2]
    RET       Z                                  [2]
    LD        WA,(0x6246)                        [4]
    OR        WA,WA                              [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D236

sub_21D236:
    LD        (0x622B),WA                        [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D23C

swp_21D23C:
    LD        A,(0x622D)                         [4]
    AND       A,0xF                              [3]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D245

sub_21D245:
    ANDB      (0x622D),0xFA                      [5]
    OR        (0x622D),A                         [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D250

swp_21D250:
    LD        XHL,0x623A                         [5]
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
    LD        HL,(XIZ+TASK_ARG)                  [3]
    CALL      dyn_207494                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x2074C4                           [4]
    LDW       (XIZ+TASK_ARG),0                   [5]
    LDW       (XIZ+TASK_FUNC),0xD538             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x21            [5]
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
    DECW      1,(XIZ+TASK_ARG)                   [3]
    JR        .skip3                             [2]
.skip2:
    INCW      1,(XIZ+TASK_ARG)                   [3]
.skip3:
    LD        WA,(XIZ+TASK_ARG)                  [3]
    CP        WA,0xFFFF                          [4]
    JR        GT,.skip4                          [2]
    LDW       (XIZ+TASK_ARG),9                   [5]
    JR        loc_21D5A8                         [2]
.skip4:
    LD        WA,(XIZ+TASK_ARG)                  [3]
    CP        WA,0xA                             [4]
    JR        LT,loc_21D5A8                      [2]
    LDW       (XIZ+TASK_ARG),0                   [5]

.org 0x21D5A8

loc_21D5A8:
    LD        HL,(XIZ+TASK_ARG)                  [3]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,0x25E6B7                       [6]
    LD        XHL,(XHL)                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CALL      dyn_2076F3                         [4]
    RET                                          [1]

.org 0x21D5C0

loc_21D5C0:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x21D5C5

dyn_21D5C5:
    LDB       (wOptionMessageSpeed),3            [5]
    LDB       (wOptionAnimation),0xFF            [5]
    LD        A,0                                [2]
    CALL      dyn_20DB57                         [4]
    CALL      Z,dyn_20DC65                       [5]
    CALL      sub_2072CD                         [4]
    LDW       (XIZ+TASK_FUNC),0xD5E9             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x21            [5]
    RET                                          [1]
