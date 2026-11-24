; engine/events: 7 routines (each keeps its ROM address with .org)

.org 0x2168AC

sub_2168AC:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,3                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,(wGP)                          [4]
    LD        C,6                                [2]
    LD        A,3                                [2]
    CALL      sub_216851                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2168C7

; [code] clears event flags 0-11
ClearStoryStage:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      A                                  [1]
    LD        HL,EVENT_STAGE_TOWN                [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_ARENA_OPEN          [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_E          [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_D          [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_C          [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_B          [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_A          [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_S          [2]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_CS         [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_LILY                [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_ENDING              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_STAGE_WON_RANK_X          [3]
    CALL      ClearEventFlag                     [4]
    POP       A                                  [1]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21691A

sub_21691A:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      A                                  [1]
    LD        HL,EVENT_TALKED_JON                [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_LILY               [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_CYRIUS             [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_SHOP               [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x44                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_WYSE               [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_ZIGGY              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_CEUS               [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_HELMUT             [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_ALDA               [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_CAMIL              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_MEESE              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_COLLA              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_TETIS              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_TALKED_RENAB              [3]
    CALL      ClearEventFlag                     [4]
    POP       A                                  [1]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216AA2

; [code] A = highest event flag 1-11 that is set, else 0
GetStoryStage:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    LD        HL,0xB                             [3]
    PUSH      HL                                 [1]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    POP       HL                                 [1]
    JR        Z,0x216AB7                         [2]
    SUB       HL,1                               [4]
    JR        NZ,0x216AA7                        [2]
    LD{1}     A,L                                [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216ABC

; [code] A = StageArenaRank[GetStoryStage]
GetStageArenaRank:
    PUSH      XHL                                [1]
    PUSH      W                                  [2]
    CALL      GetStoryStage                      [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,StageArenaRank                 [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    POP       W                                  [2]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216AD4

; [code+play] sets flag StageFlags[A], wArenaRank from the new stage
SetStoryStage:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      XWA                                [1]
    CALL      ClearStoryStage                    [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,StageFlags                     [5]
    ADD       XHL,XWA                            [2]
    LD        L,(XHL)                            [2]
    EXTZ      HL                                 [2]
    CALL      SetEventFlag                       [4]
    CALL      GetStageArenaRank                  [4]
    LD        (wArenaRank),A                     [4]
    POP       XWA                                [1]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216AFA

; [code] stage + 1 while below 9
AdvanceStoryStage:
    PUSH      A                                  [1]
    CALL      GetStageArenaRank                  [4]
    CP        A,9                                [3]
    JR        NC,.skip                           [2]
    INC       1,A                                [2]
    CALL      SetStoryStage                      [4]
.skip:
    POP       A                                  [1]
    RET                                          [1]
