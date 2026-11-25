# Biomotor Unitron: rebuild the ROM from source.
#   make          build the asset products (PNG/text -> bytes -> db), assemble src/main.asm with
#                 unitron asm, check sha1
#   make compare  compare biomotor.ngp with your original ROM byte for byte (BASEROM)
#   make UNITRON=/path/to/unitron   when unitron is not on PATH
# src/ is the source, edited by hand (make regen / make extract are retired).
SHA1   := $(shell command -v sha1sum >/dev/null 2>&1 && echo sha1sum || echo "shasum -a 1")
MAKEFLAGS += -j$(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

# your original ROM, only for make compare (never read by the build): make BASEROM=...
BASEROM ?= baserom.ngp

# unitron, the toolchain (https://github.com/mellowgear/unitron): on PATH, or make UNITRON=...
UNITRON ?= unitron
ifneq ($(filter-out clean,$(or $(MAKECMDGOALS),all)),)
ifeq ($(shell command -v $(UNITRON) 2>/dev/null),)
$(error unitron not found: put it on PATH or run make UNITRON=/path/to/unitron)
endif
endif
export UNITRON

# Every file the assembly reads, from `unitron asm -M` (like rgbasm -M;
# -MG lists the build/ products that don't exist yet). The build/ files are the whole asset list:
# every `$include "build/<file>.asm"` names one, and the path picks its rule: build/text/X.asm <-
# src/text/X.txt and build/data/S/X.asm <- src/data/S/X.txt (unitron text), build/src/F.asm <- src/F
# as it is, build/P.asm <- build product P (unitron bin2db); P's extension picks its rule below (see
# README). Palettes and numeric tables are asm900 source (#include), with no product.
DEPS     := $(shell $(UNITRON) asm src/main.asm -I . -M - -MG 2>/dev/null)
PRODUCTS := $(sort $(filter build/%,$(DEPS)))
SOURCES  := $(sort $(filter-out build/%,$(DEPS)))

all: biomotor.ngp
	@$(SHA1) -c roms.sha1 || echo "(differs from the original ROM -- expected if you edited something)"

biomotor.ngp: $(PRODUCTS) $(SOURCES)
	$(UNITRON) asm src/main.asm -o $@ --origin 0x200000 --size 0x100000 -I . --sym build/biomotor.sym

# ---- db files for $include (asm900 has no binary include and no charmap)
build/text/%.asm: src/text/%.txt src/text/charmap.txt
	@mkdir -p $(@D)
	@$(UNITRON) text src/text/charmap.txt $< -o $@
build/data/%.asm: src/data/%.txt src/text/charmap.txt
	@mkdir -p $(@D)
	@$(UNITRON) text src/text/charmap.txt $< -o $@
build/src/%.asm: src/%
	@mkdir -p $(@D)
	@$(UNITRON) bin2db $< -o $@
# the Z80 sound driver: Zilog source -> db lines (unitron z80 asm, docs/Z80_DRIVER.md section 3)
build/audio/%.z80.asm: src/audio/%.z80
	@mkdir -p $(@D)
	@$(UNITRON) z80 asm $< --db $@
build/%.asm: build/%
	@$(UNITRON) bin2db $< -o $@
# keep the byte products between the asset sources and their db files
.SECONDARY:

# ---- the game's own tools (tools/): built with plain c++
BIOGFX := build/tools/biogfx
$(BIOGFX): tools/biogfx.cpp tools/lzss.hpp
	@mkdir -p $(@D)
	c++ -O2 -std=c++17 -o $@ $<

# ---- songs: tools/biosong.cpp turns a track text (src/audio/tracks/track_XX.song, docs/SONGS.md)
# into the track record's db lines
BIOSONG := build/tools/biosong
$(BIOSONG): tools/biosong.cpp
	@mkdir -p $(@D)
	c++ -O2 -std=c++17 -o $@ $<
build/audio/tracks/%.asm: src/audio/tracks/%.song $(BIOSONG)
	@mkdir -p $(@D)
	@$(BIOSONG) $< $@

# ---- graphics: unitron gfx does the generic step, then biogfx Biomotor's loader format
# (tools/biogfx.cpp: the headers and Biomotor's LZSS). GFXFLAGS sets per-file options.
GFX = $(UNITRON) gfx frompng $< $@.2bpp $(GFXFLAGS) > /dev/null

# monster palettes (MonsterPalettes entries) come from the monster PNGs; this rule comes first
build/gfx/monsters/%.pal: src/gfx/monsters/%.png
	@mkdir -p $(@D)
	@$(UNITRON) gfx palette $< $@ --colors 4 > /dev/null
# tile sheets: u16 tile count + LZSS(tiles + one blank tile)
build/%.2bpp.lz: GFXFLAGS = --trim
# the dungeon floor blockset as a tile map (biogfx blockmap: the 441 2x2 metatiles, 16 to a row),
# the layout of dungeon_tiles.png
build/gfx/blocksets/%.tilemap: src/gfx/blocksets/%.bst $(BIOGFX)
	@mkdir -p $(@D)
	@$(BIOGFX) blockmap --width 16 $< $@
# sheets laid out as their screens: per-file --map/--count (src/gfx/tiles/layout.mk)
include src/gfx/tiles/layout.mk
build/%.2bpp.lz: src/%.png $(BIOGFX)
	@mkdir -p $(@D)
	@$(GFX)
	@$(BIOGFX) sheet $@.2bpp $@
# monster images: 02, w, h + LZSS(2bpp tiles, row by row)
build/%.img2: src/%.png $(BIOGFX)
	@mkdir -p $(@D)
	@$(GFX)
	@$(BIOGFX) img2 --png $< $@.2bpp $@
# part images: 04, w, h + LZSS(4-bit pixels, 4 = clear)
build/%.img4: src/%.png $(BIOGFX)
	@mkdir -p $(@D)
	@$(UNITRON) gfx frompng $< $@.px --indices > /dev/null
	@$(BIOGFX) img4 --png $< $@.px $@

# the font: raw 2bpp glyphs (no compression); the count must match the dw in gfx/font.asm
build/gfx/font/font.2bpp: src/gfx/font/font.png
	@mkdir -p $(@D)
	@$(UNITRON) gfx frompng $< $@ --count 128 > /dev/null

# raw tile sets of the dungeon screen: 2bpp tiles, no header (the dw is in
# gfx/dungeon_sprites.asm); a record is 4 tiles, the player sheet 219 (must match its dw)
build/gfx/dungeon_sprites/%.2bpp: GFXFLAGS = --count 4
build/gfx/dungeon_sprites/player.2bpp: GFXFLAGS = --count 219
build/gfx/dungeon_sprites/%.2bpp: src/gfx/dungeon_sprites/%.png
	@mkdir -p $(@D)
	@$(UNITRON) gfx frompng $< $@ $(GFXFLAGS) > /dev/null

# raw tile sets of LoadRawTiles (gfx/raw_tiles.asm): 2bpp tiles, no header (the dw is in the .asm);
# every cell of the PNG is a tile
build/gfx/raw_tiles/%.2bpp: src/gfx/raw_tiles/%.png
	@mkdir -p $(@D)
	@$(UNITRON) gfx frompng $< $@ > /dev/null

# ---- per-file options, e.g. a tile sheet that ends in blank tiles:
#   build/gfx/tiles/XXXXXX.2bpp.lz: GFXFLAGS = --count 140
# (none needed for the original files)

regen extract:
	@echo "make $@ is retired: src/ is the source (edit it by hand)." >&2; exit 1


compare: biomotor.ngp
	@test -f "$(BASEROM)" || { echo "no original ROM at $(BASEROM): put it there or run make compare BASEROM=/path/to/rom" >&2; exit 1; }
	@cmp -l "$(BASEROM)" biomotor.ngp | head -20; cmp -s "$(BASEROM)" biomotor.ngp && echo "biomotor.ngp matches $(BASEROM)" || true

clean:
	rm -rf build biomotor.ngp

.PHONY: all regen extract compare clean
# a failed step (e.g. an assembler error) must not leave a stale biomotor.ngp behind
.DELETE_ON_ERROR:
