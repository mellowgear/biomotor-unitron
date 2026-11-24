# Biomotor Unitron: rebuild the ROM from source.
#   make          build assets (PNG/text -> bytes), assemble src/main.s, check sha1
#   make regen    regenerate src/ code + main.s from the ROM (after editing symbols.txt)
#   make extract  re-extract src/gfx and src/text from the ROM (overwrites edits!)
#   make c        regenerate the lifted C in c/
#   make ram      RAM_MAP.md + RAM_REFERENCE.md for the play agent (ram.txt + play runs.md)
PY     := python3
TOOLS  := tlcs900
ROM    := baserom.ngp
SHA1   := $(shell command -v sha1sum >/dev/null 2>&1 && echo sha1sum || echo "shasum -a 1")
ASSETS := $(shell find src/gfx/tiles src/gfx/monsters src/gfx/parts src/gfx/pal src/gfx/maps src/text src/tables -type f 2>/dev/null)
CODE   := $(shell find src -name '*.s' -o -name '*.bin' 2>/dev/null)

all: biomotor.ngp
	@$(SHA1) -c roms.sha1 || echo "(differs from the original ROM -- expected if you edited something)"

build/.assets: assets.json $(ASSETS)
	$(PY) tools/assets.py build
	@touch $@

biomotor.ngp: build/.assets $(CODE)
	$(PY) $(TOOLS)/asm.py src/main.s -o $@ --size 0x100000

regen:
	$(PY) tools/split_source.py $(ROM)

extract:
	$(PY) tools/text.py extract $(ROM) emu/assets.json src
	$(PY) tools/assets.py extract $(ROM)

ram:
	$(PY) tools/ram_reference.py

c:
	$(PY) $(TOOLS)/lift.py $(ROM) --executed emu/executed.txt -o c --symbols symbols.txt

clean:
	rm -rf build biomotor.ngp

.PHONY: all regen extract c ram clean
# a failed step (e.g. an assembler error) must not leave a stale biomotor.ngp behind
.DELETE_ON_ERROR:
