; PartIdWords (part_id_words): 239 records of 2 bytes, one line per id; keep the order and count.
; One u16 per part (line = part id), in the Works copy; swp_21B9A5 reads it, but nothing calls
; swp_21B9A5. part = the line's part id; bits = 0x10 for bodies, 0 cores, 0x20 legs, 0x40 backs,
; 0x80 arms. Lines 228-239 are zero.
; id: part, bits
	db	  1, 16	; 1 Body1
	db	  2, 16	; 2 Body2
	db	  3, 16	; 3 Body3
	db	  4, 16	; 4 Body1
	db	  5, 16	; 5 Body2
	db	  6, 16	; 6 Body3
	db	  7, 16	; 7 Body1
	db	  8, 16	; 8 Body2
	db	  9, 16	; 9 Body3
	db	 10, 16	; 10 Body1
	db	 11, 16	; 11 Body2
	db	 12, 16	; 12 Body3
	db	 13, 16	; 13 Body1
	db	 14, 16	; 14 Body2
	db	 15, 16	; 15 Body3
	db	 16,  0	; 16 Core1
	db	 17,  0	; 17 Core2
	db	 18,  0	; 18 Core3
	db	 19,  0	; 19 Core4
	db	 20,  0	; 20 Core5
	db	 21,  0	; 21 Core6
	db	 22,  0	; 22 Core7
	db	 23,  0	; 23 Core8
	db	 24,  0	; 24 Core9
	db	 25,  0	; 25 CoreX
	db	 26,  0	; 26 FireB
	db	 27,  0	; 27 WoodB
	db	 28,  0	; 28 WaterB
	db	 29,  0	; 29 WindB
	db	 30,  0	; 30 EarthB
	db	 31, 32	; 31 Human
	db	 32, 32	; 32 Birdan
	db	 33, 32	; 33 Knight
	db	 34, 32	; 34 Paladn
	db	 35, 32	; 35 Forest
	db	 36, 32	; 36 Marble
	db	 37, 32	; 37 Obsedn
	db	 38, 32	; 38 Jester
	db	 39, 32	; 39 Kalon
	db	 40, 32	; 40 Marinr
	db	 41, 32	; 41 Siren
	db	 42, 32	; 42 Dolphn
	db	 43, 32	; 43 Serpnt
	db	 44, 32	; 44 Lizard
	db	 45, 32	; 45 Turtle
	db	 46, 32	; 46 Fightr
	db	 47, 32	; 47 Dragon
	db	 48, 32	; 48 Hero
	db	 49, 32	; 49 Dino1
	db	 50, 32	; 50 Dino2
	db	 51, 32	; 51 Wyrm1
	db	 52, 32	; 52 Wyrm2
	db	 53, 32	; 53 Flier1
	db	 54, 32	; 54 Flier2
	db	 55, 32	; 55 Scout1
	db	 56, 32	; 56 Scout2
	db	 57, 32	; 57 Worm1
	db	 58, 32	; 58 Worm2
	db	 59, 32	; 59 Boost1
	db	 60, 32	; 60 Boost2
	db	 61, 32	; 61 Craftr
	db	 62, 32	; 62 Wing
	db	 63, 32	; 63 Tiger
	db	 64, 32	; 64 Insect
	db	 65, 32	; 65 Manta
	db	 66, 32	; 66 MultiL
	db	 67, 32	; 67 Wheel
	db	 68, 32	; 68 Rivet
	db	 69, 32	; 69 Centar
	db	 70, 32	; 70 Saurus
	db	 71, 32	; 71 Tntacl
	db	 72, 32	; 72 Crab
	db	 73, 32	; 73 Wasp
	db	 74, 32	; 74 Magic
	db	 75, 64	; 75 Thrst1
	db	 76, 64	; 76 Thrst2
	db	 77, 64	; 77 Thrst3
	db	 78, 64	; 78 Thrst4
	db	 79, 64	; 79 Thrst5
	db	 80, 64	; 80 Bird
	db	 81, 64	; 81 Seraph
	db	 82, 64	; 82 Fin
	db	 83, 64	; 83 Bardos
	db	 84, 64	; 84 Bug
	db	 85, 64	; 85 Seed
	db	 86, 64	; 86 Robe
	db	 87, 64	; 87 Cape
	db	 88, 64	; 88 SJW
	db	 89, 64	; 89 Grav
	db	 90, 64	; 90 Fuzion
	db	 91, 64	; 91 Titan
	db	 92, 64	; 92 C-Lion
	db	 93, 64	; 93 Mikal
	db	 94, 64	; 94 DWing
	db	 95,128	; 95 BtFist
	db	 96,128	; 96 PwrHnd
	db	 97,128	; 97 ArmHnd
	db	 98,128	; 98 SlkHnd
	db	 99,128	; 99 OakHnd
	db	100,128	; 100 Crssbw
	db	101,128	; 101 H-Gun
	db	102,128	; 102 IceBlw
	db	103,128	; 103 Hydro
	db	104,128	; 104 Hawk
	db	105,128	; 105 AirHnd
	db	106,128	; 106 Killer
	db	107,128	; 107 Ogre
	db	108,128	; 108 Golem
	db	109,128	; 109 Giant
	db	110,128	; 110 Magma
	db	111,128	; 111 Binder
	db	112,128	; 112 Hammer
	db	113,128	; 113 Pliers
	db	114,128	; 114 Blade
	db	115,128	; 115 Driver
	db	116,128	; 116 Drill
	db	117,128	; 117 GrvHmr
	db	118,128	; 118 Cutter
	db	119,128	; 119 3DDvr
	db	120,128	; 120 Rapier
	db	121,128	; 121 Sabre
	db	122,128	; 122 Dirk
	db	123,128	; 123 Sabre+
	db	124,128	; 124 Gradus
	db	125,128	; 125 Gram
	db	126,128	; 126 Lavatn
	db	127,128	; 127 Wyndia
	db	128,128	; 128 Demon
	db	129,128	; 129 Crsadr
	db	130,128	; 130 HndAxe
	db	131,128	; 131 BtlAxe
	db	132,128	; 132 Tomhwk
	db	133,128	; 133 2Edge
	db	134,128	; 134 Break
	db	135,128	; 135 BllArm
	db	136,128	; 136 MgaBll
	db	137,128	; 137 NoWire
	db	138,128	; 138 Crushr
	db	139,128	; 139 Sthrn+
	db	140,128	; 140 Lancer
	db	141,128	; 141 DrlArm
	db	142,128	; 142 Pierce
	db	143,128	; 143 Trnado
	db	144,128	; 144 Spiral
	db	145,128	; 145 Hook
	db	146,128	; 146 LogHk
	db	147,128	; 147 BtlHk
	db	148,128	; 148 IceClw
	db	149,128	; 149 DvlClw
	db	150,128	; 150 Whip
	db	151,128	; 151 Whip+
	db	152,128	; 152 FBoot
	db	153,128	; 153 9Tail
	db	154,128	; 154 EBoot
	db	155,128	; 155 Fork
	db	156,128	; 156 HkClaw
	db	157,128	; 157 Tridnt
	db	158,128	; 158 WlfClw
	db	159,128	; 159 TgrClw
	db	160,128	; 160 Disc
	db	161,128	; 161 SpikeD
	db	162,128	; 162 RingD
	db	163,128	; 163 Disc+
	db	164,128	; 164 AirD
	db	165,128	; 165 EWire
	db	166,128	; 166 ArmWre
	db	167,128	; 167 Tangle
	db	168,128	; 168 Lghtng
	db	169,128	; 169 Coil
	db	170,128	; 170 Mage
	db	171,128	; 171 Wizard
	db	172,128	; 172 Warlok
	db	173,128	; 173 ArchMg
	db	174,128	; 174 GodHnd
	db	175,128	; 175 Skull
	db	176,128	; 176 DgnHed
	db	177,128	; 177 DrkClw
	db	178,128	; 178 Cursed
	db	179,128	; 179 Infrno
	db	180,128	; 180 Spring
	db	181,128	; 181 Curler
	db	182,128	; 182 Snaker
	db	183,128	; 183 Zoomer
	db	184,128	; 184 Buster
	db	185,128	; 185 Claw
	db	186,128	; 186 Triger
	db	187,128	; 187 Qatar
	db	188,128	; 188 Indra
	db	189,128	; 189 Agni
	db	190,128	; 190 Maxi
	db	191,128	; 191 Twin
	db	192,128	; 192 FPlse
	db	193,128	; 193 IcePls
	db	194,128	; 194 Ashra
	db	195,128	; 195 Bazoka
	db	196,128	; 196 SDisc
	db	197,128	; 197 Chnsaw
	db	198,128	; 198 Saw
	db	199,128	; 199 Hacker
	db	200,128	; 200 Knukle
	db	201,128	; 201 Gloves
	db	202,128	; 202 Rocket
	db	203,128	; 203 Mail
	db	204,128	; 204 Plate
	db	205,128	; 205 Troopr
	db	206,128	; 206 Scorp
	db	207,128	; 207 Spider
	db	208,128	; 208 Mantis
	db	209,128	; 209 RedClw
	db	210,128	; 210 HndGun
	db	211,128	; 211 Vulcan
	db	212,128	; 212 Lncher
	db	213,128	; 213 Gatlng
	db	214,128	; 214 Phalnx
	db	215,128	; 215 Cannon
	db	216,128	; 216 2Barrl
	db	217,128	; 217 LineGn
	db	218,128	; 218 XGun
	db	219,128	; 219 RailGn
	db	220,128	; 220 Flint
	db	221,128	; 221 Sword
	db	222,128	; 222 Kama
	db	223,128	; 223 TgrHnd
	db	224,128	; 224 MoleHd
	db	225,128	; 225 Stunr
	db	226,128	; 226 Needle
	db	227,128	; 227 Pole
	db	  0,  0	; 228
	db	  0,  0	; 229
	db	  0,  0	; 230
	db	  0,  0	; 231
	db	  0,  0	; 232
	db	  0,  0	; 233
	db	  0,  0	; 234
	db	  0,  0	; 235
	db	  0,  0	; 236
	db	  0,  0	; 237
	db	  0,  0	; 238
	db	  0,  0	; 239
