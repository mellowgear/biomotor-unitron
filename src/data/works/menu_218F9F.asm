; the Chara stats page (Works > Stats > Chara): titles and labels
d_218F9F	section	romdata abs=0x218F9F
$include "build/data/works/menu_texts_218F9F.asm"	; src/data/works/menu_texts_218F9F.txt
d_218FBB	section	romdata abs=0x218FBB
; [code] DrawCharaStatsPage: PrintStringTable with B = 1 in box 2
CharaStatsLevLine:
	menu_item	0,4,LevText
