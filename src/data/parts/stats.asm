; PartStats (parts): 227 records of 24 bytes, one line per id; keep the order and count.
; Accessors 0x2082FA (names), 0x20834A (descs), 0x208360 (stats). Robot parts are
; grouped by category: Body 1-15, Core 16-30, Legs 31-74, Back 75-94, Arm 95-227.
; PartCategoryStart (0x271882, 5 x u16) holds each category's first id; GetBodyName..GetArmRecord
; (0x208309-0x2083A3) take a category-relative id. Moving the boundaries means editing those.
; LoadEnemy adds hp, ep, p04-p0A of the equipped parts (the arms without ap) to the same battle stats as the
; enemy record; the body's affinity replaces the robot's. CalcUnitStats 0x20868B: robot
; AP/SP/RP/MP = pilot stats + each part's ap..mp; max HP/EP = the sum of the hp/ep of all six
; equipped parts (CalcUnitStats; accessories are added after).
; image: picture within the part's slot group (0 = none); SetRobotDrawParts reads it for the
; equipped Body, Arms (left and right image sets), Legs and Back. Cores are not drawn.
; gfx/parts/<slot>/ is named after these parts.
; ep_cost: EP an arm's attack costs (EnemyChooseAttack reads it for robot enemies).
; price: buy price in GP, 4-byte BCD (play: shop prices match, e.g. Demon 650000; sell = half).
; status: what an arm's hit can inflict on the enemy (PlayerAttack after the hit roll: a random
; roll against wStatusChance, then the message from 0x225BBE): 1 paralyzed, 2 rusted, 3 leaking
; energy, 4 confused; 0 none. Sets bit 7 of wEnemyParalyzed + status - 1.
; (Play, Mariner: GrvHmr -> "Bulby is paralyzed!!", 0x5DC3 0x80, then 0x81-0x84 with
; "Bulby can't attack!!", then 0 by itself.)
; One part_stat record per line (src/macros/tables.inc).
; BCD: written as 0x followed by the decimal digits (650000 = 0x650000).
; id: hp, ep, ap, sp, rp, mp, ep_cost, affinity, status, image, p13, price (BCD)
	part_stat	 15,  0,  5,  0,  0,  0, 0, 1,0, 1, 16,     0x0	; 1 Body1 price 0
	part_stat	 30,  0, 10,  0,  0,  0, 0, 1,0, 6, 16,     0x0	; 2 Body2 price 0
	part_stat	 60,  0, 20,  0,  0,  0, 0, 1,0,11, 16,     0x0	; 3 Body3 price 0
	part_stat	 10,  0,  0,  0, 10,  0, 0, 2,0, 2, 16,     0x0	; 4 Body1 price 0
	part_stat	 20,  0,  0,  0, 20,  0, 0, 2,0, 7, 16,     0x0	; 5 Body2 price 0
	part_stat	 40,  0,  0,  0, 40,  0, 0, 2,0,12, 16,     0x0	; 6 Body3 price 0
	part_stat	 15,  0,  0,  0,  0,  0, 0, 4,0, 3, 16,     0x0	; 7 Body1 price 0
	part_stat	 30,  0,  0,  0,  0,  0, 0, 4,0, 8, 16,     0x0	; 8 Body2 price 0
	part_stat	 60,  0,  0,  0,  0,  0, 0, 4,0,13, 16,     0x0	; 9 Body3 price 0
	part_stat	 10,  0,  0,  5,  0, 10, 0, 8,0, 4, 16,     0x0	; 10 Body1 price 0
	part_stat	 20,  0,  0, 10,  0, 20, 0, 8,0, 9, 16,     0x0	; 11 Body2 price 0
	part_stat	 40,  0,  0, 20,  0, 40, 0, 8,0,14, 16,     0x0	; 12 Body3 price 0
	part_stat	 20,  0,  0,  0,  0,  0, 0,16,0, 5, 16,     0x0	; 13 Body1 price 0
	part_stat	 40,  0,  0,  0,  0,  0, 0,16,0,10, 16,     0x0	; 14 Body2 price 0
	part_stat	 80,  0,  0,  0,  0,  0, 0,16,0,15, 16,     0x0	; 15 Body3 price 0
	part_stat	  0, 30,  0,  0,  0,  0, 0, 0,0, 0,  0,  0x2000	; 16 Core1 price 2000
	part_stat	  0, 40,  0,  0,  0,  0, 0, 0,0, 0,  0,  0x3000	; 17 Core2 price 3000
	part_stat	  0, 50,  0,  0,  0,  0, 0, 0,0, 0,  0,  0x5000	; 18 Core3 price 5000
	part_stat	  0, 60,  0,  0,  0,  0, 0, 0,0, 0,  0,  0x8000	; 19 Core4 price 8000
	part_stat	  0, 70,  0,  0,  0,  0, 0, 0,0, 0,  0, 0x12000	; 20 Core5 price 12000
	part_stat	  0, 80,  0,  0,  0,  0, 0, 0,0, 0,  0, 0x23000	; 21 Core6 price 23000
	part_stat	  0, 90,  0,  0,  0,  0, 0, 0,0, 0,  0, 0x36000	; 22 Core7 price 36000
	part_stat	  0,100,  0,  0,  0,  0, 0, 0,0, 0,  0, 0x60000	; 23 Core8 price 60000
	part_stat	  0,120,  0,  0,  0,  0, 0, 0,0, 0,  0, 0x98000	; 24 Core9 price 98000
	part_stat	  0,150,  0,  0,  0,  0, 0, 0,0, 0,  0,     0x0	; 25 CoreX price 0
	part_stat	  0,200,  5,  5,  5,  5, 0, 1,0, 0,  0,     0x0	; 26 FireB price 0
	part_stat	  0,200,  0,  0, 10, 10, 0, 2,0, 0,  0,     0x0	; 27 WoodB price 0
	part_stat	  0,200,  0, 10, 10,  0, 0, 4,0, 0,  0,     0x0	; 28 WaterB price 0
	part_stat	  0,200, 10,  0,  0, 10, 0, 8,0, 0,  0,     0x0	; 29 WindB price 0
	part_stat	  0,200, 10, 10,  0,  0, 0,16,0, 0,  0,     0x0	; 30 EarthB price 0
	part_stat	  5,  0,  0,  0, 15,  0, 0, 0,0, 1, 32,  0x1500	; 31 Human price 1500
	part_stat	  5,  0,  0,  0, 10,  5, 0, 0,0, 4, 32,  0x1500	; 32 Birdan price 1500
	part_stat	 20,  0,  0,  0, 80,  0, 0, 0,0, 6, 32, 0x36000	; 33 Knight price 36000
	part_stat	100,  0,  0,  0,200,  0, 0, 0,0,14, 32,0x112000	; 34 Paladn price 112000
	part_stat	  5,  0,  0,  0, 15,  0, 0, 0,0, 2, 32,  0x1500	; 35 Forest price 1500
	part_stat	 15,  0,  0,  0, 85,  0, 0, 0,0, 7, 32, 0x38000	; 36 Marble price 38000
	part_stat	 25,  0,  0,  0, 75,  0, 0, 0,0, 8, 32, 0x42000	; 37 Obsedn price 42000
	part_stat	 60,  0,  0, 20,220,  0, 0, 0,0,17, 32,0x108000	; 38 Jester price 108000
	part_stat	 70,  0, 20,  0,210,  0, 0, 0,0,16, 32,0x124000	; 39 Kalon price 124000
	part_stat	 10,  0,  0,  0, 10,  0, 0, 0,0, 3, 32,  0x1500	; 40 Marinr price 1500
	part_stat	 20,  0,  0,  0, 80,  0, 0, 0,0,37, 32, 0x37500	; 41 Siren price 37500
	part_stat	110,  0,  0,  0,190,  0, 0, 0,0,38, 32,0x104000	; 42 Dolphn price 104000
	part_stat	130,  0,  0,  0,170,  0, 0, 0,0,39, 32,0x114000	; 43 Serpnt price 114000
	part_stat	 10,  0,  0,  0, 10,  0, 0, 0,0,12, 32,  0x1500	; 44 Lizard price 1500
	part_stat	 50,  0,  0,  0, 50,  0, 0, 0,0, 5, 32, 0x43000	; 45 Turtle price 43000
	part_stat	 40,  0,  0,  0, 60,  0, 0, 0,0, 9, 32, 0x38500	; 46 Fightr price 38500
	part_stat	150,  0,  0,  0,150,  0, 0, 0,0,41, 32,0x110000	; 47 Dragon price 110000
	part_stat	135,  0,  0,  0,165,  0, 0, 0,0,10, 32,0x122000	; 48 Hero price 122000
	part_stat	 40,  0,  0,  0, 10,  0, 0, 0,0,22, 32,  0x4800	; 49 Dino1 price 4800
	part_stat	150,  0,  0,  0, 50,  0, 0, 0,0,23, 32, 0x52000	; 50 Dino2 price 52000
	part_stat	 35,  0,  0,  0, 15,  0, 0, 0,0,31, 32,  0x4200	; 51 Wyrm1 price 4200
	part_stat	140,  0,  0,  0, 60,  0, 0, 0,0,32, 32, 0x48000	; 52 Wyrm2 price 48000
	part_stat	  5,  0,  0,  0, 45,  0, 0, 0,0,50, 32,  0x5200	; 53 Flier1 price 5200
	part_stat	 20,  0,  0,  0,180,  0, 0, 0,0,49, 32, 0x58000	; 54 Flier2 price 58000
	part_stat	 15,  0,  0,  0, 25,  0, 0, 0,0,41, 32,  0x4500	; 55 Scout1 price 4500
	part_stat	 70,  0,  0,  0,130,  0, 0, 0,0,46, 32, 0x42500	; 56 Scout2 price 42500
	part_stat	 30,  0,  0,  0, 20,  0, 0, 0,0,27, 32,  0x3800	; 57 Worm1 price 3800
	part_stat	135,  0,  0,  0, 65,  0, 0, 0,0,28, 32, 0x43000	; 58 Worm2 price 43000
	part_stat	 15,  0,  0,  0, 35,  0, 0, 0,0,44, 32,  0x4650	; 59 Boost1 price 4650
	part_stat	 15,  0,  0,  0,185,  0, 0, 0,0,43, 32, 0x48500	; 60 Boost2 price 48500
	part_stat	 20,  0,  0,  0, 60,  0, 0, 0,0,42, 32,  0x8600	; 61 Craftr price 8600
	part_stat	 35,  0,  0,  0, 35, 10, 0, 0,0,45, 32, 0x12500	; 62 Wing price 12500
	part_stat	 20,  0, 15,  0, 40,  5, 0, 0,0,47, 32, 0x21500	; 63 Tiger price 21500
	part_stat	 40,  0, 10,  0, 30,  0, 0, 0,0,33, 32, 0x16500	; 64 Insect price 16500
	part_stat	 50,  0,  0,  5, 25,  0, 0, 0,0,36, 32, 0x12400	; 65 Manta price 12400
	part_stat	 40,  0,  0,  0, 40,  0, 0, 0,0,30, 32,  0x9800	; 66 MultiL price 9800
	part_stat	 30,  0,  0,  0, 50,  0, 0, 0,0,29, 32, 0x10200	; 67 Wheel price 10200
	part_stat	 60,  0,  0,  0, 20,  0, 0, 0,0,15, 32, 0x11500	; 68 Rivet price 11500
	part_stat	 40,  0,  0,  0, 40,  0, 0, 0,0,21, 32, 0x10500	; 69 Centar price 10500
	part_stat	 50,  0, 10, 10, 10,  0, 0, 0,0,24, 32, 0x20000	; 70 Saurus price 20000
	part_stat	 60,  0,  0, 10, 10,  0, 0, 0,0,40, 32, 0x10450	; 71 Tntacl price 10450
	part_stat	 40,  0,  0, 20, 20,  0, 0, 0,0,34, 32, 0x15200	; 72 Crab price 15200
	part_stat	 30,  0,  0,  0, 30, 20, 0, 0,0,35, 32,  0x9600	; 73 Wasp price 9600
	part_stat	 40,  0,  0,  0, 20, 20, 0, 0,0,48, 32, 0x11500	; 74 Magic price 11500
	part_stat	  5,  0,  0,  0,  0, 10, 0, 0,0, 0, 64,  0x1500	; 75 Thrst1 price 1500
	part_stat	 15,  0,  0,  0,  0, 25, 0, 0,0, 0, 64,  0x6200	; 76 Thrst2 price 6200
	part_stat	 30,  0,  0,  0,  0, 50, 0, 0,0, 0, 64, 0x12000	; 77 Thrst3 price 12000
	part_stat	 60,  0,  0,  0,  0, 80, 0, 0,0, 0, 64, 0x26000	; 78 Thrst4 price 26000
	part_stat	 80,  0,  0,  0,  0,100, 0, 0,0, 0, 64, 0x58000	; 79 Thrst5 price 58000
	part_stat	 25,  0,  0,  0,  0, 75, 0, 0,0, 7, 64, 0x18000	; 80 Bird price 18000
	part_stat	 70,  0,  0,  0,  0,150, 0, 0,0, 1, 64,0x124000	; 81 Seraph price 124000
	part_stat	 45,  0,  0,  0,  0, 55, 0, 0,0, 9, 64, 0x16000	; 82 Fin price 16000
	part_stat	110,  0,  0,  0,  0,110, 0, 0,0, 6, 64,0x120000	; 83 Bardos price 120000
	part_stat	 30,  0,  0,  0,  0, 70, 0, 0,0, 2, 64, 0x17500	; 84 Bug price 17500
	part_stat	 80,  0,  0,  0,  0,140, 0, 0,0, 8, 64,0x114000	; 85 Seed price 114000
	part_stat	 35,  0,  0,  0,  0, 65, 0, 0,0, 3, 64, 0x17000	; 86 Robe price 17000
	part_stat	 90,  0,  0,  0,  0,130, 0, 0,0, 4, 64,0x115000	; 87 Cape price 115000
	part_stat	 40,  0,  0,  0,  0, 60, 0, 0,0, 5, 64, 0x16500	; 88 SJW price 16500
	part_stat	 95,  0,  0,  0,  0,125, 0, 0,0,10, 64,0x125000	; 89 Grav price 125000
	part_stat	120,  0,  0,  0,  0,180, 0, 0,0,10, 64,     0x0	; 90 Fuzion price 0
	part_stat	100,  0,  0,  0,  0,200, 0, 0,0, 8, 64,     0x0	; 91 Titan price 0
	part_stat	110,  0,  0,  0,  0,190, 0, 0,0, 3, 64,     0x0	; 92 C-Lion price 0
	part_stat	 80,  0,  0,  0,  0,220, 0, 0,0, 1, 64,     0x0	; 93 Mikal price 0
	part_stat	140,  0,  0,  0,  0,160, 0, 0,0, 6, 64,     0x0	; 94 DWing price 0
	part_stat	 15,  0, 15, 15,  0,  0, 3, 1,0, 1,128,  0x1000	; 95 BtFist price 1000
	part_stat	 30,  0, 30, 30,  0,  0, 6, 1,0,11,128,  0x5000	; 96 PwrHnd price 5000
	part_stat	 60,  0, 60, 60,  0,  0, 9, 1,0,18,128, 0x28000	; 97 ArmHnd price 28000
	part_stat	 15,  0, 15, 15,  0,  0, 3, 2,0, 2,128,  0x1000	; 98 SlkHnd price 1000
	part_stat	 30,  0, 30, 30,  0,  0, 6, 2,0,71,128,  0x6000	; 99 OakHnd price 6000
	part_stat	 60,  0, 60, 60,  0,  0, 9, 2,0,30,128, 0x44000	; 100 Crssbw price 44000
	part_stat	 15,  0, 15, 15,  0,  0, 3, 4,0, 3,128,  0x1000	; 101 H-Gun price 1000
	part_stat	 30,  0, 30, 30,  0,  0, 6, 4,0,60,128,  0x6000	; 102 IceBlw price 6000
	part_stat	 60,  0, 60, 60,  0,  0, 9, 4,0,26,128, 0x44000	; 103 Hydro price 44000
	part_stat	 15,  0, 15, 15,  0,  0, 3, 8,0, 4,128,  0x1000	; 104 Hawk price 1000
	part_stat	 30,  0, 30, 30,  0,  0, 6, 8,0,59,128,  0x6000	; 105 AirHnd price 6000
	part_stat	 60,  0, 60, 60,  0,  0, 9, 8,0,66,128, 0x44000	; 106 Killer price 44000
	part_stat	 15,  0, 15, 15,  0,  0, 3,16,0, 5,128,  0x1000	; 107 Ogre price 1000
	part_stat	 30,  0, 30, 30,  0,  0, 6,16,0,25,128,  0x5000	; 108 Golem price 5000
	part_stat	 60,  0, 60, 60,  0,  0, 9,16,0,62,128, 0x28000	; 109 Giant price 28000
	part_stat	 40,  0,  2,  3,  0,  0, 3, 1,0,48,128,  0x1500	; 110 Magma price 1500
	part_stat	 10,  0, 40, 40,  0,  0, 6, 1,0,47,128,  0x6000	; 111 Binder price 6000
	part_stat	 40,  0, 10, 40,  0,  0, 6, 1,0,73,128, 0x16000	; 112 Hammer price 16000
	part_stat	 80,  0, 40, 60,  0,  0, 9, 1,0,49,128, 0x36000	; 113 Pliers price 36000
	part_stat	 40,  0, 70, 70,  0,  0, 9, 1,0,50,128, 0x46000	; 114 Blade price 46000
	part_stat	 40,  0, 40, 10,  0,  0, 6, 1,0,51,128,  0x8000	; 115 Driver price 8000
	part_stat	 70,  0, 70, 40,  0,  0, 9, 1,0,52,128, 0x30000	; 116 Drill price 30000
	part_stat	120,  0,140, 40,  0,  0,20,32,1,73,128,0x650000	; 117 GrvHmr price 650000
	part_stat	 60,  0,120,120,  0,  0,18,64,0,50,128,0x480000	; 118 Cutter price 480000
	part_stat	 80,  0,110,110,  0,  0,18, 8,0,51,128,0x650000	; 119 3DDvr price 650000
	part_stat	 15,  0, 20, 10,  0,  0, 3, 8,0,14,128,  0x1750	; 120 Rapier price 1750
	part_stat	 30,  0, 40, 20,  0,  0, 6, 8,0,31,128,  0x8000	; 121 Sabre price 8000
	part_stat	 30,  0, 20, 40,  0,  0, 6, 8,0,40,128,  0x7000	; 122 Dirk price 7000
	part_stat	 60,  0, 40, 80,  0,  0, 9, 8,0,32,128, 0x46000	; 123 Sabre+ price 46000
	part_stat	 60,  0, 80, 40,  0,  0, 9, 8,0,39,128, 0x30000	; 124 Gradus price 30000
	part_stat	100,  0,100,100,  0,  0,15, 2,0,31,128,0x370000	; 125 Gram price 370000
	part_stat	100,  0,140, 60,  0,  0,15, 1,0,39,128,0x340000	; 126 Lavatn price 340000
	part_stat	 80,  0, 80,140,  0,  0,15, 8,0,32,128,0x360000	; 127 Wyndia price 360000
	part_stat	100,  0,400, 50,  0,  0,30,64,2,40,128,0x650000	; 128 Demon price 650000
	part_stat	100,  0,175,175,  0,  0,30,32,1,39,128,0x225000	; 129 Crsadr price 225000
	part_stat	 25,  0, 15,  5,  0,  0, 3, 1,0,33,128,  0x1000	; 130 HndAxe price 1000
	part_stat	 40,  0, 35, 15,  0,  0, 6, 1,0,34,128,  0x6000	; 131 BtlAxe price 6000
	part_stat	 30,  0, 45, 15,  0,  0, 6, 1,0,33,128,  0x7000	; 132 Tomhwk price 7000
	part_stat	 60,  0, 90, 30,  0,  0, 9, 1,0,34,128, 0x30000	; 133 2Edge price 30000
	part_stat	120,  0,150, 30,  0,  0,18,16,1,34,128, 0x33000	; 134 Break price 33000
	part_stat	 25,  0, 10, 10,  0,  0, 3,16,0,69,128,   0x750	; 135 BllArm price 750
	part_stat	 50,  0, 20, 20,  0,  0, 6,16,0,35,128,  0x5500	; 136 MgaBll price 5500
	part_stat	 20,  0, 20, 50,  0,  0, 6,16,0,72,128,  0x6500	; 137 NoWire price 6500
	part_stat	120,  0, 60, 60,  0,  0, 9,16,0,35,128, 0x26000	; 138 Crushr price 26000
	part_stat	 60,  0, 60,120,  0,  0, 9,32,0,72,128, 0x57000	; 139 Sthrn+ price 57000
	part_stat	  5,  0, 25, 15,  0,  0, 3,16,0, 6,128,   0x750	; 140 Lancer price 750
	part_stat	 10,  0, 50, 30,  0,  0, 6,16,0, 7,128,  0x5500	; 141 DrlArm price 5500
	part_stat	 10,  0, 60, 20,  0,  0, 6,16,0, 6,128,  0x6000	; 142 Pierce price 6000
	part_stat	 30,  0, 90, 60,  0,  0, 9, 8,0, 7,128, 0x56000	; 143 Trnado price 56000
	part_stat	 75,  0,150, 75,  0,  0,12, 4,2, 7,128, 0x43000	; 144 Spiral price 43000
	part_stat	 20,  0, 15, 10,  0,  0, 3, 2,0,61,128,  0x1250	; 145 Hook price 1250
	part_stat	 40,  0, 30, 20,  0,  0, 6, 2,0,61,128,  0x7000	; 146 LogHk price 7000
	part_stat	 80,  0, 60, 40,  0,  0, 9, 2,0,15,128, 0x28000	; 147 BtlHk price 28000
	part_stat	150,  0, 90, 60,  0,  0,18, 4,1,15,128,0x340000	; 148 IceClw price 340000
	part_stat	150,  0, 90, 60,  0,  0,18,64,4,15,128,0x340000	; 149 DvlClw price 340000
	part_stat	  5,  0, 20, 20,  0,  0, 3, 8,0,16,128,   0x750	; 150 Whip price 750
	part_stat	 10,  0, 40, 40,  0,  0, 6, 8,0,17,128,  0x6500	; 151 Whip+ price 6500
	part_stat	 20,  0, 80, 80,  0,  0, 9, 1,0,16,128,0x320000	; 152 FBoot price 320000
	part_stat	 20,  0, 80, 80,  0,  0, 9, 8,0,17,128,0x430000	; 153 9Tail price 430000
	part_stat	 20,  0, 80, 80,  0,  0,12, 8,1,17,128,0x330000	; 154 EBoot price 330000
	part_stat	 21,  0, 12, 12,  0,  0, 3, 4,0,75,128,   0x750	; 155 Fork price 750
	part_stat	 20,  0, 20,  5,  0,  0, 3, 4,0,12,128,  0x1000	; 156 HkClaw price 1000
	part_stat	 40,  0, 25, 25,  0,  0, 6, 4,0,75,128,  0x5500	; 157 Tridnt price 5500
	part_stat	 40,  0, 40, 10,  0,  0, 6, 2,0,12,128,  0x8000	; 158 WlfClw price 8000
	part_stat	 80,  0, 80, 20,  0,  0, 9, 8,0,12,128,0x320000	; 159 TgrClw price 320000
	part_stat	 20,  0,  5, 20,  0,  0, 3, 8,0,19,128,   0x750	; 160 Disc price 750
	part_stat	 30,  0, 20, 40,  0,  0, 6, 8,0,20,128,  0x5500	; 161 SpikeD price 5500
	part_stat	 40,  0, 10, 40,  0,  0, 6, 8,0,19,128,  0x7000	; 162 RingD price 7000
	part_stat	 60,  0, 40, 80,  0,  0, 9, 8,0,20,128, 0x25000	; 163 Disc+ price 25000
	part_stat	 80,  0, 20, 80,  0,  0, 9, 8,0,19,128, 0x57000	; 164 AirD price 57000
	part_stat	 20,  0, 20,  5,  0,  0, 3, 2,0,57,128,  0x1000	; 165 EWire price 1000
	part_stat	 30,  0, 50, 10,  0,  0, 6, 2,0,58,128, 0x14000	; 166 ArmWre price 14000
	part_stat	 40,  0, 40, 10,  0,  0, 6, 2,0,57,128,  0x6000	; 167 Tangle price 6000
	part_stat	 60,  0,100, 20,  0,  0,12, 2,1,58,128, 0x65000	; 168 Lghtng price 65000
	part_stat	130,  0,120, 50,  0,  0,18, 2,1,58,128,0x680000	; 169 Coil price 680000
	part_stat	 10,  0,  5, 10, 10, 10, 3, 2,0,38,128,  0x1500	; 170 Mage price 1500
	part_stat	 20,  0, 10, 20, 20, 20, 6, 2,0,38,128,  0x8000	; 171 Wizard price 8000
	part_stat	 40,  0, 20, 40, 40, 40, 9, 2,0,21,128, 0x45000	; 172 Warlok price 45000
	part_stat	 50, 50, 30, 50, 60, 60,15, 2,0,21,128,0x700000	; 173 ArchMg price 700000
	part_stat	 75, 80, 40, 75, 90, 90,20,32,0,22,128,0x900000	; 174 GodHnd price 900000
	part_stat	 10,  0, 15, 20,  0,  0, 3,64,0,55,128,  0x1000	; 175 Skull price 1000
	part_stat	 15,  0, 35, 40,  0,  0, 6,16,0,56,128,  0x7000	; 176 DgnHed price 7000
	part_stat	 20,  0, 30, 40,  0,  0, 9,64,1,55,128, 0x14000	; 177 DrkClw price 14000
	part_stat	 30,  0, 70, 80,  0,  0,12,16,3,56,128, 0x57000	; 178 Cursed price 57000
	part_stat	 40,  0,120,140,  0,  0,18,64,1,56,128,0x360000	; 179 Infrno price 360000
	part_stat	  5,  0, 35,  5,  0,  0, 3, 4,0,37,128,  0x1000	; 180 Spring price 1000
	part_stat	 20,  0, 60, 10,  0,  0, 6, 4,0,36,128,  0x6000	; 181 Curler price 6000
	part_stat	 10,  0, 70, 10,  0,  0, 6, 4,0,27,128,  0x7000	; 182 Snaker price 7000
	part_stat	 30,  0,120, 30,  0,  0, 9, 4,0,37,128, 0x28000	; 183 Zoomer price 28000
	part_stat	 50,  0,200, 50,  0,  0,15,16,0,36,128,0x350000	; 184 Buster price 350000
	part_stat	  5,  0, 20, 20,  0,  0, 3,16,0,64,128,  0x1250	; 185 Claw price 1250
	part_stat	 10,  0, 40, 40,  0,  0, 6,16,0,65,128,  0x6500	; 186 Triger price 6500
	part_stat	 20,  0, 80, 80,  0,  0, 9,16,0,74,128, 0x28000	; 187 Qatar price 28000
	part_stat	 50,  0,125,125,  0,  0,15, 8,0,74,128,0x350000	; 188 Indra price 350000
	part_stat	 50,  0,125,125,  0,  0,15, 1,0,74,128,0x350000	; 189 Agni price 350000
	part_stat	 15,  0, 15, 15,  0,  0, 3, 4,0,53,128,  0x1000	; 190 Maxi price 1000
	part_stat	 30,  0, 30, 30,  0,  0, 6, 4,0,54,128,  0x6000	; 191 Twin price 6000
	part_stat	 60,  0, 60, 60,  0,  0, 9, 1,0,53,128,0x320000	; 192 FPlse price 320000
	part_stat	 60,  0, 60, 60,  0,  0,12, 4,1,53,128,0x320000	; 193 IcePls price 320000
	part_stat	100,  0,100,100,  0,  0,15, 4,0,54,128,0x680000	; 194 Ashra price 680000
	part_stat	  5,  0, 25, 15,  0,  0, 3, 1,0, 8,128,  0x1000	; 195 Bazoka price 1000
	part_stat	 10,  0, 50, 30,  0,  0, 6, 1,0, 8,128,  0x6000	; 196 SDisc price 6000
	part_stat	 10,  0, 55, 25,  0,  0, 6, 1,0, 9,128,  0x7000	; 197 Chnsaw price 7000
	part_stat	 20,  0,110, 50,  0,  0, 9, 1,0, 9,128, 0x28000	; 198 Saw price 28000
	part_stat	 40,  0,180, 80,  0,  0,15, 1,0, 9,128,0x470000	; 199 Hacker price 470000
	part_stat	 11,  0, 17, 17,  0,  0, 3, 4,0,67,128,  0x1000	; 200 Knukle price 1000
	part_stat	 10,  0, 10, 70,  0,  0, 6, 4,0,68,128,  0x6000	; 201 Gloves price 6000
	part_stat	 22,  0, 34, 34,  0,  0, 6, 4,0,67,128,  0x7000	; 202 Rocket price 7000
	part_stat	 20,  0, 20,140,  0,  0, 9, 4,0,68,128, 0x29000	; 203 Mail price 29000
	part_stat	 40,  0, 40,220,  0,  0,15, 4,0,68,128,0x350000	; 204 Plate price 350000
	part_stat	  5,  0, 30, 10,  0,  0, 3, 2,0,23,128,  0x1000	; 205 Troopr price 1000
	part_stat	 10,  0, 60, 20,  0,  0, 6, 2,0,28,128,  0x7000	; 206 Scorp price 7000
	part_stat	 20,  0,100, 60,  0,  0, 9, 2,0,28,128, 0x44000	; 207 Spider price 44000
	part_stat	 20,  0,120, 40,  0,  0,12, 2,1,24,128, 0x60000	; 208 Mantis price 60000
	part_stat	 40,  0,180, 80,  0,  0,15, 2,0,29,128,0x360000	; 209 RedClw price 360000
	part_stat	 15,  0, 30,  0,  0,  0, 3, 4,0,43,128,  0x1000	; 210 HndGun price 1000
	part_stat	 30,  0, 60,  0,  0,  0, 6, 4,0,44,128,  0x7000	; 211 Vulcan price 7000
	part_stat	 25,  0, 65,  0,  0,  0, 6, 4,0,46,128, 0x15000	; 212 Lncher price 15000
	part_stat	 40,  0,140,  0,  0,  0, 9, 4,0,44,128, 0x28000	; 213 Gatlng price 28000
	part_stat	 30,  0,150,  0,  0,  0, 9, 4,0,46,128, 0x56000	; 214 Phalnx price 56000
	part_stat	  5,  0, 40,  0,  0,  0, 3, 1,0,42,128,  0x1250	; 215 Cannon price 1250
	part_stat	 10,  0, 80,  0,  0,  0, 6, 1,0,45,128,  0x6500	; 216 2Barrl price 6500
	part_stat	 20,  0, 70,  0,  0,  0, 6, 1,0,41,128,  0x7000	; 217 LineGn price 7000
	part_stat	 20,  0,160,  0,  0,  0, 9, 1,0,45,128, 0x29000	; 218 XGun price 29000
	part_stat	 20,  0,280,  0,  0,  0,15, 1,0,41,128,0x350000	; 219 RailGn price 350000
	part_stat	 80,  0,  0, 40,  0,  0,12, 2,4,79,128, 0x10000	; 220 Flint price 10000
	part_stat	  0,  0, 60, 60,  0,  0, 9, 1,0,77,128, 0x10000	; 221 Sword price 10000
	part_stat	  0,  0, 50, 50,  0, 20, 9, 8,0,78,128, 0x10000	; 222 Kama price 10000
	part_stat	 20,  0, 50, 50,  0,  0, 9, 2,0,70,128, 0x10000	; 223 TgrHnd price 10000
	part_stat	 50,  0, 50, 20,  0,  0, 9,16,0,63,128, 0x10000	; 224 MoleHd price 10000
	part_stat	 60,  0, 60,  0,  0,  0,12, 4,2,80,128, 0x10000	; 225 Stunr price 10000
	part_stat	 60,  0,  0, 60,  0,  0,12, 8,4,76,128, 0x10000	; 226 Needle price 10000
	part_stat	  0,  0,120,  0,  0,  0, 9,16,0,13,128, 0x10000	; 227 Pole price 10000
