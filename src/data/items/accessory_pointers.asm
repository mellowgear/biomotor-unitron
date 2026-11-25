; data/items/accessory_pointers: pointer tables read by the code (tools/pointers.py), one section each

d_207A43	section	romdata abs=0x207A43
; [code] sub_207A32: per accessor id (wEquipAcc1/2, 0 = none) a routine pointer
Pointers_207A43:
	dl	swp_207ADB,swp_207ADB,swp_207ADB,swp_207ADB
	dl	swp_207ADB,swp_207ADB,swp_207ADB,swp_207ADB
	dl	swp_207ADB,swp_207ADC,swp_207AE2,swp_207AE8
	dl	swp_207AEE,swp_207AF4,swp_207AFA,swp_207B00
	dl	swp_207B06,swp_207B0C,swp_207ADB,swp_207ADB
	dl	swp_207ADB,swp_207ADB,swp_207ADB,swp_207ADB
	dl	swp_207ADB,swp_207ADB,swp_207ADB,swp_207ADB
	dl	swp_207ADB,swp_207ADB,swp_207ADB,swp_207ADB
	dl	swp_207ADB,swp_207ADB,swp_207ADB,swp_207ADB
	dl	swp_207ADB,swp_207ADB

d_20888E	section	romdata abs=0x20888E
; [code] CalcUnitStats -> dyn_208879: jp through entry wEquipAcc1/2 (accessory id; 0 returns first)
Pointers_20888E:
	dl	swp_208926,swp_208927,swp_20892C,swp_208931
	dl	swp_208936,swp_20893B,swp_208940,swp_208945
	dl	swp_20894A,swp_208926,swp_208926,swp_208926
	dl	swp_208926,swp_208926,swp_208926,swp_208926
	dl	swp_208926,swp_208926,swp_20894F,swp_208956
	dl	swp_20895D,swp_208964,swp_20896B,swp_208972
	dl	swp_208979,swp_208980,swp_208987,swp_20898E
	dl	swp_208995,swp_20899C,swp_2089A3,swp_2089AA
	dl	swp_2089B1,swp_2089B8,swp_2089BF,swp_2089C6
	dl	swp_208926,swp_208926
