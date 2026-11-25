; PlayerDungeonSprites (player_dungeon_sprites): 60 records of 10 bytes, one line per id; keep the order and count.
; Sprite maps of the player in the dungeon (LoadPlayerDungeonSprite 0x211D03, LoadDungeonPalettes):
; line = race r * 12 + set s * 3 + frame f + 1, r = (wPlayerRace - 1) / 2; s and f come from the task
; (+0x15 facing / +0x2D timer, see the code). w, h in tiles; t1..t4 = tiles of
; src/gfx/dungeon_sprites/player.png (0 = blank), copied by LoadMappedTiles.
; One player_dungeon_sprite record per line (src/macros/tables.inc).
; id: w, h, t1, t2, t3, t4
	player_dungeon_sprite	2,2,  1,  2,  3,  4	; 1 Human set 0 frame 0
	player_dungeon_sprite	2,2,  5,  6,  7,  8	; 2 Human set 0 frame 1
	player_dungeon_sprite	2,2,  1,  2,  9, 10	; 3 Human set 0 frame 2
	player_dungeon_sprite	2,2, 11, 12, 13, 14	; 4 Human set 1 frame 0
	player_dungeon_sprite	2,2, 15, 16, 17, 18	; 5 Human set 1 frame 1
	player_dungeon_sprite	2,2, 19, 20, 21, 22	; 6 Human set 1 frame 2
	player_dungeon_sprite	2,2, 23, 24, 25, 26	; 7 Human set 2 frame 0
	player_dungeon_sprite	2,2, 27, 28, 29, 30	; 8 Human set 2 frame 1
	player_dungeon_sprite	2,2, 23, 24, 31, 32	; 9 Human set 2 frame 2
	player_dungeon_sprite	2,2, 33, 34, 35, 36	; 10 Human set 3 frame 0
	player_dungeon_sprite	2,2, 37, 38, 39, 40	; 11 Human set 3 frame 1
	player_dungeon_sprite	2,2, 33, 34, 41, 42	; 12 Human set 3 frame 2
	player_dungeon_sprite	2,2, 43, 44, 45, 46	; 13 Forester set 0 frame 0
	player_dungeon_sprite	2,2, 47, 48, 49, 50	; 14 Forester set 0 frame 1
	player_dungeon_sprite	2,2, 43, 44, 51, 52	; 15 Forester set 0 frame 2
	player_dungeon_sprite	2,2, 53, 54, 55, 56	; 16 Forester set 1 frame 0
	player_dungeon_sprite	2,2, 57, 58, 59, 60	; 17 Forester set 1 frame 1
	player_dungeon_sprite	2,2, 61, 62, 63, 64	; 18 Forester set 1 frame 2
	player_dungeon_sprite	2,2, 65, 66, 67, 68	; 19 Forester set 2 frame 0
	player_dungeon_sprite	2,2, 69, 70, 71, 72	; 20 Forester set 2 frame 1
	player_dungeon_sprite	2,2, 65, 66, 73, 74	; 21 Forester set 2 frame 2
	player_dungeon_sprite	2,2, 75, 76, 77, 78	; 22 Forester set 3 frame 0
	player_dungeon_sprite	2,2, 79, 80, 81, 82	; 23 Forester set 3 frame 1
	player_dungeon_sprite	2,2, 75, 76, 83, 84	; 24 Forester set 3 frame 2
	player_dungeon_sprite	2,2, 85, 86, 87, 88	; 25 Mariner set 0 frame 0
	player_dungeon_sprite	2,2, 89, 90, 91, 92	; 26 Mariner set 0 frame 1
	player_dungeon_sprite	2,2, 93, 94, 95, 96	; 27 Mariner set 0 frame 2
	player_dungeon_sprite	2,2, 97, 98, 99,100	; 28 Mariner set 1 frame 0
	player_dungeon_sprite	2,2,101,102,103,104	; 29 Mariner set 1 frame 1
	player_dungeon_sprite	2,2,105,106,107,108	; 30 Mariner set 1 frame 2
	player_dungeon_sprite	2,2,109,110,111,112	; 31 Mariner set 2 frame 0
	player_dungeon_sprite	2,2,113,114,115,116	; 32 Mariner set 2 frame 1
	player_dungeon_sprite	2,2,117,118,119,120	; 33 Mariner set 2 frame 2
	player_dungeon_sprite	2,2,121,122,123,124	; 34 Mariner set 3 frame 0
	player_dungeon_sprite	2,2,125,126,127,128	; 35 Mariner set 3 frame 1
	player_dungeon_sprite	2,2,129,130,131,124	; 36 Mariner set 3 frame 2
	player_dungeon_sprite	2,2,132,133,134,135	; 37 Birdian set 0 frame 0
	player_dungeon_sprite	2,2,136,137,138,139	; 38 Birdian set 0 frame 1
	player_dungeon_sprite	2,2,140,141,142,143	; 39 Birdian set 0 frame 2
	player_dungeon_sprite	2,2,144,145,146,147	; 40 Birdian set 1 frame 0
	player_dungeon_sprite	2,2,148,149,150,151	; 41 Birdian set 1 frame 1
	player_dungeon_sprite	2,2,152,153,154,155	; 42 Birdian set 1 frame 2
	player_dungeon_sprite	2,2,156,157,158,159	; 43 Birdian set 2 frame 0
	player_dungeon_sprite	2,2,160,161,162,163	; 44 Birdian set 2 frame 1
	player_dungeon_sprite	2,2,164,165,166,167	; 45 Birdian set 2 frame 2
	player_dungeon_sprite	2,2,168,169,170,171	; 46 Birdian set 3 frame 0
	player_dungeon_sprite	2,2,172,173,174,175	; 47 Birdian set 3 frame 1
	player_dungeon_sprite	2,2,176,177,178,179	; 48 Birdian set 3 frame 2
	player_dungeon_sprite	2,2,180,181,182,183	; 49 Lizardman set 0 frame 0
	player_dungeon_sprite	2,2,184,185,186,187	; 50 Lizardman set 0 frame 1
	player_dungeon_sprite	2,2,180,181,188,189	; 51 Lizardman set 0 frame 2
	player_dungeon_sprite	2,2,190,191,192,193	; 52 Lizardman set 1 frame 0
	player_dungeon_sprite	2,2,194,195,196,197	; 53 Lizardman set 1 frame 1
	player_dungeon_sprite	2,2,198,199,200,201	; 54 Lizardman set 1 frame 2
	player_dungeon_sprite	2,2,202,203,204,205	; 55 Lizardman set 2 frame 0
	player_dungeon_sprite	2,2,206,207, 25,208	; 56 Lizardman set 2 frame 1
	player_dungeon_sprite	2,2,202,203,209,210	; 57 Lizardman set 2 frame 2
	player_dungeon_sprite	2,2,211,212,213,214	; 58 Lizardman set 3 frame 0
	player_dungeon_sprite	2,2,215,216,217, 42	; 59 Lizardman set 3 frame 1
	player_dungeon_sprite	2,2,211,212,218,219	; 60 Lizardman set 3 frame 2
