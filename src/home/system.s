; home/system: 13 routines (each keeps its ROM address with .org)

.org 0x205FA3

; header entry point: stack, clear RAM, init, main loop
Start:
    CALL      InitConsoleType                    [4]
    JP        Reset                              [4]

.org 0x205FAB

; main loop restarts here
Reset:
    DI                                           [2]
    LDF       1                                  [2]
    LD        XSP,0x6C00                         [5]
    LD        RW3,1                              [3]
    LD        RBC3,0                             [3]
    CALL      BiosCall                           [4]
    LD        XWA,0                              [2]
    LD        XHL,wTextBuffer                    [5]
.loop:
    LD{1}     (XHL+),XWA                         [3]
    CP        HL,0x6C00                          [4]
    JR        C,.loop                            [2]
    ORB       (TRUN),0x80                        [4]
    LD        RW3,2                              [3]
    LD        XHL3,0x500C                        [7]
    CALL      BiosCall                           [4]
    LD        RW3,0x10                           [4]
    CALL      BiosCall                           [4]
    CALL      InitSound                          [4]
    CALL      ResetSoundState                    [4]
    LD        XWA,0                              [2]
    CALL      PlaySong                           [4]
    LDB       (0x500A),0                         [5]
    LD        XHL,VBlankHandler                  [5]
    LD        (VEC_VBLANK),XHL                   [4]
    LD        WA,(0x500C)                        [4]
    LD        BC,(0x500E)                        [4]
    LD        DE,(0x5010)                        [4]
    INC       1,DE                               [2]
    CALR      sub_2060BE                         [3]
    CALL      sub_206379                         [4]
    CALL      InitTaskList                       [4]
    CALL      sub_206FEA                         [4]
    CALL      sub_206E12                         [4]
    LDB       (0x5280),3                         [5]
    CALL      sub_2072CD                         [4]
    LD        XHL,dyn_21D5C5                     [5]
    CALL      sub_2062F5                         [4]
    EI        0                                  [2]
.loop2:
    LDB       (0x500A),0xFF                      [5]
.loop3:
    CPB       (0x500A),0                         [5]
    JR        NZ,.loop3                          [2]
    CALL      sub_20659B                         [4]
    CALL      ReadJoypad                         [4]
    CALL      sub_207361                         [4]
    CALL      sub_206E25                         [4]
    CALL      RunTasks                           [4]
    CALL      sub_2000E8                         [4]
    CPB       (wJoyResetCombo),0                 [5]
    JR        Z,.loop2                           [2]
    LDW       (GE_WBA_H),0xFF00                  [6]
    LDW       (GE_WSI_H),0                       [6]
    JRL       Reset                              [3]

.org 0x206073

; installed at VEC_VBLANK; frame counter, watchdog kick
VBlankHandler:
    PUSH      XWA                                [1]
    PUSH      XBC                                [1]
    PUSH      XDE                                [1]
    PUSH      XHL                                [1]
    PUSH      XWA3                               [3]
    PUSH      XBC3                               [3]
    PUSH      XDE3                               [3]
    PUSH      XHL3                               [3]
    LD        RW3,0x16                           [4]
    CALL      BiosCall                           [4]
    CALL      sub_2064C6                         [4]
    CALL      sub_21D9B9                         [4]
    LD        XWA,(wFrameCounter)                [4]
    INC       1,XWA                              [2]
    LD        (wFrameCounter),XWA                [4]
    LDB       (0x500A),0                         [5]
    LDB       (WDCR),0x4E                        [3]
    LD        RW3,0x15                           [4]
    CALL      BiosCall                           [4]
    POP       XHL3                               [3]
    POP       XDE3                               [3]
    POP       XBC3                               [3]
    POP       XWA3                               [3]
    POP       XHL                                [1]
    POP       XDE                                [1]
    POP       XBC                                [1]
    POP       XWA                                [1]
    RETI                                         [1]

.org 0x2060CB

; -> WA: Wichmann-Hill (seeds wRandomSeeds; 171/30269, 172/30307, 170/30323)
Random:
    PUSH      XBC                                [1]
    LD        BC,(wRandomSeeds)                  [4]
    MUL       XBC,0xAB                           [4]
    DIV       XBC,0x763D                         [4]
    LD        WA,QBC                             [3]
    LD        (wRandomSeeds),WA                  [4]
    LD        BC,(0x5002)                        [4]
    MUL       XBC,0xAC                           [4]
    DIV       XBC,0x7663                         [4]
    LD        WA,QBC                             [3]
    LD        (0x5002),WA                        [4]
    LD        BC,(0x5004)                        [4]
    MUL       XBC,0xAA                           [4]
    DIV       XBC,0x7673                         [4]
    LD        WA,QBC                             [3]
    LD        (0x5004),WA                        [4]
    LD        BC,(wRandomSeeds)                  [4]
    SLL       16,XBC                             [3]
    DIV       XBC,0x763D                         [4]
    LD{1}     WA,BC                              [2]
    LD        BC,(0x5002)                        [4]
    SLL       16,XBC                             [3]
    DIV       XBC,0x7663                         [4]
    ADD       WA,BC                              [2]
    LD        BC,(0x5004)                        [4]
    SLL       16,XBC                             [3]
    DIV       XBC,0x7673                         [4]
    ADD       WA,BC                              [2]
    POP       XBC                                [1]
    RET                                          [1]

.org 0x20615B

; HL = flag -> NZ if bit (HL & 15) of wEventFlags[HL >> 4] is set
CheckEventFlag:
    PUSH      A                                  [1]
    PUSH      BC                                 [1]
    LD        H,0                                [2]
    EXTZ      XHL                                [2]
    LD{1}     A,L                                [2]
    SRL       4,HL                               [3]
    SLL       1,HL                               [3]
    LD        BC,1                               [2]
    RLC       A,BC                               [2]
    LD        HL,(XHL+0x5060)                    [5]
    AND       HL,BC                              [2]
    SCC       NZ,HL                              [2]
    POP       BC                                 [1]
    POP       A                                  [1]
    RET                                          [1]

.org 0x206250

; clears 32 task slots at 0x5282, empty list at 0x5842
InitTaskList:
    LD        XWA,0                              [2]
    LD        XHL,wTasks                         [5]
    LD        BC,0x20                            [3]
.loop:
    LD        (XHL+0),WA                         [3]
    LD        (XHL+6),WA                         [3]
    LD        (XHL+0xC),WA                       [3]
    LD        (XHL+8),XWA                        [3]
    ADD       HL,0x2E                            [4]
    DJNZ      BC,.loop                           [3]
    LDW       (0x5844),0x5846                    [6]
    LDW       (wTaskList),0x5846                 [6]
    LDW       (0x5848),0x5842                    [6]
    LDW       (0x5846),0x5842                    [6]
    RET                                          [1]

.org 0x206286

; walks the task list, calls each task's function (+8)
RunTasks:
    LD        XIZ,0                              [2]
    LD        IZ,(0x5844)                        [4]
.loop:
    CP        IZ,0x5846                          [4]
    JR        Z,.done                            [2]
    BIT       7,(XIZ+7)                          [3]
    JR        NZ,.skip3                          [2]
    RES       6,(XIZ+7)                          [3]
    LD        XHL,(XIZ+8)                        [3]
    LD        XIY,0                              [2]
    LD        IY,(XIZ+4)                         [3]
    PUSH      IY                                 [1]
    PUSH      IZ                                 [1]
    CALL      (XHL)                              [2]
    LD        XIZ,0                              [2]
    POP       IZ                                 [1]
    LD        XIY,0                              [2]
    POP       IY                                 [1]
    OR        IY,IY                              [2]
    JR        Z,.skip2                           [2]
    BIT       7,(XIY+7)                          [3]
    JR        Z,.skip                            [2]
    LDW       (XIZ+4),0                          [5]
.skip:
    BIT       6,(XIY+7)                          [3]
    JR        Z,.skip2                           [2]
    ORB       (XIZ+7),0xC0                       [4]
.skip2:
    LD        IZ,(XIZ+2)                         [3]
    JR        .loop                              [2]
.skip3:
    LD        XDE,0                              [2]
    LD        DE,(XIZ+4)                         [3]
    OR        DE,DE                              [2]
    JR        Z,.skip4                           [2]
    DECW      1,(XDE+0xC)                        [3]
.skip4:
    LD        DE,(XIZ+0)                         [3]
    LD        XHL,0                              [2]
    LD        HL,(XIZ+2)                         [3]
    LD        (XDE+2),HL                         [3]
    LD        (XHL+0),DE                         [3]
    LDW       (XIZ+0),0                          [5]
    LDW       (XIZ+6),0                          [5]
    LD        IZ,HL                              [2]
    DECB      1,(wTaskCount)                     [4]
    JR        .loop                              [2]
.done:
    RET                                          [1]

.org 0x207014

; per frame: wJoyHistory, wJoyHeld / wJoyPressed / wJoyReleased
ReadJoypad:
    LD        XHL,wJoyHistory                    [5]
    LD        E,(wJoyHistoryIndex)               [4]
    LD        D,0                                [2]
    LDB       (XHL+DE),(SYS_JOYPAD)              [7]
    LDB       (wJoyHeld),(SYS_JOYPAD)            [6]
    DEC       1,E                                [2]
    LD        A,(XHL+DE)                         [5]
    INC       1,E                                [2]
    XOR       A,(XHL+DE)                         [5]
    LD{1}     W,A                                [2]
    AND       A,(XHL+DE)                         [5]
    LD        (wJoyPressed),A                    [4]
    LD        A,(XHL+DE)                         [5]
    CPL       A                                  [2]
    AND       W,A                                [2]
    LD        (wJoyReleased),W                   [4]
    LD        W,0x3C                             [2]
    SUB       E,W                                [2]
    LD        A,0xFF                             [2]
.loop:
    AND       A,(XHL+DE)                         [5]
    INC       1,E                                [2]
    DJNZ      W,.loop                            [3]
    AND       A,0x70                             [3]
    CP        A,0x70                             [3]
    SCC       Z,A                                [2]
    OR        (wJoyResetCombo),A                 [4]
    INCB      1,(wJoyHistoryIndex)               [4]
    RET                                          [1]

.org 0x20814D

; WA = n -> 1..n
RandomRange:
    PUSH      BC                                 [1]
    PUSH      WA                                 [1]
    CALL      Random                             [4]
    EXTZ      XWA                                [2]
    POP       BC                                 [1]
    DIV       XWA,BC                             [2]
    POP       BC                                 [1]
    LD        WA,QWA                             [3]
    INC       1,WA                               [2]
    RET                                          [1]

.org 0x219864

; [code] coroutine: saves the return address, waits 0x1E frames, resumes
Wait30Frames:
    POP       XDE                                [1]
    LD        (0x61ED),XDE                       [4]
    CALL      swp_217634                         [4]
    LD        A,0x1E                             [2]
    CALL      loc_21777C                         [4]
    LD        XHL,(0x61ED)                       [4]
    JP        (XHL)                              [2]

.org 0x219879

; [code] coroutine: resumes on A/B/left/right or after 0x3C frames
WaitForButton:
    POP       XDE                                [1]
    LD        (0x61ED),XDE                       [4]
    LDB       (0x61F5),0x3C                      [5]
.loop:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JP        NZ,.skip2                          [5]
    BIT       5,A                                [3]
    JP        NZ,.skip2                          [5]
    BIT       2,A                                [3]
    JP        NZ,.skip2                          [5]
    BIT       3,A                                [3]
    JP        NZ,.skip2                          [5]
    BIT       0,A                                [3]
    JP        NZ,.skip2                          [5]
    BIT       1,A                                [3]
    JP        NZ,.skip2                          [5]
    LD        XHL,(0x6117)                       [4]
    OR        XHL,XHL                            [2]
    JR        NZ,.skip                           [2]
    LD        A,(0x6115)                         [4]
    CALL      sub_21725D                         [4]
    JR        C,.skip                            [2]
    CPB       (0x61F5),0                         [5]
    JP        Z,.skip2                           [5]
    DECB      1,(0x61F5)                         [4]
.skip:
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip2:
    LD        XHL,(0x61ED)                       [4]
    JP        (XHL)                              [2]

.org 0x21D9F5

; SDK SYSTEM_CALL: RW3 = function, jumps through 0xFFFE00
BiosCall:
    PUSH      SR                                 [1]
    LDF       3                                  [2]
    PUSH      XIX                                [1]
    ADD       W,W                                [2]
    ADD       W,W                                [2]
    LD        XIX,0xFFFE00                       [5]
    LD        XIX,(XIX+W)                        [5]
    CALL      (XIX)                              [2]
    POP       XIX                                [1]
    POP       SR                                 [1]
    RET                                          [1]

.org 0x21DA0C

; checks OS version byte (mono NGP vs Color)
InitConsoleType:
    CPB       (SYS_OS_VERSION),0                 [5]
    JR        NZ,.done                           [2]
    RES       3,(0x6F83)                         [4]
    LDB       (0x6DA0),0                         [5]
.done:
    RET                                          [1]
