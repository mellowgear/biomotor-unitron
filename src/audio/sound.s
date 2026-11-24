; audio/sound: 7 routines (each keeps its ROM address with .org)

.org 0x20770B

swp_20770B:
    CALL      GetTextBox                         [4]
    LD        XDE,0                              [2]
    LD        DE,(XWA+0)                         [3]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    RET                                          [1]

.org 0x20771C

swp_20771C:
    CALL      GetTextBox                         [4]
    BIT       7,(XWA+0x12)                       [3]
    JR        NZ,dyn_207740                      [2]
    LD        XDE,0                              [2]
    LD        E,(XWA+4)                          [3]
    DEC       2,E                                [2]
    MUL       DE,(XWA+7)                         [3]
    ADD       E,(XWA+6)                          [3]
    ADC       D,0                                [3]
    ADD       DE,(XWA+0)                         [3]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    RET                                          [1]

.org 0x207740

dyn_207740:
    LD        XDE,0                              [2]
    LD        E,(XWA+4)                          [3]
    MUL       DE,(XWA+7)                         [3]
    ADD       E,(XWA+6)                          [3]
    ADC       D,0                                [3]
    ADD       DE,(XWA+0)                         [3]
    SLL       4,DE                               [3]
    ADD       DE,0xA000                          [4]
    RET                                          [1]

.org 0x207759

; [code] WA = song: InitSound, ResetSoundState, PlaySong
PlayMusic:
    PUSH      WA                                 [1]
    CALL      InitSound                          [4]
    CALL      ResetSoundState                    [4]
    POP       WA                                 [1]
    EXTZ      XWA                                [2]
    CALL      PlaySong                           [4]
    RET                                          [1]

.org 0x20776A

; [code] WA = command -> QueueSoundCommand
SoundCommand:
    CALL      QueueSoundCommand                  [4]
    RET                                          [1]

.org 0x20776F

swp_20776F:
    CPW       (0x200020),0xFFFE                  [7]
    SCC       Z,RA3                              [3]
    LD        RB3,B                              [3]
    LD        RW3,8                              [4]
    LDB       (WDCR),0x4E                        [3]
    SWI       1                                  [1]
    LDB       (WDCR),0x4E                        [3]
    RET                                          [1]

.org 0x207788

sub_207788:
    CPW       (0x200020),0xFFFE                  [7]
    SCC       Z,RA3                              [3]
    LD        RW3,6                              [3]
    LD        RBC3,BC                            [3]
    LD        XHL3,XHL                           [3]
    LD        XDE3,XDE                           [3]
    LDB       (WDCR),0x4E                        [3]
    SWI       1                                  [1]
    LDB       (WDCR),0x4E                        [3]
    RET                                          [1]
