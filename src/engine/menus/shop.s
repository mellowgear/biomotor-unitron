; engine/menus/shop: 51 routines (each keeps its ROM address with .org)

.org 0x2157E1

dyn_2157E1:
    JR        0x215821                           [2]

.org 0x21717C

swp_21717C:
    LD        (0x60FE),XWA                       [4]
    LD        (0x6102),XBC                       [4]
    LD        XHL,0x60FE                         [5]
    LD        XDE,0x6102                         [5]
    LD        B,4                                [2]
.loop:
    LD        A,(XHL)                            [2]
    ADC       A,(XDE)                            [2]
    DAA       A                                  [2]
    LD        (XHL),A                            [2]
    INC       1,XHL                              [2]
    INC       1,XDE                              [2]
    DJNZ      B,.loop                            [3]
    LD        XWA,(0x60FE)                       [4]
    LD        XBC,(0x6102)                       [4]
    RET                                          [1]

.org 0x217386

loc_217386:
    OR        WA,WA                              [2]
    JP        Z,loc_217427                       [5]
    CALL      sub_21B8A7                         [4]
    JP        NC,loc_217427                      [5]
    CALL      sub_21B8C0                         [4]
    CALL      swp_21B8E4                         [4]
    RET                                          [1]

.org 0x2174D9

swp_2174D9:
    CALL      sub_21B8A7                         [4]
    RET       NC                                 [2]
    CALL      sub_21B8C0                         [4]
    CALL      sub_21B92F                         [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x2174E9

swp_2174E9:
    CP        W,6                                [2]
    JR        NC,.skip                           [2]
    CALL      sub_217434                         [4]
    RET       NC                                 [2]
    LD        XWA,(XHL+0x14)                     [3]
    SCF                                          [1]
    RET                                          [1]
.skip:
    SUB       W,5                                [3]
    JP        swp_2174D9                         [4]

.org 0x2174FF

swp_2174FF:
    CALL      swp_2174D9                         [4]
    RET       NC                                 [2]
    CALL      sub_217517                         [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x21750B

swp_21750B:
    CALL      swp_2174E9                         [4]
    RET       NC                                 [2]
    CALL      sub_217517                         [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x217517

sub_217517:
    LD        XBC,XWA                            [2]
    CALL      swp_21717C                         [4]
    CALL      swp_21717C                         [4]
    CALL      swp_21717C                         [4]
    CALL      swp_21717C                         [4]
    SRL       4,XWA                              [3]
    RET                                          [1]

.org 0x21752D

swp_21752D:
    CALL      sub_21B8A7                         [4]
    RET       NC                                 [2]
    CALL      sub_21B8C0                         [4]
    CALL      sub_21D1AE                         [4]
    SCF                                          [1]
    RET                                          [1]

.org 0x21753D

swp_21753D:
    CP        W,6                                [2]
    JR        NC,.skip                           [2]
    CALL      sub_21B94A                         [4]
    RET       NC                                 [2]
    CALL      sub_21B963                         [4]
    CALL      sub_21D1BB                         [4]
    SCF                                          [1]
    RET                                          [1]
.skip:
    SUB       W,5                                [3]
    JP        swp_21752D                         [4]

.org 0x217558

swp_217558:
    CALL      swp_21752D                         [4]
    RET       NC                                 [2]
    OR        A,A                                [2]
    RET       Z                                  [2]
    LD        W,(0x61D7)                         [4]
    LD        XHL,0x217571                       [5]
    CP        (XHL+W),A                          [5]
    RET                                          [1]
    .db 04 03 03 02 02 01 01 00 00 00

.org 0x21757B

sub_21757B:
    CALL      swp_21753D                         [4]
    JP        0x21755C                           [4]

.org 0x217CF0

sub_217CF0:
    LD        A,3                                [2]
    LD        (0x614A),A                         [4]
    LD        A,3                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x217CD5                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x217CE7                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x217CED                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]

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

.org 0x2196BA

sub_2196BA:
    CALL      loc_21968B                         [4]
    RET       NC                                 [2]
    INC       1,WA                               [2]
    CALL      AddItem                            [4]
    RET                                          [1]

.org 0x21972D

swp_21972D:
    PUSH      XBC                                [1]
    RCF                                          [1]
    LD        (0x61E2),XWA                       [4]
    PUSH      XHL                                [1]
    PUSH      XDE                                [1]
    LD        XHL,0x61E2                         [5]
    LD        XDE,wGP                            [5]
    LD        B,4                                [2]
.loop:
    LD        A,(XHL)                            [2]
    ADC       A,(XDE)                            [2]
    DAA       A                                  [2]
    LD        (XDE),A                            [2]
    INC       1,XHL                              [2]
    INC       1,XDE                              [2]
    DJNZ      B,.loop                            [3]
    LD        XHL,(wGP)                          [4]
    CP        XHL,0x999999                       [6]
    JR        C,.skip                            [2]
    LD        XHL,0x999999                       [5]
    LD        (wGP),XHL                          [4]
.skip:
    POP       XDE                                [1]
    POP       XHL                                [1]
    POP       XBC                                [1]
    RET                                          [1]

.org 0x219769

swp_219769:
    PUSH      XBC                                [1]
    LD        XBC,0x99999999                     [5]
    SUB       XBC,XWA                            [2]
    LD{1}     XWA,XBC                            [2]
    SCF                                          [1]
    JR        0x21972F                           [2]

.org 0x2197BA

sub_2197BA:
    LD        HL,0x126                           [3]
    JP        loc_219796                         [4]

.org 0x219849

swp_219849:
    LD        (0x61F1),XHL                       [4]
    POP       XDE                                [1]
    LD        (0x61ED),XDE                       [4]
    CALL      swp_217657                         [4]
    LD        XHL,(0x61F1)                       [4]
    CALL      0x21762F                           [4]
    LD        XHL,(0x61ED)                       [4]
    JP        (XHL)                              [2]

.org 0x21AC2E

sub_21AC2E:
    LD        XHL,ShopTalk                       [5]
    JP        0x21AAAA                           [4]

.org 0x21AC37

swp_21AC37:
    CALL      sub_2174C9                         [4]
    AND       A,0x80                             [3]
    LD        (0x621E),A                         [4]
    RET                                          [1]

.org 0x21AC43

swp_21AC43:
    LD        A,0x25                             [2]
    CALL      sub_2197C1                         [4]
    RET                                          [1]

.org 0x21AC4A

swp_21AC4A:
    PUSH      WA                                 [1]
    CALL      sub_219807                         [4]
    POP       WA                                 [1]
    CALL      sub_21AC5E                         [4]
    LD        BC,0                               [2]
    LD        DE,0x20                            [3]
    CALL      sub_2197BA                         [4]
    RET                                          [1]

.org 0x21AC5E

sub_21AC5E:
    LD        A,(0x621E)                         [4]
    OR        A,A                                [2]
    LD        A,0x18                             [2]
    RET       Z                                  [2]
    LD        A,0x19                             [2]
    RET                                          [1]

.org 0x21AC6B

swp_21AC6B:
    CALL      sub_2197DD                         [4]
    CALL      swp_21AC43                         [4]
    CALL      swp_21AC4A                         [4]
    RET                                          [1]

.org 0x21AC78

swp_21AC78:
    LD        XWA,3                              [2]
    JP        loc_219907                         [4]

.org 0x21AC7E

swp_21AC7E:
    LD        A,(0x621E)                         [4]
    OR        A,A                                [2]
    RET       Z                                  [2]
    LD        XHL,XDE                            [2]
    RET                                          [1]

.org 0x21AC89

swp_21AC89:
    CALL      swp_21AC7E                         [4]
    JP        swp_219849                         [4]

.org 0x21AC91

; [code+play] Galb/Lana's greeting by story stage (OhItsYou / HaveYouHeardWhat / HowCanIHelp ...)
ShopTalk:
    CALL      swp_21AC37                         [4]
    CALL      swp_21AC78                         [4]
    CALL      swp_218939                         [4]
    LD        WA,0x23                            [3]
    CALL      sub_21990C                         [4]
    CALL      swp_21AC43                         [4]
    LD        A,3                                [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip                           [2]
    LD        A,0x43                             [2]
    CALL      sub_219823                         [4]
    JR        C,.skip                            [2]
    CALL      swp_21AC43                         [4]
    LDB       (0x621E),0                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,OhItsYouYouText                [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LD        A,0x43                             [2]
    CALL      swp_219831                         [4]
    JP        .skip6                             [4]
.skip:
    LD        A,5                                [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip2                          [2]
    LD        A,0x43                             [2]
    CALL      sub_219823                         [4]
    JR        C,.skip2                           [2]
    CALL      swp_21AC43                         [4]
    LDB       (0x621E),1                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,HiThereYoureInText             [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LD        A,0x43                             [2]
    CALL      swp_219831                         [4]
    JP        .skip6                             [4]
.skip2:
    LD        A,7                                [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip3                          [2]
    LD        A,0x43                             [2]
    CALL      sub_219823                         [4]
    JR        C,.skip3                           [2]
    CALL      swp_21AC43                         [4]
    LDB       (0x621E),1                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,HiTherePlayerIText             [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LDB       (0x621E),0                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,BeCarefulPlayerYourText        [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LDB       (0x621E),1                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,DontWorryPlayerYouText         [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LD        A,0x43                             [2]
    CALL      swp_219831                         [4]
    JP        .skip6                             [4]
.skip3:
    LD        A,9                                [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip4                          [2]
    LD        A,0x43                             [2]
    CALL      sub_219823                         [4]
    JR        C,.skip4                           [2]
    CALL      swp_21AC43                         [4]
    LDB       (0x621E),0                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,HaveYouHeardWhatText           [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LD        A,0x43                             [2]
    CALL      swp_219831                         [4]
    JP        .skip6                             [4]
.skip4:
    LD        A,0xA                              [2]
    CALL      sub_219823                         [4]
    JR        NC,.skip5                          [2]
    LD        A,0x43                             [2]
    CALL      sub_219823                         [4]
    JR        C,.skip5                           [2]
    CALL      swp_21AC43                         [4]
    LDB       (0x621E),1                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,PlayerIsThatYouText            [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LDB       (0x621E),0                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,LetHimBeNoText                 [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LDB       (0x621E),1                         [5]
    CALL      swp_21AC4A                         [4]
    LD        XHL,WhyDontYouDoText               [5]
    CALL      swp_219849                         [4]
    CALL      Wait30Frames                       [4]
    LD        A,0x43                             [2]
    CALL      swp_219831                         [4]
    JP        .skip6                             [4]
.skip5:
    CALL      swp_21AC4A                         [4]
.skip6:
    LD        XHL,HelloLookingForSomethingText   [5]
    LD        XDE,HiThereHowCanText              [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        loc_21AE26                         [4]

.org 0x21AE1E

; [code] Here's what we've got, buy/sell, GP checks
ShopMenu:
    CALL      sub_2171A8                         [4]
    CALL      swp_21AC6B                         [4]

.org 0x21AE26

loc_21AE26:
    CALL      swp_217684                         [4]
    CALL      sub_21B369                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.skip13                         [5]
    CP        A,0                                [2]
    JP        Z,.loop                            [5]
    CP        A,1                                [2]
    JP        Z,.loop6                           [5]
    JP        .skip13                            [4]
.loop:
    CALL      sub_217F0C                         [4]
    CALL      sub_217CF0                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,HeresWhatWeveGotText           [5]
    LD        XDE,WhichListAreYouText            [5]
    CALL      swp_21AC89                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.skip7                          [5]
    CP        A,0                                [2]
    JP        Z,.skip                            [5]
    CP        A,1                                [2]
    JP        Z,.skip4                           [5]
    JP        .skip7                             [4]
.loop2:
    CALL      sub_217F0C                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_21AC6B                         [4]
.skip:
    CALL      sub_217D60                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.loop                           [5]
    LD        (0x621F),A                         [4]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x621F)                         [4]
    CALL      sub_21B6F9                         [4]
.loop3:
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop2                          [5]
    LD        W,(0x621F)                         [4]
    INC       1,W                                [2]
    INC       1,A                                [2]
    LD        (0x6220),WA                        [4]
    LD        XHL,AreYouSureText3                [5]
    LD        XDE,AreYouSureText2                [5]
    CALL      swp_21AC7E                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        NZ,.loop3                          [2]
    LD        WA,(0x6220)                        [4]
    CALL      sub_219701                         [4]
    AND       A,0x7F                             [3]
    CP        A,9                                [3]
    JR        NC,.skip2                          [2]
    LD        WA,(0x6220)                        [4]
    CALL      swp_2174E9                         [4]
    CP        (wGP),XWA                          [4]
    JR        C,.skip3                           [2]
    CALL      swp_219769                         [4]
    CALL      swp_218939                         [4]
    LD        WA,(0x6220)                        [4]
    CALL      sub_219713                         [4]
    LD        WA,0x8E                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,ThanksText                     [5]
    LD        XDE,ThanksText2                    [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop3                             [4]
.skip2:
    LD        XHL,SorryYouDontHaveText           [5]
    LD        XDE,WhoopsYouCantCarryText         [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop3                             [4]
.skip3:
    LD        WA,0x8F                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,LooksLikeYoureShortText        [5]
    LD        XDE,UmmIThinkItsText               [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop3                             [4]
.loop4:
    CALL      sub_217F0C                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_21AC6B                         [4]
.skip4:
    CALL      sub_217DD3                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.loop                           [5]
    LD        (0x621F),A                         [4]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x621F)                         [4]
    CALL      sub_21B4E3                         [4]
.loop5:
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop4                          [5]
    LD        W,(0x621F)                         [4]
    INC       1,W                                [2]
    INC       1,A                                [2]
    LD        (0x6220),WA                        [4]
    LD        XHL,AreYouSureText3                [5]
    LD        XDE,AreYouSureText2                [5]
    CALL      swp_21AC7E                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        NZ,.loop5                          [2]
    LD        WA,(0x6220)                        [4]
    CALL      sub_2196A8                         [4]
    AND       A,0x7F                             [3]
    CP        A,9                                [3]
    JR        NC,.skip5                          [2]
    LD        WA,(0x6220)                        [4]
    CALL      swp_2174D9                         [4]
    CP        (wGP),XWA                          [4]
    JR        C,.skip6                           [2]
    CALL      swp_219769                         [4]
    CALL      swp_218939                         [4]
    LD        WA,(0x6220)                        [4]
    CALL      sub_2196BA                         [4]
    LD        WA,0x8E                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,ThanksText                     [5]
    LD        XDE,ThanksText2                    [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop5                             [4]
.skip5:
    LD        XHL,SorryYouDontHaveText           [5]
    LD        XDE,WhoopsYouCantCarryText         [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop5                             [4]
.skip6:
    LD        WA,0x8F                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,LooksLikeYoureShortText        [5]
    LD        XDE,UmmIThinkItsText               [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop5                             [4]
.skip7:
    CALL      sub_217F0C                         [4]
    JP        loc_21AE26                         [4]
.loop6:
    CALL      sub_217F0C                         [4]
    CALL      sub_217CF0                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,WhatDoYouWantText7             [5]
    LD        XDE,WhatDoYouHaveText              [5]
    CALL      swp_21AC89                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.skip12                         [5]
    CP        A,0                                [2]
    JP        Z,.skip8                           [5]
    CP        A,1                                [2]
    JP        Z,.skip10                          [5]
    JP        .skip12                            [4]
.loop7:
    CALL      sub_217F0C                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_21AC6B                         [4]
.skip8:
    CALL      sub_217D60                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.loop6                          [5]
    LD        (0x621F),A                         [4]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x621F)                         [4]
    CALL      sub_21B781                         [4]
.loop8:
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JR        MI,.loop7                          [2]
    LD        W,(0x621F)                         [4]
    INC       1,W                                [2]
    INC       1,A                                [2]
    LD        (0x6220),WA                        [4]
    LD        XHL,AreYouSureText3                [5]
    LD        XDE,AreYouSureText2                [5]
    CALL      swp_21AC7E                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        NZ,.loop8                          [2]
    LD        WA,(0x6220)                        [4]
    CALL      sub_219701                         [4]
    AND       A,0x7F                             [3]
    JR        Z,.skip9                           [2]
    LD        WA,(0x6220)                        [4]
    CALL      swp_21750B                         [4]
    CALL      swp_21972D                         [4]
    CALL      swp_218939                         [4]
    LD        WA,(0x6220)                        [4]
    CALL      sub_219720                         [4]
    LD        WA,0x8E                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,ThanksText                     [5]
    LD        XDE,ThankYouText                   [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop8                             [4]
.skip9:
    LD        XHL,ItDoesntLookLikeText           [5]
    LD        XDE,YouDontHaveThatText            [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop8                             [4]
.loop9:
    CALL      sub_217F0C                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_21AC6B                         [4]
.skip10:
    CALL      sub_217DD3                         [4]
    CALL      sub_2179EC                         [4]
    CALL      sub_2179F8                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      sub_2179F2                         [4]
    CALL      sub_2179FE                         [4]
    LD        A,(0x613B)                         [4]
    OR        A,A                                [2]
    JP        MI,.loop6                          [5]
    LD        (0x621F),A                         [4]
    CALL      swp_217F20                         [4]
    CALL      sub_218A69                         [4]
    LD        A,(0x621F)                         [4]
    CALL      sub_21B563                         [4]
.loop10:
    CALL      sub_217EFA                         [4]
    CALL      sub_217F06                         [4]
    CALL      sub_2171A8                         [4]
    CALL      swp_217E90                         [4]
    LD        XHL,ChooseAnItemText               [5]
    LD        XDE,ChooseAnItemText               [5]
    CALL      swp_21AC89                         [4]
    CALL      WaitForButton                      [4]
    CALL      sub_2181CF                         [4]
    CALL      sub_217EA2                         [4]
    LD        WA,(0x615B)                        [4]
    OR        WA,WA                              [2]
    JP        MI,.loop9                          [5]
    LD        W,(0x621F)                         [4]
    INC       1,W                                [2]
    INC       1,A                                [2]
    LD        (0x6220),WA                        [4]
    LD        XHL,AreYouSureText3                [5]
    LD        XDE,AreYouSureText2                [5]
    CALL      swp_21AC7E                         [4]
    CALL      swp_2176A2                         [4]
    OR        A,A                                [2]
    JR        NZ,.loop10                         [2]
    LD        WA,(0x6220)                        [4]
    CALL      sub_2196A8                         [4]
    AND       A,0x7F                             [3]
    JR        Z,.skip11                          [2]
    LD        WA,(0x6220)                        [4]
    CALL      swp_2174FF                         [4]
    CALL      swp_21972D                         [4]
    CALL      swp_218939                         [4]
    LD        WA,(0x6220)                        [4]
    CALL      sub_2196C7                         [4]
    LD        WA,0x8E                            [3]
    CALL      sub_21990C                         [4]
    LD        XHL,ThanksText                     [5]
    LD        XDE,ThankYouText                   [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop10                            [4]
.skip11:
    LD        XHL,ItDoesntLookLikeText           [5]
    LD        XDE,YouDontHaveThatText            [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        .loop10                            [4]
.skip12:
    CALL      sub_217F0C                         [4]
    JP        loc_21AE26                         [4]
.skip13:
    LD        XHL,ThanksText                     [5]
    LD        XDE,ThanksText2                    [5]
    CALL      swp_21AC89                         [4]
    CALL      Wait30Frames                       [4]
    JP        swp_21AB3F                         [4]
    .db 22 15 19 FF 33 05 0C 0C FF 25 18 09 14 FF 00 00
    .db 40 B3 21 00 00 01 44 B3 21 00 00 08 49 B3 21 00
    .db 00 00 00 01 00 08 00 01 FF

.org 0x21B369

sub_21B369:
    LD        A,3                                [2]
    LD        (0x614A),A                         [4]
    LD        A,3                                [2]
    LD        (0x614B),A                         [4]
    LD        XHL,0x21B34E                       [5]
    LD        (0x614C),XHL                       [4]
    LD        XHL,0x21B360                       [5]
    LD        (0x6150),XHL                       [4]
    LD        XHL,0x21B366                       [5]
    LD        (0x6154),XHL                       [4]
    JP        loc_2179E0                         [4]

.org 0x21B394

swp_21B394:
    LD        W,(0x6182)                         [4]
    INC       1,W                                [2]
    CALL      swp_21B8D5                         [4]
    LD        (0x6160),A                         [4]
    LD        A,(0x6160)                         [4]
    EXTZ      WA                                 [2]
    ADD       WA,9                               [4]
    DIV{1}    WA,0xA                             [3]
    LD        (0x6161),A                         [4]
    LD        A,(0x6182)                         [4]
    SLL       2,A                                [3]
    LD        XHL,0x218218                       [5]
    LD        XHL,(XHL+A)                        [5]
    LD        BC,0                               [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    LD        BC,0x50B                           [3]
    LD        E,(0x6158)                         [4]
    INC       1,E                                [2]
    LD        WA,0x203                           [3]
    CALL      swp_2172A7                         [4]
    LD        BC,0x80B                           [3]
    LD        E,(0x6161)                         [4]
    LD        WA,0x203                           [3]
    CALL      swp_2172A7                         [4]
    LD        A,3                                [2]
    LD        B,1                                [2]
    LD        XHL,swp_218236                     [5]
    CALL      swp_217207                         [4]
    LD        A,(0x6182)                         [4]
    INC       1,A                                [2]
    LD        B,A                                [2]
    LD        A,(0x6158)                         [4]
    MUL{1}    WA,0xA                             [3]
    INC       1,A                                [2]
    LD        C,A                                [2]
    LD        DE,1                               [2]
    LD        WA,0xA                             [3]
.loop:
    PUSH      WA                                 [1]
    PUSH      BC                                 [1]
    PUSH      DE                                 [1]
    LD{1}     A,C                                [2]
    DEC       1,A                                [2]
    CP        A,(0x6160)                         [4]
    JR        C,.skip                            [2]
    CALL      swp_217F59                         [4]
    JP        .skip4                             [4]
.skip:
    LD{1}     WA,BC                              [2]
    CALL      sub_21B4DE                         [4]
    JR        C,.skip2                           [2]
    LD        XHL,0x21822B                       [5]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    JP        .skip4                             [4]
.skip2:
    PUSH      BC                                 [1]
    LD{1}     WA,BC                              [2]
    CALL      loc_217386                         [4]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      sub_217F78                         [4]
    POP       DE                                 [1]
    POP       WA                                 [1]
    CALL      sub_2183A2                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip3                          [2]
    LD        XHL,0x21B59E                       [5]
    LD        B,8                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    JR        .skip4                             [2]
.skip3:
    AND       A,0xF                              [3]
    PUSH      WA                                 [1]
    LD        B,8                                [2]
    LD{1}     C,E                                [2]
    LD        L,(0x218228)                       [5]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      swp_2171B9                         [4]
    POP       DE                                 [1]
    POP       WA                                 [1]
    LD        B,9                                [2]
    LD{1}     C,E                                [2]
    LD        E,A                                [2]
    LD        WA,0x103                           [3]
    CALL      swp_2172A7                         [4]
.skip4:
    POP       DE                                 [1]
    POP       BC                                 [1]
    INC       1,C                                [2]
    INC       1,E                                [2]
    POP       WA                                 [1]
    DEC       1,WA                               [2]
    OR        WA,WA                              [2]
    JP        NZ,.loop                           [5]
    RET                                          [1]

.org 0x21B4A0

swp_21B4A0:
    CALL      swp_217684                         [4]
    CALL      sub_21838A                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_21B4DE                         [4]
    JR        NC,.done                           [2]
    LD{1}     WA,BC                              [2]
    PUSH      WA                                 [1]
    CALL      0x2173E5                           [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
    POP       WA                                 [1]
    CALL      swp_2174D9                         [4]
    LD        BC,0xC02                           [3]
    LD        XDE,XWA                            [2]
    LD        WA,0x601                           [3]
    CALL      sub_217303                         [4]
.done:
    RET                                          [1]

.org 0x21B4D1

swp_21B4D1:
    CALL      sub_21838A                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_21B4DE                         [4]
.done:
    RET                                          [1]

.org 0x21B4DE

sub_21B4DE:
    CALL      swp_217558                         [4]
    RET                                          [1]

.org 0x21B4E3

sub_21B4E3:
    LD        XHL,swp_21B4A0                     [5]
    LD        XDE,swp_21B4D1                     [5]
    LD        (0x616A),XHL                       [4]
    LD        (0x616E),XDE                       [4]
    LD        (0x6182),A                         [4]
    LD        A,0xA                              [2]
    LD        (0x615F),A                         [4]
    LD        XHL,swp_21B394                     [5]
    LD        (0x6162),XHL                       [4]
    LD        XHL,swp_218331                     [5]
    LD        (0x6166),XHL                       [4]
    LD        XHL,0x2181D8                       [5]
    LD        (0x6172),XHL                       [4]
    JP        loc_217EEE                         [4]

.org 0x21B51E

swp_21B51E:
    CALL      swp_217684                         [4]
    CALL      sub_21838A                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_2183A2                         [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    LD{1}     WA,BC                              [2]
    PUSH      WA                                 [1]
    CALL      0x2173E5                           [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
    POP       WA                                 [1]
    CALL      swp_2174FF                         [4]
    LD        BC,0xC02                           [3]
    LD        XDE,XWA                            [2]
    LD        WA,0x601                           [3]
    CALL      sub_217303                         [4]
.done:
    RET                                          [1]

.org 0x21B563

sub_21B563:
    LD        XHL,swp_21B51E                     [5]
    LD        XDE,swp_21B551                     [5]
    LD        (0x616A),XHL                       [4]
    LD        (0x616E),XDE                       [4]
    LD        (0x6182),A                         [4]
    LD        A,0xA                              [2]
    LD        (0x615F),A                         [4]
    LD        XHL,loc_21823C                     [5]
    LD        (0x6162),XHL                       [4]
    LD        XHL,swp_218331                     [5]
    LD        (0x6166),XHL                       [4]
    LD        XHL,0x2181D8                       [5]
    LD        (0x6172),XHL                       [4]
    JP        loc_217EEE                         [4]
    .db 00 00 00 FF

.org 0x21B5A2

swp_21B5A2:
    LD        W,(0x6183)                         [4]
    INC       1,W                                [2]
    CALL      swp_21B978                         [4]
    LD        (0x6160),A                         [4]
    LD        A,(0x6160)                         [4]
    EXTZ      WA                                 [2]
    ADD       WA,9                               [4]
    DIV{1}    WA,0xA                             [3]
    LD        (0x6161),A                         [4]
    LD        A,(0x6183)                         [4]
    SLL       2,A                                [3]
    LD        XHL,0x21845A                       [5]
    LD        XHL,(XHL+A)                        [5]
    LD        BC,0                               [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    LD        BC,0x50B                           [3]
    LD        E,(0x6158)                         [4]
    INC       1,E                                [2]
    LD        WA,0x203                           [3]
    CALL      swp_2172A7                         [4]
    LD        BC,0x80B                           [3]
    LD        E,(0x6161)                         [4]
    LD        WA,0x203                           [3]
    CALL      swp_2172A7                         [4]
    LD        A,3                                [2]
    LD        B,1                                [2]
    LD        XHL,swp_218488                     [5]
    CALL      swp_217207                         [4]
    LD        A,(0x6183)                         [4]
    INC       1,A                                [2]
    LD        B,A                                [2]
    LD        A,(0x6158)                         [4]
    MUL{1}    WA,0xA                             [3]
    INC       1,A                                [2]
    LD        C,A                                [2]
    LD        DE,1                               [2]
    LD        WA,0xA                             [3]
.loop:
    PUSH      WA                                 [1]
    PUSH      BC                                 [1]
    PUSH      DE                                 [1]
    LD{1}     A,C                                [2]
    DEC       1,A                                [2]
    CP        A,(0x6160)                         [4]
    JR        C,.skip                            [2]
    CALL      swp_217F59                         [4]
    JP        .skip4                             [4]
.skip:
    LD{1}     WA,BC                              [2]
    CALL      sub_21B6F4                         [4]
    JR        C,.skip2                           [2]
    LD        XHL,0x21847D                       [5]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    JP        .skip4                             [4]
.skip2:
    PUSH      BC                                 [1]
    LD{1}     WA,BC                              [2]
    CALL      sub_21739F                         [4]
    LD{1}     B,D                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      sub_217F78                         [4]
    POP       DE                                 [1]
    POP       WA                                 [1]
    CALL      sub_218645                         [4]
    OR        A,A                                [2]
    JR        NZ,.skip3                          [2]
    LD        XHL,0x21B59E                       [5]
    LD        B,8                                [2]
    LD{1}     C,E                                [2]
    LD        A,3                                [2]
    CALL      swp_2171DF                         [4]
    JR        .skip4                             [2]
.skip3:
    AND       A,0xF                              [3]
    PUSH      WA                                 [1]
    LD        B,8                                [2]
    LD{1}     C,E                                [2]
    LD        L,(0x218228)                       [5]
    LD        A,3                                [2]
    PUSH      DE                                 [1]
    CALL      swp_2171B9                         [4]
    POP       DE                                 [1]
    POP       WA                                 [1]
    LD        B,9                                [2]
    LD{1}     C,E                                [2]
    LD        E,A                                [2]
    LD        WA,0x103                           [3]
    CALL      swp_2172A7                         [4]
.skip4:
    POP       DE                                 [1]
    POP       BC                                 [1]
    INC       1,C                                [2]
    INC       1,E                                [2]
    POP       WA                                 [1]
    DEC       1,WA                               [2]
    OR        WA,WA                              [2]
    JP        NZ,.loop                           [5]
    RET                                          [1]

.org 0x21B6AE

swp_21B6AE:
    LD        XHL,(0x616E)                       [4]
    CALL      sub_219238                         [4]
    CALL      swp_217684                         [4]
    CALL      sub_21862D                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_21B6F4                         [4]
    JR        NC,.done                           [2]
    LD{1}     WA,BC                              [2]
    PUSH      WA                                 [1]
    CALL      sub_2173D5                         [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
    POP       WA                                 [1]
    CALL      swp_2174E9                         [4]
    LD        BC,0xC02                           [3]
    LD        XDE,XWA                            [2]
    LD        WA,0x601                           [3]
    CALL      sub_217303                         [4]
.done:
    RET                                          [1]

.org 0x21B6E7

swp_21B6E7:
    CALL      sub_21862D                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_21B6F4                         [4]
.done:
    RET                                          [1]

.org 0x21B6F4

sub_21B6F4:
    CALL      sub_21757B                         [4]
    RET                                          [1]

.org 0x21B6F9

sub_21B6F9:
    LD        XHL,swp_21B6AE                     [5]
    LD        XDE,swp_21B6E7                     [5]
    LD        (0x616A),XHL                       [4]
    LD        (0x616E),XDE                       [4]
    LD        (0x6183),A                         [4]
    LD        A,0xA                              [2]
    LD        (0x615F),A                         [4]
    LD        XHL,swp_21B5A2                     [5]
    LD        (0x6162),XHL                       [4]
    LD        XHL,swp_218577                     [5]
    LD        (0x6166),XHL                       [4]
    LD        XHL,0x2183EE                       [5]
    LD        (0x6172),XHL                       [4]
    JP        loc_217EEE                         [4]

.org 0x21B734

swp_21B734:
    LD        XHL,(0x616E)                       [4]
    CALL      sub_219238                         [4]
    CALL      swp_217684                         [4]
    CALL      sub_21862D                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_218645                         [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    LD{1}     WA,BC                              [2]
    PUSH      WA                                 [1]
    CALL      sub_2173D5                         [4]
    LD        BC,0                               [2]
    CALL      swp_217699                         [4]
    POP       WA                                 [1]
    CALL      swp_21750B                         [4]
    LD        BC,0xC02                           [3]
    LD        XDE,XWA                            [2]
    LD        WA,0x601                           [3]
    CALL      sub_217303                         [4]
.done:
    RET                                          [1]

.org 0x21B76F

swp_21B76F:
    CALL      sub_21862D                         [4]
    JR        NC,.done                           [2]
    LD        BC,WA                              [2]
    CALL      sub_218645                         [4]
    OR        A,A                                [2]
    JR        Z,.done                            [2]
    SCF                                          [1]
.done:
    RET                                          [1]

.org 0x21B781

sub_21B781:
    LD        XHL,swp_21B734                     [5]
    LD        XDE,swp_21B76F                     [5]
    LD        (0x616A),XHL                       [4]
    LD        (0x616E),XDE                       [4]
    LD        (0x6183),A                         [4]
    LD        A,0xA                              [2]
    LD        (0x615F),A                         [4]
    LD        XHL,loc_21848E                     [5]
    LD        (0x6162),XHL                       [4]
    LD        XHL,swp_218577                     [5]
    LD        (0x6166),XHL                       [4]
    LD        XHL,0x2183EE                       [5]
    LD        (0x6172),XHL                       [4]
    JP        loc_217EEE                         [4]

.org 0x21B92F

sub_21B92F:
    PUSH      XHL                                [1]
    SLL       2,WA                               [3]
    LD        XHL,ItemPrices                     [5]
    LD        XWA,(XHL+WA)                       [5]
    POP       XHL                                [1]
    RET                                          [1]
    .db E3 0F 0F 2C 14 85 00 0F 1E 4A 5E

.org 0x21D1AE

sub_21D1AE:
    PUSH      XHL                                [1]
    LD        XHL,0x25E4B9                       [5]
    LD        A,(XHL+WA)                         [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21D1BB

sub_21D1BB:
    PUSH      XHL                                [1]
    LD        XHL,0x25E500                       [5]
    LD        A,(XHL+WA)                         [5]
    POP       XHL                                [1]
    RET                                          [1]

.org 0x21D856

swp_21D856:
    LD        XHL,swp_214C75                     [5]
    CALL      StartChildTask                     [4]
    task_wait
    CPB       (0x60F0),3                         [5]
    JR        Z,.skip3                           [2]
    CPB       (0x60F0),4                         [5]
    JR        Z,.skip                            [2]
    CPB       (0x60F0),5                         [5]
    JR        Z,.skip2                           [2]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]
.skip:
    LD        A,1                                [2]
    CALL      sub_21AC2E                         [4]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]
.skip2:
    LD        A,1                                [2]
    CALL      sub_21AC2E                         [4]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]
.skip3:
    LD        A,1                                [2]
    CALL      sub_21AC2E                         [4]
    LDW       (XIZ+8),0xD758                     [5]
    LDW       (XIZ+0xA),0x21                     [5]
    RET                                          [1]
