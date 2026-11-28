; audio/sound_init.asm: SoundInit (0x200E67, 31 bytes), read by PlaySong and UploadZ80Driver.
; Format read from the code.

d_200E67	section	romdata abs=0x200E67
; [code] voice records, 9 bytes each. A song header's voice id k makes PlaySong copy
; SoundInit + 9*k to the Z80; the driver's chip op 2 (Z80 0x08E1, reached from the track
; command instr) loads one into a chip channel. Fields, as op 2 uses them:
;   +0     bits 7-5: index into the Z80 table at 0x06EA (envelope flag bits);
;          bit 4: sets the noise-control bit 2 of Z80 0xE3 (channel 3 only);
;          bits 3-0: rate of envelope phase 1
;   +1     bits 7-4: rate of phase 2; bits 3-0 (times 4): the level that ends phase 2
;   +2     bits 7-4: rate of phase 3; bits 3-0: rate of phase 4
;   +3,+4  modulator A (its output goes to the volume)
;   +5,+6  modulator B (its output goes to the volume or the frequency, by the flag bits)
;   +7,+8  not read by any traced driver code
; (Reading the phases as attack/decay/sustain/release is inferred, not shown by the code.)
SoundInit:
	db	0x3E,0x2D,0x08,0x00,0x00,0x00,0x03,0x18,0x40	; voice 0
	db	0x2E,0x2D,0x06,0x00,0x00,0x00,0x02,0x14,0x20	; voice 1
	db	0x0E,0x2D,0x08,0x00,0x00,0x00,0x00,0x00,0x00	; voice 2
; [code] UploadZ80Driver: a u16 byte count, then that many bytes copied to Z80 0x0ABB. The
; driver reads it as the table for commands 0xC0+2n (game sound ids n < 0x20 in SoundIdToCommand):
; entry n = func, arg; func 0 = Z80 0x05FA, func 1 = Z80 0x0054 (jump table at Z80 0x04F6).
Z80CmdTable:
	dw	2
	db	0x00,0x03	; entry 0: func 0, arg 3: steps the music attenuation up to 15, then stops the music slots (fade-out)
