; gfx/parts.asm: robot part images (DrawPartImage), in ROM order (written once by tools/assets.py extract; edited by hand since). Each keeps its address in its own section;
; the included product says how the Makefile builds it (see README).

d_25EF50	section	romdata abs=0x25EF50
Part_BodyBody1:    ; used by Body1
$include "build/gfx/parts/body/body1.img4.asm"	; build/gfx/parts/body/body1.img4
d_25EFFB	section	romdata abs=0x25EFFB
Part_BodyBody12:    ; used by Body1
$include "build/gfx/parts/body/body1_2.img4.asm"	; build/gfx/parts/body/body1_2.img4
d_25F0CF	section	romdata abs=0x25F0CF
Part_BodyBody122:    ; used by Body1
$include "build/gfx/parts/body/body1_2_2.img4.asm"	; build/gfx/parts/body/body1_2_2.img4
d_25F194	section	romdata abs=0x25F194
Part_BodyBody1222:    ; used by Body1
$include "build/gfx/parts/body/body1_2_2_2.img4.asm"	; build/gfx/parts/body/body1_2_2_2.img4
d_25F253	section	romdata abs=0x25F253
Part_BodyBody12222:    ; used by Body1
$include "build/gfx/parts/body/body1_2_2_2_2.img4.asm"	; build/gfx/parts/body/body1_2_2_2_2.img4
d_25F33F	section	romdata abs=0x25F33F
Part_BodyBody2:    ; used by Body2
$include "build/gfx/parts/body/body2.img4.asm"	; build/gfx/parts/body/body2.img4
d_25F3E5	section	romdata abs=0x25F3E5
Part_BodyBody22:    ; used by Body2
$include "build/gfx/parts/body/body2_2.img4.asm"	; build/gfx/parts/body/body2_2.img4
d_25F500	section	romdata abs=0x25F500
Part_BodyBody222:    ; used by Body2
$include "build/gfx/parts/body/body2_2_2.img4.asm"	; build/gfx/parts/body/body2_2_2.img4
d_25F5CD	section	romdata abs=0x25F5CD
Part_BodyBody2222:    ; used by Body2
$include "build/gfx/parts/body/body2_2_2_2.img4.asm"	; build/gfx/parts/body/body2_2_2_2.img4
d_25F6AB	section	romdata abs=0x25F6AB
Part_BodyBody22222:    ; used by Body2
$include "build/gfx/parts/body/body2_2_2_2_2.img4.asm"	; build/gfx/parts/body/body2_2_2_2_2.img4
d_25F764	section	romdata abs=0x25F764
Part_BodyBody3:    ; used by Body3
$include "build/gfx/parts/body/body3.img4.asm"	; build/gfx/parts/body/body3.img4
d_25F82A	section	romdata abs=0x25F82A
Part_BodyBody32:    ; used by Body3
$include "build/gfx/parts/body/body3_2.img4.asm"	; build/gfx/parts/body/body3_2.img4
d_25F95B	section	romdata abs=0x25F95B
Part_BodyBody322:    ; used by Body3
$include "build/gfx/parts/body/body3_2_2.img4.asm"	; build/gfx/parts/body/body3_2_2.img4
d_25FA14	section	romdata abs=0x25FA14
Part_BodyBody3222:    ; used by Body3
$include "build/gfx/parts/body/body3_2_2_2.img4.asm"	; build/gfx/parts/body/body3_2_2_2.img4
d_25FAD7	section	romdata abs=0x25FAD7
Part_BodyBody32222:    ; used by Body3
$include "build/gfx/parts/body/body3_2_2_2_2.img4.asm"	; build/gfx/parts/body/body3_2_2_2_2.img4
d_25FBD3	section	romdata abs=0x25FBD3
Part_LegsHuman:    ; used by Human
$include "build/gfx/parts/legs/human.img4.asm"	; build/gfx/parts/legs/human.img4
d_25FCF0	section	romdata abs=0x25FCF0
Part_LegsForest:    ; used by Forest
$include "build/gfx/parts/legs/forest.img4.asm"	; build/gfx/parts/legs/forest.img4
d_25FDEE	section	romdata abs=0x25FDEE
Part_LegsMarinr:    ; used by Marinr
$include "build/gfx/parts/legs/marinr.img4.asm"	; build/gfx/parts/legs/marinr.img4
d_25FF66	section	romdata abs=0x25FF66
Part_LegsBirdan:    ; used by Birdan
$include "build/gfx/parts/legs/birdan.img4.asm"	; build/gfx/parts/legs/birdan.img4
d_260079	section	romdata abs=0x260079
Part_LegsTurtle:    ; used by Turtle
$include "build/gfx/parts/legs/turtle.img4.asm"	; build/gfx/parts/legs/turtle.img4
d_2601BE	section	romdata abs=0x2601BE
Part_LegsKnight:    ; used by Knight
$include "build/gfx/parts/legs/knight.img4.asm"	; build/gfx/parts/legs/knight.img4
d_2602ED	section	romdata abs=0x2602ED
Part_LegsMarble:    ; used by Marble
$include "build/gfx/parts/legs/marble.img4.asm"	; build/gfx/parts/legs/marble.img4
d_260468	section	romdata abs=0x260468
Part_LegsObsedn:    ; used by Obsedn
$include "build/gfx/parts/legs/obsedn.img4.asm"	; build/gfx/parts/legs/obsedn.img4
d_2605BA	section	romdata abs=0x2605BA
Part_LegsFightr:    ; used by Fightr
$include "build/gfx/parts/legs/fightr.img4.asm"	; build/gfx/parts/legs/fightr.img4
d_26071C	section	romdata abs=0x26071C
Part_LegsHero:    ; used by Hero
$include "build/gfx/parts/legs/hero.img4.asm"	; build/gfx/parts/legs/hero.img4
d_2608A0	section	romdata abs=0x2608A0
Part_LegsUnused11:
$include "build/gfx/parts/legs/unused_11.img4.asm"	; build/gfx/parts/legs/unused_11.img4
d_260A0B	section	romdata abs=0x260A0B
Part_LegsLizard:    ; used by Lizard
$include "build/gfx/parts/legs/lizard.img4.asm"	; build/gfx/parts/legs/lizard.img4
d_260B61	section	romdata abs=0x260B61
Part_LegsUnused13:
$include "build/gfx/parts/legs/unused_13.img4.asm"	; build/gfx/parts/legs/unused_13.img4
d_260C85	section	romdata abs=0x260C85
Part_LegsPaladn:    ; used by Paladn
$include "build/gfx/parts/legs/paladn.img4.asm"	; build/gfx/parts/legs/paladn.img4
d_260DC2	section	romdata abs=0x260DC2
Part_LegsRivet:    ; used by Rivet
$include "build/gfx/parts/legs/rivet.img4.asm"	; build/gfx/parts/legs/rivet.img4
d_260F38	section	romdata abs=0x260F38
Part_LegsKalon:    ; used by Kalon
$include "build/gfx/parts/legs/kalon.img4.asm"	; build/gfx/parts/legs/kalon.img4
d_2610B6	section	romdata abs=0x2610B6
Part_LegsJester:    ; used by Jester
$include "build/gfx/parts/legs/jester.img4.asm"	; build/gfx/parts/legs/jester.img4
d_26126F	section	romdata abs=0x26126F
Part_LegsUnused18:
$include "build/gfx/parts/legs/unused_18.img4.asm"	; build/gfx/parts/legs/unused_18.img4
d_261415	section	romdata abs=0x261415
Part_LegsUnused19:
$include "build/gfx/parts/legs/unused_19.img4.asm"	; build/gfx/parts/legs/unused_19.img4
d_26157C	section	romdata abs=0x26157C
Part_LegsUnused20:
$include "build/gfx/parts/legs/unused_20.img4.asm"	; build/gfx/parts/legs/unused_20.img4
d_261748	section	romdata abs=0x261748
Part_LegsCentar:    ; used by Centar
$include "build/gfx/parts/legs/centar.img4.asm"	; build/gfx/parts/legs/centar.img4
d_261919	section	romdata abs=0x261919
Part_LegsDino1:    ; used by Dino1
$include "build/gfx/parts/legs/dino1.img4.asm"	; build/gfx/parts/legs/dino1.img4
d_261B03	section	romdata abs=0x261B03
Part_LegsDino2:    ; used by Dino2
$include "build/gfx/parts/legs/dino2.img4.asm"	; build/gfx/parts/legs/dino2.img4
d_261D96	section	romdata abs=0x261D96
Part_LegsSaurus:    ; used by Saurus
$include "build/gfx/parts/legs/saurus.img4.asm"	; build/gfx/parts/legs/saurus.img4
d_261FE3	section	romdata abs=0x261FE3
Part_LegsUnused25:
$include "build/gfx/parts/legs/unused_25.img4.asm"	; build/gfx/parts/legs/unused_25.img4
d_262103	section	romdata abs=0x262103
Part_LegsUnused26:
$include "build/gfx/parts/legs/unused_26.img4.asm"	; build/gfx/parts/legs/unused_26.img4
d_2621D4	section	romdata abs=0x2621D4
Part_LegsWorm1:    ; used by Worm1
$include "build/gfx/parts/legs/worm1.img4.asm"	; build/gfx/parts/legs/worm1.img4
d_2623A1	section	romdata abs=0x2623A1
Part_LegsWorm2:    ; used by Worm2
$include "build/gfx/parts/legs/worm2.img4.asm"	; build/gfx/parts/legs/worm2.img4
d_2625BE	section	romdata abs=0x2625BE
Part_LegsWheel:    ; used by Wheel
$include "build/gfx/parts/legs/wheel.img4.asm"	; build/gfx/parts/legs/wheel.img4
d_2627EA	section	romdata abs=0x2627EA
Part_LegsMultil:    ; used by MultiL
$include "build/gfx/parts/legs/multil.img4.asm"	; build/gfx/parts/legs/multil.img4
d_2629F4	section	romdata abs=0x2629F4
Part_LegsWyrm1:    ; used by Wyrm1
$include "build/gfx/parts/legs/wyrm1.img4.asm"	; build/gfx/parts/legs/wyrm1.img4
d_262C12	section	romdata abs=0x262C12
Part_LegsWyrm2:    ; used by Wyrm2
$include "build/gfx/parts/legs/wyrm2.img4.asm"	; build/gfx/parts/legs/wyrm2.img4
d_262E54	section	romdata abs=0x262E54
Part_LegsInsect:    ; used by Insect
$include "build/gfx/parts/legs/insect.img4.asm"	; build/gfx/parts/legs/insect.img4
d_2630F1	section	romdata abs=0x2630F1
Part_LegsCrab:    ; used by Crab
$include "build/gfx/parts/legs/crab.img4.asm"	; build/gfx/parts/legs/crab.img4
d_2633C1	section	romdata abs=0x2633C1
Part_LegsWasp:    ; used by Wasp
$include "build/gfx/parts/legs/wasp.img4.asm"	; build/gfx/parts/legs/wasp.img4
d_2635C6	section	romdata abs=0x2635C6
Part_LegsManta:    ; used by Manta
$include "build/gfx/parts/legs/manta.img4.asm"	; build/gfx/parts/legs/manta.img4
d_263786	section	romdata abs=0x263786
Part_LegsSiren:    ; used by Siren
$include "build/gfx/parts/legs/siren.img4.asm"	; build/gfx/parts/legs/siren.img4
d_263924	section	romdata abs=0x263924
Part_LegsDolphn:    ; used by Dolphn
$include "build/gfx/parts/legs/dolphn.img4.asm"	; build/gfx/parts/legs/dolphn.img4
d_263B7E	section	romdata abs=0x263B7E
Part_LegsSerpnt:    ; used by Serpnt
$include "build/gfx/parts/legs/serpnt.img4.asm"	; build/gfx/parts/legs/serpnt.img4
d_263D66	section	romdata abs=0x263D66
Part_LegsTntacl:    ; used by Tntacl
$include "build/gfx/parts/legs/tntacl.img4.asm"	; build/gfx/parts/legs/tntacl.img4
d_264162	section	romdata abs=0x264162
Part_LegsDragon:    ; used by Dragon, Scout1
$include "build/gfx/parts/legs/dragon.img4.asm"	; build/gfx/parts/legs/dragon.img4
d_2642F9	section	romdata abs=0x2642F9
Part_LegsCraftr:    ; used by Craftr
$include "build/gfx/parts/legs/craftr.img4.asm"	; build/gfx/parts/legs/craftr.img4
d_264424	section	romdata abs=0x264424
Part_LegsBoost2:    ; used by Boost2
$include "build/gfx/parts/legs/boost2.img4.asm"	; build/gfx/parts/legs/boost2.img4
d_264596	section	romdata abs=0x264596
Part_LegsBoost1:    ; used by Boost1
$include "build/gfx/parts/legs/boost1.img4.asm"	; build/gfx/parts/legs/boost1.img4
d_2646F8	section	romdata abs=0x2646F8
Part_LegsWing:    ; used by Wing
$include "build/gfx/parts/legs/wing.img4.asm"	; build/gfx/parts/legs/wing.img4
d_26484A	section	romdata abs=0x26484A
Part_LegsScout2:    ; used by Scout2
$include "build/gfx/parts/legs/scout2.img4.asm"	; build/gfx/parts/legs/scout2.img4
d_264A1C	section	romdata abs=0x264A1C
Part_LegsTiger:    ; used by Tiger
$include "build/gfx/parts/legs/tiger.img4.asm"	; build/gfx/parts/legs/tiger.img4
d_264BC8	section	romdata abs=0x264BC8
Part_LegsMagic:    ; used by Magic
$include "build/gfx/parts/legs/magic.img4.asm"	; build/gfx/parts/legs/magic.img4
d_264DB0	section	romdata abs=0x264DB0
Part_LegsFlier2:    ; used by Flier2
$include "build/gfx/parts/legs/flier2.img4.asm"	; build/gfx/parts/legs/flier2.img4
d_26500C	section	romdata abs=0x26500C
Part_LegsFlier1:    ; used by Flier1
$include "build/gfx/parts/legs/flier1.img4.asm"	; build/gfx/parts/legs/flier1.img4
d_2652A5	section	romdata abs=0x2652A5
Part_ArmRBtfist:    ; used by BtFist
$include "build/gfx/parts/arm_r/btfist.img4.asm"	; build/gfx/parts/arm_r/btfist.img4
d_265305	section	romdata abs=0x265305
Part_ArmLBtfist:    ; used by BtFist
$include "build/gfx/parts/arm_l/btfist.img4.asm"	; build/gfx/parts/arm_l/btfist.img4
d_26538C	section	romdata abs=0x26538C
Part_ArmRSlkhnd:    ; used by SlkHnd
$include "build/gfx/parts/arm_r/slkhnd.img4.asm"	; build/gfx/parts/arm_r/slkhnd.img4
d_265402	section	romdata abs=0x265402
Part_ArmLSlkhnd:    ; used by SlkHnd
$include "build/gfx/parts/arm_l/slkhnd.img4.asm"	; build/gfx/parts/arm_l/slkhnd.img4
d_265471	section	romdata abs=0x265471
Part_ArmRHGun:    ; used by H-Gun
$include "build/gfx/parts/arm_r/h_gun.img4.asm"	; build/gfx/parts/arm_r/h_gun.img4
d_265511	section	romdata abs=0x265511
Part_ArmLHGun:    ; used by H-Gun
$include "build/gfx/parts/arm_l/h_gun.img4.asm"	; build/gfx/parts/arm_l/h_gun.img4
d_2655CD	section	romdata abs=0x2655CD
Part_ArmRHawk:    ; used by Hawk
$include "build/gfx/parts/arm_r/hawk.img4.asm"	; build/gfx/parts/arm_r/hawk.img4
d_26568D	section	romdata abs=0x26568D
Part_ArmLHawk:    ; used by Hawk
$include "build/gfx/parts/arm_l/hawk.img4.asm"	; build/gfx/parts/arm_l/hawk.img4
d_265777	section	romdata abs=0x265777
Part_ArmROgre:    ; used by Ogre
$include "build/gfx/parts/arm_r/ogre.img4.asm"	; build/gfx/parts/arm_r/ogre.img4
d_265880	section	romdata abs=0x265880
Part_ArmLOgre:    ; used by Ogre
$include "build/gfx/parts/arm_l/ogre.img4.asm"	; build/gfx/parts/arm_l/ogre.img4
d_2659C8	section	romdata abs=0x2659C8
Part_ArmRLancer:    ; used by Lancer, Pierce
$include "build/gfx/parts/arm_r/lancer.img4.asm"	; build/gfx/parts/arm_r/lancer.img4
d_265A8D	section	romdata abs=0x265A8D
Part_ArmLLancer:    ; used by Lancer, Pierce
$include "build/gfx/parts/arm_l/lancer.img4.asm"	; build/gfx/parts/arm_l/lancer.img4
d_265B6D	section	romdata abs=0x265B6D
Part_ArmRDrlarm:    ; used by DrlArm, Trnado, Spiral
$include "build/gfx/parts/arm_r/drlarm.img4.asm"	; build/gfx/parts/arm_r/drlarm.img4
d_265C32	section	romdata abs=0x265C32
Part_ArmLDrlarm:    ; used by DrlArm, Trnado, Spiral
$include "build/gfx/parts/arm_l/drlarm.img4.asm"	; build/gfx/parts/arm_l/drlarm.img4
d_265CF0	section	romdata abs=0x265CF0
Part_ArmRBazoka:    ; used by Bazoka, SDisc
$include "build/gfx/parts/arm_r/bazoka.img4.asm"	; build/gfx/parts/arm_r/bazoka.img4
d_265DCD	section	romdata abs=0x265DCD
Part_ArmLBazoka:    ; used by Bazoka, SDisc
$include "build/gfx/parts/arm_l/bazoka.img4.asm"	; build/gfx/parts/arm_l/bazoka.img4
d_265ED2	section	romdata abs=0x265ED2
Part_ArmRChnsaw:    ; used by Chnsaw, Saw, Hacker
$include "build/gfx/parts/arm_r/chnsaw.img4.asm"	; build/gfx/parts/arm_r/chnsaw.img4
d_265FF6	section	romdata abs=0x265FF6
Part_ArmLChnsaw:    ; used by Chnsaw, Saw, Hacker
$include "build/gfx/parts/arm_l/chnsaw.img4.asm"	; build/gfx/parts/arm_l/chnsaw.img4
d_266137	section	romdata abs=0x266137
Part_ArmRUnused10:
$include "build/gfx/parts/arm_r/unused_10.img4.asm"	; build/gfx/parts/arm_r/unused_10.img4
d_2661E8	section	romdata abs=0x2661E8
Part_ArmLUnused10:
$include "build/gfx/parts/arm_l/unused_10.img4.asm"	; build/gfx/parts/arm_l/unused_10.img4
d_266358	section	romdata abs=0x266358
Part_ArmRPwrhnd:    ; used by PwrHnd
$include "build/gfx/parts/arm_r/pwrhnd.img4.asm"	; build/gfx/parts/arm_r/pwrhnd.img4
d_2663FE	section	romdata abs=0x2663FE
Part_ArmLPwrhnd:    ; used by PwrHnd
$include "build/gfx/parts/arm_l/pwrhnd.img4.asm"	; build/gfx/parts/arm_l/pwrhnd.img4
d_2664B0	section	romdata abs=0x2664B0
Part_ArmRHkclaw:    ; used by HkClaw, WlfClw, TgrClw
$include "build/gfx/parts/arm_r/hkclaw.img4.asm"	; build/gfx/parts/arm_r/hkclaw.img4
d_266582	section	romdata abs=0x266582
Part_ArmLHkclaw:    ; used by HkClaw, WlfClw, TgrClw
$include "build/gfx/parts/arm_l/hkclaw.img4.asm"	; build/gfx/parts/arm_l/hkclaw.img4
d_266666	section	romdata abs=0x266666
Part_ArmRPole:    ; used by Pole
$include "build/gfx/parts/arm_r/pole.img4.asm"	; build/gfx/parts/arm_r/pole.img4
d_26670E	section	romdata abs=0x26670E
Part_ArmLPole:    ; used by Pole
$include "build/gfx/parts/arm_l/pole.img4.asm"	; build/gfx/parts/arm_l/pole.img4
d_266807	section	romdata abs=0x266807
Part_ArmRRapier:    ; used by Rapier
$include "build/gfx/parts/arm_r/rapier.img4.asm"	; build/gfx/parts/arm_r/rapier.img4
d_2668D8	section	romdata abs=0x2668D8
Part_ArmLRapier:    ; used by Rapier
$include "build/gfx/parts/arm_l/rapier.img4.asm"	; build/gfx/parts/arm_l/rapier.img4
d_2669C8	section	romdata abs=0x2669C8
Part_ArmRBtlhk:    ; used by BtlHk, IceClw, DvlClw
$include "build/gfx/parts/arm_r/btlhk.img4.asm"	; build/gfx/parts/arm_r/btlhk.img4
d_266AAC	section	romdata abs=0x266AAC
Part_ArmLBtlhk:    ; used by BtlHk, IceClw, DvlClw
$include "build/gfx/parts/arm_l/btlhk.img4.asm"	; build/gfx/parts/arm_l/btlhk.img4
d_266BA7	section	romdata abs=0x266BA7
Part_ArmRWhip:    ; used by Whip, FBoot
$include "build/gfx/parts/arm_r/whip.img4.asm"	; build/gfx/parts/arm_r/whip.img4
d_266C7A	section	romdata abs=0x266C7A
Part_ArmLWhip:    ; used by Whip, FBoot
$include "build/gfx/parts/arm_l/whip.img4.asm"	; build/gfx/parts/arm_l/whip.img4
d_266D50	section	romdata abs=0x266D50
Part_ArmRWhipPlus:    ; used by Whip+, 9Tail, EBoot
$include "build/gfx/parts/arm_r/whip_plus.img4.asm"	; build/gfx/parts/arm_r/whip_plus.img4
d_266E63	section	romdata abs=0x266E63
Part_ArmLWhipPlus:    ; used by Whip+, 9Tail, EBoot
$include "build/gfx/parts/arm_l/whip_plus.img4.asm"	; build/gfx/parts/arm_l/whip_plus.img4
d_266F67	section	romdata abs=0x266F67
Part_ArmRArmhnd:    ; used by ArmHnd
$include "build/gfx/parts/arm_r/armhnd.img4.asm"	; build/gfx/parts/arm_r/armhnd.img4
d_26706C	section	romdata abs=0x26706C
Part_ArmLArmhnd:    ; used by ArmHnd
$include "build/gfx/parts/arm_l/armhnd.img4.asm"	; build/gfx/parts/arm_l/armhnd.img4
d_26717D	section	romdata abs=0x26717D
Part_ArmRDisc:    ; used by Disc, RingD, AirD
$include "build/gfx/parts/arm_r/disc.img4.asm"	; build/gfx/parts/arm_r/disc.img4
d_267243	section	romdata abs=0x267243
Part_ArmLDisc:    ; used by Disc, RingD, AirD
$include "build/gfx/parts/arm_l/disc.img4.asm"	; build/gfx/parts/arm_l/disc.img4
d_26731F	section	romdata abs=0x26731F
Part_ArmRSpiked:    ; used by SpikeD, Disc+
$include "build/gfx/parts/arm_r/spiked.img4.asm"	; build/gfx/parts/arm_r/spiked.img4
d_26745A	section	romdata abs=0x26745A
Part_ArmLSpiked:    ; used by SpikeD, Disc+
$include "build/gfx/parts/arm_l/spiked.img4.asm"	; build/gfx/parts/arm_l/spiked.img4
d_2675C0	section	romdata abs=0x2675C0
Part_ArmRWarlok:    ; used by Warlok, ArchMg
$include "build/gfx/parts/arm_r/warlok.img4.asm"	; build/gfx/parts/arm_r/warlok.img4
d_2676FA	section	romdata abs=0x2676FA
Part_ArmLWarlok:    ; used by Warlok, ArchMg
$include "build/gfx/parts/arm_l/warlok.img4.asm"	; build/gfx/parts/arm_l/warlok.img4
d_267862	section	romdata abs=0x267862
Part_ArmRGodhnd:    ; used by GodHnd
$include "build/gfx/parts/arm_r/godhnd.img4.asm"	; build/gfx/parts/arm_r/godhnd.img4
d_2679AF	section	romdata abs=0x2679AF
Part_ArmLGodhnd:    ; used by GodHnd
$include "build/gfx/parts/arm_l/godhnd.img4.asm"	; build/gfx/parts/arm_l/godhnd.img4
d_267B12	section	romdata abs=0x267B12
Part_ArmRTroopr:    ; used by Troopr
$include "build/gfx/parts/arm_r/troopr.img4.asm"	; build/gfx/parts/arm_r/troopr.img4
d_267BB7	section	romdata abs=0x267BB7
Part_ArmLTroopr:    ; used by Troopr
$include "build/gfx/parts/arm_l/troopr.img4.asm"	; build/gfx/parts/arm_l/troopr.img4
d_267C86	section	romdata abs=0x267C86
Part_ArmRMantis:    ; used by Mantis
$include "build/gfx/parts/arm_r/mantis.img4.asm"	; build/gfx/parts/arm_r/mantis.img4
d_267D93	section	romdata abs=0x267D93
Part_ArmLMantis:    ; used by Mantis
$include "build/gfx/parts/arm_l/mantis.img4.asm"	; build/gfx/parts/arm_l/mantis.img4
d_267ECD	section	romdata abs=0x267ECD
Part_ArmRGolem:    ; used by Golem
$include "build/gfx/parts/arm_r/golem.img4.asm"	; build/gfx/parts/arm_r/golem.img4
d_267F81	section	romdata abs=0x267F81
Part_ArmLGolem:    ; used by Golem
$include "build/gfx/parts/arm_l/golem.img4.asm"	; build/gfx/parts/arm_l/golem.img4
d_26802A	section	romdata abs=0x26802A
Part_ArmRHydro:    ; used by Hydro
$include "build/gfx/parts/arm_r/hydro.img4.asm"	; build/gfx/parts/arm_r/hydro.img4
d_2681CB	section	romdata abs=0x2681CB
Part_ArmLHydro:    ; used by Hydro
$include "build/gfx/parts/arm_l/hydro.img4.asm"	; build/gfx/parts/arm_l/hydro.img4
d_268389	section	romdata abs=0x268389
Part_ArmRSnaker:    ; used by Snaker
$include "build/gfx/parts/arm_r/snaker.img4.asm"	; build/gfx/parts/arm_r/snaker.img4
d_268513	section	romdata abs=0x268513
Part_ArmLSnaker:    ; used by Snaker
$include "build/gfx/parts/arm_l/snaker.img4.asm"	; build/gfx/parts/arm_l/snaker.img4
d_2686FF	section	romdata abs=0x2686FF
Part_ArmRScorp:    ; used by Scorp, Spider
$include "build/gfx/parts/arm_r/scorp.img4.asm"	; build/gfx/parts/arm_r/scorp.img4
d_2687DA	section	romdata abs=0x2687DA
Part_ArmLScorp:    ; used by Scorp, Spider
$include "build/gfx/parts/arm_l/scorp.img4.asm"	; build/gfx/parts/arm_l/scorp.img4
d_2688BF	section	romdata abs=0x2688BF
Part_ArmRRedclw:    ; used by RedClw
$include "build/gfx/parts/arm_r/redclw.img4.asm"	; build/gfx/parts/arm_r/redclw.img4
d_268A0D	section	romdata abs=0x268A0D
Part_ArmLRedclw:    ; used by RedClw
$include "build/gfx/parts/arm_l/redclw.img4.asm"	; build/gfx/parts/arm_l/redclw.img4
d_268B3D	section	romdata abs=0x268B3D
Part_ArmRCrssbw:    ; used by Crssbw
$include "build/gfx/parts/arm_r/crssbw.img4.asm"	; build/gfx/parts/arm_r/crssbw.img4
d_268C00	section	romdata abs=0x268C00
Part_ArmLCrssbw:    ; used by Crssbw
$include "build/gfx/parts/arm_l/crssbw.img4.asm"	; build/gfx/parts/arm_l/crssbw.img4
d_268CCA	section	romdata abs=0x268CCA
Part_ArmRSabre:    ; used by Sabre, Gram
$include "build/gfx/parts/arm_r/sabre.img4.asm"	; build/gfx/parts/arm_r/sabre.img4
d_268D51	section	romdata abs=0x268D51
Part_ArmLSabre:    ; used by Sabre, Gram
$include "build/gfx/parts/arm_l/sabre.img4.asm"	; build/gfx/parts/arm_l/sabre.img4
d_268DDD	section	romdata abs=0x268DDD
Part_ArmRSabrePlus:    ; used by Sabre+, Wyndia
$include "build/gfx/parts/arm_r/sabre_plus.img4.asm"	; build/gfx/parts/arm_r/sabre_plus.img4
d_268E86	section	romdata abs=0x268E86
Part_ArmLSabrePlus:    ; used by Sabre+, Wyndia
$include "build/gfx/parts/arm_l/sabre_plus.img4.asm"	; build/gfx/parts/arm_l/sabre_plus.img4
d_268F2F	section	romdata abs=0x268F2F
Part_ArmRHndaxe:    ; used by HndAxe, Tomhwk
$include "build/gfx/parts/arm_r/hndaxe.img4.asm"	; build/gfx/parts/arm_r/hndaxe.img4
d_26902C	section	romdata abs=0x26902C
Part_ArmLHndaxe:    ; used by HndAxe, Tomhwk
$include "build/gfx/parts/arm_l/hndaxe.img4.asm"	; build/gfx/parts/arm_l/hndaxe.img4
d_26913F	section	romdata abs=0x26913F
Part_ArmRBtlaxe:    ; used by BtlAxe, 2Edge, Break
$include "build/gfx/parts/arm_r/btlaxe.img4.asm"	; build/gfx/parts/arm_r/btlaxe.img4
d_26926E	section	romdata abs=0x26926E
Part_ArmLBtlaxe:    ; used by BtlAxe, 2Edge, Break
$include "build/gfx/parts/arm_l/btlaxe.img4.asm"	; build/gfx/parts/arm_l/btlaxe.img4
d_2693A2	section	romdata abs=0x2693A2
Part_ArmRMgabll:    ; used by MgaBll, Crushr
$include "build/gfx/parts/arm_r/mgabll.img4.asm"	; build/gfx/parts/arm_r/mgabll.img4
d_26949E	section	romdata abs=0x26949E
Part_ArmLMgabll:    ; used by MgaBll, Crushr
$include "build/gfx/parts/arm_l/mgabll.img4.asm"	; build/gfx/parts/arm_l/mgabll.img4
d_2695C7	section	romdata abs=0x2695C7
Part_ArmRCurler:    ; used by Curler, Buster
$include "build/gfx/parts/arm_r/curler.img4.asm"	; build/gfx/parts/arm_r/curler.img4
d_2696DE	section	romdata abs=0x2696DE
Part_ArmLCurler:    ; used by Curler, Buster
$include "build/gfx/parts/arm_l/curler.img4.asm"	; build/gfx/parts/arm_l/curler.img4
d_269806	section	romdata abs=0x269806
Part_ArmRSpring:    ; used by Spring, Zoomer
$include "build/gfx/parts/arm_r/spring.img4.asm"	; build/gfx/parts/arm_r/spring.img4
d_2698EB	section	romdata abs=0x2698EB
Part_ArmLSpring:    ; used by Spring, Zoomer
$include "build/gfx/parts/arm_l/spring.img4.asm"	; build/gfx/parts/arm_l/spring.img4
d_2699D3	section	romdata abs=0x2699D3
Part_ArmRMage:    ; used by Mage, Wizard
$include "build/gfx/parts/arm_r/mage.img4.asm"	; build/gfx/parts/arm_r/mage.img4
d_269AB8	section	romdata abs=0x269AB8
Part_ArmLMage:    ; used by Mage, Wizard
$include "build/gfx/parts/arm_l/mage.img4.asm"	; build/gfx/parts/arm_l/mage.img4
d_269BB3	section	romdata abs=0x269BB3
Part_ArmRGradus:    ; used by Gradus, Lavatn, Crsadr
$include "build/gfx/parts/arm_r/gradus.img4.asm"	; build/gfx/parts/arm_r/gradus.img4
d_269C48	section	romdata abs=0x269C48
Part_ArmLGradus:    ; used by Gradus, Lavatn, Crsadr
$include "build/gfx/parts/arm_l/gradus.img4.asm"	; build/gfx/parts/arm_l/gradus.img4
d_269D20	section	romdata abs=0x269D20
Part_ArmRDirk:    ; used by Dirk, Demon
$include "build/gfx/parts/arm_r/dirk.img4.asm"	; build/gfx/parts/arm_r/dirk.img4
d_269DCC	section	romdata abs=0x269DCC
Part_ArmLDirk:    ; used by Dirk, Demon
$include "build/gfx/parts/arm_l/dirk.img4.asm"	; build/gfx/parts/arm_l/dirk.img4
d_269EA8	section	romdata abs=0x269EA8
Part_ArmRLinegn:    ; used by LineGn, RailGn
$include "build/gfx/parts/arm_r/linegn.img4.asm"	; build/gfx/parts/arm_r/linegn.img4
d_269F99	section	romdata abs=0x269F99
Part_ArmLLinegn:    ; used by LineGn, RailGn
$include "build/gfx/parts/arm_l/linegn.img4.asm"	; build/gfx/parts/arm_l/linegn.img4
d_26A0C8	section	romdata abs=0x26A0C8
Part_ArmRCannon:    ; used by Cannon
$include "build/gfx/parts/arm_r/cannon.img4.asm"	; build/gfx/parts/arm_r/cannon.img4
d_26A1DF	section	romdata abs=0x26A1DF
Part_ArmLCannon:    ; used by Cannon
$include "build/gfx/parts/arm_l/cannon.img4.asm"	; build/gfx/parts/arm_l/cannon.img4
d_26A30D	section	romdata abs=0x26A30D
Part_ArmRHndgun:    ; used by HndGun
$include "build/gfx/parts/arm_r/hndgun.img4.asm"	; build/gfx/parts/arm_r/hndgun.img4
d_26A3EF	section	romdata abs=0x26A3EF
Part_ArmLHndgun:    ; used by HndGun
$include "build/gfx/parts/arm_l/hndgun.img4.asm"	; build/gfx/parts/arm_l/hndgun.img4
d_26A4D9	section	romdata abs=0x26A4D9
Part_ArmRVulcan:    ; used by Vulcan, Gatlng
$include "build/gfx/parts/arm_r/vulcan.img4.asm"	; build/gfx/parts/arm_r/vulcan.img4
d_26A5EF	section	romdata abs=0x26A5EF
Part_ArmLVulcan:    ; used by Vulcan, Gatlng
$include "build/gfx/parts/arm_l/vulcan.img4.asm"	; build/gfx/parts/arm_l/vulcan.img4
d_26A712	section	romdata abs=0x26A712
Part_ArmR2Barrl:    ; used by 2Barrl, XGun
$include "build/gfx/parts/arm_r/2barrl.img4.asm"	; build/gfx/parts/arm_r/2barrl.img4
d_26A822	section	romdata abs=0x26A822
Part_ArmL2Barrl:    ; used by 2Barrl, XGun
$include "build/gfx/parts/arm_l/2barrl.img4.asm"	; build/gfx/parts/arm_l/2barrl.img4
d_26A951	section	romdata abs=0x26A951
Part_ArmRLncher:    ; used by Lncher, Phalnx
$include "build/gfx/parts/arm_r/lncher.img4.asm"	; build/gfx/parts/arm_r/lncher.img4
d_26AA45	section	romdata abs=0x26AA45
Part_ArmLLncher:    ; used by Lncher, Phalnx
$include "build/gfx/parts/arm_l/lncher.img4.asm"	; build/gfx/parts/arm_l/lncher.img4
d_26AB33	section	romdata abs=0x26AB33
Part_ArmRBinder:    ; used by Binder
$include "build/gfx/parts/arm_r/binder.img4.asm"	; build/gfx/parts/arm_r/binder.img4
d_26AC12	section	romdata abs=0x26AC12
Part_ArmLBinder:    ; used by Binder
$include "build/gfx/parts/arm_l/binder.img4.asm"	; build/gfx/parts/arm_l/binder.img4
d_26AD1F	section	romdata abs=0x26AD1F
Part_ArmRMagma:    ; used by Magma
$include "build/gfx/parts/arm_r/magma.img4.asm"	; build/gfx/parts/arm_r/magma.img4
d_26AE0B	section	romdata abs=0x26AE0B
Part_ArmLMagma:    ; used by Magma
$include "build/gfx/parts/arm_l/magma.img4.asm"	; build/gfx/parts/arm_l/magma.img4
d_26AF04	section	romdata abs=0x26AF04
Part_ArmRPliers:    ; used by Pliers
$include "build/gfx/parts/arm_r/pliers.img4.asm"	; build/gfx/parts/arm_r/pliers.img4
d_26B03D	section	romdata abs=0x26B03D
Part_ArmLPliers:    ; used by Pliers
$include "build/gfx/parts/arm_l/pliers.img4.asm"	; build/gfx/parts/arm_l/pliers.img4
d_26B16E	section	romdata abs=0x26B16E
Part_ArmRBlade:    ; used by Blade, Cutter
$include "build/gfx/parts/arm_r/blade.img4.asm"	; build/gfx/parts/arm_r/blade.img4
d_26B284	section	romdata abs=0x26B284
Part_ArmLBlade:    ; used by Blade, Cutter
$include "build/gfx/parts/arm_l/blade.img4.asm"	; build/gfx/parts/arm_l/blade.img4
d_26B3C7	section	romdata abs=0x26B3C7
Part_ArmRDriver:    ; used by Driver, 3DDvr
$include "build/gfx/parts/arm_r/driver.img4.asm"	; build/gfx/parts/arm_r/driver.img4
d_26B499	section	romdata abs=0x26B499
Part_ArmLDriver:    ; used by Driver, 3DDvr
$include "build/gfx/parts/arm_l/driver.img4.asm"	; build/gfx/parts/arm_l/driver.img4
d_26B5C3	section	romdata abs=0x26B5C3
Part_ArmRDrill:    ; used by Drill
$include "build/gfx/parts/arm_r/drill.img4.asm"	; build/gfx/parts/arm_r/drill.img4
d_26B69A	section	romdata abs=0x26B69A
Part_ArmLDrill:    ; used by Drill
$include "build/gfx/parts/arm_l/drill.img4.asm"	; build/gfx/parts/arm_l/drill.img4
d_26B7BF	section	romdata abs=0x26B7BF
Part_ArmRMaxi:    ; used by Maxi, FPlse, IcePls
$include "build/gfx/parts/arm_r/maxi.img4.asm"	; build/gfx/parts/arm_r/maxi.img4
d_26B886	section	romdata abs=0x26B886
Part_ArmLMaxi:    ; used by Maxi, FPlse, IcePls
$include "build/gfx/parts/arm_l/maxi.img4.asm"	; build/gfx/parts/arm_l/maxi.img4
d_26B94C	section	romdata abs=0x26B94C
Part_ArmRTwin:    ; used by Twin, Ashra
$include "build/gfx/parts/arm_r/twin.img4.asm"	; build/gfx/parts/arm_r/twin.img4
d_26BA5E	section	romdata abs=0x26BA5E
Part_ArmLTwin:    ; used by Twin, Ashra
$include "build/gfx/parts/arm_l/twin.img4.asm"	; build/gfx/parts/arm_l/twin.img4
d_26BB9C	section	romdata abs=0x26BB9C
Part_ArmRSkull:    ; used by Skull, DrkClw
$include "build/gfx/parts/arm_r/skull.img4.asm"	; build/gfx/parts/arm_r/skull.img4
d_26BCAA	section	romdata abs=0x26BCAA
Part_ArmLSkull:    ; used by Skull, DrkClw
$include "build/gfx/parts/arm_l/skull.img4.asm"	; build/gfx/parts/arm_l/skull.img4
d_26BDE4	section	romdata abs=0x26BDE4
Part_ArmRDgnhed:    ; used by DgnHed, Cursed, Infrno
$include "build/gfx/parts/arm_r/dgnhed.img4.asm"	; build/gfx/parts/arm_r/dgnhed.img4
d_26BF32	section	romdata abs=0x26BF32
Part_ArmLDgnhed:    ; used by DgnHed, Cursed, Infrno
$include "build/gfx/parts/arm_l/dgnhed.img4.asm"	; build/gfx/parts/arm_l/dgnhed.img4
d_26C084	section	romdata abs=0x26C084
Part_ArmREwire:    ; used by EWire, Tangle
$include "build/gfx/parts/arm_r/ewire.img4.asm"	; build/gfx/parts/arm_r/ewire.img4
d_26C17F	section	romdata abs=0x26C17F
Part_ArmLEwire:    ; used by EWire, Tangle
$include "build/gfx/parts/arm_l/ewire.img4.asm"	; build/gfx/parts/arm_l/ewire.img4
d_26C27B	section	romdata abs=0x26C27B
Part_ArmRArmwre:    ; used by ArmWre, Lghtng, Coil
$include "build/gfx/parts/arm_r/armwre.img4.asm"	; build/gfx/parts/arm_r/armwre.img4
d_26C3EA	section	romdata abs=0x26C3EA
Part_ArmLArmwre:    ; used by ArmWre, Lghtng, Coil
$include "build/gfx/parts/arm_l/armwre.img4.asm"	; build/gfx/parts/arm_l/armwre.img4
d_26C574	section	romdata abs=0x26C574
Part_ArmRAirhnd:    ; used by AirHnd
$include "build/gfx/parts/arm_r/airhnd.img4.asm"	; build/gfx/parts/arm_r/airhnd.img4
d_26C622	section	romdata abs=0x26C622
Part_ArmLAirhnd:    ; used by AirHnd
$include "build/gfx/parts/arm_l/airhnd.img4.asm"	; build/gfx/parts/arm_l/airhnd.img4
d_26C6E9	section	romdata abs=0x26C6E9
Part_ArmRIceblw:    ; used by IceBlw
$include "build/gfx/parts/arm_r/iceblw.img4.asm"	; build/gfx/parts/arm_r/iceblw.img4
d_26C7A9	section	romdata abs=0x26C7A9
Part_ArmLIceblw:    ; used by IceBlw
$include "build/gfx/parts/arm_l/iceblw.img4.asm"	; build/gfx/parts/arm_l/iceblw.img4
d_26C880	section	romdata abs=0x26C880
Part_ArmRHook:    ; used by Hook, LogHk
$include "build/gfx/parts/arm_r/hook.img4.asm"	; build/gfx/parts/arm_r/hook.img4
d_26C936	section	romdata abs=0x26C936
Part_ArmLHook:    ; used by Hook, LogHk
$include "build/gfx/parts/arm_l/hook.img4.asm"	; build/gfx/parts/arm_l/hook.img4
d_26C9EB	section	romdata abs=0x26C9EB
Part_ArmRGiant:    ; used by Giant
$include "build/gfx/parts/arm_r/giant.img4.asm"	; build/gfx/parts/arm_r/giant.img4
d_26CAB0	section	romdata abs=0x26CAB0
Part_ArmLGiant:    ; used by Giant
$include "build/gfx/parts/arm_l/giant.img4.asm"	; build/gfx/parts/arm_l/giant.img4
d_26CB85	section	romdata abs=0x26CB85
Part_ArmRMolehd:    ; used by MoleHd
$include "build/gfx/parts/arm_r/molehd.img4.asm"	; build/gfx/parts/arm_r/molehd.img4
d_26CC69	section	romdata abs=0x26CC69
Part_ArmLMolehd:    ; used by MoleHd
$include "build/gfx/parts/arm_l/molehd.img4.asm"	; build/gfx/parts/arm_l/molehd.img4
d_26CD72	section	romdata abs=0x26CD72
Part_ArmRClaw:    ; used by Claw
$include "build/gfx/parts/arm_r/claw.img4.asm"	; build/gfx/parts/arm_r/claw.img4
d_26CE26	section	romdata abs=0x26CE26
Part_ArmLClaw:    ; used by Claw
$include "build/gfx/parts/arm_l/claw.img4.asm"	; build/gfx/parts/arm_l/claw.img4
d_26CEEE	section	romdata abs=0x26CEEE
Part_ArmRTriger:    ; used by Triger
$include "build/gfx/parts/arm_r/triger.img4.asm"	; build/gfx/parts/arm_r/triger.img4
d_26CFC6	section	romdata abs=0x26CFC6
Part_ArmLTriger:    ; used by Triger
$include "build/gfx/parts/arm_l/triger.img4.asm"	; build/gfx/parts/arm_l/triger.img4
d_26D0B0	section	romdata abs=0x26D0B0
Part_ArmRKiller:    ; used by Killer
$include "build/gfx/parts/arm_r/killer.img4.asm"	; build/gfx/parts/arm_r/killer.img4
d_26D186	section	romdata abs=0x26D186
Part_ArmLKiller:    ; used by Killer
$include "build/gfx/parts/arm_l/killer.img4.asm"	; build/gfx/parts/arm_l/killer.img4
d_26D26A	section	romdata abs=0x26D26A
Part_ArmRKnukle:    ; used by Knukle, Rocket
$include "build/gfx/parts/arm_r/knukle.img4.asm"	; build/gfx/parts/arm_r/knukle.img4
d_26D337	section	romdata abs=0x26D337
Part_ArmLKnukle:    ; used by Knukle, Rocket
$include "build/gfx/parts/arm_l/knukle.img4.asm"	; build/gfx/parts/arm_l/knukle.img4
d_26D3E6	section	romdata abs=0x26D3E6
Part_ArmRGloves:    ; used by Gloves, Mail, Plate
$include "build/gfx/parts/arm_r/gloves.img4.asm"	; build/gfx/parts/arm_r/gloves.img4
d_26D4E0	section	romdata abs=0x26D4E0
Part_ArmLGloves:    ; used by Gloves, Mail, Plate
$include "build/gfx/parts/arm_l/gloves.img4.asm"	; build/gfx/parts/arm_l/gloves.img4
d_26D5CD	section	romdata abs=0x26D5CD
Part_ArmRBllarm:    ; used by BllArm
$include "build/gfx/parts/arm_r/bllarm.img4.asm"	; build/gfx/parts/arm_r/bllarm.img4
d_26D64B	section	romdata abs=0x26D64B
Part_ArmLBllarm:    ; used by BllArm
$include "build/gfx/parts/arm_l/bllarm.img4.asm"	; build/gfx/parts/arm_l/bllarm.img4
d_26D6CC	section	romdata abs=0x26D6CC
Part_ArmRTgrhnd:    ; used by TgrHnd
$include "build/gfx/parts/arm_r/tgrhnd.img4.asm"	; build/gfx/parts/arm_r/tgrhnd.img4
d_26D797	section	romdata abs=0x26D797
Part_ArmLTgrhnd:    ; used by TgrHnd
$include "build/gfx/parts/arm_l/tgrhnd.img4.asm"	; build/gfx/parts/arm_l/tgrhnd.img4
d_26D856	section	romdata abs=0x26D856
Part_ArmROakhnd:    ; used by OakHnd
$include "build/gfx/parts/arm_r/oakhnd.img4.asm"	; build/gfx/parts/arm_r/oakhnd.img4
d_26D90F	section	romdata abs=0x26D90F
Part_ArmLOakhnd:    ; used by OakHnd
$include "build/gfx/parts/arm_l/oakhnd.img4.asm"	; build/gfx/parts/arm_l/oakhnd.img4
d_26D9BA	section	romdata abs=0x26D9BA
Part_ArmRNowire:    ; used by NoWire, Sthrn+
$include "build/gfx/parts/arm_r/nowire.img4.asm"	; build/gfx/parts/arm_r/nowire.img4
d_26DA7D	section	romdata abs=0x26DA7D
Part_ArmLNowire:    ; used by NoWire, Sthrn+
$include "build/gfx/parts/arm_l/nowire.img4.asm"	; build/gfx/parts/arm_l/nowire.img4
d_26DB53	section	romdata abs=0x26DB53
Part_ArmRHammer:    ; used by Hammer, GrvHmr
$include "build/gfx/parts/arm_r/hammer.img4.asm"	; build/gfx/parts/arm_r/hammer.img4
d_26DC4B	section	romdata abs=0x26DC4B
Part_ArmLHammer:    ; used by Hammer, GrvHmr
$include "build/gfx/parts/arm_l/hammer.img4.asm"	; build/gfx/parts/arm_l/hammer.img4
d_26DD58	section	romdata abs=0x26DD58
Part_ArmRQatar:    ; used by Qatar, Indra, Agni
$include "build/gfx/parts/arm_r/qatar.img4.asm"	; build/gfx/parts/arm_r/qatar.img4
d_26DE1B	section	romdata abs=0x26DE1B
Part_ArmLQatar:    ; used by Qatar, Indra, Agni
$include "build/gfx/parts/arm_l/qatar.img4.asm"	; build/gfx/parts/arm_l/qatar.img4
d_26DF17	section	romdata abs=0x26DF17
Part_ArmRFork:    ; used by Fork, Tridnt
$include "build/gfx/parts/arm_r/fork.img4.asm"	; build/gfx/parts/arm_r/fork.img4
d_26E002	section	romdata abs=0x26E002
Part_ArmLFork:    ; used by Fork, Tridnt
$include "build/gfx/parts/arm_l/fork.img4.asm"	; build/gfx/parts/arm_l/fork.img4
d_26E124	section	romdata abs=0x26E124
Part_ArmRNeedle:    ; used by Needle
$include "build/gfx/parts/arm_r/needle.img4.asm"	; build/gfx/parts/arm_r/needle.img4
d_26E22B	section	romdata abs=0x26E22B
Part_ArmLNeedle:    ; used by Needle
$include "build/gfx/parts/arm_l/needle.img4.asm"	; build/gfx/parts/arm_l/needle.img4
d_26E33A	section	romdata abs=0x26E33A
Part_ArmRSword:    ; used by Sword
$include "build/gfx/parts/arm_r/sword.img4.asm"	; build/gfx/parts/arm_r/sword.img4
d_26E436	section	romdata abs=0x26E436
Part_ArmLSword:    ; used by Sword
$include "build/gfx/parts/arm_l/sword.img4.asm"	; build/gfx/parts/arm_l/sword.img4
d_26E53F	section	romdata abs=0x26E53F
Part_ArmRKama:    ; used by Kama
$include "build/gfx/parts/arm_r/kama.img4.asm"	; build/gfx/parts/arm_r/kama.img4
d_26E61B	section	romdata abs=0x26E61B
Part_ArmLKama:    ; used by Kama
$include "build/gfx/parts/arm_l/kama.img4.asm"	; build/gfx/parts/arm_l/kama.img4
d_26E721	section	romdata abs=0x26E721
Part_ArmRFlint:    ; used by Flint
$include "build/gfx/parts/arm_r/flint.img4.asm"	; build/gfx/parts/arm_r/flint.img4
d_26E80F	section	romdata abs=0x26E80F
Part_ArmLFlint:    ; used by Flint
$include "build/gfx/parts/arm_l/flint.img4.asm"	; build/gfx/parts/arm_l/flint.img4
d_26E90E	section	romdata abs=0x26E90E
Part_ArmRStunr:    ; used by Stunr
$include "build/gfx/parts/arm_r/stunr.img4.asm"	; build/gfx/parts/arm_r/stunr.img4
d_26EA3D	section	romdata abs=0x26EA3D
Part_ArmLStunr:    ; used by Stunr
$include "build/gfx/parts/arm_l/stunr.img4.asm"	; build/gfx/parts/arm_l/stunr.img4
d_26EB95	section	romdata abs=0x26EB95
Part_BackSeraph:    ; used by Seraph, Mikal
$include "build/gfx/parts/back/seraph.img4.asm"	; build/gfx/parts/back/seraph.img4
d_26EE5B	section	romdata abs=0x26EE5B
Part_BackBug:    ; used by Bug
$include "build/gfx/parts/back/bug.img4.asm"	; build/gfx/parts/back/bug.img4
d_26F0A2	section	romdata abs=0x26F0A2
Part_BackRobe:    ; used by Robe, C-Lion
$include "build/gfx/parts/back/robe.img4.asm"	; build/gfx/parts/back/robe.img4
d_26F287	section	romdata abs=0x26F287
Part_BackCape:    ; used by Cape
$include "build/gfx/parts/back/cape.img4.asm"	; build/gfx/parts/back/cape.img4
d_26F40D	section	romdata abs=0x26F40D
Part_BackSjw:    ; used by SJW
$include "build/gfx/parts/back/sjw.img4.asm"	; build/gfx/parts/back/sjw.img4
d_26F538	section	romdata abs=0x26F538
Part_BackBardos:    ; used by Bardos, DWing
$include "build/gfx/parts/back/bardos.img4.asm"	; build/gfx/parts/back/bardos.img4
d_26F72F	section	romdata abs=0x26F72F
Part_BackBird:    ; used by Bird
$include "build/gfx/parts/back/bird.img4.asm"	; build/gfx/parts/back/bird.img4
d_26F905	section	romdata abs=0x26F905
Part_BackSeed:    ; used by Seed, Titan
$include "build/gfx/parts/back/seed.img4.asm"	; build/gfx/parts/back/seed.img4
d_26FB6C	section	romdata abs=0x26FB6C
Part_BackFin:    ; used by Fin
$include "build/gfx/parts/back/fin.img4.asm"	; build/gfx/parts/back/fin.img4
d_26FCD2	section	romdata abs=0x26FCD2
Part_BackGrav:    ; used by Grav, Fuzion
$include "build/gfx/parts/back/grav.img4.asm"	; build/gfx/parts/back/grav.img4
