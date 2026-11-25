# Biomotor Unitron (Neo Geo Pocket Color) — disassembly

A disassembly of *Biomotor Unitron* (Yumekobo / SNK, 1999) that rebuilds the original ROM byte for
byte from editable source: TLCS-900 assembly, PNG graphics, text files and data tables. Its style
and approach are heavily influenced by the awesome [pokered](https://github.com/pret/pokered): read
how the game works, change it, rebuild.

This repo holds only the game. The assembler and converters are a separate, general NGPC toolchain,
**unitron**.

| | unitron (toolchain) | this repo (the game) |
|---|---|---|
| What | assembler for Toshiba's asm900 syntax, disassembler, macro preprocessor, LZSS, graphics and tile-map converters, NGPC hardware names | asm source, PNGs, text, tables, Makefile, converters for this game's own formats (`tools/`) |
| Used by | any NGPC decomp or homebrew | Biomotor Unitron only |

## Building

You need [unitron](https://github.com/mellowgear/unitron), a C++17 compiler, CMake and `make`.
No Python, and not the original ROM, which is not included and never will be.

### 1. unitron

On macOS you need the Xcode command-line tools (`xcode-select --install`) and CMake
(`brew install cmake`).

```sh
git clone https://github.com/mellowgear/unitron
cmake -S unitron -B unitron/build -DCMAKE_BUILD_TYPE=Release && cmake --build unitron/build
```

Put `unitron/build/unitron` on your PATH, or pass it to make each time.

### 2. Build the ROM

```sh
make                                          # unitron on PATH
make UNITRON=/path/to/unitron/build/unitron   # or point to it
```

What `make` does:

0. Builds this game's own converters (`tools/biogfx`, `tools/biosong`) with plain `c++`.
1. Converts each editable asset into the bytes the game expects: PNG -> tiles (with the game's
   LZSS compression), map files -> map data, text and the text tables -> the game's character
   codes (`unitron text`). Each result becomes `db` lines (`unitron bin2db`), since asm900 has no
   binary include. Palettes and numeric tables are asm900 source already (`dw`/`db` lines and
   records), so they need no step. Only what changed is rebuilt.
2. Assembles `src/main.asm` and everything it includes into `biomotor.ngp` (`unitron asm`).
   It is one unit of about 1,500 `$include`s. Toshiba's own asm900 allows 99 per unit, so unitron
   prints a warning about it; the build is fine. Building with the original asm900 would need the source
   split into separately assembled modules.
3. Compares the SHA1 with the original. Unedited sources print `biomotor.ngp: OK`; after a mod a
   mismatch is expected.

The first build compresses every graphic (about half a minute on 8 cores; `make` runs in
parallel by itself); after that only changed files are rebuilt.

### 3. Optional: compare with your original ROM

Put your own copy of the ROM in this folder as `baserom.ngp` (`*.ngp` is ignored by git), or
point to it:

```sh
shasum -a 1 baserom.ngp     # macOS (sha1sum on Linux); expected ff74d5877bf58164419710888923e46b9cfb415e
make compare
make compare BASEROM=/path/to/your/rom.ngp
```

`make compare` lists the first differing bytes (offset, original, yours) or says the two match.

docs/ASSETS.md explains how assets are declared and built.

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
- **Code:** `src/engine/**`. Routines by subsystem (docs/FILING.md: which file holds what), named where the code or play proves the name.

Every routine and data piece stays at its original ROM address (each section is `abs=` its
address, by design), so an edit must fit in the space of the original. If it grows too big, the
assembler stops and names both clashing pieces.

## Layout

| Path | What it is |
|---|---|
| `src/main.asm` | Top level: constants, RAM names, then every code and data file |
| `src/home/` | Cartridge header, system code |
| `src/engine/` | Game code by subsystem, one level deeper: `battle/` (init, calc, menu, player_turn, enemy_turn, effects, status, tasks, end), `dungeon/` (core, load, map, encounter, chests, camp, boss, world_map), `arena/` (scenes, entry, opponents, duel), `gfx/` (palettes, tiles, tilemap, sprites, window, portraits, robot), `menus/` (main_menu, new_game, save, menu_helpers, print, `works/`, `shop/`, `town/`), and events, scenes, text, tables, player; one line per file in docs/FILING.md |
| `src/audio/` | Sound engine (main CPU), Z80 sound driver (Z80 source, `unitron z80 asm`), song table, song headers and voice records (asm), the 70 tracks as text (`tracks/*.song`, tools/biosong; docs/SONGS.md) |
| `src/constants/`, `src/macros/`, `src/ram/` | `.inc` files: hardware names (cited), struct fields, joypad, event flags, item ids; the `task_wait` macro and the table record macros; work-RAM names |
| `src/gfx/` | Tile sheets, monster images, robot parts, battle-effect sheets and frames, dungeon tiles, tile maps, palettes |
| `src/maps/dungeon/` | The 57 dungeon floor maps |
| `src/text/` | All dialogue and menu text |
| `src/data/<subject>/` | The game database by subject: one file per table part (asm900 records, or text slot files), `tables.asm` / `pointers.asm` per subject; also the dungeon and battle-effect containers, the save area |
| `src/data/unknown/` | The data blocks not identified yet (`unknown.asm` + one `.bin` each; 3 blocks, 47 bytes, no reader found) |
| `tools/` | Converters for this game's own formats |

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
- Unidentified data: 3 blocks, 47 bytes (`src/data/unknown/`), with no reader found in the code.
- Pinned by design: every piece keeps its original address (no relocation, no shifting).
- 16 routines still have address names (`sub_`/`swp_`).
