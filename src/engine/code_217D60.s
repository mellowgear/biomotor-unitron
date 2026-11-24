; 217D60-217D8B
.org 0x217D60
sub_217D60:
    LD        A,5                                [2]
    LD        (0x614A),A                         [4]
    LD        A,5                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x217D33                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x217D51                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x217D5B                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]
