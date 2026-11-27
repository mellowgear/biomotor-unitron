; constants/town.inc: town and menu screen modes chosen by number [code]
; RunWorksScreen A (wWorksScreenMode, wCampWorksMode)
WORKS_MODE_STREET	equ	1	; StreetGoWorks [code]
WORKS_MODE_LOADED_GAME	equ	2	; LoadGameEnterWorks (main menu after a load) [code]
WORKS_MODE_AFTER_DEFEAT	equ	3	; StreetAfterDungeonDefeat [code]
WORKS_MODE_CAMP_STATS	equ	4	; camp Stats (CampMenuInput, WorksStatsMenu) [code]
WORKS_MODE_CAMP_ITEMS	equ	5	; camp Item list (CampItemSubmenuInput, WorksItemMenu) [code]
WORKS_MODE_LIST_PICK	equ	6	; a list pick (WorksScreenEntry) [code]
; wSaveMenuMode
SAVE_MENU_LOAD	equ	0	; LoadOkYesNoText, LoadCompleteText [code]
SAVE_MENU_SAVE	equ	1	; the Works Data menu; SaveCompleteText [code]
SAVE_MENU_CLEAR	equ	2	; ClearOkYesNoText, ClearCompleteText [code]
