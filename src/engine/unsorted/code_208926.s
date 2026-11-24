; engine/unsorted/code_208926: 99 routines (each keeps its ROM address with .org)

.org 0x208926

swp_208926:
    RET                                          [1]

.org 0x208927

swp_208927:
    OR        WA,1                               [4]
    RET                                          [1]

.org 0x208931

swp_208931:
    OR        WA,4                               [4]
    RET                                          [1]

.org 0x208940

swp_208940:
    OR        WA,0x20                            [4]
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

.org 0x20898E

swp_20898E:
    ADDW      (wUnitSP),0xA                      [6]
    RET                                          [1]

.org 0x208995

swp_208995:
    ADDW      (wUnitSP),0x14                     [6]
    RET                                          [1]

.org 0x20899C

swp_20899C:
    ADDW      (wUnitSP),0x1E                     [6]
    RET                                          [1]

.org 0x2089A3

swp_2089A3:
    ADDW      (wUnitRP),0xA                      [6]
    RET                                          [1]

.org 0x2089AA

swp_2089AA:
    ADDW      (wUnitRP),0x14                     [6]
    RET                                          [1]

.org 0x2089B1

swp_2089B1:
    ADDW      (wUnitRP),0x1E                     [6]
    RET                                          [1]

.org 0x2089B8

swp_2089B8:
    ADDW      (wUnitMP),0xA                      [6]
    RET                                          [1]

.org 0x2089BF

swp_2089BF:
    ADDW      (wUnitMP),0x14                     [6]
    RET                                          [1]

.org 0x2089C6

swp_2089C6:
    ADDW      (wUnitMP),0x1E                     [6]
    RET                                          [1]

.org 0x2089EB

swp_2089EB:
    LD        A,(0x5D92)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(wUnitMaxEP)                   [4]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208A27

sub_208A27:
    PUSH      WA                                 [1]
    LD        A,(0x5D8D)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208AD5

sub_208AD5:
    PUSH      WA                                 [1]
    LD        A,(0x5DBD)                         [4]
    LD        W,0                                [2]
    MUL       XWA,(XSP+)                         [3]
    DIV       XWA,0x64                           [4]
    RET                                          [1]

.org 0x208B0C

swp_208B0C:
    LD        A,(XIZ+0x12)                       [3]
    LD        (XIZ+0x14),A                       [3]
    LDW       (XIZ+8),0x8B1C                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        A,0xFF                             [2]
    MUL       WA,(XIZ+0x14)                      [3]
    DIV       WA,(XIZ+0x12)                      [3]
    CPL       A                                  [2]
    LD        B,A                                [2]
    LD        D,A                                [2]
    LD        C,(XIZ+0xE)                        [3]
    LD        E,(XIZ+0x10)                       [3]
    CALL      sub_206D30                         [4]
    CPB       (XIZ+0x14),0                       [4]
    JP        Z,EndTask                          [5]
    DECB      1,(XIZ+0x14)                       [3]
    RET                                          [1]

.org 0x208B41

swp_208B41:
    LD        A,(XIZ+0x12)                       [3]
    LD        (XIZ+0x14),A                       [3]
    LDW       (XIZ+8),0x8B51                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        A,0xFF                             [2]
    MUL       WA,(XIZ+0x14)                      [3]
    DIV       WA,(XIZ+0x12)                      [3]
    LD        B,A                                [2]
    LD        D,A                                [2]
    LD        C,(XIZ+0xE)                        [3]
    LD        E,(XIZ+0x10)                       [3]
    CALL      sub_206D30                         [4]
    CPB       (XIZ+0x14),0                       [4]
    JP        Z,EndTask                          [5]
    DECB      1,(XIZ+0x14)                       [3]
    RET                                          [1]

.org 0x208B74

swp_208B74:
    LD        WA,(XIZ+0xE)                       [3]
    LD        (XIZ+0x10),WA                      [3]
    LDW       (XIZ+8),0x8B84                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,0x7F                            [3]
    MUL       XWA,(XIZ+0x10)                     [3]
    DIV       XWA,(XIZ+0xE)                      [3]
    NEG       A                                  [2]
    LD        (0x585B),A                         [4]
    CPW       (XIZ+0x10),0                       [5]
    JP        Z,EndTask                          [5]
    DECW      1,(XIZ+0x10)                       [3]
    RET                                          [1]

.org 0x208BCE

swp_208BCE:
    LD        WA,(XIZ+0xE)                       [3]
    LD        (XIZ+0x10),WA                      [3]
    LDW       (XIZ+8),0x8BDE                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,0x7F                            [3]
    MUL       XWA,(XIZ+0x10)                     [3]
    DIV       XWA,(XIZ+0xE)                      [3]
    LD        (0x585B),A                         [4]
    CPW       (XIZ+0x10),0                       [5]
    JP        Z,EndTask                          [5]
    DECW      1,(XIZ+0x10)                       [3]
    RET                                          [1]

.org 0x208BF9

swp_208BF9:
    LDW       (XIZ+0x10),0                       [5]
    LDW       (XIZ+8),0x8C08                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,0x7F                            [3]
    MUL       XWA,(XIZ+0x10)                     [3]
    DIV       XWA,(XIZ+0xE)                      [3]
    LD        (0x585B),A                         [4]
    LD        WA,(XIZ+0xE)                       [3]
    CP        (XIZ+0x10),WA                      [3]
    JP        NC,EndTask                         [5]
    INCW      1,(XIZ+0x10)                       [3]
    RET                                          [1]

.org 0x208C24

swp_208C24:
    LDB       (0x5A7F),2                         [5]
    LDW       (XIZ+0x10),4                       [5]
    LD        XHL,swp_208C74                     [5]
    LD        (XIZ+8),XHL                        [3]
    JP        (XHL)                              [2]

.org 0x208C38

swp_208C38:
    LDB       (0x5A7F),2                         [5]
    LDW       (XIZ+0x10),8                       [5]
    LD        XHL,swp_208C74                     [5]
    LD        (XIZ+8),XHL                        [3]
    JP        (XHL)                              [2]

.org 0x208C4C

swp_208C4C:
    LDB       (0x5A7F),4                         [5]
    LDW       (XIZ+0x10),4                       [5]
    LD        XHL,swp_208C74                     [5]
    LD        (XIZ+8),XHL                        [3]
    JP        (XHL)                              [2]

.org 0x208C60

swp_208C60:
    LDB       (0x5A7F),4                         [5]
    LDW       (XIZ+0x10),8                       [5]
    LD        XHL,swp_208C74                     [5]
    LD        (XIZ+8),XHL                        [3]
    JP        (XHL)                              [2]

.org 0x208C74

swp_208C74:
    LD        WA,(XIZ+0x10)                      [3]
    SLL       1,WA                               [3]
    DEC       1,WA                               [2]
    LD        (XIZ+0x12),WA                      [3]
    CALL      RandomRange                        [4]
    SUB       WA,(XIZ+0x10)                      [3]
    LD        (0x5A80),A                         [4]
    LD        WA,(XIZ+0x12)                      [3]
    CALL      RandomRange                        [4]
    SUB       WA,(XIZ+0x10)                      [3]
    LD        (0x5A81),A                         [4]
    DECW      1,(XIZ+0xE)                        [3]
    CPW       (XIZ+0xE),0                        [5]
    RET       NZ                                 [2]
    LDB       (0x5A7F),0                         [5]
    LDB       (0x5A80),0                         [5]
    LDB       (0x5A81),0                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x208CB6

loc_208CB6:
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XIZ+0xE),WA                       [3]
    LD        WA,0x8000                          [3]
    LD        (XIZ+0x10),WA                      [3]
    LD        (XIZ+0x12),WA                      [3]
    LD        (XIZ+0x14),WA                      [3]
    LD        (XIZ+0x16),WA                      [3]
    LDW       (XIZ+8),0x8CD8                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        XWA,0                              [2]
    LD        WA,(XIZ+0xE)                       [3]
    OR        WA,WA                              [2]
    JP        Z,loc_208CB6                       [5]
    LD        BC,(XIZ+0x10)                      [3]
    CP        BC,(wUnitHP)                       [4]
    JR        Z,.skip                            [2]
    LDW       (XIZ+0x10),(wUnitHP)               [5]
    LD        C,0xF                              [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        HL,(wUnitMaxHP)                    [4]
    LD        BC,(wUnitHP)                       [4]
    LD        QC,5                               [3]
    CALL      0x207C18                           [4]
    LD        C,0xB                              [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        BC,(wUnitHP)                       [4]
    CALL      sub_207CF0                         [4]
.skip:
    LD        BC,(XIZ+0x12)                      [3]
    CP        BC,(wUnitEP)                       [4]
    JR        Z,.skip2                           [2]
    LDW       (XIZ+0x12),(wUnitEP)               [5]
    LD        C,0xF                              [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        HL,(wUnitMaxEP)                    [4]
    LD        BC,(wUnitEP)                       [4]
    LD        QC,5                               [3]
    CALL      0x207C18                           [4]
    LD        C,0xB                              [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        BC,(wUnitEP)                       [4]
    CALL      sub_207CF0                         [4]
.skip2:
    LD        BC,(XIZ+0x14)                      [3]
    CP        BC,(wEnemyHP)                      [4]
    JR        Z,.skip3                           [2]
    LDW       (XIZ+0x14),(wEnemyHP)              [5]
    LD        C,0                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        HL,(wEnemyMaxHP)                   [4]
    LD        BC,(wEnemyHP)                      [4]
    LD        QC,5                               [3]
    CALL      0x207C84                           [4]
    LD        C,6                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x208E0B                       [5]
    CALL      0x2076F7                           [4]
    CPW       (wEnemyHP),0x3E8                   [6]
    JR        NC,.skip3                          [2]
    LD        C,6                                [2]
    LD        E,0                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        BC,(wEnemyHP)                      [4]
    CALL      sub_207CF0                         [4]
.skip3:
    LD        BC,(XIZ+0x16)                      [3]
    CP        BC,(wEnemyEP)                      [4]
    JR        Z,.done                            [2]
    LDW       (XIZ+0x16),(wEnemyEP)              [5]
    LD        C,0                                [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        HL,(wEnemyMaxEP)                   [4]
    LD        BC,(wEnemyEP)                      [4]
    LD        QC,5                               [3]
    CALL      0x207C84                           [4]
    LD        C,6                                [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x208E0B                       [5]
    CALL      0x2076F7                           [4]
    CPW       (wEnemyEP),0x3E8                   [6]
    JR        NC,.done                           [2]
    LD        C,6                                [2]
    LD        E,1                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        BC,(wEnemyEP)                      [4]
    CALL      sub_207CF0                         [4]
.done:
    RET                                          [1]
    .db 00 64 00 FF

.org 0x208E0F

loc_208E0F:
    LD        WA,(wUnitHP)                       [4]
    ADD       WA,(XIZ+0xE)                       [3]
    CP        WA,(wUnitMaxHP)                    [4]
    JR        LE,.skip                           [2]
    LD        WA,(wUnitMaxHP)                    [4]
    SUB       WA,(wUnitHP)                       [4]
    JR        Z,.skip2                           [2]
    LD        (XIZ+0xE),WA                       [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wUnitHP)               [5]
    LDW       (XIZ+8),0x8E3D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wUnitHP),WA                       [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
.skip2:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x208E9F

swp_208E9F:
    LD        WA,(wUnitEP)                       [4]
    ADD       WA,(XIZ+0xE)                       [3]
    CP        WA,(wUnitMaxEP)                    [4]
    JR        LE,.skip                           [2]
    LD        WA,(wUnitMaxEP)                    [4]
    SUB       WA,(wUnitEP)                       [4]
    JR        Z,.skip2                           [2]
    LD        (XIZ+0xE),WA                       [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wUnitEP)               [5]
    LDW       (XIZ+8),0x8ECD                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wUnitEP),WA                       [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
.skip2:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x208EED

swp_208EED:
    LD        WA,(wUnitEP)                       [4]
    CP        WA,(XIZ+0xE)                       [3]
    JR        PL,.skip                           [2]
    LD        (XIZ+0xE),WA                       [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wUnitEP)               [5]
    LDW       (XIZ+8),0x8F0D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    NEG       WA                                 [2]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wUnitEP),WA                       [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x208F2F

swp_208F2F:
    LD        WA,(wEnemyHP)                      [4]
    ADD       WA,(XIZ+0xE)                       [3]
    CP        WA,(wEnemyMaxHP)                   [4]
    JR        LE,.skip                           [2]
    LD        WA,(wEnemyMaxHP)                   [4]
    SUB       WA,(wEnemyHP)                      [4]
    JR        Z,.skip2                           [2]
    LD        (XIZ+0xE),WA                       [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wEnemyHP)              [5]
    LDW       (XIZ+8),0x8F5D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wEnemyHP),WA                      [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
.skip2:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x208F7D

swp_208F7D:
    LD        WA,(wEnemyHP)                      [4]
    CP        WA,(XIZ+0xE)                       [3]
    JR        PL,.skip                           [2]
    LD        (XIZ+0xE),WA                       [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wEnemyHP)              [5]
    LDW       (XIZ+8),0x8F9D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    NEG       WA                                 [2]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wEnemyHP),WA                      [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x208FBF

swp_208FBF:
    LD        WA,(wEnemyEP)                      [4]
    ADD       WA,(XIZ+0xE)                       [3]
    CP        WA,(wEnemyMaxEP)                   [4]
    JR        LE,.skip                           [2]
    LD        WA,(wEnemyMaxEP)                   [4]
    SUB       WA,(wEnemyEP)                      [4]
    JR        Z,.skip2                           [2]
    LD        (XIZ+0xE),WA                       [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wEnemyEP)              [5]
    LDW       (XIZ+8),0x8FED                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wEnemyEP),WA                      [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
.skip2:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20900D

swp_20900D:
    LD        WA,(wEnemyEP)                      [4]
    CP        WA,(XIZ+0xE)                       [3]
    JR        PL,.skip                           [2]
    LD        (XIZ+0xE),WA                       [3]
.skip:
    LDW       (XIZ+0x12),0                       [5]
    LDW       (XIZ+0x14),(wEnemyEP)              [5]
    LDW       (XIZ+8),0x902D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        WA,(XIZ+0xE)                       [3]
    MUL       XWA,(XIZ+0x12)                     [3]
    DIV       XWA,(XIZ+0x10)                     [3]
    NEG       WA                                 [2]
    ADD       WA,(XIZ+0x14)                      [3]
    LD        (wEnemyEP),WA                      [4]
    INCW      1,(XIZ+0x12)                       [3]
    LD        WA,(XIZ+0x12)                      [3]
    CP        WA,(XIZ+0x10)                      [3]
    RET       LE                                 [2]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20904F

swp_20904F:
    LDB       (0x584D),0                         [5]
    LD        A,(XIZ+0xE)                        [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+8),0x906F                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    CPB       (0x5281),0                         [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+0xE)                       [3]
    NEG       A                                  [2]
    ADD       A,0xC0                             [3]
    LD        (0x584B),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x209089

swp_209089:
    LDB       (0x584D),0                         [5]
    LD        A,(XIZ+0xE)                        [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+8),0x90A9                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    CPB       (0x5281),0                         [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0xA0                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+0xE)                       [3]
    NEG       A                                  [2]
    LD        (0x584B),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x2090FE

swp_2090FE:
    LDB       (0x584D),0                         [5]
    LD        A,(XIZ+0xE)                        [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+8),0x911E                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    CPB       (0x5281),0                         [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+0xE)                       [3]
    ADD       A,0x60                             [3]
    LD        (0x584B),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x20916E

swp_20916E:
    LDB       (0x5855),0                         [5]
    LD        A,(XIZ+0xE)                        [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+8),0x918E                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    CPB       (0x5281),0                         [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+0xE)                       [3]
    LD        (0x5853),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x2091A3

swp_2091A3:
    LDB       (0x5855),0                         [5]
    LD        A,(XIZ+0xE)                        [3]
    LD        (XIZ+0x10),A                       [3]
    LDW       (XIZ+8),0x91C3                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    CPB       (0x5281),0                         [5]
    JR        NZ,.skip                           [2]
    LDB       (XIZ+0x10),0                       [4]
.skip:
    LD        A,0x60                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+0xE)                       [3]
    NEG       A                                  [2]
    ADD       A,0x60                             [3]
    LD        (0x5853),A                         [4]
    DECB      1,(XIZ+0x10)                       [3]
    JP        MI,EndTask                         [5]
    RET                                          [1]

.org 0x2091DD

swp_2091DD:
    LDB       (0x5855),0                         [5]
    LDB       (XIZ+0x10),0                       [4]
    LDW       (XIZ+8),0x91FD                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    CPB       (0x5281),0                         [5]
    JR        NZ,.skip                           [2]
    LD        A,(XIZ+0xE)                        [3]
    LD        (XIZ+0x10),A                       [3]
.skip:
    LD        A,0xA0                             [2]
    MUL       WA,(XIZ+0x10)                      [3]
    DIV       WA,(XIZ+0xE)                       [3]
    NEG       A                                  [2]
    LD        (0x5853),A                         [4]
    INCB      1,(XIZ+0x10)                       [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,(XIZ+0xE)                        [3]
    JP        GT,EndTask                         [5]
    RET                                          [1]

.org 0x20921A

swp_20921A:
    LD        A,0                                [2]
    CALL      GetTextBox                         [4]
    LD        (XIZ+0xE),XWA                      [3]
    LDW       (XIZ+8),0x922D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    LD        XWA,(XIZ+0xE)                      [3]
    LD        L,(wJoyPressed)                    [4]
    AND       L,0x30                             [3]
    JR        Z,.skip                            [2]
    LDB       (XWA+0x10),0                       [4]
.skip:
    LD        XHL,(XWA+8)                        [3]
    OR        XHL,XHL                            [2]
    RET       NZ                                 [2]
    LDW       (XIZ+8),0x924F                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20924F

swp_20924F:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x209254

; [code] task: plays each effect id of the list at task +0x14 until FF
PlayEffectList:
    CPB       (0x5281),0                         [5]
    JR        Z,.skip                            [2]
    LD        XBC,(XIY+0x14)                     [3]
    LD        A,(XBC+)                           [3]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        (XIY+0x14),XBC                     [3]
    LD        XHL,swp_2092D4                     [5]
    PUSH      A                                  [1]
    CALL      StartChildTask                     [4]
    POP       A                                  [1]
    LD        W,0                                [2]
    LD        (XHL+0x20),WA                      [3]
    LD        WA,(XIZ+0xE)                       [3]
    LD        (XHL+0x1E),WA                      [3]
    task_wait
    JP        PlayEffectList                     [4]
.skip:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x2092D4

swp_2092D4:
    LDW       (XIZ+0xE),0x41                     [5]
    CPW       (XIZ+0x20),0xCD                    [5]
    LD        XHL,swp_20931A                     [5]
    JR        Z,.skip                            [2]
    CPW       (XIZ+0x20),0xCE                    [5]
    LD        XHL,swp_2092FB                     [5]
    JR        Z,.skip                            [2]
    LD        XHL,PlayBattleEffect               [5]
.skip:
    LD        (XIZ+8),XHL                        [3]
    JP        (XHL)                              [2]

.org 0x2092FB

swp_2092FB:
    DECW      1,(XIZ+0xE)                        [3]
    JR        Z,.skip                            [2]
    LD        WA,(XIZ+0xE)                       [3]
    RR        4,WA                               [3]
    SBC       A,A                                [2]
    AND       A,0x7F                             [3]
    LD        (0x585B),A                         [4]
    RET                                          [1]
.skip:
    LDB       (0x585B),0                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20931A

swp_20931A:
    DECW      1,(XIZ+0xE)                        [3]
    JR        Z,.skip                            [2]
    LD        WA,(XIZ+0xE)                       [3]
    RR        4,WA                               [3]
    SBC       A,A                                [2]
    AND       A,0x7F                             [3]
    NEG       A                                  [2]
    LD        (0x585B),A                         [4]
    RET                                          [1]
.skip:
    LDB       (0x585B),0                         [5]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x2095F3
    task_wait
    LD        XHL,0x22544C                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_2091A3                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LDW       (XIZ+8),0x9647                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x209872

swp_209872:
    BIT       4,(wFrameCounter)                  [4]
    JR        Z,.skip                            [2]
    LD        E,(0x5DE0)                         [4]
    LD        D,0                                [2]
    SLL       4,DE                               [3]
    INC       4,DE                               [2]
    LD        BC,0x60                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
.skip:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_UP,A                         [3]
    JR        NZ,.skip2                          [2]
    BIT       1,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip4                          [2]
    RET                                          [1]
.skip2:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,(0x5DE0)                         [4]
    DEC       1,A                                [2]
    AND       A,3                                [3]
    LD        (0x5DE0),A                         [4]
    RET                                          [1]
.skip3:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,(0x5DE0)                         [4]
    INC       1,A                                [2]
    AND       A,3                                [3]
    LD        (0x5DE0),A                         [4]
    RET                                          [1]
.skip4:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        XHL,0                              [2]
    LD        L,(0x5DE0)                         [4]
    SLL       2,XHL                              [3]
    ADD       XHL,0x2098FF                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]
    .db 52 99 20 00 8B 9B 20 00 0F 99 20 00 01 9E 20 00

.org 0x2099E6

swp_2099E6:
    NOP                                          [1]
    JR        NZ,.skip                           [2]
    BIT       1,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip5                          [2]
    BIT       5,A                                [3]
    JRL       NZ,loc_209AE0                      [3]
    RET                                          [1]
.skip:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        WA,(0x5DE1)                        [4]
    DEC       1,WA                               [2]
    AND       WA,3                               [4]
.loop:
    LD        (0x5DE1),WA                        [4]
    CP        WA,2                               [2]
    JRL       C,ShowWeaponInfo                   [3]
    JR        Z,.skip2                           [2]
    CPB       (wSkill2),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        WA,2                               [2]
    JR        .loop                              [2]
.skip2:
    CPB       (wSkill1),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        WA,1                               [2]
    JR        .loop                              [2]
.skip3:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        WA,(0x5DE1)                        [4]
    INC       1,WA                               [2]
    AND       WA,3                               [4]
.loop2:
    LD        (0x5DE1),WA                        [4]
    CP        WA,2                               [2]
    JRL       C,ShowWeaponInfo                   [3]
    JR        Z,.skip4                           [2]
    CPB       (wSkill2),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        A,0                                [2]
    JR        .loop2                             [2]
.skip4:
    CPB       (wSkill1),0                        [5]
    JRL       NZ,ShowWeaponInfo                  [3]
    LD        WA,3                               [2]
    JR        .loop2                             [2]
.skip5:
    LD        XHL,0x5D82                         [5]
    LD        WA,(0x5DE1)                        [4]
    SLL       1,WA                               [3]
    LD        WA,(XHL+WA)                        [5]
    CP        (wUnitEP),WA                       [4]
    JR        C,.skip6                           [2]
    LD        (0x5DE4),WA                        [4]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    LDW       (XIZ+8),0x9E01                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip6:
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+8),0x9AB5                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x209AE0

loc_209AE0:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    LDW       (XIZ+8),0x974E                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x209B8B

swp_209B8B:
    LD        A,2                                [2]
    LD        C,0xA                              [2]
    LD        E,9                                [2]
    LD        HL,0x194                           [3]
    CALL      dyn_207494                         [4]
    CALR      sub_209D2F                         [3]
    LD        C,0                                [2]
    LD        E,0x2D                             [2]
    CALL      0x2074C4                           [4]
    LDB       (0x5853),0xB0                      [5]
    LDB       (0x5855),0x68                      [5]
    LDW       (0x5DE1),0                         [6]
    CALR      sub_209CCE                         [3]
    CALR      sub_209CDC                         [3]
    LDW       (XIZ+8),0x9BC4                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x209BC4

swp_209BC4:
    CALR      sub_209CCE                         [3]
    BIT       4,(wFrameCounter)                  [4]
    JR        Z,.skip                            [2]
    SLL       3,DE                               [3]
    INC       4,DE                               [2]
    LD        BC,0x50                            [3]
    LD        WA,0x3E04                          [3]
    LD        QB,1                               [3]
    LD        QD,2                               [3]
    CALL      dyn_206BFF                         [4]
.skip:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_D_UP,A                         [3]
    JR        NZ,.skip2                          [2]
    BIT       1,A                                [3]
    JR        NZ,.skip3                          [2]
    BIT       2,A                                [3]
    JR        NZ,.skip4                          [2]
    BIT       3,A                                [3]
    JR        NZ,.skip6                          [2]
    BIT       4,A                                [3]
    JR        NZ,.skip8                          [2]
    BIT       5,A                                [3]
    JRL       NZ,.skip11                         [3]
    RET                                          [1]
.skip2:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    CALR      sub_209CCE                         [3]
    DEC       1,DE                               [2]
    OR        DE,DE                              [2]
    JRL       PL,sub_209CDC                      [3]
    LD        DE,5                               [2]
    JRL       sub_209CDC                         [3]
.skip3:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    CALR      sub_209CCE                         [3]
    INC       1,DE                               [2]
    CP        DE,6                               [2]
    JRL       C,sub_209CDC                       [3]
    LD        DE,0                               [2]
    JRL       sub_209CDC                         [3]
.skip4:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALR      sub_209CCE                         [3]
    DEC       1,WA                               [2]
    OR        WA,WA                              [2]
    JR        PL,.skip5                          [2]
    LD        WA,2                               [2]
.skip5:
    CALR      sub_209CDC                         [3]
    JRL       sub_209D2F                         [3]
.skip6:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CALR      sub_209CCE                         [3]
    INC       1,WA                               [2]
    CP        WA,3                               [2]
    JR        C,.skip7                           [2]
    LD        WA,0                               [2]
.skip7:
    CALR      sub_209CDC                         [3]
    JRL       sub_209D2F                         [3]
.skip8:
    LD        WA,(0x5DE1)                        [4]
    CP        WA,0xE                             [4]
    JR        NC,.skip9                          [2]
    ADD       WA,0x26                            [4]
    CALL      0x2061D6                           [4]
    OR        A,A                                [2]
    JR        NZ,.skip10                         [2]
.skip9:
    LD        WA,0x83                            [3]
    CALL      SoundCommand                       [4]
    RET                                          [1]
.skip10:
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    ADDW      (0x5DE1),0x26                      [6]
    LDW       (XIZ+8),0x9E01                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip11:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    CALL      Random                             [4]
    LD        A,2                                [2]
    CALL      dyn_207598                         [4]
    LDW       (0x5DE1),0                         [6]
    LDW       (XIZ+8),0x974E                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x209CCE

sub_209CCE:
    LD        WA,(0x5DE1)                        [4]
    EXTZ      XWA                                [2]
    DIV       XWA,6                              [4]
    LD        DE,QWA                             [3]
    RET                                          [1]

.org 0x209CDC

sub_209CDC:
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    ADD       WA,DE                              [2]
    LD        (0x5DE1),WA                        [4]
    LD        A,0                                [2]
    CALL      dyn_2075CC                         [4]
    LD        WA,(0x5DE1)                        [4]
    CP        WA,0xE                             [4]
    RET       NC                                 [2]
    ADD       WA,0x26                            [4]
    PUSH      WA                                 [1]
    CALL      0x2061D6                           [4]
    POP       HL                                 [1]
    RET       C                                  [2]
    CALL      GetItemDesc                        [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x5D82                         [5]
    LD        WA,(0x5DE1)                        [4]
    SLL       1,WA                               [3]
    LD        WA,(XHL+WA)                        [5]
    LD        (XIZ+0x14),WA                      [3]
    LD        XHL,0x225492                       [5]
    CALL      ExpandMessage                      [4]
    LD        A,0                                [2]
    CALL      dyn_2076F3                         [4]
    RET                                          [1]

.org 0x209D2F

sub_209D2F:
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        C,5                                [2]
    LD        E,6                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DEF                       [5]
    CALL      0x2076F7                           [4]
    LD        C,2                                [2]
    LD        E,6                                [2]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    LD        BC,(0x5DE1)                        [4]
    EXTZ      XBC                                [2]
    DIV       XBC,6                              [4]
    PUSH      BC                                 [1]
    INC       1,BC                               [2]
    CALL      sub_207CF0                         [4]
    LD        C,2                                [2]
    LD        E,6                                [2]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DF3                       [5]
    CALL      0x2076F7                           [4]
    POP       BC                                 [1]
    MUL       XBC,6                              [4]
    LD        B,0                                [2]
.loop:
    PUSH      BC                                 [1]
    PUSH      XWA                                [1]
    LD        A,(XSP+4)                          [3]
    ADD       A,0x26                             [3]
    EXTZ      WA                                 [2]
    CALL      0x2061D6                           [4]
    LD        C,A                                [2]
    LD        B,0                                [2]
    POP       XWA                                [1]
    JR        NC,.skip                           [2]
    LD        C,0                                [2]
    LD        E,(XSP+1)                          [3]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DF8                       [5]
    CALL      0x2076F7                           [4]
    JR        .skip2                             [2]
.skip:
    PUSH      BC                                 [1]
    LD        C,5                                [2]
    LD        E,(XSP+3)                          [3]
    CALL      0x20768E                           [4]
    CALL      0x207720                           [4]
    POP       BC                                 [1]
    CALL      sub_207CF0                         [4]
    LD        C,0                                [2]
    LD        E,(XSP+1)                          [3]
    CALL      0x20768E                           [4]
    LD        L,(XSP+0)                          [3]
    ADD       L,0x26                             [3]
    CALL      GetItemName                        [4]
    CALL      0x2076F7                           [4]
    LD        C,6                                [2]
    LD        E,(XSP+1)                          [3]
    CALL      0x20768E                           [4]
    LD        XHL,0x209DF6                       [5]
    CALL      0x2076F7                           [4]
.skip2:
    POP       BC                                 [1]
    INC       1,C                                [2]
    CP        C,0xE                              [3]
    JR        NC,.done                           [2]
    INC       1,B                                [2]
    CP        B,6                                [2]
    JR        C,.loop                            [2]
.done:
    RET                                          [1]
    .db 5B 41 44 FF 00 41 FF 69 FF 59 59 59 59 59 59 59
    .db 59 FF

.org 0x209E01

swp_209E01:
    LD        A,3                                [2]
    CALL      dyn_207598                         [4]
    LD        WA,0                               [2]
    LD        C,0xC                              [2]
    LD        E,9                                [2]
    LD        B,8                                [2]
    LD        D,2                                [2]
    CALL      dyn_206768                         [4]
    LDB       (0x5DE3),0                         [5]
    CPB       (0x5DDA),0                         [5]
    JR        NZ,.skip                           [2]
    CPB       (0x5DE0),3                         [5]
    JR        NZ,.skip                           [2]
    LD        XHL,swp_209E45                     [5]
    JR        .skip2                             [2]
.skip:
    CALL      swp_20815F                         [4]
    OR        WA,WA                              [2]
    LD        XHL,swp_209E45                     [5]
    JR        PL,.skip2                          [2]
    LD        XHL,swp_20B460                     [5]
.skip2:
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]

.org 0x209E45

swp_209E45:
    CALR      0x20CE3F                           [3]
    LDB       (0x5853),0x60                      [5]
    LDB       (0x5855),0                         [5]
    CPB       (0x5DE3),0                         [5]
    LD        XHL,swp_20904F                     [5]
    JR        NZ,.skip                           [2]
    LD        XHL,swp_209136                     [5]
.skip:
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LD        XHL,0                              [2]
    LD        L,(0x5DE0)                         [4]
    SLL       2,HL                               [3]
    ADD       XHL,0x209E8E                       [6]
    LD        XHL,(XHL)                          [2]
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]
    .db 9E 9E 20 00 D6 A1 20 00 6A A2 20 00 08 A3 20 00

.org 0x209F95
SkillEffects:
    .db 47 AA 20 00 2E AB 20 00 29 AC 20 00 CB AC 20 00
    .db 38 AD 20 00 C4 AD 20 00 4F AE 20 00

.org 0x20A26A

swp_20A26A:
    LD        XHL,YouRechargedYourEnergyText     [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,0x225414                       [5]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    CALL      swp_2089EB                         [4]
    LD        (XIZ+0x10),WA                      [3]
    LD        HL,WA                              [2]
    CALR      sub_20CE00                         [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208E9F                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (0x5DE4),0                         [6]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20ACCB

; [code] effect 8: "Time stopped! Can't move" (August)
SkillTimeStop:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,TimeStoppedCantMoveText        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    LD        (0x5DD0),A                         [4]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AD38

; [code] effect 9: "Recvr activated!! Auto-recover at 0 HP!!" (Aqua); once per battle
SkillRecvr:
    CPB       (wRecvrActive),0                   [5]
    JR        Z,.skip                            [2]
    LD        XHL,NoEffectText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,RecvrActivatedAutoRecoverText  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    INCB      1,(wRecvrActive)                   [4]
    RET       NZ                                 [2]
    LDB       (wRecvrActive),0xFF                [5]
    RET                                          [1]

.org 0x20ADC4

; [code] effect 10: "Airbag activated! Damage is halved!" (Vapor); turns = skill s04
SkillAirbag:
    CPB       (wAirbagTurns),0                   [5]
    JR        Z,.skip                            [2]
    LD        XHL,NoEffectText3                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,AirbagActivatedDamageIsText    [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    LD        (wAirbagTurns),A                   [4]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AE4F

; [code] effect 11: "Fully charged!! EP costs reduced to 0!!" (Breath); turns = skill s04
SkillFullCharge:
    CPB       (wFullChargeTurns),0               [5]
    JR        Z,.skip                            [2]
    LD        XHL,NoEffectText2                  [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,FullyChargedEPCostsText        [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,(XIZ+0x10)                     [3]
    LD        A,(XHL+4)                          [3]
    LD        (wFullChargeTurns),A               [4]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AEDA

swp_20AEDA:
    LDW       (XIZ+0x10),0x1E                    [5]
    LDW       (XIZ+8),0xAF8A                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AEEA

swp_20AEEA:
    LDW       (XIZ+0x10),0x32                    [5]
    LDW       (XIZ+8),0xAF8A                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AEFA

swp_20AEFA:
    LDW       (XIZ+0x10),0x64                    [5]
    LDW       (XIZ+8),0xAF8A                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AF0A

swp_20AF0A:
    LDW       (XIZ+0x10),0x96                    [5]
    LDW       (XIZ+8),0xAF8A                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AF1A

swp_20AF1A:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,YourHPAreFullyText             [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,loc_208E0F                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x270F                   [5]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20AF8A

swp_20AF8A:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        HL,(XIZ+0x10)                      [3]
    CALR      ShowHPGain                         [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,loc_208E0F                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B05D

swp_20B05D:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,APWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9B),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B0B1

swp_20B0B1:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,SPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9C),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B105

swp_20B105:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,RPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9D),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B159

swp_20B159:
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,MPWentUpText                   [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5D9E),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B1AD

swp_20B1AD:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,APWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DC8),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B215

swp_20B215:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,SPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DC9),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B27D

swp_20B27D:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,RPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DCA),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B2E5

swp_20B2E5:
    LDB       (0x584B),0x60                      [5]
    LDB       (0x584D),0                         [5]
    LDB       (0x5853),0                         [5]
    LDB       (0x5855),0                         [5]
    LD        XHL,(XIZ+0x14)                     [3]
    INC       1,XHL                              [2]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0                        [5]
    task_wait
    LD        XHL,MPWentDownText                 [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDB       (0x5DCB),5                         [5]
    LDW       (XIZ+8),0xB34D                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20B34D

swp_20B34D:
    CPB       (wStatusParalyzed),0               [5]
    JR        Z,.loop                            [2]
    LD        A,(wStatusParalyzed)               [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip                           [2]
    LDB       (wStatusParalyzed),0               [5]
    JR        .loop                              [2]
.skip:
    CPB       (wStatusParalyzed),0x95            [5]
    JR        NC,.loop                           [2]
    INCB      1,(wStatusParalyzed)               [4]
.loop:
    CPB       (wStatusConfused),0                [5]
    JR        Z,.skip3                           [2]
    LD        A,(wStatusConfused)                [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip2                          [2]
    LDB       (wStatusConfused),0                [5]
    JR        .loop                              [2]
.skip2:
    CPB       (wStatusConfused),0x95             [5]
    JR        NC,.skip3                          [2]
    INCB      1,(wStatusConfused)                [4]
.skip3:
    CPB       (0x5D97),0                         [5]
    JR        Z,.skip4                           [2]
    DECB      1,(0x5D97)                         [4]
.skip4:
    CPB       (0x5D98),0                         [5]
    JR        Z,.skip5                           [2]
    DECB      1,(0x5D98)                         [4]
.skip5:
    CPB       (0x5D99),0                         [5]
    JR        Z,.skip6                           [2]
    DECB      1,(0x5D99)                         [4]
.skip6:
    CPB       (0x5D9A),0                         [5]
    JR        Z,.skip7                           [2]
    DECB      1,(0x5D9A)                         [4]
.skip7:
    CPB       (0x5D9B),0                         [5]
    JR        Z,.skip8                           [2]
    DECB      1,(0x5D9B)                         [4]
.skip8:
    CPB       (0x5D9C),0                         [5]
    JR        Z,.skip9                           [2]
    DECB      1,(0x5D9C)                         [4]
.skip9:
    CPB       (0x5D9D),0                         [5]
    JR        Z,.skip10                          [2]
    DECB      1,(0x5D9D)                         [4]
.skip10:
    CPB       (0x5D9E),0                         [5]
    JR        Z,.skip11                          [2]
    DECB      1,(0x5D9E)                         [4]
.skip11:
    LD        XHL,swp_208EED                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(0x5DE4)                        [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPW       (wEnemyHP),0                       [6]
    JR        Z,.skip12                          [2]
    CPW       (wUnitHP),0                        [6]
    JR        NZ,.skip13                         [2]
.skip12:
    LDW       (XIZ+8),0xC604                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip13:
    CPB       (0x5DE3),0                         [5]
    LD        XHL,BattleStatusEffects            [5]
    JR        NZ,.skip14                         [2]
    INCB      1,(0x5DE3)                         [4]
    LD        XHL,swp_20B460                     [5]
.skip14:
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]

.org 0x20B440

; [code] A = status byte -> C if the status wears off (StatusRecovery[turns])
RollStatusRecovery:
    AND       A,0x7F                             [3]
    LD        L,A                                [2]
    CALL      GetStatusRecovery                  [4]
    LD{1}     H,L                                [2]
    LD        L,0                                [2]
    ADD       HL,0x63                            [4]
    EXTZ      XHL                                [2]
    DIV       XHL,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,HL                              [2]
    RET                                          [1]

.org 0x20C0B1

swp_20C0B1:
    LD        XHL,0x225992                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        B,(wFleeChance)                    [4]
    LD        C,0                                [2]
    ADD       BC,0x63                            [4]
    EXTZ      XBC                                [2]
    DIV       XBC,0x64                           [4]
    CALL      Random                             [4]
    EXTZ      WA                                 [2]
    CP        WA,BC                              [2]
    JR        C,.skip                            [2]
    LD        XHL,ButYouAreAbleText              [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xC4FB                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip:
    LDW       (XIZ+8),0xC4B0                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20C1A5

swp_20C1A5:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+0x10),0x32                    [5]
    LDW       (XIZ+8),0xC39E                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20C360

swp_20C360:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LD        L,(XHL+SLOT_ATTACK)                [3]
    CALL      GetAttackName                      [4]
    LD        (XIZ+0x10),XHL                     [3]
    LD        XHL,0x2254A8                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+0x10),0x64                    [5]
    LDW       (XIZ+8),0xC39E                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20C39E

swp_20C39E:
    LD        XHL,(wEnemyAttackSlot)             [4]
    LDA       XHL,XHL+9                          [3]
    LD        (XIZ+0x14),XHL                     [3]
    LD        XHL,PlayEffectList                 [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),1                        [5]
    task_wait
    LD        HL,(XIZ+0x10)                      [3]
    CALR      sub_20CE15                         [3]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LD        XHL,swp_208F2F                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(XIZ+0x10)                      [3]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    LDW       (XIZ+8),0xC4FB                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20C4B0

swp_20C4B0:
    LD        XHL,swp_2091A3                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    LD        XHL,0x2259BC                       [5]
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+0xE),1                        [5]
    LDW       (XIZ+8),0xCD89                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20C4FB

swp_20C4FB:
    CPB       (wEnemyParalyzed),0                [5]
    JR        Z,.loop                            [2]
    LD        A,(wEnemyParalyzed)                [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip                           [2]
    LDB       (wEnemyParalyzed),0                [5]
    JR        .loop                              [2]
.skip:
    CPB       (wEnemyParalyzed),0x95             [5]
    JR        NC,.loop                           [2]
    INCB      1,(wEnemyParalyzed)                [4]
.loop:
    CPB       (wEnemyConfused),0                 [5]
    JR        Z,.skip3                           [2]
    LD        A,(wEnemyConfused)                 [4]
    CALR      RollStatusRecovery                 [3]
    JR        NC,.skip2                          [2]
    LDB       (wEnemyConfused),0                 [5]
    JR        .loop                              [2]
.skip2:
    CPB       (wEnemyConfused),0x95              [5]
    JR        NC,.skip3                          [2]
    INCB      1,(wEnemyConfused)                 [4]
.skip3:
    CPB       (0x5DC8),0                         [5]
    JR        Z,.skip4                           [2]
    DECB      1,(0x5DC8)                         [4]
.skip4:
    CPB       (0x5DCC),0                         [5]
    JR        Z,.skip5                           [2]
    DECB      1,(0x5DCC)                         [4]
.skip5:
    CPB       (0x5DC7),0                         [5]
    JR        Z,.skip6                           [2]
    DECB      1,(0x5DC7)                         [4]
.skip6:
    CPB       (0x5DC9),0                         [5]
    JR        Z,.skip7                           [2]
    DECB      1,(0x5DC9)                         [4]
.skip7:
    CPB       (0x5DCD),0                         [5]
    JR        Z,.skip8                           [2]
    DECB      1,(0x5DCD)                         [4]
.skip8:
    CPB       (0x5DCA),0                         [5]
    JR        Z,.skip9                           [2]
    DECB      1,(0x5DCA)                         [4]
.skip9:
    CPB       (0x5DCE),0                         [5]
    JR        Z,.skip10                          [2]
    DECB      1,(0x5DCE)                         [4]
.skip10:
    CPB       (0x5DCB),0                         [5]
    JR        Z,.skip11                          [2]
    DECB      1,(0x5DCB)                         [4]
.skip11:
    CPB       (0x5DCF),0                         [5]
    JR        Z,.skip12                          [2]
    DECB      1,(0x5DCF)                         [4]
.skip12:
    CPB       (0x5DD0),0                         [5]
    JR        Z,.skip13                          [2]
    DECB      1,(0x5DD0)                         [4]
.skip13:
    LD        XHL,swp_20900D                     [5]
    CALL      StartChildTask                     [4]
    LD        WA,(0x5DEB)                        [4]
    LD        (XHL+0xE),WA                       [3]
    LDW       (XHL+0x10),0xF                     [5]
    task_wait
    CPW       (wUnitHP),0                        [6]
    JR        Z,.skip14                          [2]
    CPW       (wEnemyHP),0                       [6]
    JR        NZ,.skip15                         [2]
.skip14:
    LDW       (XIZ+8),0xC604                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip15:
    CPB       (0x5DE3),0                         [5]
    LD        XHL,BattleStatusEffects            [5]
    JR        NZ,.skip16                         [2]
    INCB      1,(0x5DE3)                         [4]
    LD        XHL,swp_209E45                     [5]
.skip16:
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]

.org 0x20CD32

swp_20CD32:
    LD        XHL,swp_2090FE                     [5]
    CALL      StartChildTask                     [4]
    LDB       (XHL+0xE),0xF                      [4]
    task_wait
    CPB       (0x5DDA),0                         [5]
    LD        XHL,YouGaveUpText                  [5]
    JR        Z,.skip                            [2]
    LD        XHL,0x22599D                       [5]
.skip:
    CALL      ShowMessage                        [4]
    LD        XHL,swp_20921A                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+0xE),2                        [5]
    LDW       (XIZ+8),0xCD89                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20CD89

swp_20CD89:
    LD        A,0                                [2]
    LD        (wStatusParalyzed),A               [4]
    LD        (wStatusEPLeak),A                  [4]
    LD        (wStatusConfused),A                [4]
    LD        HL,(XIZ+0x2C)                      [3]
    EXTZ      XHL                                [2]
    SET       7,(XHL+7)                          [3]
    CALL      sub_2067E1                         [4]
    CALL      sub_206847                         [4]
    CALL      sub_2072CD                         [4]
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
    LD        WA,0x7F                            [3]
    CALL      SoundCommand                       [4]
    LD        WA,0x8086                          [3]
    CALL      SoundCommand                       [4]
    LD        A,(XIZ+0xE)                        [3]
    LD        (0x5DD9),A                         [4]
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x20CE00

sub_20CE00:
    ADD       HL,(wUnitEP)                       [4]
    CP        HL,(wUnitMaxEP)                    [4]
    LD        XHL,YourEPAreFullyText             [5]
    RET       NC                                 [2]
    LD        XHL,YouGainedEPText                [5]
    RET                                          [1]

.org 0x20CE15

sub_20CE15:
    ADD       HL,(wEnemyHP)                      [4]
    CP        HL,(wEnemyMaxHP)                   [4]
    LD        XHL,SHPAreFullyText                [5]
    RET       NC                                 [2]
    LD        XHL,GainedHPText                   [5]
    RET                                          [1]
