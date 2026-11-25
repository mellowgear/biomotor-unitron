; Graphics constants: screen size, tile counts kept in step with gfx.mk, fixed tile numbers.

; [code] the visible screen, 0xA0 x 0x98 pixels: InitDisplay's full window (WSI_H/WSI_V), the
; scroll split line limit in UpdateScrollRegisters (1..SCREEN_HEIGHT-1)
SCREEN_WIDTH	equ	0xA0
SCREEN_HEIGHT	equ	0x98

; glyphs in Font (gfx/font.asm); gfx.mk's --count for font.png must match
FONT_GLYPH_COUNT	equ	128
; tiles in PlayerDungeonTiles (gfx/dungeon_sprites.asm); gfx.mk's --count for player.png must match
PLAYER_DUNGEON_TILE_COUNT	equ	219

; [code] CHAR RAM tiles the credits draw the player and partner names into (CreditsTask with
; LoadGlyphTile, CreditsLineTask codes 0xFC / 0xFB)
CREDITS_PLAYER_NAME_TILE	equ	0x16C
CREDITS_PARTNER_NAME_TILE	equ	0x173
