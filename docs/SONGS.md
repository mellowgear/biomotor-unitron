# Songs: the track text format (src/audio/tracks/*.song)

The game's music and sound effects are 70 **tracks**. Each one is a text file
`src/audio/tracks/track_XX.song` (XX = the track id in hex). `make` turns each file into the bytes
of its track record with `tools/biosong` (built from `tools/biosong.cpp`). `src/audio/tracks.asm`
puts each record at its ROM address. The format was read from the code (PlaySong 0x200122 and the
Z80 driver); the sections "How the game uses the data" below give the details, with the code
addresses. Nothing here was checked by ear or in the emulator.

**The names (`note`, `instr`, `atten`, `pan`, ...) are our descriptions of what the driver does
with each command. They are not names from the original tools.**

Around the tracks, in asm:
- `src/audio/songs.asm`: `SongTable` (one `dl Song_NN` per song id, NN in decimal) and the 21
  song headers. A header lists the voices and the tracks that PlayMusic loads into the Z80.
- `src/audio/sound_init.asm`: `SoundInit`, the three 9-byte voice records, and `Z80CmdTable`.

## Example (track_80.song, a sound effect)

```
	track	0x80          ; the track id (the u16 at the start of the record)
	channel	1, .ch0       ; one line per stream (1-4): hardware channel 0-3, start label
	map	1             ; the instrument map: instr N uses voice map[N] of the song

.ch0:
	instr	0 w1          ; a command with an explicit wait of 1 step
	note	o2 A v15 w2 g1
	note	o3 D w3 g2    ; no v: keep the volume
	note	o4 E v13 w4 g4
	end
```

## Syntax

- `;` starts a comment. Commas and tabs count as spaces.
- `track`, `channel` and `map` come first. Then the streams follow, in ROM order. Each stream
  starts at a label (`.name:` on its own line).
- The layout is computed: the block length, E, the channel offsets, the call offsets, the 4- or
  8-bit width of waits and gates (8 bits for 16-255), and the 0 padding bits. A stream starts on
  a byte at each label and after each `loop`, as the driver needs.

### note

`note [oN] NAME|= [vN] [wN] [gN]`

| Field | Meaning |
|---|---|
| `oN` | Set the octave N (0-7). Leave it out to keep the octave. |
| `NAME` | Set the note: `C C# D D# E F F# G G# A A# B`. Write `=` to keep the note (so `o3 =` changes only the octave). |
| `vN` | Set the volume N (0-15). Leave it out to keep the volume. With volume 0 the driver writes nothing to the chip (a rest). |
| `wN` | The wait: steps until the next event. Leave it out (or write `w=`) to repeat the last wait. |
| `gN` | The gate: steps until the note is keyed off (added to the slot's countdown; 0 = no key off). Leave it out (or write `g=`) to repeat the last gate. |

The ROM doesn't always use the shortest form. Sometimes it resends an unchanged octave, note or
volume, or writes a value equal to the last one instead of `=`. The text keeps exactly what the
ROM sends. So `note o3 C` and `note C` (already in octave 3) build different bytes but play the same.

Note names: semitone 0-11 of the driver's equal-tempered period table. Naming semitone 0 `C` is
**inferred**: the period table at Z80 0x06BD, with the NGPC sound chip clock of 3.072 MHz from the
hardware docs, gives 130.8 Hz for octave 1 `C` and 220 Hz for octave 1 `A`. So driver octave N
would be scientific octave N+2. This was not checked by ear.

### commands

Each command can take `wN`: the wait before the next event. Without it the wait is 0, so the
next event runs in the same step.

| Command | Argument | What the driver does |
|---|---|---|
| `instr N` | 0-31 | Load voice record `map[N]` of the song into the chip channel |
| `atten N` | 0-15 | Channel attenuation, added to both outputs |
| `pan N` | 0-15 | Output levels from the table at Z80 0x06D5 (the name is inferred) |
| `detune N` | 0-127 | Frequency offset (N - 0x40) * 2 (the name is inferred; never used in the ROM) |
| `loop N` | 0-31 | Start a loop whose body plays N times (0 = forever, which ends the stream). At most 2 loops can be nested. |
| `endloop` | - | End of the loop body |
| `tempo N` | 0-255 | Set the music tempo byte (Z80 0xD4) |
| `call .label` | label | Run a subroutine, which ends with `ret`. The label must lie 0-2047 bytes after the call. Calls don't nest. |
| `ret` | - | Return from the subroutine |
| `end` | - | Stop this stream (the slot is freed) |

Driver cmd numbers 0-8 and 15 are all of the commands. The table at Z80 0x03E6 has no entries for
9-14.

## Editing

- Every record stays pinned at its ROM address (`section romdata abs=`). A track that grows runs
  into the next one, and the build fails. A track that shrinks leaves a gap.
- A track is shared by every song whose header lists it. The comment at the top of each file says
  which songs use it.
- The song header's map bytes (`db n, ...` after `dl Track_XX` in songs.asm) are what PlaySong
  copies into the Z80. The track's own `map` line is only a placeholder that gets overwritten.
  In this ROM the two always match.
- If you change a music track's length, the SFX address word in each song header that uses it
  must change too. That word is the third `dw`: music address + the music blocks' lengths.

# How the game uses the data (read from the code)

Static analysis only (no emulator). Sources: `src/audio/sound_engine.asm` (PlaySong 0x200122,
UploadZ80Driver 0x20035E, SoundIdToCommand 0x2002C8, QueueSoundCommand), `src/audio/sound.asm`
(PlayMusic 0x207759, SoundCommand 0x20776A) and the Z80 driver `src/audio/z80_driver.z80`.
Z80 addresses are driver addresses; main-CPU address = Z80 address + 0x7000.

Labels such as `instr`, `atten`, `pan`, `detune`, `tempo`, `loop`, `call` are working
descriptions of what the handler does, not names from any source. Anything that goes past what
the code does is marked **[inferred]**.

In Biomotor a "group" (the Z80 image of one song) is not one blob in ROM. PlaySong builds it piece
by piece from a song header, the voice records in SoundInit and the track blocks. The streams are
a **bit stream, read MSB first**. That explains the entropy of 7.56: the data is bit-packed, not
compressed and not samples.

## 1. Song table (ROM 0x200E86, 88 B)

- 22 u32 entries: 21 pointers, then 0. They point at 0x200EDE (song 0) through 0x201613 (song
  20). Each target is a **song header** (section 2). The headers are contiguous from 0x200EDE to
  0x201659, with no gaps.
- Reader: only PlaySong: `ld XHL,SongTable; add XWA,XWA; add XWA,XWA; add XHL,XWA; ld XHL,(XHL)`.
  So entry = SongTable + 4*id. There is no bounds check. PlayMusic passes `extz XWA` of WA. Reset
  calls PlaySong with XWA=0 directly.
- The 0 entry: `cp XHL,0; jrl Z,PlaySong.skip3`. That path returns with carry set, after
  ResetSoundState and before touching the Z80. So id 21 is a **"no song"** (a no-op load).
  Nothing walks the table, so the 0 is never used as a terminator. No call site passes 21 (the
  highest id passed is 0x14, section 4). A terminator role in the original tool is possible
  but unproven **[inferred]**.
- PlaySong returns carry clear on success, at the `ld XDE,(XHL+); or XDE,XDE; jr Z,loop5` exit.
  It returns carry set in three cases: a 0 pointer, a voice count of 0, or more than 0x20 tracks
  in one table.

## 2. What PlaySong copies to the Z80

### 2.1 Fixed part (UploadZ80Driver 0x20035E, run by InitSound and on re-upload)
1. It copies the driver to 0x7000. The length is the word at driver+0x8F (0x0AB5). It sets
   0x6334 = 0x7AB5 (group header address).
2. It sets the Z80 pointer to 0x7AB5+6 = 0x7ABB. Then u16 len = (0x200E82) = 2, and it copies
   len bytes from 0x200E84 (`00 03`) to Z80 0x0ABB. It sets 0x6338 = the end (0x7ABD).
   So **SoundInit (0x200E67, 31 B) = 3 voice records (27 B) + u16 2 + 2 bytes**. The last 2
   bytes are the driver's table at Z80 0x0ABB (`Z80CmdTable`, section 3.6). Voice record 2 ends
   `00 00` (ROM 0x200E80-0x200E81); the `02` at 0x200E82 is the low byte of the u16 count.

### 2.2 Per song (PlaySong)
1. It sends 0xFF (driver restart) and waits up to 100 reads for 0xBC == 0. If that fails, it
   re-uploads the driver.
2. It clears the main-CPU track-id tables: 0x62AE (32 x u16, count byte 0x62EE) and 0x62EF
   (32 x u16, count 0x632F).
3. Song header bytes +0..+5 go to Z80 0x0AB5..0x0ABA (`ld BC,6` from 0x6334). Header word +2 + 0x7000
   is also the start address for the track copy (0x633C).
4. u8 nv, then nv voice ids. For each id, it copies `SoundInit + 9*id` (9 B) to the Z80 pointer,
   which starts at 0x6338 = Z80 0x0ABD.
5. Track list entries until a u32 0: `u32 track_ptr, u8 n, n bytes`. For each entry:
   - The track starts with `u16 id`, `u8 E`, then the Z80 block. The 14-bit block length L is
     `u16(track+3) & 0x3FFF`.
   - If id >= 0x7F, and this is the first such id, the table switches from 0x62AE to 0x62EF. The
     id is stored in the current table and its count is incremented. So list order must be all
     music first, then all SFX. All 21 songs follow that order.
   - Copy: E bytes from track+3, then the n list bytes, then the remaining L-E-n bytes of the
     track (the track's own n bytes are skipped: `lda XHL,XHL+WA`). The Z80 block is therefore L
     bytes, with the list bytes patched in at offset E. WA = n here: A is n and W is 0, because
     `djnz A` of the voice loop leaves A=0 and song ids are < 0x100.
   - Blocks are copied back to back from the header's word +2.

### 2.3 Z80 image of a song (example: song 0)
| Z80 | Bytes | From |
|---|---|---|
| 0x0AB5 | 6 | song header +0..+5: voice ptr 0x0ABD, music ptr 0x0AD8, SFX ptr 0x0EF1 |
| 0x0ABB | 2 | SoundInit+0x1D (`00 03`) |
| 0x0ABD | 9*nv | SoundInit records (song 0: ids 0,1,2) |
| 0x0AD8 | sum L | music blocks (id < 0x7F) in list order, then SFX blocks |

For all 21 songs:
- voice ptr = 0x0ABD;
- music ptr = 0x0ABD + 9*nv;
- SFX ptr = music ptr + the sum of the music blocks' L.

The exceptions are songs 18 and 19, which have no SFX entries. Their SFX ptr equals the music ptr
(so in the source it is written as given, not computed). The highest end address is 0x0FFE (songs 5
and 7), so every image fits below Z80 0x1000. That the Z80 RAM is 4 KB is **[inferred]**.

### 2.4 How the song data (ROM 0x200EDE-0x205FA3, 20,677 B) splits
| Range | Bytes | Contents |
|---|---|---|
| 0x200EDE-0x201659 | 1,915 | 21 song headers, in id order (`src/audio/songs.asm`) |
| 0x201659-0x205F9E | 18,757 | 70 track records (u16 id, u8 E, L-byte block), contiguous in address order, no gaps (`src/audio/tracks.asm`) |
| 0x205F9E-0x205FA3 | 5 | `00 1B 00 18 FF`: not reached by any song; no pointer to it in the ROM (no `9E 5F 20`); kept raw (`Unreferenced_205F9E`) |

Tracks are shared between songs. SFX 0x80-0x83 (0x205830-0x205882) are in 19 songs, so a
"group" is a song header plus references, not a ROM range. 22 tracks are music (ids 0x20-0x35)
and 48 are SFX (ids 0x80-0xAF). In every track, the n list bytes equal the track's own
placeholder bytes at offset E, so the patch changes nothing in this ROM.

### 2.5 Per-song contents
| Song | Header | Voices | Z80 hdr words | Music track(s) | SFX ids (Z80 index order) | Z80 end |
|---|---|---|---|---|---|---|
| 0 (0x00) | 200EDE | 0,1,2 | 0ABD 0AD8 0EF1 | 0x20 @201659 (1049 B) | 80-84 | 0F49 |
| 1 (0x01) | 200F12 | 0,1,2 | 0ABD 0AD8 0EE9 | 0x21 @201A75 (1041 B) | 80-83 85-86 | 0F81 |
| 2 (0x02) | 200F4C | 0,1,2 | 0ABD 0AD8 0E3F | 0x22 @201E89 (871 B) | 80-83 87-8D 84 | 0FE4 |
| 3 (0x03) | 200FAC | 0,1,2 | 0ABD 0AD8 0F3B | 0x23 @2021F3 (1123 B) | 80-83 8E-8F | 0FC0 |
| 4 (0x04) | 200FE7 | 0,1,2 | 0ABD 0AD8 0DD6 | 0x24 @202659 (766 B) | 80-83 90-91 | 0E6C |
| 5 (0x05) | 201021 | 0,1,2 | 0ABD 0AD8 0E6A | 0x25 @20295A (914 B) | 80-83 85-86 92-98 | 0FFE |
| 6 (0x06) | 201085 | 0,1,2 | 0ABD 0AD8 0E37 | 0x26 @202CEF (863 B) | 80-83 85-86 92-98 | 0FCB |
| 7 (0x07) | 2010E9 | 0,1,2 | 0ABD 0AD8 0E6A | 0x27 @203051 (914 B) | 80-83 85-86 92-98 | 0FFE |
| 8 (0x08) | 20114D | 0,1,2 | 0ABD 0AD8 0E65 | 0x28 @2033E6 (909 B) | 80-83 85-86 92-98 | 0FF9 |
| 9 (0x09) | 2011B1 | 0,1,2 | 0ABD 0AD8 0E16 | 0x29 @203776 (830 B) | 80-83 85-86 92-98 | 0FAA |
| 10 (0x0A) | 201215 | 0,1,2 | 0ABD 0AD8 0D0C | 0x2A @203AB7 (564 B) | 80-83 95 99-9D 96 9E-A8 98 A9 97 AA-AB | 0FE7 |
| 11 (0x0B) | 2012CF | 0,1,2 | 0ABD 0AD8 0D00 | 0x2B @203CEE (552 B) | same as 10 | 0FDB |
| 12 (0x0C) | 201388 | 0,1,2 | 0ABD 0AD8 0C8D | 0x2C @203F19 (437 B) | same as 10 | 0F68 |
| 13 (0x0D) | 201441 | 0,1,2 | 0ABD 0AD8 0CF7 | 0x2D @2040D1 (543 B) | same as 10 | 0FD2 |
| 14 (0x0E) | 2014FB | 0,1,2 | 0ABD 0AD8 0B70 | 0x2E @2042F3 (152 B) | 80-83 | 0BB7 |
| 15 (0x0F) | 201529 | 0,1,2 | 0ABD 0AD8 0CA2 | 0x2F @20438E (458 B) | 80-83 AC-AE | 0E0E |
| 16 (0x10) | 20156B | 0,1,2 | 0ABD 0AD8 0CDE | 0x30 @20455B (518 B) | 80-83 AC-AE | 0E4A |
| 17 (0x11) | 2015AD | 0,1,2 | 0ABD 0AD8 0E62 | 0x31 @204764 (664 B), 0x32 @2049FF (242 B) | 80-83 AF | 0EC9 |
| 18 (0x12) | 2015E9 | 0,2 | 0ABD 0ACF 0ACF | 0x33 @204AF4 (1319 B) | - | 0FF6 |
| 19 (0x13) | 2015FD | 0,1,2 | 0ABD 0AD8 0AD8 | 0x34 @20501E (1246 B) | - | 0FB6 |
| 20 (0x14) | 201613 | 0,1,2 | 0ABD 0AD8 0E06 | 0x35 @2054FF (814 B) | 80-83 85 90 84 91 | 0EC5 |

Music track ids run 0x20-0x35 in song order. Song 17 has two music tracks; songs 18-20 are
therefore id = song + 0x21.

## 3. Inside a group

### 3.1 Header and command mapping
- The Z80 reads header word +0 at 08E1 (`LD HL,(0x0AB5)`, chip op 2, voices), word +2 at 051A
  (music) and word +4 at 0504 (SFX).
- The main CPU maps a game sound id to a driver command in **SoundIdToCommand** (0x2002C8):
  - W bit 7 set: A is sent as-is, a raw command. Only 0x8086 is used (BattleEnd), which gives
    driver 0x86.
  - WA = 0x7F gives 0x01: stop the music.
  - WA < 0x20 gives 0xC0 + 2*WA (section 3.6).
  - WA 0x20-0x7E: look up the index i in table 0x62AE, giving i*4+3 (play music block i).
  - WA 0x80-0x27F: look up `WA & 0x1FF` in table 0x62EF, giving i*4+2 (play SFX block i).
  - WA >= 0x280: same table, giving i*4+0 (stop SFX i).
  - If the id is not found, carry is clear and QueueSoundCommand drops the command. So a sound
    plays only if the current song loaded its track.
- PlaySong itself never starts playback. Every PlayMusic call site is followed by SoundCommand
  with the music track id (section 4).
- Driver side (0x04FA-0x0522):
  - i*4+3 calls 0x028F (stop all 4 music slots), then starts music block i with priority 0xFF.
  - i*4+1 only stops the music.
  - i*4+2 starts SFX block i in slots 4-7, with priority i.
  - i*4+0 stops the SFX slots whose priority is i (0x04D2 -> 0x0584).
  - 0x86 stops all SFX (0x04D0: L = 0xFF).
- Raw 0x80-0x85 are handled on the main CPU (QueueSoundCommand) as mute bits in 0x62AC. Bit 0
  drops music commands and bit 1 drops SFX commands (CheckSoundCommandBlocked 0x2002B1).

### 3.2 Block layout (driver 0x0522-0x05D4)
```
+0   u16  L | (k-1)<<14      L = block length in bytes including this word; k = 1..4 channel words
+2   k x u16  chan<<14 | off  chan = hardware channel 0-3 (slot = chan + 0 music / + 4 SFX);
                             stream start = address after this word + off
+2+2k  map bytes (n)          instrument map: IX = this address is stored at slot +0x0A/0x0B
...    channel streams and their subroutines (bit streams, section 3.4)
```
- To reach block i, the driver skips i blocks by L (0x052F loop).
- E in the ROM track record is always 2+2k.
- The map length is the gap to the first stream. In all 70 tracks it equals the song-list n.
- For each channel word, slot start (0x0596-0x05D4) works like this:
  - If the slot is busy and the new priority is greater than its +0x09, the new sound is skipped
    on that slot. Lower SFX index wins; equal replaces.
  - Otherwise the driver sets the active bit (0xD2 music / 0xD3 SFX), zeroes the 0x20-byte slot
    and sets the stream pointer (+5/+6).
  - Music sets bit 0 of +8 (start in the main stream).
  - SFX clear bit 0 and set the secondary stream pointer +0x0E/+0x0F = 0x0033. So every SFX first
    runs the 5-byte built-in stream at Z80 0x0033 (`CA 31 0E 00 00` decodes as `pan 8; atten 0;
    ret`), which then returns into the SFX's own stream.
- After a music start, 0x0578 sets the music tempo 0xD4 = 0x78 and clears the accumulator and the fade (0xDA).

### 3.3 Slot RAM (0x00E5 + 0x20*slot, slots 0-3 music, 4-7 SFX; 0x0296/0x0299)
| Off | Use (from the code) |
|---|---|
| +0 | gate countdown: decremented each step; when it reaches 0, chip op 3 with C=0 (key off, 0x02FC-0x0305) |
| +1 | wait countdown (steps until the next event, 0x0309) |
| +2 | last gate value (for `=`) |
| +3..+7 | main stream reader state: bit buffer, bits left, byte pointer, last wait value |
| +8 | bit 0: 1 = main stream, 0 = secondary (subroutine) stream |
| +9 | priority (0xFF music, SFX index) |
| +0A/0B | instrument map pointer |
| +0C..+10 | secondary stream reader state (same 5 fields) |
| +11 | note volume (0-15) |
| +12, +15, +16, +17 | last argument of cmd 0, 1, 2, 3 (restored to the chip by 0x040B when an SFX ends on a channel the music uses) |
| +18 | note: bits 6-4 octave, bits 3-0 semitone |
| +19 | loop depth; +1A..+1F = 2 loop records (u8 count, u16 byte pointer) |

Timing (0x024A): each pass adds 4 * elapsed_ticks * tempo to a 16-bit accumulator. When the sum
reaches 1250 (0x04E2), the driver subtracts 1250 and runs one **step** for the 4 slots of that
group. Tempo bytes: music 0xD4 (set by cmd 6), SFX 0xD7 (0x78 at init 0x01FD; no code changes it).

### 3.4 Stream bit format (per step: 0x02F9-0x0479; reader RST 30h = 0x048F)
- The reader takes n bits MSB first from the byte at the pointer.
- For n > 8 it reads 8 bits, then n-8 bits, and returns them as low byte = first 8 bits and
  high = the rest (0x048F; used by cmd 7).
- A stream starts byte-aligned, because the bit count is 0 when the slot is cleared.

**Event** = `type:1`, then `wait:D`, then the body.

`D` (a duration field, 0x0479) is one of:
- `1`: same as the last value. For the wait this is slot +7 (or +0x10 when the secondary stream is
  active); for the gate it is +2.
- `0 0 vvvv`: a 4-bit value.
- `0 1 vvvvvvvv`: an 8-bit value.

For a command (type 1), a `1` wait means wait 0 and also sets the stored last wait to 0
(0x031A-0x0324). The wait is the number of steps until the next event; 0 means the next event runs
in the same step.

**type 0: note** (0x032E-0x037D)
- `sel:2` (0x032E).
- If sel bit 0 is 0: `ooo` (3 bits, 0x0345: `LD A,3`), the new octave.
- If sel bit 1 is 0: `ssss` (4 bits), the new semitone. sel 3 keeps the note.
- `1`, or `0 vvvv`: keep the volume, or a new volume (+0x11).
- `gate:D`. The value is **added** to +0. A +0 of 0 means no automatic key off.
- If the volume is not 0: chip op 3 (note on), B = the note byte, C = volume. With volume 0 the
  driver updates the state but writes nothing to the chip (0x0378 `RET Z`).
- The frequency comes from 0x070E: `period = word[0x06BD + 2*semitone] >> octave`. The 12-word
  table runs from 0x05BC down to 0x0309, a ratio of 2^(1/12) (equal-tempered semitones). On
  channel 3, op 3 adds 0x30 to the note and writes the period with latch 0x40 to 0x4000
  (0x095A, 0x09E3).

**type 1: command** = `cmd:4`, then an argument of the width given in the table at 0x03E6
(3 bytes per command: arg bits, chip op or handler).

| cmd | Arg bits | Handler | What the code does | Label |
|---|---|---|---|---|
| 0 | 5 | 0x03A4, chip op 2 (0x08E1) | arg -> map[arg] (slot +0x0A) -> voice record at (0x0AB5) + 9*value loaded into the chip channel; stored at +0x12 | instr |
| 1 | 4 | chip op 5 (0x0A10) | chip channel +3 = arg, added to both output attenuations (0x0A80). Ignored while a fade runs (0x03C4: (0xDA) != 0 and op 5) | atten |
| 2 | 4 | chip op 6 (0x0A06) | +4 = byte[0x06D5 + arg] (`0F 06 05 04 03 02 01 00 00 10 20 30 40 50 60 F0`). The low nibble is added to the 0x4000 output and the high nibble to 0x4001 (0x0A93-0x0AB3) | pan **[inferred name]** |
| 3 | 7 | chip op 4 (0x09C1) | +1 = (arg - 0x40) * 2, added to the frequency (0x09CB-0x09E0). **Never used in Biomotor's data** | detune **[inferred name]** |
| 4 | 5 | 0x042E | push a loop record (count = arg, 0 -> 0xFF = forever; pointer = next byte). **Drops the rest of the current byte** (0x045E: bits left = 0) | loop |
| 5 | 0 | 0x0441 | count 0xFF: jump back. Otherwise count-1: 0 pops and continues (mid-byte), else jump back. A jump goes to the saved byte with bits left = 0. Body plays `count` times | endloop |
| 6 | 8 | 0x0472 | (0xD4) = arg (music tempo, even when run on an SFX slot), and (0x01E5) = arg | tempo |
| 7 | 11 | 0x02D4 | target = (pointer to the next unread byte) + arg. Save the main state, switch to the secondary stream at target (byte-aligned), wait := 0. Inside a subroutine, a cmd 7 would overwrite the target with the current pointer, so calls do not nest (0x02DD saves into +0x0C). The data never does this | call |
| 8 | 0 | 0x02EA | clear the secondary bit buffer, return to the main stream (mid-byte), wait := 0 | ret |
| 9-14 | - | - | the table at 0x03E6 has only 9 entries; 0x0401 onward is code. **Not used** | - |
| 15 | 0 | 0x0401 -> 0x040B | stop the slot: chip op 1 (0x0A14 zeroes the chip channel and sets attenuation 15), clear the active bit. If an SFX ends on a channel the music uses, it rewrites the music's +0x12/+0x15/+0x16/+0x17 to the chip (0x0416-0x042D) | end |

While an SFX slot is active on a channel, the music slot of the same channel makes no chip writes
(0x03D0-0x03DB: `(0xD3) AND (0xDD)`).

### 3.5 Voice records (9 B, chip op 2 at 0x08E1; IX = chip channel record 0x0634 + 0x22*ch)
| Byte | What op 2 does with it |
|---|---|
| 0 | bits 7-5: index into 0x06EA (`00 0C 0F 0D 0B 09 07 05`), giving IX+5 (flag bits tested in the tick 0x0A38: bit 0 / bit 2 / bit 3 / bit 6). Bit 4: on channel 3 only, sets bit 2 of the 0xE3 noise-control byte written to 0x4000 (0x072E). Bits 3-0: IX+0x0B, the rate of envelope phase 1 |
| 1 | bits 7-4: IX+0x0C (phase 2 rate). Bits 3-0 * 4: IX+0x0F (the level that ends phase 2, compared at 0x08A4) |
| 2 | bits 7-4: IX+0x0D (phase 3 rate). Bits 3-0: IX+0x0E (phase 4 rate) |
| 3, 4 | modulator A at IX+0x10 (0x091A): byte 3 bits 6-0 -> +4; byte 3 bits 7-5 -> 0x06E5 table (`00 01 02 04 0C ..`), ORed with bit 7, -> +5; byte 3 bits 4-0, ORed with bit 7, -> +6; byte 4 -> +7 (copied to the +8 countdown at note on, 0x07F7) |
| 5, 6 | modulator B at IX+0x19, the same layout. The tick uses A's output for the volume (0x0A49) and B's for the volume or the frequency, depending on flags (0x0A58-0x0A77) |
| 7, 8 | **not read by any traced driver code** (the values are `18 40`, `14 20`, `00 00`) |

- Phase 1 starts at note on (0x098E). Op 3 with volume 0 moves to phase 4 when the envelope is
  active (0x093E-0x094D).
- Reading phases 1-4 as attack, decay, sustain and release, and the modulators as tremolo and
  vibrato, is **[inferred]** from this structure.
- SoundInit records:
  - 0: `3E 2D 08 00 00 00 03 18 40`
  - 1: `2E 2D 06 00 00 00 02 14 20`
  - 2: `0E 2D 08 00 00 00 00 00 00`
- Voice id k selects SoundInit + 9k. Every song uses ids 0-2 only (song 18: 0 and 2).

### 3.6 The 2-byte table at Z80 0x0ABB (from SoundInit+0x1D)
- Command 0xC0+2n (game id n < 0x20) reads entry n at 0x0ABB+2n (`func, arg`), then jumps through
  0x04F6 (func 0 = 0x05FA, func 1 = 0x0054) (0x04DF-0x04F3).
- Biomotor's only entry is `00 03`: func 0 with arg 3. That sets (0xDA) = (0xDB) = 3*0x11 = 0x33.
  0x05E3 counts that down once per pass. At 0 it reloads and runs 0x0605 on the music slots: +0x15
  is incremented, and at 15 the slot stops; otherwise chip op 5 is written. This is a **music
  fade-out**. It ends when no music slot is left (0x05F5).
- Func 1 (0x0054) sets tempo = (0x01E5) * arg * 4 / 256. No entry selects it.
- No immediate SoundCommand with WA < 0x20 was found (section 4).

### 3.7 Counts over all data
- 70 tracks, 520 byte-aligned segments, 8,396 events and 130 subroutines.
- Every channel stream and subroutine ends in one of three ways: cmd 15, ret (cmd 8), or the end
  of a `loop 0` (forever; 56 streams).
- Commands: instr 138, atten 139, pan 70, tempo 48, loop/endloop 246 each, call 330, ret 130,
  detune 0.
- Loop nesting is at most 2, which is the driver's limit (2 records).
- All semitones are 0-11.
- No instr argument is outside its map.
- All padding bits (the end of a segment up to the byte boundary) are 0.
- 8-bit duration values are always >= 16.
- Non-minimal encodings the text keeps (counted in a linear walk, which ignores the state after
  loop jumps and subroutine returns, so approximate): an unchanged octave or semitone nibble is
  resent about 168 times, an unchanged volume about 137 times; instr/atten/tempo carry explicit
  waits 205 times; pan/loop/call/ret always use `1`.

## 4. Song ids at the call sites

Each PlayMusic loads a song (a bank of tracks); then SoundCommand starts the music track.

| Song | Call sites (PlayMusic WA, then SoundCommand track id) |
|---|---|
| 0 | Reset (PlaySong direct, no start); arena ArenaPreDuelGateOpen (then 0x84 SFX), ArenaRoundsComplete, ArenaBattleLost; ArenaDuel6Scene; WorksProtectorShakeToWhite (all + 0x20) |
| 1 | StreetMenuTask, OpenSquareMenu (+0x21) |
| 2 | StartPlaceEntryTalkWorks; TownTalkWindowOpen (x2), WorksProtectorFadeOut (+0x22); TalkGoToWorksRow0, TalkGoToWorksRowE (no start nearby); PlayMusic2 -> CallPlayMusic |
| 3 | StartPlaceEntryTalk (+0x23); PlayMusic3 -> CallPlayMusic |
| 4 | ArenaSceneCmdGenderScene, SetupArenaScreen; StartRhafiacePictureTalk; StorySceneUniticeSetup (+0x24); ArenaPreDuelGate, ArenaPreDuelEnd (no start nearby) |
| 5 + (DUNGEON_ID-1) | PlayDungeonMusic, then SoundCommand 0x25 + (DUNGEON_ID-1). Songs 5-9 share one SFX set (0x85, 0x86, 0x92-0x98: CheckEncounter 0x92/0x94, OpenChest 0x93, CampUseHealItem 0x97/0x98, StartFloorChange 0x85) |
| 0xA-0xD | BattleStart by wEnemyId: < 0x59 -> 0xA; 0x59-0x60 -> 0xC; 0x61 -> 0xD; 0x62-0x75 -> 0xB; >= 0x76 -> 0xC (track = 0x20 + song, via `push BC / pop WA`). Songs 10-13 load the battle SFX 0x95-0xAB, the range PlayBattleEffect sends from (XHL+1) |
| 0xB | also ArenaDuelTitleSlideIn (then 0xA0 SFX) |
| 0xE | PlayEncounterMusic, BossBattleIntro (+0x2E) |
| 0xF | BattleVictory (+0x2F; BattleVictory.loop sends SFX 0xAC) |
| 0x10 | BattleDefeat, StorySceneTheEnd (+0x30) |
| 0x11 | IntroSequence (SoundCommand 0x31; SFX 0xAF also sent by IntroSequence); TitleRevealSequence sends 0x32 |
| 0x12 | StorySceneDestructionSetup 0x20F179 (+0x33) |
| 0x13 | CreditsScreen (+0x34) |
| 0x14 | MainMenuSetup, SelectPlayerTask, WorldMapOpen (+0x35) |

Other SoundCommand values:
- 0x7F (stop music) and 0x8086 (raw 0x86, stop all SFX) in BattleEnd.
- SFX 0x80 (73 sites), 0x81 (35), 0x82 (35) and 0x83 (8) are menu-side callers, in every song but 18 and 19.
- 199 SoundCommand call sites in all.

## 5. Not checked

These would need the emulator:
- what the chip ops sound like;
- the tick rate, and so real tempos;
- which output 0x4000 and 0x4001 are.
