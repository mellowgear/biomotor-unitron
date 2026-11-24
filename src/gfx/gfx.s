; gfx/gfx.s: graphics: tile sheets, monster and part images, maps, palettes, in ROM order (each keeps its address with .org)

.org 0x21F010
Pal_21F010:
.incbin "../../build/gfx/pal/21F010.pal.bin"
.org 0x21F018
MonoPal_21F018:
.incbin "../../build/gfx/pal/21F018.pal4.bin"
.org 0x220BFC
MonoPal_220BFC:
.incbin "../../build/gfx/pal/220BFC.pal4.bin"
.org 0x225C3D
Pal_225C3D:
.incbin "../../build/gfx/pal/225C3D.pal.bin"
.org 0x225C45
MonoPal_225C45:
.incbin "../../build/gfx/pal/225C45.pal4.bin"
.org 0x228649
Pal_228649:
.incbin "../../build/gfx/pal/228649.pal.bin"
.org 0x2286C1
MonoPal_2286C1:
.incbin "../../build/gfx/pal/2286C1.pal4.bin"
.org 0x2286C5
Pal_2286C5:
.incbin "../../build/gfx/pal/2286C5.pal.bin"
.org 0x22873D
MonoPal_22873D:
.incbin "../../build/gfx/pal/22873D.pal4.bin"
.org 0x25EF50
Part_BodyBody1:
.incbin "../../build/gfx/parts/body/body1.png.bin"
.org 0x25EFFB
Part_BodyBody12:
.incbin "../../build/gfx/parts/body/body1_2.png.bin"
.org 0x25F0CF
Part_BodyBody122:
.incbin "../../build/gfx/parts/body/body1_2_2.png.bin"
.org 0x25F194
Part_BodyBody1222:
.incbin "../../build/gfx/parts/body/body1_2_2_2.png.bin"
.org 0x25F253
Part_BodyBody12222:
.incbin "../../build/gfx/parts/body/body1_2_2_2_2.png.bin"
.org 0x25F33F
Part_BodyBody2:
.incbin "../../build/gfx/parts/body/body2.png.bin"
.org 0x25F3E5
Part_BodyBody22:
.incbin "../../build/gfx/parts/body/body2_2.png.bin"
.org 0x25F500
Part_BodyBody222:
.incbin "../../build/gfx/parts/body/body2_2_2.png.bin"
.org 0x25F5CD
Part_BodyBody2222:
.incbin "../../build/gfx/parts/body/body2_2_2_2.png.bin"
.org 0x25F6AB
Part_BodyBody22222:
.incbin "../../build/gfx/parts/body/body2_2_2_2_2.png.bin"
.org 0x25F764
Part_BodyBody3:
.incbin "../../build/gfx/parts/body/body3.png.bin"
.org 0x25F82A
Part_BodyBody32:
.incbin "../../build/gfx/parts/body/body3_2.png.bin"
.org 0x25F95B
Part_BodyBody322:
.incbin "../../build/gfx/parts/body/body3_2_2.png.bin"
.org 0x25FA14
Part_BodyBody3222:
.incbin "../../build/gfx/parts/body/body3_2_2_2.png.bin"
.org 0x25FAD7
Part_BodyBody32222:
.incbin "../../build/gfx/parts/body/body3_2_2_2_2.png.bin"
.org 0x25FBD3
Part_LegsHuman:
.incbin "../../build/gfx/parts/legs/human.png.bin"
.org 0x25FCF0
Part_LegsForest:
.incbin "../../build/gfx/parts/legs/forest.png.bin"
.org 0x25FDEE
Part_LegsMarinr:
.incbin "../../build/gfx/parts/legs/marinr.png.bin"
.org 0x25FF66
Part_LegsBirdan:
.incbin "../../build/gfx/parts/legs/birdan.png.bin"
.org 0x260079
Part_LegsTurtle:
.incbin "../../build/gfx/parts/legs/turtle.png.bin"
.org 0x2601BE
Part_LegsKnight:
.incbin "../../build/gfx/parts/legs/knight.png.bin"
.org 0x2602ED
Part_LegsMarble:
.incbin "../../build/gfx/parts/legs/marble.png.bin"
.org 0x260468
Part_LegsObsedn:
.incbin "../../build/gfx/parts/legs/obsedn.png.bin"
.org 0x2605BA
Part_LegsFightr:
.incbin "../../build/gfx/parts/legs/fightr.png.bin"
.org 0x26071C
Part_LegsHero:
.incbin "../../build/gfx/parts/legs/hero.png.bin"
.org 0x2608A0
Part_LegsUnused11:
.incbin "../../build/gfx/parts/legs/unused_11.png.bin"
.org 0x260A0B
Part_LegsLizard:
.incbin "../../build/gfx/parts/legs/lizard.png.bin"
.org 0x260B61
Part_LegsUnused13:
.incbin "../../build/gfx/parts/legs/unused_13.png.bin"
.org 0x260C85
Part_LegsPaladn:
.incbin "../../build/gfx/parts/legs/paladn.png.bin"
.org 0x260DC2
Part_LegsRivet:
.incbin "../../build/gfx/parts/legs/rivet.png.bin"
.org 0x260F38
Part_LegsKalon:
.incbin "../../build/gfx/parts/legs/kalon.png.bin"
.org 0x2610B6
Part_LegsJester:
.incbin "../../build/gfx/parts/legs/jester.png.bin"
.org 0x26126F
Part_LegsUnused18:
.incbin "../../build/gfx/parts/legs/unused_18.png.bin"
.org 0x261415
Part_LegsUnused19:
.incbin "../../build/gfx/parts/legs/unused_19.png.bin"
.org 0x26157C
Part_LegsUnused20:
.incbin "../../build/gfx/parts/legs/unused_20.png.bin"
.org 0x261748
Part_LegsCentar:
.incbin "../../build/gfx/parts/legs/centar.png.bin"
.org 0x261919
Part_LegsDino1:
.incbin "../../build/gfx/parts/legs/dino1.png.bin"
.org 0x261B03
Part_LegsDino2:
.incbin "../../build/gfx/parts/legs/dino2.png.bin"
.org 0x261D96
Part_LegsSaurus:
.incbin "../../build/gfx/parts/legs/saurus.png.bin"
.org 0x261FE3
Part_LegsUnused25:
.incbin "../../build/gfx/parts/legs/unused_25.png.bin"
.org 0x262103
Part_LegsUnused26:
.incbin "../../build/gfx/parts/legs/unused_26.png.bin"
.org 0x2621D4
Part_LegsWorm1:
.incbin "../../build/gfx/parts/legs/worm1.png.bin"
.org 0x2623A1
Part_LegsWorm2:
.incbin "../../build/gfx/parts/legs/worm2.png.bin"
.org 0x2625BE
Part_LegsWheel:
.incbin "../../build/gfx/parts/legs/wheel.png.bin"
.org 0x2627EA
Part_LegsMultil:
.incbin "../../build/gfx/parts/legs/multil.png.bin"
.org 0x2629F4
Part_LegsWyrm1:
.incbin "../../build/gfx/parts/legs/wyrm1.png.bin"
.org 0x262C12
Part_LegsWyrm2:
.incbin "../../build/gfx/parts/legs/wyrm2.png.bin"
.org 0x262E54
Part_LegsInsect:
.incbin "../../build/gfx/parts/legs/insect.png.bin"
.org 0x2630F1
Part_LegsCrab:
.incbin "../../build/gfx/parts/legs/crab.png.bin"
.org 0x2633C1
Part_LegsWasp:
.incbin "../../build/gfx/parts/legs/wasp.png.bin"
.org 0x2635C6
Part_LegsManta:
.incbin "../../build/gfx/parts/legs/manta.png.bin"
.org 0x263786
Part_LegsSiren:
.incbin "../../build/gfx/parts/legs/siren.png.bin"
.org 0x263924
Part_LegsDolphn:
.incbin "../../build/gfx/parts/legs/dolphn.png.bin"
.org 0x263B7E
Part_LegsSerpnt:
.incbin "../../build/gfx/parts/legs/serpnt.png.bin"
.org 0x263D66
Part_LegsTntacl:
.incbin "../../build/gfx/parts/legs/tntacl.png.bin"
.org 0x264162
Part_LegsDragon:
.incbin "../../build/gfx/parts/legs/dragon.png.bin"
.org 0x2642F9
Part_LegsCraftr:
.incbin "../../build/gfx/parts/legs/craftr.png.bin"
.org 0x264424
Part_LegsBoost2:
.incbin "../../build/gfx/parts/legs/boost2.png.bin"
.org 0x264596
Part_LegsBoost1:
.incbin "../../build/gfx/parts/legs/boost1.png.bin"
.org 0x2646F8
Part_LegsWing:
.incbin "../../build/gfx/parts/legs/wing.png.bin"
.org 0x26484A
Part_LegsScout2:
.incbin "../../build/gfx/parts/legs/scout2.png.bin"
.org 0x264A1C
Part_LegsTiger:
.incbin "../../build/gfx/parts/legs/tiger.png.bin"
.org 0x264BC8
Part_LegsMagic:
.incbin "../../build/gfx/parts/legs/magic.png.bin"
.org 0x264DB0
Part_LegsFlier2:
.incbin "../../build/gfx/parts/legs/flier2.png.bin"
.org 0x26500C
Part_LegsFlier1:
.incbin "../../build/gfx/parts/legs/flier1.png.bin"
.org 0x2652A5
Part_ArmRBtfist:
.incbin "../../build/gfx/parts/arm_r/btfist.png.bin"
.org 0x265305
Part_ArmLBtfist:
.incbin "../../build/gfx/parts/arm_l/btfist.png.bin"
.org 0x26538C
Part_ArmRSlkhnd:
.incbin "../../build/gfx/parts/arm_r/slkhnd.png.bin"
.org 0x265402
Part_ArmLSlkhnd:
.incbin "../../build/gfx/parts/arm_l/slkhnd.png.bin"
.org 0x265471
Part_ArmRHGun:
.incbin "../../build/gfx/parts/arm_r/h_gun.png.bin"
.org 0x265511
Part_ArmLHGun:
.incbin "../../build/gfx/parts/arm_l/h_gun.png.bin"
.org 0x2655CD
Part_ArmRHawk:
.incbin "../../build/gfx/parts/arm_r/hawk.png.bin"
.org 0x26568D
Part_ArmLHawk:
.incbin "../../build/gfx/parts/arm_l/hawk.png.bin"
.org 0x265777
Part_ArmROgre:
.incbin "../../build/gfx/parts/arm_r/ogre.png.bin"
.org 0x265880
Part_ArmLOgre:
.incbin "../../build/gfx/parts/arm_l/ogre.png.bin"
.org 0x2659C8
Part_ArmRLancer:
.incbin "../../build/gfx/parts/arm_r/lancer.png.bin"
.org 0x265A8D
Part_ArmLLancer:
.incbin "../../build/gfx/parts/arm_l/lancer.png.bin"
.org 0x265B6D
Part_ArmRDrlarm:
.incbin "../../build/gfx/parts/arm_r/drlarm.png.bin"
.org 0x265C32
Part_ArmLDrlarm:
.incbin "../../build/gfx/parts/arm_l/drlarm.png.bin"
.org 0x265CF0
Part_ArmRBazoka:
.incbin "../../build/gfx/parts/arm_r/bazoka.png.bin"
.org 0x265DCD
Part_ArmLBazoka:
.incbin "../../build/gfx/parts/arm_l/bazoka.png.bin"
.org 0x265ED2
Part_ArmRChnsaw:
.incbin "../../build/gfx/parts/arm_r/chnsaw.png.bin"
.org 0x265FF6
Part_ArmLChnsaw:
.incbin "../../build/gfx/parts/arm_l/chnsaw.png.bin"
.org 0x266137
Part_ArmRUnused10:
.incbin "../../build/gfx/parts/arm_r/unused_10.png.bin"
.org 0x2661E8
Part_ArmLUnused10:
.incbin "../../build/gfx/parts/arm_l/unused_10.png.bin"
.org 0x266358
Part_ArmRPwrhnd:
.incbin "../../build/gfx/parts/arm_r/pwrhnd.png.bin"
.org 0x2663FE
Part_ArmLPwrhnd:
.incbin "../../build/gfx/parts/arm_l/pwrhnd.png.bin"
.org 0x2664B0
Part_ArmRHkclaw:
.incbin "../../build/gfx/parts/arm_r/hkclaw.png.bin"
.org 0x266582
Part_ArmLHkclaw:
.incbin "../../build/gfx/parts/arm_l/hkclaw.png.bin"
.org 0x266666
Part_ArmRPole:
.incbin "../../build/gfx/parts/arm_r/pole.png.bin"
.org 0x26670E
Part_ArmLPole:
.incbin "../../build/gfx/parts/arm_l/pole.png.bin"
.org 0x266807
Part_ArmRRapier:
.incbin "../../build/gfx/parts/arm_r/rapier.png.bin"
.org 0x2668D8
Part_ArmLRapier:
.incbin "../../build/gfx/parts/arm_l/rapier.png.bin"
.org 0x2669C8
Part_ArmRBtlhk:
.incbin "../../build/gfx/parts/arm_r/btlhk.png.bin"
.org 0x266AAC
Part_ArmLBtlhk:
.incbin "../../build/gfx/parts/arm_l/btlhk.png.bin"
.org 0x266BA7
Part_ArmRWhip:
.incbin "../../build/gfx/parts/arm_r/whip.png.bin"
.org 0x266C7A
Part_ArmLWhip:
.incbin "../../build/gfx/parts/arm_l/whip.png.bin"
.org 0x266D50
Part_ArmRWhipPlus:
.incbin "../../build/gfx/parts/arm_r/whip_plus.png.bin"
.org 0x266E63
Part_ArmLWhipPlus:
.incbin "../../build/gfx/parts/arm_l/whip_plus.png.bin"
.org 0x266F67
Part_ArmRArmhnd:
.incbin "../../build/gfx/parts/arm_r/armhnd.png.bin"
.org 0x26706C
Part_ArmLArmhnd:
.incbin "../../build/gfx/parts/arm_l/armhnd.png.bin"
.org 0x26717D
Part_ArmRDisc:
.incbin "../../build/gfx/parts/arm_r/disc.png.bin"
.org 0x267243
Part_ArmLDisc:
.incbin "../../build/gfx/parts/arm_l/disc.png.bin"
.org 0x26731F
Part_ArmRSpiked:
.incbin "../../build/gfx/parts/arm_r/spiked.png.bin"
.org 0x26745A
Part_ArmLSpiked:
.incbin "../../build/gfx/parts/arm_l/spiked.png.bin"
.org 0x2675C0
Part_ArmRWarlok:
.incbin "../../build/gfx/parts/arm_r/warlok.png.bin"
.org 0x2676FA
Part_ArmLWarlok:
.incbin "../../build/gfx/parts/arm_l/warlok.png.bin"
.org 0x267862
Part_ArmRGodhnd:
.incbin "../../build/gfx/parts/arm_r/godhnd.png.bin"
.org 0x2679AF
Part_ArmLGodhnd:
.incbin "../../build/gfx/parts/arm_l/godhnd.png.bin"
.org 0x267B12
Part_ArmRTroopr:
.incbin "../../build/gfx/parts/arm_r/troopr.png.bin"
.org 0x267BB7
Part_ArmLTroopr:
.incbin "../../build/gfx/parts/arm_l/troopr.png.bin"
.org 0x267C86
Part_ArmRMantis:
.incbin "../../build/gfx/parts/arm_r/mantis.png.bin"
.org 0x267D93
Part_ArmLMantis:
.incbin "../../build/gfx/parts/arm_l/mantis.png.bin"
.org 0x267ECD
Part_ArmRGolem:
.incbin "../../build/gfx/parts/arm_r/golem.png.bin"
.org 0x267F81
Part_ArmLGolem:
.incbin "../../build/gfx/parts/arm_l/golem.png.bin"
.org 0x26802A
Part_ArmRHydro:
.incbin "../../build/gfx/parts/arm_r/hydro.png.bin"
.org 0x2681CB
Part_ArmLHydro:
.incbin "../../build/gfx/parts/arm_l/hydro.png.bin"
.org 0x268389
Part_ArmRSnaker:
.incbin "../../build/gfx/parts/arm_r/snaker.png.bin"
.org 0x268513
Part_ArmLSnaker:
.incbin "../../build/gfx/parts/arm_l/snaker.png.bin"
.org 0x2686FF
Part_ArmRScorp:
.incbin "../../build/gfx/parts/arm_r/scorp.png.bin"
.org 0x2687DA
Part_ArmLScorp:
.incbin "../../build/gfx/parts/arm_l/scorp.png.bin"
.org 0x2688BF
Part_ArmRRedclw:
.incbin "../../build/gfx/parts/arm_r/redclw.png.bin"
.org 0x268A0D
Part_ArmLRedclw:
.incbin "../../build/gfx/parts/arm_l/redclw.png.bin"
.org 0x268B3D
Part_ArmRCrssbw:
.incbin "../../build/gfx/parts/arm_r/crssbw.png.bin"
.org 0x268C00
Part_ArmLCrssbw:
.incbin "../../build/gfx/parts/arm_l/crssbw.png.bin"
.org 0x268CCA
Part_ArmRSabre:
.incbin "../../build/gfx/parts/arm_r/sabre.png.bin"
.org 0x268D51
Part_ArmLSabre:
.incbin "../../build/gfx/parts/arm_l/sabre.png.bin"
.org 0x268DDD
Part_ArmRSabrePlus:
.incbin "../../build/gfx/parts/arm_r/sabre_plus.png.bin"
.org 0x268E86
Part_ArmLSabrePlus:
.incbin "../../build/gfx/parts/arm_l/sabre_plus.png.bin"
.org 0x268F2F
Part_ArmRHndaxe:
.incbin "../../build/gfx/parts/arm_r/hndaxe.png.bin"
.org 0x26902C
Part_ArmLHndaxe:
.incbin "../../build/gfx/parts/arm_l/hndaxe.png.bin"
.org 0x26913F
Part_ArmRBtlaxe:
.incbin "../../build/gfx/parts/arm_r/btlaxe.png.bin"
.org 0x26926E
Part_ArmLBtlaxe:
.incbin "../../build/gfx/parts/arm_l/btlaxe.png.bin"
.org 0x2693A2
Part_ArmRMgabll:
.incbin "../../build/gfx/parts/arm_r/mgabll.png.bin"
.org 0x26949E
Part_ArmLMgabll:
.incbin "../../build/gfx/parts/arm_l/mgabll.png.bin"
.org 0x2695C7
Part_ArmRCurler:
.incbin "../../build/gfx/parts/arm_r/curler.png.bin"
.org 0x2696DE
Part_ArmLCurler:
.incbin "../../build/gfx/parts/arm_l/curler.png.bin"
.org 0x269806
Part_ArmRSpring:
.incbin "../../build/gfx/parts/arm_r/spring.png.bin"
.org 0x2698EB
Part_ArmLSpring:
.incbin "../../build/gfx/parts/arm_l/spring.png.bin"
.org 0x2699D3
Part_ArmRMage:
.incbin "../../build/gfx/parts/arm_r/mage.png.bin"
.org 0x269AB8
Part_ArmLMage:
.incbin "../../build/gfx/parts/arm_l/mage.png.bin"
.org 0x269BB3
Part_ArmRGradus:
.incbin "../../build/gfx/parts/arm_r/gradus.png.bin"
.org 0x269C48
Part_ArmLGradus:
.incbin "../../build/gfx/parts/arm_l/gradus.png.bin"
.org 0x269D20
Part_ArmRDirk:
.incbin "../../build/gfx/parts/arm_r/dirk.png.bin"
.org 0x269DCC
Part_ArmLDirk:
.incbin "../../build/gfx/parts/arm_l/dirk.png.bin"
.org 0x269EA8
Part_ArmRLinegn:
.incbin "../../build/gfx/parts/arm_r/linegn.png.bin"
.org 0x269F99
Part_ArmLLinegn:
.incbin "../../build/gfx/parts/arm_l/linegn.png.bin"
.org 0x26A0C8
Part_ArmRCannon:
.incbin "../../build/gfx/parts/arm_r/cannon.png.bin"
.org 0x26A1DF
Part_ArmLCannon:
.incbin "../../build/gfx/parts/arm_l/cannon.png.bin"
.org 0x26A30D
Part_ArmRHndgun:
.incbin "../../build/gfx/parts/arm_r/hndgun.png.bin"
.org 0x26A3EF
Part_ArmLHndgun:
.incbin "../../build/gfx/parts/arm_l/hndgun.png.bin"
.org 0x26A4D9
Part_ArmRVulcan:
.incbin "../../build/gfx/parts/arm_r/vulcan.png.bin"
.org 0x26A5EF
Part_ArmLVulcan:
.incbin "../../build/gfx/parts/arm_l/vulcan.png.bin"
.org 0x26A712
Part_ArmR2Barrl:
.incbin "../../build/gfx/parts/arm_r/2barrl.png.bin"
.org 0x26A822
Part_ArmL2Barrl:
.incbin "../../build/gfx/parts/arm_l/2barrl.png.bin"
.org 0x26A951
Part_ArmRLncher:
.incbin "../../build/gfx/parts/arm_r/lncher.png.bin"
.org 0x26AA45
Part_ArmLLncher:
.incbin "../../build/gfx/parts/arm_l/lncher.png.bin"
.org 0x26AB33
Part_ArmRBinder:
.incbin "../../build/gfx/parts/arm_r/binder.png.bin"
.org 0x26AC12
Part_ArmLBinder:
.incbin "../../build/gfx/parts/arm_l/binder.png.bin"
.org 0x26AD1F
Part_ArmRMagma:
.incbin "../../build/gfx/parts/arm_r/magma.png.bin"
.org 0x26AE0B
Part_ArmLMagma:
.incbin "../../build/gfx/parts/arm_l/magma.png.bin"
.org 0x26AF04
Part_ArmRPliers:
.incbin "../../build/gfx/parts/arm_r/pliers.png.bin"
.org 0x26B03D
Part_ArmLPliers:
.incbin "../../build/gfx/parts/arm_l/pliers.png.bin"
.org 0x26B16E
Part_ArmRBlade:
.incbin "../../build/gfx/parts/arm_r/blade.png.bin"
.org 0x26B284
Part_ArmLBlade:
.incbin "../../build/gfx/parts/arm_l/blade.png.bin"
.org 0x26B3C7
Part_ArmRDriver:
.incbin "../../build/gfx/parts/arm_r/driver.png.bin"
.org 0x26B499
Part_ArmLDriver:
.incbin "../../build/gfx/parts/arm_l/driver.png.bin"
.org 0x26B5C3
Part_ArmRDrill:
.incbin "../../build/gfx/parts/arm_r/drill.png.bin"
.org 0x26B69A
Part_ArmLDrill:
.incbin "../../build/gfx/parts/arm_l/drill.png.bin"
.org 0x26B7BF
Part_ArmRMaxi:
.incbin "../../build/gfx/parts/arm_r/maxi.png.bin"
.org 0x26B886
Part_ArmLMaxi:
.incbin "../../build/gfx/parts/arm_l/maxi.png.bin"
.org 0x26B94C
Part_ArmRTwin:
.incbin "../../build/gfx/parts/arm_r/twin.png.bin"
.org 0x26BA5E
Part_ArmLTwin:
.incbin "../../build/gfx/parts/arm_l/twin.png.bin"
.org 0x26BB9C
Part_ArmRSkull:
.incbin "../../build/gfx/parts/arm_r/skull.png.bin"
.org 0x26BCAA
Part_ArmLSkull:
.incbin "../../build/gfx/parts/arm_l/skull.png.bin"
.org 0x26BDE4
Part_ArmRDgnhed:
.incbin "../../build/gfx/parts/arm_r/dgnhed.png.bin"
.org 0x26BF32
Part_ArmLDgnhed:
.incbin "../../build/gfx/parts/arm_l/dgnhed.png.bin"
.org 0x26C084
Part_ArmREwire:
.incbin "../../build/gfx/parts/arm_r/ewire.png.bin"
.org 0x26C17F
Part_ArmLEwire:
.incbin "../../build/gfx/parts/arm_l/ewire.png.bin"
.org 0x26C27B
Part_ArmRArmwre:
.incbin "../../build/gfx/parts/arm_r/armwre.png.bin"
.org 0x26C3EA
Part_ArmLArmwre:
.incbin "../../build/gfx/parts/arm_l/armwre.png.bin"
.org 0x26C574
Part_ArmRAirhnd:
.incbin "../../build/gfx/parts/arm_r/airhnd.png.bin"
.org 0x26C622
Part_ArmLAirhnd:
.incbin "../../build/gfx/parts/arm_l/airhnd.png.bin"
.org 0x26C6E9
Part_ArmRIceblw:
.incbin "../../build/gfx/parts/arm_r/iceblw.png.bin"
.org 0x26C7A9
Part_ArmLIceblw:
.incbin "../../build/gfx/parts/arm_l/iceblw.png.bin"
.org 0x26C880
Part_ArmRHook:
.incbin "../../build/gfx/parts/arm_r/hook.png.bin"
.org 0x26C936
Part_ArmLHook:
.incbin "../../build/gfx/parts/arm_l/hook.png.bin"
.org 0x26C9EB
Part_ArmRGiant:
.incbin "../../build/gfx/parts/arm_r/giant.png.bin"
.org 0x26CAB0
Part_ArmLGiant:
.incbin "../../build/gfx/parts/arm_l/giant.png.bin"
.org 0x26CB85
Part_ArmRMolehd:
.incbin "../../build/gfx/parts/arm_r/molehd.png.bin"
.org 0x26CC69
Part_ArmLMolehd:
.incbin "../../build/gfx/parts/arm_l/molehd.png.bin"
.org 0x26CD72
Part_ArmRClaw:
.incbin "../../build/gfx/parts/arm_r/claw.png.bin"
.org 0x26CE26
Part_ArmLClaw:
.incbin "../../build/gfx/parts/arm_l/claw.png.bin"
.org 0x26CEEE
Part_ArmRTriger:
.incbin "../../build/gfx/parts/arm_r/triger.png.bin"
.org 0x26CFC6
Part_ArmLTriger:
.incbin "../../build/gfx/parts/arm_l/triger.png.bin"
.org 0x26D0B0
Part_ArmRKiller:
.incbin "../../build/gfx/parts/arm_r/killer.png.bin"
.org 0x26D186
Part_ArmLKiller:
.incbin "../../build/gfx/parts/arm_l/killer.png.bin"
.org 0x26D26A
Part_ArmRKnukle:
.incbin "../../build/gfx/parts/arm_r/knukle.png.bin"
.org 0x26D337
Part_ArmLKnukle:
.incbin "../../build/gfx/parts/arm_l/knukle.png.bin"
.org 0x26D3E6
Part_ArmRGloves:
.incbin "../../build/gfx/parts/arm_r/gloves.png.bin"
.org 0x26D4E0
Part_ArmLGloves:
.incbin "../../build/gfx/parts/arm_l/gloves.png.bin"
.org 0x26D5CD
Part_ArmRBllarm:
.incbin "../../build/gfx/parts/arm_r/bllarm.png.bin"
.org 0x26D64B
Part_ArmLBllarm:
.incbin "../../build/gfx/parts/arm_l/bllarm.png.bin"
.org 0x26D6CC
Part_ArmRTgrhnd:
.incbin "../../build/gfx/parts/arm_r/tgrhnd.png.bin"
.org 0x26D797
Part_ArmLTgrhnd:
.incbin "../../build/gfx/parts/arm_l/tgrhnd.png.bin"
.org 0x26D856
Part_ArmROakhnd:
.incbin "../../build/gfx/parts/arm_r/oakhnd.png.bin"
.org 0x26D90F
Part_ArmLOakhnd:
.incbin "../../build/gfx/parts/arm_l/oakhnd.png.bin"
.org 0x26D9BA
Part_ArmRNowire:
.incbin "../../build/gfx/parts/arm_r/nowire.png.bin"
.org 0x26DA7D
Part_ArmLNowire:
.incbin "../../build/gfx/parts/arm_l/nowire.png.bin"
.org 0x26DB53
Part_ArmRHammer:
.incbin "../../build/gfx/parts/arm_r/hammer.png.bin"
.org 0x26DC4B
Part_ArmLHammer:
.incbin "../../build/gfx/parts/arm_l/hammer.png.bin"
.org 0x26DD58
Part_ArmRQatar:
.incbin "../../build/gfx/parts/arm_r/qatar.png.bin"
.org 0x26DE1B
Part_ArmLQatar:
.incbin "../../build/gfx/parts/arm_l/qatar.png.bin"
.org 0x26DF17
Part_ArmRFork:
.incbin "../../build/gfx/parts/arm_r/fork.png.bin"
.org 0x26E002
Part_ArmLFork:
.incbin "../../build/gfx/parts/arm_l/fork.png.bin"
.org 0x26E124
Part_ArmRNeedle:
.incbin "../../build/gfx/parts/arm_r/needle.png.bin"
.org 0x26E22B
Part_ArmLNeedle:
.incbin "../../build/gfx/parts/arm_l/needle.png.bin"
.org 0x26E33A
Part_ArmRSword:
.incbin "../../build/gfx/parts/arm_r/sword.png.bin"
.org 0x26E436
Part_ArmLSword:
.incbin "../../build/gfx/parts/arm_l/sword.png.bin"
.org 0x26E53F
Part_ArmRKama:
.incbin "../../build/gfx/parts/arm_r/kama.png.bin"
.org 0x26E61B
Part_ArmLKama:
.incbin "../../build/gfx/parts/arm_l/kama.png.bin"
.org 0x26E721
Part_ArmRFlint:
.incbin "../../build/gfx/parts/arm_r/flint.png.bin"
.org 0x26E80F
Part_ArmLFlint:
.incbin "../../build/gfx/parts/arm_l/flint.png.bin"
.org 0x26E90E
Part_ArmRStunr:
.incbin "../../build/gfx/parts/arm_r/stunr.png.bin"
.org 0x26EA3D
Part_ArmLStunr:
.incbin "../../build/gfx/parts/arm_l/stunr.png.bin"
.org 0x26EB95
Part_BackSeraph:
.incbin "../../build/gfx/parts/back/seraph.png.bin"
.org 0x26EE5B
Part_BackBug:
.incbin "../../build/gfx/parts/back/bug.png.bin"
.org 0x26F0A2
Part_BackRobe:
.incbin "../../build/gfx/parts/back/robe.png.bin"
.org 0x26F287
Part_BackCape:
.incbin "../../build/gfx/parts/back/cape.png.bin"
.org 0x26F40D
Part_BackSjw:
.incbin "../../build/gfx/parts/back/sjw.png.bin"
.org 0x26F538
Part_BackBardos:
.incbin "../../build/gfx/parts/back/bardos.png.bin"
.org 0x26F72F
Part_BackBird:
.incbin "../../build/gfx/parts/back/bird.png.bin"
.org 0x26F905
Part_BackSeed:
.incbin "../../build/gfx/parts/back/seed.png.bin"
.org 0x26FB6C
Part_BackFin:
.incbin "../../build/gfx/parts/back/fin.png.bin"
.org 0x26FCD2
Part_BackGrav:
.incbin "../../build/gfx/parts/back/grav.png.bin"
.org 0x26FD9F
AffinityPalettes:
.incbin "../../build/gfx/pal/26FD9F.pal.bin"
.org 0x26FDD7
Pal_26FDD7:
.incbin "../../build/gfx/pal/26FDD7.pal.bin"
.org 0x26FE07
MonoPal_26FE07:
.incbin "../../build/gfx/pal/26FE07.pal4.bin"
.org 0x2844C4
MonoPal_2844C4:
.incbin "../../build/gfx/pal/2844C4.pal4.bin"
.org 0x2844CC
Map_2844CC:
.incbin "../../build/gfx/maps/2844CC.tilemap.bin"
.org 0x2846FE
Gfx_2846FE:
.incbin "../../build/gfx/tiles/2846FE.png.bin"
.org 0x284F10
MonoPal_284F10:
.incbin "../../build/gfx/pal/284F10.pal4.bin"
.org 0x284F18
Map_284F18:
.incbin "../../build/gfx/maps/284F18.tilemap.bin"
.org 0x28506A
Gfx_28506A:
.incbin "../../build/gfx/tiles/28506A.png.bin"
.org 0x28577A
MonoPal_28577A:
.incbin "../../build/gfx/pal/28577A.pal4.bin"
.org 0x285782
Map_285782:
.incbin "../../build/gfx/maps/285782.tilemap.bin"
.org 0x2858D4
Gfx_2858D4:
.incbin "../../build/gfx/tiles/2858D4.png.bin"
.org 0x285F31
MonoPal_285F31:
.incbin "../../build/gfx/pal/285F31.pal4.bin"
.org 0x285F39
Map_285F39:
.incbin "../../build/gfx/maps/285F39.tilemap.bin"
.org 0x28608B
Gfx_28608B:
.incbin "../../build/gfx/tiles/28608B.png.bin"
.org 0x2868D7
MonoPal_2868D7:
.incbin "../../build/gfx/pal/2868D7.pal4.bin"
.org 0x2868DF
Map_2868DF:
.incbin "../../build/gfx/maps/2868DF.tilemap.bin"
.org 0x286A31
Gfx_286A31:
.incbin "../../build/gfx/tiles/286A31.png.bin"
.org 0x2871E6
MonoPal_2871E6:
.incbin "../../build/gfx/pal/2871E6.pal4.bin"
.org 0x2871EE
Map_2871EE:
.incbin "../../build/gfx/maps/2871EE.tilemap.bin"
.org 0x287340
Gfx_287340:
.incbin "../../build/gfx/tiles/287340.png.bin"
.org 0x2876BC
MonoPal_2876BC:
.incbin "../../build/gfx/pal/2876BC.pal4.bin"
.org 0x2876C4
Map_2876C4:
.incbin "../../build/gfx/maps/2876C4.tilemap.bin"
.org 0x287842
Gfx_287842:
.incbin "../../build/gfx/tiles/287842.png.bin"
.org 0x287ECC
MonoPal_287ECC:
.incbin "../../build/gfx/pal/287ECC.pal4.bin"
.org 0x287ED4
Map_287ED4:
.incbin "../../build/gfx/maps/287ED4.tilemap.bin"
.org 0x288052
Gfx_288052:
.incbin "../../build/gfx/tiles/288052.png.bin"
.org 0x2884EF
MonoPal_2884EF:
.incbin "../../build/gfx/pal/2884EF.pal4.bin"
.org 0x2884F7
Map_2884F7:
.incbin "../../build/gfx/maps/2884F7.tilemap.bin"
.org 0x288649
Gfx_288649:
.incbin "../../build/gfx/tiles/288649.png.bin"
.org 0x2890C5
MonoPal_2890C5:
.incbin "../../build/gfx/pal/2890C5.pal4.bin"
.org 0x2890CD
Map_2890CD:
.incbin "../../build/gfx/maps/2890CD.tilemap.bin"
.org 0x28921F
Gfx_28921F:
.incbin "../../build/gfx/tiles/28921F.png.bin"
.org 0x289C96
MonoPal_289C96:
.incbin "../../build/gfx/pal/289C96.pal4.bin"
.org 0x289C9E
Map_289C9E:
.incbin "../../build/gfx/maps/289C9E.tilemap.bin"
.org 0x289F98
Gfx_289F98:
.incbin "../../build/gfx/tiles/289F98.png.bin"
.org 0x28A631
MonoPal_28A631:
.incbin "../../build/gfx/pal/28A631.pal4.bin"
.org 0x28A639
Map_28A639:
.incbin "../../build/gfx/maps/28A639.tilemap.bin"
.org 0x28A78B
Gfx_28A78B:
.incbin "../../build/gfx/tiles/28A78B.png.bin"
.org 0x28B06C
MonoPal_28B06C:
.incbin "../../build/gfx/pal/28B06C.pal4.bin"
.org 0x28B074
Map_28B074:
.incbin "../../build/gfx/maps/28B074.tilemap.bin"
.org 0x28B2A6
Gfx_28B2A6:
.incbin "../../build/gfx/tiles/28B2A6.png.bin"
.org 0x28BFDF
MonoPal_28BFDF:
.incbin "../../build/gfx/pal/28BFDF.pal4.bin"
.org 0x28BFE7
Map_28BFE7:
.incbin "../../build/gfx/maps/28BFE7.tilemap.bin"
.org 0x28C219
Gfx_28C219:
.incbin "../../build/gfx/tiles/28C219.png.bin"
.org 0x28D0C2
MonoPal_28D0C2:
.incbin "../../build/gfx/pal/28D0C2.pal4.bin"
.org 0x28D0CA
Map_28D0CA:
.incbin "../../build/gfx/maps/28D0CA.tilemap.bin"
.org 0x28D2FC
Gfx_28D2FC:
.incbin "../../build/gfx/tiles/28D2FC.png.bin"
.org 0x28DCA2
MonoPal_28DCA2:
.incbin "../../build/gfx/pal/28DCA2.pal4.bin"
.org 0x28DCAA
Map_28DCAA:
.incbin "../../build/gfx/maps/28DCAA.tilemap.bin"
.org 0x28DEDC
Gfx_28DEDC:
.incbin "../../build/gfx/tiles/28DEDC.png.bin"
.org 0x28ECF4
MonoPal_28ECF4:
.incbin "../../build/gfx/pal/28ECF4.pal4.bin"
.org 0x28ECFC
Map_28ECFC:
.incbin "../../build/gfx/maps/28ECFC.tilemap.bin"
.org 0x28EE4E
Gfx_28EE4E:
.incbin "../../build/gfx/tiles/28EE4E.png.bin"
.org 0x28F588
MonoPal_28F588:
.incbin "../../build/gfx/pal/28F588.pal4.bin"
.org 0x28F590
Map_28F590:
.incbin "../../build/gfx/maps/28F590.tilemap.bin"
.org 0x28F6E2
Gfx_28F6E2:
.incbin "../../build/gfx/tiles/28F6E2.png.bin"
.org 0x28FF98
MonoPal_28FF98:
.incbin "../../build/gfx/pal/28FF98.pal4.bin"
.org 0x28FFA0
Map_28FFA0:
.incbin "../../build/gfx/maps/28FFA0.tilemap.bin"
.org 0x2901D2
Gfx_2901D2:
.incbin "../../build/gfx/tiles/2901D2.png.bin"
.org 0x290C67
MonoPal_290C67:
.incbin "../../build/gfx/pal/290C67.pal4.bin"
.org 0x290C6F
Map_290C6F:
.incbin "../../build/gfx/maps/290C6F.tilemap.bin"
.org 0x290F69
Gfx_290F69:
.incbin "../../build/gfx/tiles/290F69.png.bin"
.org 0x2916E8
MonoPal_2916E8:
.incbin "../../build/gfx/pal/2916E8.pal4.bin"
.org 0x2916F0
Map_2916F0:
.incbin "../../build/gfx/maps/2916F0.tilemap.bin"
.org 0x291922
Gfx_291922:
.incbin "../../build/gfx/tiles/291922.png.bin"
.org 0x29275B
MonoPal_29275B:
.incbin "../../build/gfx/pal/29275B.pal4.bin"
.org 0x292763
Map_292763:
.incbin "../../build/gfx/maps/292763.tilemap.bin"
.org 0x292995
Gfx_292995:
.incbin "../../build/gfx/tiles/292995.png.bin"
.org 0x293832
MonoPal_293832:
.incbin "../../build/gfx/pal/293832.pal4.bin"
.org 0x29383A
Map_29383A:
.incbin "../../build/gfx/maps/29383A.tilemap.bin"
.org 0x29395C
Gfx_29395C:
.incbin "../../build/gfx/tiles/29395C.png.bin"
.org 0x293E97
MonoPal_293E97:
.incbin "../../build/gfx/pal/293E97.pal4.bin"
.org 0x293E9F
Map_293E9F:
.incbin "../../build/gfx/maps/293E9F.tilemap.bin"
.org 0x293FC1
Gfx_293FC1:
.incbin "../../build/gfx/tiles/293FC1.png.bin"
.org 0x2945D5
MonoPal_2945D5:
.incbin "../../build/gfx/pal/2945D5.pal4.bin"
.org 0x2945DD
Map_2945DD:
.incbin "../../build/gfx/maps/2945DD.tilemap.bin"
.org 0x2946FF
Gfx_2946FF:
.incbin "../../build/gfx/tiles/2946FF.png.bin"
.org 0x294CA5
MonoPal_294CA5:
.incbin "../../build/gfx/pal/294CA5.pal4.bin"
.org 0x294CAD
Map_294CAD:
.incbin "../../build/gfx/maps/294CAD.tilemap.bin"
.org 0x294DCF
Gfx_294DCF:
.incbin "../../build/gfx/tiles/294DCF.png.bin"
.org 0x29537F
MonoPal_29537F:
.incbin "../../build/gfx/pal/29537F.pal4.bin"
.org 0x295387
Map_295387:
.incbin "../../build/gfx/maps/295387.tilemap.bin"
.org 0x295479
Gfx_295479:
.incbin "../../build/gfx/tiles/295479.png.bin"
.org 0x29587A
MonoPal_29587A:
.incbin "../../build/gfx/pal/29587A.pal4.bin"
.org 0x295882
Map_295882:
.incbin "../../build/gfx/maps/295882.tilemap.bin"
.org 0x2959A4
Gfx_2959A4:
.incbin "../../build/gfx/tiles/2959A4.png.bin"
.org 0x295F21
MonoPal_295F21:
.incbin "../../build/gfx/pal/295F21.pal4.bin"
.org 0x295F29
Map_295F29:
.incbin "../../build/gfx/maps/295F29.tilemap.bin"
.org 0x29615B
Gfx_29615B:
.incbin "../../build/gfx/tiles/29615B.png.bin"
.org 0x296EB9
MonoPal_296EB9:
.incbin "../../build/gfx/pal/296EB9.pal4.bin"
.org 0x296EC1
Map_296EC1:
.incbin "../../build/gfx/maps/296EC1.tilemap.bin"
.org 0x2970F3
Gfx_2970F3:
.incbin "../../build/gfx/tiles/2970F3.png.bin"
.org 0x297EE7
MonoPal_297EE7:
.incbin "../../build/gfx/pal/297EE7.pal4.bin"
.org 0x297EEF
Map_297EEF:
.incbin "../../build/gfx/maps/297EEF.tilemap.bin"
.org 0x2981E9
Gfx_2981E9:
.incbin "../../build/gfx/tiles/2981E9.png.bin"
.org 0x2991FC
MonoPal_2991FC:
.incbin "../../build/gfx/pal/2991FC.pal4.bin"
.org 0x299204
Map_299204:
.incbin "../../build/gfx/maps/299204.tilemap.bin"
.org 0x299436
Gfx_299436:
.incbin "../../build/gfx/tiles/299436.png.bin"
.org 0x29945A
Pal_29945A:
.incbin "../../build/gfx/pal/29945A.pal.bin"
.org 0x2994AA
Map_2994AA:
.incbin "../../build/gfx/maps/2994AA.tilemap.bin"
.org 0x2996DC
Gfx_2996DC:
.incbin "../../build/gfx/tiles/2996DC.png.bin"
.org 0x299EE8
Pal_299EE8:
.incbin "../../build/gfx/pal/299EE8.pal.bin"
.org 0x299F38
Map_299F38:
.incbin "../../build/gfx/maps/299F38.tilemap.bin"
.org 0x29A08A
Gfx_29A08A:
.incbin "../../build/gfx/tiles/29A08A.png.bin"
.org 0x29A81A
Pal_29A81A:
.incbin "../../build/gfx/pal/29A81A.pal.bin"
.org 0x29A86A
Map_29A86A:
.incbin "../../build/gfx/maps/29A86A.tilemap.bin"
.org 0x29A9BC
Gfx_29A9BC:
.incbin "../../build/gfx/tiles/29A9BC.png.bin"
.org 0x29AFF8
Pal_29AFF8:
.incbin "../../build/gfx/pal/29AFF8.pal.bin"
.org 0x29B048
Map_29B048:
.incbin "../../build/gfx/maps/29B048.tilemap.bin"
.org 0x29B19A
Gfx_29B19A:
.incbin "../../build/gfx/tiles/29B19A.png.bin"
.org 0x29B9B7
Pal_29B9B7:
.incbin "../../build/gfx/pal/29B9B7.pal.bin"
.org 0x29BA07
Map_29BA07:
.incbin "../../build/gfx/maps/29BA07.tilemap.bin"
.org 0x29BB59
Gfx_29BB59:
.incbin "../../build/gfx/tiles/29BB59.png.bin"
.org 0x29C313
Pal_29C313:
.incbin "../../build/gfx/pal/29C313.pal.bin"
.org 0x29C363
Map_29C363:
.incbin "../../build/gfx/maps/29C363.tilemap.bin"
.org 0x29C4B5
Gfx_29C4B5:
.incbin "../../build/gfx/tiles/29C4B5.png.bin"
.org 0x29C83F
Pal_29C83F:
.incbin "../../build/gfx/pal/29C83F.pal.bin"
.org 0x29C88F
Map_29C88F:
.incbin "../../build/gfx/maps/29C88F.tilemap.bin"
.org 0x29CA0D
Gfx_29CA0D:
.incbin "../../build/gfx/tiles/29CA0D.png.bin"
.org 0x29D34A
Pal_29D34A:
.incbin "../../build/gfx/pal/29D34A.pal.bin"
.org 0x29D39A
Map_29D39A:
.incbin "../../build/gfx/maps/29D39A.tilemap.bin"
.org 0x29D518
Gfx_29D518:
.incbin "../../build/gfx/tiles/29D518.png.bin"
.org 0x29DDFD
Pal_29DDFD:
.incbin "../../build/gfx/pal/29DDFD.pal.bin"
.org 0x29DE4D
Map_29DE4D:
.incbin "../../build/gfx/maps/29DE4D.tilemap.bin"
.org 0x29DF9F
Gfx_29DF9F:
.incbin "../../build/gfx/tiles/29DF9F.png.bin"
.org 0x29E9D9
Pal_29E9D9:
.incbin "../../build/gfx/pal/29E9D9.pal.bin"
.org 0x29EA29
Map_29EA29:
.incbin "../../build/gfx/maps/29EA29.tilemap.bin"
.org 0x29EB7B
Gfx_29EB7B:
.incbin "../../build/gfx/tiles/29EB7B.png.bin"
.org 0x29F615
Pal_29F615:
.incbin "../../build/gfx/pal/29F615.pal.bin"
.org 0x29F665
Map_29F665:
.incbin "../../build/gfx/maps/29F665.tilemap.bin"
.org 0x29F95F
Gfx_29F95F:
.incbin "../../build/gfx/tiles/29F95F.png.bin"
.org 0x29FFF7
Pal_29FFF7:
.incbin "../../build/gfx/pal/29FFF7.pal.bin"
.org 0x2A0047
Map_2A0047:
.incbin "../../build/gfx/maps/2A0047.tilemap.bin"
.org 0x2A0199
Gfx_2A0199:
.incbin "../../build/gfx/tiles/2A0199.png.bin"
.org 0x2A0A77
Pal_2A0A77:
.incbin "../../build/gfx/pal/2A0A77.pal.bin"
.org 0x2A0AC7
Map_2A0AC7:
.incbin "../../build/gfx/maps/2A0AC7.tilemap.bin"
.org 0x2A0CF9
Gfx_2A0CF9:
.incbin "../../build/gfx/tiles/2A0CF9.png.bin"
.org 0x2A1B32
Pal_2A1B32:
.incbin "../../build/gfx/pal/2A1B32.pal.bin"
.org 0x2A1B82
Map_2A1B82:
.incbin "../../build/gfx/maps/2A1B82.tilemap.bin"
.org 0x2A1DB4
Gfx_2A1DB4:
.incbin "../../build/gfx/tiles/2A1DB4.png.bin"
.org 0x2A2AFC
Pal_2A2AFC:
.incbin "../../build/gfx/pal/2A2AFC.pal.bin"
.org 0x2A2B4C
Map_2A2B4C:
.incbin "../../build/gfx/maps/2A2B4C.tilemap.bin"
.org 0x2A2D7E
Gfx_2A2D7E:
.incbin "../../build/gfx/tiles/2A2D7E.png.bin"
.org 0x2A3787
Pal_2A3787:
.incbin "../../build/gfx/pal/2A3787.pal.bin"
.org 0x2A37D7
Map_2A37D7:
.incbin "../../build/gfx/maps/2A37D7.tilemap.bin"
.org 0x2A3A09
Gfx_2A3A09:
.incbin "../../build/gfx/tiles/2A3A09.png.bin"
.org 0x2A4823
Pal_2A4823:
.incbin "../../build/gfx/pal/2A4823.pal.bin"
.org 0x2A4873
Map_2A4873:
.incbin "../../build/gfx/maps/2A4873.tilemap.bin"
.org 0x2A49C5
Gfx_2A49C5:
.incbin "../../build/gfx/tiles/2A49C5.png.bin"
.org 0x2A51F2
Pal_2A51F2:
.incbin "../../build/gfx/pal/2A51F2.pal.bin"
.org 0x2A5242
Map_2A5242:
.incbin "../../build/gfx/maps/2A5242.tilemap.bin"
.org 0x2A5394
Gfx_2A5394:
.incbin "../../build/gfx/tiles/2A5394.png.bin"
.org 0x2A5C2B
Pal_2A5C2B:
.incbin "../../build/gfx/pal/2A5C2B.pal.bin"
.org 0x2A5C7B
Map_2A5C7B:
.incbin "../../build/gfx/maps/2A5C7B.tilemap.bin"
.org 0x2A5EAD
Gfx_2A5EAD:
.incbin "../../build/gfx/tiles/2A5EAD.png.bin"
.org 0x2A6962
Pal_2A6962:
.incbin "../../build/gfx/pal/2A6962.pal.bin"
.org 0x2A69B2
Map_2A69B2:
.incbin "../../build/gfx/maps/2A69B2.tilemap.bin"
.org 0x2A6CAC
Gfx_2A6CAC:
.incbin "../../build/gfx/tiles/2A6CAC.png.bin"
.org 0x2A741F
Pal_2A741F:
.incbin "../../build/gfx/pal/2A741F.pal.bin"
.org 0x2A746F
Map_2A746F:
.incbin "../../build/gfx/maps/2A746F.tilemap.bin"
.org 0x2A76A1
Gfx_2A76A1:
.incbin "../../build/gfx/tiles/2A76A1.png.bin"
.org 0x2A84DB
Pal_2A84DB:
.incbin "../../build/gfx/pal/2A84DB.pal.bin"
.org 0x2A852B
Map_2A852B:
.incbin "../../build/gfx/maps/2A852B.tilemap.bin"
.org 0x2A875D
Gfx_2A875D:
.incbin "../../build/gfx/tiles/2A875D.png.bin"
.org 0x2A95FB
Pal_2A95FB:
.incbin "../../build/gfx/pal/2A95FB.pal.bin"
.org 0x2A964B
Map_2A964B:
.incbin "../../build/gfx/maps/2A964B.tilemap.bin"
.org 0x2A976D
Gfx_2A976D:
.incbin "../../build/gfx/tiles/2A976D.png.bin"
.org 0x2A9CAD
Pal_2A9CAD:
.incbin "../../build/gfx/pal/2A9CAD.pal.bin"
.org 0x2A9CFD
Map_2A9CFD:
.incbin "../../build/gfx/maps/2A9CFD.tilemap.bin"
.org 0x2A9E1F
Gfx_2A9E1F:
.incbin "../../build/gfx/tiles/2A9E1F.png.bin"
.org 0x2AA432
Pal_2AA432:
.incbin "../../build/gfx/pal/2AA432.pal.bin"
.org 0x2AA482
Map_2AA482:
.incbin "../../build/gfx/maps/2AA482.tilemap.bin"
.org 0x2AA5A4
Gfx_2AA5A4:
.incbin "../../build/gfx/tiles/2AA5A4.png.bin"
.org 0x2AAB64
Pal_2AAB64:
.incbin "../../build/gfx/pal/2AAB64.pal.bin"
.org 0x2AABB4
Map_2AABB4:
.incbin "../../build/gfx/maps/2AABB4.tilemap.bin"
.org 0x2AACD6
Gfx_2AACD6:
.incbin "../../build/gfx/tiles/2AACD6.png.bin"
.org 0x2AB28F
Pal_2AB28F:
.incbin "../../build/gfx/pal/2AB28F.pal.bin"
.org 0x2AB2DF
Map_2AB2DF:
.incbin "../../build/gfx/maps/2AB2DF.tilemap.bin"
.org 0x2AB3D1
Gfx_2AB3D1:
.incbin "../../build/gfx/tiles/2AB3D1.png.bin"
.org 0x2AB7CD
Pal_2AB7CD:
.incbin "../../build/gfx/pal/2AB7CD.pal.bin"
.org 0x2AB81D
Map_2AB81D:
.incbin "../../build/gfx/maps/2AB81D.tilemap.bin"
.org 0x2AB93F
Gfx_2AB93F:
.incbin "../../build/gfx/tiles/2AB93F.png.bin"
.org 0x2ABEDD
Pal_2ABEDD:
.incbin "../../build/gfx/pal/2ABEDD.pal.bin"
.org 0x2ABF2D
Map_2ABF2D:
.incbin "../../build/gfx/maps/2ABF2D.tilemap.bin"
.org 0x2AC15F
Gfx_2AC15F:
.incbin "../../build/gfx/tiles/2AC15F.png.bin"
.org 0x2ACEBC
Pal_2ACEBC:
.incbin "../../build/gfx/pal/2ACEBC.pal.bin"
.org 0x2ACF0C
Map_2ACF0C:
.incbin "../../build/gfx/maps/2ACF0C.tilemap.bin"
.org 0x2AD13E
Gfx_2AD13E:
.incbin "../../build/gfx/tiles/2AD13E.png.bin"
.org 0x2ADF46
Pal_2ADF46:
.incbin "../../build/gfx/pal/2ADF46.pal.bin"
.org 0x2ADF96
Map_2ADF96:
.incbin "../../build/gfx/maps/2ADF96.tilemap.bin"
.org 0x2AE290
Gfx_2AE290:
.incbin "../../build/gfx/tiles/2AE290.png.bin"
.org 0x2AF3B4
Pal_2AF3B4:
.incbin "../../build/gfx/pal/2AF3B4.pal.bin"
.org 0x2AF404
Map_2AF404:
.incbin "../../build/gfx/maps/2AF404.tilemap.bin"
.org 0x2AF636
Gfx_2AF636:
.incbin "../../build/gfx/tiles/2AF636.png.bin"
.org 0x2AF65A
MonoPal_2AF65A:
.incbin "../../build/gfx/pal/2AF65A.pal4.bin"
.org 0x2AF662
Map_2AF662:
.incbin "../../build/gfx/maps/2AF662.tilemap.bin"
.org 0x2AF724
Gfx_2AF724:
.incbin "../../build/gfx/tiles/2AF724.png.bin"
.org 0x2AFB55
MonoPal_2AFB55:
.incbin "../../build/gfx/pal/2AFB55.pal4.bin"
.org 0x2AFB5D
Map_2AFB5D:
.incbin "../../build/gfx/maps/2AFB5D.tilemap.bin"
.org 0x2AFC4F
Gfx_2AFC4F:
.incbin "../../build/gfx/tiles/2AFC4F.png.bin"
.org 0x2B0075
MonoPal_2B0075:
.incbin "../../build/gfx/pal/2B0075.pal4.bin"
.org 0x2B007D
Map_2B007D:
.incbin "../../build/gfx/maps/2B007D.tilemap.bin"
.org 0x2B0187
Gfx_2B0187:
.incbin "../../build/gfx/tiles/2B0187.png.bin"
.org 0x2B067E
MonoPal_2B067E:
.incbin "../../build/gfx/pal/2B067E.pal4.bin"
.org 0x2B0686
Map_2B0686:
.incbin "../../build/gfx/maps/2B0686.tilemap.bin"
.org 0x2B0760
Gfx_2B0760:
.incbin "../../build/gfx/tiles/2B0760.png.bin"
.org 0x2B0C29
MonoPal_2B0C29:
.incbin "../../build/gfx/pal/2B0C29.pal4.bin"
.org 0x2B0C31
Map_2B0C31:
.incbin "../../build/gfx/maps/2B0C31.tilemap.bin"
.org 0x2B0D53
Gfx_2B0D53:
.incbin "../../build/gfx/tiles/2B0D53.png.bin"
.org 0x2B12B2
MonoPal_2B12B2:
.incbin "../../build/gfx/pal/2B12B2.pal4.bin"
.org 0x2B12BA
Map_2B12BA:
.incbin "../../build/gfx/maps/2B12BA.tilemap.bin"
.org 0x2B13C4
Gfx_2B13C4:
.incbin "../../build/gfx/tiles/2B13C4.png.bin"
.org 0x2B1A3D
MonoPal_2B1A3D:
.incbin "../../build/gfx/pal/2B1A3D.pal4.bin"
.org 0x2B1A45
Map_2B1A45:
.incbin "../../build/gfx/maps/2B1A45.tilemap.bin"
.org 0x2B1B4F
Gfx_2B1B4F:
.incbin "../../build/gfx/tiles/2B1B4F.png.bin"
.org 0x2B2160
MonoPal_2B2160:
.incbin "../../build/gfx/pal/2B2160.pal4.bin"
.org 0x2B2168
Map_2B2168:
.incbin "../../build/gfx/maps/2B2168.tilemap.bin"
.org 0x2B228A
Gfx_2B228A:
.incbin "../../build/gfx/tiles/2B228A.png.bin"
.org 0x2B2A22
MonoPal_2B2A22:
.incbin "../../build/gfx/pal/2B2A22.pal4.bin"
.org 0x2B2A2A
Map_2B2A2A:
.incbin "../../build/gfx/maps/2B2A2A.tilemap.bin"
.org 0x2B2B4C
Gfx_2B2B4C:
.incbin "../../build/gfx/tiles/2B2B4C.png.bin"
.org 0x2B30D4
MonoPal_2B30D4:
.incbin "../../build/gfx/pal/2B30D4.pal4.bin"
.org 0x2B30DC
Map_2B30DC:
.incbin "../../build/gfx/maps/2B30DC.tilemap.bin"
.org 0x2B31BA
Gfx_2B31BA:
.incbin "../../build/gfx/tiles/2B31BA.png.bin"
.org 0x2B35BD
MonoPal_2B35BD:
.incbin "../../build/gfx/pal/2B35BD.pal4.bin"
.org 0x2B35C5
Map_2B35C5:
.incbin "../../build/gfx/maps/2B35C5.tilemap.bin"
.org 0x2B363F
Gfx_2B363F:
.incbin "../../build/gfx/tiles/2B363F.png.bin"
.org 0x2B3948
MonoPal_2B3948:
.incbin "../../build/gfx/pal/2B3948.pal4.bin"
.org 0x2B3950
Map_2B3950:
.incbin "../../build/gfx/maps/2B3950.tilemap.bin"
.org 0x2B39CA
Gfx_2B39CA:
.incbin "../../build/gfx/tiles/2B39CA.png.bin"
.org 0x2B3CD5
MonoPal_2B3CD5:
.incbin "../../build/gfx/pal/2B3CD5.pal4.bin"
.org 0x2B3CDD
Map_2B3CDD:
.incbin "../../build/gfx/maps/2B3CDD.tilemap.bin"
.org 0x2B3D57
Gfx_2B3D57:
.incbin "../../build/gfx/tiles/2B3D57.png.bin"
.org 0x2B40A2
MonoPal_2B40A2:
.incbin "../../build/gfx/pal/2B40A2.pal4.bin"
.org 0x2B40AA
Map_2B40AA:
.incbin "../../build/gfx/maps/2B40AA.tilemap.bin"
.org 0x2B4124
Gfx_2B4124:
.incbin "../../build/gfx/tiles/2B4124.png.bin"
.org 0x2B4477
MonoPal_2B4477:
.incbin "../../build/gfx/pal/2B4477.pal4.bin"
.org 0x2B447F
Map_2B447F:
.incbin "../../build/gfx/maps/2B447F.tilemap.bin"
.org 0x2B44F9
Gfx_2B44F9:
.incbin "../../build/gfx/tiles/2B44F9.png.bin"
.org 0x2B485A
MonoPal_2B485A:
.incbin "../../build/gfx/pal/2B485A.pal4.bin"
.org 0x2B4862
Map_2B4862:
.incbin "../../build/gfx/maps/2B4862.tilemap.bin"
.org 0x2B48DC
Gfx_2B48DC:
.incbin "../../build/gfx/tiles/2B48DC.png.bin"
.org 0x2B4C6D
MonoPal_2B4C6D:
.incbin "../../build/gfx/pal/2B4C6D.pal4.bin"
.org 0x2B4C75
Map_2B4C75:
.incbin "../../build/gfx/maps/2B4C75.tilemap.bin"
.org 0x2B4CEF
Gfx_2B4CEF:
.incbin "../../build/gfx/tiles/2B4CEF.png.bin"
.org 0x2B5060
MonoPal_2B5060:
.incbin "../../build/gfx/pal/2B5060.pal4.bin"
.org 0x2B5068
Map_2B5068:
.incbin "../../build/gfx/maps/2B5068.tilemap.bin"
.org 0x2B50E2
Gfx_2B50E2:
.incbin "../../build/gfx/tiles/2B50E2.png.bin"
.org 0x2B5470
MonoPal_2B5470:
.incbin "../../build/gfx/pal/2B5470.pal4.bin"
.org 0x2B5478
Map_2B5478:
.incbin "../../build/gfx/maps/2B5478.tilemap.bin"
.org 0x2B54F2
Gfx_2B54F2:
.incbin "../../build/gfx/tiles/2B54F2.png.bin"
.org 0x2B581F
MonoPal_2B581F:
.incbin "../../build/gfx/pal/2B581F.pal4.bin"
.org 0x2B5827
Map_2B5827:
.incbin "../../build/gfx/maps/2B5827.tilemap.bin"
.org 0x2B58A1
Gfx_2B58A1:
.incbin "../../build/gfx/tiles/2B58A1.png.bin"
.org 0x2B5BB0
MonoPal_2B5BB0:
.incbin "../../build/gfx/pal/2B5BB0.pal4.bin"
.org 0x2B5BB8
Map_2B5BB8:
.incbin "../../build/gfx/maps/2B5BB8.tilemap.bin"
.org 0x2B5CC2
Gfx_2B5CC2:
.incbin "../../build/gfx/tiles/2B5CC2.png.bin"
.org 0x2B612C
MonoPal_2B612C:
.incbin "../../build/gfx/pal/2B612C.pal4.bin"
.org 0x2B6134
Map_2B6134:
.incbin "../../build/gfx/maps/2B6134.tilemap.bin"
.org 0x2B623E
Gfx_2B623E:
.incbin "../../build/gfx/tiles/2B623E.png.bin"
.org 0x2B6779
MonoPal_2B6779:
.incbin "../../build/gfx/pal/2B6779.pal4.bin"
.org 0x2B6781
Map_2B6781:
.incbin "../../build/gfx/maps/2B6781.tilemap.bin"
.org 0x2B68A3
Gfx_2B68A3:
.incbin "../../build/gfx/tiles/2B68A3.png.bin"
.org 0x2B6F87
MonoPal_2B6F87:
.incbin "../../build/gfx/pal/2B6F87.pal4.bin"
.org 0x2B6F8F
Map_2B6F8F:
.incbin "../../build/gfx/maps/2B6F8F.tilemap.bin"
.org 0x2B7099
Gfx_2B7099:
.incbin "../../build/gfx/tiles/2B7099.png.bin"
.org 0x2B74D6
MonoPal_2B74D6:
.incbin "../../build/gfx/pal/2B74D6.pal4.bin"
.org 0x2B74DE
Map_2B74DE:
.incbin "../../build/gfx/maps/2B74DE.tilemap.bin"
.org 0x2B75D0
Gfx_2B75D0:
.incbin "../../build/gfx/tiles/2B75D0.png.bin"
.org 0x2B7B30
MonoPal_2B7B30:
.incbin "../../build/gfx/pal/2B7B30.pal4.bin"
.org 0x2B7B38
Map_2B7B38:
.incbin "../../build/gfx/maps/2B7B38.tilemap.bin"
.org 0x2B7C12
Gfx_2B7C12:
.incbin "../../build/gfx/tiles/2B7C12.png.bin"
.org 0x2B80A5
MonoPal_2B80A5:
.incbin "../../build/gfx/pal/2B80A5.pal4.bin"
.org 0x2B80AD
Map_2B80AD:
.incbin "../../build/gfx/maps/2B80AD.tilemap.bin"
.org 0x2B818B
Gfx_2B818B:
.incbin "../../build/gfx/tiles/2B818B.png.bin"
.org 0x2B866B
MonoPal_2B866B:
.incbin "../../build/gfx/pal/2B866B.pal4.bin"
.org 0x2B8673
Map_2B8673:
.incbin "../../build/gfx/maps/2B8673.tilemap.bin"
.org 0x2B877D
Gfx_2B877D:
.incbin "../../build/gfx/tiles/2B877D.png.bin"
.org 0x2B8D2A
MonoPal_2B8D2A:
.incbin "../../build/gfx/pal/2B8D2A.pal4.bin"
.org 0x2B8D32
Map_2B8D32:
.incbin "../../build/gfx/maps/2B8D32.tilemap.bin"
.org 0x2B8E26
Gfx_2B8E26:
.incbin "../../build/gfx/tiles/2B8E26.png.bin"
.org 0x2B9233
MonoPal_2B9233:
.incbin "../../build/gfx/pal/2B9233.pal4.bin"
.org 0x2B923B
Map_2B923B:
.incbin "../../build/gfx/maps/2B923B.tilemap.bin"
.org 0x2B9345
Gfx_2B9345:
.incbin "../../build/gfx/tiles/2B9345.png.bin"
.org 0x2B981E
MonoPal_2B981E:
.incbin "../../build/gfx/pal/2B981E.pal4.bin"
.org 0x2B9826
Map_2B9826:
.incbin "../../build/gfx/maps/2B9826.tilemap.bin"
.org 0x2B9948
Gfx_2B9948:
.incbin "../../build/gfx/tiles/2B9948.png.bin"
.org 0x2B9F26
MonoPal_2B9F26:
.incbin "../../build/gfx/pal/2B9F26.pal4.bin"
.org 0x2B9F2E
Map_2B9F2E:
.incbin "../../build/gfx/maps/2B9F2E.tilemap.bin"
.org 0x2BA050
Gfx_2BA050:
.incbin "../../build/gfx/tiles/2BA050.png.bin"
.org 0x2BA5FC
MonoPal_2BA5FC:
.incbin "../../build/gfx/pal/2BA5FC.pal4.bin"
.org 0x2BA604
Map_2BA604:
.incbin "../../build/gfx/maps/2BA604.tilemap.bin"
.org 0x2BA726
Gfx_2BA726:
.incbin "../../build/gfx/tiles/2BA726.png.bin"
.org 0x2BAB89
MonoPal_2BAB89:
.incbin "../../build/gfx/pal/2BAB89.pal4.bin"
.org 0x2BAB91
Map_2BAB91:
.incbin "../../build/gfx/maps/2BAB91.tilemap.bin"
.org 0x2BACB3
Gfx_2BACB3:
.incbin "../../build/gfx/tiles/2BACB3.png.bin"
.org 0x2BB3BF
Pal_2BB3BF:
.incbin "../../build/gfx/pal/2BB3BF.pal.bin"
.org 0x2BB40F
Map_2BB40F:
.incbin "../../build/gfx/maps/2BB40F.tilemap.bin"
.org 0x2BB4D1
Gfx_2BB4D1:
.incbin "../../build/gfx/tiles/2BB4D1.png.bin"
.org 0x2BB912
Pal_2BB912:
.incbin "../../build/gfx/pal/2BB912.pal.bin"
.org 0x2BB962
Map_2BB962:
.incbin "../../build/gfx/maps/2BB962.tilemap.bin"
.org 0x2BBA54
Gfx_2BBA54:
.incbin "../../build/gfx/tiles/2BBA54.png.bin"
.org 0x2BBE7B
Pal_2BBE7B:
.incbin "../../build/gfx/pal/2BBE7B.pal.bin"
.org 0x2BBECB
Map_2BBECB:
.incbin "../../build/gfx/maps/2BBECB.tilemap.bin"
.org 0x2BBFD5
Gfx_2BBFD5:
.incbin "../../build/gfx/tiles/2BBFD5.png.bin"
.org 0x2BC4CF
Pal_2BC4CF:
.incbin "../../build/gfx/pal/2BC4CF.pal.bin"
.org 0x2BC51F
Map_2BC51F:
.incbin "../../build/gfx/maps/2BC51F.tilemap.bin"
.org 0x2BC5F9
Gfx_2BC5F9:
.incbin "../../build/gfx/tiles/2BC5F9.png.bin"
.org 0x2BCABC
Pal_2BCABC:
.incbin "../../build/gfx/pal/2BCABC.pal.bin"
.org 0x2BCB0C
Map_2BCB0C:
.incbin "../../build/gfx/maps/2BCB0C.tilemap.bin"
.org 0x2BCC2E
Gfx_2BCC2E:
.incbin "../../build/gfx/tiles/2BCC2E.png.bin"
.org 0x2BD193
Pal_2BD193:
.incbin "../../build/gfx/pal/2BD193.pal.bin"
.org 0x2BD1E3
Map_2BD1E3:
.incbin "../../build/gfx/maps/2BD1E3.tilemap.bin"
.org 0x2BD2ED
Gfx_2BD2ED:
.incbin "../../build/gfx/tiles/2BD2ED.png.bin"
.org 0x2BD965
Pal_2BD965:
.incbin "../../build/gfx/pal/2BD965.pal.bin"
.org 0x2BD9B5
Map_2BD9B5:
.incbin "../../build/gfx/maps/2BD9B5.tilemap.bin"
.org 0x2BDABF
Gfx_2BDABF:
.incbin "../../build/gfx/tiles/2BDABF.png.bin"
.org 0x2BE0DF
Pal_2BE0DF:
.incbin "../../build/gfx/pal/2BE0DF.pal.bin"
.org 0x2BE12F
Map_2BE12F:
.incbin "../../build/gfx/maps/2BE12F.tilemap.bin"
.org 0x2BE251
Gfx_2BE251:
.incbin "../../build/gfx/tiles/2BE251.png.bin"
.org 0x2BE9ED
Pal_2BE9ED:
.incbin "../../build/gfx/pal/2BE9ED.pal.bin"
.org 0x2BEA3D
Map_2BEA3D:
.incbin "../../build/gfx/maps/2BEA3D.tilemap.bin"
.org 0x2BEB5F
Gfx_2BEB5F:
.incbin "../../build/gfx/tiles/2BEB5F.png.bin"
.org 0x2BF0EE
Pal_2BF0EE:
.incbin "../../build/gfx/pal/2BF0EE.pal.bin"
.org 0x2BF13E
Map_2BF13E:
.incbin "../../build/gfx/maps/2BF13E.tilemap.bin"
.org 0x2BF21C
Gfx_2BF21C:
.incbin "../../build/gfx/tiles/2BF21C.png.bin"
.org 0x2BF610
Pal_2BF610:
.incbin "../../build/gfx/pal/2BF610.pal.bin"
.org 0x2BF660
Map_2BF660:
.incbin "../../build/gfx/maps/2BF660.tilemap.bin"
.org 0x2BF6DA
Gfx_2BF6DA:
.incbin "../../build/gfx/tiles/2BF6DA.png.bin"
.org 0x2BF9EF
Pal_2BF9EF:
.incbin "../../build/gfx/pal/2BF9EF.pal.bin"
.org 0x2BFA3F
Map_2BFA3F:
.incbin "../../build/gfx/maps/2BFA3F.tilemap.bin"
.org 0x2BFAB9
Gfx_2BFAB9:
.incbin "../../build/gfx/tiles/2BFAB9.png.bin"
.org 0x2BFDC5
Pal_2BFDC5:
.incbin "../../build/gfx/pal/2BFDC5.pal.bin"
.org 0x2BFE15
Map_2BFE15:
.incbin "../../build/gfx/maps/2BFE15.tilemap.bin"
.org 0x2BFE8F
Gfx_2BFE8F:
.incbin "../../build/gfx/tiles/2BFE8F.png.bin"
.org 0x2C01DF
Pal_2C01DF:
.incbin "../../build/gfx/pal/2C01DF.pal.bin"
.org 0x2C022F
Map_2C022F:
.incbin "../../build/gfx/maps/2C022F.tilemap.bin"
.org 0x2C02A9
Gfx_2C02A9:
.incbin "../../build/gfx/tiles/2C02A9.png.bin"
.org 0x2C05F6
Pal_2C05F6:
.incbin "../../build/gfx/pal/2C05F6.pal.bin"
.org 0x2C0646
Map_2C0646:
.incbin "../../build/gfx/maps/2C0646.tilemap.bin"
.org 0x2C06C0
Gfx_2C06C0:
.incbin "../../build/gfx/tiles/2C06C0.png.bin"
.org 0x2C0A23
Pal_2C0A23:
.incbin "../../build/gfx/pal/2C0A23.pal.bin"
.org 0x2C0A73
Map_2C0A73:
.incbin "../../build/gfx/maps/2C0A73.tilemap.bin"
.org 0x2C0AED
Gfx_2C0AED:
.incbin "../../build/gfx/tiles/2C0AED.png.bin"
.org 0x2C0E87
Pal_2C0E87:
.incbin "../../build/gfx/pal/2C0E87.pal.bin"
.org 0x2C0ED7
Map_2C0ED7:
.incbin "../../build/gfx/maps/2C0ED7.tilemap.bin"
.org 0x2C0F51
Gfx_2C0F51:
.incbin "../../build/gfx/tiles/2C0F51.png.bin"
.org 0x2C12BE
Pal_2C12BE:
.incbin "../../build/gfx/pal/2C12BE.pal.bin"
.org 0x2C130E
Map_2C130E:
.incbin "../../build/gfx/maps/2C130E.tilemap.bin"
.org 0x2C1388
Gfx_2C1388:
.incbin "../../build/gfx/tiles/2C1388.png.bin"
.org 0x2C1716
Pal_2C1716:
.incbin "../../build/gfx/pal/2C1716.pal.bin"
.org 0x2C1766
Map_2C1766:
.incbin "../../build/gfx/maps/2C1766.tilemap.bin"
.org 0x2C17E0
Gfx_2C17E0:
.incbin "../../build/gfx/tiles/2C17E0.png.bin"
.org 0x2C1B0C
Pal_2C1B0C:
.incbin "../../build/gfx/pal/2C1B0C.pal.bin"
.org 0x2C1B5C
Map_2C1B5C:
.incbin "../../build/gfx/maps/2C1B5C.tilemap.bin"
.org 0x2C1BD6
Gfx_2C1BD6:
.incbin "../../build/gfx/tiles/2C1BD6.png.bin"
.org 0x2C1EE7
Pal_2C1EE7:
.incbin "../../build/gfx/pal/2C1EE7.pal.bin"
.org 0x2C1F37
Map_2C1F37:
.incbin "../../build/gfx/maps/2C1F37.tilemap.bin"
.org 0x2C2041
Gfx_2C2041:
.incbin "../../build/gfx/tiles/2C2041.png.bin"
.org 0x2C24B1
Pal_2C24B1:
.incbin "../../build/gfx/pal/2C24B1.pal.bin"
.org 0x2C2501
Map_2C2501:
.incbin "../../build/gfx/maps/2C2501.tilemap.bin"
.org 0x2C260B
Gfx_2C260B:
.incbin "../../build/gfx/tiles/2C260B.png.bin"
.org 0x2C2B4F
Pal_2C2B4F:
.incbin "../../build/gfx/pal/2C2B4F.pal.bin"
.org 0x2C2B9F
Map_2C2B9F:
.incbin "../../build/gfx/maps/2C2B9F.tilemap.bin"
.org 0x2C2CC1
Gfx_2C2CC1:
.incbin "../../build/gfx/tiles/2C2CC1.png.bin"
.org 0x2C339D
Pal_2C339D:
.incbin "../../build/gfx/pal/2C339D.pal.bin"
.org 0x2C33ED
Map_2C33ED:
.incbin "../../build/gfx/maps/2C33ED.tilemap.bin"
.org 0x2C34F7
Gfx_2C34F7:
.incbin "../../build/gfx/tiles/2C34F7.png.bin"
.org 0x2C392F
Pal_2C392F:
.incbin "../../build/gfx/pal/2C392F.pal.bin"
.org 0x2C397F
Map_2C397F:
.incbin "../../build/gfx/maps/2C397F.tilemap.bin"
.org 0x2C3A71
Gfx_2C3A71:
.incbin "../../build/gfx/tiles/2C3A71.png.bin"
.org 0x2C3FDD
Pal_2C3FDD:
.incbin "../../build/gfx/pal/2C3FDD.pal.bin"
.org 0x2C402D
Map_2C402D:
.incbin "../../build/gfx/maps/2C402D.tilemap.bin"
.org 0x2C4107
Gfx_2C4107:
.incbin "../../build/gfx/tiles/2C4107.png.bin"
.org 0x2C45EB
Pal_2C45EB:
.incbin "../../build/gfx/pal/2C45EB.pal.bin"
.org 0x2C463B
Map_2C463B:
.incbin "../../build/gfx/maps/2C463B.tilemap.bin"
.org 0x2C4719
Gfx_2C4719:
.incbin "../../build/gfx/tiles/2C4719.png.bin"
.org 0x2C4C07
Pal_2C4C07:
.incbin "../../build/gfx/pal/2C4C07.pal.bin"
.org 0x2C4C57
Map_2C4C57:
.incbin "../../build/gfx/maps/2C4C57.tilemap.bin"
.org 0x2C4D61
Gfx_2C4D61:
.incbin "../../build/gfx/tiles/2C4D61.png.bin"
.org 0x2C530C
Pal_2C530C:
.incbin "../../build/gfx/pal/2C530C.pal.bin"
.org 0x2C535C
Map_2C535C:
.incbin "../../build/gfx/maps/2C535C.tilemap.bin"
.org 0x2C5450
Gfx_2C5450:
.incbin "../../build/gfx/tiles/2C5450.png.bin"
.org 0x2C5866
Pal_2C5866:
.incbin "../../build/gfx/pal/2C5866.pal.bin"
.org 0x2C58B6
Map_2C58B6:
.incbin "../../build/gfx/maps/2C58B6.tilemap.bin"
.org 0x2C59C0
Gfx_2C59C0:
.incbin "../../build/gfx/tiles/2C59C0.png.bin"
.org 0x2C5E94
Pal_2C5E94:
.incbin "../../build/gfx/pal/2C5E94.pal.bin"
.org 0x2C5EE4
Map_2C5EE4:
.incbin "../../build/gfx/maps/2C5EE4.tilemap.bin"
.org 0x2C6006
Gfx_2C6006:
.incbin "../../build/gfx/tiles/2C6006.png.bin"
.org 0x2C65EF
Pal_2C65EF:
.incbin "../../build/gfx/pal/2C65EF.pal.bin"
.org 0x2C663F
Map_2C663F:
.incbin "../../build/gfx/maps/2C663F.tilemap.bin"
.org 0x2C6761
Gfx_2C6761:
.incbin "../../build/gfx/tiles/2C6761.png.bin"
.org 0x2C6D15
Pal_2C6D15:
.incbin "../../build/gfx/pal/2C6D15.pal.bin"
.org 0x2C6D65
Map_2C6D65:
.incbin "../../build/gfx/maps/2C6D65.tilemap.bin"
.org 0x2C6E87
Gfx_2C6E87:
.incbin "../../build/gfx/tiles/2C6E87.png.bin"
.org 0x2C72DD
Pal_2C72DD:
.incbin "../../build/gfx/pal/2C72DD.pal.bin"
.org 0x2C732D
Map_2C732D:
.incbin "../../build/gfx/maps/2C732D.tilemap.bin"
.org 0x2C744F
Gfx_2C744F:
.incbin "../../build/gfx/tiles/2C744F.png.bin"
.org 0x2C82AE
Pal_2C82AE:
.incbin "../../build/gfx/pal/2C82AE.pal.bin"
.org 0x2C82CE
Pal_2C82CE:
.incbin "../../build/gfx/pal/2C82CE.pal.bin"
.org 0x2C82DE
Map_2C82DE:
.incbin "../../build/gfx/maps/2C82DE.tilemap.bin"
.org 0x2C82E8
Map_2C82E8:
.incbin "../../build/gfx/maps/2C82E8.tilemap.bin"
.org 0x2C82F2
Map_2C82F2:
.incbin "../../build/gfx/maps/2C82F2.tilemap.bin"
.org 0x2C82FC
Map_2C82FC:
.incbin "../../build/gfx/maps/2C82FC.tilemap.bin"
.org 0x2C8306
Gfx_2C8306:
.incbin "../../build/gfx/tiles/2C8306.png.bin"
.org 0x2C865D
Pal_2C865D:
.incbin "../../build/gfx/pal/2C865D.pal.bin"
.org 0x2C8691
Gfx_2C8691:
.incbin "../../build/gfx/tiles/2C8691.png.bin"
.org 0x2C8772
Pal_2C8772:
.incbin "../../build/gfx/pal/2C8772.pal.bin"
.org 0x2C87A2
MonoPal_2C87A2:
.incbin "../../build/gfx/pal/2C87A2.pal4.bin"
.org 0x2C8D6C
Pal_2C8D6C:
.incbin "../../build/gfx/pal/2C8D6C.pal.bin"
.org 0x2C8D88
Gfx_2C8D88:
.incbin "../../build/gfx/tiles/2C8D88.png.bin"
.org 0x2C95A9
Monster_Wooden:
.incbin "../../build/gfx/monsters/wooden.png.bin"
.org 0x2C9889
Monster_Stump:
.incbin "../../build/gfx/monsters/stump.png.bin"
.org 0x2C9AE6
Monster_Cabra:
.incbin "../../build/gfx/monsters/cabra.png.bin"
.org 0x2C9E14
Monster_Spidey:
.incbin "../../build/gfx/monsters/spidey.png.bin"
.org 0x2CA117
Monster_Froggy:
.incbin "../../build/gfx/monsters/froggy.png.bin"
.org 0x2CA384
Monster_Froggr:
.incbin "../../build/gfx/monsters/froggr.png.bin"
.org 0x2CA631
Monster_Eyefly:
.incbin "../../build/gfx/monsters/eyefly.png.bin"
.org 0x2CA8C3
Monster_Nauti:
.incbin "../../build/gfx/monsters/nauti.png.bin"
.org 0x2CAB48
Monster_Bulby:
.incbin "../../build/gfx/monsters/bulby.png.bin"
.org 0x2CAD3E
Monster_Bulbet:
.incbin "../../build/gfx/monsters/bulbet.png.bin"
.org 0x2CAF50
Monster_Lickin:
.incbin "../../build/gfx/monsters/lickin.png.bin"
.org 0x2CB160
Monster_Squirm:
.incbin "../../build/gfx/monsters/squirm.png.bin"
.org 0x2CB474
Monster_Crabby:
.incbin "../../build/gfx/monsters/crabby.png.bin"
.org 0x2CB73E
Monster_Dedhed:
.incbin "../../build/gfx/monsters/dedhed.png.bin"
.org 0x2CBAA5
Monster_Scythr:
.incbin "../../build/gfx/monsters/scythr.png.bin"
.org 0x2CBD8D
Monster_Wolfen:
.incbin "../../build/gfx/monsters/wolfen.png.bin"
.org 0x2CC050
Monster_Pumper:
.incbin "../../build/gfx/monsters/pumper.png.bin"
.org 0x2CC3D0
Monster_Hornd:
.incbin "../../build/gfx/monsters/hornd.png.bin"
.org 0x2CC6D6
Monster_Drake:
.incbin "../../build/gfx/monsters/drake.png.bin"
.org 0x2CC9A1
Monster_Beasty:
.incbin "../../build/gfx/monsters/beasty.png.bin"
.org 0x2CCCEF
Monster_Mutan:
.incbin "../../build/gfx/monsters/mutan.png.bin"
.org 0x2CCFED
Monster_Whyrm:
.incbin "../../build/gfx/monsters/whyrm.png.bin"
.org 0x2CD336
Monster_Iil:
.incbin "../../build/gfx/monsters/iil.png.bin"
.org 0x2CD5BD
Monster_Iworm:
.incbin "../../build/gfx/monsters/iworm.png.bin"
.org 0x2CD90D
Monster_Moworm:
.incbin "../../build/gfx/monsters/moworm.png.bin"
.org 0x2CDC63
Monster_Dragon:
.incbin "../../build/gfx/monsters/dragon.png.bin"
.org 0x2CDF17
Monster_Hyoi:
.incbin "../../build/gfx/monsters/hyoi.png.bin"
.org 0x2CE240
Monster_Eeek:
.incbin "../../build/gfx/monsters/eeek.png.bin"
.org 0x2CE596
Monster_Ratta:
.incbin "../../build/gfx/monsters/ratta.png.bin"
.org 0x2CE8AB
Monster_Lamia:
.incbin "../../build/gfx/monsters/lamia.png.bin"
.org 0x2CEBD7
Monster_Viney:
.incbin "../../build/gfx/monsters/viney.png.bin"
.org 0x2CEE63
Monster_Coyote:
.incbin "../../build/gfx/monsters/coyote.png.bin"
.org 0x2CF14D
Monster_Firey:
.incbin "../../build/gfx/monsters/firey.png.bin"
.org 0x2CF4D6
Monster_Sphinx:
.incbin "../../build/gfx/monsters/sphinx.png.bin"
.org 0x2CF810
Monster_Jakko:
.incbin "../../build/gfx/monsters/jakko.png.bin"
.org 0x2CFB4E
Monster_Faroh:
.incbin "../../build/gfx/monsters/faroh.png.bin"
.org 0x2CFEB7
Monster_Jyster:
.incbin "../../build/gfx/monsters/jyster.png.bin"
.org 0x2D0160
Monster_Skully:
.incbin "../../build/gfx/monsters/skully.png.bin"
.org 0x2D03F4
Monster_Skullt:
.incbin "../../build/gfx/monsters/skullt.png.bin"
.org 0x2D06AF
Monster_Mummy:
.incbin "../../build/gfx/monsters/mummy.png.bin"
.org 0x2D09E6
Monster_Zombit:
.incbin "../../build/gfx/monsters/zombit.png.bin"
.org 0x2D0D0C
Monster_Squido:
.incbin "../../build/gfx/monsters/squido.png.bin"
.org 0x2D1048
Monster_Octpod:
.incbin "../../build/gfx/monsters/octpod.png.bin"
.org 0x2D13A6
Monster_Curly:
.incbin "../../build/gfx/monsters/curly.png.bin"
.org 0x2D16DF
Monster_Whirly:
.incbin "../../build/gfx/monsters/whirly.png.bin"
.org 0x2D19F1
Monster_Scaley:
.incbin "../../build/gfx/monsters/scaley.png.bin"
.org 0x2D1D01
Monster_Bonryu:
.incbin "../../build/gfx/monsters/bonryu.png.bin"
.org 0x2D1FBD
Monster_Merman:
.incbin "../../build/gfx/monsters/merman.png.bin"
.org 0x2D22CF
Monster_Marman:
.incbin "../../build/gfx/monsters/marman.png.bin"
.org 0x2D25E8
Monster_Harpy:
.incbin "../../build/gfx/monsters/harpy.png.bin"
.org 0x2D28B9
Monster_Darpy:
.incbin "../../build/gfx/monsters/darpy.png.bin"
.org 0x2D2BA5
Monster_Grifon:
.incbin "../../build/gfx/monsters/grifon.png.bin"
.org 0x2D2EBA
Monster_Coatl:
.incbin "../../build/gfx/monsters/coatl.png.bin"
.org 0x2D31ED
Monster_Toris:
.incbin "../../build/gfx/monsters/toris.png.bin"
.org 0x2D34B6
Monster_Mrice:
.incbin "../../build/gfx/monsters/mrice.png.bin"
.org 0x2D3793
Monster_Trice:
.incbin "../../build/gfx/monsters/trice.png.bin"
.org 0x2D3A84
Monster_Chimer:
.incbin "../../build/gfx/monsters/chimer.png.bin"
.org 0x2D3D0C
Monster_Borey:
.incbin "../../build/gfx/monsters/borey.png.bin"
.org 0x2D4047
Monster_Mibore:
.incbin "../../build/gfx/monsters/mibore.png.bin"
.org 0x2D43B2
Monster_Aquan:
.incbin "../../build/gfx/monsters/aquan.png.bin"
.org 0x2D46D6
Monster_Misynk:
.incbin "../../build/gfx/monsters/misynk.png.bin"
.org 0x2D4A05
Monster_Horsee:
.incbin "../../build/gfx/monsters/horsee.png.bin"
.org 0x2D4CEE
Monster_Narl:
.incbin "../../build/gfx/monsters/narl.png.bin"
.org 0x2D4F81
Monster_Orka:
.incbin "../../build/gfx/monsters/orka.png.bin"
.org 0x2D51F0
Monster_Agolem:
.incbin "../../build/gfx/monsters/agolem.png.bin"
.org 0x2D5532
Monster_Golem:
.incbin "../../build/gfx/monsters/golem.png.bin"
.org 0x2D5870
Monster_Niten:
.incbin "../../build/gfx/monsters/niten.png.bin"
.org 0x2D5BC4
Monster_Barby:
.incbin "../../build/gfx/monsters/barby.png.bin"
.org 0x2D5E93
Monster_Rocky:
.incbin "../../build/gfx/monsters/rocky.png.bin"
.org 0x2D61E4
Monster_Fountn:
.incbin "../../build/gfx/monsters/fountn.png.bin"
.org 0x2D6442
Monster_Walley:
.incbin "../../build/gfx/monsters/walley.png.bin"
.org 0x2D6678
Monster_Crystl:
.incbin "../../build/gfx/monsters/crystl.png.bin"
.org 0x2D68B8
Monster_Hippie:
.incbin "../../build/gfx/monsters/hippie.png.bin"
.org 0x2D6B8A
Monster_Cerebn:
.incbin "../../build/gfx/monsters/cerebn.png.bin"
.org 0x2D6E90
Monster_Snoman:
.incbin "../../build/gfx/monsters/snoman.png.bin"
.org 0x2D70D8
Monster_Seel:
.incbin "../../build/gfx/monsters/seel.png.bin"
.org 0x2D73A1
Monster_Unicon:
.incbin "../../build/gfx/monsters/unicon.png.bin"
.org 0x2D7690
Monster_Deep1:
.incbin "../../build/gfx/monsters/deep1.png.bin"
.org 0x2D79CE
Monster_Mamoth:
.incbin "../../build/gfx/monsters/mamoth.png.bin"
.org 0x2D7D38
Monster_Trappr:
.incbin "../../build/gfx/monsters/trappr.png.bin"
.org 0x2D8000
Monster_Elice:
.incbin "../../build/gfx/monsters/elice.png.bin"
.org 0x2D8382
Monster_Flower:
.incbin "../../build/gfx/monsters/flower.png.bin"
.org 0x2D867B
Monster_Pengun:
.incbin "../../build/gfx/monsters/pengun.png.bin"
.org 0x2D8916
Monster_Feyt:
.incbin "../../build/gfx/monsters/feyt.png.bin"
.org 0x2D8BBB
Monster_Fishen:
.incbin "../../build/gfx/monsters/fishen.png.bin"
.org 0x2D8EE9
Monster_Zhuga:
.incbin "../../build/gfx/monsters/zhuga.png.bin"
.org 0x2D926F
Monster_Zhaga:
.incbin "../../build/gfx/monsters/zhaga.png.bin"
.org 0x2D961D
Monster_Smoky:
.incbin "../../build/gfx/monsters/smoky.png.bin"
.org 0x2D998B
Monster_Balrok:
.incbin "../../build/gfx/monsters/balrok.png.bin"
.org 0x2D9DD5
Monster_Fenril:
.incbin "../../build/gfx/monsters/fenril.png.bin"
.org 0x2DA1F6
Monster_Neptun:
.incbin "../../build/gfx/monsters/neptun.png.bin"
.org 0x2DA6BC
Monster_Oberon:
.incbin "../../build/gfx/monsters/oberon.png.bin"
.org 0x2DAB0B
Monster_Domino:
.incbin "../../build/gfx/monsters/domino.png.bin"
.org 0x2DB097
MonsterPalettes:
.incbin "../../build/gfx/monsters/palettes.bin"
.org 0x2DB37F
Pal_2DB37F:
.incbin "../../build/gfx/pal/2DB37F.pal.bin"
.org 0x2DBA4F
Map_2DBA4F:
.incbin "../../build/gfx/maps/2DBA4F.tilemap.bin"
.org 0x2DC0C7
Gfx_2DC0C7:
.incbin "../../build/gfx/tiles/2DC0C7.png.bin"
.org 0x2DD54D
Pal_2DD54D:
.incbin "../../build/gfx/pal/2DD54D.pal.bin"
.org 0x2DD55D
MonoPal_2DD55D:
.incbin "../../build/gfx/pal/2DD55D.pal4.bin"
.org 0x2DD565
Map_2DD565:
.incbin "../../build/gfx/maps/2DD565.tilemap.bin"
.org 0x2DD7BF
Map_2DD7BF:
.incbin "../../build/gfx/maps/2DD7BF.tilemap.bin"
.org 0x2DDAB9
Gfx_2DDAB9:
.incbin "../../build/gfx/tiles/2DDAB9.png.bin"
.org 0x2DE017
Pal_2DE017:
.incbin "../../build/gfx/pal/2DE017.pal.bin"
.org 0x2DE027
MonoPal_2DE027:
.incbin "../../build/gfx/pal/2DE027.pal4.bin"
.org 0x2DE033
Map_2DE033:
.incbin "../../build/gfx/maps/2DE033.tilemap.bin"
.org 0x2DE32D
Map_2DE32D:
.incbin "../../build/gfx/maps/2DE32D.tilemap.bin"
.org 0x2DE3A7
Gfx_2DE3A7:
.incbin "../../build/gfx/tiles/2DE3A7.png.bin"
.org 0x2DE648
Pal_2DE648:
.incbin "../../build/gfx/pal/2DE648.pal.bin"
.org 0x2DE660
Map_2DE660:
.incbin "../../build/gfx/maps/2DE660.tilemap.bin"
.org 0x2DEB58
Gfx_2DEB58:
.incbin "../../build/gfx/tiles/2DEB58.png.bin"
.org 0x2DF63C
Pal_2DF63C:
.incbin "../../build/gfx/pal/2DF63C.pal.bin"
.org 0x2DF674
Map_2DF674:
.incbin "../../build/gfx/maps/2DF674.tilemap.bin"
.org 0x2DF96E
Map_2DF96E:
.incbin "../../build/gfx/maps/2DF96E.tilemap.bin"
.org 0x2DFC68
Map_2DFC68:
.incbin "../../build/gfx/maps/2DFC68.tilemap.bin"
.org 0x2DFF62
Gfx_2DFF62:
.incbin "../../build/gfx/tiles/2DFF62.png.bin"
.org 0x2E012C
Map_2E012C:
.incbin "../../build/gfx/maps/2E012C.tilemap.bin"
.org 0x2E0426
Gfx_2E0426:
.incbin "../../build/gfx/tiles/2E0426.png.bin"
.org 0x2E1008
Map_2E1008:
.incbin "../../build/gfx/maps/2E1008.tilemap.bin"
.org 0x2E1302
Gfx_2E1302:
.incbin "../../build/gfx/tiles/2E1302.png.bin"
.org 0x2E2025
Map_2E2025:
.incbin "../../build/gfx/maps/2E2025.tilemap.bin"
.org 0x2E231F
Gfx_2E231F:
.incbin "../../build/gfx/tiles/2E231F.png.bin"
.org 0x2E2B88
Map_2E2B88:
.incbin "../../build/gfx/maps/2E2B88.tilemap.bin"
.org 0x2E2E82
Gfx_2E2E82:
.incbin "../../build/gfx/tiles/2E2E82.png.bin"
.org 0x2E3616
Map_2E3616:
.incbin "../../build/gfx/maps/2E3616.tilemap.bin"
.org 0x2E3910
Map_2E3910:
.incbin "../../build/gfx/maps/2E3910.tilemap.bin"
.org 0x2E3C0A
Gfx_2E3C0A:
.incbin "../../build/gfx/tiles/2E3C0A.png.bin"
.org 0x2E3F68
Pal_2E3F68:
.incbin "../../build/gfx/pal/2E3F68.pal.bin"
.org 0x2E3FB0
MonoPal_2E3FB0:
.incbin "../../build/gfx/pal/2E3FB0.pal4.bin"
.org 0x2E3FB8
Map_2E3FB8:
.incbin "../../build/gfx/maps/2E3FB8.tilemap.bin"
.org 0x2E405A
Map_2E405A:
.incbin "../../build/gfx/maps/2E405A.tilemap.bin"
.org 0x2E40FC
Map_2E40FC:
.incbin "../../build/gfx/maps/2E40FC.tilemap.bin"
.org 0x2E419E
Map_2E419E:
.incbin "../../build/gfx/maps/2E419E.tilemap.bin"
.org 0x2E4240
Map_2E4240:
.incbin "../../build/gfx/maps/2E4240.tilemap.bin"
.org 0x2E42CE
Gfx_2E42CE:
.incbin "../../build/gfx/tiles/2E42CE.png.bin"
.org 0x2E4D3F
Pal_2E4D3F:
.incbin "../../build/gfx/pal/2E4D3F.pal.bin"
.org 0x2E4D8F
MonoPal_2E4D8F:
.incbin "../../build/gfx/pal/2E4D8F.pal4.bin"
.org 0x2E4D97
Map_2E4D97:
.incbin "../../build/gfx/maps/2E4D97.tilemap.bin"
.org 0x2E4EE3
Map_2E4EE3:
.incbin "../../build/gfx/maps/2E4EE3.tilemap.bin"
.org 0x2E513D
Map_2E513D:
.incbin "../../build/gfx/maps/2E513D.tilemap.bin"
.org 0x2E5397
Map_2E5397:
.incbin "../../build/gfx/maps/2E5397.tilemap.bin"
.org 0x2E54E3
Map_2E54E3:
.incbin "../../build/gfx/maps/2E54E3.tilemap.bin"
.org 0x2E573D
Map_2E573D:
.incbin "../../build/gfx/maps/2E573D.tilemap.bin"
.org 0x2E5997
Gfx_2E5997:
.incbin "../../build/gfx/tiles/2E5997.png.bin"
.org 0x2E6618
Pal_2E6618:
.incbin "../../build/gfx/pal/2E6618.pal.bin"
.org 0x2E6698
MonoPal_2E6698:
.incbin "../../build/gfx/pal/2E6698.pal4.bin"
.org 0x2E699A
Map_2E699A:
.incbin "../../build/gfx/maps/2E699A.tilemap.bin"
.org 0x2E6C94
Gfx_2E6C94:
.incbin "../../build/gfx/tiles/2E6C94.png.bin"
.org 0x2E766D
Pal_2E766D:
.incbin "../../build/gfx/pal/2E766D.pal.bin"
.org 0x2E76DD
Map_2E76DD:
.incbin "../../build/gfx/maps/2E76DD.tilemap.bin"
.org 0x2E79D7
Gfx_2E79D7:
.incbin "../../build/gfx/tiles/2E79D7.png.bin"
