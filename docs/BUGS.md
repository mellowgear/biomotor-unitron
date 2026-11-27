# Bugs and oddities in the original game

The source keeps every bug as it is (the ROM must rebuild byte for byte); they are listed here.
Each entry says how it is known: **[tested]** (seen in a run) or **[read]** (from the code only).

| Where | What | How known |
|---|---|---|
| DrawDevelopedArm (src/engine/menus/works/develop.asm) | reads the image position from wUnk6106 / wUnk6107, which nothing writes (always 0 from the RAM clear) (?) | [read] |
