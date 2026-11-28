; audio/sound_engine: 12 routines (each keeps its ROM address in its own section)

c_200040	section	code abs=0x200040

; Boot: stops the Z80 (0xB8 = 0xAAAA), uploads the driver, restarts it (0x5555) and starts timer 3 at rate 2000 [U2]
InitSound:
	ldw	(0xB8),0xAAAA	; 0xB8: AAAA = Z80 stopped, 5555 = running
	nop
	call	UploadZ80Driver
	ldw	(0xB8),0x5555
	nop
	ld	WA,0x7D0
	calr	SetupTimer3
	ret

c_200055	section	code abs=0x200055

; Empties wSoundQueue, clears wSoundBlockMask and takes the current port 0xBC as wSoundAckExpected [U2]
ResetSoundState:
	sub	A,A
	ld	(wSoundQueueRead:24),A
	ld	(wSoundQueueWrite:24),A
	ld	(wSoundBlockMask:24),A
	ld	A,(0xBC)
	ld	(wSoundAckExpected:24),A
	ret

c_20006F	section	code abs=0x20006F

; Queues sound id WA as a driver command (SoundIdToCommand) in the 16-entry ring wSoundQueue; 0x80..0x85
; set / clear wSoundBlockMask bits instead, 0xFF also resets the queue; a full queue drops its oldest entry. C = taken [U2]
QueueSoundCommand:
	push	WA
	push	XIX
	calr	SoundIdToCommand
	jr	NC,QueueSoundCommand.skip7
	calr	CheckSoundCommandBlocked
	jr	NC,QueueSoundCommand.skip
	jr	NZ,QueueSoundCommand.skip6
	jr	QueueSoundCommand.skip4
QueueSoundCommand.skip:
	cp	A,0x86
	jr	NC,QueueSoundCommand.skip3
	ld	W,A
	and	W,7
	cp	A,0x83	; 0x80..0x82 block channel 1..3 (?), 0x83..0x85 unblock
	jr	NC,QueueSoundCommand.skip2
	inc	1,W
	or	(wSoundBlockMask:24),W
	jr	QueueSoundCommand.skip6
QueueSoundCommand.skip2:
	dec	1,W
	neg	W
	and	(wSoundBlockMask:24),W
	jr	QueueSoundCommand.skip6
QueueSoundCommand.skip3:
	cp	A,0xFF
	jr	NZ,QueueSoundCommand.skip4
	push	A
	calr	ResetSoundState
	pop	A
QueueSoundCommand.skip4:
	ld	W,(wSoundQueueWrite:24)
	inc	1,W
	and	W,0xF
	cp	(wSoundQueueRead:24),W
	jr	NZ,QueueSoundCommand.skip5
	push	SR
	push	A
	di
	call	Z,DequeueSoundCommand
	pop	A
	pop	SR
QueueSoundCommand.skip5:
	ld	XIX,wSoundQueue
	ld	W,(wSoundQueueWrite:24)
	ld	(XIX+W),A
	inc	1,W
	and	W,0xF
	ld	(wSoundQueueWrite:24),W
QueueSoundCommand.skip6:
	scf
QueueSoundCommand.loop:
	pop	XIX
	pop	WA
	ret
QueueSoundCommand.skip7:
	rcf
	jr	QueueSoundCommand.loop

c_2000E8	section	code abs=0x2000E8

; Each main-loop frame: once the Z80 has acknowledged (0xBC = wSoundAckExpected), sends the next unblocked
; command: 0xBC = command, wSoundAckExpected = its complement, 0xBA = 1 (Z80 NMI). C = sent or queue empty [U2]
SendQueuedSoundCommand:
	push	WA
	push	XIX
SendQueuedSoundCommand.loop:
	ld	W,(wSoundQueueWrite:24)
	cp	(wSoundQueueRead:24),W
	jr	Z,SendQueuedSoundCommand.skip2
	ld	A,(0xBC)
	cp	(wSoundAckExpected:24),A
	jr	NZ,SendQueuedSoundCommand.skip3
	calr	DequeueSoundCommand
	jr	NC,SendQueuedSoundCommand.skip3
	calr	CheckSoundCommandBlocked
	jr	NC,SendQueuedSoundCommand.skip
	jr	NZ,SendQueuedSoundCommand.loop
SendQueuedSoundCommand.skip:
	ld	(0xBC),A
	xor	A,0xFF
	ld	(wSoundAckExpected:24),A
	ldb	(0xBA),1
SendQueuedSoundCommand.skip2:
	pop	XIX
	pop	WA
	scf
	ret
SendQueuedSoundCommand.skip3:
	pop	XIX
	pop	WA
	rcf
	ret

c_200122	section	code abs=0x200122

; Loads song XWA (SongTable) into the Z80: driver restart (re-upload if no answer in 100 reads), header, voices
; (SoundInit records), then each track block, recording ids in wMusicTrackIds / wSfxTrackIds. C = no song / error [U2]
PlaySong:
	push	XBC
	push	XDE
	push	XHL
	push	XIX
	push	XIY
	push	XWA
	call	ResetSoundState
	pop	XWA
	ld	XHL,SongTable
	add	XWA,XWA
	add	XWA,XWA
	add	XHL,XWA
	ld	XHL,(XHL)
	cp	XHL,0
	jrl	Z,PlaySong.skip3
	ldb	(0xBC),0xFF
	ldb	(0xBA),1
	ldb	(wSoundAckExpected:24),0
	xor	D,D
PlaySong.loop:
	ld	E,(0xBC)
	cp	E,0:8
	jr	Z,PlaySong.skip
	inc	1,D
	cp	D,0x64
	jr	C,PlaySong.loop
	ldw	(0xB8),0xAAAA
	nop
	push	XDE
	push	XHL
	push	XBC
	push	XIX
	call	UploadZ80Driver
	pop	XIX
	pop	XBC
	pop	XHL
	pop	XDE
	push	XWA
	call	ResetSoundState
	pop	XWA
	ldw	(0xB8),0x5555
	nop
PlaySong.skip:
	xor	A,A
	ld	(wMusicTrackCount:24),A
	ld	(wSfxTrackCount:24),A
	xor	XDE,XDE
	ld	XIX,wMusicTrackIds
	ld	XIY,wSfxTrackIds
	ld	C,0x10
PlaySong.loop2:
	ld	(XIX+),XDE
	ld	(XIY+),XDE
	djnz	C,PlaySong.loop2
	ld	DE,(XHL+2)
	extz	XDE
	add	XDE,Z80_RAM
	ld	(wZ80SongWrite:24),XDE
	ld	XDE,(wZ80SongHeader:24)
	calr	SetZ80Pointer
	ld	BC,6
	calr	CopyToZ80
	ld	XDE,(wZ80Voices:24)
	calr	SetZ80Pointer
	ld	A,(XHL+)
	or	A,A
	jp	Z,PlaySong.skip3
PlaySong.loop3:
	ld	DE,9
	mul	DE,(XHL+)
	push	XHL
	ld	XHL,SoundInit
	lda	XHL,XHL+DE
	ld	BC,9
	calr	CopyToZ80
	pop	XHL
	djnz	A,PlaySong.loop3
	ld	XDE,(wZ80SongWrite:24)
	calr	SetZ80Pointer
	ld	XIX,wMusicTrackIds
	ld	XIY,wMusicTrackCount
PlaySong.loop4:
	ld	E,(XIY)
	cp	E,0x20	; at most 32 tracks per table
	jp	NC,PlaySong.skip3
	ld	XDE,(XHL+)
	or	XDE,XDE
	jr	Z,PlaySong.loop5
	ld	A,(XHL+)
	ld	(wSongReadPtr:24),XHL
	ld	XHL,XDE
	ld	DE,(XHL+)
	cp	DE,0x7F
	jr	C,PlaySong.skip2
	cpb	(wSfxTrackCount:24),0
	jr	NZ,PlaySong.skip2
	ld	XIX,wSfxTrackIds
	ld	XIY,wSfxTrackCount
PlaySong.skip2:
	ld	(XIX+),DE
	incb	1,(XIY)
	ld	E,(XHL+)
	extz	DE
	ld	BC,(XHL)
	and	BC,0x3FFF	; block length (top two bits = channel count - 1)
	sub	BC,DE
	sub	BC,WA
	ld	(wSongBlockLength:24),DE
	ex	(wSongBlockLength:24),BC
	calr	CopyToZ80
	lda	XHL,XHL+WA
	ld	XDE,(wSongReadPtr:24)
	ld	(wSongReadPtr:24),XHL
	ld	XHL,XDE
	ld	BC,WA
	calr	CopyToZ80
	push	XHL
	ld	XHL,(wSongReadPtr:24)
	ld	BC,(wSongBlockLength:24)
	calr	CopyToZ80
	ld	(wZ80SongWrite:24),XDE
	pop	XHL
	jp	PlaySong.loop4
PlaySong.loop5:
	pop	XIY
	pop	XIX
	pop	XHL
	pop	XDE
	pop	XBC
	ret
PlaySong.skip3:
	scf
	jr	PlaySong.loop5

c_200289	section	code abs=0x200289

; A = the oldest queued command and C; NC if wSoundQueue is empty [U2]
DequeueSoundCommand:
	ld	W,(wSoundQueueRead:24)
	cp	(wSoundQueueWrite:24),W
	rcf
	ret	Z
	ld	XIX,wSoundQueue
	ld	W,(wSoundQueueRead:24)
	ld	A,(XIX+W)
	inc	1,W
	and	W,0xF
	ld	(wSoundQueueRead:24),W
	scf
	ret

c_2002B1	section	code abs=0x2002B1

; Command A: 0x80 up are never blocked (NC); else C, and NZ when its channel (bit 0 set: mask bit 0,
; else bit 1) is blocked in wSoundBlockMask [U2]
CheckSoundCommandBlocked:
	bit	7,A
	jr	Z,CheckSoundCommandBlocked.skip
	rcf
	ret
CheckSoundCommandBlocked.skip:
	ld	W,1
	bit	0,A
	jr	NZ,CheckSoundCommandBlocked.skip2
	ld	W,2
CheckSoundCommandBlocked.skip2:
	and	W,(wSoundBlockMask:24)
	scf
	ret

c_2002C8	section	code abs=0x2002C8

; Sound id WA to driver command A: W bit 7 = A as is, 0x7F = 1 (stop music), below 0x20 = 0xC0 + 2n, else the
; loaded track index * 4 + 3 (music, wMusicTrackIds) / + 2 or + 0 (SFX, wSfxTrackIds). NC = not loaded [U2]
SoundIdToCommand:
	bit	7,W
	scf
	ret	NZ
	cp	WA,0x7F
	jr	NZ,SoundIdToCommand.skip
	ld	A,1
	scf
	ret
SoundIdToCommand.skip:
	cp	WA,0x20
	jr	NC,SoundIdToCommand.skip2
	add	A,A
	or	A,0xC0
	scf
	ret
SoundIdToCommand.skip2:
	push	DE
	push	BC
	ld	E,3
	ld	XIX,wMusicTrackIds
	cp	WA,0x80
	jr	C,SoundIdToCommand.skip3
	and	E,0xFE
	ld	XIX,wSfxTrackIds
	cp	WA,0x280
	jr	C,SoundIdToCommand.skip3
	and	E,0xFD
SoundIdToCommand.skip3:
	ld	BC,0x20
	and	WA,0x1FF
	cpirw	WA,(XIX+)
	jr	NZ,SoundIdToCommand.skip4
	ld	A,0x1F
	sub	A,C
	add	A,A
	add	A,A
	or	A,E
	pop	BC
	pop	DE
	scf
	ret
SoundIdToCommand.skip4:
	pop	BC
	pop	DE
	rcf
	ret

c_200322	section	code abs=0x200322

; Copies BC bytes from XHL to Z80 RAM at wZ80CopyPointer and advances it (falls into SetZ80Pointer). Out: XDE [U2]
CopyToZ80:
	ld	XDE,(wZ80CopyPointer:24)
	ldir	(XDE+),(XHL+)

c_200329	section	code abs=0x200329

; wZ80CopyPointer = XDE [U2]
SetZ80Pointer:
	ld	(wZ80CopyPointer:24),XDE
	ret

c_20032F	section	code abs=0x20032F

; Starts timer 3 (TREG3 = WA * 1000 / 0x5000, rounded) with flip-flop output on TFFCR, the Z80 tempo clock (?) [U2]
SetupTimer3:
	push	XWA
	andb	(TRUN),0xF7
	andb	(T23MOD),0x33
	orb	(T23MOD),4
	andb	(TFFCR),0xF
	orb	(TFFCR),0xB0
	mul	XWA,0x3E8
	div	XWA,0x5000
	cp	QWA,0x2800
	jr	C,SetupTimer3.skip
	inc	1,A
SetupTimer3.skip:
	ld	(TREG3),A
	orb	(TRUN),0x88
	pop	XWA
	ret

c_20035E	section	code abs=0x20035E

; Copies Z80Driver to Z80_RAM (length = its word at +0x8F), then Z80CmdTable after the 6-byte song header slot;
; sets wZ80SongHeader and wZ80Voices (where PlaySong puts the voices) [U2]
UploadZ80Driver:
	ld	XDE,Z80_RAM
	calr	SetZ80Pointer
	ld	XHL,Z80Driver
	ld	XDE,XHL
	ld	BC,(XDE+0x8F)
	ld	DE,BC
	extz	XDE
	lda	XDE,XDE+Z80_RAM
	ld	(wZ80SongHeader:24),XDE
	calr	CopyToZ80
	add	XDE,6
	calr	SetZ80Pointer
	ld	XHL,Z80CmdTable
	ld	BC,(XHL+)
	or	BC,BC
	jr	Z,UploadZ80Driver.skip
	calr	CopyToZ80
UploadZ80Driver.skip:
	ld	(wZ80Voices:24),XDE
	ret
	db	0xFF,0xFF,0xFF,0xFF,0xFE,0xFE,0xFE,0xFE,0xFD,0xFD,0xFD,0xFD,0x01,0x04,0x0B,0x01
	db	0x01
