# Graphics

| Folder | What it is | Used by the build? |
|---|---|---|
| `tiles/` | Tile sheets. The 132 sheets of the scene records (portraits and pictures, table 0x2C7B6E) and 8 story-scene sheets are laid out as their map draws them, in the scene's colours (`tiles/layout.mk`: `unitron gfx --map`, the map and the tile count per sheet; unused tiles after the map's cells). The other sheets are each picture's unique 8x8 tiles in storage order (they look scrambled; a map arranges them). Edit these to change graphics; keep a laid-out tile's cells consistent where the map repeats or flips it. | yes |
| `maps/` | Tile maps (`u8 width, u8 height`, then `u16` entries: tile, palette, flip bits). | yes |
| `pal/` | Palettes. `.pal`: one palette per line, four `0xBGR` colours. `.pal4`: the 4-byte grey-shade entries used on the original (mono) NGP. | yes |
| `pictures/portraits/` | Finished character portraits, colour and mono versions, from the scene records at `0x2C7B6E`. Verified pixel-identical against the game. | no (preview) |
| `pictures/screens/` | One picture per tile map (intro pieces, title, town, world map, ...). Each is checked pixel-for-pixel against the emulator's screen at a moment the game shows it (`index.json`). | no (preview) |
| `pictures/unverified/` | Maps rendered from the code alone and never confirmed on screen: maps the captures never reached, and pieces that are only ever shown moving (the intro robots slide in). | no (preview) |

These are building blocks, not frames. The intro and most screens are composed live by the
engine: two background planes stacked, scrolled, palettes swapped and faded. The ROM never
stores a finished frame, so there is nothing more "complete" to extract.

Regenerate the previews with `tools/render_scenes.py` (portraits) and `tools/capture_screens.py` (screens, verified); `tools/render_maps.py` renders from the code alone.
