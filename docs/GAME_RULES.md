# Game rules

The mechanics of Biomotor Unitron (the first game) as the code computes them, gathered from the
routine headers, the code itself and the tables in `src/data/`. Values are decimal unless written 0x.
**(?)** = not settled by the code or the source marks it uncertain. Game text is quoted as it is in
the ROM (this is the English release).

Terms: the *unit* is the player's UNITRON robot, the *pilot* is the player (level `wPlayerLevel`,
1..50, race/gender `wPlayerRace` 1..10), the *partner* is the engineer at the Works (`wWorksPartnerRace`,
engineer level `wWorksEngineerLevel` 0..50). Races, in the order of `text/human.asm` and the pilot
names in `text/rod.asm`: 1/2 Human (Rod / Rena), 3/4 Forester (Chris / Leaf), 5/6 Mariner (Zappa /
Shera), 7/8 Birdian (Fezar / Shilfe), 9/10 Lizardman (Carl / Pinky); an odd value is male
(`SplitRaceGender`). Race index r = (wPlayerRace - 1) / 2 picks the starting parts, EXP curve, skills
and Cyrius's trade menu.

## Stats

The status screen's order is HP EP AP SP RP MP AT (`text/unitron_status_hp_hit.asm`):

| Stat | Meaning | Used in |
|---|---|---|
| HP | hit points | KO at 0 |
| EP | energy; every arm or skill costs EP | `CheckCanAttack`, `CalcEnemyMinAttackEP` |
| AP | attack | `DamageRoll` (attacker side) |
| SP | defence | `DamageRoll` (defender side) |
| RP | accuracy and evasion | `HitMargin` |
| MP | "Movement": speed | `TurnOrderMargin` |
| AT | affinity, a bit mask: 1 Fire, 2 Wood, 4 Water, 8 Wind, 16 Earth, 32 Light, 64 Dark, 128 Mirror | `ApplyAffinity` |

**Unit stats** (`CalcUnitStats`, src/engine/player.asm): AP / SP / RP / MP = the pilot's own stats +
the AP / SP / RP / MP of all six equipped parts (body, core, right arm, left arm, legs, back pack);
max HP / max EP = the sum of the six parts' HP / EP (the pilot has none). Then the two accessories
add their bonuses, and the body's affinity becomes the unit's (an elemental crystal accessory can
replace it, see [Accessories](#items)).

## Battle

### Flow

| Step | Routine | Rule |
|---|---|---|
| Start | `BattleStart` (src/engine/battle/init.asm) | unit EP refilled (HP is **not**), enemy HP / EP full; crit / flee / status chances cleared, EP cost 100 %, recharge 30 %; battle accessories (`ApplyBattleAccessories`) and the level-gap chances (`AddLevelGapChances`); rust is kept from the dungeon |
| Round start | `DrawBattleScreen`, `EnemyChooseAttack` | stat buffs recomputed, EP costs; the enemy picks its action first, then the menu: Attack, Item, Charge, Flee (Quit outside dungeons) |
| Order | `StartBattleRound`, `TurnOrderMargin` | (unit MP x buff % + LevelRoll(your level)) - (enemy MP x buff % + LevelRoll(its level)); >= 0 the unit moves first. Outside dungeons a Quit always goes first |
| Actions | `PlayerTurn`, `EnemyTurn` | each pays its EP cost at its turn end (`PlayerTurnEnd`, `EnemyTurnEnd`) |
| Turn end | `PlayerTurnEnd`, `EnemyTurnEnd` (status.asm) | paralysis / confusion recovery rolls, buff counters - 1, time-stop counter |
| Round end | `BattleStatusEffects` | rust and EP leak damage, revives (Recvr, AutoRp), Proplr refill; then victory / defeat or the next round |

**LevelRoll** (`LevelRoll`, `src/data/battle/level_rolls.asm`): random 1..10 + 10 x (1 + (level - 1) / 5),
so 11-20 at levels 1-5, 21-30 at 6-10 ... 101-110 at 46-50. It is added to both sides of every hit,
damage and turn-order check.

### Hit, damage, critical (PlayerAttack, EnemyAttack)

`PlayerAttack` (src/engine/battle/player_turn.asm) and its near-copies `EnemyAttack` / `EnemyArmAttack`
(enemy_turn.asm):

| Roll | Routine | Rule |
|---|---|---|
| Hit | `HitMargin` | attacker RP x buff % + LevelRoll(attacker level) - (ceil(defender RP x buff % / 4) + defender level); negative = miss ("You missed"). There are no forced hit / miss edges |
| Attack | | player: arm or skill power (record +4) + unit AP, x AP buff %. Enemy: slot power (x the area AP % for scaled enemies, `ApplyEnemyScaling`) + enemy AP, x its AP buff % |
| Defence | | the target's SP x its SP buff % |
| Damage | `DamageRoll`, `src/data/battle/damage.asm` | d = (attack + LevelRoll) - (defence + LevelRoll), both rolls at the **attacker's** level; d < 0 counts as -5. Line = (d + 9) / 5 + 1 (max 202), one of 5 columns at random. Line 1 gives 1-5, line n >= 2 gives 2n + 2 .. 2n + 6: about 0.4 x d + 8, at most 410 |
| Element | `ApplyAffinity` | x AffinityTable[attack affinity][target affinity] / 100, at least 1 |
| Airbag | `ApplyAirbag` | damage to the unit halved (min 1) while Vapor's Airbag is on |
| Critical | `wCritChance` | chance % = LevelGapCrit + Radar accessories; a crit doubles the damage (`PlayerHitResult1`: "Critical hit!!"); no cap is applied |
| Status | `wStatusChance` | an attack with a status (arm record +0x10, enemy slot action 1-4) lands it with LevelGapStatus % |

Every % roll in battle is `(pct x 256 + 99) / 100` against the low byte of `Random`, so a stated
chance is rounded up to the next 1/256.

**The arm / DEF rule.** U1 has no per-arm defence: the unit has one SP, the sum of the pilot's SP and
every part's SP, both arms included, and it is the defence against every enemy attack whichever arm
you use. On offence, the chosen arm's AP field is the attack's power (+4 of the arm record), and the
unit AP already holds both arms' AP (`CalcUnitStats`), so **the arm you attack with counts twice and
the other arm once**. Robot enemies do not have this: `LoadEnemy` adds no arm AP to the enemy's AP
("arms add no AP: their power is per attack"), so their arm counts once. The arms' SP / RP / MP always
add to the unit regardless of which arm attacks.

The level-gap tables (`src/data/battle/level_gap_chances/`, `AddLevelGapChances`), line = your level
- enemy level, clamped -11..+11 (the enemy uses its own gap):

| gap | <= -6 | -5..-1 | 0 | +1 | +2 | +3 | +4 | +5 | +6 | +8 | +10..+11 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| crit % | 0 | 1 | 5 | 7 | 9 | 11 | 13 | 15 | 17 | 21 | 25 |
| status % | 5-9 | 10-14 | 15 | 17 | 19 | 21 | 23 | 25 | 27 | 31 | 35 |
| flee % | 10-40 | 50-70 | 75 | 80 | 85 | 90 | 95 | 100 | 100 | 100 | 100 |

Against bosses (Ent..Uniti, ids 89-97, and the arena champions Fenril..Satana, 113-118) the unit's flee
and status chances are then set to 0.

### Elements (AffinityTable)

`src/data/battle/affinity.asm` (9 records of 18 bytes, `ApplyAffinity`): the row is the attack's
affinity, the column the target's. `AffinityIndex` takes the lowest set bit of the mask, so a mask
with several bits acts as its lowest element; no bit = "none".

| attack \ target | Fire | Wood | Water | Wind | Earth | Light | Dark | Mirror | none |
|---|---|---|---|---|---|---|---|---|---|
| **Fire** | 1 | **2** | 0.5 | 0.75 | 1.25 | 1 | 0.75 | 1 | 1 |
| **Wood** | 0.5 | 1 | 0.75 | 1.25 | **2** | 1 | 0.75 | 1 | 1 |
| **Water** | **2** | 1.25 | 1 | 0.5 | 0.75 | 1 | 0.75 | 1 | 1 |
| **Wind** | 1.25 | 0.75 | **2** | 1 | 0.5 | 1 | 0.75 | 1 | 1 |
| **Earth** | 0.75 | 0.5 | 1.25 | **2** | 1 | 1 | 0.75 | 1 | 1 |
| **Light** | 1 | 1 | 1 | 1 | 1 | 1 | **3** | 1 | 1 |
| **Dark** | 1.5 | 1.5 | 1.5 | 1.5 | 1.5 | 0.5 | 1 | 1 | 1 |
| **Mirror** | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| **none** | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |

In words: **Fire -> Wood -> Earth -> Wind -> Water -> Fire**, each beating the next (x2, the reverse
x0.5); two steps forward x1.25 (Fire on Earth), two steps back x0.75 (Fire on Wind). Every element
does x0.75 to Dark. Light does x3 to Dark and x1 to everything else. Dark does x1.5 to the five
elements and x0.5 to Light. Mirror is neutral both ways (the Help page says Mirror is "same affinity
as enemy", but no code copies anything: see BUGS.md). The game's own Help (`text/affinities_2_strength_weakness.asm`)
matches the cycle but leaves out the x0.75 against Dark and Light's x3.

The unit's attack affinity is the arm's or skill's (arm record +0xE, skill s0E); its defence affinity is
`wUnitAffinity` (the body, or a crystal accessory). Enemy attacks carry their own affinity byte (slot +6).

### Statuses

Status ids 1-4 (arm record +0x10, enemy slot action 1-4): 1 paralysis, 2 rust, 3 EP leak, 4 confusion.

| Status | In battle | Wears off | Out of battle |
|---|---|---|---|
| Paralysis | cannot attack ("You can't attack"); a paralysed enemy cannot stop a flee | `RollStatusRecovery` at each turn end with `StatusRecovery[turns]` %: 0, 5, 10, 25, 50, 60, 70, 72 ... +2 a turn, 100 % at turn 22 | cleared at battle end |
| Rust | loses ceil(max HP / 20) each round end (the enemy: 1/20 of its current HP, see BUGS.md) | never by itself | **kept**: ceil(max HP / 20) per dungeon step (`RustStepDamage`); at 0 HP "is dead" and out of the dungeon |
| EP leak | loses ceil(max EP / 20) each round end, at most the EP left | never by itself | cleared at battle end |
| Confusion | the attack hits yourself: own RP / SP / affinity as the target, damage ceil(d / 4) (`PlayerAttack.skip3`) | as paralysis | cleared at battle end |

The Clear item cures all four (`ShowStatusCured`); a revive clears them too; the town (`StreetTask`)
clears paralysis and rust and refills HP / EP.

**Buffs** (`ComputeStatBuffs`, src/engine/battle/calc.asm): each of AP / SP / RP / MP starts at 100 %
and gets +30 % for a skill buff and +30 % for an item buff (two counters, so up to 160 %). Enemy
debuffs give -30 % each (skill and item, down to 40 %); an enemy "SP up" action gives +50 %. Each
counter lasts 5 turns (skill records use s04.. = 5). The item descriptions say 15 %; the code does 30 %.

### Commands

| Command | Routine | Rule |
|---|---|---|
| Attack | `BattleCommandMenu`, `CheckCanAttack` | right arm, left arm, skill 1, skill 2; refused when the EP cost (`wCommandEPCosts`, x `wEPCostPercent` %) is above your EP |
| Item | `BattleItemList`, `BattleUseItem` | the 14 battle items FixIt1..MagFlr, 6 per page; no EP cost |
| Charge | `BattleRecharge` | EP + `wRechargePercent` % of max EP (30 % + Panl accessories); refused at full EP ("EP at max") |
| Flee | `TryFlee` | free outside dungeons ("You gave up") and against a paralysed enemy; else `wFleeChance` %; never against Satana until the ending or Rank X (the menu has no Flee entry then either). Bosses set the flee chance to 0, so a dungeon boss cannot be fled |

**Skills** (`src/data/battle/skills/stats.asm`, `SkillEffects`): attack skills have power s04 (200 or
500) and EP cost s0C (30 or 100); the others:

| code | Handler | Effect |
|---|---|---|
| 5 | `ShowStatUp` | your AP / SP / RP / MP +30 % for the stats the record names, 5 turns |
| 6 | `ShowStatDown` | the enemy's -30 %, 5 turns (Maze) |
| 7 | `ShowFullHeal` | HP + 9999 (capped), every status cleared (Leaf) |
| 8 | `SkillTimeStop` | the enemy loses its turns for 3 rounds (August) |
| 9 | `SkillRecvr` | at 0 HP you come back with full HP once (Aqua; `wRecvrActive`) |
| 10 | `SkillAirbag` | damage to you halved for the rest of the battle (Vapor) |
| 11 | `SkillFullCharge` | every EP cost 0 for the rest of the battle (Breath) |

Helmut teaches them (`HelmutSkillOffer`, src/engine/menus/town/helmut.asm): race r gets skills
4r+1..4r+4, a choice of 4r+1 / 4r+2 from level 20 and of 4r+3 / 4r+4 from level 30 (event flags
0x30-0x33):

| Race | Lv 20 choice | Lv 30 choice |
|---|---|---|
| Human | Nova (fire 200, 30 EP) / Burst (AP & RP up, 15 EP) | Ragnok (fire 500, 100 EP) / Giga (all up, 50 EP) |
| Forester | Roots (wood 200) / Reed (SP & RP up) | Leaf (full heal, 70 EP) / August (time stop, 120 EP) |
| Mariner | Edge (water 200) / Maze (enemy all down, 20 EP) | Wall (water 500) / Aqua (Recvr, 120 EP) |
| Birdian | Slice (wind 200) / Cloud (RP & MP up) | Jolt (wind 500) / Vapor (Airbag, 100 EP) |
| Lizardman | Gash (earth 200) / Shield (AP & SP up) | Teeth (earth 500) / Breath (Full charge, 100 EP) |

### Enemy turns

`EnemyChooseAttack`: one random byte walks the enemy's 4 slots (`src/data/battle/enemy_attacks.asm`),
each taking its share (pct); a 100 % slot is taken at once. Pct 101 = "only below half HP, once per
battle" (`GetEnemySlotChance`, `wEnemyFullHealUsed`). When the enemy's EP is below its cheapest
attack, or below the picked one's cost, it uses `DefaultEnemyAttack` (action 13: recharge 30 % of its
max EP). Slot actions (`EnemyActionJumps`): plain attack, 1-4 attack + status, 5 flee (rolls the
**unit's** flee chance, BUGS.md), 6 SP up, 7 heal 50 HP, 8 cure itself, 9 full HP / EP once, 10 heal
100 HP, 11 / 12 attack with a robot arm, 13 recharge.

### Revive and KO

At 0 HP (`BattleStatusEffects`): Recvr revives with 9999 HP (capped at max); else an equipped
AutoRp is used up and revives with max HP / 2; else `BattleDefeat`. A revive clears all statuses.
When EP falls below the cheapest command, an equipped Proplr is used up to refill EP.

**Defeat** (`BattleDefeat`): HP and EP back to max. In a dungeon you are carried out to the Works
("Whew! I'm glad to see you're all right!"); nothing is lost. In the arena the bracket is lost
(`ArenaBattleLost`), and losing duel 6 of the Rank CS final (Satana) is GAME OVER.

### Enemy stats and area scaling

`src/data/battle/enemies/stats.asm` (118 records), `LoadEnemy`, `GetEnemyScaling`
(src/engine/tables.asm), `src/data/battle/enemy_scaling.asm`. A level of 255 means *scaled*: HP, EP,
AP (attack power), SP, RP and MP are multiplied by the row's %, and the level is base + 1..rand.
Monsters (ids 1-88) also get HP and EP + random -5..+5 before and after the scaling (BUGS.md). The row is
the **area level** - 1, clamped to 0-7 (`wAreaLevel`): the floor number in the four world dungeons,
8 in the Crystal Mine, the chosen rank (E = 1 .. X = 8) in the arena. Once EVENT_STAGE_ENDING (0x0A)
or EVENT_STAGE_WON_RANK_X (0x0B) is set, rows 9-16 are used instead.

| area | HP% EP% | AP% | SP% | RP% | MP% | level | after the ending: HP% / level |
|---|---|---|---|---|---|---|---|
| 1 | 100 | 150 | 100 | 100 | 100 | 1-4 | 500 / 15-19 |
| 2 | 200 | 200 | 150 | 150 | 150 | 5-9 | 600 / 20-24 |
| 3 | 300 | 250 | 200 | 200 | 200 | 10-14 | 700 / 25-29 |
| 4 | 400 | 300 | 250 | 250 | 250 | 15-19 | 800 / 30-34 |
| 5 | 500 | 350 | 300 | 300 | 300 | 20-24 | 900 / 35-39 |
| 6 | 600 | 450 | 400 | 400 | 400 | 25-29 | 1000 / 40-44 |
| 7 | 1000 | 750 | 600 | 600 | 600 | 35-39 | 1200 / 45-49 |
| 8 | 800 | 600 | 500 | 500 | 500 | 30-39 | 150 / 50 (?) |

Floor 7 of a world dungeon is harder than the Crystal Mine (row 7 above row 8). Row 16 has a level
range of 0, which `LoadEnemy` passes to `RandomRange` (a divide by 0, BUGS.md), so the post-game mine
level is uncertain. Bosses and arena champions have fixed levels and stats.

### Rewards and levels (BattleVictory)

| Reward | Rule |
|---|---|
| EXP | enemy EXP x `ExpLevelDiff`[enemy level - your level, clamped -5..+5] / 100, rounded up (`ExpForKill`): -5: 10 %, -4: 25 %, -3: 50 %, -2: 75 %, -1: 90 %, 0: 100 %, +1: 110 %, +2: 115 %, +3: 120 %, +4: 125 %, +5: 130 %. Given in every battle |
| GP | the enemy's GP, dungeon battles only (arena and link wins give EXP only); GP is capped at 999999 |
| Drop | the enemy's drop item or part with its drop % (100+ always; dungeon only) |
| Level | `TryLevelUp` until it fails: every level costs a flat 150 EXP for all five races (`src/data/player/exp_curves/`), max level 50. Each level adds `LevelGains` (odd / even table by `wPlayerRace` bit 0) plus a random 0..n per stat from `LevelBonus[wPlayerRace]` |

## Parts and development

**Parts** (`src/data/parts/stats.asm`, 227 records): Body 1-15, Core 16-30, Legs 31-74, Back 75-94,
Arm 95-227. Each has HP, EP, AP, SP, RP, MP, an EP cost (arms: the attack's cost), an affinity (bodies
and arms), a status (arms) and a price (BCD; selling gives half, `HalveBCD`). Cores are not drawn.
The starting set (`src/data/player/start_equipment.asm`) is Core1, Body1 of the race's element and
two arms:

| Race | Body element | Right arm | Left arm | Legs | Start HP |
|---|---|---|---|---|---|
| Human | Fire | BtFist | Lancer | Human | 45 |
| Forester | Wood | SlkHnd | Disc | Forest | 55 |
| Mariner | Water | H-Gun | HkClaw | Marinr | 65 |
| Birdian | Wind | Hawk | Whip | Birdan | 40 |
| Lizardman | Earth | Ogre | HndAxe | Lizard | 75 |

The body upgrades by itself: when the engineer reaches level 10 and 30 the Works gives Body2 /
Body3 of the same element and equips it (`UpgradeBody`, EVENT_BODY2 / EVENT_BODY3 0xA0 / 0xA1).

**Development** (Works > Develp, src/engine/menus/works/develop.asm): an arm + a material (Steel ..
Hades) + an optional tool make a new arm by the recipe table (`src/data/works/recipes.asm`, `GetRecipe`).

- Chance (`UpdateDevelopChance`): min(100, recipe % + DevLevelBonus[engineer level]) then + partner
  bonus (capped) then + tool bonus (capped). The level bonus column is the **partner's** gender:
  male 0 at level 0, 5 at 10, 15 at 20, 25 at 30, 35 at 40, 45 at 50; female 0, 5, 10, 20, 30, 50.
  Partner bonus by race/gender (`dev_partner_bonus.asm`): 3, 2, 4, 5, 1, 2, 4, 3, 1, 1. Tools:
  Tool1 +5, Tool2 +10, Tool3 +15, Tool4 +20, Myster +100.
- Recipe tiers: the starting arms (and shop arms) + common metals 80 %, dev EXP 5; second step 30 %
  (EXP 10); third 10 % (EXP 15); the last (Crsadr, Demon, GodHnd) 5 % (EXP 30).
- Roll (`DevelopRoll`): the arm, material and tool are used up either way; success gives the new arm.
  The roll is not the shown %: it takes only 16 values (BUGS.md), so 80 % works 81 % of the time,
  30 % 37.5 %, 10 % 12.5 %, 5 % 6.25 %.
- Engineer EXP (`DevelopSuccess`, `EngineerLevelUp`): each success takes the recipe's dev EXP off
  `wEngineerExp`; at <= 0 the engineer levels up (max 50) and gains `DevLevelExp[level]` (male 5 to
  level 9 ... 60 at 45-49; female 5, 10, 15 ... 50 in steps of 5 levels).

## Items

`src/data/items/` (71 items; prices in `prices.asm`, BCD, sell half):

| Ids | Kind | Effect |
|---|---|---|
| 1-8 FlrCt RefCt IceCt WindCt ErthCt LghtCt DarkCt MirrCt | accessory | the unit's affinity becomes Fire / Wood / Water / Wind / Earth / Light / Dark / Mirror (`AccStats*`); two different crystals cancel out (BUGS.md) |
| 9-11 Radar5 / 8 / 10 | accessory | crit + 5 / 8 / 10 % (`ApplyBattleAccessory`, Pointers_207A43) |
| 12-14 Cycl10 / 20 / 30 | accessory | EP costs - 10 / 20 / 30 % |
| 15-17 Panl15 / 30 / 50 | accessory | Charge + 15 / 30 / 50 % of max EP |
| 18-35 Armr, Tank, Bst, Plt, Axel, Burn | accessory | + HP 25/50/80, EP 15/30/60, AP / SP / RP / MP 10/20/30 |
| 36 AutoRp, 37 Proplr | accessory, used up | revive at half HP; refill EP when it runs short |
| 38-41 FixIt1-4 | battle, camp | + 30 / 50 / 100 / 150 HP |
| 42 FullFx, 43 Clear | battle, camp | full HP; all statuses cured |
| 44-47 PowDrv EField SitClr Turbo | battle | AP / SP / RP / MP +30 % for 5 turns (text says 15 %) |
| 48-51 Absorb AcidBm Jammer MagFlr | battle | enemy AP / SP / RP / MP -30 % for 5 turns |
| 52-56 Tool1-4, Myster | development | +5 / 10 / 15 / 20 / 100 % |
| 57-71 Steel .. Hades | materials | development; Slmndr Dryad Undine Sylph Gnome carry an element soul |

Two accessories can be worn (`wEquipAcc1`, `wEquipAcc2`).

## The town

`StreetTask` (src/engine/menus/town/street.asm) refills HP and EP and clears paralysis and rust every
time you are back on the street. Street menu: Works, Shop, Arena, Square, W.Map. The world map is
closed at story stage 0 (no UNITRON yet) and at stage 8 ("No UNITRON, you can't", after the Rank CS
final). The Square holds the Pub, D-town, the Forest (the town place, not the dungeon) and the Spring.

### Shops (src/engine/menus/shop/)

Galb and Lana Lake's shop buys and sells parts and items. An entry is listed when its tier
(`shop_item_stock.asm`, `shop_part_stock.asm`) is above `ShopTierByRank[arena rank]` (4 3 3 2 2 1 1 0 0 0):
tier 4 from rank 1, tier 3 from rank 3, tier 2 from rank 5, tier 1 from rank 7, tier 0 never. Selling
pays half the price.

### Townspeople

Every NPC has stage talk (`src/data/town/talk_*.asm`) that sets their EVENT_TALKED flag (0x40 + n),
cleared at every stage change. Some do more (`NpcTalkRowAction`):

| NPC (place) | What |
|---|---|
| Camil (Pub) | at stages 1-8 her row adds `StageStatBonus[stage]` to the pilot (stage 2 RP +5, 3 SP +5, 4 AP +5, 5 MP +5, 6 SP & MP +5, 7 AP & RP +5, 8 all +5) |
| Tetis (D-town) | at stages 2-8 gives an autograph (item 0xFF); after the ending trades them for a gift by count and gender (`TetisGift`, `tetis_gifts.asm`) |
| Colla (Forest) | after her row 27 (flag 0x15), from arena rank 3, a random gem or part offer at a random price (`RollCollaOffer`, `colla_offers/`) |
| Helmut (Spring / Forest) | the skills, at level 20 and 30 |
| Cyrius (D-town) | with all four Emblems, trades them for one item or part of the race's row (`cyrius_trades.asm`: an elemental core, two bodies or legs, Hirokn / Oricon, Zeus, Hades); clears the Emblem flags, and after the ending also the dungeon boss flags so the four bosses come back |

## Dungeons (src/engine/dungeon/)

Four world dungeons, picked on the world map, each 7 floors, and the Crystal Mine (5 floors) reached
only from the arena: Forest of Verdure (wood), Corridor of Blue (water), Ruins of Wind (wind), Maze of
Stone (earth), Crystal Mine.

- **Floors** (`RollFloorMaps`, chests.asm): on each entry floors 1-6 are 6 distinct random maps of the
  dungeon's 12, floor 7 is the boss map; the mine's 5 floors are fixed (maps 0x34-0x38).
  Hidden: holding B+Down / B+Up / A+B+Down / A+B+Left / A+B+Right / A+B+Up on entry starts on floor
  2 / 3 / 4 / 5 / 6 / 7 (`EnterDungeon`; not in the mine).
- **Encounters** (`CheckEncounter`, `src/data/dungeon/encounter_chance.asm`): none in the first 5 steps
  after a battle, then per step 1 % (steps 6-10), 3 % (11-15), 5 % (16-17), 7, 10, 15, 25, 40, 60, 90 %,
  and certain at step 25. The enemy is uniform from the floor's list (`GetEncounterEnemy`,
  `src/data/dungeon/encounters/`): floors 1-2, 3-4 and 5-7 of each world dungeon share a list; mine floors
  1-3 and 4-5.
- **Chests** (`RollFloorChests`): rolled for every floor on entry. Of a floor's 6 chest spots one is
  empty, each other gets one of the floor's 7 contents with 30 / 25 / 15 / 12 / 10 / 5 / 3 %
  (`chests.asm`, `chest_odds.asm`): gold, FixIts, tools, metals, and on floors 4-7 the dungeon's
  element gem (Dryad / Undine / Sylph / Gnome), DarkCt, Hirokn, Oricon. A full bag leaves the chest
  closed. The mine's chests are fixed (`mine_chests.asm`) and stay opened (flags 0x70+).
- **Camp** (B, `CampMenuDispatch`): Item (use FixIt1-4 / FullFx / Clear, or the list), Stats, Leave
  (back to the world map from any floor), Close. Stairs move one floor up or down; going up from
  floor 1 leaves.
- **Rust** keeps hurting on the map (ceil(max HP / 20) a step); at 0 HP "<PLAYER> is dead" and you
  are carried out as after a defeat.
- **Bosses** (`BossEncounter`, boss.asm, `boss_enemies.asm`): on floor 7 of each world dungeon (Ent,
  Kraken, Roc, Behemoth) and on every mine floor (Trifid, Catble, Squidl, Simrug, Uniti). Walking
  into one starts its talk; a world boss asks to "take the trial" (No: you are sent out). A win gives
  the boss's drop, its Emblem and flag 0x60 + index; mine bosses 1-4 are marked beaten with no talk.
  Uniti asks to Join (Yes: the bad ending) or fight.

## The arena (src/engine/arena/)

Entry costs (`arena_entry_costs.asm`): E 200, D 500, C 1000, B 2000, A 3000, S 5000, CS 10000, X 0 GP.
Only ranks up to the current one are offered. Paying sets most talked flags (`SetTalkedFlags`).
Before the next rank opens, Jon checks that you have talked to the stage's NPCs
(`GetArenaTalkRow`, `stage_required_talk_lists.asm`): after E Tetis, Colla, Ziggy; after D Alda,
Cyrius; after B Lily; after A Cyrius, Meese; after the ending all eleven of Camil, Wyse, Ziggy, Ceus,
Meese, Lily, Tetis, Cyrius, Colla, Alda, Helmut.

| Rank | Opponents (`arena_brackets/`) | Prize for the first win (`ArenaSceneEnd`) | Title after (`rank_titles.asm`, by arena rank) |
|---|---|---|---|
| E | 3 random pilots | 1500 GP | Rookie |
| D | 3 pilots, Fenril | 3000 GP, Proplr | Viscnt |
| C | 3 pilots, Domino | 5000 GP, AutoRp | Marqis |
| B | 4 pilots, Neptun | 10000 GP, Myster | Duke |
| A | 4 pilots, Oberon | 25000 GP, Slmndr | Lord |
| S | 5 pilots, Balrok | 50000 GP, Oricon | HiMstr |
| CS | Fenril, Domino, Neptun, Oberon, Balrok, Satana | 100000 GP (50000 twice), Zeus | M.O.M. ("Master of Masters") |
| X | Trifid, Catble, Squidl, Simrug, Satana, Uniti | none | Legend |

Random pilots are Alex .. Dupon (98-112), never the same one twice in a bracket, built from 6 random
parts of the rank's tier (`arena_pilot_parts/`) and scaled at the rank's area level. Duels follow one
another with no healing in between (HP carries over; EP refills each battle). Arena wins give EXP
only. A loss ends the bracket; losing the CS final's duel 6 is GAME OVER.

## Story stages and flags (src/constants/event_flags.inc)

Exactly one of flags 0x00-0x0B is set (`GetStoryStage`, `SetStoryStage`, `StageFlags`):

| Stage | Flag | Set by | Arena rank |
|---|---|---|---|
| 0 | 0x00 STAGE_TOWN | new game | 0 |
| 1 | 0x01 STAGE_ARENA_OPEN | Works row 2 (UNITRON fitted; 3 FixIt1, 3 Tool1, 3 Steel, 500 GP) | 1 |
| 2-8 | 0x02-0x08 WON_RANK_E .. CS | `AdvanceStoryStage` on the rank's first win | 2-8 |
| 9 | 0x09 STAGE_LILY | Works row 13 (Lily's story) | 8 |
| 10 | 0x0A STAGE_ENDING | `CreditsScreen` after Uniti | 8 |
| 11 | 0x0B WON_RANK_X | Rank X won | 9 |

Other flags: 0x10-0x13 the Emblems, 0x14 / 0x20 Cyrius, 0x15 Colla's offers, 0x30-0x33 Helmut's
skills, 0x40-0x4E talked, 0x50-0x5D greeted, 0x60-0x67 bosses beaten, 0x70+ mine chests, 0xA0 / 0xA1
the body upgrades.

## Saves and link

Saving and loading are in Works > Data (`src/engine/menus/save.asm`): three files in the cart's flash
(block 0xFA000, slot n at 0x30 + 0x290 x (n - 1), 0x26D bytes of RAM from `wPlayerName`), plus slot 0
for the options (message speed, animation). The slot list shows name, level, Emblems and rank title.
Works > Trade swaps one item or part with another cart over the link cable (`WorksTradeMenu`).
