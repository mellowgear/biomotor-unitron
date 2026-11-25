; data/town/pointers: pointer tables read by the code (tools/pointers.py), one section each

d_249EAB	section	romdata abs=0x249EAB
; [code] DrawTownPlace: name per town place 0-6
PlaceNames:
	dl	SquareText2,PubText,DTownText,ForestText
	dl	SpringText,WorksText2,ShopText2

d_249F66	section	romdata abs=0x249F66
; [code] ShowTalkMenu: name per NPC (talk speaker - 0x15)
NpcNames:
	dl	JonText,LilyText,CyriusText,GalbText
	dl	LanaText,WyseText,ZiggyText,CeusText
	dl	HelmutText,AldaText,CamilText,MeeseText
	dl	CollaText,TetisText
