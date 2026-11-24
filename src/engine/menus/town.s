; engine/menus/town: 184 routines (each keeps its ROM address with .org)

.org 0x20D84E

dyn_20D84E:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        XWA,dyn_20DA71                     [5]
    LD        (XIZ+TASK_FUNC),XWA                [3]
    LD        WA,1                               [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x21                            [3]
    CALL      SoundCommand                       [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20D871

; [code] Works / Shop / Arena / Square / W.Map
StreetMenu:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      sub_2067E1                         [4]
    CALL      sub_206847                         [4]
    CALL      dyn_2167CF                         [4]
    LD        A,2                                [2]
    LD        XHL,WorksText                      [5]
    CALL      dyn_2076F3                         [4]
    LD        A,2                                [2]
    LD        XHL,ShopText                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,2                                [2]
    LD        XHL,ArenaText                      [5]
    CALL      dyn_2076F3                         [4]
    LD        A,2                                [2]
    LD        XHL,SquareText                     [5]
    CALL      dyn_2076F3                         [4]
    LD        A,2                                [2]
    LD        XHL,WMapText                       [5]
    CALL      dyn_2076F3                         [4]
    LD        XHL,StreetText                     [5]
    LD        A,3                                [2]
    CALL      dyn_2076F3                         [4]
    CALL      dyn_2167E4                         [4]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,WhereDoYouGoText               [5]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        HL,0x28                            [3]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    CALL      dyn_216EDE                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216F6B                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20D8FB

dyn_20D8FB:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,StreetMenuPrompt                 [2]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    CALR      dyn_20D9A6                         [3]
    JR        dyn_20D983                         [2]

.org 0x20D914

; [code+play] "Where do you go?"
StreetMenuPrompt:
    BIT       5,A                                [3]
    JR        Z,dyn_20D936                       [2]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,WhereDoYouGoText               [5]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    JR        dyn_20D983                         [2]

.org 0x20D936

dyn_20D936:
    AND       A,0xF                              [3]
    JR        Z,dyn_20D983                       [2]
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LD        A,(0x5DF4)                         [4]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    DEC       1,A                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip:
    LD        A,4                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip4                          [2]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    LD        A,(0x5DF4)                         [4]
    CP        A,4                                [2]
    JR        Z,.skip3                           [2]
    INC       1,A                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip3:
    LD        A,0                                [2]
    LD        (0x5DF4),A                         [4]
    JR        .skip4                             [2]
.skip4:
    JR        dyn_20D983                         [2]

.org 0x20D983

dyn_20D983:
    LD        BC,0x60                            [3]
    LD        XWA,0                              [2]
    LD        A,(0x5DF4)                         [4]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20D9A6

dyn_20D9A6:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        XHL,0                              [2]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,(0x5DF4)                         [4]
    CP        A,2                                [2]
    JR        Z,dyn_20D9F8                       [2]
    CP        A,3                                [2]
    JR        Z,dyn_20D9F8                       [2]
    CP        A,0                                [2]
    JR        Z,dyn_20D9F8                       [2]
    CP        A,1                                [2]
    JR        Z,dyn_20D9F8                       [2]
    LD        HL,EVENT_STAGE_TOWN                [2]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip                           [2]
    LD        HL,EVENT_STAGE_WON_RANK_CS         [3]
    CALL      CheckEventFlag                     [4]
    JR        NZ,.skip                           [2]
    JR        dyn_20D9F8                         [2]
.skip:
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,NoUNITRONYouCantText           [5]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    JR        dyn_20D9FF                         [2]

.org 0x20D9F8

dyn_20D9F8:
    LD        A,4                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JR        dyn_20D9FF                         [2]

.org 0x20D9FF

dyn_20D9FF:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DA04

swp_20DA04:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      dyn_2167F9                         [4]
    LD        A,5                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,(0x5DF4)                         [4]
    CP        A,4                                [2]
    JR        NZ,.skip                           [2]
    LD        XHL,swp_210443                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    JR        .skip5                             [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    LD        XHL,swp_214BEC                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip3:
    CP        A,0                                [2]
    JR        NZ,.skip4                          [2]
    LD        XHL,dyn_214C0E                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip4:
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    LD        XHL,swp_214C75                     [5]
    CALL      StartChildTask                     [4]
    JR        .skip5                             [2]
.skip5:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DA5C

sub_20DA5C:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        WA,(XIZ+TASK_CHILDREN)             [3]
    CP        WA,0                               [2]
    JR        NZ,.skip                           [2]
    LD        A,1                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
.skip:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DA71

dyn_20DA71:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+TASK_ARG)                   [3]
    CP        A,1                                [2]
    JR        NZ,dyn_20DA86                      [2]
    CALR      StreetMenu                         [3]
    LD        A,2                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JR        0x20DAB4                           [2]

.org 0x20DA86

dyn_20DA86:
    CP        A,2                                [2]
    JR        NZ,dyn_20DA91                      [2]
    LD        A,3                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JR        0x20DAB4                           [2]

.org 0x20DA91

dyn_20DA91:
    CP        A,3                                [2]
    JR        NZ,dyn_20DA9A                      [2]
    CALR      dyn_20D8FB                         [3]
    JR        0x20DAB4                           [2]

.org 0x20DA9A

dyn_20DA9A:
    CP        A,4                                [2]
    JR        NZ,.skip                           [2]
    CALL      EndTask                            [4]
    JR        0x20DAB4                           [2]
.skip:
    CP        A,5                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_20DA5C                         [3]
    JR        0x20DAB4                           [2]
.skip2:
    JR        0x20DAB4                           [2]

.org 0x20DAAF

swp_20DAAF:
    LD        A,1                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x20DAB9

dyn_20DAB9:
    CALL      dyn_20DACC                         [4]
    ADD       XHL,0xFA000                        [6]
    PUSH      XHL                                [1]
    CALL      dyn_2077BE                         [4]
    ADD       XHL,(XSP+)                         [3]
    RET                                          [1]

.org 0x21206C

sub_21206C:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x20)                       [3]
    EXTZ      WA                                 [2]
    ADD       WA,0x26                            [4]
    CALL      0x2061D6                           [4]
    JR        C,.skip                            [2]
    LD        A,(XIZ+0x20)                       [3]
    EXTZ      WA                                 [2]
    ADD       WA,0x26                            [4]
    CALL      sub_216BC9                         [4]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
.skip:
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214C53

dyn_214C53:
    CALL      dyn_206803                         [4]
    LD        A,0                                [2]
    LD        (wFadeLevel),A                     [4]
    LD        A,5                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        A,5                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        XWA,dyn_214C97                     [5]
    LD        (XIZ+TASK_FUNC),XWA                [3]
    RET                                          [1]

.org 0x214C75

swp_214C75:
    CALL      dyn_206803                         [4]
    LD        A,0                                [2]
    LD        (wFadeLevel),A                     [4]
    LD        A,5                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        XWA,dyn_214C97                     [5]
    LD        (XIZ+TASK_FUNC),XWA                [3]
    RET                                          [1]

.org 0x214C97

dyn_214C97:
    LD        A,(XIZ+TASK_ARG)                   [3]
    CP        A,0xC                              [3]
    JR        Z,dyn_214D10                       [2]
    CP        A,1                                [2]
    JR        NZ,0x214CA8                        [2]
    LD        A,2                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    CP        A,2                                [2]
    JR        NZ,dyn_214CB2                      [2]
    CALL      sub_214E33                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CB2

dyn_214CB2:
    CP        A,3                                [2]
    JR        NZ,dyn_214CBC                      [2]
    CALL      sub_214E5D                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CBC

dyn_214CBC:
    CP        A,4                                [2]
    JR        NZ,dyn_214CC6                      [2]
    CALL      sub_215054                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CC6

dyn_214CC6:
    CP        A,5                                [2]
    JR        NZ,dyn_214CD0                      [2]
    CALL      dyn_215760                         [4]
    JR        dyn_214D22                         [2]

.org 0x214CD0

dyn_214CD0:
    CP        A,6                                [2]
    JR        NZ,.skip                           [2]
    CALL      dyn_215924                         [4]
    JR        dyn_214D22                         [2]
.skip:
    CP        A,7                                [2]
    JR        NZ,.skip2                          [2]
    CALL      sub_215EDC                         [4]
    JR        dyn_214D22                         [2]
.skip2:
    CP        A,8                                [3]
    JR        NZ,.skip3                          [2]
    CALL      sub_216208                         [4]
    JR        dyn_214D22                         [2]
.skip3:
    CP        A,9                                [3]
    JR        NZ,.skip4                          [2]
    CALL      sub_21634F                         [4]
    JR        dyn_214D22                         [2]
.skip4:
    CP        A,0xA                              [3]
    JR        NZ,.skip5                          [2]
    CALL      sub_216619                         [4]
    JR        dyn_214D22                         [2]
.skip5:
    CP        A,0xB                              [3]
    JR        NZ,dyn_214D10                      [2]
    CALL      TetisGift                          [4]
    JR        dyn_214D22                         [2]

.org 0x214D10

dyn_214D10:
    LD        A,1                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,(XIZ+0x11)                       [3]
    LD        (0x60F0),A                         [4]
    CALL      EndTask                            [4]
    JR        dyn_214D22                         [2]

.org 0x214D22

dyn_214D22:
    RET                                          [1]

.org 0x214D23

dyn_214D23:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x15)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    PUSH      XWA                                [1]
    CALL      dyn_206803                         [4]
    POP       XWA                                [1]
    PUSH      XWA                                [1]
    LD        XHL,0x249EC7                       [5]
    ADD       XHL,XWA                            [2]
    LD        L,(XHL)                            [2]
    EXTZ      HL                                 [2]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    POP       XWA                                [1]
    SLL       2,XWA                              [3]
    LD        XHL,0x249EAB                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,3                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214D64

sub_214D64:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        C,0                                [2]
    LD        E,8                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249ECE                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214D82

sub_214D82:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,1                                [2]
    CALL      dyn_207611                         [4]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214D97

dyn_214D97:
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    PUSH      A                                  [1]
    LD        A,W                                [2]
    DEC       1,A                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x24A250                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       A                                  [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,8                              [4]
    ADD       XHL,XWA                            [2]
    JR        0x214DC6                           [2]
.skip:
    LD        XHL,0x24A248                       [5]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    RET                                          [1]

.org 0x214DCA

; [code+play] D-town / Forest / Spring
SquarePlaceMenu:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      sub_216779                         [4]
    LD        A,2                                [2]
    LD        XHL,0x249EEA                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,2                                [2]
    LD        XHL,DTownText2                     [5]
    CALL      dyn_2076F3                         [4]
    LD        A,2                                [2]
    LD        XHL,ForestText2                    [5]
    CALL      dyn_2076F3                         [4]
    LD        A,2                                [2]
    LD        XHL,SpringText2                    [5]
    CALL      dyn_2076F3                         [4]
    CALR      sub_214D64                         [3]
    CALR      dyn_214D23                         [3]
    CALL      sub_2169E5                         [4]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,0x249ED6                       [5]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,3                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214E33

sub_214E33:
    CALL      dyn_2167CF                         [4]
    CALR      SquarePlaceMenu                    [3]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_2167E4                         [4]
    CALL      dyn_216EDE                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216F6B                         [4]
    LD        XWA,1                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x21                            [3]
    CALL      SoundCommand                       [4]
    RET                                          [1]

.org 0x214E5D

sub_214E5D:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_214F0F                         [3]
    JRL       .done                              [3]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALR      sub_214F0F                         [3]
    JRL       .done                              [3]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip9                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    CP        A,8                                [3]
    JR        Z,.skip4                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip3:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip4:
    LD        A,3                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip5:
    CP        A,2                                [2]
    JR        NZ,.skip8                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip6                           [2]
    CP        A,3                                [2]
    JR        Z,.skip7                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip6:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip7:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip8:
    JR        .skip9                             [2]
.skip9:
    LD        BC,0x60                            [3]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
.done:
    RET                                          [1]

.org 0x214F0F

sub_214F0F:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        NZ,.skip                           [2]
    CALR      sub_214D82                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,0xC                              [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JR        .skip2                             [2]
.skip:
    ADD       A,1                                [3]
    LD        (XIZ+0x15),A                       [3]
    CALR      sub_214D82                         [3]
    CALR      sub_215031                         [3]
    JR        .skip2                             [2]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214F3D

sub_214F3D:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x1E                           [6]
    LD{1}     XDE,XHL                            [2]
    LD        A,0xFF                             [2]
    LD        C,4                                [2]
.loop:
    LD        (XHL),A                            [2]
    INC       1,XHL                              [2]
    DJNZ      C,.loop                            [3]
    LD        A,0                                [2]
    LD        (XIZ+0x1A),A                       [3]
    LD        A,(XIZ+0x15)                       [3]
    SUB       A,1                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A304                       [5]
    ADD       XHL,XWA                            [2]
    LD        C,(XHL)                            [2]
    EXTZ      BC                                 [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x24A2F4                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    CALL      GetStoryStage                      [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,BC                             [2]
    ADD       XHL,XWA                            [2]
    LD        A,0                                [2]
.loop2:
    LD        W,(XHL)                            [2]
    CP        W,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        (XDE),W                            [2]
    INC       1,XHL                              [2]
    INC       1,XDE                              [2]
    INC       1,A                                [2]
    DJNZ      C,.loop2                           [3]
.skip:
    LD        (XIZ+0x1A),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x214FA4

sub_214FA4:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALL      sub_216779                         [4]
    CALR      sub_214F3D                         [3]
    LD        C,(XIZ+0x1A)                       [3]
    CP        C,0                                [2]
    JR        Z,.skip                            [2]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x1E                           [6]
    LD{1}     XDE,XHL                            [2]
    LD        W,(XIZ+0x15)                       [3]
.loop:
    PUSH      XDE                                [1]
    PUSH      C                                  [2]
    PUSH      W                                  [2]
    LD        A,(XDE)                            [2]
    CALR      dyn_214D97                         [3]
    LD        A,(XHL+0)                          [3]
    SUB       A,0x15                             [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,0x249F66                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        XHL,0x249FA1                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       W                                  [2]
    POP       C                                  [2]
    POP       XDE                                [1]
    INC       1,XDE                              [2]
    DJNZ      C,.loop                            [3]
.skip:
    CALR      sub_214D64                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    LD        A,1                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,TalkWithWhoText                [5]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,4                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215031

sub_215031:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      sub_214FA4                         [3]
    CALR      dyn_214D23                         [3]
    LD        A,(XIZ+0x1A)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    LD        A,8                                [2]
    JR        .skip2                             [2]
.skip:
    LD        A,0                                [2]
.skip2:
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_216FB1                         [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215054

sub_215054:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    CALR      sub_215115                         [3]
    JRL       .done                              [3]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALR      sub_215115                         [3]
    JRL       .done                              [3]
.skip2:
    LD        W,(XIZ+0x1A)                       [3]
    CP        W,0                                [2]
    JR        Z,.skip8                           [2]
    AND       A,0xF                              [3]
    JR        Z,.skip9                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    CP        A,8                                [3]
    JR        Z,.skip4                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip3:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip4:
    LD        A,(XIZ+0x1A)                       [3]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip5:
    CP        A,2                                [2]
    JR        NZ,.skip8                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip6                           [2]
    LD        W,(XIZ+0x1A)                       [3]
    DEC       1,W                                [2]
    CP        A,W                                [2]
    JR        Z,.skip7                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip6:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip7:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip8                             [2]
.skip8:
    JR        .skip9                             [2]
.skip9:
    LD        BC,0x60                            [3]
    LD        XWA,0                              [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
.done:
    RET                                          [1]

.org 0x215115

sub_215115:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        NZ,.skip                           [2]
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x15)                       [3]
    SUB       A,1                                [3]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x15),A                       [3]
    CALR      SquarePlaceMenu                    [3]
    JR        .skip2                             [2]
.skip:
    CALR      sub_214D82                         [3]
    CALL      sub_216779                         [4]
    CALR      dyn_215749                         [3]
    LD        A,(XIZ+0x10)                       [3]
    LD        (XIZ+0x1B),A                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD{1}     XHL,XIZ                            [2]
    ADD       XHL,0x1E                           [6]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    LD        (XIZ+0x12),A                       [3]
    JR        .skip2                             [2]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215161

dyn_215161:
    PUSH      WA                                 [1]
    LD        W,(XIZ+0x15)                       [3]
    LD        A,(XIZ+0x12)                       [3]
    CALR      dyn_214D97                         [3]
    POP       WA                                 [1]
    RET                                          [1]

.org 0x21516D

dyn_21516D:
    PUSH      XHL                                [1]
    LD        XHL,0x9800                         [5]
    CALL      dyn_216BEE                         [4]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215179

dyn_215179:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      dyn_21516D                         [3]
    CP        HL,0                               [2]
    JR        Z,0x2151B3                         [2]
    CP        HL,0xFFFF                          [4]
    JR        Z,dyn_215193                       [2]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    ADD       E,0x20                             [3]
    JR        dyn_2151AB                         [2]

.org 0x215193

dyn_215193:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    XOR       A,1                                [3]
    EXTZ      WA                                 [2]
    LD        HL,1                               [2]
    ADD       HL,WA                              [2]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    ADD       E,0x20                             [3]
    JR        dyn_2151AB                         [2]

.org 0x2151AB

dyn_2151AB:
    CALL      dyn_216849                         [4]
    CALL      DrawPortraitAt                     [4]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2151B8

dyn_2151B8:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      dyn_215161                         [3]
    LD        A,(XHL+0)                          [3]
    LD        W,(XIZ+0x13)                       [3]
    CP        A,W                                [2]
    JR        Z,0x2151D3                         [2]
    LD        (XIZ+0x13),A                       [3]
    LD        L,A                                [2]
    EXTS      HL                                 [2]
    CALR      dyn_215179                         [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2151D8

; [code+play] talk to a town NPC (E = NPC; 8 Helmut -> HelmutSkillOffer); Colla, Cyrius, Lily screens
TownNpcTalk:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JRL       Z,0x215356                         [3]
    CP        A,6                                [2]
    JRL       Z,0x215356                         [3]
    CP        A,7                                [2]
    JRL       Z,0x215356                         [3]
    CP        A,8                                [3]
    JRL       Z,0x215356                         [3]
    LD        D,W                                [2]
    LD{1}     W,A                                [2]
    LD{1}     A,D                                [2]
    CALR      dyn_214D97                         [3]
    LD        A,(XHL+0)                          [3]
    SUB       A,0x15                             [3]
    LD        E,A                                [2]
    LD        HL,0x40                            [3]
    LD{1}     A,E                                [2]
    EXTZ      WA                                 [2]
    ADD       HL,WA                              [2]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip                            [2]
    LD{1}     W,D                                [2]
    JRL       0x215356                           [3]
.skip:
    CP        E,2                                [2]
    JR        Z,.skip2                           [2]
    CP        E,8                                [3]
    JR        Z,.skip6                           [2]
    CP        E,0xC                              [3]
    JR        Z,.skip7                           [2]
    CP        E,0xD                              [3]
    JRL       Z,.skip9                           [3]
    JRL       .skip10                            [3]
.skip2:
    LD{1}     W,D                                [2]
    CP        W,0x22                             [3]
    JRL       C,0x215356                         [3]
    CP        W,0x48                             [3]
    JRL       NC,0x215356                        [3]
    CALL      sub_216B19                         [4]
    CP        A,0                                [2]
    JRL       Z,.skip10                          [3]
    LD        HL,EVENT_CYRIUS_TOLD_LORDS         [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip3                           [2]
    CALL      sub_216B19                         [4]
    CP        A,4                                [2]
    JR        Z,.skip4                           [2]
    JRL       .skip10                            [3]
.skip3:
    LD        W,0x12                             [2]
    JRL       0x215356                           [3]
.skip4:
    LD        HL,EVENT_CYRIUS_TRADED             [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip5                           [2]
    LD        A,0                                [2]
    LD        (XIZ+0x28),A                       [3]
    LD        W,0x13                             [2]
    JRL       0x215356                           [3]
.skip5:
    LD        A,1                                [2]
    LD        (XIZ+0x28),A                       [3]
    LD        W,0x1B                             [2]
    JRL       0x215356                           [3]
.skip6:
    LD        A,(XIZ+0x15)                       [3]
    CP        A,3                                [2]
    JR        Z,.skip10                          [2]
    LD{1}     W,D                                [2]
    CP        W,0x22                             [3]
    JRL       C,0x215356                         [3]
    CALR      HelmutSkillOffer                   [3]
    CP        A,0x14                             [3]
    JR        Z,.skip10                          [2]
    LD        (XIZ+0x29),A                       [3]
    LD        W,4                                [2]
    JRL       0x215356                           [3]
.skip7:
    LD{1}     W,D                                [2]
    CP        W,0x1B                             [3]
    JRL       NC,0x215356                        [3]
    CALL      GetStageArenaRank                  [4]
    CP        A,3                                [2]
    JR        C,.skip10                          [2]
    LD        HL,EVENT_COLLA_OFFERS_ENABLED      [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        NZ,.skip8                          [2]
    LD        W,0x1B                             [2]
    JRL       0x215356                           [3]
.skip8:
    PUSH      W                                  [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV{1}    WA,0x64                            [3]
    LD        A,W                                [2]
    POP       W                                  [2]
    CP        A,0x3C                             [3]
    JR        NC,.skip10                         [2]
    LD        W,0x1C                             [2]
    JR        0x215356                           [2]
.skip9:
    LD{1}     W,D                                [2]
    CP        W,0x49                             [3]
    JR        NC,0x215356                        [2]
    JR        .skip10                            [2]
.skip10:
    LD        D,0                                [2]
    LD        HL,0x50                            [3]
    LD{1}     A,E                                [2]
    EXTZ      WA                                 [2]
    ADD       HL,WA                              [2]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        NZ,.skip11                         [2]
    INC       1,D                                [2]
.skip11:
    LD        HL,EVENT_STAGE_ENDING              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip12                          [2]
    LD        HL,EVENT_STAGE_WON_RANK_X          [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip12                          [2]
    JR        .skip13                            [2]
.skip12:
    INC       2,D                                [2]
.skip13:
    CP        E,7                                [2]
    JR        Z,.skip14                          [2]
    CP        E,8                                [3]
    JR        Z,.skip17                          [2]
    JR        .skip18                            [2]
.skip14:
    LD        A,(XIZ+0x15)                       [3]
    CP        A,2                                [2]
    JR        Z,.skip15                          [2]
    CP        A,4                                [2]
    JR        Z,.skip16                          [2]
    JR        .skip18                            [2]
.skip15:
    LD        E,0xE                              [2]
    JR        .skip18                            [2]
.skip16:
    LD        E,0xF                              [2]
    JR        .skip18                            [2]
.skip17:
    LD        A,(XIZ+0x15)                       [3]
    CP        A,3                                [2]
    JR        Z,.skip18                          [2]
    LD        E,0x10                             [2]
.skip18:
    LD{1}     A,E                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,XWA                            [2]
    LD{1}     A,D                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XHL,XWA                            [2]
    LD        XWA,0x24A308                       [5]
    ADD       XHL,XWA                            [2]
    LD        W,(XHL)                            [2]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21535A

dyn_21535A:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JR        Z,dyn_215379                       [2]
    CP        A,6                                [2]
    JRL       Z,loc_2154B2                       [3]
    CP        A,7                                [2]
    JRL       Z,dyn_2154EF                       [3]
    CP        A,8                                [3]
    JRL       Z,loc_2154F3                       [3]
    LD        W,0xFF                             [2]
    JRL       dyn_2154F7                         [3]

.org 0x215379

dyn_215379:
    CALL      GetStoryStage                      [4]
    CP        A,0xA                              [3]
    JRL       Z,loc_21549F                       [3]
    CP        A,8                                [3]
    JR        Z,loc_215403                       [2]
    CP        A,0                                [2]
    JR        Z,dyn_215391                       [2]
    LD        W,0xFF                             [2]
    JRL       dyn_2154F7                         [3]

.org 0x215391

dyn_215391:
    LD        HL,EVENT_TALKED_RENAB              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,loc_2153FE                       [2]
    LD        HL,EVENT_TALKED_JON                [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,EVENT_TALKED_LILY               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,EVENT_TALKED_SHOP               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,EVENT_TALKED_WYSE               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,EVENT_TALKED_CEUS               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,EVENT_TALKED_HELMUT             [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,EVENT_TALKED_CAMIL              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        HL,EVENT_TALKED_MEESE              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,dyn_2153F9                       [2]
    LD        W,2                                [2]
    JRL       dyn_2154F7                         [3]

.org 0x2153F9

dyn_2153F9:
    LD        W,1                                [2]
    JRL       dyn_2154F7                         [3]

.org 0x2153FE

loc_2153FE:
    LD        W,0                                [2]
    JRL       dyn_2154F7                         [3]

.org 0x215403

loc_215403:
    LD        HL,EVENT_TALKED_RENAB              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JRL       Z,.skip2                           [3]
    LD        HL,EVENT_TALKED_JON                [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_CYRIUS             [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_SHOP               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_WYSE               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_ZIGGY              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_CEUS               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_HELMUT             [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_ALDA               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_CAMIL              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_MEESE              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_COLLA              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        HL,EVENT_TALKED_TETIS              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        W,5                                [2]
    JR        dyn_2154F7                         [2]
.skip:
    LD        W,4                                [2]
    JR        dyn_2154F7                         [2]
.skip2:
    LD        W,3                                [2]
    JR        dyn_2154F7                         [2]

.org 0x21549F

loc_21549F:
    LD        HL,EVENT_TALKED_RENAB              [3]
    CALL      CheckEventFlag                     [4]
    CP        L,0                                [2]
    JR        Z,.skip                            [2]
    LD        W,0xFF                             [2]
    JR        dyn_2154F7                         [2]
.skip:
    LD        W,0xE                              [2]
    JR        dyn_2154F7                         [2]

.org 0x2154B2

loc_2154B2:
    LD        HL,EVENT_TALKED_SHOP               [3]
    CALL      CheckEventFlag                     [4]
    CP        L,1                                [2]
    JR        Z,.skip3                           [2]
    CALL      GetStoryStage                      [4]
    CP        A,8                                [3]
    JR        Z,.skip2                           [2]
    CP        A,0                                [2]
    JR        Z,.skip                            [2]
    LD        W,0xFF                             [2]
    JR        dyn_2154F7                         [2]
.skip:
    LD        W,0                                [2]
    JR        dyn_2154F7                         [2]
.skip2:
    LD        W,4                                [2]
    JR        dyn_2154F7                         [2]
.skip3:
    CALL      GetStoryStage                      [4]
    CP        A,8                                [3]
    JR        Z,.skip5                           [2]
    CP        A,0                                [2]
    JR        Z,.skip4                           [2]
    LD        W,0xFF                             [2]
    JR        dyn_2154F7                         [2]
.skip4:
    LD        W,3                                [2]
    JR        dyn_2154F7                         [2]
.skip5:
    LD        W,7                                [2]
    JR        dyn_2154F7                         [2]

.org 0x2154EF

dyn_2154EF:
    LD        W,0                                [2]
    JR        dyn_2154F7                         [2]

.org 0x2154F3

loc_2154F3:
    LD        W,0                                [2]
    JR        dyn_2154F7                         [2]

.org 0x2154F7

dyn_2154F7:
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2154FB

; [code] town talk row done: SetEventFlag(row +2), then per flag: 1 = Unitron fitted (3 FixIt1, 3 Tool1, 3 Steel, 500 GP), 9, 0x4D (Tetis), 0x4A (Camil: StageStatBonus); was LilyGivesFlowers (a [play] screen name, too narrow)
NpcTalkRowAction:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CALR      dyn_215161                         [3]
    LD        A,(XHL+2)                          [3]
    CP        A,0                                [2]
    JRL       Z,dyn_215609                       [3]
    LD        L,A                                [2]
    EXTZ      HL                                 [2]
    PUSH      A                                  [1]
    CALL      SetEventFlag                       [4]
    POP       A                                  [1]
    CP        A,1                                [2]
    JR        Z,.skip                            [2]
    CP        A,9                                [3]
    JR        Z,.skip2                           [2]
    CP        A,0x4D                             [3]
    JR        Z,.skip3                           [2]
    CP        A,0x4A                             [3]
    JRL       Z,.skip4                           [3]
    JRL       dyn_215609                         [3]
.skip:
    LD        HL,EVENT_STAGE_TOWN                [2]
    CALL      ClearEventFlag                     [4]
    CALL      sub_21691A                         [4]
    LD        A,1                                [2]
    LD        (wArenaRank),A                     [4]
    LD        WA,ITEM_FIXIT1                     [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_FIXIT1                     [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_FIXIT1                     [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_TOOL1                      [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_TOOL1                      [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_TOOL1                      [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_STEEL                      [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_STEEL                      [3]
    CALL      AddItem                            [4]
    LD        WA,ITEM_STEEL                      [3]
    CALL      AddItem                            [4]
    LD        WA,0x1F4                           [3]
    CALL      AddGP                              [4]
    JRL       dyn_215609                         [3]
.skip2:
    LD        HL,EVENT_STAGE_WON_RANK_CS         [3]
    CALL      ClearEventFlag                     [4]
    CALL      sub_21691A                         [4]
    JR        dyn_215609                         [2]
.skip3:
    CALL      GetStoryStage                      [4]
    CP        A,2                                [2]
    JR        C,dyn_215609                       [2]
    CP        A,9                                [3]
    JR        NC,dyn_215609                      [2]
    PUSH      WA                                 [1]
    LD        WA,0xFF                            [3]
    CALL      AddItem                            [4]
    POP       WA                                 [1]
    JR        dyn_215609                         [2]
.skip4:
    CALL      GetStoryStage                      [4]
    CP        A,1                                [2]
    JR        C,dyn_215609                       [2]
    CP        A,9                                [3]
    JR        NC,dyn_215609                      [2]
    SUB       A,1                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    LD        XHL,StageStatBonus                 [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    LD        BC,(wPilotAP)                      [4]
    ADD       WA,BC                              [2]
    LD        (wPilotAP),WA                      [4]
    INC       1,XHL                              [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    LD        BC,(wPilotSP)                      [4]
    ADD       WA,BC                              [2]
    LD        (wPilotSP),WA                      [4]
    INC       1,XHL                              [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    LD        BC,(wPilotRP)                      [4]
    ADD       WA,BC                              [2]
    LD        (wPilotRP),WA                      [4]
    INC       1,XHL                              [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    LD        BC,(wPilotMP)                      [4]
    ADD       WA,BC                              [2]
    LD        (wPilotMP),WA                      [4]
    INC       1,XHL                              [2]
    JR        dyn_215609                         [2]

.org 0x215609

dyn_215609:
    CALR      dyn_215161                         [3]
    LD        A,(XHL+3)                          [3]
    CP        A,0xFF                             [3]
    JRL       Z,loc_21572F                       [3]
    CP        A,0xFD                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xFB                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xF9                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xF8                             [3]
    JRL       Z,dyn_215721                       [3]
    CP        A,0xF5                             [3]
    JR        Z,.skip                            [2]
    CP        A,0xF4                             [3]
    JR        Z,.skip2                           [2]
    CP        A,0xF3                             [3]
    JR        Z,.skip3                           [2]
    CP        A,0xF2                             [3]
    JR        Z,.skip4                           [2]
    CP        A,0xF0                             [3]
    JR        Z,dyn_21569B                       [2]
    CP        A,0xEF                             [3]
    JR        Z,loc_2156A8                       [2]
    CP        A,0xEE                             [3]
    JR        Z,loc_2156B5                       [2]
    CP        A,0xED                             [3]
    JR        Z,loc_2156C1                       [2]
    CP        A,0xEC                             [3]
    JR        Z,loc_2156C6                       [2]
    CP        A,0xEB                             [3]
    JR        Z,loc_2156CD                       [2]
    CP        A,0xEA                             [3]
    JR        Z,loc_2156D2                       [2]
    CP        A,0xE9                             [3]
    JR        Z,loc_2156D9                       [2]
    CP        A,0xE8                             [3]
    JRL       Z,loc_2156F5                       [3]
    CP        A,0xE7                             [3]
    JRL       Z,loc_215704                       [3]
    CP        A,0xE6                             [3]
    JRL       Z,loc_21571A                       [3]
    LD        (XIZ+0x12),A                       [3]
    JRL       0x215739                           [3]
.skip:
    LD        A,0                                [2]
    LD        (XIZ+0x27),A                       [3]
.skip2:
    LD        A,7                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JRL       0x215739                           [3]
.skip3:
    LD        A,0                                [2]
    LD        (XIZ+0x27),A                       [3]
.skip4:
    LD        A,8                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JRL       0x215739                           [3]

.org 0x21569B

dyn_21569B:
    LD        A,0xF0                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215739                           [3]

.org 0x2156A8

loc_2156A8:
    LD        A,0xEF                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215739                           [3]

.org 0x2156B5

loc_2156B5:
    LD        A,0xEE                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215739                           [2]

.org 0x2156C1

loc_2156C1:
    LD        A,0                                [2]
    LD        (XIZ+0x27),A                       [3]

.org 0x2156C6

loc_2156C6:
    LD        A,9                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JR        0x215739                           [2]

.org 0x2156CD

loc_2156CD:
    LD        A,1                                [2]
    LD        (XIZ+0x27),A                       [3]

.org 0x2156D2

loc_2156D2:
    LD        A,0xA                              [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JR        0x215739                           [2]

.org 0x2156D9

loc_2156D9:
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    SUB       A,2                                [3]
    JR        C,loc_21572F                       [2]
    CP        A,5                                [2]
    JR        NC,loc_21572F                      [2]
    ADD       A,0x4E                             [3]
    LD        (XIZ+0x12),A                       [3]
    JR        0x215739                           [2]

.org 0x2156F5

loc_2156F5:
    CALL      GetStoryStage                      [4]
    SUB       A,3                                [3]
    ADD       A,0x49                             [3]
    LD        (XIZ+0x12),A                       [3]
    JR        0x215739                           [2]

.org 0x215704

loc_215704:
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    CP        A,0                                [2]
    JR        Z,loc_21572F                       [2]
    LD        A,0x53                             [2]
    LD        (XIZ+0x12),A                       [3]
    JR        0x215739                           [2]

.org 0x21571A

loc_21571A:
    LD        A,0xB                              [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JR        0x215739                           [2]

.org 0x215721

dyn_215721:
    LD        W,0xFD                             [2]
    SUB       W,A                                [2]
    LD        (XIZ+0x11),W                       [3]
    LD        A,4                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215739                           [2]

.org 0x21572F

loc_21572F:
    LD        A,4                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x11),A                       [3]
    CALR      dyn_215741                         [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215741

dyn_215741:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (XIZ+0x25),A                       [3]
    POP       A                                  [1]
    RET                                          [1]

.org 0x215749

dyn_215749:
    PUSH      A                                  [1]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x25),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    POP       A                                  [1]
    RET                                          [1]

.org 0x215760

dyn_215760:
    CALR      dyn_21535A                         [3]
    CP        W,0xFF                             [3]
    JR        NZ,dyn_21578A                      [2]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JR        Z,.skip                            [2]
    CP        A,6                                [2]
    JR        Z,.skip2                           [2]
    LD        A,0                                [2]
    JR        .skip3                             [2]
.skip:
    LD        A,1                                [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,3                                [2]
    JR        .skip3                             [2]
.skip3:
    LD        (XIZ+0x11),A                       [3]
    LD        A,0xC                              [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JRL       0x215821                           [3]

.org 0x21578A

dyn_21578A:
    CALR      dyn_215749                         [3]
    LD        (XIZ+0x12),W                       [3]
    CALL      dyn_2167CF                         [4]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,7                                [2]
    JR        Z,dyn_2157E3                       [2]
    CP        A,8                                [3]
    JR        Z,dyn_2157E3                       [2]
    CALR      dyn_214D23                         [3]
    CALL      dyn_2167E4                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    CALL      dyn_216EDE                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216F6B                         [4]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,5                                [2]
    JR        Z,dyn_2157D2                       [2]
    CP        A,6                                [2]
    JR        NZ,dyn_2157E1                      [2]
    LD        XWA,3                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x23                            [3]
    CALL      SoundCommand                       [4]
    JR        dyn_2157E1                         [2]

.org 0x2157E3

dyn_2157E3:
    LD        W,(XIZ+0x15)                       [3]
    LD        A,(XIZ+0x12)                       [3]
    CALR      dyn_214D97                         [3]
    LD        L,(XHL+1)                          [3]
    EXTZ      HL                                 [2]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    CALL      dyn_2166C9                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    LD        XWA,4                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x24                            [3]
    CALL      SoundCommand                       [4]
    CALL      dyn_216E3A                         [4]
    LD        A,7                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x215822

dyn_215822:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        C,(XIZ+0x23)                       [3]
    CP        C,0xFF                             [3]
    JR        Z,0x215847                         [2]
    LD        B,(XIZ+0x24)                       [3]
    DEC       1,B                                [2]
    LD        (XIZ+0x24),B                       [3]
    JRL       NZ,0x21591F                        [3]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+0x10),C                       [3]
    LD        A,0xFF                             [2]
    LD        (XIZ+0x23),A                       [3]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        XHL,(XWA+8)                        [3]
    CP{2}     XHL,0                              [6]
    JR        Z,dyn_2158BD                       [2]
    LD        C,(XWA+0x12)                       [3]
    AND       C,0x7F                             [3]
    CP        C,2                                [2]
    JR        NZ,0x215867                        [2]
    LD        A,1                                [2]
    LD        (XIZ+0x26),A                       [3]
    LD        A,(wJoyPressed)                    [4]
    CP        A,B_BUTTON                         [3]
    JR        NZ,dyn_21588D                      [2]
    LD        A,(XIZ+0x15)                       [3]
    CP        A,7                                [2]
    JR        NZ,dyn_21588D                      [2]
    LD        A,1                                [2]
    CALL      dyn_207611                         [4]
    CALR      dyn_215741                         [3]
    LD        A,0xEF                             [2]
    LD        (XIZ+0x11),A                       [3]
    LD        A,8                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x21591F                           [3]

.org 0x21588D

dyn_21588D:
    LD        A,(wJoyPressed)                    [4]
    AND       A,A_BUTTON|B_BUTTON                [3]
    JRL       Z,0x21591F                         [3]
    LD        A,(XIZ+0x26)                       [3]
    CP        A,0                                [2]
    JR        Z,dyn_2158A5                       [2]
    LD        A,0                                [2]
    LD        (XIZ+0x26),A                       [3]
    JR        0x21591F                           [2]

.org 0x2158A5

dyn_2158A5:
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        C,(XWA+0x10)                       [3]
    LD        (XIZ+0x23),C                       [3]
    INC       1,C                                [2]
    LD        (XIZ+0x24),C                       [3]
    LD        C,0                                [2]
    LD        (XWA+0x10),C                       [3]
    JR        0x21591F                           [2]

.org 0x2158BD

dyn_2158BD:
    LD        A,(XIZ+0x25)                       [3]
    CP        A,0                                [2]
    JR        Z,dyn_2158CE                       [2]
    LD        A,1                                [2]
    LD        (XIZ+0x25),A                       [3]
    CALR      NpcTalkRowAction                   [3]
    JR        0x21591F                           [2]

.org 0x2158CE

dyn_2158CE:
    LD        W,(XIZ+0x12)                       [3]
    CP        W,0xFF                             [3]
    JR        NZ,0x2158DC                        [2]
    CALR      dyn_21535A                         [3]
    LD        (XIZ+0x12),W                       [3]
    LD        W,(XIZ+0x12)                       [3]
    CALR      TownNpcTalk                        [3]
    LD        (XIZ+0x12),W                       [3]
    CALR      dyn_2151B8                         [3]
    CALR      dyn_215161                         [3]
    LD        XHL,(XHL+4)                        [3]
    CP        XHL,0x58                           [6]
    JR        NC,0x21590C                        [2]
    CALL      IsPlayerMale                       [4]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       2,XWA                              [3]
    ADD       XHL,XWA                            [2]
    LD        XWA,0x259683                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    LD        A,1                                [2]
    CALL      GetTextBox                         [4]
    LD        (XWA+8),XHL                        [3]
    LD        A,0                                [2]
    LD        (XIZ+0x26),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0x25),A                       [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215924

dyn_215924:
    LD        A,(XIZ+0xF)                        [3]
    CP        A,1                                [2]
    JR        NZ,dyn_215933                      [2]
    LD        A,2                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215933

dyn_215933:
    CP        A,2                                [2]
    JR        NZ,0x21593C                        [2]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    CP        A,3                                [2]
    JR        NZ,dyn_215946                      [2]
    CALR      dyn_215822                         [3]
    JRL       0x215AE8                           [3]

.org 0x215946

dyn_215946:
    CP        A,4                                [2]
    JR        NZ,dyn_215980                      [2]
    CALR      dyn_21516D                         [3]
    LD        A,(XIZ+0x11)                       [3]
    CP        A,0                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,1                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,2                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,3                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,4                                [2]
    JR        Z,dyn_215974                       [2]
    CP        A,5                                [2]
    JR        Z,dyn_215974                       [2]
    CALR      sub_214FA4                         [3]
    LD        A,(XIZ+0x1B)                       [3]
    LD        (XIZ+0x10),A                       [3]
    JRL       0x215AE8                           [3]

.org 0x215974

dyn_215974:
    CALL      dyn_2167F9                         [4]
    LD        A,0xC                              [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    JRL       0x215AE8                           [3]

.org 0x215980

dyn_215980:
    CP        A,5                                [2]
    JR        NZ,dyn_21598C                      [2]
    LD        A,6                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x21598C

dyn_21598C:
    CP        A,6                                [2]
    JR        NZ,dyn_215998                      [2]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215998

dyn_215998:
    CP        A,7                                [2]
    JR        NZ,dyn_2159AF                      [2]
    LD        A,2                                [2]
    CALL      dyn_216E43                         [4]
    CP        A,1                                [2]
    JRL       Z,0x215AE8                         [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x2159AF

dyn_2159AF:
    CP        A,8                                [3]
    JRL       NZ,dyn_215AA1                      [3]
    LD        A,2                                [2]
    CALL      dyn_216E67                         [4]
    CP        A,1                                [2]
    JRL       Z,0x215AE8                         [3]
    LD        A,(XIZ+0x11)                       [3]
    CP        A,0xF0                             [3]
    JR        Z,dyn_2159DB                       [2]
    CP        A,0xEF                             [3]
    JR        Z,dyn_215A26                       [2]
    CP        A,0xEE                             [3]
    JRL       Z,loc_215A64                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x2159DB

dyn_2159DB:
    LD        A,1                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALL      dyn_206803                         [4]
    CALL      dyn_2166EB                         [4]
    LD        W,(XIZ+0x15)                       [3]
    LD        A,(XIZ+0x12)                       [3]
    CALR      dyn_214D97                         [3]
    LD        L,(XHL+1)                          [3]
    EXTZ      HL                                 [2]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    CALR      dyn_215161                         [3]
    LD        A,(XHL+0)                          [3]
    LD        (XIZ+0x13),A                       [3]
    LD        L,A                                [2]
    EXTS      HL                                 [2]
    LD        BC,4                               [2]
    LD        DE,0                               [2]
    ADD       E,0x20                             [3]
    CALL      dyn_216849                         [4]
    CALL      DrawPortraitAt                     [4]
    LD        A,7                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215A26

dyn_215A26:
    CALL      dyn_206803                         [4]
    CALL      dyn_2166EB                         [4]
    CALL      dyn_216757                         [4]
    CALL      dyn_21679E                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x12),A                       [3]
    CALR      dyn_214D23                         [3]
    CALR      dyn_2151B8                         [3]
    CALL      dyn_21712F                         [4]
    CALL      dyn_216F8E                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216E31                         [4]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        A,9                                [2]
    LD        (XIZ+0xF),A                        [3]
    JRL       0x215AE8                           [3]

.org 0x215A64

loc_215A64:
    CALL      dyn_206803                         [4]
    CALL      dyn_2166EB                         [4]
    CALL      dyn_216757                         [4]
    CALL      dyn_21679E                         [4]
    LD        A,5                                [2]
    LD        (XIZ+0x15),A                       [3]
    LD        A,0xE                              [2]
    LD        (XIZ+0x12),A                       [3]
    CALR      dyn_214D23                         [3]
    CALR      dyn_2151B8                         [3]
    CALL      sub_2170E4                         [4]
    CALL      dyn_216F8E                         [4]
    CALL      dyn_216FB1                         [4]
    CALL      dyn_216E31                         [4]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        A,0xA                              [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215AE8                           [2]

.org 0x215AA1

dyn_215AA1:
    CP        A,9                                [3]
    JR        NZ,.skip                           [2]
    CALL      dyn_216FC3                         [4]
    CP        A,1                                [2]
    JR        Z,0x215AE8                         [2]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x22                            [3]
    CALL      SoundCommand                       [4]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215AE8                           [2]
.skip:
    CP        A,0xA                              [3]
    JR        NZ,.skip2                          [2]
    CALL      dyn_216FC3                         [4]
    CP        A,1                                [2]
    JR        Z,0x215AE8                         [2]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x22                            [3]
    CALL      SoundCommand                       [4]
    LD        A,3                                [2]
    LD        (XIZ+0xF),A                        [3]
    JR        0x215AE8                           [2]
.skip2:
    LD        A,1                                [2]
    LD        (XIZ+0xF),A                        [3]
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x215AF1

sub_215AF1:
    LD        C,0                                [2]
    LD        E,2                                [2]
    LD        A,1                                [2]
    CALL      sub_20768A                         [4]
    LD        A,1                                [2]
    LD        XHL,0x249FA3                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,1                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x215B16

sub_215B16:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip7                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip7                             [2]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip6                           [2]
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    JR        .skip6                             [2]
.skip4:
    CP        A,8                                [3]
    JR        NZ,.skip6                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip5                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip6                             [2]
.skip6:
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,0x30                            [3]
    ADD       WA,0x20                            [4]
    LD        BC,WA                              [2]
    LD        DE,0x84                            [3]
    CALL      dyn_211DBD                         [4]
    JR        .done                              [2]
.skip7:
    CALL      dyn_2166EB                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip9                           [2]
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip8                           [2]
    LD        A,0x1C                             [2]
    JR        .skip11                            [2]
.skip8:
    LD        A,0x14                             [2]
    JR        .skip11                            [2]
.skip9:
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip10                          [2]
    LD        A,0x1D                             [2]
    JR        .skip11                            [2]
.skip10:
    LD        A,0x15                             [2]
    JR        .skip11                            [2]
.skip11:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x215BCD

sub_215BCD:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        XHL,0x249FA1                       [5]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    SLL       1,WA                               [3]
    LD        XHL,CyriusTradeMenu                [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    LD        A,(XIZ+0x10)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    ADD       XHL,XWA                            [2]
    LD        WA,(XHL)                           [2]
    POP       XHL                                [1]
    CALL      sub_216BC9                         [4]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215C14

sub_215C14:
    PUSH      XWA                                [1]
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    SLL       1,WA                               [3]
    LD        XHL,CyriusTradeMenu                [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    LD        C,6                                [2]
    LD        E,0                                [2]
.loop:
    PUSH      C                                  [2]
    PUSH      E                                  [2]
    PUSH      XHL                                [1]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    POP       XHL                                [1]
    PUSH      XHL                                [1]
    LD        WA,(XHL)                           [2]
    CALL      sub_216BA8                         [4]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XHL                                [1]
    POP       E                                  [2]
    POP       C                                  [2]
    INC       1,E                                [2]
    INC       2,XHL                              [2]
    DJNZ      C,.loop                            [3]
    LD        C,0                                [2]
    LD        E,8                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249FB0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_2166EB                         [4]
    CALR      sub_215BCD                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x215C88

sub_215C88:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JRL       .skip11                            [3]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JRL       .skip11                            [3]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip8                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    CP        A,8                                [3]
    JR        Z,.skip4                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip3:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip4:
    LD        A,5                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip5:
    CP        A,2                                [2]
    JR        NZ,.skip8                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip6                           [2]
    CP        A,5                                [2]
    JR        Z,.skip7                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip6:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip7:
    LD        A,8                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip9                             [2]
.skip8:
    JR        .skip10                            [2]
.skip9:
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip10                          [2]
    CALR      sub_215BCD                         [3]
.skip10:
    LD        BC,0x60                            [3]
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    JRL       .done                              [3]
.skip11:
    CALL      sub_216779                         [4]
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip13                          [2]
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,6                              [4]
    SLL       1,WA                               [3]
    LD        XHL,CyriusTradeMenu                [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    LD        A,(XIZ+0x10)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    ADD       XHL,XWA                            [2]
    LD        WA,(XHL)                           [2]
    POP       XHL                                [1]
    LD        (XIZ+0x2A),WA                      [3]
    CALL      sub_216BA8                         [4]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip12                          [2]
    LD        A,0x1F                             [2]
    JR        .skip15                            [2]
.skip12:
    LD        A,0x18                             [2]
    JR        .skip15                            [2]
.skip13:
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249FB0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        WA,0                               [2]
    LD        (XIZ+0x2A),WA                      [3]
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip14                          [2]
    LD        A,0x1E                             [2]
    JR        .skip15                            [2]
.skip14:
    LD        A,0x17                             [2]
    JR        .skip15                            [2]
.skip15:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x215DD9

sub_215DD9:
    LD        C,0                                [2]
    LD        E,2                                [2]
    LD        A,1                                [2]
    CALL      sub_20768A                         [4]
    LD        A,1                                [2]
    LD        XHL,0x249FA3                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,5                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x215DFE

; [code+play] Cyrius's Emblem trade (dtown_cyrius_trade_* screens), GetStoryStage
CyriusTrade:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip7                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip7                             [2]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip6                           [2]
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    JR        .skip6                             [2]
.skip4:
    CP        A,8                                [3]
    JR        NZ,.skip6                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip5                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip6                             [2]
.skip6:
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,0x30                            [3]
    ADD       WA,0x20                            [4]
    LD        BC,WA                              [2]
    LD        DE,0x84                            [3]
    CALL      dyn_211DBD                         [4]
    JR        .done                              [2]
.skip7:
    CALL      dyn_2166EB                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip9                           [2]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
    CALL      sub_216779                         [4]
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip8                           [2]
    LD        A,0x20                             [2]
    JR        .skip13                            [2]
.skip8:
    LD        A,0x19                             [2]
    JR        .skip13                            [2]
.skip9:
    LD        WA,(XIZ+0x2A)                      [3]
    CALL      AddItem                            [4]
    JR        NC,.skip10                         [2]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
    LD        A,0x48                             [2]
    JR        .skip13                            [2]
.skip10:
    CALL      sub_216B38                         [4]
    CALL      GetStoryStage                      [4]
    CP        A,0xA                              [3]
    JR        C,.skip11                          [2]
    CALL      sub_216B51                         [4]
.skip11:
    LD        A,(XIZ+0x28)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip12                          [2]
    LD        A,0x21                             [2]
    JR        .skip13                            [2]
.skip12:
    LD        A,0x1A                             [2]
    JR        .skip13                            [2]
.skip13:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
.done:
    RET                                          [1]

.org 0x215EDC

sub_215EDC:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_215AF1                         [3]
    JR        .skip6                             [2]
.skip:
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_215B16                         [3]
    JR        .skip6                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_215C14                         [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,3                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_215C88                         [3]
    JR        .skip6                             [2]
.skip4:
    CP        A,4                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_215DD9                         [3]
    JR        .skip6                             [2]
.skip5:
    CP        A,5                                [2]
    JR        NZ,.skip6                          [2]
    CALR      CyriusTrade                        [3]
    JR        .skip6                             [2]
.skip6:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x215F1E

; [code+play] A = first skill of the pair Helmut offers (4r / 4r+2), 0x14 all learned, FF none yet (level < 20 / 30)
HelmutSkillOffer:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      W                                  [2]
    CALL      CheckSkillPair1                    [4]
    LD{1}     W,A                                [2]
    CALL      CheckSkillPair2                    [4]
    AND       A,W                                [2]
    CP        A,1                                [2]
    JR        Z,.skip                            [2]
    LD        A,(wPlayerLevel)                   [4]
    CP        A,0x14                             [3]
    JR        C,.skip4                           [2]
    CALL      CheckSkillPair1                    [4]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    LD        A,(wPlayerLevel)                   [4]
    CP        A,0x1E                             [3]
    JR        C,.skip4                           [2]
    CALL      CheckSkillPair2                    [4]
    CP        A,0                                [2]
    JR        Z,.skip2                           [2]
.skip:
    LD        A,0x14                             [2]
    JR        .skip5                             [2]
.skip2:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    MUL{1}    WA,4                               [3]
    ADD       A,2                                [3]
    JR        .skip5                             [2]
.skip3:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    SRL       1,A                                [3]
    EXTZ      WA                                 [2]
    MUL{1}    WA,4                               [3]
    JR        .skip5                             [2]
.skip4:
    LD        A,0xFF                             [2]
.skip5:
    POP       W                                  [2]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215F84

sub_215F84:
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,1                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x215F8F

sub_215F8F:
    LD        A,(XIZ+0x2D)                       [3]
    CP        A,0x5A                             [3]
    JR        C,.done                            [2]
    LD        A,(XIZ+0x29)                       [3]
    CP        A,0xFF                             [3]
    JR        Z,.skip                            [2]
    LD        A,7                                [2]
    JR        .skip2                             [2]
.skip:
    LD        A,6                                [2]
.skip2:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x215FB3

sub_215FB3:
    PUSH      XWA                                [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,7                              [4]
    LD        XHL,NovaText                       [5]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x215FC5

sub_215FC5:
    PUSH      XWA                                [1]
    ADD       A,8                                [3]
    LD        W,(XIZ+0x15)                       [3]
    CALR      dyn_214D97                         [3]
    LD        XHL,(XHL+4)                        [3]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x215FD4

sub_215FD4:
    PUSH      XHL                                [1]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x29)                       [3]
    LD        W,(XIZ+0x10)                       [3]
    ADD       A,W                                [2]
    CALR      sub_215FC5                         [3]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    POP       XWA                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x215FEA

sub_215FEA:
    LD        A,(XIZ+0x29)                       [3]
    LD        C,2                                [2]
    LD        E,0                                [2]
.loop:
    PUSH      C                                  [2]
    PUSH      E                                  [2]
    PUSH      A                                  [1]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    POP       A                                  [1]
    PUSH      A                                  [1]
    CALR      sub_215FB3                         [3]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    POP       A                                  [1]
    POP       E                                  [2]
    POP       C                                  [2]
    INC       1,E                                [2]
    INC       1,A                                [2]
    DJNZ      C,.loop                            [3]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    CALL      dyn_2166EB                         [4]
    CALR      sub_215FD4                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,3                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x21602C

sub_21602C:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip8                             [2]
.skip:
    AND       A,0xF                              [3]
    JR        Z,.skip5                           [2]
    CP        A,1                                [2]
    JR        NZ,.skip3                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip2                           [2]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip2:
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,2                                [2]
    JR        NZ,.skip5                          [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip4                           [2]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip4:
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip7                             [2]
.skip6:
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip7                           [2]
    CALR      sub_215FD4                         [3]
.skip7:
    LD        BC,0x60                            [3]
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,8                               [3]
    ADD       WA,4                               [4]
    LD        DE,WA                              [2]
    CALL      dyn_211DBD                         [4]
    JR        .done                              [2]
.skip8:
    CALL      sub_216779                         [4]
    CALR      sub_214D82                         [3]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,8                                [3]
    JR        Z,.skip9                           [2]
    LD        (XIZ+0x2A),A                       [3]
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        A,(XIZ+0x29)                       [3]
    LD        W,(XIZ+0x2A)                       [3]
    ADD       A,W                                [2]
    CALR      sub_215FB3                         [3]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        A,0x1C                             [2]
    JR        .skip10                            [2]
.skip9:
    LD        E,0                                [2]
    ADD       E,A                                [2]
    LD        C,0                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x249FB0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        WA,0                               [2]
    LD        (XIZ+0x2A),WA                      [3]
    LD        A,0x20                             [2]
    JR        .skip10                            [2]
.skip10:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x216111

sub_216111:
    LD        C,0                                [2]
    LD        E,2                                [2]
    LD        A,1                                [2]
    CALL      sub_20768A                         [4]
    LD        A,1                                [2]
    LD        XHL,0x249FA3                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,5                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x216136

; [code+play] Helmut's "Are you sure?" after picking a skill: CheckSkillPair1, sets the learned flag (helmut_skill_*_are_you_sure only)
HelmutSkillChoice:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip7                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip7                             [2]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip6                           [2]
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    JR        .skip6                             [2]
.skip4:
    CP        A,8                                [3]
    JR        NZ,.skip6                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip5                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip6                             [2]
.skip6:
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,0x30                            [3]
    ADD       WA,0x20                            [4]
    LD        BC,WA                              [2]
    LD        DE,0x84                            [3]
    CALL      dyn_211DBD                         [4]
    JR        .done                              [2]
.skip7:
    CALL      dyn_2166EB                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip8                           [2]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
    CALL      sub_216779                         [4]
    LD        A,0x1D                             [2]
    JR        .skip11                            [2]
.skip8:
    LD        A,(XIZ+0x29)                       [3]
    LD        W,(XIZ+0x2A)                       [3]
    ADD       W,A                                [2]
    INC       1,W                                [2]
    CALL      CheckSkillPair1                    [4]
    CP        A,1                                [2]
    JR        Z,.skip9                           [2]
    LD        (wSkill1),W                        [4]
    LD        A,0x30                             [2]
    JR        .skip10                            [2]
.skip9:
    LD        (wSkill2),W                        [4]
    LD        A,0x32                             [2]
.skip10:
    LD        W,(XIZ+0x2A)                       [3]
    ADD       A,W                                [2]
    LD        L,A                                [2]
    EXTZ      HL                                 [2]
    CALL      SetEventFlag                       [4]
    LD        A,0x1E                             [2]
    JR        .skip11                            [2]
.skip11:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
.done:
    RET                                          [1]

.org 0x216208

sub_216208:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_215F84                         [3]
    JR        .skip6                             [2]
.skip:
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_215F8F                         [3]
    JR        .skip6                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_215FEA                         [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,3                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_21602C                         [3]
    JR        .skip6                             [2]
.skip4:
    CP        A,4                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_216111                         [3]
    JR        .skip6                             [2]
.skip5:
    CP        A,5                                [2]
    JR        NZ,.skip6                          [2]
    CALR      HelmutSkillChoice                  [3]
    JR        .skip6                             [2]
.skip6:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x21624A

sub_21624A:
    LD        XHL,swp_208C4C                     [5]
    CALL      StartChildTask                     [4]
    LDW       (XHL+0xE),0x78                     [5]
    LD        WA,0x84                            [3]
    CALL      SoundCommand                       [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2C),A                       [3]
    LD        A,1                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x21626A

sub_21626A:
    LD        A,6                                [2]
    LD        (0x5A7F),A                         [4]
    LD        A,(XIZ+0x2C)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2C),A                       [3]
    CP        A,0x39                             [3]
    JR        C,.skip2                           [2]
    LD        A,(wFadeLevel)                     [4]
    ADD       A,2                                [3]
    CP        A,0x7F                             [3]
    JR        C,.skip                            [2]
    LD        A,0x7F                             [2]
.skip:
    LD        (wFadeLevel),A                     [4]
.skip2:
    LD        WA,(XIZ+TASK_CHILDREN)             [3]
    CP        WA,0                               [2]
    JR        NZ,.done                           [2]
    CALL      dyn_206803                         [4]
    CALL      dyn_21676A                         [4]
    CALL      dyn_2167B1                         [4]
    CALR      dyn_21516D                         [3]
    LD        A,0                                [2]
    LD        (XIZ+0x13),A                       [3]
    CALL      dyn_2166EB                         [4]
    LD        HL,0x36                            [3]
    CALL      dyn_216845                         [4]
    LD        BC,0                               [2]
    LD        DE,0                               [2]
    CALL      DrawPortrait                       [4]
    LD        XWA,0                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x20                            [3]
    CALL      SoundCommand                       [4]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x2162D0

sub_2162D0:
    LD        A,2                                [2]
    CALL      sub_216E95                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    LD        A,0xF                              [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x2162EA

sub_2162EA:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    JR        .skip4                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    JR        .skip4                             [2]
.skip2:
    JR        .skip3                             [2]
.skip3:
    JR        .done                              [2]
.skip4:
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x216306

sub_216306:
    LD        A,2                                [2]
    CALL      sub_216EB9                         [4]
    CP        A,1                                [2]
    JR        Z,.done                            [2]
    CALL      dyn_206803                         [4]
    CALL      dyn_216757                         [4]
    CALL      dyn_21679E                         [4]
    CALL      dyn_2166EB                         [4]
    CALR      dyn_214D23                         [3]
    LD        XWA,2                              [2]
    CALL      PlayMusic                          [4]
    LD        WA,0x22                            [3]
    CALL      SoundCommand                       [4]
    LD        A,5                                [2]
    LD        (XIZ+0x27),A                       [3]
    CALL      dyn_216E31                         [4]
    LD        A,9                                [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
.done:
    RET                                          [1]

.org 0x216344

sub_216344:
    LD        A,9                                [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    RET                                          [1]

.org 0x21634F

sub_21634F:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,0                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_21624A                         [3]
    JR        .skip6                             [2]
.skip:
    CP        A,1                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_21626A                         [3]
    JR        .skip6                             [2]
.skip2:
    CP        A,2                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_2162D0                         [3]
    JR        .skip6                             [2]
.skip3:
    CP        A,3                                [2]
    JR        NZ,.skip4                          [2]
    CALR      sub_2162EA                         [3]
    JR        .skip6                             [2]
.skip4:
    CP        A,4                                [2]
    JR        NZ,.skip5                          [2]
    CALR      sub_216306                         [3]
    JR        .skip6                             [2]
.skip5:
    CP        A,5                                [2]
    JR        NZ,.skip6                          [2]
    CALR      sub_216344                         [3]
    JR        .skip6                             [2]
.skip6:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x216391

sub_216391:
    PUSH      XHL                                [1]
    PUSH      C                                  [2]
    PUSH      XWA                                [1]
    CALL      GetStageArenaRank                  [4]
    CP        A,3                                [2]
    JR        NC,.skip                           [2]
    LD        A,3                                [2]
    JR        .skip2                             [2]
.skip:
    CP        A,9                                [3]
    JR        C,.skip2                           [2]
    LD        A,8                                [2]
    JR        .skip2                             [2]
.skip2:
    SUB       A,3                                [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A09E                       [5]
    ADD       XHL,XWA                            [2]
    PUSH      W                                  [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV{1}    WA,0x64                            [3]
    LD        A,W                                [2]
    POP       W                                  [2]
    LD        C,0                                [2]
.loop:
    LD        W,(XHL)                            [2]
    SUB       A,W                                [2]
    JR        C,.skip3                           [2]
    INC       1,C                                [2]
    ADD       XHL,6                              [6]
    JR        .loop                              [2]
.skip3:
    LD        (XIZ+0x28),C                       [3]
    LD        XHL,0x24A0DA                       [5]
    PUSH      W                                  [2]
    CALL      Random                             [4]
    LD        W,0                                [2]
    DIV{1}    WA,0x64                            [3]
    LD        A,W                                [2]
    POP       W                                  [2]
    LD        C,0                                [2]
.loop2:
    LD        W,(XHL)                            [2]
    SUB       A,W                                [2]
    JR        C,.skip4                           [2]
    INC       1,C                                [2]
    ADD       XHL,1                              [6]
    JR        .loop2                             [2]
.skip4:
    LD        (XIZ+0x29),C                       [3]
    POP       XWA                                [1]
    POP       C                                  [2]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21640A

sub_21640A:
    CALR      sub_216391                         [3]
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        XHL,0x24A1A7                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    PUSH      XHL                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A094                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    POP       XHL                                [1]
    CALL      sub_216BA8                         [4]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    LD        C,0                                [2]
    LD        E,5                                [2]
    LD        A,2                                [2]
    CALL      sub_20768A                         [4]
    LD        XHL,0x24A1B0                       [5]
    LD        A,2                                [2]
    CALL      dyn_2076F3                         [4]
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,5                              [4]
    LD        XHL,XWA                            [2]
    LD        A,(XIZ+0x29)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XWA,XHL                            [2]
    MUL       XWA,4                              [4]
    LD        XHL,0x24A0DF                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       XWA                                [1]
    LD        A,2                                [2]
    LD        C,6                                [2]
    CALL      sub_216851                         [4]
    CALL      sub_2168AC                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,2                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x21648D

sub_21648D:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    JR        .skip3                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    JR        .skip3                             [2]
.skip2:
    LD        A,(XIZ+0x2D)                       [3]
    CP        A,0x3C                             [3]
    JR        C,.done                            [2]
.skip3:
    LD        A,0x1E                             [2]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    LD        A,3                                [2]
    LD        (XIZ+0x27),A                       [3]
.done:
    RET                                          [1]

.org 0x2164B7

sub_2164B7:
    CALL      dyn_2166EB                         [4]
    LD        W,(XIZ+0x15)                       [3]
    LD        A,0x1F                             [2]
    CALR      dyn_214D97                         [3]
    LD        XHL,(XHL+4)                        [3]
    LD        A,1                                [2]
    CALL      dyn_2076F3                         [4]
    LD        C,0                                [2]
    LD        E,2                                [2]
    LD        A,1                                [2]
    CALL      sub_20768A                         [4]
    LD        A,1                                [2]
    LD        XHL,0x249FA3                       [5]
    CALL      dyn_2076F3                         [4]
    LD        A,0                                [2]
    LD        (XIZ+0x10),A                       [3]
    LD        A,0                                [2]
    LD        (XIZ+0x2D),A                       [3]
    LD        A,4                                [2]
    LD        (XIZ+0x27),A                       [3]
    RET                                          [1]

.org 0x2164F1

; [code+play] Colla's gem offer: buy prompt, AddItem (colla_offer_*_buy_prompt)
CollaBuy:
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JR        Z,.skip                            [2]
    PUSH      WA                                 [1]
    LD        WA,0x81                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    JR        .skip7                             [2]
.skip:
    BIT       5,A                                [3]
    JR        Z,.skip2                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x82                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    LD        A,1                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip7                             [2]
.skip2:
    AND       A,0xF                              [3]
    JR        Z,.skip6                           [2]
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip3                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    DEC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip3:
    JR        .skip6                             [2]
.skip4:
    CP        A,8                                [3]
    JR        NZ,.skip6                          [2]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,1                                [2]
    JR        Z,.skip5                           [2]
    PUSH      WA                                 [1]
    LD        WA,0x80                            [3]
    CALL      SoundCommand                       [4]
    POP       WA                                 [1]
    INC       1,A                                [2]
    LD        (XIZ+0x10),A                       [3]
    JR        .skip6                             [2]
.skip5:
    JR        .skip6                             [2]
.skip6:
    LD        WA,0                               [2]
    LD        A,(XIZ+0x10)                       [3]
    MUL{1}    WA,0x30                            [3]
    ADD       WA,0x20                            [4]
    LD        BC,WA                              [2]
    LD        DE,0x84                            [3]
    CALL      dyn_211DBD                         [4]
    JRL       .done                              [3]
.skip7:
    CALL      dyn_2166EB                         [4]
    LD        A,(XIZ+0x10)                       [3]
    CP        A,0                                [2]
    JR        Z,.skip8                           [2]
    LD        A,0x21                             [2]
    JRL       .skip11                            [3]
.skip8:
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,5                              [4]
    LD        XHL,XWA                            [2]
    LD        A,(XIZ+0x29)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XWA,XHL                            [2]
    MUL       XWA,4                              [4]
    LD        XHL,0x24A0DF                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       XWA                                [1]
    LD{1}     XBC,XHL                            [2]
    LD        XWA,(wGP)                          [4]
    CALL      sub_20622F                         [4]
    JR        NC,.skip9                          [2]
    LD        A,0x22                             [2]
    JR        .skip11                            [2]
.skip9:
    PUSH      XHL                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,0x24A094                       [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    EXTZ      WA                                 [2]
    POP       XHL                                [1]
    CALL      AddItem                            [4]
    JR        NC,.skip10                         [2]
    LD        A,0x23                             [2]
    JR        .skip11                            [2]
.skip10:
    PUSH      XWA                                [1]
    LD        A,(XIZ+0x28)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    MUL       XWA,5                              [4]
    LD        XHL,XWA                            [2]
    LD        A,(XIZ+0x29)                       [3]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    ADD       XWA,XHL                            [2]
    MUL       XWA,4                              [4]
    LD        XHL,0x24A0DF                       [5]
    ADD       XHL,XWA                            [2]
    LD        XHL,(XHL)                          [2]
    POP       XWA                                [1]
    LD{1}     XBC,XHL                            [2]
    LD        XWA,(wGP)                          [4]
    CALL      sub_20622F                         [4]
    LD        (wGP),XWA                          [4]
    CALL      sub_2168AC                         [4]
    LD        A,0x20                             [2]
    JR        .skip11                            [2]
.skip11:
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
.done:
    RET                                          [1]

.org 0x216619

sub_216619:
    LD        A,(XIZ+0x27)                       [3]
    CP        A,1                                [2]
    JR        NZ,.skip                           [2]
    CALR      sub_21640A                         [3]
    JR        .skip4                             [2]
.skip:
    CP        A,2                                [2]
    JR        NZ,.skip2                          [2]
    CALR      sub_21648D                         [3]
    JR        .skip4                             [2]
.skip2:
    CP        A,3                                [2]
    JR        NZ,.skip3                          [2]
    CALR      sub_2164B7                         [3]
    JR        .skip4                             [2]
.skip3:
    CP        A,4                                [2]
    JR        NZ,.skip4                          [2]
    CALR      CollaBuy                           [3]
    JR        .skip4                             [2]
.skip4:
    LD        A,(XIZ+0x2D)                       [3]
    INC       1,A                                [2]
    LD        (XIZ+0x2D),A                       [3]
    RET                                          [1]

.org 0x216649

; [code+play] post-game thank-you: gift from TetisGifts by autograph count and gender, then removes the autographs
TetisGift:
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    DEC       1,A                                [2]
    SLL       1,A                                [3]
    LD{1}     W,A                                [2]
    CALL      IsPlayerMale                       [4]
    XOR       A,1                                [3]
    ADD       A,W                                [2]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    LD        XHL,TetisGiftIndex                 [5]
    ADD       XHL,XWA                            [2]
    LD        A,(XHL)                            [2]
    PUSH      A                                  [1]
    ADD       A,0x54                             [3]
    LD        (XIZ+0x12),A                       [3]
    LD        A,6                                [2]
    LD        (XIZ+TASK_ARG),A                   [3]
    CALR      dyn_215741                         [3]
    POP       A                                  [1]
    EXTZ      WA                                 [2]
    EXTZ      XWA                                [2]
    SLL       1,XWA                              [3]
    LD        XHL,TetisGifts                     [5]
    ADD       XHL,XWA                            [2]
    LD        WA,(XHL)                           [2]
    CALL      AddItem                            [4]
    JR        C,.done                            [2]
    PUSH      W                                  [2]
    LD        WA,0xFF                            [3]
    CALL      0x2061D6                           [4]
    POP       W                                  [2]
    LD        C,A                                [2]
.loop:
    LD        WA,0xFF                            [3]
    PUSH      C                                  [2]
    CALL      RemoveItem                         [4]
    POP       C                                  [2]
    DJNZ      C,.loop                            [3]
.done:
    RET                                          [1]

.org 0x2169E5

sub_2169E5:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      A                                  [1]
    LD        HL,EVENT_GREETED_LILY              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_CYRIUS            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x53                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x54                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_WYSE              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_ZIGGY             [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_CEUS              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_HELMUT            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_ALDA              [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_CAMIL             [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_MEESE             [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_COLLA             [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,EVENT_GREETED_TETIS             [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x5E                            [3]
    CALL      ClearEventFlag                     [4]
    POP       A                                  [1]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B0C

; [code] A = 1 if wPlayerRace is odd (male), else 0
IsPlayerMale:
    LD        A,(wPlayerRace)                    [4]
    DEC       1,A                                [2]
    XOR       A,1                                [3]
    AND       A,1                                [3]
    RET                                          [1]

.org 0x216B19

sub_216B19:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      W                                  [2]
    LD        HL,0x10                            [3]
    LD        A,0                                [2]
    LD        W,4                                [2]
.loop:
    PUSH      HL                                 [1]
    PUSH      WA                                 [1]
    CALL      CheckEventFlag                     [4]
    POP       WA                                 [1]
    ADD       A,L                                [2]
    POP       HL                                 [1]
    INC       1,HL                               [2]
    DJNZ      W,.loop                            [3]
    POP       W                                  [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B38

sub_216B38:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      A                                  [1]
    LD        HL,0x10                            [3]
    LD        A,4                                [2]
.loop:
    PUSH      HL                                 [1]
    PUSH      A                                  [1]
    CALL      ClearEventFlag                     [4]
    POP       A                                  [1]
    POP       HL                                 [1]
    INC       1,HL                               [2]
    DJNZ      A,.loop                            [3]
    POP       A                                  [1]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B51

sub_216B51:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      A                                  [1]
    LD        HL,0x60                            [3]
    LD        A,4                                [2]
.loop:
    PUSH      HL                                 [1]
    PUSH      A                                  [1]
    CALL      ClearEventFlag                     [4]
    POP       A                                  [1]
    POP       HL                                 [1]
    INC       1,HL                               [2]
    DJNZ      A,.loop                            [3]
    POP       A                                  [1]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B6A

; [code] A = 1 if event flag 0x30 or 0x31 (first skill learned)
CheckSkillPair1:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      W                                  [2]
    LD        W,0                                [2]
    LD        HL,EVENT_SKILL1_A                  [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        HL,EVENT_SKILL1_B                  [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        A,W                                [2]
    POP       W                                  [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216B89

; [code] A = 1 if event flag 0x32 or 0x33 (second skill learned)
CheckSkillPair2:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      W                                  [2]
    LD        W,0                                [2]
    LD        HL,EVENT_SKILL2_A                  [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        HL,EVENT_SKILL2_B                  [3]
    CALL      CheckEventFlag                     [4]
    OR        W,L                                [2]
    LD        A,W                                [2]
    POP       W                                  [2]
    POP       BC                                 [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x216BA8

sub_216BA8:
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    CP        WA,0x101                           [4]
    JR        NC,.skip                           [2]
    LD        L,A                                [2]
    CALL      GetItemName                        [4]
    JR        .skip2                             [2]
.skip:
    SUB       WA,0x101                           [4]
    INC       1,WA                               [2]
    LD        L,A                                [2]
    CALL      GetPartName                        [4]
.skip2:
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    RET                                          [1]

.org 0x216BC9

sub_216BC9:
    PUSH      XWA                                [1]
    CP        WA,0x101                           [4]
    JR        NC,.skip                           [2]
    LD        XHL,ItemDescs                      [5]
    JR        .skip2                             [2]
.skip:
    SUB       WA,0x101                           [4]
    INC       1,WA                               [2]
    LD        XHL,PartDescs                      [5]
.skip2:
    DEC       1,WA                               [2]
    EXTZ      XWA                                [2]
    MUL       XWA,0x13                           [4]
    ADD       XHL,XWA                            [2]
    POP       XWA                                [1]
    RET                                          [1]

.org 0x216BEE

dyn_216BEE:
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    PUSH      XBC                                [1]
    PUSH      XWA                                [1]
    LD        WA,0                               [2]
    LD        B,0                                [2]
    LD        C,0                                [2]
    LD        (XHL),WA                           [2]
    INC       2,XHL                              [2]
    INC       1,C                                [2]
    CP        C,0xC                              [3]
    JR        C,0x216BF8                         [2]
    LD        XDE,0x20                           [5]
    SUB       XDE,0xC                            [6]
    SLL       1,XDE                              [3]
    ADD       XHL,XDE                            [2]
    INC       1,B                                [2]
    CP        B,0xE                              [3]
    JR        C,0x216BF6                         [2]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x217054

loc_217054:
    CP        A,2                                [2]
    JR        NZ,.skip13                         [2]
    LD        A,0                                [2]
    LD        B,(GE_WBA_H)                       [4]
    LD        C,(0x60F5)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip3                           [2]
    JR        C,.skip                            [2]
    SUB       B,(0x60F9)                         [4]
    JR        .skip2                             [2]
.skip:
    ADD       B,(0x60F9)                         [4]
.skip2:
    LD        (GE_WBA_H),B                       [4]
    LD        A,1                                [2]
.skip3:
    LD        B,(GE_WBA_V)                       [4]
    LD        C,(0x60F6)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip6                           [2]
    JR        C,.skip4                           [2]
    SUB       B,(0x60FA)                         [4]
    JR        .skip5                             [2]
.skip4:
    ADD       B,(0x60FA)                         [4]
.skip5:
    LD        (GE_WBA_V),B                       [4]
    LD        A,1                                [2]
.skip6:
    LD        B,(GE_WSI_H)                       [4]
    LD        C,(0x60F7)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip9                           [2]
    JR        C,.skip7                           [2]
    ADD       B,(0x60FB)                         [4]
    JR        .skip8                             [2]
.skip7:
    SUB       B,(0x60FB)                         [4]
.skip8:
    LD        (GE_WSI_H),B                       [4]
    LD        A,1                                [2]
.skip9:
    LD        B,(GE_WSI_V)                       [4]
    LD        C,(0x60F8)                         [4]
    CP        B,C                                [2]
    JR        Z,.skip12                          [2]
    JR        C,.skip10                          [2]
    ADD       B,(0x60FC)                         [4]
    JR        .skip11                            [2]
.skip10:
    SUB       B,(0x60FC)                         [4]
.skip11:
    LD        (GE_WSI_V),B                       [4]
    LD        A,1                                [2]
.skip12:
    JR        0x2170D6                           [2]
.skip13:
    LD        A,0                                [2]
    CP        A,0                                [2]
    JR        NZ,0x2170E0                        [2]
    LD        A,0                                [2]
    LD        (0x60FD),A                         [4]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2170E4

sub_2170E4:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (0x60F1),A                         [4]
    LD        A,0x50                             [2]
    LD        (0x60F5),A                         [4]
    LD        A,0xA0                             [2]
    LD        (0x60F3),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F7),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F2),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F6),A                         [4]
    LD        A,0x98                             [2]
    LD        (0x60F4),A                         [4]
    LD        A,0x98                             [2]
    LD        (0x60F8),A                         [4]
    LD        A,2                                [2]
    LD        (0x60F9),A                         [4]
    LD        A,0                                [2]
    LD        (0x60FA),A                         [4]
    LD        A,0xFC                             [2]
    LD        (0x60FB),A                         [4]
    LD        A,0                                [2]
    LD        (0x60FC),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x21712F

dyn_21712F:
    PUSH      A                                  [1]
    LD        A,0                                [2]
    LD        (0x60F1),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F5),A                         [4]
    LD        A,0xA0                             [2]
    LD        (0x60F3),A                         [4]
    LD        A,0xA0                             [2]
    LD        (0x60F7),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F2),A                         [4]
    LD        A,0x4C                             [2]
    LD        (0x60F6),A                         [4]
    LD        A,0x98                             [2]
    LD        (0x60F4),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F8),A                         [4]
    LD        A,0                                [2]
    LD        (0x60F9),A                         [4]
    LD        A,2                                [2]
    LD        (0x60FA),A                         [4]
    LD        A,0                                [2]
    LD        (0x60FB),A                         [4]
    LD        A,0xFC                             [2]
    LD        (0x60FC),A                         [4]
    POP       A                                  [1]
    RET                                          [1]

.org 0x2175A7

sub_2175A7:
    RET                                          [1]

.org 0x2175A8

swp_2175A8:
    LD        A,1                                [2]
    LD        (0x610C),A                         [4]
    RET                                          [1]

.org 0x2175AF

swp_2175AF:
    XOR       A,A                                [2]
    LD        (0x610C),A                         [4]
    RET                                          [1]

.org 0x2175B6

swp_2175B6:
    LD        (0x610D),A                         [4]
    RET                                          [1]

.org 0x2175BB

swp_2175BB:
    LD        (0x610E),B                         [4]
    LD        (0x610F),C                         [4]
    RET                                          [1]

.org 0x2175C4

swp_2175C4:
    LD        XWA,.resume                        [5]
    LD        (XIZ+TASK_FUNC),XWA                [3]
.resume:
    LD        XWA,.resume2                       [5]
    LD        (XIZ+TASK_FUNC),XWA                [3]
.resume2:
    INCB      1,(0x6110)                         [4]
    LD        A,(0x6110)                         [4]
    SRL       5,A                                [3]
    RET       C                                  [2]
    LD        A,(0x610C)                         [4]
    OR        A,A                                [2]
    RET       Z                                  [2]
    LD        A,(0x610D)                         [4]
    LD        B,(0x610E)                         [4]
    LD        C,(0x610F)                         [4]
    CALL      swp_21722F                         [4]
    RET                                          [1]

.org 0x2175FA

swp_2175FA:
    LD        XWA,.done                          [5]
    LD        (XIZ+TASK_FUNC),XWA                [3]
.done:
    RET                                          [1]

.org 0x217603

sub_217603:
    XOR       A,A                                [2]
    LD        (0x6115),A                         [4]
    LD        (0x6116),A                         [4]
    LD        (0x611C),A                         [4]
    LD        XHL,swp_2177A9                     [5]
    CALL      StartChildTask                     [4]
    LD        (0x6111),XHL                       [4]
    RET                                          [1]

.org 0x21761F

sub_21761F:
    RET                                          [1]

.org 0x21785A

sub_21785A:
    RET                                          [1]

.org 0x21785B

loc_21785B:
    LD        W,0xFF                             [2]
    LD        (0x6137),WA                        [4]
    POP       XHL                                [1]
    LD        (0x6131),XHL                       [4]
    XOR       WA,WA                              [2]
    LD        (0x6135),WA                        [4]
.loop:
    LD        WA,(0x6135)                        [4]
    OR        WA,WA                              [2]
    JR        NZ,.skip                           [2]
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
.skip:
    CALL      sub_2171A8                         [4]
    LD        WA,(0x6135)                        [4]
    LD        XHL,(0x6131)                       [4]
    JP        (XHL)                              [2]

.org 0x217888

sub_217888:
    LD        A,1                                [2]
    JP        loc_21785B                         [4]

.org 0x21788E

swp_21788E:
    LD        A,2                                [2]
    JP        loc_21785B                         [4]

.org 0x217894

sub_217894:
    LD        A,3                                [2]
    JP        loc_21785B                         [4]

.org 0x21789A

sub_21789A:
    LD        A,4                                [2]
    JP        loc_21785B                         [4]

.org 0x2178A0

swp_2178A0:
    LD        A,5                                [2]
    JP        loc_21785B                         [4]

.org 0x2178A6

loc_2178A6:
    LD        A,(0x6137)                         [4]
    CP        A,6                                [2]
    JR        NC,.skip                           [2]
    LD        XHL,0x2178BD                       [5]
    SLL       2,A                                [3]
    LD        XHL,(XHL+A)                        [5]
    JP        (XHL)                              [2]
    .db 0xE4, 0x78, 0x21, 0x00, 0xEC, 0x78, 0x21, 0x00, 0x05, 0x79, 0x21, 0x00, 0x0B, 0x79, 0x21, 0x00
    .db 0x21, 0x79, 0x21, 0x00, 0x35, 0x79, 0x21, 0x00
.skip:
    LD        WA,0xFFFF                          [3]
    LDW       (0x6137),0                         [6]
    LD        W,0xFF                             [2]
    LD        (0x6135),WA                        [4]
    CALL      sub_2171A8                         [4]
    JP        loc_2178A6                         [4]

.org 0x2178EC

swp_2178EC:
    LD        A,2                                [2]
    LD        C,8                                [2]
    LD        E,0xB                              [2]
    LD        HL,0x42                            [3]
    CALL      dyn_207494                         [4]
    XOR       A,A                                [2]
    LD        (0x6130),A                         [4]
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217905

swp_217905:
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x21790B

swp_21790B:
    LD        A,2                                [2]
    CALL      dyn_2075CC                         [4]
    LD        A,2                                [2]
    LD        C,0xC                              [2]
    LD        E,0x20                             [2]
    CALL      dyn_2074C0                         [4]
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217921

swp_217921:
    LD        A,(0x6130)                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip                           [2]
    LD        A,1                                [2]
    LD        (0x6130),A                         [4]
.skip:
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217935

swp_217935:
    LD        A,(0x6130)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    XOR       A,A                                [2]
    LD        (0x6130),A                         [4]
.skip:
    XOR       A,A                                [2]
    JP        0x2178D8                           [4]

.org 0x217949

sub_217949:
    XOR       XWA,XWA                            [2]
    LD        (0x6146),XWA                       [4]
    LD        (0x613E),XWA                       [4]
    LD        XHL,swp_217A04                     [5]
    CALL      StartChildTask                     [4]
    RET                                          [1]

.org 0x21795D

sub_21795D:
    RET                                          [1]

.org 0x217E6B

sub_217E6B:
    RET                                          [1]

.org 0x217E6C

swp_217E6C:
    LD        XWA,(0x6176)                       [4]
    OR        XWA,XWA                            [2]
    RET                                          [1]

.org 0x217E73

swp_217E73:
    LD        (0x617E),A                         [4]
    XOR       XWA,XWA                            [2]
    LD        (0x6176),XWA                       [4]
    RET                                          [1]

.org 0x217E7E

swp_217E7E:
    LD        A,1                                [2]
    JP        swp_217E73                         [4]

.org 0x217E84

swp_217E84:
    LD        A,2                                [2]
    JP        swp_217E73                         [4]

.org 0x218004

swp_218004:
    XOR       A,A                                [2]
    LD        (0x615E),A                         [4]
    LD        (wListPage),A                      [4]
    LD        (wListRow),A                       [4]
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x218018

swp_218018:
    LD        A,3                                [2]
    CALL      swp_2175B6                         [4]
    LD        XHL,(0x6162)                       [4]
    CALL      swp_21717A                         [4]
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x21802C

swp_21802C:
    LD        A,(0x615E)                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip                           [2]
    CALL      swp_2175A8                         [4]
    CALL      sub_2181A1                         [4]
    LDB       (0x615E),1                         [5]
.skip:
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x218047

swp_218047:
    CALL      sub_2181A1                         [4]
    CALL      swp_2175A8                         [4]
.loop:
    CALL      sub_2171A8                         [4]
    LD        A,(wJoyPressed)                    [4]
    BIT       BIT_A_BUTTON,A                     [3]
    JP        NZ,.skip                           [5]
    BIT       5,A                                [3]
    JP        NZ,.skip3                          [5]
    BIT       1,A                                [3]
    JP        NZ,.skip4                          [5]
    BIT       0,A                                [3]
    JP        NZ,.skip6                          [5]
    BIT       3,A                                [3]
    JP        NZ,.skip8                          [5]
    BIT       2,A                                [3]
    JP        NZ,.skip10                         [5]
    JP        .skip14                            [4]
.skip:
    LD        XHL,(0x616E)                       [4]
    CALL      swp_21717A                         [4]
    JR        NC,.skip2                          [2]
    LD        WA,0x81                            [3]
    CALL      sub_21990C                         [4]
    LD        L,(wListPage)                      [4]
    MUL       HL,(0x615F)                        [4]
    LD        A,(wListRow)                       [4]
    EXTZ      WA                                 [2]
    ADD       WA,HL                              [2]
    JP        .skip15                            [4]
.skip2:
    LD        WA,0x83                            [3]
    CALL      sub_21990C                         [4]
    JP        .skip14                            [4]
.skip3:
    LD        WA,0x82                            [3]
    CALL      sub_21990C                         [4]
    LD        WA,0xFFFF                          [3]
    JP        .skip15                            [4]
.skip4:
    LD        A,(wListRow)                       [4]
    INC       1,A                                [2]
    CP        A,(0x615F)                         [4]
    JR        C,.skip5                           [2]
    XOR       A,A                                [2]
.skip5:
    LD        (wListRow),A                       [4]
    JP        .skip13                            [4]
.skip6:
    LD        A,(wListRow)                       [4]
    DEC       1,A                                [2]
    JR        PL,.skip7                          [2]
    LD        A,(0x615F)                         [4]
    DEC       1,A                                [2]
.skip7:
    LD        (wListRow),A                       [4]
    JP        .skip13                            [4]
.skip8:
    LD        A,(wListPage)                      [4]
    INC       1,A                                [2]
    CP        A,(0x6161)                         [4]
    JR        C,.skip9                           [2]
    XOR       A,A                                [2]
.skip9:
    LD        (wListPage),A                      [4]
    JP        .skip12                            [4]
.skip10:
    LD        A,(wListPage)                      [4]
    DEC       1,A                                [2]
    JR        PL,.skip11                         [2]
    LD        A,(0x6161)                         [4]
    DEC       1,A                                [2]
.skip11:
    LD        (wListPage),A                      [4]
.skip12:
    LD        XHL,(0x6162)                       [4]
    CALL      swp_21717A                         [4]
.skip13:
    LD        XHL,(0x616A)                       [4]
    CALL      swp_21717A                         [4]
    LD        WA,0x80                            [3]
    CALL      sub_21990C                         [4]
.skip14:
    CALL      sub_2181A1                         [4]
    JP        .loop                              [4]
.skip15:
    LD        (0x615B),WA                        [4]
    LDB       (0x615D),0xFF                      [5]
    CALL      swp_2175AF                         [4]
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x21814F

swp_21814F:
    LD        A,(0x615E)                         [4]
    OR        A,A                                [2]
    JR        Z,.skip                            [2]
    CALL      swp_2175AF                         [4]
    LDB       (0x615E),0                         [5]
.skip:
    XOR       WA,WA                              [2]
    JP        0x217FE9                           [4]

.org 0x218184

swp_218184:
    LD        A,(wListRow)                       [4]
    CP        A,(0x615F)                         [4]
    JR        NC,.done                           [2]
    ADD       A,A                                [2]
    LD        XHL,(0x6172)                       [4]
    LDA       XHL,XHL+A                          [5]
    LD        B,(XHL+)                           [3]
    LD        C,(XHL+)                           [3]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x2181A1

sub_2181A1:
    CALL      swp_218184                         [4]
    JR        NC,.done                           [2]
    PUSH      BC                                 [1]
    LD        A,3                                [2]
    CALL      swp_2175B6                         [4]
    POP       BC                                 [1]
    CALL      swp_2175BB                         [4]
.done:
    RET                                          [1]

.org 0x218909

sub_218909:
    RET                                          [1]

.org 0x219431

sub_219431:
    CALL      sub_219443                         [4]
    CALL      sub_2194C5                         [4]
    CALL      sub_2194C7                         [4]
    RET                                          [1]

.org 0x219443

sub_219443:
    RET                                          [1]

.org 0x2194C5

sub_2194C5:
    RET                                          [1]

.org 0x2194C7

sub_2194C7:
    RET                                          [1]

.org 0x21AA5D

loc_21AA5D:
    LD        XHL,SeeYouLaterTakeText            [5]
    LD        XDE,SeeYouLaterTakeText            [5]
    CALL      sub_2198E3                         [4]
    CALL      Wait30Frames                       [4]
    JP        swp_21AB3F                         [4]

.org 0x21AB3F

swp_21AB3F:
    CALL      sub_219431                         [4]
    CALL      sub_218909                         [4]
    CALL      sub_217E6B                         [4]
    CALL      sub_21795D                         [4]
    CALL      sub_21785A                         [4]
    CALL      sub_21761F                         [4]
    CALL      sub_2175A7                         [4]
    CALL      dyn_20636D                         [4]
    CALL      sub_2171A8                         [4]
    LD        XWA,0xFFFF0000                     [5]
    LD        WA,(0x61F7)                        [4]
    LD        (0x6212),XWA                       [4]
    CALL      EndTask                            [4]
.loop:
    CALL      sub_2171A8                         [4]
    JR        .loop                              [2]
