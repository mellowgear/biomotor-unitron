; Work RAM owned by the graphics code (engine/gfx): scroll positions, fade, palette shadows, shake,
; sprite buffers, colour flag, metatile attributes, window animation. Edit here: this is the source.
; Evidence in the comment. Unnamed graphics RAM is listed in engine/gfx/README.md.

; --- scroll positions (VBlank UpdateScrollRegisters copies them to the scroll registers)
; [code] VBlank UpdateScrollRegisters writes 0x584B / 0x584D to S1SO_H / S1SO_V (plus wShakeX/Y when wShakeFlags bit 1) and 0x5853 / 0x5855 to S2SO_H / S2SO_V (bit 2)
wScr1ScrollX	equ	0x584B
wScr1ScrollY	equ	0x584D
; [code] the SCR1 scroll from line wScrollSplitLine down: UpdateScrollRegisters puts them (plus wShakeX/Y when wShakeFlags bit 3) in wSplitScrollBuffer, which the micro DMA copies to S1SO_H.. at that line; BattleStart sets them for the battle screen
wScr1SplitScrollX	equ	0x584F
wScr1SplitScrollY	equ	0x5851
wScr2ScrollX	equ	0x5853
wScr2ScrollY	equ	0x5855
; [code] the SCR2 scroll from line wScrollSplitLine down (wShakeFlags bit 4), as wScr1SplitScrollX/Y
wScr2SplitScrollX	equ	0x5857
wScr2SplitScrollY	equ	0x5859

; --- fade and palette shadows
wFadeLevel	equ	0x585B
; [code] the wFadeLevel last applied: UpdateSpritesAndFade calls FadePalettes / FadeMonoPalettes only when they differ; LoadPalettes and the Reset*Palettes store ~wFadeLevel to force it
wFadeLevelShown	equ	0x585C
wMonoPalShadow	equ	0x585D
; [code] wMonoPalShadow+0x18, the shadow of BG (FadeMonoPalettes copies 0x19 bytes to 0x8100); InitDisplayState sets 0x80, as InitDisplay sets BG
wBgShadow	equ	0x5875
wPalShadow	equ	0x5876
; [code] wPalShadow+0x1E0 and +0x1F0, the shadows of BG_PAL and WINDOW_PAL (FadePalettes copies 0x100 words to SPRITE_PAL); InitDisplayState puts a grey ramp 0xFFF..0 in each
wBgPalShadow	equ	0x5A56
wWindowPalShadow	equ	0x5A66

; --- scroll split, sprite offset, shake, sprite buffers
; [code] UpdateScrollRegisters: when 1..0x97, the line at which the micro DMA (DMA0/DMA1) copies wSplitScrollBuffer to S1SO_H..S2SO_V; 0 = no split (InitDisplayState, BattleEnd); BattleStart sets 0x61
wScrollSplitLine	equ	0x5A76
; [code] 4 bytes S1SO_H, S1SO_V, S2SO_H, S2SO_V for the split (wScr1SplitScrollX/Y, wScr2SplitScrollX/Y plus shake), the DMA1 source
wSplitScrollBuffer	equ	0x5A77
; [code] UpdateScrollRegisters: PO_H / PO_V = -(wSpriteOffsetX / Y), plus wShakeX/Y when wShakeFlags bit 0
wSpriteOffsetX	equ	0x5A7B
wSpriteOffsetY	equ	0x5A7D
wShakeFlags	equ	0x5A7F
wShakeX	equ	0x5A80
wShakeY	equ	0x5A81
; [code] next free 4-byte sprite entry in wSpriteBuffer (DrawSpriteGrid, DrawSpriteMap); UpdateSpritesAndFade copies up to it to sprite VRAM and resets it
wSpriteBufferPtr	equ	0x5A82
; [code] next free palette byte in wSpritePalBuffer, advanced with wSpriteBufferPtr
wSpritePalBufferPtr	equ	0x5A84
; [code] 64 sprites x 4 bytes, copied to sprite VRAM 0x8800-0x88FF each frame (UpdateSpritesAndFade); full when wSpriteBufferPtr reaches wSpritePalBuffer
wSpriteBuffer	equ	0x5A86
; [code] one colour-palette byte per sprite, copied to 0x8C00-0x8C3F on colour units (UpdateSpritesAndFade)
wSpritePalBuffer	equ	0x5B86
wColorFlags	equ	0x5BC6
wMetatileAttrPtr	equ	0x5BD9

; --- window
; [code] 4 bytes x, y, width, height for WBA_H, WBA_V, WSI_H, WSI_V: ApplyWindowA, the target of StartWindowAnimToA; set by SetupWindowIris (full screen)
wWindowA	equ	0x60F1
; [code] 4 bytes x, y, width, height: ApplyWindowB; SetupWindowIris puts an empty window at the centre here
wWindowB	equ	0x60F5
; [code] 4 signed steps (x, y, width, height) UpdateWindowAnim adds per frame
wWindowStep	equ	0x60F9
; [code] 0 idle, 1 animate towards wWindowA, 2 towards wWindowB (all four registers; UpdateWindowAnim clears it
; when done). [play] 2 = the iris closing before a scene change, 41 frames
wWindowAnim	equ	0x60FD
