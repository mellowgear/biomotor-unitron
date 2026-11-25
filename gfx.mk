# gfx.mk: the graphics build rules, included from the Makefile. unitron gfx does the generic
# PNG -> tiles and palette steps, tools/biogfx.cpp the game's own formats (see src/engine/gfx/README.md).

# ---- biogfx (tools/biogfx.cpp), built with plain c++
BIOGFX := build/tools/biogfx
$(BIOGFX): tools/biogfx.cpp tools/lzss.hpp
	@mkdir -p $(@D)
	c++ -O2 -std=c++17 -o $@ $<

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

# the font: raw 2bpp glyphs (no compression); the count must match FONT_GLYPH_COUNT (constants/gfx.inc)
build/gfx/font/font.2bpp: src/gfx/font/font.png
	@mkdir -p $(@D)
	@$(UNITRON) gfx frompng $< $@ --count 128 > /dev/null

# raw tile sets of the dungeon screen: 2bpp tiles, no header (the dw is in
# gfx/dungeon_sprites.asm); a record is 4 tiles, the player sheet 219 (must match PLAYER_DUNGEON_TILE_COUNT)
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
