; data/battle_anims/battle_effects.asm: battle effect data.
; Read by PlayBattleEffect through BattleEffects (effect id -> record).
; FxMono_* are the records' mono palettes: LoadMonoPalettes is called with A = 0xE and returns
; without loading (A >= 6), so their bytes are kept as plain data.

d_2746C0	section	romdata abs=0x2746C0
FxRecord_2746C0:
	dl	FxFrames_275868,FxTiles_279C3A,FxPal_280564,FxMono_280B10,FxScript_282A66

d_2746D4	section	romdata abs=0x2746D4
FxRecord_2746D4:
	dl	FxFrames_2758A0,FxTiles_27C747,FxPal_280604,FxMono_280B10,FxScript_280EDB

d_2746E8	section	romdata abs=0x2746E8
FxRecord_2746E8:
	dl	FxFrames_2758A0,FxTiles_27C747,FxPal_28060C,FxMono_280B10,FxScript_280EDB

d_2746FC	section	romdata abs=0x2746FC
FxRecord_2746FC:
	dl	FxFrames_2758A0,FxTiles_27C747,FxPal_280614,FxMono_280B10,FxScript_280EDB

d_274710	section	romdata abs=0x274710
FxRecord_274710:
	dl	FxFrames_2758A0,FxTiles_27C747,FxPal_28061C,FxMono_280B10,FxScript_280EDB

d_274724	section	romdata abs=0x274724
FxRecord_274724:
	dl	FxFrames_2758AC,FxTiles_27C747,FxPal_280604,FxMono_280B10,FxScript_282E0C

d_274738	section	romdata abs=0x274738
FxRecord_274738:
	dl	FxFrames_2758AC,FxTiles_27C747,FxPal_28060C,FxMono_280B10,FxScript_282E0C

d_27474C	section	romdata abs=0x27474C
FxRecord_27474C:
	dl	FxFrames_2758AC,FxTiles_27C747,FxPal_280614,FxMono_280B10,FxScript_282E0C

d_274760	section	romdata abs=0x274760
FxRecord_274760:
	dl	FxFrames_2758AC,FxTiles_27C747,FxPal_28061C,FxMono_280B10,FxScript_282E0C

d_274774	section	romdata abs=0x274774
FxRecord_274774:
	dl	FxFrames_2758B8,FxTiles_27B14A,FxPal_280644,FxMono_280B10,FxScript_280ECA

d_274788	section	romdata abs=0x274788
FxRecord_274788:
	dl	FxFrames_2758C8,FxTiles_27F60E,FxPal_280644,FxMono_280B10,FxScript_2834C1

d_27479C	section	romdata abs=0x27479C
FxRecord_27479C:
	dl	FxFrames_2758E0,FxTiles_27E953,FxPal_280AA4,FxMono_280B10,FxScript_281C76

d_2747B0	section	romdata abs=0x2747B0
FxRecord_2747B0:
	dl	FxFrames_2758FC,FxTiles_27B456,FxPal_280764,FxMono_280B10,FxScript_28156D

d_2747C4	section	romdata abs=0x2747C4
FxRecord_2747C4:
	dl	FxFrames_2758FC,FxTiles_27B456,FxPal_28076C,FxMono_280B10,FxScript_28156D

d_2747D8	section	romdata abs=0x2747D8
FxRecord_2747D8:
	dl	FxFrames_2758FC,FxTiles_27B456,FxPal_280774,FxMono_280B10,FxScript_28156D

d_2747EC	section	romdata abs=0x2747EC
FxRecord_2747EC:
	dl	FxFrames_2758FC,FxTiles_27B456,FxPal_28077C,FxMono_280B10,FxScript_28156D

d_274800	section	romdata abs=0x274800
FxRecord_274800:
	dl	FxFrames_275908,FxTiles_27AC58,FxPal_280664,FxMono_280B20,FxScript_28350F

d_274814	section	romdata abs=0x274814
FxRecord_274814:
	dl	FxFrames_275908,FxTiles_27AC58,FxPal_28066C,FxMono_280B20,FxScript_28350F

d_274828	section	romdata abs=0x274828
FxRecord_274828:
	dl	FxFrames_275908,FxTiles_27AC58,FxPal_280674,FxMono_280B20,FxScript_28350F

d_27483C	section	romdata abs=0x27483C
FxRecord_27483C:
	dl	FxFrames_275908,FxTiles_27AC58,FxPal_28067C,FxMono_280B20,FxScript_28350F

d_274850	section	romdata abs=0x274850
FxRecord_274850:
	dl	FxFrames_27590C,FxTiles_27AC58,FxPal_280664,FxMono_280B20,FxScript_282302

d_274864	section	romdata abs=0x274864
FxRecord_274864:
	dl	FxFrames_27590C,FxTiles_27AC58,FxPal_28066C,FxMono_280B20,FxScript_282302

d_274878	section	romdata abs=0x274878
FxRecord_274878:
	dl	FxFrames_27590C,FxTiles_27AC58,FxPal_280674,FxMono_280B20,FxScript_282302

d_27488C	section	romdata abs=0x27488C
FxRecord_27488C:
	dl	FxFrames_27590C,FxTiles_27AC58,FxPal_28067C,FxMono_280B20,FxScript_282302

d_2748A0	section	romdata abs=0x2748A0
FxRecord_2748A0:
	dl	FxFrames_275910,FxTiles_27C213,FxPal_2808C4,FxMono_280B0C,FxScript_2837F8

d_2748B4	section	romdata abs=0x2748B4
FxRecord_2748B4:
	dl	FxFrames_275910,FxTiles_27C213,FxPal_2808CC,FxMono_280B0C,FxScript_2837F8

d_2748C8	section	romdata abs=0x2748C8
FxRecord_2748C8:
	dl	FxFrames_275910,FxTiles_27C213,FxPal_2808D4,FxMono_280B0C,FxScript_2837F8

d_2748DC	section	romdata abs=0x2748DC
FxRecord_2748DC:
	dl	FxFrames_275910,FxTiles_27C213,FxPal_2808DC,FxMono_280B0C,FxScript_2837F8

d_2748F0	section	romdata abs=0x2748F0
FxRecord_2748F0:
	dl	FxFrames_275930,FxTiles_27C213,FxPal_2808C4,FxMono_280B0C,FxScript_283387

d_274904	section	romdata abs=0x274904
FxRecord_274904:
	dl	FxFrames_275930,FxTiles_27C213,FxPal_2808CC,FxMono_280B0C,FxScript_283387

d_274918	section	romdata abs=0x274918
FxRecord_274918:
	dl	FxFrames_275930,FxTiles_27C213,FxPal_2808D4,FxMono_280B0C,FxScript_283387

d_27492C	section	romdata abs=0x27492C
FxRecord_27492C:
	dl	FxFrames_275930,FxTiles_27C213,FxPal_2808DC,FxMono_280B0C,FxScript_283387

d_274940	section	romdata abs=0x274940
FxRecord_274940:
	dl	FxFrames_275950,FxTiles_27C213,FxPal_2808C4,FxMono_280B0C,FxScript_2832BE

d_274954	section	romdata abs=0x274954
FxRecord_274954:
	dl	FxFrames_275950,FxTiles_27C213,FxPal_2808CC,FxMono_280B0C,FxScript_2832BE

d_274968	section	romdata abs=0x274968
FxRecord_274968:
	dl	FxFrames_275950,FxTiles_27C213,FxPal_2808D4,FxMono_280B0C,FxScript_2832BE

d_27497C	section	romdata abs=0x27497C
FxRecord_27497C:
	dl	FxFrames_275950,FxTiles_27C213,FxPal_2808DC,FxMono_280B0C,FxScript_2832BE

d_274990	section	romdata abs=0x274990
FxRecord_274990:
	dl	FxFrames_275970,FxTiles_27C213,FxPal_2808C4,FxMono_280B0C,FxScript_2836DD

d_2749A4	section	romdata abs=0x2749A4
FxRecord_2749A4:
	dl	FxFrames_275970,FxTiles_27C213,FxPal_2808CC,FxMono_280B0C,FxScript_2836DD

d_2749B8	section	romdata abs=0x2749B8
FxRecord_2749B8:
	dl	FxFrames_275970,FxTiles_27C213,FxPal_2808D4,FxMono_280B0C,FxScript_2836DD

d_2749CC	section	romdata abs=0x2749CC
FxRecord_2749CC:
	dl	FxFrames_275970,FxTiles_27C213,FxPal_2808DC,FxMono_280B0C,FxScript_2836DD

d_2749E0	section	romdata abs=0x2749E0
FxRecord_2749E0:
	dl	FxFrames_275990,FxTiles_27D227,FxPal_280504,FxMono_280B10,FxScript_280CA7

d_2749F4	section	romdata abs=0x2749F4
FxRecord_2749F4:
	dl	FxFrames_2759B8,FxTiles_27DB30,FxPal_2807C4,FxMono_280B1C,FxScript_283C68

d_274A08	section	romdata abs=0x274A08
FxRecord_274A08:
	dl	FxFrames_2759C8,FxTiles_27F506,FxPal_280684,FxMono_280B10,FxScript_283CFD

d_274A1C	section	romdata abs=0x274A1C
FxRecord_274A1C:
	dl	FxFrames_2759C8,FxTiles_27F506,FxPal_28068C,FxMono_280B10,FxScript_283CFD

d_274A30	section	romdata abs=0x274A30
FxRecord_274A30:
	dl	FxFrames_2759C8,FxTiles_27F506,FxPal_280694,FxMono_280B10,FxScript_283CFD

d_274A44	section	romdata abs=0x274A44
FxRecord_274A44:
	dl	FxFrames_2759C8,FxTiles_27F506,FxPal_28069C,FxMono_280B10,FxScript_283CFD

d_274A58	section	romdata abs=0x274A58
FxRecord_274A58:
	dl	FxFrames_2759EC,FxTiles_27F506,FxPal_280684,FxMono_280B10,FxScript_283F95

d_274A6C	section	romdata abs=0x274A6C
FxRecord_274A6C:
	dl	FxFrames_2759EC,FxTiles_27F506,FxPal_28068C,FxMono_280B10,FxScript_283F95

d_274A80	section	romdata abs=0x274A80
FxRecord_274A80:
	dl	FxFrames_2759EC,FxTiles_27F506,FxPal_280694,FxMono_280B10,FxScript_283F95

d_274A94	section	romdata abs=0x274A94
FxRecord_274A94:
	dl	FxFrames_2759EC,FxTiles_27F506,FxPal_28069C,FxMono_280B10,FxScript_283F95

d_274AA8	section	romdata abs=0x274AA8
FxRecord_274AA8:
	dl	FxFrames_275A10,FxTiles_27FB33,FxPal_280544,FxMono_280B10,FxScript_281C45

d_274ABC	section	romdata abs=0x274ABC
FxRecord_274ABC:
	dl	FxFrames_275A10,FxTiles_27FB33,FxPal_28054C,FxMono_280B10,FxScript_281C45

d_274AD0	section	romdata abs=0x274AD0
FxRecord_274AD0:
	dl	FxFrames_275A10,FxTiles_27FB33,FxPal_280554,FxMono_280B10,FxScript_281C45

d_274AE4	section	romdata abs=0x274AE4
FxRecord_274AE4:
	dl	FxFrames_275A10,FxTiles_27FB33,FxPal_28055C,FxMono_280B10,FxScript_281C45

d_274AF8	section	romdata abs=0x274AF8
FxRecord_274AF8:
	dl	FxFrames_275A30,FxTiles_27FB33,FxPal_280544,FxMono_280B10,FxScript_282009

d_274B0C	section	romdata abs=0x274B0C
FxRecord_274B0C:
	dl	FxFrames_275A30,FxTiles_27FB33,FxPal_28054C,FxMono_280B10,FxScript_282009

d_274B20	section	romdata abs=0x274B20
FxRecord_274B20:
	dl	FxFrames_275A30,FxTiles_27FB33,FxPal_280554,FxMono_280B10,FxScript_282009

d_274B34	section	romdata abs=0x274B34
FxRecord_274B34:
	dl	FxFrames_275A30,FxTiles_27FB33,FxPal_28055C,FxMono_280B10,FxScript_282009

d_274B48	section	romdata abs=0x274B48
FxRecord_274B48:
	dl	FxFrames_275A70,FxTiles_27FB33,FxPal_280544,FxMono_280B10,FxScript_28267E

d_274B5C	section	romdata abs=0x274B5C
FxRecord_274B5C:
	dl	FxFrames_275A70,FxTiles_27FB33,FxPal_28054C,FxMono_280B10,FxScript_28267E

d_274B70	section	romdata abs=0x274B70
FxRecord_274B70:
	dl	FxFrames_275A70,FxTiles_27FB33,FxPal_280554,FxMono_280B10,FxScript_28267E

d_274B84	section	romdata abs=0x274B84
FxRecord_274B84:
	dl	FxFrames_275A70,FxTiles_27FB33,FxPal_28055C,FxMono_280B10,FxScript_28267E

d_274B98	section	romdata abs=0x274B98
FxRecord_274B98:
	dl	FxFrames_275AB0,FxTiles_27AC3C,FxPal_2807C4,FxMono_280B1C,FxScript_283200

d_274BAC	section	romdata abs=0x274BAC
FxRecord_274BAC:
	dl	FxFrames_275ABC,FxTiles_27C2E9,FxPal_2806A4,FxMono_280B10,FxScript_281E89

d_274BC0	section	romdata abs=0x274BC0
FxRecord_274BC0:
	dl	FxFrames_275ABC,FxTiles_27C2E9,FxPal_2806AC,FxMono_280B10,FxScript_281E89

d_274BD4	section	romdata abs=0x274BD4
FxRecord_274BD4:
	dl	FxFrames_275ABC,FxTiles_27C2E9,FxPal_2806B4,FxMono_280B10,FxScript_281E89

d_274BE8	section	romdata abs=0x274BE8
FxRecord_274BE8:
	dl	FxFrames_275ABC,FxTiles_27C2E9,FxPal_2806BC,FxMono_280B10,FxScript_281E89

d_274BFC	section	romdata abs=0x274BFC
FxRecord_274BFC:
	dl	FxFrames_275ACC,FxTiles_27C2E9,FxPal_2806A4,FxMono_280B10,FxScript_28137D

d_274C10	section	romdata abs=0x274C10
FxRecord_274C10:
	dl	FxFrames_275ACC,FxTiles_27C2E9,FxPal_2806AC,FxMono_280B10,FxScript_28137D

d_274C24	section	romdata abs=0x274C24
FxRecord_274C24:
	dl	FxFrames_275ACC,FxTiles_27C2E9,FxPal_2806B4,FxMono_280B10,FxScript_28137D

d_274C38	section	romdata abs=0x274C38
FxRecord_274C38:
	dl	FxFrames_275ACC,FxTiles_27C2E9,FxPal_2806BC,FxMono_280B10,FxScript_28137D

d_274C4C	section	romdata abs=0x274C4C
FxRecord_274C4C:
	dl	FxFrames_275ADC,FxTiles_27C299,FxPal_2807A4,FxMono_280B24,FxScript_281618

d_274C60	section	romdata abs=0x274C60
FxRecord_274C60:
	dl	FxFrames_275ADC,FxTiles_27C299,FxPal_2807AC,FxMono_280B24,FxScript_281618

d_274C74	section	romdata abs=0x274C74
FxRecord_274C74:
	dl	FxFrames_275AE0,FxTiles_27C299,FxPal_2807A4,FxMono_280B24,FxScript_283089

d_274C88	section	romdata abs=0x274C88
FxRecord_274C88:
	dl	FxFrames_275AE0,FxTiles_27C299,FxPal_2807AC,FxMono_280B24,FxScript_283089

d_274C9C	section	romdata abs=0x274C9C
FxRecord_274C9C:
	dl	FxFrames_275AE4,FxTiles_27D373,FxPal_2809A4,FxMono_280B20,FxScript_2830FA

d_274CB0	section	romdata abs=0x274CB0
FxRecord_274CB0:
	dl	FxFrames_275AE4,FxTiles_27D373,FxPal_2809AC,FxMono_280B20,FxScript_2830FA

d_274CC4	section	romdata abs=0x274CC4
FxRecord_274CC4:
	dl	FxFrames_275B00,FxTiles_27F2F6,FxPal_280864,FxMono_280B10,FxScript_2820D3

d_274CD8	section	romdata abs=0x274CD8
FxRecord_274CD8:
	dl	FxFrames_275B00,FxTiles_27F2F6,FxPal_28086C,FxMono_280B10,FxScript_2820D3

d_274CEC	section	romdata abs=0x274CEC
FxRecord_274CEC:
	dl	FxFrames_275B20,FxTiles_27C398,FxPal_280864,FxMono_280B10,FxScript_281AD0

d_274D00	section	romdata abs=0x274D00
FxRecord_274D00:
	dl	FxFrames_275B20,FxTiles_27C398,FxPal_28086C,FxMono_280B10,FxScript_281AD0

d_274D14	section	romdata abs=0x274D14
FxRecord_274D14:
	dl	FxFrames_275B60,FxTiles_279F62,FxPal_280A04,FxMono_280B10,FxScript_282420

d_274D28	section	romdata abs=0x274D28
FxRecord_274D28:
	dl	FxFrames_275B8C,FxTiles_279F62,FxPal_280A04,FxMono_280B10,FxScript_280B30

d_274D3C	section	romdata abs=0x274D3C
FxRecord_274D3C:
	dl	FxFrames_275BC4,FxTiles_27E4B0,FxPal_280584,FxMono_280B10,FxScript_282E21

d_274D50	section	romdata abs=0x274D50
FxRecord_274D50:
	dl	FxFrames_275C08,FxTiles_27E6EF,FxPal_280A84,FxMono_280B10,FxScript_283E37

d_274D64	section	romdata abs=0x274D64
FxRecord_274D64:
	dl	FxFrames_275C18,FxTiles_27C8C3,FxPal_280604,FxMono_280B10,FxScript_281530

d_274D78	section	romdata abs=0x274D78
FxRecord_274D78:
	dl	FxFrames_275C18,FxTiles_27C8C3,FxPal_28060C,FxMono_280B10,FxScript_281530

d_274D8C	section	romdata abs=0x274D8C
FxRecord_274D8C:
	dl	FxFrames_275C18,FxTiles_27C8C3,FxPal_280614,FxMono_280B10,FxScript_281530

d_274DA0	section	romdata abs=0x274DA0
FxRecord_274DA0:
	dl	FxFrames_275C18,FxTiles_27C8C3,FxPal_28061C,FxMono_280B10,FxScript_281530

d_274DB4	section	romdata abs=0x274DB4
FxRecord_274DB4:
	dl	FxFrames_275C24,FxTiles_27C8C3,FxPal_280604,FxMono_280B10,FxScript_282627

d_274DC8	section	romdata abs=0x274DC8
FxRecord_274DC8:
	dl	FxFrames_275C24,FxTiles_27C8C3,FxPal_28060C,FxMono_280B10,FxScript_282627

d_274DDC	section	romdata abs=0x274DDC
FxRecord_274DDC:
	dl	FxFrames_275C24,FxTiles_27C8C3,FxPal_280614,FxMono_280B10,FxScript_282627

d_274DF0	section	romdata abs=0x274DF0
FxRecord_274DF0:
	dl	FxFrames_275C24,FxTiles_27C8C3,FxPal_28061C,FxMono_280B10,FxScript_282627

d_274E04	section	romdata abs=0x274E04
FxRecord_274E04:
	dl	FxFrames_275C30,FxTiles_27DB4A,FxPal_2809C4,FxMono_280B10,FxScript_280C76

d_274E18	section	romdata abs=0x274E18
FxRecord_274E18:
	dl	FxFrames_275C30,FxTiles_27DB4A,FxPal_2809CC,FxMono_280B10,FxScript_280C76

d_274E2C	section	romdata abs=0x274E2C
FxRecord_274E2C:
	dl	FxFrames_275C30,FxTiles_27DB4A,FxPal_2809D4,FxMono_280B10,FxScript_280C76

d_274E40	section	romdata abs=0x274E40
FxRecord_274E40:
	dl	FxFrames_275C30,FxTiles_27DB4A,FxPal_2809DC,FxMono_280B10,FxScript_280C76

d_274E54	section	romdata abs=0x274E54
FxRecord_274E54:
	dl	FxFrames_275C48,FxTiles_27C213,FxPal_2808C4,FxMono_280B0C,FxScript_28237F

d_274E68	section	romdata abs=0x274E68
FxRecord_274E68:
	dl	FxFrames_275C48,FxTiles_27C213,FxPal_2808CC,FxMono_280B0C,FxScript_28237F

d_274E7C	section	romdata abs=0x274E7C
FxRecord_274E7C:
	dl	FxFrames_275C48,FxTiles_27C213,FxPal_2808D4,FxMono_280B0C,FxScript_28237F

d_274E90	section	romdata abs=0x274E90
FxRecord_274E90:
	dl	FxFrames_275C48,FxTiles_27C213,FxPal_2808DC,FxMono_280B0C,FxScript_28237F

d_274EA4	section	romdata abs=0x274EA4
FxRecord_274EA4:
	dl	FxFrames_275C68,FxTiles_27C213,FxPal_2808C4,FxMono_280B0C,FxScript_283D2E

d_274EB8	section	romdata abs=0x274EB8
FxRecord_274EB8:
	dl	FxFrames_275C68,FxTiles_27C213,FxPal_2808CC,FxMono_280B0C,FxScript_283D2E

d_274ECC	section	romdata abs=0x274ECC
FxRecord_274ECC:
	dl	FxFrames_275C68,FxTiles_27C213,FxPal_2808D4,FxMono_280B0C,FxScript_283D2E

d_274EE0	section	romdata abs=0x274EE0
FxRecord_274EE0:
	dl	FxFrames_275C68,FxTiles_27C213,FxPal_2808DC,FxMono_280B0C,FxScript_283D2E

d_274EF4	section	romdata abs=0x274EF4
FxRecord_274EF4:
	dl	FxFrames_275C88,FxTiles_27C213,FxPal_2808C4,FxMono_280B0C,FxScript_282BEB

d_274F08	section	romdata abs=0x274F08
FxRecord_274F08:
	dl	FxFrames_275C88,FxTiles_27C213,FxPal_2808CC,FxMono_280B0C,FxScript_282BEB

d_274F1C	section	romdata abs=0x274F1C
FxRecord_274F1C:
	dl	FxFrames_275C88,FxTiles_27C213,FxPal_2808D4,FxMono_280B0C,FxScript_282BEB

d_274F30	section	romdata abs=0x274F30
FxRecord_274F30:
	dl	FxFrames_275C88,FxTiles_27C213,FxPal_2808DC,FxMono_280B0C,FxScript_282BEB

d_274F44	section	romdata abs=0x274F44
FxRecord_274F44:
	dl	FxFrames_275CA8,FxTiles_27F220,FxPal_280704,FxMono_280B10,FxScript_282848

d_274F58	section	romdata abs=0x274F58
FxRecord_274F58:
	dl	FxFrames_275CAC,FxTiles_27F220,FxPal_280704,FxMono_280B10,FxScript_280EF0

d_274F6C	section	romdata abs=0x274F6C
FxRecord_274F6C:
	dl	FxFrames_275CB0,FxTiles_27DE8E,FxPal_280AC4,FxMono_280B10,FxScript_282F2A

d_274F80	section	romdata abs=0x274F80
FxRecord_274F80:
	dl	FxFrames_275CB0,FxTiles_27DE8E,FxPal_280ACC,FxMono_280B10,FxScript_282F2A

d_274F94	section	romdata abs=0x274F94
FxRecord_274F94:
	dl	FxFrames_275CB0,FxTiles_27DE8E,FxPal_280AD4,FxMono_280B10,FxScript_282F2A

d_274FA8	section	romdata abs=0x274FA8
FxRecord_274FA8:
	dl	FxFrames_275CB0,FxTiles_27DE8E,FxPal_280ADC,FxMono_280B10,FxScript_282F2A

d_274FBC	section	romdata abs=0x274FBC
FxRecord_274FBC:
	dl	FxFrames_275CC0,FxTiles_27DE8E,FxPal_280AC4,FxMono_280B10,FxScript_2827C3

d_274FD0	section	romdata abs=0x274FD0
FxRecord_274FD0:
	dl	FxFrames_275CC0,FxTiles_27DE8E,FxPal_280ACC,FxMono_280B10,FxScript_2827C3

d_274FE4	section	romdata abs=0x274FE4
FxRecord_274FE4:
	dl	FxFrames_275CC0,FxTiles_27DE8E,FxPal_280AD4,FxMono_280B10,FxScript_2827C3

d_274FF8	section	romdata abs=0x274FF8
FxRecord_274FF8:
	dl	FxFrames_275CC0,FxTiles_27DE8E,FxPal_280ADC,FxMono_280B10,FxScript_2827C3

d_27500C	section	romdata abs=0x27500C
FxRecord_27500C:
	dl	FxFrames_275CD0,FxTiles_27A3E7,FxPal_280A24,FxMono_280B28,FxScript_28346C

d_275020	section	romdata abs=0x275020
FxRecord_275020:
	dl	FxFrames_275D00,FxTiles_27A3E7,FxPal_280A24,FxMono_280B28,FxScript_282881

d_275034	section	romdata abs=0x275034
FxRecord_275034:
	dl	FxFrames_275D40,FxTiles_27D91B,FxPal_280784,FxMono_280B20,FxScript_281282

d_275048	section	romdata abs=0x275048
FxRecord_275048:
	dl	FxFrames_275D40,FxTiles_27D91B,FxPal_28078C,FxMono_280B20,FxScript_281282

d_27505C	section	romdata abs=0x27505C
FxRecord_27505C:
	dl	FxFrames_275D40,FxTiles_27D91B,FxPal_280794,FxMono_280B20,FxScript_281282

d_275070	section	romdata abs=0x275070
FxRecord_275070:
	dl	FxFrames_275D40,FxTiles_27D91B,FxPal_28079C,FxMono_280B20,FxScript_281282

d_275084	section	romdata abs=0x275084
FxRecord_275084:
	dl	FxFrames_275D54,FxTiles_27E78F,FxPal_280884,FxMono_280B10,FxScript_281433

d_275098	section	romdata abs=0x275098
FxRecord_275098:
	dl	FxFrames_275D54,FxTiles_27E78F,FxPal_28088C,FxMono_280B10,FxScript_281433

d_2750AC	section	romdata abs=0x2750AC
FxRecord_2750AC:
	dl	FxFrames_275D54,FxTiles_27E78F,FxPal_280894,FxMono_280B10,FxScript_281433

d_2750C0	section	romdata abs=0x2750C0
FxRecord_2750C0:
	dl	FxFrames_275D54,FxTiles_27E78F,FxPal_28089C,FxMono_280B10,FxScript_281433

d_2750D4	section	romdata abs=0x2750D4
FxRecord_2750D4:
	dl	FxFrames_275D94,FxTiles_27E78F,FxPal_280884,FxMono_280B10,FxScript_2835B0

d_2750E8	section	romdata abs=0x2750E8
FxRecord_2750E8:
	dl	FxFrames_275D94,FxTiles_27E78F,FxPal_28088C,FxMono_280B10,FxScript_2835B0

d_2750FC	section	romdata abs=0x2750FC
FxRecord_2750FC:
	dl	FxFrames_275D94,FxTiles_27E78F,FxPal_280894,FxMono_280B10,FxScript_2835B0

d_275110	section	romdata abs=0x275110
FxRecord_275110:
	dl	FxFrames_275D94,FxTiles_27E78F,FxPal_28089C,FxMono_280B10,FxScript_2835B0

d_275124	section	romdata abs=0x275124
FxRecord_275124:
	dl	FxFrames_275DD4,FxTiles_27A92E,FxPal_280604,FxMono_280B10,FxScript_2837A6

d_275138	section	romdata abs=0x275138
FxRecord_275138:
	dl	FxFrames_275DD4,FxTiles_27A92E,FxPal_28060C,FxMono_280B10,FxScript_2837A6

d_27514C	section	romdata abs=0x27514C
FxRecord_27514C:
	dl	FxFrames_275DD4,FxTiles_27A92E,FxPal_280614,FxMono_280B10,FxScript_2837A6

d_275160	section	romdata abs=0x275160
FxRecord_275160:
	dl	FxFrames_275DD4,FxTiles_27A92E,FxPal_28061C,FxMono_280B10,FxScript_2837A6

d_275174	section	romdata abs=0x275174
FxRecord_275174:
	dl	FxFrames_275DE0,FxTiles_27A92E,FxPal_280604,FxMono_280B10,FxScript_281364

d_275188	section	romdata abs=0x275188
FxRecord_275188:
	dl	FxFrames_275DE0,FxTiles_27A92E,FxPal_28060C,FxMono_280B10,FxScript_281364

d_27519C	section	romdata abs=0x27519C
FxRecord_27519C:
	dl	FxFrames_275DE0,FxTiles_27A92E,FxPal_280614,FxMono_280B10,FxScript_281364

d_2751B0	section	romdata abs=0x2751B0
FxRecord_2751B0:
	dl	FxFrames_275DE0,FxTiles_27A92E,FxPal_28061C,FxMono_280B10,FxScript_281364

d_2751C4	section	romdata abs=0x2751C4
FxRecord_2751C4:
	dl	FxFrames_275DEC,FxTiles_27B32B,FxPal_280724,FxMono_280B10,FxScript_281CC3

d_2751D8	section	romdata abs=0x2751D8
FxRecord_2751D8:
	dl	FxFrames_275E14,FxTiles_27EBE6,FxPal_280A44,FxMono_280B10,FxScript_2824CD

d_2751EC	section	romdata abs=0x2751EC
FxRecord_2751EC:
	dl	FxFrames_275E38,FxTiles_27DA68,FxPal_280804,FxMono_280B08,FxScript_2817F1

d_275200	section	romdata abs=0x275200
FxRecord_275200:
	dl	FxFrames_275E4C,FxTiles_27BAD5,FxPal_280604,FxMono_280B10,FxScript_2817B4

d_275214	section	romdata abs=0x275214
FxRecord_275214:
	dl	FxFrames_275E4C,FxTiles_27BAD5,FxPal_28060C,FxMono_280B10,FxScript_2817B4

d_275228	section	romdata abs=0x275228
FxRecord_275228:
	dl	FxFrames_275E4C,FxTiles_27BAD5,FxPal_280614,FxMono_280B10,FxScript_2817B4

d_27523C	section	romdata abs=0x27523C
FxRecord_27523C:
	dl	FxFrames_275E4C,FxTiles_27BAD5,FxPal_28061C,FxMono_280B10,FxScript_2817B4

d_275250	section	romdata abs=0x275250
FxRecord_275250:
	dl	FxFrames_275E5C,FxTiles_27BAD5,FxPal_280604,FxMono_280B10,FxScript_282148

d_275264	section	romdata abs=0x275264
FxRecord_275264:
	dl	FxFrames_275E5C,FxTiles_27BAD5,FxPal_28060C,FxMono_280B10,FxScript_282148

d_275278	section	romdata abs=0x275278
FxRecord_275278:
	dl	FxFrames_275E5C,FxTiles_27BAD5,FxPal_280614,FxMono_280B10,FxScript_282148

d_27528C	section	romdata abs=0x27528C
FxRecord_27528C:
	dl	FxFrames_275E5C,FxTiles_27BAD5,FxPal_28061C,FxMono_280B10,FxScript_282148

d_2752A0	section	romdata abs=0x2752A0
FxRecord_2752A0:
	dl	FxFrames_275E6C,FxTiles_27F2AA,FxPal_280744,FxMono_280B08,FxScript_2818BB

d_2752B4	section	romdata abs=0x2752B4
FxRecord_2752B4:
	dl	FxFrames_275E6C,FxTiles_27F2AA,FxPal_28074C,FxMono_280B08,FxScript_2818BB

d_2752C8	section	romdata abs=0x2752C8
FxRecord_2752C8:
	dl	FxFrames_275E6C,FxTiles_27F2AA,FxPal_280754,FxMono_280B08,FxScript_2818BB

d_2752DC	section	romdata abs=0x2752DC
FxRecord_2752DC:
	dl	FxFrames_275E6C,FxTiles_27F2AA,FxPal_28075C,FxMono_280B08,FxScript_2818BB

d_2752F0	section	romdata abs=0x2752F0
FxRecord_2752F0:
	dl	FxFrames_275E9C,FxTiles_27FD38,FxPal_280944,FxMono_280B18,FxScript_280F25

d_275304	section	romdata abs=0x275304
FxRecord_275304:
	dl	FxFrames_275EC8,FxTiles_27F4E7,FxPal_2807C4,FxMono_280B1C,FxScript_282F73

d_275318	section	romdata abs=0x275318
FxRecord_275318:
	dl	FxFrames_275ED4,FxTiles_27C62B,FxPal_280984,FxMono_280B10,FxScript_2824F6

d_27532C	section	romdata abs=0x27532C
FxRecord_27532C:
	dl	FxFrames_275F00,FxTiles_28027B,FxPal_280A64,FxMono_280B10,FxScript_2838DD

d_275340	section	romdata abs=0x275340
FxRecord_275340:
	dl	FxFrames_275F00,FxTiles_28027B,FxPal_280A6C,FxMono_280B10,FxScript_2838DD

d_275354	section	romdata abs=0x275354
FxRecord_275354:
	dl	FxFrames_275F00,FxTiles_28027B,FxPal_280A74,FxMono_280B10,FxScript_2838DD

d_275368	section	romdata abs=0x275368
FxRecord_275368:
	dl	FxFrames_275F00,FxTiles_28027B,FxPal_280A7C,FxMono_280B10,FxScript_2838DD

d_27537C	section	romdata abs=0x27537C
FxRecord_27537C:
	dl	FxFrames_275F18,FxTiles_28027B,FxPal_280A64,FxMono_280B10,FxScript_2834DA

d_275390	section	romdata abs=0x275390
FxRecord_275390:
	dl	FxFrames_275F18,FxTiles_28027B,FxPal_280A6C,FxMono_280B10,FxScript_2834DA

d_2753A4	section	romdata abs=0x2753A4
FxRecord_2753A4:
	dl	FxFrames_275F18,FxTiles_28027B,FxPal_280A74,FxMono_280B10,FxScript_2834DA

d_2753B8	section	romdata abs=0x2753B8
FxRecord_2753B8:
	dl	FxFrames_275F18,FxTiles_28027B,FxPal_280A7C,FxMono_280B10,FxScript_2834DA

d_2753CC	section	romdata abs=0x2753CC
FxRecord_2753CC:
	dl	FxFrames_275F30,FxTiles_27FAEF,FxPal_2806E4,FxMono_280B18,FxScript_282848

d_2753E0	section	romdata abs=0x2753E0
FxRecord_2753E0:
	dl	FxFrames_275F34,FxTiles_27FAEF,FxPal_2806E4,FxMono_280B18,FxScript_280EF0

d_2753F4	section	romdata abs=0x2753F4
FxRecord_2753F4:
	dl	FxFrames_275F38,FxTiles_28027B,FxPal_280A64,FxMono_280B10,FxScript_2837C7

d_275408	section	romdata abs=0x275408
FxRecord_275408:
	dl	FxFrames_275F38,FxTiles_28027B,FxPal_280A6C,FxMono_280B10,FxScript_2837C7

d_27541C	section	romdata abs=0x27541C
FxRecord_27541C:
	dl	FxFrames_275F38,FxTiles_28027B,FxPal_280A74,FxMono_280B10,FxScript_2837C7

d_275430	section	romdata abs=0x275430
FxRecord_275430:
	dl	FxFrames_275F38,FxTiles_28027B,FxPal_280A7C,FxMono_280B10,FxScript_2837C7

d_275444	section	romdata abs=0x275444
FxRecord_275444:
	dl	FxFrames_275F50,FxTiles_28027B,FxPal_280A64,FxMono_280B10,FxScript_283912

d_275458	section	romdata abs=0x275458
FxRecord_275458:
	dl	FxFrames_275F50,FxTiles_28027B,FxPal_280A6C,FxMono_280B10,FxScript_283912

d_27546C	section	romdata abs=0x27546C
FxRecord_27546C:
	dl	FxFrames_275F50,FxTiles_28027B,FxPal_280A74,FxMono_280B10,FxScript_283912

d_275480	section	romdata abs=0x275480
FxRecord_275480:
	dl	FxFrames_275F50,FxTiles_28027B,FxPal_280A7C,FxMono_280B10,FxScript_283912

d_275494	section	romdata abs=0x275494
FxRecord_275494:
	dl	FxFrames_275F68,FxTiles_27B14A,FxPal_280644,FxMono_280B10,FxScript_2815EB

d_2754A8	section	romdata abs=0x2754A8
FxRecord_2754A8:
	dl	FxFrames_275F78,FxTiles_27B681,FxPal_280824,FxMono_280B10,FxScript_2840FF

d_2754BC	section	romdata abs=0x2754BC
FxRecord_2754BC:
	dl	FxFrames_275F8C,FxTiles_27CB47,FxPal_2806C4,FxMono_280B10,FxScript_281635

d_2754D0	section	romdata abs=0x2754D0
FxRecord_2754D0:
	dl	FxFrames_275F8C,FxTiles_27CB47,FxPal_2806CC,FxMono_280B10,FxScript_281635

d_2754E4	section	romdata abs=0x2754E4
FxRecord_2754E4:
	dl	FxFrames_275F8C,FxTiles_27CB47,FxPal_2806D4,FxMono_280B10,FxScript_281635

d_2754F8	section	romdata abs=0x2754F8
FxRecord_2754F8:
	dl	FxFrames_275F8C,FxTiles_27CB47,FxPal_2806DC,FxMono_280B10,FxScript_281635

d_27550C	section	romdata abs=0x27550C
FxRecord_27550C:
	dl	FxFrames_275F98,FxTiles_27C044,FxPal_280524,FxMono_280B10,FxScript_281F8F

d_275520	section	romdata abs=0x275520
FxRecord_275520:
	dl	FxFrames_275F98,FxTiles_27C044,FxPal_28052C,FxMono_280B10,FxScript_281F8F

d_275534	section	romdata abs=0x275534
FxRecord_275534:
	dl	FxFrames_275F98,FxTiles_27C044,FxPal_280534,FxMono_280B10,FxScript_281F8F

d_275548	section	romdata abs=0x275548
FxRecord_275548:
	dl	FxFrames_275F98,FxTiles_27C044,FxPal_28053C,FxMono_280B10,FxScript_281F8F

d_27555C	section	romdata abs=0x27555C
FxRecord_27555C:
	dl	FxFrames_275FAC,FxTiles_27E22F,FxPal_2805A4,FxMono_280B10,FxScript_283F88

d_275570	section	romdata abs=0x275570
FxRecord_275570:
	dl	FxFrames_275FAC,FxTiles_27E22F,FxPal_2805AC,FxMono_280B10,FxScript_283F88

d_275584	section	romdata abs=0x275584
FxRecord_275584:
	dl	FxFrames_275FAC,FxTiles_27E22F,FxPal_2805B4,FxMono_280B10,FxScript_283F88

d_275598	section	romdata abs=0x275598
FxRecord_275598:
	dl	FxFrames_275FAC,FxTiles_27E22F,FxPal_2805BC,FxMono_280B10,FxScript_283F88

d_2755AC	section	romdata abs=0x2755AC
FxRecord_2755AC:
	dl	FxFrames_275FB8,FxTiles_27BB5F,FxPal_2804E4,FxMono_280B10,FxScript_2818A2

d_2755C0	section	romdata abs=0x2755C0
FxRecord_2755C0:
	dl	FxFrames_275FB8,FxTiles_27BB5F,FxPal_2804EC,FxMono_280B10,FxScript_2818A2

d_2755D4	section	romdata abs=0x2755D4
FxRecord_2755D4:
	dl	FxFrames_275FB8,FxTiles_27BB5F,FxPal_2804F4,FxMono_280B10,FxScript_2818A2

d_2755E8	section	romdata abs=0x2755E8
FxRecord_2755E8:
	dl	FxFrames_275FB8,FxTiles_27BB5F,FxPal_2804FC,FxMono_280B10,FxScript_2818A2

d_2755FC	section	romdata abs=0x2755FC
FxRecord_2755FC:
	dl	FxFrames_275FCC,FxTiles_27B064,FxPal_280924,FxMono_280B2C,FxScript_28265D

d_275610	section	romdata abs=0x275610
FxRecord_275610:
	dl	FxFrames_275FD0,FxTiles_27B064,FxPal_280924,FxMono_280B2C,FxScript_281797

d_275624	section	romdata abs=0x275624
FxRecord_275624:
	dl	FxFrames_275FD4,FxTiles_27ABDC,FxPal_280964,FxMono_280B04,FxScript_281FA4

d_275638	section	romdata abs=0x275638
FxRecord_275638:
	dl	FxFrames_275FDC,FxTiles_27ABDC,FxPal_280964,FxMono_280B04,FxScript_280BD1

d_27564C	section	romdata abs=0x27564C
FxRecord_27564C:
	dl	FxFrames_275FE4,FxTiles_27CB28,FxPal_2807C4,FxMono_280B1C,FxScript_282062

d_275660	section	romdata abs=0x275660
FxRecord_275660:
	dl	FxFrames_275FF0,FxTiles_27E1E2,FxPal_280904,FxMono_280B14,FxScript_280E15

d_275674	section	romdata abs=0x275674
FxRecord_275674:
	dl	FxFrames_275FF4,FxTiles_27E1E2,FxPal_280904,FxMono_280B14,FxScript_281396

d_275688	section	romdata abs=0x275688
FxRecord_275688:
	dl	FxFrames_275FF8,FxTiles_27A9B3,FxPal_2805E4,FxMono_280B24,FxScript_280E00

d_27569C	section	romdata abs=0x27569C
FxRecord_27569C:
	dl	FxFrames_27600C,FxTiles_27DF04,FxPal_2809E4,FxMono_280B10,FxScript_282FE4

d_2756B0	section	romdata abs=0x2756B0
FxRecord_2756B0:
	dl	FxFrames_276028,FxTiles_27F262,FxPal_280884,FxMono_280B10,FxScript_281642

d_2756C4	section	romdata abs=0x2756C4
FxRecord_2756C4:
	dl	FxFrames_276048,FxTiles_27FCF0,FxPal_280884,FxMono_280B10,FxScript_282165

d_2756D8	section	romdata abs=0x2756D8
FxRecord_2756D8:
	dl	FxFrames_276068,FxTiles_28034F,FxPal_280844,FxMono_280B10,FxScript_282644

d_2756EC	section	romdata abs=0x2756EC
FxRecord_2756EC:
	dl	FxFrames_276068,FxTiles_28034F,FxPal_28084C,FxMono_280B10,FxScript_282644

d_275700	section	romdata abs=0x275700
FxRecord_275700:
	dl	FxFrames_276068,FxTiles_28034F,FxPal_280854,FxMono_280B10,FxScript_282644

d_275714	section	romdata abs=0x275714
FxRecord_275714:
	dl	FxFrames_276068,FxTiles_28034F,FxPal_28085C,FxMono_280B10,FxScript_282644

d_275728	section	romdata abs=0x275728
FxRecord_275728:
	dl	FxFrames_276080,FxTiles_27ED3D,FxPal_2807E4,FxMono_280B20,FxScript_281E48

d_27573C	section	romdata abs=0x27573C
FxRecord_27573C:
	dl	FxFrames_276080,FxTiles_27ED3D,FxPal_2807EC,FxMono_280B20,FxScript_281E48

d_275750	section	romdata abs=0x275750
FxRecord_275750:
	dl	FxFrames_276080,FxTiles_27ED3D,FxPal_2807F4,FxMono_280B20,FxScript_281E48

d_275764	section	romdata abs=0x275764
FxRecord_275764:
	dl	FxFrames_2760A0,FxTiles_27CD18,FxPal_280624,FxMono_280B10,FxScript_283271

d_275778	section	romdata abs=0x275778
FxRecord_275778:
	dl	FxFrames_2760A0,FxTiles_27CD18,FxPal_28062C,FxMono_280B10,FxScript_283271

d_27578C	section	romdata abs=0x27578C
FxRecord_27578C:
	dl	FxFrames_2760A0,FxTiles_27CD18,FxPal_280634,FxMono_280B10,FxScript_283271

d_2757A0	section	romdata abs=0x2757A0
FxRecord_2757A0:
	dl	FxFrames_2760CC,FxTiles_27ACA0,FxPal_280624,FxMono_280B10,FxScript_281297

d_2757B4	section	romdata abs=0x2757B4
FxRecord_2757B4:
	dl	FxFrames_2760CC,FxTiles_27ACA0,FxPal_28062C,FxMono_280B10,FxScript_281297

d_2757C8	section	romdata abs=0x2757C8
FxRecord_2757C8:
	dl	FxFrames_2760CC,FxTiles_27ACA0,FxPal_280634,FxMono_280B10,FxScript_281297

d_2757DC	section	romdata abs=0x2757DC
FxRecord_2757DC:
	dl	FxFrames_27611C,FxTiles_27FDF3,FxPal_2808E4,FxMono_280B24,FxScript_281F0E

d_2757F0	section	romdata abs=0x2757F0
FxRecord_2757F0:
	dl	FxFrames_27611C,FxTiles_27FDF3,FxPal_2808EC,FxMono_280B24,FxScript_281F0E

d_275804	section	romdata abs=0x275804
FxRecord_275804:
	dl	FxFrames_27611C,FxTiles_27FDF3,FxPal_2808F4,FxMono_280B24,FxScript_281F0E

d_275818	section	romdata abs=0x275818
FxRecord_275818:
	dl	FxFrames_276124,FxTiles_27C935,FxPal_280AE4,FxMono_280B10,FxScript_283943

d_27582C	section	romdata abs=0x27582C
FxRecord_27582C:
	dl	FxFrames_276174,FxTiles_27B43A,FxPal_2807C4,FxMono_280B1C,FxScript_28157A

d_275840	section	romdata abs=0x275840
FxRecord_275840:
	dl	FxFrames_276180,FxTiles_27D0A8,FxPal_2805C4,FxMono_280B10,FxScript_28314B

d_275854	section	romdata abs=0x275854
FxRecord_275854:
	dl	FxFrames_27618C,FxTiles_27C7B6,FxPal_2808A4,FxMono_280B10,FxScript_283FC6

d_275868	section	romdata abs=0x275868
FxFrames_275868:
	dl	FxFrame_2775FC
	dl	FxFrame_27848A
	dl	FxFrame_277798
	dl	FxFrame_276EA6
	dl	FxFrame_278554
	dl	FxFrame_276748
	dl	FxFrame_2781D0
	dl	FxFrame_279404
	dl	FxFrame_277244
	dl	FxFrame_2799CA
	dl	FxFrame_2776F6
	dl	FxFrame_2793E8
	dl	FxFrame_279A7C
	dl	FxFrame_27688E

d_2758A0	section	romdata abs=0x2758A0
FxFrames_2758A0:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_276C3A

d_2758AC	section	romdata abs=0x2758AC
FxFrames_2758AC:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_276C3A

d_2758B8	section	romdata abs=0x2758B8
FxFrames_2758B8:
	dl	FxFrame_27673E
	dl	FxFrame_2775D2
	dl	FxFrame_276B12
	dl	FxFrame_279796

d_2758C8	section	romdata abs=0x2758C8
FxFrames_2758C8:
	dl	FxFrame_27673E
	dl	FxFrame_276338
	dl	FxFrame_276D38
	dl	FxFrame_276788
	dl	FxFrame_27925E
	dl	FxFrame_276CD4

d_2758E0	section	romdata abs=0x2758E0
FxFrames_2758E0:
	dl	FxFrame_278216
	dl	FxFrame_277B58
	dl	FxFrame_278E68
	dl	FxFrame_276590
	dl	FxFrame_277444
	dl	FxFrame_277FA0
	dl	FxFrame_278442

d_2758FC	section	romdata abs=0x2758FC
FxFrames_2758FC:
	dl	FxFrame_277F7E
	dl	FxFrame_27985C
	dl	FxFrame_278568

d_275908	section	romdata abs=0x275908
FxFrames_275908:
	dl	FxFrame_27673E

d_27590C	section	romdata abs=0x27590C
FxFrames_27590C:
	dl	FxFrame_27673E

d_275910	section	romdata abs=0x275910
FxFrames_275910:
	dl	FxFrame_27682E
	dl	FxFrame_278CF0
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_27675C
	dl	FxFrame_2781E8
	dl	FxFrame_276F04
	dl	FxFrame_2781E8

d_275930	section	romdata abs=0x275930
FxFrames_275930:
	dl	FxFrame_27682E
	dl	FxFrame_278CF0
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_27675C
	dl	FxFrame_2781E8
	dl	FxFrame_276F04
	dl	FxFrame_2781E8

d_275950	section	romdata abs=0x275950
FxFrames_275950:
	dl	FxFrame_27682E
	dl	FxFrame_278CF0
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_27675C
	dl	FxFrame_2781E8
	dl	FxFrame_276F04
	dl	FxFrame_2781E8

d_275970	section	romdata abs=0x275970
FxFrames_275970:
	dl	FxFrame_27682E
	dl	FxFrame_278CF0
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_27675C
	dl	FxFrame_2781E8
	dl	FxFrame_276F04
	dl	FxFrame_2781E8

d_275990	section	romdata abs=0x275990
FxFrames_275990:
	dl	FxFrame_27781E
	dl	FxFrame_276800
	dl	FxFrame_276A02
	dl	FxFrame_276C88
	dl	FxFrame_27677E
	dl	FxFrame_276896
	dl	FxFrame_276E9C
	dl	FxFrame_2787E6
	dl	FxFrame_2790DC
	dl	FxFrame_27773C

d_2759B8	section	romdata abs=0x2759B8
FxFrames_2759B8:
	dl	FxFrame_2778D4
	dl	FxFrame_278776
	dl	FxFrame_2770FA
	dl	FxFrame_276986

d_2759C8	section	romdata abs=0x2759C8
FxFrames_2759C8:
	dl	FxFrame_2779A4
	dl	FxFrame_277030
	dl	FxFrame_27862E
	dl	FxFrame_27862E
	dl	FxFrame_278B68
	dl	FxFrame_276DBE
	dl	FxFrame_2796BA
	dl	FxFrame_27810E
	dl	FxFrame_27810E

d_2759EC	section	romdata abs=0x2759EC
FxFrames_2759EC:
	dl	FxFrame_2779A4
	dl	FxFrame_277030
	dl	FxFrame_27862E
	dl	FxFrame_27862E
	dl	FxFrame_278B68
	dl	FxFrame_276DBE
	dl	FxFrame_2796BA
	dl	FxFrame_27810E
	dl	FxFrame_27810E

d_275A10	section	romdata abs=0x275A10
FxFrames_275A10:
	dl	FxFrame_279418
	dl	FxFrame_27681A
	dl	FxFrame_277838
	dl	FxFrame_278992
	dl	FxFrame_27868C
	dl	FxFrame_276324
	dl	FxFrame_278784
	dl	FxFrame_2798A4

d_275A30	section	romdata abs=0x275A30
FxFrames_275A30:
	dl	FxFrame_279418
	dl	FxFrame_27681A
	dl	FxFrame_277838
	dl	FxFrame_278992
	dl	FxFrame_27868C
	dl	FxFrame_276324
	dl	FxFrame_278784
	dl	FxFrame_2798A4
	dl	FxFrame_2786A0
	dl	FxFrame_279164
	dl	FxFrame_278CA6
	dl	FxFrame_2769A0
	dl	FxFrame_2781F2
	dl	FxFrame_276876
	dl	FxFrame_27872C
	dl	FxFrame_276EBA

d_275A70	section	romdata abs=0x275A70
FxFrames_275A70:
	dl	FxFrame_279418
	dl	FxFrame_27681A
	dl	FxFrame_277838
	dl	FxFrame_278992
	dl	FxFrame_27868C
	dl	FxFrame_276324
	dl	FxFrame_278784
	dl	FxFrame_2798A4
	dl	FxFrame_2786A0
	dl	FxFrame_279164
	dl	FxFrame_278CA6
	dl	FxFrame_2769A0
	dl	FxFrame_2781F2
	dl	FxFrame_276876
	dl	FxFrame_27872C
	dl	FxFrame_276EBA

d_275AB0	section	romdata abs=0x275AB0
FxFrames_275AB0:
	dl	FxFrame_2789DC
	dl	FxFrame_2770FA
	dl	FxFrame_2799C6

d_275ABC	section	romdata abs=0x275ABC
FxFrames_275ABC:
	dl	FxFrame_276FAA
	dl	FxFrame_2793C6
	dl	FxFrame_2790B0
	dl	FxFrame_279302

d_275ACC	section	romdata abs=0x275ACC
FxFrames_275ACC:
	dl	FxFrame_276FAA
	dl	FxFrame_2793C6
	dl	FxFrame_2790B0
	dl	FxFrame_279302

d_275ADC	section	romdata abs=0x275ADC
FxFrames_275ADC:
	dl	FxFrame_277322

d_275AE0	section	romdata abs=0x275AE0
FxFrames_275AE0:
	dl	FxFrame_277322

d_275AE4	section	romdata abs=0x275AE4
FxFrames_275AE4:
	dl	FxFrame_279664
	dl	FxFrame_278A3E
	dl	FxFrame_27765A
	dl	FxFrame_2784BE
	dl	FxFrame_2777D6
	dl	FxFrame_27881C
	dl	FxFrame_276316

d_275B00	section	romdata abs=0x275B00
FxFrames_275B00:
	dl	FxFrame_278848
	dl	FxFrame_2783FA
	dl	FxFrame_2794F0
	dl	FxFrame_2789FA
	dl	FxFrame_278078
	dl	FxFrame_27720A
	dl	FxFrame_279842
	dl	FxFrame_276C66

d_275B20	section	romdata abs=0x275B20
FxFrames_275B20:
	dl	FxFrame_278848
	dl	FxFrame_2783FA
	dl	FxFrame_2794F0
	dl	FxFrame_2789FA
	dl	FxFrame_278078
	dl	FxFrame_27720A
	dl	FxFrame_279842
	dl	FxFrame_276C66
	dl	FxFrame_2799AC
	dl	FxFrame_2792E8
	dl	FxFrame_277954
	dl	FxFrame_277F64
	dl	FxFrame_276A20
	dl	FxFrame_279A58
	dl	FxFrame_278C1E
	dl	FxFrame_27842C

d_275B60	section	romdata abs=0x275B60
FxFrames_275B60:
	dl	FxFrame_276AC0
	dl	FxFrame_278B1E
	dl	FxFrame_2793EC
	dl	FxFrame_279A80
	dl	FxFrame_276892
	dl	FxFrame_276C36
	dl	FxFrame_277292
	dl	FxFrame_277B54
	dl	FxFrame_277F02
	dl	FxFrame_276B46
	dl	FxFrame_2799DE

d_275B8C	section	romdata abs=0x275B8C
FxFrames_275B8C:
	dl	FxFrame_276AC0
	dl	FxFrame_278B1E
	dl	FxFrame_2793EC
	dl	FxFrame_279A80
	dl	FxFrame_276892
	dl	FxFrame_276C36
	dl	FxFrame_277292
	dl	FxFrame_277B54
	dl	FxFrame_277F02
	dl	FxFrame_276B46
	dl	FxFrame_2799DE
	dl	FxFrame_2785CC
	dl	FxFrame_277100
	dl	FxFrame_279522

d_275BC4	section	romdata abs=0x275BC4
FxFrames_275BC4:
	dl	FxFrame_2762E4
	dl	FxFrame_27686E
	dl	FxFrame_277A6E
	dl	FxFrame_276C52
	dl	FxFrame_277AC8
	dl	FxFrame_27725E
	dl	FxFrame_2781A2
	dl	FxFrame_27918A
	dl	FxFrame_2761BC
	dl	FxFrame_279C20
	dl	FxFrame_2781CC
	dl	FxFrame_2787E2
	dl	FxFrame_276E88
	dl	FxFrame_2782E8
	dl	FxFrame_276C44
	dl	FxFrame_2781C2
	dl	FxFrame_276A2A

d_275C08	section	romdata abs=0x275C08
FxFrames_275C08:
	dl	FxFrame_278A2C
	dl	FxFrame_278B72
	dl	FxFrame_279956
	dl	FxFrame_2783BE

d_275C18	section	romdata abs=0x275C18
FxFrames_275C18:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_27843E

d_275C24	section	romdata abs=0x275C24
FxFrames_275C24:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_27843E

d_275C30	section	romdata abs=0x275C30
FxFrames_275C30:
	dl	FxFrame_277D36
	dl	FxFrame_277CE4
	dl	FxFrame_278880
	dl	FxFrame_278DD8
	dl	FxFrame_27893E
	dl	FxFrame_277A86

d_275C48	section	romdata abs=0x275C48
FxFrames_275C48:
	dl	FxFrame_27682E
	dl	FxFrame_278CF0
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_27675C
	dl	FxFrame_2781E8
	dl	FxFrame_276F04
	dl	FxFrame_2781E8

d_275C68	section	romdata abs=0x275C68
FxFrames_275C68:
	dl	FxFrame_27682E
	dl	FxFrame_278CF0
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_27675C
	dl	FxFrame_2781E8
	dl	FxFrame_276F04
	dl	FxFrame_2781E8

d_275C88	section	romdata abs=0x275C88
FxFrames_275C88:
	dl	FxFrame_27682E
	dl	FxFrame_278CF0
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_27675C
	dl	FxFrame_2781E8
	dl	FxFrame_276F04
	dl	FxFrame_2781E8

d_275CA8	section	romdata abs=0x275CA8
FxFrames_275CA8:
	dl	FxFrame_27673E

d_275CAC	section	romdata abs=0x275CAC
FxFrames_275CAC:
	dl	FxFrame_27673E

d_275CB0	section	romdata abs=0x275CB0
FxFrames_275CB0:
	dl	FxFrame_279C16
	dl	FxFrame_278934
	dl	FxFrame_276D8C
	dl	FxFrame_27621A

d_275CC0	section	romdata abs=0x275CC0
FxFrames_275CC0:
	dl	FxFrame_279C16
	dl	FxFrame_278934
	dl	FxFrame_276D8C
	dl	FxFrame_27621A

d_275CD0	section	romdata abs=0x275CD0
FxFrames_275CD0:
	dl	FxFrame_27673E
	dl	FxFrame_27754C
	dl	FxFrame_277634
	dl	FxFrame_27936A
	dl	FxFrame_2761DC
	dl	FxFrame_278158
	dl	FxFrame_278D76
	dl	FxFrame_276904
	dl	FxFrame_276DB4
	dl	FxFrame_278678
	dl	FxFrame_27949C
	dl	FxFrame_27688A

d_275D00	section	romdata abs=0x275D00
FxFrames_275D00:
	dl	FxFrame_27673E
	dl	FxFrame_27754C
	dl	FxFrame_277634
	dl	FxFrame_27936A
	dl	FxFrame_2761DC
	dl	FxFrame_278158
	dl	FxFrame_278D76
	dl	FxFrame_276904
	dl	FxFrame_276DB4
	dl	FxFrame_278678
	dl	FxFrame_27949C
	dl	FxFrame_27688A
	dl	FxFrame_276C4E
	dl	FxFrame_276A26
	dl	FxFrame_277240
	dl	FxFrame_278206

d_275D40	section	romdata abs=0x275D40
FxFrames_275D40:
	dl	FxFrame_278FC0
	dl	FxFrame_276C1C
	dl	FxFrame_2772A0
	dl	FxFrame_279178
	dl	FxFrame_276996

d_275D54	section	romdata abs=0x275D54
FxFrames_275D54:
	dl	FxFrame_277434
	dl	FxFrame_2770FA
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_279360
	dl	FxFrame_277D26
	dl	FxFrame_278CFA
	dl	FxFrame_27672C
	dl	FxFrame_278826
	dl	FxFrame_278032
	dl	FxFrame_276D82
	dl	FxFrame_279968
	dl	FxFrame_278B84
	dl	FxFrame_276864
	dl	FxFrame_277D26
	dl	FxFrame_2770FA

d_275D94	section	romdata abs=0x275D94
FxFrames_275D94:
	dl	FxFrame_277434
	dl	FxFrame_2770FA
	dl	FxFrame_27743A
	dl	FxFrame_2791C2
	dl	FxFrame_279360
	dl	FxFrame_277D26
	dl	FxFrame_278CFA
	dl	FxFrame_27672C
	dl	FxFrame_278826
	dl	FxFrame_278032
	dl	FxFrame_276D82
	dl	FxFrame_279968
	dl	FxFrame_278B84
	dl	FxFrame_276864
	dl	FxFrame_277D26
	dl	FxFrame_2770FA

d_275DD4	section	romdata abs=0x275DD4
FxFrames_275DD4:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_277D2C

d_275DE0	section	romdata abs=0x275DE0
FxFrames_275DE0:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_277D2C

d_275DEC	section	romdata abs=0x275DEC
FxFrames_275DEC:
	dl	FxFrame_2789DC
	dl	FxFrame_2793C2
	dl	FxFrame_279986
	dl	FxFrame_276856
	dl	FxFrame_276FA0
	dl	FxFrame_27684C
	dl	FxFrame_278104
	dl	FxFrame_2781FC
	dl	FxFrame_2798F4
	dl	FxFrame_277E50

d_275E14	section	romdata abs=0x275E14
FxFrames_275E14:
	dl	FxFrame_2777CC
	dl	FxFrame_27803C
	dl	FxFrame_279784
	dl	FxFrame_2793A8
	dl	FxFrame_2783D0
	dl	FxFrame_2771AC
	dl	FxFrame_279584
	dl	FxFrame_276706
	dl	FxFrame_2778FC

d_275E38	section	romdata abs=0x275E38
FxFrames_275E38:
	dl	FxFrame_279BC4
	dl	FxFrame_27742C
	dl	FxFrame_27877C
	dl	FxFrame_2771C0
	dl	FxFrame_278C9E

d_275E4C	section	romdata abs=0x275E4C
FxFrames_275E4C:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_277D2C
	dl	FxFrame_27675C

d_275E5C	section	romdata abs=0x275E5C
FxFrames_275E5C:
	dl	FxFrame_276E92
	dl	FxFrame_279972
	dl	FxFrame_277D2C
	dl	FxFrame_27675C

d_275E6C	section	romdata abs=0x275E6C
FxFrames_275E6C:
	dl	FxFrame_27673E
	dl	FxFrame_27989A
	dl	FxFrame_27997C
	dl	FxFrame_27685A
	dl	FxFrame_276838
	dl	FxFrame_27657C
	dl	FxFrame_278B22
	dl	FxFrame_278FAC
	dl	FxFrame_276450
	dl	FxFrame_27728A
	dl	FxFrame_278C16
	dl	FxFrame_278E16

d_275E9C	section	romdata abs=0x275E9C
FxFrames_275E9C:
	dl	FxFrame_276772
	dl	FxFrame_276766
	dl	FxFrame_27820A
	dl	FxFrame_278FD8
	dl	FxFrame_2796B6
	dl	FxFrame_27644C
	dl	FxFrame_2769FE
	dl	FxFrame_277206
	dl	FxFrame_27796E
	dl	FxFrame_2781E4
	dl	FxFrame_2787E6

d_275EC8	section	romdata abs=0x275EC8
FxFrames_275EC8:
	dl	FxFrame_2789DC
	dl	FxFrame_2767FA
	dl	FxFrame_277E9C

d_275ED4	section	romdata abs=0x275ED4
FxFrames_275ED4:
	dl	FxFrame_278B8E
	dl	FxFrame_279494
	dl	FxFrame_27727E
	dl	FxFrame_278B94
	dl	FxFrame_276AB6
	dl	FxFrame_2791B0
	dl	FxFrame_2797E0
	dl	FxFrame_276A16
	dl	FxFrame_279152
	dl	FxFrame_278830
	dl	FxFrame_27731C

d_275F00	section	romdata abs=0x275F00
FxFrames_275F00:
	dl	FxFrame_279A84
	dl	FxFrame_278082
	dl	FxFrame_2794A6
	dl	FxFrame_277DAC
	dl	FxFrame_277296
	dl	FxFrame_2771A2

d_275F18	section	romdata abs=0x275F18
FxFrames_275F18:
	dl	FxFrame_279A84
	dl	FxFrame_278082
	dl	FxFrame_2794A6
	dl	FxFrame_277DAC
	dl	FxFrame_277296
	dl	FxFrame_2771A2

d_275F30	section	romdata abs=0x275F30
FxFrames_275F30:
	dl	FxFrame_27673E

d_275F34	section	romdata abs=0x275F34
FxFrames_275F34:
	dl	FxFrame_27673E

d_275F38	section	romdata abs=0x275F38
FxFrames_275F38:
	dl	FxFrame_279A84
	dl	FxFrame_278082
	dl	FxFrame_2794A6
	dl	FxFrame_277DAC
	dl	FxFrame_277296
	dl	FxFrame_2771A2

d_275F50	section	romdata abs=0x275F50
FxFrames_275F50:
	dl	FxFrame_279A84
	dl	FxFrame_278082
	dl	FxFrame_2794A6
	dl	FxFrame_277DAC
	dl	FxFrame_277296
	dl	FxFrame_2771A2

d_275F68	section	romdata abs=0x275F68
FxFrames_275F68:
	dl	FxFrame_27673E
	dl	FxFrame_2775D2
	dl	FxFrame_276B12
	dl	FxFrame_279796

d_275F78	section	romdata abs=0x275F78
FxFrames_275F78:
	dl	FxFrame_2788C2
	dl	FxFrame_2762EC
	dl	FxFrame_27750E
	dl	FxFrame_277882
	dl	FxFrame_277746

d_275F8C	section	romdata abs=0x275F8C
FxFrames_275F8C:
	dl	FxFrame_278522
	dl	FxFrame_277DCE
	dl	FxFrame_2788E2

d_275F98	section	romdata abs=0x275F98
FxFrames_275F98:
	dl	FxFrame_276C92
	dl	FxFrame_276A34
	dl	FxFrame_277C64
	dl	FxFrame_276458
	dl	FxFrame_278310

d_275FAC	section	romdata abs=0x275FAC
FxFrames_275FAC:
	dl	FxFrame_277C22
	dl	FxFrame_276F0E
	dl	FxFrame_276BE8

d_275FB8	section	romdata abs=0x275FB8
FxFrames_275FB8:
	dl	FxFrame_278960
	dl	FxFrame_2791CC
	dl	FxFrame_27901E
	dl	FxFrame_2764EA
	dl	FxFrame_277916

d_275FCC	section	romdata abs=0x275FCC
FxFrames_275FCC:
	dl	FxFrame_27635A

d_275FD0	section	romdata abs=0x275FD0
FxFrames_275FD0:
	dl	FxFrame_27635A

d_275FD4	section	romdata abs=0x275FD4
FxFrames_275FD4:
	dl	FxFrame_27673E
	dl	FxFrame_2783B4

d_275FDC	section	romdata abs=0x275FDC
FxFrames_275FDC:
	dl	FxFrame_27673E
	dl	FxFrame_2783B4

d_275FE4	section	romdata abs=0x275FE4
FxFrames_275FE4:
	dl	FxFrame_2789DC
	dl	FxFrame_2767FA
	dl	FxFrame_277E9C

d_275FF0	section	romdata abs=0x275FF0
FxFrames_275FF0:
	dl	FxFrame_27673E

d_275FF4	section	romdata abs=0x275FF4
FxFrames_275FF4:
	dl	FxFrame_27673E

d_275FF8	section	romdata abs=0x275FF8
FxFrames_275FF8:
	dl	FxFrame_277560
	dl	FxFrame_278C2C
	dl	FxFrame_277AE2
	dl	FxFrame_279B10
	dl	FxFrame_2786BA

d_27600C	section	romdata abs=0x27600C
FxFrames_27600C:
	dl	FxFrame_277EA0
	dl	FxFrame_27738A
	dl	FxFrame_278F32
	dl	FxFrame_276D96
	dl	FxFrame_277656
	dl	FxFrame_277E98
	dl	FxFrame_2782E0

d_276028	section	romdata abs=0x276028
FxFrames_276028:
	dl	FxFrame_2789DC
	dl	FxFrame_2793C2
	dl	FxFrame_279986
	dl	FxFrame_276856
	dl	FxFrame_276CD0
	dl	FxFrame_277630
	dl	FxFrame_277258
	dl	FxFrame_27887A

d_276048	section	romdata abs=0x276048
FxFrames_276048:
	dl	FxFrame_2789DC
	dl	FxFrame_2793C2
	dl	FxFrame_279986
	dl	FxFrame_276856
	dl	FxFrame_276856
	dl	FxFrame_276CD0
	dl	FxFrame_277258
	dl	FxFrame_2798EE

d_276068	section	romdata abs=0x276068
FxFrames_276068:
	dl	FxFrame_279418
	dl	FxFrame_27998A
	dl	FxFrame_278FDC
	dl	FxFrame_279B82
	dl	FxFrame_2778DA
	dl	FxFrame_279324

d_276080	section	romdata abs=0x276080
FxFrames_276080:
	dl	FxFrame_279422
	dl	FxFrame_278D04
	dl	FxFrame_278BA4
	dl	FxFrame_2790E0
	dl	FxFrame_2768A0
	dl	FxFrame_278ABA
	dl	FxFrame_277334
	dl	FxFrame_27637C

d_2760A0	section	romdata abs=0x2760A0
FxFrames_2760A0:
	dl	FxFrame_27673E
	dl	FxFrame_277D92
	dl	FxFrame_2776CC
	dl	FxFrame_2787EA
	dl	FxFrame_27770A
	dl	FxFrame_2766D4
	dl	FxFrame_278B36
	dl	FxFrame_2766D4
	dl	FxFrame_2787EA
	dl	FxFrame_277972
	dl	FxFrame_278046

d_2760CC	section	romdata abs=0x2760CC
FxFrames_2760CC:
	dl	FxFrame_27673E
	dl	FxFrame_277D92
	dl	FxFrame_2776CC
	dl	FxFrame_2787EA
	dl	FxFrame_27770A
	dl	FxFrame_2766D4
	dl	FxFrame_278B36
	dl	FxFrame_2766D4
	dl	FxFrame_2787EA
	dl	FxFrame_277972
	dl	FxFrame_278046
	dl	FxFrame_279A7C
	dl	FxFrame_277CD2
	dl	FxFrame_2786AA
	dl	FxFrame_276D9A
	dl	FxFrame_27721C
	dl	FxFrame_2789E0
	dl	FxFrame_279346
	dl	FxFrame_276FCC
	dl	FxFrame_279A62

d_27611C	section	romdata abs=0x27611C
FxFrames_27611C:
	dl	FxFrame_2763D2
	dl	FxFrame_27665A

d_276124	section	romdata abs=0x276124
FxFrames_276124:
	dl	FxFrame_277A7C
	dl	FxFrame_2769EA
	dl	FxFrame_276FE6
	dl	FxFrame_2772D2
	dl	FxFrame_278696
	dl	FxFrame_2793F0
	dl	FxFrame_277FE8
	dl	FxFrame_2797F8
	dl	FxFrame_277236
	dl	FxFrame_2787CE
	dl	FxFrame_278E1E
	dl	FxFrame_279BCC
	dl	FxFrame_277CDA
	dl	FxFrame_2782FC
	dl	FxFrame_27961A
	dl	FxFrame_2795D0
	dl	FxFrame_277292
	dl	FxFrame_277B54
	dl	FxFrame_2782E4
	dl	FxFrame_2788BE

d_276174	section	romdata abs=0x276174
FxFrames_276174:
	dl	FxFrame_2789DC
	dl	FxFrame_2799C6
	dl	FxFrame_2770FA

d_276180	section	romdata abs=0x276180
FxFrames_276180:
	dl	FxFrame_279918
	dl	FxFrame_277E5A
	dl	FxFrame_2771C8

d_27618C	section	romdata abs=0x27618C
FxFrames_27618C:
	dl	FxFrame_2798FE
	dl	FxFrame_2782F2
	dl	FxFrame_2795AA
	dl	FxFrame_2792C2
	dl	FxFrame_2796AC
	dl	FxFrame_278AB0
	dl	FxFrame_2790D2
	dl	FxFrame_278682
	dl	FxFrame_277D88
	dl	FxFrame_279B06
	dl	FxFrame_27698C
	dl	FxFrame_278FCE

d_2761BC	section	romdata abs=0x2761BC
FxFrame_2761BC:          ; 3 x 5
$include "build/src/gfx/battle_anims/frames/2761BC.tilemap.asm"	; src/gfx/battle_anims/frames/2761BC.tilemap

d_2761DC	section	romdata abs=0x2761DC
FxFrame_2761DC:          ; 5 x 6
$include "build/src/gfx/battle_anims/frames/2761DC.tilemap.asm"	; src/gfx/battle_anims/frames/2761DC.tilemap

d_27621A	section	romdata abs=0x27621A
FxFrame_27621A:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/27621A.tilemap.asm"	; src/gfx/battle_anims/frames/27621A.tilemap

d_2762E4	section	romdata abs=0x2762E4
FxFrame_2762E4:          ; 3 x 1
$include "build/src/gfx/battle_anims/frames/2762E4.tilemap.asm"	; src/gfx/battle_anims/frames/2762E4.tilemap

d_2762EC	section	romdata abs=0x2762EC
FxFrame_2762EC:          ; 5 x 4
$include "build/src/gfx/battle_anims/frames/2762EC.tilemap.asm"	; src/gfx/battle_anims/frames/2762EC.tilemap

d_276316	section	romdata abs=0x276316
FxFrame_276316:          ; 3 x 2
$include "build/src/gfx/battle_anims/frames/276316.tilemap.asm"	; src/gfx/battle_anims/frames/276316.tilemap

d_276324	section	romdata abs=0x276324
FxFrame_276324:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/276324.tilemap.asm"	; src/gfx/battle_anims/frames/276324.tilemap

d_276338	section	romdata abs=0x276338
FxFrame_276338:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/276338.tilemap.asm"	; src/gfx/battle_anims/frames/276338.tilemap

d_27635A	section	romdata abs=0x27635A
FxFrame_27635A:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/27635A.tilemap.asm"	; src/gfx/battle_anims/frames/27635A.tilemap

d_27637C	section	romdata abs=0x27637C
FxFrame_27637C:          ; 6 x 7
$include "build/src/gfx/battle_anims/frames/27637C.tilemap.asm"	; src/gfx/battle_anims/frames/27637C.tilemap

d_2763D2	section	romdata abs=0x2763D2
FxFrame_2763D2:          ; 6 x 10
$include "build/src/gfx/battle_anims/frames/2763D2.tilemap.asm"	; src/gfx/battle_anims/frames/2763D2.tilemap

d_27644C	section	romdata abs=0x27644C
FxFrame_27644C:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/27644C.tilemap.asm"	; src/gfx/battle_anims/frames/27644C.tilemap

d_276450	section	romdata abs=0x276450
FxFrame_276450:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/276450.tilemap.asm"	; src/gfx/battle_anims/frames/276450.tilemap

d_276458	section	romdata abs=0x276458
FxFrame_276458:          ; 9 x 8
$include "build/src/gfx/battle_anims/frames/276458.tilemap.asm"	; src/gfx/battle_anims/frames/276458.tilemap

d_2764EA	section	romdata abs=0x2764EA
FxFrame_2764EA:          ; 9 x 8
$include "build/src/gfx/battle_anims/frames/2764EA.tilemap.asm"	; src/gfx/battle_anims/frames/2764EA.tilemap

d_27657C	section	romdata abs=0x27657C
FxFrame_27657C:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/27657C.tilemap.asm"	; src/gfx/battle_anims/frames/27657C.tilemap

d_276590	section	romdata abs=0x276590
FxFrame_276590:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/276590.tilemap.asm"	; src/gfx/battle_anims/frames/276590.tilemap

d_27665A	section	romdata abs=0x27665A
FxFrame_27665A:          ; 6 x 10
$include "build/src/gfx/battle_anims/frames/27665A.tilemap.asm"	; src/gfx/battle_anims/frames/27665A.tilemap

d_2766D4	section	romdata abs=0x2766D4
FxFrame_2766D4:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/2766D4.tilemap.asm"	; src/gfx/battle_anims/frames/2766D4.tilemap

d_276706	section	romdata abs=0x276706
FxFrame_276706:          ; 6 x 3
$include "build/src/gfx/battle_anims/frames/276706.tilemap.asm"	; src/gfx/battle_anims/frames/276706.tilemap

d_27672C	section	romdata abs=0x27672C
FxFrame_27672C:          ; 2 x 4
$include "build/src/gfx/battle_anims/frames/27672C.tilemap.asm"	; src/gfx/battle_anims/frames/27672C.tilemap

d_27673E	section	romdata abs=0x27673E
FxFrame_27673E:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27673E.tilemap.asm"	; src/gfx/battle_anims/frames/27673E.tilemap

d_276748	section	romdata abs=0x276748
FxFrame_276748:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/276748.tilemap.asm"	; src/gfx/battle_anims/frames/276748.tilemap

d_27675C	section	romdata abs=0x27675C
FxFrame_27675C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27675C.tilemap.asm"	; src/gfx/battle_anims/frames/27675C.tilemap

d_276766	section	romdata abs=0x276766
FxFrame_276766:          ; 5 x 1
$include "build/src/gfx/battle_anims/frames/276766.tilemap.asm"	; src/gfx/battle_anims/frames/276766.tilemap

d_276772	section	romdata abs=0x276772
FxFrame_276772:          ; 5 x 1
$include "build/src/gfx/battle_anims/frames/276772.tilemap.asm"	; src/gfx/battle_anims/frames/276772.tilemap

d_27677E	section	romdata abs=0x27677E
FxFrame_27677E:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27677E.tilemap.asm"	; src/gfx/battle_anims/frames/27677E.tilemap

d_276788	section	romdata abs=0x276788
FxFrame_276788:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/276788.tilemap.asm"	; src/gfx/battle_anims/frames/276788.tilemap

d_2767FA	section	romdata abs=0x2767FA
FxFrame_2767FA:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/2767FA.tilemap.asm"	; src/gfx/battle_anims/frames/2767FA.tilemap

d_276800	section	romdata abs=0x276800
FxFrame_276800:          ; 3 x 4
$include "build/src/gfx/battle_anims/frames/276800.tilemap.asm"	; src/gfx/battle_anims/frames/276800.tilemap

d_27681A	section	romdata abs=0x27681A
FxFrame_27681A:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/27681A.tilemap.asm"	; src/gfx/battle_anims/frames/27681A.tilemap

d_27682E	section	romdata abs=0x27682E
FxFrame_27682E:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27682E.tilemap.asm"	; src/gfx/battle_anims/frames/27682E.tilemap

d_276838	section	romdata abs=0x276838
FxFrame_276838:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/276838.tilemap.asm"	; src/gfx/battle_anims/frames/276838.tilemap

d_27684C	section	romdata abs=0x27684C
FxFrame_27684C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27684C.tilemap.asm"	; src/gfx/battle_anims/frames/27684C.tilemap

d_276856	section	romdata abs=0x276856
FxFrame_276856:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/276856.tilemap.asm"	; src/gfx/battle_anims/frames/276856.tilemap

d_27685A	section	romdata abs=0x27685A
FxFrame_27685A:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27685A.tilemap.asm"	; src/gfx/battle_anims/frames/27685A.tilemap

d_276864	section	romdata abs=0x276864
FxFrame_276864:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276864.tilemap.asm"	; src/gfx/battle_anims/frames/276864.tilemap

d_27686E	section	romdata abs=0x27686E
FxFrame_27686E:          ; 3 x 1
$include "build/src/gfx/battle_anims/frames/27686E.tilemap.asm"	; src/gfx/battle_anims/frames/27686E.tilemap

d_276876	section	romdata abs=0x276876
FxFrame_276876:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/276876.tilemap.asm"	; src/gfx/battle_anims/frames/276876.tilemap

d_27688A	section	romdata abs=0x27688A
FxFrame_27688A:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/27688A.tilemap.asm"	; src/gfx/battle_anims/frames/27688A.tilemap

d_27688E	section	romdata abs=0x27688E
FxFrame_27688E:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/27688E.tilemap.asm"	; src/gfx/battle_anims/frames/27688E.tilemap

d_276892	section	romdata abs=0x276892
FxFrame_276892:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/276892.tilemap.asm"	; src/gfx/battle_anims/frames/276892.tilemap

d_276896	section	romdata abs=0x276896
FxFrame_276896:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276896.tilemap.asm"	; src/gfx/battle_anims/frames/276896.tilemap

d_2768A0	section	romdata abs=0x2768A0
FxFrame_2768A0:          ; 7 x 7
$include "build/src/gfx/battle_anims/frames/2768A0.tilemap.asm"	; src/gfx/battle_anims/frames/2768A0.tilemap

d_276904	section	romdata abs=0x276904
FxFrame_276904:          ; 8 x 8
$include "build/src/gfx/battle_anims/frames/276904.tilemap.asm"	; src/gfx/battle_anims/frames/276904.tilemap

d_276986	section	romdata abs=0x276986
FxFrame_276986:          ; 1 x 2
$include "build/src/gfx/battle_anims/frames/276986.tilemap.asm"	; src/gfx/battle_anims/frames/276986.tilemap

d_27698C	section	romdata abs=0x27698C
FxFrame_27698C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27698C.tilemap.asm"	; src/gfx/battle_anims/frames/27698C.tilemap

d_276996	section	romdata abs=0x276996
FxFrame_276996:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276996.tilemap.asm"	; src/gfx/battle_anims/frames/276996.tilemap

d_2769A0	section	romdata abs=0x2769A0
FxFrame_2769A0:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/2769A0.tilemap.asm"	; src/gfx/battle_anims/frames/2769A0.tilemap

d_2769EA	section	romdata abs=0x2769EA
FxFrame_2769EA:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2769EA.tilemap.asm"	; src/gfx/battle_anims/frames/2769EA.tilemap

d_2769FE	section	romdata abs=0x2769FE
FxFrame_2769FE:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2769FE.tilemap.asm"	; src/gfx/battle_anims/frames/2769FE.tilemap

d_276A02	section	romdata abs=0x276A02
FxFrame_276A02:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/276A02.tilemap.asm"	; src/gfx/battle_anims/frames/276A02.tilemap

d_276A16	section	romdata abs=0x276A16
FxFrame_276A16:          ; 1 x 4
$include "build/src/gfx/battle_anims/frames/276A16.tilemap.asm"	; src/gfx/battle_anims/frames/276A16.tilemap

d_276A20	section	romdata abs=0x276A20
FxFrame_276A20:          ; 1 x 2
$include "build/src/gfx/battle_anims/frames/276A20.tilemap.asm"	; src/gfx/battle_anims/frames/276A20.tilemap

d_276A26	section	romdata abs=0x276A26
FxFrame_276A26:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/276A26.tilemap.asm"	; src/gfx/battle_anims/frames/276A26.tilemap

d_276A2A	section	romdata abs=0x276A2A
FxFrame_276A2A:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276A2A.tilemap.asm"	; src/gfx/battle_anims/frames/276A2A.tilemap

d_276A34	section	romdata abs=0x276A34
FxFrame_276A34:          ; 8 x 8
$include "build/src/gfx/battle_anims/frames/276A34.tilemap.asm"	; src/gfx/battle_anims/frames/276A34.tilemap

d_276AB6	section	romdata abs=0x276AB6
FxFrame_276AB6:          ; 1 x 4
$include "build/src/gfx/battle_anims/frames/276AB6.tilemap.asm"	; src/gfx/battle_anims/frames/276AB6.tilemap

d_276AC0	section	romdata abs=0x276AC0
FxFrame_276AC0:          ; 8 x 5
$include "build/src/gfx/battle_anims/frames/276AC0.tilemap.asm"	; src/gfx/battle_anims/frames/276AC0.tilemap

d_276B12	section	romdata abs=0x276B12
FxFrame_276B12:          ; 5 x 5
$include "build/src/gfx/battle_anims/frames/276B12.tilemap.asm"	; src/gfx/battle_anims/frames/276B12.tilemap

d_276B46	section	romdata abs=0x276B46
FxFrame_276B46:          ; 10 x 8
$include "build/src/gfx/battle_anims/frames/276B46.tilemap.asm"	; src/gfx/battle_anims/frames/276B46.tilemap

d_276BE8	section	romdata abs=0x276BE8
FxFrame_276BE8:          ; 5 x 5
$include "build/src/gfx/battle_anims/frames/276BE8.tilemap.asm"	; src/gfx/battle_anims/frames/276BE8.tilemap

d_276C1C	section	romdata abs=0x276C1C
FxFrame_276C1C:          ; 4 x 3
$include "build/src/gfx/battle_anims/frames/276C1C.tilemap.asm"	; src/gfx/battle_anims/frames/276C1C.tilemap

d_276C36	section	romdata abs=0x276C36
FxFrame_276C36:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/276C36.tilemap.asm"	; src/gfx/battle_anims/frames/276C36.tilemap

d_276C3A	section	romdata abs=0x276C3A
FxFrame_276C3A:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276C3A.tilemap.asm"	; src/gfx/battle_anims/frames/276C3A.tilemap

d_276C44	section	romdata abs=0x276C44
FxFrame_276C44:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276C44.tilemap.asm"	; src/gfx/battle_anims/frames/276C44.tilemap

d_276C4E	section	romdata abs=0x276C4E
FxFrame_276C4E:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/276C4E.tilemap.asm"	; src/gfx/battle_anims/frames/276C4E.tilemap

d_276C52	section	romdata abs=0x276C52
FxFrame_276C52:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/276C52.tilemap.asm"	; src/gfx/battle_anims/frames/276C52.tilemap

d_276C66	section	romdata abs=0x276C66
FxFrame_276C66:          ; 2 x 8
$include "build/src/gfx/battle_anims/frames/276C66.tilemap.asm"	; src/gfx/battle_anims/frames/276C66.tilemap

d_276C88	section	romdata abs=0x276C88
FxFrame_276C88:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276C88.tilemap.asm"	; src/gfx/battle_anims/frames/276C88.tilemap

d_276C92	section	romdata abs=0x276C92
FxFrame_276C92:          ; 10 x 3
$include "build/src/gfx/battle_anims/frames/276C92.tilemap.asm"	; src/gfx/battle_anims/frames/276C92.tilemap

d_276CD0	section	romdata abs=0x276CD0
FxFrame_276CD0:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/276CD0.tilemap.asm"	; src/gfx/battle_anims/frames/276CD0.tilemap

d_276CD4	section	romdata abs=0x276CD4
FxFrame_276CD4:          ; 7 x 7
$include "build/src/gfx/battle_anims/frames/276CD4.tilemap.asm"	; src/gfx/battle_anims/frames/276CD4.tilemap

d_276D38	section	romdata abs=0x276D38
FxFrame_276D38:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/276D38.tilemap.asm"	; src/gfx/battle_anims/frames/276D38.tilemap

d_276D82	section	romdata abs=0x276D82
FxFrame_276D82:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276D82.tilemap.asm"	; src/gfx/battle_anims/frames/276D82.tilemap

d_276D8C	section	romdata abs=0x276D8C
FxFrame_276D8C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276D8C.tilemap.asm"	; src/gfx/battle_anims/frames/276D8C.tilemap

d_276D96	section	romdata abs=0x276D96
FxFrame_276D96:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/276D96.tilemap.asm"	; src/gfx/battle_anims/frames/276D96.tilemap

d_276D9A	section	romdata abs=0x276D9A
FxFrame_276D9A:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/276D9A.tilemap.asm"	; src/gfx/battle_anims/frames/276D9A.tilemap

d_276DB4	section	romdata abs=0x276DB4
FxFrame_276DB4:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276DB4.tilemap.asm"	; src/gfx/battle_anims/frames/276DB4.tilemap

d_276DBE	section	romdata abs=0x276DBE
FxFrame_276DBE:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/276DBE.tilemap.asm"	; src/gfx/battle_anims/frames/276DBE.tilemap

d_276E88	section	romdata abs=0x276E88
FxFrame_276E88:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276E88.tilemap.asm"	; src/gfx/battle_anims/frames/276E88.tilemap

d_276E92	section	romdata abs=0x276E92
FxFrame_276E92:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276E92.tilemap.asm"	; src/gfx/battle_anims/frames/276E92.tilemap

d_276E9C	section	romdata abs=0x276E9C
FxFrame_276E9C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276E9C.tilemap.asm"	; src/gfx/battle_anims/frames/276E9C.tilemap

d_276EA6	section	romdata abs=0x276EA6
FxFrame_276EA6:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/276EA6.tilemap.asm"	; src/gfx/battle_anims/frames/276EA6.tilemap

d_276EBA	section	romdata abs=0x276EBA
FxFrame_276EBA:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/276EBA.tilemap.asm"	; src/gfx/battle_anims/frames/276EBA.tilemap

d_276F04	section	romdata abs=0x276F04
FxFrame_276F04:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276F04.tilemap.asm"	; src/gfx/battle_anims/frames/276F04.tilemap

d_276F0E	section	romdata abs=0x276F0E
FxFrame_276F0E:          ; 9 x 8
$include "build/src/gfx/battle_anims/frames/276F0E.tilemap.asm"	; src/gfx/battle_anims/frames/276F0E.tilemap

d_276FA0	section	romdata abs=0x276FA0
FxFrame_276FA0:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/276FA0.tilemap.asm"	; src/gfx/battle_anims/frames/276FA0.tilemap

d_276FAA	section	romdata abs=0x276FAA
FxFrame_276FAA:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/276FAA.tilemap.asm"	; src/gfx/battle_anims/frames/276FAA.tilemap

d_276FCC	section	romdata abs=0x276FCC
FxFrame_276FCC:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/276FCC.tilemap.asm"	; src/gfx/battle_anims/frames/276FCC.tilemap

d_276FE6	section	romdata abs=0x276FE6
FxFrame_276FE6:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/276FE6.tilemap.asm"	; src/gfx/battle_anims/frames/276FE6.tilemap

d_277030	section	romdata abs=0x277030
FxFrame_277030:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/277030.tilemap.asm"	; src/gfx/battle_anims/frames/277030.tilemap

d_2770FA	section	romdata abs=0x2770FA
FxFrame_2770FA:          ; 1 x 2
$include "build/src/gfx/battle_anims/frames/2770FA.tilemap.asm"	; src/gfx/battle_anims/frames/2770FA.tilemap

d_277100	section	romdata abs=0x277100
FxFrame_277100:          ; 10 x 8
$include "build/src/gfx/battle_anims/frames/277100.tilemap.asm"	; src/gfx/battle_anims/frames/277100.tilemap

d_2771A2	section	romdata abs=0x2771A2
FxFrame_2771A2:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2771A2.tilemap.asm"	; src/gfx/battle_anims/frames/2771A2.tilemap

d_2771AC	section	romdata abs=0x2771AC
FxFrame_2771AC:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2771AC.tilemap.asm"	; src/gfx/battle_anims/frames/2771AC.tilemap

d_2771C0	section	romdata abs=0x2771C0
FxFrame_2771C0:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/2771C0.tilemap.asm"	; src/gfx/battle_anims/frames/2771C0.tilemap

d_2771C8	section	romdata abs=0x2771C8
FxFrame_2771C8:          ; 6 x 5
$include "build/src/gfx/battle_anims/frames/2771C8.tilemap.asm"	; src/gfx/battle_anims/frames/2771C8.tilemap

d_277206	section	romdata abs=0x277206
FxFrame_277206:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277206.tilemap.asm"	; src/gfx/battle_anims/frames/277206.tilemap

d_27720A	section	romdata abs=0x27720A
FxFrame_27720A:          ; 2 x 4
$include "build/src/gfx/battle_anims/frames/27720A.tilemap.asm"	; src/gfx/battle_anims/frames/27720A.tilemap

d_27721C	section	romdata abs=0x27721C
FxFrame_27721C:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/27721C.tilemap.asm"	; src/gfx/battle_anims/frames/27721C.tilemap

d_277236	section	romdata abs=0x277236
FxFrame_277236:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/277236.tilemap.asm"	; src/gfx/battle_anims/frames/277236.tilemap

d_277240	section	romdata abs=0x277240
FxFrame_277240:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277240.tilemap.asm"	; src/gfx/battle_anims/frames/277240.tilemap

d_277244	section	romdata abs=0x277244
FxFrame_277244:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/277244.tilemap.asm"	; src/gfx/battle_anims/frames/277244.tilemap

d_277258	section	romdata abs=0x277258
FxFrame_277258:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/277258.tilemap.asm"	; src/gfx/battle_anims/frames/277258.tilemap

d_27725E	section	romdata abs=0x27725E
FxFrame_27725E:          ; 3 x 5
$include "build/src/gfx/battle_anims/frames/27725E.tilemap.asm"	; src/gfx/battle_anims/frames/27725E.tilemap

d_27727E	section	romdata abs=0x27727E
FxFrame_27727E:          ; 1 x 5
$include "build/src/gfx/battle_anims/frames/27727E.tilemap.asm"	; src/gfx/battle_anims/frames/27727E.tilemap

d_27728A	section	romdata abs=0x27728A
FxFrame_27728A:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/27728A.tilemap.asm"	; src/gfx/battle_anims/frames/27728A.tilemap

d_277292	section	romdata abs=0x277292
FxFrame_277292:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277292.tilemap.asm"	; src/gfx/battle_anims/frames/277292.tilemap

d_277296	section	romdata abs=0x277296
FxFrame_277296:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/277296.tilemap.asm"	; src/gfx/battle_anims/frames/277296.tilemap

d_2772A0	section	romdata abs=0x2772A0
FxFrame_2772A0:          ; 8 x 3
$include "build/src/gfx/battle_anims/frames/2772A0.tilemap.asm"	; src/gfx/battle_anims/frames/2772A0.tilemap

d_2772D2	section	romdata abs=0x2772D2
FxFrame_2772D2:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/2772D2.tilemap.asm"	; src/gfx/battle_anims/frames/2772D2.tilemap

d_27731C	section	romdata abs=0x27731C
FxFrame_27731C:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/27731C.tilemap.asm"	; src/gfx/battle_anims/frames/27731C.tilemap

d_277322	section	romdata abs=0x277322
FxFrame_277322:          ; 4 x 2
$include "build/src/gfx/battle_anims/frames/277322.tilemap.asm"	; src/gfx/battle_anims/frames/277322.tilemap

d_277334	section	romdata abs=0x277334
FxFrame_277334:          ; 6 x 7
$include "build/src/gfx/battle_anims/frames/277334.tilemap.asm"	; src/gfx/battle_anims/frames/277334.tilemap

d_27738A	section	romdata abs=0x27738A
FxFrame_27738A:          ; 10 x 8
$include "build/src/gfx/battle_anims/frames/27738A.tilemap.asm"	; src/gfx/battle_anims/frames/27738A.tilemap

d_27742C	section	romdata abs=0x27742C
FxFrame_27742C:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/27742C.tilemap.asm"	; src/gfx/battle_anims/frames/27742C.tilemap

d_277434	section	romdata abs=0x277434
FxFrame_277434:          ; 1 x 2
$include "build/src/gfx/battle_anims/frames/277434.tilemap.asm"	; src/gfx/battle_anims/frames/277434.tilemap

d_27743A	section	romdata abs=0x27743A
FxFrame_27743A:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27743A.tilemap.asm"	; src/gfx/battle_anims/frames/27743A.tilemap

d_277444	section	romdata abs=0x277444
FxFrame_277444:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/277444.tilemap.asm"	; src/gfx/battle_anims/frames/277444.tilemap

d_27750E	section	romdata abs=0x27750E
FxFrame_27750E:          ; 5 x 6
$include "build/src/gfx/battle_anims/frames/27750E.tilemap.asm"	; src/gfx/battle_anims/frames/27750E.tilemap

d_27754C	section	romdata abs=0x27754C
FxFrame_27754C:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/27754C.tilemap.asm"	; src/gfx/battle_anims/frames/27754C.tilemap

d_277560	section	romdata abs=0x277560
FxFrame_277560:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/277560.tilemap.asm"	; src/gfx/battle_anims/frames/277560.tilemap

d_2775D2	section	romdata abs=0x2775D2
FxFrame_2775D2:          ; 5 x 4
$include "build/src/gfx/battle_anims/frames/2775D2.tilemap.asm"	; src/gfx/battle_anims/frames/2775D2.tilemap

d_2775FC	section	romdata abs=0x2775FC
FxFrame_2775FC:          ; 5 x 5
$include "build/src/gfx/battle_anims/frames/2775FC.tilemap.asm"	; src/gfx/battle_anims/frames/2775FC.tilemap

d_277630	section	romdata abs=0x277630
FxFrame_277630:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277630.tilemap.asm"	; src/gfx/battle_anims/frames/277630.tilemap

d_277634	section	romdata abs=0x277634
FxFrame_277634:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/277634.tilemap.asm"	; src/gfx/battle_anims/frames/277634.tilemap

d_277656	section	romdata abs=0x277656
FxFrame_277656:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277656.tilemap.asm"	; src/gfx/battle_anims/frames/277656.tilemap

d_27765A	section	romdata abs=0x27765A
FxFrame_27765A:          ; 7 x 8
$include "build/src/gfx/battle_anims/frames/27765A.tilemap.asm"	; src/gfx/battle_anims/frames/27765A.tilemap

d_2776CC	section	romdata abs=0x2776CC
FxFrame_2776CC:          ; 2 x 10
$include "build/src/gfx/battle_anims/frames/2776CC.tilemap.asm"	; src/gfx/battle_anims/frames/2776CC.tilemap

d_2776F6	section	romdata abs=0x2776F6
FxFrame_2776F6:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2776F6.tilemap.asm"	; src/gfx/battle_anims/frames/2776F6.tilemap

d_27770A	section	romdata abs=0x27770A
FxFrame_27770A:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/27770A.tilemap.asm"	; src/gfx/battle_anims/frames/27770A.tilemap

d_27773C	section	romdata abs=0x27773C
FxFrame_27773C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27773C.tilemap.asm"	; src/gfx/battle_anims/frames/27773C.tilemap

d_277746	section	romdata abs=0x277746
FxFrame_277746:          ; 5 x 8
$include "build/src/gfx/battle_anims/frames/277746.tilemap.asm"	; src/gfx/battle_anims/frames/277746.tilemap

d_277798	section	romdata abs=0x277798
FxFrame_277798:          ; 5 x 5
$include "build/src/gfx/battle_anims/frames/277798.tilemap.asm"	; src/gfx/battle_anims/frames/277798.tilemap

d_2777CC	section	romdata abs=0x2777CC
FxFrame_2777CC:          ; 4 x 1
$include "build/src/gfx/battle_anims/frames/2777CC.tilemap.asm"	; src/gfx/battle_anims/frames/2777CC.tilemap

d_2777D6	section	romdata abs=0x2777D6
FxFrame_2777D6:          ; 7 x 5
$include "build/src/gfx/battle_anims/frames/2777D6.tilemap.asm"	; src/gfx/battle_anims/frames/2777D6.tilemap

d_27781E	section	romdata abs=0x27781E
FxFrame_27781E:          ; 3 x 4
$include "build/src/gfx/battle_anims/frames/27781E.tilemap.asm"	; src/gfx/battle_anims/frames/27781E.tilemap

d_277838	section	romdata abs=0x277838
FxFrame_277838:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/277838.tilemap.asm"	; src/gfx/battle_anims/frames/277838.tilemap

d_277882	section	romdata abs=0x277882
FxFrame_277882:          ; 5 x 8
$include "build/src/gfx/battle_anims/frames/277882.tilemap.asm"	; src/gfx/battle_anims/frames/277882.tilemap

d_2778D4	section	romdata abs=0x2778D4
FxFrame_2778D4:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/2778D4.tilemap.asm"	; src/gfx/battle_anims/frames/2778D4.tilemap

d_2778DA	section	romdata abs=0x2778DA
FxFrame_2778DA:          ; 8 x 2
$include "build/src/gfx/battle_anims/frames/2778DA.tilemap.asm"	; src/gfx/battle_anims/frames/2778DA.tilemap

d_2778FC	section	romdata abs=0x2778FC
FxFrame_2778FC:          ; 6 x 2
$include "build/src/gfx/battle_anims/frames/2778FC.tilemap.asm"	; src/gfx/battle_anims/frames/2778FC.tilemap

d_277916	section	romdata abs=0x277916
FxFrame_277916:          ; 6 x 5
$include "build/src/gfx/battle_anims/frames/277916.tilemap.asm"	; src/gfx/battle_anims/frames/277916.tilemap

d_277954	section	romdata abs=0x277954
FxFrame_277954:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/277954.tilemap.asm"	; src/gfx/battle_anims/frames/277954.tilemap

d_27796E	section	romdata abs=0x27796E
FxFrame_27796E:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/27796E.tilemap.asm"	; src/gfx/battle_anims/frames/27796E.tilemap

d_277972	section	romdata abs=0x277972
FxFrame_277972:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/277972.tilemap.asm"	; src/gfx/battle_anims/frames/277972.tilemap

d_2779A4	section	romdata abs=0x2779A4
FxFrame_2779A4:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/2779A4.tilemap.asm"	; src/gfx/battle_anims/frames/2779A4.tilemap

d_277A6E	section	romdata abs=0x277A6E
FxFrame_277A6E:          ; 3 x 2
$include "build/src/gfx/battle_anims/frames/277A6E.tilemap.asm"	; src/gfx/battle_anims/frames/277A6E.tilemap

d_277A7C	section	romdata abs=0x277A7C
FxFrame_277A7C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/277A7C.tilemap.asm"	; src/gfx/battle_anims/frames/277A7C.tilemap

d_277A86	section	romdata abs=0x277A86
FxFrame_277A86:          ; 4 x 8
$include "build/src/gfx/battle_anims/frames/277A86.tilemap.asm"	; src/gfx/battle_anims/frames/277A86.tilemap

d_277AC8	section	romdata abs=0x277AC8
FxFrame_277AC8:          ; 3 x 4
$include "build/src/gfx/battle_anims/frames/277AC8.tilemap.asm"	; src/gfx/battle_anims/frames/277AC8.tilemap

d_277AE2	section	romdata abs=0x277AE2
FxFrame_277AE2:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/277AE2.tilemap.asm"	; src/gfx/battle_anims/frames/277AE2.tilemap

d_277B54	section	romdata abs=0x277B54
FxFrame_277B54:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277B54.tilemap.asm"	; src/gfx/battle_anims/frames/277B54.tilemap

d_277B58	section	romdata abs=0x277B58
FxFrame_277B58:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/277B58.tilemap.asm"	; src/gfx/battle_anims/frames/277B58.tilemap

d_277C22	section	romdata abs=0x277C22
FxFrame_277C22:          ; 8 x 4
$include "build/src/gfx/battle_anims/frames/277C22.tilemap.asm"	; src/gfx/battle_anims/frames/277C22.tilemap

d_277C64	section	romdata abs=0x277C64
FxFrame_277C64:          ; 6 x 9
$include "build/src/gfx/battle_anims/frames/277C64.tilemap.asm"	; src/gfx/battle_anims/frames/277C64.tilemap

d_277CD2	section	romdata abs=0x277CD2
FxFrame_277CD2:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/277CD2.tilemap.asm"	; src/gfx/battle_anims/frames/277CD2.tilemap

d_277CDA	section	romdata abs=0x277CDA
FxFrame_277CDA:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/277CDA.tilemap.asm"	; src/gfx/battle_anims/frames/277CDA.tilemap

d_277CE4	section	romdata abs=0x277CE4
FxFrame_277CE4:          ; 4 x 8
$include "build/src/gfx/battle_anims/frames/277CE4.tilemap.asm"	; src/gfx/battle_anims/frames/277CE4.tilemap

d_277D26	section	romdata abs=0x277D26
FxFrame_277D26:          ; 1 x 2
$include "build/src/gfx/battle_anims/frames/277D26.tilemap.asm"	; src/gfx/battle_anims/frames/277D26.tilemap

d_277D2C	section	romdata abs=0x277D2C
FxFrame_277D2C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/277D2C.tilemap.asm"	; src/gfx/battle_anims/frames/277D2C.tilemap

d_277D36	section	romdata abs=0x277D36
FxFrame_277D36:          ; 4 x 10
$include "build/src/gfx/battle_anims/frames/277D36.tilemap.asm"	; src/gfx/battle_anims/frames/277D36.tilemap

d_277D88	section	romdata abs=0x277D88
FxFrame_277D88:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/277D88.tilemap.asm"	; src/gfx/battle_anims/frames/277D88.tilemap

d_277D92	section	romdata abs=0x277D92
FxFrame_277D92:          ; 2 x 6
$include "build/src/gfx/battle_anims/frames/277D92.tilemap.asm"	; src/gfx/battle_anims/frames/277D92.tilemap

d_277DAC	section	romdata abs=0x277DAC
FxFrame_277DAC:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/277DAC.tilemap.asm"	; src/gfx/battle_anims/frames/277DAC.tilemap

d_277DCE	section	romdata abs=0x277DCE
FxFrame_277DCE:          ; 8 x 8
$include "build/src/gfx/battle_anims/frames/277DCE.tilemap.asm"	; src/gfx/battle_anims/frames/277DCE.tilemap

d_277E50	section	romdata abs=0x277E50
FxFrame_277E50:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/277E50.tilemap.asm"	; src/gfx/battle_anims/frames/277E50.tilemap

d_277E5A	section	romdata abs=0x277E5A
FxFrame_277E5A:          ; 6 x 5
$include "build/src/gfx/battle_anims/frames/277E5A.tilemap.asm"	; src/gfx/battle_anims/frames/277E5A.tilemap

d_277E98	section	romdata abs=0x277E98
FxFrame_277E98:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277E98.tilemap.asm"	; src/gfx/battle_anims/frames/277E98.tilemap

d_277E9C	section	romdata abs=0x277E9C
FxFrame_277E9C:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/277E9C.tilemap.asm"	; src/gfx/battle_anims/frames/277E9C.tilemap

d_277EA0	section	romdata abs=0x277EA0
FxFrame_277EA0:          ; 12 x 4
$include "build/src/gfx/battle_anims/frames/277EA0.tilemap.asm"	; src/gfx/battle_anims/frames/277EA0.tilemap

d_277F02	section	romdata abs=0x277F02
FxFrame_277F02:          ; 12 x 4
$include "build/src/gfx/battle_anims/frames/277F02.tilemap.asm"	; src/gfx/battle_anims/frames/277F02.tilemap

d_277F64	section	romdata abs=0x277F64
FxFrame_277F64:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/277F64.tilemap.asm"	; src/gfx/battle_anims/frames/277F64.tilemap

d_277F7E	section	romdata abs=0x277F7E
FxFrame_277F7E:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/277F7E.tilemap.asm"	; src/gfx/battle_anims/frames/277F7E.tilemap

d_277FA0	section	romdata abs=0x277FA0
FxFrame_277FA0:          ; 7 x 5
$include "build/src/gfx/battle_anims/frames/277FA0.tilemap.asm"	; src/gfx/battle_anims/frames/277FA0.tilemap

d_277FE8	section	romdata abs=0x277FE8
FxFrame_277FE8:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/277FE8.tilemap.asm"	; src/gfx/battle_anims/frames/277FE8.tilemap

d_278032	section	romdata abs=0x278032
FxFrame_278032:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278032.tilemap.asm"	; src/gfx/battle_anims/frames/278032.tilemap

d_27803C	section	romdata abs=0x27803C
FxFrame_27803C:          ; 4 x 1
$include "build/src/gfx/battle_anims/frames/27803C.tilemap.asm"	; src/gfx/battle_anims/frames/27803C.tilemap

d_278046	section	romdata abs=0x278046
FxFrame_278046:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/278046.tilemap.asm"	; src/gfx/battle_anims/frames/278046.tilemap

d_278078	section	romdata abs=0x278078
FxFrame_278078:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278078.tilemap.asm"	; src/gfx/battle_anims/frames/278078.tilemap

d_278082	section	romdata abs=0x278082
FxFrame_278082:          ; 8 x 8
$include "build/src/gfx/battle_anims/frames/278082.tilemap.asm"	; src/gfx/battle_anims/frames/278082.tilemap

d_278104	section	romdata abs=0x278104
FxFrame_278104:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278104.tilemap.asm"	; src/gfx/battle_anims/frames/278104.tilemap

d_27810E	section	romdata abs=0x27810E
FxFrame_27810E:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/27810E.tilemap.asm"	; src/gfx/battle_anims/frames/27810E.tilemap

d_278158	section	romdata abs=0x278158
FxFrame_278158:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/278158.tilemap.asm"	; src/gfx/battle_anims/frames/278158.tilemap

d_2781A2	section	romdata abs=0x2781A2
FxFrame_2781A2:          ; 3 x 5
$include "build/src/gfx/battle_anims/frames/2781A2.tilemap.asm"	; src/gfx/battle_anims/frames/2781A2.tilemap

d_2781C2	section	romdata abs=0x2781C2
FxFrame_2781C2:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2781C2.tilemap.asm"	; src/gfx/battle_anims/frames/2781C2.tilemap

d_2781CC	section	romdata abs=0x2781CC
FxFrame_2781CC:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2781CC.tilemap.asm"	; src/gfx/battle_anims/frames/2781CC.tilemap

d_2781D0	section	romdata abs=0x2781D0
FxFrame_2781D0:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2781D0.tilemap.asm"	; src/gfx/battle_anims/frames/2781D0.tilemap

d_2781E4	section	romdata abs=0x2781E4
FxFrame_2781E4:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2781E4.tilemap.asm"	; src/gfx/battle_anims/frames/2781E4.tilemap

d_2781E8	section	romdata abs=0x2781E8
FxFrame_2781E8:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2781E8.tilemap.asm"	; src/gfx/battle_anims/frames/2781E8.tilemap

d_2781F2	section	romdata abs=0x2781F2
FxFrame_2781F2:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2781F2.tilemap.asm"	; src/gfx/battle_anims/frames/2781F2.tilemap

d_2781FC	section	romdata abs=0x2781FC
FxFrame_2781FC:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2781FC.tilemap.asm"	; src/gfx/battle_anims/frames/2781FC.tilemap

d_278206	section	romdata abs=0x278206
FxFrame_278206:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/278206.tilemap.asm"	; src/gfx/battle_anims/frames/278206.tilemap

d_27820A	section	romdata abs=0x27820A
FxFrame_27820A:          ; 5 x 1
$include "build/src/gfx/battle_anims/frames/27820A.tilemap.asm"	; src/gfx/battle_anims/frames/27820A.tilemap

d_278216	section	romdata abs=0x278216
FxFrame_278216:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/278216.tilemap.asm"	; src/gfx/battle_anims/frames/278216.tilemap

d_2782E0	section	romdata abs=0x2782E0
FxFrame_2782E0:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2782E0.tilemap.asm"	; src/gfx/battle_anims/frames/2782E0.tilemap

d_2782E4	section	romdata abs=0x2782E4
FxFrame_2782E4:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2782E4.tilemap.asm"	; src/gfx/battle_anims/frames/2782E4.tilemap

d_2782E8	section	romdata abs=0x2782E8
FxFrame_2782E8:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2782E8.tilemap.asm"	; src/gfx/battle_anims/frames/2782E8.tilemap

d_2782F2	section	romdata abs=0x2782F2
FxFrame_2782F2:          ; 1 x 4
$include "build/src/gfx/battle_anims/frames/2782F2.tilemap.asm"	; src/gfx/battle_anims/frames/2782F2.tilemap

d_2782FC	section	romdata abs=0x2782FC
FxFrame_2782FC:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2782FC.tilemap.asm"	; src/gfx/battle_anims/frames/2782FC.tilemap

d_278310	section	romdata abs=0x278310
FxFrame_278310:          ; 9 x 9
$include "build/src/gfx/battle_anims/frames/278310.tilemap.asm"	; src/gfx/battle_anims/frames/278310.tilemap

d_2783B4	section	romdata abs=0x2783B4
FxFrame_2783B4:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2783B4.tilemap.asm"	; src/gfx/battle_anims/frames/2783B4.tilemap

d_2783BE	section	romdata abs=0x2783BE
FxFrame_2783BE:          ; 8 x 1
$include "build/src/gfx/battle_anims/frames/2783BE.tilemap.asm"	; src/gfx/battle_anims/frames/2783BE.tilemap

d_2783D0	section	romdata abs=0x2783D0
FxFrame_2783D0:          ; 4 x 5
$include "build/src/gfx/battle_anims/frames/2783D0.tilemap.asm"	; src/gfx/battle_anims/frames/2783D0.tilemap

d_2783FA	section	romdata abs=0x2783FA
FxFrame_2783FA:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/2783FA.tilemap.asm"	; src/gfx/battle_anims/frames/2783FA.tilemap

d_27842C	section	romdata abs=0x27842C
FxFrame_27842C:          ; 1 x 8
$include "build/src/gfx/battle_anims/frames/27842C.tilemap.asm"	; src/gfx/battle_anims/frames/27842C.tilemap

d_27843E	section	romdata abs=0x27843E
FxFrame_27843E:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/27843E.tilemap.asm"	; src/gfx/battle_anims/frames/27843E.tilemap

d_278442	section	romdata abs=0x278442
FxFrame_278442:          ; 7 x 5
$include "build/src/gfx/battle_anims/frames/278442.tilemap.asm"	; src/gfx/battle_anims/frames/278442.tilemap

d_27848A	section	romdata abs=0x27848A
FxFrame_27848A:          ; 5 x 5
$include "build/src/gfx/battle_anims/frames/27848A.tilemap.asm"	; src/gfx/battle_anims/frames/27848A.tilemap

d_2784BE	section	romdata abs=0x2784BE
FxFrame_2784BE:          ; 7 x 7
$include "build/src/gfx/battle_anims/frames/2784BE.tilemap.asm"	; src/gfx/battle_anims/frames/2784BE.tilemap

d_278522	section	romdata abs=0x278522
FxFrame_278522:          ; 6 x 4
$include "build/src/gfx/battle_anims/frames/278522.tilemap.asm"	; src/gfx/battle_anims/frames/278522.tilemap

d_278554	section	romdata abs=0x278554
FxFrame_278554:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/278554.tilemap.asm"	; src/gfx/battle_anims/frames/278554.tilemap

d_278568	section	romdata abs=0x278568
FxFrame_278568:          ; 7 x 7
$include "build/src/gfx/battle_anims/frames/278568.tilemap.asm"	; src/gfx/battle_anims/frames/278568.tilemap

d_2785CC	section	romdata abs=0x2785CC
FxFrame_2785CC:          ; 12 x 4
$include "build/src/gfx/battle_anims/frames/2785CC.tilemap.asm"	; src/gfx/battle_anims/frames/2785CC.tilemap

d_27862E	section	romdata abs=0x27862E
FxFrame_27862E:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/27862E.tilemap.asm"	; src/gfx/battle_anims/frames/27862E.tilemap

d_278678	section	romdata abs=0x278678
FxFrame_278678:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278678.tilemap.asm"	; src/gfx/battle_anims/frames/278678.tilemap

d_278682	section	romdata abs=0x278682
FxFrame_278682:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278682.tilemap.asm"	; src/gfx/battle_anims/frames/278682.tilemap

d_27868C	section	romdata abs=0x27868C
FxFrame_27868C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27868C.tilemap.asm"	; src/gfx/battle_anims/frames/27868C.tilemap

d_278696	section	romdata abs=0x278696
FxFrame_278696:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278696.tilemap.asm"	; src/gfx/battle_anims/frames/278696.tilemap

d_2786A0	section	romdata abs=0x2786A0
FxFrame_2786A0:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2786A0.tilemap.asm"	; src/gfx/battle_anims/frames/2786A0.tilemap

d_2786AA	section	romdata abs=0x2786AA
FxFrame_2786AA:          ; 1 x 7
$include "build/src/gfx/battle_anims/frames/2786AA.tilemap.asm"	; src/gfx/battle_anims/frames/2786AA.tilemap

d_2786BA	section	romdata abs=0x2786BA
FxFrame_2786BA:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/2786BA.tilemap.asm"	; src/gfx/battle_anims/frames/2786BA.tilemap

d_27872C	section	romdata abs=0x27872C
FxFrame_27872C:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/27872C.tilemap.asm"	; src/gfx/battle_anims/frames/27872C.tilemap

d_278776	section	romdata abs=0x278776
FxFrame_278776:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/278776.tilemap.asm"	; src/gfx/battle_anims/frames/278776.tilemap

d_27877C	section	romdata abs=0x27877C
FxFrame_27877C:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/27877C.tilemap.asm"	; src/gfx/battle_anims/frames/27877C.tilemap

d_278784	section	romdata abs=0x278784
FxFrame_278784:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/278784.tilemap.asm"	; src/gfx/battle_anims/frames/278784.tilemap

d_2787CE	section	romdata abs=0x2787CE
FxFrame_2787CE:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2787CE.tilemap.asm"	; src/gfx/battle_anims/frames/2787CE.tilemap

d_2787E2	section	romdata abs=0x2787E2
FxFrame_2787E2:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2787E2.tilemap.asm"	; src/gfx/battle_anims/frames/2787E2.tilemap

d_2787E6	section	romdata abs=0x2787E6
FxFrame_2787E6:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2787E6.tilemap.asm"	; src/gfx/battle_anims/frames/2787E6.tilemap

d_2787EA	section	romdata abs=0x2787EA
FxFrame_2787EA:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/2787EA.tilemap.asm"	; src/gfx/battle_anims/frames/2787EA.tilemap

d_27881C	section	romdata abs=0x27881C
FxFrame_27881C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27881C.tilemap.asm"	; src/gfx/battle_anims/frames/27881C.tilemap

d_278826	section	romdata abs=0x278826
FxFrame_278826:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278826.tilemap.asm"	; src/gfx/battle_anims/frames/278826.tilemap

d_278830	section	romdata abs=0x278830
FxFrame_278830:          ; 1 x 11
$include "build/src/gfx/battle_anims/frames/278830.tilemap.asm"	; src/gfx/battle_anims/frames/278830.tilemap

d_278848	section	romdata abs=0x278848
FxFrame_278848:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/278848.tilemap.asm"	; src/gfx/battle_anims/frames/278848.tilemap

d_27887A	section	romdata abs=0x27887A
FxFrame_27887A:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/27887A.tilemap.asm"	; src/gfx/battle_anims/frames/27887A.tilemap

d_278880	section	romdata abs=0x278880
FxFrame_278880:          ; 5 x 6
$include "build/src/gfx/battle_anims/frames/278880.tilemap.asm"	; src/gfx/battle_anims/frames/278880.tilemap

d_2788BE	section	romdata abs=0x2788BE
FxFrame_2788BE:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2788BE.tilemap.asm"	; src/gfx/battle_anims/frames/2788BE.tilemap

d_2788C2	section	romdata abs=0x2788C2
FxFrame_2788C2:          ; 5 x 3
$include "build/src/gfx/battle_anims/frames/2788C2.tilemap.asm"	; src/gfx/battle_anims/frames/2788C2.tilemap

d_2788E2	section	romdata abs=0x2788E2
FxFrame_2788E2:          ; 4 x 10
$include "build/src/gfx/battle_anims/frames/2788E2.tilemap.asm"	; src/gfx/battle_anims/frames/2788E2.tilemap

d_278934	section	romdata abs=0x278934
FxFrame_278934:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278934.tilemap.asm"	; src/gfx/battle_anims/frames/278934.tilemap

d_27893E	section	romdata abs=0x27893E
FxFrame_27893E:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/27893E.tilemap.asm"	; src/gfx/battle_anims/frames/27893E.tilemap

d_278960	section	romdata abs=0x278960
FxFrame_278960:          ; 8 x 3
$include "build/src/gfx/battle_anims/frames/278960.tilemap.asm"	; src/gfx/battle_anims/frames/278960.tilemap

d_278992	section	romdata abs=0x278992
FxFrame_278992:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/278992.tilemap.asm"	; src/gfx/battle_anims/frames/278992.tilemap

d_2789DC	section	romdata abs=0x2789DC
FxFrame_2789DC:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2789DC.tilemap.asm"	; src/gfx/battle_anims/frames/2789DC.tilemap

d_2789E0	section	romdata abs=0x2789E0
FxFrame_2789E0:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/2789E0.tilemap.asm"	; src/gfx/battle_anims/frames/2789E0.tilemap

d_2789FA	section	romdata abs=0x2789FA
FxFrame_2789FA:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/2789FA.tilemap.asm"	; src/gfx/battle_anims/frames/2789FA.tilemap

d_278A2C	section	romdata abs=0x278A2C
FxFrame_278A2C:          ; 8 x 1
$include "build/src/gfx/battle_anims/frames/278A2C.tilemap.asm"	; src/gfx/battle_anims/frames/278A2C.tilemap

d_278A3E	section	romdata abs=0x278A3E
FxFrame_278A3E:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/278A3E.tilemap.asm"	; src/gfx/battle_anims/frames/278A3E.tilemap

d_278AB0	section	romdata abs=0x278AB0
FxFrame_278AB0:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278AB0.tilemap.asm"	; src/gfx/battle_anims/frames/278AB0.tilemap

d_278ABA	section	romdata abs=0x278ABA
FxFrame_278ABA:          ; 7 x 7
$include "build/src/gfx/battle_anims/frames/278ABA.tilemap.asm"	; src/gfx/battle_anims/frames/278ABA.tilemap

d_278B1E	section	romdata abs=0x278B1E
FxFrame_278B1E:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/278B1E.tilemap.asm"	; src/gfx/battle_anims/frames/278B1E.tilemap

d_278B22	section	romdata abs=0x278B22
FxFrame_278B22:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/278B22.tilemap.asm"	; src/gfx/battle_anims/frames/278B22.tilemap

d_278B36	section	romdata abs=0x278B36
FxFrame_278B36:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/278B36.tilemap.asm"	; src/gfx/battle_anims/frames/278B36.tilemap

d_278B68	section	romdata abs=0x278B68
FxFrame_278B68:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278B68.tilemap.asm"	; src/gfx/battle_anims/frames/278B68.tilemap

d_278B72	section	romdata abs=0x278B72
FxFrame_278B72:          ; 8 x 1
$include "build/src/gfx/battle_anims/frames/278B72.tilemap.asm"	; src/gfx/battle_anims/frames/278B72.tilemap

d_278B84	section	romdata abs=0x278B84
FxFrame_278B84:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278B84.tilemap.asm"	; src/gfx/battle_anims/frames/278B84.tilemap

d_278B8E	section	romdata abs=0x278B8E
FxFrame_278B8E:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/278B8E.tilemap.asm"	; src/gfx/battle_anims/frames/278B8E.tilemap

d_278B94	section	romdata abs=0x278B94
FxFrame_278B94:          ; 1 x 7
$include "build/src/gfx/battle_anims/frames/278B94.tilemap.asm"	; src/gfx/battle_anims/frames/278B94.tilemap

d_278BA4	section	romdata abs=0x278BA4
FxFrame_278BA4:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/278BA4.tilemap.asm"	; src/gfx/battle_anims/frames/278BA4.tilemap

d_278C16	section	romdata abs=0x278C16
FxFrame_278C16:          ; 3 x 1
$include "build/src/gfx/battle_anims/frames/278C16.tilemap.asm"	; src/gfx/battle_anims/frames/278C16.tilemap

d_278C1E	section	romdata abs=0x278C1E
FxFrame_278C1E:          ; 1 x 6
$include "build/src/gfx/battle_anims/frames/278C1E.tilemap.asm"	; src/gfx/battle_anims/frames/278C1E.tilemap

d_278C2C	section	romdata abs=0x278C2C
FxFrame_278C2C:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/278C2C.tilemap.asm"	; src/gfx/battle_anims/frames/278C2C.tilemap

d_278C9E	section	romdata abs=0x278C9E
FxFrame_278C9E:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/278C9E.tilemap.asm"	; src/gfx/battle_anims/frames/278C9E.tilemap

d_278CA6	section	romdata abs=0x278CA6
FxFrame_278CA6:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/278CA6.tilemap.asm"	; src/gfx/battle_anims/frames/278CA6.tilemap

d_278CF0	section	romdata abs=0x278CF0
FxFrame_278CF0:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278CF0.tilemap.asm"	; src/gfx/battle_anims/frames/278CF0.tilemap

d_278CFA	section	romdata abs=0x278CFA
FxFrame_278CFA:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278CFA.tilemap.asm"	; src/gfx/battle_anims/frames/278CFA.tilemap

d_278D04	section	romdata abs=0x278D04
FxFrame_278D04:          ; 7 x 8
$include "build/src/gfx/battle_anims/frames/278D04.tilemap.asm"	; src/gfx/battle_anims/frames/278D04.tilemap

d_278D76	section	romdata abs=0x278D76
FxFrame_278D76:          ; 8 x 6
$include "build/src/gfx/battle_anims/frames/278D76.tilemap.asm"	; src/gfx/battle_anims/frames/278D76.tilemap

d_278DD8	section	romdata abs=0x278DD8
FxFrame_278DD8:          ; 3 x 10
$include "build/src/gfx/battle_anims/frames/278DD8.tilemap.asm"	; src/gfx/battle_anims/frames/278DD8.tilemap

d_278E16	section	romdata abs=0x278E16
FxFrame_278E16:          ; 3 x 1
$include "build/src/gfx/battle_anims/frames/278E16.tilemap.asm"	; src/gfx/battle_anims/frames/278E16.tilemap

d_278E1E	section	romdata abs=0x278E1E
FxFrame_278E1E:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/278E1E.tilemap.asm"	; src/gfx/battle_anims/frames/278E1E.tilemap

d_278E68	section	romdata abs=0x278E68
FxFrame_278E68:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/278E68.tilemap.asm"	; src/gfx/battle_anims/frames/278E68.tilemap

d_278F32	section	romdata abs=0x278F32
FxFrame_278F32:          ; 6 x 10
$include "build/src/gfx/battle_anims/frames/278F32.tilemap.asm"	; src/gfx/battle_anims/frames/278F32.tilemap

d_278FAC	section	romdata abs=0x278FAC
FxFrame_278FAC:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/278FAC.tilemap.asm"	; src/gfx/battle_anims/frames/278FAC.tilemap

d_278FC0	section	romdata abs=0x278FC0
FxFrame_278FC0:          ; 2 x 3
$include "build/src/gfx/battle_anims/frames/278FC0.tilemap.asm"	; src/gfx/battle_anims/frames/278FC0.tilemap

d_278FCE	section	romdata abs=0x278FCE
FxFrame_278FCE:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/278FCE.tilemap.asm"	; src/gfx/battle_anims/frames/278FCE.tilemap

d_278FD8	section	romdata abs=0x278FD8
FxFrame_278FD8:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/278FD8.tilemap.asm"	; src/gfx/battle_anims/frames/278FD8.tilemap

d_278FDC	section	romdata abs=0x278FDC
FxFrame_278FDC:          ; 8 x 4
$include "build/src/gfx/battle_anims/frames/278FDC.tilemap.asm"	; src/gfx/battle_anims/frames/278FDC.tilemap

d_27901E	section	romdata abs=0x27901E
FxFrame_27901E:          ; 8 x 9
$include "build/src/gfx/battle_anims/frames/27901E.tilemap.asm"	; src/gfx/battle_anims/frames/27901E.tilemap

d_2790B0	section	romdata abs=0x2790B0
FxFrame_2790B0:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/2790B0.tilemap.asm"	; src/gfx/battle_anims/frames/2790B0.tilemap

d_2790D2	section	romdata abs=0x2790D2
FxFrame_2790D2:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2790D2.tilemap.asm"	; src/gfx/battle_anims/frames/2790D2.tilemap

d_2790DC	section	romdata abs=0x2790DC
FxFrame_2790DC:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2790DC.tilemap.asm"	; src/gfx/battle_anims/frames/2790DC.tilemap

d_2790E0	section	romdata abs=0x2790E0
FxFrame_2790E0:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/2790E0.tilemap.asm"	; src/gfx/battle_anims/frames/2790E0.tilemap

d_279152	section	romdata abs=0x279152
FxFrame_279152:          ; 1 x 8
$include "build/src/gfx/battle_anims/frames/279152.tilemap.asm"	; src/gfx/battle_anims/frames/279152.tilemap

d_279164	section	romdata abs=0x279164
FxFrame_279164:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/279164.tilemap.asm"	; src/gfx/battle_anims/frames/279164.tilemap

d_279178	section	romdata abs=0x279178
FxFrame_279178:          ; 4 x 2
$include "build/src/gfx/battle_anims/frames/279178.tilemap.asm"	; src/gfx/battle_anims/frames/279178.tilemap

d_27918A	section	romdata abs=0x27918A
FxFrame_27918A:          ; 3 x 6
$include "build/src/gfx/battle_anims/frames/27918A.tilemap.asm"	; src/gfx/battle_anims/frames/27918A.tilemap

d_2791B0	section	romdata abs=0x2791B0
FxFrame_2791B0:          ; 1 x 8
$include "build/src/gfx/battle_anims/frames/2791B0.tilemap.asm"	; src/gfx/battle_anims/frames/2791B0.tilemap

d_2791C2	section	romdata abs=0x2791C2
FxFrame_2791C2:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2791C2.tilemap.asm"	; src/gfx/battle_anims/frames/2791C2.tilemap

d_2791CC	section	romdata abs=0x2791CC
FxFrame_2791CC:          ; 9 x 8
$include "build/src/gfx/battle_anims/frames/2791CC.tilemap.asm"	; src/gfx/battle_anims/frames/2791CC.tilemap

d_27925E	section	romdata abs=0x27925E
FxFrame_27925E:          ; 7 x 7
$include "build/src/gfx/battle_anims/frames/27925E.tilemap.asm"	; src/gfx/battle_anims/frames/27925E.tilemap

d_2792C2	section	romdata abs=0x2792C2
FxFrame_2792C2:          ; 3 x 6
$include "build/src/gfx/battle_anims/frames/2792C2.tilemap.asm"	; src/gfx/battle_anims/frames/2792C2.tilemap

d_2792E8	section	romdata abs=0x2792E8
FxFrame_2792E8:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/2792E8.tilemap.asm"	; src/gfx/battle_anims/frames/2792E8.tilemap

d_279302	section	romdata abs=0x279302
FxFrame_279302:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/279302.tilemap.asm"	; src/gfx/battle_anims/frames/279302.tilemap

d_279324	section	romdata abs=0x279324
FxFrame_279324:          ; 8 x 2
$include "build/src/gfx/battle_anims/frames/279324.tilemap.asm"	; src/gfx/battle_anims/frames/279324.tilemap

d_279346	section	romdata abs=0x279346
FxFrame_279346:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/279346.tilemap.asm"	; src/gfx/battle_anims/frames/279346.tilemap

d_279360	section	romdata abs=0x279360
FxFrame_279360:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/279360.tilemap.asm"	; src/gfx/battle_anims/frames/279360.tilemap

d_27936A	section	romdata abs=0x27936A
FxFrame_27936A:          ; 5 x 6
$include "build/src/gfx/battle_anims/frames/27936A.tilemap.asm"	; src/gfx/battle_anims/frames/27936A.tilemap

d_2793A8	section	romdata abs=0x2793A8
FxFrame_2793A8:          ; 4 x 3
$include "build/src/gfx/battle_anims/frames/2793A8.tilemap.asm"	; src/gfx/battle_anims/frames/2793A8.tilemap

d_2793C2	section	romdata abs=0x2793C2
FxFrame_2793C2:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2793C2.tilemap.asm"	; src/gfx/battle_anims/frames/2793C2.tilemap

d_2793C6	section	romdata abs=0x2793C6
FxFrame_2793C6:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/2793C6.tilemap.asm"	; src/gfx/battle_anims/frames/2793C6.tilemap

d_2793E8	section	romdata abs=0x2793E8
FxFrame_2793E8:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2793E8.tilemap.asm"	; src/gfx/battle_anims/frames/2793E8.tilemap

d_2793EC	section	romdata abs=0x2793EC
FxFrame_2793EC:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2793EC.tilemap.asm"	; src/gfx/battle_anims/frames/2793EC.tilemap

d_2793F0	section	romdata abs=0x2793F0
FxFrame_2793F0:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2793F0.tilemap.asm"	; src/gfx/battle_anims/frames/2793F0.tilemap

d_279404	section	romdata abs=0x279404
FxFrame_279404:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/279404.tilemap.asm"	; src/gfx/battle_anims/frames/279404.tilemap

d_279418	section	romdata abs=0x279418
FxFrame_279418:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/279418.tilemap.asm"	; src/gfx/battle_anims/frames/279418.tilemap

d_279422	section	romdata abs=0x279422
FxFrame_279422:          ; 7 x 8
$include "build/src/gfx/battle_anims/frames/279422.tilemap.asm"	; src/gfx/battle_anims/frames/279422.tilemap

d_279494	section	romdata abs=0x279494
FxFrame_279494:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/279494.tilemap.asm"	; src/gfx/battle_anims/frames/279494.tilemap

d_27949C	section	romdata abs=0x27949C
FxFrame_27949C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27949C.tilemap.asm"	; src/gfx/battle_anims/frames/27949C.tilemap

d_2794A6	section	romdata abs=0x2794A6
FxFrame_2794A6:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/2794A6.tilemap.asm"	; src/gfx/battle_anims/frames/2794A6.tilemap

d_2794F0	section	romdata abs=0x2794F0
FxFrame_2794F0:          ; 2 x 12
$include "build/src/gfx/battle_anims/frames/2794F0.tilemap.asm"	; src/gfx/battle_anims/frames/2794F0.tilemap

d_279522	section	romdata abs=0x279522
FxFrame_279522:          ; 6 x 8
$include "build/src/gfx/battle_anims/frames/279522.tilemap.asm"	; src/gfx/battle_anims/frames/279522.tilemap

d_279584	section	romdata abs=0x279584
FxFrame_279584:          ; 6 x 3
$include "build/src/gfx/battle_anims/frames/279584.tilemap.asm"	; src/gfx/battle_anims/frames/279584.tilemap

d_2795AA	section	romdata abs=0x2795AA
FxFrame_2795AA:          ; 3 x 6
$include "build/src/gfx/battle_anims/frames/2795AA.tilemap.asm"	; src/gfx/battle_anims/frames/2795AA.tilemap

d_2795D0	section	romdata abs=0x2795D0
FxFrame_2795D0:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/2795D0.tilemap.asm"	; src/gfx/battle_anims/frames/2795D0.tilemap

d_27961A	section	romdata abs=0x27961A
FxFrame_27961A:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/27961A.tilemap.asm"	; src/gfx/battle_anims/frames/27961A.tilemap

d_279664	section	romdata abs=0x279664
FxFrame_279664:          ; 7 x 5
$include "build/src/gfx/battle_anims/frames/279664.tilemap.asm"	; src/gfx/battle_anims/frames/279664.tilemap

d_2796AC	section	romdata abs=0x2796AC
FxFrame_2796AC:          ; 1 x 4
$include "build/src/gfx/battle_anims/frames/2796AC.tilemap.asm"	; src/gfx/battle_anims/frames/2796AC.tilemap

d_2796B6	section	romdata abs=0x2796B6
FxFrame_2796B6:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2796B6.tilemap.asm"	; src/gfx/battle_anims/frames/2796B6.tilemap

d_2796BA	section	romdata abs=0x2796BA
FxFrame_2796BA:          ; 10 x 10
$include "build/src/gfx/battle_anims/frames/2796BA.tilemap.asm"	; src/gfx/battle_anims/frames/2796BA.tilemap

d_279784	section	romdata abs=0x279784
FxFrame_279784:          ; 4 x 2
$include "build/src/gfx/battle_anims/frames/279784.tilemap.asm"	; src/gfx/battle_anims/frames/279784.tilemap

d_279796	section	romdata abs=0x279796
FxFrame_279796:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/279796.tilemap.asm"	; src/gfx/battle_anims/frames/279796.tilemap

d_2797E0	section	romdata abs=0x2797E0
FxFrame_2797E0:          ; 1 x 11
$include "build/src/gfx/battle_anims/frames/2797E0.tilemap.asm"	; src/gfx/battle_anims/frames/2797E0.tilemap

d_2797F8	section	romdata abs=0x2797F8
FxFrame_2797F8:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/2797F8.tilemap.asm"	; src/gfx/battle_anims/frames/2797F8.tilemap

d_279842	section	romdata abs=0x279842
FxFrame_279842:          ; 2 x 6
$include "build/src/gfx/battle_anims/frames/279842.tilemap.asm"	; src/gfx/battle_anims/frames/279842.tilemap

d_27985C	section	romdata abs=0x27985C
FxFrame_27985C:          ; 6 x 5
$include "build/src/gfx/battle_anims/frames/27985C.tilemap.asm"	; src/gfx/battle_anims/frames/27985C.tilemap

d_27989A	section	romdata abs=0x27989A
FxFrame_27989A:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27989A.tilemap.asm"	; src/gfx/battle_anims/frames/27989A.tilemap

d_2798A4	section	romdata abs=0x2798A4
FxFrame_2798A4:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/2798A4.tilemap.asm"	; src/gfx/battle_anims/frames/2798A4.tilemap

d_2798EE	section	romdata abs=0x2798EE
FxFrame_2798EE:          ; 2 x 1
$include "build/src/gfx/battle_anims/frames/2798EE.tilemap.asm"	; src/gfx/battle_anims/frames/2798EE.tilemap

d_2798F4	section	romdata abs=0x2798F4
FxFrame_2798F4:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/2798F4.tilemap.asm"	; src/gfx/battle_anims/frames/2798F4.tilemap

d_2798FE	section	romdata abs=0x2798FE
FxFrame_2798FE:          ; 3 x 4
$include "build/src/gfx/battle_anims/frames/2798FE.tilemap.asm"	; src/gfx/battle_anims/frames/2798FE.tilemap

d_279918	section	romdata abs=0x279918
FxFrame_279918:          ; 6 x 5
$include "build/src/gfx/battle_anims/frames/279918.tilemap.asm"	; src/gfx/battle_anims/frames/279918.tilemap

d_279956	section	romdata abs=0x279956
FxFrame_279956:          ; 8 x 1
$include "build/src/gfx/battle_anims/frames/279956.tilemap.asm"	; src/gfx/battle_anims/frames/279956.tilemap

d_279968	section	romdata abs=0x279968
FxFrame_279968:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/279968.tilemap.asm"	; src/gfx/battle_anims/frames/279968.tilemap

d_279972	section	romdata abs=0x279972
FxFrame_279972:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/279972.tilemap.asm"	; src/gfx/battle_anims/frames/279972.tilemap

d_27997C	section	romdata abs=0x27997C
FxFrame_27997C:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/27997C.tilemap.asm"	; src/gfx/battle_anims/frames/27997C.tilemap

d_279986	section	romdata abs=0x279986
FxFrame_279986:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/279986.tilemap.asm"	; src/gfx/battle_anims/frames/279986.tilemap

d_27998A	section	romdata abs=0x27998A
FxFrame_27998A:          ; 4 x 4
$include "build/src/gfx/battle_anims/frames/27998A.tilemap.asm"	; src/gfx/battle_anims/frames/27998A.tilemap

d_2799AC	section	romdata abs=0x2799AC
FxFrame_2799AC:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/2799AC.tilemap.asm"	; src/gfx/battle_anims/frames/2799AC.tilemap

d_2799C6	section	romdata abs=0x2799C6
FxFrame_2799C6:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/2799C6.tilemap.asm"	; src/gfx/battle_anims/frames/2799C6.tilemap

d_2799CA	section	romdata abs=0x2799CA
FxFrame_2799CA:          ; 3 x 3
$include "build/src/gfx/battle_anims/frames/2799CA.tilemap.asm"	; src/gfx/battle_anims/frames/2799CA.tilemap

d_2799DE	section	romdata abs=0x2799DE
FxFrame_2799DE:          ; 6 x 10
$include "build/src/gfx/battle_anims/frames/2799DE.tilemap.asm"	; src/gfx/battle_anims/frames/2799DE.tilemap

d_279A58	section	romdata abs=0x279A58
FxFrame_279A58:          ; 1 x 4
$include "build/src/gfx/battle_anims/frames/279A58.tilemap.asm"	; src/gfx/battle_anims/frames/279A58.tilemap

d_279A62	section	romdata abs=0x279A62
FxFrame_279A62:          ; 1 x 12
$include "build/src/gfx/battle_anims/frames/279A62.tilemap.asm"	; src/gfx/battle_anims/frames/279A62.tilemap

d_279A7C	section	romdata abs=0x279A7C
FxFrame_279A7C:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/279A7C.tilemap.asm"	; src/gfx/battle_anims/frames/279A7C.tilemap

d_279A80	section	romdata abs=0x279A80
FxFrame_279A80:          ; 1 x 1
$include "build/src/gfx/battle_anims/frames/279A80.tilemap.asm"	; src/gfx/battle_anims/frames/279A80.tilemap

d_279A84	section	romdata abs=0x279A84
FxFrame_279A84:          ; 8 x 8
$include "build/src/gfx/battle_anims/frames/279A84.tilemap.asm"	; src/gfx/battle_anims/frames/279A84.tilemap

d_279B06	section	romdata abs=0x279B06
FxFrame_279B06:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/279B06.tilemap.asm"	; src/gfx/battle_anims/frames/279B06.tilemap

d_279B10	section	romdata abs=0x279B10
FxFrame_279B10:          ; 8 x 7
$include "build/src/gfx/battle_anims/frames/279B10.tilemap.asm"	; src/gfx/battle_anims/frames/279B10.tilemap

d_279B82	section	romdata abs=0x279B82
FxFrame_279B82:          ; 8 x 4
$include "build/src/gfx/battle_anims/frames/279B82.tilemap.asm"	; src/gfx/battle_anims/frames/279B82.tilemap

d_279BC4	section	romdata abs=0x279BC4
FxFrame_279BC4:          ; 1 x 3
$include "build/src/gfx/battle_anims/frames/279BC4.tilemap.asm"	; src/gfx/battle_anims/frames/279BC4.tilemap

d_279BCC	section	romdata abs=0x279BCC
FxFrame_279BCC:          ; 6 x 6
$include "build/src/gfx/battle_anims/frames/279BCC.tilemap.asm"	; src/gfx/battle_anims/frames/279BCC.tilemap

d_279C16	section	romdata abs=0x279C16
FxFrame_279C16:          ; 2 x 2
$include "build/src/gfx/battle_anims/frames/279C16.tilemap.asm"	; src/gfx/battle_anims/frames/279C16.tilemap

d_279C20	section	romdata abs=0x279C20
FxFrame_279C20:          ; 3 x 4
$include "build/src/gfx/battle_anims/frames/279C20.tilemap.asm"	; src/gfx/battle_anims/frames/279C20.tilemap

d_279C3A	section	romdata abs=0x279C3A
FxTiles_279C3A:
$include "build/gfx/battle_anims/279C3A.2bpp.lz.asm"	; build/gfx/battle_anims/279C3A.2bpp.lz

d_279F62	section	romdata abs=0x279F62
FxTiles_279F62:
$include "build/gfx/battle_anims/279F62.2bpp.lz.asm"	; build/gfx/battle_anims/279F62.2bpp.lz

d_27A3E7	section	romdata abs=0x27A3E7
FxTiles_27A3E7:
$include "build/gfx/battle_anims/27A3E7.2bpp.lz.asm"	; build/gfx/battle_anims/27A3E7.2bpp.lz

d_27A92E	section	romdata abs=0x27A92E
FxTiles_27A92E:
$include "build/gfx/battle_anims/27A92E.2bpp.lz.asm"	; build/gfx/battle_anims/27A92E.2bpp.lz

d_27A9B3	section	romdata abs=0x27A9B3
FxTiles_27A9B3:
$include "build/gfx/battle_anims/27A9B3.2bpp.lz.asm"	; build/gfx/battle_anims/27A9B3.2bpp.lz

d_27ABDC	section	romdata abs=0x27ABDC
FxTiles_27ABDC:
$include "build/gfx/battle_anims/27ABDC.2bpp.lz.asm"	; build/gfx/battle_anims/27ABDC.2bpp.lz

d_27AC3C	section	romdata abs=0x27AC3C
FxTiles_27AC3C:
$include "build/gfx/battle_anims/27AC3C.2bpp.lz.asm"	; build/gfx/battle_anims/27AC3C.2bpp.lz

d_27AC58	section	romdata abs=0x27AC58
FxTiles_27AC58:
$include "build/gfx/battle_anims/27AC58.2bpp.lz.asm"	; build/gfx/battle_anims/27AC58.2bpp.lz

d_27ACA0	section	romdata abs=0x27ACA0
FxTiles_27ACA0:
$include "build/gfx/battle_anims/27ACA0.2bpp.lz.asm"	; build/gfx/battle_anims/27ACA0.2bpp.lz

d_27B064	section	romdata abs=0x27B064
FxTiles_27B064:
$include "build/gfx/battle_anims/27B064.2bpp.lz.asm"	; build/gfx/battle_anims/27B064.2bpp.lz

d_27B14A	section	romdata abs=0x27B14A
FxTiles_27B14A:
$include "build/gfx/battle_anims/27B14A.2bpp.lz.asm"	; build/gfx/battle_anims/27B14A.2bpp.lz

d_27B32B	section	romdata abs=0x27B32B
FxTiles_27B32B:
$include "build/gfx/battle_anims/27B32B.2bpp.lz.asm"	; build/gfx/battle_anims/27B32B.2bpp.lz

d_27B43A	section	romdata abs=0x27B43A
FxTiles_27B43A:
$include "build/gfx/battle_anims/27B43A.2bpp.lz.asm"	; build/gfx/battle_anims/27B43A.2bpp.lz

d_27B456	section	romdata abs=0x27B456
FxTiles_27B456:
$include "build/gfx/battle_anims/27B456.2bpp.lz.asm"	; build/gfx/battle_anims/27B456.2bpp.lz

d_27B681	section	romdata abs=0x27B681
FxTiles_27B681:
$include "build/gfx/battle_anims/27B681.2bpp.lz.asm"	; build/gfx/battle_anims/27B681.2bpp.lz

d_27BAD5	section	romdata abs=0x27BAD5
FxTiles_27BAD5:
$include "build/gfx/battle_anims/27BAD5.2bpp.lz.asm"	; build/gfx/battle_anims/27BAD5.2bpp.lz

d_27BB5F	section	romdata abs=0x27BB5F
FxTiles_27BB5F:
$include "build/gfx/battle_anims/27BB5F.2bpp.lz.asm"	; build/gfx/battle_anims/27BB5F.2bpp.lz

d_27C044	section	romdata abs=0x27C044
FxTiles_27C044:
$include "build/gfx/battle_anims/27C044.2bpp.lz.asm"	; build/gfx/battle_anims/27C044.2bpp.lz

d_27C213	section	romdata abs=0x27C213
FxTiles_27C213:
$include "build/gfx/battle_anims/27C213.2bpp.lz.asm"	; build/gfx/battle_anims/27C213.2bpp.lz

d_27C299	section	romdata abs=0x27C299
FxTiles_27C299:
$include "build/gfx/battle_anims/27C299.2bpp.lz.asm"	; build/gfx/battle_anims/27C299.2bpp.lz

d_27C2E9	section	romdata abs=0x27C2E9
FxTiles_27C2E9:
$include "build/gfx/battle_anims/27C2E9.2bpp.lz.asm"	; build/gfx/battle_anims/27C2E9.2bpp.lz

d_27C398	section	romdata abs=0x27C398
FxTiles_27C398:
$include "build/gfx/battle_anims/27C398.2bpp.lz.asm"	; build/gfx/battle_anims/27C398.2bpp.lz

d_27C62B	section	romdata abs=0x27C62B
FxTiles_27C62B:
$include "build/gfx/battle_anims/27C62B.2bpp.lz.asm"	; build/gfx/battle_anims/27C62B.2bpp.lz

d_27C747	section	romdata abs=0x27C747
FxTiles_27C747:
$include "build/gfx/battle_anims/27C747.2bpp.lz.asm"	; build/gfx/battle_anims/27C747.2bpp.lz

d_27C7B6	section	romdata abs=0x27C7B6
FxTiles_27C7B6:
$include "build/gfx/battle_anims/27C7B6.2bpp.lz.asm"	; build/gfx/battle_anims/27C7B6.2bpp.lz

d_27C8C3	section	romdata abs=0x27C8C3
FxTiles_27C8C3:
$include "build/gfx/battle_anims/27C8C3.2bpp.lz.asm"	; build/gfx/battle_anims/27C8C3.2bpp.lz

d_27C935	section	romdata abs=0x27C935
FxTiles_27C935:
$include "build/gfx/battle_anims/27C935.2bpp.lz.asm"	; build/gfx/battle_anims/27C935.2bpp.lz

d_27CB28	section	romdata abs=0x27CB28
FxTiles_27CB28:
$include "build/gfx/battle_anims/27CB28.2bpp.lz.asm"	; build/gfx/battle_anims/27CB28.2bpp.lz

d_27CB47	section	romdata abs=0x27CB47
FxTiles_27CB47:
$include "build/gfx/battle_anims/27CB47.2bpp.lz.asm"	; build/gfx/battle_anims/27CB47.2bpp.lz

d_27CD18	section	romdata abs=0x27CD18
FxTiles_27CD18:
$include "build/gfx/battle_anims/27CD18.2bpp.lz.asm"	; build/gfx/battle_anims/27CD18.2bpp.lz

d_27D0A8	section	romdata abs=0x27D0A8
FxTiles_27D0A8:
$include "build/gfx/battle_anims/27D0A8.2bpp.lz.asm"	; build/gfx/battle_anims/27D0A8.2bpp.lz

d_27D227	section	romdata abs=0x27D227
FxTiles_27D227:
$include "build/gfx/battle_anims/27D227.2bpp.lz.asm"	; build/gfx/battle_anims/27D227.2bpp.lz

d_27D373	section	romdata abs=0x27D373
FxTiles_27D373:
$include "build/gfx/battle_anims/27D373.2bpp.lz.asm"	; build/gfx/battle_anims/27D373.2bpp.lz

d_27D91B	section	romdata abs=0x27D91B
FxTiles_27D91B:
$include "build/gfx/battle_anims/27D91B.2bpp.lz.asm"	; build/gfx/battle_anims/27D91B.2bpp.lz

d_27DA68	section	romdata abs=0x27DA68
FxTiles_27DA68:
$include "build/gfx/battle_anims/27DA68.2bpp.lz.asm"	; build/gfx/battle_anims/27DA68.2bpp.lz

d_27DB30	section	romdata abs=0x27DB30
FxTiles_27DB30:
$include "build/gfx/battle_anims/27DB30.2bpp.lz.asm"	; build/gfx/battle_anims/27DB30.2bpp.lz

d_27DB4A	section	romdata abs=0x27DB4A
FxTiles_27DB4A:
$include "build/gfx/battle_anims/27DB4A.2bpp.lz.asm"	; build/gfx/battle_anims/27DB4A.2bpp.lz

d_27DE8E	section	romdata abs=0x27DE8E
FxTiles_27DE8E:
$include "build/gfx/battle_anims/27DE8E.2bpp.lz.asm"	; build/gfx/battle_anims/27DE8E.2bpp.lz

d_27DF04	section	romdata abs=0x27DF04
FxTiles_27DF04:
$include "build/gfx/battle_anims/27DF04.2bpp.lz.asm"	; build/gfx/battle_anims/27DF04.2bpp.lz

d_27E1E2	section	romdata abs=0x27E1E2
FxTiles_27E1E2:
$include "build/gfx/battle_anims/27E1E2.2bpp.lz.asm"	; build/gfx/battle_anims/27E1E2.2bpp.lz

d_27E22F	section	romdata abs=0x27E22F
FxTiles_27E22F:
$include "build/gfx/battle_anims/27E22F.2bpp.lz.asm"	; build/gfx/battle_anims/27E22F.2bpp.lz

d_27E4B0	section	romdata abs=0x27E4B0
FxTiles_27E4B0:
$include "build/gfx/battle_anims/27E4B0.2bpp.lz.asm"	; build/gfx/battle_anims/27E4B0.2bpp.lz

d_27E6EF	section	romdata abs=0x27E6EF
FxTiles_27E6EF:
$include "build/gfx/battle_anims/27E6EF.2bpp.lz.asm"	; build/gfx/battle_anims/27E6EF.2bpp.lz

d_27E78F	section	romdata abs=0x27E78F
FxTiles_27E78F:
$include "build/gfx/battle_anims/27E78F.2bpp.lz.asm"	; build/gfx/battle_anims/27E78F.2bpp.lz

d_27E953	section	romdata abs=0x27E953
FxTiles_27E953:
$include "build/gfx/battle_anims/27E953.2bpp.lz.asm"	; build/gfx/battle_anims/27E953.2bpp.lz

d_27EBE6	section	romdata abs=0x27EBE6
FxTiles_27EBE6:
$include "build/gfx/battle_anims/27EBE6.2bpp.lz.asm"	; build/gfx/battle_anims/27EBE6.2bpp.lz

d_27ED3D	section	romdata abs=0x27ED3D
FxTiles_27ED3D:
$include "build/gfx/battle_anims/27ED3D.2bpp.lz.asm"	; build/gfx/battle_anims/27ED3D.2bpp.lz

d_27F220	section	romdata abs=0x27F220
FxTiles_27F220:
$include "build/gfx/battle_anims/27F220.2bpp.lz.asm"	; build/gfx/battle_anims/27F220.2bpp.lz

d_27F262	section	romdata abs=0x27F262
FxTiles_27F262:
$include "build/gfx/battle_anims/27F262.2bpp.lz.asm"	; build/gfx/battle_anims/27F262.2bpp.lz

d_27F2AA	section	romdata abs=0x27F2AA
FxTiles_27F2AA:
$include "build/gfx/battle_anims/27F2AA.2bpp.lz.asm"	; build/gfx/battle_anims/27F2AA.2bpp.lz

d_27F2F6	section	romdata abs=0x27F2F6
FxTiles_27F2F6:
$include "build/gfx/battle_anims/27F2F6.2bpp.lz.asm"	; build/gfx/battle_anims/27F2F6.2bpp.lz

d_27F4E7	section	romdata abs=0x27F4E7
FxTiles_27F4E7:
$include "build/gfx/battle_anims/27F4E7.2bpp.lz.asm"	; build/gfx/battle_anims/27F4E7.2bpp.lz

d_27F506	section	romdata abs=0x27F506
FxTiles_27F506:
$include "build/gfx/battle_anims/27F506.2bpp.lz.asm"	; build/gfx/battle_anims/27F506.2bpp.lz

d_27F60E	section	romdata abs=0x27F60E
FxTiles_27F60E:
$include "build/gfx/battle_anims/27F60E.2bpp.lz.asm"	; build/gfx/battle_anims/27F60E.2bpp.lz

d_27FAEF	section	romdata abs=0x27FAEF
FxTiles_27FAEF:
$include "build/gfx/battle_anims/27FAEF.2bpp.lz.asm"	; build/gfx/battle_anims/27FAEF.2bpp.lz

d_27FB33	section	romdata abs=0x27FB33
FxTiles_27FB33:
$include "build/gfx/battle_anims/27FB33.2bpp.lz.asm"	; build/gfx/battle_anims/27FB33.2bpp.lz

d_27FCF0	section	romdata abs=0x27FCF0
FxTiles_27FCF0:
$include "build/gfx/battle_anims/27FCF0.2bpp.lz.asm"	; build/gfx/battle_anims/27FCF0.2bpp.lz

d_27FD38	section	romdata abs=0x27FD38
FxTiles_27FD38:
$include "build/gfx/battle_anims/27FD38.2bpp.lz.asm"	; build/gfx/battle_anims/27FD38.2bpp.lz

d_27FDF3	section	romdata abs=0x27FDF3
FxTiles_27FDF3:
$include "build/gfx/battle_anims/27FDF3.2bpp.lz.asm"	; build/gfx/battle_anims/27FDF3.2bpp.lz

d_28027B	section	romdata abs=0x28027B
FxTiles_28027B:
$include "build/gfx/battle_anims/28027B.2bpp.lz.asm"	; build/gfx/battle_anims/28027B.2bpp.lz

d_28034F	section	romdata abs=0x28034F
FxTiles_28034F:
$include "build/gfx/battle_anims/28034F.2bpp.lz.asm"	; build/gfx/battle_anims/28034F.2bpp.lz

d_2804E4	section	romdata abs=0x2804E4
FxPal_2804E4:
	dw	0x0FFF,0x0EEE,0x0FD7,0x0F90

d_2804EC	section	romdata abs=0x2804EC
FxPal_2804EC:
	dw	0x0FFF,0x006F,0x004D,0x000B

d_2804F4	section	romdata abs=0x2804F4
FxPal_2804F4:
	dw	0x0FFF,0x00FF,0x00CC,0x0089

d_2804FC	section	romdata abs=0x2804FC
FxPal_2804FC:
	dw	0x0FFF,0x07F9,0x04D0,0x0150

d_280504	section	romdata abs=0x280504
FxPal_280504:
	dw	0x0FFF,0x00FF,0x008F,0x001D
	db	0xFF,0x0F,0xFF,0x00,0x8F,0x00,0x1D,0x00,0xFF,0x0F,0xFF,0x00,0x8F,0x00,0x1D,0x00	; no reader found
	db	0xFF,0x0F,0xFF,0x00,0x8F,0x00,0x1D,0x00

d_280524	section	romdata abs=0x280524
FxPal_280524:
	dw	0x0FFF,0x0FFF,0x0EC0,0x0970

d_28052C	section	romdata abs=0x28052C
FxPal_28052C:
	dw	0x0FFF,0x005F,0x002D,0x000B

d_280534	section	romdata abs=0x280534
FxPal_280534:
	dw	0x0FFF,0x00EF,0x00BC,0x0057

d_28053C	section	romdata abs=0x28053C
FxPal_28053C:
	dw	0x0FFF,0x07F9,0x04D0,0x0150

d_280544	section	romdata abs=0x280544
FxPal_280544:
	dw	0x0FFF,0x08F0,0x04A0,0x0060

d_28054C	section	romdata abs=0x28054C
FxPal_28054C:
	dw	0x0FFF,0x005F,0x002D,0x002B

d_280554	section	romdata abs=0x280554
FxPal_280554:
	dw	0x0FFF,0x0FC3,0x0F81,0x0F40

d_28055C	section	romdata abs=0x28055C
FxPal_28055C:
	dw	0x0FFF,0x00FF,0x00AB,0x0066

d_280564	section	romdata abs=0x280564
FxPal_280564:
	dw	0x0FFF,0x0CF6,0x0580,0x0050
	db	0xFF,0x0F,0xF6,0x0C,0xA0,0x05,0x50,0x00,0xFF,0x0F,0xF6,0x0C,0xA0,0x05,0x50,0x00	; no reader found
	db	0xFF,0x0F,0xF6,0x0C,0xA0,0x05,0x50,0x00

d_280584	section	romdata abs=0x280584
FxPal_280584:
	dw	0x0FFF,0x03FF,0x00BC,0x0057
	db	0xFF,0x0F,0xFF,0x03,0xBC,0x00,0x57,0x00,0xFF,0x0F,0xFF,0x03,0xBC,0x00,0x57,0x00	; no reader found
	db	0xFF,0x0F,0xFF,0x03,0xBC,0x00,0x57,0x00

d_2805A4	section	romdata abs=0x2805A4
FxPal_2805A4:
	dw	0x0FFF,0x0EEE,0x0FC8,0x0F93

d_2805AC	section	romdata abs=0x2805AC
FxPal_2805AC:
	dw	0x0FFF,0x006F,0x004E,0x002C

d_2805B4	section	romdata abs=0x2805B4
FxPal_2805B4:
	dw	0x0FFF,0x00FF,0x00BC,0x0088

d_2805BC	section	romdata abs=0x2805BC
FxPal_2805BC:
	dw	0x0FFF,0x07F9,0x04D0,0x0150

d_2805C4	section	romdata abs=0x2805C4
FxPal_2805C4:
	dw	0x0FFF,0x0FFF,0x03F0,0x0150
	db	0xFF,0x0F,0xFF,0x0F,0xF0,0x03,0x50,0x01,0xFF,0x0F,0xFF,0x0F,0xF0,0x03,0x50,0x01	; no reader found
	db	0xFF,0x0F,0xFF,0x0F,0xF0,0x03,0x50,0x01

d_2805E4	section	romdata abs=0x2805E4
FxPal_2805E4:
	dw	0x0FFF,0x0456,0x0047,0x0043
	db	0xFF,0x0F,0x56,0x04,0x47,0x00,0x43,0x00,0xFF,0x0F,0x56,0x04,0x47,0x00,0x43,0x00	; no reader found
	db	0xFF,0x0F,0x56,0x04,0x47,0x00,0x43,0x00

d_280604	section	romdata abs=0x280604
FxPal_280604:
	dw	0x0FFF,0x0DDD,0x0888,0x0222

d_28060C	section	romdata abs=0x28060C
FxPal_28060C:
	dw	0x0FFF,0x004F,0x003B,0x0028

d_280614	section	romdata abs=0x280614
FxPal_280614:
	dw	0x0FFF,0x0FC7,0x0EA3,0x0D80

d_28061C	section	romdata abs=0x28061C
FxPal_28061C:
	dw	0x0FFF,0x00FF,0x00BB,0x0066

d_280624	section	romdata abs=0x280624
FxPal_280624:
	dw	0x0FFF,0x0FC6,0x0F62,0x0F20

d_28062C	section	romdata abs=0x28062C
FxPal_28062C:
	dw	0x0FFF,0x0887,0x0554,0x0222

d_280634	section	romdata abs=0x280634
FxPal_280634:
	dw	0x0FFF,0x00FF,0x00BA,0x0066
	db	0xFF,0x0F,0xFF,0x00,0xBA,0x00,0x66,0x00	; no reader found

d_280644	section	romdata abs=0x280644
FxPal_280644:
	dw	0x0FFF,0x0BDF,0x04AC,0x0068
	db	0xFF,0x0F,0xDF,0x0B,0xAC,0x04,0x68,0x00,0xFF,0x0F,0xDF,0x0B,0xAC,0x04,0x68,0x00	; no reader found
	db	0xFF,0x0F,0xDF,0x0B,0xAC,0x04,0x68,0x00

d_280664	section	romdata abs=0x280664
FxPal_280664:
	dw	0x0FFF,0x0FD0,0x0D80,0x0B30

d_28066C	section	romdata abs=0x28066C
FxPal_28066C:
	dw	0x0FFF,0x006F,0x003C,0x0009

d_280674	section	romdata abs=0x280674
FxPal_280674:
	dw	0x0FFF,0x0666,0x0343,0x0021

d_28067C	section	romdata abs=0x28067C
FxPal_28067C:
	dw	0x0FFF,0x0EEE,0x0B99,0x0754

d_280684	section	romdata abs=0x280684
FxPal_280684:
	dw	0x0FFF,0x00F0,0x00A0,0x0060

d_28068C	section	romdata abs=0x28068C
FxPal_28068C:
	dw	0x0FFF,0x004F,0x003C,0x0029

d_280694	section	romdata abs=0x280694
FxPal_280694:
	dw	0x0FFF,0x0FE0,0x0F90,0x0F40

d_28069C	section	romdata abs=0x28069C
FxPal_28069C:
	dw	0x0FFF,0x00FF,0x00BB,0x0077

d_2806A4	section	romdata abs=0x2806A4
FxPal_2806A4:
	dw	0x0FFF,0x0ABA,0x0566,0x0021

d_2806AC	section	romdata abs=0x2806AC
FxPal_2806AC:
	dw	0x0FFF,0x007F,0x0009,0x0004

d_2806B4	section	romdata abs=0x2806B4
FxPal_2806B4:
	dw	0x0FFF,0x0FD9,0x0C84,0x0920

d_2806BC	section	romdata abs=0x2806BC
FxPal_2806BC:
	dw	0x0FFF,0x00FF,0x00AA,0x0078

d_2806C4	section	romdata abs=0x2806C4
FxPal_2806C4:
	dw	0x0FFF,0x0FFF,0x0FDA,0x0E93

d_2806CC	section	romdata abs=0x2806CC
FxPal_2806CC:
	dw	0x0FFF,0x007F,0x005D,0x003C

d_2806D4	section	romdata abs=0x2806D4
FxPal_2806D4:
	dw	0x0FFF,0x00FF,0x00BC,0x0089

d_2806DC	section	romdata abs=0x2806DC
FxPal_2806DC:
	dw	0x0FFF,0x07F9,0x04D0,0x0150

d_2806E4	section	romdata abs=0x2806E4
FxPal_2806E4:
	dw	0x0FFF,0x00FF,0x00AA,0x0033
	db	0xFF,0x0F,0xFF,0x00,0xAA,0x00,0x33,0x00,0xFF,0x0F,0xFF,0x00,0xAA,0x00,0x33,0x00	; no reader found
	db	0xFF,0x0F,0xFF,0x00,0xAA,0x00,0x33,0x00

d_280704	section	romdata abs=0x280704
FxPal_280704:
	dw	0x0FFF,0x0FFF,0x0B9F,0x000A
	db	0xFF,0x0F,0xFF,0x0F,0x9F,0x0B,0x0A,0x00,0xFF,0x0F,0xFF,0x0F,0x9F,0x0B,0x0A,0x00	; no reader found
	db	0xFF,0x0F,0xFF,0x0F,0x9F,0x0B,0x0A,0x00

d_280724	section	romdata abs=0x280724
FxPal_280724:
	dw	0x0FFF,0x05FB,0x02B2,0x0150
	db	0xFF,0x0F,0xFB,0x05,0xB2,0x02,0x50,0x01,0xFF,0x0F,0xDA,0x05,0xB9,0x04,0x73,0x03	; no reader found
	db	0xFF,0x0F,0xFB,0x05,0xB2,0x02,0x50,0x01

d_280744	section	romdata abs=0x280744
FxPal_280744:
	dw	0x0FFF,0x0FFF,0x0798,0x0021

d_28074C	section	romdata abs=0x28074C
FxPal_28074C:
	dw	0x0FFF,0x0FFF,0x078D,0x001B

d_280754	section	romdata abs=0x280754
FxPal_280754:
	dw	0x0FFF,0x0FFF,0x0CA8,0x0A61

d_28075C	section	romdata abs=0x28075C
FxPal_28075C:
	dw	0x0FFF,0x0FFF,0x07DE,0x00BC

d_280764	section	romdata abs=0x280764
FxPal_280764:
	dw	0x0FFF,0x00FF,0x0099,0x0046

d_28076C	section	romdata abs=0x28076C
FxPal_28076C:
	dw	0x0FFF,0x007F,0x003F,0x003A

d_280774	section	romdata abs=0x280774
FxPal_280774:
	dw	0x0FFF,0x0FC0,0x0E70,0x0E20

d_28077C	section	romdata abs=0x28077C
FxPal_28077C:
	dw	0x0FFF,0x00E2,0x0091,0x0030

d_280784	section	romdata abs=0x280784
FxPal_280784:
	dw	0x0FFF,0x0FF8,0x0FC0,0x0F60

d_28078C	section	romdata abs=0x28078C
FxPal_28078C:
	dw	0x0FFF,0x019F,0x005F,0x000C

d_280794	section	romdata abs=0x280794
FxPal_280794:
	dw	0x0FFF,0x0EEF,0x00CF,0x009A

d_28079C	section	romdata abs=0x28079C
FxPal_28079C:
	dw	0x0FFF,0x0EF7,0x00B1,0x0050

d_2807A4	section	romdata abs=0x2807A4
FxPal_2807A4:
	dw	0x0FFF,0x0CBB,0x0A99,0x0877

d_2807AC	section	romdata abs=0x2807AC
FxPal_2807AC:
	dw	0x0FFF,0x0765,0x0443,0x0221
	db	0xFF,0x0F,0x65,0x07,0x43,0x04,0x21,0x02,0xFF,0x0F,0x65,0x07,0x43,0x04,0x21,0x02	; no reader found

d_2807C4	section	romdata abs=0x2807C4
FxPal_2807C4:
	dw	0x0000,0x0F99,0x002F,0x0009
	db	0x00,0x0F,0xFF,0x0F,0x88,0x08,0x22,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00	; no reader found
	db	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

d_2807E4	section	romdata abs=0x2807E4
FxPal_2807E4:
	dw	0x0FFF,0x0FB6,0x0F70,0x0F30

d_2807EC	section	romdata abs=0x2807EC
FxPal_2807EC:
	dw	0x0FFF,0x0532,0x0321,0x0110

d_2807F4	section	romdata abs=0x2807F4
FxPal_2807F4:
	dw	0x0FFF,0x00ED,0x0098,0x0043
	db	0xFF,0x0F,0xED,0x00,0x98,0x00,0x43,0x00	; no reader found

d_280804	section	romdata abs=0x280804
FxPal_280804:
	dw	0x0FFF,0x0FFF,0x0BBA,0x0555
	db	0xFF,0x0F,0xFF,0x0F,0xBA,0x0B,0x55,0x05,0xFF,0x0F,0xFF,0x0F,0xBA,0x0B,0x55,0x05	; no reader found
	db	0xFF,0x0F,0xFF,0x0F,0xBA,0x0B,0x55,0x05

d_280824	section	romdata abs=0x280824
FxPal_280824:
	dw	0x0FFF,0x0FFF,0x0999,0x0333
	db	0xFF,0x0F,0xFF,0x0F,0x99,0x09,0x33,0x03,0xFF,0x0F,0xFF,0x0F,0x99,0x09,0x33,0x03	; no reader found
	db	0xFF,0x0F,0xFF,0x0F,0x99,0x09,0x33,0x03

d_280844	section	romdata abs=0x280844
FxPal_280844:
	dw	0x0FFF,0x0FFF,0x0EC3,0x0F91

d_28084C	section	romdata abs=0x28084C
FxPal_28084C:
	dw	0x0FFF,0x008F,0x005E,0x000C

d_280854	section	romdata abs=0x280854
FxPal_280854:
	dw	0x0FFF,0x00FF,0x00BC,0x0068

d_28085C	section	romdata abs=0x28085C
FxPal_28085C:
	dw	0x0FFF,0x07F9,0x04D0,0x0150

d_280864	section	romdata abs=0x280864
FxPal_280864:
	dw	0x0FFF,0x00EF,0x000F,0x015B

d_28086C	section	romdata abs=0x28086C
FxPal_28086C:
	dw	0x0FFF,0x0653,0x0322,0x0100
	db	0xFF,0x0F,0x53,0x06,0x22,0x03,0x00,0x01,0xFF,0x0F,0x53,0x06,0x22,0x03,0x00,0x01	; no reader found

d_280884	section	romdata abs=0x280884
FxPal_280884:
	dw	0x0FFF,0x08F0,0x04A0,0x0050

d_28088C	section	romdata abs=0x28088C
FxPal_28088C:
	dw	0x0FFF,0x098F,0x044C,0x000A

d_280894	section	romdata abs=0x280894
FxPal_280894:
	dw	0x0FFF,0x0FD0,0x0C90,0x0950

d_28089C	section	romdata abs=0x28089C
FxPal_28089C:
	dw	0x0FFF,0x00FF,0x00BB,0x0077

d_2808A4	section	romdata abs=0x2808A4
FxPal_2808A4:
	dw	0x0FFF,0x0CF9,0x05B0,0x0370
	db	0xFF,0x0F,0xFF,0x0F,0xFC,0x0B,0xF9,0x08,0xFF,0x0F,0xFF,0x0F,0xFC,0x0B,0xF9,0x08	; no reader found
	db	0xFF,0x0F,0xFF,0x0F,0xFC,0x0B,0xF9,0x08

d_2808C4	section	romdata abs=0x2808C4
FxPal_2808C4:
	dw	0x0FFF,0x01F0,0x0090,0x0160

d_2808CC	section	romdata abs=0x2808CC
FxPal_2808CC:
	dw	0x0FFF,0x003F,0x005D,0x0018

d_2808D4	section	romdata abs=0x2808D4
FxPal_2808D4:
	dw	0x0FFF,0x0FC0,0x0E90,0x0C60

d_2808DC	section	romdata abs=0x2808DC
FxPal_2808DC:
	dw	0x0FFF,0x00FF,0x00BB,0x0076

d_2808E4	section	romdata abs=0x2808E4
FxPal_2808E4:
	dw	0x0FFF,0x0EB0,0x0C70,0x0840

d_2808EC	section	romdata abs=0x2808EC
FxPal_2808EC:
	dw	0x0FFF,0x0444,0x0232,0x0011

d_2808F4	section	romdata abs=0x2808F4
FxPal_2808F4:
	dw	0x0FFF,0x0DDC,0x0A98,0x0765
	db	0xFF,0x0F,0xDC,0x0D,0x98,0x0A,0x65,0x07	; no reader found

d_280904	section	romdata abs=0x280904
FxPal_280904:
	dw	0x0FFF,0x0AE0,0x0590,0x0040
	db	0xFF,0x0F,0xE0,0x0A,0x90,0x05,0x40,0x00,0xFF,0x0F,0xE0,0x0A,0x90,0x05,0x40,0x00	; no reader found
	db	0xFF,0x0F,0xE0,0x0A,0x90,0x05,0x40,0x00

d_280924	section	romdata abs=0x280924
FxPal_280924:
	dw	0x0FFF,0x0FEE,0x0DB7,0x0B70
	db	0xFF,0x0F,0xEE,0x0F,0xCB,0x0F,0x98,0x0C,0xFF,0x0F,0xEE,0x0F,0xCB,0x0F,0x98,0x0C	; no reader found
	db	0xFF,0x0F,0xEE,0x0F,0xCB,0x0F,0x98,0x0C

d_280944	section	romdata abs=0x280944
FxPal_280944:
	dw	0x0DDD,0x0EA7,0x0D72,0x0A50
	db	0xFF,0x0F,0xCA,0x0E,0xA7,0x0E,0x72,0x0D,0xFF,0x0F,0xCA,0x0E,0xA7,0x0E,0x72,0x0D	; no reader found
	db	0xFF,0x0F,0xCA,0x0E,0xA7,0x0E,0x72,0x0D

d_280964	section	romdata abs=0x280964
FxPal_280964:
	dw	0x0FFF,0x00FF,0x00AB,0x0055
	db	0xFF,0x0F,0xFF,0x00,0xAB,0x00,0x55,0x00,0xFF,0x0F,0xFF,0x00,0xAB,0x00,0x55,0x00	; no reader found
	db	0xFF,0x0F,0xFF,0x00,0xAB,0x00,0x55,0x00

d_280984	section	romdata abs=0x280984
FxPal_280984:
	dw	0x0FFF,0x00EF,0x006F,0x000B
	db	0xFF,0x0F,0xEF,0x00,0x6F,0x00,0x0B,0x00,0xFF,0x0F,0xEF,0x00,0x6F,0x00,0x0B,0x00	; no reader found
	db	0xFF,0x0F,0xEF,0x00,0x6F,0x00,0x0B,0x00

d_2809A4	section	romdata abs=0x2809A4
FxPal_2809A4:
	dw	0x0FFF,0x00EF,0x000F,0x015B

d_2809AC	section	romdata abs=0x2809AC
FxPal_2809AC:
	dw	0x0FFF,0x0788,0x0243,0x0022
	db	0xFF,0x0F,0x88,0x07,0x43,0x02,0x22,0x00,0xFF,0x0F,0x88,0x07,0x43,0x02,0x22,0x00	; no reader found

d_2809C4	section	romdata abs=0x2809C4
FxPal_2809C4:
	dw	0x0540,0x0EEE,0x0FC9,0x0F84

d_2809CC	section	romdata abs=0x2809CC
FxPal_2809CC:
	dw	0x0FFF,0x005F,0x004D,0x003B

d_2809D4	section	romdata abs=0x2809D4
FxPal_2809D4:
	dw	0x0FFF,0x00FF,0x00CC,0x0089

d_2809DC	section	romdata abs=0x2809DC
FxPal_2809DC:
	dw	0x0FFF,0x07F9,0x04D0,0x0150

d_2809E4	section	romdata abs=0x2809E4
FxPal_2809E4:
	dw	0x0FFF,0x0FFF,0x0666,0x0322
	db	0xFF,0x0F,0xFF,0x0F,0x66,0x06,0x22,0x03,0xFF,0x0F,0xFF,0x0F,0x66,0x06,0x22,0x03	; no reader found
	db	0xFF,0x0F,0xFF,0x0F,0x66,0x06,0x22,0x03

d_280A04	section	romdata abs=0x280A04
FxPal_280A04:
	dw	0x0FFF,0x0FCF,0x0B79,0x0532
	db	0xFF,0x0F,0xCF,0x0F,0x79,0x0B,0x32,0x05,0xFF,0x0F,0xCF,0x0F,0x79,0x0B,0x32,0x05	; no reader found
	db	0xFF,0x0F,0xCF,0x0F,0x79,0x0B,0x32,0x05

d_280A24	section	romdata abs=0x280A24
FxPal_280A24:
	dw	0x0FFF,0x0FFE,0x0FA5,0x0D91
	db	0xFF,0x0F,0xFE,0x0F,0xA5,0x0F,0x91,0x0D,0xFF,0x0F,0xFE,0x0F,0xA5,0x0F,0x91,0x0D	; no reader found
	db	0xFF,0x0F,0xFE,0x0F,0xA5,0x0F,0x91,0x0D

d_280A44	section	romdata abs=0x280A44
FxPal_280A44:
	dw	0x0FFF,0x0FD8,0x0D84,0x0333
	db	0xFF,0x0F,0xD8,0x0F,0x84,0x0D,0x33,0x03,0xFF,0x0F,0xD8,0x0F,0x84,0x0D,0x33,0x03	; no reader found
	db	0xFF,0x0F,0xD8,0x0F,0x84,0x0D,0x33,0x03

d_280A64	section	romdata abs=0x280A64
FxPal_280A64:
	dw	0x0FFF,0x00F0,0x00A0,0x0050

d_280A6C	section	romdata abs=0x280A6C
FxPal_280A6C:
	dw	0x0FFF,0x004F,0x002C,0x0029

d_280A74	section	romdata abs=0x280A74
FxPal_280A74:
	dw	0x0FFF,0x0FD0,0x0EA0,0x0E70

d_280A7C	section	romdata abs=0x280A7C
FxPal_280A7C:
	dw	0x0FFF,0x00FF,0x00BB,0x0076

d_280A84	section	romdata abs=0x280A84
FxPal_280A84:
	dw	0x0FFF,0x0FFF,0x08D0,0x0590
	db	0xFF,0x0F,0xFF,0x0F,0xD0,0x08,0x90,0x05,0xFF,0x0F,0xFF,0x0F,0xD0,0x08,0x90,0x05	; no reader found
	db	0xFF,0x0F,0xFF,0x0F,0xD0,0x08,0x90,0x05

d_280AA4	section	romdata abs=0x280AA4
FxPal_280AA4:
	dw	0x0BBB,0x0FC6,0x0F70,0x0B10
	db	0xFF,0x0F,0xC6,0x0F,0x70,0x0F,0x10,0x0B,0xFF,0x0F,0xC6,0x0F,0x70,0x0F,0x10,0x0B	; no reader found
	db	0xFF,0x0F,0xC6,0x0F,0x70,0x0F,0x10,0x0B

d_280AC4	section	romdata abs=0x280AC4
FxPal_280AC4:
	dw	0x0FFF,0x00FF,0x00BB,0x0177

d_280ACC	section	romdata abs=0x280ACC
FxPal_280ACC:
	dw	0x0FFF,0x005E,0x002B,0x0008

d_280AD4	section	romdata abs=0x280AD4
FxPal_280AD4:
	dw	0x0FFF,0x0FD5,0x0FA2,0x0F50

d_280ADC	section	romdata abs=0x280ADC
FxPal_280ADC:
	dw	0x0FFF,0x00E0,0x00A0,0x0050

d_280AE4	section	romdata abs=0x280AE4
FxPal_280AE4:
	dw	0x0FFF,0x0FF8,0x0FB4,0x0E80
	db	0xFF,0x0F,0xF8,0x0F,0xB4,0x0F,0x80,0x0E,0xFF,0x0F,0xF8,0x0F,0xB4,0x0F,0x80,0x0E	; no reader found
	db	0xFF,0x0F,0xF8,0x0F,0xB4,0x0F,0x80,0x0E
FxMono_280B04:
	db	0x00,0x01,0x02,0x06	; no reader found
FxMono_280B08:
	db	0x00,0x00,0x03,0x06	; no reader found
FxMono_280B0C:
	db	0x00,0x01,0x03,0x05	; no reader found
FxMono_280B10:
	db	0x00,0x01,0x03,0x06	; no reader found
FxMono_280B14:
	db	0x00,0x02,0x03,0x06	; no reader found
FxMono_280B18:
	db	0x00,0x01,0x04,0x06	; no reader found
FxMono_280B1C:
	db	0x07,0x07,0x07,0x07	; no reader found
FxMono_280B20:
	db	0x00,0x02,0x04,0x06	; no reader found
FxMono_280B24:
	db	0x00,0x03,0x04,0x06	; no reader found
FxMono_280B28:
	db	0x00,0x00,0x01,0x03	; no reader found
FxMono_280B2C:
	db	0x00,0x00,0x02,0x03	; no reader found

d_280B30	section	romdata abs=0x280B30
FxScript_280B30:
	db	60	; total ticks
	; ticks, frame, dx, dy
	db	4,0,104,4
	db	4,0,72,4
	db	0,3,76,-4
	db	0,3,84,8
	db	0,3,68,8
	db	0,3,96,4
	db	0,3,72,16
	db	4,0,36,4
	db	0,4,52,4
	db	0,4,80,8
	db	0,4,36,8
	db	4,4,24,0
	db	4,5,0,0
	db	0,3,-8,-8
	db	0,3,-12,0
	db	0,3,-8,8
	db	0,3,0,16
	db	3,3,0,-16
	db	0,2,-28,0
	db	0,2,-24,-16
	db	0,2,-24,16
	db	0,2,-12,-28
	db	3,2,-12,28
	db	0,1,-36,24
	db	0,1,-20,-40
	db	0,1,-44,0
	db	0,1,-40,-24
	db	3,1,-16,36
	db	0,4,-36,24
	db	0,4,-44,0
	db	0,4,-40,-24
	db	0,4,-20,-40
	db	3,4,-16,36
	db	10,0xFF,-16,36
	db	4,8,-4,-24
	db	3,9,-36,4
	db	0,10,-52,8
	db	4,11,0,20
	db	3,12,-20,-8
	db	4,13,-36,-20

d_280BD1	section	romdata abs=0x280BD1
FxScript_280BD1:
	db	92	; total ticks
	; ticks, frame, dx, dy
	db	0,0,72,-8
	db	4,1,72,8
	db	0,0,64,-16
	db	4,1,64,16
	db	0,0,56,-16
	db	4,1,56,16
	db	0,0,48,-16
	db	4,1,48,16
	db	0,0,40,-8
	db	4,1,40,8
	db	4,1,32,0
	db	0,0,24,8
	db	4,1,24,-8
	db	0,0,16,16
	db	4,1,16,-16
	db	0,0,8,16
	db	4,1,8,-16
	db	0,0,0,16
	db	4,1,0,-16
	db	0,0,-8,8
	db	4,1,-8,-8
	db	4,0,-16,0
	db	8,0xFF,-16,0
	db	0,0,-32,-32
	db	4,1,-32,32
	db	0,0,-8,-24
	db	4,1,-56,24
	db	0,0,0,0
	db	4,1,-64,0
	db	0,0,8,24
	db	4,1,-56,-24
	db	0,0,-32,32
	db	4,1,-32,-32
	db	0,0,-56,24
	db	4,1,-8,-24
	db	0,0,-64,0
	db	4,1,0,0
	db	0,0,-56,-24
	db	4,1,-8,24
	db	0,0,-32,32
	db	4,1,-32,-32

d_280C76	section	romdata abs=0x280C76
FxScript_280C76:
	db	36	; total ticks
	; ticks, frame, dx, dy
	db	4,0,-32,0
	db	4,1,-32,0
	db	0,4,-52,0
	db	4,2,-36,0
	db	0,4,-52,0
	db	4,5,-32,0
	db	4,3,-28,0
	db	4,0,-32,0
	db	4,1,-32,0
	db	0,4,-48,0
	db	4,2,-32,0
	db	4,2,-32,0

d_280CA7	section	romdata abs=0x280CA7
FxScript_280CA7:
	db	80	; total ticks
	; ticks, frame, dx, dy
	db	0,0,32,-48
	db	4,1,32,56
	db	0,1,32,32
	db	4,0,32,-32
	db	0,1,32,16
	db	4,0,32,-16
	db	0,1,32,0
	db	4,0,32,0
	db	0,2,32,0
	db	0,1,32,-16
	db	4,0,32,16
	db	0,2,32,0
	db	0,1,32,-40
	db	4,0,32,40
	db	0,1,32,-48
	db	0,0,32,48
	db	4,2,32,0
	db	4,2,32,0
	db	4,9,32,0
	db	0,4,40,-8
	db	0,3,32,0
	db	4,5,32,0
	db	0,8,32,0
	db	0,7,24,0
	db	0,3,24,-8
	db	0,4,56,-24
	db	4,5,48,16
	db	0,8,32,-8
	db	0,7,8,0
	db	0,6,24,8
	db	0,3,8,-24
	db	0,4,72,-40
	db	4,5,64,32
	db	0,7,48,0
	db	0,8,32,8
	db	0,8,32,-32
	db	0,7,-24,0
	db	0,6,8,24
	db	0,4,40,-8
	db	0,3,-8,-40
	db	4,5,64,32
	db	0,8,32,32
	db	0,8,32,-48
	db	0,7,80,0
	db	0,7,24,0
	db	0,3,24,-8
	db	0,6,-8,40
	db	0,4,56,-24
	db	4,5,40,8
	db	0,8,32,0
	db	0,6,24,8
	db	0,8,32,48
	db	0,7,-8,0
	db	0,4,72,-40
	db	0,5,56,24
	db	4,3,8,-24
	db	0,8,32,16
	db	0,8,32,-24
	db	0,7,40,0
	db	0,5,72,40
	db	0,4,40,-8
	db	0,3,-8,-40
	db	4,6,8,24
	db	0,8,32,40
	db	0,8,32,-48
	db	0,7,16,0
	db	0,7,72,0
	db	0,4,56,-24
	db	0,3,24,-8
	db	4,6,-8,40
	db	0,8,32,8
	db	0,7,-8,0
	db	0,4,72,-40
	db	0,5,40,8
	db	0,3,8,-24
	db	4,6,24,8
	db	0,8,32,-8
	db	0,7,-32,0
	db	0,7,40,0
	db	0,5,56,24
	db	0,3,-8,-40
	db	4,6,8,24
	db	0,8,32,-32
	db	0,7,64,0
	db	0,5,80,48
	db	4,6,-8,40

d_280E00	section	romdata abs=0x280E00
FxScript_280E00:
	db	21	; total ticks
	; ticks, frame, dx, dy
	db	4,0,-32,20
	db	4,1,-32,20
	db	5,2,-32,20
	db	3,3,-32,20
	db	5,4,-32,20

d_280E15	section	romdata abs=0x280E15
FxScript_280E15:
	db	68	; total ticks
	; ticks, frame, dx, dy
	db	4,0,32,0
	db	0,0,32,-8
	db	4,0,24,8
	db	0,0,24,-16
	db	0,0,32,0
	db	4,0,16,16
	db	0,0,16,-24
	db	0,0,24,-8
	db	4,0,8,16
	db	0,0,8,-32
	db	0,0,16,-8
	db	4,0,0,16
	db	0,0,0,-32
	db	0,0,8,-8
	db	4,0,-8,8
	db	0,0,-8,-32
	db	0,0,0,0
	db	4,0,-16,0
	db	0,0,-16,-32
	db	0,0,-8,8
	db	4,0,-24,-8
	db	0,0,-24,-24
	db	0,0,-16,16
	db	4,0,-32,-8
	db	0,0,-32,-16
	db	0,0,-24,24
	db	4,0,-40,-8
	db	0,0,-40,-16
	db	0,0,-32,32
	db	4,0,-48,0
	db	0,0,-48,-16
	db	0,0,-40,32
	db	4,0,-56,8
	db	0,0,-56,-16
	db	0,0,-48,32
	db	4,0,-64,16
	db	0,0,-64,-24
	db	0,0,-56,24
	db	4,0,-72,16
	db	0,0,-72,-32
	db	0,0,-64,16
	db	4,0,-80,8
	db	0,0,-72,8
	db	4,0,-80,-24
	db	4,0,-80,0

d_280ECA	section	romdata abs=0x280ECA
FxScript_280ECA:
	db	15	; total ticks
	; ticks, frame, dx, dy
	db	3,0,-32,0
	db	3,1,-30,0
	db	6,2,-32,-4
	db	3,3,-34,0

d_280EDB	section	romdata abs=0x280EDB
FxScript_280EDB:
	db	15	; total ticks
	; ticks, frame, dx, dy
	db	3,2,32,12
	db	3,2,0,12
	db	3,2,-32,12
	db	3,2,-56,12
	db	3,2,-76,12

d_280EF0	section	romdata abs=0x280EF0
FxScript_280EF0:
	db	52	; total ticks
	; ticks, frame, dx, dy
	db	4,0,72,-8
	db	4,0,64,-16
	db	4,0,56,-16
	db	4,0,48,-16
	db	4,0,40,-8
	db	4,0,32,0
	db	4,0,24,8
	db	4,0,16,16
	db	4,0,8,16
	db	4,0,0,16
	db	4,0,-8,8
	db	4,0,-16,0
	db	4,0,-24,-8

d_280F25	section	romdata abs=0x280F25
FxScript_280F25:
	db	82	; total ticks
	; ticks, frame, dx, dy
	db	4,0,92,-36
	db	0,0,76,-36
	db	4,0,92,28
	db	0,8,72,8
	db	0,8,64,32
	db	0,8,64,-24
	db	0,8,48,-16
	db	0,0,44,-36
	db	0,0,92,-4
	db	4,0,60,28
	db	0,7,48,40
	db	0,8,56,16
	db	0,8,32,8
	db	0,8,56,-32
	db	0,8,8,-16
	db	0,0,-4,-36
	db	0,0,60,-4
	db	5,0,28,28
	db	0,9,-8,-16
	db	0,8,72,-8
	db	0,8,64,8
	db	0,7,56,-32
	db	0,8,32,16
	db	0,7,40,40
	db	0,8,56,32
	db	0,8,8,40
	db	0,8,72,-40
	db	0,8,8,-40
	db	0,8,32,-32
	db	0,8,72,16
	db	0,8,-56,-16
	db	0,8,-32,16
	db	0,8,24,-20
	db	0,0,-20,-36
	db	0,0,76,-20
	db	0,0,28,-4
	db	0,0,-4,28
	db	5,0,84,36
	db	0,7,68,44
	db	0,8,76,28
	db	0,8,52,4
	db	0,7,60,20
	db	0,8,68,4
	db	0,7,60,-12
	db	0,7,68,-36
	db	0,8,44,-36
	db	0,8,36,-4
	db	0,8,28,12
	db	0,8,32,-32
	db	0,7,20,44
	db	0,8,20,-44
	db	0,8,12,28
	db	0,7,12,12
	db	0,8,-68,-20
	db	0,7,-68,12
	db	0,8,-60,-4
	db	0,8,-44,12
	db	0,7,-44,44
	db	0,8,-32,-16
	db	0,8,-56,8
	db	0,8,-20,-36
	db	0,7,-20,-16
	db	0,4,-32,0
	db	0,7,0,-32
	db	0,8,-4,12
	db	0,8,-4,36
	db	0,8,12,-20
	db	0,1,-52,-36
	db	0,1,44,-20
	db	0,1,-4,-4
	db	0,1,-36,28
	db	5,1,36,36
	db	0,8,-28,32
	db	0,7,72,-16
	db	0,7,56,-4
	db	0,8,72,20
	db	0,7,52,-20
	db	0,9,44,12
	db	0,8,-68,-24
	db	0,7,-32,-20
	db	0,9,-8,-32
	db	0,5,-40,32
	db	0,8,-24,24
	db	0,8,-24,48
	db	0,8,64,-32
	db	0,8,64,40
	db	0,8,-40,-40
	db	0,8,32,-40
	db	0,8,24,0
	db	0,8,4,16
	db	0,6,56,16
	db	0,7,0,48
	db	0,8,24,32
	db	0,8,48,24
	db	0,8,-44,8
	db	0,4,-72,0
	db	0,8,-56,40
	db	0,8,-4,32
	db	0,1,-84,-36
	db	0,1,12,-20
	db	0,1,-36,-4
	db	0,1,-68,28
	db	5,1,20,36
	db	0,8,-32,-40
	db	0,8,-72,8
	db	0,8,-64,40
	db	0,8,24,-40
	db	0,8,-16,-32
	db	0,8,56,-24
	db	0,8,64,32
	db	0,8,24,40
	db	0,8,-16,24
	db	0,7,0,-8
	db	0,8,-32,0
	db	0,8,32,-20
	db	0,9,40,28
	db	0,4,72,0
	db	0,7,-56,-36
	db	0,7,-56,28
	db	0,9,4,16
	db	0,8,8,-32
	db	0,8,48,-40
	db	0,8,48,8
	db	0,7,72,-40
	db	0,2,-68,-4
	db	0,2,-20,-20
	db	5,2,-12,36
	db	0,8,-60,-32
	db	0,8,20,0
	db	0,8,-48,-4
	db	0,8,-8,16
	db	0,7,52,-28
	db	0,7,-28,-28
	db	0,7,44,4
	db	0,8,-24,24
	db	0,7,12,-16
	db	0,7,-68,12
	db	0,7,56,40
	db	0,8,48,24
	db	0,2,-52,-20
	db	5,2,-44,36
	db	0,9,56,-40
	db	0,8,48,0
	db	0,8,-8,-40
	db	0,8,-16,40
	db	0,8,-12,-24
	db	0,8,-72,-4
	db	0,7,-44,-20
	db	0,8,40,24
	db	0,8,-56,40
	db	0,7,72,-16
	db	0,7,56,40
	db	0,8,8,16
	db	0,8,20,-16
	db	0,8,-44,8
	db	0,8,8,-32
	db	0,8,-56,-40
	db	0,8,-28,0
	db	0,2,-76,36
	db	5,2,-84,-20
	db	0,8,56,40
	db	0,8,40,12
	db	0,7,48,-16
	db	0,8,-52,24
	db	0,8,-48,-32
	db	0,7,-64,0
	db	0,8,8,32
	db	0,8,-40,8
	db	0,7,-16,40
	db	0,8,24,-40
	db	0,8,24,-4
	db	0,8,72,0
	db	0,8,-4,-20
	db	0,2,-92,36
	db	5,8,64,-40
	db	0,8,16,40
	db	0,8,-64,16
	db	0,8,48,0
	db	0,8,-24,-24
	db	0,8,0,-40
	db	0,7,72,-16
	db	0,7,-20,20
	db	0,8,-32,0
	db	0,8,64,-40
	db	0,8,-48,40
	db	0,8,8,8
	db	0,7,-64,-32
	db	5,7,56,40
	db	0,8,-72,-24
	db	0,8,-24,40
	db	0,8,-64,32
	db	0,8,64,-32
	db	0,8,8,-32
	db	0,8,-8,20
	db	0,8,24,-12
	db	0,8,-56,0
	db	0,8,40,32
	db	5,8,64,24
	db	0,8,20,-12
	db	0,8,-56,-16
	db	0,8,-48,32
	db	0,8,0,-40
	db	0,8,64,16
	db	5,8,16,32
	db	0,8,8,8
	db	0,8,-40,40
	db	0,8,48,-32
	db	0,8,-72,0
	db	5,8,56,8
	db	0,8,-40,-40
	db	0,8,-56,0
	db	0,8,32,-16
	db	5,8,48,32
	db	0,8,-40,0
	db	5,8,16,-32

d_281282	section	romdata abs=0x281282
FxScript_281282:
	db	20	; total ticks
	; ticks, frame, dx, dy
	db	4,0,0,0
	db	4,1,-8,0
	db	4,2,-16,0
	db	4,3,-48,0
	db	4,4,-56,0

d_281297	section	romdata abs=0x281297
FxScript_281297:
	db	72	; total ticks
	; ticks, frame, dx, dy
	db	0,11,-32,-44
	db	0,0,0,-40
	db	3,0,-64,-40
	db	0,12,-32,-36
	db	0,1,-64,-24
	db	3,1,0,-24
	db	0,13,-32,-20
	db	0,3,-64,0
	db	3,3,0,0
	db	0,14,-32,0
	db	0,3,-64,0
	db	5,3,0,0
	db	0,15,-32,0
	db	0,4,-64,0
	db	4,4,0,0
	db	0,16,-32,0
	db	0,5,0,0
	db	3,5,-64,0
	db	0,17,-32,0
	db	0,6,-64,0
	db	3,6,0,0
	db	0,18,-64,0
	db	0,7,-32,0
	db	5,18,-4,0
	db	0,8,-56,0
	db	0,8,8,0
	db	5,19,-44,0
	db	0,9,-8,0
	db	0,14,-16,0
	db	5,14,-68,0
	db	0,15,8,0
	db	0,15,-48,0
	db	5,10,-40,0
	db	0,16,-40,0
	db	0,7,-64,0
	db	5,7,8,0
	db	0,8,-68,0
	db	0,8,-4,0
	db	5,17,-28,0
	db	0,9,-20,0
	db	0,14,-12,0
	db	5,14,-68,0
	db	0,15,-68,0
	db	0,15,0,0
	db	5,10,-32,0
	db	0,16,-68,0
	db	0,16,4,0
	db	4,4,-32,0
	db	0,17,4,0
	db	0,17,-68,0
	db	4,5,-32,0

d_281364	section	romdata abs=0x281364
FxScript_281364:
	db	18	; total ticks
	; ticks, frame, dx, dy
	db	3,2,72,8
	db	3,2,56,8
	db	3,2,40,8
	db	3,2,24,8
	db	3,2,8,8
	db	3,2,-24,8

d_28137D	section	romdata abs=0x28137D
FxScript_28137D:
	db	19	; total ticks
	; ticks, frame, dx, dy
	db	3,1,80,0
	db	3,2,40,0
	db	3,1,16,0
	db	3,2,0,0
	db	3,1,-8,0
	db	4,0,-16,0

d_281396	section	romdata abs=0x281396
FxScript_281396:
	db	56	; total ticks
	; ticks, frame, dx, dy
	db	4,0,72,8
	db	0,0,72,0
	db	4,0,64,0
	db	0,0,72,-16
	db	0,0,64,8
	db	4,0,56,-8
	db	0,0,64,-24
	db	0,0,56,16
	db	4,0,48,-16
	db	0,0,56,-32
	db	0,0,48,24
	db	4,0,40,-16
	db	0,0,48,-40
	db	0,0,40,32
	db	4,0,32,-16
	db	0,0,40,-40
	db	0,0,32,32
	db	4,0,24,-8
	db	0,0,32,-40
	db	0,0,24,32
	db	4,0,16,0
	db	0,0,24,-40
	db	0,0,16,32
	db	4,0,8,8
	db	0,0,16,-32
	db	0,0,8,32
	db	4,0,0,16
	db	0,0,8,-24
	db	0,0,0,32
	db	4,0,-8,16
	db	0,0,0,-16
	db	0,0,-8,32
	db	4,0,-16,16
	db	0,0,-8,-8
	db	0,0,-16,32
	db	4,0,-24,8
	db	0,0,-16,-8
	db	0,0,-24,24
	db	4,0,-32,0

d_281433	section	romdata abs=0x281433
FxScript_281433:
	db	26	; total ticks
	; ticks, frame, dx, dy
	db	0,0,28,0
	db	3,2,16,0
	db	0,3,-16,0
	db	0,1,-4,0
	db	0,1,20,0
	db	0,1,12,0
	db	0,1,4,0
	db	3,0,28,0
	db	0,6,-40,0
	db	0,5,-28,0
	db	0,5,-20,0
	db	0,5,12,0
	db	0,5,4,0
	db	0,5,-4,0
	db	0,5,-12,0
	db	3,4,24,0
	db	0,7,-72,0
	db	0,5,-60,0
	db	0,5,-52,0
	db	0,5,-44,0
	db	0,5,-36,0
	db	0,5,-28,0
	db	0,5,-20,0
	db	0,5,-12,0
	db	0,5,-4,0
	db	0,5,4,0
	db	0,5,12,0
	db	3,4,24,0
	db	0,9,-72,0
	db	0,9,-56,0
	db	0,9,-40,0
	db	0,9,-24,0
	db	0,9,-8,0
	db	0,9,8,0
	db	5,8,24,0
	db	0,5,-76,0
	db	0,5,-68,0
	db	0,5,-60,0
	db	0,5,-52,0
	db	0,5,-44,0
	db	0,5,-36,0
	db	0,5,-28,0
	db	0,5,-20,0
	db	0,5,-12,0
	db	0,5,12,0
	db	0,5,4,0
	db	0,5,-4,0
	db	5,4,24,0
	db	0,15,-60,0
	db	0,1,-76,0
	db	0,1,-68,0
	db	0,1,-60,0
	db	0,1,-52,0
	db	0,1,-44,0
	db	0,1,20,0
	db	0,1,12,0
	db	0,1,4,0
	db	0,1,-4,0
	db	0,1,-12,0
	db	0,1,-20,0
	db	0,1,-28,0
	db	0,1,-36,0
	db	4,0,28,0

d_281530	section	romdata abs=0x281530
FxScript_281530:
	db	24	; total ticks
	; ticks, frame, dx, dy
	db	3,0xFF,24,16
	db	3,0,8,8
	db	0,2,-8,8
	db	3,1,8,8
	db	0,2,-32,8
	db	3,0,8,8
	db	0,2,-8,8
	db	0,2,-64,8
	db	3,1,8,8
	db	0,2,-40,8
	db	3,1,8,8
	db	0,2,-64,8
	db	3,0,8,8
	db	0,2,-80,8
	db	3,0,8,8

d_28156D	section	romdata abs=0x28156D
FxScript_28156D:
	db	8	; total ticks
	; ticks, frame, dx, dy
	db	2,0,-32,0
	db	4,1,-32,4
	db	2,2,-28,3

d_28157A	section	romdata abs=0x28157A
FxScript_28157A:
	db	54	; total ticks
	; ticks, frame, dx, dy
	db	0,0,-35,19
	db	0,1,-35,39
	db	9,2,-30,29
	db	0,0,-35,19
	db	0,0,-31,15
	db	0,1,-35,39
	db	0,1,-31,43
	db	0,2,-30,29
	db	9,2,-26,29
	db	0,0,-35,19
	db	0,0,-31,15
	db	0,0,-27,11
	db	0,1,-35,39
	db	0,1,-31,43
	db	0,1,-27,47
	db	0,2,-30,29
	db	0,2,-22,29
	db	9,2,-26,29
	db	0,0,-27,11
	db	0,0,-31,15
	db	0,1,-27,47
	db	0,1,-31,43
	db	0,2,-26,29
	db	9,2,-22,29
	db	0,0,-27,11
	db	0,1,-27,47
	db	9,2,-22,29
	db	9,0xFF,-22,29

d_2815EB	section	romdata abs=0x2815EB
FxScript_2815EB:
	db	24	; total ticks
	; ticks, frame, dx, dy
	db	3,0,-24,0
	db	3,1,-24,0
	db	0,0,-56,24
	db	3,2,-24,-4
	db	0,1,-56,24
	db	3,3,-24,0
	db	0,0,-52,-24
	db	3,3,-60,24
	db	3,1,-48,-24
	db	3,2,-48,-24
	db	3,3,-48,-24

d_281618	section	romdata abs=0x281618
FxScript_281618:
	db	25	; total ticks
	; ticks, frame, dx, dy
	db	6,0,32,0
	db	3,0,40,0
	db	4,0,16,0
	db	3,0,-8,0
	db	3,0,-40,0
	db	3,0,-56,0
	db	3,0,-80,0

d_281635	section	romdata abs=0x281635
FxScript_281635:
	db	11	; total ticks
	; ticks, frame, dx, dy
	db	4,0,0,-16
	db	4,1,-32,0
	db	3,2,-48,0

d_281642	section	romdata abs=0x281642
FxScript_281642:
	db	34	; total ticks
	; ticks, frame, dx, dy
	db	3,5,4,-32
	db	0,5,4,-32
	db	5,5,12,0
	db	0,2,-12,-32
	db	0,1,-4,-32
	db	0,0,4,-32
	db	0,5,12,0
	db	4,5,20,32
	db	0,2,-36,-32
	db	0,6,-4,-32
	db	0,6,-24,-32
	db	0,6,-12,-32
	db	0,0,4,-32
	db	0,2,-4,0
	db	0,1,4,0
	db	0,0,12,0
	db	4,5,20,32
	db	0,2,-68,-32
	db	0,6,-56,-32
	db	0,6,-40,-32
	db	0,6,-24,-32
	db	0,6,-8,-32
	db	0,0,4,-32
	db	0,2,-44,0
	db	0,6,-32,0
	db	0,6,-16,0
	db	0,6,0,0
	db	0,0,12,0
	db	0,2,4,32
	db	0,1,12,32
	db	3,0,20,32
	db	0,6,-72,-32
	db	0,6,-56,-32
	db	0,6,-40,-32
	db	0,6,-24,-32
	db	0,6,-8,-32
	db	0,0,4,-32
	db	0,2,-68,0
	db	0,6,-56,0
	db	0,6,-40,0
	db	0,6,-24,0
	db	0,6,-8,0
	db	0,1,4,0
	db	0,0,12,0
	db	0,2,-36,32
	db	0,6,-24,32
	db	0,6,-8,32
	db	0,6,8,32
	db	3,0,20,32
	db	0,6,-72,-32
	db	0,6,-56,-32
	db	0,0,-44,-32
	db	0,6,-72,0
	db	0,6,-56,0
	db	0,6,-40,0
	db	0,6,-24,0
	db	0,6,-8,0
	db	0,0,4,0
	db	0,2,-52,32
	db	0,6,-40,32
	db	0,6,-24,32
	db	0,6,-8,32
	db	0,6,8,32
	db	3,0,20,32
	db	0,1,-76,-32
	db	0,0,-68,-32
	db	0,6,-72,0
	db	0,6,-56,0
	db	0,6,-40,0
	db	0,0,-28,0
	db	0,6,-72,32
	db	0,6,-56,32
	db	0,6,-40,32
	db	0,6,-24,32
	db	0,6,-8,32
	db	0,6,8,32
	db	3,0,20,32
	db	0,6,-72,0
	db	0,0,-60,0
	db	0,6,-72,32
	db	0,6,-56,32
	db	0,6,-40,32
	db	3,0,-28,32
	db	0,6,-72,32
	db	3,0,-60,32

d_281797	section	romdata abs=0x281797
FxScript_281797:
	db	28	; total ticks
	; ticks, frame, dx, dy
	db	4,0,72,-48
	db	4,0,56,-48
	db	4,0,44,-44
	db	4,0,28,-36
	db	4,0,12,-24
	db	4,0,0,-16
	db	4,0,-16,0

d_2817B4	section	romdata abs=0x2817B4
FxScript_2817B4:
	db	21	; total ticks
	; ticks, frame, dx, dy
	db	3,0xFF,0,0
	db	0,2,8,8
	db	3,0,20,8
	db	0,2,-24,8
	db	3,1,16,8
	db	0,3,0,8
	db	0,2,-56,8
	db	3,0,16,8
	db	0,3,-24,8
	db	0,2,-68,8
	db	3,1,16,8
	db	0,3,-52,8
	db	3,0,16,8
	db	0,3,-76,8
	db	3,0,16,8

d_2817F1	section	romdata abs=0x2817F1
FxScript_2817F1:
	db	55	; total ticks
	; ticks, frame, dx, dy
	db	0,2,-12,16
	db	0,1,-32,32
	db	5,4,-76,36
	db	0,0,-76,20
	db	0,3,-56,16
	db	0,1,-32,24
	db	0,4,-12,-4
	db	5,1,12,32
	db	0,2,-76,12
	db	0,4,-56,-8
	db	0,0,-32,12
	db	0,2,-12,-20
	db	5,1,12,16
	db	0,0,-76,0
	db	0,3,-56,-32
	db	0,1,-32,-12
	db	0,3,-12,-40
	db	5,2,12,4
	db	0,0,-76,-12
	db	0,4,-44,36
	db	0,1,-32,-32
	db	0,4,-8,28
	db	5,3,12,-8
	db	0,3,-24,36
	db	0,2,-56,28
	db	0,4,-76,-24
	db	0,0,-44,16
	db	0,2,-32,-36
	db	0,1,-8,0
	db	5,0,12,-20
	db	0,1,-4,36
	db	0,4,-56,16
	db	0,1,-24,0
	db	0,3,-76,-32
	db	0,4,-44,-12
	db	0,1,-8,-24
	db	5,2,12,-32
	db	0,3,-4,20
	db	0,4,-56,-4
	db	5,2,-24,-32
	db	0,2,-4,12
	db	5,4,-56,-20
	db	5,3,-4,-8
	db	5,1,-4,-28

d_2818A2	section	romdata abs=0x2818A2
FxScript_2818A2:
	db	23	; total ticks
	; ticks, frame, dx, dy
	db	4,0,-4,-26
	db	5,1,-40,0
	db	4,2,-44,-3
	db	5,3,-8,0
	db	1,4,4,13
	db	4,4,4,13

d_2818BB	section	romdata abs=0x2818BB
FxScript_2818BB:
	db	43	; total ticks
	; ticks, frame, dx, dy
	db	0,0,-48,-16
	db	0,1,-16,-16
	db	0,2,-16,16
	db	1,3,-48,16
	db	0,0,-48,-16
	db	0,1,-16,-16
	db	0,2,-16,16
	db	0,3,-48,16
	db	0,4,-60,-28
	db	0,5,-4,-28
	db	0,6,-4,28
	db	2,7,-60,28
	db	0,0,-56,-24
	db	0,1,-8,-24
	db	0,2,-8,24
	db	0,3,-56,24
	db	0,4,-68,-36
	db	0,5,4,-36
	db	0,6,4,36
	db	2,7,-68,36
	db	0,0,-48,-16
	db	0,1,-16,-16
	db	0,2,-16,16
	db	0,3,-48,16
	db	0,4,-60,-28
	db	0,5,-4,-28
	db	0,6,-4,28
	db	2,7,-60,28
	db	0,4,-52,-20
	db	0,5,-12,-20
	db	0,6,-12,20
	db	2,7,-52,20
	db	0,0,-48,-16
	db	0,1,-16,-16
	db	0,2,-16,16
	db	0,3,-48,16
	db	0,4,-60,-28
	db	0,5,-4,-28
	db	0,6,-4,28
	db	3,7,-60,28
	db	0,0,-56,-24
	db	0,1,-8,-24
	db	0,2,-8,24
	db	0,3,-56,24
	db	0,4,-68,-36
	db	0,5,4,-36
	db	0,6,4,36
	db	2,7,-68,36
	db	0,0,-48,-16
	db	0,1,-16,-16
	db	0,2,-16,16
	db	0,3,-48,16
	db	0,4,-60,-28
	db	0,5,-4,-28
	db	0,6,-4,28
	db	2,7,-60,28
	db	0,4,-52,-20
	db	0,5,-12,-20
	db	0,6,-12,20
	db	2,7,-52,20
	db	0,0,-48,-16
	db	0,1,-16,-16
	db	0,2,-16,16
	db	0,3,-48,16
	db	0,4,-60,-28
	db	0,5,-4,-28
	db	0,6,-4,28
	db	2,7,-60,28
	db	0,0,-56,-24
	db	0,1,-8,-24
	db	0,2,-8,24
	db	0,3,-56,24
	db	0,4,-68,-36
	db	0,5,4,-36
	db	0,6,4,36
	db	2,7,-68,36
	db	0,4,-60,-28
	db	0,5,-4,-28
	db	0,6,-4,28
	db	2,7,-60,28
	db	0,3,-48,16
	db	0,2,-16,16
	db	0,1,-16,-16
	db	2,0,-48,-16
	db	4,0xFF,0,24
	db	0,8,-64,-8
	db	0,9,0,8
	db	0,10,-24,-32
	db	2,11,-40,32
	db	0,8,-64,0
	db	0,9,0,0
	db	0,10,-32,-32
	db	1,11,-32,32
	db	0,8,-64,8
	db	0,9,0,-8
	db	0,10,-40,-32
	db	1,11,-24,32
	db	0,8,-64,0
	db	0,9,0,0
	db	0,10,-32,-32
	db	1,11,-32,32
	db	0,8,-64,-8
	db	0,9,0,8
	db	0,10,-24,-32
	db	1,11,-40,32
	db	0,8,-64,0
	db	0,9,0,0
	db	0,10,-32,-32
	db	1,11,-32,32
	db	0,8,-64,8
	db	0,9,0,-8
	db	0,10,-40,-32
	db	1,11,-24,32
	db	0,8,-64,0
	db	0,9,0,0
	db	0,10,-32,-32
	db	1,11,-32,32
	db	0,8,-64,-8
	db	0,9,0,8
	db	0,10,-24,-32
	db	1,11,-40,32
	db	0,8,-64,0
	db	0,9,0,0
	db	0,10,-32,-32
	db	1,11,-32,32
	db	0,8,-64,8
	db	0,9,0,-8
	db	0,10,-40,-32
	db	1,11,-24,32
	db	0,8,-64,0
	db	0,9,0,0
	db	0,10,-32,-32
	db	1,11,-32,32

d_281AD0	section	romdata abs=0x281AD0
FxScript_281AD0:
	db	129	; total ticks
	; ticks, frame, dx, dy
	db	0,12,-32,40
	db	0,4,0,40
	db	4,4,-64,40
	db	0,13,-32,32
	db	0,5,0,32
	db	4,5,-64,32
	db	0,14,-32,24
	db	0,6,0,24
	db	3,6,-64,24
	db	0,15,-32,16
	db	0,7,0,16
	db	4,7,-64,16
	db	0,8,-32,0
	db	0,0,0,0
	db	4,0,-64,0
	db	0,9,-32,0
	db	0,1,0,0
	db	5,1,-64,0
	db	0,10,-32,0
	db	0,2,0,0
	db	4,2,-64,0
	db	0,11,-32,0
	db	0,3,0,0
	db	5,3,-64,0
	db	0,8,-32,0
	db	0,0,-64,0
	db	5,0,0,0
	db	0,9,-32,0
	db	0,1,0,0
	db	5,1,-64,0
	db	0,10,-32,0
	db	0,2,-64,0
	db	5,2,0,0
	db	0,11,-32,0
	db	0,3,-64,0
	db	5,3,0,0
	db	0,1,-48,0
	db	0,1,8,0
	db	5,10,-40,0
	db	0,2,-8,0
	db	0,11,-16,0
	db	5,11,-64,0
	db	0,8,8,0
	db	0,8,-56,0
	db	5,3,-44,0
	db	0,9,-40,0
	db	0,0,-64,0
	db	4,0,8,0
	db	0,1,-68,0
	db	0,1,-4,0
	db	4,10,-28,0
	db	0,2,-16,0
	db	0,11,-12,0
	db	4,11,-72,0
	db	0,8,-64,0
	db	0,8,0,0
	db	4,3,-32,0
	db	0,8,-64,0
	db	0,8,0,0
	db	4,0,-32,0
	db	0,9,-64,0
	db	0,9,0,0
	db	4,1,-32,0
	db	0,10,-64,0
	db	0,10,0,0
	db	4,2,-32,0
	db	0,11,-64,0
	db	0,11,0,0
	db	4,3,-32,0
	db	0,8,-64,0
	db	0,8,0,0
	db	4,0,-32,0
	db	0,9,-64,0
	db	0,9,0,0
	db	4,1,-32,0
	db	0,10,-64,0
	db	0,10,0,0
	db	4,2,-32,0
	db	0,11,-64,0
	db	0,11,0,0
	db	4,3,-32,0
	db	0,15,-64,0
	db	0,15,0,0
	db	4,7,-32,0
	db	0,14,-64,0
	db	0,14,0,0
	db	3,6,-32,0
	db	0,13,-64,0
	db	0,13,0,0
	db	3,5,-32,0
	db	0,12,-64,0
	db	0,12,-32,0
	db	3,4,-32,0

d_281C45	section	romdata abs=0x281C45
FxScript_281C45:
	db	24	; total ticks
	; ticks, frame, dx, dy
	db	3,0,-8,-24
	db	3,1,-16,-16
	db	0,4,0,32
	db	3,2,-24,-8
	db	0,5,-16,16
	db	3,3,-40,8
	db	0,6,-24,8
	db	3,1,-56,24
	db	0,7,-40,-8
	db	3,0,-64,32
	db	3,5,-56,-24
	db	3,4,-64,-32

d_281C76	section	romdata abs=0x281C76
FxScript_281C76:
	db	67	; total ticks
	; ticks, frame, dx, dy
	db	5,0,-32,0
	db	0,6,-44,4
	db	4,1,-32,0
	db	4,1,-32,0
	db	5,2,-32,0
	db	0,5,-20,4
	db	4,3,-32,0
	db	4,3,-32,0
	db	5,4,-32,0
	db	6,0xFF,-32,0
	db	5,0,-32,0
	db	0,6,-44,4
	db	4,1,-32,0
	db	4,1,-32,0
	db	5,2,-32,0
	db	0,5,-20,4
	db	4,3,-32,0
	db	4,3,-32,0
	db	4,4,-32,0

d_281CC3	section	romdata abs=0x281CC3
FxScript_281CC3:
	db	40	; total ticks
	; ticks, frame, dx, dy
	db	0,5,72,24
	db	0,6,8,40
	db	0,7,24,32
	db	4,9,56,32
	db	0,6,40,40
	db	0,7,56,32
	db	0,8,16,40
	db	0,9,72,24
	db	0,1,56,8
	db	4,2,64,16
	db	0,2,8,8
	db	0,0,24,8
	db	0,5,-8,0
	db	0,6,8,-8
	db	0,1,48,8
	db	0,0,40,8
	db	0,1,64,8
	db	0,7,80,16
	db	0,3,32,8
	db	0,8,48,40
	db	0,6,64,32
	db	4,9,16,40
	db	0,6,16,-16
	db	0,0,0,8
	db	0,8,0,-8
	db	0,0,32,8
	db	0,1,56,8
	db	0,1,40,8
	db	0,2,-8,0
	db	0,3,16,8
	db	0,6,16,40
	db	0,9,40,40
	db	0,4,72,8
	db	0,8,64,32
	db	4,6,72,24
	db	0,9,0,-8
	db	0,8,16,-24
	db	0,6,40,-24
	db	0,3,8,8
	db	0,1,48,8
	db	0,1,32,8
	db	0,0,24,8
	db	0,0,-8,8
	db	0,8,72,16
	db	0,7,16,40
	db	0,6,40,40
	db	0,9,64,32
	db	4,3,64,8
	db	0,3,0,8
	db	0,3,56,8
	db	0,0,-8,0
	db	0,1,40,-40
	db	0,1,24,8
	db	0,0,8,8
	db	0,1,40,8
	db	0,7,40,32
	db	0,6,56,32
	db	0,9,72,24
	db	0,2,64,-40
	db	0,6,64,-32
	db	0,9,16,-16
	db	0,8,40,-24
	db	0,5,72,8
	db	4,0,48,-40
	db	0,7,64,24
	db	0,6,72,16
	db	0,9,24,-16
	db	0,4,64,-40
	db	0,8,56,-32
	db	0,1,48,-40
	db	0,0,56,8
	db	0,0,32,-40
	db	0,0,24,-40
	db	0,1,16,-40
	db	0,1,32,8
	db	0,1,16,8
	db	0,0,0,8
	db	0,3,-8,0
	db	0,3,40,8
	db	4,5,-8,-8
	db	0,3,0,8
	db	0,0,-8,0
	db	0,1,40,-40
	db	0,0,8,8
	db	0,2,64,-40
	db	0,6,64,-32
	db	0,9,16,-16
	db	0,8,40,-24
	db	4,0,48,-40
	db	0,4,64,-40
	db	0,8,56,-32
	db	0,1,48,-40
	db	0,0,32,-40
	db	0,0,24,-40
	db	4,1,16,-40
	db	0,1,16,-40
	db	4,1,32,-39

d_281E48	section	romdata abs=0x281E48
FxScript_281E48:
	db	48	; total ticks
	; ticks, frame, dx, dy
	db	3,0,-32,0
	db	3,1,-32,0
	db	3,2,-32,0
	db	3,3,-32,0
	db	3,4,-32,0
	db	3,5,-32,0
	db	3,6,-32,0
	db	3,7,-32,0
	db	3,0,-32,0
	db	3,1,-32,0
	db	3,2,-32,0
	db	3,3,-32,0
	db	3,4,-32,0
	db	3,5,-32,0
	db	3,6,-32,0
	db	3,7,-32,0

d_281E89	section	romdata abs=0x281E89
FxScript_281E89:
	db	90	; total ticks
	; ticks, frame, dx, dy
	db	6,0,26,0
	db	4,1,26,0
	db	4,2,26,0
	db	3,3,26,0
	db	4,2,26,0
	db	4,1,26,0
	db	5,0,26,0
	db	3,1,26,0
	db	3,2,26,0
	db	2,3,26,0
	db	3,2,26,0
	db	2,1,26,0
	db	4,0,26,0
	db	2,1,26,0
	db	2,2,26,0
	db	1,3,26,0
	db	2,2,26,0
	db	2,1,26,0
	db	2,0,26,0
	db	2,1,26,0
	db	2,2,26,0
	db	1,3,26,0
	db	2,2,26,0
	db	2,1,26,0
	db	2,0,26,0
	db	2,1,26,0
	db	2,2,26,0
	db	2,3,26,0
	db	3,3,34,0
	db	3,3,32,0
	db	3,3,-32,0
	db	3,2,-48,0
	db	3,1,-64,0

d_281F0E	section	romdata abs=0x281F0E
FxScript_281F0E:
	db	128	; total ticks
	; ticks, frame, dx, dy
	db	4,0,-32,0
	db	4,1,-32,0
	db	4,0,-40,0
	db	4,1,-40,0
	db	4,0,-48,0
	db	4,1,-48,0
	db	4,0,-56,0
	db	4,1,-56,0
	db	4,0,-56,0
	db	4,1,-56,0
	db	4,0,-56,0
	db	4,1,-56,0
	db	4,0,-48,0
	db	4,1,-48,0
	db	4,0,-40,0
	db	4,1,-40,0
	db	4,0,-32,0
	db	4,1,-32,0
	db	4,0,-24,0
	db	4,1,-24,0
	db	4,0,-16,0
	db	4,1,-16,0
	db	4,0,-8,0
	db	4,1,-8,0
	db	4,0,-8,0
	db	4,1,-8,0
	db	4,0,-8,0
	db	4,1,-8,0
	db	4,0,-16,0
	db	4,1,-16,0
	db	4,0,-24,0
	db	4,1,-24,0

d_281F8F	section	romdata abs=0x281F8F
FxScript_281F8F:
	db	15	; total ticks
	; ticks, frame, dx, dy
	db	2,0,-24,-24
	db	4,1,-40,0
	db	2,2,-48,0
	db	4,3,-28,0
	db	3,4,-28,0

d_281FA4	section	romdata abs=0x281FA4
FxScript_281FA4:
	db	56	; total ticks
	; ticks, frame, dx, dy
	db	4,0,32,0
	db	0,0,24,-8
	db	4,1,24,8
	db	0,0,16,-16
	db	4,1,16,16
	db	0,0,8,-16
	db	4,1,8,16
	db	0,0,0,-16
	db	4,1,0,16
	db	0,0,-8,-8
	db	4,1,-8,8
	db	4,1,-16,0
	db	0,0,-24,8
	db	4,1,-24,-8
	db	0,0,-32,16
	db	4,1,-32,-16
	db	0,0,-40,16
	db	4,1,-40,-16
	db	0,0,-48,16
	db	4,1,-48,-16
	db	0,0,-56,8
	db	4,1,-56,-8
	db	4,1,-64,0
	db	0,0,-72,-8
	db	4,1,-72,8

d_282009	section	romdata abs=0x282009
FxScript_282009:
	db	22	; total ticks
	; ticks, frame, dx, dy
	db	1,0,-8,-24
	db	1,1,-16,-16
	db	0,4,0,32
	db	1,2,-24,-8
	db	0,12,-64,16
	db	0,5,-16,16
	db	1,3,-40,8
	db	0,8,-40,-32
	db	0,13,-56,8
	db	0,6,-24,8
	db	3,1,-56,24
	db	0,9,-32,-24
	db	0,13,-40,-8
	db	0,7,-40,-8
	db	3,0,-64,32
	db	0,10,-24,-8
	db	0,12,-24,-32
	db	3,5,-56,-24
	db	0,11,-16,0
	db	3,4,-64,-32
	db	3,9,0,8
	db	3,8,8,16

d_282062	section	romdata abs=0x282062
FxScript_282062:
	db	54	; total ticks
	; ticks, frame, dx, dy
	db	0,0,-10,88
	db	0,1,0,83
	db	9,2,10,88
	db	0,0,-10,88
	db	0,0,-14,84
	db	0,1,0,79
	db	0,1,0,83
	db	0,2,10,88
	db	9,2,14,84
	db	0,0,-10,88
	db	0,0,-14,84
	db	0,0,-18,80
	db	0,1,0,75
	db	0,1,0,79
	db	0,1,0,83
	db	0,2,10,88
	db	0,2,14,84
	db	9,2,18,80
	db	0,0,-18,80
	db	0,0,-14,84
	db	0,1,0,75
	db	0,1,0,79
	db	0,2,18,80
	db	9,2,14,84
	db	0,0,-18,80
	db	0,1,0,75
	db	9,2,18,80
	db	9,0xFF,18,80

d_2820D3	section	romdata abs=0x2820D3
FxScript_2820D3:
	db	122	; total ticks
	; ticks, frame, dx, dy
	db	4,4,-32,40
	db	4,5,-32,32
	db	3,6,-32,24
	db	3,7,-32,16
	db	4,0,-32,0
	db	5,1,-32,0
	db	4,2,-32,0
	db	5,3,-32,0
	db	5,0,-32,0
	db	5,1,-32,0
	db	5,2,-32,0
	db	5,3,-32,0
	db	5,7,-32,16
	db	4,6,-32,24
	db	4,5,-32,32
	db	4,6,-32,24
	db	5,7,-32,16
	db	4,0,-32,0
	db	4,1,-32,0
	db	5,2,-32,0
	db	4,3,-32,0
	db	4,0,-32,0
	db	4,1,-32,0
	db	4,2,-32,0
	db	4,3,-32,0
	db	4,7,-32,16
	db	4,6,-32,24
	db	4,5,-32,32
	db	3,4,-32,40

d_282148	section	romdata abs=0x282148
FxScript_282148:
	db	12	; total ticks
	; ticks, frame, dx, dy
	db	0,2,72,8
	db	3,2,32,8
	db	0,3,40,8
	db	3,2,8,8
	db	0,3,16,8
	db	3,2,-16,8
	db	3,3,-24,8

d_282165	section	romdata abs=0x282165
FxScript_282165:
	db	27	; total ticks
	; ticks, frame, dx, dy
	db	0,0,68,-32
	db	3,1,76,-32
	db	0,0,28,-32
	db	0,6,40,-32
	db	0,6,56,-32
	db	0,6,72,-32
	db	0,0,68,0
	db	3,1,76,0
	db	0,0,-4,-32
	db	0,6,8,-32
	db	0,6,24,-32
	db	0,6,40,-32
	db	0,6,56,-32
	db	0,6,72,-32
	db	0,0,28,0
	db	0,6,40,0
	db	0,6,56,0
	db	0,6,72,0
	db	0,0,68,32
	db	3,1,76,32
	db	0,0,-68,-32
	db	0,6,-56,-32
	db	0,6,-40,-32
	db	0,6,-24,-32
	db	0,6,-8,-32
	db	0,6,8,-32
	db	0,6,24,-32
	db	0,6,40,-32
	db	0,6,56,-32
	db	0,6,72,-32
	db	0,0,-20,0
	db	0,6,-8,0
	db	0,6,8,0
	db	0,6,24,0
	db	0,6,40,0
	db	0,6,56,0
	db	0,6,72,0
	db	0,0,28,32
	db	0,6,40,32
	db	0,6,56,32
	db	3,6,72,32
	db	0,6,-72,-32
	db	0,6,-24,-32
	db	0,6,-8,-32
	db	0,6,8,-32
	db	0,6,24,-32
	db	0,6,-56,-32
	db	0,6,-40,-32
	db	0,2,36,-32
	db	0,0,-52,0
	db	0,6,-40,0
	db	0,6,-24,0
	db	0,6,-8,0
	db	0,6,8,0
	db	0,6,8,0
	db	0,6,24,0
	db	0,6,40,0
	db	0,6,56,0
	db	0,6,72,0
	db	0,0,-4,32
	db	0,6,8,32
	db	0,6,24,32
	db	0,6,40,32
	db	0,6,56,32
	db	3,6,72,32
	db	0,6,-72,-32
	db	0,6,-56,-32
	db	0,2,-44,-32
	db	0,6,-72,0
	db	0,6,-56,0
	db	0,6,-40,0
	db	0,6,-24,0
	db	0,6,-8,0
	db	0,6,8,0
	db	0,2,20,0
	db	0,0,-68,32
	db	0,6,-56,32
	db	0,6,-40,32
	db	0,6,-24,32
	db	0,6,-8,32
	db	0,6,8,32
	db	0,6,24,32
	db	0,6,40,32
	db	0,6,56,32
	db	3,6,72,32
	db	0,6,-76,0
	db	0,2,-48,0
	db	0,6,-60,0
	db	0,6,-44,32
	db	0,6,-28,32
	db	0,6,-12,32
	db	0,6,4,32
	db	0,6,20,32
	db	0,2,32,32
	db	0,6,-76,32
	db	3,6,-60,32
	db	0,2,-12,32
	db	0,6,-40,32
	db	0,6,-24,32
	db	0,6,-72,32
	db	3,6,-56,32
	db	0,6,-72,32
	db	3,2,-60,32

d_282302	section	romdata abs=0x282302
FxScript_282302:
	db	25	; total ticks
	; ticks, frame, dx, dy
	db	0,0,72,-32
	db	4,0,72,32
	db	0,0,64,-32
	db	0,0,72,-16
	db	0,0,72,16
	db	4,0,64,32
	db	0,0,48,-32
	db	0,0,56,-16
	db	0,0,64,0
	db	0,0,56,16
	db	4,0,48,32
	db	0,0,32,-32
	db	0,0,40,-16
	db	0,0,48,0
	db	0,0,40,16
	db	3,0,32,32
	db	0,0,16,-32
	db	0,0,24,-16
	db	0,0,32,0
	db	0,0,24,16
	db	3,0,16,32
	db	0,0,0,-32
	db	0,0,8,-16
	db	0,0,16,0
	db	0,0,8,16
	db	3,0,0,32
	db	0,0,-24,-32
	db	0,0,-16,-16
	db	0,0,-8,0
	db	0,0,-16,16
	db	4,0,-24,32

d_28237F	section	romdata abs=0x28237F
FxScript_28237F:
	db	32	; total ticks
	; ticks, frame, dx, dy
	db	0,0,16,-16
	db	0,0,52,-34
	db	4,0,48,16
	db	0,0,67,-28
	db	0,0,65,14
	db	0,0,30,26
	db	0,0,3,-19
	db	0,0,39,-11
	db	0,0,62,-10
	db	0,0,24,-41
	db	0,0,9,10
	db	0,1,16,-16
	db	0,1,52,-34
	db	4,1,48,16
	db	0,0,16,-16
	db	0,1,40,-10
	db	0,1,62,-10
	db	0,1,24,-41
	db	0,2,9,10
	db	0,2,52,-35
	db	4,2,48,15
	db	0,0,62,-9
	db	0,0,24,-41
	db	0,2,40,-10
	db	0,3,8,10
	db	0,3,52,-34
	db	4,3,49,15
	db	0,2,52,-34
	db	0,2,48,15
	db	0,2,8,10
	db	4,3,40,-10
	db	0,1,52,-34
	db	0,1,48,16
	db	0,1,8,10
	db	4,2,40,-10
	db	0,0,52,-34
	db	0,0,47,15
	db	0,0,8,10
	db	4,1,40,-10
	db	4,0,39,-11

d_282420	section	romdata abs=0x282420
FxScript_282420:
	db	49	; total ticks
	; ticks, frame, dx, dy
	db	0,4,56,16
	db	0,3,68,4
	db	0,3,48,-16
	db	0,2,36,-24
	db	0,2,36,20
	db	0,1,60,-8
	db	4,0,24,4
	db	0,2,68,4
	db	0,2,48,-16
	db	0,3,36,-24
	db	0,3,36,20
	db	0,4,60,-8
	db	0,2,56,16
	db	4,0,24,5
	db	0,4,60,8
	db	0,2,52,-20
	db	4,0,24,4
	db	0,3,60,8
	db	0,3,52,-20
	db	4,0,24,5
	db	0,1,48,24
	db	2,0,24,4
	db	0,4,48,24
	db	4,0,24,5
	db	4,0,20,4
	db	4,0,16,4
	db	0,1,36,-8
	db	0,3,40,4
	db	4,0,0,4
	db	0,4,36,-8
	db	0,3,12,4
	db	0,2,40,4
	db	4,0,-32,4
	db	0,1,-8,12
	db	0,2,12,4
	db	4,0,-64,4
	db	0,2,20,4
	db	0,4,-8,12
	db	0,2,0,0
	db	4,3,-20,4
	db	0,3,20,4
	db	0,3,0,0
	db	3,2,-20,4

d_2824CD	section	romdata abs=0x2824CD
FxScript_2824CD:
	db	39	; total ticks
	; ticks, frame, dx, dy
	db	7,0,32,-44
	db	6,1,32,-44
	db	5,2,32,-40
	db	4,3,32,-36
	db	3,4,32,-28
	db	4,5,32,-8
	db	3,6,32,0
	db	3,7,32,4
	db	0,8,36,20
	db	4,8,28,20

d_2824F6	section	romdata abs=0x2824F6
FxScript_2824F6:
	db	68	; total ticks
	; ticks, frame, dx, dy
	db	4,10,-32,-44
	db	0,0,-32,-44
	db	0,0,-32,-36
	db	0,0,-32,-28
	db	3,10,-32,-20
	db	0,0,-32,-44
	db	0,0,-32,-36
	db	0,0,-32,-28
	db	0,0,-32,-20
	db	0,0,-32,-12
	db	0,0,-32,-4
	db	0,0,-32,4
	db	4,10,-32,12
	db	0,0,-32,-44
	db	0,0,-32,-36
	db	0,0,-32,-28
	db	0,0,-32,-20
	db	0,0,-32,-12
	db	0,0,-32,-4
	db	0,0,-32,4
	db	0,0,-32,12
	db	0,0,-32,20
	db	0,0,-32,28
	db	0,0,-32,36
	db	6,10,-32,44
	db	0,0,-32,-20
	db	0,0,-32,-12
	db	0,0,-32,-4
	db	0,0,-32,4
	db	0,0,-32,12
	db	0,0,-32,20
	db	0,0,-32,28
	db	0,0,-32,36
	db	4,10,-32,44
	db	0,0,-32,36
	db	0,0,-32,28
	db	0,0,-32,20
	db	0,0,-32,12
	db	0,0,-32,44
	db	5,1,-32,36
	db	5,2,-32,28
	db	5,3,-32,20
	db	0,6,-32,4
	db	5,9,-32,4
	db	0,5,-32,16
	db	0,8,-32,16
	db	0,6,-40,4
	db	4,9,-24,4
	db	0,5,-40,16
	db	0,8,-24,16
	db	0,6,-48,4
	db	0,9,-16,4
	db	0,4,-32,32
	db	4,7,-32,32
	db	0,5,-44,16
	db	0,7,-28,32
	db	0,8,-20,16
	db	0,4,-36,32
	db	0,9,-8,4
	db	4,6,-56,4
	db	0,6,-64,4
	db	0,9,0,4
	db	0,4,-40,32
	db	0,5,-52,16
	db	0,7,-24,32
	db	4,8,-12,16
	db	0,4,-44,32
	db	0,5,-56,16
	db	0,7,-20,32
	db	4,8,-8,16
	db	0,4,-52,32
	db	0,5,-64,16
	db	0,7,-16,32
	db	4,8,-4,16
	db	0,4,-60,32
	db	3,7,-4,32

d_282627	section	romdata abs=0x282627
FxScript_282627:
	db	10	; total ticks
	; ticks, frame, dx, dy
	db	2,2,72,8
	db	0,2,32,8
	db	3,2,72,8
	db	0,2,-8,8
	db	3,2,28,8
	db	0,2,-36,8
	db	2,2,0,8

d_282644	section	romdata abs=0x282644
FxScript_282644:
	db	20	; total ticks
	; ticks, frame, dx, dy
	db	3,0,24,0
	db	5,1,12,8
	db	3,2,4,8
	db	3,3,-8,8
	db	3,4,-20,0
	db	3,5,-32,0

d_28265D	section	romdata abs=0x28265D
FxScript_28265D:
	db	24	; total ticks
	; ticks, frame, dx, dy
	db	3,0,32,8
	db	3,0,16,-8
	db	3,0,8,-16
	db	3,0,0,-24
	db	3,0,-16,-32
	db	3,0,-40,-40
	db	3,0,-56,-48
	db	3,0,-64,-48

d_28267E	section	romdata abs=0x28267E
FxScript_28267E:
	db	88	; total ticks
	; ticks, frame, dx, dy
	db	0,0,0,-40
	db	0,4,8,32
	db	0,8,-72,-32
	db	4,12,-64,40
	db	0,1,-16,-32
	db	0,9,-64,-16
	db	0,13,-48,32
	db	4,5,0,16
	db	0,5,-48,-32
	db	0,1,-64,16
	db	0,9,-16,32
	db	4,13,0,-16
	db	0,4,-64,-40
	db	0,0,-72,32
	db	0,8,0,40
	db	3,12,8,-32
	db	3,0,-8,-24
	db	3,1,-16,-16
	db	0,4,0,32
	db	3,2,-24,-8
	db	0,12,-64,16
	db	0,5,-16,16
	db	3,3,-40,8
	db	0,8,-40,-32
	db	0,13,-56,8
	db	0,6,-24,8
	db	3,1,-56,24
	db	0,9,-32,-24
	db	0,13,-40,-8
	db	0,7,-40,-8
	db	3,0,-64,32
	db	0,10,-24,-8
	db	0,12,-24,-32
	db	3,5,-56,-24
	db	0,11,-16,0
	db	3,4,-64,-32
	db	3,9,0,8
	db	0,8,-36,4
	db	0,0,-36,-4
	db	0,12,-28,4
	db	3,4,-28,-4
	db	0,0,-44,4
	db	0,4,-36,-12
	db	0,8,-28,12
	db	4,12,-20,-4
	db	0,4,-48,-16
	db	0,12,-16,-16
	db	0,0,-48,16
	db	3,8,-16,16
	db	0,1,-68,-16
	db	0,5,-16,-36
	db	0,9,-48,36
	db	3,13,4,16
	db	0,1,-44,-36
	db	0,5,4,-12
	db	0,9,-68,12
	db	3,13,-20,36
	db	0,12,-4,28
	db	0,8,-64,28
	db	0,4,-4,-28
	db	3,0,-64,-28
	db	0,0,-72,-4
	db	0,4,-28,-40
	db	0,8,-36,40
	db	3,12,8,4
	db	0,14,-56,24
	db	3,2,-8,-24
	db	0,6,-20,-20
	db	3,10,-44,20
	db	0,2,-28,0
	db	3,14,-36,0
	db	0,10,-24,-16
	db	3,6,-40,16
	db	0,14,-44,24
	db	3,2,-20,-24
	db	0,7,-32,-28
	db	3,11,-32,28
	db	0,13,-44,-36
	db	3,1,-20,36
	db	0,4,-4,40
	db	3,8,-60,-40

d_2827C3	section	romdata abs=0x2827C3
FxScript_2827C3:
	db	18	; total ticks
	; ticks, frame, dx, dy
	db	0,0,0,-32
	db	0,0,-8,24
	db	3,0,-56,-32
	db	0,0,-16,-16
	db	0,0,-40,-24
	db	0,0,-56,24
	db	0,1,0,-32
	db	0,1,-8,24
	db	3,1,-56,-32
	db	0,0,-64,0
	db	0,0,0,0
	db	0,0,-24,-40
	db	0,0,-32,32
	db	0,1,-16,-16
	db	0,1,-56,24
	db	0,1,-40,-24
	db	0,2,0,-32
	db	0,2,-8,24
	db	3,2,-56,-32
	db	0,0,-32,0
	db	0,1,-64,0
	db	0,1,0,0
	db	0,1,-24,-40
	db	0,1,-32,32
	db	0,2,-16,-16
	db	0,2,-56,24
	db	3,2,-40,-24
	db	0,1,-32,0
	db	0,2,-64,0
	db	0,2,0,0
	db	0,2,-24,-40
	db	3,2,-32,32
	db	3,2,-32,0

d_282848	section	romdata abs=0x282848
FxScript_282848:
	db	56	; total ticks
	; ticks, frame, dx, dy
	db	4,0,32,0
	db	4,0,24,-8
	db	4,0,16,-16
	db	4,0,8,-16
	db	4,0,0,-16
	db	4,0,-8,-8
	db	4,0,-16,0
	db	4,0,-24,8
	db	4,0,-32,16
	db	4,0,-40,16
	db	4,0,-48,16
	db	4,0,-56,8
	db	4,0,-64,0
	db	4,0,-72,-8

d_282881	section	romdata abs=0x282881
FxScript_282881:
	db	162	; total ticks
	; ticks, frame, dx, dy
	db	0,13,-4,-34
	db	0,13,-20,37
	db	6,14,-71,-12
	db	0,13,-32,-44
	db	0,14,7,20
	db	6,14,-64,21
	db	0,13,-57,-34
	db	0,14,8,-9
	db	0,14,-47,37
	db	0,11,-37,42
	db	0,11,3,-20
	db	6,11,-63,-27
	db	0,14,-3,31
	db	0,12,-9,36
	db	0,13,-18,41
	db	0,14,-17,-38
	db	0,12,-11,-36
	db	0,13,-5,-31
	db	0,12,-73,9
	db	0,14,-74,-1
	db	0,13,-71,-14
	db	0,8,-66,20
	db	0,10,7,18
	db	6,8,-28,-43
	db	0,12,-44,40
	db	0,14,-52,38
	db	0,13,-60,30
	db	0,12,-55,-34
	db	0,14,-49,-38
	db	0,13,-40,-42
	db	0,12,5,-13
	db	0,14,8,-5
	db	0,14,10,5
	db	0,9,0,-21
	db	0,10,-63,-24
	db	6,8,-32,44
	db	0,12,-9,33
	db	0,14,-15,39
	db	0,13,-26,39
	db	0,12,-21,-36
	db	0,13,-12,-32
	db	0,14,-4,-26
	db	0,12,-70,19
	db	0,13,-73,12
	db	0,14,-75,1
	db	0,9,-62,27
	db	0,9,-1,25
	db	6,8,-33,-38
	db	0,12,4,-12
	db	0,14,7,-2
	db	0,13,8,7
	db	0,12,-55,-34
	db	0,14,-47,-39
	db	0,13,-34,-43
	db	0,12,-52,38
	db	0,13,-44,40
	db	0,14,-60,30
	db	0,9,0,-21
	db	0,10,-63,-24
	db	6,10,-32,44
	db	0,13,-15,-41
	db	0,13,-59,4
	db	0,12,8,22
	db	0,14,-27,-38
	db	0,14,6,14
	db	0,14,-56,16
	db	0,11,-36,-34
	db	0,11,-52,23
	db	6,11,2,5
	db	0,14,-37,19
	db	0,13,-16,-16
	db	0,14,-46,-11
	db	0,11,-27,9
	db	0,11,-26,-12
	db	5,11,-42,-2
	db	0,11,-36,-4
	db	0,11,-28,-4
	db	6,11,-32,4
	db	7,10,-32,0
	db	0,0,-32,0
	db	0,9,-36,-8
	db	0,9,-24,0
	db	0,10,-48,8
	db	0,10,-20,16
	db	5,10,-36,20
	db	0,8,-44,40
	db	0,8,-72,20
	db	0,9,4,36
	db	0,8,0,-28
	db	0,1,-32,0
	db	4,9,-60,-40
	db	5,2,-32,0
	db	5,3,-32,0
	db	4,4,-32,0
	db	0,0,-49,17
	db	5,5,-32,0
	db	0,1,-49,17
	db	4,6,-32,0
	db	0,2,-49,17
	db	4,7,-32,0
	db	4,3,-49,17
	db	4,4,-49,17
	db	0,0,-49,-16
	db	4,5,-49,17
	db	0,1,-49,-16
	db	4,6,-49,17
	db	0,2,-49,-16
	db	4,7,-49,17
	db	4,3,-49,-16
	db	4,4,-49,-16
	db	0,0,-15,-16
	db	4,5,-49,-16
	db	0,1,-15,21
	db	4,6,-49,-16
	db	0,2,-15,21
	db	4,7,-49,-16
	db	4,3,-15,21
	db	4,4,-15,21
	db	4,5,-15,21
	db	4,6,-15,21
	db	4,7,-15,17

d_282A66	section	romdata abs=0x282A66
FxScript_282A66:
	db	110	; total ticks
	; ticks, frame, dx, dy
	db	5,0,0,0
	db	5,1,0,0
	db	5,2,0,0
	db	0,2,0,0
	db	5,3,0,0
	db	0,12,64,-16
	db	0,11,48,-8
	db	0,13,72,32
	db	0,2,0,0
	db	5,4,0,0
	db	0,11,24,-8
	db	0,12,48,-16
	db	0,13,64,32
	db	0,2,0,0
	db	5,5,0,0
	db	0,11,56,-32
	db	0,12,72,0
	db	0,11,-16,-8
	db	0,12,8,-16
	db	0,13,32,32
	db	0,2,0,0
	db	5,6,0,0
	db	0,11,64,-8
	db	0,11,24,-32
	db	0,12,40,0
	db	0,11,-48,-8
	db	0,12,-32,-16
	db	0,13,-8,32
	db	0,2,0,0
	db	5,7,0,0
	db	0,11,32,-8
	db	0,11,-16,-32
	db	0,12,-24,0
	db	0,12,72,24
	db	0,13,64,-32
	db	0,12,-72,-16
	db	0,13,-56,32
	db	0,2,0,0
	db	5,8,0,0
	db	0,11,-56,-32
	db	0,12,-64,0
	db	0,11,72,8
	db	0,12,32,24
	db	0,13,24,-32
	db	0,2,0,0
	db	5,9,0,0
	db	0,11,32,8
	db	0,12,-16,24
	db	0,13,-48,-32
	db	0,2,0,0
	db	5,10,0,0
	db	0,11,-24,8
	db	0,12,-56,24
	db	0,13,72,16
	db	0,2,0,0
	db	5,3,0,0
	db	0,11,-56,8
	db	0,12,56,-16
	db	0,13,24,16
	db	0,2,0,0
	db	5,4,0,0
	db	0,11,64,-24
	db	0,12,16,-16
	db	0,13,-24,16
	db	0,2,0,0
	db	5,5,0,0
	db	0,11,24,-24
	db	0,12,-32,-16
	db	0,13,-72,16
	db	0,2,0,0
	db	5,6,0,0
	db	0,11,-16,-24
	db	0,12,-72,-16
	db	0,13,64,8
	db	0,2,0,0
	db	5,7,0,0
	db	0,11,-56,-24
	db	0,12,72,24
	db	0,13,24,8
	db	0,2,0,0
	db	5,8,0,0
	db	0,11,72,-8
	db	0,12,32,24
	db	0,13,-24,8
	db	0,2,0,0
	db	5,9,0,0
	db	0,11,32,-8
	db	0,12,-16,24
	db	0,13,-72,8
	db	0,2,0,0
	db	5,10,0,0
	db	0,11,-24,-8
	db	0,12,-56,24
	db	0,2,0,0
	db	5,3,0,0
	db	5,1,0,0
	db	5,0,0,0

d_282BEB	section	romdata abs=0x282BEB
FxScript_282BEB:
	db	119	; total ticks
	; ticks, frame, dx, dy
	db	0,0,20,40
	db	0,0,8,-24
	db	4,0,68,-4
	db	0,1,32,-36
	db	0,1,0,24
	db	4,1,64,24
	db	0,4,-4,-4
	db	0,4,48,40
	db	4,4,56,-28
	db	0,4,20,40
	db	0,4,8,-24
	db	4,4,68,-4
	db	0,4,32,-36
	db	0,4,0,24
	db	4,4,64,24
	db	0,2,-4,-4
	db	0,2,48,40
	db	4,2,56,-28
	db	0,3,20,40
	db	0,3,8,-24
	db	4,3,68,-4
	db	0,6,64,24
	db	0,6,0,24
	db	4,6,32,-36
	db	0,6,-4,-4
	db	0,6,48,40
	db	4,6,56,-28
	db	0,6,20,40
	db	0,6,8,-24
	db	4,6,68,-4
	db	0,6,64,24
	db	0,6,0,24
	db	4,6,32,-36
	db	0,6,-4,-4
	db	0,6,48,40
	db	4,6,56,-28
	db	0,6,20,40
	db	0,6,8,-24
	db	4,6,68,-4
	db	0,6,64,24
	db	0,6,0,24
	db	4,6,32,-36
	db	0,6,-4,0
	db	0,6,48,40
	db	5,6,56,-28
	db	0,6,20,40
	db	0,6,4,-24
	db	6,6,68,-4
	db	0,0,36,-40
	db	0,0,-8,24
	db	0,0,68,32
	db	0,1,32,-32
	db	0,1,0,20
	db	0,1,60,24
	db	0,5,56,16
	db	0,5,12,20
	db	4,5,28,-24
	db	0,1,8,16
	db	0,1,32,-36
	db	0,1,56,16
	db	0,2,20,20
	db	0,2,28,-24
	db	0,2,56,8
	db	0,6,32,20
	db	0,6,48,-8
	db	4,6,20,-12
	db	0,4,56,32
	db	0,4,48,-32
	db	4,4,0,8
	db	5,0xFF,16,-16
	db	0,0,16,-16
	db	0,0,52,-34
	db	4,0,48,16
	db	0,0,35,-27
	db	0,0,65,14
	db	0,0,30,26
	db	0,0,3,-19
	db	0,0,39,-11
	db	0,0,62,-10
	db	0,0,24,-41
	db	0,0,9,10
	db	0,1,16,-16
	db	0,1,52,-34
	db	4,1,48,16
	db	0,4,35,34
	db	0,4,9,-30
	db	0,4,67,-22
	db	0,0,16,-16
	db	0,1,39,-11
	db	0,1,62,-10
	db	0,1,23,-42
	db	0,2,9,10
	db	0,2,52,-34
	db	4,2,48,16
	db	0,5,35,34
	db	0,5,9,-30
	db	0,5,67,-22
	db	0,0,62,-9
	db	0,0,24,-41
	db	0,2,39,-11
	db	0,3,8,10
	db	0,3,52,-34
	db	4,3,49,17
	db	0,4,-2,29
	db	0,4,33,-39
	db	0,4,68,31
	db	0,6,35,34
	db	0,6,9,-30
	db	0,6,67,-22
	db	0,2,52,-34
	db	0,2,49,17
	db	0,2,8,10
	db	4,3,40,-10
	db	0,5,-2,29
	db	0,5,33,-39
	db	0,5,68,31
	db	0,7,35,34
	db	0,7,68,31
	db	0,7,67,-22
	db	0,1,52,-34
	db	0,1,48,16
	db	0,1,8,10
	db	4,2,40,-10
	db	0,6,-2,29
	db	0,6,33,-39
	db	0,6,68,31
	db	0,0,52,-34
	db	0,0,48,16
	db	0,0,8,10
	db	4,1,39,-11
	db	0,7,-2,29
	db	0,7,33,-39
	db	4,7,68,31
	db	0,4,-2,29
	db	0,4,33,-39
	db	3,4,68,31

d_282E0C	section	romdata abs=0x282E0C
FxScript_282E0C:
	db	15	; total ticks
	; ticks, frame, dx, dy
	db	3,0xFF,16,-8
	db	3,2,72,12
	db	3,2,32,12
	db	3,2,0,12
	db	3,2,-24,12

d_282E21	section	romdata abs=0x282E21
FxScript_282E21:
	db	129	; total ticks
	; ticks, frame, dx, dy
	db	5,0,32,44
	db	6,1,32,44
	db	5,2,32,40
	db	4,3,32,36
	db	4,4,32,32
	db	5,5,32,28
	db	4,6,32,28
	db	5,7,32,24
	db	4,6,32,28
	db	5,5,32,28
	db	4,6,32,28
	db	5,7,32,24
	db	4,6,32,28
	db	5,5,32,28
	db	4,6,32,28
	db	5,7,32,24
	db	4,6,32,28
	db	5,5,32,28
	db	4,6,32,28
	db	5,7,32,24
	db	6,6,32,28
	db	4,8,32,28
	db	6,9,32,32
	db	0,12,56,64
	db	0,12,-12,52
	db	0,12,72,8
	db	0,12,0,-20
	db	4,9,32,32
	db	0,12,44,-14
	db	0,12,65,45
	db	0,12,-6,20
	db	0,10,54,64
	db	0,10,70,12
	db	0,10,2,-16
	db	0,10,-4,46
	db	0,12,42,40
	db	0,12,14,0
	db	0,12,12,34
	db	0,12,50,16
	db	0,11,9,-7
	db	0,11,59,15
	db	0,11,49,53
	db	0,11,5,41
	db	4,9,32,32
	db	0,10,14,55
	db	0,11,20,46
	db	0,10,62,42
	db	0,10,43,-14
	db	0,10,-3,19
	db	0,11,55,36
	db	0,11,40,-4
	db	0,11,7,20
	db	0,12,45,29
	db	0,12,36,6
	db	0,12,18,20
	db	0,10,35,29
	db	0,10,22,28
	db	0,10,44,18
	db	0,10,20,8
	db	4,9,32,32
	db	0,10,26,33
	db	0,10,42,26
	db	0,10,35,10
	db	0,10,24,21
	db	4,9,32,32
	db	5,9,32,32

d_282F2A	section	romdata abs=0x282F2A
FxScript_282F2A:
	db	15	; total ticks
	; ticks, frame, dx, dy
	db	0,0,-16,-16
	db	0,0,-40,-24
	db	3,0,-48,16
	db	0,0,-56,-8
	db	0,0,-16,16
	db	0,1,-16,-16
	db	0,1,-48,16
	db	3,1,-40,-24
	db	0,0,-32,0
	db	0,1,-56,-8
	db	0,1,-16,16
	db	0,2,-16,-16
	db	0,2,-48,16
	db	3,2,-40,-24
	db	0,1,-32,0
	db	0,2,-56,-8
	db	3,2,-16,16
	db	3,2,-32,0

d_282F73	section	romdata abs=0x282F73
FxScript_282F73:
	db	54	; total ticks
	; ticks, frame, dx, dy
	db	0,0,-18,-28
	db	0,1,-8,-23
	db	9,2,2,-28
	db	0,0,-18,-28
	db	0,0,-22,-24
	db	0,1,-8,-19
	db	0,1,-8,-23
	db	0,2,2,-28
	db	9,2,6,-24
	db	0,0,-18,-28
	db	0,0,-22,-24
	db	0,0,-26,-20
	db	0,1,-8,-15
	db	0,1,-8,-19
	db	0,1,-8,-23
	db	0,2,2,-28
	db	0,2,6,-24
	db	9,2,10,-20
	db	0,0,-26,-20
	db	0,0,-22,-24
	db	0,1,-8,-15
	db	0,1,-8,-19
	db	0,2,10,-20
	db	9,2,6,-24
	db	0,0,-26,-20
	db	0,1,-8,-15
	db	9,2,10,-20
	db	9,0xFF,10,-20

d_282FE4	section	romdata abs=0x282FE4
FxScript_282FE4:
	db	62	; total ticks
	; ticks, frame, dx, dy
	db	0,3,-16,0
	db	0,3,-48,8
	db	0,3,-64,-24
	db	0,3,-40,-48
	db	5,3,-8,-32
	db	0,4,-40,0
	db	0,4,-48,-8
	db	0,4,-32,-8
	db	5,4,-40,-16
	db	4,4,-40,-8
	db	4,5,-40,-8
	db	4,6,-40,-8
	db	4,4,-40,-8
	db	4,5,-40,-8
	db	4,6,-40,-8
	db	0,3,-24,-16
	db	0,3,-32,-8
	db	4,3,-16,-16
	db	0,4,-16,-16
	db	0,3,-16,-24
	db	0,3,8,-24
	db	0,3,-24,-16
	db	0,3,-8,-24
	db	0,3,-24,-24
	db	5,4,-32,-16
	db	3,0,-24,-16
	db	5,0,-24,-16
	db	4,1,-32,0
	db	0,3,8,-40
	db	0,3,-8,-32
	db	0,3,-40,-8
	db	0,5,-24,-24
	db	0,4,-32,-8
	db	4,2,-48,8
	db	0,3,-56,0
	db	0,3,-56,8
	db	0,3,-64,24
	db	0,3,-64,32
	db	0,3,-48,32
	db	0,3,-56,40
	db	3,3,-64,40

d_283089	section	romdata abs=0x283089
FxScript_283089:
	db	44	; total ticks
	; ticks, frame, dx, dy
	db	4,0,72,-32
	db	4,0,48,-32
	db	0,0,72,-16
	db	4,0,8,-32
	db	0,0,48,-16
	db	4,0,-16,-32
	db	0,0,8,-16
	db	0,0,72,8
	db	4,0,-16,-32
	db	0,0,48,0
	db	0,0,-16,-32
	db	4,0,-16,-16
	db	0,0,72,16
	db	0,0,8,0
	db	0,0,-16,-32
	db	4,0,-16,-16
	db	0,0,-16,-32
	db	0,0,48,16
	db	0,0,-16,-16
	db	4,0,-16,0
	db	0,0,-16,-16
	db	0,0,8,16
	db	0,0,-16,-32
	db	4,0,-16,0
	db	0,0,-16,0
	db	0,0,-16,16
	db	0,0,-16,-32
	db	8,0,-16,-16

d_2830FA	section	romdata abs=0x2830FA
FxScript_2830FA:
	db	43	; total ticks
	; ticks, frame, dx, dy
	db	3,0,-36,12
	db	4,1,-32,4
	db	0,0,-36,12
	db	4,2,-32,0
	db	0,1,-32,4
	db	3,3,-32,-4
	db	0,2,-32,0
	db	4,4,-36,-12
	db	0,0,-36,12
	db	0,3,-32,-4
	db	3,6,-44,-24
	db	0,1,-32,4
	db	0,4,-36,-12
	db	5,6,-44,-24
	db	0,1,-32,-4
	db	3,5,-32,0
	db	4,2,-32,0
	db	4,3,-32,-4
	db	3,4,-36,-12
	db	3,6,-44,-24

d_28314B	section	romdata abs=0x28314B
FxScript_28314B:
	db	45	; total ticks
	; ticks, frame, dx, dy
	db	0,0,-48,-20
	db	0,0,-16,28
	db	3,0,-32,4
	db	0,1,-48,-20
	db	0,1,-16,28
	db	3,1,-32,4
	db	0,2,-48,-20
	db	0,2,-32,0
	db	3,2,-16,20
	db	0,0,-48,-16
	db	0,0,-16,28
	db	3,0,-32,4
	db	0,1,-48,-20
	db	0,1,-16,28
	db	3,1,-32,4
	db	0,2,-48,-20
	db	0,2,-32,0
	db	3,2,-16,20
	db	0,0,-48,-20
	db	0,0,-16,28
	db	3,0,-32,4
	db	0,1,-48,-16
	db	0,1,-16,28
	db	3,1,-32,4
	db	0,2,-48,-20
	db	0,2,-32,0
	db	3,2,-16,20
	db	0,0,-48,-20
	db	0,0,-16,28
	db	3,0,-32,4
	db	0,1,-48,-20
	db	0,1,-16,28
	db	3,1,-32,4
	db	0,2,-48,-20
	db	0,2,-32,0
	db	3,2,-16,20
	db	0,0,-48,-20
	db	0,0,-16,28
	db	3,0,-32,4
	db	0,1,-48,-16
	db	0,1,-16,28
	db	3,1,-32,4
	db	0,2,-48,-20
	db	0,2,-32,0
	db	3,2,-16,20

d_283200	section	romdata abs=0x283200
FxScript_283200:
	db	54	; total ticks
	; ticks, frame, dx, dy
	db	0,0,40,14
	db	0,1,34,24
	db	9,2,40,34
	db	0,0,40,14
	db	0,0,36,10
	db	0,1,30,24
	db	0,1,34,24
	db	0,2,40,34
	db	9,2,36,38
	db	0,0,40,14
	db	0,0,36,10
	db	0,0,32,6
	db	0,1,26,24
	db	0,1,30,24
	db	0,1,34,24
	db	0,2,40,34
	db	0,2,36,38
	db	9,2,32,42
	db	0,0,32,6
	db	0,0,36,10
	db	0,1,26,24
	db	0,1,30,24
	db	0,2,32,42
	db	9,2,36,38
	db	0,0,32,6
	db	0,1,26,24
	db	9,2,32,42
	db	9,0xFF,32,42

d_283271	section	romdata abs=0x283271
FxScript_283271:
	db	57	; total ticks
	; ticks, frame, dx, dy
	db	3,0,-32,-40
	db	3,1,-32,0
	db	3,3,-32,0
	db	3,3,-32,0
	db	3,4,-36,0
	db	3,5,-32,0
	db	3,6,-28,0
	db	3,7,-32,0
	db	3,8,-36,0
	db	3,9,-32,0
	db	3,10,-28,0
	db	3,3,-32,0
	db	3,4,-32,0
	db	3,5,-32,0
	db	3,6,-32,0
	db	3,7,-32,0
	db	3,8,-32,0
	db	3,9,-32,0
	db	3,10,-32,0

d_2832BE	section	romdata abs=0x2832BE
FxScript_2832BE:
	db	42	; total ticks
	; ticks, frame, dx, dy
	db	0,0,-48,34
	db	6,0,0,16
	db	0,0,-29,23
	db	0,0,-61,31
	db	0,0,-25,39
	db	0,0,-2,40
	db	0,0,-40,9
	db	0,1,-48,24
	db	6,1,-12,6
	db	0,4,-32,50
	db	0,4,-58,-30
	db	0,4,3,-22
	db	0,0,-48,4
	db	0,1,-25,9
	db	0,1,-2,30
	db	0,1,-41,-22
	db	0,2,-48,32
	db	0,2,-8,-11
	db	6,2,-8,43
	db	0,5,-32,12
	db	0,5,-56,-40
	db	0,5,4,-20
	db	0,0,-4,4
	db	0,0,-40,-20
	db	0,2,-24,0
	db	0,3,-58,0
	db	0,3,-12,-28
	db	6,3,-15,37
	db	0,4,-66,12
	db	0,4,-31,-61
	db	0,4,4,11
	db	0,6,-30,28
	db	0,6,-56,-42
	db	0,6,2,-40
	db	0,2,-12,-28
	db	0,2,-16,2
	db	0,2,-58,0
	db	6,3,-24,-22
	db	0,5,-66,8
	db	0,5,4,9
	db	0,7,-32,-8
	db	0,7,3,-42
	db	0,1,-16,-4
	db	0,1,-56,-10
	db	6,2,-24,-22
	db	0,6,-68,-20
	db	0,6,4,1
	db	0,0,-16,-14
	db	0,0,-56,-20
	db	6,1,-25,-32

d_283387	section	romdata abs=0x283387
FxScript_283387:
	db	42	; total ticks
	; ticks, frame, dx, dy
	db	0,6,-4,-20
	db	0,6,68,1
	db	0,0,52,-48
	db	0,0,48,-14
	db	0,0,8,-20
	db	6,1,39,-32
	db	0,5,-2,8
	db	0,5,33,-44
	db	0,5,68,9
	db	0,6,32,-15
	db	0,7,67,-42
	db	0,1,48,-4
	db	0,1,8,-10
	db	6,2,39,-32
	db	0,4,36,-34
	db	0,4,33,-48
	db	0,4,68,11
	db	0,6,34,14
	db	0,6,8,-42
	db	0,6,66,-40
	db	0,2,54,-32
	db	0,2,49,43
	db	0,2,48,-4
	db	0,2,7,-10
	db	6,3,40,-22
	db	0,5,32,12
	db	0,5,8,-40
	db	0,5,68,-20
	db	0,0,60,4
	db	0,0,24,-20
	db	0,2,40,0
	db	0,3,6,0
	db	0,3,52,-28
	db	6,3,49,37
	db	0,4,32,48
	db	0,4,6,-30
	db	0,4,67,-22
	db	0,0,16,4
	db	0,1,39,9
	db	0,1,62,30
	db	0,1,23,-22
	db	0,2,10,32
	db	0,2,54,-11
	db	6,2,49,37
	db	0,0,35,23
	db	0,0,65,45
	db	0,0,3,31
	db	0,0,39,39
	db	0,0,62,40
	db	0,0,24,9
	db	0,0,9,48
	db	0,1,16,24
	db	0,1,52,6
	db	6,1,48,48
	db	0,1,16,34
	db	0,0,52,16
	db	6,0,48,48

d_28346C	section	romdata abs=0x28346C
FxScript_28346C:
	db	32	; total ticks
	; ticks, frame, dx, dy
	db	0,11,-36,-4
	db	0,11,-28,-4
	db	3,11,-32,4
	db	0,0,-32,0
	db	0,9,-36,-8
	db	0,9,-24,0
	db	0,10,-48,8
	db	0,10,-20,16
	db	4,10,-36,20
	db	0,8,-44,40
	db	0,8,-72,20
	db	0,9,4,36
	db	0,8,0,-28
	db	0,1,-32,0
	db	4,9,-60,-40
	db	4,2,-32,0
	db	4,3,-32,0
	db	3,3,-32,0
	db	4,5,-32,0
	db	3,6,-32,0
	db	3,7,-32,0

d_2834C1	section	romdata abs=0x2834C1
FxScript_2834C1:
	db	24	; total ticks
	; ticks, frame, dx, dy
	db	4,0,-32,0
	db	5,1,-32,0
	db	4,2,-32,0
	db	3,3,-32,0
	db	4,4,-32,0
	db	4,5,-32,0

d_2834DA	section	romdata abs=0x2834DA
FxScript_2834DA:
	db	36	; total ticks
	; ticks, frame, dx, dy
	db	5,0,32,0
	db	4,1,32,0
	db	3,2,32,0
	db	3,3,32,0
	db	3,3,32,0
	db	0,0,32,0
	db	3,4,32,0
	db	0,1,32,0
	db	3,5,32,0
	db	3,2,32,0
	db	3,3,32,0
	db	3,4,32,0
	db	3,5,32,0

d_28350F	section	romdata abs=0x28350F
FxScript_28350F:
	db	30	; total ticks
	; ticks, frame, dx, dy
	db	0,0,16,-32
	db	0,0,24,-16
	db	0,0,32,0
	db	0,0,24,16
	db	6,0,16,32
	db	0,0,8,-32
	db	0,0,16,-16
	db	0,0,24,0
	db	0,0,16,16
	db	4,0,8,32
	db	0,0,0,-32
	db	0,0,8,-16
	db	0,0,16,0
	db	0,0,8,16
	db	4,0,0,32
	db	0,0,-16,-32
	db	0,0,-8,-16
	db	0,0,0,0
	db	0,0,-8,16
	db	3,0,-16,32
	db	0,0,-32,-32
	db	0,0,-24,-16
	db	0,0,-16,0
	db	0,0,-24,16
	db	3,0,-32,32
	db	0,0,-48,-32
	db	0,0,-40,-16
	db	0,0,-32,0
	db	0,0,-40,16
	db	3,0,-48,32
	db	0,0,-64,-32
	db	0,0,-64,32
	db	0,0,-56,-16
	db	0,0,-48,0
	db	4,0,-56,16
	db	0,0,-80,-32
	db	0,0,-80,32
	db	0,0,-72,-16
	db	0,0,-72,16
	db	3,0,-64,0

d_2835B0	section	romdata abs=0x2835B0
FxScript_2835B0:
	db	33	; total ticks
	; ticks, frame, dx, dy
	db	3,10,72,0
	db	0,12,64,0
	db	0,12,48,0
	db	0,12,72,0
	db	3,10,32,0
	db	0,13,-8,0
	db	0,13,8,0
	db	0,13,24,0
	db	0,13,40,0
	db	0,13,56,0
	db	0,13,72,0
	db	5,10,-24,0
	db	0,12,72,0
	db	0,12,56,0
	db	0,12,40,0
	db	0,12,24,0
	db	0,12,8,0
	db	0,12,-8,0
	db	0,12,-24,0
	db	0,12,-40,0
	db	0,12,-56,0
	db	6,12,-72,0
	db	0,5,76,0
	db	0,5,68,0
	db	0,5,60,0
	db	0,5,52,0
	db	0,5,44,0
	db	0,5,36,0
	db	0,5,28,0
	db	0,5,20,0
	db	0,5,12,0
	db	0,5,4,0
	db	0,5,-4,0
	db	0,5,-12,0
	db	0,5,-20,0
	db	0,5,-28,0
	db	0,5,-36,0
	db	0,5,-44,0
	db	0,5,-52,0
	db	0,5,-60,0
	db	0,5,-68,0
	db	4,5,-76,0
	db	0,1,-76,0
	db	0,1,-68,0
	db	0,1,-60,0
	db	0,1,-52,0
	db	0,1,-44,0
	db	0,1,-36,0
	db	0,1,-28,0
	db	0,1,-20,0
	db	0,1,76,0
	db	0,1,68,0
	db	0,1,60,0
	db	0,1,52,0
	db	0,1,44,0
	db	0,1,36,0
	db	0,1,28,0
	db	0,1,20,0
	db	0,1,12,0
	db	0,1,4,0
	db	0,1,-12,0
	db	4,1,-4,0
	db	0,1,-76,0
	db	0,1,-68,0
	db	0,1,-60,0
	db	0,1,-52,0
	db	0,1,-44,0
	db	0,1,-16,0
	db	0,1,-20,0
	db	0,1,-28,0
	db	0,1,-36,0
	db	4,0,-8,0
	db	0,1,-72,0
	db	0,1,-76,0
	db	4,0,-64,0

d_2836DD	section	romdata abs=0x2836DD
FxScript_2836DD:
	db	42	; total ticks
	; ticks, frame, dx, dy
	db	0,0,16,34
	db	6,0,64,16
	db	0,0,35,23
	db	0,0,3,31
	db	0,0,39,39
	db	0,0,62,40
	db	0,0,24,9
	db	0,1,16,24
	db	6,1,52,6
	db	0,4,32,50
	db	0,4,6,-30
	db	0,4,67,-22
	db	0,0,16,4
	db	0,1,39,9
	db	0,1,62,30
	db	0,1,23,-22
	db	0,2,16,32
	db	0,2,56,-11
	db	6,2,56,43
	db	0,5,32,12
	db	0,5,8,-40
	db	0,5,68,-20
	db	0,0,60,4
	db	0,0,24,-20
	db	0,2,40,0
	db	0,3,6,0
	db	0,3,52,-28
	db	6,3,49,37
	db	0,4,-2,12
	db	0,4,33,-61
	db	0,4,68,11
	db	0,6,34,28
	db	0,6,8,-42
	db	0,6,66,-40
	db	0,2,52,-28
	db	0,2,48,2
	db	0,2,6,0
	db	6,3,40,-22
	db	0,5,2,8
	db	0,5,68,9
	db	0,7,32,-8
	db	0,7,67,-42
	db	0,1,48,-4
	db	0,1,8,-10
	db	6,2,40,-22
	db	0,6,4,-20
	db	0,6,68,1
	db	0,0,48,-14
	db	0,0,8,-20
	db	6,1,39,-32

d_2837A6	section	romdata abs=0x2837A6
FxScript_2837A6:
	db	18	; total ticks
	; ticks, frame, dx, dy
	db	3,0xFF,0,8
	db	0,2,8,8
	db	3,0,16,8
	db	0,2,-12,8
	db	3,1,16,8
	db	3,2,-36,8
	db	3,2,-60,8
	db	3,2,-76,8

d_2837C7	section	romdata abs=0x2837C7
FxScript_2837C7:
	db	35	; total ticks
	; ticks, frame, dx, dy
	db	4,5,-32,0
	db	4,4,-32,0
	db	3,3,-32,0
	db	3,2,-32,0
	db	3,1,-32,0
	db	0,0,-32,0
	db	3,5,-32,0
	db	3,4,-32,0
	db	3,3,-32,0
	db	3,2,-32,0
	db	3,1,-32,0
	db	3,0,-32,0

d_2837F8	section	romdata abs=0x2837F8
FxScript_2837F8:
	db	42	; total ticks
	; ticks, frame, dx, dy
	db	0,6,-68,-20
	db	0,6,4,1
	db	0,0,-12,-48
	db	0,0,-16,-14
	db	0,0,-56,-20
	db	6,1,-25,-32
	db	0,5,-66,8
	db	0,5,-31,-44
	db	0,5,4,9
	db	0,6,-32,-15
	db	0,7,3,-42
	db	0,1,-16,-4
	db	0,1,-56,-10
	db	6,2,-25,-32
	db	0,4,-28,-34
	db	0,4,-31,-48
	db	0,4,4,11
	db	0,6,-30,14
	db	0,6,-56,-42
	db	0,6,2,-40
	db	0,2,-10,-32
	db	0,2,-15,43
	db	0,2,-16,-4
	db	0,2,-57,-10
	db	6,3,-24,-22
	db	0,5,-32,12
	db	0,5,-56,-40
	db	0,5,4,-20
	db	0,0,-4,4
	db	0,0,-40,-20
	db	0,2,-24,0
	db	0,3,-58,0
	db	0,3,-12,-28
	db	6,3,-15,37
	db	0,4,-32,48
	db	0,4,-58,-30
	db	0,4,3,-22
	db	0,0,-48,4
	db	0,1,-25,9
	db	0,1,-2,30
	db	0,1,-41,-22
	db	0,2,-54,32
	db	0,2,-10,-11
	db	6,2,-15,37
	db	0,0,-29,23
	db	0,0,1,45
	db	0,0,-61,31
	db	0,0,-25,39
	db	0,0,-2,40
	db	0,0,-40,9
	db	0,0,-55,48
	db	0,1,-48,24
	db	0,1,-12,6
	db	6,1,-16,48
	db	0,1,-48,34
	db	0,0,-12,16
	db	6,0,-16,48

d_2838DD	section	romdata abs=0x2838DD
FxScript_2838DD:
	db	36	; total ticks
	; ticks, frame, dx, dy
	db	5,0,-32,0
	db	4,1,-32,0
	db	3,2,-32,0
	db	3,3,-32,0
	db	3,3,-32,0
	db	0,0,-32,0
	db	3,4,-32,0
	db	0,1,-32,0
	db	3,5,-32,0
	db	3,2,-32,0
	db	3,3,-32,0
	db	3,4,-32,0
	db	3,5,-32,0

d_283912	section	romdata abs=0x283912
FxScript_283912:
	db	35	; total ticks
	; ticks, frame, dx, dy
	db	4,5,32,0
	db	4,4,32,0
	db	3,3,32,0
	db	3,2,32,0
	db	3,1,32,0
	db	0,0,32,0
	db	3,5,32,0
	db	3,4,32,0
	db	3,3,32,0
	db	3,2,32,0
	db	3,1,32,0
	db	3,0,32,0

d_283943	section	romdata abs=0x283943
FxScript_283943:
	db	106	; total ticks
	; ticks, frame, dx, dy
	db	0,18,64,32
	db	0,17,56,0
	db	0,16,72,-24
	db	4,12,48,24
	db	0,19,32,32
	db	0,18,8,0
	db	0,17,40,-24
	db	0,16,72,16
	db	0,0,72,-24
	db	0,0,64,-8
	db	0,0,56,8
	db	0,0,64,24
	db	4,0,72,40
	db	0,19,-32,0
	db	0,18,8,-24
	db	0,17,32,16
	db	0,16,-16,32
	db	0,4,64,-32
	db	0,4,56,-16
	db	0,4,48,0
	db	0,4,56,16
	db	4,4,64,32
	db	0,19,-24,-24
	db	0,18,-8,16
	db	0,17,-56,32
	db	0,16,32,-32
	db	0,9,56,-40
	db	0,8,48,-24
	db	0,8,40,-8
	db	0,8,48,8
	db	4,8,56,24
	db	0,19,-48,16
	db	0,18,72,24
	db	0,17,0,-32
	db	0,16,-64,-24
	db	0,12,48,-40
	db	0,12,40,-24
	db	0,12,32,-8
	db	0,12,40,8
	db	4,12,48,24
	db	0,19,32,24
	db	0,18,-40,-32
	db	0,17,72,-16
	db	0,16,-80,16
	db	0,0,40,-32
	db	0,0,32,-16
	db	0,0,24,0
	db	0,0,32,16
	db	4,0,40,32
	db	0,19,-72,-32
	db	0,18,40,-16
	db	0,17,56,32
	db	0,16,-8,24
	db	0,4,32,-24
	db	0,4,24,-8
	db	0,4,16,8
	db	0,4,24,24
	db	4,4,32,40
	db	0,19,-32,-16
	db	0,18,16,32
	db	0,17,-48,24
	db	0,16,72,-32
	db	0,8,24,-16
	db	0,8,16,0
	db	0,8,8,16
	db	0,8,16,32
	db	4,0,24,48
	db	0,19,-16,32
	db	0,18,64,16
	db	0,17,40,-32
	db	0,16,16,-16
	db	0,4,16,-16
	db	0,4,8,0
	db	0,4,0,16
	db	0,4,8,32
	db	4,4,16,48
	db	0,19,24,16
	db	0,18,8,-32
	db	0,17,-24,-16
	db	0,16,-56,32
	db	0,8,8,-24
	db	0,8,0,-8
	db	0,8,-8,8
	db	0,8,0,24
	db	4,8,8,40
	db	0,19,-32,-32
	db	0,18,-64,-16
	db	0,17,72,24
	db	0,16,-16,16
	db	0,12,0,-32
	db	0,12,-8,-16
	db	0,12,-16,0
	db	0,12,-8,16
	db	4,12,0,32
	db	0,19,64,-16
	db	0,18,32,24
	db	0,17,-56,16
	db	0,16,-72,-32
	db	0,1,-8,-40
	db	0,0,-16,-24
	db	0,0,-24,-8
	db	0,0,-16,8
	db	4,0,-8,24
	db	0,19,0,24
	db	0,18,64,16
	db	0,17,72,-32
	db	0,16,32,-16
	db	0,4,-16,-40
	db	0,5,-24,-24
	db	0,4,-32,-8
	db	0,5,-24,8
	db	4,4,-16,24
	db	0,19,24,16
	db	0,18,40,-32
	db	0,17,0,-16
	db	0,16,-40,24
	db	0,9,-24,-32
	db	0,8,-32,-16
	db	0,9,-40,0
	db	0,8,-32,16
	db	4,9,-24,32
	db	0,19,8,-32
	db	0,18,-40,-16
	db	0,17,-72,24
	db	0,16,-16,16
	db	0,12,-32,-24
	db	0,13,-40,-8
	db	0,12,-48,8
	db	0,13,-40,24
	db	4,12,-32,40
	db	0,19,-72,-16
	db	0,18,72,16
	db	0,17,-56,16
	db	0,16,-32,-32
	db	0,12,16,48
	db	0,12,0,32
	db	0,0,-40,-16
	db	0,0,-48,0
	db	0,0,-56,16
	db	0,0,-48,32
	db	4,0,-40,48
	db	0,19,32,16
	db	0,18,-80,16
	db	0,17,-72,-32
	db	0,16,72,-24
	db	0,0,-24,8
	db	0,0,-16,24
	db	0,0,0,40
	db	0,8,-48,-8
	db	0,8,-56,8
	db	0,8,-64,24
	db	4,8,-56,40
	db	0,19,64,32
	db	0,18,72,0
	db	0,17,40,-24
	db	0,16,0,16
	db	0,4,-24,-8
	db	0,4,-32,16
	db	0,4,-24,32
	db	0,12,-48,48
	db	0,12,-56,0
	db	0,12,-64,16
	db	4,12,-56,32
	db	0,19,32,0
	db	0,18,0,-24
	db	0,17,-32,16
	db	0,16,24,32
	db	0,8,-16,-16
	db	0,8,-32,0
	db	0,8,-32,40
	db	0,8,-40,16
	db	0,0,-64,8
	db	0,0,-72,24
	db	4,0,-64,40
	db	0,19,-40,-24
	db	0,18,-72,16
	db	0,17,-16,32
	db	0,16,-8,0
	db	0,12,-8,-24
	db	0,12,-24,-16
	db	0,12,-32,8
	db	0,4,-72,16
	db	0,4,-80,32
	db	4,4,-72,48
	db	0,18,-56,32
	db	0,17,-48,0
	db	0,16,-72,-24
	db	0,0,0,-16
	db	0,0,-16,-24
	db	0,1,-40,0
	db	4,8,-80,24
	db	4,5,-48,-8
	db	0,10,-56,-32
	db	4,9,-72,32
	db	0,15,-56,-32
	db	4,14,-72,32
	db	0,1,-56,-24
	db	4,3,-72,32
	db	0,4,-56,-32
	db	3,5,-72,24
	db	3,8,-72,16

d_283C68	section	romdata abs=0x283C68
FxScript_283C68:
	db	54	; total ticks
	; ticks, frame, dx, dy
	db	0,0,4,2
	db	0,1,4,21
	db	0,2,13,11
	db	9,3,-5,11
	db	0,0,4,-2
	db	0,0,4,2
	db	0,1,4,25
	db	0,1,4,21
	db	0,2,17,11
	db	0,2,13,11
	db	0,3,-9,11
	db	9,3,-5,11
	db	0,0,4,-6
	db	0,0,4,-2
	db	0,0,4,2
	db	0,1,4,29
	db	0,1,4,25
	db	0,1,4,21
	db	0,2,21,11
	db	0,2,17,11
	db	0,2,13,11
	db	0,3,-13,11
	db	0,3,-9,11
	db	9,3,-5,11
	db	0,0,4,-6
	db	0,0,4,-2
	db	0,1,4,29
	db	0,1,4,25
	db	0,2,21,11
	db	0,2,17,11
	db	0,3,-13,11
	db	9,3,-9,11
	db	0,0,4,-6
	db	0,1,4,29
	db	0,2,21,11
	db	9,3,-13,11
	db	9,0xFF,-13,11

d_283CFD	section	romdata abs=0x283CFD
FxScript_283CFD:
	db	40	; total ticks
	; ticks, frame, dx, dy
	db	4,0,-32,0
	db	3,1,-32,0
	db	3,2,-32,0
	db	3,3,-32,0
	db	3,4,-32,0
	db	4,0xFF,-32,0
	db	4,5,-32,0
	db	3,6,-32,0
	db	3,7,-32,0
	db	3,8,-32,0
	db	3,4,-32,0
	db	4,0xFF,-32,0

d_283D2E	section	romdata abs=0x283D2E
FxScript_283D2E:
	db	35	; total ticks
	; ticks, frame, dx, dy
	db	0,0,16,-16
	db	0,0,52,-34
	db	4,0,48,16
	db	0,0,35,-27
	db	0,0,65,14
	db	0,0,35,32
	db	0,0,9,-30
	db	0,0,39,-11
	db	0,0,62,-10
	db	0,0,24,-41
	db	0,0,9,10
	db	0,1,16,-16
	db	0,1,52,-34
	db	4,1,49,17
	db	0,4,35,33
	db	0,4,9,-30
	db	0,4,66,-22
	db	0,0,16,-16
	db	0,1,40,-10
	db	0,1,62,-10
	db	0,1,23,-42
	db	0,2,9,10
	db	0,2,52,-34
	db	4,2,49,17
	db	0,5,35,34
	db	0,5,9,-30
	db	0,5,67,-22
	db	0,0,62,-9
	db	0,0,24,-41
	db	0,2,39,-10
	db	0,3,8,10
	db	0,3,52,-34
	db	4,3,49,17
	db	0,4,-2,29
	db	0,4,34,-39
	db	0,4,68,31
	db	0,6,35,34
	db	0,6,9,-30
	db	0,6,67,-22
	db	0,2,52,-34
	db	0,2,49,17
	db	0,2,8,10
	db	4,3,40,-10
	db	0,5,-4,29
	db	0,5,33,-39
	db	0,5,68,31
	db	0,7,35,34
	db	0,7,68,31
	db	0,7,67,-22
	db	0,1,52,-34
	db	0,1,49,17
	db	0,1,8,10
	db	4,2,40,-10
	db	0,6,-2,29
	db	0,6,33,-39
	db	0,6,68,31
	db	0,0,52,-34
	db	0,0,48,16
	db	0,0,8,10
	db	4,1,39,-11
	db	0,7,-2,29
	db	0,7,33,-39
	db	4,7,68,31
	db	0,4,-2,29
	db	0,4,33,-39
	db	3,4,68,31

d_283E37	section	romdata abs=0x283E37
FxScript_283E37:
	db	54	; total ticks
	; ticks, frame, dx, dy
	db	0,3,32,-28
	db	0,3,32,-20
	db	0,3,32,-12
	db	0,3,32,-4
	db	0,3,32,4
	db	0,3,32,12
	db	0,3,32,20
	db	3,3,32,28
	db	3,0xFF,32,44
	db	0,2,32,-28
	db	0,2,32,-20
	db	0,2,32,-12
	db	0,2,32,-4
	db	0,2,32,4
	db	0,2,32,12
	db	0,2,32,20
	db	3,2,32,28
	db	3,0xFF,32,-12
	db	0,1,32,-28
	db	0,1,32,-20
	db	0,1,32,-12
	db	0,1,32,-4
	db	0,1,32,4
	db	0,1,32,12
	db	0,1,32,20
	db	3,1,32,28
	db	3,0xFF,32,-12
	db	0,0,32,-28
	db	0,0,32,-20
	db	0,0,32,-12
	db	0,0,32,-4
	db	0,0,32,4
	db	0,0,32,12
	db	0,0,32,20
	db	3,0,32,28
	db	3,0xFF,32,-12
	db	0,0,32,-28
	db	0,0,32,-20
	db	0,0,32,-12
	db	0,0,32,-4
	db	0,0,32,4
	db	0,0,32,12
	db	0,0,32,20
	db	3,0,32,28
	db	0,1,32,-28
	db	0,1,32,-20
	db	0,1,32,-12
	db	0,1,32,-4
	db	0,1,32,4
	db	0,1,32,12
	db	0,1,32,20
	db	3,1,32,28
	db	0,0,32,-28
	db	0,0,32,-20
	db	0,0,32,-12
	db	0,0,32,-4
	db	0,0,32,4
	db	0,0,32,12
	db	0,0,32,20
	db	14,0,32,28
	db	0,1,32,-28
	db	0,1,32,-20
	db	0,1,32,-12
	db	0,1,32,-4
	db	0,1,32,4
	db	0,1,32,12
	db	0,1,32,20
	db	4,1,32,28
	db	0,2,32,-28
	db	0,2,32,-20
	db	0,2,32,-12
	db	0,2,32,-4
	db	0,2,32,4
	db	0,2,32,12
	db	0,2,32,20
	db	3,2,32,28
	db	0,3,32,-28
	db	0,3,32,-20
	db	0,3,32,-12
	db	0,3,32,-4
	db	0,3,32,4
	db	0,3,32,12
	db	0,3,32,20
	db	3,3,32,28

d_283F88	section	romdata abs=0x283F88
FxScript_283F88:
	db	10	; total ticks
	; ticks, frame, dx, dy
	db	4,0,5,-22
	db	4,1,-32,0
	db	2,2,-48,13

d_283F95	section	romdata abs=0x283F95
FxScript_283F95:
	db	40	; total ticks
	; ticks, frame, dx, dy
	db	4,0,32,0
	db	3,1,32,0
	db	3,2,32,0
	db	3,3,32,0
	db	3,4,32,0
	db	4,0xFF,32,0
	db	4,5,32,0
	db	3,6,32,0
	db	3,7,32,0
	db	3,8,32,0
	db	3,4,32,0
	db	4,0xFF,32,0

d_283FC6	section	romdata abs=0x283FC6
FxScript_283FC6:
	db	103	; total ticks
	; ticks, frame, dx, dy
	db	0,7,44,-21
	db	0,7,30,45
	db	0,7,-39,42
	db	0,7,-66,-1
	db	4,7,-22,-50
	db	0,5,-26,-42
	db	0,5,39,-24
	db	0,5,-43,29
	db	0,7,-46,-34
	db	0,7,20,-39
	db	0,7,42,15
	db	0,7,-3,45
	db	0,6,25,-11
	db	0,6,22,33
	db	0,6,-28,29
	db	0,6,-41,-1
	db	4,6,-15,-32
	db	0,5,-35,20
	db	0,5,19,40
	db	0,5,21,-36
	db	0,6,-9,-19
	db	0,6,-22,-1
	db	0,6,-18,19
	db	0,6,14,22
	db	0,6,17,-8
	db	0,6,8,-21
	db	0,6,-32,-22
	db	0,6,-3,28
	db	3,6,32,10
	db	0,5,-5,-11
	db	0,5,-12,0
	db	0,5,-9,9
	db	0,5,6,10
	db	0,5,9,-3
	db	0,5,4,-10
	db	0,5,9,4
	db	0,5,-10,-7
	db	3,5,-1,13
	db	10,0xFF,-1,13
	db	3,6,-1,-1
	db	3,7,-1,-1
	db	4,8,-1,-1
	db	5,11,0,0
	db	3,7,0,0
	db	4,9,0,0
	db	3,6,-1,-1
	db	12,0xFF,0,1
	db	4,0,0,0
	db	6,1,0,-1
	db	7,2,0,-1
	db	0,11,-20,0
	db	0,11,20,0
	db	0,11,-1,-20
	db	0,11,0,20
	db	0,11,-15,-10
	db	0,11,15,-10
	db	0,11,-15,10
	db	0,11,15,10
	db	4,2,0,-1
	db	0,11,45,0
	db	0,11,-45,0
	db	0,11,-1,28
	db	0,11,-1,-28
	db	0,11,-25,-26
	db	0,11,25,-26
	db	0,11,25,26
	db	0,11,-25,26
	db	4,2,0,-1
	db	0,11,-70,0
	db	0,11,70,0
	db	0,11,40,40
	db	0,11,-40,40
	db	0,11,-40,-40
	db	0,11,40,-40
	db	4,2,0,-1
	db	7,2,0,-1
	db	3,1,0,1
	db	3,4,0,1

d_2840FF	section	romdata abs=0x2840FF
FxScript_2840FF:
	db	37	; total ticks
	; ticks, frame, dx, dy
	db	4,0,0,32
	db	3,1,0,32
	db	3,1,-1,32
	db	3,1,-1,32
	db	3,2,1,24
	db	3,2,0,24
	db	3,3,-1,16
	db	3,3,1,16
	db	12,4,0,16

d_284124	section	romdata abs=0x284124
BattleEffects:              ; effect id -> record
	dl	FxRecord_2747B0,FxRecord_2747B0,FxRecord_2747C4,FxRecord_2747D8
	dl	FxRecord_2747EC,FxRecord_2756D8,FxRecord_2756EC,FxRecord_275700
	dl	FxRecord_275714,FxRecord_2752A0,FxRecord_2752B4,FxRecord_2752C8
	dl	FxRecord_2752DC,FxRecord_274774,FxRecord_274788,FxRecord_274E04
	dl	FxRecord_274E18,FxRecord_274E2C,FxRecord_274E40,FxRecord_2754BC
	dl	FxRecord_2754D0,FxRecord_2754E4,FxRecord_2754F8,FxRecord_27550C
	dl	FxRecord_275520,FxRecord_275534,FxRecord_275548,FxRecord_27555C
	dl	FxRecord_275570,FxRecord_275584,FxRecord_275598,FxRecord_2755AC
	dl	FxRecord_2755C0,FxRecord_2755D4,FxRecord_2755E8,FxRecord_274F6C
	dl	FxRecord_274F80,FxRecord_274F94,FxRecord_274FA8,FxRecord_274FBC
	dl	FxRecord_274FD0,FxRecord_274FE4,FxRecord_274FF8,FxRecord_274940
	dl	FxRecord_274954,FxRecord_274968,FxRecord_27497C,FxRecord_2748A0
	dl	FxRecord_2748B4,FxRecord_2748C8,FxRecord_2748DC,FxRecord_275200
	dl	FxRecord_275214,FxRecord_275228,FxRecord_27523C,FxRecord_2746D4
	dl	FxRecord_2746E8,FxRecord_2746FC,FxRecord_274710,FxRecord_274D64
	dl	FxRecord_274D78,FxRecord_274D8C,FxRecord_274DA0,FxRecord_275124
	dl	FxRecord_275138,FxRecord_27514C,FxRecord_275160,FxRecord_274C9C
	dl	FxRecord_274CB0,FxRecord_274CC4,FxRecord_274CD8,FxRecord_274CEC
	dl	FxRecord_274D00,FxRecord_275728,FxRecord_27573C,FxRecord_275750
	dl	FxRecord_275764,FxRecord_275778,FxRecord_27578C,FxRecord_2757A0
	dl	FxRecord_2757B4,FxRecord_2757C8,FxRecord_27500C,FxRecord_275020
	dl	FxRecord_274AA8,FxRecord_274ABC,FxRecord_274AD0,FxRecord_274AE4
	dl	FxRecord_274AF8,FxRecord_274B0C,FxRecord_274B20,FxRecord_274B34
	dl	FxRecord_274B48,FxRecord_274B5C,FxRecord_274B70,FxRecord_274B84
	dl	FxRecord_27532C,FxRecord_275340,FxRecord_275354,FxRecord_275368
	dl	FxRecord_274A08,FxRecord_274A1C,FxRecord_274A30,FxRecord_274A44
	dl	FxRecord_2753F4,FxRecord_275408,FxRecord_27541C,FxRecord_275430
	dl	FxRecord_275660,FxRecord_274800,FxRecord_274814,FxRecord_274828
	dl	FxRecord_27483C,FxRecord_2755FC,FxRecord_275624,FxRecord_2753CC
	dl	FxRecord_274F44,FxRecord_2757DC,FxRecord_2757F0,FxRecord_275804
	dl	FxRecord_274C4C,FxRecord_274C60,FxRecord_274BAC,FxRecord_274BC0
	dl	FxRecord_274BD4,FxRecord_274BE8,FxRecord_275034,FxRecord_275048
	dl	FxRecord_27505C,FxRecord_275070,FxRecord_275084,FxRecord_275098
	dl	FxRecord_2750AC,FxRecord_2750C0,FxRecord_274E54,FxRecord_274E68
	dl	FxRecord_274E7C,FxRecord_274E90,FxRecord_274EA4,FxRecord_274EB8
	dl	FxRecord_274ECC,FxRecord_274EE0,FxRecord_274EF4,FxRecord_274F08
	dl	FxRecord_274F1C,FxRecord_274F30,FxRecord_275318,FxRecord_2749E0
	dl	FxRecord_275688,FxRecord_275688,FxRecord_275688,FxRecord_2751C4
	dl	FxRecord_275854,FxRecord_2746C0,FxRecord_27479C,FxRecord_2752F0
	dl	FxRecord_275818,FxRecord_2751D8,FxRecord_275840,FxRecord_274D50
	dl	FxRecord_2751EC,FxRecord_27569C,FxRecord_27569C,FxRecord_2754A8
	dl	FxRecord_274D14,FxRecord_274D3C,FxRecord_2756B0,FxRecord_274D28
	dl	FxRecord_275250,FxRecord_275264,FxRecord_275278,FxRecord_27528C
	dl	FxRecord_274724,FxRecord_274738,FxRecord_27474C,FxRecord_274760
	dl	FxRecord_274DB4,FxRecord_274DC8,FxRecord_274DDC,FxRecord_274DF0
	dl	FxRecord_275174,FxRecord_275188,FxRecord_27519C,FxRecord_2751B0
	dl	FxRecord_275674,FxRecord_274850,FxRecord_274864,FxRecord_274878
	dl	FxRecord_27488C,FxRecord_275610,FxRecord_275638,FxRecord_2753E0
	dl	FxRecord_274F58,FxRecord_274C74,FxRecord_274C88,FxRecord_274BFC
	dl	FxRecord_274C10,FxRecord_274C24,FxRecord_274C38,FxRecord_2750D4
	dl	FxRecord_2750E8,FxRecord_2750FC,FxRecord_275110,FxRecord_2756C4
	dl	FxRecord_275494,FxRecord_2749F4,FxRecord_2749F4,FxRecord_2749F4
	dl	FxRecord_274B98,FxRecord_27564C,FxRecord_27582C,FxRecord_275304
	dl	FxRecord_274990,FxRecord_2749A4,FxRecord_2749B8,FxRecord_2749CC
	dl	FxRecord_2748F0,FxRecord_274904,FxRecord_274918,FxRecord_27492C
	dl	FxRecord_27537C,FxRecord_275390,FxRecord_2753A4,FxRecord_2753B8
	dl	FxRecord_274A58,FxRecord_274A6C,FxRecord_274A80,FxRecord_274A94
	dl	FxRecord_275444,FxRecord_275458,FxRecord_27546C,FxRecord_275480
