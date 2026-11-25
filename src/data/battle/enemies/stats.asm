; EnemyStats (enemies): 118 records of 26 bytes, one line per id; keep the order and count.
; GetEnemyName 0x2082A0, GetEnemyRecord 0x2082AF. LoadEnemy 0x2077D1 copies the record to
; battle RAM: level -> 0x5DB9, hp -> 0x5DA5, ep -> 0x5DA9, ap 0x5DAF, sp 0x5DB1, rp 0x5DB3,
; mp 0x5DB5, affinity 0x5DB7, image 0x5DA3.
; level 255 = scaled enemy: level and stats come from tables/enemy_scaling.asm (by area), and
; ids below 0x62 get a random -5..+5 on hp and ep before and after scaling. Other
; values are a fixed level (bosses), with no scaling.
; hp/ep: max values; battle start copies them to the current values 0x5DA7/0x5DAB.
; rp: enemy accuracy in the hit roll (0x20B5xx). ap/sp/mp follow the status screen's
; order (HP EP AP SP RP MP) and the order of the scaling multipliers.
; affinity: the status screen's AT, a bit mask; attacks carry one too.
; image: monster image id; GetMonsterImage 0x2082BE = ImageTable[235 + image - 1] (ids < 0x5E),
; colours from MonsterPalettes 0x2DB097 + 8 * (image - 1).
; Battle end (0x20CB40): exp x tables/exp_level_diff.asm % (by player level - enemy level) is taken
; off EXP-to-next (0x5023); gp is added to GP (0x5041, BCD, max 999999); drop (item, or part
; if the high byte is set) is given with drop_pct % chance (100+ = always).
; [play] the four bosses (89-92) always drop their part with 65000 GP: Ent Seed, Kraken Cape, Roc Seraph,
; Behemt Bardos, each with its Emblem (wEventFlags 0x5062 bits 0-3); same in the male and female runs
; (play runs DECOMP_REQUESTS B8).
; One enemy_stat record per line (src/macros/tables.inc).
; id: level, f01, hp, ep, ap, sp, rp, mp, affinity, image, exp, gp, drop, drop_pct, f19
	enemy_stat	255,255,  30,  30,0, 25, 10, 10, 2,    2, 10,  170, 39, 30,0	; 1 Stump
	enemy_stat	255,255,  30,  30,0, 10, 20, 15, 2,    4, 10,  230, 48, 30,0	; 2 Spidey
	enemy_stat	255,255,  50,  30,0, 50, 15, 10, 2,   12, 30,  650, 40, 30,0	; 3 Squirm
	enemy_stat	255,255,  40,  30,0, 40, 10, 10, 2,   13, 20,  300, 58, 20,0	; 4 Crabby
	enemy_stat	255,255,  40,  30,0, 25, 25, 10, 2,   17, 20,  500, 47, 30,0	; 5 Pumper
	enemy_stat	255,255,  30,  30,0, 15, 20, 10, 2,   80, 10,  190, 50, 30,0	; 6 Trappr
	enemy_stat	255,255,  40,  30,0, 10, 25, 25, 2,   32, 20,  400, 59, 20,0	; 7 Coyote
	enemy_stat	255,255,  50,  30,0, 20, 30, 25, 2,   33, 30, 2990, 60, 20,0	; 8 Firey
	enemy_stat	255,255,  30,  30,0, 10, 25, 10, 2,   23, 10,  210, 52, 30,0	; 9 Iil
	enemy_stat	255,255,  40,  30,0, 25, 20, 15, 2,   82, 20,  350, 45, 30,0	; 10 Flower
	enemy_stat	255,255,  30,  25,0, 15, 15, 15, 2,    9, 10,  150, 38, 30,0	; 11 Bulby
	enemy_stat	255,255,  40,  30,0, 20, 20, 20, 2,   10, 20,  250, 43, 30,0	; 12 Bulbet
	enemy_stat	255,255,  40,  30,0, 10, 30, 20, 2,   15, 20,  480, 44, 30,0	; 13 Scythr
	enemy_stat	255,255,  50,  30,0, 25, 25, 25, 2,   16, 30, 1200, 41, 30,0	; 14 Wolfen
	enemy_stat	255,255,  30,  30,0, 10, 10, 25, 2,   31, 10,  190, 49, 30,0	; 15 Viney
	enemy_stat	255,255,  40,  30,0, 15, 15, 30, 2,    1, 20, 2120, 54, 30,0	; 16 Wooden
	enemy_stat	255,255,  50,  30,0, 35, 25, 15, 2,   58, 30,  700, 61, 20,0	; 17 Borey
	enemy_stat	255,255,  50,  30,0, 40, 25, 10, 2,   79, 30,  800, 64,  5,0	; 18 Mamoth
	enemy_stat	255,255,  50,  30,0, 30, 25, 20, 4,   42, 30,  500, 41, 30,0	; 19 Squido
	enemy_stat	255,255,  30,  30,0, 20, 15, 10, 4,   62, 10,  210, 51, 30,0	; 20 Horsee
	enemy_stat	255,255,  40,  30,0, 10, 25, 25, 4,   63, 20, 1820, 47, 30,0	; 21 Narl
	enemy_stat	255,255,  50,  30,0, 15, 30, 30, 4,   64, 30, 2660, 45, 30,0	; 22 Orka
	enemy_stat	255,255,  40,  30,0, 25, 25, 10, 4,   76, 20,  400, 44, 30,0	; 23 Seel
	enemy_stat	255,255,  40,  30,0, 20, 25, 15, 4,   68, 20,  350, 43, 30,0	; 24 Barby
	enemy_stat	255,255,  30,  30,0, 10, 20, 15, 4,   85, 10,  230, 52, 30,0	; 25 Fishen
	enemy_stat	255,255,  50,  30,0, 25, 30, 25, 4,   60, 30,  650, 61, 20,0	; 26 Aquan
	enemy_stat	255,255,  50,  30,0, 30, 28,  2, 4,   19, 30,  750, 60, 20,0	; 27 Drake
	enemy_stat	255,255,  40,  30,0, 10, 30, 20, 4,   69, 20,  300, 58, 20,0	; 28 Rocky
	enemy_stat	255,255,  30,  30,0, 22, 22,  1, 4,   70, 10,  210, 48, 30,0	; 29 Fountn
	enemy_stat	255,255,  30,  30,0,  1, 22, 22, 4,   75, 10,  190, 57, 20,0	; 30 Snoman
	enemy_stat	255,255,  40,  30,0, 15, 25, 20, 4,   48, 20,  250, 54, 30,0	; 31 Merman
	enemy_stat	255,255,  50,  30,0, 20, 30, 25, 4,   49, 30,  800, 55, 30,0	; 32 Marman
	enemy_stat	255,255,  30,  30,0, 15, 15, 15, 4,   78, 10,  150, 38, 30,0	; 33 Deep1
	enemy_stat	255,255,  40,  30,0, 20, 20, 20, 4,    5, 20, 2480, 59, 20,0	; 34 Froggy
	enemy_stat	255,255,  50,  30,0, 25, 25, 25, 4,    6, 30, 3860, 65,  5,0	; 35 Froggr
	enemy_stat	255,255,  30,  30,0, 25, 10, 10, 4,    8, 10,  170, 49, 30,0	; 36 Nauti
	enemy_stat	255,255,  30,  30,0, 15, 15, 15,16,   38, 10,  210, 52, 30,0	; 37 Skully
	enemy_stat	255,255,  40,  30,0, 20, 20, 20,16,   39, 20,  345, 54, 30,0	; 38 Skullt
	enemy_stat	255,255,  50,  30,0, 25, 25, 25,16,   40, 30,  640, 61, 20,0	; 39 Mummy
	enemy_stat	255,255,  50,  30,0,  5, 25, 45,16,   41, 30,  710, 47, 30,0	; 40 Zombit
	enemy_stat	255,255,  30,  30,0, 24, 20,  1,16,   71, 10,  230, 49, 30,0	; 41 Walley
	enemy_stat	255,255,  30,  30,0, 20, 24,  1,16,   72, 10,  600, 57, 20,0	; 42 Crystl
	enemy_stat	255,255,  50,  30,0, 25, 25, 20,16,   24, 30,  500, 41, 30,0	; 43 Iworm
	enemy_stat	255,255,  40,  30,0, 20, 20, 15,16,   25, 20,  300, 40, 30,0	; 44 Moworm
	enemy_stat	255,255,  50,  30,0, 30, 30, 15,16,   47, 30, 1620, 67,  5,0	; 45 Bonryu
	enemy_stat	255,255,  50,  30,0, 50, 20,  5,16,   65, 30, 2810, 60, 20,0	; 46 Agolem
	enemy_stat	255,255,  40,  30,0, 40, 15,  5,16,   66, 20, 2530, 58, 20,0	; 47 Golem
	enemy_stat	255,255,  50,  30,0, 10, 25, 25,16,   86, 30,  650, 55, 30,0	; 48 Zhuga
	enemy_stat	255,255,  40,  30,0, 15, 30, 30,16,   87, 20,  480, 43, 30,0	; 49 Zhaga
	enemy_stat	255,255,  30,  30,0, 20, 15, 10,16,   11, 10,  150, 38, 30,0	; 50 Lickin
	enemy_stat	255,255,  30,  30,0, 30, 10,  5,16,   44, 10,  250, 48, 30,0	; 51 Curly
	enemy_stat	255,255,  40,  30,0, 35, 15, 10,16,   45, 20,  360, 45, 30,0	; 52 Whirly
	enemy_stat	255,255,  40,  30,0, 10, 30, 20,16,   83, 20, 1420, 44, 30,0	; 53 Pengun
	enemy_stat	255,255,  30,  30,0, 20, 20, 50,16,   14, 10, 3120, 57, 20,0	; 54 Dedhed
	enemy_stat	255,255,  50,  30,0, 20, 30, 25, 8,   54, 30, 2620, 61, 20,0	; 55 Toris
	enemy_stat	255,255,  50,  30,0, 20, 25, 30, 8,   55, 30,  720, 65,  5,0	; 56 Mrice
	enemy_stat	255,255,  40,  30,0, 15, 20, 25, 8,   56, 20,  480, 44, 30,0	; 57 Trice
	enemy_stat	255,255,  50,  30,0, 25, 20, 30, 8,   57, 30,  630, 43, 30,0	; 58 Chimer
	enemy_stat	255,255,  30,  30,0, 10, 20, 15, 8,   21, 10,  170, 50, 30,0	; 59 Mutan
	enemy_stat	255,255,  30,  30,0,  5, 15, 25, 8,    7, 10,  190, 43, 30,0	; 60 Eyefly
	enemy_stat	255,255,  50,  30,0, 30, 25, 20, 8,   22, 30,  500, 60, 20,0	; 61 Whyrm
	enemy_stat	255,255,  40,  30,0, 25, 25, 25, 8,   18, 20, 2400, 40, 30,0	; 62 Hornd
	enemy_stat	255,255,  50,  30,0, 20, 20, 35, 8,   50, 30,  800, 41, 30,0	; 63 Harpy
	enemy_stat	255,255,  40,  30,0, 15, 15, 30, 8,   51, 20,  465, 59, 20,0	; 64 Darpy
	enemy_stat	255,255,  40,  30,0, 15, 25, 20, 8,   52, 20, 1400, 47, 30,0	; 65 Grifon
	enemy_stat	255,255,  50,  30,0, 20, 35, 25, 8,   53, 30, 1420, 55, 30,0	; 66 Coatl
	enemy_stat	255,255,  30,  30,0,  1, 22, 22, 8,   37, 10,  150, 39, 30,0	; 67 Jyster
	enemy_stat	255,255,  30,  30,0, 10, 15, 20, 8,   88, 10,  210, 38, 30,0	; 68 Smoky
	enemy_stat	255,255,  40,  30,0, 15, 25, 20, 8,   84, 20,  285, 45, 30,0	; 69 Feyt
	enemy_stat	255,255,  30,  30,0, 15, 15, 15, 8,   20, 10,  250, 52, 30,0	; 70 Beasty
	enemy_stat	255,255,  40,  30,0, 20, 30, 10, 8,   27, 20,  360, 58, 20,0	; 71 Hyoi
	enemy_stat	255,255,  30,  30,0, 15, 25,  5, 8,   28, 10,  230, 57, 20,0	; 72 Eeek
	enemy_stat	255,255,  40,  30,0, 20, 20, 20, 8,   73, 20,  800, 54, 30,0	; 73 Hippie
	enemy_stat	255,255,  40,  30,0, 15, 25, 20, 1,   74, 20,  900, 63,  5,0	; 74 Cerebn
	enemy_stat	255,255,  50,  30,0, 30, 30, 30, 2,   77, 30, 1100, 41, 30,0	; 75 Unicon
	enemy_stat	255,255,  50,  30,0, 25, 25, 25,16,   36, 30, 1600, 56,  1,0	; 76 Faroh
	enemy_stat	255,255,  50,  30,0, 25, 30, 20, 4,   30, 30, 1300, 55, 30,0	; 77 Lamia
	enemy_stat	255,255,  40,  30,0,  5, 30, 25, 2,   29, 20,  600, 43, 30,0	; 78 Ratta
	enemy_stat	255,255,  40,  30,0, 30, 25,  5, 2,   81, 20,  700, 44, 30,0	; 79 Elice
	enemy_stat	255,255,  40,  30,0, 40, 10, 10, 4,   35, 20, 1000, 45, 30,0	; 80 Jakko
	enemy_stat	255,255,  50,  30,0, 30, 25, 20, 1,   26, 30, 1500, 69,  1,0	; 81 Dragon
	enemy_stat	255,255,  50,  30,0, 25, 20, 30,16,   34, 30, 1500, 61, 20,0	; 82 Sphinx
	enemy_stat	255,255,  50,  30,0, 50, 25,  0,16,   67, 30, 1400, 68,  1,0	; 83 Niten
	enemy_stat	255,255,  50,  30,0, 35, 20, 20,16,   46, 30, 1100, 60, 20,0	; 84 Scaley
	enemy_stat	255,255,  40,  30,0, 25, 20, 15, 4,   61, 20,  800, 58, 20,0	; 85 Misynk
	enemy_stat	255,255,  40,  30,0, 35, 15, 10, 4,   43, 20,  700, 40, 30,0	; 86 Octpod
	enemy_stat	255,255,  50,  30,0, 20, 25, 30, 2,   59, 30, 1100, 41, 30,0	; 87 Mibore
	enemy_stat	255,255,  40,  30,0, 30, 15, 15, 2,    3, 20,  600, 40, 30,0	; 88 Cabra
	enemy_stat	 35,  0,1050,1000,0,500,400,250, 2,   94,300,65000,341,100,0	; 89 Ent
	enemy_stat	 35,  0,1050,1000,0,400,400,350, 4,   95,300,65000,343,100,0	; 90 Kraken
	enemy_stat	 35,  0,1050,1000,0,300,400,450, 8,   96,300,65000,337,100,0	; 91 Roc
	enemy_stat	 35,  0,1050,1000,0,450,400,300,16,   97,300,65000,339,100,0	; 92 Behemt
	enemy_stat	 30,  0, 650, 600,0,450,300,200, 2,   94,200,40000, 64,100,0	; 93 Trifid
	enemy_stat	 30,  0, 650, 600,0,350,300,300, 4,   95,200,40000, 65,100,0	; 94 Squidl
	enemy_stat	 30,  0, 650, 600,0,200,300,450, 8,   96,200,40000, 66,100,0	; 95 Simrug
	enemy_stat	 30,  0, 650, 600,0,400,300,250,16,   97,200,40000, 67,100,0	; 96 Catble
	enemy_stat	 35,  0,1250,1250,0,450,500,450,32,   99,  0,    0,  0,  0,0	; 97 Uniti
	enemy_stat	255,255,   0,   0,4,  4,  4,  3, 1,65535, 50,    0,  0,  0,0	; 98 Alex
	enemy_stat	255,255,   0,   0,5,  5,  3,  2, 1,65535, 50,    0,  0,  0,0	; 99 Crofrd
	enemy_stat	255,255,   0,   0,3,  3,  6,  3, 1,65535, 50,    0,  0,  0,0	; 100 Lester
	enemy_stat	255,255,   0,   0,2,  2,  8,  3, 2,65535, 50,    0,  0,  0,0	; 101 Kaldrl
	enemy_stat	255,255,   0,   0,4,  3,  5,  3, 2,65535, 50,    0,  0,  0,0	; 102 Fandel
	enemy_stat	255,255,   0,   0,3,  2,  6,  4, 2,65535, 50,    0,  0,  0,0	; 103 Leygos
	enemy_stat	255,255,   0,   0,3,  4,  4,  4, 4,65535, 50,    0,  0,  0,0	; 104 Loxia
	enemy_stat	255,255,   0,   0,3,  2,  5,  5, 4,65535, 50,    0,  0,  0,0	; 105 Legaea
	enemy_stat	255,255,   0,   0,4,  3,  4,  4, 4,65535, 50,    0,  0,  0,0	; 106 Palten
	enemy_stat	255,255,   0,   0,3,  1,  5,  8, 8,65535, 50,    0,  0,  0,0	; 107 Hawki
	enemy_stat	255,255,   0,   0,3,  2,  4,  5, 8,65535, 50,    0,  0,  0,0	; 108 Crawel
	enemy_stat	255,255,   0,   0,2,  3,  4,  6, 8,65535, 50,    0,  0,  0,0	; 109 Eegle
	enemy_stat	255,255,   0,   0,5,  4,  3,  3,16,65535, 50,    0,  0,  0,0	; 110 MJ
	enemy_stat	255,255,   0,   0,6,  4,  3,  2,16,65535, 50,    0,  0,  0,0	; 111 Vasky
	enemy_stat	255,255,   0,   0,8,  5,  2,  1,16,65535, 50,    0,  0,  0,0	; 112 Dupon
	enemy_stat	 12,  0, 180,  75,0, 50, 75, 50,16,   90,200,    0,  0,  0,0	; 113 Fenril
	enemy_stat	 16,  0, 225,  75,0,150,150,125, 8,   93,200,    0,  0,  0,0	; 114 Domino
	enemy_stat	 20,  0, 275, 100,0,200,200,175, 4,   91,200,    0,  0,  0,0	; 115 Neptun
	enemy_stat	 24,  0, 375, 150,0,250,250,225, 2,   92,200,    0,  0,  0,0	; 116 Oberon
	enemy_stat	 28,  0, 475, 200,0,300,300,275, 1,   89,200,    0,  0,  0,0	; 117 Balrok
	enemy_stat	 32,  0, 700, 650,0,350,450,400,64,   98,300,    0,  0,  0,0	; 118 Satana
