	.section .data

	.global gUnknown_089A52FC
gUnknown_089A52FC:  @ 0x089A52FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80825B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80825B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global SpriteAnim_ManimStatGain
SpriteAnim_ManimStatGain:  @ 0x089A5314
	.incbin "baserom.gba", 0x9A5314, 0x758

	.global gUnknown_089A5A6C
gUnknown_089A5A6C:  @ 0x089A5A6C
	.incbin "baserom.gba", 0x9A5A6C, 0x78C

	.global gUnknown_089A61F8
gUnknown_089A61F8:  @ 0x089A61F8
	.incbin "baserom.gba", 0x9A61F8, 0x5C

	.global ApConf_089A6254
ApConf_089A6254:  @ 0x089A6254
	.incbin "baserom.gba", 0x9A6254, 0xCEC

	.global Obj_PoisonAnim
Obj_PoisonAnim:  @ 0x089A6F40
	.incbin "baserom.gba", 0x9A6F40, 0x98

	.global Obj_WallBreakAnim
Obj_WallBreakAnim:  @ 0x089A6FD8
	.incbin "baserom.gba", 0x9A6FD8, 0x1F20

	.global ApHandle_GmapSoguSprites
ApHandle_GmapSoguSprites:  @ 0x089A8EF8
	.incbin "baserom.gba", 0x9A8EF8, 0x7C

	.global gUnknown_089A8F74
gUnknown_089A8F74:  @ 0x089A8F74
	.incbin "baserom.gba", 0x9A8F74, 0x20

	.global gGfx_ArenaBuildingFront
gGfx_ArenaBuildingFront:  @ 0x089A8F94
	.incbin "baserom.gba", 0x9A8F94, 0x2BDC

	.global gTsa_ArenaBuildingFront
gTsa_ArenaBuildingFront:  @ 0x089ABB70
	.incbin "baserom.gba", 0x9ABB70, 0x4B4

	.global gPal_ArenaBuildingFront
gPal_ArenaBuildingFront:  @ 0x089AC024
	.incbin "baserom.gba", 0x9AC024, 0x80

	.global Img_MapAnimMISS
Img_MapAnimMISS:  @ 0x089AC0A4
	.incbin "baserom.gba", 0x9AC0A4, 0xF0

	.global Obj_MapAnimMISS
Obj_MapAnimMISS:  @ 0x089AC194
	.incbin "baserom.gba", 0x9AC194, 0x168

	.global Img_MapAnimNODAMAGE
Img_MapAnimNODAMAGE:  @ 0x089AC2FC
	.incbin "baserom.gba", 0x9AC2FC, 0x144

	.global obj_MapAnimNODAMAGE
obj_MapAnimNODAMAGE:  @ 0x089AC440
	.incbin "baserom.gba", 0x9AC440, 0x18C

	.global Pal_ManimLevelUpStatGainCycling
Pal_ManimLevelUpStatGainCycling:  @ 0x089AC5CC
    .incbin "baserom.gba", 0x9AC5CC, 0x1C8

	.global Img_ManimLevelUpText
Img_ManimLevelUpText:  @ 0x089AC794
	.incbin "./graphics/lvup/ManimLevelUpText.4bpp.lz"

	.global Pal_ManimLevelUp
Pal_ManimLevelUp:  @ 0x089AC9A8
	.incbin "baserom.gba", 0x9AC9A8, 0x60

	.global Img_ManimLevelUpStatGain
Img_ManimLevelUpStatGain:  @ 0x089ACA08
	.incbin "./graphics/lvup/ManimLvupStatGain.4bpp.lz"

	.global Img_ManimLevelUpStatGainDigits
Img_ManimLevelUpStatGainDigits:  @ 0x089ACC98
	.incbin "./graphics/lvup/ManimLevelUpStatGainDigits.4bpp"

	.global gUnknown_089AD498
gUnknown_089AD498:  @ 0x089AD498
	.incbin "baserom.gba", 0x9AD498, 0x68

	.global Img_MapBattleInfoBox
Img_MapBattleInfoBox:  @ 0x089AD500
	.incbin "baserom.gba", 0x9AD500, 0x148

	.global Pal_MapBattleInfoBlue
Pal_MapBattleInfoBlue:  @ 0x089AD648
	.incbin "baserom.gba", 0x9AD648, 0x20

	.global Pal_MapBattleInfoRed
Pal_MapBattleInfoRed:  @ 0x089AD668
    .incbin "baserom.gba", 0x9AD668, 0x20

	.global Pal_MapBattleInfoGreen
Pal_MapBattleInfoGreen:  @ 0x089AD688
	.incbin "baserom.gba", 0x9AD688, 0x20

	.global Pal_MapBattleInfoPurple
Pal_MapBattleInfoPurple:  @ 0x089AD6A8
    .incbin "baserom.gba", 0x9AD6A8, 0x20

    .global Tsa_MapBattleBoxGfx1
Tsa_MapBattleBoxGfx1:   @ 0x089AD6C8
    .incbin "baserom.gba", 0x9AD6C8, 0x4C

    .global Tsa_MapBattleBoxGfx2
Tsa_MapBattleBoxGfx2:   @ 0x089AD714
    .incbin "baserom.gba", 0x9AD714, 0x38

    .global Tsa_MapBattleBoxGfx3
Tsa_MapBattleBoxGfx3:   @ 0x089AD74C
    .incbin "baserom.gba", 0x9AD74C, 0x40

	.global Img_MapBattleInfoHpBar
Img_MapBattleInfoHpBar:  @ 0x089AD78C
	.incbin "baserom.gba", 0x9AD78C, 0xDC

	.global Img_MapBattleInfoNum
Img_MapBattleInfoNum:  @ 0x089AD868
	.incbin "baserom.gba", 0x9AD868, 0xCC

	.global gUnknown_089AD934
gUnknown_089AD934:  @ 0x089AD934
	.incbin "baserom.gba", 0x9AD934, 0xC4

	.global gUnknown_089AD9F8
gUnknown_089AD9F8:  @ 0x089AD9F8
	.incbin "baserom.gba", 0x9AD9F8, 0x88

	.global Img_WallBreakAnim
Img_WallBreakAnim:  @ 0x089ADA80
    .incbin "baserom.gba", 0x9ADA80, 0x28C

	.global Pal_WallBreakAnim
Pal_WallBreakAnim:  @ 0x089ADD0C
	.incbin "baserom.gba", 0x9ADD0C, 0x40

	.global Img_GmapSoguSprites
Img_GmapSoguSprites:  @ 0x089ADD4C
	.incbin "baserom.gba", 0x9ADD4C, 0x164

	.global Img_PoisonAnim
Img_PoisonAnim:  @ 0x089ADEB0
	.incbin "baserom.gba", 0x9ADEB0, 0x354

	.global Pal_PoisonAnim
Pal_PoisonAnim:  @ 0x089AE204
	.incbin "baserom.gba", 0x9AE204, 0x20

	.global gUnknown_089AE224
gUnknown_089AE224:  @ 0x089AE224
	.incbin "baserom.gba", 0x9AE224, 0x260

	.global gUnknown_089AE484
gUnknown_089AE484:  @ 0x089AE484
	.incbin "baserom.gba", 0x9AE484, 0x20

	.global gUnknown_089AE4A4
gUnknown_089AE4A4:  @ 0x089AE4A4
	.incbin "baserom.gba", 0x9AE4A4, 0x300

	.global Img_089AE7A4
Img_089AE7A4:  @ 0x089AE7A4
	.incbin "baserom.gba", 0x9AE7A4, 0x20

	.global Pal_089AE7C4
Pal_089AE7C4:  @ 0x089AE7C4
	.incbin "baserom.gba", 0x9AE7C4, 0x40

	.global gUnknown_089AE804
gUnknown_089AE804:  @ 0x089AE804
	.incbin "baserom.gba", 0x9AE804, 0xB0C

	.global gUnknown_089AF310
gUnknown_089AF310:  @ 0x089AF310
	.incbin "baserom.gba", 0x9AF310, 0x600

	.global gUnknown_089AF910
gUnknown_089AF910:  @ 0x089AF910
	.incbin "baserom.gba", 0x9AF910, 0x20

	.global gUnknown_089AF930
gUnknown_089AF930:  @ 0x089AF930
	.incbin "baserom.gba", 0x9AF930, 0x20

	.global gUnknown_089AF950
gUnknown_089AF950:  @ 0x089AF950
	.incbin "baserom.gba", 0x9AF950, 0x174

	.global gUnknown_089AFAC4
gUnknown_089AFAC4:  @ 0x089AFAC4
	.incbin "baserom.gba", 0x9AFAC4, 0x1F8

	.global gUnknown_089AFCBC
gUnknown_089AFCBC:  @ 0x089AFCBC
	.incbin "baserom.gba", 0x9AFCBC, 0x2BC

	.global Pal_089AFF78
Pal_089AFF78:  @ 0x089AFF78
	.incbin "baserom.gba", 0x9AFF78, 0x40

	.global Pal_089AFFB8
Pal_089AFFB8:  @ 0x089AFFB8
	.incbin "baserom.gba", 0x9AFFB8, 0x40

	.global gUnknown_089AFFF8
gUnknown_089AFFF8:  @ 0x089AFFF8
    .incbin "baserom.gba", 0x9AFFF8, 0x3DC

	.global gUnknown_089B03D4
gUnknown_089B03D4:  @ 0x089B03D4
	.incbin "baserom.gba", 0x9B03D4, 0x2B8

	.global gUnknown_089B068C
gUnknown_089B068C:  @ 0x089B068C
	.incbin "baserom.gba", 0x9B068C, 0x20

	.global Img_089B06AC
Img_089B06AC:  @ 0x089B06AC
	.incbin "baserom.gba", 0x9B06AC, 0x54

	.global Pal_089B0700
Pal_089B0700:  @ 0x089B0700
	.incbin "baserom.gba", 0x9B0700, 0x20

	.global gUnknown_089B0720
gUnknown_089B0720:  @ 0x089B0720
	.incbin "baserom.gba", 0x9B0720, 0x100

	.global gUnknown_089B0820
gUnknown_089B0820:  @ 0x089B0820
	.incbin "baserom.gba", 0x9B0820, 0x20

	.global gUnknown_089B0840
gUnknown_089B0840:  @ 0x089B0840
    .incbin "baserom.gba", 0x9B0840, 0x24

	.global gUnknown_089B0864
gUnknown_089B0864:  @ 0x089B0864
	.incbin "baserom.gba", 0x9B0864, 0x26C

	.global gUnknown_089B0AD0
gUnknown_089B0AD0:  @ 0x089B0AD0
	.incbin "baserom.gba", 0x9B0AD0, 0xCD4

	.global gUnknown_089B17A4
gUnknown_089B17A4:  @ 0x089B17A4
	.incbin "baserom.gba", 0x9B17A4, 0x26C

	.global gUnknown_089B1A10
gUnknown_089B1A10:  @ 0x089B1A10
	.incbin "baserom.gba", 0x9B1A10, 0x400

	.global gUnknown_089B1E10
gUnknown_089B1E10:  @ 0x089B1E10
	.incbin "baserom.gba", 0x9B1E10, 0x2D8

	.global gUnknown_089B20E8
gUnknown_089B20E8:  @ 0x089B20E8
	.incbin "baserom.gba", 0x9B20E8, 0x20

	.global gUnknown_089B2108
gUnknown_089B2108:  @ 0x089B2108
	.incbin "baserom.gba", 0x9B2108, 0xD0

	.global gUnknown_089B21D8
gUnknown_089B21D8:  @ 0x089B21D8
	.incbin "baserom.gba", 0x9B21D8, 0x440

	.global gUnknown_089B2618
gUnknown_089B2618:  @ 0x089B2618
    .incbin "baserom.gba", 0x9B2618, 0x110

	.global gUnknown_089B2728
gUnknown_089B2728:  @ 0x089B2728
	.incbin "baserom.gba", 0x9B2728, 0x20

	.global gUnknown_089B2748
gUnknown_089B2748:  @ 0x089B2748
	.incbin "baserom.gba", 0x9B2748, 0x138

	.global gUnknown_089B2880
gUnknown_089B2880:  @ 0x089B2880
	.incbin "baserom.gba", 0x9B2880, 0xBBC

	.global gUnknown_089B343C
gUnknown_089B343C:  @ 0x089B343C
	.incbin "baserom.gba", 0x9B343C, 0x194

	.global Img_089B35D0
Img_089B35D0:  @ 0x089B35D0
	.incbin "baserom.gba", 0x9B35D0, 0x162C

	.global Pal_089B4BFC
Pal_089B4BFC:  @ 0x089B4BFC
    .incbin "baserom.gba", 0x9B4BFC, 0x1EA4

	.global gUnknown_089B6AA0
gUnknown_089B6AA0:  @ 0x089B6AA0
	.incbin "baserom.gba", 0x9B6AA0, 0x934

	.global gUnknown_089B73D4
gUnknown_089B73D4:  @ 0x089B73D4
	.incbin "baserom.gba", 0x9B73D4, 0x23C

	.global Img_GorgonHatchCloud
Img_GorgonHatchCloud:  @ 0x089B7610
	.incbin "baserom.gba", 0x9B7610, 0xAB4

	.global Pal_GorgonHatchCloud
Pal_GorgonHatchCloud:  @ 0x089B80C4
	.incbin "baserom.gba", 0x9B80C4, 0x9B80E4 - 0x9B80C4

	.global Tsa_GorgonHatchCloud_A
Tsa_GorgonHatchCloud_A:  @ 0x089B80E4
	.incbin "baserom.gba", 0x9B80E4, 0x9B8140 - 0x9B80E4

	.global Tsa_GorgonHatchCloud_B
Tsa_GorgonHatchCloud_B:  @ 0x089B8140
	.incbin "baserom.gba", 0x9B8140, 0x9B81A4 - 0x9B8140

	.global Tsa_GorgonHatchCloud_C
Tsa_GorgonHatchCloud_C:  @ 0x089B81A4
	.incbin "baserom.gba", 0x9B81A4, 0x9B8214 - 0x9B81A4

	.global Tsa_GorgonHatchCloud_D
Tsa_GorgonHatchCloud_D:  @ 0x089B8214
	.incbin "baserom.gba", 0x9B8214, 0x9B828C - 0x9B8214

	.global Tsa_GorgonHatchCloud_E
Tsa_GorgonHatchCloud_E:  @ 0x089B828C
	.incbin "baserom.gba", 0x9B828C, 0x9B82F0 - 0x9B828C

	.global Tsa_GorgonHatchCloud_F
Tsa_GorgonHatchCloud_F:  @ 0x089B82F0
	.incbin "baserom.gba", 0x9B82F0, 0x9B835C - 0x9B82F0

	.global Tsa_GorgonHatchCloud_G
Tsa_GorgonHatchCloud_G:  @ 0x089B835C
	.incbin "baserom.gba", 0x9B835C, 0x9E714C - 0x9B835C

	.global gUnknown_089E714C
gUnknown_089E714C:  @ 0x089E714C
	.incbin "baserom.gba", 0x9E714C, 0xCA0

	.global gUnknown_089E7DEC
gUnknown_089E7DEC:  @ 0x089E7DEC
	.incbin "baserom.gba", 0x9E7DEC, 0x44C

	.global gUnknown_089E8238
gUnknown_089E8238:  @ 0x089E8238
    .incbin "baserom.gba", 0x9E8238, 0xA8

	.global gUnknown_089E82E0
gUnknown_089E82E0:  @ 0x089E82E0
	.incbin "baserom.gba", 0x9E82E0, 0xA4

	.global gUnknown_089E8384
gUnknown_089E8384:  @ 0x089E8384
	.incbin "baserom.gba", 0x9E8384, 0x5C

	.global gUnknown_089E83E0
gUnknown_089E83E0:  @ 0x089E83E0
	.incbin "baserom.gba", 0x9E83E0, 0x54

	.global gUnknown_089E8434
gUnknown_089E8434:  @ 0x089E8434
	.incbin "baserom.gba", 0x9E8434, 0x50

	.global gUnknown_089E8484
gUnknown_089E8484:  @ 0x089E8484
	.incbin "baserom.gba", 0x9E8484, 0x50

	.global gUnknown_089E84D4
gUnknown_089E84D4:  @ 0x089E84D4
	.incbin "baserom.gba", 0x9E84D4, 0x20
