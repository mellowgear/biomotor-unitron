; PartCategoryStart: 5 x u16, the first part id of each category (PartStats: Body 1-15, Core
; 16-30, Legs 31-74, Back 75-94, Arm 95-227). [code] GetBodyName .. GetArmRecord (engine/
; tables.asm) and the equip code in engine/player.asm add the word to a category-relative id.
; The ROM holds it twice (Works copy at 0x25B619 with no reader found; 0x271882 is read).
	dw	1	; Body
	dw	16	; Core
	dw	31	; Legs
	dw	75	; Back
	dw	95	; Arm
