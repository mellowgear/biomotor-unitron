# Setting up


`src/` is the hand-edited source; `make` turns it back into the ROM, and the rebuilt ROM passes
the SHA1 check.

## 1. Folder layout

The tools find each other by relative path, so keep this layout:

```

  biomotor-unitron/     <- this project
  biomotor-unitron/tlcs900/  <- tracer/disassembler and LZSS/graphics code the tools use (in this repo)
  unitron/                     <- the toolchain; the Makefile runs unitron/build/unitron
  baserom.ngp   <- your ROM (not included)
  .venv/                       <- Python environment (step 2)
```

Check the ROM is the right one:

```sh
cd biomotor-unitron
shasum -a 1 baserom.ngp     # macOS (sha1sum on Linux)
# expected: ff74d5877bf58164419710888923e46b9cfb415e
```

## 2. unitron and the Python environment

unitron is C++ (CMake):

```sh
cd workspace
cmake -S unitron -B unitron/build && cmake --build unitron/build
```

Elsewhere, point the Makefile at it: `make UNITRON=/path/to/unitron`.
The Python environment runs this game's converters (tools/):

Needs Python 3.10 or newer, `make`, and on macOS the Xcode command-line tools
(`xcode-select --install`).

```sh
cd workspace
python3 -m venv .venv
.venv/bin/pip install -r biomotor-unitron/tlcs900/requirements.txt
```

## 3. Build the ROM

```sh
cd biomotor-unitron
make
```

This builds every file the `.asm` files `$include` from `build/` (PNG / table / palette -> bytes,
one Makefile pattern rule per extension; then bytes -> `db` lines with `unitron bin2db`, text banks
-> `db` with `unitron text`; see docs/ASSETS.md), assembles `src/main.asm` with `unitron asm` and
checks the result against `roms.sha1`. Output: `biomotor.ngp`.
The first build compresses every graphic (about half a minute on 8 cores; `make` runs in
parallel by itself); after that only changed files are rebuilt.
Unedited sources print `biomotor.ngp: OK`. After a mod, the check failing is expected.

## 4. The source is the source (no regeneration)

`src/` is edited by hand. `make extract` and `make regen` are retired: regenerating
`src/` from the ROM can't give back the names, comments and layout put into it. Rename a label in
`src/` (every use), add a table as asm900 in `src/data/<subject>/`, a graphic as a PNG in
`src/gfx/<dir>/`, then `make`. `symbols.txt` and `ram.txt` are frozen references; new RAM names go
in `src/ram/wram.inc`.

Portrait previews (`src/gfx/pictures/portraits/`) need only the ROM:

```sh
python tools/render_scenes.py baserom.ngp src/gfx/pictures/portraits
```



## 5. Optional: emulator steps

These are only needed to recreate the screen previews (`src/gfx/pictures/screens/`) or
to collect new coverage (`emu/executed.txt`, `emu/calls.json`). The files from the
original run are already included, so you can skip this.

3. Screen previews, each verified pixel-for-pixel against the emulator's screen:

   ```sh
   cd biomotor-unitron
   python tools/capture_screens.py baserom.ngp src/gfx/pictures/screens 7200 idle 3600 play 0 emu/play_inputs.json
   ```

4. New coverage: run the game with scripted input and record what executes.

   ```sh
   python tlcs900/emu_coverage.py baserom.ngp emu --frames 3600
   ```

   Code that only that run reached shows in `tools/check_executed.py`; turn it into
   instructions by hand in `src/`.

## What is and isn't in the zip

- Included: this project (source, extracted assets, tools, symbols, emulator
  logs) and `tlcs900/`.
- Not included: the ROM, the Toshiba manual PDF, the emulator, the Python environment,
  and generated build output (`build/`, `biomotor.ngp`).
- `src/data/`, `src/audio/` and `tlcs900/manual_pages/` still contain bytes or page images
  copied from the ROM and the manual. Fine for a private repo; keep them out of anything public.
