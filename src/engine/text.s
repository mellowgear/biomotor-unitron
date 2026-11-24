; engine/text: 39 routines (each keeps its ROM address with .org)

.org 0x207073

; L = character code -> XHL = glyph in Font
GetFontGlyph:
    OR        L,L                                [2]
    JR        Z,dyn_20708D                       [2]
    EXTZ      HL                                 [2]
    DEC       1,HL                               [2]
    CP        HL,(0x2C8DA7)                      [5]
    JR        NC,dyn_20708D                      [2]
    MUL       XHL,0x10                           [4]
    ADD       XHL,0x2C8DA9                       [6]
    RET                                          [1]

.org 0x20708D

dyn_20708D:
    LD        XHL,BlankGlyph                     [5]
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
    .db 0xB3, 0x73, 0x20, 0x00, 0x3A, 0x74, 0x20, 0x00, 0x43, 0x74, 0x20, 0x00

.org 0x2073B3

; one byte of the text stream at window+8
TextStep:
    LD        XBC,(XWA+8)                        [3]
    OR        XBC,XBC                            [2]
    RET       Z                                  [2]
    LD        L,(XBC+)                           [3]
    LD        (XWA+8),XBC                        [3]
    CP        L,0xF0                             [3]
    JR        NC,dyn_2073D7                      [2]
    CALL      DrawTextChar                       [4]
    LD        L,(XWA+0x10)                       [3]
    LD        (XWA+0x11),L                       [3]
    OR        L,L                                [2]
    JR        Z,TextStep                         [2]
    INCB      1,(XWA+0x12)                       [3]
    RET                                          [1]

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
    .db 0x0C, 0x74, 0x20, 0x00, 0x57, 0x76, 0x20, 0x00, 0xD0, 0x75, 0x20, 0x00, 0x18, 0x74, 0x20, 0x00
    .db 0x27, 0x74, 0x20, 0x00, 0x36, 0x74, 0x20, 0x00

.org 0x20740C

; FF
TextCmd_End:
    LD        XHL,(XWA+0xC)                      [3]
    LD        (XWA+8),XHL                        [3]
    LD        XHL,0                              [2]
    LD        (XWA+0xC),XHL                      [3]
    RET                                          [1]

.org 0x207418

; FC: inserts the string at 0x5013
TextCmd_PlayerName:
    LD        XHL,(XWA+8)                        [3]
    LD        (XWA+0xC),XHL                      [3]
    LD        XHL,wPlayerName                    [5]
    LD        (XWA+8),XHL                        [3]
    RET                                          [1]

.org 0x207427

; FB: inserts the string at 0x502F
TextCmd_Name2:
    LD        XHL,(XWA+8)                        [3]
    LD        (XWA+0xC),XHL                      [3]
    LD        XHL,wPartnerName                   [5]
    LD        (XWA+8),XHL                        [3]
    RET                                          [1]

.org 0x207436

; FA
TextCmd_Wait:
    INCB      2,(XWA+0x12)                       [3]
    RET                                          [1]

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

.org 0x20748A

; A = box number -> XWA = wTextBoxes + 0x13*A
GetTextBox:
    MUL{1}    WA,0x13                            [3]
    ADD       WA,0x5CE3                          [4]
    EXTZ      XWA                                [2]
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

.org 0x2074AA

; [code] text box with bit 7 set in +0x12, then TextCmd_Page
OpenTextBoxNoWait:
    CALL      GetTextBox                         [4]
    LD        (XWA+0),HL                         [3]
    LD        (XWA+4),C                          [3]
    LD        (XWA+5),E                          [3]
    LDB       (XWA+0x12),0x80                    [4]
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
    LDB       (XWA+0x10),(wOptionMessageSpeed)   [5]
    LD        (XWA+0x11),E                       [3]
    LD        (XWA+0x12),E                       [3]
    RET                                          [1]

.org 0x2075CC

dyn_2075CC:
    CALL      GetTextBox                         [4]

.org 0x2075D0

; FD
TextCmd_Page:
    BIT       7,(XWA+0x12)                       [3]
    JR        NZ,dyn_2075F6                      [2]
    LDB       (XWA+6),0                          [4]
    LDB       (XWA+7),0                          [4]
    LD        C,(XWA+4)                          [3]
    LD        B,(XWA+5)                          [3]
    DEC       2,C                                [2]
    DEC       2,B                                [2]
    MUL       BC,B                               [2]
    PUSH      XWA                                [1]
    LD        WA,(XWA+0)                         [3]
    LD        QA,1                               [3]
    CALL      FillTiles                          [4]
    POP       XWA                                [1]
    RET                                          [1]

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

.org 0x207653

swp_207653:
    CALL      GetTextBox                         [4]

.org 0x207657

; FE
TextCmd_Newline:
    BIT       7,(XWA+0x12)                       [3]
    JR        NZ,dyn_207674                      [2]
    LDB       (XWA+6),0                          [4]
    INCB      1,(XWA+7)                          [3]
    LD        B,(XWA+5)                          [3]
    DEC       2,B                                [2]
    CP        (XWA+7),B                          [3]
    RET       C                                  [2]
    DEC       1,B                                [2]
    LD        (XWA+7),B                          [3]
    RCF                                          [1]
    RET                                          [1]

.org 0x207699

DrawTextChar:
    CP        L,0xF0                             [3]
    JR        NC,dyn_2076B1                      [2]
    CALL      0x207720                           [4]
    CALL      GetFontGlyph                       [4]
    LD        BC,8                               [3]
    LDIRW     (XDE+),(XHL+)                      [2]
    CALL      0x20762D                           [4]
    RCF                                          [1]
    RET                                          [1]

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
    .db 0xDE, 0x76, 0x20, 0x00, 0x57, 0x76, 0x20, 0x00, 0xD0, 0x75, 0x20, 0x00, 0xDF, 0x76, 0x20, 0x00
    .db 0xE9, 0x76, 0x20, 0x00, 0xDE, 0x76, 0x20, 0x00

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

.org 0x2084F2

; XHL = message: expand it, start it in text box 0
ShowMessage:
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    CALL      ExpandMessage                      [4]
    LD        (XWA+8),XHL                        [3]
    LDB       (XWA+0x10),(wOptionMessageSpeed)   [5]
    RET                                          [1]

.org 0x208505

; copy XHL to wTextBuffer, expanding placeholders 0x90-0xEF
ExpandMessage:
    PUSH      XWA                                [1]
    PUSH      XBC                                [1]
    PUSH      XDE                                [1]
    LD        XDE,wTextBuffer                    [5]
.loop:
    LD        A,(XHL+)                           [3]
    CP        A,0xF0                             [3]
    JR        NC,.skip                           [2]
    CP        A,0x90                             [3]
    JR        NC,.skip2                          [2]
.skip:
    LD        (XDE+),A                           [3]
    CP        A,0xFF                             [3]
    JR        NZ,.loop                           [2]
    POP       XDE                                [1]
    POP       XBC                                [1]
    POP       XWA                                [1]
    LD        XHL,wTextBuffer                    [5]
    RET                                          [1]
.skip2:
    SUB       A,0x90                             [3]
    LD        XBC,0                              [2]
    LD        C,A                                [2]
    SLL       2,BC                               [3]
    ADD       XBC,MessagePlaceholders            [6]
    LD        XBC,(XBC)                          [2]
    CALL      (XBC)                              [2]
    JR        .loop                              [2]

.org 0x2085D5

; <NUM0>-<NUM15>: decimal of argument n (text box +0xE + 2n)
MsgInsertNumber:
    LD        W,0                                [2]
    SLL       1,WA                               [3]
    ADD       WA,0xE                             [4]
    LD        BC,(XIZ+WA)                        [5]
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    LD        XHL,wNumberBuffer                  [5]
.loop:
    EXTZ      XBC                                [2]
    DIV       XBC,0xA                            [4]
    LD        WA,QBC                             [3]
    ADD       WA,(0x208610)                      [5]
    LD        (XHL+),A                           [3]
    OR        BC,BC                              [2]
    JR        NZ,.loop                           [2]
    POP       XDE                                [1]
.loop2:
    LD        A,(-XHL)                           [3]
    LD        (XDE+),A                           [3]
    CP        XHL,0x4100                         [6]
    JR        GT,.loop2                          [2]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x208610

swp_208610:
    LD        XBC,0xC900203B                     [5]
    DAA       B                                  [2]
    SLL       1,WA                               [3]
    ADD       WA,0xE                             [4]
    LD        XHL,(XIZ+WA)                       [5]
    CALR      loc_20867E                         [3]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x208628

; <ENEMY>
MsgInsertEnemyName:
    PUSH      XHL                                [1]
    LD        L,(wEnemyId)                       [4]
    CALL      GetEnemyName                       [4]
    CALR      loc_20867E                         [3]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x208636

; <RIGHTARM> (B1)
MsgInsertRightArm:
    PUSH      XHL                                [1]
    LD        L,(wEquipRightArm)                 [4]
    OR        L,L                                [2]
    JR        Z,.skip                            [2]
    CALL      GetArmName                         [4]
    CALR      loc_20867E                         [3]
.skip:
    POP       XHL                                [1]
    RET                                          [1]

.org 0x208648

; <LEFTARM> (B2)
MsgInsertLeftArm:
    PUSH      XHL                                [1]
    LD        L,(wEquipLeftArm)                  [4]
    OR        L,L                                [2]
    JR        Z,.skip                            [2]
    CALL      GetArmName                         [4]
    CALR      loc_20867E                         [3]
.skip:
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20865A

; <SKILL1>
MsgInsertSkill1:
    PUSH      XHL                                [1]
    LD        L,(wSkill1)                        [4]
    OR        L,L                                [2]
    JR        Z,.skip                            [2]
    CALL      GetSkillName                       [4]
    CALR      loc_20867E                         [3]
.skip:
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20866C

; <SKILL2>
MsgInsertSkill2:
    PUSH      XHL                                [1]
    LD        L,(wSkill2)                        [4]
    OR        L,L                                [2]
    JR        Z,.skip                            [2]
    CALL      GetSkillName                       [4]
    CALR      loc_20867E                         [3]
.skip:
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20867E

loc_20867E:
    LD        A,(XHL+)                           [3]
    CP        A,0xFF                             [3]
    RET       Z                                  [2]
    LD        (XDE+),A                           [3]
    JR        loc_20867E                         [2]
