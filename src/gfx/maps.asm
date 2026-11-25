; gfx/maps.asm: tile maps (DrawTilemap), in ROM order. Each keeps its address in its own section;
; the included product says how the Makefile builds it (see README).

; [code+play] picture 0x23 (talk row picture 35, "At the capital of Rhafiace..."): a white colonnade before a palace, mono (was Map_2844CC)
d_2844CC	section	romdata abs=0x2844CC
RhafiacePictureMonoMap:
$include "build/src/gfx/maps/2844CC.tilemap.asm"	; src/gfx/maps/2844CC.tilemap
; [code] picture 0x24 (PlacePortraits 36, the Pub), mono (was Map_284F18)
d_284F18	section	romdata abs=0x284F18
PubPictureMonoMap:
$include "build/src/gfx/maps/284F18.tilemap.asm"	; src/gfx/maps/284F18.tilemap
; [code] picture 0x25 (PlacePortraits 37, the Shop; ShopMenu), mono (was Map_285782)
d_285782	section	romdata abs=0x285782
ShopPictureMonoMap:
$include "build/src/gfx/maps/285782.tilemap.asm"	; src/gfx/maps/285782.tilemap
; [code] pictures 0x26 / 0x27 (PlacePortraits 39, the Square), mono (was Map_285F39)
d_285F39	section	romdata abs=0x285F39
SquarePictureMonoMap:
$include "build/src/gfx/maps/285F39.tilemap.asm"	; src/gfx/maps/285F39.tilemap
; [code] picture 0x28 (the town street, "Where do you go?"), mono (was Map_2868DF)
d_2868DF	section	romdata abs=0x2868DF
StreetPictureMonoMap:
$include "build/src/gfx/maps/2868DF.tilemap.asm"	; src/gfx/maps/2868DF.tilemap
; [code] picture 0x29 (SetupArenaScreen, the arena), mono (was Map_2871EE)
d_2871EE	section	romdata abs=0x2871EE
ArenaPictureMonoMap:
$include "build/src/gfx/maps/2871EE.tilemap.asm"	; src/gfx/maps/2871EE.tilemap
; [code] MainMenuGraphics (mono units): left half of the main menu background (DrawMainMenuSplit)
; [code+play] picture 0x2B: left half of the rusty metal gate (ArenaPreDuelGate on SCR1; the main menu door), mono (was Map_2876C4)
d_2876C4	section	romdata abs=0x2876C4
GateLeftPictureMonoMap:
$include "build/src/gfx/maps/2876C4.tilemap.asm"	; src/gfx/maps/2876C4.tilemap
; [code] MainMenuGraphics (mono units): right half of the main menu background (DrawMainMenuSplit)
; [code+play] picture 0x2A: right half of the rusty metal gate (ArenaPreDuelGate on SCR2; the main menu door), mono (was Map_287ED4)
d_287ED4	section	romdata abs=0x287ED4
GateRightPictureMonoMap:
$include "build/src/gfx/maps/287ED4.tilemap.asm"	; src/gfx/maps/287ED4.tilemap
; [code] picture 0x2C (PlacePortraits 44, the Forest), mono (was Map_2884F7)
d_2884F7	section	romdata abs=0x2884F7
ForestPictureMonoMap:
$include "build/src/gfx/maps/2884F7.tilemap.asm"	; src/gfx/maps/2884F7.tilemap
; [code] picture 0x2D (PlacePortraits 45, the Spring), mono (was Map_2890CD)
d_2890CD	section	romdata abs=0x2890CD
SpringPictureMonoMap:
$include "build/src/gfx/maps/2890CD.tilemap.asm"	; src/gfx/maps/2890CD.tilemap
; [code+play] picture 0x2E (StorySceneUnitice, CreditsScreen): a blue planet in space, mono (was Map_289C9E)
d_289C9E	section	romdata abs=0x289C9E
StoryPlanetPictureMonoMap:
$include "build/src/gfx/maps/289C9E.tilemap.asm"	; src/gfx/maps/289C9E.tilemap
; [code] picture 0x2F (PlacePortraits 47, D-town), mono (was Map_28A639)
d_28A639	section	romdata abs=0x28A639
DTownPictureMonoMap:
$include "build/src/gfx/maps/28A639.tilemap.asm"	; src/gfx/maps/28A639.tilemap
; [code] picture 0x30 = 0x30 + DUNGEON_ID - 1 for dungeon 1, Forest of Verdure (DrawWorldMapPortrait), mono (was Map_28B074)
d_28B074	section	romdata abs=0x28B074
ForestOfVerdurePictureMonoMap:
$include "build/src/gfx/maps/28B074.tilemap.asm"	; src/gfx/maps/28B074.tilemap
; [code] picture 0x31, dungeon 2 Corridor of Blue (DrawWorldMapPortrait), mono (was Map_28BFE7)
d_28BFE7	section	romdata abs=0x28BFE7
CorridorOfBluePictureMonoMap:
$include "build/src/gfx/maps/28BFE7.tilemap.asm"	; src/gfx/maps/28BFE7.tilemap
; [code] picture 0x32, dungeon 3 Ruins of Wind (DrawWorldMapPortrait), mono (was Map_28D0CA)
d_28D0CA	section	romdata abs=0x28D0CA
RuinsOfWindPictureMonoMap:
$include "build/src/gfx/maps/28D0CA.tilemap.asm"	; src/gfx/maps/28D0CA.tilemap
; [code] picture 0x33, dungeon 4 Maze of Stone (DrawWorldMapPortrait), mono (was Map_28DCAA)
d_28DCAA	section	romdata abs=0x28DCAA
MazeOfStonePictureMonoMap:
$include "build/src/gfx/maps/28DCAA.tilemap.asm"	; src/gfx/maps/28DCAA.tilemap
; [code] picture 0x34 (ArenaShowPicture with CMineText, the Crystal Mine), mono (was Map_28ECFC)
d_28ECFC	section	romdata abs=0x28ECFC
CrystalMinePictureMonoMap:
$include "build/src/gfx/maps/28ECFC.tilemap.asm"	; src/gfx/maps/28ECFC.tilemap
; [code] picture 0x35 (PlacePortraits 53, the Works; DrawPortraitScr1), mono (was Map_28F590)
d_28F590	section	romdata abs=0x28F590
WorksPictureMonoMap:
$include "build/src/gfx/maps/28F590.tilemap.asm"	; src/gfx/maps/28F590.tilemap
; [play] picture 0x36: ruins seen from the ground, the Protector's vision in the Works (WorksProtectorScene), mono (was Map_28FFA0)
d_28FFA0	section	romdata abs=0x28FFA0
RuinsVisionPictureMonoMap:
$include "build/src/gfx/maps/28FFA0.tilemap.asm"	; src/gfx/maps/28FFA0.tilemap
; [code] picture 0x37 (StorySceneTheEnd, "It was the end..."), mono (was Map_290C6F)
d_290C6F	section	romdata abs=0x290C6F
TheEndPictureMonoMap:
$include "build/src/gfx/maps/290C6F.tilemap.asm"	; src/gfx/maps/290C6F.tilemap
; [play] picture 0x38: Satanachia's UNITRON, full screen in the Rank CS duel 6 transmission, mono (was Map_2916F0)
d_2916F0	section	romdata abs=0x2916F0
SatanachiaUnitronPictureMonoMap:
$include "build/src/gfx/maps/2916F0.tilemap.asm"	; src/gfx/maps/2916F0.tilemap
d_292763	section	romdata abs=0x292763
Map_292763:
$include "build/src/gfx/maps/292763.tilemap.asm"	; src/gfx/maps/292763.tilemap
d_29383A	section	romdata abs=0x29383A
Map_29383A:
$include "build/src/gfx/maps/29383A.tilemap.asm"	; src/gfx/maps/29383A.tilemap
d_293E9F	section	romdata abs=0x293E9F
Map_293E9F:
$include "build/src/gfx/maps/293E9F.tilemap.asm"	; src/gfx/maps/293E9F.tilemap
d_2945DD	section	romdata abs=0x2945DD
Map_2945DD:
$include "build/src/gfx/maps/2945DD.tilemap.asm"	; src/gfx/maps/2945DD.tilemap
d_294CAD	section	romdata abs=0x294CAD
Map_294CAD:
$include "build/src/gfx/maps/294CAD.tilemap.asm"	; src/gfx/maps/294CAD.tilemap
d_295387	section	romdata abs=0x295387
Map_295387:
$include "build/src/gfx/maps/295387.tilemap.asm"	; src/gfx/maps/295387.tilemap
d_295882	section	romdata abs=0x295882
Map_295882:
$include "build/src/gfx/maps/295882.tilemap.asm"	; src/gfx/maps/295882.tilemap
d_295F29	section	romdata abs=0x295F29
Map_295F29:
$include "build/src/gfx/maps/295F29.tilemap.asm"	; src/gfx/maps/295F29.tilemap
d_296EC1	section	romdata abs=0x296EC1
Map_296EC1:
$include "build/src/gfx/maps/296EC1.tilemap.asm"	; src/gfx/maps/296EC1.tilemap
; [code] picture 0x3C (DrawWorldMapPortrait A = 1, WorldMapOpen; also StorySceneUnitice), mono (was Map_297EEF)
d_297EEF	section	romdata abs=0x297EEF
WorldMapPictureMonoMap:
$include "build/src/gfx/maps/297EEF.tilemap.asm"	; src/gfx/maps/297EEF.tilemap
d_299204	section	romdata abs=0x299204
Map_299204:
$include "build/src/gfx/maps/299204.tilemap.asm"	; src/gfx/maps/299204.tilemap
; [code+play] picture 0x23 (talk row picture 35, "At the capital of Rhafiace..."): a white colonnade before a palace (was Map_2994AA)
d_2994AA	section	romdata abs=0x2994AA
RhafiacePictureMap:
$include "build/src/gfx/maps/2994AA.tilemap.asm"	; src/gfx/maps/2994AA.tilemap
; [code] picture 0x24 (PlacePortraits 36, the Pub) (was Map_299F38)
d_299F38	section	romdata abs=0x299F38
PubPictureMap:
$include "build/src/gfx/maps/299F38.tilemap.asm"	; src/gfx/maps/299F38.tilemap
; [code] picture 0x25 (PlacePortraits 37, the Shop; ShopMenu) (was Map_29A86A)
d_29A86A	section	romdata abs=0x29A86A
ShopPictureMap:
$include "build/src/gfx/maps/29A86A.tilemap.asm"	; src/gfx/maps/29A86A.tilemap
; [code] pictures 0x26 / 0x27 (PlacePortraits 39, the Square) (was Map_29B048)
d_29B048	section	romdata abs=0x29B048
SquarePictureMap:
$include "build/src/gfx/maps/29B048.tilemap.asm"	; src/gfx/maps/29B048.tilemap
; [code] picture 0x28 (the town street, "Where do you go?") (was Map_29BA07)
d_29BA07	section	romdata abs=0x29BA07
StreetPictureMap:
$include "build/src/gfx/maps/29BA07.tilemap.asm"	; src/gfx/maps/29BA07.tilemap
; [code] picture 0x29 (SetupArenaScreen, the arena) (was Map_29C363)
d_29C363	section	romdata abs=0x29C363
ArenaPictureMap:
$include "build/src/gfx/maps/29C363.tilemap.asm"	; src/gfx/maps/29C363.tilemap
; [code] MainMenuGraphics (colour): left half of the main menu door picture (SCR1, DrawMainMenuSplit); [play] seen in play: a rusty brown metal door
; [code+play] picture 0x2B: left half of the rusty metal gate (ArenaPreDuelGate on SCR1; the main menu door) (was Map_29C88F)
d_29C88F	section	romdata abs=0x29C88F
GateLeftPictureMap:
$include "build/src/gfx/maps/29C88F.tilemap.asm"	; src/gfx/maps/29C88F.tilemap
; [code] MainMenuGraphics (colour): right half of the main menu door picture (SCR1, DrawMainMenuSplit); [play] seen in play: a rusty brown metal door
; [code+play] picture 0x2A: right half of the rusty metal gate (ArenaPreDuelGate on SCR2; the main menu door) (was Map_29D39A)
d_29D39A	section	romdata abs=0x29D39A
GateRightPictureMap:
$include "build/src/gfx/maps/29D39A.tilemap.asm"	; src/gfx/maps/29D39A.tilemap
; [code] picture 0x2C (PlacePortraits 44, the Forest) (was Map_29DE4D)
d_29DE4D	section	romdata abs=0x29DE4D
ForestPictureMap:
$include "build/src/gfx/maps/29DE4D.tilemap.asm"	; src/gfx/maps/29DE4D.tilemap
; [code] picture 0x2D (PlacePortraits 45, the Spring) (was Map_29EA29)
d_29EA29	section	romdata abs=0x29EA29
SpringPictureMap:
$include "build/src/gfx/maps/29EA29.tilemap.asm"	; src/gfx/maps/29EA29.tilemap
; [code+play] picture 0x2E (StorySceneUnitice, CreditsScreen): a blue planet in space (was Map_29F665)
d_29F665	section	romdata abs=0x29F665
StoryPlanetPictureMap:
$include "build/src/gfx/maps/29F665.tilemap.asm"	; src/gfx/maps/29F665.tilemap
; [code] picture 0x2F (PlacePortraits 47, D-town) (was Map_2A0047)
d_2A0047	section	romdata abs=0x2A0047
DTownPictureMap:
$include "build/src/gfx/maps/2A0047.tilemap.asm"	; src/gfx/maps/2A0047.tilemap
; [code] picture 0x30 = 0x30 + DUNGEON_ID - 1 for dungeon 1, Forest of Verdure (DrawWorldMapPortrait) (was Map_2A0AC7)
d_2A0AC7	section	romdata abs=0x2A0AC7
ForestOfVerdurePictureMap:
$include "build/src/gfx/maps/2A0AC7.tilemap.asm"	; src/gfx/maps/2A0AC7.tilemap
; [code] picture 0x31, dungeon 2 Corridor of Blue (DrawWorldMapPortrait) (was Map_2A1B82)
d_2A1B82	section	romdata abs=0x2A1B82
CorridorOfBluePictureMap:
$include "build/src/gfx/maps/2A1B82.tilemap.asm"	; src/gfx/maps/2A1B82.tilemap
; [code] picture 0x32, dungeon 3 Ruins of Wind (DrawWorldMapPortrait) (was Map_2A2B4C)
d_2A2B4C	section	romdata abs=0x2A2B4C
RuinsOfWindPictureMap:
$include "build/src/gfx/maps/2A2B4C.tilemap.asm"	; src/gfx/maps/2A2B4C.tilemap
; [code] picture 0x33, dungeon 4 Maze of Stone (DrawWorldMapPortrait) (was Map_2A37D7)
d_2A37D7	section	romdata abs=0x2A37D7
MazeOfStonePictureMap:
$include "build/src/gfx/maps/2A37D7.tilemap.asm"	; src/gfx/maps/2A37D7.tilemap
; [code] picture 0x34 (ArenaShowPicture with CMineText, the Crystal Mine) (was Map_2A4873)
d_2A4873	section	romdata abs=0x2A4873
CrystalMinePictureMap:
$include "build/src/gfx/maps/2A4873.tilemap.asm"	; src/gfx/maps/2A4873.tilemap
; [code] picture 0x35 (PlacePortraits 53, the Works; DrawPortraitScr1) (was Map_2A5242)
d_2A5242	section	romdata abs=0x2A5242
WorksPictureMap:
$include "build/src/gfx/maps/2A5242.tilemap.asm"	; src/gfx/maps/2A5242.tilemap
; [play] picture 0x36: ruins seen from the ground, the Protector's vision in the Works (WorksProtectorScene) (was Map_2A5C7B)
d_2A5C7B	section	romdata abs=0x2A5C7B
RuinsVisionPictureMap:
$include "build/src/gfx/maps/2A5C7B.tilemap.asm"	; src/gfx/maps/2A5C7B.tilemap
; [code] picture 0x37 (StorySceneTheEnd, "It was the end...") (was Map_2A69B2)
d_2A69B2	section	romdata abs=0x2A69B2
TheEndPictureMap:
$include "build/src/gfx/maps/2A69B2.tilemap.asm"	; src/gfx/maps/2A69B2.tilemap
; [play] picture 0x38: Satanachia's UNITRON, full screen in the Rank CS duel 6 transmission (was Map_2A746F)
d_2A746F	section	romdata abs=0x2A746F
SatanachiaUnitronPictureMap:
$include "build/src/gfx/maps/2A746F.tilemap.asm"	; src/gfx/maps/2A746F.tilemap
d_2A852B	section	romdata abs=0x2A852B
Map_2A852B:
$include "build/src/gfx/maps/2A852B.tilemap.asm"	; src/gfx/maps/2A852B.tilemap
d_2A964B	section	romdata abs=0x2A964B
Map_2A964B:
$include "build/src/gfx/maps/2A964B.tilemap.asm"	; src/gfx/maps/2A964B.tilemap
d_2A9CFD	section	romdata abs=0x2A9CFD
Map_2A9CFD:
$include "build/src/gfx/maps/2A9CFD.tilemap.asm"	; src/gfx/maps/2A9CFD.tilemap
d_2AA482	section	romdata abs=0x2AA482
Map_2AA482:
$include "build/src/gfx/maps/2AA482.tilemap.asm"	; src/gfx/maps/2AA482.tilemap
d_2AABB4	section	romdata abs=0x2AABB4
Map_2AABB4:
$include "build/src/gfx/maps/2AABB4.tilemap.asm"	; src/gfx/maps/2AABB4.tilemap
d_2AB2DF	section	romdata abs=0x2AB2DF
Map_2AB2DF:
$include "build/src/gfx/maps/2AB2DF.tilemap.asm"	; src/gfx/maps/2AB2DF.tilemap
d_2AB81D	section	romdata abs=0x2AB81D
Map_2AB81D:
$include "build/src/gfx/maps/2AB81D.tilemap.asm"	; src/gfx/maps/2AB81D.tilemap
d_2ABF2D	section	romdata abs=0x2ABF2D
Map_2ABF2D:
$include "build/src/gfx/maps/2ABF2D.tilemap.asm"	; src/gfx/maps/2ABF2D.tilemap
d_2ACF0C	section	romdata abs=0x2ACF0C
Map_2ACF0C:
$include "build/src/gfx/maps/2ACF0C.tilemap.asm"	; src/gfx/maps/2ACF0C.tilemap
; [code] picture 0x3C (DrawWorldMapPortrait A = 1, WorldMapOpen; also StorySceneUnitice) (was Map_2ADF96)
d_2ADF96	section	romdata abs=0x2ADF96
WorldMapPictureMap:
$include "build/src/gfx/maps/2ADF96.tilemap.asm"	; src/gfx/maps/2ADF96.tilemap
d_2AF404	section	romdata abs=0x2AF404
Map_2AF404:
$include "build/src/gfx/maps/2AF404.tilemap.asm"	; src/gfx/maps/2AF404.tilemap
; [code] portraits 0x00/0x01, talk portrait 1 + race/gender index 0 = Human male (DrawTalkSpeakerPlayer, DrawArenaParticipants); [play] same face as Select Player portrait 0x0B, mono (was Map_2AF662)
d_2AF662	section	romdata abs=0x2AF662
TalkHumanMalePortraitMonoMap:
$include "build/src/gfx/maps/2AF662.tilemap.asm"	; src/gfx/maps/2AF662.tilemap
; [code] portrait 0x02, talk portrait 1 + race/gender index 1 = Human female; [play] same face as portrait 0x0C, mono (was Map_2AFB5D)
d_2AFB5D	section	romdata abs=0x2AFB5D
TalkHumanFemalePortraitMonoMap:
$include "build/src/gfx/maps/2AFB5D.tilemap.asm"	; src/gfx/maps/2AFB5D.tilemap
; [code] portrait 0x03, talk portrait 1 + race/gender index 2 = Forester male, mono (was Map_2B007D)
d_2B007D	section	romdata abs=0x2B007D
TalkForesterMalePortraitMonoMap:
$include "build/src/gfx/maps/2B007D.tilemap.asm"	; src/gfx/maps/2B007D.tilemap
; [code] portrait 0x04, talk portrait 1 + race/gender index 3 = Forester female, mono (was Map_2B0686)
d_2B0686	section	romdata abs=0x2B0686
TalkForesterFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B0686.tilemap.asm"	; src/gfx/maps/2B0686.tilemap
; [code] portrait 0x05, talk portrait 1 + race/gender index 4 = Mariner male, mono (was Map_2B0C31)
d_2B0C31	section	romdata abs=0x2B0C31
TalkMarinerMalePortraitMonoMap:
$include "build/src/gfx/maps/2B0C31.tilemap.asm"	; src/gfx/maps/2B0C31.tilemap
; [code] portrait 0x06, talk portrait 1 + race/gender index 5 = Mariner female, mono (was Map_2B12BA)
d_2B12BA	section	romdata abs=0x2B12BA
TalkMarinerFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B12BA.tilemap.asm"	; src/gfx/maps/2B12BA.tilemap
; [code] portrait 0x07, talk portrait 1 + race/gender index 6 = Birdian male, mono (was Map_2B1A45)
d_2B1A45	section	romdata abs=0x2B1A45
TalkBirdianMalePortraitMonoMap:
$include "build/src/gfx/maps/2B1A45.tilemap.asm"	; src/gfx/maps/2B1A45.tilemap
; [code] portrait 0x08, talk portrait 1 + race/gender index 7 = Birdian female, mono (was Map_2B2168)
d_2B2168	section	romdata abs=0x2B2168
TalkBirdianFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B2168.tilemap.asm"	; src/gfx/maps/2B2168.tilemap
; [code] portrait 0x09, talk portrait 1 + race/gender index 8 = Lizardman male; [play] a red lizardman, as portrait 0x13, mono (was Map_2B2A2A)
d_2B2A2A	section	romdata abs=0x2B2A2A
TalkLizardmanMalePortraitMonoMap:
$include "build/src/gfx/maps/2B2A2A.tilemap.asm"	; src/gfx/maps/2B2A2A.tilemap
; [code] portrait 0x0A, talk portrait 1 + race/gender index 9 = Lizardman female, mono (was Map_2B30DC)
d_2B30DC	section	romdata abs=0x2B30DC
TalkLizardmanFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B30DC.tilemap.asm"	; src/gfx/maps/2B30DC.tilemap
; [code] portrait 0x0B = wPlayerRace 1 + 0x0A (SelectPlayerScreen, NameEntryScreen, Works): Human male, mono (was Map_2B35C5)
d_2B35C5	section	romdata abs=0x2B35C5
SelectHumanMalePortraitMonoMap:
$include "build/src/gfx/maps/2B35C5.tilemap.asm"	; src/gfx/maps/2B35C5.tilemap
; [code] portrait 0x0C = wPlayerRace 2 + 0x0A (Select Player): Human female, mono (was Map_2B3950)
d_2B3950	section	romdata abs=0x2B3950
SelectHumanFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B3950.tilemap.asm"	; src/gfx/maps/2B3950.tilemap
; [code] portrait 0x0D = wPlayerRace 3 + 0x0A (Select Player): Forester male, mono (was Map_2B3CDD)
d_2B3CDD	section	romdata abs=0x2B3CDD
SelectForesterMalePortraitMonoMap:
$include "build/src/gfx/maps/2B3CDD.tilemap.asm"	; src/gfx/maps/2B3CDD.tilemap
; [code] portrait 0x0E = wPlayerRace 4 + 0x0A (Select Player): Forester female, mono (was Map_2B40AA)
d_2B40AA	section	romdata abs=0x2B40AA
SelectForesterFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B40AA.tilemap.asm"	; src/gfx/maps/2B40AA.tilemap
; [code] portrait 0x0F = wPlayerRace 5 + 0x0A (Select Player): Mariner male, mono (was Map_2B447F)
d_2B447F	section	romdata abs=0x2B447F
SelectMarinerMalePortraitMonoMap:
$include "build/src/gfx/maps/2B447F.tilemap.asm"	; src/gfx/maps/2B447F.tilemap
; [code] portrait 0x10 = wPlayerRace 6 + 0x0A (Select Player): Mariner female, mono (was Map_2B4862)
d_2B4862	section	romdata abs=0x2B4862
SelectMarinerFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B4862.tilemap.asm"	; src/gfx/maps/2B4862.tilemap
; [code] portrait 0x11 = wPlayerRace 7 + 0x0A (Select Player): Birdian male, mono (was Map_2B4C75)
d_2B4C75	section	romdata abs=0x2B4C75
SelectBirdianMalePortraitMonoMap:
$include "build/src/gfx/maps/2B4C75.tilemap.asm"	; src/gfx/maps/2B4C75.tilemap
; [code] portrait 0x12 = wPlayerRace 8 + 0x0A (Select Player): Birdian female, mono (was Map_2B5068)
d_2B5068	section	romdata abs=0x2B5068
SelectBirdianFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B5068.tilemap.asm"	; src/gfx/maps/2B5068.tilemap
; [code] portrait 0x13 = wPlayerRace 9 + 0x0A (Select Player): Lizardman male, mono (was Map_2B5478)
d_2B5478	section	romdata abs=0x2B5478
SelectLizardmanMalePortraitMonoMap:
$include "build/src/gfx/maps/2B5478.tilemap.asm"	; src/gfx/maps/2B5478.tilemap
; [code] portrait 0x14 = wPlayerRace 10 + 0x0A (Select Player): Lizardman female, mono (was Map_2B5827)
d_2B5827	section	romdata abs=0x2B5827
SelectLizardmanFemalePortraitMonoMap:
$include "build/src/gfx/maps/2B5827.tilemap.asm"	; src/gfx/maps/2B5827.tilemap
; [code] portrait 0x15 = talk speaker 21 (NPC name 0 of Jon .. Tetis; the arena scenes' usual cast), mono (was Map_2B5BB8)
d_2B5BB8	section	romdata abs=0x2B5BB8
JonPortraitMonoMap:
$include "build/src/gfx/maps/2B5BB8.tilemap.asm"	; src/gfx/maps/2B5BB8.tilemap
; [code] portrait 0x16 = talk speaker 22, Lily, mono (was Map_2B6134)
d_2B6134	section	romdata abs=0x2B6134
LilyPortraitMonoMap:
$include "build/src/gfx/maps/2B6134.tilemap.asm"	; src/gfx/maps/2B6134.tilemap
; [code] portrait 0x17 = talk speaker 23, Cyrius, mono (was Map_2B6781)
d_2B6781	section	romdata abs=0x2B6781
CyriusPortraitMonoMap:
$include "build/src/gfx/maps/2B6781.tilemap.asm"	; src/gfx/maps/2B6781.tilemap
; [code] portrait 0x18 = talk speaker 24, Galb, mono (was Map_2B6F8F)
d_2B6F8F	section	romdata abs=0x2B6F8F
GalbPortraitMonoMap:
$include "build/src/gfx/maps/2B6F8F.tilemap.asm"	; src/gfx/maps/2B6F8F.tilemap
; [code] portrait 0x19 = talk speaker 25, Lana, mono (was Map_2B74DE)
d_2B74DE	section	romdata abs=0x2B74DE
LanaPortraitMonoMap:
$include "build/src/gfx/maps/2B74DE.tilemap.asm"	; src/gfx/maps/2B74DE.tilemap
; [code] portrait 0x1A = talk speaker 26, Wyse, mono (was Map_2B7B38)
d_2B7B38	section	romdata abs=0x2B7B38
WysePortraitMonoMap:
$include "build/src/gfx/maps/2B7B38.tilemap.asm"	; src/gfx/maps/2B7B38.tilemap
; [code] portrait 0x1B = talk speaker 27, Ziggy, mono (was Map_2B80AD)
d_2B80AD	section	romdata abs=0x2B80AD
ZiggyPortraitMonoMap:
$include "build/src/gfx/maps/2B80AD.tilemap.asm"	; src/gfx/maps/2B80AD.tilemap
; [code] portrait 0x1C = talk speaker 28, Ceus, mono (was Map_2B8673)
d_2B8673	section	romdata abs=0x2B8673
CeusPortraitMonoMap:
$include "build/src/gfx/maps/2B8673.tilemap.asm"	; src/gfx/maps/2B8673.tilemap
; [code] portrait 0x1D = talk speaker 29, Helmut, mono (was Map_2B8D32)
d_2B8D32	section	romdata abs=0x2B8D32
HelmutPortraitMonoMap:
$include "build/src/gfx/maps/2B8D32.tilemap.asm"	; src/gfx/maps/2B8D32.tilemap
; [code] portrait 0x1E = talk speaker 30, Alda, mono (was Map_2B923B)
d_2B923B	section	romdata abs=0x2B923B
AldaPortraitMonoMap:
$include "build/src/gfx/maps/2B923B.tilemap.asm"	; src/gfx/maps/2B923B.tilemap
; [code] portrait 0x1F = talk speaker 31, Camil, mono (was Map_2B9826)
d_2B9826	section	romdata abs=0x2B9826
CamilPortraitMonoMap:
$include "build/src/gfx/maps/2B9826.tilemap.asm"	; src/gfx/maps/2B9826.tilemap
; [code] portrait 0x20 = talk speaker 32, Meese, mono (was Map_2B9F2E)
d_2B9F2E	section	romdata abs=0x2B9F2E
MeesePortraitMonoMap:
$include "build/src/gfx/maps/2B9F2E.tilemap.asm"	; src/gfx/maps/2B9F2E.tilemap
; [code] portrait 0x21 = talk speaker 33, Colla, mono (was Map_2BA604)
d_2BA604	section	romdata abs=0x2BA604
CollaPortraitMonoMap:
$include "build/src/gfx/maps/2BA604.tilemap.asm"	; src/gfx/maps/2BA604.tilemap
; [code] portrait 0x22 = talk speaker 34, Tetis, mono (was Map_2BAB91)
d_2BAB91	section	romdata abs=0x2BAB91
TetisPortraitMonoMap:
$include "build/src/gfx/maps/2BAB91.tilemap.asm"	; src/gfx/maps/2BAB91.tilemap
; [code] portraits 0x00/0x01, talk portrait 1 + race/gender index 0 = Human male (DrawTalkSpeakerPlayer, DrawArenaParticipants); [play] same face as Select Player portrait 0x0B (was Map_2BB40F)
d_2BB40F	section	romdata abs=0x2BB40F
TalkHumanMalePortraitMap:
$include "build/src/gfx/maps/2BB40F.tilemap.asm"	; src/gfx/maps/2BB40F.tilemap
; [code] portrait 0x02, talk portrait 1 + race/gender index 1 = Human female; [play] same face as portrait 0x0C (was Map_2BB962)
d_2BB962	section	romdata abs=0x2BB962
TalkHumanFemalePortraitMap:
$include "build/src/gfx/maps/2BB962.tilemap.asm"	; src/gfx/maps/2BB962.tilemap
; [code] portrait 0x03, talk portrait 1 + race/gender index 2 = Forester male (was Map_2BBECB)
d_2BBECB	section	romdata abs=0x2BBECB
TalkForesterMalePortraitMap:
$include "build/src/gfx/maps/2BBECB.tilemap.asm"	; src/gfx/maps/2BBECB.tilemap
; [code] portrait 0x04, talk portrait 1 + race/gender index 3 = Forester female (was Map_2BC51F)
d_2BC51F	section	romdata abs=0x2BC51F
TalkForesterFemalePortraitMap:
$include "build/src/gfx/maps/2BC51F.tilemap.asm"	; src/gfx/maps/2BC51F.tilemap
; [code] portrait 0x05, talk portrait 1 + race/gender index 4 = Mariner male (was Map_2BCB0C)
d_2BCB0C	section	romdata abs=0x2BCB0C
TalkMarinerMalePortraitMap:
$include "build/src/gfx/maps/2BCB0C.tilemap.asm"	; src/gfx/maps/2BCB0C.tilemap
; [code] portrait 0x06, talk portrait 1 + race/gender index 5 = Mariner female (was Map_2BD1E3)
d_2BD1E3	section	romdata abs=0x2BD1E3
TalkMarinerFemalePortraitMap:
$include "build/src/gfx/maps/2BD1E3.tilemap.asm"	; src/gfx/maps/2BD1E3.tilemap
; [code] portrait 0x07, talk portrait 1 + race/gender index 6 = Birdian male (was Map_2BD9B5)
d_2BD9B5	section	romdata abs=0x2BD9B5
TalkBirdianMalePortraitMap:
$include "build/src/gfx/maps/2BD9B5.tilemap.asm"	; src/gfx/maps/2BD9B5.tilemap
; [code] portrait 0x08, talk portrait 1 + race/gender index 7 = Birdian female (was Map_2BE12F)
d_2BE12F	section	romdata abs=0x2BE12F
TalkBirdianFemalePortraitMap:
$include "build/src/gfx/maps/2BE12F.tilemap.asm"	; src/gfx/maps/2BE12F.tilemap
; [code] portrait 0x09, talk portrait 1 + race/gender index 8 = Lizardman male; [play] a red lizardman, as portrait 0x13 (was Map_2BEA3D)
d_2BEA3D	section	romdata abs=0x2BEA3D
TalkLizardmanMalePortraitMap:
$include "build/src/gfx/maps/2BEA3D.tilemap.asm"	; src/gfx/maps/2BEA3D.tilemap
; [code] portrait 0x0A, talk portrait 1 + race/gender index 9 = Lizardman female (was Map_2BF13E)
d_2BF13E	section	romdata abs=0x2BF13E
TalkLizardmanFemalePortraitMap:
$include "build/src/gfx/maps/2BF13E.tilemap.asm"	; src/gfx/maps/2BF13E.tilemap
; [code] portrait 0x0B = wPlayerRace 1 + 0x0A (SelectPlayerScreen, NameEntryScreen, Works): Human male (was Map_2BF660)
d_2BF660	section	romdata abs=0x2BF660
SelectHumanMalePortraitMap:
$include "build/src/gfx/maps/2BF660.tilemap.asm"	; src/gfx/maps/2BF660.tilemap
; [code] portrait 0x0C = wPlayerRace 2 + 0x0A (Select Player): Human female (was Map_2BFA3F)
d_2BFA3F	section	romdata abs=0x2BFA3F
SelectHumanFemalePortraitMap:
$include "build/src/gfx/maps/2BFA3F.tilemap.asm"	; src/gfx/maps/2BFA3F.tilemap
; [code] portrait 0x0D = wPlayerRace 3 + 0x0A (Select Player): Forester male (was Map_2BFE15)
d_2BFE15	section	romdata abs=0x2BFE15
SelectForesterMalePortraitMap:
$include "build/src/gfx/maps/2BFE15.tilemap.asm"	; src/gfx/maps/2BFE15.tilemap
; [code] portrait 0x0E = wPlayerRace 4 + 0x0A (Select Player): Forester female (was Map_2C022F)
d_2C022F	section	romdata abs=0x2C022F
SelectForesterFemalePortraitMap:
$include "build/src/gfx/maps/2C022F.tilemap.asm"	; src/gfx/maps/2C022F.tilemap
; [code] portrait 0x0F = wPlayerRace 5 + 0x0A (Select Player): Mariner male (was Map_2C0646)
d_2C0646	section	romdata abs=0x2C0646
SelectMarinerMalePortraitMap:
$include "build/src/gfx/maps/2C0646.tilemap.asm"	; src/gfx/maps/2C0646.tilemap
; [code] portrait 0x10 = wPlayerRace 6 + 0x0A (Select Player): Mariner female (was Map_2C0A73)
d_2C0A73	section	romdata abs=0x2C0A73
SelectMarinerFemalePortraitMap:
$include "build/src/gfx/maps/2C0A73.tilemap.asm"	; src/gfx/maps/2C0A73.tilemap
; [code] portrait 0x11 = wPlayerRace 7 + 0x0A (Select Player): Birdian male (was Map_2C0ED7)
d_2C0ED7	section	romdata abs=0x2C0ED7
SelectBirdianMalePortraitMap:
$include "build/src/gfx/maps/2C0ED7.tilemap.asm"	; src/gfx/maps/2C0ED7.tilemap
; [code] portrait 0x12 = wPlayerRace 8 + 0x0A (Select Player): Birdian female (was Map_2C130E)
d_2C130E	section	romdata abs=0x2C130E
SelectBirdianFemalePortraitMap:
$include "build/src/gfx/maps/2C130E.tilemap.asm"	; src/gfx/maps/2C130E.tilemap
; [code] portrait 0x13 = wPlayerRace 9 + 0x0A (Select Player): Lizardman male (was Map_2C1766)
d_2C1766	section	romdata abs=0x2C1766
SelectLizardmanMalePortraitMap:
$include "build/src/gfx/maps/2C1766.tilemap.asm"	; src/gfx/maps/2C1766.tilemap
; [code] portrait 0x14 = wPlayerRace 10 + 0x0A (Select Player): Lizardman female (was Map_2C1B5C)
d_2C1B5C	section	romdata abs=0x2C1B5C
SelectLizardmanFemalePortraitMap:
$include "build/src/gfx/maps/2C1B5C.tilemap.asm"	; src/gfx/maps/2C1B5C.tilemap
; [code] portrait 0x15 = talk speaker 21 (NPC name 0 of Jon .. Tetis; the arena scenes' usual cast) (was Map_2C1F37)
d_2C1F37	section	romdata abs=0x2C1F37
JonPortraitMap:
$include "build/src/gfx/maps/2C1F37.tilemap.asm"	; src/gfx/maps/2C1F37.tilemap
; [code] portrait 0x16 = talk speaker 22, Lily (was Map_2C2501)
d_2C2501	section	romdata abs=0x2C2501
LilyPortraitMap:
$include "build/src/gfx/maps/2C2501.tilemap.asm"	; src/gfx/maps/2C2501.tilemap
; [code] portrait 0x17 = talk speaker 23, Cyrius (was Map_2C2B9F)
d_2C2B9F	section	romdata abs=0x2C2B9F
CyriusPortraitMap:
$include "build/src/gfx/maps/2C2B9F.tilemap.asm"	; src/gfx/maps/2C2B9F.tilemap
; [code] portrait 0x18 = talk speaker 24, Galb (was Map_2C33ED)
d_2C33ED	section	romdata abs=0x2C33ED
GalbPortraitMap:
$include "build/src/gfx/maps/2C33ED.tilemap.asm"	; src/gfx/maps/2C33ED.tilemap
; [code] portrait 0x19 = talk speaker 25, Lana (was Map_2C397F)
d_2C397F	section	romdata abs=0x2C397F
LanaPortraitMap:
$include "build/src/gfx/maps/2C397F.tilemap.asm"	; src/gfx/maps/2C397F.tilemap
; [code] portrait 0x1A = talk speaker 26, Wyse (was Map_2C402D)
d_2C402D	section	romdata abs=0x2C402D
WysePortraitMap:
$include "build/src/gfx/maps/2C402D.tilemap.asm"	; src/gfx/maps/2C402D.tilemap
; [code] portrait 0x1B = talk speaker 27, Ziggy (was Map_2C463B)
d_2C463B	section	romdata abs=0x2C463B
ZiggyPortraitMap:
$include "build/src/gfx/maps/2C463B.tilemap.asm"	; src/gfx/maps/2C463B.tilemap
; [code] portrait 0x1C = talk speaker 28, Ceus (was Map_2C4C57)
d_2C4C57	section	romdata abs=0x2C4C57
CeusPortraitMap:
$include "build/src/gfx/maps/2C4C57.tilemap.asm"	; src/gfx/maps/2C4C57.tilemap
; [code] portrait 0x1D = talk speaker 29, Helmut (was Map_2C535C)
d_2C535C	section	romdata abs=0x2C535C
HelmutPortraitMap:
$include "build/src/gfx/maps/2C535C.tilemap.asm"	; src/gfx/maps/2C535C.tilemap
; [code] portrait 0x1E = talk speaker 30, Alda (was Map_2C58B6)
d_2C58B6	section	romdata abs=0x2C58B6
AldaPortraitMap:
$include "build/src/gfx/maps/2C58B6.tilemap.asm"	; src/gfx/maps/2C58B6.tilemap
; [code] portrait 0x1F = talk speaker 31, Camil (was Map_2C5EE4)
d_2C5EE4	section	romdata abs=0x2C5EE4
CamilPortraitMap:
$include "build/src/gfx/maps/2C5EE4.tilemap.asm"	; src/gfx/maps/2C5EE4.tilemap
; [code] portrait 0x20 = talk speaker 32, Meese (was Map_2C663F)
d_2C663F	section	romdata abs=0x2C663F
MeesePortraitMap:
$include "build/src/gfx/maps/2C663F.tilemap.asm"	; src/gfx/maps/2C663F.tilemap
; [code] portrait 0x21 = talk speaker 33, Colla (was Map_2C6D65)
d_2C6D65	section	romdata abs=0x2C6D65
CollaPortraitMap:
$include "build/src/gfx/maps/2C6D65.tilemap.asm"	; src/gfx/maps/2C6D65.tilemap
; [code] portrait 0x22 = talk speaker 34, Tetis (was Map_2C732D)
d_2C732D	section	romdata abs=0x2C732D
TetisPortraitMap:
$include "build/src/gfx/maps/2C732D.tilemap.asm"	; src/gfx/maps/2C732D.tilemap
; [code] DrawBattleScreen when wStatusParalyzed: the status icon at column 0xC row 9 (was Map_2C82DE)
d_2C82DE	section	romdata abs=0x2C82DE
BattleParalyzedIconMap:
$include "build/src/gfx/maps/2C82DE.tilemap.asm"	; src/gfx/maps/2C82DE.tilemap
; [code] DrawBattleScreen when wStatusConfused: the status icon at column 0x12 row 9 (was Map_2C82E8)
d_2C82E8	section	romdata abs=0x2C82E8
BattleConfusedIconMap:
$include "build/src/gfx/maps/2C82E8.tilemap.asm"	; src/gfx/maps/2C82E8.tilemap
; [code] DrawBattleScreen when wStatusEPLeak: the status icon at column 0x10 row 9 (was Map_2C82F2)
d_2C82F2	section	romdata abs=0x2C82F2
BattleEPLeakIconMap:
$include "build/src/gfx/maps/2C82F2.tilemap.asm"	; src/gfx/maps/2C82F2.tilemap
; [code] DrawBattleScreen when wStatusRust: the status icon at column 0xE row 9 (was Map_2C82FC)
d_2C82FC	section	romdata abs=0x2C82FC
BattleRustIconMap:
$include "build/src/gfx/maps/2C82FC.tilemap.asm"	; src/gfx/maps/2C82FC.tilemap
; [code] no reader (no immediate or pointer): four 2x2 maps (u8 w, h + u16 per tile, DrawTilemap format) of
; sheet tiles 0-15 of Gfx_2C8691 (16 tiles), frame n = tiles 4n..4n+3: the frames DrawWorldMapMarker
; draws as sprites with DrawSpriteGrid (tile 0x10 + 4 * frame), which does not read these
d_2C8669	section	romdata abs=0x2C8669
UnusedMap_2C8669:
	db	2,2
	dw	0x0001,0x0002,0x0003,0x0004
d_2C8673	section	romdata abs=0x2C8673
UnusedMap_2C8673:
	db	2,2
	dw	0x0005,0x0006,0x0007,0x0008
d_2C867D	section	romdata abs=0x2C867D
UnusedMap_2C867D:
	db	2,2
	dw	0x0009,0x000A,0x000B,0x000C
d_2C8687	section	romdata abs=0x2C8687
UnusedMap_2C8687:
	db	2,2
	dw	0x000D,0x000E,0x000F,0x0010
; [code] DrawDuelSwordColumn: an 18x5 map drawn one column at a time into SCR1 (colour when wColorFlags
; is not 0, else the next one); DrawDuelLetterColumn: the same for the 10x3 maps into SCR2
; [code] DrawDuelSwordColumn: the 18x5 sword of the "Duel n" title (colour) (was Map_2C87AA)
d_2C87AA	section	romdata abs=0x2C87AA
DuelTitleSwordMap:
$include "build/src/gfx/maps/2C87AA.tilemap.asm"	; src/gfx/maps/2C87AA.tilemap
; [code] DrawDuelSwordColumn: the sword in mono (was Map_2C8860)
d_2C8860	section	romdata abs=0x2C8860
DuelTitleSwordMonoMap:
$include "build/src/gfx/maps/2C8860.tilemap.asm"	; src/gfx/maps/2C8860.tilemap
; [code] DrawDuelLetterColumn: the 10x3 "Duel" letters (colour) (was Map_2C8916)
d_2C8916	section	romdata abs=0x2C8916
DuelTitleWordMap:
$include "build/src/gfx/maps/2C8916.tilemap.asm"	; src/gfx/maps/2C8916.tilemap
; [code] DrawDuelLetterColumn: the "Duel" letters in mono (was Map_2C8954)
d_2C8954	section	romdata abs=0x2C8954
DuelTitleWordMonoMap:
$include "build/src/gfx/maps/2C8954.tilemap.asm"	; src/gfx/maps/2C8954.tilemap
; [code] DrawDuelNumberColor / DrawDuelNumberMono: 6 sprite maps each (DrawSpriteMap), DuelTitleNumber1Map / DuelTitleNumber1MonoMap +
; 10 * task +0x1E
; [code] DrawDuelNumberColor: digit sprite map for duel index 0 ("Duel 1"; + 10 * index) (was Map_2C8992)
d_2C8992	section	romdata abs=0x2C8992
DuelTitleNumber1Map:
$include "build/src/gfx/maps/2C8992.tilemap.asm"	; src/gfx/maps/2C8992.tilemap
; [code] DrawDuelNumberColor, duel index 1 (DuelTitleNumber1Map + 10) (was Map_2C899C)
d_2C899C	section	romdata abs=0x2C899C
DuelTitleNumber2Map:
$include "build/src/gfx/maps/2C899C.tilemap.asm"	; src/gfx/maps/2C899C.tilemap
; [code] DrawDuelNumberColor, duel index 2 (was Map_2C89A6)
d_2C89A6	section	romdata abs=0x2C89A6
DuelTitleNumber3Map:
$include "build/src/gfx/maps/2C89A6.tilemap.asm"	; src/gfx/maps/2C89A6.tilemap
; [code] DrawDuelNumberColor, duel index 3 (was Map_2C89B0)
d_2C89B0	section	romdata abs=0x2C89B0
DuelTitleNumber4Map:
$include "build/src/gfx/maps/2C89B0.tilemap.asm"	; src/gfx/maps/2C89B0.tilemap
; [code] DrawDuelNumberColor, duel index 4 (was Map_2C89BA)
d_2C89BA	section	romdata abs=0x2C89BA
DuelTitleNumber5Map:
$include "build/src/gfx/maps/2C89BA.tilemap.asm"	; src/gfx/maps/2C89BA.tilemap
; [code] DrawDuelNumberColor, duel index 5 (was Map_2C89C4)
d_2C89C4	section	romdata abs=0x2C89C4
DuelTitleNumber6Map:
$include "build/src/gfx/maps/2C89C4.tilemap.asm"	; src/gfx/maps/2C89C4.tilemap
; [code] DrawDuelNumberMono: digit sprite map for duel index 0 (+ 10 * index) (was Map_2C89CE)
d_2C89CE	section	romdata abs=0x2C89CE
DuelTitleNumber1MonoMap:
$include "build/src/gfx/maps/2C89CE.tilemap.asm"	; src/gfx/maps/2C89CE.tilemap
; [code] DrawDuelNumberMono, duel index 1 (was Map_2C89D8)
d_2C89D8	section	romdata abs=0x2C89D8
DuelTitleNumber2MonoMap:
$include "build/src/gfx/maps/2C89D8.tilemap.asm"	; src/gfx/maps/2C89D8.tilemap
; [code] DrawDuelNumberMono, duel index 2 (was Map_2C89E2)
d_2C89E2	section	romdata abs=0x2C89E2
DuelTitleNumber3MonoMap:
$include "build/src/gfx/maps/2C89E2.tilemap.asm"	; src/gfx/maps/2C89E2.tilemap
; [code] DrawDuelNumberMono, duel index 3 (was Map_2C89EC)
d_2C89EC	section	romdata abs=0x2C89EC
DuelTitleNumber4MonoMap:
$include "build/src/gfx/maps/2C89EC.tilemap.asm"	; src/gfx/maps/2C89EC.tilemap
; [code] DrawDuelNumberMono, duel index 4 (was Map_2C89F6)
d_2C89F6	section	romdata abs=0x2C89F6
DuelTitleNumber5MonoMap:
$include "build/src/gfx/maps/2C89F6.tilemap.asm"	; src/gfx/maps/2C89F6.tilemap
; [code] DrawDuelNumberMono, duel index 5 (was Map_2C8A00)
d_2C8A00	section	romdata abs=0x2C8A00
DuelTitleNumber6MonoMap:
$include "build/src/gfx/maps/2C8A00.tilemap.asm"	; src/gfx/maps/2C8A00.tilemap
; [code] NameEntryAddChar (name entry): the blinking cursor sprite, frame by task +0x2A bit 4
; [code] NameEntryAddChar: cursor sprite while task +0x2A bit 4 is clear (was Map_2C8D74)
d_2C8D74	section	romdata abs=0x2C8D74
NameEntryCursorMap:
$include "build/src/gfx/maps/2C8D74.tilemap.asm"	; src/gfx/maps/2C8D74.tilemap
; [code] NameEntryAddChar: cursor sprite while task +0x2A bit 4 is set (was Map_2C8D7E)
d_2C8D7E	section	romdata abs=0x2C8D7E
NameEntryCursorAltMap:
$include "build/src/gfx/maps/2C8D7E.tilemap.asm"	; src/gfx/maps/2C8D7E.tilemap
; [code] IntroCockpitScene: the cockpit picture in colour (wColorFlags bit 4; IntroCockpitMonoMap in mono).
; Its first 8 bytes are also read as the last palette of IntroCockpitPal (LoadPalettes C = 12).
; [code+play] IntroCockpitScene: the cockpit picture in colour (was Map_2DB3D7)
d_2DB3D7	section	romdata abs=0x2DB3D7
IntroCockpitMap:
$include "build/src/gfx/maps/2DB3D7.tilemap.asm"	; src/gfx/maps/2DB3D7.tilemap
; [code] IntroCockpitAnim: the 3 colour frames of the 8x9 helmet animation (IntroCockpitFrames)
; [code] IntroCockpitFrames entry 3 (colour helmet animation) (was Map_2DB899)
d_2DB899	section	romdata abs=0x2DB899
IntroHelmetFrame3Map:
$include "build/src/gfx/maps/2DB899.tilemap.asm"	; src/gfx/maps/2DB899.tilemap
; [code] IntroCockpitFrames entries 2 and 4 (colour helmet animation) (was Map_2DB92B)
d_2DB92B	section	romdata abs=0x2DB92B
IntroHelmetFrame2Map:
$include "build/src/gfx/maps/2DB92B.tilemap.asm"	; src/gfx/maps/2DB92B.tilemap
; [code] IntroCockpitFrames entry 1 (colour helmet animation) (was Map_2DB9BD)
d_2DB9BD	section	romdata abs=0x2DB9BD
IntroHelmetFrame1Map:
$include "build/src/gfx/maps/2DB9BD.tilemap.asm"	; src/gfx/maps/2DB9BD.tilemap
; [code] IntroCockpitScene: the cockpit picture in mono (was Map_2DBA4F)
d_2DBA4F	section	romdata abs=0x2DBA4F
IntroCockpitMonoMap:
$include "build/src/gfx/maps/2DBA4F.tilemap.asm"	; src/gfx/maps/2DBA4F.tilemap
; [code] IntroCockpitAnim: the same 3 frames in mono
; [code] IntroCockpitFramesMono entry 3 (was Map_2DBF11)
d_2DBF11	section	romdata abs=0x2DBF11
IntroHelmetFrame3MonoMap:
$include "build/src/gfx/maps/2DBF11.tilemap.asm"	; src/gfx/maps/2DBF11.tilemap
; [code] IntroCockpitFramesMono entries 2 and 4 (was Map_2DBFA3)
d_2DBFA3	section	romdata abs=0x2DBFA3
IntroHelmetFrame2MonoMap:
$include "build/src/gfx/maps/2DBFA3.tilemap.asm"	; src/gfx/maps/2DBFA3.tilemap
; [code] IntroCockpitFramesMono entry 1 (was Map_2DC035)
d_2DC035	section	romdata abs=0x2DC035
IntroHelmetFrame1MonoMap:
$include "build/src/gfx/maps/2DC035.tilemap.asm"	; src/gfx/maps/2DC035.tilemap
; [code+play] IntroLogoScene: diagonal light stripes swept across SCR1 over the logo (was Map_2DD565)
d_2DD565	section	romdata abs=0x2DD565
YumekoboLogoStripeMap:
$include "build/src/gfx/maps/2DD565.tilemap.asm"	; src/gfx/maps/2DD565.tilemap
; [code+play] IntroLogoScene: the Yumekobo logo on SCR2 (was Map_2DD7BF)
d_2DD7BF	section	romdata abs=0x2DD7BF
YumekoboLogoMap:
$include "build/src/gfx/maps/2DD7BF.tilemap.asm"	; src/gfx/maps/2DD7BF.tilemap
; [code+play] Intro199YearsAgo: "199 years ago" (was Map_2DE033)
d_2DE033	section	romdata abs=0x2DE033
Intro199YearsAgoMap:
$include "build/src/gfx/maps/2DE033.tilemap.asm"	; src/gfx/maps/2DE033.tilemap
; [code+play] Intro199YearsAgoStep: the caption Planet "Elscea" (was Map_2DE32D)
d_2DE32D	section	romdata abs=0x2DE32D
PlanetElsceaCaptionMap:
$include "build/src/gfx/maps/2DE32D.tilemap.asm"	; src/gfx/maps/2DE32D.tilemap
; [code+play] IntroPlanetGraphics: the planet on SCR1 (was Map_2DE660)
d_2DE660	section	romdata abs=0x2DE660
IntroPlanetMap:
$include "build/src/gfx/maps/2DE660.tilemap.asm"	; src/gfx/maps/2DE660.tilemap
; [code] IntroMeteorTask: 3 sprite maps (DrawSpriteMap) through IntroMeteorFrames, frame (n / 2) & 3
; [code] IntroMeteorTask sprite frames 1-2 (IntroMeteorFrames) (was Map_2DE95A)
d_2DE95A	section	romdata abs=0x2DE95A
IntroMeteorFrame1Map:
$include "build/src/gfx/maps/2DE95A.tilemap.asm"	; src/gfx/maps/2DE95A.tilemap
; [code] IntroMeteorTask sprite frame 3 (was Map_2DE980)
d_2DE980	section	romdata abs=0x2DE980
IntroMeteorFrame2Map:
$include "build/src/gfx/maps/2DE980.tilemap.asm"	; src/gfx/maps/2DE980.tilemap
; [code] IntroMeteorTask sprite frame 4 (was Map_2DE9A6)
d_2DE9A6	section	romdata abs=0x2DE9A6
IntroMeteorFrame3Map:
$include "build/src/gfx/maps/2DE9A6.tilemap.asm"	; src/gfx/maps/2DE9A6.tilemap
; [code] IntroImpactTask: 5 SCR2 tilemaps through the records IntroImpactMaps 1-5
; [code+play] IntroImpactTask record 1 (IntroImpactMaps) (was Map_2DE9CC)
d_2DE9CC	section	romdata abs=0x2DE9CC
IntroImpact1Map:
$include "build/src/gfx/maps/2DE9CC.tilemap.asm"	; src/gfx/maps/2DE9CC.tilemap
; [code+play] IntroImpactTask record 2 (was Map_2DE9E0)
d_2DE9E0	section	romdata abs=0x2DE9E0
IntroImpact2Map:
$include "build/src/gfx/maps/2DE9E0.tilemap.asm"	; src/gfx/maps/2DE9E0.tilemap
; [code+play] IntroImpactTask record 3 (was Map_2DEA0A)
d_2DEA0A	section	romdata abs=0x2DEA0A
IntroImpact3Map:
$include "build/src/gfx/maps/2DEA0A.tilemap.asm"	; src/gfx/maps/2DEA0A.tilemap
; [code+play] IntroImpactTask record 4 (was Map_2DEA3E)
d_2DEA3E	section	romdata abs=0x2DEA3E
IntroImpact4Map:
$include "build/src/gfx/maps/2DEA3E.tilemap.asm"	; src/gfx/maps/2DEA3E.tilemap
; [code+play] IntroImpactTask record 5 (was Map_2DEAA2)
d_2DEAA2	section	romdata abs=0x2DEAA2
IntroImpact5Map:
$include "build/src/gfx/maps/2DEAA2.tilemap.asm"	; src/gfx/maps/2DEAA2.tilemap
; [code+play] IntroBioLetters / CycleIntroLetters: "BIO" on SCR2 (was Map_2DF674)
d_2DF674	section	romdata abs=0x2DF674
IntroBioLettersMap:
$include "build/src/gfx/maps/2DF674.tilemap.asm"	; src/gfx/maps/2DF674.tilemap
; [code+play] IntroMotorScene / CycleIntroLetters: "MOTOR" on SCR2 (was Map_2DF96E)
d_2DF96E	section	romdata abs=0x2DF96E
IntroMotorLettersMap:
$include "build/src/gfx/maps/2DF96E.tilemap.asm"	; src/gfx/maps/2DF96E.tilemap
; [code+play] IntroUnitronScene / CycleIntroLetters: "UNITRON" on SCR2 (was Map_2DFC68)
d_2DFC68	section	romdata abs=0x2DFC68
IntroUnitronLettersMap:
$include "build/src/gfx/maps/2DFC68.tilemap.asm"	; src/gfx/maps/2DFC68.tilemap
; [code] IntroMotorUnitronLetters: the SCR1 picture (was Map_2E012C)
d_2E012C	section	romdata abs=0x2E012C
IntroMotorUnitronSceneMap:
$include "build/src/gfx/maps/2E012C.tilemap.asm"	; src/gfx/maps/2E012C.tilemap
; [code] IntroUnitronScene: the SCR1 picture scrolled behind "UNITRON" (was Map_2E1008)
d_2E1008	section	romdata abs=0x2E1008
IntroUnitronSceneMap:
$include "build/src/gfx/maps/2E1008.tilemap.asm"	; src/gfx/maps/2E1008.tilemap
; [code+play] IntroBioLetters: the SCR1 picture behind "BIO" (a pink robot) (was Map_2E2025)
d_2E2025	section	romdata abs=0x2E2025
IntroBioSceneMap:
$include "build/src/gfx/maps/2E2025.tilemap.asm"	; src/gfx/maps/2E2025.tilemap
; [code] IntroMotorScene: the SCR1 picture scrolled behind "MOTOR" (was Map_2E2B88)
d_2E2B88	section	romdata abs=0x2E2B88
IntroMotorSceneMap:
$include "build/src/gfx/maps/2E2B88.tilemap.asm"	; src/gfx/maps/2E2B88.tilemap
; [code] IntroHeadCutTask (SCR2, 20 x 19 cells, tiles from 0x17C); [play] a purple three-eyed mechanical head on black
; [code+play] IntroHeadCutTask: a purple three-eyed mechanical head (was Map_2E3616)
d_2E3616	section	romdata abs=0x2E3616
IntroHeadMap:
$include "build/src/gfx/maps/2E3616.tilemap.asm"	; src/gfx/maps/2E3616.tilemap
; [code] IntroHeadMouthCutTask; IntroHeadMap with 9 cells of rows 11-12 (columns 7-12) changed; [play] the same head, mouth / jaw line changed
; [code+play] IntroHeadMouthCutTask: the head with the mouth changed (was Map_2E3910)
d_2E3910	section	romdata abs=0x2E3910
IntroHeadMouthMap:
$include "build/src/gfx/maps/2E3910.tilemap.asm"	; src/gfx/maps/2E3910.tilemap
; [code+play] SlideInTitleBanners: the banner of row 1 (was Map_2E3FB8)
d_2E3FB8	section	romdata abs=0x2E3FB8
TitleBannerTopMap:
$include "build/src/gfx/maps/2E3FB8.tilemap.asm"	; src/gfx/maps/2E3FB8.tilemap
; [code+play] SlideInTitleBanners: the banner of row 13 (was Map_2E405A)
d_2E405A	section	romdata abs=0x2E405A
TitleBannerBottomMap:
$include "build/src/gfx/maps/2E405A.tilemap.asm"	; src/gfx/maps/2E405A.tilemap
; [code+play] SlideInMiddleTitleBanners: the banner of row 5 (was Map_2E40FC)
d_2E40FC	section	romdata abs=0x2E40FC
TitleBannerMiddle1Map:
$include "build/src/gfx/maps/2E40FC.tilemap.asm"	; src/gfx/maps/2E40FC.tilemap
; [code+play] SlideInMiddleTitleBanners: the banner of row 9 (was Map_2E419E)
d_2E419E	section	romdata abs=0x2E419E
TitleBannerMiddle2Map:
$include "build/src/gfx/maps/2E419E.tilemap.asm"	; src/gfx/maps/2E419E.tilemap
; [code+play] IntroTitleScene: "(C)YUMEKOBO 1999" on SCR1 row 0x11 (was Map_2E4240)
d_2E4240	section	romdata abs=0x2E4240
TitleCopyrightMap:
$include "build/src/gfx/maps/2E4240.tilemap.asm"	; src/gfx/maps/2E4240.tilemap
; [code+play] TitleReveal: the robot alone, sliding in on SCR2 (colour) (was Map_2E4D97)
d_2E4D97	section	romdata abs=0x2E4D97
TitleRobotMap:
$include "build/src/gfx/maps/2E4D97.tilemap.asm"	; src/gfx/maps/2E4D97.tilemap
; [code+play] IntroBackground / TitleMapFlashStep: the title picture, robot and logo (colour) (was Map_2E4EE3)
d_2E4EE3	section	romdata abs=0x2E4EE3
TitleScreenMap:
$include "build/src/gfx/maps/2E4EE3.tilemap.asm"	; src/gfx/maps/2E4EE3.tilemap
; [code+play] TitleScreen: the flash frame of the title picture (colour) (was Map_2E513D)
d_2E513D	section	romdata abs=0x2E513D
TitleScreenFlashMap:
$include "build/src/gfx/maps/2E513D.tilemap.asm"	; src/gfx/maps/2E513D.tilemap
; [code] TitleReveal: mono twin of TitleRobotMap (was Map_2E5397)
d_2E5397	section	romdata abs=0x2E5397
TitleRobotMonoMap:
$include "build/src/gfx/maps/2E5397.tilemap.asm"	; src/gfx/maps/2E5397.tilemap
; [code] IntroBackground / TitleMapFlashStep: mono twin of TitleScreenMap (was Map_2E54E3)
d_2E54E3	section	romdata abs=0x2E54E3
TitleScreenMonoMap:
$include "build/src/gfx/maps/2E54E3.tilemap.asm"	; src/gfx/maps/2E54E3.tilemap
; [code] TitleScreen: mono twin of TitleScreenFlashMap (was Map_2E573D)
d_2E573D	section	romdata abs=0x2E573D
TitleScreenFlashMonoMap:
$include "build/src/gfx/maps/2E573D.tilemap.asm"	; src/gfx/maps/2E573D.tilemap
; [code] TitleBlinkTask: a 14x1 sprite map (DrawSpriteMap at x 0x18, y 0x58) that alternates with
; the next one every 32 frames, for 0x348 frames
; [play] seen in play: the title "PRESS A BUTTON" prompt under the UNITRON logo (14 sprites, map tiles 0x0CD-0x0DA, one per character)
; [code+play] TitleBlinkTask: the "PRESS A BUTTON" prompt (was Map_2E4292)
d_2E4292	section	romdata abs=0x2E4292
TitlePressAButtonMap:
$include "build/src/gfx/maps/2E4292.tilemap.asm"	; src/gfx/maps/2E4292.tilemap
d_2E42B0	section	romdata abs=0x2E42B0
; [code] 14 cells of tile 0 (DrawSpriteMap skips them): the off phase of the prompt; [play] seen in play: the title with no prompt
; [code+play] TitleBlinkTask: the empty off phase of the prompt (was Map_2E42B0)
TitlePressAButtonOffMap:
$include "build/src/gfx/maps/2E42B0.tilemap.asm"	; src/gfx/maps/2E42B0.tilemap
; [code] StorySceneSunBegan: the SCR1 picture (colour) (was Map_2E66A0)
d_2E66A0	section	romdata abs=0x2E66A0
StorySunBeganMap:
$include "build/src/gfx/maps/2E66A0.tilemap.asm"	; src/gfx/maps/2E66A0.tilemap
; [code] StorySceneSunBegan: the SCR1 picture (mono) (was Map_2E699A)
d_2E699A	section	romdata abs=0x2E699A
StorySunBeganMonoMap:
$include "build/src/gfx/maps/2E699A.tilemap.asm"	; src/gfx/maps/2E699A.tilemap
; [code] StorySceneDestruction: the SCR1 picture (was Map_2E76DD)
d_2E76DD	section	romdata abs=0x2E76DD
StoryDestructionMap:
$include "build/src/gfx/maps/2E76DD.tilemap.asm"	; src/gfx/maps/2E76DD.tilemap
