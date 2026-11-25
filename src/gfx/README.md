# Graphics

| Folder | What it is | Used by the build? |
|---|---|---|
| `tiles/` | Tile sheets. The 132 sheets of the scene records (portraits and pictures, table 0x2C7B6E) and 8 story-scene sheets are laid out as their map draws them, in the scene's colours (`tiles/layout.mk`: `unitron gfx --map`, the map and the tile count per sheet; unused tiles after the map's cells). 7 sheets drawn by several maps (battle status icons, the intro's 199-years-ago text, planet, letters and head, the title banners and logo) are laid out by their main map, the tiles only the other maps use after it in storage order, each tile in the colours of the first map that uses it (mono-only tiles in grey). The sprite sheets `2C8691` (the world-map flag, 4 frames) and `2C8D88` (the name-entry cursor corners) are plain sheets 2 tiles wide, so each 2x2 sprite frame shows whole. `dungeon_tiles` (the dungeon floors) is laid out as the 441 2x2 metatiles of `blocksets/dungeon.bst` that draw it, 16 to a row, metatile 0 at the top left, each tile where its first metatile has it, in the colours of dungeons 1-2 (`tiles/layout.mk`; gfx.mk turns the blockset into that map with `tools/biogfx blockmap`). The other sheets (those of other loaders) are each picture's unique 8x8 tiles in storage order (they look scrambled; a map arranges them). Edit these to change graphics; keep a laid-out tile's cells consistent where the map repeats or flips it. | yes |
| `maps/` | Tile maps (`u8 width, u8 height`, then `u16` entries: tile, palette, flip bits). | yes |
| `blocksets/` | `dungeon.bst`: the dungeon floor metatiles (DungeonMetatiles, GetMetatileTiles), 441 x 4 `u16` tile words (top left, top right, bottom left, bottom right: tile n = sheet tile n - 1 of `dungeon_tiles`, palette, flip bits), no header. Also the layout of `tiles/dungeon_tiles.png`. | yes |
| `pal/` | Palettes. `.pal`: one palette per line, four `0xBGR` colours. `.pal4`: the 4-byte grey-shade entries used on the original (mono) NGP. | yes |

These are building blocks, not frames. The intro and most screens are composed live by the
engine: two background planes stacked, scrolled, palettes swapped and faded. The ROM never
stores a finished frame, so there is nothing more "complete" to extract.
