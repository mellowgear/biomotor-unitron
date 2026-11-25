; EncounterCounts (encounters): 33 records of 1 bytes, one line per id; keep the order and count.
; Random dungeon battles (GetEncounterEnemy): line = (DUNGEON_ID - 1) * 7 + floor, enemy =
; list[Random() % count] (list = an address in tables/encounter_enemies.asm), then StartDungeonBattle
; -> LoadEnemy. Dungeons 1-4 have 7 floors, the Crystal Mine (5) 5.
; id: count
	db	6	; 1 Forest F1: Stump, Spidey, Trappr, Iil, Bulby, Viney
	db	6	; 2 Forest F2: Stump, Spidey, Trappr, Iil, Bulby, Viney
	db	7	; 3 Forest F3: Crabby, Pumper, Coyote, Flower, Bulbet, Scythr, Wooden
	db	7	; 4 Forest F4: Crabby, Pumper, Coyote, Flower, Bulbet, Scythr, Wooden
	db	5	; 5 Forest F5: Squirm, Firey, Wolfen, Borey, Mamoth
	db	5	; 6 Forest F6: Squirm, Firey, Wolfen, Borey, Mamoth
	db	5	; 7 Forest F7: Squirm, Firey, Wolfen, Borey, Mamoth
	db	6	; 8 Blue F1: Horsee, Fishen, Fountn, Snoman, Deep1, Nauti
	db	6	; 9 Blue F2: Horsee, Fishen, Fountn, Snoman, Deep1, Nauti
	db	6	; 10 Blue F3: Narl, Seel, Barby, Rocky, Merman, Froggy
	db	6	; 11 Blue F4: Narl, Seel, Barby, Rocky, Merman, Froggy
	db	6	; 12 Blue F5: Squido, Orka, Aquan, Drake, Marman, Froggr
	db	6	; 13 Blue F6: Squido, Orka, Aquan, Drake, Marman, Froggr
	db	6	; 14 Blue F7: Squido, Orka, Aquan, Drake, Marman, Froggr
	db	6	; 15 Wind F1: Mutan, Eyefly, Jyster, Smoky, Beasty, Eeek
	db	6	; 16 Wind F2: Mutan, Eyefly, Jyster, Smoky, Beasty, Eeek
	db	6	; 17 Wind F3: Trice, Hornd, Darpy, Grifon, Feyt, Hyoi
	db	6	; 18 Wind F4: Trice, Hornd, Darpy, Grifon, Feyt, Hyoi
	db	6	; 19 Wind F5: Toris, Mrice, Chimer, Whyrm, Harpy, Coatl
	db	6	; 20 Wind F6: Toris, Mrice, Chimer, Whyrm, Harpy, Coatl
	db	6	; 21 Wind F7: Toris, Mrice, Chimer, Whyrm, Harpy, Coatl
	db	6	; 22 Stone F1: Skully, Walley, Crystl, Lickin, Curly, Dedhed
	db	6	; 23 Stone F2: Skully, Walley, Crystl, Lickin, Curly, Dedhed
	db	6	; 24 Stone F3: Skullt, Moworm, Golem, Zhaga, Whirly, Pengun
	db	6	; 25 Stone F4: Skullt, Moworm, Golem, Zhaga, Whirly, Pengun
	db	6	; 26 Stone F5: Mummy, Zombit, Iworm, Bonryu, Agolem, Zhuga
	db	6	; 27 Stone F6: Mummy, Zombit, Iworm, Bonryu, Agolem, Zhuga
	db	6	; 28 Stone F7: Mummy, Zombit, Iworm, Bonryu, Agolem, Zhuga
	db	8	; 29 Crystal Mine F1: Hippie, Cerebn, Ratta, Elice, Jakko, Misynk, Octpod, Cabra
	db	8	; 30 Crystal Mine F2: Hippie, Cerebn, Ratta, Elice, Jakko, Misynk, Octpod, Cabra
	db	8	; 31 Crystal Mine F3: Hippie, Cerebn, Ratta, Elice, Jakko, Misynk, Octpod, Cabra
	db	8	; 32 Crystal Mine F4: Unicon, Faroh, Lamia, Dragon, Sphinx, Niten, Scaley, Mibore
	db	8	; 33 Crystal Mine F5: Unicon, Faroh, Lamia, Dragon, Sphinx, Niten, Scaley, Mibore
