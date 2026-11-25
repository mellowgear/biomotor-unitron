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
# every `$include "build/<file>.asm"` names one, and the path picks its rule: build/src/F.asm <- src/F
# as it is, build/P.asm <- build product P (unitron bin2db); P's extension picks its rule below (see
# README). Palettes, numeric tables and text are asm source (#include / $include), with no product;
# text assembles through the charmap ($charmap in src/main.asm).
DEPS     := $(shell $(UNITRON) asm src/main.asm -I . -M - -MG 2>/dev/null)
PRODUCTS := $(sort $(filter build/%,$(DEPS)))
SOURCES  := $(sort $(filter-out build/%,$(DEPS)))

all: biomotor.ngp
	@$(SHA1) -c roms.sha1 || echo "(differs from the original ROM -- expected if you edited something)"

biomotor.ngp: $(PRODUCTS) $(SOURCES)
	$(UNITRON) asm src/main.asm -o $@ --origin 0x200000 --size 0x100000 -I . --sym build/biomotor.sym

# ---- db files for $include (asm900 has no binary include)
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

# ---- songs: tools/biosong.cpp (built with plain c++; biogfx is in gfx.mk) turns a track text (src/audio/tracks/track_XX.song, docs/SONGS.md)
# into the track record's db lines
BIOSONG := build/tools/biosong
$(BIOSONG): tools/biosong.cpp
	@mkdir -p $(@D)
	c++ -O2 -std=c++17 -o $@ $<
build/audio/tracks/%.asm: src/audio/tracks/%.song $(BIOSONG)
	@mkdir -p $(@D)
	@$(BIOSONG) $< $@

# ---- graphics (gfx.mk): biogfx, the PNG rules, per-file GFXFLAGS, src/gfx/tiles/layout.mk
include gfx.mk

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
