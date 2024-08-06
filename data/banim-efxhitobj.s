    .section .data
    .include "animscr.inc"
    .include "gba_sprites.inc"

    .global Img_EfxPierceCriticalEffectBG
Img_EfxPierceCriticalEffectBG:  @ 0x085CFB70
    .incbin "baserom.gba", 0x5CFB70, 0xCB0

    .global Pal_EfxPierceCriticalEffectBG
Pal_EfxPierceCriticalEffectBG:  @ 0x085D0820
    .incbin "baserom.gba", 0x5D0820, 0x200

    .global TsaL_EfxPierceCriticalEffectBG
TsaL_EfxPierceCriticalEffectBG:  @ 0x085D0A20
    .incbin "baserom.gba", 0x5D0A20, 0x2C0

    .global TsaR_EfxPierceCriticalEffectBG
TsaR_EfxPierceCriticalEffectBG:  @ 0x085D0CE0
    .incbin "baserom.gba", 0x5D0CE0, 0x2F0

    .global Img_EfxPierceNormalEffectBG
Img_EfxPierceNormalEffectBG:  @ 0x085D0FD0
    .incbin "baserom.gba", 0x5D0FD0, 0x4A0

    .global Pal_EfxPierceNormalEffectBG
Pal_EfxPierceNormalEffectBG:  @ 0x085D1470
    .incbin "baserom.gba", 0x5D1470, 0x20

    .global Tsa1_EfxPierceNormalEffectBG
Tsa1_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1490, 0x5D155C - 0x5D1490

    .global Tsa2_EfxPierceNormalEffectBG
Tsa2_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D155C, 0x5D1668 - 0x5D155C

    .global Tsa3_EfxPierceNormalEffectBG
Tsa3_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1668, 0x5D1790 - 0x5D1668

    .global Tsa4_EfxPierceNormalEffectBG
Tsa4_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1790, 0x5D18B4 - 0x5D1790

    .global Tsa5_EfxPierceNormalEffectBG
Tsa5_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D18B4, 0x5D19DC - 0x5D18B4

    .global Tsa6_EfxPierceNormalEffectBG
Tsa6_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D19DC, 0x5D1AFC - 0x5D19DC

    .global Tsa7_EfxPierceNormalEffectBG
Tsa7_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1AFC, 0x5D1BFC - 0x5D1AFC

    .global Tsa8_EfxPierceNormalEffectBG
Tsa8_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1BFC, 0x5D1CDC - 0x5D1BFC

    .global Tsa9_EfxPierceNormalEffectBG
Tsa9_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1CDC, 0x5D1DA0 - 0x5D1CDC

    .global TsaA_EfxPierceNormalEffectBG
TsaA_EfxPierceNormalEffectBG:
    .incbin "baserom.gba", 0x5D1DA0, 0x5D1E38 - 0x5D1DA0
