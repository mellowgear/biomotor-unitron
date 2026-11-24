; engine/unsorted/code_20E012: 383 routines (each keeps its ROM address with .org)

.org 0x20E012

sub_20E012:
    LD        A,(XIZ+0x10)                       [3]
    LD        C,0x12                             [2]
    LD        E,3                                [2]
    LD        HL,(XIZ+0xE)                       [3]
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
    .db 00 23 0F 0D 10 0C 05 14 05 00 00 FF 00 23 0C 05
    .db 01 12 00 23 0F 0D 10 0C 05 14 05 00 FF 00 33 01
    .db 16 05 00 23 0F 0D 10 0C 05 14 05 00 00 FF

.org 0x20E084

swp_20E084:
    LDW       (XIZ+8),0xE09A                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
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
    LDW       (XIZ+8),0xE141                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20E141

swp_20E141:
    LD        C,(0x5DF7)                         [4]
    DEC       1,C                                [2]
    MUL{1}    BC,0x20                            [3]
    ADD       BC,0x58                            [4]
    LD        DE,0x44                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_LEFT,A                       [3]
    JR        NZ,.skip                           [2]
    BIT       3,A                                [3]
    JR        NZ,.skip2                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       5,A                                [3]
    JR        NZ,.skip4                          [2]
    RET                                          [1]
.skip:
    CPB       (0x5DF7),1                         [5]
    RET       Z                                  [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDB       (0x5DF7),1                         [5]
    RET                                          [1]
.skip2:
    CPB       (0x5DF7),2                         [5]
    RET       Z                                  [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LDB       (0x5DF7),2                         [5]
    RET                                          [1]
.skip3:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CALL      EndTask                            [4]
    RET                                          [1]
.skip4:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LDB       (0x5DF7),0                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20E1BC

swp_20E1BC:
    LDW       (XIZ+0x12),0x1E                    [5]
    LDW       (XIZ+8),0xE1CB                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    DECW      1,(XIZ+0x12)                       [3]
    JP        Z,EndTask                          [5]
    RET                                          [1]

.org 0x20E1D4

dyn_20E1D4:
    CPW       (XIZ+4),0                          [5]
    JP        Z,EndTask                          [5]
    DECW      1,(XIZ+0xE)                        [3]
    JP        Z,EndTask                          [5]
    RET                                          [1]

.org 0x20E22B

dyn_20E22B:
    LDW       (XIZ+0x16),0                       [5]
    LD        A,(XIZ+0x14)                       [3]
    SUB       A,(XIZ+0x12)                       [3]
    EXTS      WA                                 [2]
    LD        (XIZ+0x1A),WA                      [3]
    LDW       (XIZ+8),0xE245                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0x1A)                      [3]
    MULS      WA,(XIZ+0x16)                      [3]
    DIVS      WA,(XIZ+0xE)                       [3]
    ADD       A,(XIZ+0x12)                       [3]
    LD        (0x585B),A                         [4]
    INCW      1,(XIZ+0x16)                       [3]
    LD        WA,(XIZ+0x16)                      [3]
    CP        WA,(XIZ+0xE)                       [3]
    JP        GT,EndTask                         [5]
    RET                                          [1]

.org 0x20E264

dyn_20E264:
    LD        XHL,IntroSequence                  [5]
    CALL      StartChildTask                     [4]
    LDW       (XIZ+8),0xE278                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20E28C

dyn_20E28C:
    CALL      dyn_20636D                         [4]
    CPW       (XIZ+0xC),0                        [5]
    JP        Z,EndTask                          [5]
    RET                                          [1]

.org 0x20E29B

dyn_20E29B:
    LDW       (XIZ+0xE),0x258                    [5]
    LDW       (XIY+0xE),0                        [5]
    LDW       (XIZ+8),0xE2B0                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20E2B0

dyn_20E2B0:
    LD        XHL,TitleScreen                    [5]
    CALL      StartChildTask                     [4]
    LD        XHL,dyn_20E36F                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XIZ+8),0xE2CD                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
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
    LDW       (XIZ+8),0xE30D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip2:
    LDW       (XIZ+8),0xE2EA                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20EC21

swp_20EC21:
    LDW       (XIZ+0xE),0x14                     [5]
    LD        WA,0x17C                           [3]
    LD        XHL,Map_2E3910                     [5]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawTilemapScr2                    [4]
    LDW       (XIZ+8),0xEC40                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    DECW      1,(XIZ+0xE)                        [3]
    JP        Z,EndTask                          [5]
    RET                                          [1]

.org 0x20EC49

dyn_20EC49:
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0                                [2]
    LD        B,0x20                             [2]
    LD        D,0x20                             [2]
    CALL      dyn_206768                         [4]
    RET                                          [1]

.org 0x20EC58

dyn_20EC58:
    LD        WA,0                               [2]
    LD        C,0                                [2]
    LD        E,0x20                             [2]
    LD        B,0x20                             [2]
    LD        D,0x20                             [2]
    CALL      dyn_206768                         [4]
    RET                                          [1]

.org 0x20EE1A

swp_20EE1A:
    CALR      dyn_20EC58                         [3]
    CALR      dyn_20EC49                         [3]
    LD        WA,0xC                             [3]
    LD        XHL,Gfx_2E2E82                     [5]
    CALL      LoadCompressedTiles                [4]
    LD        WA,0x12C                           [3]
    LD        XHL,Map_2DF96E                     [5]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawTilemapScr2                    [4]
    LD        WA,0xC                             [3]
    LD        XHL,Map_2E2B88                     [5]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawTilemapScr1                    [4]
    LDW       (XIZ+0xE),0                        [5]
    LDW       (XIZ+0x10),0                       [5]
    LDW       (XIZ+8),0xEE60                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    SRL       1,WA                               [3]
    LD        (0x584B),A                         [4]
    LDB       (0x584D),(XIZ+0x10)                [5]
    INCW      1,(XIZ+0xE)                        [3]
    CPW       (XIZ+0xE),0x30                     [5]
    JR        Z,.skip                            [2]
    RET                                          [1]
.skip:
    CALR      dyn_20EC49                         [3]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20EE82

swp_20EE82:
    CALR      dyn_20EC58                         [3]
    CALR      dyn_20EC49                         [3]
    LD        WA,0xC                             [3]
    LD        XHL,Gfx_2E1302                     [5]
    CALL      LoadCompressedTiles                [4]
    LD        WA,0x12C                           [3]
    LD        XHL,Map_2DFC68                     [5]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawTilemapScr2                    [4]
    LD        WA,0xC                             [3]
    LD        XHL,Map_2E1008                     [5]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawTilemapScr1                    [4]
    LDW       (XIZ+0xE),0                        [5]
    LDW       (XIZ+0x10),0                       [5]
    LDW       (XIZ+8),0xEEC8                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    SRL       1,WA                               [3]
    LD        (0x584B),A                         [4]
    LDB       (0x584D),(XIZ+0x10)                [5]
    DECW      1,(XIZ+0xE)                        [3]
    CPW       (XIZ+0xE),0xFFD0                   [5]
    JR        Z,.skip                            [2]
    RET                                          [1]
.skip:
    CALR      dyn_20EC49                         [3]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20F179

swp_20F179:
    LDB       (0x585B),0x81                      [5]
    LDB       (0x5CE2),0                         [5]
    CALR      dyn_20EC49                         [3]
    CALR      dyn_20EC58                         [3]
    LD        XWA,0x12                           [5]
    CALL      PlayMusic                          [4]
    LD        WA,0x33                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+8),0xF1A4                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20F611

swp_20F611:
    LDW       (XIZ+8),0xF61B                     [5]
    LDW       (XIZ+0xA),0x20                     [5]

.org 0x20F61B

loc_20F61B:
    LD        A,(wJoyPressed)                    [4]
    AND       A,B_BUTTON                         [3]
    JP        NZ,EndTask                         [5]
    RET                                          [1]

.org 0x20F628

dyn_20F628:
    CALR      dyn_20EC58                         [3]
    LDB       (0x5855),0                         [5]
    LD        XDE,wPlayerName                    [5]
    LD        B,6                                [2]
    LD        WA,0x16C                           [3]
    LD        L,(XDE)                            [2]
    PUSH      B                                  [2]
    PUSH      XDE                                [1]
    PUSH      WA                                 [1]
    CALL      dyn_207093                         [4]
    POP       WA                                 [1]
    POP       XDE                                [1]
    POP       B                                  [2]
    INC       1,XDE                              [2]
    INC       2,WA                               [2]
    DJNZ      B,0x20F63A                         [3]
    LD        XDE,wPartnerName                   [5]
    LD        B,6                                [2]
    LD        WA,0x173                           [3]
    LD        L,(XDE)                            [2]
    PUSH      B                                  [2]
    PUSH      XDE                                [1]
    PUSH      WA                                 [1]
    CALL      dyn_207093                         [4]
    POP       WA                                 [1]
    POP       XDE                                [1]
    POP       B                                  [2]
    INC       1,XDE                              [2]
    INC       2,WA                               [2]
    DJNZ      B,0x20F659                         [3]
    LD        WA,0x186                           [3]
    LD        (XIZ+0x18),WA                      [3]
    LDB       (XIZ+0x12),0                       [4]
    LDW       (XIZ+0x14),5                       [5]
    LD        WA,(XIZ+0x14)                      [3]
    LD        (XIZ+0x16),WA                      [3]
    LD        XHL,dyn_20F6E0                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XIZ+8),0xF6AB                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        XDE,0x5DF8                         [5]
    LD        BC,0x100                           [3]
    EXTZ      XBC                                [2]
    LDW{1}    (XDE+),0xFFFF                      [5]
    DEC       1,BC                               [2]
    CP        BC,0                               [2]
    JR        NZ,0x20F6A0                        [2]
    CPW       (XIZ+0xC),0                        [5]
    JP        Z,EndTask                          [5]
    LD        A,(wJoyPressed)                    [4]
    AND       A,B_BUTTON                         [3]
    JR        Z,dyn_20F6CA                       [2]
    CALR      dyn_20EC58                         [3]
    CALL      dyn_20636D                         [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20F6CA

dyn_20F6CA:
    DECW      1,(XIZ+0x16)                       [3]
    RET       NZ                                 [2]
    LD        WA,(XIZ+0x14)                      [3]
    LD        (XIZ+0x16),WA                      [3]
    LD        A,(XIZ+0x12)                       [3]
    LD        (0x5855),A                         [4]
    INCB      1,(XIZ+0x12)                       [3]
    RET                                          [1]

.org 0x20F6E0

dyn_20F6E0:
    LD        WA,(XIY+0x14)                      [3]
    CP        (XIY+0x16),WA                      [3]
    RET       NZ                                 [2]
    LDW       (XIZ+0xE),0                        [5]
    LD        A,(XIY+0x12)                       [3]
    AND       A,7                                [3]
    RET       NZ                                 [2]
    LD        XWA,0                              [2]
    LD        A,(XIY+0x12)                       [3]
    SRL       3,A                                [3]
    ADD       A,0x13                             [3]
    AND       A,0x1F                             [3]
    SLL       6,XWA                              [3]
    ADD       XWA,0x9800                         [6]
    LDW       (XIZ+0xE),0                        [5]
    LD        XHL,(XIY+0xE)                      [3]
    LD        C,(XHL)                            [2]
    CP        C,0xFE                             [3]
    JR        Z,0x20F754                         [2]
    CP        C,0xFF                             [3]
    JRL       Z,loc_20F7A8                       [3]
    CP        C,0xFC                             [3]
    JR        NZ,dyn_20F730                      [2]
    LD        DE,0x16C                           [3]
    LD        XBC,wPlayerName                    [5]
    JR        loc_20F73D                         [2]

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
    INCW      1,(XIZ+0xE)                        [3]
    CPW       (XIZ+0xE),0x14                     [5]
    JRL       NZ,0x20F714                        [3]
    INC       1,XHL                              [2]
    LD        (XIY+0xE),XHL                      [3]
    RET                                          [1]

.org 0x20F7A8

loc_20F7A8:
    CALL      EndTask                            [4]
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

.org 0x210204

dyn_210204:
    CALL      sub_206847                         [4]
    LDW       (XIZ+8),0xFFBE                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x210213

swp_210213:
    RET                                          [1]

.org 0x210214

; [code] effect id -> loads its tiles (0x180) and palette (14) from BattleEffects
PlayBattleEffect:
    LDW       (XIZ+0x1A),0                       [5]
    LD        HL,(XIZ+0x20)                      [3]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,0x226DCE                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+0x22),XHL                     [3]
    LD        HL,(XIZ+0x20)                      [3]
    EXTZ      XHL                                [2]
    SLL       2,XHL                              [3]
    ADD       XHL,BattleEffects                  [6]
    LD        XHL,(XHL)                          [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+0xE),XHL                      [3]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        WA,0x180                           [3]
    CALL      LoadCompressedTiles                [4]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        A,0xE                              [2]
    LD        C,1                                [2]
    CALL      LoadPalettes                       [4]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    PUSH      XHL                                [1]
    LD        XHL,(XHL)                          [2]
    LD        A,0xE                              [2]
    LD        C,1                                [2]
    CALL      LoadMonoPalettes                   [4]
    POP       XHL                                [1]
    INC       4,XHL                              [2]
    LD        XHL,(XHL)                          [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    LD        (XIZ+0x16),WA                      [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x12),XHL                     [3]
    LDW       (XIZ+0x1C),0                       [5]
    LDW       (XIZ+0x18),0                       [5]
.loop:
    LD        XIY,(XIZ+0x12)                     [3]
    LD        WA,(XIZ+0x18)                      [3]
    INCW      1,(XIZ+0x18)                       [3]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    ADD       XIY,XWA                            [2]
    LD        A,(XIY+0)                          [3]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CPB       (XIZ+0x1C),0                       [4]
    JR        NZ,.skip                           [2]
    EXTZ      WA                                 [2]
    LD        (XIZ+0x1C),WA                      [3]
.skip:
    LD        C,(XIY+2)                          [3]
    EXTS      BC                                 [2]
    CPW       (XIZ+0x1E),0                       [5]
    JR        Z,.skip2                           [2]
    NEG       BC                                 [2]
.skip2:
    ADD       BC,0x50                            [4]
    LD        E,(XIY+3)                          [3]
    EXTS      DE                                 [2]
    ADD       DE,0x30                            [4]
    LD        A,(XIY+1)                          [3]
    CP        A,0xFF                             [3]
    JR        Z,.skip5                           [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,(XIZ+0xE)                      [3]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,(XHL+0)                          [3]
    EXTZ      WA                                 [2]
    SLL       2,WA                               [3]
    SUB       BC,WA                              [2]
    LD        A,(XHL+1)                          [3]
    EXTZ      WA                                 [2]
    SLL       2,WA                               [3]
    SUB       DE,WA                              [2]
    LD        WA,0x180                           [3]
    CPW       (XIZ+0x1E),0                       [5]
    JR        NZ,.skip3                          [2]
    CALL      dyn_2069C8                         [4]
    JR        .skip5                             [2]
.skip3:
    CPW       (XIZ+0x20),0x72                    [5]
    JR        Z,.skip4                           [2]
    CPW       (XIZ+0x20),0x73                    [5]
    JR        Z,.skip4                           [2]
    CPW       (XIZ+0x20),0xBE                    [5]
    JR        Z,.skip4                           [2]
    CPW       (XIZ+0x20),0xBF                    [5]
    JR        Z,.skip4                           [2]
    CALL      swp_206A7B                         [4]
    JR        .skip5                             [2]
.skip4:
    CALL      dyn_2069C8                         [4]
.skip5:
    LD        A,(XIY+0)                          [3]
    CP        A,0                                [2]
    JRL       Z,.loop                            [3]
    LD        XHL,(XIZ+0x22)                     [3]
    LD        A,(XHL)                            [2]
    EXTS      WA                                 [2]
    CP        WA,0xFFFF                          [4]
    JR        Z,.skip6                           [2]
    CP        (XIZ+0x1A),WA                      [3]
    JR        NZ,.skip6                          [2]
    LD        WA,(XHL+1)                         [3]
    CALL      SoundCommand                       [4]
    INC       3,XHL                              [2]
    LD        (XIZ+0x22),XHL                     [3]
.skip6:
    INCW      1,(XIZ+0x1A)                       [3]
    DECW      1,(XIZ+0x16)                       [3]
    DECW      1,(XIZ+0x1C)                       [3]
    JR        Z,.skip7                           [2]
    LDW       (XIZ+8),0x281                      [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]
.skip7:
    CPW       (XIZ+0x16),0                       [5]
    JR        NZ,.skip8                          [2]
    CALL      EndTask                            [4]
    RET                                          [1]
.skip8:
    LD        WA,(XIZ+0x18)                      [3]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    ADD       (XIZ+0x12),XWA                     [3]
    LDW       (XIZ+8),0x27C                      [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21037F

swp_21037F:
    RET                                          [1]

.org 0x210390

dyn_210390:
    CP        HL,0x22                            [4]
    JR        LE,dyn_210398                      [2]
    JR        0x2103B4                           [2]

.org 0x210398

dyn_210398:
    SUB       HL,0xA                             [4]
    EXTZ      XHL                                [2]
    SLL       1,XHL                              [3]
    ADD       XHL,0x227419                       [6]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    ADD       BC,WA                              [2]
    LD        A,(XHL+1)                          [3]
    EXTZ      WA                                 [2]
    ADD       DE,WA                              [2]
    POP       HL                                 [1]
    POP       WA                                 [1]
    CALR      DrawPortrait                       [3]
    RET                                          [1]

.org 0x210423

dyn_210423:
    LD        WA,(XSP+4)                         [3]
    PUSH      XHL                                [1]
    LD        XHL,(XHL+4)                        [3]
    CALL      LoadCompressedTiles                [4]
    POP       XHL                                [1]
    LD        XHL,(XHL+8)                        [3]
    LD        DE,(XSP)                           [2]
    LD        BC,(XSP+2)                         [3]
    LD        WA,(XSP+4)                         [3]
    CALL      DrawTilemap                        [4]
    POP       DE                                 [1]
    POP       BC                                 [1]
    POP       WA                                 [1]
    RET                                          [1]

.org 0x210442

swp_210442:
    RET                                          [1]

.org 0x210443

swp_210443:
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0xFF                             [2]
    LD        (0x5FF8),A                         [4]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        XWA,swp_210485                     [5]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]

.org 0x210467

swp_210467:
    LD        A,3                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,5                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0xFF                             [2]
    LD        (0x5FF9),A                         [4]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        XWA,swp_210485                     [5]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]

.org 0x210485

swp_210485:
    LD        A,(XIZ+0xE)                        [3]
    CP        A,5                                [2]
    JR        Z,.skip4                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2106CB                         [4]
    LD        A,2                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        .done                              [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    CALL      sub_210C4E                         [4]
    JR        .done                              [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALL      sub_210D34                         [4]
    LD        A,4                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        .done                              [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    CALL      DungeonStep                        [4]
    JR        .done                              [2]
.skip4:
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0                                [2]
    LD        (0x584B),A                         [4]
    LD        (0x584D),A                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,5                                [2]
    JR        Z,.skip5                           [2]
    LD        A,(XIZ+0xF)                        [3]
    LD        (0x5FF8),A                         [4]
    CALL      EndTask                            [4]
    JR        .done                              [2]
.skip5:
    LD        A,(XIZ+0xF)                        [3]
    LD        (0x5FF9),A                         [4]
    CALL      EndTask                            [4]
    JR        .done                              [2]
.done:
    RET                                          [1]

.org 0x210520

swp_210520:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x10                            [3]
    LD        A,1                                [2]
    LD        C,0xA                              [2]
    LD        E,3                                [2]
    CALL      dyn_207494                         [4]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    SLL       2,A                                [3]
    LD        XHL,0x2274D7                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21054D

swp_21054D:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    LD        C,1                                [2]
    LD        E,0x21                             [2]
    CALL      dyn_2074C0                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x210600

sub_210600:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        XHL,Gfx_2C8691                     [5]
    LD        WA,0x10                            [3]
    CALL      LoadCompressedTiles                [4]
    LD        XHL,Pal_2C865D                     [5]
    LD        A,1                                [2]
    LD        C,1                                [2]
    CALL      LoadPalettes                       [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x210622

sub_210622:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    PUSH      A                                  [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x2275A1                       [5]
    ADD       XHL,XWA                            [2]
    LD        BC,(XHL)                           [2]
    INC       2,XHL                              [2]
    LD        DE,(XHL)                           [2]
    SUB       BC,8                               [4]
    SUB       DE,0xC                             [4]
    POP       A                                  [1]
    LD        W,(XIZ+0x2D)                       [3]
    SRA       3,W                                [3]
    ADD       A,W                                [2]
    AND       A,3                                [3]
    EXTZ      WA                                 [2]
    SLL       2,WA                               [3]
    ADD       WA,0x10                            [4]
    LD        HL,0                               [2]
    SLL       13,HL                              [3]
    OR        WA,HL                              [2]
    LD        HL,1                               [2]
    SLL       9,HL                               [3]
    OR        WA,HL                              [2]
    LD        QB,2                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x210675

sub_210675:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x60                            [3]
    LD        C,4                                [2]
.loop:
    PUSH      C                                  [2]
    PUSH      HL                                 [1]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    POP       HL                                 [1]
    PUSH      HL                                 [1]
    SUB       HL,0x60                            [4]
    LD{1}     A,L                                [2]
    CALR      sub_210622                         [3]
.skip:
    POP       HL                                 [1]
    POP       C                                  [2]
    INC       1,HL                               [2]
    DJNZ      C,.loop                            [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2106A1

sub_2106A1:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    SLL       2,XWA                              [3]
    LD        XHL,0x227473                       [5]
    ADD       XHL,XWA                            [2]
    LD        BC,(XHL)                           [2]
    INC       2,XHL                              [2]
    LD        DE,(XHL)                           [2]
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2106BB

sub_2106BB:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        WA,(XIZ+0xC)                       [3]
    CP        WA,0                               [2]
    JR        Z,.skip                            [2]
    CALL      dyn_20636D                         [4]
.skip:
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2106CB

sub_2106CB:
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
    RET                                          [1]

.org 0x2106D1

swp_2106D1:
    PUSH      A                                  [1]
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    POP       A                                  [1]
    RET                                          [1]

.org 0x2106DE

sub_2106DE:
    CALL      dyn_206803                         [4]
    CALL      dyn_206825                         [4]
    CALL      dyn_216EDE                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216F8E                         [4]
    LD        A,1                                [2]
    CALR      swp_2104EF                         [3]
    LD        A,1                                [2]
    LD        (XIZ+0x15),A                       [3]
    CALR      sub_210600                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        XWA,0x14                           [5]
    CALL      PlayMusic                          [4]
    LD        WA,0x35                            [3]
    CALL      SoundCommand                       [4]
    RET                                          [1]

.org 0x21071A

sub_21071A:
    CALL      dyn_216FC3                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    LD        A,0                                [2]
    LD        (XIZ+0x2B),A                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
.done:
    RET                                          [1]

.org 0x21072D

sub_21072D:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    JR        .skip3                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_210838                         [3]
    JR        .done                              [2]
.skip2:
    LD        A,(XIZ+0x2B)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2B),A                       [3]
    CP        A,0x2D                             [3]
    JR        C,.done                            [2]
.skip3:
    LD        A,4                                [2]
    LD        (XIZ+0xF),A                        [3]
.done:
    RET                                          [1]

.org 0x21075E

sub_21075E:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_2106BB                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CALR      sub_21081D                         [3]
    JR        .done                              [2]
.skip:
    CALR      sub_210838                         [3]
    JR        .done                              [2]
.skip2:
    BIT       5,A                                [3]
    JR        Z,.skip3                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_2106BB                         [3]
    CALR      sub_210838                         [3]
    JR        .done                              [2]
.skip3:
    AND       A,0xF                              [3]
    JR        Z,.done                            [2]
    CP        A,1                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,0                                [2]
    JR        .skip12                            [2]
.skip4:
    CP        A,2                                [2]
    JR        NZ,.skip5                          [2]
    LD        A,1                                [2]
    JR        .skip12                            [2]
.skip5:
    CP        A,4                                [2]
    JR        NZ,.skip6                          [2]
    LD        A,2                                [2]
    JR        .skip12                            [2]
.skip6:
    CP        A,8                                [3]
    JR        NZ,.skip7                          [2]
    LD        A,3                                [2]
    JR        .skip12                            [2]
.skip7:
    CP        A,9                                [3]
    JR        NZ,.skip8                          [2]
    LD        A,4                                [2]
    JR        .skip12                            [2]
.skip8:
    CP        A,0xA                              [3]
    JR        NZ,.skip9                          [2]
    LD        A,5                                [2]
    JR        .skip12                            [2]
.skip9:
    CP        A,6                                [2]
    JR        NZ,.skip10                         [2]
    LD        A,6                                [2]
    JR        .skip12                            [2]
.skip10:
    CP        A,5                                [2]
    JR        NZ,.skip11                         [2]
    LD        A,7                                [2]
    JR        .skip12                            [2]
.skip11:
    JR        .done                              [2]
.skip12:
    CALR      sub_2107F9                         [3]
    CP        A,0xFF                             [3]
    JR        Z,.done                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_2106BB                         [3]
.done:
    RET                                          [1]

.org 0x2107F9

sub_2107F9:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        L,A                                [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       A,L                                [2]
    LD        XHL,0x22744B                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        (XIZ+0x10),A                       [3]
.skip:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21081D

sub_21081D:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALL      dyn_216EDE                         [4]
    CALL      swp_216FBA                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0xF),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x210838

sub_210838:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,3                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALL      dyn_216EDE                         [4]
    CALL      swp_216FBA                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0xF),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x210853

sub_210853:
    CALL      dyn_216FC3                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    LD        A,(XIZ+0x12)                       [3]
    CP        A,3                                [2]
    JR        Z,.skip                            [2]
    CALR      sub_210877                         [3]
    JR        .done                              [2]
.skip:
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,5                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0xF),A                        [3]
.done:
    RET                                          [1]

.org 0x210929

swp_210929:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_B_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_210BF3                         [3]
    JRL       loc_2109F3                         [3]
.skip:
    LD        A,(XIZ+0x26)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip2                           [2]
    LD        A,0                                [2]
    LD        (XIZ+0x26),A                       [3]
    LD        A,(XIZ+0x25)                       [3]
    CP        A,1                                [2]
    JRL       Z,.skip8                           [3]
.skip2:
    JRL       loc_2109F3                         [3]
.skip3:
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        XHL,(XWA+8)                        [3]
    CP{2}     XHL,0                              [6]
    JR        Z,.skip5                           [2]
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON|B_BUTTON                [3]
    JR        Z,.skip4                           [2]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        C,(XWA+0x10)                       [3]
    LD        (XIZ+0x23),C                       [3]
    LD        C,0                                [2]
    LD        (XWA+0x10),C                       [3]
.skip4:
    JR        loc_2109F3                         [2]
.skip5:
    LD        C,(XIZ+0x23)                       [3]
    CP        C,0xFF                             [3]
    JR        Z,.skip6                           [2]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+0x10),C                       [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
.skip6:
    LD        A,(XIZ+0x25)                       [3]
    CP        A,2                                [2]
    JR        NZ,.skip7                          [2]
    LD        A,1                                [2]
    LD        (XIZ+0x25),A                       [3]
    LD        A,1                                [2]
    LD        (XIZ+0x26),A                       [3]
    LD        A,2                                [2]
    CALL      swp_211DDE                         [4]
    JR        loc_2109F3                         [2]
.skip7:
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    SUB       A,1                                [3]
    SLL       2,A                                [3]
    LD        XHL,0x227580                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,2                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,2                                [2]
    LD        (XIZ+0x25),A                       [3]
    LD        A,(XIZ+0x2B)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2B),A                       [3]
    JR        loc_2109F3                         [2]
.skip8:
    LD        A,0                                [2]
    LD        (XIZ+0x2B),A                       [3]
    LD        A,9                                [2]
    LD        (XIZ+0xF),A                        [3]

.org 0x210BF3

sub_210BF3:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALL      dyn_216EDE                         [4]
    CALL      swp_216FBA                         [4]
    LD        A,0xB                              [2]
    LD        (XIZ+0xF),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x210C4E

sub_210C4E:
    LD        A,(XIZ+0xF)                        [3]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_2106DE                         [3]
    JR        .skip13                            [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_21071A                         [3]
    JR        .skip13                            [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_21072D                         [3]
    JR        .skip13                            [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_21075E                         [3]
    JR        .skip13                            [2]
.skip4:
    CP        A,5                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_210853                         [3]
    JR        .skip13                            [2]
.skip5:
    CP        A,6                                [2]
    JR        NZ,.skip6                          [2]
    CALR      sub_2108D0                         [3]
    JR        .skip13                            [2]
.skip6:
    CP        A,7                                [2]
    JR        NZ,.skip7                          [2]
    CALR      sub_2108E3                         [3]
    JR        .skip13                            [2]
.skip7:
    CP        A,8                                [3]
    JR        NZ,.skip8                          [2]
    CALR      sub_210AA4                         [3]
    JR        .skip13                            [2]
.skip8:
    CP        A,9                                [3]
    JR        NZ,.skip9                          [2]
    CALR      sub_210B72                         [3]
    JR        .skip13                            [2]
.skip9:
    CP        A,0xA                              [3]
    JR        NZ,.skip10                         [2]
    CALR      sub_210B80                         [3]
    JR        .skip13                            [2]
.skip10:
    CP        A,0xB                              [3]
    JR        NZ,.skip11                         [2]
    CALR      sub_210C29                         [3]
    JR        .skip13                            [2]
.skip11:
    CP        A,0xC                              [3]
    JR        NZ,.skip12                         [2]
    LD        A,3                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        .done                              [2]
.skip12:
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
.skip13:
    LD        A,(XIZ+0xF)                        [3]
    CP        A,4                                [2]
    JR        C,.skip14                          [2]
    CP        A,6                                [2]
    JR        NC,.skip14                         [2]
    CALL      LoadDungeonPalettes                [4]
    CALR      sub_2106A1                         [3]
    CALL      sub_211D92                         [4]
    CALR      sub_210675                         [3]
    LD        A,(XIZ+0xF)                        [3]
    CP        A,4                                [2]
    JR        NZ,.skip14                         [2]
    LD        WA,(XIZ+0xC)                       [3]
    CP        WA,0                               [2]
    JR        NZ,.skip14                         [2]
    LD        XHL,PlayBattleEffect               [5]
    CALL      StartChildTask                     [4]
    LD        WA,0                               [2]
    LD        (XHL+0x1E),WA                      [3]
    LD        A,(XIZ+0x10)                       [3]
    EXTZ      WA                                 [2]
    ADD       WA,0xCF                            [4]
    LD        (XHL+0x20),WA                      [3]
    JR        .skip17                            [2]
.skip14:
    CP        A,0xA                              [3]
    JR        NZ,.skip17                         [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x20)                       [3]
    AND       A,A                                [2]
    JR        NZ,.skip15                         [2]
    LD        BC,0x58                            [3]
    JR        .skip16                            [2]
.skip15:
    LD        BC,0x78                            [3]
.skip16:
    LD        DE,0x44                            [3]
    CALL      dyn_211DBD                         [4]
    JR        .skip17                            [2]
.skip17:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
.done:
    RET                                          [1]

.org 0x210D34

sub_210D34:
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
    RET                                          [1]

.org 0x210FDB

swp_210FDB:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    XOR       A,A                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21154F

swp_21154F:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    XOR       WA,WA                              [2]
    LD        (0x5BC7),WA                        [4]
    LD        (0x5BC9),WA                        [4]
    LD        (0x5BCB),WA                        [4]
    LD        (0x5BCD),WA                        [4]
    CALL      loc_206FC1                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x211D92

sub_211D92:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    SUB       BC,8                               [4]
    SUB       DE,0xC                             [4]
    LD        WA,0                               [2]
    SLL       13,WA                              [3]
    LD        HL,0                               [2]
    SLL       9,HL                               [3]
    OR        WA,HL                              [2]
    OR        WA,0xC                             [4]
    LD        QB,2                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x211DBD

dyn_211DBD:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x2D)                       [3]
    SRL       5,A                                [3]
    JR        C,0x211DD9                         [2]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    LD        WA,4                               [2]
    OR        WA,0x3E00                          [4]
    CALL      dyn_206BFF                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x211F37

swp_211F37:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2167F9                         [4]
    LD        A,4                                [2]
    CALL      dyn_207598                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x212619

swp_212619:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21265F

sub_21265F:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,5                                [2]
    CALL      dyn_207598                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2127F3

swp_2127F3:
    JR        loc_212844                         [2]

.org 0x2127F5

loc_2127F5:
    LD        A,7                                [2]
    LD        (XIZ+0x2A),A                       [3]
    JR        loc_212844                         [2]

.org 0x2127FC

loc_2127FC:
    CP        A,5                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_21264C                         [3]
    LD        A,5                                [2]
    CALL      swp_211DDE                         [4]
    LD        A,6                                [2]
    LD        (XIZ+0x2A),A                       [3]
    JR        loc_212844                         [2]
.skip:
    CP        A,6                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip2                           [2]
    LD        A,7                                [2]
    LD        (XIZ+0x2A),A                       [3]
    JR        loc_212844                         [2]
.skip2:
    BIT       5,A                                [3]
    JR        Z,.skip3                           [2]
    LD        A,7                                [2]
    LD        (XIZ+0x2A),A                       [3]
    JR        loc_212844                         [2]
.skip3:
    JR        loc_212844                         [2]
.skip4:
    CP        A,7                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_21265F                         [3]
    CALL      swp_210FDB                         [4]
    JR        loc_212844                         [2]
.skip5:
    LD        A,1                                [2]
    LD        (XIZ+0x2A),A                       [3]

.org 0x212844

loc_212844:
    LD        A,(XIZ+0x2A)                       [3]
    CP        A,3                                [2]
    JR        NZ,.skip                           [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x20)                       [3]
    MUL{1}    WA,0x28                            [3]
    ADD       WA,0x28                            [4]
    LD        BC,WA                              [2]
    LD        DE,0x74                            [3]
    CALL      dyn_211DBD                         [4]
    JR        .skip                              [2]
.skip:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x212867

swp_212867:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x14                            [3]
    LD        A,1                                [2]
    LD        C,7                                [2]
    LD        E,3                                [2]
    CALL      dyn_207494                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2128BF

sub_2128BF:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x19                            [3]
    LD        A,2                                [2]
    LD        C,0xC                              [2]
    LD        E,5                                [2]
    CALL      dyn_207494                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2129E1

swp_2129E1:
    CALR      swp_212867                         [3]
    CALL      sub_2128BF                         [4]
    RET                                          [1]

.org 0x212B66

sub_212B66:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        XHL,0x9800                         [5]
    LD        WA,0x10                            [3]
    CALL      swp_216D66                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x212B80

sub_212B80:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        WA,0x10                            [3]
    LD        BC,0                               [2]
    LD        C,(XIZ+0x2C)                       [3]
    CALL      sub_216DCD                         [4]
    LD        C,(XIZ+0x2C)                       [3]
    INC       1,C                                [2]
    LD        (XIZ+0x2C),C                       [3]
    CP        A,1                                [2]
    JR        Z,.skip                            [2]
.skip:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x212C32

swp_212C32:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,6                                [2]
    CALL      dyn_2075CC                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x212D8F

swp_212D8F:
    LD        A,1                                [2]
    LD        (XIZ+0x25),A                       [3]
    JR        loc_212D96                         [2]

.org 0x212D96

loc_212D96:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2130E1

swp_2130E1:
    CALL      dyn_206803                         [4]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0                                [2]
    LD        (0x5FF9),A                         [4]
    LD        A,0xFF                             [2]
    LD        (0x5FF8),A                         [4]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        XWA,swp_21310A                     [5]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]

.org 0x21310A

swp_21310A:
    LD        A,(XIZ+0xE)                        [3]
    CP        A,0xC                              [3]
    JR        Z,.skip11                          [2]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    LD        A,2                                [2]
    LD        (XIZ+0xE),A                        [3]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    CALL      sub_21360F                         [4]
    JR        .done                              [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALL      sub_213768                         [4]
    JR        .done                              [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    CALL      sub_213817                         [4]
    JR        .done                              [2]
.skip4:
    CP        A,5                                [2]
    JR        NZ,.skip5                          [2]
    CALL      sub_21399E                         [4]
    JR        .done                              [2]
.skip5:
    CP        A,6                                [2]
    JR        NZ,.skip6                          [2]
    CALL      sub_2143C8                         [4]
    JR        .done                              [2]
.skip6:
    CP        A,7                                [2]
    JR        NZ,.skip7                          [2]
    CALL      sub_214401                         [4]
    JR        .done                              [2]
.skip7:
    CP        A,8                                [3]
    JR        NZ,.skip8                          [2]
    CALL      sub_21445B                         [4]
    JR        .done                              [2]
.skip8:
    CP        A,9                                [3]
    JR        NZ,.skip9                          [2]
    CALL      sub_214A92                         [4]
    JR        .done                              [2]
.skip9:
    CP        A,0xA                              [3]
    JR        NZ,.skip10                         [2]
    CALL      sub_214B9B                         [4]
    JR        .done                              [2]
.skip10:
    CP        A,0xB                              [3]
    JR        NZ,.skip11                         [2]
    CALL      sub_214BD2                         [4]
    JR        .done                              [2]
.skip11:
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,(0x5FF9)                         [4]
    LD        (0x5FF8),A                         [4]
    CALL      EndTask                            [4]
    JR        .done                              [2]
.done:
    RET                                          [1]

.org 0x213197

swp_213197:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        XHL,0x9800                         [5]
    LD        WA,0xC                             [3]
    ADD       WA,0                               [4]
    CALL      swp_216C1F                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2B),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2131CC

swp_2131CC:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        XHL,0x9800                         [5]
    LD        WA,0xC                             [3]
    ADD       WA,0                               [4]
    CALL      swp_216CAA                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2B),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2131EA

sub_2131EA:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        WA,0xC                             [3]
    ADD       WA,0                               [4]
    LD        BC,0                               [2]
    LD        C,(XIZ+0x2B)                       [3]
    CALL      sub_216D00                         [4]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213326

sub_213326:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        A,(XIZ+0xE)                        [3]
    CP        A,3                                [2]
    JR        Z,.skip                            [2]
    LD        W,0xFF                             [2]
    JRL       .skip15                            [3]
.skip:
    CALL      swp_216A94                         [4]
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    CALL      swp_216A4E                         [4]
    CP        A,0                                [2]
    JRL       Z,.skip14                          [3]
.skip2:
    CALL      GetStoryStage                      [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x249B66                       [5]
    ADD       XHL,XWA                            [2]
    LD        C,(XHL)                            [2]
    CP        C,0                                [2]
    JR        Z,.skip4                           [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x249B8C                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        B,1                                [2]
.loop:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    LD        L,(XHL)                            [2]
    EXTZ      HL                                 [2]
    CALL      CheckEventFlag                     [4]
    POP       BC                                 [1]
    AND       B,L                                [2]
    POP       XHL                                [1]
    INC       1,XHL                              [2]
    DJNZ      C,.loop                            [3]
    CP        B,1                                [2]
    JR        Z,.skip4                           [2]
    CALL      swp_216A6A                         [4]
    CP        A,1                                [2]
    JR        Z,.skip3                           [2]
    LD        W,0x3F                             [2]
    JRL       .skip15                            [3]
.skip3:
    LD        W,0x40                             [2]
    JR        .skip15                            [2]
.skip4:
    CALL      GetStageArenaRank                  [4]
    CP        A,9                                [3]
    JR        Z,.skip5                           [2]
    CALL      swp_216A94                         [4]
    CP        A,1                                [2]
    JR        Z,.skip13                          [2]
    CALL      swp_216A86                         [4]
    CP        A,1                                [2]
    JR        Z,.skip11                          [2]
    CALL      GetStageArenaRank                  [4]
    CP        A,8                                [3]
    JR        Z,.skip9                           [2]
    CALL      GetStageArenaRank                  [4]
    CP        A,0                                [2]
    JR        Z,.skip7                           [2]
    CP        A,2                                [2]
    JR        NC,.skip5                          [2]
    CALL      swp_216A4E                         [4]
    CP        A,0                                [2]
    JR        Z,.skip6                           [2]
.skip5:
    LD        W,0                                [2]
    JR        .skip15                            [2]
.skip6:
    LD        W,0xF                              [2]
    JR        .skip15                            [2]
.skip7:
    CALL      swp_216A4E                         [4]
    CP        A,0                                [2]
    JR        Z,.skip8                           [2]
    LD        W,0xE                              [2]
    JR        .skip15                            [2]
.skip8:
    LD        W,0xD                              [2]
    JR        .skip15                            [2]
.skip9:
    CALL      swp_216A4E                         [4]
    CP        A,0                                [2]
    JR        Z,.skip10                          [2]
    LD        W,0x38                             [2]
    JR        .skip15                            [2]
.skip10:
    LD        W,0x38                             [2]
    JR        .skip15                            [2]
.skip11:
    CALL      swp_216A4E                         [4]
    CP        A,0                                [2]
    JR        Z,.skip12                          [2]
    LD        W,5                                [2]
    JR        .skip15                            [2]
.skip12:
    LD        W,0x39                             [2]
    JR        .skip15                            [2]
.skip13:
    CALL      swp_216A4E                         [4]
    CP        A,0                                [2]
    JR        Z,.skip14                          [2]
    LD        W,0                                [2]
    JR        .skip15                            [2]
.skip14:
    LD        W,0x3B                             [2]
    JR        .skip15                            [2]
.skip15:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213567

swp_213567:
    JRL       loc_2135F5                         [3]

.org 0x213575

loc_213575:
    LD        (XIZ+0x17),A                       [3]
    CALR      swp_213903                         [3]
    LD        A,5                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        loc_2135FF                         [2]

.org 0x213582

loc_213582:
    CALR      swp_213BE1                         [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        loc_2135FF                         [2]

.org 0x21358C

loc_21358C:
    LD        A,1                                [2]
    LD        (XIZ+0x12),A                       [3]
    JR        loc_2135FF                         [2]

.org 0x213593

loc_213593:
    LD        A,7                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        loc_2135FF                         [2]

.org 0x21359A

loc_21359A:
    CALL      dyn_2166DC                         [4]
    CALR      sub_21320D                         [3]
    LD        A,2                                [2]
    LD        (XIZ+0x2A),A                       [3]
    LD        A,9                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        loc_2135FF                         [2]

.org 0x2135B4

loc_2135B4:
    CALR      swp_214AF6                         [3]
    JR        loc_2135FF                         [2]

.org 0x2135B9

loc_2135B9:
    LD        A,0xB                              [2]
    LD        (XIZ+0xE),A                        [3]
    JR        loc_2135FF                         [2]

.org 0x2135C0

loc_2135C0:
    LD        (XIZ+0x12),A                       [3]
    JR        loc_2135FF                         [2]

.org 0x21368D

sub_21368D:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        C,(XIZ+0x23)                       [3]
    CP        C,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        B,(XIZ+0x24)                       [3]
    DEC       1,B                                [2]
    LD        (XIZ+0x24),B                       [3]
    JRL       NZ,.skip8                          [3]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+0x10),C                       [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
.skip:
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        XHL,(XWA+8)                        [3]
    CP{2}     XHL,0                              [6]
    JR        Z,.skip4                           [2]
    LD        C,(XWA+0x12)                       [3]
    AND       C,0x7F                             [3]
    CP        C,2                                [2]
    JR        NZ,.skip2                          [2]
    LD        A,1                                [2]
    LD        (XIZ+0x26),A                       [3]
.skip2:
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON|B_BUTTON                [3]
    JRL       Z,.skip8                           [3]
    LD        A,(XIZ+0x26)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    LD        A,0                                [2]
    LD        (XIZ+0x26),A                       [3]
    JR        .skip8                             [2]
.skip3:
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        C,(XWA+0x10)                       [3]
    LD        (XIZ+0x23),C                       [3]
    INC       1,C                                [2]
    LD        (XIZ+0x24),C                       [3]
    LD        C,0                                [2]
    LD        (XWA+0x10),C                       [3]
    JR        .skip8                             [2]
.skip4:
    LD        A,(XIZ+0x25)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip5                           [2]
    LD        A,1                                [2]
    LD        (XIZ+0x25),A                       [3]
    CALR      ArenaRankWon                       [3]
    JR        .skip8                             [2]
.skip5:
    LD        A,(XIZ+0x12)                       [3]
    CP        A,0xFF                             [3]
    JR        NZ,.skip6                          [2]
    CALR      sub_213326                         [3]
    LD        (XIZ+0x12),W                       [3]
.skip6:
    CALR      sub_2132D2                         [3]
    LD        A,(XIZ+0x12)                       [3]
    CP        A,0x3A                             [3]
    JR        NZ,.skip7                          [2]
    LD        XHL,0x249B5F                       [5]
    LD        A,3                                [2]
    CALL      dyn_2076F3                         [4]
    LD        HL,0x34                            [3]
    CALR      sub_213222                         [3]
.skip7:
    LD        A,(XIZ+0x12)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x24DF5D                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x26),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0x25),A                       [3]
.skip8:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213768

sub_213768:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0xF)                        [3]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        .skip8                             [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    LD        A,0                                [2]
    CP        A,1                                [2]
    JR        Z,.skip8                           [2]
    CALR      sub_213201                         [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        .skip8                             [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_21368D                         [3]
    JR        .skip8                             [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_21323D                         [3]
    CALL      swp_216830                         [4]
    LD        A,(XIZ+0x11)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,0xC                              [2]
    LD        (XIZ+0xE),A                        [3]
.skip4:
    JR        .skip8                             [2]
.skip5:
    CP        A,5                                [2]
    JR        NZ,.skip6                          [2]
    CALR      sub_2131EA                         [3]
    CP        A,1                                [2]
    JR        Z,.skip8                           [2]
    CALR      sub_213201                         [3]
    CALR      swp_213197                         [3]
    LD        A,6                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        .skip8                             [2]
.skip6:
    CP        A,6                                [2]
    JR        NZ,.skip7                          [2]
    CALR      sub_2131B5                         [3]
    CP        A,1                                [2]
    JR        Z,.skip8                           [2]
    CALR      sub_213201                         [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        .skip8                             [2]
.skip7:
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
.skip8:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213903

swp_213903:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      swp_216732                         [4]
    CALL      GetStageArenaRank                  [4]
    CP        A,1                                [2]
    JR        NC,.skip                           [2]
.skip:
    CP        A,9                                [3]
    JR        Z,.skip2                           [2]
    INC       1,A                                [2]
.skip2:
    SUB       A,2                                [3]
    LD        (XIZ+0x14),A                       [3]
    LD        XDE,0x249C0F                       [5]
    LD        C,A                                [2]
    INC       1,C                                [2]
.loop:
    LD        XHL,(XDE)                          [2]
    LD        A,2                                [2]
    PUSH      XDE                                [1]
    PUSH      C                                  [2]
    CALL      dyn_2076F3                         [4]
    POP       C                                  [2]
    POP       XDE                                [1]
    INC       4,XDE                              [2]
    DJNZ      C,.loop                            [3]
    LD        E,8                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        A,2                                [2]
    LD        XHL,0x249C09                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,(XIZ+0x17)                       [3]
    CP        A,0xF3                             [3]
    JR        Z,.skip3                           [2]
    LD        A,(XIZ+0x14)                       [3]
    LD        (XIZ+0x10),A                       [3]
.skip3:
    CALL      dyn_2166EB                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CALR      sub_213972                         [3]
    CALL      sub_2168AC                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213972

sub_213972:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    PUSH      A                                  [1]
    LD        XHL,0x249C83                       [5]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    POP       A                                  [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x249C63                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213B11

swp_213B11:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      swp_216841                         [4]
    LD        HL,WA                              [2]
    LD        A,4                                [2]
    LD        C,8                                [2]
    LD        E,6                                [2]
    CALL      dyn_207494                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213BE1

swp_213BE1:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_21676A                         [4]
    CALL      dyn_2167B1                         [4]
    CALL      swp_2166FA                         [4]
    CALL      swp_216732                         [4]
    CALL      swp_216710                         [4]
    CALL      dyn_2166EB                         [4]
    LD        E,1                                [2]
    LD        C,5                                [2]
    LD        A,1                                [2]
    CALL      sub_20768A                         [4]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    SLL       2,XWA                              [3]
    LD        XHL,0x249C0F                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    CALR      sub_213C2E                         [3]
    CALR      swp_213B11                         [3]
    LD        A,2                                [2]
    LD        (XIZ+0x2A),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213C2E

sub_213C2E:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x15)                       [3]
    SUB       A,2                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x249CF6                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    LD        (XIZ+0x16),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x1E),A                       [3]
    LD        A,(XIZ+0x15)                       [3]
    SUB       A,2                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x249D2E                       [5]
    ADD       XHL,XWA                            [2]
    LD        XDE,(XHL)                          [2]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x18                           [6]
    LD        C,6                                [2]
.loop:
    LD        A,(XDE)                            [2]
    CP        A,0xFF                             [3]
    JR        NZ,.skip2                          [2]
    PUSH      XDE                                [1]
.loop2:
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV{1}    WA,0xF                             [3]
    LD        A,W                                [2]
    ADD       A,0x62                             [3]
    LD        B,6                                [2]
    SUB       B,C                                [2]
    JR        Z,.skip                            [2]
    LD{1}     XDE,XHL                            [2]
.loop3:
    DEC       1,XDE                              [2]
    LD        W,(XDE)                            [2]
    CP        A,W                                [2]
    JR        Z,.loop2                           [2]
    DJNZ      B,.loop3                           [3]
.skip:
    POP       XDE                                [1]
.skip2:
    LD        (XHL),A                            [2]
    INC       1,XHL                              [2]
    INC       1,XDE                              [2]
    DJNZ      C,.loop                            [3]
    LD        W,(XIZ+0x15)                       [3]
    CP        W,8                                [3]
    JRL       NC,.skip5                          [3]
    LD        A,7                                [2]
    SUB       A,W                                [2]
    LD        (XIZ+0x1E),A                       [3]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x18                           [6]
    LD        XDE,0x60CC                         [5]
    LD        C,6                                [2]
.loop4:
    PUSH      XHL                                [1]
    LD        A,(XHL)                            [2]
    SUB       A,0x62                             [3]
    JRL       C,.skip3                           [3]
    CP        A,0xF                              [3]
    JRL       NC,.skip3                          [3]
    LD        (XIZ+0x1F),A                       [3]
    LD        W,0                                [2]
    DIV{1}    WA,3                               [3]
    LD        (XIZ+0x20),A                       [3]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    LD        XHL,0x249D54                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    LD        (XDE),A                            [2]
    INC       1,XDE                              [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    LD        XHL,0x249D4E                       [5]
    ADD       XHL,XWA                            [2]
    LD        B,(XHL)                            [2]
    LD        WA,0                               [2]
    LD        A,(XIZ+0x20)                       [3]
    MUL{1}    WA,3                               [3]
    ADD       A,B                                [2]
    LD        (XDE),A                            [2]
    INC       1,XDE                              [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    LD        XHL,0x249E1A                       [5]
    ADD       XHL,XWA                            [2]
    LD        B,(XHL)                            [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV       WA,B                               [2]
    LD        B,W                                [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    MUL       XWA,0xF                            [4]
    LD        XHL,0x249E20                       [5]
    ADD       XHL,XWA                            [2]
    LD        XWA,0                              [2]
    LD{1}     A,B                                [2]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    SUB       A,1                                [3]
    ADD       A,1                                [3]
    LD        (XDE),A                            [2]
    INC       1,XDE                              [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    LD        XHL,0x249E1A                       [5]
    ADD       XHL,XWA                            [2]
    LD        B,(XHL)                            [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV       WA,B                               [2]
    LD        B,W                                [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    MUL       XWA,0xF                            [4]
    LD        XHL,0x249E20                       [5]
    ADD       XHL,XWA                            [2]
    LD        XWA,0                              [2]
    LD{1}     A,B                                [2]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    SUB       A,1                                [3]
    ADD       A,1                                [3]
    LD        (XDE),A                            [2]
    INC       1,XDE                              [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    LD        XHL,0x249D5A                       [5]
    ADD       XHL,XWA                            [2]
    LD        B,(XHL)                            [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV       WA,B                               [2]
    LD        B,W                                [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    MUL       XWA,5                              [4]
    LD        XHL,0                              [2]
    LD        L,(XIZ+0x20)                       [3]
    ADD       XWA,XHL                            [2]
    MUL       XWA,3                              [4]
    LD        XHL,0x249D60                       [5]
    ADD       XHL,XWA                            [2]
    LD        XWA,0                              [2]
    LD{1}     A,B                                [2]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    SUB       A,1                                [3]
    ADD       A,1                                [3]
    LD        (XDE),A                            [2]
    INC       1,XDE                              [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    LD        XHL,0x249DBA                       [5]
    ADD       XHL,XWA                            [2]
    LD        B,(XHL)                            [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV       WA,B                               [2]
    LD        B,W                                [2]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x1E)                       [3]
    MUL       XWA,5                              [4]
    LD        XHL,0                              [2]
    LD        L,(XIZ+0x20)                       [3]
    ADD       XWA,XHL                            [2]
    MUL       XWA,3                              [4]
    LD        XHL,0x249DC0                       [5]
    ADD       XHL,XWA                            [2]
    LD        XWA,0                              [2]
    LD{1}     A,B                                [2]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    SUB       A,1                                [3]
    ADD       A,1                                [3]
    LD        (XDE),A                            [2]
    INC       1,XDE                              [2]
    JR        .skip4                             [2]
.skip3:
    INC       6,XDE                              [2]
.skip4:
    POP       XHL                                [1]
    INC       1,XHL                              [2]
    DEC       1,C                                [2]
    JRL       NZ,.loop4                          [3]
.skip5:
    CALR      sub_213E19                         [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x213E19

sub_213E19:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        (XIZ+0x1E),A                       [3]
    LD        (XIZ+0x1F),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x20),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x21),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214239

swp_214239:
    JRL       0x2142EA                           [3]

.org 0x214255

swp_214255:
    JRL       0x2142EA                           [3]

.org 0x214401

sub_214401:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(0x585B)                         [4]
    SUB       A,0x10                             [3]
    BIT       7,A                                [3]
    JR        Z,.skip                            [2]
    LD        (0x585B),A                         [4]
    JR        .skip2                             [2]
.skip:
    CALR      sub_21320D                         [3]
    LD        XWA,4                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x10                            [3]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    LD        HL,0x2B                            [3]
    CALL      DrawPortrait                       [4]
    LD        WA,0xCE                            [3]
    LD        BC,0xA                             [3]
    LD        DE,0x20                            [3]
    LD        HL,0x2A                            [3]
    CALL      DrawPortrait                       [4]
    LD        A,0                                [2]
    LD        (XIZ+0x1E),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21445B

sub_21445B:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    CALR      sub_2144F7                         [3]
    JRL       .skip7                             [3]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    CALR      sub_2144F7                         [3]
    JR        .skip7                             [2]
.skip2:
    LD        A,(XIZ+0x2C)                       [3]
    BIT       0,A                                [3]
    JR        NZ,.skip3                          [2]
    LD        W,(XIZ+0x1E)                       [3]
    LD        A,(0x584B)                         [4]
    ADD       A,W                                [2]
    LD        (0x584B),A                         [4]
    LD        A,(0x5853)                         [4]
    SUB       A,W                                [2]
    LD        (0x5853),A                         [4]
    LD        A,(XIZ+0x2C)                       [3]
    CP        A,0x14                             [3]
    JR        C,.skip3                           [2]
    LD        (0x585B),A                         [4]
.skip3:
    LD        A,(XIZ+0x2C)                       [3]
    CP        A,0x14                             [3]
    JR        NZ,.skip4                          [2]
    LD        A,1                                [2]
    LD        (XIZ+0x1E),A                       [3]
    LD        XWA,0                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x84                            [3]
    CALL      SoundCommand                       [4]
    JR        .skip6                             [2]
.skip4:
    CP        A,0x3C                             [3]
    JR        NZ,.skip5                          [2]
    LD        A,1                                [2]
    LD        (XIZ+0x1E),A                       [3]
    JR        .skip6                             [2]
.skip5:
    CP        A,0x5A                             [3]
    JR        NZ,.skip6                          [2]
    LD        A,1                                [2]
    LD        (XIZ+0x1E),A                       [3]
    JR        .skip6                             [2]
.skip6:
    LD        A,(XIZ+0x2C)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,(XIZ+0x2C)                       [3]
    CP        A,0x7F                             [3]
    JR        NZ,.skip7                          [2]
    CALR      sub_2144F7                         [3]
.skip7:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2144F7

sub_2144F7:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        (XIZ+0x1E),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x1F),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0x2A),A                       [3]
    CALR      sub_21320D                         [3]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    LD        A,0                                [2]
    LD        (0x584B),A                         [4]
    LD        (0x5853),A                         [4]
    LD        XWA,4                              [2]
    CALL      PlayMusic                          [4]
    LD        A,9                                [2]
    LD        (XIZ+0xE),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21455F

swp_21455F:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        BC,0x14                            [3]
    LD        A,(XHL+0)                          [3]
    EXTZ      WA                                 [2]
    SUB       BC,WA                              [2]
    SRA       1,BC                               [3]
    LD        DE,0x13                            [3]
    LD        A,(XHL+1)                          [3]
    EXTZ      WA                                 [2]
    SUB       DE,WA                              [2]
    SRA       1,DE                               [3]
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214616

sub_214616:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x1E)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,0xA                            [4]
    LD        XHL,0x2C8992                       [5]
    ADD       XHL,XWA                            [2]
    CALL      dyn_216845                         [4]
    CALL      dyn_2069C8                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214639

sub_214639:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x1E)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,0xA                            [4]
    LD        XHL,0x2C89CE                       [5]
    ADD       XHL,XWA                            [2]
    CALL      dyn_216845                         [4]
    CALL      dyn_2069C8                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21465C

sub_21465C:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(wColorFlags)                    [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CALR      sub_214616                         [3]
    JR        .skip2                             [2]
.skip:
    CALR      sub_214639                         [3]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21478C

sub_21478C:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    SRL       3,A                                [3]
    DEC       2,A                                [2]
    CP        A,1                                [2]
    JR        C,.skip                            [2]
    CP        A,0x13                             [3]
    JR        NC,.skip                           [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    LD        XDE,7                              [2]
    MUL       XDE,0x40                           [4]
    ADD       XDE,XWA                            [2]
    LD        XWA,0x9000                         [5]
    ADD       XDE,XWA                            [2]
    LD        WA,0                               [2]
    LD        C,5                                [2]
.loop:
    LD        (XDE),WA                           [2]
    ADD       XDE,0x40                           [6]
    DJNZ      C,.loop                            [3]
.skip:
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    LD        (0x584B),A                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2147DA

sub_2147DA:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x2C)                       [3]
    SRL       3,A                                [3]
    INC       2,A                                [2]
    CP        A,5                                [2]
    JR        C,.skip                            [2]
    CP        A,0xF                              [3]
    JR        NC,.skip                           [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    LD        XDE,8                              [5]
    MUL       XDE,0x40                           [4]
    ADD       XDE,XWA                            [2]
    LD        XWA,0x9800                         [5]
    ADD       XDE,XWA                            [2]
    LD        WA,0                               [2]
    LD        C,3                                [2]
.loop:
    LD        (XDE),WA                           [2]
    ADD       XDE,0x40                           [6]
    DJNZ      C,.loop                            [3]
.skip:
    LD        A,0x98                             [2]
    LD        W,(XIZ+0x2C)                       [3]
    SUB       A,W                                [2]
    NEG       A                                  [2]
    LD        (0x5853),A                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2148ED

sub_2148ED:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      sub_21478C                         [3]
    CALR      sub_2147DA                         [3]
    LD        BC,0x48                            [3]
    LD        DE,0xFFEC                          [3]
    LD        A,(XIZ+0x2C)                       [3]
    EXTZ      WA                                 [2]
    SRL       1,WA                               [3]
    ADD       DE,WA                              [2]
    CALR      sub_21465C                         [3]
    LD        A,(XIZ+0x2C)                       [3]
    DEC       8,A                                [2]
    LD        (XIZ+0x2C),A                       [3]
    CP        A,0x98                             [3]
    JR        C,.skip3                           [2]
    JR        Z,.skip3                           [2]
    CALR      sub_21320D                         [3]
    LD        A,0                                [2]
    LD        (0x584B),A                         [4]
    LD        (0x5853),A                         [4]
    LD        (0x5855),A                         [4]
    LD        E,(XIZ+0x1E)                       [3]
    EXTZ      DE                                 [2]
    EXTZ      XDE                                [2]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x18                           [6]
    ADD       XHL,XDE                            [2]
    LD        A,(XHL)                            [2]
    CP        A,0x62                             [3]
    JR        C,.skip                            [2]
    CP        A,0x71                             [3]
    JR        NC,.skip                           [2]
    LD        XHL,0x60CC                         [5]
    MUL       XDE,6                              [4]
    ADD       XHL,XDE                            [2]
    JR        .skip2                             [2]
.skip:
    LD        XHL,0                              [2]
.skip2:
    LD        W,(XIZ+0x15)                       [3]
    SUB       W,2                                [3]
    INC       1,W                                [2]
    LD        (wAreaLevel),W                     [4]
    CALL      LoadEnemy                          [4]
    LDB       (0x5DDA),0                         [5]
    CALL      swp_207C00                         [4]
    LD        A,6                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip3:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214979

sub_214979:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(0x5DD9)                         [4]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        A,7                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214990

sub_214990:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(0x5DD9)                         [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    CP        A,1                                [2]
    JR        Z,.skip                            [2]
    CALR      sub_214A33                         [3]
    JR        .skip4                             [2]
.skip:
    LD        A,(XIZ+0x1E)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x1E),A                       [3]
    LD        W,(XIZ+0x16)                       [3]
    CP        A,W                                [2]
    JR        C,.skip2                           [2]
    CALR      sub_2149DC                         [3]
    JR        .skip4                             [2]
.skip2:
    CP        A,5                                [2]
    JR        NZ,.skip3                          [2]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,8                                [3]
    JR        NZ,.skip3                          [2]
    CALL      GetStageArenaRank                  [4]
    CP        A,7                                [2]
    JR        NZ,.skip3                          [2]
    LD        A,1                                [2]
    LD        (XIZ+0x1F),A                       [3]
.skip3:
    LD        A,2                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip4:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214A33

sub_214A33:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x1E)                       [3]
    CP        A,5                                [2]
    JR        NZ,.skip                           [2]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,8                                [3]
    JR        NZ,.skip                           [2]
    CALL      GetStageArenaRank                  [4]
    CP        A,7                                [2]
    JR        NZ,.skip                           [2]
    CALL      dyn_2166B3                         [4]
    CALL      dyn_2166C9                         [4]
    LD        A,0x42                             [2]
    LD        (XIZ+0x12),A                       [3]
    PUSH      XWA                                [1]
    LD        XWA,0                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x20                            [3]
    CALL      SoundCommand                       [4]
    POP       XWA                                [1]
    LD        A,3                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        .skip2                             [2]
.skip:
    CALL      sub_21360F                         [4]
    LD        A,4                                [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,9                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214A84

sub_214A84:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,3                                [2]
    LD        (XIZ+0xE),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214A92

sub_214A92:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x2A)                       [3]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    LD        A,3                                [2]
    LD        (XIZ+0x2A),A                       [3]
    JR        .skip9                             [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_214829                         [3]
    JR        .skip9                             [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_214859                         [3]
    JR        .skip9                             [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_2148C4                         [3]
    JR        .skip9                             [2]
.skip4:
    CP        A,5                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_2148ED                         [3]
    JR        .skip9                             [2]
.skip5:
    CP        A,6                                [2]
    JR        NZ,.skip6                          [2]
    CALR      sub_214979                         [3]
    JR        .skip9                             [2]
.skip6:
    CP        A,7                                [2]
    JR        NZ,.skip7                          [2]
    CALR      sub_214990                         [3]
    JR        .skip9                             [2]
.skip7:
    CP        A,9                                [3]
    JR        NZ,.skip8                          [2]
    CALR      sub_214A84                         [3]
    JR        .skip9                             [2]
.skip8:
    LD        A,1                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip9:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214AF6

swp_214AF6:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    LD        A,2                                [2]
    LD        (XIZ+0x2A),A                       [3]
    LD        A,0xA                              [2]
    LD        (XIZ+0xE),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214B0F

sub_214B0F:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,4                                [2]
    CALL      dyn_216E67                         [4]
    CP        A,1                                [2]
    JR        Z,.skip                            [2]
    CALL      dyn_216EDE                         [4]
    CALL      dyn_216F8E                         [4]
    CALL      dyn_216E31                         [4]
    CALL      dyn_2167F9                         [4]
    CALR      sub_21323D                         [3]
    LD        XHL,swp_210467                     [5]
    CALL      sub_2062F5                         [4]
    LD        A,3                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214B43

sub_214B43:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(0x5FF9)                         [4]
    CP        A,0xFF                             [3]
    JR        Z,.skip2                           [2]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    LD        A,0xC                              [2]
    LD        (XIZ+0xE),A                        [3]
    JR        .skip2                             [2]
.skip:
    CALL      dyn_216E3A                         [4]
    CALL      dyn_206803                         [4]
    CALL      sub_21360F                         [4]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,6                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALR      sub_2132D2                         [3]
    LD        A,0xA                              [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,4                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214B83

sub_214B83:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,4                                [2]
    CALL      dyn_216E43                         [4]
    CP        A,1                                [2]
    JR        Z,.skip                            [2]
    LD        A,3                                [2]
    LD        (XIZ+0xE),A                        [3]
.skip:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214B9B

sub_214B9B:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x2A)                       [3]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    LD        A,2                                [2]
    LD        (XIZ+0x2A),A                       [3]
    JR        .skip5                             [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_214B0F                         [3]
    JR        .skip5                             [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_214B43                         [3]
    JR        .skip5                             [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_214B83                         [3]
    JR        .skip5                             [2]
.skip4:
    LD        A,1                                [2]
    LD        (XIZ+0x2A),A                       [3]
.skip5:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214BD2

sub_214BD2:
    LD        A,1                                [2]
    CALL      dyn_216E67                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    CALL      dyn_2166DC                         [4]
    LD        A,6                                [2]
    LD        (0x5FF9),A                         [4]
    LD        A,0xC                              [2]
    LD        (XIZ+0xE),A                        [3]
.done:
    RET                                          [1]

.org 0x214BEC

swp_214BEC:
    CALL      dyn_206803                         [4]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        XWA,dyn_214C97                     [5]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]

.org 0x214C0E

dyn_214C0E:
    CALL      GetStoryStage                      [4]
    CP        A,0                                [2]
    JR        NZ,dyn_214C30                      [2]
    LD        HL,0x4E                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,dyn_214C30                       [2]
    CALL      dyn_206803                         [4]
    CALL      dyn_206825                         [4]
    LD        A,7                                [2]
    LD        (XIZ+0x15),A                       [3]
    JR        0x214C62                           [2]

.org 0x214C30

dyn_214C30:
    CALL      GetStoryStage                      [4]
    CP        A,0xA                              [3]
    JR        NZ,dyn_214C53                      [2]
    LD        HL,0x4E                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,dyn_214C53                       [2]
    CALL      dyn_206803                         [4]
    CALL      dyn_206825                         [4]
    LD        A,8                                [2]
    LD        (XIZ+0x15),A                       [3]
    JR        0x214C62                           [2]

.org 0x214C53

dyn_214C53:
    CALL      dyn_206803                         [4]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        A,5                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        XWA,dyn_214C97                     [5]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]

.org 0x214C75

swp_214C75:
    CALL      dyn_206803                         [4]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        XWA,dyn_214C97                     [5]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]

.org 0x214C97

dyn_214C97:
    LD        A,(XIZ+0xE)                        [3]
    CP        A,0xC                              [3]
    JR        Z,dyn_214D10                       [2]
    CP        A,1                                [2]
    JR        NZ,0x214CA8                        [2]
    LD        A,2                                [2]
    LD        (XIZ+0xE),A                        [3]
    CP        A,2                                [2]
    JR        NZ,dyn_214CB2                      [2]
    CALL      sub_214E33                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CB2

dyn_214CB2:
    CP        A,3                                [2]
    JR        NZ,dyn_214CBC                      [2]
    CALL      sub_214E5D                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CBC

dyn_214CBC:
    CP        A,4                                [2]
    JR        NZ,dyn_214CC6                      [2]
    CALL      sub_215054                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CC6

dyn_214CC6:
    CP        A,5                                [2]
    JR        NZ,dyn_214CD0                      [2]
    CALL      dyn_215760                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CD0

dyn_214CD0:
    CP        A,6                                [2]
    JR        NZ,.skip                           [2]
    CALL      dyn_215924                         [4]
    JR        dyn_214D22                         [2]
.skip:
    CP        A,7                                [2]
    JR        NZ,.skip2                          [2]
    CALL      sub_215EDC                         [4]
    JR        dyn_214D22                         [2]
.skip2:
    CP        A,8                                [3]
    JR        NZ,.skip3                          [2]
    CALL      sub_216208                         [4]
    JR        dyn_214D22                         [2]
.skip3:
    CP        A,9                                [3]
    JR        NZ,.skip4                          [2]
    CALL      sub_21634F                         [4]
    JR        dyn_214D22                         [2]
.skip4:
    CP        A,0xA                              [3]
    JR        NZ,.skip5                          [2]
    CALL      sub_216619                         [4]
    JR        dyn_214D22                         [2]
.skip5:
    CP        A,0xB                              [3]
    JR        NZ,dyn_214D10                      [2]
    CALL      sub_216649                         [4]
    JR        dyn_214D22                         [2]

.org 0x214D10

dyn_214D10:
    LD        A,1                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,(XIZ+0x11)                       [3]
    LD        (0x60F0),A                         [4]
    CALL      EndTask                            [4]
    JR        dyn_214D22                         [2]

.org 0x214D22

dyn_214D22:
    RET                                          [1]

.org 0x214D23

dyn_214D23:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x15)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    PUSH      XWA                                [1]
    CALL      dyn_206803                         [4]
    POP       XWA                                [1]
    PUSH      XWA                                [1]
    LD        XHL,0x249EC7                       [5]
    ADD       XHL,XWA                            [2]
    LD        L,(XHL)                            [2]
    EXTZ      HL                                 [2]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    POP       XWA                                [1]
    SLL       2,XWA                              [3]
    LD        XHL,0x249EAB                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,3                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214D64

sub_214D64:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        C,0                                [2]
    LD        E,8                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249ECE                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214D82

sub_214D82:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    CALL      dyn_207611                         [4]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214D97

dyn_214D97:
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    PUSH      A                                  [1]
    LD        A,W                                [2]
    DEC       1,A                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x24A250                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       A                                  [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,8                              [4]
    ADD       XHL,XWA                            [2]
    JR        0x214DC6                           [2]
.skip:
    LD        XHL,0x24A248                       [5]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    RET                                          [1]

.org 0x214E33

sub_214E33:
    CALL      dyn_2167CF                         [4]
    CALR      SquarePlaceMenu                    [3]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_2167E4                         [4]
    CALL      dyn_216EDE                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216F6B                         [4]
    LD        XWA,1                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x21                            [3]
    CALL      SoundCommand                       [4]
    RET                                          [1]

.org 0x214E5D

sub_214E5D:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_214F0F                         [3]
    JRL       .done                              [3]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALR      sub_214F0F                         [3]
    JRL       .done                              [3]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip9                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    CP        A,8                                [3]
    JR        Z,.skip4                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip3:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip4:
    LD        A,3                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip5:
    CP        A,2                                [2]
    JR        NZ,.skip8                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip6                           [2]
    CP        A,3                                [2]
    JR        Z,.skip7                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip6:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip7:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip8:
    JR        .skip9                             [2]
.skip9:
    LD        BC,0x60                            [3]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
.done:
    RET                                          [1]

.org 0x214F0F

sub_214F0F:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        NZ,.skip                           [2]
    CALR      sub_214D82                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,0xC                              [2]
    LD        (XIZ+0xE),A                        [3]
    JR        .skip2                             [2]
.skip:
    ADD       A,1                                [3]
    LD        (XIZ+0x15),A                       [3]
    CALR      sub_214D82                         [3]
    CALR      sub_215031                         [3]
    JR        .skip2                             [2]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214F3D

sub_214F3D:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x1E                           [6]
    LD{1}     XDE,XHL                            [2]
    LD        A,0xFF                             [2]
    LD        C,4                                [2]
.loop:
    LD        (XHL),A                            [2]
    INC       1,XHL                              [2]
    DJNZ      C,.loop                            [3]
    LD        A,0                                [2]
    LD        (XIZ+0x1A),A                       [3]
    LD        A,(XIZ+0x15)                       [3]
    SUB       A,1                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A304                       [5]
    ADD       XHL,XWA                            [2]
    LD        C,(XHL)                            [2]
    EXTZ      BC                                 [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x24A2F4                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    CALL      GetStoryStage                      [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,BC                             [2]
    ADD       XHL,XWA                            [2]
    LD        A,0                                [2]
.loop2:
    LD        W,(XHL)                            [2]
    CP        W,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        (XDE),W                            [2]
    INC       1,XHL                              [2]
    INC       1,XDE                              [2]
    INC       1,A                                [2]
    DJNZ      C,.loop2                           [3]
.skip:
    LD        (XIZ+0x1A),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214FA4

sub_214FA4:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      sub_216779                         [4]
    CALR      sub_214F3D                         [3]
    LD        C,(XIZ+0x1A)                       [3]
    CP        C,0                                [2]
    JR        Z,.skip                            [2]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x1E                           [6]
    LD{1}     XDE,XHL                            [2]
    LD        W,(XIZ+0x15)                       [3]
.loop:
    PUSH      XDE                                [1]
    PUSH      C                                  [2]
    PUSH      W                                  [2]
    LD        A,(XDE)                            [2]
    CALR      dyn_214D97                         [3]
    LD        A,(XHL+0)                          [3]
    SUB       A,0x15                             [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x249F66                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        XHL,0x249FA1                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       W                                  [2]
    POP       C                                  [2]
    POP       XDE                                [1]
    INC       1,XDE                              [2]
    DJNZ      C,.loop                            [3]
.skip:
    CALR      sub_214D64                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,TalkWithWhoText                [5]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,4                                [2]
    LD        (XIZ+0xE),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215031

sub_215031:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      sub_214FA4                         [3]
    CALR      dyn_214D23                         [3]
    LD        A,(XIZ+0x1A)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    LD        A,8                                [2]
    JR        .skip2                             [2]
.skip:
    LD        A,0                                [2]
.skip2:
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_216FB1                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215054

sub_215054:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_215115                         [3]
    JRL       .done                              [3]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALR      sub_215115                         [3]
    JRL       .done                              [3]
.skip2:
    LD        W,(XIZ+0x1A)                       [3]
    CP        W,0                                [2]
    JR        Z,.skip8                           [2]
    AND       A,0xF                              [3]
    JR        Z,.skip9                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    CP        A,8                                [3]
    JR        Z,.skip4                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip3:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip4:
    LD        A,(XIZ+0x1A)                       [3]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip5:
    CP        A,2                                [2]
    JR        NZ,.skip8                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip6                           [2]
    LD        W,(XIZ+0x1A)                       [3]
    DEC       1,W                                [2]
    CP        A,W                                [2]
    JR        Z,.skip7                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip6:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip7:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip8:
    JR        .skip9                             [2]
.skip9:
    LD        BC,0x60                            [3]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
.done:
    RET                                          [1]

.org 0x215115

sub_215115:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        NZ,.skip                           [2]
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x15)                       [3]
    SUB       A,1                                [3]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x15),A                       [3]
    CALR      SquarePlaceMenu                    [3]
    JR        .skip2                             [2]
.skip:
    CALR      sub_214D82                         [3]
    CALL      sub_216779                         [4]
    CALR      dyn_215749                         [3]
    LD        A,(XIZ+0x10)                       [3]
    LD        (XIZ+0x1B),A                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x1E                           [6]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    LD        (XIZ+0x12),A                       [3]
    JR        .skip2                             [2]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215161

dyn_215161:
    PUSH      WA                                 [1]
    LD        W,(XIZ+0x15)                       [3]
    LD        A,(XIZ+0x12)                       [3]
    CALR      dyn_214D97                         [3]
    POP       WA                                 [1]
    RET                                          [1]

.org 0x21516D

dyn_21516D:
    PUSH      XHL                                [1]
    LD        XHL,0x9800                         [5]
    CALL      dyn_216BEE                         [4]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215179

dyn_215179:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      dyn_21516D                         [3]
    CP        HL,0                               [2]
    JR        Z,0x2151B3                         [2]
    CP        HL,0xFFFF                          [4]
    JR        Z,dyn_215193                       [2]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    ADD       E,0x20                             [3]
    JR        dyn_2151AB                         [2]

.org 0x215193

dyn_215193:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    XOR       A,1                                [3]
    EXTZ      WA                                 [2]
    LD        HL,1                               [2]
    ADD       HL,WA                              [2]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    ADD       E,0x20                             [3]
    JR        dyn_2151AB                         [2]

.org 0x2151AB

dyn_2151AB:
    CALL      dyn_216849                         [4]
    CALL      DrawPortraitAt                     [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2151B8

dyn_2151B8:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      dyn_215161                         [3]
    LD        A,(XHL+0)                          [3]
    LD        W,(XIZ+0x13)                       [3]
    CP        A,W                                [2]
    JR        Z,0x2151D3                         [2]
    LD        (XIZ+0x13),A                       [3]
    LD        L,A                                [2]
    EXTS      HL                                 [2]
    CALR      dyn_215179                         [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2151D8

; [code+play] talk to a town NPC (E = NPC; 8 Helmut -> HelmutSkillOffer); Colla, Cyrius, Lily screens
TownNpcTalk:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JRL       Z,0x215356                         [3]
    CP        A,6                                [2]
    JRL       Z,0x215356                         [3]
    CP        A,7                                [2]
    JRL       Z,0x215356                         [3]
    CP        A,8                                [3]
    JRL       Z,0x215356                         [3]
    LD        D,W                                [2]
    LD{1}     W,A                                [2]
    LD{1}     A,D                                [2]
    CALR      dyn_214D97                         [3]
    LD        A,(XHL+0)                          [3]
    SUB       A,0x15                             [3]
    LD        E,A                                [2]
    LD        HL,0x40                            [3]
    LD{1}     A,E                                [2]
    EXTZ      WA                                 [2]
    ADD       HL,WA                              [2]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip                            [2]
    LD{1}     W,D                                [2]
    JRL       0x215356                           [3]
.skip:
    CP        E,2                                [2]
    JR        Z,.skip2                           [2]
    CP        E,8                                [3]
    JR        Z,.skip6                           [2]
    CP        E,0xC                              [3]
    JR        Z,.skip7                           [2]
    CP        E,0xD                              [3]
    JRL       Z,.skip9                           [3]
    JRL       .skip10                            [3]
.skip2:
    LD{1}     W,D                                [2]
    CP        W,0x22                             [3]
    JRL       C,0x215356                         [3]
    CP        W,0x48                             [3]
    JRL       NC,0x215356                        [3]
    CALL      sub_216B19                         [4]
    CP        A,0                                [2]
    JRL       Z,.skip10                          [3]
    LD        HL,0x14                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip3                           [2]
    CALL      sub_216B19                         [4]
    CP        A,4                                [2]
    JR        Z,.skip4                           [2]
    JRL       .skip10                            [3]
.skip3:
    LD        W,0x12                             [2]
    JRL       0x215356                           [3]
.skip4:
    LD        HL,0x20                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip5                           [2]
    LD        A,0                                [2]
    LD        (XIZ+0x28),A                       [3]
    LD        W,0x13                             [2]
    JRL       0x215356                           [3]
.skip5:
    LD        A,1                                [2]
    LD        (XIZ+0x28),A                       [3]
    LD        W,0x1B                             [2]
    JRL       0x215356                           [3]
.skip6:
    LD        A,(XIZ+0x15)                       [3]
    CP        A,3                                [2]
    JR        Z,.skip10                          [2]
    LD{1}     W,D                                [2]
    CP        W,0x22                             [3]
    JRL       C,0x215356                         [3]
    CALR      HelmutSkillOffer                   [3]
    CP        A,0x14                             [3]
    JR        Z,.skip10                          [2]
    LD        (XIZ+0x29),A                       [3]
    LD        W,4                                [2]
    JRL       0x215356                           [3]
.skip7:
    LD{1}     W,D                                [2]
    CP        W,0x1B                             [3]
    JRL       NC,0x215356                        [3]
    CALL      GetStageArenaRank                  [4]
    CP        A,3                                [2]
    JR        C,.skip10                          [2]
    LD        HL,0x15                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        NZ,.skip8                          [2]
    LD        W,0x1B                             [2]
    JRL       0x215356                           [3]
.skip8:
    PUSH      W                                  [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV{1}    WA,0x64                            [3]
    LD        A,W                                [2]
    POP       W                                  [2]
    CP        A,0x3C                             [3]
    JR        NC,.skip10                         [2]
    LD        W,0x1C                             [2]
    JR        0x215356                           [2]
.skip9:
    LD{1}     W,D                                [2]
    CP        W,0x49                             [3]
    JR        NC,0x215356                        [2]
    JR        .skip10                            [2]
.skip10:
    LD        D,0                                [2]
    LD        HL,0x50                            [3]
    LD{1}     A,E                                [2]
    EXTZ      WA                                 [2]
    ADD       HL,WA                              [2]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        NZ,.skip11                         [2]
    INC       1,D                                [2]
.skip11:
    LD        HL,0xA                             [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip12                          [2]
    LD        HL,0xB                             [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip12                          [2]
    JR        .skip13                            [2]
.skip12:
    INC       2,D                                [2]
.skip13:
    CP        E,7                                [2]
    JR        Z,.skip14                          [2]
    CP        E,8                                [3]
    JR        Z,.skip17                          [2]
    JR        .skip18                            [2]
.skip14:
    LD        A,(XIZ+0x15)                       [3]
    CP        A,2                                [2]
    JR        Z,.skip15                          [2]
    CP        A,4                                [2]
    JR        Z,.skip16                          [2]
    JR        .skip18                            [2]
.skip15:
    LD        E,0xE                              [2]
    JR        .skip18                            [2]
.skip16:
    LD        E,0xF                              [2]
    JR        .skip18                            [2]
.skip17:
    LD        A,(XIZ+0x15)                       [3]
    CP        A,3                                [2]
    JR        Z,.skip18                          [2]
    LD        E,0x10                             [2]
.skip18:
    LD{1}     A,E                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,XWA                            [2]
    LD{1}     A,D                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XHL,XWA                            [2]
    LD        XWA,0x24A308                       [5]
    ADD       XHL,XWA                            [2]
    LD        W,(XHL)                            [2]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21535A

dyn_21535A:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JR        Z,dyn_215379                       [2]
    CP        A,6                                [2]
    JRL       Z,loc_2154B2                       [3]
    CP        A,7                                [2]
    JRL       Z,dyn_2154EF                       [3]
    CP        A,8                                [3]
    JRL       Z,loc_2154F3                       [3]
    LD        W,0xFF                             [2]
    JRL       dyn_2154F7                         [3]

.org 0x215379

dyn_215379:
    CALL      GetStoryStage                      [4]
    CP        A,0xA                              [3]
    JRL       Z,loc_21549F                       [3]
    CP        A,8                                [3]
    JR        Z,loc_215403                       [2]
    CP        A,0                                [2]
    JR        Z,dyn_215391                       [2]
    LD        W,0xFF                             [2]
    JRL       dyn_2154F7                         [3]

.org 0x215391

dyn_215391:
    LD        HL,0x4E                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,loc_2153FE                       [2]
    LD        HL,0x40                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,0x41                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,0x43                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,0x45                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,0x47                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,0x48                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,0x4A                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,0x4B                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        W,2                                [2]
    JRL       dyn_2154F7                         [3]

.org 0x2153F9

dyn_2153F9:
    LD        W,1                                [2]
    JRL       dyn_2154F7                         [3]

.org 0x2153FE

loc_2153FE:
    LD        W,0                                [2]
    JRL       dyn_2154F7                         [3]

.org 0x215403

loc_215403:
    LD        HL,0x4E                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JRL       Z,.skip2                           [3]
    LD        HL,0x40                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x42                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x43                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x45                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x46                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x47                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x48                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x49                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x4A                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x4B                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x4C                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,0x4D                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        W,5                                [2]
    JR        dyn_2154F7                         [2]
.skip:
    LD        W,4                                [2]
    JR        dyn_2154F7                         [2]
.skip2:
    LD        W,3                                [2]
    JR        dyn_2154F7                         [2]

.org 0x21549F

loc_21549F:
    LD        HL,0x4E                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        W,0xFF                             [2]
    JR        dyn_2154F7                         [2]
.skip:
    LD        W,0xE                              [2]
    JR        dyn_2154F7                         [2]

.org 0x2154B2

loc_2154B2:
    LD        HL,0x43                            [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip3                           [2]
    CALL      GetStoryStage                      [4]
    CP        A,8                                [3]
    JR        Z,.skip2                           [2]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    LD        W,0xFF                             [2]
    JR        dyn_2154F7                         [2]
.skip:
    LD        W,0                                [2]
    JR        dyn_2154F7                         [2]
.skip2:
    LD        W,4                                [2]
    JR        dyn_2154F7                         [2]
.skip3:
    CALL      GetStoryStage                      [4]
    CP        A,8                                [3]
    JR        Z,.skip5                           [2]
    CP        A,0                                [2]
    JR        Z,.skip4                           [2]
    LD        W,0xFF                             [2]
    JR        dyn_2154F7                         [2]
.skip4:
    LD        W,3                                [2]
    JR        dyn_2154F7                         [2]
.skip5:
    LD        W,7                                [2]
    JR        dyn_2154F7                         [2]

.org 0x2154EF

dyn_2154EF:
    LD        W,0                                [2]
    JR        dyn_2154F7                         [2]

.org 0x2154F3

loc_2154F3:
    LD        W,0                                [2]
    JR        dyn_2154F7                         [2]

.org 0x2154F7

dyn_2154F7:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215609

dyn_215609:
    CALR      dyn_215161                         [3]
    LD        A,(XHL+3)                          [3]
    CP        A,0xFF                             [3]
    JRL       Z,loc_21572F                       [3]
    CP        A,0xFD                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xFB                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xF9                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xF8                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xF5                             [3]
    JR        Z,.skip                            [2]
    CP        A,0xF4                             [3]
    JR        Z,.skip2                           [2]
    CP        A,0xF3                             [3]
    JR        Z,.skip3                           [2]
    CP        A,0xF2                             [3]
    JR        Z,.skip4                           [2]
    CP        A,0xF0                             [3]
    JR        Z,dyn_21569B                       [2]
    CP        A,0xEF                             [3]
    JR        Z,loc_2156A8                       [2]
    CP        A,0xEE                             [3]
    JR        Z,loc_2156B5                       [2]
    CP        A,0xED                             [3]
    JR        Z,loc_2156C1                       [2]
    CP        A,0xEC                             [3]
    JR        Z,loc_2156C6                       [2]
    CP        A,0xEB                             [3]
    JR        Z,loc_2156CD                       [2]
    CP        A,0xEA                             [3]
    JR        Z,loc_2156D2                       [2]
    CP        A,0xE9                             [3]
    JR        Z,loc_2156D9                       [2]
    CP        A,0xE8                             [3]
    JRL       Z,loc_2156F5                       [3]
    CP        A,0xE7                             [3]
    JRL       Z,loc_215704                       [3]
    CP        A,0xE6                             [3]
    JRL       Z,loc_21571A                       [3]
    LD        (XIZ+0x12),A                       [3]
    JRL       0x215739                           [3]
.skip:
    LD        A,0                                [2]
    LD        (XIZ+0x27),A                       [3]
.skip2:
    LD        A,7                                [2]
    LD        (XIZ+0xE),A                        [3]
    JRL       0x215739                           [3]
.skip3:
    LD        A,0                                [2]
    LD        (XIZ+0x27),A                       [3]
.skip4:
    LD        A,8                                [2]
    LD        (XIZ+0xE),A                        [3]
    JRL       0x215739                           [3]

.org 0x21569B

dyn_21569B:
    LD        A,0xF0                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215739                           [3]

.org 0x2156A8

loc_2156A8:
    LD        A,0xEF                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215739                           [3]

.org 0x2156B5

loc_2156B5:
    LD        A,0xEE                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215739                           [2]

.org 0x2156C1

loc_2156C1:
    LD        A,0                                [2]
    LD        (XIZ+0x27),A                       [3]

.org 0x2156C6

loc_2156C6:
    LD        A,9                                [2]
    LD        (XIZ+0xE),A                        [3]
    JR        0x215739                           [2]

.org 0x2156CD

loc_2156CD:
    LD        A,1                                [2]
    LD        (XIZ+0x27),A                       [3]

.org 0x2156D2

loc_2156D2:
    LD        A,0xA                              [2]
    LD        (XIZ+0xE),A                        [3]
    JR        0x215739                           [2]

.org 0x2156D9

loc_2156D9:
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    SUB       A,2                                [3]
    JR        C,loc_21572F                       [2]
    CP        A,5                                [2]
    JR        NC,loc_21572F                      [2]
    ADD       A,0x4E                             [3]
    LD        (XIZ+0x12),A                       [3]
    JR        0x215739                           [2]

.org 0x2156F5

loc_2156F5:
    CALL      GetStoryStage                      [4]
    SUB       A,3                                [3]
    ADD       A,0x49                             [3]
    LD        (XIZ+0x12),A                       [3]
    JR        0x215739                           [2]

.org 0x215704

loc_215704:
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    CP        A,0                                [2]
    JR        Z,loc_21572F                       [2]
    LD        A,0x53                             [2]
    LD        (XIZ+0x12),A                       [3]
    JR        0x215739                           [2]

.org 0x21571A

loc_21571A:
    LD        A,0xB                              [2]
    LD        (XIZ+0xE),A                        [3]
    JR        0x215739                           [2]

.org 0x215721

dyn_215721:
    LD        W,0xFD                             [2]
    SUB       W,A                                [2]
    LD        (XIZ+0x11),W                       [3]
    LD        A,4                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215739                           [2]

.org 0x21572F

loc_21572F:
    LD        A,4                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x11),A                       [3]
    CALR      dyn_215741                         [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215741

dyn_215741:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (XIZ+0x25),A                       [3]
    POP       A                                  [1]
    RET                                          [1]

.org 0x215749

dyn_215749:
    PUSH      A                                  [1]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x25),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    POP       A                                  [1]
    RET                                          [1]

.org 0x215760

dyn_215760:
    CALR      dyn_21535A                         [3]
    CP        W,0xFF                             [3]
    JR        NZ,dyn_21578A                      [2]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JR        Z,.skip                            [2]
    CP        A,6                                [2]
    JR        Z,.skip2                           [2]
    LD        A,0                                [2]
    JR        .skip3                             [2]
.skip:
    LD        A,1                                [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,3                                [2]
    JR        .skip3                             [2]
.skip3:
    LD        (XIZ+0x11),A                       [3]
    LD        A,0xC                              [2]
    LD        (XIZ+0xE),A                        [3]
    JRL       0x215821                           [3]

.org 0x21578A

dyn_21578A:
    CALR      dyn_215749                         [3]
    LD        (XIZ+0x12),W                       [3]
    CALL      dyn_2167CF                         [4]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,7                                [2]
    JR        Z,dyn_2157E3                       [2]
    CP        A,8                                [3]
    JR        Z,dyn_2157E3                       [2]
    CALR      dyn_214D23                         [3]
    CALL      dyn_2167E4                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    CALL      dyn_216EDE                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216F6B                         [4]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JR        Z,dyn_2157D2                       [2]
    CP        A,6                                [2]
    JR        NZ,dyn_2157E1                      [2]
    LD        XWA,3                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x23                            [3]
    CALL      SoundCommand                       [4]
    JR        dyn_2157E1                         [2]

.org 0x2157D2

dyn_2157D2:
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x22                            [3]
    CALL      SoundCommand                       [4]
    JR        dyn_2157E1                         [2]

.org 0x2157E3

dyn_2157E3:
    LD        W,(XIZ+0x15)                       [3]
    LD        A,(XIZ+0x12)                       [3]
    CALR      dyn_214D97                         [3]
    LD        L,(XHL+1)                          [3]
    EXTZ      HL                                 [2]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    CALL      dyn_2166C9                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    LD        XWA,4                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x24                            [3]
    CALL      SoundCommand                       [4]
    CALL      dyn_216E3A                         [4]
    LD        A,7                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x215822

dyn_215822:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        C,(XIZ+0x23)                       [3]
    CP        C,0xFF                             [3]
    JR        Z,0x215847                         [2]
    LD        B,(XIZ+0x24)                       [3]
    DEC       1,B                                [2]
    LD        (XIZ+0x24),B                       [3]
    JRL       NZ,0x21591F                        [3]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+0x10),C                       [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        XHL,(XWA+8)                        [3]
    CP{2}     XHL,0                              [6]
    JR        Z,dyn_2158BD                       [2]
    LD        C,(XWA+0x12)                       [3]
    AND       C,0x7F                             [3]
    CP        C,2                                [2]
    JR        NZ,0x215867                        [2]
    LD        A,1                                [2]
    LD        (XIZ+0x26),A                       [3]
    LD        A,(wJoyPressed)                    [4]
    CP        A,B_BUTTON                         [3]
    JR        NZ,dyn_21588D                      [2]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,7                                [2]
    JR        NZ,dyn_21588D                      [2]
    LD        A,1                                [2]
    CALL      dyn_207611                         [4]
    CALR      dyn_215741                         [3]
    LD        A,0xEF                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x21591F                           [3]

.org 0x21588D

dyn_21588D:
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON|B_BUTTON                [3]
    JRL       Z,0x21591F                         [3]
    LD        A,(XIZ+0x26)                       [3]
    CP        A,0                                [2]
    JR        Z,dyn_2158A5                       [2]
    LD        A,0                                [2]
    LD        (XIZ+0x26),A                       [3]
    JR        0x21591F                           [2]

.org 0x2158A5

dyn_2158A5:
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        C,(XWA+0x10)                       [3]
    LD        (XIZ+0x23),C                       [3]
    INC       1,C                                [2]
    LD        (XIZ+0x24),C                       [3]
    LD        C,0                                [2]
    LD        (XWA+0x10),C                       [3]
    JR        0x21591F                           [2]

.org 0x2158BD

dyn_2158BD:
    LD        A,(XIZ+0x25)                       [3]
    CP        A,0                                [2]
    JR        Z,dyn_2158CE                       [2]
    LD        A,1                                [2]
    LD        (XIZ+0x25),A                       [3]
    CALR      LilyGivesFlowers                   [3]
    JR        0x21591F                           [2]

.org 0x2158CE

dyn_2158CE:
    LD        W,(XIZ+0x12)                       [3]
    CP        W,0xFF                             [3]
    JR        NZ,0x2158DC                        [2]
    CALR      dyn_21535A                         [3]
    LD        (XIZ+0x12),W                       [3]
    LD        W,(XIZ+0x12)                       [3]
    CALR      TownNpcTalk                        [3]
    LD        (XIZ+0x12),W                       [3]
    CALR      dyn_2151B8                         [3]
    CALR      dyn_215161                         [3]
    LD        XHL,(XHL+4)                        [3]
    CP        XHL,0x58                           [6]
    JR        NC,0x21590C                        [2]
    CALL      dyn_216B0C                         [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    ADD       XHL,XWA                            [2]
    LD        XWA,0x259683                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x26),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0x25),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215924

dyn_215924:
    LD        A,(XIZ+0xF)                        [3]
    CP        A,1                                [2]
    JR        NZ,dyn_215933                      [2]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215933

dyn_215933:
    CP        A,2                                [2]
    JR        NZ,0x21593C                        [2]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    CP        A,3                                [2]
    JR        NZ,dyn_215946                      [2]
    CALR      dyn_215822                         [3]
    JRL       0x215AE8                           [3]

.org 0x215946

dyn_215946:
    CP        A,4                                [2]
    JR        NZ,dyn_215980                      [2]
    CALR      dyn_21516D                         [3]
    LD        A,(XIZ+0x11)                       [3]
    CP        A,0                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,1                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,2                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,3                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,4                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,5                                [2]
    JR        Z,dyn_215974                       [2]
    CALR      sub_214FA4                         [3]
    LD        A,(XIZ+0x1B)                       [3]
    LD        (XIZ+0x10),A                       [3]
    JRL       0x215AE8                           [3]

.org 0x215974

dyn_215974:
    CALL      dyn_2167F9                         [4]
    LD        A,0xC                              [2]
    LD        (XIZ+0xE),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215980

dyn_215980:
    CP        A,5                                [2]
    JR        NZ,dyn_21598C                      [2]
    LD        A,6                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x21598C

dyn_21598C:
    CP        A,6                                [2]
    JR        NZ,dyn_215998                      [2]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215998

dyn_215998:
    CP        A,7                                [2]
    JR        NZ,dyn_2159AF                      [2]
    LD        A,2                                [2]
    CALL      dyn_216E43                         [4]
    CP        A,1                                [2]
    JRL       Z,0x215AE8                         [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x2159AF

dyn_2159AF:
    CP        A,8                                [3]
    JRL       NZ,dyn_215AA1                      [3]
    LD        A,2                                [2]
    CALL      dyn_216E67                         [4]
    CP        A,1                                [2]
    JRL       Z,0x215AE8                         [3]
    LD        A,(XIZ+0x11)                       [3]
    CP        A,0xF0                             [3]
    JR        Z,dyn_2159DB                       [2]
    CP        A,0xEF                             [3]
    JR        Z,dyn_215A26                       [2]
    CP        A,0xEE                             [3]
    JRL       Z,loc_215A64                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x2159DB

dyn_2159DB:
    LD        A,1                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALL      dyn_206803                         [4]
    CALL      dyn_2166EB                         [4]
    LD        W,(XIZ+0x15)                       [3]
    LD        A,(XIZ+0x12)                       [3]
    CALR      dyn_214D97                         [3]
    LD        L,(XHL+1)                          [3]
    EXTZ      HL                                 [2]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    CALR      dyn_215161                         [3]
    LD        A,(XHL+0)                          [3]
    LD        (XIZ+0x13),A                       [3]
    LD        L,A                                [2]
    EXTS      HL                                 [2]
    LD        BC,4                               [2]
    LD        DE,0                               [2]
    ADD       E,0x20                             [3]
    CALL      dyn_216849                         [4]
    CALL      DrawPortraitAt                     [4]
    LD        A,7                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215A26

dyn_215A26:
    CALL      dyn_206803                         [4]
    CALL      dyn_2166EB                         [4]
    CALL      dyn_216757                         [4]
    CALL      dyn_21679E                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALR      dyn_214D23                         [3]
    CALR      dyn_2151B8                         [3]
    CALL      dyn_21712F                         [4]
    CALL      dyn_216F8E                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216E31                         [4]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        A,9                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215A64

loc_215A64:
    CALL      dyn_206803                         [4]
    CALL      dyn_2166EB                         [4]
    CALL      dyn_216757                         [4]
    CALL      dyn_21679E                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        A,0xE                              [2]
    LD        (XIZ+0x12),A                       [3]
    CALR      dyn_214D23                         [3]
    CALR      dyn_2151B8                         [3]
    CALL      sub_2170E4                         [4]
    CALL      dyn_216F8E                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216E31                         [4]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        A,0xA                              [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215AE8                           [2]

.org 0x215AA1

dyn_215AA1:
    CP        A,9                                [3]
    JR        NZ,.skip                           [2]
    CALL      dyn_216FC3                         [4]
    CP        A,1                                [2]
    JR        Z,0x215AE8                         [2]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x22                            [3]
    CALL      SoundCommand                       [4]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215AE8                           [2]
.skip:
    CP        A,0xA                              [3]
    JR        NZ,.skip2                          [2]
    CALL      dyn_216FC3                         [4]
    CP        A,1                                [2]
    JR        Z,0x215AE8                         [2]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x22                            [3]
    CALL      SoundCommand                       [4]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215AE8                           [2]
.skip2:
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x215C14

sub_215C14:
    PUSH      XWA                                [1]
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    SLL       1,WA                               [3]
    LD        XHL,0x249FB8                       [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    LD        C,6                                [2]
    LD        E,0                                [2]
.loop:
    PUSH      C                                  [2]
    PUSH      E                                  [2]
    PUSH      XHL                                [1]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    POP       XHL                                [1]
    PUSH      XHL                                [1]
    LD        WA,(XHL)                           [2]
    CALL      sub_216BA8                         [4]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XHL                                [1]
    POP       E                                  [2]
    POP       C                                  [2]
    INC       1,E                                [2]
    INC       2,XHL                              [2]
    DJNZ      C,.loop                            [3]
    LD        C,0                                [2]
    LD        E,8                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249FB0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_2166EB                         [4]
    CALR      sub_215BCD                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x215C88

sub_215C88:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JRL       .skip11                            [3]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JRL       .skip11                            [3]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip8                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    CP        A,8                                [3]
    JR        Z,.skip4                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip3:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip4:
    LD        A,5                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip5:
    CP        A,2                                [2]
    JR        NZ,.skip8                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip6                           [2]
    CP        A,5                                [2]
    JR        Z,.skip7                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip6:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip7:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip8:
    JR        .skip10                            [2]
.skip9:
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip10                          [2]
    CALR      sub_215BCD                         [3]
.skip10:
    LD        BC,0x60                            [3]
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    JRL       .done                              [3]
.skip11:
    CALL      sub_216779                         [4]
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip13                          [2]
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    SLL       1,WA                               [3]
    LD        XHL,0x249FB8                       [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    LD        A,(XIZ+0x10)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    ADD       XHL,XWA                            [2]
    LD        WA,(XHL)                           [2]
    POP       XHL                                [1]
    LD        (XIZ+0x2A),WA                      [3]
    CALL      sub_216BA8                         [4]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip12                          [2]
    LD        A,0x1F                             [2]
    JR        .skip15                            [2]
.skip12:
    LD        A,0x18                             [2]
    JR        .skip15                            [2]
.skip13:
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249FB0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        WA,0                               [2]
    LD        (XIZ+0x2A),WA                      [3]
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip14                          [2]
    LD        A,0x1E                             [2]
    JR        .skip15                            [2]
.skip14:
    LD        A,0x17                             [2]
    JR        .skip15                            [2]
.skip15:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x215EDC

sub_215EDC:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_215AF1                         [3]
    JR        .skip6                             [2]
.skip:
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_215B16                         [3]
    JR        .skip6                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_215C14                         [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,3                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_215C88                         [3]
    JR        .skip6                             [2]
.skip4:
    CP        A,4                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_215DD9                         [3]
    JR        .skip6                             [2]
.skip5:
    CP        A,5                                [2]
    JR        NZ,.skip6                          [2]
    CALR      CyriusTrade                        [3]
    JR        .skip6                             [2]
.skip6:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x215F1E

; [code+play] A = first skill of the pair Helmut offers (4r / 4r+2), 0x14 all learned, FF none yet (level < 20 / 30)
HelmutSkillOffer:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      W                                  [2]
    CALL      CheckSkillPair1                    [4]
    LD{1}     W,A                                [2]
    CALL      CheckSkillPair2                    [4]
    AND       A,W                                [2]
    CP        A,1                                [2]
    JR        Z,.skip                            [2]
    LD        A,(wPlayerLevel)                   [4]
    CP        A,0x14                             [3]
    JR        C,.skip4                           [2]
    CALL      CheckSkillPair1                    [4]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    LD        A,(wPlayerLevel)                   [4]
    CP        A,0x1E                             [3]
    JR        C,.skip4                           [2]
    CALL      CheckSkillPair2                    [4]
    CP        A,0                                [2]
    JR        Z,.skip2                           [2]
.skip:
    LD        A,0x14                             [2]
    JR        .skip5                             [2]
.skip2:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    MUL{1}    WA,4                               [3]
    ADD       A,2                                [3]
    JR        .skip5                             [2]
.skip3:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    MUL{1}    WA,4                               [3]
    JR        .skip5                             [2]
.skip4:
    LD        A,0xFF                             [2]
.skip5:
    POP       W                                  [2]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215F84

sub_215F84:
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,1                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x215F8F

sub_215F8F:
    LD        A,(XIZ+0x2D)                       [3]
    CP        A,0x5A                             [3]
    JR        C,.done                            [2]
    LD        A,(XIZ+0x29)                       [3]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        A,7                                [2]
    JR        .skip2                             [2]
.skip:
    LD        A,6                                [2]
.skip2:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x215FB3

sub_215FB3:
    PUSH      XWA                                [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,7                              [4]
    LD        XHL,NovaText                       [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x215FC5

sub_215FC5:
    PUSH      XWA                                [1]
    ADD       A,8                                [3]
    LD        W,(XIZ+0x15)                       [3]
    CALR      dyn_214D97                         [3]
    LD        XHL,(XHL+4)                        [3]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x215FD4

sub_215FD4:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x29)                       [3]
    LD        W,(XIZ+0x10)                       [3]
    ADD       A,W                                [2]
    CALR      sub_215FC5                         [3]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215FEA

sub_215FEA:
    LD        A,(XIZ+0x29)                       [3]
    LD        C,2                                [2]
    LD        E,0                                [2]
.loop:
    PUSH      C                                  [2]
    PUSH      E                                  [2]
    PUSH      A                                  [1]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    POP       A                                  [1]
    PUSH      A                                  [1]
    CALR      sub_215FB3                         [3]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       A                                  [1]
    POP       E                                  [2]
    POP       C                                  [2]
    INC       1,E                                [2]
    INC       1,A                                [2]
    DJNZ      C,.loop                            [3]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_2166EB                         [4]
    CALR      sub_215FD4                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x21602C

sub_21602C:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip8                             [2]
.skip:
    AND       A,0xF                              [3]
    JR        Z,.skip5                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip3                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip2                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip2:
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,2                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip4                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip4:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip7                             [2]
.skip6:
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip7                           [2]
    CALR      sub_215FD4                         [3]
.skip7:
    LD        BC,0x60                            [3]
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    JR        .done                              [2]
.skip8:
    CALL      sub_216779                         [4]
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip9                           [2]
    LD        (XIZ+0x2A),A                       [3]
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        A,(XIZ+0x29)                       [3]
    LD        W,(XIZ+0x2A)                       [3]
    ADD       A,W                                [2]
    CALR      sub_215FB3                         [3]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        A,0x1C                             [2]
    JR        .skip10                            [2]
.skip9:
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249FB0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        WA,0                               [2]
    LD        (XIZ+0x2A),WA                      [3]
    LD        A,0x20                             [2]
    JR        .skip10                            [2]
.skip10:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x216111

sub_216111:
    LD        C,0                                [2]
    LD        E,2                                [2]
    LD        A,1                                [2]
    CALL      sub_20768A                         [4]
    LD        A,1                                [2]
    LD        XHL,0x249FA3                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,5                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x216136

; [code+play] Helmut's "Are you sure?" after picking a skill: CheckSkillPair1, sets the learned flag (helmut_skill_*_are_you_sure only)
HelmutSkillChoice:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip7                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip7                             [2]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip6                           [2]
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    JR        .skip6                             [2]
.skip4:
    CP        A,8                                [3]
    JR        NZ,.skip6                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip5                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip6                             [2]
.skip6:
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,0x30                            [3]
    ADD       WA,0x20                            [4]
    LD        BC,WA                              [2]
    LD        DE,0x84                            [3]
    CALL      dyn_211DBD                         [4]
    JR        .done                              [2]
.skip7:
    CALL      dyn_2166EB                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip8                           [2]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
    CALL      sub_216779                         [4]
    LD        A,0x1D                             [2]
    JR        .skip11                            [2]
.skip8:
    LD        A,(XIZ+0x29)                       [3]
    LD        W,(XIZ+0x2A)                       [3]
    ADD       W,A                                [2]
    INC       1,W                                [2]
    CALL      CheckSkillPair1                    [4]
    CP        A,1                                [2]
    JR        Z,.skip9                           [2]
    LD        (wSkill1),W                        [4]
    LD        A,0x30                             [2]
    JR        .skip10                            [2]
.skip9:
    LD        (wSkill2),W                        [4]
    LD        A,0x32                             [2]
.skip10:
    LD        W,(XIZ+0x2A)                       [3]
    ADD       A,W                                [2]
    LD        L,A                                [2]
    EXTZ      HL                                 [2]
    CALL      SetEventFlag                       [4]
    LD        A,0x1E                             [2]
    JR        .skip11                            [2]
.skip11:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
.done:
    RET                                          [1]

.org 0x216208

sub_216208:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_215F84                         [3]
    JR        .skip6                             [2]
.skip:
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_215F8F                         [3]
    JR        .skip6                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_215FEA                         [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,3                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_21602C                         [3]
    JR        .skip6                             [2]
.skip4:
    CP        A,4                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_216111                         [3]
    JR        .skip6                             [2]
.skip5:
    CP        A,5                                [2]
    JR        NZ,.skip6                          [2]
    CALR      HelmutSkillChoice                  [3]
    JR        .skip6                             [2]
.skip6:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x21624A

sub_21624A:
    LD        XHL,swp_208C4C                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x78                     [5]
    LD        WA,0x84                            [3]
    CALL      SoundCommand                       [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,1                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x21626A

sub_21626A:
    LD        A,6                                [2]
    LD        (0x5A7F),A                         [4]
    LD        A,(XIZ+0x2C)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2C),A                       [3]
    CP        A,0x39                             [3]
    JR        C,.skip2                           [2]
    LD        A,(0x585B)                         [4]
    ADD       A,2                                [3]
    CP        A,0x7F                             [3]
    JR        C,.skip                            [2]
    LD        A,0x7F                             [2]
.skip:
    LD        (0x585B),A                         [4]
.skip2:
    LD        WA,(XIZ+0xC)                       [3]
    CP        WA,0                               [2]
    JR        NZ,.done                           [2]
    CALL      dyn_206803                         [4]
    CALL      dyn_21676A                         [4]
    CALL      dyn_2167B1                         [4]
    CALR      dyn_21516D                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    CALL      dyn_2166EB                         [4]
    LD        HL,0x36                            [3]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    LD        XWA,0                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x20                            [3]
    CALL      SoundCommand                       [4]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x2162D0

sub_2162D0:
    LD        A,2                                [2]
    CALL      sub_216E95                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    LD        A,0xF                              [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x2162EA

sub_2162EA:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    JR        .skip4                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    JR        .skip4                             [2]
.skip2:
    JR        .skip3                             [2]
.skip3:
    JR        .done                              [2]
.skip4:
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x216306

sub_216306:
    LD        A,2                                [2]
    CALL      sub_216EB9                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    CALL      dyn_206803                         [4]
    CALL      dyn_216757                         [4]
    CALL      dyn_21679E                         [4]
    CALL      dyn_2166EB                         [4]
    CALR      dyn_214D23                         [3]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x22                            [3]
    CALL      SoundCommand                       [4]
    LD        A,5                                [2]
    LD        (XIZ+0x27),A                       [3]
    CALL      dyn_216E31                         [4]
    LD        A,9                                [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
.done:
    RET                                          [1]

.org 0x216344

sub_216344:
    LD        A,9                                [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    RET                                          [1]

.org 0x21634F

sub_21634F:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_21624A                         [3]
    JR        .skip6                             [2]
.skip:
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_21626A                         [3]
    JR        .skip6                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_2162D0                         [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,3                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_2162EA                         [3]
    JR        .skip6                             [2]
.skip4:
    CP        A,4                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_216306                         [3]
    JR        .skip6                             [2]
.skip5:
    CP        A,5                                [2]
    JR        NZ,.skip6                          [2]
    CALR      sub_216344                         [3]
    JR        .skip6                             [2]
.skip6:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x216391

sub_216391:
    PUSH      XHL                                [1]
    PUSH      C                                  [2]
    PUSH      XWA                                [1]
    CALL      GetStageArenaRank                  [4]
    CP        A,3                                [2]
    JR        NC,.skip                           [2]
    LD        A,3                                [2]
    JR        .skip2                             [2]
.skip:
    CP        A,9                                [3]
    JR        C,.skip2                           [2]
    LD        A,8                                [2]
    JR        .skip2                             [2]
.skip2:
    SUB       A,3                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A09E                       [5]
    ADD       XHL,XWA                            [2]
    PUSH      W                                  [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV{1}    WA,0x64                            [3]
    LD        A,W                                [2]
    POP       W                                  [2]
    LD        C,0                                [2]
.loop:
    LD        W,(XHL)                            [2]
    SUB       A,W                                [2]
    JR        C,.skip3                           [2]
    INC       1,C                                [2]
    ADD       XHL,6                              [6]
    JR        .loop                              [2]
.skip3:
    LD        (XIZ+0x28),C                       [3]
    LD        XHL,0x24A0DA                       [5]
    PUSH      W                                  [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV{1}    WA,0x64                            [3]
    LD        A,W                                [2]
    POP       W                                  [2]
    LD        C,0                                [2]
.loop2:
    LD        W,(XHL)                            [2]
    SUB       A,W                                [2]
    JR        C,.skip4                           [2]
    INC       1,C                                [2]
    ADD       XHL,1                              [6]
    JR        .loop2                             [2]
.skip4:
    LD        (XIZ+0x29),C                       [3]
    POP       XWA                                [1]
    POP       C                                  [2]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21640A

sub_21640A:
    CALR      sub_216391                         [3]
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,0x24A1A7                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    PUSH      XHL                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A094                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    POP       XHL                                [1]
    CALL      sub_216BA8                         [4]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        C,0                                [2]
    LD        E,5                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x24A1B0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,5                              [4]
    LD        XHL,XWA                            [2]
    LD        A,(XIZ+0x29)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XWA,XHL                            [2]
    MUL       XWA,4                              [4]
    LD        XHL,0x24A0DF                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       XWA                                [1]
    LD        A,2                                [2]
    LD        C,6                                [2]
    CALL      sub_216851                         [4]
    CALL      sub_2168AC                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x21648D

sub_21648D:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    JR        .skip3                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,(XIZ+0x2D)                       [3]
    CP        A,0x3C                             [3]
    JR        C,.done                            [2]
.skip3:
    LD        A,0x1E                             [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    LD        A,3                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x2164B7

sub_2164B7:
    CALL      dyn_2166EB                         [4]
    LD        W,(XIZ+0x15)                       [3]
    LD        A,0x1F                             [2]
    CALR      dyn_214D97                         [3]
    LD        XHL,(XHL+4)                        [3]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    LD        C,0                                [2]
    LD        E,2                                [2]
    LD        A,1                                [2]
    CALL      sub_20768A                         [4]
    LD        A,1                                [2]
    LD        XHL,0x249FA3                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x2164F1

sub_2164F1:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip7                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip7                             [2]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip6                           [2]
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    JR        .skip6                             [2]
.skip4:
    CP        A,8                                [3]
    JR        NZ,.skip6                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip5                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip6                             [2]
.skip6:
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,0x30                            [3]
    ADD       WA,0x20                            [4]
    LD        BC,WA                              [2]
    LD        DE,0x84                            [3]
    CALL      dyn_211DBD                         [4]
    JRL       .done                              [3]
.skip7:
    CALL      dyn_2166EB                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip8                           [2]
    LD        A,0x21                             [2]
    JRL       .skip11                            [3]
.skip8:
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,5                              [4]
    LD        XHL,XWA                            [2]
    LD        A,(XIZ+0x29)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XWA,XHL                            [2]
    MUL       XWA,4                              [4]
    LD        XHL,0x24A0DF                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       XWA                                [1]
    LD{1}     XBC,XHL                            [2]
    LD        XWA,(wGP)                          [4]
    CALL      sub_20622F                         [4]
    JR        NC,.skip9                          [2]
    LD        A,0x22                             [2]
    JR        .skip11                            [2]
.skip9:
    PUSH      XHL                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A094                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    POP       XHL                                [1]
    CALL      AddItem                            [4]
    JR        NC,.skip10                         [2]
    LD        A,0x23                             [2]
    JR        .skip11                            [2]
.skip10:
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,5                              [4]
    LD        XHL,XWA                            [2]
    LD        A,(XIZ+0x29)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XWA,XHL                            [2]
    MUL       XWA,4                              [4]
    LD        XHL,0x24A0DF                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       XWA                                [1]
    LD{1}     XBC,XHL                            [2]
    LD        XWA,(wGP)                          [4]
    CALL      sub_20622F                         [4]
    LD        (wGP),XWA                          [4]
    CALL      sub_2168AC                         [4]
    LD        A,0x20                             [2]
    JR        .skip11                            [2]
.skip11:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
.done:
    RET                                          [1]

.org 0x216619

sub_216619:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_21640A                         [3]
    JR        .skip4                             [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_21648D                         [3]
    JR        .skip4                             [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_2164B7                         [3]
    JR        .skip4                             [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_2164F1                         [3]
    JR        .skip4                             [2]
.skip4:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x216649

sub_216649:
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    DEC       1,A                                [2]
    SLL       1,A                                [3]
    LD{1}     W,A                                [2]
    CALL      dyn_216B0C                         [4]
    XOR       A,1                                [3]
    ADD       A,W                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A1CE                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    PUSH      A                                  [1]
    ADD       A,0x54                             [3]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0xE),A                        [3]
    CALR      dyn_215741                         [3]
    POP       A                                  [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    LD        XHL,0x24A1B8                       [5]
    ADD       XHL,XWA                            [2]
    LD        WA,(XHL)                           [2]
    CALL      AddItem                            [4]
    JR        C,.done                            [2]
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    LD        C,A                                [2]
.loop:
    LD        WA,0xFF                            [3]
    PUSH      C                                  [2]
    CALL      RemoveItem                         [4]
    POP       C                                  [2]
    DJNZ      C,.loop                            [3]
.done:
    RET                                          [1]

.org 0x2166B3

dyn_2166B3:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x10                            [3]
    LD        A,1                                [2]
    LD        C,0x14                             [2]
    LD        E,5                                [2]
    CALL      dyn_207494                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2166C9

dyn_2166C9:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    LD        C,0                                [2]
    LD        E,0x2E                             [2]
    CALL      dyn_2074C0                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2166DC

dyn_2166DC:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    CALL      dyn_207598                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2166EB

dyn_2166EB:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2166FA

swp_2166FA:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x46                            [3]
    LD        A,2                                [2]
    LD        C,8                                [2]
    LD        E,0xE                              [2]
    CALL      dyn_207494                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216710

swp_216710:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,2                                [2]
    LD        C,0xC                              [2]
    LD        E,0x20                             [2]
    CALL      dyn_2074C0                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216741

dyn_216741:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x46                            [3]
    LD        A,2                                [2]
    LD        C,8                                [2]
    LD        E,0xB                              [2]
    CALL      dyn_207494                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216757

dyn_216757:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,2                                [2]
    LD        C,0xC                              [2]
    LD        E,0x20                             [2]
    CALL      dyn_2074C0                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21676A

dyn_21676A:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216779

sub_216779:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216788

dyn_216788:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        HL,0x8E                            [3]
    LD        A,3                                [2]
    LD        C,8                                [2]
    LD        E,3                                [2]
    CALL      dyn_207494                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21679E

dyn_21679E:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,3                                [2]
    LD        C,0xC                              [2]
    LD        E,0x2B                             [2]
    CALL      dyn_2074C0                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2167B1

dyn_2167B1:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,3                                [2]
    CALL      dyn_207598                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2167CF

dyn_2167CF:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2166B3                         [4]
    CALL      dyn_216741                         [4]
    CALL      dyn_216788                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2167E4

dyn_2167E4:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2166C9                         [4]
    CALL      dyn_216757                         [4]
    CALL      dyn_21679E                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2167F9

dyn_2167F9:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2166DC                         [4]
    CALL      dyn_21676A                         [4]
    CALL      dyn_2167B1                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21680E

swp_21680E:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2166B3                         [4]
    CALL      swp_2166FA                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21681F

swp_21681F:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2166C9                         [4]
    CALL      swp_216710                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216841

swp_216841:
    LD        WA,0x1E4                           [3]
    RET                                          [1]

.org 0x216845

dyn_216845:
    LD        WA,0x94                            [3]
    RET                                          [1]

.org 0x216849

dyn_216849:
    LD        WA,0x13C                           [3]
    RET                                          [1]

.org 0x216851

sub_216851:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        E,C                                [2]
    LD        B,A                                [2]
.loop:
    SRL       1,XHL                              [3]
    RR        1,A                                [3]
    SRL       1,XHL                              [3]
    RR        1,A                                [3]
    SRL       1,XHL                              [3]
    RR        1,A                                [3]
    SRL       1,XHL                              [3]
    RR        1,A                                [3]
    SRL       4,A                                [3]
    PUSH      A                                  [1]
    DJNZ      C,.loop                            [3]
    LD        W,0xA                              [2]
    LD{1}     C,E                                [2]
.loop2:
    POP       A                                  [1]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    CP        C,1                                [2]
    JR        NZ,.skip2                          [2]
.skip:
    LD        W,0                                [2]
.skip2:
    ADD       A,W                                [2]
    PUSH      BC                                 [1]
    PUSH      W                                  [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,2                              [4]
    LD        XHL,0x24A1FC                       [5]
    ADD       XHL,XWA                            [2]
    LD{1}     A,B                                [2]
    CALL      dyn_2076F3                         [4]
    POP       W                                  [2]
    POP       BC                                 [1]
    DJNZ      C,.loop2                           [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2168AC

sub_2168AC:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,3                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,(wGP)                          [4]
    LD        C,6                                [2]
    LD        A,3                                [2]
    CALL      sub_216851                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21691A

sub_21691A:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      A                                  [1]
    LD        HL,0x40                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x41                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x42                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x43                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x44                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x45                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x46                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x47                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x48                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x49                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x4A                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x4B                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x4C                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x4D                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x4E                            [3]
    CALL      ClearEventFlag                     [4]
    POP       A                                  [1]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216A4E

swp_216A4E:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    LD        HL,0x40                            [3]
    CALL      CheckEventFlag                     [4]
    LD{1}     A,L                                [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216A6A

swp_216A6A:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    LD        HL,0x50                            [3]
    CALL      CheckEventFlag                     [4]
    LD{1}     A,L                                [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216A86

swp_216A86:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    LD        HL,9                               [3]
    CALL      CheckEventFlag                     [4]
    LD{1}     A,L                                [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216A94

swp_216A94:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    LD        HL,0xA                             [3]
    CALL      CheckEventFlag                     [4]
    LD{1}     A,L                                [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B0C

dyn_216B0C:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    XOR       A,1                                [3]
    AND       A,1                                [3]
    RET                                          [1]

.org 0x216B19

sub_216B19:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      W                                  [2]
    LD        HL,0x10                            [3]
    LD        A,0                                [2]
    LD        W,4                                [2]
.loop:
    PUSH      HL                                 [1]
    PUSH      WA                                 [1]
    CALL      CheckEventFlag                     [4]
    POP       WA                                 [1]
    ADD       A,L                                [2]
    POP       HL                                 [1]
    INC       1,HL                               [2]
    DJNZ      W,.loop                            [3]
    POP       W                                  [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B6A

; [code] A = 1 if event flag 0x30 or 0x31 (first skill learned)
CheckSkillPair1:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      W                                  [2]
    LD        W,0                                [2]
    LD        HL,0x30                            [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        HL,0x31                            [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        A,W                                [2]
    POP       W                                  [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B89

; [code] A = 1 if event flag 0x32 or 0x33 (second skill learned)
CheckSkillPair2:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      W                                  [2]
    LD        W,0                                [2]
    LD        HL,0x32                            [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        HL,0x33                            [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        A,W                                [2]
    POP       W                                  [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216BA8

sub_216BA8:
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CP        WA,0x101                           [4]
    JR        NC,.skip                           [2]
    LD        L,A                                [2]
    CALL      GetItemName                        [4]
    JR        .skip2                             [2]
.skip:
    SUB       WA,0x101                           [4]
    INC       1,WA                               [2]
    LD        L,A                                [2]
    CALL      GetPartName                        [4]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    RET                                          [1]

.org 0x216BEE

dyn_216BEE:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        WA,0                               [2]
    LD        B,0                                [2]
    LD        C,0                                [2]
    LD        (XHL),WA                           [2]
    INC       2,XHL                              [2]
    INC       1,C                                [2]
    CP        C,0xC                              [3]
    JR        C,0x216BF8                         [2]
    LD        XDE,0x20                           [5]
    SUB       XDE,0xC                            [6]
    SLL       1,XDE                              [3]
    ADD       XHL,XDE                            [2]
    INC       1,B                                [2]
    CP        B,0xE                              [3]
    JR        C,0x216BF6                         [2]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216CAA

swp_216CAA:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    PUSH      WA                                 [1]
    AND       WA,0x1FF                           [4]
    LD        BC,0                               [2]
    CALL      sub_216D00                         [4]
    POP       WA                                 [1]
    LD        B,0                                [2]
.loop:
    LD        C,0                                [2]
.loop2:
    PUSH      WA                                 [1]
    LD        DE,0                               [2]
    LD{1}     A,B                                [2]
    AND       A,1                                [3]
    JR        Z,.skip                            [2]
    OR        DE,0                               [4]
    JR        .skip2                             [2]
.skip:
    OR        DE,0x4000                          [4]
.skip2:
    POP       WA                                 [1]
    OR        DE,WA                              [2]
    OR        DE,0x3E00                          [4]
    LD        (XHL),DE                           [2]
    INC       2,XHL                              [2]
    INC       1,C                                [2]
    CP        C,0xC                              [3]
    JR        C,.loop2                           [2]
    LD        XDE,0x20                           [5]
    SUB       XDE,0xC                            [6]
    SLL       1,XDE                              [3]
    ADD       XHL,XDE                            [2]
    INC       1,B                                [2]
    CP        B,0xE                              [3]
    JR        C,.loop                            [2]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216D00

sub_216D00:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    SRA       1,BC                               [3]
    EXTZ      XWA                                [2]
    SLL       4,XWA                              [3]
    LD        XHL,0xA000                         [5]
    ADD       XHL,XWA                            [2]
    LD        B,8                                [2]
.loop:
    CP        C,B                                [2]
    JR        C,.skip                            [2]
    LD        WA,0xFFFF                          [3]
    JR        .skip2                             [2]
.skip:
    LD        WA,0                               [2]
.skip2:
    LD        (XHL),WA                           [2]
    INC       2,XHL                              [2]
    DJNZ      B,.loop                            [3]
    CP        C,0x10                             [3]
    JR        Z,.skip3                           [2]
    LD        A,1                                [2]
    JR        .skip4                             [2]
.skip3:
    LD        A,0                                [2]
.skip4:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216D66

swp_216D66:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    PUSH      WA                                 [1]
    AND       WA,0x1FF                           [4]
    LD        BC,0                               [2]
    CALL      sub_216DCD                         [4]
    POP       WA                                 [1]
    LD        B,0                                [2]
.loop:
    LD        C,0                                [2]
.loop2:
    PUSH      WA                                 [1]
    LD        DE,0                               [2]
    LD{1}     A,B                                [2]
    AND       A,1                                [3]
    JR        Z,.skip                            [2]
    OR        DE,0x4000                          [4]
    JR        .skip2                             [2]
.skip:
    OR        DE,0                               [4]
.skip2:
    LD{1}     A,C                                [2]
    AND       A,1                                [3]
    JR        Z,.skip3                           [2]
    OR        DE,0                               [4]
    JR        .skip4                             [2]
.skip3:
    OR        DE,0x8000                          [4]
.skip4:
    POP       WA                                 [1]
    OR        DE,WA                              [2]
    OR        DE,0x3E00                          [4]
    LD        (XHL),DE                           [2]
    INC       2,XHL                              [2]
    INC       1,C                                [2]
    CP        C,0x14                             [3]
    JR        C,.loop2                           [2]
    LD        XDE,0x20                           [5]
    SUB       XDE,0x14                           [6]
    SLL       1,XDE                              [3]
    ADD       XHL,XDE                            [2]
    INC       1,B                                [2]
    CP        B,0x13                             [3]
    JR        C,.loop                            [2]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216DCD

sub_216DCD:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    SRA       2,BC                               [3]
    EXTZ      XWA                                [2]
    SLL       4,XWA                              [3]
    LD        XHL,0xA000                         [5]
    ADD       XHL,XWA                            [2]
    LD        B,0x10                             [2]
.loop:
    LD        A,0                                [2]
    LD{1}     XDE,XHL                            [2]
    AND       XDE,1                              [6]
    JR        Z,.skip                            [2]
    SUB       A,4                                [3]
.skip:
    LD{1}     XDE,XHL                            [2]
    SRL       1,XDE                              [3]
    AND       XDE,7                              [6]
    SUB       A,E                                [2]
    ADD       A,C                                [2]
    BIT       7,A                                [3]
    JR        NZ,.skip2                          [2]
    CP        A,4                                [2]
    JR        C,.skip3                           [2]
    LD        A,4                                [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,0                                [2]
.skip3:
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XDE,0x24A228                       [5]
    ADD       XDE,XWA                            [2]
    LD        A,(XDE)                            [2]
    LD        (XHL),A                            [2]
    INC       1,XHL                              [2]
    DJNZ      B,.loop                            [3]
    CP        C,0x14                             [3]
    JR        Z,.skip4                           [2]
    LD        A,1                                [2]
    JR        .skip5                             [2]
.skip4:
    LD        A,0                                [2]
.skip5:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216E31

dyn_216E31:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (0x585B),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x216E3A

dyn_216E3A:
    PUSH      A                                  [1]
    LD        A,0x81                             [2]
    LD        (0x585B),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x216E43

dyn_216E43:
    PUSH      W                                  [2]
    LD        W,(0x585B)                         [4]
    ADD       W,A                                [2]
    CP        W,0                                [2]
    JR        Z,dyn_216E5C                       [2]
    BIT       7,W                                [3]
    JR        Z,dyn_216E5C                       [2]
    LD        (0x585B),W                         [4]
    LD        A,1                                [2]
    JR        0x216E64                           [2]

.org 0x216E5C

dyn_216E5C:
    LD        W,0                                [2]
    LD        (0x585B),W                         [4]
    LD        A,0                                [2]
    POP       W                                  [2]
    RET                                          [1]

.org 0x216E67

dyn_216E67:
    PUSH      W                                  [2]
    LD        W,(0x585B)                         [4]
    SUB       W,A                                [2]
    CP        W,0x81                             [3]
    JR        Z,dyn_216E81                       [2]
    BIT       7,W                                [3]
    JR        Z,dyn_216E81                       [2]
    LD        (0x585B),W                         [4]
    LD        A,1                                [2]
    JR        0x216E89                           [2]

.org 0x216E81

dyn_216E81:
    LD        W,0x81                             [2]
    LD        (0x585B),W                         [4]
    LD        A,0                                [2]
    POP       W                                  [2]
    RET                                          [1]

.org 0x216E95

sub_216E95:
    PUSH      W                                  [2]
    LD        W,(0x585B)                         [4]
    SUB       W,A                                [2]
    CP        W,0                                [2]
    JR        Z,.skip                            [2]
    BIT       7,W                                [3]
    JR        NZ,.skip                           [2]
    LD        (0x585B),W                         [4]
    LD        A,1                                [2]
    JR        .skip2                             [2]
.skip:
    LD        W,0                                [2]
    LD        (0x585B),W                         [4]
    LD        A,0                                [2]
.skip2:
    POP       W                                  [2]
    RET                                          [1]

.org 0x216EB9

sub_216EB9:
    PUSH      W                                  [2]
    LD        W,(0x585B)                         [4]
    ADD       W,A                                [2]
    CP        W,0x7F                             [3]
    JR        Z,.skip                            [2]
    BIT       7,W                                [3]
    JR        NZ,.skip                           [2]
    LD        (0x585B),W                         [4]
    LD        A,1                                [2]
    JR        .skip2                             [2]
.skip:
    LD        W,0x7F                             [2]
    LD        (0x585B),W                         [4]
    LD        A,0                                [2]
.skip2:
    POP       W                                  [2]
    RET                                          [1]

.org 0x216EDE

dyn_216EDE:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (0x60F1),A                         [4]
    ADD       A,0x50                             [3]
    LD        (0x60F5),A                         [4]
    LD        A,0xA0                             [2]
    LD        (0x60F3),A                         [4]
    XOR       A,A                                [2]
    LD        (0x60F7),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F2),A                         [4]
    ADD       A,0x4C                             [3]
    LD        (0x60F6),A                         [4]
    LD        A,0x98                             [2]
    LD        (0x60F4),A                         [4]
    XOR       A,A                                [2]
    LD        (0x60F8),A                         [4]
    LD        A,0                                [2]
    LD        (0x60FD),A                         [4]
    LD        A,2                                [2]
    LD        (0x60F9),A                         [4]
    LD        (0x60FA),A                         [4]
    LD        A,0xFC                             [2]
    LD        (0x60FB),A                         [4]
    LD        (0x60FC),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x216F2D

swp_216F2D:
    PUSH      WA                                 [1]
    LD        A,(0x60F5)                         [4]
    LD        W,(0x60F1)                         [4]
    SUB       A,W                                [2]
    ADD       A,0x28                             [3]
    SUB       A,1                                [3]
    XOR       W,W                                [2]
    DIV{1}    WA,0x28                            [3]
    LD        (0x60F9),A                         [4]
    LD        A,(0x60F6)                         [4]
    LD        W,(0x60F2)                         [4]
    SUB       A,W                                [2]
    ADD       A,0x28                             [3]
    SUB       A,1                                [3]
    XOR       W,W                                [2]
    DIV{1}    WA,0x28                            [3]
    LD        (0x60FA),A                         [4]
    POP       WA                                 [1]
    RET                                          [1]

.org 0x216F6B

dyn_216F6B:
    PUSH      A                                  [1]
    LD        A,(0x60F1)                         [4]
    LD        (GE_WBA_H),A                       [4]
    LD        A,(0x60F2)                         [4]
    LD        (GE_WBA_V),A                       [4]
    LD        A,(0x60F3)                         [4]
    LD        (GE_WSI_H),A                       [4]
    LD        A,(0x60F4)                         [4]
    LD        (GE_WSI_V),A                       [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x216F8E

dyn_216F8E:
    PUSH      A                                  [1]
    LD        A,(0x60F5)                         [4]
    LD        (GE_WBA_H),A                       [4]
    LD        A,(0x60F6)                         [4]
    LD        (GE_WBA_V),A                       [4]
    LD        A,(0x60F7)                         [4]
    LD        (GE_WSI_H),A                       [4]
    LD        A,(0x60F8)                         [4]
    LD        (GE_WSI_V),A                       [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x216FB1

dyn_216FB1:
    PUSH      A                                  [1]
    LD        A,1                                [2]
    LD        (0x60FD),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x216FBA

swp_216FBA:
    PUSH      A                                  [1]
    LD        A,2                                [2]
    LD        (0x60FD),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x216FC3

dyn_216FC3:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        A,(0x60FD)                         [4]
    CP        A,0                                [2]
    JR        NZ,dyn_216FD3                      [2]
    LD        A,0                                [2]
    JRL       0x2170E0                           [3]

.org 0x216FD3

dyn_216FD3:
    CP        A,1                                [2]
    JR        NZ,loc_217054                      [2]
    LD        A,0                                [2]
    LD        B,(GE_WBA_H)                       [4]
    LD        C,(0x60F1)                         [4]
    CP        B,C                                [2]
    JR        Z,0x216FF7                         [2]
    JR        C,.skip                            [2]
    SUB       B,(0x60F9)                         [4]
    JR        .skip2                             [2]
.skip:
    ADD       B,(0x60F9)                         [4]
.skip2:
    LD        (GE_WBA_H),B                       [4]
    LD        A,1                                [2]
    LD        B,(GE_WBA_V)                       [4]
    LD        C,(0x60F2)                         [4]
    CP        B,C                                [2]
    JR        Z,0x217015                         [2]
    JR        C,.skip3                           [2]
    SUB       B,(0x60FA)                         [4]
    JR        0x21700F                           [2]
.skip3:
    ADD       B,(0x60FA)                         [4]
    LD        (GE_WBA_V),B                       [4]
    LD        A,1                                [2]
    LD        B,(GE_WSI_H)                       [4]
    LD        C,(0x60F3)                         [4]
    CP        B,C                                [2]
    JR        Z,0x217033                         [2]
    JR        C,.skip4                           [2]
    ADD       B,(0x60FB)                         [4]
    JR        .skip5                             [2]
.skip4:
    SUB       B,(0x60FB)                         [4]
.skip5:
    LD        (GE_WSI_H),B                       [4]
    LD        A,1                                [2]
    LD        B,(GE_WSI_V)                       [4]
    LD        C,(0x60F4)                         [4]
    CP        B,C                                [2]
    JR        Z,0x217051                         [2]
    JR        C,dyn_217047                       [2]
    ADD       B,(0x60FC)                         [4]
    JR        0x21704B                           [2]

.org 0x217047

dyn_217047:
    SUB       B,(0x60FC)                         [4]
    LD        (GE_WSI_V),B                       [4]
    LD        A,1                                [2]
    JRL       0x2170D6                           [3]

.org 0x217054

loc_217054:
    CP        A,2                                [2]
    JR        NZ,.skip13                         [2]
    LD        A,0                                [2]
    LD        B,(GE_WBA_H)                       [4]
    LD        C,(0x60F5)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip3                           [2]
    JR        C,.skip                            [2]
    SUB       B,(0x60F9)                         [4]
    JR        .skip2                             [2]
.skip:
    ADD       B,(0x60F9)                         [4]
.skip2:
    LD        (GE_WBA_H),B                       [4]
    LD        A,1                                [2]
.skip3:
    LD        B,(GE_WBA_V)                       [4]
    LD        C,(0x60F6)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip6                           [2]
    JR        C,.skip4                           [2]
    SUB       B,(0x60FA)                         [4]
    JR        .skip5                             [2]
.skip4:
    ADD       B,(0x60FA)                         [4]
.skip5:
    LD        (GE_WBA_V),B                       [4]
    LD        A,1                                [2]
.skip6:
    LD        B,(GE_WSI_H)                       [4]
    LD        C,(0x60F7)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip9                           [2]
    JR        C,.skip7                           [2]
    ADD       B,(0x60FB)                         [4]
    JR        .skip8                             [2]
.skip7:
    SUB       B,(0x60FB)                         [4]
.skip8:
    LD        (GE_WSI_H),B                       [4]
    LD        A,1                                [2]
.skip9:
    LD        B,(GE_WSI_V)                       [4]
    LD        C,(0x60F8)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip12                          [2]
    JR        C,.skip10                          [2]
    ADD       B,(0x60FC)                         [4]
    JR        .skip11                            [2]
.skip10:
    SUB       B,(0x60FC)                         [4]
.skip11:
    LD        (GE_WSI_V),B                       [4]
    LD        A,1                                [2]
.skip12:
    JR        0x2170D6                           [2]
.skip13:
    LD        A,0                                [2]
    CP        A,0                                [2]
    JR        NZ,0x2170E0                        [2]
    LD        A,0                                [2]
    LD        (0x60FD),A                         [4]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2170E4

sub_2170E4:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (0x60F1),A                         [4]
    LD        A,0x50                             [2]
    LD        (0x60F5),A                         [4]
    LD        A,0xA0                             [2]
    LD        (0x60F3),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F7),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F2),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F6),A                         [4]
    LD        A,0x98                             [2]
    LD        (0x60F4),A                         [4]
    LD        A,0x98                             [2]
    LD        (0x60F8),A                         [4]
    LD        A,2                                [2]
    LD        (0x60F9),A                         [4]
    LD        A,0                                [2]
    LD        (0x60FA),A                         [4]
    LD        A,0xFC                             [2]
    LD        (0x60FB),A                         [4]
    LD        A,0                                [2]
    LD        (0x60FC),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x21712F

dyn_21712F:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (0x60F1),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F5),A                         [4]
    LD        A,0xA0                             [2]
    LD        (0x60F3),A                         [4]
    LD        A,0xA0                             [2]
    LD        (0x60F7),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F2),A                         [4]
    LD        A,0x4C                             [2]
    LD        (0x60F6),A                         [4]
    LD        A,0x98                             [2]
    LD        (0x60F4),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F8),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F9),A                         [4]
    LD        A,2                                [2]
    LD        (0x60FA),A                         [4]
    LD        A,0                                [2]
    LD        (0x60FB),A                         [4]
    LD        A,0xFC                             [2]
    LD        (0x60FC),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x21717A

swp_21717A:
    JP        (XHL)                              [2]

.org 0x2171A8

sub_2171A8:
    POP       XWA                                [1]
    LD        (XIZ+8),XWA                        [3]
    RET                                          [1]

.org 0x2171AD

swp_2171AD:
    XOR       A,A                                [2]
.loop:
    CPB       (XHL+),0xFF                        [4]
    RET       Z                                  [2]
    INC       1,A                                [2]
    JR        .loop                              [2]

.org 0x2171B9

swp_2171B9:
    PUSH      WA                                 [1]
    PUSH      HL                                 [1]
    LD        E,C                                [2]
    LD        C,B                                [2]
    CALL      sub_20768A                         [4]
    POP       HL                                 [1]
    POP       WA                                 [1]
    CALL      swp_207695                         [4]
    RET                                          [1]

.org 0x2171CA

swp_2171CA:
    LD{1}     XBC,XHL                            [2]
.loop:
    LD        L,(XBC+)                           [3]
    CP        L,0xFF                             [3]
    JR        Z,.done                            [2]
    PUSH      XBC                                [1]
    PUSH      WA                                 [1]
    CALL      swp_207695                         [4]
    POP       WA                                 [1]
    POP       XBC                                [1]
    JR        .loop                              [2]
.done:
    RET                                          [1]

.org 0x2171DF

swp_2171DF:
    PUSH      WA                                 [1]
    PUSH      XHL                                [1]
    LD        E,C                                [2]
    LD        C,B                                [2]
    CALL      sub_20768A                         [4]
    POP       XHL                                [1]
    POP       WA                                 [1]
    CALL      swp_2171CA                         [4]
    RET                                          [1]

.org 0x2171F0

swp_2171F0:
    LD        C,6                                [2]
    MUL       BC,B                               [2]
    LDA       XDE,XHL+BC                         [5]
    LD        B,(XDE+)                           [3]
    LD        C,(XDE+)                           [3]
    LD        XHL,(XDE+)                         [3]
    CALL      swp_2171DF                         [4]
    RET                                          [1]

.org 0x217207

swp_217207:
    LD        C,B                                [2]
    XOR       B,B                                [2]
.loop:
    CP        B,C                                [2]
    JR        NC,.done                           [2]
    PUSH      BC                                 [1]
    PUSH      WA                                 [1]
    PUSH      XHL                                [1]
    CALL      swp_2171F0                         [4]
    POP       XHL                                [1]
    POP       WA                                 [1]
    POP       BC                                 [1]
    INC       1,B                                [2]
    JR        .loop                              [2]
.done:
    RET                                          [1]

.org 0x21721E

swp_21721E:
    CALL      GetTextBox                         [4]
    LD        B,(XWA+2)                          [3]
    LD        C,(XWA+3)                          [3]
    AND       B,0x1F                             [3]
    AND       C,0x1F                             [3]
    RET                                          [1]

.org 0x21722F

swp_21722F:
    PUSH      BC                                 [1]
    CALL      swp_21721E                         [4]
    POP       DE                                 [1]
    ADD       B,D                                [2]
    ADD       C,E                                [2]
    LD        E,C                                [2]
    LD        C,B                                [2]
    EXTZ      BC                                 [2]
    EXTZ      DE                                 [2]
    SLL       3,BC                               [3]
    SLL       3,DE                               [3]
    ADD       BC,2                               [4]
    ADD       DE,4                               [4]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
    RET                                          [1]

.org 0x21725D

sub_21725D:
    CALL      GetTextBox                         [4]
    LD        XHL,(XWA+8)                        [3]
    OR        XHL,XHL                            [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21726A

swp_21726A:
    CALL      GetTextBox                         [4]
    LD        A,(XWA+0x12)                       [3]
    AND       A,0x7F                             [3]
    CP        A,2                                [2]
    RCF                                          [1]
    RET       NZ                                 [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21727B

swp_21727B:
    CALL      GetTextBox                         [4]
    LD        A,(XWA+0x12)                       [3]
    CP        A,1                                [2]
    RCF                                          [1]
    RET       NZ                                 [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x217289

swp_217289:
    CALL      GetTextBox                         [4]
    LD        (XWA+0x10),B                       [3]
    RET                                          [1]

.org 0x217291

swp_217291:
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    RET                                          [1]

.org 0x217299

swp_217299:
    LD        QC,0x10                            [4]
    JR        loc_2172AA                         [2]

.org 0x21729F

swp_21729F:
    LD        QC,0                               [3]
    LD        QB,1                               [3]
    JR        0x2172AF                           [2]

.org 0x2172A7

swp_2172A7:
    LD        QC,0                               [3]

.org 0x2172AA

loc_2172AA:
    LD        QB,1                               [3]
    EXTZ      DE                                 [2]
    ADD       B,W                                [2]
    DEC       1,B                                [2]
.loop:
    RLC       16,XBC                             [3]
    PUSH      WA                                 [1]
    LD{1}     WA,DE                              [2]
    EXTZ      XWA                                [2]
    DIV       XWA,0xA                            [4]
    LD        DE,WA                              [2]
    SRL       16,XWA                             [3]
    CP        WA,0                               [2]
    JR        NZ,.skip                           [2]
    OR        B,B                                [2]
    JR        NZ,.skip                           [2]
    LD{1}     WA,BC                              [2]
.skip:
    OR        DE,DE                              [2]
    JR        NZ,.skip2                          [2]
    XOR       B,B                                [2]
.skip2:
    LD        XHL,swp_2172F2                     [5]
    LD        L,(XHL+WA)                         [5]
    POP       WA                                 [1]
    RLC       16,XBC                             [3]
    PUSH      XBC                                [1]
    PUSH      DE                                 [1]
    PUSH      WA                                 [1]
    CALL      swp_2171B9                         [4]
    POP       WA                                 [1]
    POP       DE                                 [1]
    POP       XBC                                [1]
    DEC       1,B                                [2]
    DJNZ      W,.loop                            [3]
    RET                                          [1]

.org 0x2172F2

swp_2172F2:
    LD        XBC,0x45444342                     [5]
    LD        XIZ,0x4A494847                     [5]
    LD        A,0x22                             [2]
    LD        C,0x24                             [2]
    LD        E,0x26                             [2]
    NOP                                          [1]

.org 0x217303

sub_217303:
    LD        QC,0x10                            [4]
    JR        loc_21730C                         [2]

.org 0x217309

swp_217309:
    LD        QC,0                               [3]

.org 0x21730C

loc_21730C:
    LD        QB,1                               [3]
    ADD       B,W                                [2]
    DEC       1,B                                [2]
.loop:
    RLC       16,XBC                             [3]
    PUSH      WA                                 [1]
    LD{1}     WA,DE                              [2]
    AND       WA,0xF                             [4]
    SRL       4,XDE                              [3]
    CP        WA,0                               [2]
    JR        NZ,.skip                           [2]
    OR        B,B                                [2]
    JR        NZ,.skip                           [2]
    LD{1}     WA,BC                              [2]
.skip:
    OR        XDE,XDE                            [2]
    JR        NZ,.skip2                          [2]
    XOR       B,B                                [2]
.skip2:
    LD        XHL,swp_2172F2                     [5]
    LD        L,(XHL+WA)                         [5]
    POP       WA                                 [1]
    RLC       16,XBC                             [3]
    PUSH      XBC                                [1]
    PUSH      XDE                                [1]
    PUSH      WA                                 [1]
    CALL      swp_2171B9                         [4]
    POP       WA                                 [1]
    POP       XDE                                [1]
    POP       XBC                                [1]
    DEC       1,B                                [2]
    DJNZ      W,.loop                            [3]
    RET                                          [1]

.org 0x21734E

sub_21734E:
    PUSH      WA                                 [1]
    LD        E,0                                [2]
    LD        C,0                                [2]
    CALL      sub_20768A                         [4]
    POP       WA                                 [1]
    CALL      dyn_2075CC                         [4]
    RET                                          [1]

.org 0x21735D

swp_21735D:
    PUSH      WA                                 [1]
    PUSH      BC                                 [1]
    PUSH      XHL                                [1]
    CALL      swp_2171DF                         [4]
    POP       XHL                                [1]
    CALL      swp_2171AD                         [4]
    POP       BC                                 [1]
    ADD       B,A                                [2]
    SLL       1,A                                [3]
    LD        XHL,0x21737F                       [5]
    LDA       XHL,XHL+A                          [5]
    POP       WA                                 [1]
    CALL      swp_2171DF                         [4]
    RET                                          [1]
    .db 00 00 00 00 00 00 FF

.org 0x21739F

sub_21739F:
    CP        W,6                                [2]
    JR        C,.skip                            [2]
    SUB       W,5                                [3]
    JP        loc_217386                         [4]
.skip:
    OR        WA,WA                              [2]
    JP        Z,loc_217427                       [5]
    CALL      sub_21B94A                         [4]
    JP        NC,loc_217427                      [5]
    CALL      sub_21B963                         [4]
    CALL      swp_21B987                         [4]
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
    .db 6C 6E 6D 70 6F 6A 6B 73

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

.org 0x2175A8

swp_2175A8:
    LD        A,1                                [2]
    LD        (0x610C),A                         [4]
    RET                                          [1]

.org 0x2175AF

swp_2175AF:
    XOR       A,A                                [2]
    LD        (0x610C),A                         [4]
    RET                                          [1]

.org 0x2175B6

swp_2175B6:
    LD        (0x610D),A                         [4]
    RET                                          [1]

.org 0x2175BB

swp_2175BB:
    LD        (0x610E),B                         [4]
    LD        (0x610F),C                         [4]
    RET                                          [1]

.org 0x2175C4

swp_2175C4:
    LD        XWA,.resume                        [5]
    LD        (XIZ+8),XWA                        [3]
.resume:
    LD        XWA,.resume2                       [5]
    LD        (XIZ+8),XWA                        [3]
.resume2:
    INCB      1,(0x6110)                         [4]
    LD        A,(0x6110)                         [4]
    SRL       5,A                                [3]
    RET       C                                  [2]
    LD        A,(0x610C)                         [4]
    OR        A,A                                [2]
    RET       Z                                  [2]
    LD        A,(0x610D)                         [4]
    LD        B,(0x610E)                         [4]
    LD        C,(0x610F)                         [4]
    CALL      swp_21722F                         [4]
    RET                                          [1]

.org 0x2175FA

swp_2175FA:
    LD        XWA,.done                          [5]
    LD        (XIZ+8),XWA                        [3]
.done:
    RET                                          [1]

.org 0x217603

sub_217603:
    XOR       A,A                                [2]
    LD        (0x6115),A                         [4]
    LD        (0x6116),A                         [4]
    LD        (0x611C),A                         [4]
    LD        XHL,swp_2177A9                     [5]
    CALL      StartChildTask                     [4]
    LD        (0x6111),XHL                       [4]
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

.org 0x217634

swp_217634:
    POP       XHL                                [1]
    LD        (0x6128),XHL                       [4]
.loop:
    LD        XHL,(0x6117)                       [4]
    OR        XHL,XHL                            [2]
    JR        NZ,.skip                           [2]
    LD        A,(0x6115)                         [4]
    CALL      sub_21725D                         [4]
    JR        NC,.skip2                          [2]
.skip:
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip2:
    LD        XHL,(0x6128)                       [4]
    JP        (XHL)                              [2]

.org 0x217657

swp_217657:
    POP       XHL                                [1]
    LD        (0x612C),XHL                       [4]
    LDB       (0x611C),1                         [5]
.loop:
    LD        XHL,(0x6117)                       [4]
    OR        XHL,XHL                            [2]
    JR        NZ,.skip                           [2]
    LD        A,(0x6115)                         [4]
    CALL      sub_21725D                         [4]
    JR        NC,.skip2                          [2]
.skip:
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip2:
    LDB       (0x611C),0                         [5]
    LD        XHL,(0x612C)                       [4]
    JP        (XHL)                              [2]

.org 0x217684

swp_217684:
    LD        A,(0x6115)                         [4]
    CALL      dyn_207611                         [4]
    CALL      swp_217657                         [4]
    LD        A,(0x6115)                         [4]
    CALL      sub_21734E                         [4]
    RET                                          [1]

.org 0x217699

swp_217699:
    LD        A,(0x6115)                         [4]
    CALL      swp_2171DF                         [4]
    RET                                          [1]

.org 0x2176A2

swp_2176A2:
    LD        (0x611F),XHL                       [4]
    POP       XHL                                [1]
    LD        (0x6123),XHL                       [4]
    CALL      swp_217684                         [4]
    LD        XHL,(0x611F)                       [4]
    CALL      0x21762F                           [4]
    CALL      swp_217634                         [4]
    LD        XHL,0x21774C                       [5]
    LD        BC,0x402                           [3]
    CALL      swp_217699                         [4]
    LD        A,(0x6115)                         [4]
    CALL      swp_2175B6                         [4]
    CALL      swp_2175A8                         [4]
    XOR       A,A                                [2]
    LD        (0x611E),A                         [4]
.loop:
    LD        XHL,0x217755                       [5]
    LD        B,(XHL+A)                          [5]
    LD        C,2                                [2]
    CALL      swp_2175BB                         [4]
.loop2:
    CALL      sub_2171A8                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        NZ,.skip4                          [2]
    BIT       5,A                                [3]
    JR        NZ,.skip5                          [2]
    BIT       2,A                                [3]
    JR        NZ,.skip                           [2]
    BIT       3,A                                [3]
    JR        NZ,.skip2                          [2]
    JR        .loop2                             [2]
.skip:
    LD        A,0                                [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,1                                [2]
.skip3:
    CP        (0x611E),A                         [4]
    JR        Z,.loop2                           [2]
    LD        (0x611E),A                         [4]
    LD        WA,0x80                            [3]
    CALL      sub_21990C                         [4]
    LD        A,(0x611E)                         [4]
    JR        .loop                              [2]
.skip4:
    LD        WA,0x81                            [3]
    CALL      sub_21990C                         [4]
    LD        A,(0x611E)                         [4]
    JR        .skip6                             [2]
.skip5:
    LD        WA,0x82                            [3]
    CALL      sub_21990C                         [4]
    LD        A,0xFF                             [2]
.skip6:
    LD        (0x611E),A                         [4]
    CALL      swp_2175AF                         [4]
    LD        A,(0x611E)                         [4]
    LD        XHL,(0x6123)                       [4]
    JP        (XHL)                              [2]
    .db 39 05 13 00 00 00 2E 0F FF 04 0A

.org 0x21777C

loc_21777C:
    POP       XHL                                [1]
    LD        (0x6123),XHL                       [4]
.loop:
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    DEC       1,A                                [2]
    LD        (0x6127),A                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        NZ,.skip                           [2]
    BIT       5,A                                [3]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    LD        A,(0x6127)                         [4]
    JR        .loop                              [2]
.skip:
    LD        XHL,(0x6123)                       [4]
    JP        (XHL)                              [2]

.org 0x2177A9

swp_2177A9:
    LD        XWA,.resume                        [5]
    LD        (XIZ+8),XWA                        [3]
.resume:
    LD        XWA,.resume2                       [5]
    LD        (XIZ+8),XWA                        [3]
.resume2:
    LD        A,(0x6115)                         [4]
    CALL      sub_21725D                         [4]
    JR        NC,.skip5                          [2]
    LD        A,(0x6115)                         [4]
    CALL      swp_21726A                         [4]
    JR        NC,.skip                           [2]
    LDB       (0x611D),1                         [5]
    LD        B,(0x611B)                         [4]
    LD        A,(0x6115)                         [4]
    CALL      swp_217289                         [4]
.skip:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        NZ,.skip2                          [2]
    BIT       5,A                                [3]
    JR        NZ,.skip2                          [2]
    JR        .skip3                             [2]
.skip2:
    CPB       (0x611D),0                         [5]
    JR        Z,.skip4                           [2]
    LDB       (0x611D),0                         [5]
.skip3:
    CPB       (0x611C),0                         [5]
    JR        Z,.done                            [2]
.skip4:
    LDB       (0x611C),0                         [5]
    LD        B,0                                [2]
    LD        A,(0x6115)                         [4]
    CALL      swp_217289                         [4]
.done:
    RET                                          [1]
.skip5:
    LD        XHL,(0x6117)                       [4]
    OR        XHL,XHL                            [2]
    RET       Z                                  [2]
    LDB       (0x611D),0                         [5]
    LD        XHL,(0x6117)                       [4]
    LD        A,(0x6115)                         [4]
    CALL      swp_217291                         [4]
    LD        B,(0x611B)                         [4]
    LD        A,(0x6115)                         [4]
    CALL      swp_217289                         [4]
    XOR       XHL,XHL                            [2]
    LD        (0x6117),XHL                       [4]
    RET                                          [1]

.org 0x21783D

swp_21783D:
    LD        XWA,.done                          [5]
    LD        (XIZ+8),XWA                        [3]
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

.org 0x21785B

loc_21785B:
    LD        W,0xFF                             [2]
    LD        (0x6137),WA                        [4]
    POP       XHL                                [1]
    LD        (0x6131),XHL                       [4]
    XOR       WA,WA                              [2]
    LD        (0x6135),WA                        [4]
.loop:
    LD        WA,(0x6135)                        [4]
    OR        WA,WA                              [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip:
    CALL      sub_2171A8                         [4]
    LD        WA,(0x6135)                        [4]
    LD        XHL,(0x6131)                       [4]
    JP        (XHL)                              [2]

.org 0x217888

sub_217888:
    LD        A,1                                [2]
    JP        loc_21785B                         [4]

.org 0x21788E

swp_21788E:
    LD        A,2                                [2]
    JP        loc_21785B                         [4]

.org 0x217894

sub_217894:
    LD        A,3                                [2]
    JP        loc_21785B                         [4]

.org 0x21789A

sub_21789A:
    LD        A,4                                [2]
    JP        loc_21785B                         [4]

.org 0x2178A0

swp_2178A0:
    LD        A,5                                [2]
    JP        loc_21785B                         [4]

.org 0x2178A6

loc_2178A6:
    LD        A,(0x6137)                         [4]
    CP        A,6                                [2]
    JR        NC,.skip                           [2]
    LD        XHL,0x2178BD                       [5]
    SLL       2,A                                [3]
    LD        XHL,(XHL+A)                        [5]
    JP        (XHL)                              [2]
    .db E4 78 21 00 EC 78 21 00 05 79 21 00 0B 79 21 00
    .db 21 79 21 00 35 79 21 00
.skip:
    LD        WA,0xFFFF                          [3]
    LDW       (0x6137),0                         [6]
    LD        W,0xFF                             [2]
    LD        (0x6135),WA                        [4]
    CALL      sub_2171A8                         [4]
    JP        loc_2178A6                         [4]

.org 0x2178EC

swp_2178EC:
    LD        A,2                                [2]
    LD        C,8                                [2]
    LD        E,0xB                              [2]
    LD        HL,0x42                            [3]
    CALL      dyn_207494                         [4]
    XOR       A,A                                [2]
    LD        (0x6130),A                         [4]
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217905

swp_217905:
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x21790B

swp_21790B:
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,2                                [2]
    LD        C,0xC                              [2]
    LD        E,0x20                             [2]
    CALL      dyn_2074C0                         [4]
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217921

swp_217921:
    LD        A,(0x6130)                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip                           [2]
    LD        A,1                                [2]
    LD        (0x6130),A                         [4]
.skip:
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217935

swp_217935:
    LD        A,(0x6130)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    XOR       A,A                                [2]
    LD        (0x6130),A                         [4]
.skip:
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217949

sub_217949:
    XOR       XWA,XWA                            [2]
    LD        (0x6146),XWA                       [4]
    LD        (0x613E),XWA                       [4]
    LD        XHL,swp_217A04                     [5]
    CALL      StartChildTask                     [4]
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
    .db 5C 7A 21 00 68 7A 21 00 7A 7B 21 00 74 7A 21 00
    .db C0 7A 21 00 A4 7A 21 00 56 7B 21 00 5C 7A 21 00
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
