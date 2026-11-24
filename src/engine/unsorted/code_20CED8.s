; engine/unsorted/code_20CED8: 3 routines (each keeps its ROM address with .org)

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
    .db FD 2D 01 09 0E 00 2D 05 0E 15 FF FD 00 2E 05 17
    .db 00 27 01 0D 05 FE FE 00 2C 0F 01 04 FE FE 00 23
    .db 0F 0E 06 09 07 FF

.org 0x20D0E8

dyn_20D0E8:
    INCB      1,(0x5DF2)                         [4]
    LDB       (GE_PLANE_PRIO),0x80               [5]
    CALL      EndTask                            [4]
    RET                                          [1]
