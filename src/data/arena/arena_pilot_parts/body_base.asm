; ArenaPilotBodyBase: 6 x u8, the body id is this + 3 * pilot group (Body1/2/3 of the group's
; affinity: bodies come in 5 groups of 3).
; Read by sub_213C2E (arena bracket setup): for each random pilot in the bracket (enemy id
; 0x62-0x70, p = id - 0x62, pilot group g = p / 3) it writes 6 part ids to 0x60CC + 6*slot,
; the list LoadEnemy copies to wEnemyParts: +0 core, +1 body, +2 right arm, +3 left arm,
; +4 legs, +5 back (LoadEnemy / SetRobotDrawParts). Ids are category-relative (GetCoreRecord ..
; GetArmRecord add PartCategoryStart). Line = 7 - rank (task +0x15): line 1 = Rank S .. line 6
; = Rank E; ranks CS and X (task +0x15 >= 8) have no random pilots and skip this.
; id: body base
	db	3	; 1 Rank S: Body3, Body3, Body3, Body3, Body3
	db	2	; 2 Rank A: Body2, Body2, Body2, Body2, Body2
	db	2	; 3 Rank B: Body2, Body2, Body2, Body2, Body2
	db	1	; 4 Rank C: Body1, Body1, Body1, Body1, Body1
	db	1	; 5 Rank D: Body1, Body1, Body1, Body1, Body1
	db	1	; 6 Rank E: Body1, Body1, Body1, Body1, Body1
