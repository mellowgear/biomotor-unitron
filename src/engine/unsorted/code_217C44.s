; engine/unsorted/code_217C44: 1 routines (each keeps its ROM address with .org)

.org 0x217C9A

sub_217C9A:
    LD        A,3                                [2]
    LD        (0x614A),A                         [4]
    LD        A,3                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x217C7F                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x217C91                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x217C97                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]
    .db 29 14 05 0D FF 30 01 12 14 13 FF 25 18 09 14 FF
    .db 00 00 C5 7C 21 00 00 01 CA 7C 21 00 00 08 D0 7C
    .db 21 00 00 00 00 01 00 08 01 00 FF
