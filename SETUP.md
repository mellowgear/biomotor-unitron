# Setting up


Everything in `src/`, `assets.json` and the portrait previews can be regenerated from
this folder plus your own copy of the ROM. Tested: a fresh unzip plus the ROM reproduces
every file byte-for-byte, and the rebuilt ROM passes the SHA1 check.

## 1. Folder layout

The tools find each other by relative path, so keep this layout:

```

  biomotor-unitron/     <- this project
  biomotor-unitron/tlcs900/  <- disassembler, assembler, LZSS/graphics tools (in this repo)
  baserom.ngp   <- your ROM (not included)
  .venv/                       <- Python environment (step 2)
```

Check the ROM is the right one:

```sh
cd biomotor-unitron
shasum -a 1 baserom.ngp     # macOS (sha1sum on Linux)
# expected: ff74d5877bf58164419710888923e46b9cfb415e
```

## 2. Python environment

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

This converts every PNG / `.txt` / palette / map in `src/` back into bytes, assembles
`src/main.s` and checks the result against `roms.sha1`. Output: `biomotor.ngp`.
Unedited sources print `biomotor.ngp: OK`. After a mod, the check failing is expected.

## 4. Regenerate everything from the ROM

Only needed if you want to recreate `src/` from scratch (for example after improving
a tool). **This overwrites your edits in `src/`.** Commit first.

```sh
make extract   # src/gfx/{tiles,monsters,parts,pal,maps}, src/text, assets.json
make regen     # src/main.s, src/engine, src/audio, src/home, src/data (uses symbols.txt)
make           # rebuild and check
make c         # optional: c/game.c, the lifted C
```

Portrait previews (`src/gfx/pictures/portraits/`) need only the ROM:

```sh
python tools/render_scenes.py baserom.ngp src/gfx/pictures/portraits
```

After renaming routines in `symbols.txt`, run `make regen && make`.

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

   Then `make regen` picks up code that only that run reached.

## What is and isn't in the zip

- Included: this project (source, extracted assets, tools, symbols, lifted C, emulator
  logs) and `tlcs900/`.
- Not included: the ROM, the Toshiba manual PDF, the emulator, the Python environment,
  and generated build output (`build/`, `biomotor.ngp`).
- `src/data/`, `src/audio/` and `tlcs900/manual_pages/` still contain bytes or page images
  copied from the ROM and the manual. Fine for a private repo; keep them out of anything public.
