; data/player/tables.asm: the player tables in ROM order, one section per part; each part is a
; file in src/data/player/: numbers as asm900 records (#include), names as a slot file that
; unitron text turns into build/data/player/<file>.asm ($include). A part the ROM holds twice
; (Works/Copy labels) includes the same file twice.

d_225009	section	romdata abs=0x225009
ExpCurve1:
#include "src/data/player/exp_curves/human.asm"
d_22506D	section	romdata abs=0x22506D
ExpCurve2:
#include "src/data/player/exp_curves/forester.asm"
d_2250D1	section	romdata abs=0x2250D1
ExpCurve3:
#include "src/data/player/exp_curves/mariner.asm"
d_225135	section	romdata abs=0x225135
ExpCurve4:
#include "src/data/player/exp_curves/birdian.asm"
d_225199	section	romdata abs=0x225199
ExpCurve5:
#include "src/data/player/exp_curves/lizardman.asm"
d_2251FD	section	romdata abs=0x2251FD
LevelGainsOdd:
#include "src/data/player/level_gains/odd.asm"
d_2252C9	section	romdata abs=0x2252C9
LevelGainsEven:
#include "src/data/player/level_gains/even.asm"
d_224FF5	section	romdata abs=0x224FF5
; [code] LevelUpStatGains: exp curve per (wPlayerRace - 1) / 2 (data/player/exp_curves/)
ExpCurves:
	dl	ExpCurve1,ExpCurve2,ExpCurve3,ExpCurve4
	dl	ExpCurve5
d_225395	section	romdata abs=0x225395
LevelBonus:
#include "src/data/player/level_bonus.asm"
d_226C11	section	romdata abs=0x226C11
#include "src/data/player/name_entry_cursor.asm"
d_226C6E	section	romdata abs=0x226C6E
; [code] title.asm (Select Player screen, 0x2010 area): race name per (task +0xE - 1) / 2
RaceNameTexts:
	dl	HumanText,ForesterText,MarinerText,BirdianText
	dl	LizardmanText
d_226CB9	section	romdata abs=0x226CB9
; [code] SetPlayerRacesAndNames: default name per wPlayerRace / wPartnerRace (string + 1, past
; its first byte) copied to wPlayerName / wPartnerName
DefaultNames:
	dl	RodText,RodText,RenaText,ChrisText
	dl	LeafText,ZappaText,SheraText,FezarText
	dl	ShilfeText,CarlText,PinkyText
d_226D54	section	romdata abs=0x226D54
$include "build/data/player/name_entry.asm"	; src/data/player/name_entry.txt (SelectPutBackText, NameEntryChars)
d_25B5FB	section	romdata abs=0x25B5FB
StartingEquipmentCopy:
#include "src/data/player/start_equipment.asm"
d_25E457	section	romdata abs=0x25E457
RankTitles:
$include "build/data/player/rank_titles.asm"	; src/data/player/rank_titles.txt
d_25E496	section	romdata abs=0x25E496
RaceNames:
$include "build/data/player/race_names.asm"	; src/data/player/race_names.txt
d_271864	section	romdata abs=0x271864
StartingEquipment:
#include "src/data/player/start_equipment.asm"
