; audio/sound_engine: 12 routines (each keeps its ROM address in its own section)

c_200040	section	code abs=0x200040

; hold Z80 in reset, upload driver, release it
InitSound:
	ldw	(0xB8),0xAAAA
	nop
	call	UploadZ80Driver
	ldw	(0xB8),0x5555
	nop
	ld	WA,0x7D0
	calr	SetupTimer3
	ret

c_200055	section	code abs=0x200055

ResetSoundState:
	sub	A,A
	ld	(wSoundQueueRead:24),A
	ld	(wSoundQueueWrite:24),A
	ld	(wSoundBlockMask:24),A
	ld	A,(0xBC)
	ld	(wSoundAckExpected:24),A
	ret

c_20006F	section	code abs=0x20006F

; [code] A = command: 0x80-0x85 set/clear wSoundBlockMask bits, 0xFF reset, else queued in the 16-entry ring wSoundQueue
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
	cp	A,0x83
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

; [code] each main-loop frame (Reset): while wSoundQueue is not empty and port 0xBC = wSoundAckExpected, dequeue a command, drop it if CheckSoundCommandBlocked, else write it to 0xBC, wSoundAckExpected = its complement, 0xBA = 1; C if the queue was emptied or one was sent
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

; XWA = song number; table at SongTable
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
	ld	(0x62EE:24),A
	ld	(0x632F:24),A
	xor	XDE,XDE
	ld	XIX,0x62AE
	ld	XIY,0x62EF
	ld	C,0x10
PlaySong.loop2:
	ld	(XIX+),XDE
	ld	(XIY+),XDE
	djnz	C,PlaySong.loop2
	ld	DE,(XHL+2)
	extz	XDE
	add	XDE,0x7000
	ld	(0x633C:24),XDE
	ld	XDE,(0x6334:24)
	calr	SetZ80Pointer
	ld	BC,6
	calr	CopyToZ80
	ld	XDE,(0x6338:24)
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
	ld	XDE,(0x633C:24)
	calr	SetZ80Pointer
	ld	XIX,0x62AE
	ld	XIY,0x62EE
PlaySong.loop4:
	ld	E,(XIY)
	cp	E,0x20
	jp	NC,PlaySong.skip3
	ld	XDE,(XHL+)
	or	XDE,XDE
	jr	Z,PlaySong.loop5
	ld	A,(XHL+)
	ld	(0x6340:24),XHL
	ld	XHL,XDE
	ld	DE,(XHL+)
	cp	DE,0x7F
	jr	C,PlaySong.skip2
	cpb	(0x632F:24),0
	jr	NZ,PlaySong.skip2
	ld	XIX,0x62EF
	ld	XIY,0x632F
PlaySong.skip2:
	ld	(XIX+),DE
	incb	1,(XIY)
	ld	E,(XHL+)
	extz	DE
	ld	BC,(XHL)
	and	BC,0x3FFF
	sub	BC,DE
	sub	BC,WA
	ld	(0x6344:24),DE
	ex	(0x6344:24),BC
	calr	CopyToZ80
	lda	XHL,XHL+WA
	ld	XDE,(0x6340:24)
	ld	(0x6340:24),XHL
	ld	XHL,XDE
	ld	BC,WA
	calr	CopyToZ80
	push	XHL
	ld	XHL,(0x6340:24)
	ld	BC,(0x6344:24)
	calr	CopyToZ80
	ld	(0x633C:24),XDE
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

; [code] -> A = next byte of wSoundQueue at wSoundQueueRead (index advanced, mod 16), C; NC if the ring is empty
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

; [code] A = command: bit 7 set -> NC; else C, NZ if wSoundBlockMask has bit 0 (command bit 0 set) or bit 1 (bit 0 clear)
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

; [code] WA = sound id -> A = Z80 command, C: W bit 7 set -> A as is; 0x7F -> 1; < 0x20 -> A*2 | 0xC0; else its index (WA & 0x1FF searched) in a 32-word id list that PlaySong fills -> index*4 | E: ids below 0x80 list 0x62AE, E = 3; 0x80-0x27F list 0x62EF, E = 2; 0x280 and up list 0x62EF, E = 0; NC if not found
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
	ld	XIX,0x62AE
	cp	WA,0x80
	jr	C,SoundIdToCommand.skip3
	and	E,0xFE
	ld	XIX,0x62EF
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

; LDIR XHL -> Z80 RAM at the running pointer
CopyToZ80:
	ld	XDE,(wZ80CopyPointer:24)
	ldir	(XDE+),(XHL+)

c_200329	section	code abs=0x200329

SetZ80Pointer:
	ld	(wZ80CopyPointer:24),XDE
	ret

c_20032F	section	code abs=0x20032F

; [code] WA = rate (InitSound passes 0x7D0): stops timer 3, sets T23MOD / TFFCR, TREG3 = WA*1000/0x5000 (rounded), restarts timer 3 (TRUN bits 3 and 7)
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

; copies Z80Driver to 0x7000
UploadZ80Driver:
	ld	XDE,0x7000
	calr	SetZ80Pointer
	ld	XHL,Z80Driver
	ld	XDE,XHL
	ld	BC,(XDE+0x8F)
	ld	DE,BC
	extz	XDE
	lda	XDE,XDE+0x7000
	ld	(0x6334:24),XDE
	calr	CopyToZ80
	add	XDE,6
	calr	SetZ80Pointer
	ld	XHL,Z80CmdTable
	ld	BC,(XHL+)
	or	BC,BC
	jr	Z,UploadZ80Driver.skip
	calr	CopyToZ80
UploadZ80Driver.skip:
	ld	(0x6338:24),XDE
	ret
	db	0xFF,0xFF,0xFF,0xFF,0xFE,0xFE,0xFE,0xFE,0xFD,0xFD,0xFD,0xFD,0x01,0x04,0x0B,0x01
	db	0x01
