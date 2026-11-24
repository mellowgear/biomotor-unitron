; data/battle_anims/battle_effects.s: battle effect data (tools/battle_fx.py; make extract
; rewrites it). Read by PlayBattleEffect through BattleEffects (effect id -> record).
; FxMono_* are the records' mono palettes: LoadMonoPalettes is called with A = 0xE and returns
; without loading (A >= 6), so their bytes are kept as plain data.

.org 0x2746C0
FxRecord_2746C0:
    .dl FxFrames_275868, FxTiles_279C3A, FxPal_280564, FxMono_280B10, FxScript_282A66

.org 0x2746D4
FxRecord_2746D4:
    .dl FxFrames_2758A0, FxTiles_27C747, FxPal_280604, FxMono_280B10, FxScript_280EDB

.org 0x2746E8
FxRecord_2746E8:
    .dl FxFrames_2758A0, FxTiles_27C747, FxPal_28060C, FxMono_280B10, FxScript_280EDB

.org 0x2746FC
FxRecord_2746FC:
    .dl FxFrames_2758A0, FxTiles_27C747, FxPal_280614, FxMono_280B10, FxScript_280EDB

.org 0x274710
FxRecord_274710:
    .dl FxFrames_2758A0, FxTiles_27C747, FxPal_28061C, FxMono_280B10, FxScript_280EDB

.org 0x274724
FxRecord_274724:
    .dl FxFrames_2758AC, FxTiles_27C747, FxPal_280604, FxMono_280B10, FxScript_282E0C

.org 0x274738
FxRecord_274738:
    .dl FxFrames_2758AC, FxTiles_27C747, FxPal_28060C, FxMono_280B10, FxScript_282E0C

.org 0x27474C
FxRecord_27474C:
    .dl FxFrames_2758AC, FxTiles_27C747, FxPal_280614, FxMono_280B10, FxScript_282E0C

.org 0x274760
FxRecord_274760:
    .dl FxFrames_2758AC, FxTiles_27C747, FxPal_28061C, FxMono_280B10, FxScript_282E0C

.org 0x274774
FxRecord_274774:
    .dl FxFrames_2758B8, FxTiles_27B14A, FxPal_280644, FxMono_280B10, FxScript_280ECA

.org 0x274788
FxRecord_274788:
    .dl FxFrames_2758C8, FxTiles_27F60E, FxPal_280644, FxMono_280B10, FxScript_2834C1

.org 0x27479C
FxRecord_27479C:
    .dl FxFrames_2758E0, FxTiles_27E953, FxPal_280AA4, FxMono_280B10, FxScript_281C76

.org 0x2747B0
FxRecord_2747B0:
    .dl FxFrames_2758FC, FxTiles_27B456, FxPal_280764, FxMono_280B10, FxScript_28156D

.org 0x2747C4
FxRecord_2747C4:
    .dl FxFrames_2758FC, FxTiles_27B456, FxPal_28076C, FxMono_280B10, FxScript_28156D

.org 0x2747D8
FxRecord_2747D8:
    .dl FxFrames_2758FC, FxTiles_27B456, FxPal_280774, FxMono_280B10, FxScript_28156D

.org 0x2747EC
FxRecord_2747EC:
    .dl FxFrames_2758FC, FxTiles_27B456, FxPal_28077C, FxMono_280B10, FxScript_28156D

.org 0x274800
FxRecord_274800:
    .dl FxFrames_275908, FxTiles_27AC58, FxPal_280664, FxMono_280B20, FxScript_28350F

.org 0x274814
FxRecord_274814:
    .dl FxFrames_275908, FxTiles_27AC58, FxPal_28066C, FxMono_280B20, FxScript_28350F

.org 0x274828
FxRecord_274828:
    .dl FxFrames_275908, FxTiles_27AC58, FxPal_280674, FxMono_280B20, FxScript_28350F

.org 0x27483C
FxRecord_27483C:
    .dl FxFrames_275908, FxTiles_27AC58, FxPal_28067C, FxMono_280B20, FxScript_28350F

.org 0x274850
FxRecord_274850:
    .dl FxFrames_27590C, FxTiles_27AC58, FxPal_280664, FxMono_280B20, FxScript_282302

.org 0x274864
FxRecord_274864:
    .dl FxFrames_27590C, FxTiles_27AC58, FxPal_28066C, FxMono_280B20, FxScript_282302

.org 0x274878
FxRecord_274878:
    .dl FxFrames_27590C, FxTiles_27AC58, FxPal_280674, FxMono_280B20, FxScript_282302

.org 0x27488C
FxRecord_27488C:
    .dl FxFrames_27590C, FxTiles_27AC58, FxPal_28067C, FxMono_280B20, FxScript_282302

.org 0x2748A0
FxRecord_2748A0:
    .dl FxFrames_275910, FxTiles_27C213, FxPal_2808C4, FxMono_280B0C, FxScript_2837F8

.org 0x2748B4
FxRecord_2748B4:
    .dl FxFrames_275910, FxTiles_27C213, FxPal_2808CC, FxMono_280B0C, FxScript_2837F8

.org 0x2748C8
FxRecord_2748C8:
    .dl FxFrames_275910, FxTiles_27C213, FxPal_2808D4, FxMono_280B0C, FxScript_2837F8

.org 0x2748DC
FxRecord_2748DC:
    .dl FxFrames_275910, FxTiles_27C213, FxPal_2808DC, FxMono_280B0C, FxScript_2837F8

.org 0x2748F0
FxRecord_2748F0:
    .dl FxFrames_275930, FxTiles_27C213, FxPal_2808C4, FxMono_280B0C, FxScript_283387

.org 0x274904
FxRecord_274904:
    .dl FxFrames_275930, FxTiles_27C213, FxPal_2808CC, FxMono_280B0C, FxScript_283387

.org 0x274918
FxRecord_274918:
    .dl FxFrames_275930, FxTiles_27C213, FxPal_2808D4, FxMono_280B0C, FxScript_283387

.org 0x27492C
FxRecord_27492C:
    .dl FxFrames_275930, FxTiles_27C213, FxPal_2808DC, FxMono_280B0C, FxScript_283387

.org 0x274940
FxRecord_274940:
    .dl FxFrames_275950, FxTiles_27C213, FxPal_2808C4, FxMono_280B0C, FxScript_2832BE

.org 0x274954
FxRecord_274954:
    .dl FxFrames_275950, FxTiles_27C213, FxPal_2808CC, FxMono_280B0C, FxScript_2832BE

.org 0x274968
FxRecord_274968:
    .dl FxFrames_275950, FxTiles_27C213, FxPal_2808D4, FxMono_280B0C, FxScript_2832BE

.org 0x27497C
FxRecord_27497C:
    .dl FxFrames_275950, FxTiles_27C213, FxPal_2808DC, FxMono_280B0C, FxScript_2832BE

.org 0x274990
FxRecord_274990:
    .dl FxFrames_275970, FxTiles_27C213, FxPal_2808C4, FxMono_280B0C, FxScript_2836DD

.org 0x2749A4
FxRecord_2749A4:
    .dl FxFrames_275970, FxTiles_27C213, FxPal_2808CC, FxMono_280B0C, FxScript_2836DD

.org 0x2749B8
FxRecord_2749B8:
    .dl FxFrames_275970, FxTiles_27C213, FxPal_2808D4, FxMono_280B0C, FxScript_2836DD

.org 0x2749CC
FxRecord_2749CC:
    .dl FxFrames_275970, FxTiles_27C213, FxPal_2808DC, FxMono_280B0C, FxScript_2836DD

.org 0x2749E0
FxRecord_2749E0:
    .dl FxFrames_275990, FxTiles_27D227, FxPal_280504, FxMono_280B10, FxScript_280CA7

.org 0x2749F4
FxRecord_2749F4:
    .dl FxFrames_2759B8, FxTiles_27DB30, FxPal_2807C4, FxMono_280B1C, FxScript_283C68

.org 0x274A08
FxRecord_274A08:
    .dl FxFrames_2759C8, FxTiles_27F506, FxPal_280684, FxMono_280B10, FxScript_283CFD

.org 0x274A1C
FxRecord_274A1C:
    .dl FxFrames_2759C8, FxTiles_27F506, FxPal_28068C, FxMono_280B10, FxScript_283CFD

.org 0x274A30
FxRecord_274A30:
    .dl FxFrames_2759C8, FxTiles_27F506, FxPal_280694, FxMono_280B10, FxScript_283CFD

.org 0x274A44
FxRecord_274A44:
    .dl FxFrames_2759C8, FxTiles_27F506, FxPal_28069C, FxMono_280B10, FxScript_283CFD

.org 0x274A58
FxRecord_274A58:
    .dl FxFrames_2759EC, FxTiles_27F506, FxPal_280684, FxMono_280B10, FxScript_283F95

.org 0x274A6C
FxRecord_274A6C:
    .dl FxFrames_2759EC, FxTiles_27F506, FxPal_28068C, FxMono_280B10, FxScript_283F95

.org 0x274A80
FxRecord_274A80:
    .dl FxFrames_2759EC, FxTiles_27F506, FxPal_280694, FxMono_280B10, FxScript_283F95

.org 0x274A94
FxRecord_274A94:
    .dl FxFrames_2759EC, FxTiles_27F506, FxPal_28069C, FxMono_280B10, FxScript_283F95

.org 0x274AA8
FxRecord_274AA8:
    .dl FxFrames_275A10, FxTiles_27FB33, FxPal_280544, FxMono_280B10, FxScript_281C45

.org 0x274ABC
FxRecord_274ABC:
    .dl FxFrames_275A10, FxTiles_27FB33, FxPal_28054C, FxMono_280B10, FxScript_281C45

.org 0x274AD0
FxRecord_274AD0:
    .dl FxFrames_275A10, FxTiles_27FB33, FxPal_280554, FxMono_280B10, FxScript_281C45

.org 0x274AE4
FxRecord_274AE4:
    .dl FxFrames_275A10, FxTiles_27FB33, FxPal_28055C, FxMono_280B10, FxScript_281C45

.org 0x274AF8
FxRecord_274AF8:
    .dl FxFrames_275A30, FxTiles_27FB33, FxPal_280544, FxMono_280B10, FxScript_282009

.org 0x274B0C
FxRecord_274B0C:
    .dl FxFrames_275A30, FxTiles_27FB33, FxPal_28054C, FxMono_280B10, FxScript_282009

.org 0x274B20
FxRecord_274B20:
    .dl FxFrames_275A30, FxTiles_27FB33, FxPal_280554, FxMono_280B10, FxScript_282009

.org 0x274B34
FxRecord_274B34:
    .dl FxFrames_275A30, FxTiles_27FB33, FxPal_28055C, FxMono_280B10, FxScript_282009

.org 0x274B48
FxRecord_274B48:
    .dl FxFrames_275A70, FxTiles_27FB33, FxPal_280544, FxMono_280B10, FxScript_28267E

.org 0x274B5C
FxRecord_274B5C:
    .dl FxFrames_275A70, FxTiles_27FB33, FxPal_28054C, FxMono_280B10, FxScript_28267E

.org 0x274B70
FxRecord_274B70:
    .dl FxFrames_275A70, FxTiles_27FB33, FxPal_280554, FxMono_280B10, FxScript_28267E

.org 0x274B84
FxRecord_274B84:
    .dl FxFrames_275A70, FxTiles_27FB33, FxPal_28055C, FxMono_280B10, FxScript_28267E

.org 0x274B98
FxRecord_274B98:
    .dl FxFrames_275AB0, FxTiles_27AC3C, FxPal_2807C4, FxMono_280B1C, FxScript_283200

.org 0x274BAC
FxRecord_274BAC:
    .dl FxFrames_275ABC, FxTiles_27C2E9, FxPal_2806A4, FxMono_280B10, FxScript_281E89

.org 0x274BC0
FxRecord_274BC0:
    .dl FxFrames_275ABC, FxTiles_27C2E9, FxPal_2806AC, FxMono_280B10, FxScript_281E89

.org 0x274BD4
FxRecord_274BD4:
    .dl FxFrames_275ABC, FxTiles_27C2E9, FxPal_2806B4, FxMono_280B10, FxScript_281E89

.org 0x274BE8
FxRecord_274BE8:
    .dl FxFrames_275ABC, FxTiles_27C2E9, FxPal_2806BC, FxMono_280B10, FxScript_281E89

.org 0x274BFC
FxRecord_274BFC:
    .dl FxFrames_275ACC, FxTiles_27C2E9, FxPal_2806A4, FxMono_280B10, FxScript_28137D

.org 0x274C10
FxRecord_274C10:
    .dl FxFrames_275ACC, FxTiles_27C2E9, FxPal_2806AC, FxMono_280B10, FxScript_28137D

.org 0x274C24
FxRecord_274C24:
    .dl FxFrames_275ACC, FxTiles_27C2E9, FxPal_2806B4, FxMono_280B10, FxScript_28137D

.org 0x274C38
FxRecord_274C38:
    .dl FxFrames_275ACC, FxTiles_27C2E9, FxPal_2806BC, FxMono_280B10, FxScript_28137D

.org 0x274C4C
FxRecord_274C4C:
    .dl FxFrames_275ADC, FxTiles_27C299, FxPal_2807A4, FxMono_280B24, FxScript_281618

.org 0x274C60
FxRecord_274C60:
    .dl FxFrames_275ADC, FxTiles_27C299, FxPal_2807AC, FxMono_280B24, FxScript_281618

.org 0x274C74
FxRecord_274C74:
    .dl FxFrames_275AE0, FxTiles_27C299, FxPal_2807A4, FxMono_280B24, FxScript_283089

.org 0x274C88
FxRecord_274C88:
    .dl FxFrames_275AE0, FxTiles_27C299, FxPal_2807AC, FxMono_280B24, FxScript_283089

.org 0x274C9C
FxRecord_274C9C:
    .dl FxFrames_275AE4, FxTiles_27D373, FxPal_2809A4, FxMono_280B20, FxScript_2830FA

.org 0x274CB0
FxRecord_274CB0:
    .dl FxFrames_275AE4, FxTiles_27D373, FxPal_2809AC, FxMono_280B20, FxScript_2830FA

.org 0x274CC4
FxRecord_274CC4:
    .dl FxFrames_275B00, FxTiles_27F2F6, FxPal_280864, FxMono_280B10, FxScript_2820D3

.org 0x274CD8
FxRecord_274CD8:
    .dl FxFrames_275B00, FxTiles_27F2F6, FxPal_28086C, FxMono_280B10, FxScript_2820D3

.org 0x274CEC
FxRecord_274CEC:
    .dl FxFrames_275B20, FxTiles_27C398, FxPal_280864, FxMono_280B10, FxScript_281AD0

.org 0x274D00
FxRecord_274D00:
    .dl FxFrames_275B20, FxTiles_27C398, FxPal_28086C, FxMono_280B10, FxScript_281AD0

.org 0x274D14
FxRecord_274D14:
    .dl FxFrames_275B60, FxTiles_279F62, FxPal_280A04, FxMono_280B10, FxScript_282420

.org 0x274D28
FxRecord_274D28:
    .dl FxFrames_275B8C, FxTiles_279F62, FxPal_280A04, FxMono_280B10, FxScript_280B30

.org 0x274D3C
FxRecord_274D3C:
    .dl FxFrames_275BC4, FxTiles_27E4B0, FxPal_280584, FxMono_280B10, FxScript_282E21

.org 0x274D50
FxRecord_274D50:
    .dl FxFrames_275C08, FxTiles_27E6EF, FxPal_280A84, FxMono_280B10, FxScript_283E37

.org 0x274D64
FxRecord_274D64:
    .dl FxFrames_275C18, FxTiles_27C8C3, FxPal_280604, FxMono_280B10, FxScript_281530

.org 0x274D78
FxRecord_274D78:
    .dl FxFrames_275C18, FxTiles_27C8C3, FxPal_28060C, FxMono_280B10, FxScript_281530

.org 0x274D8C
FxRecord_274D8C:
    .dl FxFrames_275C18, FxTiles_27C8C3, FxPal_280614, FxMono_280B10, FxScript_281530

.org 0x274DA0
FxRecord_274DA0:
    .dl FxFrames_275C18, FxTiles_27C8C3, FxPal_28061C, FxMono_280B10, FxScript_281530

.org 0x274DB4
FxRecord_274DB4:
    .dl FxFrames_275C24, FxTiles_27C8C3, FxPal_280604, FxMono_280B10, FxScript_282627

.org 0x274DC8
FxRecord_274DC8:
    .dl FxFrames_275C24, FxTiles_27C8C3, FxPal_28060C, FxMono_280B10, FxScript_282627

.org 0x274DDC
FxRecord_274DDC:
    .dl FxFrames_275C24, FxTiles_27C8C3, FxPal_280614, FxMono_280B10, FxScript_282627

.org 0x274DF0
FxRecord_274DF0:
    .dl FxFrames_275C24, FxTiles_27C8C3, FxPal_28061C, FxMono_280B10, FxScript_282627

.org 0x274E04
FxRecord_274E04:
    .dl FxFrames_275C30, FxTiles_27DB4A, FxPal_2809C4, FxMono_280B10, FxScript_280C76

.org 0x274E18
FxRecord_274E18:
    .dl FxFrames_275C30, FxTiles_27DB4A, FxPal_2809CC, FxMono_280B10, FxScript_280C76

.org 0x274E2C
FxRecord_274E2C:
    .dl FxFrames_275C30, FxTiles_27DB4A, FxPal_2809D4, FxMono_280B10, FxScript_280C76

.org 0x274E40
FxRecord_274E40:
    .dl FxFrames_275C30, FxTiles_27DB4A, FxPal_2809DC, FxMono_280B10, FxScript_280C76

.org 0x274E54
FxRecord_274E54:
    .dl FxFrames_275C48, FxTiles_27C213, FxPal_2808C4, FxMono_280B0C, FxScript_28237F

.org 0x274E68
FxRecord_274E68:
    .dl FxFrames_275C48, FxTiles_27C213, FxPal_2808CC, FxMono_280B0C, FxScript_28237F

.org 0x274E7C
FxRecord_274E7C:
    .dl FxFrames_275C48, FxTiles_27C213, FxPal_2808D4, FxMono_280B0C, FxScript_28237F

.org 0x274E90
FxRecord_274E90:
    .dl FxFrames_275C48, FxTiles_27C213, FxPal_2808DC, FxMono_280B0C, FxScript_28237F

.org 0x274EA4
FxRecord_274EA4:
    .dl FxFrames_275C68, FxTiles_27C213, FxPal_2808C4, FxMono_280B0C, FxScript_283D2E

.org 0x274EB8
FxRecord_274EB8:
    .dl FxFrames_275C68, FxTiles_27C213, FxPal_2808CC, FxMono_280B0C, FxScript_283D2E

.org 0x274ECC
FxRecord_274ECC:
    .dl FxFrames_275C68, FxTiles_27C213, FxPal_2808D4, FxMono_280B0C, FxScript_283D2E

.org 0x274EE0
FxRecord_274EE0:
    .dl FxFrames_275C68, FxTiles_27C213, FxPal_2808DC, FxMono_280B0C, FxScript_283D2E

.org 0x274EF4
FxRecord_274EF4:
    .dl FxFrames_275C88, FxTiles_27C213, FxPal_2808C4, FxMono_280B0C, FxScript_282BEB

.org 0x274F08
FxRecord_274F08:
    .dl FxFrames_275C88, FxTiles_27C213, FxPal_2808CC, FxMono_280B0C, FxScript_282BEB

.org 0x274F1C
FxRecord_274F1C:
    .dl FxFrames_275C88, FxTiles_27C213, FxPal_2808D4, FxMono_280B0C, FxScript_282BEB

.org 0x274F30
FxRecord_274F30:
    .dl FxFrames_275C88, FxTiles_27C213, FxPal_2808DC, FxMono_280B0C, FxScript_282BEB

.org 0x274F44
FxRecord_274F44:
    .dl FxFrames_275CA8, FxTiles_27F220, FxPal_280704, FxMono_280B10, FxScript_282848

.org 0x274F58
FxRecord_274F58:
    .dl FxFrames_275CAC, FxTiles_27F220, FxPal_280704, FxMono_280B10, FxScript_280EF0

.org 0x274F6C
FxRecord_274F6C:
    .dl FxFrames_275CB0, FxTiles_27DE8E, FxPal_280AC4, FxMono_280B10, FxScript_282F2A

.org 0x274F80
FxRecord_274F80:
    .dl FxFrames_275CB0, FxTiles_27DE8E, FxPal_280ACC, FxMono_280B10, FxScript_282F2A

.org 0x274F94
FxRecord_274F94:
    .dl FxFrames_275CB0, FxTiles_27DE8E, FxPal_280AD4, FxMono_280B10, FxScript_282F2A

.org 0x274FA8
FxRecord_274FA8:
    .dl FxFrames_275CB0, FxTiles_27DE8E, FxPal_280ADC, FxMono_280B10, FxScript_282F2A

.org 0x274FBC
FxRecord_274FBC:
    .dl FxFrames_275CC0, FxTiles_27DE8E, FxPal_280AC4, FxMono_280B10, FxScript_2827C3

.org 0x274FD0
FxRecord_274FD0:
    .dl FxFrames_275CC0, FxTiles_27DE8E, FxPal_280ACC, FxMono_280B10, FxScript_2827C3

.org 0x274FE4
FxRecord_274FE4:
    .dl FxFrames_275CC0, FxTiles_27DE8E, FxPal_280AD4, FxMono_280B10, FxScript_2827C3

.org 0x274FF8
FxRecord_274FF8:
    .dl FxFrames_275CC0, FxTiles_27DE8E, FxPal_280ADC, FxMono_280B10, FxScript_2827C3

.org 0x27500C
FxRecord_27500C:
    .dl FxFrames_275CD0, FxTiles_27A3E7, FxPal_280A24, FxMono_280B28, FxScript_28346C

.org 0x275020
FxRecord_275020:
    .dl FxFrames_275D00, FxTiles_27A3E7, FxPal_280A24, FxMono_280B28, FxScript_282881

.org 0x275034
FxRecord_275034:
    .dl FxFrames_275D40, FxTiles_27D91B, FxPal_280784, FxMono_280B20, FxScript_281282

.org 0x275048
FxRecord_275048:
    .dl FxFrames_275D40, FxTiles_27D91B, FxPal_28078C, FxMono_280B20, FxScript_281282

.org 0x27505C
FxRecord_27505C:
    .dl FxFrames_275D40, FxTiles_27D91B, FxPal_280794, FxMono_280B20, FxScript_281282

.org 0x275070
FxRecord_275070:
    .dl FxFrames_275D40, FxTiles_27D91B, FxPal_28079C, FxMono_280B20, FxScript_281282

.org 0x275084
FxRecord_275084:
    .dl FxFrames_275D54, FxTiles_27E78F, FxPal_280884, FxMono_280B10, FxScript_281433

.org 0x275098
FxRecord_275098:
    .dl FxFrames_275D54, FxTiles_27E78F, FxPal_28088C, FxMono_280B10, FxScript_281433

.org 0x2750AC
FxRecord_2750AC:
    .dl FxFrames_275D54, FxTiles_27E78F, FxPal_280894, FxMono_280B10, FxScript_281433

.org 0x2750C0
FxRecord_2750C0:
    .dl FxFrames_275D54, FxTiles_27E78F, FxPal_28089C, FxMono_280B10, FxScript_281433

.org 0x2750D4
FxRecord_2750D4:
    .dl FxFrames_275D94, FxTiles_27E78F, FxPal_280884, FxMono_280B10, FxScript_2835B0

.org 0x2750E8
FxRecord_2750E8:
    .dl FxFrames_275D94, FxTiles_27E78F, FxPal_28088C, FxMono_280B10, FxScript_2835B0

.org 0x2750FC
FxRecord_2750FC:
    .dl FxFrames_275D94, FxTiles_27E78F, FxPal_280894, FxMono_280B10, FxScript_2835B0

.org 0x275110
FxRecord_275110:
    .dl FxFrames_275D94, FxTiles_27E78F, FxPal_28089C, FxMono_280B10, FxScript_2835B0

.org 0x275124
FxRecord_275124:
    .dl FxFrames_275DD4, FxTiles_27A92E, FxPal_280604, FxMono_280B10, FxScript_2837A6

.org 0x275138
FxRecord_275138:
    .dl FxFrames_275DD4, FxTiles_27A92E, FxPal_28060C, FxMono_280B10, FxScript_2837A6

.org 0x27514C
FxRecord_27514C:
    .dl FxFrames_275DD4, FxTiles_27A92E, FxPal_280614, FxMono_280B10, FxScript_2837A6

.org 0x275160
FxRecord_275160:
    .dl FxFrames_275DD4, FxTiles_27A92E, FxPal_28061C, FxMono_280B10, FxScript_2837A6

.org 0x275174
FxRecord_275174:
    .dl FxFrames_275DE0, FxTiles_27A92E, FxPal_280604, FxMono_280B10, FxScript_281364

.org 0x275188
FxRecord_275188:
    .dl FxFrames_275DE0, FxTiles_27A92E, FxPal_28060C, FxMono_280B10, FxScript_281364

.org 0x27519C
FxRecord_27519C:
    .dl FxFrames_275DE0, FxTiles_27A92E, FxPal_280614, FxMono_280B10, FxScript_281364

.org 0x2751B0
FxRecord_2751B0:
    .dl FxFrames_275DE0, FxTiles_27A92E, FxPal_28061C, FxMono_280B10, FxScript_281364

.org 0x2751C4
FxRecord_2751C4:
    .dl FxFrames_275DEC, FxTiles_27B32B, FxPal_280724, FxMono_280B10, FxScript_281CC3

.org 0x2751D8
FxRecord_2751D8:
    .dl FxFrames_275E14, FxTiles_27EBE6, FxPal_280A44, FxMono_280B10, FxScript_2824CD

.org 0x2751EC
FxRecord_2751EC:
    .dl FxFrames_275E38, FxTiles_27DA68, FxPal_280804, FxMono_280B08, FxScript_2817F1

.org 0x275200
FxRecord_275200:
    .dl FxFrames_275E4C, FxTiles_27BAD5, FxPal_280604, FxMono_280B10, FxScript_2817B4

.org 0x275214
FxRecord_275214:
    .dl FxFrames_275E4C, FxTiles_27BAD5, FxPal_28060C, FxMono_280B10, FxScript_2817B4

.org 0x275228
FxRecord_275228:
    .dl FxFrames_275E4C, FxTiles_27BAD5, FxPal_280614, FxMono_280B10, FxScript_2817B4

.org 0x27523C
FxRecord_27523C:
    .dl FxFrames_275E4C, FxTiles_27BAD5, FxPal_28061C, FxMono_280B10, FxScript_2817B4

.org 0x275250
FxRecord_275250:
    .dl FxFrames_275E5C, FxTiles_27BAD5, FxPal_280604, FxMono_280B10, FxScript_282148

.org 0x275264
FxRecord_275264:
    .dl FxFrames_275E5C, FxTiles_27BAD5, FxPal_28060C, FxMono_280B10, FxScript_282148

.org 0x275278
FxRecord_275278:
    .dl FxFrames_275E5C, FxTiles_27BAD5, FxPal_280614, FxMono_280B10, FxScript_282148

.org 0x27528C
FxRecord_27528C:
    .dl FxFrames_275E5C, FxTiles_27BAD5, FxPal_28061C, FxMono_280B10, FxScript_282148

.org 0x2752A0
FxRecord_2752A0:
    .dl FxFrames_275E6C, FxTiles_27F2AA, FxPal_280744, FxMono_280B08, FxScript_2818BB

.org 0x2752B4
FxRecord_2752B4:
    .dl FxFrames_275E6C, FxTiles_27F2AA, FxPal_28074C, FxMono_280B08, FxScript_2818BB

.org 0x2752C8
FxRecord_2752C8:
    .dl FxFrames_275E6C, FxTiles_27F2AA, FxPal_280754, FxMono_280B08, FxScript_2818BB

.org 0x2752DC
FxRecord_2752DC:
    .dl FxFrames_275E6C, FxTiles_27F2AA, FxPal_28075C, FxMono_280B08, FxScript_2818BB

.org 0x2752F0
FxRecord_2752F0:
    .dl FxFrames_275E9C, FxTiles_27FD38, FxPal_280944, FxMono_280B18, FxScript_280F25

.org 0x275304
FxRecord_275304:
    .dl FxFrames_275EC8, FxTiles_27F4E7, FxPal_2807C4, FxMono_280B1C, FxScript_282F73

.org 0x275318
FxRecord_275318:
    .dl FxFrames_275ED4, FxTiles_27C62B, FxPal_280984, FxMono_280B10, FxScript_2824F6

.org 0x27532C
FxRecord_27532C:
    .dl FxFrames_275F00, FxTiles_28027B, FxPal_280A64, FxMono_280B10, FxScript_2838DD

.org 0x275340
FxRecord_275340:
    .dl FxFrames_275F00, FxTiles_28027B, FxPal_280A6C, FxMono_280B10, FxScript_2838DD

.org 0x275354
FxRecord_275354:
    .dl FxFrames_275F00, FxTiles_28027B, FxPal_280A74, FxMono_280B10, FxScript_2838DD

.org 0x275368
FxRecord_275368:
    .dl FxFrames_275F00, FxTiles_28027B, FxPal_280A7C, FxMono_280B10, FxScript_2838DD

.org 0x27537C
FxRecord_27537C:
    .dl FxFrames_275F18, FxTiles_28027B, FxPal_280A64, FxMono_280B10, FxScript_2834DA

.org 0x275390
FxRecord_275390:
    .dl FxFrames_275F18, FxTiles_28027B, FxPal_280A6C, FxMono_280B10, FxScript_2834DA

.org 0x2753A4
FxRecord_2753A4:
    .dl FxFrames_275F18, FxTiles_28027B, FxPal_280A74, FxMono_280B10, FxScript_2834DA

.org 0x2753B8
FxRecord_2753B8:
    .dl FxFrames_275F18, FxTiles_28027B, FxPal_280A7C, FxMono_280B10, FxScript_2834DA

.org 0x2753CC
FxRecord_2753CC:
    .dl FxFrames_275F30, FxTiles_27FAEF, FxPal_2806E4, FxMono_280B18, FxScript_282848

.org 0x2753E0
FxRecord_2753E0:
    .dl FxFrames_275F34, FxTiles_27FAEF, FxPal_2806E4, FxMono_280B18, FxScript_280EF0

.org 0x2753F4
FxRecord_2753F4:
    .dl FxFrames_275F38, FxTiles_28027B, FxPal_280A64, FxMono_280B10, FxScript_2837C7

.org 0x275408
FxRecord_275408:
    .dl FxFrames_275F38, FxTiles_28027B, FxPal_280A6C, FxMono_280B10, FxScript_2837C7

.org 0x27541C
FxRecord_27541C:
    .dl FxFrames_275F38, FxTiles_28027B, FxPal_280A74, FxMono_280B10, FxScript_2837C7

.org 0x275430
FxRecord_275430:
    .dl FxFrames_275F38, FxTiles_28027B, FxPal_280A7C, FxMono_280B10, FxScript_2837C7

.org 0x275444
FxRecord_275444:
    .dl FxFrames_275F50, FxTiles_28027B, FxPal_280A64, FxMono_280B10, FxScript_283912

.org 0x275458
FxRecord_275458:
    .dl FxFrames_275F50, FxTiles_28027B, FxPal_280A6C, FxMono_280B10, FxScript_283912

.org 0x27546C
FxRecord_27546C:
    .dl FxFrames_275F50, FxTiles_28027B, FxPal_280A74, FxMono_280B10, FxScript_283912

.org 0x275480
FxRecord_275480:
    .dl FxFrames_275F50, FxTiles_28027B, FxPal_280A7C, FxMono_280B10, FxScript_283912

.org 0x275494
FxRecord_275494:
    .dl FxFrames_275F68, FxTiles_27B14A, FxPal_280644, FxMono_280B10, FxScript_2815EB

.org 0x2754A8
FxRecord_2754A8:
    .dl FxFrames_275F78, FxTiles_27B681, FxPal_280824, FxMono_280B10, FxScript_2840FF

.org 0x2754BC
FxRecord_2754BC:
    .dl FxFrames_275F8C, FxTiles_27CB47, FxPal_2806C4, FxMono_280B10, FxScript_281635

.org 0x2754D0
FxRecord_2754D0:
    .dl FxFrames_275F8C, FxTiles_27CB47, FxPal_2806CC, FxMono_280B10, FxScript_281635

.org 0x2754E4
FxRecord_2754E4:
    .dl FxFrames_275F8C, FxTiles_27CB47, FxPal_2806D4, FxMono_280B10, FxScript_281635

.org 0x2754F8
FxRecord_2754F8:
    .dl FxFrames_275F8C, FxTiles_27CB47, FxPal_2806DC, FxMono_280B10, FxScript_281635

.org 0x27550C
FxRecord_27550C:
    .dl FxFrames_275F98, FxTiles_27C044, FxPal_280524, FxMono_280B10, FxScript_281F8F

.org 0x275520
FxRecord_275520:
    .dl FxFrames_275F98, FxTiles_27C044, FxPal_28052C, FxMono_280B10, FxScript_281F8F

.org 0x275534
FxRecord_275534:
    .dl FxFrames_275F98, FxTiles_27C044, FxPal_280534, FxMono_280B10, FxScript_281F8F

.org 0x275548
FxRecord_275548:
    .dl FxFrames_275F98, FxTiles_27C044, FxPal_28053C, FxMono_280B10, FxScript_281F8F

.org 0x27555C
FxRecord_27555C:
    .dl FxFrames_275FAC, FxTiles_27E22F, FxPal_2805A4, FxMono_280B10, FxScript_283F88

.org 0x275570
FxRecord_275570:
    .dl FxFrames_275FAC, FxTiles_27E22F, FxPal_2805AC, FxMono_280B10, FxScript_283F88

.org 0x275584
FxRecord_275584:
    .dl FxFrames_275FAC, FxTiles_27E22F, FxPal_2805B4, FxMono_280B10, FxScript_283F88

.org 0x275598
FxRecord_275598:
    .dl FxFrames_275FAC, FxTiles_27E22F, FxPal_2805BC, FxMono_280B10, FxScript_283F88

.org 0x2755AC
FxRecord_2755AC:
    .dl FxFrames_275FB8, FxTiles_27BB5F, FxPal_2804E4, FxMono_280B10, FxScript_2818A2

.org 0x2755C0
FxRecord_2755C0:
    .dl FxFrames_275FB8, FxTiles_27BB5F, FxPal_2804EC, FxMono_280B10, FxScript_2818A2

.org 0x2755D4
FxRecord_2755D4:
    .dl FxFrames_275FB8, FxTiles_27BB5F, FxPal_2804F4, FxMono_280B10, FxScript_2818A2

.org 0x2755E8
FxRecord_2755E8:
    .dl FxFrames_275FB8, FxTiles_27BB5F, FxPal_2804FC, FxMono_280B10, FxScript_2818A2

.org 0x2755FC
FxRecord_2755FC:
    .dl FxFrames_275FCC, FxTiles_27B064, FxPal_280924, FxMono_280B2C, FxScript_28265D

.org 0x275610
FxRecord_275610:
    .dl FxFrames_275FD0, FxTiles_27B064, FxPal_280924, FxMono_280B2C, FxScript_281797

.org 0x275624
FxRecord_275624:
    .dl FxFrames_275FD4, FxTiles_27ABDC, FxPal_280964, FxMono_280B04, FxScript_281FA4

.org 0x275638
FxRecord_275638:
    .dl FxFrames_275FDC, FxTiles_27ABDC, FxPal_280964, FxMono_280B04, FxScript_280BD1

.org 0x27564C
FxRecord_27564C:
    .dl FxFrames_275FE4, FxTiles_27CB28, FxPal_2807C4, FxMono_280B1C, FxScript_282062

.org 0x275660
FxRecord_275660:
    .dl FxFrames_275FF0, FxTiles_27E1E2, FxPal_280904, FxMono_280B14, FxScript_280E15

.org 0x275674
FxRecord_275674:
    .dl FxFrames_275FF4, FxTiles_27E1E2, FxPal_280904, FxMono_280B14, FxScript_281396

.org 0x275688
FxRecord_275688:
    .dl FxFrames_275FF8, FxTiles_27A9B3, FxPal_2805E4, FxMono_280B24, FxScript_280E00

.org 0x27569C
FxRecord_27569C:
    .dl FxFrames_27600C, FxTiles_27DF04, FxPal_2809E4, FxMono_280B10, FxScript_282FE4

.org 0x2756B0
FxRecord_2756B0:
    .dl FxFrames_276028, FxTiles_27F262, FxPal_280884, FxMono_280B10, FxScript_281642

.org 0x2756C4
FxRecord_2756C4:
    .dl FxFrames_276048, FxTiles_27FCF0, FxPal_280884, FxMono_280B10, FxScript_282165

.org 0x2756D8
FxRecord_2756D8:
    .dl FxFrames_276068, FxTiles_28034F, FxPal_280844, FxMono_280B10, FxScript_282644

.org 0x2756EC
FxRecord_2756EC:
    .dl FxFrames_276068, FxTiles_28034F, FxPal_28084C, FxMono_280B10, FxScript_282644

.org 0x275700
FxRecord_275700:
    .dl FxFrames_276068, FxTiles_28034F, FxPal_280854, FxMono_280B10, FxScript_282644

.org 0x275714
FxRecord_275714:
    .dl FxFrames_276068, FxTiles_28034F, FxPal_28085C, FxMono_280B10, FxScript_282644

.org 0x275728
FxRecord_275728:
    .dl FxFrames_276080, FxTiles_27ED3D, FxPal_2807E4, FxMono_280B20, FxScript_281E48

.org 0x27573C
FxRecord_27573C:
    .dl FxFrames_276080, FxTiles_27ED3D, FxPal_2807EC, FxMono_280B20, FxScript_281E48

.org 0x275750
FxRecord_275750:
    .dl FxFrames_276080, FxTiles_27ED3D, FxPal_2807F4, FxMono_280B20, FxScript_281E48

.org 0x275764
FxRecord_275764:
    .dl FxFrames_2760A0, FxTiles_27CD18, FxPal_280624, FxMono_280B10, FxScript_283271

.org 0x275778
FxRecord_275778:
    .dl FxFrames_2760A0, FxTiles_27CD18, FxPal_28062C, FxMono_280B10, FxScript_283271

.org 0x27578C
FxRecord_27578C:
    .dl FxFrames_2760A0, FxTiles_27CD18, FxPal_280634, FxMono_280B10, FxScript_283271

.org 0x2757A0
FxRecord_2757A0:
    .dl FxFrames_2760CC, FxTiles_27ACA0, FxPal_280624, FxMono_280B10, FxScript_281297

.org 0x2757B4
FxRecord_2757B4:
    .dl FxFrames_2760CC, FxTiles_27ACA0, FxPal_28062C, FxMono_280B10, FxScript_281297

.org 0x2757C8
FxRecord_2757C8:
    .dl FxFrames_2760CC, FxTiles_27ACA0, FxPal_280634, FxMono_280B10, FxScript_281297

.org 0x2757DC
FxRecord_2757DC:
    .dl FxFrames_27611C, FxTiles_27FDF3, FxPal_2808E4, FxMono_280B24, FxScript_281F0E

.org 0x2757F0
FxRecord_2757F0:
    .dl FxFrames_27611C, FxTiles_27FDF3, FxPal_2808EC, FxMono_280B24, FxScript_281F0E

.org 0x275804
FxRecord_275804:
    .dl FxFrames_27611C, FxTiles_27FDF3, FxPal_2808F4, FxMono_280B24, FxScript_281F0E

.org 0x275818
FxRecord_275818:
    .dl FxFrames_276124, FxTiles_27C935, FxPal_280AE4, FxMono_280B10, FxScript_283943

.org 0x27582C
FxRecord_27582C:
    .dl FxFrames_276174, FxTiles_27B43A, FxPal_2807C4, FxMono_280B1C, FxScript_28157A

.org 0x275840
FxRecord_275840:
    .dl FxFrames_276180, FxTiles_27D0A8, FxPal_2805C4, FxMono_280B10, FxScript_28314B

.org 0x275854
FxRecord_275854:
    .dl FxFrames_27618C, FxTiles_27C7B6, FxPal_2808A4, FxMono_280B10, FxScript_283FC6

.org 0x275868
FxFrames_275868:
    .dl FxFrame_2775FC
    .dl FxFrame_27848A
    .dl FxFrame_277798
    .dl FxFrame_276EA6
    .dl FxFrame_278554
    .dl FxFrame_276748
    .dl FxFrame_2781D0
    .dl FxFrame_279404
    .dl FxFrame_277244
    .dl FxFrame_2799CA
    .dl FxFrame_2776F6
    .dl FxFrame_2793E8
    .dl FxFrame_279A7C
    .dl FxFrame_27688E

.org 0x2758A0
FxFrames_2758A0:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_276C3A

.org 0x2758AC
FxFrames_2758AC:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_276C3A

.org 0x2758B8
FxFrames_2758B8:
    .dl FxFrame_27673E
    .dl FxFrame_2775D2
    .dl FxFrame_276B12
    .dl FxFrame_279796

.org 0x2758C8
FxFrames_2758C8:
    .dl FxFrame_27673E
    .dl FxFrame_276338
    .dl FxFrame_276D38
    .dl FxFrame_276788
    .dl FxFrame_27925E
    .dl FxFrame_276CD4

.org 0x2758E0
FxFrames_2758E0:
    .dl FxFrame_278216
    .dl FxFrame_277B58
    .dl FxFrame_278E68
    .dl FxFrame_276590
    .dl FxFrame_277444
    .dl FxFrame_277FA0
    .dl FxFrame_278442

.org 0x2758FC
FxFrames_2758FC:
    .dl FxFrame_277F7E
    .dl FxFrame_27985C
    .dl FxFrame_278568

.org 0x275908
FxFrames_275908:
    .dl FxFrame_27673E

.org 0x27590C
FxFrames_27590C:
    .dl FxFrame_27673E

.org 0x275910
FxFrames_275910:
    .dl FxFrame_27682E
    .dl FxFrame_278CF0
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_27675C
    .dl FxFrame_2781E8
    .dl FxFrame_276F04
    .dl FxFrame_2781E8

.org 0x275930
FxFrames_275930:
    .dl FxFrame_27682E
    .dl FxFrame_278CF0
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_27675C
    .dl FxFrame_2781E8
    .dl FxFrame_276F04
    .dl FxFrame_2781E8

.org 0x275950
FxFrames_275950:
    .dl FxFrame_27682E
    .dl FxFrame_278CF0
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_27675C
    .dl FxFrame_2781E8
    .dl FxFrame_276F04
    .dl FxFrame_2781E8

.org 0x275970
FxFrames_275970:
    .dl FxFrame_27682E
    .dl FxFrame_278CF0
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_27675C
    .dl FxFrame_2781E8
    .dl FxFrame_276F04
    .dl FxFrame_2781E8

.org 0x275990
FxFrames_275990:
    .dl FxFrame_27781E
    .dl FxFrame_276800
    .dl FxFrame_276A02
    .dl FxFrame_276C88
    .dl FxFrame_27677E
    .dl FxFrame_276896
    .dl FxFrame_276E9C
    .dl FxFrame_2787E6
    .dl FxFrame_2790DC
    .dl FxFrame_27773C

.org 0x2759B8
FxFrames_2759B8:
    .dl FxFrame_2778D4
    .dl FxFrame_278776
    .dl FxFrame_2770FA
    .dl FxFrame_276986

.org 0x2759C8
FxFrames_2759C8:
    .dl FxFrame_2779A4
    .dl FxFrame_277030
    .dl FxFrame_27862E
    .dl FxFrame_27862E
    .dl FxFrame_278B68
    .dl FxFrame_276DBE
    .dl FxFrame_2796BA
    .dl FxFrame_27810E
    .dl FxFrame_27810E

.org 0x2759EC
FxFrames_2759EC:
    .dl FxFrame_2779A4
    .dl FxFrame_277030
    .dl FxFrame_27862E
    .dl FxFrame_27862E
    .dl FxFrame_278B68
    .dl FxFrame_276DBE
    .dl FxFrame_2796BA
    .dl FxFrame_27810E
    .dl FxFrame_27810E

.org 0x275A10
FxFrames_275A10:
    .dl FxFrame_279418
    .dl FxFrame_27681A
    .dl FxFrame_277838
    .dl FxFrame_278992
    .dl FxFrame_27868C
    .dl FxFrame_276324
    .dl FxFrame_278784
    .dl FxFrame_2798A4

.org 0x275A30
FxFrames_275A30:
    .dl FxFrame_279418
    .dl FxFrame_27681A
    .dl FxFrame_277838
    .dl FxFrame_278992
    .dl FxFrame_27868C
    .dl FxFrame_276324
    .dl FxFrame_278784
    .dl FxFrame_2798A4
    .dl FxFrame_2786A0
    .dl FxFrame_279164
    .dl FxFrame_278CA6
    .dl FxFrame_2769A0
    .dl FxFrame_2781F2
    .dl FxFrame_276876
    .dl FxFrame_27872C
    .dl FxFrame_276EBA

.org 0x275A70
FxFrames_275A70:
    .dl FxFrame_279418
    .dl FxFrame_27681A
    .dl FxFrame_277838
    .dl FxFrame_278992
    .dl FxFrame_27868C
    .dl FxFrame_276324
    .dl FxFrame_278784
    .dl FxFrame_2798A4
    .dl FxFrame_2786A0
    .dl FxFrame_279164
    .dl FxFrame_278CA6
    .dl FxFrame_2769A0
    .dl FxFrame_2781F2
    .dl FxFrame_276876
    .dl FxFrame_27872C
    .dl FxFrame_276EBA

.org 0x275AB0
FxFrames_275AB0:
    .dl FxFrame_2789DC
    .dl FxFrame_2770FA
    .dl FxFrame_2799C6

.org 0x275ABC
FxFrames_275ABC:
    .dl FxFrame_276FAA
    .dl FxFrame_2793C6
    .dl FxFrame_2790B0
    .dl FxFrame_279302

.org 0x275ACC
FxFrames_275ACC:
    .dl FxFrame_276FAA
    .dl FxFrame_2793C6
    .dl FxFrame_2790B0
    .dl FxFrame_279302

.org 0x275ADC
FxFrames_275ADC:
    .dl FxFrame_277322

.org 0x275AE0
FxFrames_275AE0:
    .dl FxFrame_277322

.org 0x275AE4
FxFrames_275AE4:
    .dl FxFrame_279664
    .dl FxFrame_278A3E
    .dl FxFrame_27765A
    .dl FxFrame_2784BE
    .dl FxFrame_2777D6
    .dl FxFrame_27881C
    .dl FxFrame_276316

.org 0x275B00
FxFrames_275B00:
    .dl FxFrame_278848
    .dl FxFrame_2783FA
    .dl FxFrame_2794F0
    .dl FxFrame_2789FA
    .dl FxFrame_278078
    .dl FxFrame_27720A
    .dl FxFrame_279842
    .dl FxFrame_276C66

.org 0x275B20
FxFrames_275B20:
    .dl FxFrame_278848
    .dl FxFrame_2783FA
    .dl FxFrame_2794F0
    .dl FxFrame_2789FA
    .dl FxFrame_278078
    .dl FxFrame_27720A
    .dl FxFrame_279842
    .dl FxFrame_276C66
    .dl FxFrame_2799AC
    .dl FxFrame_2792E8
    .dl FxFrame_277954
    .dl FxFrame_277F64
    .dl FxFrame_276A20
    .dl FxFrame_279A58
    .dl FxFrame_278C1E
    .dl FxFrame_27842C

.org 0x275B60
FxFrames_275B60:
    .dl FxFrame_276AC0
    .dl FxFrame_278B1E
    .dl FxFrame_2793EC
    .dl FxFrame_279A80
    .dl FxFrame_276892
    .dl FxFrame_276C36
    .dl FxFrame_277292
    .dl FxFrame_277B54
    .dl FxFrame_277F02
    .dl FxFrame_276B46
    .dl FxFrame_2799DE

.org 0x275B8C
FxFrames_275B8C:
    .dl FxFrame_276AC0
    .dl FxFrame_278B1E
    .dl FxFrame_2793EC
    .dl FxFrame_279A80
    .dl FxFrame_276892
    .dl FxFrame_276C36
    .dl FxFrame_277292
    .dl FxFrame_277B54
    .dl FxFrame_277F02
    .dl FxFrame_276B46
    .dl FxFrame_2799DE
    .dl FxFrame_2785CC
    .dl FxFrame_277100
    .dl FxFrame_279522

.org 0x275BC4
FxFrames_275BC4:
    .dl FxFrame_2762E4
    .dl FxFrame_27686E
    .dl FxFrame_277A6E
    .dl FxFrame_276C52
    .dl FxFrame_277AC8
    .dl FxFrame_27725E
    .dl FxFrame_2781A2
    .dl FxFrame_27918A
    .dl FxFrame_2761BC
    .dl FxFrame_279C20
    .dl FxFrame_2781CC
    .dl FxFrame_2787E2
    .dl FxFrame_276E88
    .dl FxFrame_2782E8
    .dl FxFrame_276C44
    .dl FxFrame_2781C2
    .dl FxFrame_276A2A

.org 0x275C08
FxFrames_275C08:
    .dl FxFrame_278A2C
    .dl FxFrame_278B72
    .dl FxFrame_279956
    .dl FxFrame_2783BE

.org 0x275C18
FxFrames_275C18:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_27843E

.org 0x275C24
FxFrames_275C24:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_27843E

.org 0x275C30
FxFrames_275C30:
    .dl FxFrame_277D36
    .dl FxFrame_277CE4
    .dl FxFrame_278880
    .dl FxFrame_278DD8
    .dl FxFrame_27893E
    .dl FxFrame_277A86

.org 0x275C48
FxFrames_275C48:
    .dl FxFrame_27682E
    .dl FxFrame_278CF0
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_27675C
    .dl FxFrame_2781E8
    .dl FxFrame_276F04
    .dl FxFrame_2781E8

.org 0x275C68
FxFrames_275C68:
    .dl FxFrame_27682E
    .dl FxFrame_278CF0
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_27675C
    .dl FxFrame_2781E8
    .dl FxFrame_276F04
    .dl FxFrame_2781E8

.org 0x275C88
FxFrames_275C88:
    .dl FxFrame_27682E
    .dl FxFrame_278CF0
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_27675C
    .dl FxFrame_2781E8
    .dl FxFrame_276F04
    .dl FxFrame_2781E8

.org 0x275CA8
FxFrames_275CA8:
    .dl FxFrame_27673E

.org 0x275CAC
FxFrames_275CAC:
    .dl FxFrame_27673E

.org 0x275CB0
FxFrames_275CB0:
    .dl FxFrame_279C16
    .dl FxFrame_278934
    .dl FxFrame_276D8C
    .dl FxFrame_27621A

.org 0x275CC0
FxFrames_275CC0:
    .dl FxFrame_279C16
    .dl FxFrame_278934
    .dl FxFrame_276D8C
    .dl FxFrame_27621A

.org 0x275CD0
FxFrames_275CD0:
    .dl FxFrame_27673E
    .dl FxFrame_27754C
    .dl FxFrame_277634
    .dl FxFrame_27936A
    .dl FxFrame_2761DC
    .dl FxFrame_278158
    .dl FxFrame_278D76
    .dl FxFrame_276904
    .dl FxFrame_276DB4
    .dl FxFrame_278678
    .dl FxFrame_27949C
    .dl FxFrame_27688A

.org 0x275D00
FxFrames_275D00:
    .dl FxFrame_27673E
    .dl FxFrame_27754C
    .dl FxFrame_277634
    .dl FxFrame_27936A
    .dl FxFrame_2761DC
    .dl FxFrame_278158
    .dl FxFrame_278D76
    .dl FxFrame_276904
    .dl FxFrame_276DB4
    .dl FxFrame_278678
    .dl FxFrame_27949C
    .dl FxFrame_27688A
    .dl FxFrame_276C4E
    .dl FxFrame_276A26
    .dl FxFrame_277240
    .dl FxFrame_278206

.org 0x275D40
FxFrames_275D40:
    .dl FxFrame_278FC0
    .dl FxFrame_276C1C
    .dl FxFrame_2772A0
    .dl FxFrame_279178
    .dl FxFrame_276996

.org 0x275D54
FxFrames_275D54:
    .dl FxFrame_277434
    .dl FxFrame_2770FA
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_279360
    .dl FxFrame_277D26
    .dl FxFrame_278CFA
    .dl FxFrame_27672C
    .dl FxFrame_278826
    .dl FxFrame_278032
    .dl FxFrame_276D82
    .dl FxFrame_279968
    .dl FxFrame_278B84
    .dl FxFrame_276864
    .dl FxFrame_277D26
    .dl FxFrame_2770FA

.org 0x275D94
FxFrames_275D94:
    .dl FxFrame_277434
    .dl FxFrame_2770FA
    .dl FxFrame_27743A
    .dl FxFrame_2791C2
    .dl FxFrame_279360
    .dl FxFrame_277D26
    .dl FxFrame_278CFA
    .dl FxFrame_27672C
    .dl FxFrame_278826
    .dl FxFrame_278032
    .dl FxFrame_276D82
    .dl FxFrame_279968
    .dl FxFrame_278B84
    .dl FxFrame_276864
    .dl FxFrame_277D26
    .dl FxFrame_2770FA

.org 0x275DD4
FxFrames_275DD4:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_277D2C

.org 0x275DE0
FxFrames_275DE0:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_277D2C

.org 0x275DEC
FxFrames_275DEC:
    .dl FxFrame_2789DC
    .dl FxFrame_2793C2
    .dl FxFrame_279986
    .dl FxFrame_276856
    .dl FxFrame_276FA0
    .dl FxFrame_27684C
    .dl FxFrame_278104
    .dl FxFrame_2781FC
    .dl FxFrame_2798F4
    .dl FxFrame_277E50

.org 0x275E14
FxFrames_275E14:
    .dl FxFrame_2777CC
    .dl FxFrame_27803C
    .dl FxFrame_279784
    .dl FxFrame_2793A8
    .dl FxFrame_2783D0
    .dl FxFrame_2771AC
    .dl FxFrame_279584
    .dl FxFrame_276706
    .dl FxFrame_2778FC

.org 0x275E38
FxFrames_275E38:
    .dl FxFrame_279BC4
    .dl FxFrame_27742C
    .dl FxFrame_27877C
    .dl FxFrame_2771C0
    .dl FxFrame_278C9E

.org 0x275E4C
FxFrames_275E4C:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_277D2C
    .dl FxFrame_27675C

.org 0x275E5C
FxFrames_275E5C:
    .dl FxFrame_276E92
    .dl FxFrame_279972
    .dl FxFrame_277D2C
    .dl FxFrame_27675C

.org 0x275E6C
FxFrames_275E6C:
    .dl FxFrame_27673E
    .dl FxFrame_27989A
    .dl FxFrame_27997C
    .dl FxFrame_27685A
    .dl FxFrame_276838
    .dl FxFrame_27657C
    .dl FxFrame_278B22
    .dl FxFrame_278FAC
    .dl FxFrame_276450
    .dl FxFrame_27728A
    .dl FxFrame_278C16
    .dl FxFrame_278E16

.org 0x275E9C
FxFrames_275E9C:
    .dl FxFrame_276772
    .dl FxFrame_276766
    .dl FxFrame_27820A
    .dl FxFrame_278FD8
    .dl FxFrame_2796B6
    .dl FxFrame_27644C
    .dl FxFrame_2769FE
    .dl FxFrame_277206
    .dl FxFrame_27796E
    .dl FxFrame_2781E4
    .dl FxFrame_2787E6

.org 0x275EC8
FxFrames_275EC8:
    .dl FxFrame_2789DC
    .dl FxFrame_2767FA
    .dl FxFrame_277E9C

.org 0x275ED4
FxFrames_275ED4:
    .dl FxFrame_278B8E
    .dl FxFrame_279494
    .dl FxFrame_27727E
    .dl FxFrame_278B94
    .dl FxFrame_276AB6
    .dl FxFrame_2791B0
    .dl FxFrame_2797E0
    .dl FxFrame_276A16
    .dl FxFrame_279152
    .dl FxFrame_278830
    .dl FxFrame_27731C

.org 0x275F00
FxFrames_275F00:
    .dl FxFrame_279A84
    .dl FxFrame_278082
    .dl FxFrame_2794A6
    .dl FxFrame_277DAC
    .dl FxFrame_277296
    .dl FxFrame_2771A2

.org 0x275F18
FxFrames_275F18:
    .dl FxFrame_279A84
    .dl FxFrame_278082
    .dl FxFrame_2794A6
    .dl FxFrame_277DAC
    .dl FxFrame_277296
    .dl FxFrame_2771A2

.org 0x275F30
FxFrames_275F30:
    .dl FxFrame_27673E

.org 0x275F34
FxFrames_275F34:
    .dl FxFrame_27673E

.org 0x275F38
FxFrames_275F38:
    .dl FxFrame_279A84
    .dl FxFrame_278082
    .dl FxFrame_2794A6
    .dl FxFrame_277DAC
    .dl FxFrame_277296
    .dl FxFrame_2771A2

.org 0x275F50
FxFrames_275F50:
    .dl FxFrame_279A84
    .dl FxFrame_278082
    .dl FxFrame_2794A6
    .dl FxFrame_277DAC
    .dl FxFrame_277296
    .dl FxFrame_2771A2

.org 0x275F68
FxFrames_275F68:
    .dl FxFrame_27673E
    .dl FxFrame_2775D2
    .dl FxFrame_276B12
    .dl FxFrame_279796

.org 0x275F78
FxFrames_275F78:
    .dl FxFrame_2788C2
    .dl FxFrame_2762EC
    .dl FxFrame_27750E
    .dl FxFrame_277882
    .dl FxFrame_277746

.org 0x275F8C
FxFrames_275F8C:
    .dl FxFrame_278522
    .dl FxFrame_277DCE
    .dl FxFrame_2788E2

.org 0x275F98
FxFrames_275F98:
    .dl FxFrame_276C92
    .dl FxFrame_276A34
    .dl FxFrame_277C64
    .dl FxFrame_276458
    .dl FxFrame_278310

.org 0x275FAC
FxFrames_275FAC:
    .dl FxFrame_277C22
    .dl FxFrame_276F0E
    .dl FxFrame_276BE8

.org 0x275FB8
FxFrames_275FB8:
    .dl FxFrame_278960
    .dl FxFrame_2791CC
    .dl FxFrame_27901E
    .dl FxFrame_2764EA
    .dl FxFrame_277916

.org 0x275FCC
FxFrames_275FCC:
    .dl FxFrame_27635A

.org 0x275FD0
FxFrames_275FD0:
    .dl FxFrame_27635A

.org 0x275FD4
FxFrames_275FD4:
    .dl FxFrame_27673E
    .dl FxFrame_2783B4

.org 0x275FDC
FxFrames_275FDC:
    .dl FxFrame_27673E
    .dl FxFrame_2783B4

.org 0x275FE4
FxFrames_275FE4:
    .dl FxFrame_2789DC
    .dl FxFrame_2767FA
    .dl FxFrame_277E9C

.org 0x275FF0
FxFrames_275FF0:
    .dl FxFrame_27673E

.org 0x275FF4
FxFrames_275FF4:
    .dl FxFrame_27673E

.org 0x275FF8
FxFrames_275FF8:
    .dl FxFrame_277560
    .dl FxFrame_278C2C
    .dl FxFrame_277AE2
    .dl FxFrame_279B10
    .dl FxFrame_2786BA

.org 0x27600C
FxFrames_27600C:
    .dl FxFrame_277EA0
    .dl FxFrame_27738A
    .dl FxFrame_278F32
    .dl FxFrame_276D96
    .dl FxFrame_277656
    .dl FxFrame_277E98
    .dl FxFrame_2782E0

.org 0x276028
FxFrames_276028:
    .dl FxFrame_2789DC
    .dl FxFrame_2793C2
    .dl FxFrame_279986
    .dl FxFrame_276856
    .dl FxFrame_276CD0
    .dl FxFrame_277630
    .dl FxFrame_277258
    .dl FxFrame_27887A

.org 0x276048
FxFrames_276048:
    .dl FxFrame_2789DC
    .dl FxFrame_2793C2
    .dl FxFrame_279986
    .dl FxFrame_276856
    .dl FxFrame_276856
    .dl FxFrame_276CD0
    .dl FxFrame_277258
    .dl FxFrame_2798EE

.org 0x276068
FxFrames_276068:
    .dl FxFrame_279418
    .dl FxFrame_27998A
    .dl FxFrame_278FDC
    .dl FxFrame_279B82
    .dl FxFrame_2778DA
    .dl FxFrame_279324

.org 0x276080
FxFrames_276080:
    .dl FxFrame_279422
    .dl FxFrame_278D04
    .dl FxFrame_278BA4
    .dl FxFrame_2790E0
    .dl FxFrame_2768A0
    .dl FxFrame_278ABA
    .dl FxFrame_277334
    .dl FxFrame_27637C

.org 0x2760A0
FxFrames_2760A0:
    .dl FxFrame_27673E
    .dl FxFrame_277D92
    .dl FxFrame_2776CC
    .dl FxFrame_2787EA
    .dl FxFrame_27770A
    .dl FxFrame_2766D4
    .dl FxFrame_278B36
    .dl FxFrame_2766D4
    .dl FxFrame_2787EA
    .dl FxFrame_277972
    .dl FxFrame_278046

.org 0x2760CC
FxFrames_2760CC:
    .dl FxFrame_27673E
    .dl FxFrame_277D92
    .dl FxFrame_2776CC
    .dl FxFrame_2787EA
    .dl FxFrame_27770A
    .dl FxFrame_2766D4
    .dl FxFrame_278B36
    .dl FxFrame_2766D4
    .dl FxFrame_2787EA
    .dl FxFrame_277972
    .dl FxFrame_278046
    .dl FxFrame_279A7C
    .dl FxFrame_277CD2
    .dl FxFrame_2786AA
    .dl FxFrame_276D9A
    .dl FxFrame_27721C
    .dl FxFrame_2789E0
    .dl FxFrame_279346
    .dl FxFrame_276FCC
    .dl FxFrame_279A62

.org 0x27611C
FxFrames_27611C:
    .dl FxFrame_2763D2
    .dl FxFrame_27665A

.org 0x276124
FxFrames_276124:
    .dl FxFrame_277A7C
    .dl FxFrame_2769EA
    .dl FxFrame_276FE6
    .dl FxFrame_2772D2
    .dl FxFrame_278696
    .dl FxFrame_2793F0
    .dl FxFrame_277FE8
    .dl FxFrame_2797F8
    .dl FxFrame_277236
    .dl FxFrame_2787CE
    .dl FxFrame_278E1E
    .dl FxFrame_279BCC
    .dl FxFrame_277CDA
    .dl FxFrame_2782FC
    .dl FxFrame_27961A
    .dl FxFrame_2795D0
    .dl FxFrame_277292
    .dl FxFrame_277B54
    .dl FxFrame_2782E4
    .dl FxFrame_2788BE

.org 0x276174
FxFrames_276174:
    .dl FxFrame_2789DC
    .dl FxFrame_2799C6
    .dl FxFrame_2770FA

.org 0x276180
FxFrames_276180:
    .dl FxFrame_279918
    .dl FxFrame_277E5A
    .dl FxFrame_2771C8

.org 0x27618C
FxFrames_27618C:
    .dl FxFrame_2798FE
    .dl FxFrame_2782F2
    .dl FxFrame_2795AA
    .dl FxFrame_2792C2
    .dl FxFrame_2796AC
    .dl FxFrame_278AB0
    .dl FxFrame_2790D2
    .dl FxFrame_278682
    .dl FxFrame_277D88
    .dl FxFrame_279B06
    .dl FxFrame_27698C
    .dl FxFrame_278FCE

.org 0x2761BC
FxFrame_2761BC:          ; 3 x 5
.incbin "../../gfx/battle_anims/frames/2761BC.tilemap"

.org 0x2761DC
FxFrame_2761DC:          ; 5 x 6
.incbin "../../gfx/battle_anims/frames/2761DC.tilemap"

.org 0x27621A
FxFrame_27621A:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/27621A.tilemap"

.org 0x2762E4
FxFrame_2762E4:          ; 3 x 1
.incbin "../../gfx/battle_anims/frames/2762E4.tilemap"

.org 0x2762EC
FxFrame_2762EC:          ; 5 x 4
.incbin "../../gfx/battle_anims/frames/2762EC.tilemap"

.org 0x276316
FxFrame_276316:          ; 3 x 2
.incbin "../../gfx/battle_anims/frames/276316.tilemap"

.org 0x276324
FxFrame_276324:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/276324.tilemap"

.org 0x276338
FxFrame_276338:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/276338.tilemap"

.org 0x27635A
FxFrame_27635A:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/27635A.tilemap"

.org 0x27637C
FxFrame_27637C:          ; 6 x 7
.incbin "../../gfx/battle_anims/frames/27637C.tilemap"

.org 0x2763D2
FxFrame_2763D2:          ; 6 x 10
.incbin "../../gfx/battle_anims/frames/2763D2.tilemap"

.org 0x27644C
FxFrame_27644C:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/27644C.tilemap"

.org 0x276450
FxFrame_276450:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/276450.tilemap"

.org 0x276458
FxFrame_276458:          ; 9 x 8
.incbin "../../gfx/battle_anims/frames/276458.tilemap"

.org 0x2764EA
FxFrame_2764EA:          ; 9 x 8
.incbin "../../gfx/battle_anims/frames/2764EA.tilemap"

.org 0x27657C
FxFrame_27657C:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/27657C.tilemap"

.org 0x276590
FxFrame_276590:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/276590.tilemap"

.org 0x27665A
FxFrame_27665A:          ; 6 x 10
.incbin "../../gfx/battle_anims/frames/27665A.tilemap"

.org 0x2766D4
FxFrame_2766D4:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/2766D4.tilemap"

.org 0x276706
FxFrame_276706:          ; 6 x 3
.incbin "../../gfx/battle_anims/frames/276706.tilemap"

.org 0x27672C
FxFrame_27672C:          ; 2 x 4
.incbin "../../gfx/battle_anims/frames/27672C.tilemap"

.org 0x27673E
FxFrame_27673E:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27673E.tilemap"

.org 0x276748
FxFrame_276748:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/276748.tilemap"

.org 0x27675C
FxFrame_27675C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27675C.tilemap"

.org 0x276766
FxFrame_276766:          ; 5 x 1
.incbin "../../gfx/battle_anims/frames/276766.tilemap"

.org 0x276772
FxFrame_276772:          ; 5 x 1
.incbin "../../gfx/battle_anims/frames/276772.tilemap"

.org 0x27677E
FxFrame_27677E:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27677E.tilemap"

.org 0x276788
FxFrame_276788:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/276788.tilemap"

.org 0x2767FA
FxFrame_2767FA:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/2767FA.tilemap"

.org 0x276800
FxFrame_276800:          ; 3 x 4
.incbin "../../gfx/battle_anims/frames/276800.tilemap"

.org 0x27681A
FxFrame_27681A:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/27681A.tilemap"

.org 0x27682E
FxFrame_27682E:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27682E.tilemap"

.org 0x276838
FxFrame_276838:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/276838.tilemap"

.org 0x27684C
FxFrame_27684C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27684C.tilemap"

.org 0x276856
FxFrame_276856:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/276856.tilemap"

.org 0x27685A
FxFrame_27685A:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27685A.tilemap"

.org 0x276864
FxFrame_276864:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276864.tilemap"

.org 0x27686E
FxFrame_27686E:          ; 3 x 1
.incbin "../../gfx/battle_anims/frames/27686E.tilemap"

.org 0x276876
FxFrame_276876:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/276876.tilemap"

.org 0x27688A
FxFrame_27688A:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/27688A.tilemap"

.org 0x27688E
FxFrame_27688E:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/27688E.tilemap"

.org 0x276892
FxFrame_276892:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/276892.tilemap"

.org 0x276896
FxFrame_276896:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276896.tilemap"

.org 0x2768A0
FxFrame_2768A0:          ; 7 x 7
.incbin "../../gfx/battle_anims/frames/2768A0.tilemap"

.org 0x276904
FxFrame_276904:          ; 8 x 8
.incbin "../../gfx/battle_anims/frames/276904.tilemap"

.org 0x276986
FxFrame_276986:          ; 1 x 2
.incbin "../../gfx/battle_anims/frames/276986.tilemap"

.org 0x27698C
FxFrame_27698C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27698C.tilemap"

.org 0x276996
FxFrame_276996:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276996.tilemap"

.org 0x2769A0
FxFrame_2769A0:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/2769A0.tilemap"

.org 0x2769EA
FxFrame_2769EA:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2769EA.tilemap"

.org 0x2769FE
FxFrame_2769FE:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2769FE.tilemap"

.org 0x276A02
FxFrame_276A02:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/276A02.tilemap"

.org 0x276A16
FxFrame_276A16:          ; 1 x 4
.incbin "../../gfx/battle_anims/frames/276A16.tilemap"

.org 0x276A20
FxFrame_276A20:          ; 1 x 2
.incbin "../../gfx/battle_anims/frames/276A20.tilemap"

.org 0x276A26
FxFrame_276A26:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/276A26.tilemap"

.org 0x276A2A
FxFrame_276A2A:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276A2A.tilemap"

.org 0x276A34
FxFrame_276A34:          ; 8 x 8
.incbin "../../gfx/battle_anims/frames/276A34.tilemap"

.org 0x276AB6
FxFrame_276AB6:          ; 1 x 4
.incbin "../../gfx/battle_anims/frames/276AB6.tilemap"

.org 0x276AC0
FxFrame_276AC0:          ; 8 x 5
.incbin "../../gfx/battle_anims/frames/276AC0.tilemap"

.org 0x276B12
FxFrame_276B12:          ; 5 x 5
.incbin "../../gfx/battle_anims/frames/276B12.tilemap"

.org 0x276B46
FxFrame_276B46:          ; 10 x 8
.incbin "../../gfx/battle_anims/frames/276B46.tilemap"

.org 0x276BE8
FxFrame_276BE8:          ; 5 x 5
.incbin "../../gfx/battle_anims/frames/276BE8.tilemap"

.org 0x276C1C
FxFrame_276C1C:          ; 4 x 3
.incbin "../../gfx/battle_anims/frames/276C1C.tilemap"

.org 0x276C36
FxFrame_276C36:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/276C36.tilemap"

.org 0x276C3A
FxFrame_276C3A:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276C3A.tilemap"

.org 0x276C44
FxFrame_276C44:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276C44.tilemap"

.org 0x276C4E
FxFrame_276C4E:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/276C4E.tilemap"

.org 0x276C52
FxFrame_276C52:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/276C52.tilemap"

.org 0x276C66
FxFrame_276C66:          ; 2 x 8
.incbin "../../gfx/battle_anims/frames/276C66.tilemap"

.org 0x276C88
FxFrame_276C88:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276C88.tilemap"

.org 0x276C92
FxFrame_276C92:          ; 10 x 3
.incbin "../../gfx/battle_anims/frames/276C92.tilemap"

.org 0x276CD0
FxFrame_276CD0:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/276CD0.tilemap"

.org 0x276CD4
FxFrame_276CD4:          ; 7 x 7
.incbin "../../gfx/battle_anims/frames/276CD4.tilemap"

.org 0x276D38
FxFrame_276D38:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/276D38.tilemap"

.org 0x276D82
FxFrame_276D82:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276D82.tilemap"

.org 0x276D8C
FxFrame_276D8C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276D8C.tilemap"

.org 0x276D96
FxFrame_276D96:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/276D96.tilemap"

.org 0x276D9A
FxFrame_276D9A:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/276D9A.tilemap"

.org 0x276DB4
FxFrame_276DB4:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276DB4.tilemap"

.org 0x276DBE
FxFrame_276DBE:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/276DBE.tilemap"

.org 0x276E88
FxFrame_276E88:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276E88.tilemap"

.org 0x276E92
FxFrame_276E92:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276E92.tilemap"

.org 0x276E9C
FxFrame_276E9C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276E9C.tilemap"

.org 0x276EA6
FxFrame_276EA6:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/276EA6.tilemap"

.org 0x276EBA
FxFrame_276EBA:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/276EBA.tilemap"

.org 0x276F04
FxFrame_276F04:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276F04.tilemap"

.org 0x276F0E
FxFrame_276F0E:          ; 9 x 8
.incbin "../../gfx/battle_anims/frames/276F0E.tilemap"

.org 0x276FA0
FxFrame_276FA0:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/276FA0.tilemap"

.org 0x276FAA
FxFrame_276FAA:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/276FAA.tilemap"

.org 0x276FCC
FxFrame_276FCC:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/276FCC.tilemap"

.org 0x276FE6
FxFrame_276FE6:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/276FE6.tilemap"

.org 0x277030
FxFrame_277030:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/277030.tilemap"

.org 0x2770FA
FxFrame_2770FA:          ; 1 x 2
.incbin "../../gfx/battle_anims/frames/2770FA.tilemap"

.org 0x277100
FxFrame_277100:          ; 10 x 8
.incbin "../../gfx/battle_anims/frames/277100.tilemap"

.org 0x2771A2
FxFrame_2771A2:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2771A2.tilemap"

.org 0x2771AC
FxFrame_2771AC:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2771AC.tilemap"

.org 0x2771C0
FxFrame_2771C0:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/2771C0.tilemap"

.org 0x2771C8
FxFrame_2771C8:          ; 6 x 5
.incbin "../../gfx/battle_anims/frames/2771C8.tilemap"

.org 0x277206
FxFrame_277206:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277206.tilemap"

.org 0x27720A
FxFrame_27720A:          ; 2 x 4
.incbin "../../gfx/battle_anims/frames/27720A.tilemap"

.org 0x27721C
FxFrame_27721C:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/27721C.tilemap"

.org 0x277236
FxFrame_277236:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/277236.tilemap"

.org 0x277240
FxFrame_277240:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277240.tilemap"

.org 0x277244
FxFrame_277244:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/277244.tilemap"

.org 0x277258
FxFrame_277258:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/277258.tilemap"

.org 0x27725E
FxFrame_27725E:          ; 3 x 5
.incbin "../../gfx/battle_anims/frames/27725E.tilemap"

.org 0x27727E
FxFrame_27727E:          ; 1 x 5
.incbin "../../gfx/battle_anims/frames/27727E.tilemap"

.org 0x27728A
FxFrame_27728A:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/27728A.tilemap"

.org 0x277292
FxFrame_277292:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277292.tilemap"

.org 0x277296
FxFrame_277296:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/277296.tilemap"

.org 0x2772A0
FxFrame_2772A0:          ; 8 x 3
.incbin "../../gfx/battle_anims/frames/2772A0.tilemap"

.org 0x2772D2
FxFrame_2772D2:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/2772D2.tilemap"

.org 0x27731C
FxFrame_27731C:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/27731C.tilemap"

.org 0x277322
FxFrame_277322:          ; 4 x 2
.incbin "../../gfx/battle_anims/frames/277322.tilemap"

.org 0x277334
FxFrame_277334:          ; 6 x 7
.incbin "../../gfx/battle_anims/frames/277334.tilemap"

.org 0x27738A
FxFrame_27738A:          ; 10 x 8
.incbin "../../gfx/battle_anims/frames/27738A.tilemap"

.org 0x27742C
FxFrame_27742C:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/27742C.tilemap"

.org 0x277434
FxFrame_277434:          ; 1 x 2
.incbin "../../gfx/battle_anims/frames/277434.tilemap"

.org 0x27743A
FxFrame_27743A:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27743A.tilemap"

.org 0x277444
FxFrame_277444:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/277444.tilemap"

.org 0x27750E
FxFrame_27750E:          ; 5 x 6
.incbin "../../gfx/battle_anims/frames/27750E.tilemap"

.org 0x27754C
FxFrame_27754C:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/27754C.tilemap"

.org 0x277560
FxFrame_277560:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/277560.tilemap"

.org 0x2775D2
FxFrame_2775D2:          ; 5 x 4
.incbin "../../gfx/battle_anims/frames/2775D2.tilemap"

.org 0x2775FC
FxFrame_2775FC:          ; 5 x 5
.incbin "../../gfx/battle_anims/frames/2775FC.tilemap"

.org 0x277630
FxFrame_277630:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277630.tilemap"

.org 0x277634
FxFrame_277634:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/277634.tilemap"

.org 0x277656
FxFrame_277656:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277656.tilemap"

.org 0x27765A
FxFrame_27765A:          ; 7 x 8
.incbin "../../gfx/battle_anims/frames/27765A.tilemap"

.org 0x2776CC
FxFrame_2776CC:          ; 2 x 10
.incbin "../../gfx/battle_anims/frames/2776CC.tilemap"

.org 0x2776F6
FxFrame_2776F6:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2776F6.tilemap"

.org 0x27770A
FxFrame_27770A:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/27770A.tilemap"

.org 0x27773C
FxFrame_27773C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27773C.tilemap"

.org 0x277746
FxFrame_277746:          ; 5 x 8
.incbin "../../gfx/battle_anims/frames/277746.tilemap"

.org 0x277798
FxFrame_277798:          ; 5 x 5
.incbin "../../gfx/battle_anims/frames/277798.tilemap"

.org 0x2777CC
FxFrame_2777CC:          ; 4 x 1
.incbin "../../gfx/battle_anims/frames/2777CC.tilemap"

.org 0x2777D6
FxFrame_2777D6:          ; 7 x 5
.incbin "../../gfx/battle_anims/frames/2777D6.tilemap"

.org 0x27781E
FxFrame_27781E:          ; 3 x 4
.incbin "../../gfx/battle_anims/frames/27781E.tilemap"

.org 0x277838
FxFrame_277838:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/277838.tilemap"

.org 0x277882
FxFrame_277882:          ; 5 x 8
.incbin "../../gfx/battle_anims/frames/277882.tilemap"

.org 0x2778D4
FxFrame_2778D4:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/2778D4.tilemap"

.org 0x2778DA
FxFrame_2778DA:          ; 8 x 2
.incbin "../../gfx/battle_anims/frames/2778DA.tilemap"

.org 0x2778FC
FxFrame_2778FC:          ; 6 x 2
.incbin "../../gfx/battle_anims/frames/2778FC.tilemap"

.org 0x277916
FxFrame_277916:          ; 6 x 5
.incbin "../../gfx/battle_anims/frames/277916.tilemap"

.org 0x277954
FxFrame_277954:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/277954.tilemap"

.org 0x27796E
FxFrame_27796E:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/27796E.tilemap"

.org 0x277972
FxFrame_277972:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/277972.tilemap"

.org 0x2779A4
FxFrame_2779A4:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/2779A4.tilemap"

.org 0x277A6E
FxFrame_277A6E:          ; 3 x 2
.incbin "../../gfx/battle_anims/frames/277A6E.tilemap"

.org 0x277A7C
FxFrame_277A7C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/277A7C.tilemap"

.org 0x277A86
FxFrame_277A86:          ; 4 x 8
.incbin "../../gfx/battle_anims/frames/277A86.tilemap"

.org 0x277AC8
FxFrame_277AC8:          ; 3 x 4
.incbin "../../gfx/battle_anims/frames/277AC8.tilemap"

.org 0x277AE2
FxFrame_277AE2:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/277AE2.tilemap"

.org 0x277B54
FxFrame_277B54:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277B54.tilemap"

.org 0x277B58
FxFrame_277B58:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/277B58.tilemap"

.org 0x277C22
FxFrame_277C22:          ; 8 x 4
.incbin "../../gfx/battle_anims/frames/277C22.tilemap"

.org 0x277C64
FxFrame_277C64:          ; 6 x 9
.incbin "../../gfx/battle_anims/frames/277C64.tilemap"

.org 0x277CD2
FxFrame_277CD2:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/277CD2.tilemap"

.org 0x277CDA
FxFrame_277CDA:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/277CDA.tilemap"

.org 0x277CE4
FxFrame_277CE4:          ; 4 x 8
.incbin "../../gfx/battle_anims/frames/277CE4.tilemap"

.org 0x277D26
FxFrame_277D26:          ; 1 x 2
.incbin "../../gfx/battle_anims/frames/277D26.tilemap"

.org 0x277D2C
FxFrame_277D2C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/277D2C.tilemap"

.org 0x277D36
FxFrame_277D36:          ; 4 x 10
.incbin "../../gfx/battle_anims/frames/277D36.tilemap"

.org 0x277D88
FxFrame_277D88:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/277D88.tilemap"

.org 0x277D92
FxFrame_277D92:          ; 2 x 6
.incbin "../../gfx/battle_anims/frames/277D92.tilemap"

.org 0x277DAC
FxFrame_277DAC:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/277DAC.tilemap"

.org 0x277DCE
FxFrame_277DCE:          ; 8 x 8
.incbin "../../gfx/battle_anims/frames/277DCE.tilemap"

.org 0x277E50
FxFrame_277E50:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/277E50.tilemap"

.org 0x277E5A
FxFrame_277E5A:          ; 6 x 5
.incbin "../../gfx/battle_anims/frames/277E5A.tilemap"

.org 0x277E98
FxFrame_277E98:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277E98.tilemap"

.org 0x277E9C
FxFrame_277E9C:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/277E9C.tilemap"

.org 0x277EA0
FxFrame_277EA0:          ; 12 x 4
.incbin "../../gfx/battle_anims/frames/277EA0.tilemap"

.org 0x277F02
FxFrame_277F02:          ; 12 x 4
.incbin "../../gfx/battle_anims/frames/277F02.tilemap"

.org 0x277F64
FxFrame_277F64:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/277F64.tilemap"

.org 0x277F7E
FxFrame_277F7E:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/277F7E.tilemap"

.org 0x277FA0
FxFrame_277FA0:          ; 7 x 5
.incbin "../../gfx/battle_anims/frames/277FA0.tilemap"

.org 0x277FE8
FxFrame_277FE8:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/277FE8.tilemap"

.org 0x278032
FxFrame_278032:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278032.tilemap"

.org 0x27803C
FxFrame_27803C:          ; 4 x 1
.incbin "../../gfx/battle_anims/frames/27803C.tilemap"

.org 0x278046
FxFrame_278046:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/278046.tilemap"

.org 0x278078
FxFrame_278078:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278078.tilemap"

.org 0x278082
FxFrame_278082:          ; 8 x 8
.incbin "../../gfx/battle_anims/frames/278082.tilemap"

.org 0x278104
FxFrame_278104:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278104.tilemap"

.org 0x27810E
FxFrame_27810E:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/27810E.tilemap"

.org 0x278158
FxFrame_278158:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/278158.tilemap"

.org 0x2781A2
FxFrame_2781A2:          ; 3 x 5
.incbin "../../gfx/battle_anims/frames/2781A2.tilemap"

.org 0x2781C2
FxFrame_2781C2:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2781C2.tilemap"

.org 0x2781CC
FxFrame_2781CC:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2781CC.tilemap"

.org 0x2781D0
FxFrame_2781D0:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2781D0.tilemap"

.org 0x2781E4
FxFrame_2781E4:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2781E4.tilemap"

.org 0x2781E8
FxFrame_2781E8:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2781E8.tilemap"

.org 0x2781F2
FxFrame_2781F2:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2781F2.tilemap"

.org 0x2781FC
FxFrame_2781FC:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2781FC.tilemap"

.org 0x278206
FxFrame_278206:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/278206.tilemap"

.org 0x27820A
FxFrame_27820A:          ; 5 x 1
.incbin "../../gfx/battle_anims/frames/27820A.tilemap"

.org 0x278216
FxFrame_278216:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/278216.tilemap"

.org 0x2782E0
FxFrame_2782E0:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2782E0.tilemap"

.org 0x2782E4
FxFrame_2782E4:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2782E4.tilemap"

.org 0x2782E8
FxFrame_2782E8:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2782E8.tilemap"

.org 0x2782F2
FxFrame_2782F2:          ; 1 x 4
.incbin "../../gfx/battle_anims/frames/2782F2.tilemap"

.org 0x2782FC
FxFrame_2782FC:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2782FC.tilemap"

.org 0x278310
FxFrame_278310:          ; 9 x 9
.incbin "../../gfx/battle_anims/frames/278310.tilemap"

.org 0x2783B4
FxFrame_2783B4:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2783B4.tilemap"

.org 0x2783BE
FxFrame_2783BE:          ; 8 x 1
.incbin "../../gfx/battle_anims/frames/2783BE.tilemap"

.org 0x2783D0
FxFrame_2783D0:          ; 4 x 5
.incbin "../../gfx/battle_anims/frames/2783D0.tilemap"

.org 0x2783FA
FxFrame_2783FA:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/2783FA.tilemap"

.org 0x27842C
FxFrame_27842C:          ; 1 x 8
.incbin "../../gfx/battle_anims/frames/27842C.tilemap"

.org 0x27843E
FxFrame_27843E:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/27843E.tilemap"

.org 0x278442
FxFrame_278442:          ; 7 x 5
.incbin "../../gfx/battle_anims/frames/278442.tilemap"

.org 0x27848A
FxFrame_27848A:          ; 5 x 5
.incbin "../../gfx/battle_anims/frames/27848A.tilemap"

.org 0x2784BE
FxFrame_2784BE:          ; 7 x 7
.incbin "../../gfx/battle_anims/frames/2784BE.tilemap"

.org 0x278522
FxFrame_278522:          ; 6 x 4
.incbin "../../gfx/battle_anims/frames/278522.tilemap"

.org 0x278554
FxFrame_278554:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/278554.tilemap"

.org 0x278568
FxFrame_278568:          ; 7 x 7
.incbin "../../gfx/battle_anims/frames/278568.tilemap"

.org 0x2785CC
FxFrame_2785CC:          ; 12 x 4
.incbin "../../gfx/battle_anims/frames/2785CC.tilemap"

.org 0x27862E
FxFrame_27862E:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/27862E.tilemap"

.org 0x278678
FxFrame_278678:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278678.tilemap"

.org 0x278682
FxFrame_278682:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278682.tilemap"

.org 0x27868C
FxFrame_27868C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27868C.tilemap"

.org 0x278696
FxFrame_278696:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278696.tilemap"

.org 0x2786A0
FxFrame_2786A0:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2786A0.tilemap"

.org 0x2786AA
FxFrame_2786AA:          ; 1 x 7
.incbin "../../gfx/battle_anims/frames/2786AA.tilemap"

.org 0x2786BA
FxFrame_2786BA:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/2786BA.tilemap"

.org 0x27872C
FxFrame_27872C:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/27872C.tilemap"

.org 0x278776
FxFrame_278776:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/278776.tilemap"

.org 0x27877C
FxFrame_27877C:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/27877C.tilemap"

.org 0x278784
FxFrame_278784:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/278784.tilemap"

.org 0x2787CE
FxFrame_2787CE:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2787CE.tilemap"

.org 0x2787E2
FxFrame_2787E2:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2787E2.tilemap"

.org 0x2787E6
FxFrame_2787E6:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2787E6.tilemap"

.org 0x2787EA
FxFrame_2787EA:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/2787EA.tilemap"

.org 0x27881C
FxFrame_27881C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27881C.tilemap"

.org 0x278826
FxFrame_278826:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278826.tilemap"

.org 0x278830
FxFrame_278830:          ; 1 x 11
.incbin "../../gfx/battle_anims/frames/278830.tilemap"

.org 0x278848
FxFrame_278848:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/278848.tilemap"

.org 0x27887A
FxFrame_27887A:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/27887A.tilemap"

.org 0x278880
FxFrame_278880:          ; 5 x 6
.incbin "../../gfx/battle_anims/frames/278880.tilemap"

.org 0x2788BE
FxFrame_2788BE:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2788BE.tilemap"

.org 0x2788C2
FxFrame_2788C2:          ; 5 x 3
.incbin "../../gfx/battle_anims/frames/2788C2.tilemap"

.org 0x2788E2
FxFrame_2788E2:          ; 4 x 10
.incbin "../../gfx/battle_anims/frames/2788E2.tilemap"

.org 0x278934
FxFrame_278934:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278934.tilemap"

.org 0x27893E
FxFrame_27893E:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/27893E.tilemap"

.org 0x278960
FxFrame_278960:          ; 8 x 3
.incbin "../../gfx/battle_anims/frames/278960.tilemap"

.org 0x278992
FxFrame_278992:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/278992.tilemap"

.org 0x2789DC
FxFrame_2789DC:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2789DC.tilemap"

.org 0x2789E0
FxFrame_2789E0:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/2789E0.tilemap"

.org 0x2789FA
FxFrame_2789FA:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/2789FA.tilemap"

.org 0x278A2C
FxFrame_278A2C:          ; 8 x 1
.incbin "../../gfx/battle_anims/frames/278A2C.tilemap"

.org 0x278A3E
FxFrame_278A3E:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/278A3E.tilemap"

.org 0x278AB0
FxFrame_278AB0:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278AB0.tilemap"

.org 0x278ABA
FxFrame_278ABA:          ; 7 x 7
.incbin "../../gfx/battle_anims/frames/278ABA.tilemap"

.org 0x278B1E
FxFrame_278B1E:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/278B1E.tilemap"

.org 0x278B22
FxFrame_278B22:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/278B22.tilemap"

.org 0x278B36
FxFrame_278B36:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/278B36.tilemap"

.org 0x278B68
FxFrame_278B68:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278B68.tilemap"

.org 0x278B72
FxFrame_278B72:          ; 8 x 1
.incbin "../../gfx/battle_anims/frames/278B72.tilemap"

.org 0x278B84
FxFrame_278B84:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278B84.tilemap"

.org 0x278B8E
FxFrame_278B8E:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/278B8E.tilemap"

.org 0x278B94
FxFrame_278B94:          ; 1 x 7
.incbin "../../gfx/battle_anims/frames/278B94.tilemap"

.org 0x278BA4
FxFrame_278BA4:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/278BA4.tilemap"

.org 0x278C16
FxFrame_278C16:          ; 3 x 1
.incbin "../../gfx/battle_anims/frames/278C16.tilemap"

.org 0x278C1E
FxFrame_278C1E:          ; 1 x 6
.incbin "../../gfx/battle_anims/frames/278C1E.tilemap"

.org 0x278C2C
FxFrame_278C2C:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/278C2C.tilemap"

.org 0x278C9E
FxFrame_278C9E:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/278C9E.tilemap"

.org 0x278CA6
FxFrame_278CA6:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/278CA6.tilemap"

.org 0x278CF0
FxFrame_278CF0:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278CF0.tilemap"

.org 0x278CFA
FxFrame_278CFA:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278CFA.tilemap"

.org 0x278D04
FxFrame_278D04:          ; 7 x 8
.incbin "../../gfx/battle_anims/frames/278D04.tilemap"

.org 0x278D76
FxFrame_278D76:          ; 8 x 6
.incbin "../../gfx/battle_anims/frames/278D76.tilemap"

.org 0x278DD8
FxFrame_278DD8:          ; 3 x 10
.incbin "../../gfx/battle_anims/frames/278DD8.tilemap"

.org 0x278E16
FxFrame_278E16:          ; 3 x 1
.incbin "../../gfx/battle_anims/frames/278E16.tilemap"

.org 0x278E1E
FxFrame_278E1E:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/278E1E.tilemap"

.org 0x278E68
FxFrame_278E68:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/278E68.tilemap"

.org 0x278F32
FxFrame_278F32:          ; 6 x 10
.incbin "../../gfx/battle_anims/frames/278F32.tilemap"

.org 0x278FAC
FxFrame_278FAC:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/278FAC.tilemap"

.org 0x278FC0
FxFrame_278FC0:          ; 2 x 3
.incbin "../../gfx/battle_anims/frames/278FC0.tilemap"

.org 0x278FCE
FxFrame_278FCE:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/278FCE.tilemap"

.org 0x278FD8
FxFrame_278FD8:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/278FD8.tilemap"

.org 0x278FDC
FxFrame_278FDC:          ; 8 x 4
.incbin "../../gfx/battle_anims/frames/278FDC.tilemap"

.org 0x27901E
FxFrame_27901E:          ; 8 x 9
.incbin "../../gfx/battle_anims/frames/27901E.tilemap"

.org 0x2790B0
FxFrame_2790B0:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/2790B0.tilemap"

.org 0x2790D2
FxFrame_2790D2:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2790D2.tilemap"

.org 0x2790DC
FxFrame_2790DC:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2790DC.tilemap"

.org 0x2790E0
FxFrame_2790E0:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/2790E0.tilemap"

.org 0x279152
FxFrame_279152:          ; 1 x 8
.incbin "../../gfx/battle_anims/frames/279152.tilemap"

.org 0x279164
FxFrame_279164:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/279164.tilemap"

.org 0x279178
FxFrame_279178:          ; 4 x 2
.incbin "../../gfx/battle_anims/frames/279178.tilemap"

.org 0x27918A
FxFrame_27918A:          ; 3 x 6
.incbin "../../gfx/battle_anims/frames/27918A.tilemap"

.org 0x2791B0
FxFrame_2791B0:          ; 1 x 8
.incbin "../../gfx/battle_anims/frames/2791B0.tilemap"

.org 0x2791C2
FxFrame_2791C2:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2791C2.tilemap"

.org 0x2791CC
FxFrame_2791CC:          ; 9 x 8
.incbin "../../gfx/battle_anims/frames/2791CC.tilemap"

.org 0x27925E
FxFrame_27925E:          ; 7 x 7
.incbin "../../gfx/battle_anims/frames/27925E.tilemap"

.org 0x2792C2
FxFrame_2792C2:          ; 3 x 6
.incbin "../../gfx/battle_anims/frames/2792C2.tilemap"

.org 0x2792E8
FxFrame_2792E8:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/2792E8.tilemap"

.org 0x279302
FxFrame_279302:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/279302.tilemap"

.org 0x279324
FxFrame_279324:          ; 8 x 2
.incbin "../../gfx/battle_anims/frames/279324.tilemap"

.org 0x279346
FxFrame_279346:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/279346.tilemap"

.org 0x279360
FxFrame_279360:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/279360.tilemap"

.org 0x27936A
FxFrame_27936A:          ; 5 x 6
.incbin "../../gfx/battle_anims/frames/27936A.tilemap"

.org 0x2793A8
FxFrame_2793A8:          ; 4 x 3
.incbin "../../gfx/battle_anims/frames/2793A8.tilemap"

.org 0x2793C2
FxFrame_2793C2:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2793C2.tilemap"

.org 0x2793C6
FxFrame_2793C6:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/2793C6.tilemap"

.org 0x2793E8
FxFrame_2793E8:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2793E8.tilemap"

.org 0x2793EC
FxFrame_2793EC:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2793EC.tilemap"

.org 0x2793F0
FxFrame_2793F0:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2793F0.tilemap"

.org 0x279404
FxFrame_279404:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/279404.tilemap"

.org 0x279418
FxFrame_279418:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/279418.tilemap"

.org 0x279422
FxFrame_279422:          ; 7 x 8
.incbin "../../gfx/battle_anims/frames/279422.tilemap"

.org 0x279494
FxFrame_279494:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/279494.tilemap"

.org 0x27949C
FxFrame_27949C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27949C.tilemap"

.org 0x2794A6
FxFrame_2794A6:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/2794A6.tilemap"

.org 0x2794F0
FxFrame_2794F0:          ; 2 x 12
.incbin "../../gfx/battle_anims/frames/2794F0.tilemap"

.org 0x279522
FxFrame_279522:          ; 6 x 8
.incbin "../../gfx/battle_anims/frames/279522.tilemap"

.org 0x279584
FxFrame_279584:          ; 6 x 3
.incbin "../../gfx/battle_anims/frames/279584.tilemap"

.org 0x2795AA
FxFrame_2795AA:          ; 3 x 6
.incbin "../../gfx/battle_anims/frames/2795AA.tilemap"

.org 0x2795D0
FxFrame_2795D0:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/2795D0.tilemap"

.org 0x27961A
FxFrame_27961A:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/27961A.tilemap"

.org 0x279664
FxFrame_279664:          ; 7 x 5
.incbin "../../gfx/battle_anims/frames/279664.tilemap"

.org 0x2796AC
FxFrame_2796AC:          ; 1 x 4
.incbin "../../gfx/battle_anims/frames/2796AC.tilemap"

.org 0x2796B6
FxFrame_2796B6:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2796B6.tilemap"

.org 0x2796BA
FxFrame_2796BA:          ; 10 x 10
.incbin "../../gfx/battle_anims/frames/2796BA.tilemap"

.org 0x279784
FxFrame_279784:          ; 4 x 2
.incbin "../../gfx/battle_anims/frames/279784.tilemap"

.org 0x279796
FxFrame_279796:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/279796.tilemap"

.org 0x2797E0
FxFrame_2797E0:          ; 1 x 11
.incbin "../../gfx/battle_anims/frames/2797E0.tilemap"

.org 0x2797F8
FxFrame_2797F8:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/2797F8.tilemap"

.org 0x279842
FxFrame_279842:          ; 2 x 6
.incbin "../../gfx/battle_anims/frames/279842.tilemap"

.org 0x27985C
FxFrame_27985C:          ; 6 x 5
.incbin "../../gfx/battle_anims/frames/27985C.tilemap"

.org 0x27989A
FxFrame_27989A:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27989A.tilemap"

.org 0x2798A4
FxFrame_2798A4:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/2798A4.tilemap"

.org 0x2798EE
FxFrame_2798EE:          ; 2 x 1
.incbin "../../gfx/battle_anims/frames/2798EE.tilemap"

.org 0x2798F4
FxFrame_2798F4:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/2798F4.tilemap"

.org 0x2798FE
FxFrame_2798FE:          ; 3 x 4
.incbin "../../gfx/battle_anims/frames/2798FE.tilemap"

.org 0x279918
FxFrame_279918:          ; 6 x 5
.incbin "../../gfx/battle_anims/frames/279918.tilemap"

.org 0x279956
FxFrame_279956:          ; 8 x 1
.incbin "../../gfx/battle_anims/frames/279956.tilemap"

.org 0x279968
FxFrame_279968:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/279968.tilemap"

.org 0x279972
FxFrame_279972:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/279972.tilemap"

.org 0x27997C
FxFrame_27997C:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/27997C.tilemap"

.org 0x279986
FxFrame_279986:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/279986.tilemap"

.org 0x27998A
FxFrame_27998A:          ; 4 x 4
.incbin "../../gfx/battle_anims/frames/27998A.tilemap"

.org 0x2799AC
FxFrame_2799AC:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/2799AC.tilemap"

.org 0x2799C6
FxFrame_2799C6:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/2799C6.tilemap"

.org 0x2799CA
FxFrame_2799CA:          ; 3 x 3
.incbin "../../gfx/battle_anims/frames/2799CA.tilemap"

.org 0x2799DE
FxFrame_2799DE:          ; 6 x 10
.incbin "../../gfx/battle_anims/frames/2799DE.tilemap"

.org 0x279A58
FxFrame_279A58:          ; 1 x 4
.incbin "../../gfx/battle_anims/frames/279A58.tilemap"

.org 0x279A62
FxFrame_279A62:          ; 1 x 12
.incbin "../../gfx/battle_anims/frames/279A62.tilemap"

.org 0x279A7C
FxFrame_279A7C:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/279A7C.tilemap"

.org 0x279A80
FxFrame_279A80:          ; 1 x 1
.incbin "../../gfx/battle_anims/frames/279A80.tilemap"

.org 0x279A84
FxFrame_279A84:          ; 8 x 8
.incbin "../../gfx/battle_anims/frames/279A84.tilemap"

.org 0x279B06
FxFrame_279B06:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/279B06.tilemap"

.org 0x279B10
FxFrame_279B10:          ; 8 x 7
.incbin "../../gfx/battle_anims/frames/279B10.tilemap"

.org 0x279B82
FxFrame_279B82:          ; 8 x 4
.incbin "../../gfx/battle_anims/frames/279B82.tilemap"

.org 0x279BC4
FxFrame_279BC4:          ; 1 x 3
.incbin "../../gfx/battle_anims/frames/279BC4.tilemap"

.org 0x279BCC
FxFrame_279BCC:          ; 6 x 6
.incbin "../../gfx/battle_anims/frames/279BCC.tilemap"

.org 0x279C16
FxFrame_279C16:          ; 2 x 2
.incbin "../../gfx/battle_anims/frames/279C16.tilemap"

.org 0x279C20
FxFrame_279C20:          ; 3 x 4
.incbin "../../gfx/battle_anims/frames/279C20.tilemap"

.org 0x279C3A
FxTiles_279C3A:
.incbin "../../../build/gfx/battle_anims/279C3A.png.bin"
    .db 0x1D, 0x2D   ; no reader found

.org 0x279F62
FxTiles_279F62:
.incbin "../../../build/gfx/battle_anims/279F62.png.bin"
    .db 0xBA, 0x3D   ; no reader found

.org 0x27A3E7
FxTiles_27A3E7:
.incbin "../../../build/gfx/battle_anims/27A3E7.png.bin"
    .db 0xDC, 0x29   ; no reader found

.org 0x27A92E
FxTiles_27A92E:
.incbin "../../../build/gfx/battle_anims/27A92E.png.bin"
    .db 0x00, 0xA1, 0x09   ; no reader found

.org 0x27A9B3
FxTiles_27A9B3:
.incbin "../../../build/gfx/battle_anims/27A9B3.png.bin"
    .db 0xFF, 0x26   ; no reader found

.org 0x27ABDC
FxTiles_27ABDC:
.incbin "../../../build/gfx/battle_anims/27ABDC.png.bin"
    .db 0x73, 0x07   ; no reader found

.org 0x27AC3C
FxTiles_27AC3C:
.incbin "../../../build/gfx/battle_anims/27AC3C.png.bin"
    .db 0x0E, 0x0C   ; no reader found

.org 0x27AC58
FxTiles_27AC58:
.incbin "../../../build/gfx/battle_anims/27AC58.png.bin"
    .db 0xDC, 0x3D   ; no reader found

.org 0x27ACA0
FxTiles_27ACA0:
.incbin "../../../build/gfx/battle_anims/27ACA0.png.bin"
    .db 0x9D, 0x1B, 0x00, 0x00   ; no reader found

.org 0x27B064
FxTiles_27B064:
.incbin "../../../build/gfx/battle_anims/27B064.png.bin"
    .db 0xFA, 0x00   ; no reader found

.org 0x27B14A
FxTiles_27B14A:
.incbin "../../../build/gfx/battle_anims/27B14A.png.bin"
    .db 0x1A, 0x30   ; no reader found

.org 0x27B32B
FxTiles_27B32B:
.incbin "../../../build/gfx/battle_anims/27B32B.png.bin"
    .db 0x72, 0x18   ; no reader found

.org 0x27B43A
FxTiles_27B43A:
.incbin "../../../build/gfx/battle_anims/27B43A.png.bin"
    .db 0xDC, 0x3D   ; no reader found

.org 0x27B456
FxTiles_27B456:
.incbin "../../../build/gfx/battle_anims/27B456.png.bin"
    .db 0x84, 0x36   ; no reader found

.org 0x27B681
FxTiles_27B681:
.incbin "../../../build/gfx/battle_anims/27B681.png.bin"
    .db 0xBC, 0x1B, 0x00, 0x00   ; no reader found

.org 0x27BAD5
FxTiles_27BAD5:
.incbin "../../../build/gfx/battle_anims/27BAD5.png.bin"

.org 0x27BB5F
FxTiles_27BB5F:
.incbin "../../../build/gfx/battle_anims/27BB5F.png.bin"
    .db 0x00, 0x18, 0x09   ; no reader found

.org 0x27C044
FxTiles_27C044:
.incbin "../../../build/gfx/battle_anims/27C044.png.bin"
    .db 0xC3, 0x27   ; no reader found

.org 0x27C213
FxTiles_27C213:
.incbin "../../../build/gfx/battle_anims/27C213.png.bin"
    .db 0x06, 0x0D   ; no reader found

.org 0x27C299
FxTiles_27C299:
.incbin "../../../build/gfx/battle_anims/27C299.png.bin"
    .db 0x77, 0x03   ; no reader found

.org 0x27C2E9
FxTiles_27C2E9:
.incbin "../../../build/gfx/battle_anims/27C2E9.png.bin"
    .db 0xDC, 0x3D   ; no reader found

.org 0x27C398
FxTiles_27C398:
.incbin "../../../build/gfx/battle_anims/27C398.png.bin"
    .db 0x00, 0x01, 0x00   ; no reader found

.org 0x27C62B
FxTiles_27C62B:
.incbin "../../../build/gfx/battle_anims/27C62B.png.bin"
    .db 0x4E, 0x1C   ; no reader found

.org 0x27C747
FxTiles_27C747:
.incbin "../../../build/gfx/battle_anims/27C747.png.bin"
    .db 0x01, 0x00   ; no reader found

.org 0x27C7B6
FxTiles_27C7B6:
.incbin "../../../build/gfx/battle_anims/27C7B6.png.bin"
    .db 0xB6, 0x1D   ; no reader found

.org 0x27C8C3
FxTiles_27C8C3:
.incbin "../../../build/gfx/battle_anims/27C8C3.png.bin"
    .db 0x71, 0x09   ; no reader found

.org 0x27C935
FxTiles_27C935:
.incbin "../../../build/gfx/battle_anims/27C935.png.bin"
    .db 0xCE, 0x2C   ; no reader found

.org 0x27CB28
FxTiles_27CB28:
.incbin "../../../build/gfx/battle_anims/27CB28.png.bin"
    .db 0x18, 0x02   ; no reader found

.org 0x27CB47
FxTiles_27CB47:
.incbin "../../../build/gfx/battle_anims/27CB47.png.bin"
    .db 0x00, 0x81, 0x29   ; no reader found

.org 0x27CD18
FxTiles_27CD18:
.incbin "../../../build/gfx/battle_anims/27CD18.png.bin"
    .db 0x9D, 0x1B, 0x03, 0x00, 0x00   ; no reader found

.org 0x27D0A8
FxTiles_27D0A8:
.incbin "../../../build/gfx/battle_anims/27D0A8.png.bin"
    .db 0x9F, 0x2B   ; no reader found

.org 0x27D227
FxTiles_27D227:
.incbin "../../../build/gfx/battle_anims/27D227.png.bin"
    .db 0x6E, 0x1C   ; no reader found

.org 0x27D373
FxTiles_27D373:
.incbin "../../../build/gfx/battle_anims/27D373.png.bin"
    .db 0xC6, 0x0C   ; no reader found

.org 0x27D91B
FxTiles_27D91B:
.incbin "../../../build/gfx/battle_anims/27D91B.png.bin"
    .db 0x53, 0x27   ; no reader found

.org 0x27DA68
FxTiles_27DA68:
.incbin "../../../build/gfx/battle_anims/27DA68.png.bin"
    .db 0xD0, 0x0A   ; no reader found

.org 0x27DB30
FxTiles_27DB30:
.incbin "../../../build/gfx/battle_anims/27DB30.png.bin"
    .db 0xDC, 0x3D   ; no reader found

.org 0x27DB4A
FxTiles_27DB4A:
.incbin "../../../build/gfx/battle_anims/27DB4A.png.bin"
    .db 0x73, 0x33   ; no reader found

.org 0x27DE8E
FxTiles_27DE8E:
.incbin "../../../build/gfx/battle_anims/27DE8E.png.bin"
    .db 0x8E, 0x0C   ; no reader found

.org 0x27DF04
FxTiles_27DF04:
.incbin "../../../build/gfx/battle_anims/27DF04.png.bin"

.org 0x27E1E2
FxTiles_27E1E2:
.incbin "../../../build/gfx/battle_anims/27E1E2.png.bin"
    .db 0x00, 0xDC, 0x3D   ; no reader found

.org 0x27E22F
FxTiles_27E22F:
.incbin "../../../build/gfx/battle_anims/27E22F.png.bin"
    .db 0x91, 0x39   ; no reader found

.org 0x27E4B0
FxTiles_27E4B0:
.incbin "../../../build/gfx/battle_anims/27E4B0.png.bin"
    .db 0x24, 0x2D   ; no reader found

.org 0x27E6EF
FxTiles_27E6EF:
.incbin "../../../build/gfx/battle_anims/27E6EF.png.bin"
    .db 0x00, 0xF9, 0x0D   ; no reader found

.org 0x27E78F
FxTiles_27E78F:
.incbin "../../../build/gfx/battle_anims/27E78F.png.bin"
    .db 0x53, 0x27   ; no reader found

.org 0x27E953
FxTiles_27E953:
.incbin "../../../build/gfx/battle_anims/27E953.png.bin"
    .db 0x09, 0x01   ; no reader found

.org 0x27EBE6
FxTiles_27EBE6:
.incbin "../../../build/gfx/battle_anims/27EBE6.png.bin"
    .db 0x4A, 0x30   ; no reader found

.org 0x27ED3D
FxTiles_27ED3D:
.incbin "../../../build/gfx/battle_anims/27ED3D.png.bin"
    .db 0x76, 0x1D   ; no reader found

.org 0x27F220
FxTiles_27F220:
.incbin "../../../build/gfx/battle_anims/27F220.png.bin"

.org 0x27F262
FxTiles_27F262:
.incbin "../../../build/gfx/battle_anims/27F262.png.bin"
    .db 0x51, 0x09   ; no reader found

.org 0x27F2AA
FxTiles_27F2AA:
.incbin "../../../build/gfx/battle_anims/27F2AA.png.bin"

.org 0x27F2F6
FxTiles_27F2F6:
.incbin "../../../build/gfx/battle_anims/27F2F6.png.bin"

.org 0x27F4E7
FxTiles_27F4E7:
.incbin "../../../build/gfx/battle_anims/27F4E7.png.bin"

.org 0x27F506
FxTiles_27F506:
.incbin "../../../build/gfx/battle_anims/27F506.png.bin"
    .db 0x65, 0x25   ; no reader found

.org 0x27F60E
FxTiles_27F60E:
.incbin "../../../build/gfx/battle_anims/27F60E.png.bin"
    .db 0x3D, 0x0C   ; no reader found

.org 0x27FAEF
FxTiles_27FAEF:
.incbin "../../../build/gfx/battle_anims/27FAEF.png.bin"
    .db 0x2E, 0x0C   ; no reader found

.org 0x27FB33
FxTiles_27FB33:
.incbin "../../../build/gfx/battle_anims/27FB33.png.bin"
    .db 0x00, 0x01, 0x00   ; no reader found

.org 0x27FCF0
FxTiles_27FCF0:
.incbin "../../../build/gfx/battle_anims/27FCF0.png.bin"
    .db 0x4F, 0x0B   ; no reader found

.org 0x27FD38
FxTiles_27FD38:
.incbin "../../../build/gfx/battle_anims/27FD38.png.bin"
    .db 0x69, 0x11   ; no reader found

.org 0x27FDF3
FxTiles_27FDF3:
.incbin "../../../build/gfx/battle_anims/27FDF3.png.bin"
    .db 0x00, 0x00   ; no reader found

.org 0x28027B
FxTiles_28027B:
.incbin "../../../build/gfx/battle_anims/28027B.png.bin"
    .db 0xA5, 0x15   ; no reader found

.org 0x28034F
FxTiles_28034F:
.incbin "../../../build/gfx/battle_anims/28034F.png.bin"
    .db 0xEE, 0x2C   ; no reader found

.org 0x2804E4
FxPal_2804E4:
    .dw 0x0FFF, 0x0EEE, 0x0FD7, 0x0F90

.org 0x2804EC
FxPal_2804EC:
    .dw 0x0FFF, 0x006F, 0x004D, 0x000B

.org 0x2804F4
FxPal_2804F4:
    .dw 0x0FFF, 0x00FF, 0x00CC, 0x0089

.org 0x2804FC
FxPal_2804FC:
    .dw 0x0FFF, 0x07F9, 0x04D0, 0x0150

.org 0x280504
FxPal_280504:
    .dw 0x0FFF, 0x00FF, 0x008F, 0x001D
    .db 0xFF, 0x0F, 0xFF, 0x00, 0x8F, 0x00, 0x1D, 0x00, 0xFF, 0x0F, 0xFF, 0x00, 0x8F, 0x00, 0x1D, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x00, 0x8F, 0x00, 0x1D, 0x00

.org 0x280524
FxPal_280524:
    .dw 0x0FFF, 0x0FFF, 0x0EC0, 0x0970

.org 0x28052C
FxPal_28052C:
    .dw 0x0FFF, 0x005F, 0x002D, 0x000B

.org 0x280534
FxPal_280534:
    .dw 0x0FFF, 0x00EF, 0x00BC, 0x0057

.org 0x28053C
FxPal_28053C:
    .dw 0x0FFF, 0x07F9, 0x04D0, 0x0150

.org 0x280544
FxPal_280544:
    .dw 0x0FFF, 0x08F0, 0x04A0, 0x0060

.org 0x28054C
FxPal_28054C:
    .dw 0x0FFF, 0x005F, 0x002D, 0x002B

.org 0x280554
FxPal_280554:
    .dw 0x0FFF, 0x0FC3, 0x0F81, 0x0F40

.org 0x28055C
FxPal_28055C:
    .dw 0x0FFF, 0x00FF, 0x00AB, 0x0066

.org 0x280564
FxPal_280564:
    .dw 0x0FFF, 0x0CF6, 0x0580, 0x0050
    .db 0xFF, 0x0F, 0xF6, 0x0C, 0xA0, 0x05, 0x50, 0x00, 0xFF, 0x0F, 0xF6, 0x0C, 0xA0, 0x05, 0x50, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xF6, 0x0C, 0xA0, 0x05, 0x50, 0x00

.org 0x280584
FxPal_280584:
    .dw 0x0FFF, 0x03FF, 0x00BC, 0x0057
    .db 0xFF, 0x0F, 0xFF, 0x03, 0xBC, 0x00, 0x57, 0x00, 0xFF, 0x0F, 0xFF, 0x03, 0xBC, 0x00, 0x57, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x03, 0xBC, 0x00, 0x57, 0x00

.org 0x2805A4
FxPal_2805A4:
    .dw 0x0FFF, 0x0EEE, 0x0FC8, 0x0F93

.org 0x2805AC
FxPal_2805AC:
    .dw 0x0FFF, 0x006F, 0x004E, 0x002C

.org 0x2805B4
FxPal_2805B4:
    .dw 0x0FFF, 0x00FF, 0x00BC, 0x0088

.org 0x2805BC
FxPal_2805BC:
    .dw 0x0FFF, 0x07F9, 0x04D0, 0x0150

.org 0x2805C4
FxPal_2805C4:
    .dw 0x0FFF, 0x0FFF, 0x03F0, 0x0150
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xF0, 0x03, 0x50, 0x01, 0xFF, 0x0F, 0xFF, 0x0F, 0xF0, 0x03, 0x50, 0x01   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xF0, 0x03, 0x50, 0x01

.org 0x2805E4
FxPal_2805E4:
    .dw 0x0FFF, 0x0456, 0x0047, 0x0043
    .db 0xFF, 0x0F, 0x56, 0x04, 0x47, 0x00, 0x43, 0x00, 0xFF, 0x0F, 0x56, 0x04, 0x47, 0x00, 0x43, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0x56, 0x04, 0x47, 0x00, 0x43, 0x00

.org 0x280604
FxPal_280604:
    .dw 0x0FFF, 0x0DDD, 0x0888, 0x0222

.org 0x28060C
FxPal_28060C:
    .dw 0x0FFF, 0x004F, 0x003B, 0x0028

.org 0x280614
FxPal_280614:
    .dw 0x0FFF, 0x0FC7, 0x0EA3, 0x0D80

.org 0x28061C
FxPal_28061C:
    .dw 0x0FFF, 0x00FF, 0x00BB, 0x0066

.org 0x280624
FxPal_280624:
    .dw 0x0FFF, 0x0FC6, 0x0F62, 0x0F20

.org 0x28062C
FxPal_28062C:
    .dw 0x0FFF, 0x0887, 0x0554, 0x0222

.org 0x280634
FxPal_280634:
    .dw 0x0FFF, 0x00FF, 0x00BA, 0x0066
    .db 0xFF, 0x0F, 0xFF, 0x00, 0xBA, 0x00, 0x66, 0x00   ; no reader found

.org 0x280644
FxPal_280644:
    .dw 0x0FFF, 0x0BDF, 0x04AC, 0x0068
    .db 0xFF, 0x0F, 0xDF, 0x0B, 0xAC, 0x04, 0x68, 0x00, 0xFF, 0x0F, 0xDF, 0x0B, 0xAC, 0x04, 0x68, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xDF, 0x0B, 0xAC, 0x04, 0x68, 0x00

.org 0x280664
FxPal_280664:
    .dw 0x0FFF, 0x0FD0, 0x0D80, 0x0B30

.org 0x28066C
FxPal_28066C:
    .dw 0x0FFF, 0x006F, 0x003C, 0x0009

.org 0x280674
FxPal_280674:
    .dw 0x0FFF, 0x0666, 0x0343, 0x0021

.org 0x28067C
FxPal_28067C:
    .dw 0x0FFF, 0x0EEE, 0x0B99, 0x0754

.org 0x280684
FxPal_280684:
    .dw 0x0FFF, 0x00F0, 0x00A0, 0x0060

.org 0x28068C
FxPal_28068C:
    .dw 0x0FFF, 0x004F, 0x003C, 0x0029

.org 0x280694
FxPal_280694:
    .dw 0x0FFF, 0x0FE0, 0x0F90, 0x0F40

.org 0x28069C
FxPal_28069C:
    .dw 0x0FFF, 0x00FF, 0x00BB, 0x0077

.org 0x2806A4
FxPal_2806A4:
    .dw 0x0FFF, 0x0ABA, 0x0566, 0x0021

.org 0x2806AC
FxPal_2806AC:
    .dw 0x0FFF, 0x007F, 0x0009, 0x0004

.org 0x2806B4
FxPal_2806B4:
    .dw 0x0FFF, 0x0FD9, 0x0C84, 0x0920

.org 0x2806BC
FxPal_2806BC:
    .dw 0x0FFF, 0x00FF, 0x00AA, 0x0078

.org 0x2806C4
FxPal_2806C4:
    .dw 0x0FFF, 0x0FFF, 0x0FDA, 0x0E93

.org 0x2806CC
FxPal_2806CC:
    .dw 0x0FFF, 0x007F, 0x005D, 0x003C

.org 0x2806D4
FxPal_2806D4:
    .dw 0x0FFF, 0x00FF, 0x00BC, 0x0089

.org 0x2806DC
FxPal_2806DC:
    .dw 0x0FFF, 0x07F9, 0x04D0, 0x0150

.org 0x2806E4
FxPal_2806E4:
    .dw 0x0FFF, 0x00FF, 0x00AA, 0x0033
    .db 0xFF, 0x0F, 0xFF, 0x00, 0xAA, 0x00, 0x33, 0x00, 0xFF, 0x0F, 0xFF, 0x00, 0xAA, 0x00, 0x33, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x00, 0xAA, 0x00, 0x33, 0x00

.org 0x280704
FxPal_280704:
    .dw 0x0FFF, 0x0FFF, 0x0B9F, 0x000A
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0x9F, 0x0B, 0x0A, 0x00, 0xFF, 0x0F, 0xFF, 0x0F, 0x9F, 0x0B, 0x0A, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0x9F, 0x0B, 0x0A, 0x00

.org 0x280724
FxPal_280724:
    .dw 0x0FFF, 0x05FB, 0x02B2, 0x0150
    .db 0xFF, 0x0F, 0xFB, 0x05, 0xB2, 0x02, 0x50, 0x01, 0xFF, 0x0F, 0xDA, 0x05, 0xB9, 0x04, 0x73, 0x03   ; no reader found
    .db 0xFF, 0x0F, 0xFB, 0x05, 0xB2, 0x02, 0x50, 0x01

.org 0x280744
FxPal_280744:
    .dw 0x0FFF, 0x0FFF, 0x0798, 0x0021

.org 0x28074C
FxPal_28074C:
    .dw 0x0FFF, 0x0FFF, 0x078D, 0x001B

.org 0x280754
FxPal_280754:
    .dw 0x0FFF, 0x0FFF, 0x0CA8, 0x0A61

.org 0x28075C
FxPal_28075C:
    .dw 0x0FFF, 0x0FFF, 0x07DE, 0x00BC

.org 0x280764
FxPal_280764:
    .dw 0x0FFF, 0x00FF, 0x0099, 0x0046

.org 0x28076C
FxPal_28076C:
    .dw 0x0FFF, 0x007F, 0x003F, 0x003A

.org 0x280774
FxPal_280774:
    .dw 0x0FFF, 0x0FC0, 0x0E70, 0x0E20

.org 0x28077C
FxPal_28077C:
    .dw 0x0FFF, 0x00E2, 0x0091, 0x0030

.org 0x280784
FxPal_280784:
    .dw 0x0FFF, 0x0FF8, 0x0FC0, 0x0F60

.org 0x28078C
FxPal_28078C:
    .dw 0x0FFF, 0x019F, 0x005F, 0x000C

.org 0x280794
FxPal_280794:
    .dw 0x0FFF, 0x0EEF, 0x00CF, 0x009A

.org 0x28079C
FxPal_28079C:
    .dw 0x0FFF, 0x0EF7, 0x00B1, 0x0050

.org 0x2807A4
FxPal_2807A4:
    .dw 0x0FFF, 0x0CBB, 0x0A99, 0x0877

.org 0x2807AC
FxPal_2807AC:
    .dw 0x0FFF, 0x0765, 0x0443, 0x0221
    .db 0xFF, 0x0F, 0x65, 0x07, 0x43, 0x04, 0x21, 0x02, 0xFF, 0x0F, 0x65, 0x07, 0x43, 0x04, 0x21, 0x02   ; no reader found

.org 0x2807C4
FxPal_2807C4:
    .dw 0x0000, 0x0F99, 0x002F, 0x0009
    .db 0x00, 0x0F, 0xFF, 0x0F, 0x88, 0x08, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   ; no reader found
    .db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.org 0x2807E4
FxPal_2807E4:
    .dw 0x0FFF, 0x0FB6, 0x0F70, 0x0F30

.org 0x2807EC
FxPal_2807EC:
    .dw 0x0FFF, 0x0532, 0x0321, 0x0110

.org 0x2807F4
FxPal_2807F4:
    .dw 0x0FFF, 0x00ED, 0x0098, 0x0043
    .db 0xFF, 0x0F, 0xED, 0x00, 0x98, 0x00, 0x43, 0x00   ; no reader found

.org 0x280804
FxPal_280804:
    .dw 0x0FFF, 0x0FFF, 0x0BBA, 0x0555
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xBA, 0x0B, 0x55, 0x05, 0xFF, 0x0F, 0xFF, 0x0F, 0xBA, 0x0B, 0x55, 0x05   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xBA, 0x0B, 0x55, 0x05

.org 0x280824
FxPal_280824:
    .dw 0x0FFF, 0x0FFF, 0x0999, 0x0333
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0x99, 0x09, 0x33, 0x03, 0xFF, 0x0F, 0xFF, 0x0F, 0x99, 0x09, 0x33, 0x03   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0x99, 0x09, 0x33, 0x03

.org 0x280844
FxPal_280844:
    .dw 0x0FFF, 0x0FFF, 0x0EC3, 0x0F91

.org 0x28084C
FxPal_28084C:
    .dw 0x0FFF, 0x008F, 0x005E, 0x000C

.org 0x280854
FxPal_280854:
    .dw 0x0FFF, 0x00FF, 0x00BC, 0x0068

.org 0x28085C
FxPal_28085C:
    .dw 0x0FFF, 0x07F9, 0x04D0, 0x0150

.org 0x280864
FxPal_280864:
    .dw 0x0FFF, 0x00EF, 0x000F, 0x015B

.org 0x28086C
FxPal_28086C:
    .dw 0x0FFF, 0x0653, 0x0322, 0x0100
    .db 0xFF, 0x0F, 0x53, 0x06, 0x22, 0x03, 0x00, 0x01, 0xFF, 0x0F, 0x53, 0x06, 0x22, 0x03, 0x00, 0x01   ; no reader found

.org 0x280884
FxPal_280884:
    .dw 0x0FFF, 0x08F0, 0x04A0, 0x0050

.org 0x28088C
FxPal_28088C:
    .dw 0x0FFF, 0x098F, 0x044C, 0x000A

.org 0x280894
FxPal_280894:
    .dw 0x0FFF, 0x0FD0, 0x0C90, 0x0950

.org 0x28089C
FxPal_28089C:
    .dw 0x0FFF, 0x00FF, 0x00BB, 0x0077

.org 0x2808A4
FxPal_2808A4:
    .dw 0x0FFF, 0x0CF9, 0x05B0, 0x0370
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xFC, 0x0B, 0xF9, 0x08, 0xFF, 0x0F, 0xFF, 0x0F, 0xFC, 0x0B, 0xF9, 0x08   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xFC, 0x0B, 0xF9, 0x08

.org 0x2808C4
FxPal_2808C4:
    .dw 0x0FFF, 0x01F0, 0x0090, 0x0160

.org 0x2808CC
FxPal_2808CC:
    .dw 0x0FFF, 0x003F, 0x005D, 0x0018

.org 0x2808D4
FxPal_2808D4:
    .dw 0x0FFF, 0x0FC0, 0x0E90, 0x0C60

.org 0x2808DC
FxPal_2808DC:
    .dw 0x0FFF, 0x00FF, 0x00BB, 0x0076

.org 0x2808E4
FxPal_2808E4:
    .dw 0x0FFF, 0x0EB0, 0x0C70, 0x0840

.org 0x2808EC
FxPal_2808EC:
    .dw 0x0FFF, 0x0444, 0x0232, 0x0011

.org 0x2808F4
FxPal_2808F4:
    .dw 0x0FFF, 0x0DDC, 0x0A98, 0x0765
    .db 0xFF, 0x0F, 0xDC, 0x0D, 0x98, 0x0A, 0x65, 0x07   ; no reader found

.org 0x280904
FxPal_280904:
    .dw 0x0FFF, 0x0AE0, 0x0590, 0x0040
    .db 0xFF, 0x0F, 0xE0, 0x0A, 0x90, 0x05, 0x40, 0x00, 0xFF, 0x0F, 0xE0, 0x0A, 0x90, 0x05, 0x40, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xE0, 0x0A, 0x90, 0x05, 0x40, 0x00

.org 0x280924
FxPal_280924:
    .dw 0x0FFF, 0x0FEE, 0x0DB7, 0x0B70
    .db 0xFF, 0x0F, 0xEE, 0x0F, 0xCB, 0x0F, 0x98, 0x0C, 0xFF, 0x0F, 0xEE, 0x0F, 0xCB, 0x0F, 0x98, 0x0C   ; no reader found
    .db 0xFF, 0x0F, 0xEE, 0x0F, 0xCB, 0x0F, 0x98, 0x0C

.org 0x280944
FxPal_280944:
    .dw 0x0DDD, 0x0EA7, 0x0D72, 0x0A50
    .db 0xFF, 0x0F, 0xCA, 0x0E, 0xA7, 0x0E, 0x72, 0x0D, 0xFF, 0x0F, 0xCA, 0x0E, 0xA7, 0x0E, 0x72, 0x0D   ; no reader found
    .db 0xFF, 0x0F, 0xCA, 0x0E, 0xA7, 0x0E, 0x72, 0x0D

.org 0x280964
FxPal_280964:
    .dw 0x0FFF, 0x00FF, 0x00AB, 0x0055
    .db 0xFF, 0x0F, 0xFF, 0x00, 0xAB, 0x00, 0x55, 0x00, 0xFF, 0x0F, 0xFF, 0x00, 0xAB, 0x00, 0x55, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x00, 0xAB, 0x00, 0x55, 0x00

.org 0x280984
FxPal_280984:
    .dw 0x0FFF, 0x00EF, 0x006F, 0x000B
    .db 0xFF, 0x0F, 0xEF, 0x00, 0x6F, 0x00, 0x0B, 0x00, 0xFF, 0x0F, 0xEF, 0x00, 0x6F, 0x00, 0x0B, 0x00   ; no reader found
    .db 0xFF, 0x0F, 0xEF, 0x00, 0x6F, 0x00, 0x0B, 0x00

.org 0x2809A4
FxPal_2809A4:
    .dw 0x0FFF, 0x00EF, 0x000F, 0x015B

.org 0x2809AC
FxPal_2809AC:
    .dw 0x0FFF, 0x0788, 0x0243, 0x0022
    .db 0xFF, 0x0F, 0x88, 0x07, 0x43, 0x02, 0x22, 0x00, 0xFF, 0x0F, 0x88, 0x07, 0x43, 0x02, 0x22, 0x00   ; no reader found

.org 0x2809C4
FxPal_2809C4:
    .dw 0x0540, 0x0EEE, 0x0FC9, 0x0F84

.org 0x2809CC
FxPal_2809CC:
    .dw 0x0FFF, 0x005F, 0x004D, 0x003B

.org 0x2809D4
FxPal_2809D4:
    .dw 0x0FFF, 0x00FF, 0x00CC, 0x0089

.org 0x2809DC
FxPal_2809DC:
    .dw 0x0FFF, 0x07F9, 0x04D0, 0x0150

.org 0x2809E4
FxPal_2809E4:
    .dw 0x0FFF, 0x0FFF, 0x0666, 0x0322
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0x66, 0x06, 0x22, 0x03, 0xFF, 0x0F, 0xFF, 0x0F, 0x66, 0x06, 0x22, 0x03   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0x66, 0x06, 0x22, 0x03

.org 0x280A04
FxPal_280A04:
    .dw 0x0FFF, 0x0FCF, 0x0B79, 0x0532
    .db 0xFF, 0x0F, 0xCF, 0x0F, 0x79, 0x0B, 0x32, 0x05, 0xFF, 0x0F, 0xCF, 0x0F, 0x79, 0x0B, 0x32, 0x05   ; no reader found
    .db 0xFF, 0x0F, 0xCF, 0x0F, 0x79, 0x0B, 0x32, 0x05

.org 0x280A24
FxPal_280A24:
    .dw 0x0FFF, 0x0FFE, 0x0FA5, 0x0D91
    .db 0xFF, 0x0F, 0xFE, 0x0F, 0xA5, 0x0F, 0x91, 0x0D, 0xFF, 0x0F, 0xFE, 0x0F, 0xA5, 0x0F, 0x91, 0x0D   ; no reader found
    .db 0xFF, 0x0F, 0xFE, 0x0F, 0xA5, 0x0F, 0x91, 0x0D

.org 0x280A44
FxPal_280A44:
    .dw 0x0FFF, 0x0FD8, 0x0D84, 0x0333
    .db 0xFF, 0x0F, 0xD8, 0x0F, 0x84, 0x0D, 0x33, 0x03, 0xFF, 0x0F, 0xD8, 0x0F, 0x84, 0x0D, 0x33, 0x03   ; no reader found
    .db 0xFF, 0x0F, 0xD8, 0x0F, 0x84, 0x0D, 0x33, 0x03

.org 0x280A64
FxPal_280A64:
    .dw 0x0FFF, 0x00F0, 0x00A0, 0x0050

.org 0x280A6C
FxPal_280A6C:
    .dw 0x0FFF, 0x004F, 0x002C, 0x0029

.org 0x280A74
FxPal_280A74:
    .dw 0x0FFF, 0x0FD0, 0x0EA0, 0x0E70

.org 0x280A7C
FxPal_280A7C:
    .dw 0x0FFF, 0x00FF, 0x00BB, 0x0076

.org 0x280A84
FxPal_280A84:
    .dw 0x0FFF, 0x0FFF, 0x08D0, 0x0590
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xD0, 0x08, 0x90, 0x05, 0xFF, 0x0F, 0xFF, 0x0F, 0xD0, 0x08, 0x90, 0x05   ; no reader found
    .db 0xFF, 0x0F, 0xFF, 0x0F, 0xD0, 0x08, 0x90, 0x05

.org 0x280AA4
FxPal_280AA4:
    .dw 0x0BBB, 0x0FC6, 0x0F70, 0x0B10
    .db 0xFF, 0x0F, 0xC6, 0x0F, 0x70, 0x0F, 0x10, 0x0B, 0xFF, 0x0F, 0xC6, 0x0F, 0x70, 0x0F, 0x10, 0x0B   ; no reader found
    .db 0xFF, 0x0F, 0xC6, 0x0F, 0x70, 0x0F, 0x10, 0x0B

.org 0x280AC4
FxPal_280AC4:
    .dw 0x0FFF, 0x00FF, 0x00BB, 0x0177

.org 0x280ACC
FxPal_280ACC:
    .dw 0x0FFF, 0x005E, 0x002B, 0x0008

.org 0x280AD4
FxPal_280AD4:
    .dw 0x0FFF, 0x0FD5, 0x0FA2, 0x0F50

.org 0x280ADC
FxPal_280ADC:
    .dw 0x0FFF, 0x00E0, 0x00A0, 0x0050

.org 0x280AE4
FxPal_280AE4:
    .dw 0x0FFF, 0x0FF8, 0x0FB4, 0x0E80
    .db 0xFF, 0x0F, 0xF8, 0x0F, 0xB4, 0x0F, 0x80, 0x0E, 0xFF, 0x0F, 0xF8, 0x0F, 0xB4, 0x0F, 0x80, 0x0E   ; no reader found
    .db 0xFF, 0x0F, 0xF8, 0x0F, 0xB4, 0x0F, 0x80, 0x0E
FxMono_280B04:
    .db 0x00, 0x01, 0x02, 0x06   ; no reader found
FxMono_280B08:
    .db 0x00, 0x00, 0x03, 0x06   ; no reader found
FxMono_280B0C:
    .db 0x00, 0x01, 0x03, 0x05   ; no reader found
FxMono_280B10:
    .db 0x00, 0x01, 0x03, 0x06   ; no reader found
FxMono_280B14:
    .db 0x00, 0x02, 0x03, 0x06   ; no reader found
FxMono_280B18:
    .db 0x00, 0x01, 0x04, 0x06   ; no reader found
FxMono_280B1C:
    .db 0x07, 0x07, 0x07, 0x07   ; no reader found
FxMono_280B20:
    .db 0x00, 0x02, 0x04, 0x06   ; no reader found
FxMono_280B24:
    .db 0x00, 0x03, 0x04, 0x06   ; no reader found
FxMono_280B28:
    .db 0x00, 0x00, 0x01, 0x03   ; no reader found
FxMono_280B2C:
    .db 0x00, 0x00, 0x02, 0x03   ; no reader found

.org 0x280B30
FxScript_280B30:
    .db 60   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,  104,    4
    .db   4,    0,   72,    4
    .db   0,    3,   76,   -4
    .db   0,    3,   84,    8
    .db   0,    3,   68,    8
    .db   0,    3,   96,    4
    .db   0,    3,   72,   16
    .db   4,    0,   36,    4
    .db   0,    4,   52,    4
    .db   0,    4,   80,    8
    .db   0,    4,   36,    8
    .db   4,    4,   24,    0
    .db   4,    5,    0,    0
    .db   0,    3,   -8,   -8
    .db   0,    3,  -12,    0
    .db   0,    3,   -8,    8
    .db   0,    3,    0,   16
    .db   3,    3,    0,  -16
    .db   0,    2,  -28,    0
    .db   0,    2,  -24,  -16
    .db   0,    2,  -24,   16
    .db   0,    2,  -12,  -28
    .db   3,    2,  -12,   28
    .db   0,    1,  -36,   24
    .db   0,    1,  -20,  -40
    .db   0,    1,  -44,    0
    .db   0,    1,  -40,  -24
    .db   3,    1,  -16,   36
    .db   0,    4,  -36,   24
    .db   0,    4,  -44,    0
    .db   0,    4,  -40,  -24
    .db   0,    4,  -20,  -40
    .db   3,    4,  -16,   36
    .db  10, 0xFF,  -16,   36
    .db   4,    8,   -4,  -24
    .db   3,    9,  -36,    4
    .db   0,   10,  -52,    8
    .db   4,   11,    0,   20
    .db   3,   12,  -20,   -8
    .db   4,   13,  -36,  -20

.org 0x280BD1
FxScript_280BD1:
    .db 92   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   72,   -8
    .db   4,    1,   72,    8
    .db   0,    0,   64,  -16
    .db   4,    1,   64,   16
    .db   0,    0,   56,  -16
    .db   4,    1,   56,   16
    .db   0,    0,   48,  -16
    .db   4,    1,   48,   16
    .db   0,    0,   40,   -8
    .db   4,    1,   40,    8
    .db   4,    1,   32,    0
    .db   0,    0,   24,    8
    .db   4,    1,   24,   -8
    .db   0,    0,   16,   16
    .db   4,    1,   16,  -16
    .db   0,    0,    8,   16
    .db   4,    1,    8,  -16
    .db   0,    0,    0,   16
    .db   4,    1,    0,  -16
    .db   0,    0,   -8,    8
    .db   4,    1,   -8,   -8
    .db   4,    0,  -16,    0
    .db   8, 0xFF,  -16,    0
    .db   0,    0,  -32,  -32
    .db   4,    1,  -32,   32
    .db   0,    0,   -8,  -24
    .db   4,    1,  -56,   24
    .db   0,    0,    0,    0
    .db   4,    1,  -64,    0
    .db   0,    0,    8,   24
    .db   4,    1,  -56,  -24
    .db   0,    0,  -32,   32
    .db   4,    1,  -32,  -32
    .db   0,    0,  -56,   24
    .db   4,    1,   -8,  -24
    .db   0,    0,  -64,    0
    .db   4,    1,    0,    0
    .db   0,    0,  -56,  -24
    .db   4,    1,   -8,   24
    .db   0,    0,  -32,   32
    .db   4,    1,  -32,  -32

.org 0x280C76
FxScript_280C76:
    .db 36   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,  -32,    0
    .db   4,    1,  -32,    0
    .db   0,    4,  -52,    0
    .db   4,    2,  -36,    0
    .db   0,    4,  -52,    0
    .db   4,    5,  -32,    0
    .db   4,    3,  -28,    0
    .db   4,    0,  -32,    0
    .db   4,    1,  -32,    0
    .db   0,    4,  -48,    0
    .db   4,    2,  -32,    0
    .db   4,    2,  -32,    0

.org 0x280CA7
FxScript_280CA7:
    .db 80   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   32,  -48
    .db   4,    1,   32,   56
    .db   0,    1,   32,   32
    .db   4,    0,   32,  -32
    .db   0,    1,   32,   16
    .db   4,    0,   32,  -16
    .db   0,    1,   32,    0
    .db   4,    0,   32,    0
    .db   0,    2,   32,    0
    .db   0,    1,   32,  -16
    .db   4,    0,   32,   16
    .db   0,    2,   32,    0
    .db   0,    1,   32,  -40
    .db   4,    0,   32,   40
    .db   0,    1,   32,  -48
    .db   0,    0,   32,   48
    .db   4,    2,   32,    0
    .db   4,    2,   32,    0
    .db   4,    9,   32,    0
    .db   0,    4,   40,   -8
    .db   0,    3,   32,    0
    .db   4,    5,   32,    0
    .db   0,    8,   32,    0
    .db   0,    7,   24,    0
    .db   0,    3,   24,   -8
    .db   0,    4,   56,  -24
    .db   4,    5,   48,   16
    .db   0,    8,   32,   -8
    .db   0,    7,    8,    0
    .db   0,    6,   24,    8
    .db   0,    3,    8,  -24
    .db   0,    4,   72,  -40
    .db   4,    5,   64,   32
    .db   0,    7,   48,    0
    .db   0,    8,   32,    8
    .db   0,    8,   32,  -32
    .db   0,    7,  -24,    0
    .db   0,    6,    8,   24
    .db   0,    4,   40,   -8
    .db   0,    3,   -8,  -40
    .db   4,    5,   64,   32
    .db   0,    8,   32,   32
    .db   0,    8,   32,  -48
    .db   0,    7,   80,    0
    .db   0,    7,   24,    0
    .db   0,    3,   24,   -8
    .db   0,    6,   -8,   40
    .db   0,    4,   56,  -24
    .db   4,    5,   40,    8
    .db   0,    8,   32,    0
    .db   0,    6,   24,    8
    .db   0,    8,   32,   48
    .db   0,    7,   -8,    0
    .db   0,    4,   72,  -40
    .db   0,    5,   56,   24
    .db   4,    3,    8,  -24
    .db   0,    8,   32,   16
    .db   0,    8,   32,  -24
    .db   0,    7,   40,    0
    .db   0,    5,   72,   40
    .db   0,    4,   40,   -8
    .db   0,    3,   -8,  -40
    .db   4,    6,    8,   24
    .db   0,    8,   32,   40
    .db   0,    8,   32,  -48
    .db   0,    7,   16,    0
    .db   0,    7,   72,    0
    .db   0,    4,   56,  -24
    .db   0,    3,   24,   -8
    .db   4,    6,   -8,   40
    .db   0,    8,   32,    8
    .db   0,    7,   -8,    0
    .db   0,    4,   72,  -40
    .db   0,    5,   40,    8
    .db   0,    3,    8,  -24
    .db   4,    6,   24,    8
    .db   0,    8,   32,   -8
    .db   0,    7,  -32,    0
    .db   0,    7,   40,    0
    .db   0,    5,   56,   24
    .db   0,    3,   -8,  -40
    .db   4,    6,    8,   24
    .db   0,    8,   32,  -32
    .db   0,    7,   64,    0
    .db   0,    5,   80,   48
    .db   4,    6,   -8,   40

.org 0x280E00
FxScript_280E00:
    .db 21   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,  -32,   20
    .db   4,    1,  -32,   20
    .db   5,    2,  -32,   20
    .db   3,    3,  -32,   20
    .db   5,    4,  -32,   20

.org 0x280E15
FxScript_280E15:
    .db 68   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   32,    0
    .db   0,    0,   32,   -8
    .db   4,    0,   24,    8
    .db   0,    0,   24,  -16
    .db   0,    0,   32,    0
    .db   4,    0,   16,   16
    .db   0,    0,   16,  -24
    .db   0,    0,   24,   -8
    .db   4,    0,    8,   16
    .db   0,    0,    8,  -32
    .db   0,    0,   16,   -8
    .db   4,    0,    0,   16
    .db   0,    0,    0,  -32
    .db   0,    0,    8,   -8
    .db   4,    0,   -8,    8
    .db   0,    0,   -8,  -32
    .db   0,    0,    0,    0
    .db   4,    0,  -16,    0
    .db   0,    0,  -16,  -32
    .db   0,    0,   -8,    8
    .db   4,    0,  -24,   -8
    .db   0,    0,  -24,  -24
    .db   0,    0,  -16,   16
    .db   4,    0,  -32,   -8
    .db   0,    0,  -32,  -16
    .db   0,    0,  -24,   24
    .db   4,    0,  -40,   -8
    .db   0,    0,  -40,  -16
    .db   0,    0,  -32,   32
    .db   4,    0,  -48,    0
    .db   0,    0,  -48,  -16
    .db   0,    0,  -40,   32
    .db   4,    0,  -56,    8
    .db   0,    0,  -56,  -16
    .db   0,    0,  -48,   32
    .db   4,    0,  -64,   16
    .db   0,    0,  -64,  -24
    .db   0,    0,  -56,   24
    .db   4,    0,  -72,   16
    .db   0,    0,  -72,  -32
    .db   0,    0,  -64,   16
    .db   4,    0,  -80,    8
    .db   0,    0,  -72,    8
    .db   4,    0,  -80,  -24
    .db   4,    0,  -80,    0

.org 0x280ECA
FxScript_280ECA:
    .db 15   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,  -32,    0
    .db   3,    1,  -30,    0
    .db   6,    2,  -32,   -4
    .db   3,    3,  -34,    0

.org 0x280EDB
FxScript_280EDB:
    .db 15   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    2,   32,   12
    .db   3,    2,    0,   12
    .db   3,    2,  -32,   12
    .db   3,    2,  -56,   12
    .db   3,    2,  -76,   12

.org 0x280EF0
FxScript_280EF0:
    .db 52   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   72,   -8
    .db   4,    0,   64,  -16
    .db   4,    0,   56,  -16
    .db   4,    0,   48,  -16
    .db   4,    0,   40,   -8
    .db   4,    0,   32,    0
    .db   4,    0,   24,    8
    .db   4,    0,   16,   16
    .db   4,    0,    8,   16
    .db   4,    0,    0,   16
    .db   4,    0,   -8,    8
    .db   4,    0,  -16,    0
    .db   4,    0,  -24,   -8

.org 0x280F25
FxScript_280F25:
    .db 82   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   92,  -36
    .db   0,    0,   76,  -36
    .db   4,    0,   92,   28
    .db   0,    8,   72,    8
    .db   0,    8,   64,   32
    .db   0,    8,   64,  -24
    .db   0,    8,   48,  -16
    .db   0,    0,   44,  -36
    .db   0,    0,   92,   -4
    .db   4,    0,   60,   28
    .db   0,    7,   48,   40
    .db   0,    8,   56,   16
    .db   0,    8,   32,    8
    .db   0,    8,   56,  -32
    .db   0,    8,    8,  -16
    .db   0,    0,   -4,  -36
    .db   0,    0,   60,   -4
    .db   5,    0,   28,   28
    .db   0,    9,   -8,  -16
    .db   0,    8,   72,   -8
    .db   0,    8,   64,    8
    .db   0,    7,   56,  -32
    .db   0,    8,   32,   16
    .db   0,    7,   40,   40
    .db   0,    8,   56,   32
    .db   0,    8,    8,   40
    .db   0,    8,   72,  -40
    .db   0,    8,    8,  -40
    .db   0,    8,   32,  -32
    .db   0,    8,   72,   16
    .db   0,    8,  -56,  -16
    .db   0,    8,  -32,   16
    .db   0,    8,   24,  -20
    .db   0,    0,  -20,  -36
    .db   0,    0,   76,  -20
    .db   0,    0,   28,   -4
    .db   0,    0,   -4,   28
    .db   5,    0,   84,   36
    .db   0,    7,   68,   44
    .db   0,    8,   76,   28
    .db   0,    8,   52,    4
    .db   0,    7,   60,   20
    .db   0,    8,   68,    4
    .db   0,    7,   60,  -12
    .db   0,    7,   68,  -36
    .db   0,    8,   44,  -36
    .db   0,    8,   36,   -4
    .db   0,    8,   28,   12
    .db   0,    8,   32,  -32
    .db   0,    7,   20,   44
    .db   0,    8,   20,  -44
    .db   0,    8,   12,   28
    .db   0,    7,   12,   12
    .db   0,    8,  -68,  -20
    .db   0,    7,  -68,   12
    .db   0,    8,  -60,   -4
    .db   0,    8,  -44,   12
    .db   0,    7,  -44,   44
    .db   0,    8,  -32,  -16
    .db   0,    8,  -56,    8
    .db   0,    8,  -20,  -36
    .db   0,    7,  -20,  -16
    .db   0,    4,  -32,    0
    .db   0,    7,    0,  -32
    .db   0,    8,   -4,   12
    .db   0,    8,   -4,   36
    .db   0,    8,   12,  -20
    .db   0,    1,  -52,  -36
    .db   0,    1,   44,  -20
    .db   0,    1,   -4,   -4
    .db   0,    1,  -36,   28
    .db   5,    1,   36,   36
    .db   0,    8,  -28,   32
    .db   0,    7,   72,  -16
    .db   0,    7,   56,   -4
    .db   0,    8,   72,   20
    .db   0,    7,   52,  -20
    .db   0,    9,   44,   12
    .db   0,    8,  -68,  -24
    .db   0,    7,  -32,  -20
    .db   0,    9,   -8,  -32
    .db   0,    5,  -40,   32
    .db   0,    8,  -24,   24
    .db   0,    8,  -24,   48
    .db   0,    8,   64,  -32
    .db   0,    8,   64,   40
    .db   0,    8,  -40,  -40
    .db   0,    8,   32,  -40
    .db   0,    8,   24,    0
    .db   0,    8,    4,   16
    .db   0,    6,   56,   16
    .db   0,    7,    0,   48
    .db   0,    8,   24,   32
    .db   0,    8,   48,   24
    .db   0,    8,  -44,    8
    .db   0,    4,  -72,    0
    .db   0,    8,  -56,   40
    .db   0,    8,   -4,   32
    .db   0,    1,  -84,  -36
    .db   0,    1,   12,  -20
    .db   0,    1,  -36,   -4
    .db   0,    1,  -68,   28
    .db   5,    1,   20,   36
    .db   0,    8,  -32,  -40
    .db   0,    8,  -72,    8
    .db   0,    8,  -64,   40
    .db   0,    8,   24,  -40
    .db   0,    8,  -16,  -32
    .db   0,    8,   56,  -24
    .db   0,    8,   64,   32
    .db   0,    8,   24,   40
    .db   0,    8,  -16,   24
    .db   0,    7,    0,   -8
    .db   0,    8,  -32,    0
    .db   0,    8,   32,  -20
    .db   0,    9,   40,   28
    .db   0,    4,   72,    0
    .db   0,    7,  -56,  -36
    .db   0,    7,  -56,   28
    .db   0,    9,    4,   16
    .db   0,    8,    8,  -32
    .db   0,    8,   48,  -40
    .db   0,    8,   48,    8
    .db   0,    7,   72,  -40
    .db   0,    2,  -68,   -4
    .db   0,    2,  -20,  -20
    .db   5,    2,  -12,   36
    .db   0,    8,  -60,  -32
    .db   0,    8,   20,    0
    .db   0,    8,  -48,   -4
    .db   0,    8,   -8,   16
    .db   0,    7,   52,  -28
    .db   0,    7,  -28,  -28
    .db   0,    7,   44,    4
    .db   0,    8,  -24,   24
    .db   0,    7,   12,  -16
    .db   0,    7,  -68,   12
    .db   0,    7,   56,   40
    .db   0,    8,   48,   24
    .db   0,    2,  -52,  -20
    .db   5,    2,  -44,   36
    .db   0,    9,   56,  -40
    .db   0,    8,   48,    0
    .db   0,    8,   -8,  -40
    .db   0,    8,  -16,   40
    .db   0,    8,  -12,  -24
    .db   0,    8,  -72,   -4
    .db   0,    7,  -44,  -20
    .db   0,    8,   40,   24
    .db   0,    8,  -56,   40
    .db   0,    7,   72,  -16
    .db   0,    7,   56,   40
    .db   0,    8,    8,   16
    .db   0,    8,   20,  -16
    .db   0,    8,  -44,    8
    .db   0,    8,    8,  -32
    .db   0,    8,  -56,  -40
    .db   0,    8,  -28,    0
    .db   0,    2,  -76,   36
    .db   5,    2,  -84,  -20
    .db   0,    8,   56,   40
    .db   0,    8,   40,   12
    .db   0,    7,   48,  -16
    .db   0,    8,  -52,   24
    .db   0,    8,  -48,  -32
    .db   0,    7,  -64,    0
    .db   0,    8,    8,   32
    .db   0,    8,  -40,    8
    .db   0,    7,  -16,   40
    .db   0,    8,   24,  -40
    .db   0,    8,   24,   -4
    .db   0,    8,   72,    0
    .db   0,    8,   -4,  -20
    .db   0,    2,  -92,   36
    .db   5,    8,   64,  -40
    .db   0,    8,   16,   40
    .db   0,    8,  -64,   16
    .db   0,    8,   48,    0
    .db   0,    8,  -24,  -24
    .db   0,    8,    0,  -40
    .db   0,    7,   72,  -16
    .db   0,    7,  -20,   20
    .db   0,    8,  -32,    0
    .db   0,    8,   64,  -40
    .db   0,    8,  -48,   40
    .db   0,    8,    8,    8
    .db   0,    7,  -64,  -32
    .db   5,    7,   56,   40
    .db   0,    8,  -72,  -24
    .db   0,    8,  -24,   40
    .db   0,    8,  -64,   32
    .db   0,    8,   64,  -32
    .db   0,    8,    8,  -32
    .db   0,    8,   -8,   20
    .db   0,    8,   24,  -12
    .db   0,    8,  -56,    0
    .db   0,    8,   40,   32
    .db   5,    8,   64,   24
    .db   0,    8,   20,  -12
    .db   0,    8,  -56,  -16
    .db   0,    8,  -48,   32
    .db   0,    8,    0,  -40
    .db   0,    8,   64,   16
    .db   5,    8,   16,   32
    .db   0,    8,    8,    8
    .db   0,    8,  -40,   40
    .db   0,    8,   48,  -32
    .db   0,    8,  -72,    0
    .db   5,    8,   56,    8
    .db   0,    8,  -40,  -40
    .db   0,    8,  -56,    0
    .db   0,    8,   32,  -16
    .db   5,    8,   48,   32
    .db   0,    8,  -40,    0
    .db   5,    8,   16,  -32

.org 0x281282
FxScript_281282:
    .db 20   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,    0,    0
    .db   4,    1,   -8,    0
    .db   4,    2,  -16,    0
    .db   4,    3,  -48,    0
    .db   4,    4,  -56,    0

.org 0x281297
FxScript_281297:
    .db 72   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,   11,  -32,  -44
    .db   0,    0,    0,  -40
    .db   3,    0,  -64,  -40
    .db   0,   12,  -32,  -36
    .db   0,    1,  -64,  -24
    .db   3,    1,    0,  -24
    .db   0,   13,  -32,  -20
    .db   0,    3,  -64,    0
    .db   3,    3,    0,    0
    .db   0,   14,  -32,    0
    .db   0,    3,  -64,    0
    .db   5,    3,    0,    0
    .db   0,   15,  -32,    0
    .db   0,    4,  -64,    0
    .db   4,    4,    0,    0
    .db   0,   16,  -32,    0
    .db   0,    5,    0,    0
    .db   3,    5,  -64,    0
    .db   0,   17,  -32,    0
    .db   0,    6,  -64,    0
    .db   3,    6,    0,    0
    .db   0,   18,  -64,    0
    .db   0,    7,  -32,    0
    .db   5,   18,   -4,    0
    .db   0,    8,  -56,    0
    .db   0,    8,    8,    0
    .db   5,   19,  -44,    0
    .db   0,    9,   -8,    0
    .db   0,   14,  -16,    0
    .db   5,   14,  -68,    0
    .db   0,   15,    8,    0
    .db   0,   15,  -48,    0
    .db   5,   10,  -40,    0
    .db   0,   16,  -40,    0
    .db   0,    7,  -64,    0
    .db   5,    7,    8,    0
    .db   0,    8,  -68,    0
    .db   0,    8,   -4,    0
    .db   5,   17,  -28,    0
    .db   0,    9,  -20,    0
    .db   0,   14,  -12,    0
    .db   5,   14,  -68,    0
    .db   0,   15,  -68,    0
    .db   0,   15,    0,    0
    .db   5,   10,  -32,    0
    .db   0,   16,  -68,    0
    .db   0,   16,    4,    0
    .db   4,    4,  -32,    0
    .db   0,   17,    4,    0
    .db   0,   17,  -68,    0
    .db   4,    5,  -32,    0

.org 0x281364
FxScript_281364:
    .db 18   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    2,   72,    8
    .db   3,    2,   56,    8
    .db   3,    2,   40,    8
    .db   3,    2,   24,    8
    .db   3,    2,    8,    8
    .db   3,    2,  -24,    8

.org 0x28137D
FxScript_28137D:
    .db 19   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    1,   80,    0
    .db   3,    2,   40,    0
    .db   3,    1,   16,    0
    .db   3,    2,    0,    0
    .db   3,    1,   -8,    0
    .db   4,    0,  -16,    0

.org 0x281396
FxScript_281396:
    .db 56   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   72,    8
    .db   0,    0,   72,    0
    .db   4,    0,   64,    0
    .db   0,    0,   72,  -16
    .db   0,    0,   64,    8
    .db   4,    0,   56,   -8
    .db   0,    0,   64,  -24
    .db   0,    0,   56,   16
    .db   4,    0,   48,  -16
    .db   0,    0,   56,  -32
    .db   0,    0,   48,   24
    .db   4,    0,   40,  -16
    .db   0,    0,   48,  -40
    .db   0,    0,   40,   32
    .db   4,    0,   32,  -16
    .db   0,    0,   40,  -40
    .db   0,    0,   32,   32
    .db   4,    0,   24,   -8
    .db   0,    0,   32,  -40
    .db   0,    0,   24,   32
    .db   4,    0,   16,    0
    .db   0,    0,   24,  -40
    .db   0,    0,   16,   32
    .db   4,    0,    8,    8
    .db   0,    0,   16,  -32
    .db   0,    0,    8,   32
    .db   4,    0,    0,   16
    .db   0,    0,    8,  -24
    .db   0,    0,    0,   32
    .db   4,    0,   -8,   16
    .db   0,    0,    0,  -16
    .db   0,    0,   -8,   32
    .db   4,    0,  -16,   16
    .db   0,    0,   -8,   -8
    .db   0,    0,  -16,   32
    .db   4,    0,  -24,    8
    .db   0,    0,  -16,   -8
    .db   0,    0,  -24,   24
    .db   4,    0,  -32,    0

.org 0x281433
FxScript_281433:
    .db 26   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   28,    0
    .db   3,    2,   16,    0
    .db   0,    3,  -16,    0
    .db   0,    1,   -4,    0
    .db   0,    1,   20,    0
    .db   0,    1,   12,    0
    .db   0,    1,    4,    0
    .db   3,    0,   28,    0
    .db   0,    6,  -40,    0
    .db   0,    5,  -28,    0
    .db   0,    5,  -20,    0
    .db   0,    5,   12,    0
    .db   0,    5,    4,    0
    .db   0,    5,   -4,    0
    .db   0,    5,  -12,    0
    .db   3,    4,   24,    0
    .db   0,    7,  -72,    0
    .db   0,    5,  -60,    0
    .db   0,    5,  -52,    0
    .db   0,    5,  -44,    0
    .db   0,    5,  -36,    0
    .db   0,    5,  -28,    0
    .db   0,    5,  -20,    0
    .db   0,    5,  -12,    0
    .db   0,    5,   -4,    0
    .db   0,    5,    4,    0
    .db   0,    5,   12,    0
    .db   3,    4,   24,    0
    .db   0,    9,  -72,    0
    .db   0,    9,  -56,    0
    .db   0,    9,  -40,    0
    .db   0,    9,  -24,    0
    .db   0,    9,   -8,    0
    .db   0,    9,    8,    0
    .db   5,    8,   24,    0
    .db   0,    5,  -76,    0
    .db   0,    5,  -68,    0
    .db   0,    5,  -60,    0
    .db   0,    5,  -52,    0
    .db   0,    5,  -44,    0
    .db   0,    5,  -36,    0
    .db   0,    5,  -28,    0
    .db   0,    5,  -20,    0
    .db   0,    5,  -12,    0
    .db   0,    5,   12,    0
    .db   0,    5,    4,    0
    .db   0,    5,   -4,    0
    .db   5,    4,   24,    0
    .db   0,   15,  -60,    0
    .db   0,    1,  -76,    0
    .db   0,    1,  -68,    0
    .db   0,    1,  -60,    0
    .db   0,    1,  -52,    0
    .db   0,    1,  -44,    0
    .db   0,    1,   20,    0
    .db   0,    1,   12,    0
    .db   0,    1,    4,    0
    .db   0,    1,   -4,    0
    .db   0,    1,  -12,    0
    .db   0,    1,  -20,    0
    .db   0,    1,  -28,    0
    .db   0,    1,  -36,    0
    .db   4,    0,   28,    0

.org 0x281530
FxScript_281530:
    .db 24   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3, 0xFF,   24,   16
    .db   3,    0,    8,    8
    .db   0,    2,   -8,    8
    .db   3,    1,    8,    8
    .db   0,    2,  -32,    8
    .db   3,    0,    8,    8
    .db   0,    2,   -8,    8
    .db   0,    2,  -64,    8
    .db   3,    1,    8,    8
    .db   0,    2,  -40,    8
    .db   3,    1,    8,    8
    .db   0,    2,  -64,    8
    .db   3,    0,    8,    8
    .db   0,    2,  -80,    8
    .db   3,    0,    8,    8

.org 0x28156D
FxScript_28156D:
    .db 8   ; total ticks
    ;   ticks, frame, dx, dy
    .db   2,    0,  -32,    0
    .db   4,    1,  -32,    4
    .db   2,    2,  -28,    3

.org 0x28157A
FxScript_28157A:
    .db 54   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,  -35,   19
    .db   0,    1,  -35,   39
    .db   9,    2,  -30,   29
    .db   0,    0,  -35,   19
    .db   0,    0,  -31,   15
    .db   0,    1,  -35,   39
    .db   0,    1,  -31,   43
    .db   0,    2,  -30,   29
    .db   9,    2,  -26,   29
    .db   0,    0,  -35,   19
    .db   0,    0,  -31,   15
    .db   0,    0,  -27,   11
    .db   0,    1,  -35,   39
    .db   0,    1,  -31,   43
    .db   0,    1,  -27,   47
    .db   0,    2,  -30,   29
    .db   0,    2,  -22,   29
    .db   9,    2,  -26,   29
    .db   0,    0,  -27,   11
    .db   0,    0,  -31,   15
    .db   0,    1,  -27,   47
    .db   0,    1,  -31,   43
    .db   0,    2,  -26,   29
    .db   9,    2,  -22,   29
    .db   0,    0,  -27,   11
    .db   0,    1,  -27,   47
    .db   9,    2,  -22,   29
    .db   9, 0xFF,  -22,   29

.org 0x2815EB
FxScript_2815EB:
    .db 24   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,  -24,    0
    .db   3,    1,  -24,    0
    .db   0,    0,  -56,   24
    .db   3,    2,  -24,   -4
    .db   0,    1,  -56,   24
    .db   3,    3,  -24,    0
    .db   0,    0,  -52,  -24
    .db   3,    3,  -60,   24
    .db   3,    1,  -48,  -24
    .db   3,    2,  -48,  -24
    .db   3,    3,  -48,  -24

.org 0x281618
FxScript_281618:
    .db 25   ; total ticks
    ;   ticks, frame, dx, dy
    .db   6,    0,   32,    0
    .db   3,    0,   40,    0
    .db   4,    0,   16,    0
    .db   3,    0,   -8,    0
    .db   3,    0,  -40,    0
    .db   3,    0,  -56,    0
    .db   3,    0,  -80,    0

.org 0x281635
FxScript_281635:
    .db 11   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,    0,  -16
    .db   4,    1,  -32,    0
    .db   3,    2,  -48,    0

.org 0x281642
FxScript_281642:
    .db 34   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    5,    4,  -32
    .db   0,    5,    4,  -32
    .db   5,    5,   12,    0
    .db   0,    2,  -12,  -32
    .db   0,    1,   -4,  -32
    .db   0,    0,    4,  -32
    .db   0,    5,   12,    0
    .db   4,    5,   20,   32
    .db   0,    2,  -36,  -32
    .db   0,    6,   -4,  -32
    .db   0,    6,  -24,  -32
    .db   0,    6,  -12,  -32
    .db   0,    0,    4,  -32
    .db   0,    2,   -4,    0
    .db   0,    1,    4,    0
    .db   0,    0,   12,    0
    .db   4,    5,   20,   32
    .db   0,    2,  -68,  -32
    .db   0,    6,  -56,  -32
    .db   0,    6,  -40,  -32
    .db   0,    6,  -24,  -32
    .db   0,    6,   -8,  -32
    .db   0,    0,    4,  -32
    .db   0,    2,  -44,    0
    .db   0,    6,  -32,    0
    .db   0,    6,  -16,    0
    .db   0,    6,    0,    0
    .db   0,    0,   12,    0
    .db   0,    2,    4,   32
    .db   0,    1,   12,   32
    .db   3,    0,   20,   32
    .db   0,    6,  -72,  -32
    .db   0,    6,  -56,  -32
    .db   0,    6,  -40,  -32
    .db   0,    6,  -24,  -32
    .db   0,    6,   -8,  -32
    .db   0,    0,    4,  -32
    .db   0,    2,  -68,    0
    .db   0,    6,  -56,    0
    .db   0,    6,  -40,    0
    .db   0,    6,  -24,    0
    .db   0,    6,   -8,    0
    .db   0,    1,    4,    0
    .db   0,    0,   12,    0
    .db   0,    2,  -36,   32
    .db   0,    6,  -24,   32
    .db   0,    6,   -8,   32
    .db   0,    6,    8,   32
    .db   3,    0,   20,   32
    .db   0,    6,  -72,  -32
    .db   0,    6,  -56,  -32
    .db   0,    0,  -44,  -32
    .db   0,    6,  -72,    0
    .db   0,    6,  -56,    0
    .db   0,    6,  -40,    0
    .db   0,    6,  -24,    0
    .db   0,    6,   -8,    0
    .db   0,    0,    4,    0
    .db   0,    2,  -52,   32
    .db   0,    6,  -40,   32
    .db   0,    6,  -24,   32
    .db   0,    6,   -8,   32
    .db   0,    6,    8,   32
    .db   3,    0,   20,   32
    .db   0,    1,  -76,  -32
    .db   0,    0,  -68,  -32
    .db   0,    6,  -72,    0
    .db   0,    6,  -56,    0
    .db   0,    6,  -40,    0
    .db   0,    0,  -28,    0
    .db   0,    6,  -72,   32
    .db   0,    6,  -56,   32
    .db   0,    6,  -40,   32
    .db   0,    6,  -24,   32
    .db   0,    6,   -8,   32
    .db   0,    6,    8,   32
    .db   3,    0,   20,   32
    .db   0,    6,  -72,    0
    .db   0,    0,  -60,    0
    .db   0,    6,  -72,   32
    .db   0,    6,  -56,   32
    .db   0,    6,  -40,   32
    .db   3,    0,  -28,   32
    .db   0,    6,  -72,   32
    .db   3,    0,  -60,   32

.org 0x281797
FxScript_281797:
    .db 28   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   72,  -48
    .db   4,    0,   56,  -48
    .db   4,    0,   44,  -44
    .db   4,    0,   28,  -36
    .db   4,    0,   12,  -24
    .db   4,    0,    0,  -16
    .db   4,    0,  -16,    0

.org 0x2817B4
FxScript_2817B4:
    .db 21   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3, 0xFF,    0,    0
    .db   0,    2,    8,    8
    .db   3,    0,   20,    8
    .db   0,    2,  -24,    8
    .db   3,    1,   16,    8
    .db   0,    3,    0,    8
    .db   0,    2,  -56,    8
    .db   3,    0,   16,    8
    .db   0,    3,  -24,    8
    .db   0,    2,  -68,    8
    .db   3,    1,   16,    8
    .db   0,    3,  -52,    8
    .db   3,    0,   16,    8
    .db   0,    3,  -76,    8
    .db   3,    0,   16,    8

.org 0x2817F1
FxScript_2817F1:
    .db 55   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    2,  -12,   16
    .db   0,    1,  -32,   32
    .db   5,    4,  -76,   36
    .db   0,    0,  -76,   20
    .db   0,    3,  -56,   16
    .db   0,    1,  -32,   24
    .db   0,    4,  -12,   -4
    .db   5,    1,   12,   32
    .db   0,    2,  -76,   12
    .db   0,    4,  -56,   -8
    .db   0,    0,  -32,   12
    .db   0,    2,  -12,  -20
    .db   5,    1,   12,   16
    .db   0,    0,  -76,    0
    .db   0,    3,  -56,  -32
    .db   0,    1,  -32,  -12
    .db   0,    3,  -12,  -40
    .db   5,    2,   12,    4
    .db   0,    0,  -76,  -12
    .db   0,    4,  -44,   36
    .db   0,    1,  -32,  -32
    .db   0,    4,   -8,   28
    .db   5,    3,   12,   -8
    .db   0,    3,  -24,   36
    .db   0,    2,  -56,   28
    .db   0,    4,  -76,  -24
    .db   0,    0,  -44,   16
    .db   0,    2,  -32,  -36
    .db   0,    1,   -8,    0
    .db   5,    0,   12,  -20
    .db   0,    1,   -4,   36
    .db   0,    4,  -56,   16
    .db   0,    1,  -24,    0
    .db   0,    3,  -76,  -32
    .db   0,    4,  -44,  -12
    .db   0,    1,   -8,  -24
    .db   5,    2,   12,  -32
    .db   0,    3,   -4,   20
    .db   0,    4,  -56,   -4
    .db   5,    2,  -24,  -32
    .db   0,    2,   -4,   12
    .db   5,    4,  -56,  -20
    .db   5,    3,   -4,   -8
    .db   5,    1,   -4,  -28

.org 0x2818A2
FxScript_2818A2:
    .db 23   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   -4,  -26
    .db   5,    1,  -40,    0
    .db   4,    2,  -44,   -3
    .db   5,    3,   -8,    0
    .db   1,    4,    4,   13
    .db   4,    4,    4,   13

.org 0x2818BB
FxScript_2818BB:
    .db 43   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,  -48,  -16
    .db   0,    1,  -16,  -16
    .db   0,    2,  -16,   16
    .db   1,    3,  -48,   16
    .db   0,    0,  -48,  -16
    .db   0,    1,  -16,  -16
    .db   0,    2,  -16,   16
    .db   0,    3,  -48,   16
    .db   0,    4,  -60,  -28
    .db   0,    5,   -4,  -28
    .db   0,    6,   -4,   28
    .db   2,    7,  -60,   28
    .db   0,    0,  -56,  -24
    .db   0,    1,   -8,  -24
    .db   0,    2,   -8,   24
    .db   0,    3,  -56,   24
    .db   0,    4,  -68,  -36
    .db   0,    5,    4,  -36
    .db   0,    6,    4,   36
    .db   2,    7,  -68,   36
    .db   0,    0,  -48,  -16
    .db   0,    1,  -16,  -16
    .db   0,    2,  -16,   16
    .db   0,    3,  -48,   16
    .db   0,    4,  -60,  -28
    .db   0,    5,   -4,  -28
    .db   0,    6,   -4,   28
    .db   2,    7,  -60,   28
    .db   0,    4,  -52,  -20
    .db   0,    5,  -12,  -20
    .db   0,    6,  -12,   20
    .db   2,    7,  -52,   20
    .db   0,    0,  -48,  -16
    .db   0,    1,  -16,  -16
    .db   0,    2,  -16,   16
    .db   0,    3,  -48,   16
    .db   0,    4,  -60,  -28
    .db   0,    5,   -4,  -28
    .db   0,    6,   -4,   28
    .db   3,    7,  -60,   28
    .db   0,    0,  -56,  -24
    .db   0,    1,   -8,  -24
    .db   0,    2,   -8,   24
    .db   0,    3,  -56,   24
    .db   0,    4,  -68,  -36
    .db   0,    5,    4,  -36
    .db   0,    6,    4,   36
    .db   2,    7,  -68,   36
    .db   0,    0,  -48,  -16
    .db   0,    1,  -16,  -16
    .db   0,    2,  -16,   16
    .db   0,    3,  -48,   16
    .db   0,    4,  -60,  -28
    .db   0,    5,   -4,  -28
    .db   0,    6,   -4,   28
    .db   2,    7,  -60,   28
    .db   0,    4,  -52,  -20
    .db   0,    5,  -12,  -20
    .db   0,    6,  -12,   20
    .db   2,    7,  -52,   20
    .db   0,    0,  -48,  -16
    .db   0,    1,  -16,  -16
    .db   0,    2,  -16,   16
    .db   0,    3,  -48,   16
    .db   0,    4,  -60,  -28
    .db   0,    5,   -4,  -28
    .db   0,    6,   -4,   28
    .db   2,    7,  -60,   28
    .db   0,    0,  -56,  -24
    .db   0,    1,   -8,  -24
    .db   0,    2,   -8,   24
    .db   0,    3,  -56,   24
    .db   0,    4,  -68,  -36
    .db   0,    5,    4,  -36
    .db   0,    6,    4,   36
    .db   2,    7,  -68,   36
    .db   0,    4,  -60,  -28
    .db   0,    5,   -4,  -28
    .db   0,    6,   -4,   28
    .db   2,    7,  -60,   28
    .db   0,    3,  -48,   16
    .db   0,    2,  -16,   16
    .db   0,    1,  -16,  -16
    .db   2,    0,  -48,  -16
    .db   4, 0xFF,    0,   24
    .db   0,    8,  -64,   -8
    .db   0,    9,    0,    8
    .db   0,   10,  -24,  -32
    .db   2,   11,  -40,   32
    .db   0,    8,  -64,    0
    .db   0,    9,    0,    0
    .db   0,   10,  -32,  -32
    .db   1,   11,  -32,   32
    .db   0,    8,  -64,    8
    .db   0,    9,    0,   -8
    .db   0,   10,  -40,  -32
    .db   1,   11,  -24,   32
    .db   0,    8,  -64,    0
    .db   0,    9,    0,    0
    .db   0,   10,  -32,  -32
    .db   1,   11,  -32,   32
    .db   0,    8,  -64,   -8
    .db   0,    9,    0,    8
    .db   0,   10,  -24,  -32
    .db   1,   11,  -40,   32
    .db   0,    8,  -64,    0
    .db   0,    9,    0,    0
    .db   0,   10,  -32,  -32
    .db   1,   11,  -32,   32
    .db   0,    8,  -64,    8
    .db   0,    9,    0,   -8
    .db   0,   10,  -40,  -32
    .db   1,   11,  -24,   32
    .db   0,    8,  -64,    0
    .db   0,    9,    0,    0
    .db   0,   10,  -32,  -32
    .db   1,   11,  -32,   32
    .db   0,    8,  -64,   -8
    .db   0,    9,    0,    8
    .db   0,   10,  -24,  -32
    .db   1,   11,  -40,   32
    .db   0,    8,  -64,    0
    .db   0,    9,    0,    0
    .db   0,   10,  -32,  -32
    .db   1,   11,  -32,   32
    .db   0,    8,  -64,    8
    .db   0,    9,    0,   -8
    .db   0,   10,  -40,  -32
    .db   1,   11,  -24,   32
    .db   0,    8,  -64,    0
    .db   0,    9,    0,    0
    .db   0,   10,  -32,  -32
    .db   1,   11,  -32,   32

.org 0x281AD0
FxScript_281AD0:
    .db 129   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,   12,  -32,   40
    .db   0,    4,    0,   40
    .db   4,    4,  -64,   40
    .db   0,   13,  -32,   32
    .db   0,    5,    0,   32
    .db   4,    5,  -64,   32
    .db   0,   14,  -32,   24
    .db   0,    6,    0,   24
    .db   3,    6,  -64,   24
    .db   0,   15,  -32,   16
    .db   0,    7,    0,   16
    .db   4,    7,  -64,   16
    .db   0,    8,  -32,    0
    .db   0,    0,    0,    0
    .db   4,    0,  -64,    0
    .db   0,    9,  -32,    0
    .db   0,    1,    0,    0
    .db   5,    1,  -64,    0
    .db   0,   10,  -32,    0
    .db   0,    2,    0,    0
    .db   4,    2,  -64,    0
    .db   0,   11,  -32,    0
    .db   0,    3,    0,    0
    .db   5,    3,  -64,    0
    .db   0,    8,  -32,    0
    .db   0,    0,  -64,    0
    .db   5,    0,    0,    0
    .db   0,    9,  -32,    0
    .db   0,    1,    0,    0
    .db   5,    1,  -64,    0
    .db   0,   10,  -32,    0
    .db   0,    2,  -64,    0
    .db   5,    2,    0,    0
    .db   0,   11,  -32,    0
    .db   0,    3,  -64,    0
    .db   5,    3,    0,    0
    .db   0,    1,  -48,    0
    .db   0,    1,    8,    0
    .db   5,   10,  -40,    0
    .db   0,    2,   -8,    0
    .db   0,   11,  -16,    0
    .db   5,   11,  -64,    0
    .db   0,    8,    8,    0
    .db   0,    8,  -56,    0
    .db   5,    3,  -44,    0
    .db   0,    9,  -40,    0
    .db   0,    0,  -64,    0
    .db   4,    0,    8,    0
    .db   0,    1,  -68,    0
    .db   0,    1,   -4,    0
    .db   4,   10,  -28,    0
    .db   0,    2,  -16,    0
    .db   0,   11,  -12,    0
    .db   4,   11,  -72,    0
    .db   0,    8,  -64,    0
    .db   0,    8,    0,    0
    .db   4,    3,  -32,    0
    .db   0,    8,  -64,    0
    .db   0,    8,    0,    0
    .db   4,    0,  -32,    0
    .db   0,    9,  -64,    0
    .db   0,    9,    0,    0
    .db   4,    1,  -32,    0
    .db   0,   10,  -64,    0
    .db   0,   10,    0,    0
    .db   4,    2,  -32,    0
    .db   0,   11,  -64,    0
    .db   0,   11,    0,    0
    .db   4,    3,  -32,    0
    .db   0,    8,  -64,    0
    .db   0,    8,    0,    0
    .db   4,    0,  -32,    0
    .db   0,    9,  -64,    0
    .db   0,    9,    0,    0
    .db   4,    1,  -32,    0
    .db   0,   10,  -64,    0
    .db   0,   10,    0,    0
    .db   4,    2,  -32,    0
    .db   0,   11,  -64,    0
    .db   0,   11,    0,    0
    .db   4,    3,  -32,    0
    .db   0,   15,  -64,    0
    .db   0,   15,    0,    0
    .db   4,    7,  -32,    0
    .db   0,   14,  -64,    0
    .db   0,   14,    0,    0
    .db   3,    6,  -32,    0
    .db   0,   13,  -64,    0
    .db   0,   13,    0,    0
    .db   3,    5,  -32,    0
    .db   0,   12,  -64,    0
    .db   0,   12,  -32,    0
    .db   3,    4,  -32,    0

.org 0x281C45
FxScript_281C45:
    .db 24   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,   -8,  -24
    .db   3,    1,  -16,  -16
    .db   0,    4,    0,   32
    .db   3,    2,  -24,   -8
    .db   0,    5,  -16,   16
    .db   3,    3,  -40,    8
    .db   0,    6,  -24,    8
    .db   3,    1,  -56,   24
    .db   0,    7,  -40,   -8
    .db   3,    0,  -64,   32
    .db   3,    5,  -56,  -24
    .db   3,    4,  -64,  -32

.org 0x281C76
FxScript_281C76:
    .db 67   ; total ticks
    ;   ticks, frame, dx, dy
    .db   5,    0,  -32,    0
    .db   0,    6,  -44,    4
    .db   4,    1,  -32,    0
    .db   4,    1,  -32,    0
    .db   5,    2,  -32,    0
    .db   0,    5,  -20,    4
    .db   4,    3,  -32,    0
    .db   4,    3,  -32,    0
    .db   5,    4,  -32,    0
    .db   6, 0xFF,  -32,    0
    .db   5,    0,  -32,    0
    .db   0,    6,  -44,    4
    .db   4,    1,  -32,    0
    .db   4,    1,  -32,    0
    .db   5,    2,  -32,    0
    .db   0,    5,  -20,    4
    .db   4,    3,  -32,    0
    .db   4,    3,  -32,    0
    .db   4,    4,  -32,    0

.org 0x281CC3
FxScript_281CC3:
    .db 40   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    5,   72,   24
    .db   0,    6,    8,   40
    .db   0,    7,   24,   32
    .db   4,    9,   56,   32
    .db   0,    6,   40,   40
    .db   0,    7,   56,   32
    .db   0,    8,   16,   40
    .db   0,    9,   72,   24
    .db   0,    1,   56,    8
    .db   4,    2,   64,   16
    .db   0,    2,    8,    8
    .db   0,    0,   24,    8
    .db   0,    5,   -8,    0
    .db   0,    6,    8,   -8
    .db   0,    1,   48,    8
    .db   0,    0,   40,    8
    .db   0,    1,   64,    8
    .db   0,    7,   80,   16
    .db   0,    3,   32,    8
    .db   0,    8,   48,   40
    .db   0,    6,   64,   32
    .db   4,    9,   16,   40
    .db   0,    6,   16,  -16
    .db   0,    0,    0,    8
    .db   0,    8,    0,   -8
    .db   0,    0,   32,    8
    .db   0,    1,   56,    8
    .db   0,    1,   40,    8
    .db   0,    2,   -8,    0
    .db   0,    3,   16,    8
    .db   0,    6,   16,   40
    .db   0,    9,   40,   40
    .db   0,    4,   72,    8
    .db   0,    8,   64,   32
    .db   4,    6,   72,   24
    .db   0,    9,    0,   -8
    .db   0,    8,   16,  -24
    .db   0,    6,   40,  -24
    .db   0,    3,    8,    8
    .db   0,    1,   48,    8
    .db   0,    1,   32,    8
    .db   0,    0,   24,    8
    .db   0,    0,   -8,    8
    .db   0,    8,   72,   16
    .db   0,    7,   16,   40
    .db   0,    6,   40,   40
    .db   0,    9,   64,   32
    .db   4,    3,   64,    8
    .db   0,    3,    0,    8
    .db   0,    3,   56,    8
    .db   0,    0,   -8,    0
    .db   0,    1,   40,  -40
    .db   0,    1,   24,    8
    .db   0,    0,    8,    8
    .db   0,    1,   40,    8
    .db   0,    7,   40,   32
    .db   0,    6,   56,   32
    .db   0,    9,   72,   24
    .db   0,    2,   64,  -40
    .db   0,    6,   64,  -32
    .db   0,    9,   16,  -16
    .db   0,    8,   40,  -24
    .db   0,    5,   72,    8
    .db   4,    0,   48,  -40
    .db   0,    7,   64,   24
    .db   0,    6,   72,   16
    .db   0,    9,   24,  -16
    .db   0,    4,   64,  -40
    .db   0,    8,   56,  -32
    .db   0,    1,   48,  -40
    .db   0,    0,   56,    8
    .db   0,    0,   32,  -40
    .db   0,    0,   24,  -40
    .db   0,    1,   16,  -40
    .db   0,    1,   32,    8
    .db   0,    1,   16,    8
    .db   0,    0,    0,    8
    .db   0,    3,   -8,    0
    .db   0,    3,   40,    8
    .db   4,    5,   -8,   -8
    .db   0,    3,    0,    8
    .db   0,    0,   -8,    0
    .db   0,    1,   40,  -40
    .db   0,    0,    8,    8
    .db   0,    2,   64,  -40
    .db   0,    6,   64,  -32
    .db   0,    9,   16,  -16
    .db   0,    8,   40,  -24
    .db   4,    0,   48,  -40
    .db   0,    4,   64,  -40
    .db   0,    8,   56,  -32
    .db   0,    1,   48,  -40
    .db   0,    0,   32,  -40
    .db   0,    0,   24,  -40
    .db   4,    1,   16,  -40
    .db   0,    1,   16,  -40
    .db   4,    1,   32,  -39

.org 0x281E48
FxScript_281E48:
    .db 48   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,  -32,    0
    .db   3,    1,  -32,    0
    .db   3,    2,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    4,  -32,    0
    .db   3,    5,  -32,    0
    .db   3,    6,  -32,    0
    .db   3,    7,  -32,    0
    .db   3,    0,  -32,    0
    .db   3,    1,  -32,    0
    .db   3,    2,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    4,  -32,    0
    .db   3,    5,  -32,    0
    .db   3,    6,  -32,    0
    .db   3,    7,  -32,    0

.org 0x281E89
FxScript_281E89:
    .db 90   ; total ticks
    ;   ticks, frame, dx, dy
    .db   6,    0,   26,    0
    .db   4,    1,   26,    0
    .db   4,    2,   26,    0
    .db   3,    3,   26,    0
    .db   4,    2,   26,    0
    .db   4,    1,   26,    0
    .db   5,    0,   26,    0
    .db   3,    1,   26,    0
    .db   3,    2,   26,    0
    .db   2,    3,   26,    0
    .db   3,    2,   26,    0
    .db   2,    1,   26,    0
    .db   4,    0,   26,    0
    .db   2,    1,   26,    0
    .db   2,    2,   26,    0
    .db   1,    3,   26,    0
    .db   2,    2,   26,    0
    .db   2,    1,   26,    0
    .db   2,    0,   26,    0
    .db   2,    1,   26,    0
    .db   2,    2,   26,    0
    .db   1,    3,   26,    0
    .db   2,    2,   26,    0
    .db   2,    1,   26,    0
    .db   2,    0,   26,    0
    .db   2,    1,   26,    0
    .db   2,    2,   26,    0
    .db   2,    3,   26,    0
    .db   3,    3,   34,    0
    .db   3,    3,   32,    0
    .db   3,    3,  -32,    0
    .db   3,    2,  -48,    0
    .db   3,    1,  -64,    0

.org 0x281F0E
FxScript_281F0E:
    .db 128   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,  -32,    0
    .db   4,    1,  -32,    0
    .db   4,    0,  -40,    0
    .db   4,    1,  -40,    0
    .db   4,    0,  -48,    0
    .db   4,    1,  -48,    0
    .db   4,    0,  -56,    0
    .db   4,    1,  -56,    0
    .db   4,    0,  -56,    0
    .db   4,    1,  -56,    0
    .db   4,    0,  -56,    0
    .db   4,    1,  -56,    0
    .db   4,    0,  -48,    0
    .db   4,    1,  -48,    0
    .db   4,    0,  -40,    0
    .db   4,    1,  -40,    0
    .db   4,    0,  -32,    0
    .db   4,    1,  -32,    0
    .db   4,    0,  -24,    0
    .db   4,    1,  -24,    0
    .db   4,    0,  -16,    0
    .db   4,    1,  -16,    0
    .db   4,    0,   -8,    0
    .db   4,    1,   -8,    0
    .db   4,    0,   -8,    0
    .db   4,    1,   -8,    0
    .db   4,    0,   -8,    0
    .db   4,    1,   -8,    0
    .db   4,    0,  -16,    0
    .db   4,    1,  -16,    0
    .db   4,    0,  -24,    0
    .db   4,    1,  -24,    0

.org 0x281F8F
FxScript_281F8F:
    .db 15   ; total ticks
    ;   ticks, frame, dx, dy
    .db   2,    0,  -24,  -24
    .db   4,    1,  -40,    0
    .db   2,    2,  -48,    0
    .db   4,    3,  -28,    0
    .db   3,    4,  -28,    0

.org 0x281FA4
FxScript_281FA4:
    .db 56   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   32,    0
    .db   0,    0,   24,   -8
    .db   4,    1,   24,    8
    .db   0,    0,   16,  -16
    .db   4,    1,   16,   16
    .db   0,    0,    8,  -16
    .db   4,    1,    8,   16
    .db   0,    0,    0,  -16
    .db   4,    1,    0,   16
    .db   0,    0,   -8,   -8
    .db   4,    1,   -8,    8
    .db   4,    1,  -16,    0
    .db   0,    0,  -24,    8
    .db   4,    1,  -24,   -8
    .db   0,    0,  -32,   16
    .db   4,    1,  -32,  -16
    .db   0,    0,  -40,   16
    .db   4,    1,  -40,  -16
    .db   0,    0,  -48,   16
    .db   4,    1,  -48,  -16
    .db   0,    0,  -56,    8
    .db   4,    1,  -56,   -8
    .db   4,    1,  -64,    0
    .db   0,    0,  -72,   -8
    .db   4,    1,  -72,    8

.org 0x282009
FxScript_282009:
    .db 22   ; total ticks
    ;   ticks, frame, dx, dy
    .db   1,    0,   -8,  -24
    .db   1,    1,  -16,  -16
    .db   0,    4,    0,   32
    .db   1,    2,  -24,   -8
    .db   0,   12,  -64,   16
    .db   0,    5,  -16,   16
    .db   1,    3,  -40,    8
    .db   0,    8,  -40,  -32
    .db   0,   13,  -56,    8
    .db   0,    6,  -24,    8
    .db   3,    1,  -56,   24
    .db   0,    9,  -32,  -24
    .db   0,   13,  -40,   -8
    .db   0,    7,  -40,   -8
    .db   3,    0,  -64,   32
    .db   0,   10,  -24,   -8
    .db   0,   12,  -24,  -32
    .db   3,    5,  -56,  -24
    .db   0,   11,  -16,    0
    .db   3,    4,  -64,  -32
    .db   3,    9,    0,    8
    .db   3,    8,    8,   16

.org 0x282062
FxScript_282062:
    .db 54   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,  -10,   88
    .db   0,    1,    0,   83
    .db   9,    2,   10,   88
    .db   0,    0,  -10,   88
    .db   0,    0,  -14,   84
    .db   0,    1,    0,   79
    .db   0,    1,    0,   83
    .db   0,    2,   10,   88
    .db   9,    2,   14,   84
    .db   0,    0,  -10,   88
    .db   0,    0,  -14,   84
    .db   0,    0,  -18,   80
    .db   0,    1,    0,   75
    .db   0,    1,    0,   79
    .db   0,    1,    0,   83
    .db   0,    2,   10,   88
    .db   0,    2,   14,   84
    .db   9,    2,   18,   80
    .db   0,    0,  -18,   80
    .db   0,    0,  -14,   84
    .db   0,    1,    0,   75
    .db   0,    1,    0,   79
    .db   0,    2,   18,   80
    .db   9,    2,   14,   84
    .db   0,    0,  -18,   80
    .db   0,    1,    0,   75
    .db   9,    2,   18,   80
    .db   9, 0xFF,   18,   80

.org 0x2820D3
FxScript_2820D3:
    .db 122   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    4,  -32,   40
    .db   4,    5,  -32,   32
    .db   3,    6,  -32,   24
    .db   3,    7,  -32,   16
    .db   4,    0,  -32,    0
    .db   5,    1,  -32,    0
    .db   4,    2,  -32,    0
    .db   5,    3,  -32,    0
    .db   5,    0,  -32,    0
    .db   5,    1,  -32,    0
    .db   5,    2,  -32,    0
    .db   5,    3,  -32,    0
    .db   5,    7,  -32,   16
    .db   4,    6,  -32,   24
    .db   4,    5,  -32,   32
    .db   4,    6,  -32,   24
    .db   5,    7,  -32,   16
    .db   4,    0,  -32,    0
    .db   4,    1,  -32,    0
    .db   5,    2,  -32,    0
    .db   4,    3,  -32,    0
    .db   4,    0,  -32,    0
    .db   4,    1,  -32,    0
    .db   4,    2,  -32,    0
    .db   4,    3,  -32,    0
    .db   4,    7,  -32,   16
    .db   4,    6,  -32,   24
    .db   4,    5,  -32,   32
    .db   3,    4,  -32,   40

.org 0x282148
FxScript_282148:
    .db 12   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    2,   72,    8
    .db   3,    2,   32,    8
    .db   0,    3,   40,    8
    .db   3,    2,    8,    8
    .db   0,    3,   16,    8
    .db   3,    2,  -16,    8
    .db   3,    3,  -24,    8

.org 0x282165
FxScript_282165:
    .db 27   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   68,  -32
    .db   3,    1,   76,  -32
    .db   0,    0,   28,  -32
    .db   0,    6,   40,  -32
    .db   0,    6,   56,  -32
    .db   0,    6,   72,  -32
    .db   0,    0,   68,    0
    .db   3,    1,   76,    0
    .db   0,    0,   -4,  -32
    .db   0,    6,    8,  -32
    .db   0,    6,   24,  -32
    .db   0,    6,   40,  -32
    .db   0,    6,   56,  -32
    .db   0,    6,   72,  -32
    .db   0,    0,   28,    0
    .db   0,    6,   40,    0
    .db   0,    6,   56,    0
    .db   0,    6,   72,    0
    .db   0,    0,   68,   32
    .db   3,    1,   76,   32
    .db   0,    0,  -68,  -32
    .db   0,    6,  -56,  -32
    .db   0,    6,  -40,  -32
    .db   0,    6,  -24,  -32
    .db   0,    6,   -8,  -32
    .db   0,    6,    8,  -32
    .db   0,    6,   24,  -32
    .db   0,    6,   40,  -32
    .db   0,    6,   56,  -32
    .db   0,    6,   72,  -32
    .db   0,    0,  -20,    0
    .db   0,    6,   -8,    0
    .db   0,    6,    8,    0
    .db   0,    6,   24,    0
    .db   0,    6,   40,    0
    .db   0,    6,   56,    0
    .db   0,    6,   72,    0
    .db   0,    0,   28,   32
    .db   0,    6,   40,   32
    .db   0,    6,   56,   32
    .db   3,    6,   72,   32
    .db   0,    6,  -72,  -32
    .db   0,    6,  -24,  -32
    .db   0,    6,   -8,  -32
    .db   0,    6,    8,  -32
    .db   0,    6,   24,  -32
    .db   0,    6,  -56,  -32
    .db   0,    6,  -40,  -32
    .db   0,    2,   36,  -32
    .db   0,    0,  -52,    0
    .db   0,    6,  -40,    0
    .db   0,    6,  -24,    0
    .db   0,    6,   -8,    0
    .db   0,    6,    8,    0
    .db   0,    6,    8,    0
    .db   0,    6,   24,    0
    .db   0,    6,   40,    0
    .db   0,    6,   56,    0
    .db   0,    6,   72,    0
    .db   0,    0,   -4,   32
    .db   0,    6,    8,   32
    .db   0,    6,   24,   32
    .db   0,    6,   40,   32
    .db   0,    6,   56,   32
    .db   3,    6,   72,   32
    .db   0,    6,  -72,  -32
    .db   0,    6,  -56,  -32
    .db   0,    2,  -44,  -32
    .db   0,    6,  -72,    0
    .db   0,    6,  -56,    0
    .db   0,    6,  -40,    0
    .db   0,    6,  -24,    0
    .db   0,    6,   -8,    0
    .db   0,    6,    8,    0
    .db   0,    2,   20,    0
    .db   0,    0,  -68,   32
    .db   0,    6,  -56,   32
    .db   0,    6,  -40,   32
    .db   0,    6,  -24,   32
    .db   0,    6,   -8,   32
    .db   0,    6,    8,   32
    .db   0,    6,   24,   32
    .db   0,    6,   40,   32
    .db   0,    6,   56,   32
    .db   3,    6,   72,   32
    .db   0,    6,  -76,    0
    .db   0,    2,  -48,    0
    .db   0,    6,  -60,    0
    .db   0,    6,  -44,   32
    .db   0,    6,  -28,   32
    .db   0,    6,  -12,   32
    .db   0,    6,    4,   32
    .db   0,    6,   20,   32
    .db   0,    2,   32,   32
    .db   0,    6,  -76,   32
    .db   3,    6,  -60,   32
    .db   0,    2,  -12,   32
    .db   0,    6,  -40,   32
    .db   0,    6,  -24,   32
    .db   0,    6,  -72,   32
    .db   3,    6,  -56,   32
    .db   0,    6,  -72,   32
    .db   3,    2,  -60,   32

.org 0x282302
FxScript_282302:
    .db 25   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   72,  -32
    .db   4,    0,   72,   32
    .db   0,    0,   64,  -32
    .db   0,    0,   72,  -16
    .db   0,    0,   72,   16
    .db   4,    0,   64,   32
    .db   0,    0,   48,  -32
    .db   0,    0,   56,  -16
    .db   0,    0,   64,    0
    .db   0,    0,   56,   16
    .db   4,    0,   48,   32
    .db   0,    0,   32,  -32
    .db   0,    0,   40,  -16
    .db   0,    0,   48,    0
    .db   0,    0,   40,   16
    .db   3,    0,   32,   32
    .db   0,    0,   16,  -32
    .db   0,    0,   24,  -16
    .db   0,    0,   32,    0
    .db   0,    0,   24,   16
    .db   3,    0,   16,   32
    .db   0,    0,    0,  -32
    .db   0,    0,    8,  -16
    .db   0,    0,   16,    0
    .db   0,    0,    8,   16
    .db   3,    0,    0,   32
    .db   0,    0,  -24,  -32
    .db   0,    0,  -16,  -16
    .db   0,    0,   -8,    0
    .db   0,    0,  -16,   16
    .db   4,    0,  -24,   32

.org 0x28237F
FxScript_28237F:
    .db 32   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   16,  -16
    .db   0,    0,   52,  -34
    .db   4,    0,   48,   16
    .db   0,    0,   67,  -28
    .db   0,    0,   65,   14
    .db   0,    0,   30,   26
    .db   0,    0,    3,  -19
    .db   0,    0,   39,  -11
    .db   0,    0,   62,  -10
    .db   0,    0,   24,  -41
    .db   0,    0,    9,   10
    .db   0,    1,   16,  -16
    .db   0,    1,   52,  -34
    .db   4,    1,   48,   16
    .db   0,    0,   16,  -16
    .db   0,    1,   40,  -10
    .db   0,    1,   62,  -10
    .db   0,    1,   24,  -41
    .db   0,    2,    9,   10
    .db   0,    2,   52,  -35
    .db   4,    2,   48,   15
    .db   0,    0,   62,   -9
    .db   0,    0,   24,  -41
    .db   0,    2,   40,  -10
    .db   0,    3,    8,   10
    .db   0,    3,   52,  -34
    .db   4,    3,   49,   15
    .db   0,    2,   52,  -34
    .db   0,    2,   48,   15
    .db   0,    2,    8,   10
    .db   4,    3,   40,  -10
    .db   0,    1,   52,  -34
    .db   0,    1,   48,   16
    .db   0,    1,    8,   10
    .db   4,    2,   40,  -10
    .db   0,    0,   52,  -34
    .db   0,    0,   47,   15
    .db   0,    0,    8,   10
    .db   4,    1,   40,  -10
    .db   4,    0,   39,  -11

.org 0x282420
FxScript_282420:
    .db 49   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    4,   56,   16
    .db   0,    3,   68,    4
    .db   0,    3,   48,  -16
    .db   0,    2,   36,  -24
    .db   0,    2,   36,   20
    .db   0,    1,   60,   -8
    .db   4,    0,   24,    4
    .db   0,    2,   68,    4
    .db   0,    2,   48,  -16
    .db   0,    3,   36,  -24
    .db   0,    3,   36,   20
    .db   0,    4,   60,   -8
    .db   0,    2,   56,   16
    .db   4,    0,   24,    5
    .db   0,    4,   60,    8
    .db   0,    2,   52,  -20
    .db   4,    0,   24,    4
    .db   0,    3,   60,    8
    .db   0,    3,   52,  -20
    .db   4,    0,   24,    5
    .db   0,    1,   48,   24
    .db   2,    0,   24,    4
    .db   0,    4,   48,   24
    .db   4,    0,   24,    5
    .db   4,    0,   20,    4
    .db   4,    0,   16,    4
    .db   0,    1,   36,   -8
    .db   0,    3,   40,    4
    .db   4,    0,    0,    4
    .db   0,    4,   36,   -8
    .db   0,    3,   12,    4
    .db   0,    2,   40,    4
    .db   4,    0,  -32,    4
    .db   0,    1,   -8,   12
    .db   0,    2,   12,    4
    .db   4,    0,  -64,    4
    .db   0,    2,   20,    4
    .db   0,    4,   -8,   12
    .db   0,    2,    0,    0
    .db   4,    3,  -20,    4
    .db   0,    3,   20,    4
    .db   0,    3,    0,    0
    .db   3,    2,  -20,    4

.org 0x2824CD
FxScript_2824CD:
    .db 39   ; total ticks
    ;   ticks, frame, dx, dy
    .db   7,    0,   32,  -44
    .db   6,    1,   32,  -44
    .db   5,    2,   32,  -40
    .db   4,    3,   32,  -36
    .db   3,    4,   32,  -28
    .db   4,    5,   32,   -8
    .db   3,    6,   32,    0
    .db   3,    7,   32,    4
    .db   0,    8,   36,   20
    .db   4,    8,   28,   20

.org 0x2824F6
FxScript_2824F6:
    .db 68   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,   10,  -32,  -44
    .db   0,    0,  -32,  -44
    .db   0,    0,  -32,  -36
    .db   0,    0,  -32,  -28
    .db   3,   10,  -32,  -20
    .db   0,    0,  -32,  -44
    .db   0,    0,  -32,  -36
    .db   0,    0,  -32,  -28
    .db   0,    0,  -32,  -20
    .db   0,    0,  -32,  -12
    .db   0,    0,  -32,   -4
    .db   0,    0,  -32,    4
    .db   4,   10,  -32,   12
    .db   0,    0,  -32,  -44
    .db   0,    0,  -32,  -36
    .db   0,    0,  -32,  -28
    .db   0,    0,  -32,  -20
    .db   0,    0,  -32,  -12
    .db   0,    0,  -32,   -4
    .db   0,    0,  -32,    4
    .db   0,    0,  -32,   12
    .db   0,    0,  -32,   20
    .db   0,    0,  -32,   28
    .db   0,    0,  -32,   36
    .db   6,   10,  -32,   44
    .db   0,    0,  -32,  -20
    .db   0,    0,  -32,  -12
    .db   0,    0,  -32,   -4
    .db   0,    0,  -32,    4
    .db   0,    0,  -32,   12
    .db   0,    0,  -32,   20
    .db   0,    0,  -32,   28
    .db   0,    0,  -32,   36
    .db   4,   10,  -32,   44
    .db   0,    0,  -32,   36
    .db   0,    0,  -32,   28
    .db   0,    0,  -32,   20
    .db   0,    0,  -32,   12
    .db   0,    0,  -32,   44
    .db   5,    1,  -32,   36
    .db   5,    2,  -32,   28
    .db   5,    3,  -32,   20
    .db   0,    6,  -32,    4
    .db   5,    9,  -32,    4
    .db   0,    5,  -32,   16
    .db   0,    8,  -32,   16
    .db   0,    6,  -40,    4
    .db   4,    9,  -24,    4
    .db   0,    5,  -40,   16
    .db   0,    8,  -24,   16
    .db   0,    6,  -48,    4
    .db   0,    9,  -16,    4
    .db   0,    4,  -32,   32
    .db   4,    7,  -32,   32
    .db   0,    5,  -44,   16
    .db   0,    7,  -28,   32
    .db   0,    8,  -20,   16
    .db   0,    4,  -36,   32
    .db   0,    9,   -8,    4
    .db   4,    6,  -56,    4
    .db   0,    6,  -64,    4
    .db   0,    9,    0,    4
    .db   0,    4,  -40,   32
    .db   0,    5,  -52,   16
    .db   0,    7,  -24,   32
    .db   4,    8,  -12,   16
    .db   0,    4,  -44,   32
    .db   0,    5,  -56,   16
    .db   0,    7,  -20,   32
    .db   4,    8,   -8,   16
    .db   0,    4,  -52,   32
    .db   0,    5,  -64,   16
    .db   0,    7,  -16,   32
    .db   4,    8,   -4,   16
    .db   0,    4,  -60,   32
    .db   3,    7,   -4,   32

.org 0x282627
FxScript_282627:
    .db 10   ; total ticks
    ;   ticks, frame, dx, dy
    .db   2,    2,   72,    8
    .db   0,    2,   32,    8
    .db   3,    2,   72,    8
    .db   0,    2,   -8,    8
    .db   3,    2,   28,    8
    .db   0,    2,  -36,    8
    .db   2,    2,    0,    8

.org 0x282644
FxScript_282644:
    .db 20   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,   24,    0
    .db   5,    1,   12,    8
    .db   3,    2,    4,    8
    .db   3,    3,   -8,    8
    .db   3,    4,  -20,    0
    .db   3,    5,  -32,    0

.org 0x28265D
FxScript_28265D:
    .db 24   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,   32,    8
    .db   3,    0,   16,   -8
    .db   3,    0,    8,  -16
    .db   3,    0,    0,  -24
    .db   3,    0,  -16,  -32
    .db   3,    0,  -40,  -40
    .db   3,    0,  -56,  -48
    .db   3,    0,  -64,  -48

.org 0x28267E
FxScript_28267E:
    .db 88   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,    0,  -40
    .db   0,    4,    8,   32
    .db   0,    8,  -72,  -32
    .db   4,   12,  -64,   40
    .db   0,    1,  -16,  -32
    .db   0,    9,  -64,  -16
    .db   0,   13,  -48,   32
    .db   4,    5,    0,   16
    .db   0,    5,  -48,  -32
    .db   0,    1,  -64,   16
    .db   0,    9,  -16,   32
    .db   4,   13,    0,  -16
    .db   0,    4,  -64,  -40
    .db   0,    0,  -72,   32
    .db   0,    8,    0,   40
    .db   3,   12,    8,  -32
    .db   3,    0,   -8,  -24
    .db   3,    1,  -16,  -16
    .db   0,    4,    0,   32
    .db   3,    2,  -24,   -8
    .db   0,   12,  -64,   16
    .db   0,    5,  -16,   16
    .db   3,    3,  -40,    8
    .db   0,    8,  -40,  -32
    .db   0,   13,  -56,    8
    .db   0,    6,  -24,    8
    .db   3,    1,  -56,   24
    .db   0,    9,  -32,  -24
    .db   0,   13,  -40,   -8
    .db   0,    7,  -40,   -8
    .db   3,    0,  -64,   32
    .db   0,   10,  -24,   -8
    .db   0,   12,  -24,  -32
    .db   3,    5,  -56,  -24
    .db   0,   11,  -16,    0
    .db   3,    4,  -64,  -32
    .db   3,    9,    0,    8
    .db   0,    8,  -36,    4
    .db   0,    0,  -36,   -4
    .db   0,   12,  -28,    4
    .db   3,    4,  -28,   -4
    .db   0,    0,  -44,    4
    .db   0,    4,  -36,  -12
    .db   0,    8,  -28,   12
    .db   4,   12,  -20,   -4
    .db   0,    4,  -48,  -16
    .db   0,   12,  -16,  -16
    .db   0,    0,  -48,   16
    .db   3,    8,  -16,   16
    .db   0,    1,  -68,  -16
    .db   0,    5,  -16,  -36
    .db   0,    9,  -48,   36
    .db   3,   13,    4,   16
    .db   0,    1,  -44,  -36
    .db   0,    5,    4,  -12
    .db   0,    9,  -68,   12
    .db   3,   13,  -20,   36
    .db   0,   12,   -4,   28
    .db   0,    8,  -64,   28
    .db   0,    4,   -4,  -28
    .db   3,    0,  -64,  -28
    .db   0,    0,  -72,   -4
    .db   0,    4,  -28,  -40
    .db   0,    8,  -36,   40
    .db   3,   12,    8,    4
    .db   0,   14,  -56,   24
    .db   3,    2,   -8,  -24
    .db   0,    6,  -20,  -20
    .db   3,   10,  -44,   20
    .db   0,    2,  -28,    0
    .db   3,   14,  -36,    0
    .db   0,   10,  -24,  -16
    .db   3,    6,  -40,   16
    .db   0,   14,  -44,   24
    .db   3,    2,  -20,  -24
    .db   0,    7,  -32,  -28
    .db   3,   11,  -32,   28
    .db   0,   13,  -44,  -36
    .db   3,    1,  -20,   36
    .db   0,    4,   -4,   40
    .db   3,    8,  -60,  -40

.org 0x2827C3
FxScript_2827C3:
    .db 18   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,    0,  -32
    .db   0,    0,   -8,   24
    .db   3,    0,  -56,  -32
    .db   0,    0,  -16,  -16
    .db   0,    0,  -40,  -24
    .db   0,    0,  -56,   24
    .db   0,    1,    0,  -32
    .db   0,    1,   -8,   24
    .db   3,    1,  -56,  -32
    .db   0,    0,  -64,    0
    .db   0,    0,    0,    0
    .db   0,    0,  -24,  -40
    .db   0,    0,  -32,   32
    .db   0,    1,  -16,  -16
    .db   0,    1,  -56,   24
    .db   0,    1,  -40,  -24
    .db   0,    2,    0,  -32
    .db   0,    2,   -8,   24
    .db   3,    2,  -56,  -32
    .db   0,    0,  -32,    0
    .db   0,    1,  -64,    0
    .db   0,    1,    0,    0
    .db   0,    1,  -24,  -40
    .db   0,    1,  -32,   32
    .db   0,    2,  -16,  -16
    .db   0,    2,  -56,   24
    .db   3,    2,  -40,  -24
    .db   0,    1,  -32,    0
    .db   0,    2,  -64,    0
    .db   0,    2,    0,    0
    .db   0,    2,  -24,  -40
    .db   3,    2,  -32,   32
    .db   3,    2,  -32,    0

.org 0x282848
FxScript_282848:
    .db 56   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   32,    0
    .db   4,    0,   24,   -8
    .db   4,    0,   16,  -16
    .db   4,    0,    8,  -16
    .db   4,    0,    0,  -16
    .db   4,    0,   -8,   -8
    .db   4,    0,  -16,    0
    .db   4,    0,  -24,    8
    .db   4,    0,  -32,   16
    .db   4,    0,  -40,   16
    .db   4,    0,  -48,   16
    .db   4,    0,  -56,    8
    .db   4,    0,  -64,    0
    .db   4,    0,  -72,   -8

.org 0x282881
FxScript_282881:
    .db 162   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,   13,   -4,  -34
    .db   0,   13,  -20,   37
    .db   6,   14,  -71,  -12
    .db   0,   13,  -32,  -44
    .db   0,   14,    7,   20
    .db   6,   14,  -64,   21
    .db   0,   13,  -57,  -34
    .db   0,   14,    8,   -9
    .db   0,   14,  -47,   37
    .db   0,   11,  -37,   42
    .db   0,   11,    3,  -20
    .db   6,   11,  -63,  -27
    .db   0,   14,   -3,   31
    .db   0,   12,   -9,   36
    .db   0,   13,  -18,   41
    .db   0,   14,  -17,  -38
    .db   0,   12,  -11,  -36
    .db   0,   13,   -5,  -31
    .db   0,   12,  -73,    9
    .db   0,   14,  -74,   -1
    .db   0,   13,  -71,  -14
    .db   0,    8,  -66,   20
    .db   0,   10,    7,   18
    .db   6,    8,  -28,  -43
    .db   0,   12,  -44,   40
    .db   0,   14,  -52,   38
    .db   0,   13,  -60,   30
    .db   0,   12,  -55,  -34
    .db   0,   14,  -49,  -38
    .db   0,   13,  -40,  -42
    .db   0,   12,    5,  -13
    .db   0,   14,    8,   -5
    .db   0,   14,   10,    5
    .db   0,    9,    0,  -21
    .db   0,   10,  -63,  -24
    .db   6,    8,  -32,   44
    .db   0,   12,   -9,   33
    .db   0,   14,  -15,   39
    .db   0,   13,  -26,   39
    .db   0,   12,  -21,  -36
    .db   0,   13,  -12,  -32
    .db   0,   14,   -4,  -26
    .db   0,   12,  -70,   19
    .db   0,   13,  -73,   12
    .db   0,   14,  -75,    1
    .db   0,    9,  -62,   27
    .db   0,    9,   -1,   25
    .db   6,    8,  -33,  -38
    .db   0,   12,    4,  -12
    .db   0,   14,    7,   -2
    .db   0,   13,    8,    7
    .db   0,   12,  -55,  -34
    .db   0,   14,  -47,  -39
    .db   0,   13,  -34,  -43
    .db   0,   12,  -52,   38
    .db   0,   13,  -44,   40
    .db   0,   14,  -60,   30
    .db   0,    9,    0,  -21
    .db   0,   10,  -63,  -24
    .db   6,   10,  -32,   44
    .db   0,   13,  -15,  -41
    .db   0,   13,  -59,    4
    .db   0,   12,    8,   22
    .db   0,   14,  -27,  -38
    .db   0,   14,    6,   14
    .db   0,   14,  -56,   16
    .db   0,   11,  -36,  -34
    .db   0,   11,  -52,   23
    .db   6,   11,    2,    5
    .db   0,   14,  -37,   19
    .db   0,   13,  -16,  -16
    .db   0,   14,  -46,  -11
    .db   0,   11,  -27,    9
    .db   0,   11,  -26,  -12
    .db   5,   11,  -42,   -2
    .db   0,   11,  -36,   -4
    .db   0,   11,  -28,   -4
    .db   6,   11,  -32,    4
    .db   7,   10,  -32,    0
    .db   0,    0,  -32,    0
    .db   0,    9,  -36,   -8
    .db   0,    9,  -24,    0
    .db   0,   10,  -48,    8
    .db   0,   10,  -20,   16
    .db   5,   10,  -36,   20
    .db   0,    8,  -44,   40
    .db   0,    8,  -72,   20
    .db   0,    9,    4,   36
    .db   0,    8,    0,  -28
    .db   0,    1,  -32,    0
    .db   4,    9,  -60,  -40
    .db   5,    2,  -32,    0
    .db   5,    3,  -32,    0
    .db   4,    4,  -32,    0
    .db   0,    0,  -49,   17
    .db   5,    5,  -32,    0
    .db   0,    1,  -49,   17
    .db   4,    6,  -32,    0
    .db   0,    2,  -49,   17
    .db   4,    7,  -32,    0
    .db   4,    3,  -49,   17
    .db   4,    4,  -49,   17
    .db   0,    0,  -49,  -16
    .db   4,    5,  -49,   17
    .db   0,    1,  -49,  -16
    .db   4,    6,  -49,   17
    .db   0,    2,  -49,  -16
    .db   4,    7,  -49,   17
    .db   4,    3,  -49,  -16
    .db   4,    4,  -49,  -16
    .db   0,    0,  -15,  -16
    .db   4,    5,  -49,  -16
    .db   0,    1,  -15,   21
    .db   4,    6,  -49,  -16
    .db   0,    2,  -15,   21
    .db   4,    7,  -49,  -16
    .db   4,    3,  -15,   21
    .db   4,    4,  -15,   21
    .db   4,    5,  -15,   21
    .db   4,    6,  -15,   21
    .db   4,    7,  -15,   17

.org 0x282A66
FxScript_282A66:
    .db 110   ; total ticks
    ;   ticks, frame, dx, dy
    .db   5,    0,    0,    0
    .db   5,    1,    0,    0
    .db   5,    2,    0,    0
    .db   0,    2,    0,    0
    .db   5,    3,    0,    0
    .db   0,   12,   64,  -16
    .db   0,   11,   48,   -8
    .db   0,   13,   72,   32
    .db   0,    2,    0,    0
    .db   5,    4,    0,    0
    .db   0,   11,   24,   -8
    .db   0,   12,   48,  -16
    .db   0,   13,   64,   32
    .db   0,    2,    0,    0
    .db   5,    5,    0,    0
    .db   0,   11,   56,  -32
    .db   0,   12,   72,    0
    .db   0,   11,  -16,   -8
    .db   0,   12,    8,  -16
    .db   0,   13,   32,   32
    .db   0,    2,    0,    0
    .db   5,    6,    0,    0
    .db   0,   11,   64,   -8
    .db   0,   11,   24,  -32
    .db   0,   12,   40,    0
    .db   0,   11,  -48,   -8
    .db   0,   12,  -32,  -16
    .db   0,   13,   -8,   32
    .db   0,    2,    0,    0
    .db   5,    7,    0,    0
    .db   0,   11,   32,   -8
    .db   0,   11,  -16,  -32
    .db   0,   12,  -24,    0
    .db   0,   12,   72,   24
    .db   0,   13,   64,  -32
    .db   0,   12,  -72,  -16
    .db   0,   13,  -56,   32
    .db   0,    2,    0,    0
    .db   5,    8,    0,    0
    .db   0,   11,  -56,  -32
    .db   0,   12,  -64,    0
    .db   0,   11,   72,    8
    .db   0,   12,   32,   24
    .db   0,   13,   24,  -32
    .db   0,    2,    0,    0
    .db   5,    9,    0,    0
    .db   0,   11,   32,    8
    .db   0,   12,  -16,   24
    .db   0,   13,  -48,  -32
    .db   0,    2,    0,    0
    .db   5,   10,    0,    0
    .db   0,   11,  -24,    8
    .db   0,   12,  -56,   24
    .db   0,   13,   72,   16
    .db   0,    2,    0,    0
    .db   5,    3,    0,    0
    .db   0,   11,  -56,    8
    .db   0,   12,   56,  -16
    .db   0,   13,   24,   16
    .db   0,    2,    0,    0
    .db   5,    4,    0,    0
    .db   0,   11,   64,  -24
    .db   0,   12,   16,  -16
    .db   0,   13,  -24,   16
    .db   0,    2,    0,    0
    .db   5,    5,    0,    0
    .db   0,   11,   24,  -24
    .db   0,   12,  -32,  -16
    .db   0,   13,  -72,   16
    .db   0,    2,    0,    0
    .db   5,    6,    0,    0
    .db   0,   11,  -16,  -24
    .db   0,   12,  -72,  -16
    .db   0,   13,   64,    8
    .db   0,    2,    0,    0
    .db   5,    7,    0,    0
    .db   0,   11,  -56,  -24
    .db   0,   12,   72,   24
    .db   0,   13,   24,    8
    .db   0,    2,    0,    0
    .db   5,    8,    0,    0
    .db   0,   11,   72,   -8
    .db   0,   12,   32,   24
    .db   0,   13,  -24,    8
    .db   0,    2,    0,    0
    .db   5,    9,    0,    0
    .db   0,   11,   32,   -8
    .db   0,   12,  -16,   24
    .db   0,   13,  -72,    8
    .db   0,    2,    0,    0
    .db   5,   10,    0,    0
    .db   0,   11,  -24,   -8
    .db   0,   12,  -56,   24
    .db   0,    2,    0,    0
    .db   5,    3,    0,    0
    .db   5,    1,    0,    0
    .db   5,    0,    0,    0

.org 0x282BEB
FxScript_282BEB:
    .db 119   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   20,   40
    .db   0,    0,    8,  -24
    .db   4,    0,   68,   -4
    .db   0,    1,   32,  -36
    .db   0,    1,    0,   24
    .db   4,    1,   64,   24
    .db   0,    4,   -4,   -4
    .db   0,    4,   48,   40
    .db   4,    4,   56,  -28
    .db   0,    4,   20,   40
    .db   0,    4,    8,  -24
    .db   4,    4,   68,   -4
    .db   0,    4,   32,  -36
    .db   0,    4,    0,   24
    .db   4,    4,   64,   24
    .db   0,    2,   -4,   -4
    .db   0,    2,   48,   40
    .db   4,    2,   56,  -28
    .db   0,    3,   20,   40
    .db   0,    3,    8,  -24
    .db   4,    3,   68,   -4
    .db   0,    6,   64,   24
    .db   0,    6,    0,   24
    .db   4,    6,   32,  -36
    .db   0,    6,   -4,   -4
    .db   0,    6,   48,   40
    .db   4,    6,   56,  -28
    .db   0,    6,   20,   40
    .db   0,    6,    8,  -24
    .db   4,    6,   68,   -4
    .db   0,    6,   64,   24
    .db   0,    6,    0,   24
    .db   4,    6,   32,  -36
    .db   0,    6,   -4,   -4
    .db   0,    6,   48,   40
    .db   4,    6,   56,  -28
    .db   0,    6,   20,   40
    .db   0,    6,    8,  -24
    .db   4,    6,   68,   -4
    .db   0,    6,   64,   24
    .db   0,    6,    0,   24
    .db   4,    6,   32,  -36
    .db   0,    6,   -4,    0
    .db   0,    6,   48,   40
    .db   5,    6,   56,  -28
    .db   0,    6,   20,   40
    .db   0,    6,    4,  -24
    .db   6,    6,   68,   -4
    .db   0,    0,   36,  -40
    .db   0,    0,   -8,   24
    .db   0,    0,   68,   32
    .db   0,    1,   32,  -32
    .db   0,    1,    0,   20
    .db   0,    1,   60,   24
    .db   0,    5,   56,   16
    .db   0,    5,   12,   20
    .db   4,    5,   28,  -24
    .db   0,    1,    8,   16
    .db   0,    1,   32,  -36
    .db   0,    1,   56,   16
    .db   0,    2,   20,   20
    .db   0,    2,   28,  -24
    .db   0,    2,   56,    8
    .db   0,    6,   32,   20
    .db   0,    6,   48,   -8
    .db   4,    6,   20,  -12
    .db   0,    4,   56,   32
    .db   0,    4,   48,  -32
    .db   4,    4,    0,    8
    .db   5, 0xFF,   16,  -16
    .db   0,    0,   16,  -16
    .db   0,    0,   52,  -34
    .db   4,    0,   48,   16
    .db   0,    0,   35,  -27
    .db   0,    0,   65,   14
    .db   0,    0,   30,   26
    .db   0,    0,    3,  -19
    .db   0,    0,   39,  -11
    .db   0,    0,   62,  -10
    .db   0,    0,   24,  -41
    .db   0,    0,    9,   10
    .db   0,    1,   16,  -16
    .db   0,    1,   52,  -34
    .db   4,    1,   48,   16
    .db   0,    4,   35,   34
    .db   0,    4,    9,  -30
    .db   0,    4,   67,  -22
    .db   0,    0,   16,  -16
    .db   0,    1,   39,  -11
    .db   0,    1,   62,  -10
    .db   0,    1,   23,  -42
    .db   0,    2,    9,   10
    .db   0,    2,   52,  -34
    .db   4,    2,   48,   16
    .db   0,    5,   35,   34
    .db   0,    5,    9,  -30
    .db   0,    5,   67,  -22
    .db   0,    0,   62,   -9
    .db   0,    0,   24,  -41
    .db   0,    2,   39,  -11
    .db   0,    3,    8,   10
    .db   0,    3,   52,  -34
    .db   4,    3,   49,   17
    .db   0,    4,   -2,   29
    .db   0,    4,   33,  -39
    .db   0,    4,   68,   31
    .db   0,    6,   35,   34
    .db   0,    6,    9,  -30
    .db   0,    6,   67,  -22
    .db   0,    2,   52,  -34
    .db   0,    2,   49,   17
    .db   0,    2,    8,   10
    .db   4,    3,   40,  -10
    .db   0,    5,   -2,   29
    .db   0,    5,   33,  -39
    .db   0,    5,   68,   31
    .db   0,    7,   35,   34
    .db   0,    7,   68,   31
    .db   0,    7,   67,  -22
    .db   0,    1,   52,  -34
    .db   0,    1,   48,   16
    .db   0,    1,    8,   10
    .db   4,    2,   40,  -10
    .db   0,    6,   -2,   29
    .db   0,    6,   33,  -39
    .db   0,    6,   68,   31
    .db   0,    0,   52,  -34
    .db   0,    0,   48,   16
    .db   0,    0,    8,   10
    .db   4,    1,   39,  -11
    .db   0,    7,   -2,   29
    .db   0,    7,   33,  -39
    .db   4,    7,   68,   31
    .db   0,    4,   -2,   29
    .db   0,    4,   33,  -39
    .db   3,    4,   68,   31

.org 0x282E0C
FxScript_282E0C:
    .db 15   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3, 0xFF,   16,   -8
    .db   3,    2,   72,   12
    .db   3,    2,   32,   12
    .db   3,    2,    0,   12
    .db   3,    2,  -24,   12

.org 0x282E21
FxScript_282E21:
    .db 129   ; total ticks
    ;   ticks, frame, dx, dy
    .db   5,    0,   32,   44
    .db   6,    1,   32,   44
    .db   5,    2,   32,   40
    .db   4,    3,   32,   36
    .db   4,    4,   32,   32
    .db   5,    5,   32,   28
    .db   4,    6,   32,   28
    .db   5,    7,   32,   24
    .db   4,    6,   32,   28
    .db   5,    5,   32,   28
    .db   4,    6,   32,   28
    .db   5,    7,   32,   24
    .db   4,    6,   32,   28
    .db   5,    5,   32,   28
    .db   4,    6,   32,   28
    .db   5,    7,   32,   24
    .db   4,    6,   32,   28
    .db   5,    5,   32,   28
    .db   4,    6,   32,   28
    .db   5,    7,   32,   24
    .db   6,    6,   32,   28
    .db   4,    8,   32,   28
    .db   6,    9,   32,   32
    .db   0,   12,   56,   64
    .db   0,   12,  -12,   52
    .db   0,   12,   72,    8
    .db   0,   12,    0,  -20
    .db   4,    9,   32,   32
    .db   0,   12,   44,  -14
    .db   0,   12,   65,   45
    .db   0,   12,   -6,   20
    .db   0,   10,   54,   64
    .db   0,   10,   70,   12
    .db   0,   10,    2,  -16
    .db   0,   10,   -4,   46
    .db   0,   12,   42,   40
    .db   0,   12,   14,    0
    .db   0,   12,   12,   34
    .db   0,   12,   50,   16
    .db   0,   11,    9,   -7
    .db   0,   11,   59,   15
    .db   0,   11,   49,   53
    .db   0,   11,    5,   41
    .db   4,    9,   32,   32
    .db   0,   10,   14,   55
    .db   0,   11,   20,   46
    .db   0,   10,   62,   42
    .db   0,   10,   43,  -14
    .db   0,   10,   -3,   19
    .db   0,   11,   55,   36
    .db   0,   11,   40,   -4
    .db   0,   11,    7,   20
    .db   0,   12,   45,   29
    .db   0,   12,   36,    6
    .db   0,   12,   18,   20
    .db   0,   10,   35,   29
    .db   0,   10,   22,   28
    .db   0,   10,   44,   18
    .db   0,   10,   20,    8
    .db   4,    9,   32,   32
    .db   0,   10,   26,   33
    .db   0,   10,   42,   26
    .db   0,   10,   35,   10
    .db   0,   10,   24,   21
    .db   4,    9,   32,   32
    .db   5,    9,   32,   32

.org 0x282F2A
FxScript_282F2A:
    .db 15   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,  -16,  -16
    .db   0,    0,  -40,  -24
    .db   3,    0,  -48,   16
    .db   0,    0,  -56,   -8
    .db   0,    0,  -16,   16
    .db   0,    1,  -16,  -16
    .db   0,    1,  -48,   16
    .db   3,    1,  -40,  -24
    .db   0,    0,  -32,    0
    .db   0,    1,  -56,   -8
    .db   0,    1,  -16,   16
    .db   0,    2,  -16,  -16
    .db   0,    2,  -48,   16
    .db   3,    2,  -40,  -24
    .db   0,    1,  -32,    0
    .db   0,    2,  -56,   -8
    .db   3,    2,  -16,   16
    .db   3,    2,  -32,    0

.org 0x282F73
FxScript_282F73:
    .db 54   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,  -18,  -28
    .db   0,    1,   -8,  -23
    .db   9,    2,    2,  -28
    .db   0,    0,  -18,  -28
    .db   0,    0,  -22,  -24
    .db   0,    1,   -8,  -19
    .db   0,    1,   -8,  -23
    .db   0,    2,    2,  -28
    .db   9,    2,    6,  -24
    .db   0,    0,  -18,  -28
    .db   0,    0,  -22,  -24
    .db   0,    0,  -26,  -20
    .db   0,    1,   -8,  -15
    .db   0,    1,   -8,  -19
    .db   0,    1,   -8,  -23
    .db   0,    2,    2,  -28
    .db   0,    2,    6,  -24
    .db   9,    2,   10,  -20
    .db   0,    0,  -26,  -20
    .db   0,    0,  -22,  -24
    .db   0,    1,   -8,  -15
    .db   0,    1,   -8,  -19
    .db   0,    2,   10,  -20
    .db   9,    2,    6,  -24
    .db   0,    0,  -26,  -20
    .db   0,    1,   -8,  -15
    .db   9,    2,   10,  -20
    .db   9, 0xFF,   10,  -20

.org 0x282FE4
FxScript_282FE4:
    .db 62   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    3,  -16,    0
    .db   0,    3,  -48,    8
    .db   0,    3,  -64,  -24
    .db   0,    3,  -40,  -48
    .db   5,    3,   -8,  -32
    .db   0,    4,  -40,    0
    .db   0,    4,  -48,   -8
    .db   0,    4,  -32,   -8
    .db   5,    4,  -40,  -16
    .db   4,    4,  -40,   -8
    .db   4,    5,  -40,   -8
    .db   4,    6,  -40,   -8
    .db   4,    4,  -40,   -8
    .db   4,    5,  -40,   -8
    .db   4,    6,  -40,   -8
    .db   0,    3,  -24,  -16
    .db   0,    3,  -32,   -8
    .db   4,    3,  -16,  -16
    .db   0,    4,  -16,  -16
    .db   0,    3,  -16,  -24
    .db   0,    3,    8,  -24
    .db   0,    3,  -24,  -16
    .db   0,    3,   -8,  -24
    .db   0,    3,  -24,  -24
    .db   5,    4,  -32,  -16
    .db   3,    0,  -24,  -16
    .db   5,    0,  -24,  -16
    .db   4,    1,  -32,    0
    .db   0,    3,    8,  -40
    .db   0,    3,   -8,  -32
    .db   0,    3,  -40,   -8
    .db   0,    5,  -24,  -24
    .db   0,    4,  -32,   -8
    .db   4,    2,  -48,    8
    .db   0,    3,  -56,    0
    .db   0,    3,  -56,    8
    .db   0,    3,  -64,   24
    .db   0,    3,  -64,   32
    .db   0,    3,  -48,   32
    .db   0,    3,  -56,   40
    .db   3,    3,  -64,   40

.org 0x283089
FxScript_283089:
    .db 44   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   72,  -32
    .db   4,    0,   48,  -32
    .db   0,    0,   72,  -16
    .db   4,    0,    8,  -32
    .db   0,    0,   48,  -16
    .db   4,    0,  -16,  -32
    .db   0,    0,    8,  -16
    .db   0,    0,   72,    8
    .db   4,    0,  -16,  -32
    .db   0,    0,   48,    0
    .db   0,    0,  -16,  -32
    .db   4,    0,  -16,  -16
    .db   0,    0,   72,   16
    .db   0,    0,    8,    0
    .db   0,    0,  -16,  -32
    .db   4,    0,  -16,  -16
    .db   0,    0,  -16,  -32
    .db   0,    0,   48,   16
    .db   0,    0,  -16,  -16
    .db   4,    0,  -16,    0
    .db   0,    0,  -16,  -16
    .db   0,    0,    8,   16
    .db   0,    0,  -16,  -32
    .db   4,    0,  -16,    0
    .db   0,    0,  -16,    0
    .db   0,    0,  -16,   16
    .db   0,    0,  -16,  -32
    .db   8,    0,  -16,  -16

.org 0x2830FA
FxScript_2830FA:
    .db 43   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,  -36,   12
    .db   4,    1,  -32,    4
    .db   0,    0,  -36,   12
    .db   4,    2,  -32,    0
    .db   0,    1,  -32,    4
    .db   3,    3,  -32,   -4
    .db   0,    2,  -32,    0
    .db   4,    4,  -36,  -12
    .db   0,    0,  -36,   12
    .db   0,    3,  -32,   -4
    .db   3,    6,  -44,  -24
    .db   0,    1,  -32,    4
    .db   0,    4,  -36,  -12
    .db   5,    6,  -44,  -24
    .db   0,    1,  -32,   -4
    .db   3,    5,  -32,    0
    .db   4,    2,  -32,    0
    .db   4,    3,  -32,   -4
    .db   3,    4,  -36,  -12
    .db   3,    6,  -44,  -24

.org 0x28314B
FxScript_28314B:
    .db 45   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,  -48,  -20
    .db   0,    0,  -16,   28
    .db   3,    0,  -32,    4
    .db   0,    1,  -48,  -20
    .db   0,    1,  -16,   28
    .db   3,    1,  -32,    4
    .db   0,    2,  -48,  -20
    .db   0,    2,  -32,    0
    .db   3,    2,  -16,   20
    .db   0,    0,  -48,  -16
    .db   0,    0,  -16,   28
    .db   3,    0,  -32,    4
    .db   0,    1,  -48,  -20
    .db   0,    1,  -16,   28
    .db   3,    1,  -32,    4
    .db   0,    2,  -48,  -20
    .db   0,    2,  -32,    0
    .db   3,    2,  -16,   20
    .db   0,    0,  -48,  -20
    .db   0,    0,  -16,   28
    .db   3,    0,  -32,    4
    .db   0,    1,  -48,  -16
    .db   0,    1,  -16,   28
    .db   3,    1,  -32,    4
    .db   0,    2,  -48,  -20
    .db   0,    2,  -32,    0
    .db   3,    2,  -16,   20
    .db   0,    0,  -48,  -20
    .db   0,    0,  -16,   28
    .db   3,    0,  -32,    4
    .db   0,    1,  -48,  -20
    .db   0,    1,  -16,   28
    .db   3,    1,  -32,    4
    .db   0,    2,  -48,  -20
    .db   0,    2,  -32,    0
    .db   3,    2,  -16,   20
    .db   0,    0,  -48,  -20
    .db   0,    0,  -16,   28
    .db   3,    0,  -32,    4
    .db   0,    1,  -48,  -16
    .db   0,    1,  -16,   28
    .db   3,    1,  -32,    4
    .db   0,    2,  -48,  -20
    .db   0,    2,  -32,    0
    .db   3,    2,  -16,   20

.org 0x283200
FxScript_283200:
    .db 54   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   40,   14
    .db   0,    1,   34,   24
    .db   9,    2,   40,   34
    .db   0,    0,   40,   14
    .db   0,    0,   36,   10
    .db   0,    1,   30,   24
    .db   0,    1,   34,   24
    .db   0,    2,   40,   34
    .db   9,    2,   36,   38
    .db   0,    0,   40,   14
    .db   0,    0,   36,   10
    .db   0,    0,   32,    6
    .db   0,    1,   26,   24
    .db   0,    1,   30,   24
    .db   0,    1,   34,   24
    .db   0,    2,   40,   34
    .db   0,    2,   36,   38
    .db   9,    2,   32,   42
    .db   0,    0,   32,    6
    .db   0,    0,   36,   10
    .db   0,    1,   26,   24
    .db   0,    1,   30,   24
    .db   0,    2,   32,   42
    .db   9,    2,   36,   38
    .db   0,    0,   32,    6
    .db   0,    1,   26,   24
    .db   9,    2,   32,   42
    .db   9, 0xFF,   32,   42

.org 0x283271
FxScript_283271:
    .db 57   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,    0,  -32,  -40
    .db   3,    1,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    4,  -36,    0
    .db   3,    5,  -32,    0
    .db   3,    6,  -28,    0
    .db   3,    7,  -32,    0
    .db   3,    8,  -36,    0
    .db   3,    9,  -32,    0
    .db   3,   10,  -28,    0
    .db   3,    3,  -32,    0
    .db   3,    4,  -32,    0
    .db   3,    5,  -32,    0
    .db   3,    6,  -32,    0
    .db   3,    7,  -32,    0
    .db   3,    8,  -32,    0
    .db   3,    9,  -32,    0
    .db   3,   10,  -32,    0

.org 0x2832BE
FxScript_2832BE:
    .db 42   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,  -48,   34
    .db   6,    0,    0,   16
    .db   0,    0,  -29,   23
    .db   0,    0,  -61,   31
    .db   0,    0,  -25,   39
    .db   0,    0,   -2,   40
    .db   0,    0,  -40,    9
    .db   0,    1,  -48,   24
    .db   6,    1,  -12,    6
    .db   0,    4,  -32,   50
    .db   0,    4,  -58,  -30
    .db   0,    4,    3,  -22
    .db   0,    0,  -48,    4
    .db   0,    1,  -25,    9
    .db   0,    1,   -2,   30
    .db   0,    1,  -41,  -22
    .db   0,    2,  -48,   32
    .db   0,    2,   -8,  -11
    .db   6,    2,   -8,   43
    .db   0,    5,  -32,   12
    .db   0,    5,  -56,  -40
    .db   0,    5,    4,  -20
    .db   0,    0,   -4,    4
    .db   0,    0,  -40,  -20
    .db   0,    2,  -24,    0
    .db   0,    3,  -58,    0
    .db   0,    3,  -12,  -28
    .db   6,    3,  -15,   37
    .db   0,    4,  -66,   12
    .db   0,    4,  -31,  -61
    .db   0,    4,    4,   11
    .db   0,    6,  -30,   28
    .db   0,    6,  -56,  -42
    .db   0,    6,    2,  -40
    .db   0,    2,  -12,  -28
    .db   0,    2,  -16,    2
    .db   0,    2,  -58,    0
    .db   6,    3,  -24,  -22
    .db   0,    5,  -66,    8
    .db   0,    5,    4,    9
    .db   0,    7,  -32,   -8
    .db   0,    7,    3,  -42
    .db   0,    1,  -16,   -4
    .db   0,    1,  -56,  -10
    .db   6,    2,  -24,  -22
    .db   0,    6,  -68,  -20
    .db   0,    6,    4,    1
    .db   0,    0,  -16,  -14
    .db   0,    0,  -56,  -20
    .db   6,    1,  -25,  -32

.org 0x283387
FxScript_283387:
    .db 42   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    6,   -4,  -20
    .db   0,    6,   68,    1
    .db   0,    0,   52,  -48
    .db   0,    0,   48,  -14
    .db   0,    0,    8,  -20
    .db   6,    1,   39,  -32
    .db   0,    5,   -2,    8
    .db   0,    5,   33,  -44
    .db   0,    5,   68,    9
    .db   0,    6,   32,  -15
    .db   0,    7,   67,  -42
    .db   0,    1,   48,   -4
    .db   0,    1,    8,  -10
    .db   6,    2,   39,  -32
    .db   0,    4,   36,  -34
    .db   0,    4,   33,  -48
    .db   0,    4,   68,   11
    .db   0,    6,   34,   14
    .db   0,    6,    8,  -42
    .db   0,    6,   66,  -40
    .db   0,    2,   54,  -32
    .db   0,    2,   49,   43
    .db   0,    2,   48,   -4
    .db   0,    2,    7,  -10
    .db   6,    3,   40,  -22
    .db   0,    5,   32,   12
    .db   0,    5,    8,  -40
    .db   0,    5,   68,  -20
    .db   0,    0,   60,    4
    .db   0,    0,   24,  -20
    .db   0,    2,   40,    0
    .db   0,    3,    6,    0
    .db   0,    3,   52,  -28
    .db   6,    3,   49,   37
    .db   0,    4,   32,   48
    .db   0,    4,    6,  -30
    .db   0,    4,   67,  -22
    .db   0,    0,   16,    4
    .db   0,    1,   39,    9
    .db   0,    1,   62,   30
    .db   0,    1,   23,  -22
    .db   0,    2,   10,   32
    .db   0,    2,   54,  -11
    .db   6,    2,   49,   37
    .db   0,    0,   35,   23
    .db   0,    0,   65,   45
    .db   0,    0,    3,   31
    .db   0,    0,   39,   39
    .db   0,    0,   62,   40
    .db   0,    0,   24,    9
    .db   0,    0,    9,   48
    .db   0,    1,   16,   24
    .db   0,    1,   52,    6
    .db   6,    1,   48,   48
    .db   0,    1,   16,   34
    .db   0,    0,   52,   16
    .db   6,    0,   48,   48

.org 0x28346C
FxScript_28346C:
    .db 32   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,   11,  -36,   -4
    .db   0,   11,  -28,   -4
    .db   3,   11,  -32,    4
    .db   0,    0,  -32,    0
    .db   0,    9,  -36,   -8
    .db   0,    9,  -24,    0
    .db   0,   10,  -48,    8
    .db   0,   10,  -20,   16
    .db   4,   10,  -36,   20
    .db   0,    8,  -44,   40
    .db   0,    8,  -72,   20
    .db   0,    9,    4,   36
    .db   0,    8,    0,  -28
    .db   0,    1,  -32,    0
    .db   4,    9,  -60,  -40
    .db   4,    2,  -32,    0
    .db   4,    3,  -32,    0
    .db   3,    3,  -32,    0
    .db   4,    5,  -32,    0
    .db   3,    6,  -32,    0
    .db   3,    7,  -32,    0

.org 0x2834C1
FxScript_2834C1:
    .db 24   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,  -32,    0
    .db   5,    1,  -32,    0
    .db   4,    2,  -32,    0
    .db   3,    3,  -32,    0
    .db   4,    4,  -32,    0
    .db   4,    5,  -32,    0

.org 0x2834DA
FxScript_2834DA:
    .db 36   ; total ticks
    ;   ticks, frame, dx, dy
    .db   5,    0,   32,    0
    .db   4,    1,   32,    0
    .db   3,    2,   32,    0
    .db   3,    3,   32,    0
    .db   3,    3,   32,    0
    .db   0,    0,   32,    0
    .db   3,    4,   32,    0
    .db   0,    1,   32,    0
    .db   3,    5,   32,    0
    .db   3,    2,   32,    0
    .db   3,    3,   32,    0
    .db   3,    4,   32,    0
    .db   3,    5,   32,    0

.org 0x28350F
FxScript_28350F:
    .db 30   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   16,  -32
    .db   0,    0,   24,  -16
    .db   0,    0,   32,    0
    .db   0,    0,   24,   16
    .db   6,    0,   16,   32
    .db   0,    0,    8,  -32
    .db   0,    0,   16,  -16
    .db   0,    0,   24,    0
    .db   0,    0,   16,   16
    .db   4,    0,    8,   32
    .db   0,    0,    0,  -32
    .db   0,    0,    8,  -16
    .db   0,    0,   16,    0
    .db   0,    0,    8,   16
    .db   4,    0,    0,   32
    .db   0,    0,  -16,  -32
    .db   0,    0,   -8,  -16
    .db   0,    0,    0,    0
    .db   0,    0,   -8,   16
    .db   3,    0,  -16,   32
    .db   0,    0,  -32,  -32
    .db   0,    0,  -24,  -16
    .db   0,    0,  -16,    0
    .db   0,    0,  -24,   16
    .db   3,    0,  -32,   32
    .db   0,    0,  -48,  -32
    .db   0,    0,  -40,  -16
    .db   0,    0,  -32,    0
    .db   0,    0,  -40,   16
    .db   3,    0,  -48,   32
    .db   0,    0,  -64,  -32
    .db   0,    0,  -64,   32
    .db   0,    0,  -56,  -16
    .db   0,    0,  -48,    0
    .db   4,    0,  -56,   16
    .db   0,    0,  -80,  -32
    .db   0,    0,  -80,   32
    .db   0,    0,  -72,  -16
    .db   0,    0,  -72,   16
    .db   3,    0,  -64,    0

.org 0x2835B0
FxScript_2835B0:
    .db 33   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3,   10,   72,    0
    .db   0,   12,   64,    0
    .db   0,   12,   48,    0
    .db   0,   12,   72,    0
    .db   3,   10,   32,    0
    .db   0,   13,   -8,    0
    .db   0,   13,    8,    0
    .db   0,   13,   24,    0
    .db   0,   13,   40,    0
    .db   0,   13,   56,    0
    .db   0,   13,   72,    0
    .db   5,   10,  -24,    0
    .db   0,   12,   72,    0
    .db   0,   12,   56,    0
    .db   0,   12,   40,    0
    .db   0,   12,   24,    0
    .db   0,   12,    8,    0
    .db   0,   12,   -8,    0
    .db   0,   12,  -24,    0
    .db   0,   12,  -40,    0
    .db   0,   12,  -56,    0
    .db   6,   12,  -72,    0
    .db   0,    5,   76,    0
    .db   0,    5,   68,    0
    .db   0,    5,   60,    0
    .db   0,    5,   52,    0
    .db   0,    5,   44,    0
    .db   0,    5,   36,    0
    .db   0,    5,   28,    0
    .db   0,    5,   20,    0
    .db   0,    5,   12,    0
    .db   0,    5,    4,    0
    .db   0,    5,   -4,    0
    .db   0,    5,  -12,    0
    .db   0,    5,  -20,    0
    .db   0,    5,  -28,    0
    .db   0,    5,  -36,    0
    .db   0,    5,  -44,    0
    .db   0,    5,  -52,    0
    .db   0,    5,  -60,    0
    .db   0,    5,  -68,    0
    .db   4,    5,  -76,    0
    .db   0,    1,  -76,    0
    .db   0,    1,  -68,    0
    .db   0,    1,  -60,    0
    .db   0,    1,  -52,    0
    .db   0,    1,  -44,    0
    .db   0,    1,  -36,    0
    .db   0,    1,  -28,    0
    .db   0,    1,  -20,    0
    .db   0,    1,   76,    0
    .db   0,    1,   68,    0
    .db   0,    1,   60,    0
    .db   0,    1,   52,    0
    .db   0,    1,   44,    0
    .db   0,    1,   36,    0
    .db   0,    1,   28,    0
    .db   0,    1,   20,    0
    .db   0,    1,   12,    0
    .db   0,    1,    4,    0
    .db   0,    1,  -12,    0
    .db   4,    1,   -4,    0
    .db   0,    1,  -76,    0
    .db   0,    1,  -68,    0
    .db   0,    1,  -60,    0
    .db   0,    1,  -52,    0
    .db   0,    1,  -44,    0
    .db   0,    1,  -16,    0
    .db   0,    1,  -20,    0
    .db   0,    1,  -28,    0
    .db   0,    1,  -36,    0
    .db   4,    0,   -8,    0
    .db   0,    1,  -72,    0
    .db   0,    1,  -76,    0
    .db   4,    0,  -64,    0

.org 0x2836DD
FxScript_2836DD:
    .db 42   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   16,   34
    .db   6,    0,   64,   16
    .db   0,    0,   35,   23
    .db   0,    0,    3,   31
    .db   0,    0,   39,   39
    .db   0,    0,   62,   40
    .db   0,    0,   24,    9
    .db   0,    1,   16,   24
    .db   6,    1,   52,    6
    .db   0,    4,   32,   50
    .db   0,    4,    6,  -30
    .db   0,    4,   67,  -22
    .db   0,    0,   16,    4
    .db   0,    1,   39,    9
    .db   0,    1,   62,   30
    .db   0,    1,   23,  -22
    .db   0,    2,   16,   32
    .db   0,    2,   56,  -11
    .db   6,    2,   56,   43
    .db   0,    5,   32,   12
    .db   0,    5,    8,  -40
    .db   0,    5,   68,  -20
    .db   0,    0,   60,    4
    .db   0,    0,   24,  -20
    .db   0,    2,   40,    0
    .db   0,    3,    6,    0
    .db   0,    3,   52,  -28
    .db   6,    3,   49,   37
    .db   0,    4,   -2,   12
    .db   0,    4,   33,  -61
    .db   0,    4,   68,   11
    .db   0,    6,   34,   28
    .db   0,    6,    8,  -42
    .db   0,    6,   66,  -40
    .db   0,    2,   52,  -28
    .db   0,    2,   48,    2
    .db   0,    2,    6,    0
    .db   6,    3,   40,  -22
    .db   0,    5,    2,    8
    .db   0,    5,   68,    9
    .db   0,    7,   32,   -8
    .db   0,    7,   67,  -42
    .db   0,    1,   48,   -4
    .db   0,    1,    8,  -10
    .db   6,    2,   40,  -22
    .db   0,    6,    4,  -20
    .db   0,    6,   68,    1
    .db   0,    0,   48,  -14
    .db   0,    0,    8,  -20
    .db   6,    1,   39,  -32

.org 0x2837A6
FxScript_2837A6:
    .db 18   ; total ticks
    ;   ticks, frame, dx, dy
    .db   3, 0xFF,    0,    8
    .db   0,    2,    8,    8
    .db   3,    0,   16,    8
    .db   0,    2,  -12,    8
    .db   3,    1,   16,    8
    .db   3,    2,  -36,    8
    .db   3,    2,  -60,    8
    .db   3,    2,  -76,    8

.org 0x2837C7
FxScript_2837C7:
    .db 35   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    5,  -32,    0
    .db   4,    4,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    2,  -32,    0
    .db   3,    1,  -32,    0
    .db   0,    0,  -32,    0
    .db   3,    5,  -32,    0
    .db   3,    4,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    2,  -32,    0
    .db   3,    1,  -32,    0
    .db   3,    0,  -32,    0

.org 0x2837F8
FxScript_2837F8:
    .db 42   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    6,  -68,  -20
    .db   0,    6,    4,    1
    .db   0,    0,  -12,  -48
    .db   0,    0,  -16,  -14
    .db   0,    0,  -56,  -20
    .db   6,    1,  -25,  -32
    .db   0,    5,  -66,    8
    .db   0,    5,  -31,  -44
    .db   0,    5,    4,    9
    .db   0,    6,  -32,  -15
    .db   0,    7,    3,  -42
    .db   0,    1,  -16,   -4
    .db   0,    1,  -56,  -10
    .db   6,    2,  -25,  -32
    .db   0,    4,  -28,  -34
    .db   0,    4,  -31,  -48
    .db   0,    4,    4,   11
    .db   0,    6,  -30,   14
    .db   0,    6,  -56,  -42
    .db   0,    6,    2,  -40
    .db   0,    2,  -10,  -32
    .db   0,    2,  -15,   43
    .db   0,    2,  -16,   -4
    .db   0,    2,  -57,  -10
    .db   6,    3,  -24,  -22
    .db   0,    5,  -32,   12
    .db   0,    5,  -56,  -40
    .db   0,    5,    4,  -20
    .db   0,    0,   -4,    4
    .db   0,    0,  -40,  -20
    .db   0,    2,  -24,    0
    .db   0,    3,  -58,    0
    .db   0,    3,  -12,  -28
    .db   6,    3,  -15,   37
    .db   0,    4,  -32,   48
    .db   0,    4,  -58,  -30
    .db   0,    4,    3,  -22
    .db   0,    0,  -48,    4
    .db   0,    1,  -25,    9
    .db   0,    1,   -2,   30
    .db   0,    1,  -41,  -22
    .db   0,    2,  -54,   32
    .db   0,    2,  -10,  -11
    .db   6,    2,  -15,   37
    .db   0,    0,  -29,   23
    .db   0,    0,    1,   45
    .db   0,    0,  -61,   31
    .db   0,    0,  -25,   39
    .db   0,    0,   -2,   40
    .db   0,    0,  -40,    9
    .db   0,    0,  -55,   48
    .db   0,    1,  -48,   24
    .db   0,    1,  -12,    6
    .db   6,    1,  -16,   48
    .db   0,    1,  -48,   34
    .db   0,    0,  -12,   16
    .db   6,    0,  -16,   48

.org 0x2838DD
FxScript_2838DD:
    .db 36   ; total ticks
    ;   ticks, frame, dx, dy
    .db   5,    0,  -32,    0
    .db   4,    1,  -32,    0
    .db   3,    2,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    3,  -32,    0
    .db   0,    0,  -32,    0
    .db   3,    4,  -32,    0
    .db   0,    1,  -32,    0
    .db   3,    5,  -32,    0
    .db   3,    2,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    4,  -32,    0
    .db   3,    5,  -32,    0

.org 0x283912
FxScript_283912:
    .db 35   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    5,   32,    0
    .db   4,    4,   32,    0
    .db   3,    3,   32,    0
    .db   3,    2,   32,    0
    .db   3,    1,   32,    0
    .db   0,    0,   32,    0
    .db   3,    5,   32,    0
    .db   3,    4,   32,    0
    .db   3,    3,   32,    0
    .db   3,    2,   32,    0
    .db   3,    1,   32,    0
    .db   3,    0,   32,    0

.org 0x283943
FxScript_283943:
    .db 106   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,   18,   64,   32
    .db   0,   17,   56,    0
    .db   0,   16,   72,  -24
    .db   4,   12,   48,   24
    .db   0,   19,   32,   32
    .db   0,   18,    8,    0
    .db   0,   17,   40,  -24
    .db   0,   16,   72,   16
    .db   0,    0,   72,  -24
    .db   0,    0,   64,   -8
    .db   0,    0,   56,    8
    .db   0,    0,   64,   24
    .db   4,    0,   72,   40
    .db   0,   19,  -32,    0
    .db   0,   18,    8,  -24
    .db   0,   17,   32,   16
    .db   0,   16,  -16,   32
    .db   0,    4,   64,  -32
    .db   0,    4,   56,  -16
    .db   0,    4,   48,    0
    .db   0,    4,   56,   16
    .db   4,    4,   64,   32
    .db   0,   19,  -24,  -24
    .db   0,   18,   -8,   16
    .db   0,   17,  -56,   32
    .db   0,   16,   32,  -32
    .db   0,    9,   56,  -40
    .db   0,    8,   48,  -24
    .db   0,    8,   40,   -8
    .db   0,    8,   48,    8
    .db   4,    8,   56,   24
    .db   0,   19,  -48,   16
    .db   0,   18,   72,   24
    .db   0,   17,    0,  -32
    .db   0,   16,  -64,  -24
    .db   0,   12,   48,  -40
    .db   0,   12,   40,  -24
    .db   0,   12,   32,   -8
    .db   0,   12,   40,    8
    .db   4,   12,   48,   24
    .db   0,   19,   32,   24
    .db   0,   18,  -40,  -32
    .db   0,   17,   72,  -16
    .db   0,   16,  -80,   16
    .db   0,    0,   40,  -32
    .db   0,    0,   32,  -16
    .db   0,    0,   24,    0
    .db   0,    0,   32,   16
    .db   4,    0,   40,   32
    .db   0,   19,  -72,  -32
    .db   0,   18,   40,  -16
    .db   0,   17,   56,   32
    .db   0,   16,   -8,   24
    .db   0,    4,   32,  -24
    .db   0,    4,   24,   -8
    .db   0,    4,   16,    8
    .db   0,    4,   24,   24
    .db   4,    4,   32,   40
    .db   0,   19,  -32,  -16
    .db   0,   18,   16,   32
    .db   0,   17,  -48,   24
    .db   0,   16,   72,  -32
    .db   0,    8,   24,  -16
    .db   0,    8,   16,    0
    .db   0,    8,    8,   16
    .db   0,    8,   16,   32
    .db   4,    0,   24,   48
    .db   0,   19,  -16,   32
    .db   0,   18,   64,   16
    .db   0,   17,   40,  -32
    .db   0,   16,   16,  -16
    .db   0,    4,   16,  -16
    .db   0,    4,    8,    0
    .db   0,    4,    0,   16
    .db   0,    4,    8,   32
    .db   4,    4,   16,   48
    .db   0,   19,   24,   16
    .db   0,   18,    8,  -32
    .db   0,   17,  -24,  -16
    .db   0,   16,  -56,   32
    .db   0,    8,    8,  -24
    .db   0,    8,    0,   -8
    .db   0,    8,   -8,    8
    .db   0,    8,    0,   24
    .db   4,    8,    8,   40
    .db   0,   19,  -32,  -32
    .db   0,   18,  -64,  -16
    .db   0,   17,   72,   24
    .db   0,   16,  -16,   16
    .db   0,   12,    0,  -32
    .db   0,   12,   -8,  -16
    .db   0,   12,  -16,    0
    .db   0,   12,   -8,   16
    .db   4,   12,    0,   32
    .db   0,   19,   64,  -16
    .db   0,   18,   32,   24
    .db   0,   17,  -56,   16
    .db   0,   16,  -72,  -32
    .db   0,    1,   -8,  -40
    .db   0,    0,  -16,  -24
    .db   0,    0,  -24,   -8
    .db   0,    0,  -16,    8
    .db   4,    0,   -8,   24
    .db   0,   19,    0,   24
    .db   0,   18,   64,   16
    .db   0,   17,   72,  -32
    .db   0,   16,   32,  -16
    .db   0,    4,  -16,  -40
    .db   0,    5,  -24,  -24
    .db   0,    4,  -32,   -8
    .db   0,    5,  -24,    8
    .db   4,    4,  -16,   24
    .db   0,   19,   24,   16
    .db   0,   18,   40,  -32
    .db   0,   17,    0,  -16
    .db   0,   16,  -40,   24
    .db   0,    9,  -24,  -32
    .db   0,    8,  -32,  -16
    .db   0,    9,  -40,    0
    .db   0,    8,  -32,   16
    .db   4,    9,  -24,   32
    .db   0,   19,    8,  -32
    .db   0,   18,  -40,  -16
    .db   0,   17,  -72,   24
    .db   0,   16,  -16,   16
    .db   0,   12,  -32,  -24
    .db   0,   13,  -40,   -8
    .db   0,   12,  -48,    8
    .db   0,   13,  -40,   24
    .db   4,   12,  -32,   40
    .db   0,   19,  -72,  -16
    .db   0,   18,   72,   16
    .db   0,   17,  -56,   16
    .db   0,   16,  -32,  -32
    .db   0,   12,   16,   48
    .db   0,   12,    0,   32
    .db   0,    0,  -40,  -16
    .db   0,    0,  -48,    0
    .db   0,    0,  -56,   16
    .db   0,    0,  -48,   32
    .db   4,    0,  -40,   48
    .db   0,   19,   32,   16
    .db   0,   18,  -80,   16
    .db   0,   17,  -72,  -32
    .db   0,   16,   72,  -24
    .db   0,    0,  -24,    8
    .db   0,    0,  -16,   24
    .db   0,    0,    0,   40
    .db   0,    8,  -48,   -8
    .db   0,    8,  -56,    8
    .db   0,    8,  -64,   24
    .db   4,    8,  -56,   40
    .db   0,   19,   64,   32
    .db   0,   18,   72,    0
    .db   0,   17,   40,  -24
    .db   0,   16,    0,   16
    .db   0,    4,  -24,   -8
    .db   0,    4,  -32,   16
    .db   0,    4,  -24,   32
    .db   0,   12,  -48,   48
    .db   0,   12,  -56,    0
    .db   0,   12,  -64,   16
    .db   4,   12,  -56,   32
    .db   0,   19,   32,    0
    .db   0,   18,    0,  -24
    .db   0,   17,  -32,   16
    .db   0,   16,   24,   32
    .db   0,    8,  -16,  -16
    .db   0,    8,  -32,    0
    .db   0,    8,  -32,   40
    .db   0,    8,  -40,   16
    .db   0,    0,  -64,    8
    .db   0,    0,  -72,   24
    .db   4,    0,  -64,   40
    .db   0,   19,  -40,  -24
    .db   0,   18,  -72,   16
    .db   0,   17,  -16,   32
    .db   0,   16,   -8,    0
    .db   0,   12,   -8,  -24
    .db   0,   12,  -24,  -16
    .db   0,   12,  -32,    8
    .db   0,    4,  -72,   16
    .db   0,    4,  -80,   32
    .db   4,    4,  -72,   48
    .db   0,   18,  -56,   32
    .db   0,   17,  -48,    0
    .db   0,   16,  -72,  -24
    .db   0,    0,    0,  -16
    .db   0,    0,  -16,  -24
    .db   0,    1,  -40,    0
    .db   4,    8,  -80,   24
    .db   4,    5,  -48,   -8
    .db   0,   10,  -56,  -32
    .db   4,    9,  -72,   32
    .db   0,   15,  -56,  -32
    .db   4,   14,  -72,   32
    .db   0,    1,  -56,  -24
    .db   4,    3,  -72,   32
    .db   0,    4,  -56,  -32
    .db   3,    5,  -72,   24
    .db   3,    8,  -72,   16

.org 0x283C68
FxScript_283C68:
    .db 54   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,    4,    2
    .db   0,    1,    4,   21
    .db   0,    2,   13,   11
    .db   9,    3,   -5,   11
    .db   0,    0,    4,   -2
    .db   0,    0,    4,    2
    .db   0,    1,    4,   25
    .db   0,    1,    4,   21
    .db   0,    2,   17,   11
    .db   0,    2,   13,   11
    .db   0,    3,   -9,   11
    .db   9,    3,   -5,   11
    .db   0,    0,    4,   -6
    .db   0,    0,    4,   -2
    .db   0,    0,    4,    2
    .db   0,    1,    4,   29
    .db   0,    1,    4,   25
    .db   0,    1,    4,   21
    .db   0,    2,   21,   11
    .db   0,    2,   17,   11
    .db   0,    2,   13,   11
    .db   0,    3,  -13,   11
    .db   0,    3,   -9,   11
    .db   9,    3,   -5,   11
    .db   0,    0,    4,   -6
    .db   0,    0,    4,   -2
    .db   0,    1,    4,   29
    .db   0,    1,    4,   25
    .db   0,    2,   21,   11
    .db   0,    2,   17,   11
    .db   0,    3,  -13,   11
    .db   9,    3,   -9,   11
    .db   0,    0,    4,   -6
    .db   0,    1,    4,   29
    .db   0,    2,   21,   11
    .db   9,    3,  -13,   11
    .db   9, 0xFF,  -13,   11

.org 0x283CFD
FxScript_283CFD:
    .db 40   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,  -32,    0
    .db   3,    1,  -32,    0
    .db   3,    2,  -32,    0
    .db   3,    3,  -32,    0
    .db   3,    4,  -32,    0
    .db   4, 0xFF,  -32,    0
    .db   4,    5,  -32,    0
    .db   3,    6,  -32,    0
    .db   3,    7,  -32,    0
    .db   3,    8,  -32,    0
    .db   3,    4,  -32,    0
    .db   4, 0xFF,  -32,    0

.org 0x283D2E
FxScript_283D2E:
    .db 35   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    0,   16,  -16
    .db   0,    0,   52,  -34
    .db   4,    0,   48,   16
    .db   0,    0,   35,  -27
    .db   0,    0,   65,   14
    .db   0,    0,   35,   32
    .db   0,    0,    9,  -30
    .db   0,    0,   39,  -11
    .db   0,    0,   62,  -10
    .db   0,    0,   24,  -41
    .db   0,    0,    9,   10
    .db   0,    1,   16,  -16
    .db   0,    1,   52,  -34
    .db   4,    1,   49,   17
    .db   0,    4,   35,   33
    .db   0,    4,    9,  -30
    .db   0,    4,   66,  -22
    .db   0,    0,   16,  -16
    .db   0,    1,   40,  -10
    .db   0,    1,   62,  -10
    .db   0,    1,   23,  -42
    .db   0,    2,    9,   10
    .db   0,    2,   52,  -34
    .db   4,    2,   49,   17
    .db   0,    5,   35,   34
    .db   0,    5,    9,  -30
    .db   0,    5,   67,  -22
    .db   0,    0,   62,   -9
    .db   0,    0,   24,  -41
    .db   0,    2,   39,  -10
    .db   0,    3,    8,   10
    .db   0,    3,   52,  -34
    .db   4,    3,   49,   17
    .db   0,    4,   -2,   29
    .db   0,    4,   34,  -39
    .db   0,    4,   68,   31
    .db   0,    6,   35,   34
    .db   0,    6,    9,  -30
    .db   0,    6,   67,  -22
    .db   0,    2,   52,  -34
    .db   0,    2,   49,   17
    .db   0,    2,    8,   10
    .db   4,    3,   40,  -10
    .db   0,    5,   -4,   29
    .db   0,    5,   33,  -39
    .db   0,    5,   68,   31
    .db   0,    7,   35,   34
    .db   0,    7,   68,   31
    .db   0,    7,   67,  -22
    .db   0,    1,   52,  -34
    .db   0,    1,   49,   17
    .db   0,    1,    8,   10
    .db   4,    2,   40,  -10
    .db   0,    6,   -2,   29
    .db   0,    6,   33,  -39
    .db   0,    6,   68,   31
    .db   0,    0,   52,  -34
    .db   0,    0,   48,   16
    .db   0,    0,    8,   10
    .db   4,    1,   39,  -11
    .db   0,    7,   -2,   29
    .db   0,    7,   33,  -39
    .db   4,    7,   68,   31
    .db   0,    4,   -2,   29
    .db   0,    4,   33,  -39
    .db   3,    4,   68,   31

.org 0x283E37
FxScript_283E37:
    .db 54   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    3,   32,  -28
    .db   0,    3,   32,  -20
    .db   0,    3,   32,  -12
    .db   0,    3,   32,   -4
    .db   0,    3,   32,    4
    .db   0,    3,   32,   12
    .db   0,    3,   32,   20
    .db   3,    3,   32,   28
    .db   3, 0xFF,   32,   44
    .db   0,    2,   32,  -28
    .db   0,    2,   32,  -20
    .db   0,    2,   32,  -12
    .db   0,    2,   32,   -4
    .db   0,    2,   32,    4
    .db   0,    2,   32,   12
    .db   0,    2,   32,   20
    .db   3,    2,   32,   28
    .db   3, 0xFF,   32,  -12
    .db   0,    1,   32,  -28
    .db   0,    1,   32,  -20
    .db   0,    1,   32,  -12
    .db   0,    1,   32,   -4
    .db   0,    1,   32,    4
    .db   0,    1,   32,   12
    .db   0,    1,   32,   20
    .db   3,    1,   32,   28
    .db   3, 0xFF,   32,  -12
    .db   0,    0,   32,  -28
    .db   0,    0,   32,  -20
    .db   0,    0,   32,  -12
    .db   0,    0,   32,   -4
    .db   0,    0,   32,    4
    .db   0,    0,   32,   12
    .db   0,    0,   32,   20
    .db   3,    0,   32,   28
    .db   3, 0xFF,   32,  -12
    .db   0,    0,   32,  -28
    .db   0,    0,   32,  -20
    .db   0,    0,   32,  -12
    .db   0,    0,   32,   -4
    .db   0,    0,   32,    4
    .db   0,    0,   32,   12
    .db   0,    0,   32,   20
    .db   3,    0,   32,   28
    .db   0,    1,   32,  -28
    .db   0,    1,   32,  -20
    .db   0,    1,   32,  -12
    .db   0,    1,   32,   -4
    .db   0,    1,   32,    4
    .db   0,    1,   32,   12
    .db   0,    1,   32,   20
    .db   3,    1,   32,   28
    .db   0,    0,   32,  -28
    .db   0,    0,   32,  -20
    .db   0,    0,   32,  -12
    .db   0,    0,   32,   -4
    .db   0,    0,   32,    4
    .db   0,    0,   32,   12
    .db   0,    0,   32,   20
    .db  14,    0,   32,   28
    .db   0,    1,   32,  -28
    .db   0,    1,   32,  -20
    .db   0,    1,   32,  -12
    .db   0,    1,   32,   -4
    .db   0,    1,   32,    4
    .db   0,    1,   32,   12
    .db   0,    1,   32,   20
    .db   4,    1,   32,   28
    .db   0,    2,   32,  -28
    .db   0,    2,   32,  -20
    .db   0,    2,   32,  -12
    .db   0,    2,   32,   -4
    .db   0,    2,   32,    4
    .db   0,    2,   32,   12
    .db   0,    2,   32,   20
    .db   3,    2,   32,   28
    .db   0,    3,   32,  -28
    .db   0,    3,   32,  -20
    .db   0,    3,   32,  -12
    .db   0,    3,   32,   -4
    .db   0,    3,   32,    4
    .db   0,    3,   32,   12
    .db   0,    3,   32,   20
    .db   3,    3,   32,   28

.org 0x283F88
FxScript_283F88:
    .db 10   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,    5,  -22
    .db   4,    1,  -32,    0
    .db   2,    2,  -48,   13

.org 0x283F95
FxScript_283F95:
    .db 40   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,   32,    0
    .db   3,    1,   32,    0
    .db   3,    2,   32,    0
    .db   3,    3,   32,    0
    .db   3,    4,   32,    0
    .db   4, 0xFF,   32,    0
    .db   4,    5,   32,    0
    .db   3,    6,   32,    0
    .db   3,    7,   32,    0
    .db   3,    8,   32,    0
    .db   3,    4,   32,    0
    .db   4, 0xFF,   32,    0

.org 0x283FC6
FxScript_283FC6:
    .db 103   ; total ticks
    ;   ticks, frame, dx, dy
    .db   0,    7,   44,  -21
    .db   0,    7,   30,   45
    .db   0,    7,  -39,   42
    .db   0,    7,  -66,   -1
    .db   4,    7,  -22,  -50
    .db   0,    5,  -26,  -42
    .db   0,    5,   39,  -24
    .db   0,    5,  -43,   29
    .db   0,    7,  -46,  -34
    .db   0,    7,   20,  -39
    .db   0,    7,   42,   15
    .db   0,    7,   -3,   45
    .db   0,    6,   25,  -11
    .db   0,    6,   22,   33
    .db   0,    6,  -28,   29
    .db   0,    6,  -41,   -1
    .db   4,    6,  -15,  -32
    .db   0,    5,  -35,   20
    .db   0,    5,   19,   40
    .db   0,    5,   21,  -36
    .db   0,    6,   -9,  -19
    .db   0,    6,  -22,   -1
    .db   0,    6,  -18,   19
    .db   0,    6,   14,   22
    .db   0,    6,   17,   -8
    .db   0,    6,    8,  -21
    .db   0,    6,  -32,  -22
    .db   0,    6,   -3,   28
    .db   3,    6,   32,   10
    .db   0,    5,   -5,  -11
    .db   0,    5,  -12,    0
    .db   0,    5,   -9,    9
    .db   0,    5,    6,   10
    .db   0,    5,    9,   -3
    .db   0,    5,    4,  -10
    .db   0,    5,    9,    4
    .db   0,    5,  -10,   -7
    .db   3,    5,   -1,   13
    .db  10, 0xFF,   -1,   13
    .db   3,    6,   -1,   -1
    .db   3,    7,   -1,   -1
    .db   4,    8,   -1,   -1
    .db   5,   11,    0,    0
    .db   3,    7,    0,    0
    .db   4,    9,    0,    0
    .db   3,    6,   -1,   -1
    .db  12, 0xFF,    0,    1
    .db   4,    0,    0,    0
    .db   6,    1,    0,   -1
    .db   7,    2,    0,   -1
    .db   0,   11,  -20,    0
    .db   0,   11,   20,    0
    .db   0,   11,   -1,  -20
    .db   0,   11,    0,   20
    .db   0,   11,  -15,  -10
    .db   0,   11,   15,  -10
    .db   0,   11,  -15,   10
    .db   0,   11,   15,   10
    .db   4,    2,    0,   -1
    .db   0,   11,   45,    0
    .db   0,   11,  -45,    0
    .db   0,   11,   -1,   28
    .db   0,   11,   -1,  -28
    .db   0,   11,  -25,  -26
    .db   0,   11,   25,  -26
    .db   0,   11,   25,   26
    .db   0,   11,  -25,   26
    .db   4,    2,    0,   -1
    .db   0,   11,  -70,    0
    .db   0,   11,   70,    0
    .db   0,   11,   40,   40
    .db   0,   11,  -40,   40
    .db   0,   11,  -40,  -40
    .db   0,   11,   40,  -40
    .db   4,    2,    0,   -1
    .db   7,    2,    0,   -1
    .db   3,    1,    0,    1
    .db   3,    4,    0,    1

.org 0x2840FF
FxScript_2840FF:
    .db 37   ; total ticks
    ;   ticks, frame, dx, dy
    .db   4,    0,    0,   32
    .db   3,    1,    0,   32
    .db   3,    1,   -1,   32
    .db   3,    1,   -1,   32
    .db   3,    2,    1,   24
    .db   3,    2,    0,   24
    .db   3,    3,   -1,   16
    .db   3,    3,    1,   16
    .db  12,    4,    0,   16

.org 0x284124
BattleEffects:              ; effect id -> record
    .dl FxRecord_2747B0, FxRecord_2747B0, FxRecord_2747C4, FxRecord_2747D8
    .dl FxRecord_2747EC, FxRecord_2756D8, FxRecord_2756EC, FxRecord_275700
    .dl FxRecord_275714, FxRecord_2752A0, FxRecord_2752B4, FxRecord_2752C8
    .dl FxRecord_2752DC, FxRecord_274774, FxRecord_274788, FxRecord_274E04
    .dl FxRecord_274E18, FxRecord_274E2C, FxRecord_274E40, FxRecord_2754BC
    .dl FxRecord_2754D0, FxRecord_2754E4, FxRecord_2754F8, FxRecord_27550C
    .dl FxRecord_275520, FxRecord_275534, FxRecord_275548, FxRecord_27555C
    .dl FxRecord_275570, FxRecord_275584, FxRecord_275598, FxRecord_2755AC
    .dl FxRecord_2755C0, FxRecord_2755D4, FxRecord_2755E8, FxRecord_274F6C
    .dl FxRecord_274F80, FxRecord_274F94, FxRecord_274FA8, FxRecord_274FBC
    .dl FxRecord_274FD0, FxRecord_274FE4, FxRecord_274FF8, FxRecord_274940
    .dl FxRecord_274954, FxRecord_274968, FxRecord_27497C, FxRecord_2748A0
    .dl FxRecord_2748B4, FxRecord_2748C8, FxRecord_2748DC, FxRecord_275200
    .dl FxRecord_275214, FxRecord_275228, FxRecord_27523C, FxRecord_2746D4
    .dl FxRecord_2746E8, FxRecord_2746FC, FxRecord_274710, FxRecord_274D64
    .dl FxRecord_274D78, FxRecord_274D8C, FxRecord_274DA0, FxRecord_275124
    .dl FxRecord_275138, FxRecord_27514C, FxRecord_275160, FxRecord_274C9C
    .dl FxRecord_274CB0, FxRecord_274CC4, FxRecord_274CD8, FxRecord_274CEC
    .dl FxRecord_274D00, FxRecord_275728, FxRecord_27573C, FxRecord_275750
    .dl FxRecord_275764, FxRecord_275778, FxRecord_27578C, FxRecord_2757A0
    .dl FxRecord_2757B4, FxRecord_2757C8, FxRecord_27500C, FxRecord_275020
    .dl FxRecord_274AA8, FxRecord_274ABC, FxRecord_274AD0, FxRecord_274AE4
    .dl FxRecord_274AF8, FxRecord_274B0C, FxRecord_274B20, FxRecord_274B34
    .dl FxRecord_274B48, FxRecord_274B5C, FxRecord_274B70, FxRecord_274B84
    .dl FxRecord_27532C, FxRecord_275340, FxRecord_275354, FxRecord_275368
    .dl FxRecord_274A08, FxRecord_274A1C, FxRecord_274A30, FxRecord_274A44
    .dl FxRecord_2753F4, FxRecord_275408, FxRecord_27541C, FxRecord_275430
    .dl FxRecord_275660, FxRecord_274800, FxRecord_274814, FxRecord_274828
    .dl FxRecord_27483C, FxRecord_2755FC, FxRecord_275624, FxRecord_2753CC
    .dl FxRecord_274F44, FxRecord_2757DC, FxRecord_2757F0, FxRecord_275804
    .dl FxRecord_274C4C, FxRecord_274C60, FxRecord_274BAC, FxRecord_274BC0
    .dl FxRecord_274BD4, FxRecord_274BE8, FxRecord_275034, FxRecord_275048
    .dl FxRecord_27505C, FxRecord_275070, FxRecord_275084, FxRecord_275098
    .dl FxRecord_2750AC, FxRecord_2750C0, FxRecord_274E54, FxRecord_274E68
    .dl FxRecord_274E7C, FxRecord_274E90, FxRecord_274EA4, FxRecord_274EB8
    .dl FxRecord_274ECC, FxRecord_274EE0, FxRecord_274EF4, FxRecord_274F08
    .dl FxRecord_274F1C, FxRecord_274F30, FxRecord_275318, FxRecord_2749E0
    .dl FxRecord_275688, FxRecord_275688, FxRecord_275688, FxRecord_2751C4
    .dl FxRecord_275854, FxRecord_2746C0, FxRecord_27479C, FxRecord_2752F0
    .dl FxRecord_275818, FxRecord_2751D8, FxRecord_275840, FxRecord_274D50
    .dl FxRecord_2751EC, FxRecord_27569C, FxRecord_27569C, FxRecord_2754A8
    .dl FxRecord_274D14, FxRecord_274D3C, FxRecord_2756B0, FxRecord_274D28
    .dl FxRecord_275250, FxRecord_275264, FxRecord_275278, FxRecord_27528C
    .dl FxRecord_274724, FxRecord_274738, FxRecord_27474C, FxRecord_274760
    .dl FxRecord_274DB4, FxRecord_274DC8, FxRecord_274DDC, FxRecord_274DF0
    .dl FxRecord_275174, FxRecord_275188, FxRecord_27519C, FxRecord_2751B0
    .dl FxRecord_275674, FxRecord_274850, FxRecord_274864, FxRecord_274878
    .dl FxRecord_27488C, FxRecord_275610, FxRecord_275638, FxRecord_2753E0
    .dl FxRecord_274F58, FxRecord_274C74, FxRecord_274C88, FxRecord_274BFC
    .dl FxRecord_274C10, FxRecord_274C24, FxRecord_274C38, FxRecord_2750D4
    .dl FxRecord_2750E8, FxRecord_2750FC, FxRecord_275110, FxRecord_2756C4
    .dl FxRecord_275494, FxRecord_2749F4, FxRecord_2749F4, FxRecord_2749F4
    .dl FxRecord_274B98, FxRecord_27564C, FxRecord_27582C, FxRecord_275304
    .dl FxRecord_274990, FxRecord_2749A4, FxRecord_2749B8, FxRecord_2749CC
    .dl FxRecord_2748F0, FxRecord_274904, FxRecord_274918, FxRecord_27492C
    .dl FxRecord_27537C, FxRecord_275390, FxRecord_2753A4, FxRecord_2753B8
    .dl FxRecord_274A58, FxRecord_274A6C, FxRecord_274A80, FxRecord_274A94
    .dl FxRecord_275444, FxRecord_275458, FxRecord_27546C, FxRecord_275480
