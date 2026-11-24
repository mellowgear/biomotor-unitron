# Biomotor Unitron (NGPC) — disassembly

Rebuilds the original ROM byte-for-byte from assembly source.

```sh
make        # assemble src/game.s -> biomotor.ngp, then check sha1 against roms.sha1
make regen  # regenerate src/ from the original ROM (overwrites src/)
make c      # regenerate the lifted C in c/
```

See SETUP.md for setting up from scratch (Python environment, ROM placement, regenerating everything).

The original ROM is expected at `baserom.ngp` (not included).

## Layout

| Path | What it is |
|---|---|
| `src/main.s` | Top level: includes every piece in ROM order |
| `src/home/` | Cartridge header |
| `src/audio/` | Sound engine (main-CPU code), Z80 driver, song table, song data (still raw) |
| `src/engine/` | Game code, one file per contiguous code region |
| `src/gfx/tiles/` | 149 compressed tile sheets as indexed PNGs (pieces of pictures; maps arrange them) |
| `src/gfx/monsters/` | 93 monster images in colour, named after their enemy; the PNG palette is the monster palette |
| `src/gfx/parts/` | 235 robot-part images (grey shades + transparency; the robot's palette colours them) |
| `src/gfx/maps/`, `src/gfx/pal/` | 164 tile maps, 163 palette files |
| `src/gfx/pictures/` | Previews only: portraits and screens, verified against the emulator |
| `src/text/` | 174 text banks as editable `.txt` |
| `src/tables/` | Game database as editable tables: enemies, enemy attacks, attack names, skills, items, robot parts, enemy scaling, EXP and level-up tables |
| `GAME_DATA.md` | Generated player reference: enemy stats, rewards, battle and level formulas (`tools/game_data.py`) |
| `src/data/` | 366 blocks not identified yet (named by address) |
| `assets.json` | Every asset: address, slot size, kind, source file |
| `symbols.txt` | Human-readable names for routines and tables |
| `tools/` | Game-specific extract/build/render tools |
| `c/game.c` | Lifted C (956 functions). Compiles; not yet run |
| `emu/` | Emulator coverage and loader-call logs used for discovery |

Modding: edit a PNG / `.txt` / palette, run `make`. Unedited files rebuild the original bytes
exactly. An edit must still fit its original slot for now (the ROM is not shiftable yet).

## How the code was found

## Status

- Rebuild: byte-identical (`make` passes the sha1 check). The rebuilt ROM runs in the
  emulator with identical coverage and screenshots over 60 s.
- Code region coverage: about 73% decoded as instructions. The remaining ~33 KB is mostly
  data tables. About 960 KB outside the code region is data and is still opaque `.bin` blocks.
- Not yet shiftable: data is referenced by absolute numbers, not labels, so inserting
  bytes would break the game.
- Next: identify the data blocks (tile graphics to PNG, compressed data via the game's
  own decompressor, text, the Z80 sound driver).
