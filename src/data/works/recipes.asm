; Recipes (recipes): 1995 records of 3 bytes, one line per id; keep the order and count.
; Works > Develop. GetRecipe 0x21D192: Recipes + 3 * (15 * (arm - 1) + material - 1).
; Line id = arm.material: arm 1-133 = part id - 94 (tables/parts/), material 1-15 = item id - 56
; (tables/items/: Steel Silver Gold Tngstn Platnm Mithrl Slmndr Dryad Undine Sylph Gnome Hirokn
; Oricon Zeus Hades). pct 255 = no recipe (the % box stays blank; the other two
; columns are then unused, mostly 1 1). `empty` = 3 x FF.
; pct: base success %. UpdateDevelopChance 0x2189BD shows (wDevelopChance 0x6190)
;   min(100, min(100, pct + dev_level_bonus[partner gender][engineer level])
;            + dev_partner_bonus[partner race/gender]) + tool bonus, capped at 100;
;   tool bonus (0x21BA1F): Tool1 5, Tool2 10, Tool3 15, Tool4 20, Myster 100.
;   DevelopRoll 0x21A9A9 takes the arm, material and tool, then succeeds if a random
;   0-99 is below that %. (Play: 88/85/88 % for BtFist+Steel+Tool1 at RenaB levels 1/7/12,
;   60/62 % at 49/50; failures lose all three. Mariner run: 127 develops, Shera levels 34-50,
;   every shown % matches the formula, every result matches `result`.)
; result: the new arm (arm number as above). dev_exp: taken off the engineer's EXP to next
; level (wEngineerExp) below level 50; see tables/dev_level_exp/. (Play: Hammer 5, Pliers 10.)
; id: pct, result, dev_exp
	db	 80,  2, 5	; 1.1 BtFist + Steel -> PwrHnd
	db	 80,  2, 5	; 1.2 BtFist + Silver -> PwrHnd
	db	255,  1, 1	; 1.3 BtFist + Gold
	db	 80,  2, 5	; 1.4 BtFist + Tngstn -> PwrHnd
	db	255,  1, 1	; 1.5 BtFist + Platnm
	db	 80,  2, 5	; 1.6 BtFist + Mithrl -> PwrHnd
	db	 80,  2, 5	; 1.7 BtFist + Slmndr -> PwrHnd
	db	255,  1, 1	; 1.8 BtFist + Dryad
	db	255,  1, 1	; 1.9 BtFist + Undine
	db	 80,  2, 5	; 1.10 BtFist + Sylph -> PwrHnd
	db	255,  1, 1	; 1.11 BtFist + Gnome
	db	 80,  2, 5	; 1.12 BtFist + Hirokn -> PwrHnd
	db	255,  1, 1	; 1.13 BtFist + Oricon
	db	 80,  2, 5	; 1.14 BtFist + Zeus -> PwrHnd
	db	255,  1, 1	; 1.15 BtFist + Hades
	db	255,  2, 1	; 2.1 PwrHnd + Steel
	db	255,  2, 1	; 2.2 PwrHnd + Silver
	db	255,  2, 1	; 2.3 PwrHnd + Gold
	db	 30,  3,10	; 2.4 PwrHnd + Tngstn -> ArmHnd
	db	255,  2, 1	; 2.5 PwrHnd + Platnm
	db	 30,  3,10	; 2.6 PwrHnd + Mithrl -> ArmHnd
	db	 30,  3,10	; 2.7 PwrHnd + Slmndr -> ArmHnd
	db	255,  2, 1	; 2.8 PwrHnd + Dryad
	db	255,  2, 1	; 2.9 PwrHnd + Undine
	db	 30,  3,10	; 2.10 PwrHnd + Sylph -> ArmHnd
	db	255,  2, 1	; 2.11 PwrHnd + Gnome
	db	 30,  3,10	; 2.12 PwrHnd + Hirokn -> ArmHnd
	db	255,  2, 1	; 2.13 PwrHnd + Oricon
	db	 30,  3,10	; 2.14 PwrHnd + Zeus -> ArmHnd
	db	255,  2, 1	; 2.15 PwrHnd + Hades
	db	255,  3, 1	; 3.1 ArmHnd + Steel
	db	255,  3, 1	; 3.2 ArmHnd + Silver
	db	255,  3, 1	; 3.3 ArmHnd + Gold
	db	255,  3, 1	; 3.4 ArmHnd + Tngstn
	db	255,  3, 1	; 3.5 ArmHnd + Platnm
	db	255,  3, 1	; 3.6 ArmHnd + Mithrl
	db	255,  3, 1	; 3.7 ArmHnd + Slmndr
	db	255,  3, 1	; 3.8 ArmHnd + Dryad
	db	255,  3, 1	; 3.9 ArmHnd + Undine
	db	255,  3, 1	; 3.10 ArmHnd + Sylph
	db	255,  3, 1	; 3.11 ArmHnd + Gnome
	db	255,  3, 1	; 3.12 ArmHnd + Hirokn
	db	255,  3, 1	; 3.13 ArmHnd + Oricon
	db	255,  3, 1	; 3.14 ArmHnd + Zeus
	db	255,  3, 1	; 3.15 ArmHnd + Hades
	db	255,  4, 1	; 4.1 SlkHnd + Steel
	db	 80,  5, 5	; 4.2 SlkHnd + Silver -> OakHnd
	db	 80,  5, 5	; 4.3 SlkHnd + Gold -> OakHnd
	db	255,  4, 1	; 4.4 SlkHnd + Tngstn
	db	 80,  5, 5	; 4.5 SlkHnd + Platnm -> OakHnd
	db	 80,  5, 5	; 4.6 SlkHnd + Mithrl -> OakHnd
	db	255,  4, 1	; 4.7 SlkHnd + Slmndr
	db	 80,  5, 5	; 4.8 SlkHnd + Dryad -> OakHnd
	db	255,  4, 1	; 4.9 SlkHnd + Undine
	db	255,  4, 1	; 4.10 SlkHnd + Sylph
	db	 80,  5, 5	; 4.11 SlkHnd + Gnome -> OakHnd
	db	255,  4, 1	; 4.12 SlkHnd + Hirokn
	db	 80,  5, 5	; 4.13 SlkHnd + Oricon -> OakHnd
	db	 80,  5, 5	; 4.14 SlkHnd + Zeus -> OakHnd
	db	255,  4, 1	; 4.15 SlkHnd + Hades
	db	255,  5, 1	; 5.1 OakHnd + Steel
	db	255,  5, 1	; 5.2 OakHnd + Silver
	db	255,  5, 1	; 5.3 OakHnd + Gold
	db	255,  5, 1	; 5.4 OakHnd + Tngstn
	db	 30,  6,10	; 5.5 OakHnd + Platnm -> Crssbw
	db	 30,  6,10	; 5.6 OakHnd + Mithrl -> Crssbw
	db	255,  5, 1	; 5.7 OakHnd + Slmndr
	db	 30,  6,10	; 5.8 OakHnd + Dryad -> Crssbw
	db	255,  5, 1	; 5.9 OakHnd + Undine
	db	255,  5, 1	; 5.10 OakHnd + Sylph
	db	 30,  6,10	; 5.11 OakHnd + Gnome -> Crssbw
	db	255,  5, 1	; 5.12 OakHnd + Hirokn
	db	 30,  6,10	; 5.13 OakHnd + Oricon -> Crssbw
	db	 30,  6,10	; 5.14 OakHnd + Zeus -> Crssbw
	db	255,  5, 1	; 5.15 OakHnd + Hades
	db	255,  6, 1	; 6.1 Crssbw + Steel
	db	255,  6, 1	; 6.2 Crssbw + Silver
	db	255,  6, 1	; 6.3 Crssbw + Gold
	db	255,  6, 1	; 6.4 Crssbw + Tngstn
	db	255,  6, 1	; 6.5 Crssbw + Platnm
	db	255,  6, 1	; 6.6 Crssbw + Mithrl
	db	255,  6, 1	; 6.7 Crssbw + Slmndr
	db	255,  6, 1	; 6.8 Crssbw + Dryad
	db	255,  6, 1	; 6.9 Crssbw + Undine
	db	255,  6, 1	; 6.10 Crssbw + Sylph
	db	255,  6, 1	; 6.11 Crssbw + Gnome
	db	255,  6, 1	; 6.12 Crssbw + Hirokn
	db	255,  6, 1	; 6.13 Crssbw + Oricon
	db	255,  6, 1	; 6.14 Crssbw + Zeus
	db	255,  6, 1	; 6.15 Crssbw + Hades
	db	255,  7, 1	; 7.1 H-Gun + Steel
	db	 80,  8, 5	; 7.2 H-Gun + Silver -> IceBlw
	db	 80,  8, 5	; 7.3 H-Gun + Gold -> IceBlw
	db	255,  7, 1	; 7.4 H-Gun + Tngstn
	db	 80,  8, 5	; 7.5 H-Gun + Platnm -> IceBlw
	db	 80,  8, 5	; 7.6 H-Gun + Mithrl -> IceBlw
	db	255,  7, 1	; 7.7 H-Gun + Slmndr
	db	 80,  8, 5	; 7.8 H-Gun + Dryad -> IceBlw
	db	 80,  8, 5	; 7.9 H-Gun + Undine -> IceBlw
	db	255,  7, 1	; 7.10 H-Gun + Sylph
	db	255,  7, 1	; 7.11 H-Gun + Gnome
	db	255,  7, 1	; 7.12 H-Gun + Hirokn
	db	 80,  8, 5	; 7.13 H-Gun + Oricon -> IceBlw
	db	 80,  8, 5	; 7.14 H-Gun + Zeus -> IceBlw
	db	255,  7, 1	; 7.15 H-Gun + Hades
	db	255,  8, 1	; 8.1 IceBlw + Steel
	db	255,  8, 1	; 8.2 IceBlw + Silver
	db	255,  8, 1	; 8.3 IceBlw + Gold
	db	255,  8, 1	; 8.4 IceBlw + Tngstn
	db	 30,  9,10	; 8.5 IceBlw + Platnm -> Hydro
	db	 30,  9,10	; 8.6 IceBlw + Mithrl -> Hydro
	db	255,  8, 1	; 8.7 IceBlw + Slmndr
	db	 30,  9,10	; 8.8 IceBlw + Dryad -> Hydro
	db	 30,  9,10	; 8.9 IceBlw + Undine -> Hydro
	db	255,  8, 1	; 8.10 IceBlw + Sylph
	db	255,  8, 1	; 8.11 IceBlw + Gnome
	db	255,  8, 1	; 8.12 IceBlw + Hirokn
	db	 30,  9,10	; 8.13 IceBlw + Oricon -> Hydro
	db	 30,  9,10	; 8.14 IceBlw + Zeus -> Hydro
	db	255,  8, 1	; 8.15 IceBlw + Hades
	db	255,  9, 1	; 9.1 Hydro + Steel
	db	255,  9, 1	; 9.2 Hydro + Silver
	db	255,  9, 1	; 9.3 Hydro + Gold
	db	255,  9, 1	; 9.4 Hydro + Tngstn
	db	255,  9, 1	; 9.5 Hydro + Platnm
	db	255,  9, 1	; 9.6 Hydro + Mithrl
	db	255,  9, 1	; 9.7 Hydro + Slmndr
	db	255,  9, 1	; 9.8 Hydro + Dryad
	db	255,  9, 1	; 9.9 Hydro + Undine
	db	255,  9, 1	; 9.10 Hydro + Sylph
	db	255,  9, 1	; 9.11 Hydro + Gnome
	db	255,  9, 1	; 9.12 Hydro + Hirokn
	db	255,  9, 1	; 9.13 Hydro + Oricon
	db	255,  9, 1	; 9.14 Hydro + Zeus
	db	255,  9, 1	; 9.15 Hydro + Hades
	db	255, 10, 1	; 10.1 Hawk + Steel
	db	 80, 11, 5	; 10.2 Hawk + Silver -> AirHnd
	db	 80, 11, 5	; 10.3 Hawk + Gold -> AirHnd
	db	255, 10, 1	; 10.4 Hawk + Tngstn
	db	 80, 11, 5	; 10.5 Hawk + Platnm -> AirHnd
	db	 80, 11, 5	; 10.6 Hawk + Mithrl -> AirHnd
	db	255, 10, 1	; 10.7 Hawk + Slmndr
	db	255, 10, 1	; 10.8 Hawk + Dryad
	db	 80, 11, 5	; 10.9 Hawk + Undine -> AirHnd
	db	 80, 11, 5	; 10.10 Hawk + Sylph -> AirHnd
	db	255, 10, 1	; 10.11 Hawk + Gnome
	db	255, 10, 1	; 10.12 Hawk + Hirokn
	db	 80, 11, 5	; 10.13 Hawk + Oricon -> AirHnd
	db	 80, 11, 5	; 10.14 Hawk + Zeus -> AirHnd
	db	255, 10, 1	; 10.15 Hawk + Hades
	db	255, 11, 1	; 11.1 AirHnd + Steel
	db	255, 11, 1	; 11.2 AirHnd + Silver
	db	255, 11, 1	; 11.3 AirHnd + Gold
	db	255, 11, 1	; 11.4 AirHnd + Tngstn
	db	 30, 12,10	; 11.5 AirHnd + Platnm -> Killer
	db	 30, 12,10	; 11.6 AirHnd + Mithrl -> Killer
	db	255, 11, 1	; 11.7 AirHnd + Slmndr
	db	255, 11, 1	; 11.8 AirHnd + Dryad
	db	 30, 12,10	; 11.9 AirHnd + Undine -> Killer
	db	 30, 12,10	; 11.10 AirHnd + Sylph -> Killer
	db	255, 11, 1	; 11.11 AirHnd + Gnome
	db	255, 11, 1	; 11.12 AirHnd + Hirokn
	db	 30, 12,10	; 11.13 AirHnd + Oricon -> Killer
	db	 30, 12,10	; 11.14 AirHnd + Zeus -> Killer
	db	255, 11, 1	; 11.15 AirHnd + Hades
	db	255, 12, 1	; 12.1 Killer + Steel
	db	255, 12, 1	; 12.2 Killer + Silver
	db	255, 12, 1	; 12.3 Killer + Gold
	db	255, 12, 1	; 12.4 Killer + Tngstn
	db	255, 12, 1	; 12.5 Killer + Platnm
	db	255, 12, 1	; 12.6 Killer + Mithrl
	db	255, 12, 1	; 12.7 Killer + Slmndr
	db	255, 12, 1	; 12.8 Killer + Dryad
	db	255, 12, 1	; 12.9 Killer + Undine
	db	255, 12, 1	; 12.10 Killer + Sylph
	db	255, 12, 1	; 12.11 Killer + Gnome
	db	255, 12, 1	; 12.12 Killer + Hirokn
	db	255, 12, 1	; 12.13 Killer + Oricon
	db	255, 12, 1	; 12.14 Killer + Zeus
	db	255, 12, 1	; 12.15 Killer + Hades
	db	 80, 14, 5	; 13.1 Ogre + Steel -> Golem
	db	 80, 14, 5	; 13.2 Ogre + Silver -> Golem
	db	255, 13, 1	; 13.3 Ogre + Gold
	db	 80, 14, 5	; 13.4 Ogre + Tngstn -> Golem
	db	255, 13, 1	; 13.5 Ogre + Platnm
	db	 80, 14, 5	; 13.6 Ogre + Mithrl -> Golem
	db	 80, 14, 5	; 13.7 Ogre + Slmndr -> Golem
	db	255, 13, 1	; 13.8 Ogre + Dryad
	db	255, 13, 1	; 13.9 Ogre + Undine
	db	255, 13, 1	; 13.10 Ogre + Sylph
	db	 80, 14, 5	; 13.11 Ogre + Gnome -> Golem
	db	 80, 14, 5	; 13.12 Ogre + Hirokn -> Golem
	db	255, 13, 1	; 13.13 Ogre + Oricon
	db	 80, 14, 5	; 13.14 Ogre + Zeus -> Golem
	db	255, 13, 1	; 13.15 Ogre + Hades
	db	255, 14, 1	; 14.1 Golem + Steel
	db	255, 14, 1	; 14.2 Golem + Silver
	db	255, 14, 1	; 14.3 Golem + Gold
	db	 30, 15,10	; 14.4 Golem + Tngstn -> Giant
	db	255, 14, 1	; 14.5 Golem + Platnm
	db	 30, 15,10	; 14.6 Golem + Mithrl -> Giant
	db	 30, 15,10	; 14.7 Golem + Slmndr -> Giant
	db	255, 14, 1	; 14.8 Golem + Dryad
	db	255, 14, 1	; 14.9 Golem + Undine
	db	255, 14, 1	; 14.10 Golem + Sylph
	db	 30, 15,10	; 14.11 Golem + Gnome -> Giant
	db	 30, 15,10	; 14.12 Golem + Hirokn -> Giant
	db	255, 14, 1	; 14.13 Golem + Oricon
	db	 30, 15,10	; 14.14 Golem + Zeus -> Giant
	db	255, 14, 1	; 14.15 Golem + Hades
	db	255, 15, 1	; 15.1 Giant + Steel
	db	255, 15, 1	; 15.2 Giant + Silver
	db	255, 15, 1	; 15.3 Giant + Gold
	db	255, 15, 1	; 15.4 Giant + Tngstn
	db	255, 15, 1	; 15.5 Giant + Platnm
	db	255, 15, 1	; 15.6 Giant + Mithrl
	db	255, 15, 1	; 15.7 Giant + Slmndr
	db	255, 15, 1	; 15.8 Giant + Dryad
	db	255, 15, 1	; 15.9 Giant + Undine
	db	255, 15, 1	; 15.10 Giant + Sylph
	db	255, 15, 1	; 15.11 Giant + Gnome
	db	255, 15, 1	; 15.12 Giant + Hirokn
	db	255, 15, 1	; 15.13 Giant + Oricon
	db	255, 15, 1	; 15.14 Giant + Zeus
	db	255, 15, 1	; 15.15 Giant + Hades
	db	 80, 17, 5	; 16.1 Magma + Steel -> Binder
	db	 80, 21, 5	; 16.2 Magma + Silver -> Driver
	db	 80, 18, 5	; 16.3 Magma + Gold -> Hammer
	db	 80, 17, 5	; 16.4 Magma + Tngstn -> Binder
	db	 80, 21, 5	; 16.5 Magma + Platnm -> Driver
	db	 80, 18, 5	; 16.6 Magma + Mithrl -> Hammer
	db	255, 16, 1	; 16.7 Magma + Slmndr
	db	255, 16, 1	; 16.8 Magma + Dryad
	db	255, 16, 1	; 16.9 Magma + Undine
	db	255, 16, 1	; 16.10 Magma + Sylph
	db	255, 16, 1	; 16.11 Magma + Gnome
	db	255, 16, 1	; 16.12 Magma + Hirokn
	db	255, 16, 1	; 16.13 Magma + Oricon
	db	255, 16, 1	; 16.14 Magma + Zeus
	db	255, 16, 1	; 16.15 Magma + Hades
	db	255, 17, 1	; 17.1 Binder + Steel
	db	255, 17, 1	; 17.2 Binder + Silver
	db	255, 17, 1	; 17.3 Binder + Gold
	db	255, 17, 1	; 17.4 Binder + Tngstn
	db	 30, 20,10	; 17.5 Binder + Platnm -> Blade
	db	 30, 20,10	; 17.6 Binder + Mithrl -> Blade
	db	255, 17, 1	; 17.7 Binder + Slmndr
	db	 30, 20,10	; 17.8 Binder + Dryad -> Blade
	db	 30, 20,10	; 17.9 Binder + Undine -> Blade
	db	 30, 20,10	; 17.10 Binder + Sylph -> Blade
	db	255, 17, 1	; 17.11 Binder + Gnome
	db	255, 17, 1	; 17.12 Binder + Hirokn
	db	255, 17, 1	; 17.13 Binder + Oricon
	db	 30, 20,10	; 17.14 Binder + Zeus -> Blade
	db	255, 17, 1	; 17.15 Binder + Hades
	db	255, 18, 1	; 18.1 Hammer + Steel
	db	255, 18, 1	; 18.2 Hammer + Silver
	db	255, 18, 1	; 18.3 Hammer + Gold
	db	 30, 19,10	; 18.4 Hammer + Tngstn -> Pliers
	db	 30, 19,10	; 18.5 Hammer + Platnm -> Pliers
	db	255, 18, 1	; 18.6 Hammer + Mithrl
	db	 30, 19,10	; 18.7 Hammer + Slmndr -> Pliers
	db	255, 18, 1	; 18.8 Hammer + Dryad
	db	 30, 19,10	; 18.9 Hammer + Undine -> Pliers
	db	255, 18, 1	; 18.10 Hammer + Sylph
	db	 30, 19,10	; 18.11 Hammer + Gnome -> Pliers
	db	255, 18, 1	; 18.12 Hammer + Hirokn
	db	255, 18, 1	; 18.13 Hammer + Oricon
	db	 30, 19,10	; 18.14 Hammer + Zeus -> Pliers
	db	255, 18, 1	; 18.15 Hammer + Hades
	db	255, 19, 1	; 19.1 Pliers + Steel
	db	255, 19, 1	; 19.2 Pliers + Silver
	db	255, 19, 1	; 19.3 Pliers + Gold
	db	255, 19, 1	; 19.4 Pliers + Tngstn
	db	255, 19, 1	; 19.5 Pliers + Platnm
	db	255, 19, 1	; 19.6 Pliers + Mithrl
	db	255, 19, 1	; 19.7 Pliers + Slmndr
	db	255, 19, 1	; 19.8 Pliers + Dryad
	db	255, 19, 1	; 19.9 Pliers + Undine
	db	255, 19, 1	; 19.10 Pliers + Sylph
	db	255, 19, 1	; 19.11 Pliers + Gnome
	db	255, 19, 1	; 19.12 Pliers + Hirokn
	db	 10, 23,15	; 19.13 Pliers + Oricon -> GrvHmr
	db	 10, 23,15	; 19.14 Pliers + Zeus -> GrvHmr
	db	255, 19, 1	; 19.15 Pliers + Hades
	db	255, 20, 1	; 20.1 Blade + Steel
	db	255, 20, 1	; 20.2 Blade + Silver
	db	255, 20, 1	; 20.3 Blade + Gold
	db	255, 20, 1	; 20.4 Blade + Tngstn
	db	255, 20, 1	; 20.5 Blade + Platnm
	db	255, 20, 1	; 20.6 Blade + Mithrl
	db	255, 20, 1	; 20.7 Blade + Slmndr
	db	255, 20, 1	; 20.8 Blade + Dryad
	db	255, 20, 1	; 20.9 Blade + Undine
	db	255, 20, 1	; 20.10 Blade + Sylph
	db	255, 20, 1	; 20.11 Blade + Gnome
	db	 10, 24,15	; 20.12 Blade + Hirokn -> Cutter
	db	255, 20, 1	; 20.13 Blade + Oricon
	db	 10, 24,15	; 20.14 Blade + Zeus -> Cutter
	db	255, 20, 1	; 20.15 Blade + Hades
	db	255, 21, 1	; 21.1 Driver + Steel
	db	255, 21, 1	; 21.2 Driver + Silver
	db	255, 21, 1	; 21.3 Driver + Gold
	db	 30, 22,10	; 21.4 Driver + Tngstn -> Drill
	db	255, 21, 1	; 21.5 Driver + Platnm
	db	 30, 22,10	; 21.6 Driver + Mithrl -> Drill
	db	255, 21, 1	; 21.7 Driver + Slmndr
	db	 30, 22,10	; 21.8 Driver + Dryad -> Drill
	db	255, 21, 1	; 21.9 Driver + Undine
	db	 30, 22,10	; 21.10 Driver + Sylph -> Drill
	db	 30, 22,10	; 21.11 Driver + Gnome -> Drill
	db	255, 21, 1	; 21.12 Driver + Hirokn
	db	255, 21, 1	; 21.13 Driver + Oricon
	db	 30, 22,10	; 21.14 Driver + Zeus -> Drill
	db	255, 21, 1	; 21.15 Driver + Hades
	db	255, 22, 1	; 22.1 Drill + Steel
	db	255, 22, 1	; 22.2 Drill + Silver
	db	255, 22, 1	; 22.3 Drill + Gold
	db	255, 22, 1	; 22.4 Drill + Tngstn
	db	255, 22, 1	; 22.5 Drill + Platnm
	db	255, 22, 1	; 22.6 Drill + Mithrl
	db	255, 22, 1	; 22.7 Drill + Slmndr
	db	255, 22, 1	; 22.8 Drill + Dryad
	db	255, 22, 1	; 22.9 Drill + Undine
	db	255, 22, 1	; 22.10 Drill + Sylph
	db	255, 22, 1	; 22.11 Drill + Gnome
	db	255, 22, 1	; 22.12 Drill + Hirokn
	db	 10, 25,15	; 22.13 Drill + Oricon -> 3DDvr
	db	 10, 25,15	; 22.14 Drill + Zeus -> 3DDvr
	db	255, 22, 1	; 22.15 Drill + Hades
	db	255, 23, 1	; 23.1 GrvHmr + Steel
	db	255, 23, 1	; 23.2 GrvHmr + Silver
	db	255, 23, 1	; 23.3 GrvHmr + Gold
	db	255, 23, 1	; 23.4 GrvHmr + Tngstn
	db	255, 23, 1	; 23.5 GrvHmr + Platnm
	db	255, 23, 1	; 23.6 GrvHmr + Mithrl
	db	255, 23, 1	; 23.7 GrvHmr + Slmndr
	db	255, 23, 1	; 23.8 GrvHmr + Dryad
	db	255, 23, 1	; 23.9 GrvHmr + Undine
	db	255, 23, 1	; 23.10 GrvHmr + Sylph
	db	255, 23, 1	; 23.11 GrvHmr + Gnome
	db	255, 23, 1	; 23.12 GrvHmr + Hirokn
	db	255, 23, 1	; 23.13 GrvHmr + Oricon
	db	255, 23, 1	; 23.14 GrvHmr + Zeus
	db	255, 23, 1	; 23.15 GrvHmr + Hades
	db	255, 24, 1	; 24.1 Cutter + Steel
	db	255, 24, 1	; 24.2 Cutter + Silver
	db	255, 24, 1	; 24.3 Cutter + Gold
	db	255, 24, 1	; 24.4 Cutter + Tngstn
	db	255, 24, 1	; 24.5 Cutter + Platnm
	db	255, 24, 1	; 24.6 Cutter + Mithrl
	db	255, 24, 1	; 24.7 Cutter + Slmndr
	db	255, 24, 1	; 24.8 Cutter + Dryad
	db	255, 24, 1	; 24.9 Cutter + Undine
	db	255, 24, 1	; 24.10 Cutter + Sylph
	db	255, 24, 1	; 24.11 Cutter + Gnome
	db	255, 24, 1	; 24.12 Cutter + Hirokn
	db	255, 24, 1	; 24.13 Cutter + Oricon
	db	255, 24, 1	; 24.14 Cutter + Zeus
	db	255, 24, 1	; 24.15 Cutter + Hades
	db	255, 25, 1	; 25.1 3DDvr + Steel
	db	255, 25, 1	; 25.2 3DDvr + Silver
	db	255, 25, 1	; 25.3 3DDvr + Gold
	db	255, 25, 1	; 25.4 3DDvr + Tngstn
	db	255, 25, 1	; 25.5 3DDvr + Platnm
	db	255, 25, 1	; 25.6 3DDvr + Mithrl
	db	255, 25, 1	; 25.7 3DDvr + Slmndr
	db	255, 25, 1	; 25.8 3DDvr + Dryad
	db	255, 25, 1	; 25.9 3DDvr + Undine
	db	255, 25, 1	; 25.10 3DDvr + Sylph
	db	255, 25, 1	; 25.11 3DDvr + Gnome
	db	255, 25, 1	; 25.12 3DDvr + Hirokn
	db	255, 25, 1	; 25.13 3DDvr + Oricon
	db	255, 25, 1	; 25.14 3DDvr + Zeus
	db	255, 25, 1	; 25.15 3DDvr + Hades
	db	 80, 28, 5	; 26.1 Rapier + Steel -> Dirk
	db	 80, 27, 5	; 26.2 Rapier + Silver -> Sabre
	db	255, 26, 1	; 26.3 Rapier + Gold
	db	 80, 28, 5	; 26.4 Rapier + Tngstn -> Dirk
	db	 80, 27, 5	; 26.5 Rapier + Platnm -> Sabre
	db	255, 26, 1	; 26.6 Rapier + Mithrl
	db	255, 26, 1	; 26.7 Rapier + Slmndr
	db	255, 26, 1	; 26.8 Rapier + Dryad
	db	255, 26, 1	; 26.9 Rapier + Undine
	db	255, 26, 1	; 26.10 Rapier + Sylph
	db	255, 26, 1	; 26.11 Rapier + Gnome
	db	 80, 28, 5	; 26.12 Rapier + Hirokn -> Dirk
	db	 80, 27, 5	; 26.13 Rapier + Oricon -> Sabre
	db	255, 26, 1	; 26.14 Rapier + Zeus
	db	255, 26, 1	; 26.15 Rapier + Hades
	db	255, 27, 1	; 27.1 Sabre + Steel
	db	255, 27, 1	; 27.2 Sabre + Silver
	db	255, 27, 1	; 27.3 Sabre + Gold
	db	255, 27, 1	; 27.4 Sabre + Tngstn
	db	 30, 29,10	; 27.5 Sabre + Platnm -> Sabre+
	db	 30, 29,10	; 27.6 Sabre + Mithrl -> Sabre+
	db	255, 27, 1	; 27.7 Sabre + Slmndr
	db	 30, 29,10	; 27.8 Sabre + Dryad -> Sabre+
	db	255, 27, 1	; 27.9 Sabre + Undine
	db	 30, 29,10	; 27.10 Sabre + Sylph -> Sabre+
	db	255, 27, 1	; 27.11 Sabre + Gnome
	db	255, 27, 1	; 27.12 Sabre + Hirokn
	db	 30, 29,10	; 27.13 Sabre + Oricon -> Sabre+
	db	 30, 29,10	; 27.14 Sabre + Zeus -> Sabre+
	db	255, 27, 1	; 27.15 Sabre + Hades
	db	255, 28, 1	; 28.1 Dirk + Steel
	db	255, 28, 1	; 28.2 Dirk + Silver
	db	255, 28, 1	; 28.3 Dirk + Gold
	db	 30, 30,10	; 28.4 Dirk + Tngstn -> Gradus
	db	255, 28, 1	; 28.5 Dirk + Platnm
	db	 30, 30,10	; 28.6 Dirk + Mithrl -> Gradus
	db	255, 28, 1	; 28.7 Dirk + Slmndr
	db	255, 28, 1	; 28.8 Dirk + Dryad
	db	 30, 30,10	; 28.9 Dirk + Undine -> Gradus
	db	255, 28, 1	; 28.10 Dirk + Sylph
	db	 30, 30,10	; 28.11 Dirk + Gnome -> Gradus
	db	 30, 30,10	; 28.12 Dirk + Hirokn -> Gradus
	db	255, 28, 1	; 28.13 Dirk + Oricon
	db	 30, 30,10	; 28.14 Dirk + Zeus -> Gradus
	db	255, 28, 1	; 28.15 Dirk + Hades
	db	255, 29, 1	; 29.1 Sabre+ + Steel
	db	255, 29, 1	; 29.2 Sabre+ + Silver
	db	255, 29, 1	; 29.3 Sabre+ + Gold
	db	255, 29, 1	; 29.4 Sabre+ + Tngstn
	db	255, 29, 1	; 29.5 Sabre+ + Platnm
	db	255, 29, 1	; 29.6 Sabre+ + Mithrl
	db	 10, 33,15	; 29.7 Sabre+ + Slmndr -> Wyndia
	db	 10, 31,15	; 29.8 Sabre+ + Dryad -> Gram
	db	 10, 33,15	; 29.9 Sabre+ + Undine -> Wyndia
	db	 10, 33,15	; 29.10 Sabre+ + Sylph -> Wyndia
	db	 10, 31,15	; 29.11 Sabre+ + Gnome -> Gram
	db	 10, 33,15	; 29.12 Sabre+ + Hirokn -> Wyndia
	db	 10, 31,15	; 29.13 Sabre+ + Oricon -> Gram
	db	255, 29, 1	; 29.14 Sabre+ + Zeus
	db	255, 29, 1	; 29.15 Sabre+ + Hades
	db	255, 30, 1	; 30.1 Gradus + Steel
	db	255, 30, 1	; 30.2 Gradus + Silver
	db	255, 30, 1	; 30.3 Gradus + Gold
	db	255, 30, 1	; 30.4 Gradus + Tngstn
	db	255, 30, 1	; 30.5 Gradus + Platnm
	db	255, 30, 1	; 30.6 Gradus + Mithrl
	db	 10, 32,15	; 30.7 Gradus + Slmndr -> Lavatn
	db	255, 30, 1	; 30.8 Gradus + Dryad
	db	255, 30, 1	; 30.9 Gradus + Undine
	db	255, 30, 1	; 30.10 Gradus + Sylph
	db	 10, 32,15	; 30.11 Gradus + Gnome -> Lavatn
	db	 10, 32,15	; 30.12 Gradus + Hirokn -> Lavatn
	db	255, 30, 1	; 30.13 Gradus + Oricon
	db	 10, 32,15	; 30.14 Gradus + Zeus -> Lavatn
	db	255, 30, 1	; 30.15 Gradus + Hades
	db	255, 31, 1	; 31.1 Gram + Steel
	db	255, 31, 1	; 31.2 Gram + Silver
	db	255, 31, 1	; 31.3 Gram + Gold
	db	255, 31, 1	; 31.4 Gram + Tngstn
	db	255, 31, 1	; 31.5 Gram + Platnm
	db	255, 31, 1	; 31.6 Gram + Mithrl
	db	255, 31, 1	; 31.7 Gram + Slmndr
	db	255, 31, 1	; 31.8 Gram + Dryad
	db	255, 31, 1	; 31.9 Gram + Undine
	db	255, 31, 1	; 31.10 Gram + Sylph
	db	255, 31, 1	; 31.11 Gram + Gnome
	db	255, 31, 1	; 31.12 Gram + Hirokn
	db	255, 31, 1	; 31.13 Gram + Oricon
	db	  5, 35,30	; 31.14 Gram + Zeus -> Crsadr
	db	255, 31, 1	; 31.15 Gram + Hades
	db	255, 32, 1	; 32.1 Lavatn + Steel
	db	255, 32, 1	; 32.2 Lavatn + Silver
	db	255, 32, 1	; 32.3 Lavatn + Gold
	db	255, 32, 1	; 32.4 Lavatn + Tngstn
	db	255, 32, 1	; 32.5 Lavatn + Platnm
	db	255, 32, 1	; 32.6 Lavatn + Mithrl
	db	255, 32, 1	; 32.7 Lavatn + Slmndr
	db	255, 32, 1	; 32.8 Lavatn + Dryad
	db	255, 32, 1	; 32.9 Lavatn + Undine
	db	255, 32, 1	; 32.10 Lavatn + Sylph
	db	255, 32, 1	; 32.11 Lavatn + Gnome
	db	255, 32, 1	; 32.12 Lavatn + Hirokn
	db	255, 32, 1	; 32.13 Lavatn + Oricon
	db	255, 32, 1	; 32.14 Lavatn + Zeus
	db	  5, 34,30	; 32.15 Lavatn + Hades -> Demon
	db	255, 33, 1	; 33.1 Wyndia + Steel
	db	255, 33, 1	; 33.2 Wyndia + Silver
	db	255, 33, 1	; 33.3 Wyndia + Gold
	db	255, 33, 1	; 33.4 Wyndia + Tngstn
	db	255, 33, 1	; 33.5 Wyndia + Platnm
	db	255, 33, 1	; 33.6 Wyndia + Mithrl
	db	255, 33, 1	; 33.7 Wyndia + Slmndr
	db	255, 33, 1	; 33.8 Wyndia + Dryad
	db	255, 33, 1	; 33.9 Wyndia + Undine
	db	255, 33, 1	; 33.10 Wyndia + Sylph
	db	255, 33, 1	; 33.11 Wyndia + Gnome
	db	255, 33, 1	; 33.12 Wyndia + Hirokn
	db	255, 33, 1	; 33.13 Wyndia + Oricon
	db	255, 33, 1	; 33.14 Wyndia + Zeus
	db	255, 33, 1	; 33.15 Wyndia + Hades
	db	255, 34, 1	; 34.1 Demon + Steel
	db	255, 34, 1	; 34.2 Demon + Silver
	db	255, 34, 1	; 34.3 Demon + Gold
	db	255, 34, 1	; 34.4 Demon + Tngstn
	db	255, 34, 1	; 34.5 Demon + Platnm
	db	255, 34, 1	; 34.6 Demon + Mithrl
	db	255, 34, 1	; 34.7 Demon + Slmndr
	db	255, 34, 1	; 34.8 Demon + Dryad
	db	255, 34, 1	; 34.9 Demon + Undine
	db	255, 34, 1	; 34.10 Demon + Sylph
	db	255, 34, 1	; 34.11 Demon + Gnome
	db	255, 34, 1	; 34.12 Demon + Hirokn
	db	255, 34, 1	; 34.13 Demon + Oricon
	db	255, 34, 1	; 34.14 Demon + Zeus
	db	255, 34, 1	; 34.15 Demon + Hades
	db	255, 35, 1	; 35.1 Crsadr + Steel
	db	255, 35, 1	; 35.2 Crsadr + Silver
	db	255, 35, 1	; 35.3 Crsadr + Gold
	db	255, 35, 1	; 35.4 Crsadr + Tngstn
	db	255, 35, 1	; 35.5 Crsadr + Platnm
	db	255, 35, 1	; 35.6 Crsadr + Mithrl
	db	255, 35, 1	; 35.7 Crsadr + Slmndr
	db	255, 35, 1	; 35.8 Crsadr + Dryad
	db	255, 35, 1	; 35.9 Crsadr + Undine
	db	255, 35, 1	; 35.10 Crsadr + Sylph
	db	255, 35, 1	; 35.11 Crsadr + Gnome
	db	255, 35, 1	; 35.12 Crsadr + Hirokn
	db	255, 35, 1	; 35.13 Crsadr + Oricon
	db	255, 35, 1	; 35.14 Crsadr + Zeus
	db	255, 35, 1	; 35.15 Crsadr + Hades
	db	 80, 37, 5	; 36.1 HndAxe + Steel -> BtlAxe
	db	 80, 38, 5	; 36.2 HndAxe + Silver -> Tomhwk
	db	255, 36, 1	; 36.3 HndAxe + Gold
	db	 80, 37, 5	; 36.4 HndAxe + Tngstn -> BtlAxe
	db	 80, 38, 5	; 36.5 HndAxe + Platnm -> Tomhwk
	db	 80, 38, 5	; 36.6 HndAxe + Mithrl -> Tomhwk
	db	255, 36, 1	; 36.7 HndAxe + Slmndr
	db	255, 36, 1	; 36.8 HndAxe + Dryad
	db	255, 36, 1	; 36.9 HndAxe + Undine
	db	 80, 38, 5	; 36.10 HndAxe + Sylph -> Tomhwk
	db	 80, 37, 5	; 36.11 HndAxe + Gnome -> BtlAxe
	db	 80, 37, 5	; 36.12 HndAxe + Hirokn -> BtlAxe
	db	 80, 38, 5	; 36.13 HndAxe + Oricon -> Tomhwk
	db	255, 36, 1	; 36.14 HndAxe + Zeus
	db	255, 36, 1	; 36.15 HndAxe + Hades
	db	255, 37, 1	; 37.1 BtlAxe + Steel
	db	255, 37, 1	; 37.2 BtlAxe + Silver
	db	255, 37, 1	; 37.3 BtlAxe + Gold
	db	 30, 39,10	; 37.4 BtlAxe + Tngstn -> 2Edge
	db	255, 37, 1	; 37.5 BtlAxe + Platnm
	db	 30, 39,10	; 37.6 BtlAxe + Mithrl -> 2Edge
	db	 30, 39,10	; 37.7 BtlAxe + Slmndr -> 2Edge
	db	 30, 39,10	; 37.8 BtlAxe + Dryad -> 2Edge
	db	255, 37, 1	; 37.9 BtlAxe + Undine
	db	255, 37, 1	; 37.10 BtlAxe + Sylph
	db	 30, 39,10	; 37.11 BtlAxe + Gnome -> 2Edge
	db	 30, 39,10	; 37.12 BtlAxe + Hirokn -> 2Edge
	db	255, 37, 1	; 37.13 BtlAxe + Oricon
	db	 30, 39,10	; 37.14 BtlAxe + Zeus -> 2Edge
	db	255, 37, 1	; 37.15 BtlAxe + Hades
	db	255, 38, 1	; 38.1 Tomhwk + Steel
	db	255, 38, 1	; 38.2 Tomhwk + Silver
	db	255, 38, 1	; 38.3 Tomhwk + Gold
	db	255, 38, 1	; 38.4 Tomhwk + Tngstn
	db	255, 38, 1	; 38.5 Tomhwk + Platnm
	db	255, 38, 1	; 38.6 Tomhwk + Mithrl
	db	255, 38, 1	; 38.7 Tomhwk + Slmndr
	db	255, 38, 1	; 38.8 Tomhwk + Dryad
	db	255, 38, 1	; 38.9 Tomhwk + Undine
	db	255, 38, 1	; 38.10 Tomhwk + Sylph
	db	255, 38, 1	; 38.11 Tomhwk + Gnome
	db	255, 38, 1	; 38.12 Tomhwk + Hirokn
	db	255, 38, 1	; 38.13 Tomhwk + Oricon
	db	255, 38, 1	; 38.14 Tomhwk + Zeus
	db	255, 38, 1	; 38.15 Tomhwk + Hades
	db	255, 39, 1	; 39.1 2Edge + Steel
	db	255, 39, 1	; 39.2 2Edge + Silver
	db	255, 39, 1	; 39.3 2Edge + Gold
	db	255, 39, 1	; 39.4 2Edge + Tngstn
	db	255, 39, 1	; 39.5 2Edge + Platnm
	db	255, 39, 1	; 39.6 2Edge + Mithrl
	db	 10, 40,15	; 39.7 2Edge + Slmndr -> Break
	db	255, 39, 1	; 39.8 2Edge + Dryad
	db	255, 39, 1	; 39.9 2Edge + Undine
	db	255, 39, 1	; 39.10 2Edge + Sylph
	db	 10, 40,15	; 39.11 2Edge + Gnome -> Break
	db	 10, 40,15	; 39.12 2Edge + Hirokn -> Break
	db	255, 39, 1	; 39.13 2Edge + Oricon
	db	 10, 40,15	; 39.14 2Edge + Zeus -> Break
	db	255, 39, 1	; 39.15 2Edge + Hades
	db	255, 40, 1	; 40.1 Break + Steel
	db	255, 40, 1	; 40.2 Break + Silver
	db	255, 40, 1	; 40.3 Break + Gold
	db	255, 40, 1	; 40.4 Break + Tngstn
	db	255, 40, 1	; 40.5 Break + Platnm
	db	255, 40, 1	; 40.6 Break + Mithrl
	db	255, 40, 1	; 40.7 Break + Slmndr
	db	255, 40, 1	; 40.8 Break + Dryad
	db	255, 40, 1	; 40.9 Break + Undine
	db	255, 40, 1	; 40.10 Break + Sylph
	db	255, 40, 1	; 40.11 Break + Gnome
	db	255, 40, 1	; 40.12 Break + Hirokn
	db	255, 40, 1	; 40.13 Break + Oricon
	db	255, 40, 1	; 40.14 Break + Zeus
	db	255, 40, 1	; 40.15 Break + Hades
	db	 80, 42, 5	; 41.1 BllArm + Steel -> MgaBll
	db	 80, 43, 5	; 41.2 BllArm + Silver -> NoWire
	db	255, 41, 1	; 41.3 BllArm + Gold
	db	 80, 42, 5	; 41.4 BllArm + Tngstn -> MgaBll
	db	255, 41, 1	; 41.5 BllArm + Platnm
	db	 80, 43, 5	; 41.6 BllArm + Mithrl -> NoWire
	db	 80, 43, 5	; 41.7 BllArm + Slmndr -> NoWire
	db	 80, 42, 5	; 41.8 BllArm + Dryad -> MgaBll
	db	255, 41, 1	; 41.9 BllArm + Undine
	db	 80, 43, 5	; 41.10 BllArm + Sylph -> NoWire
	db	 80, 42, 5	; 41.11 BllArm + Gnome -> MgaBll
	db	 80, 42, 5	; 41.12 BllArm + Hirokn -> MgaBll
	db	 80, 43, 5	; 41.13 BllArm + Oricon -> NoWire
	db	255, 41, 1	; 41.14 BllArm + Zeus
	db	255, 41, 1	; 41.15 BllArm + Hades
	db	255, 42, 1	; 42.1 MgaBll + Steel
	db	255, 42, 1	; 42.2 MgaBll + Silver
	db	255, 42, 1	; 42.3 MgaBll + Gold
	db	 30, 44,10	; 42.4 MgaBll + Tngstn -> Crushr
	db	255, 42, 1	; 42.5 MgaBll + Platnm
	db	255, 42, 1	; 42.6 MgaBll + Mithrl
	db	255, 42, 1	; 42.7 MgaBll + Slmndr
	db	 30, 44,10	; 42.8 MgaBll + Dryad -> Crushr
	db	255, 42, 1	; 42.9 MgaBll + Undine
	db	255, 42, 1	; 42.10 MgaBll + Sylph
	db	 30, 44,10	; 42.11 MgaBll + Gnome -> Crushr
	db	 30, 44,10	; 42.12 MgaBll + Hirokn -> Crushr
	db	255, 42, 1	; 42.13 MgaBll + Oricon
	db	 30, 44,10	; 42.14 MgaBll + Zeus -> Crushr
	db	255, 42, 1	; 42.15 MgaBll + Hades
	db	255, 43, 1	; 43.1 NoWire + Steel
	db	255, 43, 1	; 43.2 NoWire + Silver
	db	255, 43, 1	; 43.3 NoWire + Gold
	db	255, 43, 1	; 43.4 NoWire + Tngstn
	db	255, 43, 1	; 43.5 NoWire + Platnm
	db	 30, 45,10	; 43.6 NoWire + Mithrl -> Sthrn+
	db	 30, 45,10	; 43.7 NoWire + Slmndr -> Sthrn+
	db	255, 43, 1	; 43.8 NoWire + Dryad
	db	255, 43, 1	; 43.9 NoWire + Undine
	db	 30, 45,10	; 43.10 NoWire + Sylph -> Sthrn+
	db	255, 43, 1	; 43.11 NoWire + Gnome
	db	255, 43, 1	; 43.12 NoWire + Hirokn
	db	 30, 45,10	; 43.13 NoWire + Oricon -> Sthrn+
	db	 30, 45,10	; 43.14 NoWire + Zeus -> Sthrn+
	db	255, 43, 1	; 43.15 NoWire + Hades
	db	255, 44, 1	; 44.1 Crushr + Steel
	db	255, 44, 1	; 44.2 Crushr + Silver
	db	255, 44, 1	; 44.3 Crushr + Gold
	db	255, 44, 1	; 44.4 Crushr + Tngstn
	db	255, 44, 1	; 44.5 Crushr + Platnm
	db	255, 44, 1	; 44.6 Crushr + Mithrl
	db	255, 44, 1	; 44.7 Crushr + Slmndr
	db	255, 44, 1	; 44.8 Crushr + Dryad
	db	255, 44, 1	; 44.9 Crushr + Undine
	db	255, 44, 1	; 44.10 Crushr + Sylph
	db	255, 44, 1	; 44.11 Crushr + Gnome
	db	255, 44, 1	; 44.12 Crushr + Hirokn
	db	255, 44, 1	; 44.13 Crushr + Oricon
	db	255, 44, 1	; 44.14 Crushr + Zeus
	db	255, 44, 1	; 44.15 Crushr + Hades
	db	255, 45, 1	; 45.1 Sthrn+ + Steel
	db	255, 45, 1	; 45.2 Sthrn+ + Silver
	db	255, 45, 1	; 45.3 Sthrn+ + Gold
	db	255, 45, 1	; 45.4 Sthrn+ + Tngstn
	db	255, 45, 1	; 45.5 Sthrn+ + Platnm
	db	255, 45, 1	; 45.6 Sthrn+ + Mithrl
	db	255, 45, 1	; 45.7 Sthrn+ + Slmndr
	db	255, 45, 1	; 45.8 Sthrn+ + Dryad
	db	255, 45, 1	; 45.9 Sthrn+ + Undine
	db	255, 45, 1	; 45.10 Sthrn+ + Sylph
	db	255, 45, 1	; 45.11 Sthrn+ + Gnome
	db	255, 45, 1	; 45.12 Sthrn+ + Hirokn
	db	255, 45, 1	; 45.13 Sthrn+ + Oricon
	db	255, 45, 1	; 45.14 Sthrn+ + Zeus
	db	255, 45, 1	; 45.15 Sthrn+ + Hades
	db	 80, 47, 5	; 46.1 Lancer + Steel -> DrlArm
	db	 80, 48, 5	; 46.2 Lancer + Silver -> Pierce
	db	255, 46, 1	; 46.3 Lancer + Gold
	db	 80, 47, 5	; 46.4 Lancer + Tngstn -> DrlArm
	db	255, 46, 1	; 46.5 Lancer + Platnm
	db	 80, 48, 5	; 46.6 Lancer + Mithrl -> Pierce
	db	255, 46, 1	; 46.7 Lancer + Slmndr
	db	255, 46, 1	; 46.8 Lancer + Dryad
	db	 80, 48, 5	; 46.9 Lancer + Undine -> Pierce
	db	 80, 47, 5	; 46.10 Lancer + Sylph -> DrlArm
	db	255, 46, 1	; 46.11 Lancer + Gnome
	db	 80, 47, 5	; 46.12 Lancer + Hirokn -> DrlArm
	db	 80, 48, 5	; 46.13 Lancer + Oricon -> Pierce
	db	255, 46, 1	; 46.14 Lancer + Zeus
	db	255, 46, 1	; 46.15 Lancer + Hades
	db	255, 47, 1	; 47.1 DrlArm + Steel
	db	255, 47, 1	; 47.2 DrlArm + Silver
	db	255, 47, 1	; 47.3 DrlArm + Gold
	db	255, 47, 1	; 47.4 DrlArm + Tngstn
	db	255, 47, 1	; 47.5 DrlArm + Platnm
	db	 30, 49,10	; 47.6 DrlArm + Mithrl -> Trnado
	db	255, 47, 1	; 47.7 DrlArm + Slmndr
	db	255, 47, 1	; 47.8 DrlArm + Dryad
	db	255, 47, 1	; 47.9 DrlArm + Undine
	db	 30, 49,10	; 47.10 DrlArm + Sylph -> Trnado
	db	255, 47, 1	; 47.11 DrlArm + Gnome
	db	 30, 49,10	; 47.12 DrlArm + Hirokn -> Trnado
	db	255, 47, 1	; 47.13 DrlArm + Oricon
	db	 30, 49,10	; 47.14 DrlArm + Zeus -> Trnado
	db	255, 47, 1	; 47.15 DrlArm + Hades
	db	255, 48, 1	; 48.1 Pierce + Steel
	db	255, 48, 1	; 48.2 Pierce + Silver
	db	255, 48, 1	; 48.3 Pierce + Gold
	db	255, 48, 1	; 48.4 Pierce + Tngstn
	db	 30, 50,10	; 48.5 Pierce + Platnm -> Spiral
	db	255, 48, 1	; 48.6 Pierce + Mithrl
	db	255, 48, 1	; 48.7 Pierce + Slmndr
	db	255, 48, 1	; 48.8 Pierce + Dryad
	db	 30, 50,10	; 48.9 Pierce + Undine -> Spiral
	db	255, 48, 1	; 48.10 Pierce + Sylph
	db	255, 48, 1	; 48.11 Pierce + Gnome
	db	255, 48, 1	; 48.12 Pierce + Hirokn
	db	 30, 50,10	; 48.13 Pierce + Oricon -> Spiral
	db	 30, 50,10	; 48.14 Pierce + Zeus -> Spiral
	db	255, 48, 1	; 48.15 Pierce + Hades
	db	255, 49, 1	; 49.1 Trnado + Steel
	db	255, 49, 1	; 49.2 Trnado + Silver
	db	255, 49, 1	; 49.3 Trnado + Gold
	db	255, 49, 1	; 49.4 Trnado + Tngstn
	db	255, 49, 1	; 49.5 Trnado + Platnm
	db	255, 49, 1	; 49.6 Trnado + Mithrl
	db	255, 49, 1	; 49.7 Trnado + Slmndr
	db	255, 49, 1	; 49.8 Trnado + Dryad
	db	255, 49, 1	; 49.9 Trnado + Undine
	db	255, 49, 1	; 49.10 Trnado + Sylph
	db	255, 49, 1	; 49.11 Trnado + Gnome
	db	255, 49, 1	; 49.12 Trnado + Hirokn
	db	255, 49, 1	; 49.13 Trnado + Oricon
	db	255, 49, 1	; 49.14 Trnado + Zeus
	db	255, 49, 1	; 49.15 Trnado + Hades
	db	255, 50, 1	; 50.1 Spiral + Steel
	db	255, 50, 1	; 50.2 Spiral + Silver
	db	255, 50, 1	; 50.3 Spiral + Gold
	db	255, 50, 1	; 50.4 Spiral + Tngstn
	db	255, 50, 1	; 50.5 Spiral + Platnm
	db	255, 50, 1	; 50.6 Spiral + Mithrl
	db	255, 50, 1	; 50.7 Spiral + Slmndr
	db	255, 50, 1	; 50.8 Spiral + Dryad
	db	255, 50, 1	; 50.9 Spiral + Undine
	db	255, 50, 1	; 50.10 Spiral + Sylph
	db	255, 50, 1	; 50.11 Spiral + Gnome
	db	255, 50, 1	; 50.12 Spiral + Hirokn
	db	255, 50, 1	; 50.13 Spiral + Oricon
	db	255, 50, 1	; 50.14 Spiral + Zeus
	db	255, 50, 1	; 50.15 Spiral + Hades
	db	 80, 52, 5	; 51.1 Hook + Steel -> LogHk
	db	 80, 52, 5	; 51.2 Hook + Silver -> LogHk
	db	255, 51, 1	; 51.3 Hook + Gold
	db	 80, 52, 5	; 51.4 Hook + Tngstn -> LogHk
	db	255, 51, 1	; 51.5 Hook + Platnm
	db	 80, 52, 5	; 51.6 Hook + Mithrl -> LogHk
	db	255, 51, 1	; 51.7 Hook + Slmndr
	db	 80, 52, 5	; 51.8 Hook + Dryad -> LogHk
	db	255, 51, 1	; 51.9 Hook + Undine
	db	255, 51, 1	; 51.10 Hook + Sylph
	db	 80, 52, 5	; 51.11 Hook + Gnome -> LogHk
	db	 80, 52, 5	; 51.12 Hook + Hirokn -> LogHk
	db	255, 51, 1	; 51.13 Hook + Oricon
	db	 80, 52, 5	; 51.14 Hook + Zeus -> LogHk
	db	255, 51, 1	; 51.15 Hook + Hades
	db	255, 52, 1	; 52.1 LogHk + Steel
	db	255, 52, 1	; 52.2 LogHk + Silver
	db	255, 52, 1	; 52.3 LogHk + Gold
	db	 30, 53,10	; 52.4 LogHk + Tngstn -> BtlHk
	db	255, 52, 1	; 52.5 LogHk + Platnm
	db	 30, 53,10	; 52.6 LogHk + Mithrl -> BtlHk
	db	 30, 53,10	; 52.7 LogHk + Slmndr -> BtlHk
	db	255, 52, 1	; 52.8 LogHk + Dryad
	db	255, 52, 1	; 52.9 LogHk + Undine
	db	255, 52, 1	; 52.10 LogHk + Sylph
	db	 30, 53,10	; 52.11 LogHk + Gnome -> BtlHk
	db	 30, 53,10	; 52.12 LogHk + Hirokn -> BtlHk
	db	255, 52, 1	; 52.13 LogHk + Oricon
	db	 30, 53,10	; 52.14 LogHk + Zeus -> BtlHk
	db	255, 52, 1	; 52.15 LogHk + Hades
	db	255, 53, 1	; 53.1 BtlHk + Steel
	db	255, 53, 1	; 53.2 BtlHk + Silver
	db	255, 53, 1	; 53.3 BtlHk + Gold
	db	255, 53, 1	; 53.4 BtlHk + Tngstn
	db	255, 53, 1	; 53.5 BtlHk + Platnm
	db	255, 53, 1	; 53.6 BtlHk + Mithrl
	db	255, 53, 1	; 53.7 BtlHk + Slmndr
	db	255, 53, 1	; 53.8 BtlHk + Dryad
	db	 10, 54,15	; 53.9 BtlHk + Undine -> IceClw
	db	255, 53, 1	; 53.10 BtlHk + Sylph
	db	 10, 55,15	; 53.11 BtlHk + Gnome -> DvlClw
	db	255, 53, 1	; 53.12 BtlHk + Hirokn
	db	255, 53, 1	; 53.13 BtlHk + Oricon
	db	255, 53, 1	; 53.14 BtlHk + Zeus
	db	 10, 55,15	; 53.15 BtlHk + Hades -> DvlClw
	db	255, 54, 1	; 54.1 IceClw + Steel
	db	255, 54, 1	; 54.2 IceClw + Silver
	db	255, 54, 1	; 54.3 IceClw + Gold
	db	255, 54, 1	; 54.4 IceClw + Tngstn
	db	255, 54, 1	; 54.5 IceClw + Platnm
	db	255, 54, 1	; 54.6 IceClw + Mithrl
	db	255, 54, 1	; 54.7 IceClw + Slmndr
	db	255, 54, 1	; 54.8 IceClw + Dryad
	db	255, 54, 1	; 54.9 IceClw + Undine
	db	255, 54, 1	; 54.10 IceClw + Sylph
	db	255, 54, 1	; 54.11 IceClw + Gnome
	db	255, 54, 1	; 54.12 IceClw + Hirokn
	db	255, 54, 1	; 54.13 IceClw + Oricon
	db	255, 54, 1	; 54.14 IceClw + Zeus
	db	255, 54, 1	; 54.15 IceClw + Hades
	db	255, 55, 1	; 55.1 DvlClw + Steel
	db	255, 55, 1	; 55.2 DvlClw + Silver
	db	255, 55, 1	; 55.3 DvlClw + Gold
	db	255, 55, 1	; 55.4 DvlClw + Tngstn
	db	255, 55, 1	; 55.5 DvlClw + Platnm
	db	255, 55, 1	; 55.6 DvlClw + Mithrl
	db	255, 55, 1	; 55.7 DvlClw + Slmndr
	db	255, 55, 1	; 55.8 DvlClw + Dryad
	db	255, 55, 1	; 55.9 DvlClw + Undine
	db	255, 55, 1	; 55.10 DvlClw + Sylph
	db	255, 55, 1	; 55.11 DvlClw + Gnome
	db	255, 55, 1	; 55.12 DvlClw + Hirokn
	db	255, 55, 1	; 55.13 DvlClw + Oricon
	db	255, 55, 1	; 55.14 DvlClw + Zeus
	db	255, 55, 1	; 55.15 DvlClw + Hades
	db	255, 56, 1	; 56.1 Whip + Steel
	db	 80, 57, 5	; 56.2 Whip + Silver -> Whip+
	db	 80, 57, 5	; 56.3 Whip + Gold -> Whip+
	db	255, 56, 1	; 56.4 Whip + Tngstn
	db	 80, 57, 5	; 56.5 Whip + Platnm -> Whip+
	db	 80, 57, 5	; 56.6 Whip + Mithrl -> Whip+
	db	 80, 57, 5	; 56.7 Whip + Slmndr -> Whip+
	db	255, 56, 1	; 56.8 Whip + Dryad
	db	255, 56, 1	; 56.9 Whip + Undine
	db	255, 56, 1	; 56.10 Whip + Sylph
	db	 80, 57, 5	; 56.11 Whip + Gnome -> Whip+
	db	 80, 57, 5	; 56.12 Whip + Hirokn -> Whip+
	db	255, 56, 1	; 56.13 Whip + Oricon
	db	 80, 57, 5	; 56.14 Whip + Zeus -> Whip+
	db	255, 56, 1	; 56.15 Whip + Hades
	db	255, 57, 1	; 57.1 Whip+ + Steel
	db	255, 57, 1	; 57.2 Whip+ + Silver
	db	255, 57, 1	; 57.3 Whip+ + Gold
	db	255, 57, 1	; 57.4 Whip+ + Tngstn
	db	255, 57, 1	; 57.5 Whip+ + Platnm
	db	255, 57, 1	; 57.6 Whip+ + Mithrl
	db	 10, 58,15	; 57.7 Whip+ + Slmndr -> FBoot
	db	255, 57, 1	; 57.8 Whip+ + Dryad
	db	255, 57, 1	; 57.9 Whip+ + Undine
	db	255, 57, 1	; 57.10 Whip+ + Sylph
	db	 10, 60,15	; 57.11 Whip+ + Gnome -> EBoot
	db	 10, 59,15	; 57.12 Whip+ + Hirokn -> 9Tail
	db	255, 57, 1	; 57.13 Whip+ + Oricon
	db	255, 57, 1	; 57.14 Whip+ + Zeus
	db	255, 57, 1	; 57.15 Whip+ + Hades
	db	255, 58, 1	; 58.1 FBoot + Steel
	db	255, 58, 1	; 58.2 FBoot + Silver
	db	255, 58, 1	; 58.3 FBoot + Gold
	db	255, 58, 1	; 58.4 FBoot + Tngstn
	db	255, 58, 1	; 58.5 FBoot + Platnm
	db	255, 58, 1	; 58.6 FBoot + Mithrl
	db	255, 58, 1	; 58.7 FBoot + Slmndr
	db	255, 58, 1	; 58.8 FBoot + Dryad
	db	255, 58, 1	; 58.9 FBoot + Undine
	db	255, 58, 1	; 58.10 FBoot + Sylph
	db	255, 58, 1	; 58.11 FBoot + Gnome
	db	255, 58, 1	; 58.12 FBoot + Hirokn
	db	255, 58, 1	; 58.13 FBoot + Oricon
	db	255, 58, 1	; 58.14 FBoot + Zeus
	db	255, 58, 1	; 58.15 FBoot + Hades
	db	255, 59, 1	; 59.1 9Tail + Steel
	db	255, 59, 1	; 59.2 9Tail + Silver
	db	255, 59, 1	; 59.3 9Tail + Gold
	db	255, 59, 1	; 59.4 9Tail + Tngstn
	db	255, 59, 1	; 59.5 9Tail + Platnm
	db	255, 59, 1	; 59.6 9Tail + Mithrl
	db	255, 59, 1	; 59.7 9Tail + Slmndr
	db	255, 59, 1	; 59.8 9Tail + Dryad
	db	255, 59, 1	; 59.9 9Tail + Undine
	db	255, 59, 1	; 59.10 9Tail + Sylph
	db	255, 59, 1	; 59.11 9Tail + Gnome
	db	255, 59, 1	; 59.12 9Tail + Hirokn
	db	255, 59, 1	; 59.13 9Tail + Oricon
	db	255, 59, 1	; 59.14 9Tail + Zeus
	db	255, 59, 1	; 59.15 9Tail + Hades
	db	255, 60, 1	; 60.1 EBoot + Steel
	db	255, 60, 1	; 60.2 EBoot + Silver
	db	255, 60, 1	; 60.3 EBoot + Gold
	db	255, 60, 1	; 60.4 EBoot + Tngstn
	db	255, 60, 1	; 60.5 EBoot + Platnm
	db	255, 60, 1	; 60.6 EBoot + Mithrl
	db	255, 60, 1	; 60.7 EBoot + Slmndr
	db	255, 60, 1	; 60.8 EBoot + Dryad
	db	255, 60, 1	; 60.9 EBoot + Undine
	db	255, 60, 1	; 60.10 EBoot + Sylph
	db	255, 60, 1	; 60.11 EBoot + Gnome
	db	255, 60, 1	; 60.12 EBoot + Hirokn
	db	255, 60, 1	; 60.13 EBoot + Oricon
	db	255, 60, 1	; 60.14 EBoot + Zeus
	db	255, 60, 1	; 60.15 EBoot + Hades
	db	 80, 63, 5	; 61.1 Fork + Steel -> Tridnt
	db	 80, 63, 5	; 61.2 Fork + Silver -> Tridnt
	db	255, 61, 1	; 61.3 Fork + Gold
	db	 80, 63, 5	; 61.4 Fork + Tngstn -> Tridnt
	db	255, 61, 1	; 61.5 Fork + Platnm
	db	 80, 63, 5	; 61.6 Fork + Mithrl -> Tridnt
	db	255, 61, 1	; 61.7 Fork + Slmndr
	db	255, 61, 1	; 61.8 Fork + Dryad
	db	 80, 63, 5	; 61.9 Fork + Undine -> Tridnt
	db	255, 61, 1	; 61.10 Fork + Sylph
	db	255, 61, 1	; 61.11 Fork + Gnome
	db	 80, 63, 5	; 61.12 Fork + Hirokn -> Tridnt
	db	255, 61, 1	; 61.13 Fork + Oricon
	db	 80, 63, 5	; 61.14 Fork + Zeus -> Tridnt
	db	255, 61, 1	; 61.15 Fork + Hades
	db	255, 62, 1	; 62.1 HkClaw + Steel
	db	 80, 64, 5	; 62.2 HkClaw + Silver -> WlfClw
	db	 80, 64, 5	; 62.3 HkClaw + Gold -> WlfClw
	db	255, 62, 1	; 62.4 HkClaw + Tngstn
	db	 80, 64, 5	; 62.5 HkClaw + Platnm -> WlfClw
	db	 80, 64, 5	; 62.6 HkClaw + Mithrl -> WlfClw
	db	255, 62, 1	; 62.7 HkClaw + Slmndr
	db	255, 62, 1	; 62.8 HkClaw + Dryad
	db	255, 62, 1	; 62.9 HkClaw + Undine
	db	 80, 64, 5	; 62.10 HkClaw + Sylph -> WlfClw
	db	255, 62, 1	; 62.11 HkClaw + Gnome
	db	255, 62, 1	; 62.12 HkClaw + Hirokn
	db	 80, 64, 5	; 62.13 HkClaw + Oricon -> WlfClw
	db	 80, 64, 5	; 62.14 HkClaw + Zeus -> WlfClw
	db	255, 62, 1	; 62.15 HkClaw + Hades
	db	255, 63, 1	; 63.1 Tridnt + Steel
	db	255, 63, 1	; 63.2 Tridnt + Silver
	db	255, 63, 1	; 63.3 Tridnt + Gold
	db	255, 63, 1	; 63.4 Tridnt + Tngstn
	db	255, 63, 1	; 63.5 Tridnt + Platnm
	db	255, 63, 1	; 63.6 Tridnt + Mithrl
	db	255, 63, 1	; 63.7 Tridnt + Slmndr
	db	255, 63, 1	; 63.8 Tridnt + Dryad
	db	255, 63, 1	; 63.9 Tridnt + Undine
	db	255, 63, 1	; 63.10 Tridnt + Sylph
	db	255, 63, 1	; 63.11 Tridnt + Gnome
	db	255, 63, 1	; 63.12 Tridnt + Hirokn
	db	255, 63, 1	; 63.13 Tridnt + Oricon
	db	255, 63, 1	; 63.14 Tridnt + Zeus
	db	255, 63, 1	; 63.15 Tridnt + Hades
	db	255, 64, 1	; 64.1 WlfClw + Steel
	db	255, 64, 1	; 64.2 WlfClw + Silver
	db	255, 64, 1	; 64.3 WlfClw + Gold
	db	255, 64, 1	; 64.4 WlfClw + Tngstn
	db	255, 64, 1	; 64.5 WlfClw + Platnm
	db	255, 64, 1	; 64.6 WlfClw + Mithrl
	db	255, 64, 1	; 64.7 WlfClw + Slmndr
	db	255, 64, 1	; 64.8 WlfClw + Dryad
	db	255, 64, 1	; 64.9 WlfClw + Undine
	db	 10, 65,15	; 64.10 WlfClw + Sylph -> TgrClw
	db	255, 64, 1	; 64.11 WlfClw + Gnome
	db	 10, 65,15	; 64.12 WlfClw + Hirokn -> TgrClw
	db	255, 64, 1	; 64.13 WlfClw + Oricon
	db	 10, 65,15	; 64.14 WlfClw + Zeus -> TgrClw
	db	255, 64, 1	; 64.15 WlfClw + Hades
	db	255, 65, 1	; 65.1 TgrClw + Steel
	db	255, 65, 1	; 65.2 TgrClw + Silver
	db	255, 65, 1	; 65.3 TgrClw + Gold
	db	255, 65, 1	; 65.4 TgrClw + Tngstn
	db	255, 65, 1	; 65.5 TgrClw + Platnm
	db	255, 65, 1	; 65.6 TgrClw + Mithrl
	db	255, 65, 1	; 65.7 TgrClw + Slmndr
	db	255, 65, 1	; 65.8 TgrClw + Dryad
	db	255, 65, 1	; 65.9 TgrClw + Undine
	db	255, 65, 1	; 65.10 TgrClw + Sylph
	db	255, 65, 1	; 65.11 TgrClw + Gnome
	db	255, 65, 1	; 65.12 TgrClw + Hirokn
	db	255, 65, 1	; 65.13 TgrClw + Oricon
	db	255, 65, 1	; 65.14 TgrClw + Zeus
	db	255, 65, 1	; 65.15 TgrClw + Hades
	db	 80, 67, 5	; 66.1 Disc + Steel -> SpikeD
	db	 80, 68, 5	; 66.2 Disc + Silver -> RingD
	db	255, 66, 1	; 66.3 Disc + Gold
	db	 80, 67, 5	; 66.4 Disc + Tngstn -> SpikeD
	db	255, 66, 1	; 66.5 Disc + Platnm
	db	 80, 68, 5	; 66.6 Disc + Mithrl -> RingD
	db	 80, 68, 5	; 66.7 Disc + Slmndr -> RingD
	db	255, 66, 1	; 66.8 Disc + Dryad
	db	255, 66, 1	; 66.9 Disc + Undine
	db	255, 66, 1	; 66.10 Disc + Sylph
	db	 80, 67, 5	; 66.11 Disc + Gnome -> SpikeD
	db	 80, 67, 5	; 66.12 Disc + Hirokn -> SpikeD
	db	 80, 68, 5	; 66.13 Disc + Oricon -> RingD
	db	255, 66, 1	; 66.14 Disc + Zeus
	db	255, 66, 1	; 66.15 Disc + Hades
	db	255, 67, 1	; 67.1 SpikeD + Steel
	db	255, 67, 1	; 67.2 SpikeD + Silver
	db	255, 67, 1	; 67.3 SpikeD + Gold
	db	 30, 69,10	; 67.4 SpikeD + Tngstn -> Disc+
	db	255, 67, 1	; 67.5 SpikeD + Platnm
	db	255, 67, 1	; 67.6 SpikeD + Mithrl
	db	255, 67, 1	; 67.7 SpikeD + Slmndr
	db	255, 67, 1	; 67.8 SpikeD + Dryad
	db	255, 67, 1	; 67.9 SpikeD + Undine
	db	 30, 69,10	; 67.10 SpikeD + Sylph -> Disc+
	db	 30, 69,10	; 67.11 SpikeD + Gnome -> Disc+
	db	 30, 69,10	; 67.12 SpikeD + Hirokn -> Disc+
	db	255, 67, 1	; 67.13 SpikeD + Oricon
	db	 30, 69,10	; 67.14 SpikeD + Zeus -> Disc+
	db	255, 67, 1	; 67.15 SpikeD + Hades
	db	255, 68, 1	; 68.1 RingD + Steel
	db	255, 68, 1	; 68.2 RingD + Silver
	db	255, 68, 1	; 68.3 RingD + Gold
	db	255, 68, 1	; 68.4 RingD + Tngstn
	db	255, 68, 1	; 68.5 RingD + Platnm
	db	 30, 70,10	; 68.6 RingD + Mithrl -> AirD
	db	 30, 70,10	; 68.7 RingD + Slmndr -> AirD
	db	255, 68, 1	; 68.8 RingD + Dryad
	db	255, 68, 1	; 68.9 RingD + Undine
	db	 30, 70,10	; 68.10 RingD + Sylph -> AirD
	db	255, 68, 1	; 68.11 RingD + Gnome
	db	255, 68, 1	; 68.12 RingD + Hirokn
	db	 30, 70,10	; 68.13 RingD + Oricon -> AirD
	db	 30, 70,10	; 68.14 RingD + Zeus -> AirD
	db	255, 68, 1	; 68.15 RingD + Hades
	db	255, 69, 1	; 69.1 Disc+ + Steel
	db	255, 69, 1	; 69.2 Disc+ + Silver
	db	255, 69, 1	; 69.3 Disc+ + Gold
	db	255, 69, 1	; 69.4 Disc+ + Tngstn
	db	255, 69, 1	; 69.5 Disc+ + Platnm
	db	255, 69, 1	; 69.6 Disc+ + Mithrl
	db	255, 69, 1	; 69.7 Disc+ + Slmndr
	db	255, 69, 1	; 69.8 Disc+ + Dryad
	db	255, 69, 1	; 69.9 Disc+ + Undine
	db	255, 69, 1	; 69.10 Disc+ + Sylph
	db	255, 69, 1	; 69.11 Disc+ + Gnome
	db	255, 69, 1	; 69.12 Disc+ + Hirokn
	db	255, 69, 1	; 69.13 Disc+ + Oricon
	db	255, 69, 1	; 69.14 Disc+ + Zeus
	db	255, 69, 1	; 69.15 Disc+ + Hades
	db	255, 70, 1	; 70.1 AirD + Steel
	db	255, 70, 1	; 70.2 AirD + Silver
	db	255, 70, 1	; 70.3 AirD + Gold
	db	255, 70, 1	; 70.4 AirD + Tngstn
	db	255, 70, 1	; 70.5 AirD + Platnm
	db	255, 70, 1	; 70.6 AirD + Mithrl
	db	255, 70, 1	; 70.7 AirD + Slmndr
	db	255, 70, 1	; 70.8 AirD + Dryad
	db	255, 70, 1	; 70.9 AirD + Undine
	db	255, 70, 1	; 70.10 AirD + Sylph
	db	255, 70, 1	; 70.11 AirD + Gnome
	db	255, 70, 1	; 70.12 AirD + Hirokn
	db	255, 70, 1	; 70.13 AirD + Oricon
	db	255, 70, 1	; 70.14 AirD + Zeus
	db	255, 70, 1	; 70.15 AirD + Hades
	db	 80, 73, 5	; 71.1 EWire + Steel -> Tangle
	db	255, 71, 1	; 71.2 EWire + Silver
	db	 80, 72, 5	; 71.3 EWire + Gold -> ArmWre
	db	 80, 73, 5	; 71.4 EWire + Tngstn -> Tangle
	db	255, 71, 1	; 71.5 EWire + Platnm
	db	 80, 72, 5	; 71.6 EWire + Mithrl -> ArmWre
	db	255, 71, 1	; 71.7 EWire + Slmndr
	db	 80, 73, 5	; 71.8 EWire + Dryad -> Tangle
	db	255, 71, 1	; 71.9 EWire + Undine
	db	 80, 72, 5	; 71.10 EWire + Sylph -> ArmWre
	db	255, 71, 1	; 71.11 EWire + Gnome
	db	 80, 73, 5	; 71.12 EWire + Hirokn -> Tangle
	db	 80, 72, 5	; 71.13 EWire + Oricon -> ArmWre
	db	255, 71, 1	; 71.14 EWire + Zeus
	db	255, 71, 1	; 71.15 EWire + Hades
	db	255, 72, 1	; 72.1 ArmWre + Steel
	db	255, 72, 1	; 72.2 ArmWre + Silver
	db	255, 72, 1	; 72.3 ArmWre + Gold
	db	255, 72, 1	; 72.4 ArmWre + Tngstn
	db	255, 72, 1	; 72.5 ArmWre + Platnm
	db	 30, 74,10	; 72.6 ArmWre + Mithrl -> Lghtng
	db	255, 72, 1	; 72.7 ArmWre + Slmndr
	db	255, 72, 1	; 72.8 ArmWre + Dryad
	db	 30, 74,10	; 72.9 ArmWre + Undine -> Lghtng
	db	 30, 74,10	; 72.10 ArmWre + Sylph -> Lghtng
	db	255, 72, 1	; 72.11 ArmWre + Gnome
	db	255, 72, 1	; 72.12 ArmWre + Hirokn
	db	 30, 74,10	; 72.13 ArmWre + Oricon -> Lghtng
	db	 30, 74,10	; 72.14 ArmWre + Zeus -> Lghtng
	db	255, 72, 1	; 72.15 ArmWre + Hades
	db	255, 73, 1	; 73.1 Tangle + Steel
	db	255, 73, 1	; 73.2 Tangle + Silver
	db	255, 73, 1	; 73.3 Tangle + Gold
	db	255, 73, 1	; 73.4 Tangle + Tngstn
	db	255, 73, 1	; 73.5 Tangle + Platnm
	db	255, 73, 1	; 73.6 Tangle + Mithrl
	db	255, 73, 1	; 73.7 Tangle + Slmndr
	db	255, 73, 1	; 73.8 Tangle + Dryad
	db	255, 73, 1	; 73.9 Tangle + Undine
	db	255, 73, 1	; 73.10 Tangle + Sylph
	db	255, 73, 1	; 73.11 Tangle + Gnome
	db	255, 73, 1	; 73.12 Tangle + Hirokn
	db	255, 73, 1	; 73.13 Tangle + Oricon
	db	255, 73, 1	; 73.14 Tangle + Zeus
	db	255, 73, 1	; 73.15 Tangle + Hades
	db	255, 74, 1	; 74.1 Lghtng + Steel
	db	255, 74, 1	; 74.2 Lghtng + Silver
	db	255, 74, 1	; 74.3 Lghtng + Gold
	db	255, 74, 1	; 74.4 Lghtng + Tngstn
	db	255, 74, 1	; 74.5 Lghtng + Platnm
	db	255, 74, 1	; 74.6 Lghtng + Mithrl
	db	255, 74, 1	; 74.7 Lghtng + Slmndr
	db	255, 74, 1	; 74.8 Lghtng + Dryad
	db	255, 74, 1	; 74.9 Lghtng + Undine
	db	255, 74, 1	; 74.10 Lghtng + Sylph
	db	255, 74, 1	; 74.11 Lghtng + Gnome
	db	255, 74, 1	; 74.12 Lghtng + Hirokn
	db	 10, 75,15	; 74.13 Lghtng + Oricon -> Coil
	db	 10, 75,15	; 74.14 Lghtng + Zeus -> Coil
	db	255, 74, 1	; 74.15 Lghtng + Hades
	db	255, 75, 1	; 75.1 Coil + Steel
	db	255, 75, 1	; 75.2 Coil + Silver
	db	255, 75, 1	; 75.3 Coil + Gold
	db	255, 75, 1	; 75.4 Coil + Tngstn
	db	255, 75, 1	; 75.5 Coil + Platnm
	db	255, 75, 1	; 75.6 Coil + Mithrl
	db	255, 75, 1	; 75.7 Coil + Slmndr
	db	255, 75, 1	; 75.8 Coil + Dryad
	db	255, 75, 1	; 75.9 Coil + Undine
	db	255, 75, 1	; 75.10 Coil + Sylph
	db	255, 75, 1	; 75.11 Coil + Gnome
	db	255, 75, 1	; 75.12 Coil + Hirokn
	db	255, 75, 1	; 75.13 Coil + Oricon
	db	255, 75, 1	; 75.14 Coil + Zeus
	db	255, 75, 1	; 75.15 Coil + Hades
	db	255, 76, 1	; 76.1 Mage + Steel
	db	 80, 77, 5	; 76.2 Mage + Silver -> Wizard
	db	 80, 77, 5	; 76.3 Mage + Gold -> Wizard
	db	255, 76, 1	; 76.4 Mage + Tngstn
	db	 80, 77, 5	; 76.5 Mage + Platnm -> Wizard
	db	 80, 77, 5	; 76.6 Mage + Mithrl -> Wizard
	db	255, 76, 1	; 76.7 Mage + Slmndr
	db	 80, 77, 5	; 76.8 Mage + Dryad -> Wizard
	db	255, 76, 1	; 76.9 Mage + Undine
	db	 80, 77, 5	; 76.10 Mage + Sylph -> Wizard
	db	255, 76, 1	; 76.11 Mage + Gnome
	db	255, 76, 1	; 76.12 Mage + Hirokn
	db	 80, 77, 5	; 76.13 Mage + Oricon -> Wizard
	db	 80, 77, 5	; 76.14 Mage + Zeus -> Wizard
	db	255, 76, 1	; 76.15 Mage + Hades
	db	255, 77, 1	; 77.1 Wizard + Steel
	db	255, 77, 1	; 77.2 Wizard + Silver
	db	255, 77, 1	; 77.3 Wizard + Gold
	db	255, 77, 1	; 77.4 Wizard + Tngstn
	db	 30, 78,10	; 77.5 Wizard + Platnm -> Warlok
	db	 30, 78,10	; 77.6 Wizard + Mithrl -> Warlok
	db	255, 77, 1	; 77.7 Wizard + Slmndr
	db	 30, 78,10	; 77.8 Wizard + Dryad -> Warlok
	db	255, 77, 1	; 77.9 Wizard + Undine
	db	 30, 78,10	; 77.10 Wizard + Sylph -> Warlok
	db	255, 77, 1	; 77.11 Wizard + Gnome
	db	255, 77, 1	; 77.12 Wizard + Hirokn
	db	 30, 78,10	; 77.13 Wizard + Oricon -> Warlok
	db	 30, 78,10	; 77.14 Wizard + Zeus -> Warlok
	db	255, 77, 1	; 77.15 Wizard + Hades
	db	255, 78, 1	; 78.1 Warlok + Steel
	db	255, 78, 1	; 78.2 Warlok + Silver
	db	255, 78, 1	; 78.3 Warlok + Gold
	db	255, 78, 1	; 78.4 Warlok + Tngstn
	db	255, 78, 1	; 78.5 Warlok + Platnm
	db	255, 78, 1	; 78.6 Warlok + Mithrl
	db	255, 78, 1	; 78.7 Warlok + Slmndr
	db	255, 78, 1	; 78.8 Warlok + Dryad
	db	255, 78, 1	; 78.9 Warlok + Undine
	db	255, 78, 1	; 78.10 Warlok + Sylph
	db	255, 78, 1	; 78.11 Warlok + Gnome
	db	255, 78, 1	; 78.12 Warlok + Hirokn
	db	 10, 79,15	; 78.13 Warlok + Oricon -> ArchMg
	db	 10, 79,15	; 78.14 Warlok + Zeus -> ArchMg
	db	255, 78, 1	; 78.15 Warlok + Hades
	db	255, 79, 1	; 79.1 ArchMg + Steel
	db	255, 79, 1	; 79.2 ArchMg + Silver
	db	255, 79, 1	; 79.3 ArchMg + Gold
	db	255, 79, 1	; 79.4 ArchMg + Tngstn
	db	255, 79, 1	; 79.5 ArchMg + Platnm
	db	255, 79, 1	; 79.6 ArchMg + Mithrl
	db	255, 79, 1	; 79.7 ArchMg + Slmndr
	db	255, 79, 1	; 79.8 ArchMg + Dryad
	db	255, 79, 1	; 79.9 ArchMg + Undine
	db	255, 79, 1	; 79.10 ArchMg + Sylph
	db	255, 79, 1	; 79.11 ArchMg + Gnome
	db	255, 79, 1	; 79.12 ArchMg + Hirokn
	db	255, 79, 1	; 79.13 ArchMg + Oricon
	db	  5, 80,30	; 79.14 ArchMg + Zeus -> GodHnd
	db	255, 79, 1	; 79.15 ArchMg + Hades
	db	255, 80, 1	; 80.1 GodHnd + Steel
	db	255, 80, 1	; 80.2 GodHnd + Silver
	db	255, 80, 1	; 80.3 GodHnd + Gold
	db	255, 80, 1	; 80.4 GodHnd + Tngstn
	db	255, 80, 1	; 80.5 GodHnd + Platnm
	db	255, 80, 1	; 80.6 GodHnd + Mithrl
	db	255, 80, 1	; 80.7 GodHnd + Slmndr
	db	255, 80, 1	; 80.8 GodHnd + Dryad
	db	255, 80, 1	; 80.9 GodHnd + Undine
	db	255, 80, 1	; 80.10 GodHnd + Sylph
	db	255, 80, 1	; 80.11 GodHnd + Gnome
	db	255, 80, 1	; 80.12 GodHnd + Hirokn
	db	255, 80, 1	; 80.13 GodHnd + Oricon
	db	255, 80, 1	; 80.14 GodHnd + Zeus
	db	255, 80, 1	; 80.15 GodHnd + Hades
	db	255, 81, 1	; 81.1 Skull + Steel
	db	 80, 82, 5	; 81.2 Skull + Silver -> DgnHed
	db	 80, 83, 5	; 81.3 Skull + Gold -> DrkClw
	db	255, 81, 1	; 81.4 Skull + Tngstn
	db	 80, 83, 5	; 81.5 Skull + Platnm -> DrkClw
	db	 80, 82, 5	; 81.6 Skull + Mithrl -> DgnHed
	db	 80, 82, 5	; 81.7 Skull + Slmndr -> DgnHed
	db	255, 81, 1	; 81.8 Skull + Dryad
	db	 80, 83, 5	; 81.9 Skull + Undine -> DrkClw
	db	 80, 82, 5	; 81.10 Skull + Sylph -> DgnHed
	db	 80, 83, 5	; 81.11 Skull + Gnome -> DrkClw
	db	 80, 83, 5	; 81.12 Skull + Hirokn -> DrkClw
	db	 80, 82, 5	; 81.13 Skull + Oricon -> DgnHed
	db	255, 81, 1	; 81.14 Skull + Zeus
	db	255, 81, 1	; 81.15 Skull + Hades
	db	255, 82, 1	; 82.1 DgnHed + Steel
	db	255, 82, 1	; 82.2 DgnHed + Silver
	db	255, 82, 1	; 82.3 DgnHed + Gold
	db	255, 82, 1	; 82.4 DgnHed + Tngstn
	db	255, 82, 1	; 82.5 DgnHed + Platnm
	db	 30, 84,10	; 82.6 DgnHed + Mithrl -> Cursed
	db	 30, 84,10	; 82.7 DgnHed + Slmndr -> Cursed
	db	255, 82, 1	; 82.8 DgnHed + Dryad
	db	255, 82, 1	; 82.9 DgnHed + Undine
	db	255, 82, 1	; 82.10 DgnHed + Sylph
	db	 30, 84,10	; 82.11 DgnHed + Gnome -> Cursed
	db	255, 82, 1	; 82.12 DgnHed + Hirokn
	db	 30, 84,10	; 82.13 DgnHed + Oricon -> Cursed
	db	 30, 84,10	; 82.14 DgnHed + Zeus -> Cursed
	db	 30, 84,10	; 82.15 DgnHed + Hades -> Cursed
	db	255, 83, 1	; 83.1 DrkClw + Steel
	db	255, 83, 1	; 83.2 DrkClw + Silver
	db	255, 83, 1	; 83.3 DrkClw + Gold
	db	255, 83, 1	; 83.4 DrkClw + Tngstn
	db	255, 83, 1	; 83.5 DrkClw + Platnm
	db	255, 83, 1	; 83.6 DrkClw + Mithrl
	db	255, 83, 1	; 83.7 DrkClw + Slmndr
	db	255, 83, 1	; 83.8 DrkClw + Dryad
	db	255, 83, 1	; 83.9 DrkClw + Undine
	db	255, 83, 1	; 83.10 DrkClw + Sylph
	db	255, 83, 1	; 83.11 DrkClw + Gnome
	db	255, 83, 1	; 83.12 DrkClw + Hirokn
	db	255, 83, 1	; 83.13 DrkClw + Oricon
	db	255, 83, 1	; 83.14 DrkClw + Zeus
	db	255, 83, 1	; 83.15 DrkClw + Hades
	db	255, 84, 1	; 84.1 Cursed + Steel
	db	255, 84, 1	; 84.2 Cursed + Silver
	db	255, 84, 1	; 84.3 Cursed + Gold
	db	255, 84, 1	; 84.4 Cursed + Tngstn
	db	255, 84, 1	; 84.5 Cursed + Platnm
	db	255, 84, 1	; 84.6 Cursed + Mithrl
	db	 10, 85,15	; 84.7 Cursed + Slmndr -> Infrno
	db	255, 84, 1	; 84.8 Cursed + Dryad
	db	255, 84, 1	; 84.9 Cursed + Undine
	db	255, 84, 1	; 84.10 Cursed + Sylph
	db	 10, 85,15	; 84.11 Cursed + Gnome -> Infrno
	db	255, 84, 1	; 84.12 Cursed + Hirokn
	db	 10, 85,15	; 84.13 Cursed + Oricon -> Infrno
	db	 10, 85,15	; 84.14 Cursed + Zeus -> Infrno
	db	 10, 85,15	; 84.15 Cursed + Hades -> Infrno
	db	255, 85, 1	; 85.1 Infrno + Steel
	db	255, 85, 1	; 85.2 Infrno + Silver
	db	255, 85, 1	; 85.3 Infrno + Gold
	db	255, 85, 1	; 85.4 Infrno + Tngstn
	db	255, 85, 1	; 85.5 Infrno + Platnm
	db	255, 85, 1	; 85.6 Infrno + Mithrl
	db	255, 85, 1	; 85.7 Infrno + Slmndr
	db	255, 85, 1	; 85.8 Infrno + Dryad
	db	255, 85, 1	; 85.9 Infrno + Undine
	db	255, 85, 1	; 85.10 Infrno + Sylph
	db	255, 85, 1	; 85.11 Infrno + Gnome
	db	255, 85, 1	; 85.12 Infrno + Hirokn
	db	255, 85, 1	; 85.13 Infrno + Oricon
	db	255, 85, 1	; 85.14 Infrno + Zeus
	db	255, 85, 1	; 85.15 Infrno + Hades
	db	 80, 87, 5	; 86.1 Spring + Steel -> Curler
	db	 80, 88, 5	; 86.2 Spring + Silver -> Snaker
	db	255, 86, 1	; 86.3 Spring + Gold
	db	 80, 87, 5	; 86.4 Spring + Tngstn -> Curler
	db	255, 86, 1	; 86.5 Spring + Platnm
	db	 80, 88, 5	; 86.6 Spring + Mithrl -> Snaker
	db	255, 86, 1	; 86.7 Spring + Slmndr
	db	 80, 88, 5	; 86.8 Spring + Dryad -> Snaker
	db	255, 86, 1	; 86.9 Spring + Undine
	db	255, 86, 1	; 86.10 Spring + Sylph
	db	 80, 87, 5	; 86.11 Spring + Gnome -> Curler
	db	 80, 87, 5	; 86.12 Spring + Hirokn -> Curler
	db	 80, 88, 5	; 86.13 Spring + Oricon -> Snaker
	db	255, 86, 1	; 86.14 Spring + Zeus
	db	255, 86, 1	; 86.15 Spring + Hades
	db	255, 87, 1	; 87.1 Curler + Steel
	db	255, 87, 1	; 87.2 Curler + Silver
	db	255, 87, 1	; 87.3 Curler + Gold
	db	 30, 89,10	; 87.4 Curler + Tngstn -> Zoomer
	db	255, 87, 1	; 87.5 Curler + Platnm
	db	255, 87, 1	; 87.6 Curler + Mithrl
	db	255, 87, 1	; 87.7 Curler + Slmndr
	db	 30, 89,10	; 87.8 Curler + Dryad -> Zoomer
	db	255, 87, 1	; 87.9 Curler + Undine
	db	255, 87, 1	; 87.10 Curler + Sylph
	db	 30, 89,10	; 87.11 Curler + Gnome -> Zoomer
	db	 30, 89,10	; 87.12 Curler + Hirokn -> Zoomer
	db	255, 87, 1	; 87.13 Curler + Oricon
	db	 30, 89,10	; 87.14 Curler + Zeus -> Zoomer
	db	255, 87, 1	; 87.15 Curler + Hades
	db	255, 88, 1	; 88.1 Snaker + Steel
	db	255, 88, 1	; 88.2 Snaker + Silver
	db	255, 88, 1	; 88.3 Snaker + Gold
	db	255, 88, 1	; 88.4 Snaker + Tngstn
	db	255, 88, 1	; 88.5 Snaker + Platnm
	db	255, 88, 1	; 88.6 Snaker + Mithrl
	db	255, 88, 1	; 88.7 Snaker + Slmndr
	db	255, 88, 1	; 88.8 Snaker + Dryad
	db	255, 88, 1	; 88.9 Snaker + Undine
	db	255, 88, 1	; 88.10 Snaker + Sylph
	db	255, 88, 1	; 88.11 Snaker + Gnome
	db	255, 88, 1	; 88.12 Snaker + Hirokn
	db	255, 88, 1	; 88.13 Snaker + Oricon
	db	255, 88, 1	; 88.14 Snaker + Zeus
	db	255, 88, 1	; 88.15 Snaker + Hades
	db	255, 89, 1	; 89.1 Zoomer + Steel
	db	255, 89, 1	; 89.2 Zoomer + Silver
	db	255, 89, 1	; 89.3 Zoomer + Gold
	db	255, 89, 1	; 89.4 Zoomer + Tngstn
	db	255, 89, 1	; 89.5 Zoomer + Platnm
	db	255, 89, 1	; 89.6 Zoomer + Mithrl
	db	255, 89, 1	; 89.7 Zoomer + Slmndr
	db	255, 89, 1	; 89.8 Zoomer + Dryad
	db	255, 89, 1	; 89.9 Zoomer + Undine
	db	255, 89, 1	; 89.10 Zoomer + Sylph
	db	 10, 90,15	; 89.11 Zoomer + Gnome -> Buster
	db	 10, 90,15	; 89.12 Zoomer + Hirokn -> Buster
	db	255, 89, 1	; 89.13 Zoomer + Oricon
	db	 10, 90,15	; 89.14 Zoomer + Zeus -> Buster
	db	255, 89, 1	; 89.15 Zoomer + Hades
	db	255, 90, 1	; 90.1 Buster + Steel
	db	255, 90, 1	; 90.2 Buster + Silver
	db	255, 90, 1	; 90.3 Buster + Gold
	db	255, 90, 1	; 90.4 Buster + Tngstn
	db	255, 90, 1	; 90.5 Buster + Platnm
	db	255, 90, 1	; 90.6 Buster + Mithrl
	db	255, 90, 1	; 90.7 Buster + Slmndr
	db	255, 90, 1	; 90.8 Buster + Dryad
	db	255, 90, 1	; 90.9 Buster + Undine
	db	255, 90, 1	; 90.10 Buster + Sylph
	db	255, 90, 1	; 90.11 Buster + Gnome
	db	255, 90, 1	; 90.12 Buster + Hirokn
	db	255, 90, 1	; 90.13 Buster + Oricon
	db	255, 90, 1	; 90.14 Buster + Zeus
	db	255, 90, 1	; 90.15 Buster + Hades
	db	 80, 92, 5	; 91.1 Claw + Steel -> Triger
	db	255, 91, 1	; 91.2 Claw + Silver
	db	 80, 92, 5	; 91.3 Claw + Gold -> Triger
	db	 80, 92, 5	; 91.4 Claw + Tngstn -> Triger
	db	 80, 92, 5	; 91.5 Claw + Platnm -> Triger
	db	255, 91, 1	; 91.6 Claw + Mithrl
	db	 80, 92, 5	; 91.7 Claw + Slmndr -> Triger
	db	255, 91, 1	; 91.8 Claw + Dryad
	db	255, 91, 1	; 91.9 Claw + Undine
	db	 80, 92, 5	; 91.10 Claw + Sylph -> Triger
	db	255, 91, 1	; 91.11 Claw + Gnome
	db	 80, 92, 5	; 91.12 Claw + Hirokn -> Triger
	db	255, 91, 1	; 91.13 Claw + Oricon
	db	 80, 92, 5	; 91.14 Claw + Zeus -> Triger
	db	255, 91, 1	; 91.15 Claw + Hades
	db	255, 92, 1	; 92.1 Triger + Steel
	db	255, 92, 1	; 92.2 Triger + Silver
	db	255, 92, 1	; 92.3 Triger + Gold
	db	 30, 93,10	; 92.4 Triger + Tngstn -> Qatar
	db	255, 92, 1	; 92.5 Triger + Platnm
	db	 30, 93,10	; 92.6 Triger + Mithrl -> Qatar
	db	 30, 93,10	; 92.7 Triger + Slmndr -> Qatar
	db	255, 92, 1	; 92.8 Triger + Dryad
	db	255, 92, 1	; 92.9 Triger + Undine
	db	 30, 93,10	; 92.10 Triger + Sylph -> Qatar
	db	255, 92, 1	; 92.11 Triger + Gnome
	db	255, 92, 1	; 92.12 Triger + Hirokn
	db	 30, 93,10	; 92.13 Triger + Oricon -> Qatar
	db	 30, 93,10	; 92.14 Triger + Zeus -> Qatar
	db	255, 92, 1	; 92.15 Triger + Hades
	db	255, 93, 1	; 93.1 Qatar + Steel
	db	255, 93, 1	; 93.2 Qatar + Silver
	db	255, 93, 1	; 93.3 Qatar + Gold
	db	255, 93, 1	; 93.4 Qatar + Tngstn
	db	255, 93, 1	; 93.5 Qatar + Platnm
	db	255, 93, 1	; 93.6 Qatar + Mithrl
	db	 10, 95,15	; 93.7 Qatar + Slmndr -> Agni
	db	255, 93, 1	; 93.8 Qatar + Dryad
	db	255, 93, 1	; 93.9 Qatar + Undine
	db	 10, 94,15	; 93.10 Qatar + Sylph -> Indra
	db	255, 93, 1	; 93.11 Qatar + Gnome
	db	255, 93, 1	; 93.12 Qatar + Hirokn
	db	255, 93, 1	; 93.13 Qatar + Oricon
	db	255, 93, 1	; 93.14 Qatar + Zeus
	db	255, 93, 1	; 93.15 Qatar + Hades
	db	255, 94, 1	; 94.1 Indra + Steel
	db	255, 94, 1	; 94.2 Indra + Silver
	db	255, 94, 1	; 94.3 Indra + Gold
	db	255, 94, 1	; 94.4 Indra + Tngstn
	db	255, 94, 1	; 94.5 Indra + Platnm
	db	255, 94, 1	; 94.6 Indra + Mithrl
	db	255, 94, 1	; 94.7 Indra + Slmndr
	db	255, 94, 1	; 94.8 Indra + Dryad
	db	255, 94, 1	; 94.9 Indra + Undine
	db	255, 94, 1	; 94.10 Indra + Sylph
	db	255, 94, 1	; 94.11 Indra + Gnome
	db	255, 94, 1	; 94.12 Indra + Hirokn
	db	255, 94, 1	; 94.13 Indra + Oricon
	db	255, 94, 1	; 94.14 Indra + Zeus
	db	255, 94, 1	; 94.15 Indra + Hades
	db	255, 95, 1	; 95.1 Agni + Steel
	db	255, 95, 1	; 95.2 Agni + Silver
	db	255, 95, 1	; 95.3 Agni + Gold
	db	255, 95, 1	; 95.4 Agni + Tngstn
	db	255, 95, 1	; 95.5 Agni + Platnm
	db	255, 95, 1	; 95.6 Agni + Mithrl
	db	255, 95, 1	; 95.7 Agni + Slmndr
	db	255, 95, 1	; 95.8 Agni + Dryad
	db	255, 95, 1	; 95.9 Agni + Undine
	db	255, 95, 1	; 95.10 Agni + Sylph
	db	255, 95, 1	; 95.11 Agni + Gnome
	db	255, 95, 1	; 95.12 Agni + Hirokn
	db	255, 95, 1	; 95.13 Agni + Oricon
	db	255, 95, 1	; 95.14 Agni + Zeus
	db	255, 95, 1	; 95.15 Agni + Hades
	db	 80, 97, 5	; 96.1 Maxi + Steel -> Twin
	db	255, 96, 1	; 96.2 Maxi + Silver
	db	 80, 97, 5	; 96.3 Maxi + Gold -> Twin
	db	 80, 97, 5	; 96.4 Maxi + Tngstn -> Twin
	db	 80, 97, 5	; 96.5 Maxi + Platnm -> Twin
	db	255, 96, 1	; 96.6 Maxi + Mithrl
	db	 80, 97, 5	; 96.7 Maxi + Slmndr -> Twin
	db	255, 96, 1	; 96.8 Maxi + Dryad
	db	 80, 97, 5	; 96.9 Maxi + Undine -> Twin
	db	255, 96, 1	; 96.10 Maxi + Sylph
	db	255, 96, 1	; 96.11 Maxi + Gnome
	db	 80, 97, 5	; 96.12 Maxi + Hirokn -> Twin
	db	255, 96, 1	; 96.13 Maxi + Oricon
	db	 80, 97, 5	; 96.14 Maxi + Zeus -> Twin
	db	255, 96, 1	; 96.15 Maxi + Hades
	db	255, 97, 1	; 97.1 Twin + Steel
	db	255, 97, 1	; 97.2 Twin + Silver
	db	255, 97, 1	; 97.3 Twin + Gold
	db	255, 97, 1	; 97.4 Twin + Tngstn
	db	255, 97, 1	; 97.5 Twin + Platnm
	db	255, 97, 1	; 97.6 Twin + Mithrl
	db	 30, 98,10	; 97.7 Twin + Slmndr -> FPlse
	db	255, 97, 1	; 97.8 Twin + Dryad
	db	 30, 99,10	; 97.9 Twin + Undine -> IcePls
	db	255, 97, 1	; 97.10 Twin + Sylph
	db	255, 97, 1	; 97.11 Twin + Gnome
	db	255, 97, 1	; 97.12 Twin + Hirokn
	db	255, 97, 1	; 97.13 Twin + Oricon
	db	255, 97, 1	; 97.14 Twin + Zeus
	db	255, 97, 1	; 97.15 Twin + Hades
	db	255, 98, 1	; 98.1 FPlse + Steel
	db	255, 98, 1	; 98.2 FPlse + Silver
	db	255, 98, 1	; 98.3 FPlse + Gold
	db	255, 98, 1	; 98.4 FPlse + Tngstn
	db	255, 98, 1	; 98.5 FPlse + Platnm
	db	255, 98, 1	; 98.6 FPlse + Mithrl
	db	 10,100,15	; 98.7 FPlse + Slmndr -> Ashra
	db	255, 98, 1	; 98.8 FPlse + Dryad
	db	255, 98, 1	; 98.9 FPlse + Undine
	db	255, 98, 1	; 98.10 FPlse + Sylph
	db	255, 98, 1	; 98.11 FPlse + Gnome
	db	255, 98, 1	; 98.12 FPlse + Hirokn
	db	 10,100,15	; 98.13 FPlse + Oricon -> Ashra
	db	 10,100,15	; 98.14 FPlse + Zeus -> Ashra
	db	255, 98, 1	; 98.15 FPlse + Hades
	db	255, 99, 1	; 99.1 IcePls + Steel
	db	255, 99, 1	; 99.2 IcePls + Silver
	db	255, 99, 1	; 99.3 IcePls + Gold
	db	255, 99, 1	; 99.4 IcePls + Tngstn
	db	255, 99, 1	; 99.5 IcePls + Platnm
	db	255, 99, 1	; 99.6 IcePls + Mithrl
	db	255, 99, 1	; 99.7 IcePls + Slmndr
	db	255, 99, 1	; 99.8 IcePls + Dryad
	db	255, 99, 1	; 99.9 IcePls + Undine
	db	255, 99, 1	; 99.10 IcePls + Sylph
	db	255, 99, 1	; 99.11 IcePls + Gnome
	db	255, 99, 1	; 99.12 IcePls + Hirokn
	db	255, 99, 1	; 99.13 IcePls + Oricon
	db	255, 99, 1	; 99.14 IcePls + Zeus
	db	255, 99, 1	; 99.15 IcePls + Hades
	db	255,100, 1	; 100.1 Ashra + Steel
	db	255,100, 1	; 100.2 Ashra + Silver
	db	255,100, 1	; 100.3 Ashra + Gold
	db	255,100, 1	; 100.4 Ashra + Tngstn
	db	255,100, 1	; 100.5 Ashra + Platnm
	db	255,100, 1	; 100.6 Ashra + Mithrl
	db	255,100, 1	; 100.7 Ashra + Slmndr
	db	255,100, 1	; 100.8 Ashra + Dryad
	db	255,100, 1	; 100.9 Ashra + Undine
	db	255,100, 1	; 100.10 Ashra + Sylph
	db	255,100, 1	; 100.11 Ashra + Gnome
	db	255,100, 1	; 100.12 Ashra + Hirokn
	db	255,100, 1	; 100.13 Ashra + Oricon
	db	255,100, 1	; 100.14 Ashra + Zeus
	db	255,100, 1	; 100.15 Ashra + Hades
	db	 80,102, 5	; 101.1 Bazoka + Steel -> SDisc
	db	 80,103, 5	; 101.2 Bazoka + Silver -> Chnsaw
	db	255,101, 1	; 101.3 Bazoka + Gold
	db	 80,102, 5	; 101.4 Bazoka + Tngstn -> SDisc
	db	255,101, 1	; 101.5 Bazoka + Platnm
	db	 80,103, 5	; 101.6 Bazoka + Mithrl -> Chnsaw
	db	255,101, 1	; 101.7 Bazoka + Slmndr
	db	 80,103, 5	; 101.8 Bazoka + Dryad -> Chnsaw
	db	255,101, 1	; 101.9 Bazoka + Undine
	db	 80,102, 5	; 101.10 Bazoka + Sylph -> SDisc
	db	255,101, 1	; 101.11 Bazoka + Gnome
	db	 80,102, 5	; 101.12 Bazoka + Hirokn -> SDisc
	db	 80,103, 5	; 101.13 Bazoka + Oricon -> Chnsaw
	db	255,101, 1	; 101.14 Bazoka + Zeus
	db	255,101, 1	; 101.15 Bazoka + Hades
	db	255,102, 1	; 102.1 SDisc + Steel
	db	255,102, 1	; 102.2 SDisc + Silver
	db	255,102, 1	; 102.3 SDisc + Gold
	db	255,102, 1	; 102.4 SDisc + Tngstn
	db	255,102, 1	; 102.5 SDisc + Platnm
	db	255,102, 1	; 102.6 SDisc + Mithrl
	db	255,102, 1	; 102.7 SDisc + Slmndr
	db	255,102, 1	; 102.8 SDisc + Dryad
	db	255,102, 1	; 102.9 SDisc + Undine
	db	255,102, 1	; 102.10 SDisc + Sylph
	db	255,102, 1	; 102.11 SDisc + Gnome
	db	255,102, 1	; 102.12 SDisc + Hirokn
	db	255,102, 1	; 102.13 SDisc + Oricon
	db	255,102, 1	; 102.14 SDisc + Zeus
	db	255,102, 1	; 102.15 SDisc + Hades
	db	255,103, 1	; 103.1 Chnsaw + Steel
	db	255,103, 1	; 103.2 Chnsaw + Silver
	db	255,103, 1	; 103.3 Chnsaw + Gold
	db	 30,104,10	; 103.4 Chnsaw + Tngstn -> Saw
	db	255,103, 1	; 103.5 Chnsaw + Platnm
	db	255,103, 1	; 103.6 Chnsaw + Mithrl
	db	255,103, 1	; 103.7 Chnsaw + Slmndr
	db	 30,104,10	; 103.8 Chnsaw + Dryad -> Saw
	db	255,103, 1	; 103.9 Chnsaw + Undine
	db	255,103, 1	; 103.10 Chnsaw + Sylph
	db	255,103, 1	; 103.11 Chnsaw + Gnome
	db	 30,104,10	; 103.12 Chnsaw + Hirokn -> Saw
	db	255,103, 1	; 103.13 Chnsaw + Oricon
	db	 30,104,10	; 103.14 Chnsaw + Zeus -> Saw
	db	255,103, 1	; 103.15 Chnsaw + Hades
	db	255,104, 1	; 104.1 Saw + Steel
	db	255,104, 1	; 104.2 Saw + Silver
	db	255,104, 1	; 104.3 Saw + Gold
	db	255,104, 1	; 104.4 Saw + Tngstn
	db	255,104, 1	; 104.5 Saw + Platnm
	db	255,104, 1	; 104.6 Saw + Mithrl
	db	255,104, 1	; 104.7 Saw + Slmndr
	db	255,104, 1	; 104.8 Saw + Dryad
	db	255,104, 1	; 104.9 Saw + Undine
	db	255,104, 1	; 104.10 Saw + Sylph
	db	255,104, 1	; 104.11 Saw + Gnome
	db	 10,105,15	; 104.12 Saw + Hirokn -> Hacker
	db	255,104, 1	; 104.13 Saw + Oricon
	db	 10,105,15	; 104.14 Saw + Zeus -> Hacker
	db	255,104, 1	; 104.15 Saw + Hades
	db	255,105, 1	; 105.1 Hacker + Steel
	db	255,105, 1	; 105.2 Hacker + Silver
	db	255,105, 1	; 105.3 Hacker + Gold
	db	255,105, 1	; 105.4 Hacker + Tngstn
	db	255,105, 1	; 105.5 Hacker + Platnm
	db	255,105, 1	; 105.6 Hacker + Mithrl
	db	255,105, 1	; 105.7 Hacker + Slmndr
	db	255,105, 1	; 105.8 Hacker + Dryad
	db	255,105, 1	; 105.9 Hacker + Undine
	db	255,105, 1	; 105.10 Hacker + Sylph
	db	255,105, 1	; 105.11 Hacker + Gnome
	db	255,105, 1	; 105.12 Hacker + Hirokn
	db	255,105, 1	; 105.13 Hacker + Oricon
	db	255,105, 1	; 105.14 Hacker + Zeus
	db	255,105, 1	; 105.15 Hacker + Hades
	db	 80,107, 5	; 106.1 Knukle + Steel -> Gloves
	db	 80,108, 5	; 106.2 Knukle + Silver -> Rocket
	db	255,106, 1	; 106.3 Knukle + Gold
	db	 80,107, 5	; 106.4 Knukle + Tngstn -> Gloves
	db	255,106, 1	; 106.5 Knukle + Platnm
	db	 80,108, 5	; 106.6 Knukle + Mithrl -> Rocket
	db	 80,108, 5	; 106.7 Knukle + Slmndr -> Rocket
	db	255,106, 1	; 106.8 Knukle + Dryad
	db	255,106, 1	; 106.9 Knukle + Undine
	db	255,106, 1	; 106.10 Knukle + Sylph
	db	 80,107, 5	; 106.11 Knukle + Gnome -> Gloves
	db	 80,107, 5	; 106.12 Knukle + Hirokn -> Gloves
	db	 80,108, 5	; 106.13 Knukle + Oricon -> Rocket
	db	255,106, 1	; 106.14 Knukle + Zeus
	db	255,106, 1	; 106.15 Knukle + Hades
	db	255,107, 1	; 107.1 Gloves + Steel
	db	255,107, 1	; 107.2 Gloves + Silver
	db	255,107, 1	; 107.3 Gloves + Gold
	db	 30,109,10	; 107.4 Gloves + Tngstn -> Mail
	db	255,107, 1	; 107.5 Gloves + Platnm
	db	255,107, 1	; 107.6 Gloves + Mithrl
	db	255,107, 1	; 107.7 Gloves + Slmndr
	db	255,107, 1	; 107.8 Gloves + Dryad
	db	255,107, 1	; 107.9 Gloves + Undine
	db	255,107, 1	; 107.10 Gloves + Sylph
	db	 30,109,10	; 107.11 Gloves + Gnome -> Mail
	db	 30,109,10	; 107.12 Gloves + Hirokn -> Mail
	db	255,107, 1	; 107.13 Gloves + Oricon
	db	 30,109,10	; 107.14 Gloves + Zeus -> Mail
	db	255,107, 1	; 107.15 Gloves + Hades
	db	255,108, 1	; 108.1 Rocket + Steel
	db	255,108, 1	; 108.2 Rocket + Silver
	db	255,108, 1	; 108.3 Rocket + Gold
	db	255,108, 1	; 108.4 Rocket + Tngstn
	db	255,108, 1	; 108.5 Rocket + Platnm
	db	255,108, 1	; 108.6 Rocket + Mithrl
	db	255,108, 1	; 108.7 Rocket + Slmndr
	db	255,108, 1	; 108.8 Rocket + Dryad
	db	255,108, 1	; 108.9 Rocket + Undine
	db	255,108, 1	; 108.10 Rocket + Sylph
	db	255,108, 1	; 108.11 Rocket + Gnome
	db	255,108, 1	; 108.12 Rocket + Hirokn
	db	255,108, 1	; 108.13 Rocket + Oricon
	db	255,108, 1	; 108.14 Rocket + Zeus
	db	255,108, 1	; 108.15 Rocket + Hades
	db	255,109, 1	; 109.1 Mail + Steel
	db	255,109, 1	; 109.2 Mail + Silver
	db	255,109, 1	; 109.3 Mail + Gold
	db	255,109, 1	; 109.4 Mail + Tngstn
	db	255,109, 1	; 109.5 Mail + Platnm
	db	255,109, 1	; 109.6 Mail + Mithrl
	db	255,109, 1	; 109.7 Mail + Slmndr
	db	255,109, 1	; 109.8 Mail + Dryad
	db	255,109, 1	; 109.9 Mail + Undine
	db	255,109, 1	; 109.10 Mail + Sylph
	db	 10,110,15	; 109.11 Mail + Gnome -> Plate
	db	 10,110,15	; 109.12 Mail + Hirokn -> Plate
	db	255,109, 1	; 109.13 Mail + Oricon
	db	 10,110,15	; 109.14 Mail + Zeus -> Plate
	db	255,109, 1	; 109.15 Mail + Hades
	db	255,110, 1	; 110.1 Plate + Steel
	db	255,110, 1	; 110.2 Plate + Silver
	db	255,110, 1	; 110.3 Plate + Gold
	db	255,110, 1	; 110.4 Plate + Tngstn
	db	255,110, 1	; 110.5 Plate + Platnm
	db	255,110, 1	; 110.6 Plate + Mithrl
	db	255,110, 1	; 110.7 Plate + Slmndr
	db	255,110, 1	; 110.8 Plate + Dryad
	db	255,110, 1	; 110.9 Plate + Undine
	db	255,110, 1	; 110.10 Plate + Sylph
	db	255,110, 1	; 110.11 Plate + Gnome
	db	255,110, 1	; 110.12 Plate + Hirokn
	db	255,110, 1	; 110.13 Plate + Oricon
	db	255,110, 1	; 110.14 Plate + Zeus
	db	255,110, 1	; 110.15 Plate + Hades
	db	255,111, 1	; 111.1 Troopr + Steel
	db	 80,112, 5	; 111.2 Troopr + Silver -> Scorp
	db	 80,112, 5	; 111.3 Troopr + Gold -> Scorp
	db	255,111, 1	; 111.4 Troopr + Tngstn
	db	 80,112, 5	; 111.5 Troopr + Platnm -> Scorp
	db	 80,112, 5	; 111.6 Troopr + Mithrl -> Scorp
	db	255,111, 1	; 111.7 Troopr + Slmndr
	db	 80,112, 5	; 111.8 Troopr + Dryad -> Scorp
	db	 80,112, 5	; 111.9 Troopr + Undine -> Scorp
	db	255,111, 1	; 111.10 Troopr + Sylph
	db	255,111, 1	; 111.11 Troopr + Gnome
	db	255,111, 1	; 111.12 Troopr + Hirokn
	db	 80,112, 5	; 111.13 Troopr + Oricon -> Scorp
	db	 80,112, 5	; 111.14 Troopr + Zeus -> Scorp
	db	255,111, 1	; 111.15 Troopr + Hades
	db	255,112, 1	; 112.1 Scorp + Steel
	db	255,112, 1	; 112.2 Scorp + Silver
	db	255,112, 1	; 112.3 Scorp + Gold
	db	255,112, 1	; 112.4 Scorp + Tngstn
	db	 30,113,10	; 112.5 Scorp + Platnm -> Spider
	db	 30,114,10	; 112.6 Scorp + Mithrl -> Mantis
	db	255,112, 1	; 112.7 Scorp + Slmndr
	db	 30,114,10	; 112.8 Scorp + Dryad -> Mantis
	db	 30,113,10	; 112.9 Scorp + Undine -> Spider
	db	255,112, 1	; 112.10 Scorp + Sylph
	db	255,112, 1	; 112.11 Scorp + Gnome
	db	 30,114,10	; 112.12 Scorp + Hirokn -> Mantis
	db	 30,113,10	; 112.13 Scorp + Oricon -> Spider
	db	255,112, 1	; 112.14 Scorp + Zeus
	db	255,112, 1	; 112.15 Scorp + Hades
	db	255,113, 1	; 113.1 Spider + Steel
	db	255,113, 1	; 113.2 Spider + Silver
	db	255,113, 1	; 113.3 Spider + Gold
	db	255,113, 1	; 113.4 Spider + Tngstn
	db	255,113, 1	; 113.5 Spider + Platnm
	db	255,113, 1	; 113.6 Spider + Mithrl
	db	255,113, 1	; 113.7 Spider + Slmndr
	db	 10,115,15	; 113.8 Spider + Dryad -> RedClw
	db	 10,115,15	; 113.9 Spider + Undine -> RedClw
	db	255,113, 1	; 113.10 Spider + Sylph
	db	255,113, 1	; 113.11 Spider + Gnome
	db	255,113, 1	; 113.12 Spider + Hirokn
	db	 10,115,15	; 113.13 Spider + Oricon -> RedClw
	db	 10,115,15	; 113.14 Spider + Zeus -> RedClw
	db	255,113, 1	; 113.15 Spider + Hades
	db	255,114, 1	; 114.1 Mantis + Steel
	db	255,114, 1	; 114.2 Mantis + Silver
	db	255,114, 1	; 114.3 Mantis + Gold
	db	255,114, 1	; 114.4 Mantis + Tngstn
	db	255,114, 1	; 114.5 Mantis + Platnm
	db	255,114, 1	; 114.6 Mantis + Mithrl
	db	255,114, 1	; 114.7 Mantis + Slmndr
	db	255,114, 1	; 114.8 Mantis + Dryad
	db	255,114, 1	; 114.9 Mantis + Undine
	db	255,114, 1	; 114.10 Mantis + Sylph
	db	255,114, 1	; 114.11 Mantis + Gnome
	db	255,114, 1	; 114.12 Mantis + Hirokn
	db	255,114, 1	; 114.13 Mantis + Oricon
	db	255,114, 1	; 114.14 Mantis + Zeus
	db	255,114, 1	; 114.15 Mantis + Hades
	db	255,115, 1	; 115.1 RedClw + Steel
	db	255,115, 1	; 115.2 RedClw + Silver
	db	255,115, 1	; 115.3 RedClw + Gold
	db	255,115, 1	; 115.4 RedClw + Tngstn
	db	255,115, 1	; 115.5 RedClw + Platnm
	db	255,115, 1	; 115.6 RedClw + Mithrl
	db	255,115, 1	; 115.7 RedClw + Slmndr
	db	255,115, 1	; 115.8 RedClw + Dryad
	db	255,115, 1	; 115.9 RedClw + Undine
	db	255,115, 1	; 115.10 RedClw + Sylph
	db	255,115, 1	; 115.11 RedClw + Gnome
	db	255,115, 1	; 115.12 RedClw + Hirokn
	db	255,115, 1	; 115.13 RedClw + Oricon
	db	255,115, 1	; 115.14 RedClw + Zeus
	db	255,115, 1	; 115.15 RedClw + Hades
	db	255,116, 1	; 116.1 HndGun + Steel
	db	 80,117, 5	; 116.2 HndGun + Silver -> Vulcan
	db	 80,118, 5	; 116.3 HndGun + Gold -> Lncher
	db	255,116, 1	; 116.4 HndGun + Tngstn
	db	 80,118, 5	; 116.5 HndGun + Platnm -> Lncher
	db	 80,117, 5	; 116.6 HndGun + Mithrl -> Vulcan
	db	 80,118, 5	; 116.7 HndGun + Slmndr -> Lncher
	db	255,116, 1	; 116.8 HndGun + Dryad
	db	255,116, 1	; 116.9 HndGun + Undine
	db	 80,117, 5	; 116.10 HndGun + Sylph -> Vulcan
	db	255,116, 1	; 116.11 HndGun + Gnome
	db	 80,118, 5	; 116.12 HndGun + Hirokn -> Lncher
	db	 80,117, 5	; 116.13 HndGun + Oricon -> Vulcan
	db	255,116, 1	; 116.14 HndGun + Zeus
	db	255,116, 1	; 116.15 HndGun + Hades
	db	255,117, 1	; 117.1 Vulcan + Steel
	db	255,117, 1	; 117.2 Vulcan + Silver
	db	255,117, 1	; 117.3 Vulcan + Gold
	db	 30,119,10	; 117.4 Vulcan + Tngstn -> Gatlng
	db	255,117, 1	; 117.5 Vulcan + Platnm
	db	255,117, 1	; 117.6 Vulcan + Mithrl
	db	255,117, 1	; 117.7 Vulcan + Slmndr
	db	255,117, 1	; 117.8 Vulcan + Dryad
	db	255,117, 1	; 117.9 Vulcan + Undine
	db	 30,119,10	; 117.10 Vulcan + Sylph -> Gatlng
	db	255,117, 1	; 117.11 Vulcan + Gnome
	db	 30,119,10	; 117.12 Vulcan + Hirokn -> Gatlng
	db	255,117, 1	; 117.13 Vulcan + Oricon
	db	 30,119,10	; 117.14 Vulcan + Zeus -> Gatlng
	db	255,117, 1	; 117.15 Vulcan + Hades
	db	255,118, 1	; 118.1 Lncher + Steel
	db	255,118, 1	; 118.2 Lncher + Silver
	db	255,118, 1	; 118.3 Lncher + Gold
	db	255,118, 1	; 118.4 Lncher + Tngstn
	db	 30,120,10	; 118.5 Lncher + Platnm -> Phalnx
	db	255,118, 1	; 118.6 Lncher + Mithrl
	db	 30,120,10	; 118.7 Lncher + Slmndr -> Phalnx
	db	255,118, 1	; 118.8 Lncher + Dryad
	db	255,118, 1	; 118.9 Lncher + Undine
	db	255,118, 1	; 118.10 Lncher + Sylph
	db	255,118, 1	; 118.11 Lncher + Gnome
	db	 30,120,10	; 118.12 Lncher + Hirokn -> Phalnx
	db	255,118, 1	; 118.13 Lncher + Oricon
	db	 30,120,10	; 118.14 Lncher + Zeus -> Phalnx
	db	255,118, 1	; 118.15 Lncher + Hades
	db	255,119, 1	; 119.1 Gatlng + Steel
	db	255,119, 1	; 119.2 Gatlng + Silver
	db	255,119, 1	; 119.3 Gatlng + Gold
	db	255,119, 1	; 119.4 Gatlng + Tngstn
	db	255,119, 1	; 119.5 Gatlng + Platnm
	db	255,119, 1	; 119.6 Gatlng + Mithrl
	db	255,119, 1	; 119.7 Gatlng + Slmndr
	db	255,119, 1	; 119.8 Gatlng + Dryad
	db	255,119, 1	; 119.9 Gatlng + Undine
	db	255,119, 1	; 119.10 Gatlng + Sylph
	db	255,119, 1	; 119.11 Gatlng + Gnome
	db	255,119, 1	; 119.12 Gatlng + Hirokn
	db	255,119, 1	; 119.13 Gatlng + Oricon
	db	255,119, 1	; 119.14 Gatlng + Zeus
	db	255,119, 1	; 119.15 Gatlng + Hades
	db	255,120, 1	; 120.1 Phalnx + Steel
	db	255,120, 1	; 120.2 Phalnx + Silver
	db	255,120, 1	; 120.3 Phalnx + Gold
	db	255,120, 1	; 120.4 Phalnx + Tngstn
	db	255,120, 1	; 120.5 Phalnx + Platnm
	db	255,120, 1	; 120.6 Phalnx + Mithrl
	db	255,120, 1	; 120.7 Phalnx + Slmndr
	db	255,120, 1	; 120.8 Phalnx + Dryad
	db	255,120, 1	; 120.9 Phalnx + Undine
	db	255,120, 1	; 120.10 Phalnx + Sylph
	db	255,120, 1	; 120.11 Phalnx + Gnome
	db	255,120, 1	; 120.12 Phalnx + Hirokn
	db	255,120, 1	; 120.13 Phalnx + Oricon
	db	255,120, 1	; 120.14 Phalnx + Zeus
	db	255,120, 1	; 120.15 Phalnx + Hades
	db	 80,122, 5	; 121.1 Cannon + Steel -> 2Barrl
	db	 80,123, 5	; 121.2 Cannon + Silver -> LineGn
	db	255,121, 1	; 121.3 Cannon + Gold
	db	 80,122, 5	; 121.4 Cannon + Tngstn -> 2Barrl
	db	255,121, 1	; 121.5 Cannon + Platnm
	db	 80,123, 5	; 121.6 Cannon + Mithrl -> LineGn
	db	 80,123, 5	; 121.7 Cannon + Slmndr -> LineGn
	db	255,121, 1	; 121.8 Cannon + Dryad
	db	255,121, 1	; 121.9 Cannon + Undine
	db	 80,122, 5	; 121.10 Cannon + Sylph -> 2Barrl
	db	255,121, 1	; 121.11 Cannon + Gnome
	db	 80,122, 5	; 121.12 Cannon + Hirokn -> 2Barrl
	db	 80,123, 5	; 121.13 Cannon + Oricon -> LineGn
	db	255,121, 1	; 121.14 Cannon + Zeus
	db	255,121, 1	; 121.15 Cannon + Hades
	db	255,122, 1	; 122.1 2Barrl + Steel
	db	255,122, 1	; 122.2 2Barrl + Silver
	db	255,122, 1	; 122.3 2Barrl + Gold
	db	255,122, 1	; 122.4 2Barrl + Tngstn
	db	255,122, 1	; 122.5 2Barrl + Platnm
	db	255,122, 1	; 122.6 2Barrl + Mithrl
	db	255,122, 1	; 122.7 2Barrl + Slmndr
	db	255,122, 1	; 122.8 2Barrl + Dryad
	db	255,122, 1	; 122.9 2Barrl + Undine
	db	255,122, 1	; 122.10 2Barrl + Sylph
	db	255,122, 1	; 122.11 2Barrl + Gnome
	db	255,122, 1	; 122.12 2Barrl + Hirokn
	db	255,122, 1	; 122.13 2Barrl + Oricon
	db	255,122, 1	; 122.14 2Barrl + Zeus
	db	255,122, 1	; 122.15 2Barrl + Hades
	db	255,123, 1	; 123.1 LineGn + Steel
	db	255,123, 1	; 123.2 LineGn + Silver
	db	255,123, 1	; 123.3 LineGn + Gold
	db	 30,124,10	; 123.4 LineGn + Tngstn -> XGun
	db	255,123, 1	; 123.5 LineGn + Platnm
	db	255,123, 1	; 123.6 LineGn + Mithrl
	db	 30,124,10	; 123.7 LineGn + Slmndr -> XGun
	db	255,123, 1	; 123.8 LineGn + Dryad
	db	255,123, 1	; 123.9 LineGn + Undine
	db	255,123, 1	; 123.10 LineGn + Sylph
	db	255,123, 1	; 123.11 LineGn + Gnome
	db	 30,124,10	; 123.12 LineGn + Hirokn -> XGun
	db	255,123, 1	; 123.13 LineGn + Oricon
	db	 30,124,10	; 123.14 LineGn + Zeus -> XGun
	db	255,123, 1	; 123.15 LineGn + Hades
	db	255,124, 1	; 124.1 XGun + Steel
	db	255,124, 1	; 124.2 XGun + Silver
	db	255,124, 1	; 124.3 XGun + Gold
	db	255,124, 1	; 124.4 XGun + Tngstn
	db	255,124, 1	; 124.5 XGun + Platnm
	db	255,124, 1	; 124.6 XGun + Mithrl
	db	 10,125,15	; 124.7 XGun + Slmndr -> RailGn
	db	255,124, 1	; 124.8 XGun + Dryad
	db	255,124, 1	; 124.9 XGun + Undine
	db	255,124, 1	; 124.10 XGun + Sylph
	db	255,124, 1	; 124.11 XGun + Gnome
	db	 10,125,15	; 124.12 XGun + Hirokn -> RailGn
	db	255,124, 1	; 124.13 XGun + Oricon
	db	 10,125,15	; 124.14 XGun + Zeus -> RailGn
	db	255,124, 1	; 124.15 XGun + Hades
	db	255,125, 1	; 125.1 RailGn + Steel
	db	255,125, 1	; 125.2 RailGn + Silver
	db	255,125, 1	; 125.3 RailGn + Gold
	db	255,125, 1	; 125.4 RailGn + Tngstn
	db	255,125, 1	; 125.5 RailGn + Platnm
	db	255,125, 1	; 125.6 RailGn + Mithrl
	db	255,125, 1	; 125.7 RailGn + Slmndr
	db	255,125, 1	; 125.8 RailGn + Dryad
	db	255,125, 1	; 125.9 RailGn + Undine
	db	255,125, 1	; 125.10 RailGn + Sylph
	db	255,125, 1	; 125.11 RailGn + Gnome
	db	255,125, 1	; 125.12 RailGn + Hirokn
	db	255,125, 1	; 125.13 RailGn + Oricon
	db	255,125, 1	; 125.14 RailGn + Zeus
	db	255,125, 1	; 125.15 RailGn + Hades
	db	255,126, 1	; 126.1 Flint + Steel
	db	255,126, 1	; 126.2 Flint + Silver
	db	255,126, 1	; 126.3 Flint + Gold
	db	255,126, 1	; 126.4 Flint + Tngstn
	db	255,126, 1	; 126.5 Flint + Platnm
	db	255,126, 1	; 126.6 Flint + Mithrl
	db	255,126, 1	; 126.7 Flint + Slmndr
	db	255,126, 1	; 126.8 Flint + Dryad
	db	255,126, 1	; 126.9 Flint + Undine
	db	255,126, 1	; 126.10 Flint + Sylph
	db	255,126, 1	; 126.11 Flint + Gnome
	db	255,126, 1	; 126.12 Flint + Hirokn
	db	255,126, 1	; 126.13 Flint + Oricon
	db	255,126, 1	; 126.14 Flint + Zeus
	db	255,126, 1	; 126.15 Flint + Hades
	db	255,127, 1	; 127.1 Sword + Steel
	db	255,127, 1	; 127.2 Sword + Silver
	db	255,127, 1	; 127.3 Sword + Gold
	db	255,127, 1	; 127.4 Sword + Tngstn
	db	255,127, 1	; 127.5 Sword + Platnm
	db	255,127, 1	; 127.6 Sword + Mithrl
	db	255,127, 1	; 127.7 Sword + Slmndr
	db	255,127, 1	; 127.8 Sword + Dryad
	db	255,127, 1	; 127.9 Sword + Undine
	db	255,127, 1	; 127.10 Sword + Sylph
	db	255,127, 1	; 127.11 Sword + Gnome
	db	255,127, 1	; 127.12 Sword + Hirokn
	db	255,127, 1	; 127.13 Sword + Oricon
	db	255,127, 1	; 127.14 Sword + Zeus
	db	255,127, 1	; 127.15 Sword + Hades
	db	255,128, 1	; 128.1 Kama + Steel
	db	255,128, 1	; 128.2 Kama + Silver
	db	255,128, 1	; 128.3 Kama + Gold
	db	255,128, 1	; 128.4 Kama + Tngstn
	db	255,128, 1	; 128.5 Kama + Platnm
	db	255,128, 1	; 128.6 Kama + Mithrl
	db	255,128, 1	; 128.7 Kama + Slmndr
	db	255,128, 1	; 128.8 Kama + Dryad
	db	255,128, 1	; 128.9 Kama + Undine
	db	255,128, 1	; 128.10 Kama + Sylph
	db	255,128, 1	; 128.11 Kama + Gnome
	db	255,128, 1	; 128.12 Kama + Hirokn
	db	255,128, 1	; 128.13 Kama + Oricon
	db	255,128, 1	; 128.14 Kama + Zeus
	db	255,128, 1	; 128.15 Kama + Hades
	db	255,129, 1	; 129.1 TgrHnd + Steel
	db	255,129, 1	; 129.2 TgrHnd + Silver
	db	255,129, 1	; 129.3 TgrHnd + Gold
	db	255,129, 1	; 129.4 TgrHnd + Tngstn
	db	255,129, 1	; 129.5 TgrHnd + Platnm
	db	255,129, 1	; 129.6 TgrHnd + Mithrl
	db	255,129, 1	; 129.7 TgrHnd + Slmndr
	db	255,129, 1	; 129.8 TgrHnd + Dryad
	db	255,129, 1	; 129.9 TgrHnd + Undine
	db	255,129, 1	; 129.10 TgrHnd + Sylph
	db	255,129, 1	; 129.11 TgrHnd + Gnome
	db	255,129, 1	; 129.12 TgrHnd + Hirokn
	db	255,129, 1	; 129.13 TgrHnd + Oricon
	db	255,129, 1	; 129.14 TgrHnd + Zeus
	db	255,129, 1	; 129.15 TgrHnd + Hades
	db	255,130, 1	; 130.1 MoleHd + Steel
	db	255,130, 1	; 130.2 MoleHd + Silver
	db	255,130, 1	; 130.3 MoleHd + Gold
	db	255,130, 1	; 130.4 MoleHd + Tngstn
	db	255,130, 1	; 130.5 MoleHd + Platnm
	db	255,130, 1	; 130.6 MoleHd + Mithrl
	db	255,130, 1	; 130.7 MoleHd + Slmndr
	db	255,130, 1	; 130.8 MoleHd + Dryad
	db	255,130, 1	; 130.9 MoleHd + Undine
	db	255,130, 1	; 130.10 MoleHd + Sylph
	db	255,130, 1	; 130.11 MoleHd + Gnome
	db	255,130, 1	; 130.12 MoleHd + Hirokn
	db	255,130, 1	; 130.13 MoleHd + Oricon
	db	255,130, 1	; 130.14 MoleHd + Zeus
	db	255,130, 1	; 130.15 MoleHd + Hades
	db	255,131, 1	; 131.1 Stunr + Steel
	db	255,131, 1	; 131.2 Stunr + Silver
	db	255,131, 1	; 131.3 Stunr + Gold
	db	255,131, 1	; 131.4 Stunr + Tngstn
	db	255,131, 1	; 131.5 Stunr + Platnm
	db	255,131, 1	; 131.6 Stunr + Mithrl
	db	255,131, 1	; 131.7 Stunr + Slmndr
	db	255,131, 1	; 131.8 Stunr + Dryad
	db	255,131, 1	; 131.9 Stunr + Undine
	db	255,131, 1	; 131.10 Stunr + Sylph
	db	255,131, 1	; 131.11 Stunr + Gnome
	db	255,131, 1	; 131.12 Stunr + Hirokn
	db	255,131, 1	; 131.13 Stunr + Oricon
	db	255,131, 1	; 131.14 Stunr + Zeus
	db	255,131, 1	; 131.15 Stunr + Hades
	db	255,132, 1	; 132.1 Needle + Steel
	db	255,132, 1	; 132.2 Needle + Silver
	db	255,132, 1	; 132.3 Needle + Gold
	db	255,132, 1	; 132.4 Needle + Tngstn
	db	255,132, 1	; 132.5 Needle + Platnm
	db	255,132, 1	; 132.6 Needle + Mithrl
	db	255,132, 1	; 132.7 Needle + Slmndr
	db	255,132, 1	; 132.8 Needle + Dryad
	db	255,132, 1	; 132.9 Needle + Undine
	db	255,132, 1	; 132.10 Needle + Sylph
	db	255,132, 1	; 132.11 Needle + Gnome
	db	255,132, 1	; 132.12 Needle + Hirokn
	db	255,132, 1	; 132.13 Needle + Oricon
	db	255,132, 1	; 132.14 Needle + Zeus
	db	255,132, 1	; 132.15 Needle + Hades
	db	255,133, 1	; 133.1 Pole + Steel
	db	255,133, 1	; 133.2 Pole + Silver
	db	255,133, 1	; 133.3 Pole + Gold
	db	255,133, 1	; 133.4 Pole + Tngstn
	db	255,133, 1	; 133.5 Pole + Platnm
	db	255,133, 1	; 133.6 Pole + Mithrl
	db	255,133, 1	; 133.7 Pole + Slmndr
	db	255,133, 1	; 133.8 Pole + Dryad
	db	255,133, 1	; 133.9 Pole + Undine
	db	255,133, 1	; 133.10 Pole + Sylph
	db	255,133, 1	; 133.11 Pole + Gnome
	db	255,133, 1	; 133.12 Pole + Hirokn
	db	255,133, 1	; 133.13 Pole + Oricon
	db	255,133, 1	; 133.14 Pole + Zeus
	db	255,133, 1	; 133.15 Pole + Hades
