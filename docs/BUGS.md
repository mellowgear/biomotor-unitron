# Bugs and oddities in the original game

The source keeps every bug as it is (the ROM must rebuild byte for byte); they are listed here.
Each entry says how it is known: **[tested]** (seen in a run) or **[read]** (from the code only).

| Where | What | How known |
|---|---|---|
| DrawDevelopedArm (src/engine/menus/works/develop.asm) | reads the image position from wUnk6106 / wUnk6107, which nothing writes (always 0 from the RAM clear) (?) | [read] |
| EnemyFlee (src/engine/battle/enemy_turn.asm) | the enemy's flee roll uses the unit's wFleeChance; wEnemyFleeChance is set (BattleStart, AddLevelGapChances) but never read | [read] |
| BattleStatusEffects (src/engine/battle/status.asm) | enemy rust damage is 1/20 of the enemy's current HP, the unit's is 1/20 of its max HP (?) | [read] |
| LoadEnemy (src/engine/battle/init.asm) | scaled enemies below Alex get the random +-5 HP / EP twice (before and after scaling); unscaled ones never (?) | [read] |
| SkillRecvr (src/engine/battle/effects.asm) | the 0xFF cap after incb (wRecvrActive) can't trigger: the skill only runs with it at 0 | [read] |
| LoadBossMapSprite (src/engine/dungeon/load.asm) | sets XHL to UnusedBossMapSpriteMonoPal and never loads it | [read] |
| WorldMapCloseStep (src/engine/dungeon/world_map.asm) | writes DUNGEON_MODE 1 then 0 at once; the first write does nothing | [read] |
| TetisGift (src/engine/menus/town/colla.asm) | the thank-you talk row is set before AddItem, so when AddItem fails (carry) the gift text still plays while no gift is given and the autographs are kept | [read] |
| HelmutPickSkill (src/engine/menus/town/helmut.asm) | copied from the Cyrius menu: tests for a Quit row 8 the two-row cursor can never reach (dead code, harmless) | [read] |
| IntroImpactTask (src/engine/scenes.asm) | indexes the 60-word IntroImpactFrames with a 4-byte stride (sll 2), so it uses every second word and from frame 30 reads past the table; at frame 34 a past-the-end 0 redraws the planet over the shock rings | [read] |
| ShowArenaRankList (src/engine/arena/entry.asm) | the `cp A,1` / `jr NC` guard branches to the next line, so rank 0 (story stage 0) is not caught: the last row becomes 0xFF and the djnz draws 256 names past ArenaRankNames; harmless only if the rank list cannot open at stage 0 (?) | [read] |
