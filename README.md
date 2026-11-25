# Biomotor Unitron (Neo Geo Pocket Color) — disassembly

A disassembly of *Biomotor Unitron* (Yumekobo / SNK, 1999) that rebuilds the original ROM byte for
byte from editable source: TLCS-900 assembly, PNG graphics, text files and data tables. In the
spirit of [pokered](https://github.com/pret/pokered): read how the game works, change it, rebuild.

This repo holds only the game. The assembler and converters are a separate, general NGPC toolchain,
**unitron**.

| | unitron (toolchain) | this repo (the game) |
|---|---|---|
| What | assembler for Toshiba's asm900 syntax, disassembler, macro preprocessor, LZSS, graphics and tile-map converters, NGPC hardware names | asm source, PNGs, text, tables, Makefile, converters for this game's own formats (`tools/`) |
| Used by | any NGPC decomp or homebrew | Biomotor Unitron only |
| Licence | MIT | see LICENSE |

## Building

You need unitron, a C++17 compiler (for this game's tools in `tools/`), `make`, and your own copy
of the ROM. `make` runs no Python; Python 3.10+ is needed only for `make ram`
and the analysis tools in `tools/`. The ROM is not included and never will be.

```sh
# 1. toolchain: unitron (C++, CMake) next to this repo, and Python for tools/
cmake -S unitron -B unitron/build && cmake --build unitron/build
python3 -m venv .venv && pip install -r tlcs900/requirements.txt
#    (unitron elsewhere: make UNITRON=/path/to/unitron)

# 2. your ROM, checked against the original
cp /path/to/your/biomotor.ngp baserom.ngp
sha1sum baserom.ngp   # ff74d5877bf58164419710888923e46b9cfb415e

# 3. build
make            # -> biomotor.ngp, then "biomotor.ngp: OK" if it matches the original
```

What `make` does:

1. Converts each editable asset into the bytes the game expects: PNG -> tiles (with the game's
   LZSS compression), map files -> map data, text and the text tables -> the game's character
   codes (`unitron text`). Each result becomes `db` lines (`unitron bin2db`), since asm900 has no
   binary include. Palettes and numeric tables are asm900 source already (`dw`/`db` lines and
   records), so they need no step. Only what changed is rebuilt.
2. Assembles `src/main.asm` and everything it includes into `biomotor.ngp` (`unitron asm`).
3. Compares the SHA1 with the original. Unedited sources print `biomotor.ngp: OK`; after a mod a
   mismatch is expected.

SETUP.md has the full setup (Python environment for the analysis tools); docs/ASSETS.md explains how assets are declared and built.

## Modding

Edit a PNG, a text file, a table or an assembly routine, then run `make`.

- **Graphics:** `src/gfx/**.png`. Indexed PNGs; keep the palette indices. Monster PNGs also carry the
  monster's palette.
- **Text:** `src/text/*.txt`. Dialogue in plain words with codes like `<PLAYER>` and `<WAIT>`
  (`src/text/charmap.txt`). asm900 has no character map, so the build turns each bank into `db`
  lines with `unitron text`.
- **Game data:** `src/data/<subject>/` (items, parts, works, battle, player, dungeon, arena, story,
  town, shop, graphics, help), one file per ROM part of a table, `#include`d from that subject's
  `tables.asm`. Enemies, items, robot parts,
  skills, development recipes, arena brackets, chests, EXP. Numbers are asm900 records (`.asm`:
  `db`/`dw`/`dd` lines, or a record macro from `src/macros/tables.inc`), one line per id, the name
  in a comment; prices are BCD, written `dd 0x650000` for 650000. Names and descriptions are text
  files (`.txt`) with a `slot 7 FF` line, built by `unitron text`. Each file's header says how
  the game reads it.
- **Palettes:** in `src/gfx/palettes.asm` at their labels: `dw` lines of 4 colours (0x0BGR) for colour
  palettes, `db` lines for the mono ones.
- **Code:** `src/engine/**`. Routines by subsystem, named where the code or play proves the name.

Every routine and data piece stays at its original ROM address (each section is `abs=` its
address, by design), so an edit must fit in the space of the original. If it grows too big, the
assembler stops and names both clashing pieces.

## Layout

| Path | What it is |
|---|---|
| `src/main.asm` | Top level: constants, RAM names, then every code and data file |
| `src/home/` | Cartridge header, system code |
| `src/engine/` | Game code by subsystem: battle, dungeon, arena, events, menus (title, town, shop, works), scenes, gfx, text, tables, player |
| `src/audio/` | Sound engine (main CPU), Z80 sound driver (Z80 source, `unitron z80 asm`), song table, song headers and voice records (asm), the 70 tracks as text (`tracks/*.song`, tools/biosong; docs/SONGS.md) |
| `src/constants/`, `src/macros/`, `src/ram/` | `.inc` files: hardware names (cited), struct fields, joypad, event flags, item ids; the `task_wait` macro and the table record macros; work-RAM names |
| `src/gfx/` | Tile sheets, monster images, robot parts, battle-effect sheets and frames, dungeon tiles, tile maps, palettes |
| `src/maps/dungeon/` | The 57 dungeon floor maps |
| `src/text/` | All dialogue and menu text |
| `src/data/<subject>/` | The game database by subject: one file per table part (asm900 records, or text slot files), `tables.asm` / `pointers.asm` per subject; also the dungeon and battle-effect containers, the save area |
| `src/data/unknown/` | The data blocks not identified yet (`unknown.asm` + one `.bin` each; 9 blocks, 263 bytes, no reader found) |
| `tools/` | Converters for this game's own formats |
| `symbols.txt`, `ram.txt` | Names for routines, tables and RAM; evidence tags `[code]` / `[play]` |
| `GAME_DATA.md` | Generated player reference: stats, rewards, formulas |

## How it was made

- **Code:** traced statically from the cartridge entry point and the interrupt handlers it
  installs, plus coverage from play. Unclear gaps were decoded only when they decode cleanly.
  Routines still named `sub_`/`swp_` + address are unnamed, and `swp_` is the least certain.
- **Data:** each format is read from the game's own loader routines and checked by rebuilding the
  original bytes. The LZSS compressor reproduces every original stream.
- **Names:** come only from what the code demonstrably does or what is seen on screen. Hardware
  names follow Toshiba's TMP95C061 register header and SNK's 1998 NGPC developer manuals, cited
  per name (via unitron).
- **Assembly language:** Toshiba's asm900 (abs sections, `db`/`dw`/`dl`, `equ`, `$include`, the
  `?macro` preprocessor), as unitron assembles it. One section per routine or data piece, at its
  ROM address. Where the ROM's encoding is not the default one, the instruction carries asm900's
  `:n` width (45 places, listed in `tools/widths.txt`).

## Status

- Byte-identical rebuild.
- Unidentified data: 116 blocks, about 46 KB of the 1 MB ROM. These are mostly accessor tables,
  event scripts and the song data.
- Pinned by design: every piece keeps its original address (no relocation, no shifting).
- About 1,250 routines still have address names.
