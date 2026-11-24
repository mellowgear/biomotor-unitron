; engine/unsorted/code_21D192: 17 routines (each keeps its ROM address with .org)

.org 0x21D224

swp_21D224:
    LD        BC,(0x6244)                        [4]
    OR        BC,BC                              [2]
    RET       Z                                  [2]
    LD        WA,(0x6246)                        [4]
    OR        WA,WA                              [2]
    RET       Z                                  [2]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D23C

swp_21D23C:
    LD        A,(0x622D)                         [4]
    AND       A,0xF                              [3]
    SCF                                          [1]
    RET                                          [1]

.org 0x21D250

swp_21D250:
    LD        XHL,0x623A                         [5]
    RET                                          [1]

.org 0x21D5C0

loc_21D5C0:
    CALL      EndTask                            [4]
    RET                                          [1]

.org 0x21D5C5

dyn_21D5C5:
    LDB       (0x5280),3                         [5]
    LDB       (0x5281),0xFF                      [5]
    LD        A,0                                [2]
    CALL      dyn_20DB57                         [4]
    CALL      Z,dyn_20DC65                       [5]
    CALL      sub_2072CD                         [4]
    LDW       (XIZ+8),0xD5E9                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D5E9

dyn_21D5E9:
    LD        XHL,IntroBackground                [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xD60B                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D738

swp_21D738:
    LDW       (wEnemyAffinity),(wUnitAffinity)   [6]
    LD        A,2                                [2]
    CALL      sub_21AAA5                         [4]
    CALL      CalcUnitStats                      [4]
    LDB       (0x5DF4),0                         [5]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D758

dyn_21D758:
    LDW       (wUnitHP),(wUnitMaxHP)             [6]
    LDW       (wUnitEP),(wUnitMaxEP)             [6]
    LD        A,0                                [2]
    LD        (wStatusParalyzed),A               [4]
    LD        (wStatusRust),A                    [4]
    LD        (wStatusEPLeak),A                  [4]
    LD        (wStatusConfused),A                [4]
    LD        XHL,dyn_20D84E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5DF4),1                         [5]
    LD        XHL,dyn_21D800                     [5]
    JR        C,0x21D7B8                         [2]
    LD        XHL,swp_21D856                     [5]
    JR        Z,0x21D7B8                         [2]
    CPB       (0x5DF4),3                         [5]
    LD        XHL,swp_21D8C0                     [5]
    JR        C,0x21D7B8                         [2]
    LD        XHL,swp_21D91C                     [5]
    JR        Z,0x21D7B8                         [2]
    LD        XHL,swp_21D7BC                     [5]
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]

.org 0x21D7BC

swp_21D7BC:
    LD        XHL,swp_210443                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5FF8),2                         [5]
    LD        XHL,swp_21D93E                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5FF8),4                         [5]
    LD        XHL,swp_21D95E                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5FF8),5                         [5]
    LD        XHL,swp_21D980                     [5]
    JR        Z,.skip                            [2]
    LD        XHL,dyn_21D758                     [5]
.skip:
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]

.org 0x21D800

dyn_21D800:
    LD        XHL,dyn_214C0E                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CALL      dyn_2068B3                         [4]
    CPB       (0x60F0),1                         [5]
    JR        Z,.skip                            [2]
    CALL      CalcUnitStats                      [4]
    LDB       (0x5DF4),0                         [5]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]
.skip:
    LDW       (wEnemyAffinity),(wUnitAffinity)   [6]
    LD        A,1                                [2]
    CALL      sub_21AAA5                         [4]
    CALL      CalcUnitStats                      [4]
    LDB       (0x5DF4),0                         [5]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D8C0

swp_21D8C0:
    LD        XHL,swp_2130E1                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x5FF8),1                         [5]
    LD        XHL,dyn_21D800                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5FF8),2                         [5]
    LD        XHL,swp_21D93E                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5FF8),4                         [5]
    LD        XHL,swp_21D95E                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5FF8),5                         [5]
    LD        XHL,swp_21D980                     [5]
    JR        Z,.skip                            [2]
    CPB       (0x5FF8),6                         [5]
    LD        XHL,loc_21D997                     [5]
    JR        Z,.skip                            [2]
    LD        XHL,dyn_21D758                     [5]
.skip:
    LD        (XIZ+8),XHL                        [3]
    RET                                          [1]

.org 0x21D91C

swp_21D91C:
    LD        XHL,swp_214BEC                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D93E

swp_21D93E:
    LDW       (wEnemyAffinity),(wUnitAffinity)   [6]
    LD        A,3                                [2]
    CALL      sub_21AAA5                         [4]
    CALL      CalcUnitStats                      [4]
    LDB       (0x5DF4),0                         [5]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D95E

swp_21D95E:
    LD        XHL,swp_20F179                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xD800                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D980

swp_21D980:
    LD        XHL,StorySceneTheEnd               [5]
    CALL      StartChildTask                     [4]
    task_wait

.org 0x21D997

loc_21D997:
    LD        XHL,GameOverScreen                 [5]
    CALL      StartChildTask                     [4]
    task_wait
    LDW       (XIZ+8),0xD5E9                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]

.org 0x21D9B9

sub_21D9B9:
    CPB       (SYS_OS_VERSION),0x10              [5]
    JR        NZ,.done                           [2]
    CPB       (0x6C59),0                         [5]
    JR        Z,.done                            [2]
    CPB       (0x6C5B),1                         [5]
    JR        Z,.done                            [2]
    PUSH      WA                                 [1]
    LD        A,(0xB0)                           [3]
    LD        W,(0x9FFFFE)                       [5]
    CPL       W                                  [2]
    OR        A,W                                [2]
    EX        (0x6E97),A                         [4]
    LD{1}     W,A                                [2]
    XOR       A,(0x6E97)                         [4]
    AND       W,A                                [2]
    CPL       A                                  [2]
    AND       A,(0x6E97)                         [4]
    OR        A,W                                [2]
    OR        (SYS_JOYPAD),A                     [4]
    POP       WA                                 [1]
.done:
    RET                                          [1]
