; BossBeatenSprites (boss_beaten_sprites): 8 records of 1 bytes, one line per id; keep the order and count.
; LoadBossMapSprite: a beaten boss (line = boss index GetBossIndex + 1) is drawn with
; MapSpriteBeaten<record> and palette 8 + record (gfx/dungeon_sprites.asm).
; id: record
	db	1	; 1 Ent
	db	3	; 2 Kraken
	db	1	; 3 Roc
	db	0	; 4 Behemt
	db	1	; 5 Trifid
	db	0	; 6 Catble
	db	0	; 7 Squidl
	db	2	; 8 Simrug
