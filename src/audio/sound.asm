; audio/sound.asm: PlayMusic and SoundCommand, the calls into the sound engine (audio/sound_engine.asm)

c_207759	section	code abs=0x207759

; [code] WA = song: InitSound, ResetSoundState, PlaySong
PlayMusic:
	push	WA
	call	InitSound
	call	ResetSoundState
	pop	WA
	extz	XWA
	call	PlaySong
	ret

c_20776A	section	code abs=0x20776A

; [code] WA = command -> QueueSoundCommand
SoundCommand:
	call	QueueSoundCommand
	ret
