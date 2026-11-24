; engine/menus/town: 25 routines (each keeps its ROM address with .org)

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
    LD        (XIZ+0xE),A                        [3]
    POP       XWA                                [1]
    POP       XBC                                [1]
    POP       XDE                                [1]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x2154FB

; [play] dtown_lily_gives_flowers; pilot stats, GP
LilyGivesFlowers:
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
    LD        HL,0                               [2]
    CALL      ClearEventFlag                     [4]
    CALL      sub_21691A                         [4]
    LD        A,1                                [2]
    LD        (wArenaRank),A                     [4]
    LD        WA,0x26                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x26                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x26                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x34                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x34                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x34                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x39                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x39                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x39                            [3]
    CALL      AddItem                            [4]
    LD        WA,0x1F4                           [3]
    CALL      AddGP                              [4]
    JRL       dyn_215609                         [3]
.skip2:
    LD        HL,8                               [3]
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
    LD        (XIZ+0xE),A                        [3]
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
    LD        XHL,0x249FB8                       [5]
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
    LD        (XIZ+0xE),A                        [3]
.done:
    RET                                          [1]

.org 0x2169E5

sub_2169E5:
    PUSH      XHL                                [1]
    PUSH      BC                                 [1]
    PUSH      A                                  [1]
    LD        HL,0x51                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x52                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x53                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x54                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x55                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x56                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x57                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x58                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x59                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x5A                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x5B                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x5C                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x5D                            [3]
    CALL      ClearEventFlag                     [4]
    LD        HL,0x5E                            [3]
    CALL      ClearEventFlag                     [4]
    POP       A                                  [1]
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

.org 0x2175A7

sub_2175A7:
    RET                                          [1]

.org 0x21761F

sub_21761F:
    RET                                          [1]

.org 0x21785A

sub_21785A:
    RET                                          [1]

.org 0x21795D

sub_21795D:
    RET                                          [1]

.org 0x217E6B

sub_217E6B:
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
