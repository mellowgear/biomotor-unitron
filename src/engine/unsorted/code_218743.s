; engine/unsorted/code_218743: 8 routines (each keeps its ROM address with .org)

.org 0x2187EC

swp_2187EC:
    RET                                          [1]

.org 0x2188FF

sub_2188FF:
    LD        XHL,swp_21890A                     [5]
    CALL      StartChildTask                     [4]
    RET                                          [1]

.org 0x21890A

swp_21890A:
    LD        A,4                                [2]
    LD        C,8                                [2]
    LD        E,3                                [2]
    LD        HL,0x78                            [3]
    CALL      dyn_207494                         [4]
    LD        A,4                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,4                                [2]
    LD        C,0xC                              [2]
    LD        E,0xB                              [2]
    CALL      dyn_2074C0                         [4]
.loop:
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]

.org 0x21892D

swp_21892D:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x218939

swp_218939:
    CALL      sub_218942                         [4]
    CALL      sub_21894B                         [4]
    RET                                          [1]

.org 0x218942

sub_218942:
    LD        XWA,(wGP)                          [4]
    LD        (0x6185),XWA                       [4]
    RET                                          [1]

.org 0x21894B

sub_21894B:
    LD        XDE,(0x6185)                       [4]
    LD        BC,0                               [2]
    LD        WA,0x604                           [3]
    CALL      sub_217303                         [4]
    RET                                          [1]
    .db 25 30 FF

.org 0x218A62

sub_218A62:
    LD        A,4                                [2]
    CALL      sub_21734E                         [4]
    RET                                          [1]
