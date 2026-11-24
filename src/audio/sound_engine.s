; audio/sound_engine: 14 routines (each keeps its ROM address with .org)

.org 0x200040

; hold Z80 in reset, upload driver, release it
InitSound:
    LDW       (Z80_RESET),0xAAAA                 [4]
    NOP                                          [1]
    CALL      UploadZ80Driver                    [4]
    LDW       (Z80_RESET),0x5555                 [4]
    NOP                                          [1]
    LD        WA,0x7D0                           [3]
    CALR      sub_20032F                         [3]
    RET                                          [1]

.org 0x200055

ResetSoundState:
    SUB       A,A                                [2]
    LD{1}     (0x62AA),A                         [5]
    LD{1}     (0x62AB),A                         [5]
    LD{1}     (0x62AC),A                         [5]
    LD        A,(Z80_COMM)                       [3]
    LD{1}     (0x62AD),A                         [5]
    RET                                          [1]

.org 0x20006F

; [code] A = command: 0x80-0x85 channel bits (0x62AC), 0xFF reset, else queued in the 16-entry ring 0x62AA/0x62AB
QueueSoundCommand:
    PUSH      WA                                 [1]
    PUSH      XIX                                [1]
    CALR      dyn_2002C8                         [3]
    JR        NC,.skip4                          [2]
    CALR      sub_2002B1                         [3]
    JR        NC,.skip                           [2]
    JR        NZ,0x2000E1                        [2]
    JR        0x2000AC                           [2]
.skip:
    CP        A,0x86                             [3]
    JR        NC,.skip3                          [2]
    LD{1}     W,A                                [2]
    AND       W,7                                [3]
    CP        A,0x83                             [3]
    JR        NC,.skip2                          [2]
    INC       1,W                                [2]
    OR{1}     (0x62AC),W                         [5]
    JR        0x2000E1                           [2]
.skip2:
    DEC       1,W                                [2]
    NEG       W                                  [2]
    AND{1}    (0x62AC),W                         [5]
    JR        0x2000E1                           [2]
.skip3:
    CP        A,0xFF                             [3]
    JR        NZ,0x2000AC                        [2]
    PUSH      A                                  [1]
    CALR      ResetSoundState                    [3]
    POP       A                                  [1]
    LD{1}     W,(0x62AB)                         [5]
    INC       1,W                                [2]
    AND       W,0xF                              [3]
    CP{1}     (0x62AA),W                         [5]
    JR        NZ,0x2000C8                        [2]
    PUSH      SR                                 [1]
    PUSH      A                                  [1]
    DI                                           [2]
    CALL      Z,sub_200289                       [5]
    POP       A                                  [1]
    POP       SR                                 [1]
    LD        XIX,0x629A                         [5]
    LD{1}     W,(0x62AB)                         [5]
    LD        (XIX+W),A                          [5]
    INC       1,W                                [2]
    AND       W,0xF                              [3]
    LD{1}     (0x62AB),W                         [5]
    SCF                                          [1]
    POP       XIX                                [1]
    POP       WA                                 [1]
    RET                                          [1]
.skip4:
    RCF                                          [1]
    JR        0x2000E2                           [2]

.org 0x2000E8

sub_2000E8:
    PUSH      WA                                 [1]
    PUSH      XIX                                [1]
.loop:
    LD{1}     W,(0x62AB)                         [5]
    CP{1}     (0x62AA),W                         [5]
    JR        Z,.skip2                           [2]
    LD        A,(Z80_COMM)                       [3]
    CP{1}     (0x62AD),A                         [5]
    JR        NZ,.skip3                          [2]
    CALR      sub_200289                         [3]
    JR        NC,.skip3                          [2]
    CALR      sub_2002B1                         [3]
    JR        NC,.skip                           [2]
    JR        NZ,.loop                           [2]
.skip:
    LD        (Z80_COMM),A                       [3]
    XOR       A,0xFF                             [3]
    LD{1}     (0x62AD),A                         [5]
    LDB       (Z80_NMI),1                        [3]
.skip2:
    POP       XIX                                [1]
    POP       WA                                 [1]
    SCF                                          [1]
    RET                                          [1]
.skip3:
    POP       XIX                                [1]
    POP       WA                                 [1]
    RCF                                          [1]
    RET                                          [1]

.org 0x200122

; XWA = song number; table at SongTable
PlaySong:
    PUSH      XBC                                [1]
    PUSH      XDE                                [1]
    PUSH      XHL                                [1]
    PUSH      XIX                                [1]
    PUSH      XIY                                [1]
    PUSH      XWA                                [1]
    CALL      ResetSoundState                    [4]
    POP       XWA                                [1]
    LD        XHL,SongTable                      [5]
    ADD       XWA,XWA                            [2]
    ADD       XWA,XWA                            [2]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    CP{2}     XHL,0                              [6]
    JRL       Z,.skip3                           [3]
    LDB       (Z80_COMM),0xFF                    [3]
    LDB       (Z80_NMI),1                        [3]
    LDB{1}    (0x62AD),0                         [6]
    XOR       D,D                                [2]
.loop:
    LD        E,(Z80_COMM)                       [3]
    CP{2}     E,0                                [3]
    JR        Z,.skip                            [2]
    INC       1,D                                [2]
    CP        D,0x64                             [3]
    JR        C,.loop                            [2]
    LDW       (Z80_RESET),0xAAAA                 [4]
    NOP                                          [1]
    PUSH      XDE                                [1]
    PUSH      XHL                                [1]
    PUSH      XBC                                [1]
    PUSH      XIX                                [1]
    CALL      UploadZ80Driver                    [4]
    POP       XIX                                [1]
    POP       XBC                                [1]
    POP       XHL                                [1]
    POP       XDE                                [1]
    PUSH      XWA                                [1]
    CALL      ResetSoundState                    [4]
    POP       XWA                                [1]
    LDW       (Z80_RESET),0x5555                 [4]
    NOP                                          [1]
.skip:
    XOR       A,A                                [2]
    LD{1}     (0x62EE),A                         [5]
    LD{1}     (0x632F),A                         [5]
    XOR       XDE,XDE                            [2]
    LD        XIX,0x62AE                         [5]
    LD        XIY,0x62EF                         [5]
    LD        C,0x10                             [2]
.loop2:
    LD{1}     (XIX+),XDE                         [3]
    LD{1}     (XIY+),XDE                         [3]
    DJNZ      C,.loop2                           [3]
    LD        DE,(XHL+2)                         [3]
    EXTZ      XDE                                [2]
    ADD       XDE,0x7000                         [6]
    LD{1}     (0x633C),XDE                       [5]
    LD{1}     XDE,(0x6334)                       [5]
    CALR      SetZ80Pointer                      [3]
    LD        BC,6                               [2]
    CALR      CopyToZ80                          [3]
    LD{1}     XDE,(0x6338)                       [5]
    CALR      SetZ80Pointer                      [3]
    LD        A,(XHL+)                           [3]
    OR        A,A                                [2]
    JP        Z,.skip3                           [5]
.loop3:
    LD        DE,9                               [3]
    MUL       DE,(XHL+)                          [3]
    PUSH      XHL                                [1]
    LD        XHL,SoundInit                      [5]
    LDA       XHL,XHL+DE                         [5]
    LD        BC,9                               [3]
    CALR      CopyToZ80                          [3]
    POP       XHL                                [1]
    DJNZ      A,.loop3                           [3]
    LD{1}     XDE,(0x633C)                       [5]
    CALR      SetZ80Pointer                      [3]
    LD        XIX,0x62AE                         [5]
    LD        XIY,0x62EE                         [5]
.loop4:
    LD        E,(XIY)                            [2]
    CP        E,0x20                             [3]
    JP        NC,.skip3                          [5]
    LD        XDE,(XHL+)                         [3]
    OR        XDE,XDE                            [2]
    JR        Z,.loop5                           [2]
    LD        A,(XHL+)                           [3]
    LD{1}     (0x6340),XHL                       [5]
    LD        XHL,XDE                            [2]
    LD        DE,(XHL+)                          [3]
    CP        DE,0x7F                            [4]
    JR        C,.skip2                           [2]
    CPB{1}    (0x632F),0                         [6]
    JR        NZ,.skip2                          [2]
    LD        XIX,0x62EF                         [5]
    LD        XIY,0x632F                         [5]
.skip2:
    LD{1}     (XIX+),DE                          [3]
    INCB      1,(XIY)                            [2]
    LD        E,(XHL+)                           [3]
    EXTZ      DE                                 [2]
    LD        BC,(XHL)                           [2]
    AND       BC,0x3FFF                          [4]
    SUB       BC,DE                              [2]
    SUB       BC,WA                              [2]
    LD{1}     (0x6344),DE                        [5]
    EX{1}     (0x6344),BC                        [5]
    CALR      CopyToZ80                          [3]
    LDA       XHL,XHL+WA                         [5]
    LD{1}     XDE,(0x6340)                       [5]
    LD{1}     (0x6340),XHL                       [5]
    LD        XHL,XDE                            [2]
    LD        BC,WA                              [2]
    CALR      CopyToZ80                          [3]
    PUSH      XHL                                [1]
    LD{1}     XHL,(0x6340)                       [5]
    LD{1}     BC,(0x6344)                        [5]
    CALR      CopyToZ80                          [3]
    LD{1}     (0x633C),XDE                       [5]
    POP       XHL                                [1]
    JP        .loop4                             [4]
.loop5:
    POP       XIY                                [1]
    POP       XIX                                [1]
    POP       XHL                                [1]
    POP       XDE                                [1]
    POP       XBC                                [1]
    RET                                          [1]
.skip3:
    SCF                                          [1]
    JR        .loop5                             [2]

.org 0x200289

sub_200289:
    LD{1}     W,(0x62AA)                         [5]
    CP{1}     (0x62AB),W                         [5]
    RCF                                          [1]
    RET       Z                                  [2]
    LD        XIX,0x629A                         [5]
    LD{1}     W,(0x62AA)                         [5]
    LD        A,(XIX+W)                          [5]
    INC       1,W                                [2]
    AND       W,0xF                              [3]
    LD{1}     (0x62AA),W                         [5]
    SCF                                          [1]
    RET                                          [1]

.org 0x2002B1

sub_2002B1:
    BIT       7,A                                [3]
    JR        Z,.skip                            [2]
    RCF                                          [1]
    RET                                          [1]
.skip:
    LD        W,1                                [2]
    BIT       0,A                                [3]
    JR        NZ,.skip2                          [2]
    LD        W,2                                [2]
.skip2:
    AND{1}    W,(0x62AC)                         [5]
    SCF                                          [1]
    RET                                          [1]

.org 0x2002C8

dyn_2002C8:
    BIT       7,W                                [3]
    SCF                                          [1]
    RET       NZ                                 [2]
    CP        WA,0x7F                            [4]
    JR        NZ,dyn_2002D8                      [2]
    LD        A,1                                [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x2002D8

dyn_2002D8:
    CP        WA,0x20                            [4]
    JR        NC,dyn_2002E5                      [2]
    ADD       A,A                                [2]
    OR        A,0xC0                             [3]
    SCF                                          [1]
    RET                                          [1]

.org 0x2002E5

dyn_2002E5:
    PUSH      DE                                 [1]
    PUSH      BC                                 [1]
    LD        E,3                                [2]
    LD        XIX,0x62AE                         [5]
    CP        WA,0x80                            [4]
    JR        C,0x200305                         [2]
    AND       E,0xFE                             [3]
    LD        XIX,0x62EF                         [5]
    CP        WA,0x280                           [4]
    JR        C,0x200305                         [2]
    AND       E,0xFD                             [3]
    LD        BC,0x20                            [3]
    AND       WA,0x1FF                           [4]
    CPIRW     WA,(XIX+)                          [2]
    JR        NZ,.skip                           [2]
    LD        A,0x1F                             [2]
    SUB       A,C                                [2]
    ADD       A,A                                [2]
    ADD       A,A                                [2]
    OR        A,E                                [2]
    POP       BC                                 [1]
    POP       DE                                 [1]
    SCF                                          [1]
    RET                                          [1]
.skip:
    POP       BC                                 [1]
    POP       DE                                 [1]
    RCF                                          [1]
    RET                                          [1]

.org 0x200322

; LDIR XHL -> Z80 RAM at the running pointer
CopyToZ80:
    LD{1}     XDE,(0x6330)                       [5]
    LDIR      (XDE+),(XHL+)                      [2]

.org 0x200329

SetZ80Pointer:
    LD{1}     (0x6330),XDE                       [5]
    RET                                          [1]

.org 0x20032F

sub_20032F:
    PUSH      XWA                                [1]
    ANDB      (TRUN),0xF7                        [4]
    ANDB      (T23MOD),0x33                      [4]
    ORB       (T23MOD),4                         [4]
    ANDB      (0x25),0xF                         [4]
    ORB       (0x25),0xB0                        [4]
    MUL       XWA,0x3E8                          [4]
    DIV       XWA,0x5000                         [4]
    CP        QWA,0x2800                         [5]
    JR        C,.skip                            [2]
    INC       1,A                                [2]
.skip:
    LD        (TREG3),A                          [3]
    ORB       (TRUN),0x88                        [4]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x20035E

; copies Z80Driver to 0x7000
UploadZ80Driver:
    LD        XDE,0x7000                         [5]
    CALR      SetZ80Pointer                      [3]
    LD        XHL,Z80Driver                      [5]
    LD{1}     XDE,XHL                            [2]
    LD        BC,(XDE+0x8F)                      [5]
    LD        DE,BC                              [2]
    EXTZ      XDE                                [2]
    LDA       XDE,XDE+0x7000                     [5]
    LD{1}     (0x6334),XDE                       [5]
    CALR      CopyToZ80                          [3]
    ADD       XDE,6                              [6]
    CALR      SetZ80Pointer                      [3]
    LD        XHL,0x200E82                       [5]
    LD        BC,(XHL+)                          [3]
    OR        BC,BC                              [2]
    JR        Z,.skip                            [2]
    CALR      CopyToZ80                          [3]
.skip:
    LD{1}     (0x6338),XDE                       [5]
    RET                                          [1]
    .db FF FF FF FF FE FE FE FE FD FD FD FD 01 04 0B 01
    .db 01
