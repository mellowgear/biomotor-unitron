; engine/unsorted/code_205FA3: 80 routines (each keeps its ROM address with .org)

.org 0x2060BE

sub_2060BE:
    LD        (wRandomSeeds),WA                  [4]
    LD        (0x5002),BC                        [4]
    LD        (0x5004),DE                        [4]
    RET                                          [1]

.org 0x20612E

; [code] HL = flag: set bit (HL & 15) of wEventFlags[HL >> 4]
SetEventFlag:
    LD        H,0                                [2]
    EXTZ      XHL                                [2]
    LD{1}     A,L                                [2]
    SRL       4,HL                               [3]
    SLL       1,HL                               [3]
    LD        BC,1                               [2]
    RLC       A,BC                               [2]
    OR        (XHL+0x5060),BC                    [5]
    RET                                          [1]

.org 0x206144

; [code] HL = flag: clear it
ClearEventFlag:
    LD        H,0                                [2]
    EXTZ      XHL                                [2]
    LD{1}     A,L                                [2]
    SRL       4,HL                               [3]
    SLL       1,HL                               [3]
    LD        BC,0xFFFE                          [3]
    RLC       A,BC                               [2]
    AND       (XHL+0x5060),BC                    [5]
    RET                                          [1]

.org 0x206197

; [code] WA = item id: count + 1 (max 9), bit 7 set; C if already 9
AddItem:
    LD        XHL,wItemCounts                    [5]
    LD        C,(XHL+WA)                         [5]
    AND       C,0xF                              [3]
    CP        C,9                                [3]
    CCF                                          [1]
    RET       C                                  [2]
    INC       1,C                                [2]
    OR        C,0x80                             [3]
    LD        (XHL+WA),C                         [5]
    RCF                                          [1]
    RET                                          [1]

.org 0x2061B6

swp_2061B6:
    INC       1,W                                [2]

.org 0x2061B8

; [code+play] WA = item id: count - 1, bit 7 (seen) kept; C if none held
RemoveItem:
    LD        XHL,wItemCounts                    [5]
    LD        C,(XHL+WA)                         [5]
    AND       C,0xF                              [3]
    SCF                                          [1]
    RET       Z                                  [2]
    DEC       1,C                                [2]
    OR        C,0x80                             [3]
    LD        (XHL+WA),C                         [5]
    RCF                                          [1]
    RET                                          [1]

.org 0x2061EC

sub_2061EC:
    PUSH      XDE                                [1]
    PUSH      BC                                 [1]
    LD        C,8                                [2]
.loop:
    SRL       4,XDE                              [3]
    EXTZ      XWA                                [2]
    DIV       XWA,0xA                            [4]
    SLL       4,QA                               [4]
    LD        B,QD                               [3]
    OR        B,QA                               [3]
    LD        QD,B                               [3]
    DJNZ      C,.loop                            [3]
    LD{1}     XWA,XDE                            [2]
    POP       BC                                 [1]
    POP       XDE                                [1]
    RET                                          [1]

.org 0x20622F

sub_20622F:
    PUSH      XBC                                [1]
    SUB       A,C                                [2]
    DAA       A                                  [2]
    SBC       W,B                                [2]
    DAA       W                                  [2]
    LD        C,QA                               [3]
    SBC       C,QC                               [3]
    DAA       C                                  [2]
    LD        QA,C                               [3]
    LD        C,QW                               [3]
    SBC       C,QB                               [3]
    DAA       C                                  [2]
    LD        QW,C                               [3]
    POP       XBC                                [1]
    RET                                          [1]

.org 0x2062F5

sub_2062F5:
    INCB      1,(wTaskCount)                     [4]
    LD{1}     XDE,XHL                            [2]
    CALL      sub_206350                         [4]
    RET       C                                  [2]
    LD        XWA,0                              [2]
    LD        WA,(0x5846)                        [4]
    LD        (XWA+2),HL                         [3]
    LD        (0x5846),HL                        [4]
    LD        (XHL+0),WA                         [3]
    LDW       (XHL+2),0x5846                     [5]
    LD        (XHL+8),XDE                        [3]
    LDW       (XHL+4),0                          [5]
    LDW       (XHL+0xC),0                        [5]
    RET                                          [1]

.org 0x206324

; [code] XHL = function -> XHL = new task after the current one; the current task waits for it (+0xC)
StartChildTask:
    INCB      1,(wTaskCount)                     [4]
    LD{1}     XDE,XHL                            [2]
    CALL      sub_206350                         [4]
    RET       C                                  [2]
    LD        XWA,0                              [2]
    LD        WA,(XIZ+2)                         [3]
    LD        (XWA+0),HL                         [3]
    LD        (XIZ+2),HL                         [3]
    LD        (XHL+0),IZ                         [3]
    LD        (XHL+2),WA                         [3]
    LD        (XHL+8),XDE                        [3]
    LD        (XHL+4),IZ                         [3]
    LDW       (XHL+0xC),0                        [5]
    INCW      1,(XIZ+0xC)                        [3]
    RET                                          [1]

.org 0x206350

sub_206350:
    LD        XHL,wTasks                         [5]
.loop:
    CPB       (XHL+0),0                          [4]
    RET       Z                                  [2]
    ADD       HL,0x2E                            [4]
    CP        HL,0x5842                          [4]
    JR        C,.loop                            [2]
    LD        XHL,0                              [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x206369

; [code] marks the current task finished (bit 7 of +7); RunTasks unlinks it and wakes the parent
EndTask:
    SET       7,(XIZ+7)                          [3]
    RET                                          [1]

.org 0x20636D

dyn_20636D:
    SET       6,(XIZ+7)                          [3]
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
    LDB       (0x585B),0x81                      [5]
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
    LDB       (0x585B),0                         [5]
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

.org 0x20659B

sub_20659B:
    PUSH      XIX                                [1]
    PUSH      XIY                                [1]
    LD        XHL,0x5A86                         [5]
    LD        XDE,0x8900                         [5]
    LD        BC,(0x5A82)                        [4]
    SUB       BC,HL                              [2]
    JR        Z,.skip                            [2]
    SRL       2,BC                               [3]
.loop:
    LD        XWA,(XHL+)                         [3]
    LD{1}     (-XDE),XWA                         [3]
    DJNZ      BC,.loop                           [3]
.skip:
    LD        BC,0x5B86                          [3]
    SUB       BC,(0x5A82)                        [4]
    JR        Z,.skip2                           [2]
    SRL       2,BC                               [3]
    LD        XWA,0                              [2]
.loop2:
    LD{1}     (-XDE),XWA                         [3]
    DJNZ      BC,.loop2                          [3]
.skip2:
    CPB       (wColorFlags),0x10                 [5]
    JR        C,.skip4                           [2]
    LD        XHL,0x5B86                         [5]
    LD        XDE,0x8C40                         [5]
    LD        BC,(0x5A84)                        [4]
    SUB       BC,HL                              [2]
    JR        Z,.skip3                           [2]
.loop3:
    LD        A,(XHL+)                           [3]
    LD        (-XDE),A                           [3]
    DJNZ      BC,.loop3                          [3]
.skip3:
    LD        A,(0x585B)                         [4]
    CP        A,(0x585C)                         [4]
    LD        (0x585C),A                         [4]
    CALL      NZ,FadePalettes                    [5]
    JR        .skip5                             [2]
.skip4:
    LD        A,(0x585B)                         [4]
    CP        A,(0x585C)                         [4]
    LD        (0x585C),A                         [4]
    CALL      NZ,sub_2066DE                      [5]
    JR        .skip5                             [2]
.skip5:
    LDW       (0x5A82),0x5A86                    [6]
    LDW       (0x5A84),0x5B86                    [6]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]

.org 0x2066DE

sub_2066DE:
    CPB       (wColorFlags),0x10                 [5]
    RET       NC                                 [2]
    PUSH      XIX                                [1]
    PUSH      XIY                                [1]
    LD        XIY,wMonoPalShadow                 [5]
    LD        XIX,0x8100                         [5]
    LD        QHL,0x19                           [5]
    LD        HL,0                               [2]
    LD        A,(0x585B)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    CP        A,0x7F                             [3]
    RCF                                          [1]
    JR        Z,.skip2                           [2]
    CP        A,0x81                             [3]
    SCF                                          [1]
    JR        Z,.skip2                           [2]
    LD        L,A                                [2]
    SLL       1,L                                [3]
    CPL       L                                  [2]
    JR        C,.loop2                           [2]
.loop:
    LD        A,(XIY+)                           [3]
    AND       WA,7                               [4]
    MUL       XWA,HL                             [2]
    AND       W,7                                [3]
    OR        W,0x80                             [3]
    LD        (XIX+),W                           [3]
    DJNZ      QHL,.loop                          [4]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]
.loop2:
    LD        A,(XIY+)                           [3]
    AND       WA,7                               [4]
    LD        C,A                                [2]
    XOR       A,7                                [3]
    MUL       XWA,HL                             [2]
    ADD       W,C                                [2]
    AND       W,7                                [3]
    OR        W,0x80                             [3]
    LD        (XIX+),W                           [3]
    DJNZ      QHL,.loop2                         [4]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]
.skip:
    LD        BC,QHL                             [3]
    LDIR      (XIX+),(XIY+)                      [2]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]
.skip2:
    SBC       W,W                                [2]
    AND       W,7                                [3]
    OR        W,0x80                             [3]
.loop3:
    LD        (XIX+),W                           [3]
    DJNZ      QHL,.loop3                         [4]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]

.org 0x206768

dyn_206768:
    CP        E,0x20                             [3]
    LD        XHL,0x9000                         [5]
    JR        C,dyn_206788                       [2]
    SUB       E,0x20                             [3]
    LD        HL,0x9800                          [3]
    JR        dyn_206788                         [2]

.org 0x20677A

swp_20677A:
    LD        XHL,0x9000                         [5]
    JR        dyn_206788                         [2]

.org 0x206781

swp_206781:
    LD        XHL,0x9800                         [5]
    JR        dyn_206788                         [2]

.org 0x206788

dyn_206788:
    LD        QB,B                               [3]
    LD        QD,D                               [3]
    EXTS      BC                                 [2]
    EXTS      DE                                 [2]
    LD        QWA,WA                             [3]
    PUSH      QWA                                [3]
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    LD{1}     WA,DE                              [2]
    ADD       WA,(XSP+2)                         [3]
    JR        MI,0x2067CE                        [2]
    CP        WA,0x20                            [4]
    JR        NC,0x2067DE                        [2]
    AND       A,0x1F                             [3]
    LD        QA,A                               [3]
    LD{1}     WA,BC                              [2]
    ADD       WA,(XSP)                           [2]
    JR        MI,0x2067CE                        [2]
    CP        WA,0x20                            [4]
    JR        NC,0x2067CE                        [2]
    LD        QW,0                               [3]
    SLL       11,WA                              [3]
    SLL       6,XWA                              [3]
    LD        WA,(XSP+4)                         [3]
    LD        (XHL+QWA),WA                       [5]
    INC       1,C                                [2]
    CP        C,QB                               [3]
    JR        C,0x20679E                         [2]
    LD        C,0                                [2]
    INC       1,E                                [2]
    CP        E,QD                               [3]
    JR        C,0x20679E                         [2]
    INC       6,XSP                              [2]
    RET                                          [1]

.org 0x2067E1

sub_2067E1:
    LD        XWA,0                              [2]
    LD        XHL,0xA000                         [5]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD        XHL,0x9000                         [5]
    LD        BC,0x400                           [3]
.loop:
    LD{1}     (XHL+),XWA                         [3]
    DJNZ      BC,.loop                           [3]
    RET                                          [1]

.org 0x206803

dyn_206803:
    LD        XWA,0                              [2]
    LD        XHL,0xA000                         [5]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD        XHL,0x9000                         [5]
    LD        BC,0x200                           [3]
    LD{1}     (XHL+),XWA                         [3]
    DJNZ      BC,0x20681E                        [3]
    RET                                          [1]

.org 0x206825

dyn_206825:
    LD        XWA,0                              [2]
    LD        XHL,0xA000                         [5]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD        XHL,0x9800                         [5]
    LD        BC,0x200                           [3]
    LD{1}     (XHL+),XWA                         [3]
    DJNZ      BC,0x206840                        [3]
    RET                                          [1]

.org 0x206847

sub_206847:
    LD        XWA,0                              [2]
    LD        XHL,0x8800                         [5]
    LD        C,0x40                             [2]
.loop:
    LD{1}     (XHL+),XWA                         [3]
    DJNZ      C,.loop                            [3]
    LDW       (0x5A82),0x5A86                    [6]
    LDW       (0x5A84),0x5B86                    [6]
    RET                                          [1]

.org 0x20686F

swp_20686F:
    CALL      dyn_206877                         [4]
    JP        dyn_2068B3                         [4]

.org 0x2068B3

dyn_2068B3:
    LD        WA,0xFFF                           [3]
    LD        XDE,0x5976                         [5]
    LD        C,0x3C                             [2]
    LD{1}     (XDE+),WA                          [3]
    DJNZ      C,0x2068BD                         [3]
    LD        XHL,Pal_21F010                     [5]
    LD        BC,4                               [2]
    LDIRW     (XDE+),(XHL+)                      [2]
    LD        A,0                                [2]
    LD        XDE,0x586D                         [5]
    LD        C,4                                [2]
    LD        (XDE+),A                           [3]
    DJNZ      C,0x2068D5                         [3]
    LD        XHL,MonoPal_21F018                 [5]
    LD        BC,4                               [2]
    LDIR      (XDE+),(XHL+)                      [2]
    LD        A,(0x585B)                         [4]
    CPL       A                                  [2]
    LD        (0x585C),A                         [4]
    RET                                          [1]

.org 0x206941

swp_206941:
    LD        C,(XDE+)                           [3]
    MUL       BC,(XDE+)                          [3]
    SLL       4,WA                               [3]
    ADD       WA,0xA000                          [4]
    LD        QBC,WA                             [3]
    INC       2,XHL                              [2]
.loop:
    PUSH      XHL                                [1]
    LD        WA,(XDE+)                          [3]
    OR        WA,WA                              [2]
    JR        NZ,.skip                           [2]
    LD        XWA,0                              [2]
    LD        XHL,0                              [2]
    LD        HL,QBC                             [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD{1}     (XHL+),XWA                         [3]
    LD        QBC,HL                             [3]
    JR        .skip2                             [2]
.skip:
    DEC       1,WA                               [2]
    SLL       4,WA                               [3]
    LDA       XHL,XHL+WA                         [5]
    PUSH      BC                                 [1]
    PUSH      XDE                                [1]
    LD        BC,8                               [3]
    LD        XDE,0                              [2]
    LD        DE,QBC                             [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    LD        QBC,DE                             [3]
    POP       XDE                                [1]
    POP       BC                                 [1]
.skip2:
    POP       XHL                                [1]
    DJNZ      BC,.loop                           [3]
    RET                                          [1]

.org 0x2069C8

dyn_2069C8:
    CP        DE,0x98                            [4]
    RET       GE                                 [2]
    CP        BC,0xA0                            [4]
    RET       GE                                 [2]
    DEC       1,WA                               [2]
    OR        W,0x18                             [3]
    PUSH      WA                                 [1]
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    LD        A,(XHL+)                           [3]
    LD        QC,A                               [3]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    ADD       WA,BC                              [2]
    JRL       MI,0x206A78                        [3]
    LD        A,(XHL+)                           [3]
    LD        QB,A                               [3]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    ADD       WA,DE                              [2]
    JR        MI,0x206A78                        [2]
    LD        BC,0                               [2]
    LD        XDE,0                              [2]
    CPW       (0x5A82),0x5B86                    [6]
    JR        NC,0x206A78                        [2]
    LD        WA,(XHL)                           [2]
    AND       WA,0x1FF                           [4]
    JR        Z,0x206A66                         [2]
    LD{1}     A,B                                [2]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    ADD       WA,(XSP+2)                         [3]
    CP        WA,0xFFF8                          [4]
    JR        LE,0x206A66                        [2]
    CP        WA,0xA0                            [4]
    JR        GE,0x206A78                        [2]
    LD        QW,A                               [3]
    LD{1}     A,C                                [2]
    LD        W,0                                [2]
    SLL       3,WA                               [3]
    ADD       WA,(XSP)                           [2]
    CP        WA,0xFFF8                          [4]
    JR        LE,0x206A66                        [2]
    CP        WA,0xA8                            [4]
    JR        GE,0x206A66                        [2]
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
    INC       2,XHL                              [2]
    INC       1,C                                [2]
    CP        C,QC                               [3]
    JR        C,0x2069FF                         [2]
    LD        C,0                                [2]
    INC       1,B                                [2]
    CP        B,QB                               [3]
    JR        C,0x2069FF                         [2]
    INC       6,XSP                              [2]
    RET                                          [1]

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

.org 0x206D30

sub_206D30:
    CPL       B                                  [2]
    CPL       D                                  [2]
    OR        B,B                                [2]
    JR        Z,.skip3                           [2]
    OR        D,D                                [2]
    JR        Z,.skip3                           [2]
    LD        WA,0xA0                            [3]
    CP        B,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        L,C                                [2]
    MUL       HL,B                               [2]
    DIV{1}    HL,0xFF                            [3]
    LD{1}     W,C                                [2]
    SUB       W,L                                [2]
    LD        L,0xA0                             [2]
    SUB       L,C                                [2]
    MUL       HL,B                               [2]
    DIV{1}    HL,0xFF                            [3]
    LD{1}     A,L                                [2]
    ADD       A,C                                [2]
    SUB       A,W                                [2]
.skip:
    LD        (GE_WBA_H),W                       [4]
    LD        (GE_WSI_H),A                       [4]
    LD        WA,0x98                            [3]
    CP        D,0xFF                             [3]
    JR        Z,.skip2                           [2]
    LD        L,E                                [2]
    MUL       HL,D                               [2]
    DIV{1}    HL,0xFF                            [3]
    LD{1}     W,E                                [2]
    SUB       W,L                                [2]
    LD        L,0x98                             [2]
    SUB       L,E                                [2]
    MUL       HL,D                               [2]
    DIV{1}    HL,0xFF                            [3]
    LD{1}     A,L                                [2]
    ADD       A,E                                [2]
    SUB       A,W                                [2]
.skip2:
    LD        (GE_WBA_V),W                       [4]
    LD        (GE_WSI_V),A                       [4]
    RET                                          [1]
.skip3:
    LDW       (GE_WBA_H),0xFF00                  [6]
    LDW       (GE_WSI_H),0                       [6]
    RET                                          [1]

.org 0x206E12

sub_206E12:
    LD        WA,0                               [2]
    LD        (0x5BC7),WA                        [4]
    LD        (0x5BC9),WA                        [4]
    LD        (0x5BCB),WA                        [4]
    LD        (0x5BCD),WA                        [4]
    RET                                          [1]

.org 0x206E25

sub_206E25:
    LD        WA,(0x5BCD)                        [4]
    OR        WA,WA                              [2]
    JR        PL,.skip                           [2]
    NEG       WA                                 [2]
.skip:
    CP        WA,0x10                            [4]
    JP        NC,loc_206FC1                      [5]
    LD        WA,(0x5BCB)                        [4]
    OR        WA,WA                              [2]
    JR        PL,.skip2                          [2]
    NEG       WA                                 [2]
.skip2:
    CP        WA,0x10                            [4]
    JP        NC,loc_206FC1                      [5]
    LD        DE,(0x5BCD)                        [4]
    OR        DE,DE                              [2]
    JR        Z,.skip4                           [2]
    LD        WA,(0x5BC9)                        [4]
    ADD       DE,WA                              [2]
    LD        (0x5BC9),DE                        [4]
    LD        (0x584D),E                         [4]
    SRA       4,DE                               [3]
    SRA       4,WA                               [3]
    CP        DE,WA                              [2]
    JR        Z,.skip4                           [2]
    JR        C,.skip3                           [2]
    ADD       DE,0xC                             [4]
.skip3:
    LD        BC,(0x5BC7)                        [4]
    SRA       4,BC                               [3]
    DEC       2,BC                               [2]
    DEC       2,DE                               [2]
    CALL      sub_206F8D                         [4]
.skip4:
    LD        BC,(0x5BCB)                        [4]
    OR        BC,BC                              [2]
    JR        Z,.done                            [2]
    LD        WA,(0x5BC7)                        [4]
    ADD       BC,WA                              [2]
    LD        (0x5BC7),BC                        [4]
    LD        (0x584B),C                         [4]
    SRA       4,BC                               [3]
    SRA       4,WA                               [3]
    CP        BC,WA                              [2]
    JR        Z,.done                            [2]
    JR        C,.skip5                           [2]
    ADD       BC,0xD                             [4]
.skip5:
    LD        DE,(0x5BC9)                        [4]
    SRA       4,DE                               [3]
    DEC       2,BC                               [2]
    DEC       2,DE                               [2]
    CALL      sub_206F9E                         [4]
.done:
    RET                                          [1]

.org 0x206EB6

sub_206EB6:
    LD        XWA,(wMapPtr)                      [4]
    EXTS      XBC                                [2]
    DIVS      XBC,(XWA)                          [2]
    LD        BC,QBC                             [3]
    OR        BC,BC                              [2]
    JR        PL,.skip                           [2]
    ADD       BC,(XWA)                           [2]
.skip:
    EXTS      XDE                                [2]
    DIVS      XDE,(XWA+2)                        [3]
    LD        DE,QDE                             [3]
    OR        DE,DE                              [2]
    JR        PL,.skip2                          [2]
    ADD       DE,(XWA+2)                         [3]
.skip2:
    LD        HL,(XWA)                           [2]
    MUL       XHL,DE                             [2]
    ADD       HL,BC                              [2]
    SLL       1,HL                               [3]
    INC       4,XHL                              [2]
    ADD       XHL,XWA                            [2]
    LD        HL,(XHL)                           [2]
    RET                                          [1]

.org 0x206EE6

sub_206EE6:
    LD        XDE,0                              [2]
    LD{1}     DE,HL                              [2]
    SLL       3,DE                               [3]
    ADD       XDE,(0x5BD5)                       [4]
    AND       HL,0xE000                          [4]
    BIT       6,H                                [3]
    JR        Z,.skip                            [2]
    LD        XBC,(XDE+4)                        [3]
    LD        XDE,(XDE)                          [2]
    JR        .skip2                             [2]
.skip:
    LD        XBC,(XDE)                          [2]
    LD        XDE,(XDE+4)                        [3]
.skip2:
    BIT       7,H                                [3]
    JR        Z,.skip3                           [2]
    EX        BC,QBC                             [3]
    EX        DE,QDE                             [3]
.skip3:
    LD        QHL,HL                             [3]
    XOR       XBC,XHL                            [2]
    XOR       XDE,XHL                            [2]
    LD        HL,(0x5BCF)                        [4]
    DEC       1,HL                               [2]
    LD{1}     WA,BC                              [2]
    AND       WA,0x1FF                           [4]
    JR        Z,.skip4                           [2]
    ADD       BC,HL                              [2]
.skip4:
    LD        WA,QBC                             [3]
    AND       WA,0x1FF                           [4]
    JR        Z,.skip5                           [2]
    LD        WA,QBC                             [3]
    ADD       WA,HL                              [2]
    LD        QBC,WA                             [3]
.skip5:
    LD{1}     WA,DE                              [2]
    AND       WA,0x1FF                           [4]
    JR        Z,.skip6                           [2]
    ADD       DE,HL                              [2]
.skip6:
    LD        WA,QDE                             [3]
    AND       WA,0x1FF                           [4]
    JR        Z,.done                            [2]
    LD        WA,QDE                             [3]
    ADD       WA,HL                              [2]
    LD        QDE,WA                             [3]
.done:
    RET                                          [1]

.org 0x206F69

sub_206F69:
    LD        XWA,0                              [2]
    LD{1}     A,C                                [2]
    LD{1}     W,E                                [2]
    AND       WA,0xF0F                           [4]
    SLL       3,A                                [3]
    SRL       1,WA                               [3]
    ADD       WA,0x9000                          [4]
    PUSH      XWA                                [1]
    CALL      sub_206EB6                         [4]
    CALL      sub_206EE6                         [4]
    POP       XWA                                [1]
    LD        (XWA),XBC                          [2]
    LD        (XWA+0x40),XDE                     [3]
    RET                                          [1]

.org 0x206F8D

sub_206F8D:
    LD        A,0xE                              [2]
.loop:
    PUSH      A                                  [1]
    PUSH      BC                                 [1]
    PUSH      DE                                 [1]
    CALR      sub_206F69                         [3]
    POP       DE                                 [1]
    POP       BC                                 [1]
    POP       A                                  [1]
    INC       1,BC                               [2]
    DJNZ      A,.loop                            [3]
    RET                                          [1]

.org 0x206F9E

sub_206F9E:
    LD        A,0xD                              [2]
.loop:
    PUSH      A                                  [1]
    PUSH      BC                                 [1]
    PUSH      DE                                 [1]
    CALR      sub_206F69                         [3]
    POP       DE                                 [1]
    POP       BC                                 [1]
    POP       A                                  [1]
    INC       1,DE                               [2]
    DJNZ      A,.loop                            [3]
    RET                                          [1]

.org 0x206FAF

sub_206FAF:
    LD        A,0xD                              [2]
.loop:
    PUSH      A                                  [1]
    PUSH      BC                                 [1]
    PUSH      DE                                 [1]
    CALL      sub_206F8D                         [4]
    POP       DE                                 [1]
    POP       BC                                 [1]
    POP       A                                  [1]
    INC       1,DE                               [2]
    DJNZ      A,.loop                            [3]
    RET                                          [1]

.org 0x206FC1

loc_206FC1:
    LD        WA,0                               [2]
    LD        (0x5BCB),WA                        [4]
    LD        (0x5BCD),WA                        [4]
    LD        BC,(0x5BC7)                        [4]
    LD        (0x584B),C                         [4]
    SRA       4,BC                               [3]
    LD        DE,(0x5BC9)                        [4]
    LD        (0x584D),E                         [4]
    SRA       4,DE                               [3]
    DEC       2,BC                               [2]
    DEC       2,DE                               [2]
    CALL      sub_206FAF                         [4]
    RET                                          [1]

.org 0x206FEA

sub_206FEA:
    LD        XWA,0                              [2]
    LD        (wJoyHistoryIndex),A               [4]
    LD        (wJoyHeld),A                       [4]
    LD        (wJoyPressed),A                    [4]
    LD        (wJoyReleased),A                   [4]
    LD        (wJoyResetCombo),A                 [4]
    LD        XHL,wJoyHistory                    [5]
    LD        C,0x40                             [2]
.loop:
    LD{1}     (XHL+),XWA                         [3]
    DJNZ      C,.loop                            [3]
    LDB       (0x5CDD),(SYS_JOYPAD)              [6]
    RET                                          [1]

.org 0x20708D

dyn_20708D:
    LD        XHL,0x21F000                       [5]
    RET                                          [1]

.org 0x207093

dyn_207093:
    CALL      GetFontGlyph                       [4]
    LD        XDE,0                              [2]
    LD        DE,WA                              [2]
    SLL       4,XDE                              [3]
    ADD       XDE,0xA000                         [6]
    LD        B,8                                [2]
    LD        WA,(XHL+)                          [3]
    LD        C,8                                [2]
    SLL       1,XWA                              [3]
    BIT       0,QA                               [4]
    ZCF                                          [1]
    RL        1,QWA                              [4]
    SLL       1,WA                               [3]
    DJNZ      C,0x2070AB                         [3]
    LD        WA,QWA                             [3]
    LD{1}     (XDE+),WA                          [3]
    DJNZ      B,0x2070A6                         [3]
    RET                                          [1]

.org 0x207293

dyn_207293:
    LD        WA,(XIZ+)                          [3]
    LD        QIY,WA                             [3]
    SRL       4,QIYH                             [4]
    AND       W,0xF                              [3]
    INC       3,W                                [2]
    LD        QW,W                               [3]
    LD        XDE,wTextBuffer                    [5]
    LD        A,(XDE+QIY)                        [5]
    MINC1     0x400,QIY                          [5]
    LD        (XDE+QIX),A                        [5]
    LD        (XHL+),A                           [3]
    MINC1     0x400,QIX                          [5]
    DEC       1,IY                               [2]
    OR        IY,IY                              [2]
    JR        Z,0x20728F                         [2]
    DJNZ      QW,0x2072A5                        [4]
    JR        0x20725B                           [2]

.org 0x2072CD

sub_2072CD:
    LD        WA,1                               [2]
    LD        XHL,0x2C8569                       [5]
    CALL      LoadRawTiles                       [4]
    LD        A,1                                [2]
    LD        C,1                                [2]
    LD        XHL,MonoPal_21F018                 [5]
    CALL      LoadMonoPalettes                   [4]
    LD        A,3                                [2]
    LD        C,1                                [2]
    LD        XHL,MonoPal_21F018                 [5]
    CALL      LoadMonoPalettes                   [4]
    LD        A,5                                [2]
    LD        C,1                                [2]
    LD        XHL,MonoPal_21F018                 [5]
    CALL      LoadMonoPalettes                   [4]
    LD        A,0xF                              [2]
    LD        C,1                                [2]
    LD        XHL,Pal_21F010                     [5]
    CALL      LoadPalettes                       [4]
    LD        A,0x1F                             [2]
    LD        C,1                                [2]
    LD        XHL,Pal_21F010                     [5]
    CALL      LoadPalettes                       [4]
    LD        A,0x2F                             [2]
    LD        C,1                                [2]
    LD        XHL,Pal_21F010                     [5]
    CALL      LoadPalettes                       [4]
    LD        A,8                                [2]
    LD        XHL,wTextBoxes                     [5]
    LD        XDE,0                              [2]
.loop:
    LDW       (XHL+0),0x200                      [5]
    LDB       (XHL+2),0x20                       [4]
    LDB       (XHL+3),0x20                       [4]
    LD        (XHL+4),E                          [3]
    LD        (XHL+5),E                          [3]
    LD        (XHL+6),E                          [3]
    LD        (XHL+7),E                          [3]
    LD        (XHL+8),XDE                        [3]
    LD        (XHL+0xC),XDE                      [3]
    LDB       (XHL+0x10),(0x5280)                [5]
    LD        (XHL+0x11),E                       [3]
    LD        (XHL+0x12),E                       [3]
    ADD       HL,0x13                            [4]
    DJNZ      A,.loop                            [3]
    RET                                          [1]

.org 0x207361

sub_207361:
    LD        A,0                                [2]
.loop:
    PUSH      A                                  [1]
    CALL      GetTextBox                         [4]
    LD        XBC,(XWA+8)                        [3]
    OR        XBC,XBC                            [2]
    JR        Z,.skip                            [2]
    LD        XHL,0                              [2]
    LD        L,(XWA+0x12)                       [3]
    SLL       2,L                                [3]
    ADD       XHL,0x2073A7                       [6]
    LD        XHL,(XHL)                          [2]
    CALL      (XHL)                              [2]
.skip:
    POP       A                                  [1]
    INC       1,A                                [2]
    CP        A,8                                [3]
    JR        C,.loop                            [2]
    LD        A,(wFrameCounter)                  [4]
    SRL       3,A                                [3]
    AND       A,1                                [3]
    LD        XHL,0x2C83B9                       [5]
    JR        Z,.skip2                           [2]
    LD        XHL,0x2C83CB                       [5]
.skip2:
    LD        WA,0xB                             [3]
    CALL      LoadRawTiles                       [4]
    RET                                          [1]
    .db B3 73 20 00 3A 74 20 00 43 74 20 00

.org 0x2073D7

dyn_2073D7:
    CPL       L                                  [2]
    EXTZ      HL                                 [2]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,0x2073F4                       [6]
    LD        XHL,(XHL)                          [2]
    CALL      (XHL)                              [2]
    LD        L,(XWA+0x12)                       [3]
    AND       L,0x7F                             [3]
    RET       NZ                                 [2]
    JR        TextStep                           [2]
    .db 0C 74 20 00 57 76 20 00 D0 75 20 00 18 74 20 00
    .db 27 74 20 00 36 74 20 00

.org 0x20743A

dyn_20743A:
    DECB      1,(XWA+0x11)                       [3]
    RET       NZ                                 [2]
    DECB      1,(XWA+0x12)                       [3]
    RET                                          [1]

.org 0x207443

dyn_207443:
    LD        C,(XWA+2)                          [3]
    ADD       C,(XWA+4)                          [3]
    DEC       2,C                                [2]
    LD        E,(XWA+3)                          [3]
    ADD       E,(XWA+5)                          [3]
    DEC       1,E                                [2]
    LD        B,1                                [2]
    LD        D,1                                [2]
    PUSH      XWA                                [1]
    LD        WA,0x3E0B                          [3]
    CALL      dyn_206768                         [4]
    POP       XWA                                [1]
    LD        L,(wJoyPressed)                    [4]
    AND       L,0x30                             [3]
    RET       Z                                  [2]
    DECB      2,(XWA+0x12)                       [3]
    LD        C,(XWA+2)                          [3]
    ADD       C,(XWA+4)                          [3]
    DEC       2,C                                [2]
    LD        E,(XWA+3)                          [3]
    ADD       E,(XWA+5)                          [3]
    DEC       1,E                                [2]
    LD        B,1                                [2]
    LD        D,1                                [2]
    PUSH      XWA                                [1]
    LD        WA,0x3E09                          [3]
    CALL      dyn_206768                         [4]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x207494

dyn_207494:
    CALL      GetTextBox                         [4]
    LD        (XWA+0),HL                         [3]
    LD        (XWA+4),C                          [3]
    LD        (XWA+5),E                          [3]
    LDB       (XWA+0x12),0                       [4]
    CALL      TextCmd_Page                       [4]
    RET                                          [1]

.org 0x2074C0

dyn_2074C0:
    CALL      GetTextBox                         [4]
    BIT       7,(XWA+0x12)                       [3]
    JRL       NZ,dyn_207559                      [3]
    LD        (XWA+2),C                          [3]
    LD        (XWA+3),E                          [3]
    LD        XHL,0                              [2]
    LD        H,E                                [2]
    SRL       2,HL                               [3]
    LD        B,0                                [2]
    SLL       1,BC                               [3]
    ADD       HL,BC                              [2]
    ADD       HL,0x9000                          [4]
    LD        D,(XWA+5)                          [3]
    DEC       1,D                                [2]
    LD        E,0                                [2]
    SRL       2,DE                               [3]
    LDW       (XHL),0x3E01                       [4]
    LDW       (XHL+DE),0x3E03                    [7]
    LD        B,(XWA+4)                          [3]
    DEC       2,B                                [2]
    LD        C,2                                [2]
    INC       2,DE                               [2]
    LDW       (XHL+C),0x3E07                     [7]
    LDW       (XHL+DE),0x3E09                    [7]
    INC       2,C                                [2]
    INC       2,DE                               [2]
    DJNZ      B,0x207500                         [3]
    LDW       (XHL+C),0x3E02                     [7]
    LDW       (XHL+DE),0x3E06                    [7]
    LD        E,(XWA+5)                          [3]
    DEC       2,E                                [2]
    LD        QD,E                               [3]
    LD        DE,(XWA+0)                         [3]
    OR        DE,0x3E00                          [4]
    ADD       HL,0x40                            [4]
    LDW       (XHL),0x3E08                       [4]
    LD        B,(XWA+4)                          [3]
    DEC       2,B                                [2]
    LD        C,2                                [2]
    LD        (XHL+C),DE                         [5]
    INC       1,DE                               [2]
    INC       2,C                                [2]
    DJNZ      B,0x207541                         [3]
    LDW       (XHL+C),0x3E0A                     [7]
    DJNZ      QD,0x207532                        [4]
    RET                                          [1]

.org 0x207559

dyn_207559:
    LD        (XWA+2),C                          [3]
    LD        (XWA+3),E                          [3]
    LD        XHL,0                              [2]
    LD        H,E                                [2]
    SRL       2,HL                               [3]
    LD        B,0                                [2]
    SLL       1,BC                               [3]
    ADD       HL,BC                              [2]
    ADD       HL,0x9000                          [4]
    LD        E,(XWA+5)                          [3]
    LD        QD,E                               [3]
    LD        DE,(XWA+0)                         [3]
    OR        DE,0x3E00                          [4]
    LD        B,(XWA+4)                          [3]
    LD        C,0                                [2]
    LD        (XHL+C),DE                         [5]
    INC       1,DE                               [2]
    INC       2,C                                [2]
    DJNZ      B,0x207583                         [3]
    ADD       HL,0x40                            [4]
    DJNZ      QD,0x20757E                        [4]
    RET                                          [1]

.org 0x207598

dyn_207598:
    CALL      GetTextBox                         [4]
    LD        XHL,0                              [2]
    LD        (XWA+8),XHL                        [3]
    LD        (XWA+0xC),XHL                      [3]
    LD        C,(XWA+2)                          [3]
    LD        E,(XWA+3)                          [3]
    LD        B,(XWA+4)                          [3]
    LD        D,(XWA+5)                          [3]
    PUSH      XWA                                [1]
    LD        WA,0                               [2]
    CALL      dyn_206768                         [4]
    POP       XWA                                [1]
    LD        XDE,0                              [2]
    LD        (XWA+8),XDE                        [3]
    LD        (XWA+0xC),XDE                      [3]
    LDB       (XWA+0x10),(0x5280)                [5]
    LD        (XWA+0x11),E                       [3]
    LD        (XWA+0x12),E                       [3]
    RET                                          [1]

.org 0x2075CC

dyn_2075CC:
    CALL      GetTextBox                         [4]

.org 0x2075F6

dyn_2075F6:
    LDB       (XWA+6),0                          [4]
    LDB       (XWA+7),0                          [4]
    LD        C,(XWA+4)                          [3]
    MUL       BC,(XWA+5)                         [3]
    PUSH      XWA                                [1]
    LD        WA,(XWA+0)                         [3]
    LD        QA,1                               [3]
    CALL      FillTiles                          [4]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x207611

dyn_207611:
    CALL      GetTextBox                         [4]
    LD        XHL,0                              [2]
    LD        (XWA+8),XHL                        [3]
    LD        (XWA+0xC),XHL                      [3]
    LD        (XWA+0x12),L                       [3]
    LDB       (XWA+0x10),(0x5280)                [5]
    LD        (XWA+0x11),L                       [3]
    RET                                          [1]

.org 0x207629

swp_207629:
    CALL      GetTextBox                         [4]
    BIT       7,(XWA+0x12)                       [3]
    JR        NZ,dyn_207644                      [2]
    INCB      1,(XWA+6)                          [3]
    LD        B,(XWA+4)                          [3]
    DEC       2,B                                [2]
    CP        (XWA+6),B                          [3]
    RET       C                                  [2]
    CALL      TextCmd_Newline                    [4]
    RET                                          [1]

.org 0x207644

dyn_207644:
    INCB      1,(XWA+6)                          [3]
    LD        B,(XWA+4)                          [3]
    CP        (XWA+6),B                          [3]
    RET       C                                  [2]
    CALR      dyn_207674                         [3]
    RET                                          [1]

.org 0x207653

swp_207653:
    CALL      GetTextBox                         [4]

.org 0x20768A

sub_20768A:
    CALL      GetTextBox                         [4]
    LD        (XWA+6),C                          [3]
    LD        (XWA+7),E                          [3]
    RET                                          [1]

.org 0x207695

swp_207695:
    CALL      GetTextBox                         [4]

.org 0x2076B1

dyn_2076B1:
    CPL       L                                  [2]
    EXTZ      HL                                 [2]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,0x2076C6                       [6]
    LD        XHL,(XHL)                          [2]
    CALL      (XHL)                              [2]
    SCF                                          [1]
    RET                                          [1]
    .db DE 76 20 00 57 76 20 00 D0 75 20 00 DF 76 20 00
    .db E9 76 20 00 DE 76 20 00

.org 0x2076DE

swp_2076DE:
    RET                                          [1]

.org 0x2076DF

swp_2076DF:
    LD        XHL,wPlayerName                    [5]
    CALL      0x2076F7                           [4]
    RET                                          [1]

.org 0x2076E9

swp_2076E9:
    LD        XHL,wPartnerName                   [5]
    CALL      0x2076F7                           [4]
    RET                                          [1]

.org 0x2076F3

dyn_2076F3:
    CALL      GetTextBox                         [4]
    LD{1}     XBC,XHL                            [2]
    LD        XHL,0                              [2]
    LD        L,(XBC+)                           [3]
    CP        L,0xFF                             [3]
    RET       Z                                  [2]
    PUSH      XBC                                [1]
    CALL      DrawTextChar                       [4]
    POP       XBC                                [1]
    JR        0x2076F9                           [2]

.org 0x20770B

swp_20770B:
    CALL      GetTextBox                         [4]
    LD        XDE,0                              [2]
    LD        DE,(XWA+0)                         [3]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    RET                                          [1]

.org 0x20771C

swp_20771C:
    CALL      GetTextBox                         [4]
    BIT       7,(XWA+0x12)                       [3]
    JR        NZ,dyn_207740                      [2]
    LD        XDE,0                              [2]
    LD        E,(XWA+4)                          [3]
    DEC       2,E                                [2]
    MUL       DE,(XWA+7)                         [3]
    ADD       E,(XWA+6)                          [3]
    ADC       D,0                                [3]
    ADD       DE,(XWA+0)                         [3]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    RET                                          [1]

.org 0x207740

dyn_207740:
    LD        XDE,0                              [2]
    LD        E,(XWA+4)                          [3]
    MUL       DE,(XWA+7)                         [3]
    ADD       E,(XWA+6)                          [3]
    ADC       D,0                                [3]
    ADD       DE,(XWA+0)                         [3]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    RET                                          [1]

.org 0x20776A

; [code] WA = command -> QueueSoundCommand
SoundCommand:
    CALL      QueueSoundCommand                  [4]
    RET                                          [1]

.org 0x20776F

swp_20776F:
    CPW       (0x200020),0xFFFE                  [7]
    SCC       Z,RA3                              [3]
    LD        RB3,B                              [3]
    LD        RW3,8                              [4]
    LDB       (WDCR),0x4E                        [3]
    SWI       1                                  [1]
    LDB       (WDCR),0x4E                        [3]
    RET                                          [1]

.org 0x207788

sub_207788:
    CPW       (0x200020),0xFFFE                  [7]
    SCC       Z,RA3                              [3]
    LD        RW3,6                              [3]
    LD        RBC3,BC                            [3]
    LD        XHL3,XHL                           [3]
    LD        XDE3,XDE                           [3]
    LDB       (WDCR),0x4E                        [3]
    SWI       1                                  [1]
    LDB       (WDCR),0x4E                        [3]
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
