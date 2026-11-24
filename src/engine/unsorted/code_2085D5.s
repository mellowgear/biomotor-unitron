; engine/unsorted/code_2085D5: 2 routines (each keeps its ROM address with .org)

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

.org 0x20867E

loc_20867E:
    LD        A,(XHL+)                           [3]
    CP        A,0xFF                             [3]
    RET       Z                                  [2]
    LD        (XDE+),A                           [3]
    JR        loc_20867E                         [2]
