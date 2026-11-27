# Walkthrough: Biomotor Unitron

A walkthrough of *Biomotor Unitron* (Neo Geo Pocket Color, Yumekobo / SNK, 1999, the English
release this repo builds). It follows the story from the new game to the post-game Rank X, written
from the game's scripts, event flags and data tables in this repo; **(?)** marks what the code does not
settle. Game text is quoted as the ROM has it. The mechanics behind every number are in
[GAME_RULES.md](GAME_RULES.md); stats come from `src/data/battle/enemies/stats.asm` and
`src/data/battle/enemy_attacks.asm`.

Contents: [Basics](#basics) · [1 New game](#1-new-game) · [2 Stage 0: the town](#2-stage-0-the-town) ·
[3 Rank E and the dungeons](#3-rank-e-and-the-dungeons) · [4 Ranks D to S](#4-ranks-d-to-s) ·
[5 Rank CS](#5-rank-cs-the-final) · [6 Lily and the Protector](#6-lily-and-the-protector) ·
[7 The Crystal Mine](#7-the-crystal-mine) · [8 The ending](#8-the-ending) ·
[9 One year later: Rank X](#9-one-year-later-rank-x) · [Appendix](#appendix)

---

## Basics

### The story in one paragraph

A meteor, the Unitice, fell on Tridiss 199 years ago and left crystals of unlimited energy, the
Uni-Trons; the kingdom of Rhafiace built combat robots, UNITRONs, on them and won the world war.
Now the robots fight in the yearly UNITRON Tournament at the Arena of Rhafiace's capital, for "the
title of Master of Masters" (`text/it_all_began_with.asm`). You are a pilot, your partner is the
engineer who builds and develops your UNITRON at the Works. You climb the arena ranks E to CS; in the
final, Satanachia's UNITRON goes out of control with Lily inside; the voice that called Lily is the
Protector, Uniti, sleeping under the Arena in the Crystal Mine, and you go down to stop it.

### Menus

| Where | What |
|---|---|
| Street | Works, Shop, Arena, Square, W.Map. Every return here refills HP and EP and cures paralysis and rust (`StreetTask`). |
| Works | Setup (equip parts and two accessories), Develp, Item, Stats (Chara / UNIT), Trade (link cable), Help (10 pages), Data (Save / Load), Exit. Your partner greets you here; story talks happen on entry. |
| Square | Pub, D-town, Forest, Spring: the townspeople. |
| W.Map | Town and the four dungeons; A on a dungeon shows its picture, its description and "Enter? Yes No". |
| Dungeon | D-pad walks; A opens a chest you face; B opens the Camp (Item, Stats, Leave, Close). |
| Battle | Attack (right arm, left arm, skill 1, skill 2), Item, Charge (EP + 30 %), Flee (Quit in the arena). |

Saving is only at the Works (Data > Save, three files).

### Fighting in short

- Damage is about 0.4 x (attack - defence) + 8, then x the element multiplier. Attack = the arm's
  power + the unit's AP; the arm you use counts twice, because the unit's AP already holds both
  arms. Defence is the unit's single SP (all parts, both arms).
- The element cycle: **Fire > Wood > Earth > Wind > Water > Fire** (x2 forward, x0.5 back). Light
  does x3 to Dark; Dark does x1.5 to the five elements. Everything does x0.75 to Dark.
- Your attack's element is the arm's; your defensive element is the body's (or a crystal accessory's).
- Levels cost a flat 150 EXP; what changes is the EXP per kill: 130 % for enemies 5+ levels above
  you, 10 % for 5+ below. Fight at or above your level.
- Rust stays after a battle and costs 1/20 of max HP per step on the dungeon map: carry Clear.
- Bosses cannot be fled.

### Development

At Works > Develp pick an arm, a material and a tool. Starting arms + Steel / Silver / Gold work at
80 %; each step deeper is 30 %, 10 %, 5 % (`src/data/works/recipes.asm`). The engineer's level and
the partner's race add a few %, tools add 5 / 10 / 15 / 20 (Tool1-4) and Myster makes it certain.
Failing loses the arm, the material and the tool. Every success gives the engineer dev EXP; at
engineer level 10 and 30 the body upgrades by itself (Body2, Body3).

Useful lines for the story's two hard fights, both from the recipe table:
- **Light arms** (x3 on Satana's Dark): Sthrn+ (BllArm + Silver / Mithrl / Slmndr / Sylph / Oricon
  -> NoWire 80 %, then NoWire + Mithrl / Slmndr / Sylph / Oricon / Zeus -> Sthrn+ 30 %), GrvHmr
  (Pliers + Oricon / Zeus 10 %), Crsadr (Gram + Zeus 5 %), GodHnd (ArchMg + Zeus 5 %). BllArm is
  in the shop from the start (750 GP).
- **Dark arms**: Skull (shop, 1000 GP) + Gold / Platnm / Undine / Gnome / Hirokn -> DrkClw 80 %;
  Cutter, Demon, DvlClw, Infrno higher up.

---

## 1 New game

`NewGameSetup`, `SelectPlayerTask` (src/engine/menus/new_game.asm). Pick one of the ten pilots
(race and gender) with Left / Right: the partner is the other pilot of the same race. Enter your name
and the partner's (six characters), confirm. The opening plays ("It all began with a meteor..."),
then the town. Flag 0x00 EVENT_STAGE_TOWN is set (story stage 0).

| Race | Pilots | Body | Starting arms | Start HP | Helmut's skills (Lv 20 / Lv 30) |
|---|---|---|---|---|---|
| Human | Rod, Rena | Fire | BtFist, Lancer | 45 | Nova / Burst, Ragnok / Giga |
| Forester | Chris, Leaf | Wood | SlkHnd, Disc | 55 | Roots / Reed, Leaf / August |
| Mariner | Zappa, Shera | Water | H-Gun, HkClaw | 65 | Edge / Maze, Wall / Aqua |
| Birdian | Fezar, Shilfe | Wind | Hawk, Whip | 40 | Slice / Cloud, Jolt / Vapor |
| Lizardman | Carl, Pinky | Earth | Ogre, HndAxe | 75 | Gash / Shield, Teeth / Breath |

The partner's race and gender set the develop bonus (Forester female +5 is the best, Lizardmen and
the Mariner male +1) and which level-bonus column the engineer uses.

## 2 Stage 0: the town

The UNITRON is still being fitted: the world map says "No UNITRON, you can't" and the arena has nothing
for you. Go to the Works first (row 0 sets EVENT_TALKED_WORKS 0x4E), then talk to the town:
`WorksEntryTalkRowStage0` waits for EVENT_TALKED Jon (Arena), Lily (D-town), the shop (Galb / Lana),
Wyse (Pub), Ceus, Helmut, Camil (Pub) and Meese (D-town). Until then the partner says "Sorry--it's
going to take a little longer... Have you talked to everyone yet?".

Back at the Works with all of them: "Ah, there you are! Good timing! I just finished getting the
UNITRON fitted." Talk row 2 sets **0x01 EVENT_STAGE_ARENA_OPEN** (stage 1, arena rank 1), clears the
talked flags and gives 3 FixIt1, 3 Tool1, 3 Steel and 500 GP (`NpcTalkRowAction`). The shop (Galb's
"These are for you" scene) and the arena are open, and so is the world map.

First purchases (the shop lists tier-4 stock from rank 1): Radar5, Cycl10, Panl15 and the +10 / +15 / +25
accessories, FixIt1, FixIt2, Clear, Tool1, the metals Steel to Mithrl, and the cheap shop arms
(Rapier, BllArm, Lancer, Hook, Skull, Bazoka, Knukle, HndGun, Cannon ...). Develop the starting arm
with Steel (80 %).

## 3 Rank E and the dungeons

### The arena, Rank E

Arena > Entry, pick Rank E (200 GP). Three random pilots (Alex .. Dupon) with random parts, scaled at
area level 1 (levels 1-4). Duels follow one another and HP is not refilled between them: heal with
items. Winning the rank: **0x02 EVENT_STAGE_WON_RANK_E** (stage 2), 1500 GP, title Rookie. Arena wins
give EXP but no GP: the money comes from the dungeons.

### The four dungeons

All four are open from stage 1 (only stage 8 closes the map again). Each has 7 floors: floors 1-6 are
random maps from a set of 12 (new ones on every entry), floor 7 is the boss's. The scaled enemies are
at area level = floor: levels 1-4 on floor 1, 5-9 on 2, 10-14 on 3, 15-19 on 4, 20-24 on 5, 25-29 on
6, and **35-39 on 7** with 1000 % HP. Floor 7 is the hardest place in the game before the post-game.
Hidden shortcut: hold B+Down / B+Up / A+B+Down / A+B+Left / A+B+Right / A+B+Up while confirming
"Enter? Yes" to start on floor 2 / 3 / 4 / 5 / 6 / 7 (`EnterDungeon`).

| Dungeon | Element | Floors 1-2 | Floors 3-4 | Floors 5-7 | Boss (floor 7) |
|---|---|---|---|---|---|
| Forest of Verdure | Wood | Stump, Spidey, Trappr, Iil, Bulby, Viney | Crabby, Pumper, Coyote, Flower, Bulbet, Scythr, Wooden | Squirm, Firey, Wolfen, Borey, Mamoth | Ent |
| Corridor of Blue | Water | Horsee, Fishen, Fountn, Snoman, Deep1, Nauti | Narl, Seel, Barby, Rocky, Merman, Froggy | Squido, Orka, Aquan, Drake, Marman, Froggr | Kraken |
| Ruins of Wind | Wind | Mutan, Eyefly, Jyster, Smoky, Beasty, Eeek | Trice, Hornd, Darpy, Grifon, Feyt, Hyoi | Toris, Mrice, Chimer, Whyrm, Harpy, Coatl | Roc |
| Maze of Stone | Earth | Skully, Walley, Crystl, Lickin, Curly, Dedhed | Skullt, Moworm, Golem, Zhaga, Whirly, Pengun | Mummy, Zombit, Iworm, Bonryu, Agolem, Zhuga | Behemoth |

Good GP: Firey (2990 base GP), Wooden (2120), Froggr (3860), Froggy (2480), Orka (2660), Dedhed
(3120, but it flees 70 % of its turns), Agolem (2810), Golem (2530), Hornd (2400), Toris (2620). GP is
not scaled by the area; only HP and stats are. Drops worth having: the element gems (Dryad from Mamoth,
Undine from Froggr / Mrice, Gnome from Bonryu, Slmndr from Cerebn in the mine, all 5 %), Oricon
(Dragon, 1 %), Hirokn (Niten, 1 %), Myster (Faroh, 1 %).

Status attackers to watch: Squirm / Crabby / Jakko "Needle" (paralysis), Pumper "Makeup" (confusion),
and every attack with action 2 (rust).

**Chests** are rolled on entry: five of each floor's six spots hold something. Every dungeon shares
the gold and items; floors 4-7 add its gem (Forest Dryad, Blue Undine, Wind Sylph, Stone Gnome), and
floors 6-7 Oricon (3 %), floor 7 DarkCt and Hirokn (5 %). Floor 7's gold is 5500 / 7000 G.

### The dungeon bosses

Walking into the boss starts its talk: "I am Ent. I am the guardian of all that grows... Do you wish to
take the trial?" (`IAmEntIText`). No: "Your task is to protect life-- including yours" and you are put
outside. Yes: "The answer has been given. The challenge begins!". You cannot flee. A win: the boss's
part, 65000 GP, 300 base EXP, its Emblem and its flag (`BossEncounter`). A loss carries you to the Works.

| Boss | Lv | HP | EP | SP | RP | MP | Element | Attacks (power, EP, chance) | Weak to | Prize |
|---|---|---|---|---|---|---|---|---|---|---|
| Ent (89) | 35 | 1050 | 1000 | 500 | 400 | 250 | Wood | Stomp 450 / 30 / 60 %, Whip 500 / 40 / 30 %, Sprout 600 / 50 / 10 % (confusion) | Fire x2, Water x1.25 | Seed (back, MP +140), Green Emblem 0x10, flag 0x60 |
| Kraken (90) | 35 | 1050 | 1000 | 400 | 400 | 350 | Water | Tackle 450, Flow 500, Swirl 600 (rust) | Wind x2, Earth x1.25 | Cape (MP +130), Blue Emblem 0x11, flag 0x61 |
| Roc (91) | 35 | 1050 | 1000 | 300 | 400 | 450 | Wind | Claws 450, Peck 500, Gust 600 (EP leak) | Earth x2, Wood x1.25 | Seraph (MP +150), White Emblem 0x12, flag 0x62 |
| Behemoth (92) | 35 | 1050 | 1000 | 450 | 400 | 300 | Earth | Tackle 450, Gnaw 500, EyeRay 600 (paralysis) | Wood x2, Fire x1.25 | Bardos (MP +110), Black Emblem 0x13, flag 0x63 |

All four are level 35 with fixed stats: their hit check is RP 400 / 4 + 35 = 135 against your RP +
LevelRoll, so below about level 25 with modest RP most of your attacks miss. Treat them as
mid-game goals. The Emblems are optional: with all four, Cyrius in D-town trades them for a strong part
(below).

## 4 Ranks D to S

Each rank's first win advances the story stage (`AdvanceStoryStage`), clears the talked flags, and
pays a prize. Before Jon lets you into the next rank, talk to the people `StageRequiredTalkLists`
names, or he says you are not ready (arena row 0x3F / 0x40):

| Stage reached | Flag | Rank won | Prize | Title | Next rank needs you to talk to |
|---|---|---|---|---|---|
| 2 | 0x02 | E | 1500 GP | Rookie | Tetis, Colla, Ziggy |
| 3 | 0x03 | D (3 pilots + Fenril) | 3000 GP, Proplr | Viscnt | Alda, Cyrius |
| 4 | 0x04 | C (3 pilots + Domino) | 5000 GP, AutoRp | Marqis | nobody |
| 5 | 0x05 | B (4 pilots + Neptun) | 10000 GP, Myster | Duke | Lily |
| 6 | 0x06 | A (4 pilots + Oberon) | 25000 GP, Slmndr | Lord | Cyrius, Meese |
| 7 | 0x07 | S (5 pilots + Balrok) | 50000 GP, Oricon | HiMstr | nobody |

Entry fees: D 500, C 1000, B 2000, A 3000, S 5000, CS 10000 GP. The random pilots get stronger
parts and the area level of the rank (D = 2, levels 5-9 ... S = 6, levels 25-29).

The rank champions (fixed stats, no flee, no status from your side):

| Champion | Lv | HP | EP | SP | RP | MP | Element | Attacks | Weak to |
|---|---|---|---|---|---|---|---|---|---|
| Fenril (113) | 12 | 180 | 75 | 50 | 75 | 50 | Earth | Bite 50, Tusk 75, Necro 100 (dark, confusion) | Wood |
| Domino (114) | 16 | 225 | 75 | 150 | 150 | 125 | Wind | Dagger 120, Cutter 180, Purify (cures itself) | Earth |
| Neptun (115) | 20 | 275 | 100 | 200 | 200 | 175 | Water | Slicer 150, IceEye 200, Drain 250 (EP leak) | Wind |
| Oberon (116) | 24 | 375 | 150 | 250 | 250 | 225 | Wood | Chrge+ 250, Charge 300, Acid 350 (rust) | Fire |
| Balrok (117) | 28 | 475 | 200 | 300 | 300 | 275 | Fire | Blow 300, Flare 350, Breath 450 (dark) | Water |

Along the way, in town (talk to everyone at each stage, it costs nothing):
- **Camil** (Pub) bakes a cake each stage: stage 2 RP +5, 3 SP +5, 4 AP +5, 5 MP +5, 6 SP and MP +5,
  7 AP and RP +5, 8 all four +5 (`StageStatBonus`).
- **Tetis** (D-town) gives an autograph at each stage 2-8; keep them for the post-game.
- **Colla** (Forest) starts her gem offers after her row 27 (flag 0x15), from rank 3: a random gem or
  part at a random price.
- **Helmut** (Spring) teaches the first skill at level 20 and the second at 30 (flags 0x30-0x33):
  "All right, look into my eyes...".
- **Cyrius** (D-town): once you hold an Emblem he tells you about the Lords (flag 0x14); with all four
  he trades them (flag 0x20) for one of six items or parts by race (`cyrius_trades.asm`): an elemental
  core (FireB ... EarthB), two body / back parts, Hirokn or Oricon, Zeus or Hades.
- The shop's stock widens at ranks 3, 5 and 7.

## 5 Rank CS, the final

Rank CS costs 10000 GP and is six fixed duels at area level 7: Fenril, Domino, Neptun, Oberon, Balrok,
then **Satana**. Before duel 6 the scene `ArenaDuel6Scene` plays: "Uh-oh, <PLAYER>! Satanachia's
UNITRON's core is out of control! Here it comes!", and a voice from inside: "Lily!? <PLAYER>, isn't
that Lily's voice?" (`text/text.asm`). **Losing duel 6 is GAME OVER** ("It is finished... Your spirit
belongs to me now", `ItIsFinishedYourText`), so save before you pay.

| Satana (118) | |
|---|---|
| Level | 32 |
| HP / EP | 700 / 650 |
| SP / RP / MP | 350 / 450 / 400 |
| Element | **Dark**: Light does x3, every other element x0.75 |
| Attacks | Blade 300 (10 EP, 60 %), Wing 400 (25 EP, 30 %), Dark 500 (50 EP, 10 %, paralysis), all Dark (x1.5 on any elemental body, x0.5 on a Light body) |
| Return | below half HP, once: full HP and EP (action 9) |
| Flee | impossible: no Flee entry until the ending (`TryFlee`, `EnemyChooseAttack`) |

Her hit check needs your RP + LevelRoll >= 113 + 32; her accuracy against you is 450 + LevelRoll(32).
A Light arm and a LghtCt (halves her Dark attacks, x0.5) make this fight; expect to hit her twice
through the Return.

Winning: "Wow, <PLAYER>!! That was a great fight!", Jon sends Satanachia's pilot home, and the prizes:
"[Your title is: Master of Masters] [You won: 100000GP][You won: Zeus]". Flag **0x08
EVENT_STAGE_WON_RANK_CS** (stage 8, arena rank 8). The world map closes ("No UNITRON, you can't")
and the arena is preparing the ceremony ("Hey, Champ! Out for a walk?").

## 6 Lily and the Protector

At stage 8 the Works first says it is not finished (row 3 sets EVENT_TALKED_WORKS, then row 4): talk
to all thirteen this time (`WorksEntryTalkRowStage8`): the Works, Jon, Cyrius, the shop, Wyse,
Ziggy, Ceus, Helmut, Alda, Camil, Meese, Colla, Tetis.

Then at the Works: "Welcome back. I just finished! There's someone here to see you, too. Lily!"
(talk rows 5-13, `src/data/town/talk_works.asm`). Lily tells how a woman's voice from underground
called her; a picture scene (row 15, portrait 54) shows "The time has come! The power is mine! Let the planet gather the
light!" (`TheTimeHasComeText`; its exact place in the row chain is (?)), and Lily: "That's the Protector... That's what talked to me from inside
the earth, where it slept... <PLAYER>, I have no right to ask you anything, but you must stop it!".
Row 13 sets **0x09 EVENT_STAGE_LILY** and clears 0x08.

At the arena Jon explains: "You know about how long ago, a meteor fell on Tridiss, right? Well, this
is where it landed! That's right-- the Arena!" and "You can get to the mine from here. Good luck,
<PLAYER>!". The arena's box now reads "C.Mine" (scene 0x3A).

## 7 The Crystal Mine

Five fixed floors (maps 0x34-0x38), every floor with a boss, enemies at area level 8 (levels 30-39,
800 % HP; `StartDungeonBattle`): floors 1-3 Hippie, Cerebn, Ratta, Elice, Jakko, Misynk, Octpod,
Cabra; floors 4-5 Unicon, Faroh, Lamia, Dragon, Sphinx, Niten, Scaley, Mibore. The floor shortcut does
not work here. Leaving the mine brings you back to the arena; the bosses you beat and the chests you
opened stay done (flags 0x64-0x67 and 0x70+).

**Chests** (fixed, `src/data/dungeon/mine_chests.asm`):

| Floor | Chests |
|---|---|
| 1 | Dryad, Armr80, AutoRp, Tank60, 7500 G, FullFx |
| 2 | Radar8, 7500 G, Bst30, Gnome, Axel30, FullFx |
| 3 | Plt30, Panl50, Slmndr, 10000 G, Undine, Burn30 |
| 4 | Hirokn, ErthCt, Grav, Radr10, Oricon, Cycl30 |
| 5 | Zeus, Hades, LghtCt, CoreX, MirrCt, Myster |

**Floor bosses** (short talks, no trial question; 40000 GP, 200 EXP and a gem each; marked beaten
with no win talk):

| Floor | Boss | Lv | HP | SP / RP / MP | Element | Attacks | Weak to | Talk | Drop | Flag |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Trifid (93) | 30 | 650 | 450 / 300 / 200 | Wood | Stomp 350, Whip 400, Spit 500 (rust) | Fire | "Who are you? This is where the Master of All lives" | Dryad | 0x64 |
| 2 | Catble (96) | 30 | 650 | 400 / 300 / 250 | Earth | Tackle 350, Gnaw 400, Stare 500 (paralysis) | Wood | "I smell a living being..." | Gnome | 0x65 |
| 3 | Squidl (94) | 30 | 650 | 350 / 300 / 300 | Water | Tackle 350, Flow 400, Smoke 500 (confusion) | Wind | "Who? A living being? Ha ha ha!" | Undine | 0x66 |
| 4 | Simrug (95) | 30 | 650 | 200 / 300 / 450 | Wind | Claws 350, Peck 400, Twist 500 (EP leak) | Earth | "You...You have killed my companions." | Sylph | 0x67 |

**Floor 5: Uniti (97)**, "I am the source of all. I am the master of all." It explains that the
power moving your machine is its own, taken from its body, and asks: "You must choose: do you turn
over your power to me?" with Join? Yes / No (`BossYesNoBox`, the mine shows JoinYesNoText).

- **Yes**: "You have made the correct choice..." and the bad ending: "It was the end of an era...The
  end of mankind's rule over Elscea..." then GAME OVER (`StorySceneTheEnd`, wStreetNext 5).
- **No**: "Foolish mortal. All you shall know is suffering!" and the battle. Losing it also ends in
  the bad ending (`BossEncounter` state 9 on the mine's last floor).

| Uniti (97) | |
|---|---|
| Level | 35 |
| HP / EP | 1250 / 1250 (shown as " ? ") |
| SP / RP / MP | 450 / 500 / 450 |
| Element | **Light**: every element does x1, Dark only x0.5 |
| Attacks | SunRay 500 (fire, 15 EP, 60 %), Judge 700 (light, 100 EP, 10 %, paralysis; x3 on a Dark body), Geddon 700 (dark, 100 EP, 10 %, confusion), Repair (heal 100 HP, 30 EP, 20 %) |
| Reward | no EXP, no GP |

No element helps against Uniti; raw attack and a body that resists fire (Water, x0.5 from SunRay)
are what count. Avoid a Dark body (Judge x3). Its RP 500 means a hit check of 125 + 35 = 160.

Beating it: "How...How is this possible!? ... If I perish, all your precious cores will die as well!"
(`HowHowIsThisText`).

## 8 The ending

`StreetEndingScenes` (wStreetNext 4): "With the destruction of Unitice, all UNITRON cores lost their
power... Your UNITRON's core crumbled to dust as soon as you touched it", then "The sun began to rise
in the east... Now the time has come for you to power the UNITRONs yourselves", the credits
(`CreditsScreen`) and "TO BE CONTINUED....?". The credits set **0x0A EVENT_STAGE_ENDING** (stage 10)
and clear 0x09.

The game goes on at the Works: "It's been a while since we've been here... What? Almost a year...So
much has happened" (talk row 14). The partner has made a new core (a townsperson: "I heard that <PARTNER>
made a new core").

## 9 One year later: Rank X

From stage 10 the game is harder everywhere: scaled enemies use the post-game rows of the scaling
table (5x HP and levels 15-19 on floor 1, up to 12x HP and levels 45-49 on floor 7). Satana can now be
fled.

- Jon: "They made a new rank! It's called Rank X... Come back later, when we're ready." Rank X opens
  once you have talked to all eleven of Camil, Wyse, Ziggy, Ceus, Meese, Lily, Tetis, Cyrius, Colla,
  Alda and Helmut (`StageRequiredTalkLists` stage 10).
- **Rank X** (free entry, area level 8): Trifid, Catble, Squidl, Simrug, Satana, Uniti in a row, with
  the stats above. No prize: "Sorry, but there's no prize at this rank, just the title... [Your title
  is: Legend!!]". Flag **0x0B EVENT_STAGE_WON_RANK_X** (stage 11, arena rank 9).
- **Tetis** trades your autographs for a thank-you gift by count (`TetisGift`, "This makes 3",
  "As a thank you...").
- **Cyrius** trades again: after the ending a trade also clears the four dungeon-boss flags, so Ent,
  Kraken, Roc and Behemoth come back and can be beaten for their Emblems and parts again.

---

## Appendix

### Dungeon chest contents (world dungeons, `src/data/dungeon/chests.asm`)

Columns are the chance of each of the five filled chests on the floor. The same for all four
dungeons except the gem, which is the dungeon's own (Forest Dryad, Blue Undine, Wind Sylph, Stone
Gnome).

| Floor | 30 % | 25 % | 15 % | 12 % | 10 % | 5 % | 3 % |
|---|---|---|---|---|---|---|---|
| 1 | 740 G | 1080 G | FixIt1 | Tool1 | Clear | Steel | Silver |
| 2 | 1240 G | 1640 G | FixIt1 | Tool2 | Clear | Silver | Gold |
| 3 | 1720 G | 2150 G | FixIt2 | Tool3 | FixIt3 | Platnm | Mithrl |
| 4 | 2380 G | 3500 G | FixIt3 | Tool3 | FixIt4 | Mithrl | gem |
| 5 | 3500 G | 4000 G | Tool3 | Tool4 | FixIt4 | gem | gem |
| 6 | 4300 G | 5200 G | FixIt4 | Tool4 | FullFx | gem | Oricon |
| 7 | 5500 G | 7000 G | Tool4 | FullFx | DarkCt | Hirokn | Oricon |

### Arena prizes and costs

| Rank | Cost | First-win prize | Champion |
|---|---|---|---|
| E | 200 | 1500 GP | none |
| D | 500 | 3000 GP, Proplr | Fenril |
| C | 1000 | 5000 GP, AutoRp | Domino |
| B | 2000 | 10000 GP, Myster | Neptun |
| A | 3000 | 25000 GP, Slmndr | Oberon |
| S | 5000 | 50000 GP, Oricon | Balrok |
| CS | 10000 | 100000 GP, Zeus | Satana (after the five above) |
| X | 0 | title only | Uniti (after the mine bosses and Satana) |

### Story flags in order

| Step | Flag set | Where |
|---|---|---|
| New game | 0x00 STAGE_TOWN | `StorySceneUnitice` |
| UNITRON fitted | 0x01 STAGE_ARENA_OPEN | Works row 2 |
| Each dungeon boss | 0x10-0x13 Emblem, 0x60-0x63 beaten | `BossEncounter` |
| Rank E .. CS won | 0x02 .. 0x08 | `ArenaSceneEnd` action 2 |
| Lily's story | 0x09 STAGE_LILY | Works row 13 |
| Mine bosses 1-4 | 0x64-0x67 | `BossEncounter` |
| Uniti beaten, credits | 0x0A STAGE_ENDING | `CreditsScreen` |
| Rank X won | 0x0B STAGE_WON_RANK_X | `ArenaSceneEnd` |

### Uncertain

- The talk at each place changes by stage and is not all summarised here; the required-talk lists
  above are the only ones the code checks.
- Which Rank X duel order counts as a "first win" for later replays, and what a replayed rank gives
  beyond EXP (?).
- The post-game Crystal Mine enemies' level (scaling row 16 has a random range of 0, see BUGS.md) (?).
- Whether the Crystal Mine can be entered again after the ending (the arena shows "C.Mine" only at
  the Lily stage) (?).
