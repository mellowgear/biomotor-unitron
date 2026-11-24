; engine/text: 19 routines (each keeps its ROM address with .org)

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

.org 0x20748A

; A = box number -> XWA = wTextBoxes + 0x13*A
GetTextBox:
    MUL{1}    WA,0x13                            [3]
    ADD       WA,0x5CE3                          [4]
    EXTZ      XWA                                [2]
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

.org 0x2084F2

; XHL = message: expand it, start it in text box 0
ShowMessage:
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    CALL      ExpandMessage                      [4]
    LD        (XWA+8),XHL                        [3]
    LDB       (XWA+0x10),(0x5280)                [5]
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
