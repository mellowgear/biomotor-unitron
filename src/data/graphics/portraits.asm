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
	dl	Pal_2BB3BF,Gfx_2BB4D1,Map_2BB40F	; colour: palette, tiles, tilemap
	dl	MonoPal_2AF65A,Gfx_2AF724,Map_2AF662	; mono: palette, tiles, tilemap
Portrait02:	; portrait 0x02
	dl	Pal_2BB912,Gfx_2BBA54,Map_2BB962	; colour: palette, tiles, tilemap
	dl	MonoPal_2AFB55,Gfx_2AFC4F,Map_2AFB5D	; mono: palette, tiles, tilemap
Portrait03:	; portrait 0x03
	dl	Pal_2BBE7B,Gfx_2BBFD5,Map_2BBECB	; colour: palette, tiles, tilemap
	dl	MonoPal_2B0075,Gfx_2B0187,Map_2B007D	; mono: palette, tiles, tilemap
Portrait04:	; portrait 0x04
	dl	Pal_2BC4CF,Gfx_2BC5F9,Map_2BC51F	; colour: palette, tiles, tilemap
	dl	MonoPal_2B067E,Gfx_2B0760,Map_2B0686	; mono: palette, tiles, tilemap
Portrait05:	; portrait 0x05
	dl	Pal_2BCABC,Gfx_2BCC2E,Map_2BCB0C	; colour: palette, tiles, tilemap
	dl	MonoPal_2B0C29,Gfx_2B0D53,Map_2B0C31	; mono: palette, tiles, tilemap
Portrait06:	; portrait 0x06
	dl	Pal_2BD193,Gfx_2BD2ED,Map_2BD1E3	; colour: palette, tiles, tilemap
	dl	MonoPal_2B12B2,Gfx_2B13C4,Map_2B12BA	; mono: palette, tiles, tilemap
Portrait07:	; portrait 0x07
	dl	Pal_2BD965,Gfx_2BDABF,Map_2BD9B5	; colour: palette, tiles, tilemap
	dl	MonoPal_2B1A3D,Gfx_2B1B4F,Map_2B1A45	; mono: palette, tiles, tilemap
Portrait08:	; portrait 0x08
	dl	Pal_2BE0DF,Gfx_2BE251,Map_2BE12F	; colour: palette, tiles, tilemap
	dl	MonoPal_2B2160,Gfx_2B228A,Map_2B2168	; mono: palette, tiles, tilemap
Portrait09:	; portrait 0x09
	dl	Pal_2BE9ED,Gfx_2BEB5F,Map_2BEA3D	; colour: palette, tiles, tilemap
	dl	MonoPal_2B2A22,Gfx_2B2B4C,Map_2B2A2A	; mono: palette, tiles, tilemap
Portrait0A:	; portrait 0x0A
	dl	Pal_2BF0EE,Gfx_2BF21C,Map_2BF13E	; colour: palette, tiles, tilemap
	dl	MonoPal_2B30D4,Gfx_2B31BA,Map_2B30DC	; mono: palette, tiles, tilemap
Portrait0B:	; portrait 0x0B
	dl	Pal_2BF610,Gfx_2BF6DA,Map_2BF660	; colour: palette, tiles, tilemap
	dl	MonoPal_2B35BD,Gfx_2B363F,Map_2B35C5	; mono: palette, tiles, tilemap
Portrait0C:	; portrait 0x0C
	dl	Pal_2BF9EF,Gfx_2BFAB9,Map_2BFA3F	; colour: palette, tiles, tilemap
	dl	MonoPal_2B3948,Gfx_2B39CA,Map_2B3950	; mono: palette, tiles, tilemap
Portrait0D:	; portrait 0x0D
	dl	Pal_2BFDC5,Gfx_2BFE8F,Map_2BFE15	; colour: palette, tiles, tilemap
	dl	MonoPal_2B3CD5,Gfx_2B3D57,Map_2B3CDD	; mono: palette, tiles, tilemap
Portrait0E:	; portrait 0x0E
	dl	Pal_2C01DF,Gfx_2C02A9,Map_2C022F	; colour: palette, tiles, tilemap
	dl	MonoPal_2B40A2,Gfx_2B4124,Map_2B40AA	; mono: palette, tiles, tilemap
Portrait0F:	; portrait 0x0F
	dl	Pal_2C05F6,Gfx_2C06C0,Map_2C0646	; colour: palette, tiles, tilemap
	dl	MonoPal_2B4477,Gfx_2B44F9,Map_2B447F	; mono: palette, tiles, tilemap
Portrait10:	; portrait 0x10
	dl	Pal_2C0A23,Gfx_2C0AED,Map_2C0A73	; colour: palette, tiles, tilemap
	dl	MonoPal_2B485A,Gfx_2B48DC,Map_2B4862	; mono: palette, tiles, tilemap
Portrait11:	; portrait 0x11
	dl	Pal_2C0E87,Gfx_2C0F51,Map_2C0ED7	; colour: palette, tiles, tilemap
	dl	MonoPal_2B4C6D,Gfx_2B4CEF,Map_2B4C75	; mono: palette, tiles, tilemap
Portrait12:	; portrait 0x12
	dl	Pal_2C12BE,Gfx_2C1388,Map_2C130E	; colour: palette, tiles, tilemap
	dl	MonoPal_2B5060,Gfx_2B50E2,Map_2B5068	; mono: palette, tiles, tilemap
Portrait13:	; portrait 0x13
	dl	Pal_2C1716,Gfx_2C17E0,Map_2C1766	; colour: palette, tiles, tilemap
	dl	MonoPal_2B5470,Gfx_2B54F2,Map_2B5478	; mono: palette, tiles, tilemap
Portrait14:	; portrait 0x14
	dl	Pal_2C1B0C,Gfx_2C1BD6,Map_2C1B5C	; colour: palette, tiles, tilemap
	dl	MonoPal_2B581F,Gfx_2B58A1,Map_2B5827	; mono: palette, tiles, tilemap
Portrait15:	; portrait 0x15
	dl	Pal_2C1EE7,Gfx_2C2041,Map_2C1F37	; colour: palette, tiles, tilemap
	dl	MonoPal_2B5BB0,Gfx_2B5CC2,Map_2B5BB8	; mono: palette, tiles, tilemap
Portrait16:	; portrait 0x16
	dl	Pal_2C24B1,Gfx_2C260B,Map_2C2501	; colour: palette, tiles, tilemap
	dl	MonoPal_2B612C,Gfx_2B623E,Map_2B6134	; mono: palette, tiles, tilemap
Portrait17:	; portrait 0x17
	dl	Pal_2C2B4F,Gfx_2C2CC1,Map_2C2B9F	; colour: palette, tiles, tilemap
	dl	MonoPal_2B6779,Gfx_2B68A3,Map_2B6781	; mono: palette, tiles, tilemap
Portrait18:	; portrait 0x18
	dl	Pal_2C339D,Gfx_2C34F7,Map_2C33ED	; colour: palette, tiles, tilemap
	dl	MonoPal_2B6F87,Gfx_2B7099,Map_2B6F8F	; mono: palette, tiles, tilemap
Portrait19:	; portrait 0x19
	dl	Pal_2C392F,Gfx_2C3A71,Map_2C397F	; colour: palette, tiles, tilemap
	dl	MonoPal_2B74D6,Gfx_2B75D0,Map_2B74DE	; mono: palette, tiles, tilemap
Portrait1A:	; portrait 0x1A
	dl	Pal_2C3FDD,Gfx_2C4107,Map_2C402D	; colour: palette, tiles, tilemap
	dl	MonoPal_2B7B30,Gfx_2B7C12,Map_2B7B38	; mono: palette, tiles, tilemap
Portrait1B:	; portrait 0x1B
	dl	Pal_2C45EB,Gfx_2C4719,Map_2C463B	; colour: palette, tiles, tilemap
	dl	MonoPal_2B80A5,Gfx_2B818B,Map_2B80AD	; mono: palette, tiles, tilemap
Portrait1C:	; portrait 0x1C
	dl	Pal_2C4C07,Gfx_2C4D61,Map_2C4C57	; colour: palette, tiles, tilemap
	dl	MonoPal_2B866B,Gfx_2B877D,Map_2B8673	; mono: palette, tiles, tilemap
Portrait1D:	; portrait 0x1D
	dl	Pal_2C530C,Gfx_2C5450,Map_2C535C	; colour: palette, tiles, tilemap
	dl	MonoPal_2B8D2A,Gfx_2B8E26,Map_2B8D32	; mono: palette, tiles, tilemap
Portrait1E:	; portrait 0x1E
	dl	Pal_2C5866,Gfx_2C59C0,Map_2C58B6	; colour: palette, tiles, tilemap
	dl	MonoPal_2B9233,Gfx_2B9345,Map_2B923B	; mono: palette, tiles, tilemap
Portrait1F:	; portrait 0x1F
	dl	Pal_2C5E94,Gfx_2C6006,Map_2C5EE4	; colour: palette, tiles, tilemap
	dl	MonoPal_2B981E,Gfx_2B9948,Map_2B9826	; mono: palette, tiles, tilemap
Portrait20:	; portrait 0x20
	dl	Pal_2C65EF,Gfx_2C6761,Map_2C663F	; colour: palette, tiles, tilemap
	dl	MonoPal_2B9F26,Gfx_2BA050,Map_2B9F2E	; mono: palette, tiles, tilemap
Portrait21:	; portrait 0x21
	dl	Pal_2C6D15,Gfx_2C6E87,Map_2C6D65	; colour: palette, tiles, tilemap
	dl	MonoPal_2BA5FC,Gfx_2BA726,Map_2BA604	; mono: palette, tiles, tilemap
Portrait22:	; portrait 0x22
	dl	Pal_2C72DD,Gfx_2C744F,Map_2C732D	; colour: palette, tiles, tilemap
	dl	MonoPal_2BAB89,Gfx_2BACB3,Map_2BAB91	; mono: palette, tiles, tilemap
Portrait23:	; portrait 0x23
	dl	Pal_29945A,Gfx_2996DC,Map_2994AA	; colour: palette, tiles, tilemap
	dl	MonoPal_2844C4,Gfx_2846FE,Map_2844CC	; mono: palette, tiles, tilemap
Portrait24:	; portrait 0x24
	dl	Pal_299EE8,Gfx_29A08A,Map_299F38	; colour: palette, tiles, tilemap
	dl	MonoPal_284F10,Gfx_28506A,Map_284F18	; mono: palette, tiles, tilemap
Portrait25:	; portrait 0x25
	dl	Pal_29A81A,Gfx_29A9BC,Map_29A86A	; colour: palette, tiles, tilemap
	dl	MonoPal_28577A,Gfx_2858D4,Map_285782	; mono: palette, tiles, tilemap
Portrait26:	; portrait 0x26, 0x27
	dl	Pal_29AFF8,Gfx_29B19A,Map_29B048	; colour: palette, tiles, tilemap
	dl	MonoPal_285F31,Gfx_28608B,Map_285F39	; mono: palette, tiles, tilemap
Portrait28:	; portrait 0x28
	dl	Pal_29B9B7,Gfx_29BB59,Map_29BA07	; colour: palette, tiles, tilemap
	dl	MonoPal_2868D7,Gfx_286A31,Map_2868DF	; mono: palette, tiles, tilemap
Portrait29:	; portrait 0x29
	dl	Pal_29C313,Gfx_29C4B5,Map_29C363	; colour: palette, tiles, tilemap
	dl	MonoPal_2871E6,Gfx_287340,Map_2871EE	; mono: palette, tiles, tilemap
Portrait2A:	; portrait 0x2A; [play] the right half of the arena gate (ArenaPreDuelGate, on SCR2)
	dl	Pal_29D34A,Gfx_29D518,Map_29D39A	; colour: palette, tiles, tilemap
	dl	MonoPal_287ECC,Gfx_288052,Map_287ED4	; mono: palette, tiles, tilemap
Portrait2B:	; portrait 0x2B; [play] the left half of the arena gate (ArenaPreDuelGate, on SCR1)
	dl	Pal_29C83F,Gfx_29CA0D,Map_29C88F	; colour: palette, tiles, tilemap
	dl	MonoPal_2876BC,Gfx_287842,Map_2876C4	; mono: palette, tiles, tilemap
Portrait2C:	; portrait 0x2C
	dl	Pal_29DDFD,Gfx_29DF9F,Map_29DE4D	; colour: palette, tiles, tilemap
	dl	MonoPal_2884EF,Gfx_288649,Map_2884F7	; mono: palette, tiles, tilemap
Portrait2D:	; portrait 0x2D
	dl	Pal_29E9D9,Gfx_29EB7B,Map_29EA29	; colour: palette, tiles, tilemap
	dl	MonoPal_2890C5,Gfx_28921F,Map_2890CD	; mono: palette, tiles, tilemap
Portrait2E:	; portrait 0x2E
	dl	Pal_29F615,Gfx_29F95F,Map_29F665	; colour: palette, tiles, tilemap
	dl	MonoPal_289C96,Gfx_289F98,Map_289C9E	; mono: palette, tiles, tilemap
Portrait2F:	; portrait 0x2F
	dl	Pal_29FFF7,Gfx_2A0199,Map_2A0047	; colour: palette, tiles, tilemap
	dl	MonoPal_28A631,Gfx_28A78B,Map_28A639	; mono: palette, tiles, tilemap
Portrait30:	; portrait 0x30
	dl	Pal_2A0A77,Gfx_2A0CF9,Map_2A0AC7	; colour: palette, tiles, tilemap
	dl	MonoPal_28B06C,Gfx_28B2A6,Map_28B074	; mono: palette, tiles, tilemap
Portrait31:	; portrait 0x31
	dl	Pal_2A1B32,Gfx_2A1DB4,Map_2A1B82	; colour: palette, tiles, tilemap
	dl	MonoPal_28BFDF,Gfx_28C219,Map_28BFE7	; mono: palette, tiles, tilemap
Portrait32:	; portrait 0x32
	dl	Pal_2A2AFC,Gfx_2A2D7E,Map_2A2B4C	; colour: palette, tiles, tilemap
	dl	MonoPal_28D0C2,Gfx_28D2FC,Map_28D0CA	; mono: palette, tiles, tilemap
Portrait33:	; portrait 0x33
	dl	Pal_2A3787,Gfx_2A3A09,Map_2A37D7	; colour: palette, tiles, tilemap
	dl	MonoPal_28DCA2,Gfx_28DEDC,Map_28DCAA	; mono: palette, tiles, tilemap
Portrait34:	; portrait 0x34
	dl	Pal_2A4823,Gfx_2A49C5,Map_2A4873	; colour: palette, tiles, tilemap
	dl	MonoPal_28ECF4,Gfx_28EE4E,Map_28ECFC	; mono: palette, tiles, tilemap
Portrait35:	; portrait 0x35
	dl	Pal_2A51F2,Gfx_2A5394,Map_2A5242	; colour: palette, tiles, tilemap
	dl	MonoPal_28F588,Gfx_28F6E2,Map_28F590	; mono: palette, tiles, tilemap
Portrait36:	; portrait 0x36; [play] ruins seen from the ground (broken white columns and arches, blue sky, a far temple with smoke), the Protector's vision in the Works (WorksProtectorScene)
	dl	Pal_2A5C2B,Gfx_2A5EAD,Map_2A5C7B	; colour: palette, tiles, tilemap
	dl	MonoPal_28FF98,Gfx_2901D2,Map_28FFA0	; mono: palette, tiles, tilemap
Portrait37:	; portrait 0x37
	dl	Pal_2A6962,Gfx_2A6CAC,Map_2A69B2	; colour: palette, tiles, tilemap
	dl	MonoPal_290C67,Gfx_290F69,Map_290C6F	; mono: palette, tiles, tilemap
Portrait38:	; portrait 0x38; [play] Satanachia's UNITRON (blue, with a sword), full screen in the Rank CS duel 6 transmission
	dl	Pal_2A741F,Gfx_2A76A1,Map_2A746F	; colour: palette, tiles, tilemap
	dl	MonoPal_2916E8,Gfx_291922,Map_2916F0	; mono: palette, tiles, tilemap
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
	dl	Pal_2ADF46,Gfx_2AE290,Map_2ADF96	; colour: palette, tiles, tilemap
	dl	MonoPal_297EE7,Gfx_2981E9,Map_297EEF	; mono: palette, tiles, tilemap
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
