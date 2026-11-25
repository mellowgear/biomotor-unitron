; ArenaPilotArms: 6 ranks x 15 arm ids; right and left arm are each entry line * 15 +
; Random() % count (two separate rolls; the same arm can come twice). Not per pilot group.
; How RollArenaBracket builds a random pilot's parts, and the line order: body_base.asm.
; one line per rank: 15 ids
	db	 24, 33, 40, 54, 75, 79, 85, 90, 94,100,105,110,115,125,  0	; Rank S: Cutter, Wyndia, Break, IceClw, Coil, ArchMg, Infrno, Buster, Indra, Ashra, Hacker, Plate, RedClw, RailGn
	db	 22, 29, 39, 45, 50, 53, 59, 78, 84, 89, 93,109,114,120,124	; Rank A: Drill, Sabre+, 2Edge, Sthrn+, Spiral, BtlHk, 9Tail, Warlok, Cursed, Zoomer, Qatar, Mail, Mantis, Phalnx, XGun
	db	126,127,128,129,130,131,132,133,  0,  0,  0,  0,  0,  0,  0	; Rank B: Flint, Sword, Kama, TgrHnd, MoleHd, Stunr, Needle, Pole
	db	 17, 28, 37, 42, 48, 57, 67, 77, 92, 97,102,107,112,117,122	; Rank C: Binder, Dirk, BtlAxe, MgaBll, Pierce, Whip+, SpikeD, Wizard, Triger, Twin, SDisc, Gloves, Scorp, Vulcan, 2Barrl
	db	 16, 26, 51, 76, 96,101,106,111,116,121,  0,  0,  0,  0,  0	; Rank D: Magma, Rapier, Hook, Mage, Maxi, Bazoka, Knukle, Troopr, HndGun, Cannon
	db	 36, 41, 46, 56, 61, 62, 66, 71, 81, 86,  0,  0,  0,  0,  0	; Rank E: HndAxe, BllArm, Lancer, Whip, Fork, HkClaw, Disc, EWire, Skull, Spring
