# Biomotor's Z80 sound driver

Analysis of the Z80 sound driver in Biomotor (`src/audio/z80_driver.z80`, Z80 source of 2,741 bytes
at ROM 0x2003B2, sha256 a675ebd7...57eb), moved here from unitron's docs/Z80_PLAN.md on 2026-11-25 (user:
Biomotor-specific things live in the decomp; unitron keeps only generic Z80 tooling and findings).
Addresses are this version of the driver. The driver is shared (the same bytes are the homebrew
template's `NeoTracker_Driver[]`, and SNK vs. Capcom has another version), so the interface parts may
hold for other games too; unitron's docs/Z80_PLAN.md and docs/z80.md have the generic side.

Tools: `unitron z80 dis src/audio/z80_driver.bin --hints src/audio/z80_driver.hints` (listing) and
`-o DIR` (source that assembles back to the same bytes); `unitron z80 roundtrip`. Sources are cited as
in unitron's plan: `Doc l.N` = `ngpc-project-template/official-docs/Doc/Doc.md`; "template" =
`ngpc-project-template/` (homebrew: evidence, not a source).

## 1. What the code shows (evidence, not a source)

These facts come from reading the driver, the template's main-CPU code and the decomp's
main-CPU code. All three agree. They explain how the parts work together, but none of them names
anything.

| Point | Main-CPU side | Z80 side (the driver) |
|---|---|---|
| Stop the Z80, upload, start it | Word write 0xAAAA to 0xB8, copy the driver to 0x7000, then word write 0x5555 to 0xB8 (template library.c l.823-829; decomp sound_engine.asm l.7-10, 148-162) | It starts at Z80 0x0000: `DI; LD SP,0x00C0; JP 0x01E6` |
| Address mapping | Main 0x7000+n is Z80 n (the upload goes to 0x7000 and the Z80 starts at 0) | |
| Command byte | Write the command to 0xBC, then write 1 to 0xBA (library.c l.878-879, 886-887, 893-894; sound_engine.asm l.103-106, 137-138) | The NMI handler at 0x0066 reads Z80 0x8000, stores the value in a 16-entry ring at 0x00C0, writes it back XOR 0xFF to 0x8000, and ends with `RETN` |
| So 0xBC is shared | The main CPU then reads 0xBC and expects the complement (sound_engine.asm l.94-97, 23-24) | Z80 0x8000 is the same byte as main 0xBC |
| So 0xBA raises the NMI | Every command write is followed by a write to 0xBA | The handler at 0x0066 is the only consumer of 0x8000 |
| Tick timer | Timer 3 at fT1, TREG3 = 0x62, TFFCR \|= 0xB0 (TFF3 cleared, inverted by timer 3), TRUN = 0x88 (library.c l.831-837; decomp sub_20032F computes the same 0x62 from 2000) | `IM 1` at 0x01E6, so each Z80 interrupt runs 0x0038 |
| Interrupt at 0x0038 | | `EX AF,AF'; INC A; OUT (0xFF),A`: it counts ticks in A' and writes the count to port 0xFF |
| Other write | | `LD (0xC000),A` once during init (0x0205); purpose unknown |
| Sound chip | | Writes go to memory addresses 0x4000 and 0x4001, in the SN76489-style latch format (`1 cc t dddd`). Tone and volume bytes go to both addresses with different volumes, and noise goes to 0x4000 only. This looks like a two-output (stereo) chip |
| Acknowledge | It waits for the byte at 0x70DE to change (library.c l.29, 866-870; mplayer_c/music.c l.41-45) | Z80 0x00DE holds the last tick count the main loop handled. A change means the driver loop is running |

**Not covered by any source:**
- what 0xB8 and 0xB9 do separately (both programs write the word 0xAAAA or 0x5555);
- whether a read of 0xBA also raises the NMI;
- what the Z80's port 0xFF and its address 0xC000 do (probably the "Interrupt From Z80" path, but unproven);
- the sound chip's name, registers and clock;
- the rest of the Z80 memory map (mirrors, unmapped areas);
- which TO3 edge interrupts the Z80, and so the tick rate.

The rate is unclear because the sources disagree. The SNK 8Bit table gives fT1 = 20.83 µs, so
TREG3 0x62 would mean one match every 2.04 ms. A homebrew comment says fT1 is 1.302 µs and the
rate "about 7800/sec" (mplayer_c/music.c l.19-22), which would be fT1 = 8/6.144 MHz. None of this
blocks the tools; it matters only for the documentation.

## 2. Its RAM and where it sits

- **RAM inside the image.** The driver's variables live inside its own image: it zeroes
  0x00C0-0x01E5 at start (`RST 0x18` at 0x01F9 with HL=0x00C0, BC=0x0125). The source writes this
  area as `ds 0x126`, filled with zeros, so the bytes still match.
- **Where the bytes sit in the cartridge doesn't matter to the Z80.** Biomotor stores them at ROM
  0x2003B2, and the main CPU copies them to 0x7000.

## 3. Into this decomp's build

**Done 2026-11-25:** `src/audio/z80_driver.z80` is the source (written once by `unitron z80 dis`
with the hints, byte-identical); the Makefile rule `build/audio/%.z80.asm <- unitron z80 asm --db`
makes the db lines main.asm includes at `Z80Driver`. The plan as it was:

The decomp already does the last two steps: Makefile rule `build/P.asm <- unitron bin2db`,
src/main.asm l.35-36 (`Z80Driver:` then `$include "build/src/audio/z80_driver.bin.asm"`).
The Z80 step goes in front of them:

```
audio/z80_driver.z80  --unitron z80 asm-->  build/audio/z80_driver.bin
                      --unitron bin2db-->   build/audio/z80_driver.bin.asm
main.asm:  Z80Driver:  $include "build/audio/z80_driver.bin.asm"   (stored anywhere in ROM)
main CPU code copies Z80Driver to 0x7000 at run time
```

`unitron z80 asm --db` can skip the bin2db step. `--equ` lets main-CPU code use driver labels
instead of literal numbers: `ld A,(Z80_TICK_SEEN)` instead of `(0x70DE)`. Those names are labels
in the Z80 source the game owns, not hardware names, so the hwnames rule doesn't apply to them.

## 4. Tracing it

### 4.1 Entry points

These come from a trace with a scratch Z80 decoder (in /tmp, not in any repo). unitron's own
disassembler has to confirm them.

| Z80 address | Kind (Zilog) | What it does |
|---|---|---|
| 0x0000 | reset | `DI`, SP = 0x00C0, jump to 0x01E6 |
| 0x0008, 0x0018, 0x0020, 0x0028, 0x0030 | `RST n` helpers | 08: dispatch through the jump table at 0x08D3. 18: zero-fill HL..HL+BC. 20: load (0x00DC) - 4. 28: HL += A. 30: jump to 0x048F. (0x0010 is reached through `RST 0x10`) |
| 0x0038 | IM 1 interrupt (from TO3) | Tick: A' += 1, then `OUT (0xFF),A`, `EI`, `RETI` |
| 0x0066 | NMI (from main 0xBA) | Reads the command from 0x8000 into the ring, writes the complement back. A command of 0xFF calls 0x062C, which pushes 0 and does `RETN`, so the driver restarts at 0x0000 |
| 0x01E6 | init | `IM 1`, silences the chip (`RST 0x08` loop), clears RAM, `EI`, `LD (0xC000),A` |
| 0x0208 | main loop | Takes commands from the ring (0x04FA). Compares the tick count in A' with 0x00DE and runs the channel updates (0x024A) once per tick |
| 0x08D3 | jump table | 7 valid entries (0x0A24, 0x0A14, 0x08E1, 0x093E, 0x09C1, 0x0A10, 0x0A06), indexed by the low nibble of the command written to the chip |

The trace from 0x0000, 0x0038, 0x0066 and the 7 jump table targets covers 1,961 of the 2,741 bytes.
The rest:
- 0x0080-0x0090: an ID block. It starts with ASCII "K1", and its word at 0x008F is 0x0AB5,
  which Biomotor's main CPU reads to find the end of the driver (sound_engine.asm l.385).
- 0x00C0-0x01E5: the zeroed RAM.
- tables (0x04F6 and 0x0584 are used by computed jumps).
- code reached only through computed jumps.

`--hints` (`code ADDR NAME`, `data START END`, as on the main CPU) covers these cases.

**Confirmed with unitron's own tracer (2026-11-25).** From 0x0000, 0x0038 and 0x0066 alone it
finds 637 instructions (1,049 bytes). With 8 `code` hints (the 7 jump table targets above plus
0x0010) it finds 1,149 instructions covering 1,961 bytes. That is the same count as the scratch
trace. The hints file is our own analysis (addresses and names only). It is Biomotor-specific, so
it lives in the decomp (untracked there for now): `biomotor-unitron/src/audio/z80_driver.hints`.

### 4.2 The command byte

This is the same protocol in the template (library.c l.874-894), NGPConv (mplayer_c/music.c
l.28-58) and Biomotor (sound_engine.asm dyn_2002C8/dyn_2002E5). The driver decodes it at 0x04FA.

| Value | Meaning | Evidence |
|---|---|---|
| `n*4 + 3` | Play music n | library.c l.876; driver: bit 0 set and bit 1 set, using the music pointer at 0x0AB7 |
| `n*4 + 2` | Play sound effect n | library.c l.884; driver: bit 0 clear and bit 1 set, using the SFX pointer at 0x0AB9 |
| `n*4 + 1` (Biomotor sends 0x01 for song 0x7F) | Probably stop the music: the driver calls 0x028F and returns | driver 0x0511-0x0517; decomp dyn_2002C8 |
| `n*4 + 0` | A per-channel command (0x04D2) | driver; meaning not traced |
| 0x86 | Special (0x04D0) | driver 0x04DF |
| 0x80-0xFE otherwise | Takes a 2-byte entry from a table at 0x0ABB (Biomotor forms 0xC0 + 2n for n < 0x20) | driver 0x04E3-0x04F3; meaning OPEN |
| 0xFF | Restart the driver (the acknowledge reads back as 0x00). The main CPU re-uploads if 0xBC is still not 0 after 100 reads | driver 0x0066/0x062C; library.c l.849-860; sound_engine.asm l.137-162 |

Biomotor also handles 0x80-0x85 on the main CPU (a channel mask at 0x62AC; sound_engine.asm l.29)
and keeps its own 16-entry queue. That is game behavior, so it stays in the decomp.

## 5. Music data: what this version shows

Fully read from the code in `evidence/songs_2026-11-25.md`; the data is now source (docs/SONGS.md).
- **There is no "group" blob in Biomotor's ROM.** PlaySong (0x200122) builds the Z80 image at
  0x0AB5 piece by piece: the song header's three Z80 pointers (voice records, music blocks, SFX
  blocks; read by the driver at 0x0AB5/0x0AB7/0x0AB9), UploadZ80Driver's 2-byte table at 0x0ABB
  (`Z80CmdTable`, commands 0xC0+2n), the 9-byte voice records (`SoundInit` + 9*id, chosen by the
  song header), then the track blocks the header lists, back to back. Tracks are shared between
  songs (SFX 0x80-0x83 are in 19 of the 21 songs).
- A block is `u16 L | (k-1)<<14`, k channel words `chan<<14 | offset`, the instrument map, then
  the channel streams (driver 0x0522-0x05D4). The streams are **bit streams read MSB first**
  (reader RST 30h = 0x048F): notes (octave, semitone, volume, wait, gate) and commands 0-8 and 15.
  That is why the entropy is 7.6: the data is bit-packed, not samples and not compressed.
- Source: `src/audio/songs.asm` (song table and headers), `src/audio/sound_init.asm` (voice
  records), `src/audio/tracks/*.song` (built by tools/biosong).
- Not checked (would need the emulator): what the chip ops sound like, the tick rate, and so
  the real tempos.

## 6. The SNK vs. Capcom driver (another version of the same driver)

These facts come from unitron's own traces of both drivers (`z80 dis` from the three vectors, no
hints) and from `unitron dis` of the SNK vs. Capcom ROM. They are addresses and descriptions only;
no driver bytes are recorded here.

**Where it is and how it gets uploaded.** The driver is at ROM file offset 0x19C77C (cartridge
0x39C77C) and is 2,549 bytes long (Z80 0x0000-0x09F4). The main CPU finds that length the same
way as Biomotor's: from the word at Z80 0x008F of the driver, which holds the driver's end
address (Biomotor: 0x0AB5 = 2,741). The main CPU's upload code:
- At 0x3ABB0E it does three things in order:
  - writes the word 0xAAAA to 0xB8 (stop the Z80);
  - calls 0x3ABD4F (the copy) and then 0x3AB966;
  - writes the word 0x5555 to 0xB8 (start).
  Then 0x3ABD8D waits for the byte at 0x70C3 (Z80 0x00C3) to change, counting down from
  0xFFFFFFFF. On a timeout it repeats the whole upload. This is the same 0xAAAA/0x5555 protocol as
  Biomotor and the template (section 1.3), with a different acknowledge byte (Biomotor: 0x70DE).
- 0x3ABD4F copies from 0x39C77C to 0x7000, with the word at source+0x8F as the length (the `ldir`
  is in 0x3ABD13). It stores 0x7000 + length (0x79F5, where the music group goes) at 0x6883. It
  then copies a second small block: the length is the word at 0x39D459 and the data follows it,
  6 bytes after the group address.
- 0x3ABB3B takes a group pointer from a table at 0x39D45D and adds 0x7000 to its first two words.
- 0x3ABD20 sets up timer 3 the same way as the template and Biomotor (T23MOD, TFFCR |= 0xB0,
  TRUN |= 0x88). It computes TREG3 from a rate (times 1000, divided by 0x5000).

**The same in both versions:**
- The reset stub (DI, SP = 0x00C0, jump to init).
- The tick handler at 0x0038: the same seven instructions, including `OUT (0FFH),A`.
- The NMI at 0x0066: it reads the command at 0x8000 into the ring, writes the complement back, and
  ends with `RETN`.
- The `RST 18H` zero-fill, `RST 20H` ((variable) - 4) and `RST 28H` (HL += A) helpers.
- The init sequence: `IM 1`, silence the chip, clear RAM, clear the tick count in A', `EI`, then
  the write to 0xC000.
- The ID block at 0x0080, which starts with "K1", with the end pointer at 0x008F.
- In order, 294 of Biomotor's 637 traced instructions line up with SNK's when the address
  operands are ignored. The longest runs (Biomotor / SNK):
  - 0x000D-0x003F / 0x0017-0x003F (the helpers and the tick handler);
  - 0x01FF-0x0228 / 0x0262-0x028B (end of init, start of the main loop);
  - 0x0308-0x032C / 0x0316-0x033A;
  - 0x048A-0x04B5 / 0x053A-0x0565;
  - 0x04BB-0x04CF / 0x0568-0x057C;
  - 0x052C-0x0543 / 0x0602-0x0619;
  - 0x0554-0x056D / 0x0666-0x067F;
  - 0x0571-0x0596 / 0x0687-0x06A7.

**What differs:**

| | Biomotor | SNK vs. Capcom |
|---|---|---|
| Size (end pointer at 0x008F) | 2,741 (0x0AB5) | 2,549 (0x09F5) |
| Init, main loop | 0x01E6, 0x0208 | 0x024B, 0x026B |
| RAM cleared at start | 0x00C0-0x01E5 | 0x00C1-0x0242 |
| Variables below 0x00C0 | none seen | yes (0x000B, 0x000E, 0x007E) |
| Variable read by `RST 20H` | 0x00DC | 0x007E |
| `RST 08H` | a chip-write routine (0x08C2) dispatching through the jump table at 0x08D3 | a jump to 0x035A |
| Silencing the chip at init | through `RST 08H` | direct writes to 0x4000 and 0x4001 (volume off, four channels) |
| NMI | complements with `XOR 0FFH`, calls 0x062C only for command 0xFF | complements with `CPL`, always calls 0x057D |
| `RST 30H` | jump to 0x048F | jump to 0x053F |
| Group header words read by traced code | 0x0AB7, 0x0AB9 and the table at 0x0ABB | 0x09F7 and the table at 0x09FB |
| ID block (0x0080-0x0090) | | differs at 0x0082, 0x0088, 0x008A, 0x008E and in the end pointer |
| Main-CPU acknowledge byte | 0x70DE | 0x70C3 |

**What this says about the author.** These are two builds of one driver family. They have a
different RAM layout, different code for writing the chip and different command handling. The
hardware is the same: both write the same chip through the same two addresses (0x4000, 0x4001) in
the same format, and both use the same
interface (the 0xB8 upload protocol, the NMI command byte at 0x8000, the "K1" ID block with its end
pointer, the group header right after the driver). SNK vs. Capcom is SNK's own game, so finding a
version of the driver there makes it likely that it came from SNK rather than from Biomotor's
developer. It is not proof: a shared driver could have travelled the other way, and no SNK
document names it. The byte at 0x0082 might be a version number (it differs between the two), but
that is unproven.
