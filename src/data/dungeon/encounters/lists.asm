; EncounterLists (encounters): 33 records of 4 bytes, one line per id; keep the order and count.
; Random dungeon battles (sub_212BAB): line = (DUNGEON_ID - 1) * 7 + floor, enemy =
; list[Random() % count] (list = an address in tables/encounter_enemies.asm), then StartDungeonBattle
; -> LoadEnemy. Dungeons 1-4 have 7 floors, the Crystal Mine (5) 5.
; Addresses are 4-byte ROM addresses (dd).
; id: list
	dd	0x249936	; 1 Forest F1: Stump, Spidey, Trappr, Iil, Bulby, Viney
	dd	0x249936	; 2 Forest F2: Stump, Spidey, Trappr, Iil, Bulby, Viney
	dd	0x24993C	; 3 Forest F3: Crabby, Pumper, Coyote, Flower, Bulbet, Scythr, Wooden
	dd	0x24993C	; 4 Forest F4: Crabby, Pumper, Coyote, Flower, Bulbet, Scythr, Wooden
	dd	0x249943	; 5 Forest F5: Squirm, Firey, Wolfen, Borey, Mamoth
	dd	0x249943	; 6 Forest F6: Squirm, Firey, Wolfen, Borey, Mamoth
	dd	0x249943	; 7 Forest F7: Squirm, Firey, Wolfen, Borey, Mamoth
	dd	0x249948	; 8 Blue F1: Horsee, Fishen, Fountn, Snoman, Deep1, Nauti
	dd	0x249948	; 9 Blue F2: Horsee, Fishen, Fountn, Snoman, Deep1, Nauti
	dd	0x24994E	; 10 Blue F3: Narl, Seel, Barby, Rocky, Merman, Froggy
	dd	0x24994E	; 11 Blue F4: Narl, Seel, Barby, Rocky, Merman, Froggy
	dd	0x249954	; 12 Blue F5: Squido, Orka, Aquan, Drake, Marman, Froggr
	dd	0x249954	; 13 Blue F6: Squido, Orka, Aquan, Drake, Marman, Froggr
	dd	0x249954	; 14 Blue F7: Squido, Orka, Aquan, Drake, Marman, Froggr
	dd	0x24995A	; 15 Wind F1: Mutan, Eyefly, Jyster, Smoky, Beasty, Eeek
	dd	0x24995A	; 16 Wind F2: Mutan, Eyefly, Jyster, Smoky, Beasty, Eeek
	dd	0x249960	; 17 Wind F3: Trice, Hornd, Darpy, Grifon, Feyt, Hyoi
	dd	0x249960	; 18 Wind F4: Trice, Hornd, Darpy, Grifon, Feyt, Hyoi
	dd	0x249966	; 19 Wind F5: Toris, Mrice, Chimer, Whyrm, Harpy, Coatl
	dd	0x249966	; 20 Wind F6: Toris, Mrice, Chimer, Whyrm, Harpy, Coatl
	dd	0x249966	; 21 Wind F7: Toris, Mrice, Chimer, Whyrm, Harpy, Coatl
	dd	0x24996C	; 22 Stone F1: Skully, Walley, Crystl, Lickin, Curly, Dedhed
	dd	0x24996C	; 23 Stone F2: Skully, Walley, Crystl, Lickin, Curly, Dedhed
	dd	0x249972	; 24 Stone F3: Skullt, Moworm, Golem, Zhaga, Whirly, Pengun
	dd	0x249972	; 25 Stone F4: Skullt, Moworm, Golem, Zhaga, Whirly, Pengun
	dd	0x249978	; 26 Stone F5: Mummy, Zombit, Iworm, Bonryu, Agolem, Zhuga
	dd	0x249978	; 27 Stone F6: Mummy, Zombit, Iworm, Bonryu, Agolem, Zhuga
	dd	0x249978	; 28 Stone F7: Mummy, Zombit, Iworm, Bonryu, Agolem, Zhuga
	dd	0x24997E	; 29 Crystal Mine F1: Hippie, Cerebn, Ratta, Elice, Jakko, Misynk, Octpod, Cabra
	dd	0x24997E	; 30 Crystal Mine F2: Hippie, Cerebn, Ratta, Elice, Jakko, Misynk, Octpod, Cabra
	dd	0x24997E	; 31 Crystal Mine F3: Hippie, Cerebn, Ratta, Elice, Jakko, Misynk, Octpod, Cabra
	dd	0x249986	; 32 Crystal Mine F4: Unicon, Faroh, Lamia, Dragon, Sphinx, Niten, Scaley, Mibore
	dd	0x249986	; 33 Crystal Mine F5: Unicon, Faroh, Lamia, Dragon, Sphinx, Niten, Scaley, Mibore
