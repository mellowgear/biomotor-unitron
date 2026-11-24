; engine/unsorted/code_20D404: 4 routines (each keeps its ROM address with .org)

.org 0x20D404

swp_20D404:
    LD        W,0                                [2]
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]

.org 0x20D40A

swp_20D40A:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LD        XHL,0x20D378                       [5]
    LD        A,0                                [2]
    CALL      dyn_2076F3                         [4]
    LDW       (XIZ+8),0xD25F                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]

.org 0x20D427

swp_20D427:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CPB       (XIZ+0xE),0                        [4]
    LDB       (XIZ+0xE),1                        [4]
    RET       Z                                  [2]
    LDB       (XIZ+0xE),0                        [4]
    RET                                          [1]
    .db FD 24 05 0C 05 14 05 00 24 01 14 01 FE 37 08 09
    .db 03 08 64 FE 00 00 00 00 00 21 0C 0C 00 00 33 05
    .db 0C 05 03 14 FF

.org 0x20D462

swp_20D462:
    LDW       (XIZ+0xE),1                        [5]
    LD        A,0                                [2]
    LD        C,0x12                             [2]
    LD        E,5                                [2]
    LD        HL,0x76                            [3]
    CALL      dyn_207494                         [4]
    LD        XHL,0x20D544                       [5]
    CALL      0x2076F7                           [4]
    LDW       (XIZ+8),0xD487                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    CALR      sub_20D684                         [3]
    LD        BC,(XIZ+0xE)                       [3]
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
    CPW       (XIZ+0xE),0                        [5]
    JR        Z,.skip2                           [2]
    LDW       (XIZ+8),0xD397                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip2:
    CALL      sub_206847                         [4]
    LD        A,0                                [2]
    LD        XHL,0x20D56F                       [5]
    CALL      dyn_2076F3                         [4]
    CALL      swp_20DAE1                         [4]
    LDB       (0x5280),3                         [5]
    LDB       (0x5281),0xFF                      [5]
    LD        A,0                                [2]
    LD        XHL,0x20D588                       [5]
    CALL      dyn_2076F3                         [4]
    LD        XHL,dyn_20D71E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xCF7C                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip3:
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    LDW       (XIZ+8),0xD397                     [5]
    LDW       (XIZ+0xA),0x20                     [5]
    RET                                          [1]
.skip4:
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    CPB       (XIZ+0xE),0                        [4]
    LDB       (XIZ+0xE),1                        [4]
    RET       Z                                  [2]
    LDB       (XIZ+0xE),0                        [4]
    RET                                          [1]
