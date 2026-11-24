; audio/sound: 1 routines (each keeps its ROM address with .org)

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
