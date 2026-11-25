# How assets are declared and built

There is no asset list: the `.asm` files and the Makefile are the whole description.
Each asset is declared where the game has it, in its own section at its address:

```
d_2846FE	section	romdata abs=0x2846FE
Gfx_2846FE:
$include "build/gfx/tiles/2846FE.2bpp.lz.asm"	; build/gfx/tiles/2846FE.2bpp.lz
```

asm900 has no binary include, so every product is turned into `db` lines: `build/P.asm` is made
from the product `build/P` by `unitron bin2db`, `build/src/F.asm` from a source file used as it is,
and `build/text/B.asm` from `src/text/B.txt` by `unitron text` (the game's character map,
`src/text/charmap.txt`). The Makefile collects every `build/...` path named by a `$include`; the
product's path or extension picks a pattern rule (only what changed is rebuilt). Formats are the
game loaders':

| Product | Source | Format (loader) |
|---|---|---|
| `build/gfx/{tiles,battle_anims}/X.2bpp.lz` | `src/gfx/.../X.png` | u16 tile count + LZSS of the tiles and one blank tile (LoadCompressedTiles 0x207226) |
| `build/gfx/monsters/X.img2` | `src/gfx/monsters/X.png` | `02 w h` + LZSS of the 2bpp tiles, row-major (LoadMonsterImage 0x207206) |
| `build/gfx/monsters/X.pal` | `src/gfx/monsters/X.png` | the PNG's first 4 colours, 4 x u16; one MonsterPalettes entry per image id |
| `build/gfx/parts/G/X.img4` | `src/gfx/parts/G/X.png` | `04 w h` + LZSS of 4-bit pixels, 4 = clear (DrawPartImage 0x2070C7) |
| (none) | `src/gfx/palettes.asm`, at the `Pal_` label: `dw` lines | 4 x u16 0x0BGR per palette (LoadPalettes 0x206D9E) |
| (none) | `src/gfx/palettes.asm`, at the `MonoPal_` label: `db` lines | mono shades, as written (LoadMonoPalettes 0x206DCD) |
| `build/gfx/font/font.2bpp` | `src/gfx/font/font.png` | 128 raw 2bpp glyphs, no compression (`unitron gfx frompng --count 128`); `dw 128` before it in gfx/font.asm (GetFontGlyph 0x207073) |
| (none) | `src/data/S/T.asm` or `src/data/S/T/P.asm` | a numeric table part: `db`/`dw`/`dd` lines or record macros (`src/macros/tables.inc`), `#include`d from `src/data/S/tables.asm` (S = subject) |
| `build/data/S/T.asm`, `build/data/S/T/P.asm` | `src/data/S/T.txt`, `src/data/S/T/P.txt` | a text table part: fixed-size slots (`slot 7 FF`), `unitron text` |
| (none) | `src/gfx/maps/X.tilemap`, `.bst`, `.blk` | included as they are (`build/src/...asm`): u8 w, h + u16 entries (DrawTilemap 0x206B37) |
| `build/text/B.asm` | `src/text/B.txt` | the bank's strings in the game's character codes (`unitron text`, TextStep 0x2073B3) |

LZSS is Okumura's LZSS.C (`tlcs900/ngpc_lzss.py`), which reproduces every original stream. A
sheet's tile count is read from its PNG: every tile up to the last one in the last row that is not
all pixel index 0. Per-file options go in the Makefile: the count for a sheet that
ends in blank tiles (none of the original sheets need it), and for the 132 sheets laid out as their
screens `--map <tilemap> --count N` (src/gfx/tiles/layout.mk, included by the Makefile):

```
build/gfx/tiles/XXXXXX.2bpp.lz: ASSETFLAGS = --tiles 140
```

Bytes read by two loaders are declared once: the mono palette at 0x2DB3CF is palettes 10-11 of
`Pal_2DB37F`, so `gfx/palettes.asm` has `MonoPal_2DB3CF equ Pal_2DB37F + 0x50`.

These declarations were first written from the ROM (tools/assets.py, text.py, dungeon.py,
battle_fx.py: the retired `make extract`); since 2026-11-25 they are edited by hand like the rest
of `src/`. To add an asset: put its source in `src/<dir>/`, declare it (section at its address,
label, `$include` of the product) in the subject's .asm, and cut its bytes out of the
`src/data/unknown/` block it came from.

