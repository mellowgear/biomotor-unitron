; engine/menus/title: 90 routines (each keeps its ROM address with .org)

.org 0x206195

dyn_206195:
    INC       1,W                                [2]

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

.org 0x206863

dyn_206863:
    CALL      dyn_206877                         [4]
    CALL      dyn_2068B3                         [4]
    JP        dyn_2068EF                         [4]

.org 0x20686F

swp_20686F:
    CALL      dyn_206877                         [4]
    JP        dyn_2068B3                         [4]

.org 0x206877

dyn_206877:
    LD        WA,0xFFF                           [3]
    LD        XDE,0x58F6                         [5]
    LD        C,0x3C                             [2]
    LD{1}     (XDE+),WA                          [3]
    DJNZ      C,0x206881                         [3]
    LD        XHL,Pal_21F010                     [5]
    LD        BC,4                               [2]
    LDIRW     (XDE+),(XHL+)                      [2]
    LD        A,0                                [2]
    LD        XDE,0x5865                         [5]
    LD        C,4                                [2]
    LD        (XDE+),A                           [3]
    DJNZ      C,0x206899                         [3]
    LD        XHL,MonoPal_21F018                 [5]
    LD        BC,4                               [2]
    LDIR      (XDE+),(XHL+)                      [2]
    LD        A,(wFadeLevel)                     [4]
    CPL       A                                  [2]
    LD        (0x585C),A                         [4]
    RET                                          [1]

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
    LD        A,(wFadeLevel)                     [4]
    CPL       A                                  [2]
    LD        (0x585C),A                         [4]
    RET                                          [1]

.org 0x2068EF

dyn_2068EF:
    LD        WA,0xFFF                           [3]
    LD        XDE,wPalShadow                     [5]
    LD        C,0x3C                             [2]
    LD{1}     (XDE+),WA                          [3]
    DJNZ      C,0x2068F9                         [3]
    LD        XHL,Pal_21F010                     [5]
    LD        BC,4                               [2]
    LDIRW     (XDE+),(XHL+)                      [2]
    LD        A,0                                [2]
    LD        XDE,wMonoPalShadow                 [5]
    LD        C,4                                [2]
    LD        (XDE+),A                           [3]
    DJNZ      C,0x206911                         [3]
    LD        XHL,MonoPal_21F018                 [5]
    LD        BC,4                               [2]
    LDIR      (XDE+),(XHL+)                      [2]
    LD        A,(wFadeLevel)                     [4]
    CPL       A                                  [2]
    LD        (0x585C),A                         [4]
    RET                                          [1]

.org 0x207611

dyn_207611:
    CALL      GetTextBox                         [4]
    LD        XHL,0                              [2]
    LD        (XWA+8),XHL                        [3]
    LD        (XWA+0xC),XHL                      [3]
    LD        (XWA+0x12),L                       [3]
    LDB       (XWA+0x10),(wOptionMessageSpeed)   [5]
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

.org 0x207674

dyn_207674:
    LDB       (XWA+6),0                          [4]
    INCB      1,(XWA+7)                          [3]
    LD        B,(XWA+5)                          [3]
    CP        (XWA+7),B                          [3]
    RET       C                                  [2]
    DEC       1,B                                [2]
    LD        (XWA+7),B                          [3]
    RCF                                          [1]
    RET                                          [1]

.org 0x20CED8

swp_20CED8:
    PUSH      XSP                                [1]
    NOP                                          [1]
    JR        Z,.skip                            [2]
    ADDB      (0x5DBB),0x32                      [5]
.skip:
    CPB       (0x5DC9),0                         [5]
    JR        Z,.skip2                           [2]
    ADDB      (0x5DBB),0xE2                      [5]
.skip2:
    CPB       (0x5DCD),0                         [5]
    JR        Z,.skip3                           [2]
    ADDB      (0x5DBB),0xE2                      [5]
.skip3:
    LDB       (wEnemyRPBuff),0x64                [5]
    CPB       (0x5DCA),0                         [5]
    JR        Z,.skip4                           [2]
    ADDB      (wEnemyRPBuff),0xE2                [5]
.skip4:
    CPB       (0x5DCE),0                         [5]
    JR        Z,.skip5                           [2]
    ADDB      (wEnemyRPBuff),0xE2                [5]
.skip5:
    LDB       (0x5DBD),0x64                      [5]
    CPB       (0x5DCB),0                         [5]
    JR        Z,.skip6                           [2]
    ADDB      (0x5DBD),0xE2                      [5]
.skip6:
    CPB       (0x5DCF),0                         [5]
    JR        Z,.done                            [2]
    ADDB      (0x5DBD),0xE2                      [5]
.done:
    RET                                          [1]

.org 0x20CF34

; [play] main_menu: window graphics, portrait, music
MainMenuSetup:
    CALL      sub_2072CD                         [4]
    CALL      sub_2067E1                         [4]
    LDB       (0x5DF2),0                         [5]
    LD        WA,0xB5                            [3]
    LD        HL,0x2A                            [3]
    LD        BC,0xA                             [3]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    LD        WA,0x161                           [3]
    LD        HL,0x2B                            [3]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    LD        WA,0x14                            [3]
    CALL      PlayMusic                          [4]
    LD        WA,0x35                            [3]
    CALL      SoundCommand                       [4]
    LDB       (GE_PLANE_PRIO),0                  [5]
    LDW       (XIZ+TASK_FUNC),0xCF7C             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20CF7C

; [play] main_menu, reads wJoyPressed
MainMenu:
    CALL      dyn_206825                         [4]
    CALL      sub_206847                         [4]
    LD        A,0                                [2]
    LD        C,0xC                              [2]
    LD        E,3                                [2]
    LD        HL,0xC                             [3]
    CALL      dyn_207494                         [4]
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    LD        XHL,0x20D0C2                       [5]
    CALL      0x2076F7                           [4]
    LD        C,4                                [2]
    LD        E,0x22                             [2]
    CALL      0x2074C4                           [4]
    LD        A,1                                [2]
    LD        C,0xC                              [2]
    LD        E,7                                [2]
    LD        HL,0x16                            [3]
    CALL      dyn_207494                         [4]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        XHL,0x20D0CD                       [5]
    CALL      0x2076F7                           [4]
    LD        C,4                                [2]
    LD        E,0x26                             [2]
    CALL      0x2074C4                           [4]
    LD        XHL,dyn_20D6DF                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xCFED             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        E,(0x5DF2)                         [4]
    LD        D,0                                [2]
    SLL       4,DE                               [3]
    ADD       DE,0x34                            [4]
    LD        BC,0x28                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_UP,A                         [3]
    JR        NZ,.skip                           [2]
    BIT       1,A                                [3]
    JR        NZ,.skip2                          [2]
    BIT       4,A                                [3]
    JR        NZ,ConfigMenuTask                  [2]
    BIT       5,A                                [3]
    JR        NZ,loc_20D091                      [2]
    RET                                          [1]
.skip:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    DECB      1,(0x5DF2)                         [4]
    RET       PL                                 [2]
    LDB       (0x5DF2),2                         [5]
    RET                                          [1]
.skip2:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    INCB      1,(0x5DF2)                         [4]
    CPB       (0x5DF2),3                         [5]
    RET       C                                  [2]
    LDB       (0x5DF2),0                         [5]
    RET                                          [1]

.org 0x20D04E

; [play] Config menu task (config_menu only)
ConfigMenuTask:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CALL      dyn_206825                         [4]
    LD        XHL,0                              [2]
    LD        L,(0x5DF2)                         [4]
    SLL       2,HL                               [3]
    ADD       XHL,0x20D085                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
    .db 0xE8, 0xD0, 0x20, 0x00, 0xF6, 0xD0, 0x20, 0x00, 0xBD, 0xD1, 0x20, 0x00

.org 0x20D091

loc_20D091:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CALL      dyn_206825                         [4]
    LDB       (0x5DF2),0                         [5]
    LDB       (GE_PLANE_PRIO),0x80               [5]
    CALL      EndTask                            [4]
    RET                                          [1]
    .db 0xFD, 0x2D, 0x01, 0x09, 0x0E, 0x00, 0x2D, 0x05, 0x0E, 0x15, 0xFF, 0xFD, 0x00, 0x2E, 0x05, 0x17
    .db 0x00, 0x27, 0x01, 0x0D, 0x05, 0xFE, 0xFE, 0x00, 0x2C, 0x0F, 0x01, 0x04, 0xFE, 0xFE, 0x00, 0x23
    .db 0x0F, 0x0E, 0x06, 0x09, 0x07, 0xFF

.org 0x20D0E8

dyn_20D0E8:
    INCB      1,(0x5DF2)                         [4]
    LDB       (GE_PLANE_PRIO),0x80               [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20D0F6

swp_20D0F6:
    LDW       (XIZ+TASK_ARG),0xC                 [5]
    LDW       (XIZ+0x10),0                       [5]
    CALL      swp_20DC7C                         [4]
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
    LDW       (XIZ+TASK_FUNC),0xD11B             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip:
    LD        A,(0x5DF6)                         [4]
    CALL      sub_20DC43                         [4]
    CALL      sub_20E012                         [4]
    LD        XHL,swp_20E1BC                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    INCB      1,(0x5DF2)                         [4]
    LDB       (GE_PLANE_PRIO),0x80               [5]
    CALL      EndTask                            [4]
    RET                                          [1]
.skip2:
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xCF7C             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20D1BD

swp_20D1BD:
    LDB       (0x5DF3),0                         [5]
    CALL      dyn_206825                         [4]
    LD        A,0                                [2]
    LD        C,0xA                              [2]
    LD        E,3                                [2]
    LD        HL,0xC                             [3]
    CALL      dyn_207494                         [4]
    LD        XHL,0x20D333                       [5]
    CALL      0x2076F7                           [4]
    LD        C,0                                [2]
    LD        E,0x20                             [2]
    CALL      0x2074C4                           [4]
    LD        A,1                                [2]
    LD        C,0x12                             [2]
    LD        E,5                                [2]
    LD        HL,0x16                            [3]
    CALL      dyn_207494                         [4]
    LD        XHL,0x20D33B                       [5]
    CALL      0x2076F7                           [4]
    LD        C,1                                [2]
    LD        E,0x24                             [2]
    CALL      0x2074C4                           [4]
    LD        A,2                                [2]
    LD        C,0x12                             [2]
    LD        E,5                                [2]
    LD        HL,0x46                            [3]
    CALL      dyn_207494                         [4]
    LD        XHL,0x20D35C                       [5]
    CALL      0x2076F7                           [4]
    LD        C,1                                [2]
    LD        E,0x29                             [2]
    CALL      0x2074C4                           [4]
    LD        A,3                                [2]
    LD        C,0x12                             [2]
    LD        E,5                                [2]
    LD        HL,0x76                            [3]
    CALL      dyn_207494                         [4]
    LD        XHL,0x20D378                       [5]
    CALL      0x2076F7                           [4]
    LD        C,1                                [2]
    LD        E,0x2E                             [2]
    CALL      0x2074C4                           [4]
    LD        XHL,dyn_20D6DF                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xD25F             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CALR      sub_20D684                         [3]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_UP,A                         [3]
    JR        NZ,.skip                           [2]
    BIT       1,A                                [3]
    JR        NZ,.skip2                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       5,A                                [3]
    JRL       NZ,.skip6                          [3]
    AND       A,0xC                              [3]
    JR        NZ,.skip4                          [2]
    RET                                          [1]
.skip:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    DECB      1,(0x5DF3)                         [4]
    RET       PL                                 [2]
    LDB       (0x5DF3),2                         [5]
    RET                                          [1]
.skip2:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    INCB      1,(0x5DF3)                         [4]
    CPB       (0x5DF3),3                         [5]
    RET       C                                  [2]
    LDB       (0x5DF3),0                         [5]
    RET                                          [1]
.skip3:
    CPB       (0x5DF3),2                         [5]
    RET       C                                  [2]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+TASK_FUNC),0xD397             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip4:
    CPB       (0x5DF3),1                         [5]
    JR        C,.skip5                           [2]
    RET       NZ                                 [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CPB       (wOptionAnimation),0xFF            [5]
    LDB       (wOptionAnimation),0               [5]
    RET       Z                                  [2]
    LDB       (wOptionAnimation),0xFF            [5]
    RET                                          [1]
.skip5:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CPB       (wOptionMessageSpeed),3            [5]
    LDB       (wOptionMessageSpeed),1            [5]
    RET       Z                                  [2]
    LDB       (wOptionMessageSpeed),3            [5]
    RET                                          [1]
.skip6:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        A,0                                [2]
    CALL      loc_20DBDE                         [4]
    CALL      dyn_206825                         [4]
    LDW       (XIZ+TASK_FUNC),0xCF7C             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20D404

swp_20D404:
    LD        W,0                                [2]
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]

.org 0x20D40A

swp_20D40A:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LD        XHL,0x20D378                       [5]
    LD        A,0                                [2]
    CALL      dyn_2076F3                         [4]
    LDW       (XIZ+TASK_FUNC),0xD25F             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20D427

swp_20D427:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CPB       (XIZ+TASK_ARG),0                   [4]
    LDB       (XIZ+TASK_ARG),1                   [4]
    RET       Z                                  [2]
    LDB       (XIZ+TASK_ARG),0                   [4]
    RET                                          [1]
    .db 0xFD, 0x24, 0x05, 0x0C, 0x05, 0x14, 0x05, 0x00, 0x24, 0x01, 0x14, 0x01, 0xFE, 0x37, 0x08, 0x09
    .db 0x03, 0x08, 0x64, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x0C, 0x0C, 0x00, 0x00, 0x33, 0x05
    .db 0x0C, 0x05, 0x03, 0x14, 0xFF

.org 0x20D462

swp_20D462:
    LDW       (XIZ+TASK_ARG),1                   [5]
    LD        A,0                                [2]
    LD        C,0x12                             [2]
    LD        E,5                                [2]
    LD        HL,0x76                            [3]
    CALL      dyn_207494                         [4]
    LD        XHL,0x20D544                       [5]
    CALL      0x2076F7                           [4]
    LDW       (XIZ+TASK_FUNC),0xD487             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CALR      sub_20D684                         [3]
    LD        BC,(XIZ+TASK_ARG)                  [3]
    MUL       XBC,0x28                           [4]
    ADD       BC,0x40                            [4]
    LD        DE,0x84                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        NZ,.skip                           [2]
    BIT       5,A                                [3]
    JR        NZ,.skip3                          [2]
    AND       A,0xC                              [3]
    JR        NZ,.skip4                          [2]
    RET                                          [1]
.skip:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JR        Z,.skip2                           [2]
    LDW       (XIZ+TASK_FUNC),0xD397             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip2:
    CALL      sub_206847                         [4]
    LD        A,0                                [2]
    LD        XHL,0x20D56F                       [5]
    CALL      dyn_2076F3                         [4]
    CALL      swp_20DAE1                         [4]
    LDB       (wOptionMessageSpeed),3            [5]
    LDB       (wOptionAnimation),0xFF            [5]
    LD        A,0                                [2]
    LD        XHL,0x20D588                       [5]
    CALL      dyn_2076F3                         [4]
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xCF7C             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip3:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+TASK_FUNC),0xD397             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip4:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CPB       (XIZ+TASK_ARG),0                   [4]
    LDB       (XIZ+TASK_ARG),1                   [4]
    RET       Z                                  [2]
    LDB       (XIZ+TASK_ARG),0                   [4]
    RET                                          [1]

.org 0x20D684

sub_20D684:
    LD        E,(0x5DF3)                         [4]
    LD        D,0                                [2]
    MUL       XDE,0x28                           [4]
    ADD       DE,0x2C                            [4]
    LD        BC,8                               [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    CPB       (wOptionMessageSpeed),3            [5]
    SCC       Z,BC                               [2]
    MUL{1}    BC,0x28                            [3]
    ADD       BC,0x40                            [4]
    LD        DE,0x34                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    CPB       (wOptionAnimation),0               [5]
    SCC       Z,BC                               [2]
    MUL{1}    BC,0x28                            [3]
    ADD       BC,0x40                            [4]
    LD        DE,0x5C                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    RET                                          [1]

.org 0x20D6DF

dyn_20D6DF:
    CALR      MainMenuGraphics                   [3]
    LDB       (GE_PLANE_PRIO),0                  [5]
    LD        XHL,dyn_20D75D                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (GE_PLANE_PRIO),0x80               [5]
    LD        XHL,dyn_20D77B                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JP        EndTask                            [4]

.org 0x20D71E

dyn_20D71E:
    CALR      MainMenuGraphics                   [3]
    LDB       (GE_PLANE_PRIO),0x80               [5]
    LD        XHL,dyn_20D75D                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (GE_PLANE_PRIO),0                  [5]
    LD        XHL,dyn_20D77B                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    JP        EndTask                            [4]

.org 0x20D75D

dyn_20D75D:
    LDW       (XIZ+TASK_ARG),0                   [5]
    LDW       (XIZ+TASK_FUNC),0xD76C             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    INCW      1,(XIZ+TASK_ARG)                   [3]
    CPW       (XIZ+TASK_ARG),0xB                 [5]
    JP        NC,EndTask                         [5]
    JR        dyn_20D7BB                         [2]

.org 0x20D77B

dyn_20D77B:
    LDW       (XIZ+TASK_ARG),0xB                 [5]
    LDW       (XIZ+TASK_FUNC),0xD78A             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    DECW      1,(XIZ+TASK_ARG)                   [3]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JP        MI,EndTask                         [5]
    JR        dyn_20D7BB                         [2]

.org 0x20D799

; [play] main_menu, config_menu, load_menu
MainMenuGraphics:
    CPB       (wColorFlags),0                    [5]
    LD        XDE,Map_2876C4                     [5]
    LD        XHL,Map_287ED4                     [5]
    JR        Z,0x20D7B4                         [2]
    LD        XDE,Map_29C88F                     [5]
    LD        XHL,Map_29D39A                     [5]
    LD        (XIZ+0x12),XDE                     [3]
    LD        (XIZ+0x16),XHL                     [3]
    RET                                          [1]

.org 0x20D7BB

dyn_20D7BB:
    LD        WA,0x161                           [3]
    LD        XHL,(XIY+0x12)                     [3]
    LD        BC,(XIZ+TASK_ARG)                  [3]
    NEG       BC                                 [2]
    LD        DE,0                               [2]
    CALL      DrawTilemap                        [4]
    LD        WA,0xB5                            [3]
    LD        XHL,(XIY+0x16)                     [3]
    LD        BC,(XIZ+TASK_ARG)                  [3]
    ADD       BC,0xA                             [4]
    LD        DE,0                               [2]
    CALL      DrawTilemap                        [4]
    LD        C,0xA                              [2]
    SUB       C,(XIZ+TASK_ARG)                   [3]
    CP        C,0xA                              [3]
    RET       Z                                  [2]
    LD        E,0                                [2]
    LD        B,(XIZ+TASK_ARG)                   [3]
    SLL       1,B                                [3]
    LD        D,0x13                             [2]
    LD        WA,0                               [2]
    CALL      dyn_206768                         [4]
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
    LD        (wFadeLevel),A                     [4]
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

.org 0x20DBDE

loc_20DBDE:
    LD        RW3,0x16                           [4]
    CALL      BiosCall                           [4]
    LD        BC,8                               [3]
    LD        XDE,wTextBuffer                    [5]
    LD        XHL,0xFA000                        [5]
    CALL      sub_2077A6                         [4]
    LD        A,0                                [2]
    CALL      dyn_20DACC                         [4]
    ADD       XHL,0x4000                         [6]
    LD{1}     XDE,XHL                            [2]
    LD        XHL,0x200020                       [5]
    LD        BC,0x10                            [3]
    LDIR      (XDE+),(XHL+)                      [2]
    LD        XHL,wOptionMessageSpeed            [5]
    LD{1}     BC,2                               [3]
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

.org 0x20E2B0

dyn_20E2B0:
    LD        XHL,TitleScreen                    [5]
    CALL      StartChildTask                     [4]
    LD        XHL,dyn_20E36F                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XIZ+TASK_FUNC),0xE2CD             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20E2CD

dyn_20E2CD:
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON                         [3]
    JR        NZ,dyn_20E2DC                      [2]
    DECW      1,(XIZ+TASK_ARG)                   [3]
    JR        Z,0x20E2E1                         [2]
    RET                                          [1]

.org 0x20E2DC

dyn_20E2DC:
    LDW       (XIY+0xE),1                        [5]
    CALL      dyn_20636D                         [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20E2EA

; [play] title_press_a_button, main_menu
TitleScreen:
    LDW       (XIZ+TASK_ARG),0xB4                [5]
    LDW       (XIZ+TASK_FUNC),0xE2F9             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    DECW      1,(XIZ+TASK_ARG)                   [3]
    RET       NZ                                 [2]
    LDW       (XIZ+0x10),2                       [5]
    LDW       (XIZ+TASK_FUNC),0xE30D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        XHL,Map_2E513D                     [5]
    LD        A,(wColorFlags)                    [4]
    AND       A,0x10                             [3]
    JR        NZ,.skip                           [2]
    LD        XHL,Map_2E573D                     [5]
.skip:
    LD        WA,0xE7                            [3]
    LD        BC,0                               [2]
    LD        DE,2                               [2]
    CALL      DrawTilemapScr2                    [4]
    LDW       (XIZ+TASK_FUNC),0xE336             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20E336

swp_20E336:
    LD        XHL,Map_2E4EE3                     [5]
    LD        A,(wColorFlags)                    [4]
    AND       A,0x10                             [3]
    JR        NZ,.skip                           [2]
    LD        XHL,Map_2E54E3                     [5]
.skip:
    LD        WA,0xE7                            [3]
    LD        BC,0                               [2]
    LD        DE,2                               [2]
    CALL      DrawTilemapScr2                    [4]
    DECW      1,(XIZ+0x10)                       [3]
    JR        Z,.skip2                           [2]
    LDW       (XIZ+TASK_FUNC),0xE30D             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]
.skip2:
    LDW       (XIZ+TASK_FUNC),0xE2EA             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20E36F

dyn_20E36F:
    LDW       (XIZ+TASK_ARG),0                   [5]
    LDW       (XIZ+TASK_FUNC),0xE37E             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    CPW       (XIZ+TASK_ARG),0x348               [5]
    JP        Z,EndTask                          [5]
    LD        XHL,0x2E4292                       [5]
    INCW      1,(XIZ+TASK_ARG)                   [3]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    SRL       5,WA                               [3]
    AND       WA,1                               [4]
    JR        Z,0x20E3A1                         [2]
    LD        XHL,0x2E42B0                       [5]
    LD        WA,0xC                             [3]
    LD        BC,0x18                            [3]
    LD        DE,0x58                            [3]
    CALL      dyn_2069C8                         [4]
    RET                                          [1]

.org 0x20E930

; [play] intro_title_reveal
TitleReveal:
    LDW       (XIZ+TASK_ARG),0x14                [5]
    LDW       (XIZ+TASK_FUNC),0xE93F             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        XHL,Map_2E4D97                     [5]
    LD        A,(wColorFlags)                    [4]
    AND       A,0x10                             [3]
    JR        NZ,0x20E952                        [2]
    LD        XHL,Map_2E5397                     [5]
    LD        BC,(XIZ+TASK_ARG)                  [3]
    LD        WA,0xE7                            [3]
    LD        DE,2                               [2]
    CALL      DrawTilemapScr2                    [4]
    DECW      1,(XIZ+TASK_ARG)                   [3]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JP        LT,EndTask                         [5]
    RET                                          [1]

.org 0x20EFD3

dyn_20EFD3:
    LDB       (wFadeLevel),0x81                  [5]
    LDB       (0x5CE2),0                         [5]
    CALR      dyn_20EC49                         [3]
    CALR      dyn_20EC58                         [3]
    LD        XWA,4                              [2]
    CALL      PlayMusic                          [4]
    LDW       (XIZ+TASK_FUNC),0xEFF4             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20F730

dyn_20F730:
    CP        C,0xFB                             [3]
    JR        NZ,dyn_20F74D                      [2]
    LD        DE,0x173                           [3]
    LD        XBC,wPartnerName                   [5]

.org 0x20F73D

loc_20F73D:
    LD{1}     (XWA+),DE                          [3]
    INC       2,DE                               [2]
    INC       1,XBC                              [2]
    CPB       (XBC),0xFF                         [3]
    JR        NZ,loc_20F73D                      [2]
    INC       1,XHL                              [2]
    JR        0x20F714                           [2]

.org 0x20F74D

dyn_20F74D:
    LD        C,(XHL+)                           [3]
    CP        C,0                                [2]
    JR        NZ,dyn_20F75B                      [2]
    LDW{1}    (XWA+),0                           [5]
    JR        0x20F797                           [2]

.org 0x20F75B

dyn_20F75B:
    EXTS      BC                                 [2]
    LD        DE,BC                              [2]
    EXTZ      XDE                                [2]
    SLL       1,XDE                              [3]
    ADD       XDE,0x5DF8                         [6]
    PUSH      XDE                                [1]
    LD        DE,(XDE)                           [2]
    CP        DE,0xFFFF                          [4]
    JR        Z,dyn_20F779                       [2]
    LD{1}     (XWA+),DE                          [3]
    POP       XDE                                [1]
    JR        0x20F797                           [2]

.org 0x20F779

dyn_20F779:
    POP       XDE                                [1]
    PUSH      XHL                                [1]
    LD        HL,(XIY+0x18)                      [3]
    LD        (XDE),HL                           [2]
    POP       XHL                                [1]
    PUSH      XWA                                [1]
    PUSH      XHL                                [1]
    LD        L,C                                [2]
    LD        WA,(XIY+0x18)                      [3]
    CALL      dyn_207093                         [4]
    POP       XHL                                [1]
    POP       XWA                                [1]
    LD        BC,(XIY+0x18)                      [3]
    LD{1}     (XWA+),BC                          [3]
    INCW      1,(XIY+0x18)                       [3]
    INCW      1,(XIZ+TASK_ARG)                   [3]
    CPW       (XIZ+TASK_ARG),0x14                [5]
    JRL       NZ,0x20F714                        [3]
    INC       1,XHL                              [2]
    LD        (XIY+0xE),XHL                      [3]
    RET                                          [1]

.org 0x20F7A8

loc_20F7A8:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20F7AD

; [play] Select Player screen task (select_player_* screens only)
SelectPlayerTask:
    LD        WA,0x14                            [3]
    CALL      PlayMusic                          [4]
    LD        WA,0x35                            [3]
    CALL      SoundCommand                       [4]
    CALL      dyn_20EC49                         [4]
    CALL      dyn_20EC58                         [4]
    CALR      dyn_20FD4B                         [3]
    LD        XHL,SelectPlayerNames              [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPW       (XIZ+0x10),0                       [5]
    JR        NZ,dyn_20F7F3                      [2]
    LDB       (wPlayerRace),0                    [5]
    LDB       (wPartnerRace),0                   [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20F7F3

dyn_20F7F3:
    CALL      dyn_20EC49                         [4]
    CALL      dyn_20EC58                         [4]
    LDW       (XIZ+TASK_ARG),0                   [5]
    CALR      NameEntryScreen                    [3]
    LD        XHL,NameEntrySetup                 [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPW       (XIZ+0x10),0                       [5]
    JR        NZ,NameEntryTask                   [2]
    JR        SelectPlayerTask                   [2]

.org 0x20F823

; [code+play] runs NameEntryScreen (name_entry* / names_confirm)
NameEntryTask:
    LDW       (XIZ+TASK_ARG),1                   [5]
    CALR      NameEntryScreen                    [3]
    LD        XHL,NameEntrySetup                 [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPW       (XIZ+0x10),0                       [5]
    JR        Z,dyn_20F7F3                       [2]
    CALL      dyn_20EC49                         [4]
    CALL      dyn_20EC58                         [4]
    CALR      dyn_20FD4B                         [3]
    LD        XHL,ConfirmNames                   [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPW       (XIZ+0x10),0                       [5]
    JR        Z,dyn_20F7F3                       [2]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20F877

dyn_20F877:
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0xB                              [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    LD        HL,(XIY+0x1A)                      [3]
    CALL      DrawTextChar                       [4]
    LD        HL,(XIY+0x1C)                      [3]
    CALL      DrawTextChar                       [4]
    LD        HL,(XIY+0x1E)                      [3]
    CALL      DrawTextChar                       [4]
    LD        HL,(XIY+0x20)                      [3]
    CALL      DrawTextChar                       [4]
    LD        HL,(XIY+0x22)                      [3]
    CALL      DrawTextChar                       [4]
    LD        HL,(XIY+0x24)                      [3]
    CALL      DrawTextChar                       [4]
    INCW      1,(XIZ+TASK_ARG)                   [3]
    LD        A,(XIZ+TASK_ARG)                   [3]
    AND       A,0x10                             [3]
    JR        Z,0x20F8D9                         [2]
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    LD        C,(XIY+0x18)                       [3]
    CP        C,6                                [2]
    JR        GE,0x20F8D9                        [2]
    ADD       C,0xB                              [3]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    LD        L,(0x226C11)                       [5]
    CALL      DrawTextChar                       [4]
    RET                                          [1]

.org 0x20F8DA

; [play] name_entry, select_player_confirm
NameEntrySetup:
    LD        XHL,dyn_20F877                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,0xD8                            [3]
    LD        XHL,Gfx_2C8D88                     [5]
    CALL      LoadCompressedTiles                [4]
    LD        A,1                                [2]
    LD        C,1                                [2]
    LD        XHL,Pal_2C8D6C                     [5]
    CALL      LoadPalettes                       [4]
    LDW       (XIZ+TASK_ARG),0                   [5]
    LDW       (XIZ+0x10),0                       [5]
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),1                       [5]
    LDW       (XIZ+0x16),1                       [5]
    LDW       (XIZ+0x18),0                       [5]
    LDW       (XIZ+0x1A),0                       [5]
    LDW       (XIZ+0x1C),0                       [5]
    LDW       (XIZ+0x1E),0                       [5]
    LDW       (XIZ+0x20),0                       [5]
    LDW       (XIZ+0x22),0                       [5]
    LDW       (XIZ+0x24),0                       [5]
    LDW       (XIZ+0x26),0x10                    [5]
    LDW       (XIZ+0x28),0                       [5]
    LDW       (XIZ+0x2A),0                       [5]
    LD        XDE,wPlayerName                    [5]
    LD        A,(wPlayerRace)                    [4]
    CPW       (XIY+0xE),0                        [5]
    JR        Z,0x20F960                         [2]
    LD        XDE,wPartnerName                   [5]
    LD        A,(wPartnerRace)                   [4]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x1A                           [6]
    CPB       (XDE),0xFF                         [3]
    JR        Z,dyn_20F97A                       [2]
    INCW      1,(XIZ+0x18)                       [3]
    LD        WA,0                               [2]
    LD        A,(XDE+)                           [3]
    LD{1}     (XHL+),WA                          [3]
    JR        0x20F968                           [2]

.org 0x20F97A

dyn_20F97A:
    LDW       (XIZ+TASK_FUNC),0xF985             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x20F985

dyn_20F985:
    LD        A,(wJoyHeld)                       [4]
    CP        A,(XIZ+0x29)                       [3]
    JR        NZ,dyn_20F9AF                      [2]
    DECW      1,(XIZ+0x26)                       [3]
    CPW       (XIZ+0x26),0                       [5]
    JR        Z,dyn_20F99E                       [2]
    LDB       (XIZ+0x28),0                       [4]
    JR        0x20F9C2                           [2]

.org 0x20F99E

dyn_20F99E:
    LD        A,(wJoyHeld)                       [4]
    LD        (XIZ+0x29),A                       [3]
    LD        (XIZ+0x28),A                       [3]
    LDW       (XIZ+0x26),7                       [5]
    JR        0x20F9C2                           [2]

.org 0x20F9AF

dyn_20F9AF:
    LDW       (XIZ+0x26),0x10                    [5]
    LD        A,(wJoyPressed)                    [4]
    LD        (XIZ+0x28),A                       [3]
    LD        A,(wJoyHeld)                       [4]
    LD        (XIZ+0x29),A                       [3]
    CPW       (XIZ+0x16),1                       [5]
    JRL       NZ,dyn_20FAF2                      [3]
    LD        A,(XIZ+0x28)                       [3]
    AND       A,4                                [3]
    JR        Z,0x20F9D9                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LD        A,(XIZ+0x28)                       [3]
    AND       A,8                                [3]
    JR        Z,0x20F9E8                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LD        A,(XIZ+0x28)                       [3]
    AND       A,1                                [3]
    JR        Z,dyn_20FA0C                       [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    DECW      1,(XIZ+0x14)                       [3]
    CPW       (XIZ+0x14),0xFFFF                  [5]
    JR        NZ,dyn_20FA0C                      [2]
    LDW       (XIZ+0x16),0                       [5]
    LDW       (XIZ+0x10),8                       [5]
    RET                                          [1]

.org 0x20FA0C

dyn_20FA0C:
    LD        A,(XIZ+0x28)                       [3]
    AND       A,2                                [3]
    JR        Z,dyn_20FA30                       [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    INCW      1,(XIZ+0x14)                       [3]
    CPW       (XIZ+0x14),2                       [5]
    JR        NZ,dyn_20FA30                      [2]
    LDW       (XIZ+0x16),0                       [5]
    LDW       (XIZ+0x10),0                       [5]
    RET                                          [1]

.org 0x20FA30

dyn_20FA30:
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON                         [3]
    JRL       Z,dyn_20FAC6                       [3]
    LD        WA,(XIZ+0x14)                      [3]
    CP        WA,0                               [2]
    JR        Z,0x20FA45                         [2]
    CP        WA,1                               [2]
    JR        Z,dyn_20FA59                       [2]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LDB       (XIY+0x10),0                       [4]
    CALL      dyn_20636D                         [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20FA59

dyn_20FA59:
    LD        BC,(XIZ+0x18)                      [3]
    CP        BC,0                               [2]
    JR        NZ,dyn_20FA69                      [2]
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    JR        dyn_20FAC6                         [2]

.org 0x20FA69

dyn_20FA69:
    LD        WA,(XIZ+0x1A)                      [3]
    ADD       WA,(XIZ+0x1C)                      [3]
    ADD       WA,(XIZ+0x1E)                      [3]
    ADD       WA,(XIZ+0x20)                      [3]
    ADD       WA,(XIZ+0x22)                      [3]
    ADD       WA,(XIZ+0x24)                      [3]
    CP        WA,0                               [2]
    JR        NZ,dyn_20FA88                      [2]
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    JR        dyn_20FAC6                         [2]

.org 0x20FA88

dyn_20FA88:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        DE,0x5013                          [3]
    CPW       (XIY+0xE),0                        [5]
    JR        Z,0x20FA9C                         [2]
    LD        DE,0x502F                          [3]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    EXTZ      XDE                                [2]
    LD        HL,0x1A                            [3]
    EXTZ      XHL                                [2]
    ADD       XHL,XIZ                            [2]
    LD        WA,(XHL+)                          [3]
    LD        (XDE+),A                           [3]
    DJNZ      BC,0x20FAAC                        [3]
    LDB       (XDE),0xFF                         [3]
    CALL      dyn_20636D                         [4]
    CALL      EndTask                            [4]
    LDW       (XIY+0x10),1                       [5]
    RET                                          [1]

.org 0x20FAC6

dyn_20FAC6:
    INCW      1,(XIZ+0x2A)                       [3]
    LD        WA,(XIZ+0x2A)                      [3]
    AND       WA,0x10                            [4]
    JR        Z,0x20FAF1                         [2]
    LD        BC,0                               [2]
    LD        HL,(XIZ+0x14)                      [3]
    EXTZ      XHL                                [2]
    SLL       1,XHL                              [3]
    ADD       XHL,0x226C12                       [6]
    LD        DE,(XHL)                           [2]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    RET                                          [1]

.org 0x20FAF2

dyn_20FAF2:
    LD        A,(XIZ+0x28)                       [3]
    AND       A,4                                [3]
    JR        Z,0x20FB10                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    DECW      1,(XIZ+TASK_ARG)                   [3]
    CPW       (XIZ+TASK_ARG),0xFFFF              [5]
    JR        NZ,0x20FB10                        [2]
    LDW       (XIZ+TASK_ARG),9                   [5]
    LD        A,(XIZ+0x28)                       [3]
    AND       A,8                                [3]
    JR        Z,0x20FB2E                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    INCW      1,(XIZ+TASK_ARG)                   [3]
    CPW       (XIZ+TASK_ARG),0xA                 [5]
    JR        NZ,0x20FB2E                        [2]
    LDW       (XIZ+TASK_ARG),0                   [5]
    LD        A,(XIZ+0x28)                       [3]
    AND       A,2                                [3]
    JR        Z,dyn_20FB52                       [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    INCW      1,(XIZ+0x10)                       [3]
    CPW       (XIZ+0x10),9                       [5]
    JR        LT,dyn_20FB52                      [2]
    LDW       (XIZ+0x16),1                       [5]
    LDW       (XIZ+0x14),1                       [5]
    RET                                          [1]

.org 0x20FB52

dyn_20FB52:
    LD        A,(XIZ+0x28)                       [3]
    AND       A,1                                [3]
    JR        Z,dyn_20FB76                       [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    DECW      1,(XIZ+0x10)                       [3]
    CPW       (XIZ+0x10),0xFFFF                  [5]
    JR        GT,dyn_20FB76                      [2]
    LDW       (XIZ+0x16),1                       [5]
    LDW       (XIZ+0x14),1                       [5]
    RET                                          [1]

.org 0x20FB76

dyn_20FB76:
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON                         [3]
    JR        Z,0x20FBEA                         [2]
    LD        WA,(XIZ+0x18)                      [3]
    CP        WA,6                               [2]
    JR        GE,.skip                           [2]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    JR        0x20FBA0                           [2]
.skip:
    LDW       (XIZ+0x14),1                       [5]
    LDW       (XIZ+0x16),1                       [5]
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    LD        BC,(XIZ+0x10)                      [3]
    MUL       XBC,0xA                            [4]
    LD        DE,(XIZ+TASK_ARG)                  [3]
    INC       1,DE                               [2]
    ADD       BC,DE                              [2]
    CPW       (XIZ+0x12),0                       [5]
    JR        Z,dyn_20FBBF                       [2]
    ADD       XBC,0x226D72                       [6]
    LD        A,(XBC)                            [2]
    JR        0x20FBC7                           [2]

.org 0x20FBBF

dyn_20FBBF:
    ADD       XBC,0x226D72                       [6]
    LD        A,(XBC)                            [2]
    LD        HL,(XIZ+0x18)                      [3]
    EXTZ      XHL                                [2]
    SLL       1,HL                               [3]
    ADD       HL,0x1A                            [4]
    ADD       XHL,XIZ                            [2]
    EXTZ      WA                                 [2]
    LD        (XHL),WA                           [2]
    INCW      1,(XIZ+0x18)                       [3]
    CPW       (XIZ+0x18),7                       [5]
    JR        Z,.skip                            [2]
    JR        0x20FC3B                           [2]
.skip:
    LDW       (XIZ+0x18),6                       [5]
    LD        A,(wJoyPressed)                    [4]
    AND       A,B_BUTTON                         [3]
    JR        Z,0x20FC3B                         [2]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LD        HL,(XIZ+0x18)                      [3]
    EXTZ      XHL                                [2]
    SLL       1,HL                               [3]
    ADD       HL,0x1A                            [4]
    ADD       XHL,XIZ                            [2]
    LDW       (XHL),0                            [4]
    DECW      1,(XIZ+0x18)                       [3]
    CPW       (XIZ+0x18),0xFFFF                  [5]
    JR        NZ,0x20FC22                        [2]
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+0x18),0                       [5]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LD        HL,(XIZ+0x18)                      [3]
    EXTZ      XHL                                [2]
    SLL       1,HL                               [3]
    ADD       HL,0x1A                            [4]
    ADD       XHL,XIZ                            [2]
    LDW       (XHL),0                            [4]
    LD        BC,(XIZ+TASK_ARG)                  [3]
    LD        DE,(XIZ+0x10)                      [3]
    MUL       XBC,8                              [4]
    MUL       XDE,8                              [4]
    ADD       BC,4                               [4]
    ADD       DE,0x24                            [4]
    LD        XHL,0x2C8D74                       [5]
    INCW      1,(XIZ+0x2A)                       [3]
    LD        WA,(XIZ+0x2A)                      [3]
    AND       WA,0x10                            [4]
    JR        Z,0x20FC67                         [2]
    LD        XHL,0x2C8D7E                       [5]
    LD        WA,0xD8                            [3]
    CALL      dyn_2069C8                         [4]
    RET                                          [1]

.org 0x20FC6F

swp_20FC6F:
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x226D72                       [5]
    CALL      0x2076F7                           [4]
    RET                                          [1]

.org 0x20FC87

; [code] Enter your name / partner name
NameEntryScreen:
    LD        A,0                                [2]
    LD        C,0x14                             [2]
    LD        E,4                                [2]
    LD        HL,0xC                             [3]
    CALL      dyn_207494                         [4]
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x2074C4                           [4]
    LD        XHL,EnterYourNameText              [5]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JR        Z,0x20FCB3                         [2]
    LD        XHL,EnterPartnerNameText           [5]
    CALL      0x2076F7                           [4]
    LD        A,(wPlayerRace)                    [4]
    EXTZ      WA                                 [2]
    LD        HL,WA                              [2]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JR        Z,0x20FCCE                         [2]
    LD        A,(wPartnerRace)                   [4]
    EXTZ      WA                                 [2]
    LD        HL,WA                              [2]
    ADD       HL,0xA                             [4]
    LD        WA,0xDA                            [3]
    LD        BC,0xD                             [3]
    LD        DE,4                               [2]
    CALL      DrawPortraitAt                     [4]
    LD        A,1                                [2]
    LD        C,0xA                              [2]
    LD        E,9                                [2]
    LD        HL,0x30                            [3]
    CALL      OpenTextBoxNoWait                  [4]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        C,1                                [2]
    LD        E,5                                [2]
    CALL      0x2074C4                           [4]
    LD        XHL,0x226D72                       [5]
    CALL      0x2076F7                           [4]
    LD        A,3                                [2]
    LD        C,6                                [2]
    LD        E,2                                [2]
    LD        HL,0xBA                            [3]
    CALL      OpenTextBoxNoWait                  [4]
    LD        A,3                                [2]
    CALL      GetTextBox                         [4]
    LD        C,1                                [2]
    LD        E,0xF                              [2]
    CALL      0x2074C4                           [4]
    LD        XHL,CancelEndText                  [5]
    CALL      0x2076F7                           [4]
    LD        A,2                                [2]
    LD        C,0xD                              [2]
    LD        E,5                                [2]
    LD        HL,0x8A                            [3]
    CALL      dyn_207494                         [4]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        C,7                                [2]
    LD        E,0xE                              [2]
    CALL      0x2074C4                           [4]
    LD        XHL,0x226D54                       [5]
    CALL      0x2076F7                           [4]
    RET                                          [1]

.org 0x20FD4B

dyn_20FD4B:
    LD        A,5                                [2]
    LD        C,9                                [2]
    LD        E,1                                [2]
    LD        HL,0xD3                            [3]
    CALL      OpenTextBoxNoWait                  [4]
    LD        A,5                                [2]
    CALL      GetTextBox                         [4]
    LD        C,6                                [2]
    LD        E,0xD                              [2]
    CALL      0x2074C4                           [4]
    LD        A,3                                [2]
    LD        C,7                                [2]
    LD        E,1                                [2]
    LD        HL,0xC5                            [3]
    CALL      OpenTextBoxNoWait                  [4]
    LD        A,3                                [2]
    CALL      GetTextBox                         [4]
    LD        C,1                                [2]
    LD        E,0                                [2]
    CALL      0x2074C4                           [4]
    LD        A,4                                [2]
    LD        C,7                                [2]
    LD        E,1                                [2]
    LD        HL,0xCC                            [3]
    CALL      OpenTextBoxNoWait                  [4]
    LD        A,4                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0xB                              [2]
    LD        E,0                                [2]
    CALL      0x2074C4                           [4]
    LD        A,2                                [2]
    LD        C,0x14                             [2]
    LD        E,5                                [2]
    LD        HL,0x84                            [3]
    CALL      dyn_207494                         [4]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0xE                              [2]
    CALL      0x2074C4                           [4]
    LD        A,0                                [2]
    LD        C,8                                [2]
    LD        E,0xC                              [2]
    LD        HL,0xC                             [3]
    CALL      dyn_207494                         [4]
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    LD        C,1                                [2]
    LD        E,1                                [2]
    CALL      0x2074C4                           [4]
    LD        A,1                                [2]
    LD        C,8                                [2]
    LD        E,0xC                              [2]
    LD        HL,0x48                            [3]
    CALL      dyn_207494                         [4]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0xB                              [2]
    LD        E,0x21                             [2]
    CALL      0x2074C4                           [4]
    LD        WA,0xDC                            [3]
    LD        XHL,0x2C861B                       [5]
    CALL      LoadRawTiles                       [4]
    RET                                          [1]

.org 0x20FDFA

; [play] names_confirm
ConfirmNames:
    LD        XHL,0x226C5B                       [5]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x2076F7                           [4]
    LD        XHL,wPlayerName                    [5]
    LD        A,3                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x2076F7                           [4]
    LD        XHL,wPartnerName                   [5]
    LD        A,4                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x2076F7                           [4]
    LD        E,2                                [2]
    LD        C,2                                [2]
    LD        B,6                                [2]
    LD        D,0xA                              [2]
    LD        WA,0                               [2]
    CALL      dyn_206768                         [4]
    LD        A,(wPlayerRace)                    [4]
    EXTZ      WA                                 [2]
    LD        HL,WA                              [2]
    ADD       HL,0xA                             [4]
    LD        BC,2                               [2]
    LD        DE,2                               [2]
    LD        WA,0xC                             [3]
    CALL      DrawPortraitAt                     [4]
    LD        E,0xC                              [2]
    LD        C,0x22                             [2]
    LD        B,6                                [2]
    LD        D,0xA                              [2]
    LD        WA,0                               [2]
    CALL      dyn_206768                         [4]
    LD        A,(wPartnerRace)                   [4]
    EXTZ      WA                                 [2]
    LD        HL,WA                              [2]
    ADD       HL,0xA                             [4]
    LD        BC,0xC                             [3]
    LD        DE,0x22                            [3]
    LD        WA,0x48                            [3]
    CALL      DrawPortraitAt                     [4]
    LDW       (XIZ+TASK_ARG),1                   [5]
    LDW       (XIZ+TASK_FUNC),0xFE9A             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_LEFT                           [3]
    JR        Z,0x20FEB6                         [2]
    CPW       (XIZ+TASK_ARG),1                   [5]
    JR        Z,0x20FEB6                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+TASK_ARG),1                   [5]
    LD        DE,0x84                            [3]
    LD        BC,0x20                            [3]
    CPW       (XIZ+TASK_ARG),1                   [5]
    JR        Z,0x20FEC6                         [2]
    LD        BC,0x50                            [3]
    INCW      1,(XIZ+0x10)                       [3]
    LD        WA,(XIZ+0x10)                      [3]
    AND       WA,0x10                            [4]
    JR        Z,0x20FEDF                         [2]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_RIGHT                          [3]
    JR        Z,0x20FEFB                         [2]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JR        Z,0x20FEFB                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+TASK_ARG),0                   [5]
    LD        A,(wJoyPressed)                    [4]
    AND       A,B_BUTTON                         [3]
    JR        NZ,.skip                           [2]
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON                         [3]
    RET       Z                                  [2]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JR        Z,.skip                            [2]
    LDW       (XIY+0x10),1                       [5]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CALL      EndTask                            [4]
    RET                                          [1]
.skip:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIY+0x10),0                       [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20FF36

; [code+play] Player / Partner names on Select Player
SelectPlayerNames:
    LD        A,3                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,PlayerText                     [5]
    CALL      0x2076F7                           [4]
    LD        A,4                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,PartnerText                    [5]
    CALL      0x2076F7                           [4]
    LD        WA,0xFFFF                          [3]
    LD        XHL,wPlayerName                    [5]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD        XHL,wPartnerName                   [5]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LD{1}     (XHL+),WA                          [3]
    LDW       (XIZ+TASK_ARG),1                   [5]
    LDW       (XIZ+0x12),1                       [5]
    LDW       (XIZ+0x14),0x84                    [5]
    LDW       (XIZ+0x18),1                       [5]
    LDW       (XIZ+0x1A),0                       [5]
    LDW       (XIZ+TASK_FUNC),0xFFBE             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    INCW      1,(XIZ+0x1A)                       [3]
    LD        WA,(XIZ+0x1A)                      [3]
    AND       WA,0x10                            [4]
    JR        Z,0x20FFEF                         [2]
    LD        BC,0x48                            [3]
    LD        DE,0x30                            [3]
    LD        WA,0x3EDC                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        BC,0                               [2]
    LD        DE,0x30                            [3]
    LD        WA,0xBEDC                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_LEFT                           [3]
    JR        Z,0x210007                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+0x18),1                       [5]
    DECW      1,(XIZ+TASK_ARG)                   [3]
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_RIGHT                          [3]
    JR        Z,0x21001F                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+0x18),1                       [5]
    INCW      1,(XIZ+TASK_ARG)                   [3]
    CPW       (XIZ+TASK_ARG),0xB                 [5]
    JR        NZ,0x21002B                        [2]
    LDW       (XIZ+TASK_ARG),1                   [5]
    CPW       (XIZ+TASK_ARG),0                   [5]
    JR        NZ,0x210037                        [2]
    LDW       (XIZ+TASK_ARG),0xA                 [5]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    AND       WA,1                               [4]
    JR        NZ,SelectPlayerScreen              [2]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    DEC       1,WA                               [2]
    JR        0x21004C                           [2]

.org 0x210047

; [code+play] "Select Player" with portraits
SelectPlayerScreen:
    LD        WA,(XIZ+TASK_ARG)                  [3]
    INC       1,WA                               [2]
    LD        (XIZ+0x16),WA                      [3]
    CPW       (XIZ+0x18),0                       [5]
    JR        Z,0x210081                         [2]
    LD        HL,(XIZ+TASK_ARG)                  [3]
    ADD       HL,0xA                             [4]
    LD        WA,0xC                             [3]
    LD        BC,2                               [2]
    LD        DE,2                               [2]
    CALL      DrawPortraitAt                     [4]
    LD        HL,(XIZ+0x16)                      [3]
    ADD       HL,0xA                             [4]
    LD        WA,0x48                            [3]
    LD        BC,0xC                             [3]
    LD        DE,0x22                            [3]
    CALL      DrawPortraitAt                     [4]
    LDW       (XIZ+0x18),0                       [5]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,SelectPlayerSelectText         [5]
    CALL      0x2076F7                           [4]
    LD        A,5                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        HL,(XIZ+TASK_ARG)                  [3]
    EXTZ      XHL                                [2]
    DEC       1,HL                               [2]
    SRL       1,XHL                              [3]
    SLL       2,XHL                              [3]
    ADD       XHL,0x226C6E                       [6]
    LD        XHL,(XHL)                          [2]
    CALL      0x2076F7                           [4]
    LD        A,(wJoyPressed)                    [4]
    AND       A,B_BUTTON                         [3]
    JR        Z,dyn_2100D8                       [2]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LDB       (XIY+0x10),0                       [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x2100D8

dyn_2100D8:
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON                         [3]
    RET       Z                                  [2]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x226C5B                       [5]
    CALL      0x2076F7                           [4]
    LDW       (XIZ+TASK_FUNC),0x10A              [5]
    LDW       (XIZ+TASK_FUNC_HI),0x21            [5]
    RET                                          [1]

.org 0x21010A

dyn_21010A:
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_LEFT                           [3]
    JR        Z,dyn_210128                       [2]
    CPW       (XIZ+0x12),1                       [5]
    JR        Z,0x210144                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+0x12),1                       [5]
    JR        0x210144                           [2]

.org 0x210128

dyn_210128:
    LD        A,(wJoyPressed)                    [4]
    AND       A,D_RIGHT                          [3]
    JR        Z,0x210144                         [2]
    CPW       (XIZ+0x12),0                       [5]
    JR        Z,0x210144                         [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+0x12),0                       [5]
    LD        BC,0x20                            [3]
    LD        DE,(XIZ+0x14)                      [3]
    LD        WA,(XIZ+0x12)                      [3]
    AND       WA,1                               [4]
    JR        NZ,0x210156                        [2]
    LD        BC,0x50                            [3]
    INCW      1,(XIZ+0x1A)                       [3]
    LD        WA,(XIZ+0x1A)                      [3]
    AND       WA,0x10                            [4]
    JR        Z,0x21016F                         [2]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON                         [3]
    JR        Z,dyn_210183                       [2]
    LD        WA,(XIZ+0x12)                      [3]
    AND       WA,1                               [4]
    JR        NZ,dyn_210195                      [2]
    JR        0x21018C                           [2]

.org 0x210183

dyn_210183:
    LD        A,(wJoyPressed)                    [4]
    AND       A,B_BUTTON                         [3]
    RET       Z                                  [2]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    JR        dyn_210204                         [2]

.org 0x210195

dyn_210195:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIY+0x10),1                       [5]
    LD        WA,(XIZ+TASK_ARG)                  [3]
    LD        (wPlayerRace),A                    [4]
    LD        WA,(XIZ+0x16)                      [3]
    LD        (wPartnerRace),A                   [4]
    LD        A,(wPlayerRace)                    [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x226CB9                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    INC       1,XHL                              [2]
    LD        XDE,wPlayerName                    [5]
    CPB       (XHL),0xFF                         [3]
    JR        Z,dyn_2101D7                       [2]
    LD        A,(XHL+)                           [3]
    LD        (XDE+),A                           [3]
    JR        0x2101CA                           [2]

.org 0x2101D7

dyn_2101D7:
    LD        A,(wPartnerRace)                   [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x226CB9                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    INC       1,XHL                              [2]
    LD        XDE,wPartnerName                   [5]
    CPB       (XHL),0xFF                         [3]
    JR        Z,dyn_2101FF                       [2]
    LD        A,(XHL+)                           [3]
    LD        (XDE+),A                           [3]
    JR        0x2101F2                           [2]

.org 0x2101FF

dyn_2101FF:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x210204

dyn_210204:
    CALL      sub_206847                         [4]
    LDW       (XIZ+TASK_FUNC),0xFFBE             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x20            [5]
    RET                                          [1]

.org 0x21D5E9

dyn_21D5E9:
    LD        XHL,IntroBackground                [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+TASK_FUNC),0xD60B             [5]
    LDW       (XIZ+TASK_FUNC_HI),0x21            [5]
    RET                                          [1]

.org 0x21D60B

dyn_21D60B:
    CALL      dyn_206863                         [4]
    LD        XHL,MainMenuSetup                  [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5DF2),1                         [5]
    LD        XHL,NewGameSetup                   [5]
    JR        Z,0x21D643                         [2]
    CPB       (0x5DF2),2                         [5]
    LD        XHL,swp_21D738                     [5]
    JR        Z,0x21D643                         [2]
    LD        XHL,dyn_21D5E9                     [5]
    LD        (XIZ+TASK_FUNC),XHL                [3]
    RET                                          [1]
