# Source layout

`main.asm` is the one assembly unit: constants, RAM names, then every code and data file. Every
routine and data piece is its own section pinned at its ROM address (`abs=`), so a section can move
between files without changing the ROM.

| Path | What |
|---|---|
| `home/` | cartridge header, system code |
| `engine/battle/` | battle: setup, formulas, menu, player and enemy turns, effects, status, tasks, end |
| `engine/dungeon/` | dungeon: task, floors, steps, maps, encounters, chests, camp, boss, world map |
| `engine/arena/` | arena: scenes, entry, opponents, duels |
| `engine/menus/` | main menu, new game, save, works, shop, town, shared menu and print helpers |
| `engine/gfx/` | the graphics layer (see its README) |
| `engine/*.asm` | events, scenes, text, tables, player |
| `audio/` | sound engine, Z80 driver source, song table, the 70 tracks as `.song` text |
| `constants/`, `macros/`, `ram/` | hardware and game constants, macros, work-RAM names |
| `gfx/` | tile sheets, maps, blocksets, palettes (see its README) |
| `maps/dungeon/` | the 57 dungeon floor maps |
| `text/` | dialogue and menu text, the charmap |
| `data/<subject>/` | game tables by subject, one file per table part; `data/unknown/` holds 47 unidentified bytes |

**Where a routine goes:** in the file for what it does. An unnamed one goes with its callers or
callees, otherwise next to its address neighbours. Helpers shared across subsystems go in
`engine/gfx/`, `engine/text.asm`, `engine/menus/menu_helpers.asm`, `engine/menus/print.asm` or
`home/system.asm`. Move whole sections only, and keep each file in ROM address order.
