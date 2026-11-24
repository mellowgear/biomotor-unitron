; engine/unsorted/code_20D59E: 30 routines (each keeps its ROM address with .org)

.org 0x20D59E

swp_20D59E:
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+0xE),0xC                      [5]
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
    LDW       (XIZ+8),0xD5DA                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
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
    LDW       (XIZ+8),0xD5DA                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip2:
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xD1BD                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20D7FA

swp_20D7FA:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        BC,0x400                           [3]
    DEC       1,BC                               [2]
    LD        XHL,0x9000                         [5]
    LD        XDE,0x9002                         [5]
    LDW       (XHL),0                            [4]
    LDIRW     (XDE+),(XHL+)                      [2]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    CALR      dyn_20D84E                         [3]
    LDW       (wPilotAP),0x3E7                   [6]
    LDW       (wPilotSP),0x3E7                   [6]
    LDW       (wPilotRP),0x3E7                   [6]
    LDW       (wPilotMP),0x3E7                   [6]
    LDB       (wPlayerLevel),0x63                [5]
    LDW       (wSkill1),1                        [6]
    LDW       (wSkill2),3                        [6]
    CALL      CalcUnitStats                      [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20D84E

dyn_20D84E:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        XWA,dyn_20DA71                     [5]
    LD        (XIZ+8),XWA                        [3]
    LD        WA,1                               [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x21                            [3]
    CALL      SoundCommand                       [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20D8FB

dyn_20D8FB:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,StreetMenuPrompt                 [2]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CALR      dyn_20D9A6                         [3]
    JR        dyn_20D983                         [2]

.org 0x20D936

dyn_20D936:
    AND       A,0xF                              [3]
    JR        Z,dyn_20D983                       [2]
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LD        A,(0x5DF4)                         [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    DEC       1,A                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip:
    LD        A,4                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip4                          [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LD        A,(0x5DF4)                         [4]
    CP        A,4                                [2]
    JR        Z,.skip3                           [2]
    INC       1,A                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip3:
    LD        A,0                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip4:
    JR        dyn_20D983                         [2]

.org 0x20D983

dyn_20D983:
    LD        BC,0x60                            [3]
    LD        XWA,0                              [2]
    LD        A,(0x5DF4)                         [4]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20D9A6

dyn_20D9A6:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        XHL,0                              [2]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,(0x5DF4)                         [4]
    CP        A,2                                [2]
    JR        Z,dyn_20D9F8                       [2]
    CP        A,3                                [2]
    JR        Z,dyn_20D9F8                       [2]
    CP        A,0                                [2]
    JR        Z,dyn_20D9F8                       [2]
    CP        A,1                                [2]
    JR        Z,dyn_20D9F8                       [2]
    LD        HL,0                               [2]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip                           [2]
    LD        HL,8                               [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip                           [2]
    JR        dyn_20D9F8                         [2]
.skip:
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,NoUNITRONYouCantText           [5]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    JR        dyn_20D9FF                         [2]

.org 0x20D9F8

dyn_20D9F8:
    LD        A,4                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        dyn_20D9FF                         [2]

.org 0x20D9FF

dyn_20D9FF:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DA04

swp_20DA04:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2167F9                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,(0x5DF4)                         [4]
    CP        A,4                                [2]
    JR        NZ,.skip                           [2]
    LD        XHL,swp_210443                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    JR        .skip5                             [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    LD        XHL,swp_214BEC                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip3:
    CP        A,0                                [2]
    JR        NZ,.skip4                          [2]
    LD        XHL,dyn_214C0E                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip4:
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    LD        XHL,swp_214C75                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip5:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DA5C

sub_20DA5C:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        WA,(XIZ+0xC)                       [3]
    CP        WA,0                               [2]
    JR        NZ,.skip                           [2]
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
.skip:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DA71

dyn_20DA71:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0xE)                        [3]
    CP        A,1                                [2]
    JR        NZ,dyn_20DA86                      [2]
    CALR      StreetMenu                         [3]
    LD        A,2                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        0x20DAB4                           [2]

.org 0x20DA86

dyn_20DA86:
    CP        A,2                                [2]
    JR        NZ,dyn_20DA91                      [2]
    LD        A,3                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        0x20DAB4                           [2]

.org 0x20DA91

dyn_20DA91:
    CP        A,3                                [2]
    JR        NZ,dyn_20DA9A                      [2]
    CALR      dyn_20D8FB                         [3]
    JR        0x20DAB4                           [2]

.org 0x20DA9A

dyn_20DA9A:
    CP        A,4                                [2]
    JR        NZ,.skip                           [2]
    CALL      EndTask                            [4]
    JR        0x20DAB4                           [2]
.skip:
    CP        A,5                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_20DA5C                         [3]
    JR        0x20DAB4                           [2]
.skip2:
    JR        0x20DAB4                           [2]

.org 0x20DAAF

swp_20DAAF:
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DAB9

dyn_20DAB9:
    CALL      dyn_20DACC                         [4]
    ADD       XHL,0xFA000                        [6]
    PUSH      XHL                                [1]
    CALL      dyn_2077BE                         [4]
    ADD       XHL,(XSP+)                         [3]
    RET                                          [1]

.org 0x20DACC

dyn_20DACC:
    LD        XHL,0                              [2]
    OR        A,A                                [2]
    RET       Z                                  [2]
    DEC       1,A                                [2]
    LD        L,A                                [2]
    MUL       XHL,0x290                          [4]
    ADD       XHL,0x30                           [6]
    RET                                          [1]

.org 0x20DAE1

swp_20DAE1:
    LD        RW3,0x16                           [4]
    CALL      BiosCall                           [4]
.loop:
    LD        B,0x11                             [2]
    CALL      swp_20776F                         [4]
    CP        RA3,0                              [3]
    JR        NZ,.loop                           [2]
    LD        RW3,0x15                           [4]
    CALL      BiosCall                           [4]
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
    LD        XDE,0x5280                         [5]
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
    LDW       (XIZ+8),0xDCAD                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
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
    LDW       (XIZ+8),0xDCAD                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
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
    LDW       (XIZ+8),0xDD3F                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
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
    LDW       (XIZ+8),0xDD3F                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip:
    LD        A,(0x5DF6)                         [4]
    CALL      swp_20DB72                         [4]
    CALR      sub_20E012                         [3]
    LD        XHL,swp_20E1BC                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xDD24                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20DF5B

swp_20DF5B:
    NOP                                          [1]
    PUSH      IX                                 [1]
    RETD      1025                               [3]
    .db FF 00 33 01 16 05 FF 00 23 0C 05 01 12 FF FE 00
    .db 00 00 00 00 65 2E 2F 2E 25 65 FF 2C 6E 6D 70 6F

.org 0x20DF80

sub_20DF80:
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0x12                             [2]
    LD        E,3                                [2]
    LD        HL,(XIZ+0xE)                       [3]
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
