; audio/sound: 4 routines (each keeps its ROM address in its own section)

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

c_20776F	section	code abs=0x20776F

swp_20776F:
	cpw	(HeaderCartId),0xFFFE
	scc	Z,RA3
	ld	RB3,B
	ld	RW3,8
	ldb	(WDCR),0x4E
	swi	1
	ldb	(WDCR),0x4E
	ret

c_207788	section	code abs=0x207788

sub_207788:
	cpw	(HeaderCartId),0xFFFE
	scc	Z,RA3
	ld	RW3,6
	ld	RBC3,BC
	ld	XHL3,XHL
	ld	XDE3,XDE
	ldb	(WDCR),0x4E
	swi	1
	ldb	(WDCR),0x4E
	ret
