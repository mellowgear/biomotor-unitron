# Names

Every name in src/ that is not a disassembler placeholder, with the evidence for it. Biomotor
Unitron's text is Japanese; names are English descriptions of what the code does, not translations.
Evidence tags:

- **[code]**: named from what the code does (its callers, the data it reads, the screen it draws).
- **[play]**: confirmed by running the game in an emulator.
- **[U2]**: the code matches Biomotor Unitron 2 (the same engine), so it takes U2's name.
- **generic**: kind + address where only the kind is known; `Unused_` + address for code or data with no reader found.

| U1 address | Name | What is known | Evidence |
|---|---|---|---|
| 0x5076 | wUnk5076 | save-data word LoadGameSlot zeroes after loading; no reader found (?) | generic |
| 0x5CDD | wJoyHistory+0xFF | "last frame" slot of the joypad ring, set to SYS_LEVER by InitJoypad | [U2] |
| 0x5CE2 | wUnk5CE2 | set 0 / 1 by the intro and story scene setups; no reader found (?) | generic |
| 0x6106 | wUnk6106 | column of the arm image DrawDevelopedArm draws; never written (?) | generic |
| 0x6107 | wUnk6107 | row of the arm image DrawDevelopedArm draws; never written (?) | generic |
| 0x6116 | wUnk6116 | zeroed by StartMessageTask; no reader found (?) | generic |
| 0x62AE | wMusicTrackIds | Z80 addresses of the music track blocks PlaySong loaded | [U2] |
| 0x62EE | wMusicTrackCount | entries in wMusicTrackIds | [U2] |
| 0x62EF | wSfxTrackIds | Z80 addresses of the sound effect track blocks | [U2] |
| 0x632F | wSfxTrackCount | entries in wSfxTrackIds | [U2] |
| 0x6334 | wZ80SongHeader | Z80 address of the song header (UploadZ80Driver) | [U2] |
| 0x6338 | wZ80Voices | Z80 address PlaySong copies the voice records to | [U2] |
| 0x633C | wZ80SongWrite | Z80 address of the next track block | [U2] |
| 0x6340 | wSongReadPtr | PlaySong's ROM read pointer | [U2] |
| 0x6344 | wSongBlockLength | length of a track block's second part | [U2] |
| 0x6C00 | wStackTop | initial XSP (Start) | [U2] |
| 0x6C59 | wBiosFlashSize2 | BIOS flash size of a CS1 card | [U2] |
| 0x6C5B | wBiosFlashType2 | BIOS flash type of a CS1 card | [U2] |
| 0x6DA0 | wBios6DA0 | BIOS byte zeroed on a mono NGP (InitConsoleType) | [U2] |
| 0x6E97 | wBiosCs1Input | last CS1 card joypad byte (MergeCs1CardInput) | [U2] |
| 0x6F83 | wBios6F83 | BIOS byte, bit 3 cleared on a mono NGP (InitConsoleType) | [U2] |
| 0x210213 | Unused_210213 | ret; no callers (between BlackFlashEffectTask and PlayBattleEffect) | generic |
| 0x21037F | Unused_21037F | ret; no callers (before DrawPortraitAt) | generic |
| 0x210442 | Unused_210442 | ret; no callers (before WorldMapTaskInit) | generic |
| 0x212619 | Unused_212619 | pushes and pops XHL/XDE/XBC/XWA, ret: does nothing; no callers | generic |
| 0x2175FA | Unused_2175FA | sets TASK_FUNC to its own ret (idle task step); no callers | generic |
| 0x21783D | Unused_21783D | same as Unused_2175FA; no callers | generic |
| 0x21B911 | Unused_21B911 | WA = ItemValues_25B379[WA], the only reader of that column; no callers | generic |
| 0x21D224 | Unused_21D224 | carry when wLinkRecvPacket+2 and +4 are both non-zero; no callers | generic |
| flag 0x40 | EVENT_TALKED_BASE | first talked-this-stage flag; NPC n = talk speaker - 0x15 uses 0x40 + n (TownNpcTalk) | [code] |
| flag 0x44 | EVENT_TALKED_LANA | Lana's talked slot; only cleared (ClearTalkedFlags), her rows set 0x43 | [code] |
| flag 0x4E | EVENT_TALKED_WORKS | the player's Works arrival talk seen this stage (Works rows 0, 3, 14); was EVENT_TALKED_RENAB, no such NPC | [code] |
| flag 0x50 | EVENT_GREETED_BASE | first greeted flag; NPC n uses 0x50 + n (TownNpcTalk); 0x50 itself is EVENT_JON_NOT_READY_SEEN | [code] |
| flag 0x53 | EVENT_GREETED_GALB | Galb's greeted slot; only cleared (ClearGreetedFlags) | [code] |
| flag 0x54 | EVENT_GREETED_LANA | Lana's greeted slot; only cleared | [code] |
| flag 0x5E | EVENT_GREETED_WORKS | greeted slot 14; only cleared | [code] |
