# Songs: the track text format (src/audio/tracks/*.song)

The game's music and sound effects are 70 **tracks**. Each one is a text file
`src/audio/tracks/track_XX.song` (XX = the track id in hex). `make` turns each file into the bytes
of its track record with `tools/biosong` (built from `tools/biosong.cpp`). `src/audio/tracks.asm`
puts each record at its ROM address. The format was read from the code (PlaySong 0x200122 and the
Z80 driver); see `evidence/songs_2026-11-25.md`. Nothing here was checked by ear or in the emulator.

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
