; Biomotor Unitron -- main source. Assemble with tlcs900/asm.py (see Makefile).

.include "constants/hardware.s"
.include "ram/wram.s"

.charmap "text/charmap.txt"
.include "macros/macros.s"
.include "constants/struct_fields.s"
.include "constants/joypad.s"
.include "constants/event_flags.s"
.include "constants/items.s"

.include "audio/sound.s"
.include "audio/sound_engine.s"
.include "engine/arena.s"
.include "engine/battle.s"
.include "engine/dungeon.s"
.include "engine/events.s"
.include "engine/gfx/graphics.s"
.include "engine/gfx/robot.s"
.include "engine/menus/shop.s"
.include "engine/menus/title.s"
.include "engine/menus/town.s"
.include "engine/menus/works.s"
.include "engine/player.s"
.include "engine/scenes.s"
.include "engine/tables.s"
.include "engine/text.s"
.include "home/system.s"
.org 0x200000
Header:
.incbin "home/header.bin"
.org 0x2003B2
Z80Driver:
.incbin "audio/z80_driver.bin"
.org 0x200E67
SoundInit:
.incbin "audio/driver_init.bin"
.org 0x200E86
SongTable:
.incbin "audio/song_table.bin"
.org 0x200EDE
SongData:
.incbin "audio/song_data.bin"
.org 0x228741
.include "data/dungeon/dungeon.s"
.org 0x2746C0
.include "data/battle_anims/battle_effects.s"
.include "data/unused/unreferenced.s"
.include "gfx/font/blank_glyph.s"
.include "data/save/flash.s"
.include "gfx/gfx.s"
.include "data/tables.s"
.include "text/banks.s"
.include "data/unknown.s"
