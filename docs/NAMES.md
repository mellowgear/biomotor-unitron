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
