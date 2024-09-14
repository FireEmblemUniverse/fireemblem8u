	.section .data

    .global Img_08801C14
Img_08801C14:  @ 0x08801C14
    .incbin "baserom.gba", 0x801C14, 0x368

    .global Img_EfxLeftNameBox
Img_EfxLeftNameBox:  @ 0x08801F7C
    .incbin "baserom.gba", 0x801F7C, 0x78

    .global Img_EfxLeftItemBox
Img_EfxLeftItemBox:  @ 0x08801FF4
    .incbin "baserom.gba", 0x801FF4, 0x50

    .global Img_EfxRightNameBox
Img_EfxRightNameBox:  @ 0x08802044
    .incbin "baserom.gba", 0x802044, 0x78

    .global Img_EfxRightItemBox
Img_EfxRightItemBox:  @ 0x088020BC
    .incbin "baserom.gba", 0x8020BC, 0x50

    .global gUnknown_0880210C
gUnknown_0880210C:  @ 0x0880210C
    .incbin "baserom.gba", 0x80210C, 0xB4

    .global gUnknown_088021C0
gUnknown_088021C0:  @ 0x088021C0
    .incbin "baserom.gba", 0x8021C0, 0xB4

    .global gUnknown_08802274
gUnknown_08802274:  @ 0x08802274
    .incbin "baserom.gba", 0x802274, 0xD4

    .global gUnknown_08802348
gUnknown_08802348:  @ 0x08802348
    .incbin "baserom.gba", 0x802348, 0xE0

    .global gUnknown_08802428
gUnknown_08802428:  @ 0x08802428
    .incbin "baserom.gba", 0x802428, 0xE0

    .global gUnknown_08802508
gUnknown_08802508:  @ 0x08802508
    .incbin "baserom.gba", 0x802508, 0x50

    .global gUnknown_08802558
gUnknown_08802558:  @ 0x08802558
    .incbin "baserom.gba", 0x802558, 0x80

    .global Img_EfxSideHitDmgCrit
Img_EfxSideHitDmgCrit:  @ 0x088025D8
    .incbin "baserom.gba", 0x8025D8, 0x9C

    .global Img_EfxWTAArrow1
Img_EfxWTAArrow1:  @ 0x08802674
    .incbin "baserom.gba", 0x802674, 0x24

    .global Img_EfxWTAArrow2
Img_EfxWTAArrow2:  @ 0x08802698
    .incbin "baserom.gba", 0x802698, 0x4C

    .global gUnknown_088026E4
gUnknown_088026E4:  @ 0x088026E4
    .incbin "baserom.gba", 0x8026E4, 0x1A0

    .global gUnknown_08802884
gUnknown_08802884:  @ 0x08802884
    .incbin "baserom.gba", 0x802884, 0x80

    .global gUnknown_08802904
gUnknown_08802904:  @ 0x08802904
    .incbin "baserom.gba", 0x802904, 0x200

    .global gUnknown_08802B04
gUnknown_08802B04:  @ 0x08802B04
    .incbin "baserom.gba", 0x802B04, 0x80

    .global gPalEfxHpBarGreen
gPalEfxHpBarGreen:  @ 0x08802B84
    .incbin "baserom.gba", 0x802B84, 0x40

    .global gUnknown_08802BC4
gUnknown_08802BC4:  @ 0x08802BC4
    .incbin "baserom.gba", 0x802BC4, 0xC0

    .global gPalEfxHpBarPurple
gPalEfxHpBarPurple:  @ 0x08802C84
    .incbin "baserom.gba", 0x802C84, 0xA0

    .global Pal_BanimUnitFlashing
Pal_BanimUnitFlashing:  @ 0x08802D24
    .incbin "baserom.gba", 0x802D24, 0x20

    .global Img_EkrExpBar
Img_EkrExpBar:  @ 0x08802D44
    .incbin "./graphics/bar_fx/ekr_expbarfx.4bpp"

    .global Img_EkrExpBarChange
Img_EkrExpBarChange:  @ 0x088030C4
    .incbin "./graphics/bar_fx/ekr_expbarchangefx.4bpp"

    .global Img_BarNumfx
Img_BarNumfx:  @ 0x088033C4
    .incbin "./graphics/bar_fx/bar_num.4bpp"

    .global Tsa_EkrExpBar
Tsa_EkrExpBar:  @ 0x08803524
    .incbin "baserom.gba", 0x803524, 0x6C

    .global Pal_ExpBar
Pal_ExpBar:  @ 0x08803590
    .incbin "./graphics/bar_fx/bar_num.gbapal", 0x0, 0x20

    .global Img_LevelUpBoxFrame
Img_LevelUpBoxFrame:  @ 0x088035B0
    .incbin "baserom.gba", 0x8035B0, 0x438

    .global Tsa_LevelUpBoxFrame
Tsa_LevelUpBoxFrame:  @ 0x088039E8
    .incbin "baserom.gba", 0x8039E8, 0x128

    .global Pal_LevelUpBoxFrame
Pal_LevelUpBoxFrame:  @ 0x08803B10
    .incbin "baserom.gba", 0x803B10, 0x20

    .global Img_EkrPopup
Img_EkrPopup:  @ 0x08803B30
    .incbin "baserom.gba", 0x803B30, 0xA0

    .global gUnknown_08803BD0
gUnknown_08803BD0:  @ 0x08803BD0
    .incbin "baserom.gba", 0x803BD0, 0xE0

    .global Pal_EkrPopup
Pal_EkrPopup:  @ 0x08803CB0
    .incbin "baserom.gba", 0x803CB0, 0x20

    .global Tsa_EkrPopup
Tsa_EkrPopup:  @ 0x08803CD0
    .incbin "baserom.gba", 0x803CD0, 0x94
