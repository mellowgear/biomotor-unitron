# Biomotor Unitron (Neo Geo Pocket Color) disassembly

A disassembly of *Biomotor Unitron* (Yumekobo / SNK, 1999) that rebuilds the original ROM byte for
byte from editable source: TLCS-900 assembly, PNG graphics, text and data tables. In the spirit of
[pokered](https://github.com/pret/pokered).

The assembler and converters live in a separate NGPC toolchain,
**[unitron](https://github.com/mellowgear/unitron)**. The ROM is not included.

- Biomotor Unitron: `sha1: ff74d5877bf58164419710888923e46b9cfb415e`

## Building

You need a C++17 compiler, CMake and `make` (macOS: `xcode-select --install`, `brew install cmake`).

```sh
git clone https://github.com/mellowgear/unitron
cmake -S unitron -B unitron/build -DCMAKE_BUILD_TYPE=Release && cmake --build unitron/build

make UNITRON=/path/to/unitron/build/unitron   # or just `make` with unitron on PATH
make compare                                  # fail unless the SHA1 matches (CI)
```

The first build compresses every graphic (about half a minute); later builds only redo what
changed. unitron warns that the single unit has more than asm900's 99 `$include`s; that is expected.

## Modding

Edit, then `make`. Every piece stays at its original address, so an edit must fit in the original
space; the assembler names both pieces if something overlaps.

| What | Where |
|---|---|
| Graphics | `src/gfx/**.png` (indexed; keep the palette indices) |
| Palettes | `src/gfx/palettes.asm` |
| Text | `src/text/*.asm`, charmap `src/text/charmap.txt` |
| Game data | `src/data/<subject>/`, each file's header says how the game reads it |
| Music | `src/audio/tracks/*.song` (built by `tools/biosong`) |
| Code | `src/engine/**` ([src/README.md](src/README.md)) |

More: [docs/ASSETS.md](docs/ASSETS.md) (how assets build).
