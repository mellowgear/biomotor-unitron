; PortraitTable: 68 pointers, one per portrait number (DrawPortrait 0x2103BA: HL = number,
; XHL = PortraitTable[HL]), to 66 portrait records (numbers 0x00/0x01 and 0x26/0x27 share one).
; A record is 6 pointers (DrawPortrait, DrawPortraitColor): +0 colour palette (LoadPalettes, C = 10),
; +4 colour tiles and +8 colour tilemap (used when wColorFlags bit 4 is set: DrawPortraitColor),
; +0xC mono palette (LoadMonoPalettes), +0x10 mono tiles and +0x14 mono tilemap (bit 4 clear).
; Record labels: the first portrait number using it.
	dl	Portrait00,Portrait00,Portrait02,Portrait03	; 00-03
	dl	Portrait04,Portrait05,Portrait06,Portrait07	; 04-07
	dl	Portrait08,Portrait09,Portrait0A,Portrait0B	; 08-0B
	dl	Portrait0C,Portrait0D,Portrait0E,Portrait0F	; 0C-0F
	dl	Portrait10,Portrait11,Portrait12,Portrait13	; 10-13
	dl	Portrait14,Portrait15,Portrait16,Portrait17	; 14-17
	dl	Portrait18,Portrait19,Portrait1A,Portrait1B	; 18-1B
	dl	Portrait1C,Portrait1D,Portrait1E,Portrait1F	; 1C-1F
	dl	Portrait20,Portrait21,Portrait22,Portrait23	; 20-23
	dl	Portrait24,Portrait25,Portrait26,Portrait26	; 24-27
	dl	Portrait28,Portrait29,Portrait2A,Portrait2B	; 28-2B
	dl	Portrait2C,Portrait2D,Portrait2E,Portrait2F	; 2C-2F
	dl	Portrait30,Portrait31,Portrait32,Portrait33	; 30-33
	dl	Portrait34,Portrait35,Portrait36,Portrait37	; 34-37
	dl	Portrait38,Portrait39,Portrait3A,Portrait3B	; 38-3B
	dl	Portrait3C,Portrait3D,Portrait3E,Portrait3F	; 3C-3F
	dl	Portrait40,Portrait41,Portrait42,Portrait43	; 40-43
Portrait00:	; portrait 0x00, 0x01
	dl	TalkHumanMalePortraitPal,Gfx_2BB4D1,TalkHumanMalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkHumanMalePortraitMonoPal,Gfx_2AF724,TalkHumanMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait02:	; portrait 0x02
	dl	TalkHumanFemalePortraitPal,Gfx_2BBA54,TalkHumanFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkHumanFemalePortraitMonoPal,Gfx_2AFC4F,TalkHumanFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait03:	; portrait 0x03
	dl	TalkForesterMalePortraitPal,Gfx_2BBFD5,TalkForesterMalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkForesterMalePortraitMonoPal,Gfx_2B0187,TalkForesterMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait04:	; portrait 0x04
	dl	TalkForesterFemalePortraitPal,Gfx_2BC5F9,TalkForesterFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkForesterFemalePortraitMonoPal,Gfx_2B0760,TalkForesterFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait05:	; portrait 0x05
	dl	TalkMarinerMalePortraitPal,Gfx_2BCC2E,TalkMarinerMalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkMarinerMalePortraitMonoPal,Gfx_2B0D53,TalkMarinerMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait06:	; portrait 0x06
	dl	TalkMarinerFemalePortraitPal,Gfx_2BD2ED,TalkMarinerFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkMarinerFemalePortraitMonoPal,Gfx_2B13C4,TalkMarinerFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait07:	; portrait 0x07
	dl	TalkBirdianMalePortraitPal,Gfx_2BDABF,TalkBirdianMalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkBirdianMalePortraitMonoPal,Gfx_2B1B4F,TalkBirdianMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait08:	; portrait 0x08
	dl	TalkBirdianFemalePortraitPal,Gfx_2BE251,TalkBirdianFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkBirdianFemalePortraitMonoPal,Gfx_2B228A,TalkBirdianFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait09:	; portrait 0x09
	dl	TalkLizardmanMalePortraitPal,Gfx_2BEB5F,TalkLizardmanMalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkLizardmanMalePortraitMonoPal,Gfx_2B2B4C,TalkLizardmanMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait0A:	; portrait 0x0A
	dl	TalkLizardmanFemalePortraitPal,Gfx_2BF21C,TalkLizardmanFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	TalkLizardmanFemalePortraitMonoPal,Gfx_2B31BA,TalkLizardmanFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait0B:	; portrait 0x0B
	dl	SelectHumanMalePortraitPal,Gfx_2BF6DA,SelectHumanMalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectHumanMalePortraitMonoPal,Gfx_2B363F,SelectHumanMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait0C:	; portrait 0x0C
	dl	SelectHumanFemalePortraitPal,Gfx_2BFAB9,SelectHumanFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectHumanFemalePortraitMonoPal,Gfx_2B39CA,SelectHumanFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait0D:	; portrait 0x0D
	dl	SelectForesterMalePortraitPal,Gfx_2BFE8F,SelectForesterMalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectForesterMalePortraitMonoPal,Gfx_2B3D57,SelectForesterMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait0E:	; portrait 0x0E
	dl	SelectForesterFemalePortraitPal,Gfx_2C02A9,SelectForesterFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectForesterFemalePortraitMonoPal,Gfx_2B4124,SelectForesterFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait0F:	; portrait 0x0F
	dl	SelectMarinerMalePortraitPal,Gfx_2C06C0,SelectMarinerMalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectMarinerMalePortraitMonoPal,Gfx_2B44F9,SelectMarinerMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait10:	; portrait 0x10
	dl	SelectMarinerFemalePortraitPal,Gfx_2C0AED,SelectMarinerFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectMarinerFemalePortraitMonoPal,Gfx_2B48DC,SelectMarinerFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait11:	; portrait 0x11
	dl	SelectBirdianMalePortraitPal,Gfx_2C0F51,SelectBirdianMalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectBirdianMalePortraitMonoPal,Gfx_2B4CEF,SelectBirdianMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait12:	; portrait 0x12
	dl	SelectBirdianFemalePortraitPal,Gfx_2C1388,SelectBirdianFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectBirdianFemalePortraitMonoPal,Gfx_2B50E2,SelectBirdianFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait13:	; portrait 0x13
	dl	SelectLizardmanMalePortraitPal,Gfx_2C17E0,SelectLizardmanMalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectLizardmanMalePortraitMonoPal,Gfx_2B54F2,SelectLizardmanMalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait14:	; portrait 0x14
	dl	SelectLizardmanFemalePortraitPal,Gfx_2C1BD6,SelectLizardmanFemalePortraitMap	; colour: palette, tiles, tilemap
	dl	SelectLizardmanFemalePortraitMonoPal,Gfx_2B58A1,SelectLizardmanFemalePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait15:	; portrait 0x15
	dl	JonPortraitPal,Gfx_2C2041,JonPortraitMap	; colour: palette, tiles, tilemap
	dl	JonPortraitMonoPal,Gfx_2B5CC2,JonPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait16:	; portrait 0x16
	dl	LilyPortraitPal,Gfx_2C260B,LilyPortraitMap	; colour: palette, tiles, tilemap
	dl	LilyPortraitMonoPal,Gfx_2B623E,LilyPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait17:	; portrait 0x17
	dl	CyriusPortraitPal,Gfx_2C2CC1,CyriusPortraitMap	; colour: palette, tiles, tilemap
	dl	CyriusPortraitMonoPal,Gfx_2B68A3,CyriusPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait18:	; portrait 0x18
	dl	GalbPortraitPal,Gfx_2C34F7,GalbPortraitMap	; colour: palette, tiles, tilemap
	dl	GalbPortraitMonoPal,Gfx_2B7099,GalbPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait19:	; portrait 0x19
	dl	LanaPortraitPal,Gfx_2C3A71,LanaPortraitMap	; colour: palette, tiles, tilemap
	dl	LanaPortraitMonoPal,Gfx_2B75D0,LanaPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait1A:	; portrait 0x1A
	dl	WysePortraitPal,Gfx_2C4107,WysePortraitMap	; colour: palette, tiles, tilemap
	dl	WysePortraitMonoPal,Gfx_2B7C12,WysePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait1B:	; portrait 0x1B
	dl	ZiggyPortraitPal,Gfx_2C4719,ZiggyPortraitMap	; colour: palette, tiles, tilemap
	dl	ZiggyPortraitMonoPal,Gfx_2B818B,ZiggyPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait1C:	; portrait 0x1C
	dl	CeusPortraitPal,Gfx_2C4D61,CeusPortraitMap	; colour: palette, tiles, tilemap
	dl	CeusPortraitMonoPal,Gfx_2B877D,CeusPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait1D:	; portrait 0x1D
	dl	HelmutPortraitPal,Gfx_2C5450,HelmutPortraitMap	; colour: palette, tiles, tilemap
	dl	HelmutPortraitMonoPal,Gfx_2B8E26,HelmutPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait1E:	; portrait 0x1E
	dl	AldaPortraitPal,Gfx_2C59C0,AldaPortraitMap	; colour: palette, tiles, tilemap
	dl	AldaPortraitMonoPal,Gfx_2B9345,AldaPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait1F:	; portrait 0x1F
	dl	CamilPortraitPal,Gfx_2C6006,CamilPortraitMap	; colour: palette, tiles, tilemap
	dl	CamilPortraitMonoPal,Gfx_2B9948,CamilPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait20:	; portrait 0x20
	dl	MeesePortraitPal,Gfx_2C6761,MeesePortraitMap	; colour: palette, tiles, tilemap
	dl	MeesePortraitMonoPal,Gfx_2BA050,MeesePortraitMonoMap	; mono: palette, tiles, tilemap
Portrait21:	; portrait 0x21
	dl	CollaPortraitPal,Gfx_2C6E87,CollaPortraitMap	; colour: palette, tiles, tilemap
	dl	CollaPortraitMonoPal,Gfx_2BA726,CollaPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait22:	; portrait 0x22
	dl	TetisPortraitPal,Gfx_2C744F,TetisPortraitMap	; colour: palette, tiles, tilemap
	dl	TetisPortraitMonoPal,Gfx_2BACB3,TetisPortraitMonoMap	; mono: palette, tiles, tilemap
Portrait23:	; portrait 0x23
	dl	RhafiacePicturePal,Gfx_2996DC,RhafiacePictureMap	; colour: palette, tiles, tilemap
	dl	RhafiacePictureMonoPal,Gfx_2846FE,RhafiacePictureMonoMap	; mono: palette, tiles, tilemap
Portrait24:	; portrait 0x24
	dl	PubPicturePal,Gfx_29A08A,PubPictureMap	; colour: palette, tiles, tilemap
	dl	PubPictureMonoPal,Gfx_28506A,PubPictureMonoMap	; mono: palette, tiles, tilemap
Portrait25:	; portrait 0x25
	dl	ShopPicturePal,Gfx_29A9BC,ShopPictureMap	; colour: palette, tiles, tilemap
	dl	ShopPictureMonoPal,Gfx_2858D4,ShopPictureMonoMap	; mono: palette, tiles, tilemap
Portrait26:	; portrait 0x26, 0x27
	dl	SquarePicturePal,Gfx_29B19A,SquarePictureMap	; colour: palette, tiles, tilemap
	dl	SquarePictureMonoPal,Gfx_28608B,SquarePictureMonoMap	; mono: palette, tiles, tilemap
Portrait28:	; portrait 0x28
	dl	StreetPicturePal,Gfx_29BB59,StreetPictureMap	; colour: palette, tiles, tilemap
	dl	StreetPictureMonoPal,Gfx_286A31,StreetPictureMonoMap	; mono: palette, tiles, tilemap
Portrait29:	; portrait 0x29
	dl	ArenaPicturePal,Gfx_29C4B5,ArenaPictureMap	; colour: palette, tiles, tilemap
	dl	ArenaPictureMonoPal,Gfx_287340,ArenaPictureMonoMap	; mono: palette, tiles, tilemap
Portrait2A:	; portrait 0x2A; [play] the right half of the arena gate (ArenaPreDuelGate, on SCR2)
	dl	GateRightPicturePal,Gfx_29D518,GateRightPictureMap	; colour: palette, tiles, tilemap
	dl	GateRightPictureMonoPal,Gfx_288052,GateRightPictureMonoMap	; mono: palette, tiles, tilemap
Portrait2B:	; portrait 0x2B; [play] the left half of the arena gate (ArenaPreDuelGate, on SCR1)
	dl	GateLeftPicturePal,Gfx_29CA0D,GateLeftPictureMap	; colour: palette, tiles, tilemap
	dl	GateLeftPictureMonoPal,Gfx_287842,GateLeftPictureMonoMap	; mono: palette, tiles, tilemap
Portrait2C:	; portrait 0x2C
	dl	ForestPicturePal,Gfx_29DF9F,ForestPictureMap	; colour: palette, tiles, tilemap
	dl	ForestPictureMonoPal,Gfx_288649,ForestPictureMonoMap	; mono: palette, tiles, tilemap
Portrait2D:	; portrait 0x2D
	dl	SpringPicturePal,Gfx_29EB7B,SpringPictureMap	; colour: palette, tiles, tilemap
	dl	SpringPictureMonoPal,Gfx_28921F,SpringPictureMonoMap	; mono: palette, tiles, tilemap
Portrait2E:	; portrait 0x2E
	dl	StoryPlanetPicturePal,Gfx_29F95F,StoryPlanetPictureMap	; colour: palette, tiles, tilemap
	dl	StoryPlanetPictureMonoPal,Gfx_289F98,StoryPlanetPictureMonoMap	; mono: palette, tiles, tilemap
Portrait2F:	; portrait 0x2F
	dl	DTownPicturePal,Gfx_2A0199,DTownPictureMap	; colour: palette, tiles, tilemap
	dl	DTownPictureMonoPal,Gfx_28A78B,DTownPictureMonoMap	; mono: palette, tiles, tilemap
Portrait30:	; portrait 0x30
	dl	ForestOfVerdurePicturePal,Gfx_2A0CF9,ForestOfVerdurePictureMap	; colour: palette, tiles, tilemap
	dl	ForestOfVerdurePictureMonoPal,Gfx_28B2A6,ForestOfVerdurePictureMonoMap	; mono: palette, tiles, tilemap
Portrait31:	; portrait 0x31
	dl	CorridorOfBluePicturePal,Gfx_2A1DB4,CorridorOfBluePictureMap	; colour: palette, tiles, tilemap
	dl	CorridorOfBluePictureMonoPal,Gfx_28C219,CorridorOfBluePictureMonoMap	; mono: palette, tiles, tilemap
Portrait32:	; portrait 0x32
	dl	RuinsOfWindPicturePal,Gfx_2A2D7E,RuinsOfWindPictureMap	; colour: palette, tiles, tilemap
	dl	RuinsOfWindPictureMonoPal,Gfx_28D2FC,RuinsOfWindPictureMonoMap	; mono: palette, tiles, tilemap
Portrait33:	; portrait 0x33
	dl	MazeOfStonePicturePal,Gfx_2A3A09,MazeOfStonePictureMap	; colour: palette, tiles, tilemap
	dl	MazeOfStonePictureMonoPal,Gfx_28DEDC,MazeOfStonePictureMonoMap	; mono: palette, tiles, tilemap
Portrait34:	; portrait 0x34
	dl	CrystalMinePicturePal,Gfx_2A49C5,CrystalMinePictureMap	; colour: palette, tiles, tilemap
	dl	CrystalMinePictureMonoPal,Gfx_28EE4E,CrystalMinePictureMonoMap	; mono: palette, tiles, tilemap
Portrait35:	; portrait 0x35
	dl	WorksPicturePal,Gfx_2A5394,WorksPictureMap	; colour: palette, tiles, tilemap
	dl	WorksPictureMonoPal,Gfx_28F6E2,WorksPictureMonoMap	; mono: palette, tiles, tilemap
Portrait36:	; portrait 0x36; [play] ruins seen from the ground (broken white columns and arches, blue sky, a far temple with smoke), the Protector's vision in the Works (WorksProtectorScene)
	dl	RuinsVisionPicturePal,Gfx_2A5EAD,RuinsVisionPictureMap	; colour: palette, tiles, tilemap
	dl	RuinsVisionPictureMonoPal,Gfx_2901D2,RuinsVisionPictureMonoMap	; mono: palette, tiles, tilemap
Portrait37:	; portrait 0x37
	dl	TheEndPicturePal,Gfx_2A6CAC,TheEndPictureMap	; colour: palette, tiles, tilemap
	dl	TheEndPictureMonoPal,Gfx_290F69,TheEndPictureMonoMap	; mono: palette, tiles, tilemap
Portrait38:	; portrait 0x38; [play] Satanachia's UNITRON (blue, with a sword), full screen in the Rank CS duel 6 transmission
	dl	SatanachiaUnitronPicturePal,Gfx_2A76A1,SatanachiaUnitronPictureMap	; colour: palette, tiles, tilemap
	dl	SatanachiaUnitronPictureMonoPal,Gfx_291922,SatanachiaUnitronPictureMonoMap	; mono: palette, tiles, tilemap
Portrait39:	; portrait 0x39
	dl	Pal_2A84DB,Gfx_2A875D,Map_2A852B	; colour: palette, tiles, tilemap
	dl	MonoPal_29275B,Gfx_292995,Map_292763	; mono: palette, tiles, tilemap
Portrait3A:	; portrait 0x3A
	dl	Pal_2ABEDD,Gfx_2AC15F,Map_2ABF2D	; colour: palette, tiles, tilemap
	dl	MonoPal_295F21,Gfx_29615B,Map_295F29	; mono: palette, tiles, tilemap
Portrait3B:	; portrait 0x3B
	dl	Pal_2ACEBC,Gfx_2AD13E,Map_2ACF0C	; colour: palette, tiles, tilemap
	dl	MonoPal_296EB9,Gfx_2970F3,Map_296EC1	; mono: palette, tiles, tilemap
Portrait3C:	; portrait 0x3C
	dl	WorldMapPicturePal,Gfx_2AE290,WorldMapPictureMap	; colour: palette, tiles, tilemap
	dl	WorldMapPictureMonoPal,Gfx_2981E9,WorldMapPictureMonoMap	; mono: palette, tiles, tilemap
Portrait3D:	; portrait 0x3D
	dl	Pal_2A95FB,Gfx_2A976D,Map_2A964B	; colour: palette, tiles, tilemap
	dl	MonoPal_293832,Gfx_29395C,Map_29383A	; mono: palette, tiles, tilemap
Portrait3E:	; portrait 0x3E
	dl	Pal_2A9CAD,Gfx_2A9E1F,Map_2A9CFD	; colour: palette, tiles, tilemap
	dl	MonoPal_293E97,Gfx_293FC1,Map_293E9F	; mono: palette, tiles, tilemap
Portrait3F:	; portrait 0x3F
	dl	Pal_2AA432,Gfx_2AA5A4,Map_2AA482	; colour: palette, tiles, tilemap
	dl	MonoPal_2945D5,Gfx_2946FF,Map_2945DD	; mono: palette, tiles, tilemap
Portrait40:	; portrait 0x40
	dl	Pal_2AAB64,Gfx_2AACD6,Map_2AABB4	; colour: palette, tiles, tilemap
	dl	MonoPal_294CA5,Gfx_294DCF,Map_294CAD	; mono: palette, tiles, tilemap
Portrait41:	; portrait 0x41
	dl	Pal_2AB28F,Gfx_2AB3D1,Map_2AB2DF	; colour: palette, tiles, tilemap
	dl	MonoPal_29537F,Gfx_295479,Map_295387	; mono: palette, tiles, tilemap
Portrait42:	; portrait 0x42
	dl	Pal_2AB7CD,Gfx_2AB93F,Map_2AB81D	; colour: palette, tiles, tilemap
	dl	MonoPal_29587A,Gfx_2959A4,Map_295882	; mono: palette, tiles, tilemap
Portrait43:	; portrait 0x43
	dl	Pal_2AF3B4,Gfx_2AF636,Map_2AF404	; colour: palette, tiles, tilemap
	dl	MonoPal_2991FC,Gfx_299436,Map_299204	; mono: palette, tiles, tilemap
