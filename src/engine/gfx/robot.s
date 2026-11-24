; engine/gfx/robot: 6 routines (each keeps its ROM address with .org)

.org 0x207D40

; clear the canvas, draw back, right arm (behind the body), body, legs, left arm
DrawRobot:
    PUSH      XHL                                [1]
    LD{1}     WA,HL                              [2]
    LD        QA,0                               [3]
    LD        BC,0x84                            [3]
    CALL      FillTiles                          [4]
    LD        B,(wDrawBack)                      [4]
    LD        C,(wDrawBody)                      [4]
    LD        HL,(XSP)                           [2]
    CALL      sub_207E0B                         [4]
    LD        B,(wDrawRightArm)                  [4]
    LD        C,(wDrawBody)                      [4]
    LD        HL,(XSP)                           [2]
    CALL      DrawRightArmPart                   [4]
    LD        B,(wDrawBody)                      [4]
    LD        C,(wDrawBody)                      [4]
    LD        HL,(XSP)                           [2]
    CALL      sub_207D9D                         [4]
    LD        B,(wDrawLegs)                      [4]
    LD        C,(wDrawBody)                      [4]
    LD        HL,(XSP)                           [2]
    CALL      sub_207DF5                         [4]
    LD        B,(wDrawLeftArm)                   [4]
    LD        C,(wDrawBody)                      [4]
    LD        HL,(XSP)                           [2]
    CALL      DrawLeftArmPart                    [4]
    POP       XHL                                [1]
    LD        QB,0xC                             [4]
    LD        QD,0xB                             [4]
    RET                                          [1]

.org 0x207D9D

sub_207D9D:
    OR        B,B                                [2]
    RET       Z                                  [2]
    PUSH      XIX                                [1]
    PUSH      XIY                                [1]
    LD        XIX,ImageTable                     [5]
    LD        XIY,0x21F01C                       [5]
    OR        C,C                                [2]
    JR        Z,.skip                            [2]
    CP        C,0x10                             [3]
    JR        NC,.skip                           [2]
    LD        C,B                                [2]
    LD        XDE,0                              [2]
    LD        D,B                                [2]
    DEC       1,D                                [2]
    SRL       3,DE                               [3]
    SUB       XIY,XDE                            [2]
.skip:
    CALR      DrawRobotPart                      [3]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]

.org 0x207DF5

sub_207DF5:
    OR        B,B                                [2]
    RET       Z                                  [2]
    PUSH      XIX                                [1]
    PUSH      XIY                                [1]
    LD        XIX,0x220EBC                       [5]
    LD        XIY,0x22047C                       [5]
    CALR      DrawRobotPart                      [3]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]

.org 0x207E0B

sub_207E0B:
    OR        B,B                                [2]
    RET       Z                                  [2]
    PUSH      XIX                                [1]
    PUSH      XIY                                [1]
    LD        XIX,0x220F84                       [5]
    LD        XIY,0x220ABC                       [5]
    CALR      DrawRobotPart                      [3]
    POP       XIY                                [1]
    POP       XIX                                [1]
    RET                                          [1]

.org 0x207E21

; one part image from its slot group of ImageTable
DrawRobotPart:
    PUSH      XWA                                [1]
    LD{1}     WA,HL                              [2]
    DEC       1,B                                [2]
    LD        XDE,0                              [2]
    LD        E,B                                [2]
    SLL       2,DE                               [3]
    ADD       XDE,XIX                            [2]
    LD        XHL,(XDE)                          [2]
    CP        C,0x10                             [3]
    JR        NC,.skip2                          [2]
    OR        C,C                                [2]
    JR        NZ,.skip                           [2]
    LD        C,1                                [2]
.skip:
    SLL       4,C                                [3]
    SRL       3,BC                               [3]
    EXTZ      XBC                                [2]
    ADD       XBC,XIY                            [2]
    LD        E,(XBC+1)                          [3]
    LD        C,(XBC)                            [2]
    JR        .skip3                             [2]
.skip2:
    LD        C,0x60                             [2]
    SUB       C,(XHL+1)                          [3]
    SRL       1,C                                [3]
    LD        E,0x58                             [2]
    SUB       E,(XHL+2)                          [3]
    SRL       1,E                                [3]
.skip3:
    LD        QB,0xC                             [4]
    LD        QD,0xB                             [4]
    EXTS      BC                                 [2]
    EXTS      DE                                 [2]
    CALL      DrawPartImage                      [4]
    POP       XWA                                [1]
    LD        QB,0xC                             [4]
    LD        QD,0xB                             [4]
    RET                                          [1]

.org 0x208489

; XHL = 6 part ids -> wDrawBody..wDrawBack image indexes
SetRobotDrawParts:
    PUSH      XHL                                [1]
    LD{1}     XDE,XHL                            [2]
    LD        XHL,0                              [2]
    LD        (wDrawBody),XHL                    [4]
    LD        (wDrawBack),L                      [4]
    LD        L,(XDE+1)                          [3]
    OR        L,L                                [2]
    JR        Z,.skip                            [2]
    CALL      GetBodyRecord                      [4]
    LD        A,(XHL+PART_IMAGE)                 [3]
    LD        (wDrawBody),A                      [4]
.skip:
    LD        L,(XDE+2)                          [3]
    OR        L,L                                [2]
    JR        Z,.skip2                           [2]
    CALL      GetArmRecord                       [4]
    LD        A,(XHL+PART_IMAGE)                 [3]
    LD        (wDrawRightArm),A                  [4]
.skip2:
    LD        L,(XDE+3)                          [3]
    OR        L,L                                [2]
    JR        Z,.skip3                           [2]
    CALL      GetArmRecord                       [4]
    LD        A,(XHL+PART_IMAGE)                 [3]
    LD        (wDrawLeftArm),A                   [4]
.skip3:
    LD        L,(XDE+4)                          [3]
    OR        L,L                                [2]
    JR        Z,.skip4                           [2]
    CALL      GetLegsRecord                      [4]
    LD        A,(XHL+PART_IMAGE)                 [3]
    LD        (wDrawLegs),A                      [4]
.skip4:
    LD        L,(XDE+5)                          [3]
    OR        L,L                                [2]
    JR        Z,.skip5                           [2]
    CALL      GetBackRecord                      [4]
    LD        A,(XHL+PART_IMAGE)                 [3]
    LD        (wDrawBack),A                      [4]
.skip5:
    POP       XHL                                [1]
    RET                                          [1]
