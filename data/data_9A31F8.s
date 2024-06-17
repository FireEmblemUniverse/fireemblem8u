	.section .data

	.global ProcScr_ManimShiftingSineWaveScanlineBuf
ProcScr_ManimShiftingSineWaveScanlineBuf:  @ 0x089A52FC
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

	.global ApConf_MapAnimTorchfx
ApConf_MapAnimTorchfx:  @ 0x089A61F8
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

	.global Tsa_ShopWindows
Tsa_ShopWindows:  @ 0x089AD934
	.incbin "baserom.gba", 0x9AD934, 0xC4

	.global Img_ShopGoldBox
Img_ShopGoldBox:  @ 0x089AD9F8
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

	.global Img_MapAnimAntitoxinPureWater
Img_MapAnimAntitoxinPureWater:  @ 0x089AE804
	.incbin "baserom.gba", 0x9AE804, 0xB0C

	.global gUnknown_089AF310
gUnknown_089AF310:  @ 0x089AF310
	.incbin "baserom.gba", 0x9AF310, 0x600

	.global Pal_MapAnimPureWater
Pal_MapAnimPureWater:  @ 0x089AF910
	.incbin "baserom.gba", 0x9AF910, 0x20

	.global Pal_MapAnimAntitoxin
Pal_MapAnimAntitoxin:  @ 0x089AF930
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

	.global Img_MapAnimTorchfx
Img_MapAnimTorchfx:  @ 0x089B03D4
	.incbin "baserom.gba", 0x9B03D4, 0x2B8

	.global Pal_MapAnimTorchfx
Pal_MapAnimTorchfx:  @ 0x089B068C
	.incbin "baserom.gba", 0x9B068C, 0x20

	.global Img_MapAnimUnlockObjfx
Img_MapAnimUnlockObjfx:  @ 0x089B06AC
	.incbin "baserom.gba", 0x9B06AC, 0x54

	.global Pal_MapAnimUnlockObjfx
Pal_MapAnimUnlockObjfx:  @ 0x089B0700
	.incbin "baserom.gba", 0x9B0700, 0x20

	.global Img_MapAnimUnlockBgfx
Img_MapAnimUnlockBgfx:  @ 0x089B0720
	.incbin "baserom.gba", 0x9B0720, 0x100

	.global Pal_MapAnimUnlockObjfx_Unk
Pal_MapAnimUnlockObjfx_Unk:  @ 0x089B0820
	.incbin "baserom.gba", 0x9B0820, 0x20

	.global Tsa_MapAnimUnlockBgfx
Tsa_MapAnimUnlockBgfx:  @ 0x089B0840
    .incbin "baserom.gba", 0x9B0840, 0x24

	.global Tsa_089B0864
Tsa_089B0864:  @ 0x089B0864
	.incbin "baserom.gba", 0x9B0864, 0x26C

	.global Img_MapAnimRepairfx
Img_MapAnimRepairfx:  @ 0x089B0AD0
	.incbin "baserom.gba", 0x9B0AD0, 0xCD4

	.global Tsa_089B17A4
Tsa_089B17A4:  @ 0x089B17A4
	.incbin "baserom.gba", 0x9B17A4, 0x26C

	.global ApConf_MapAnimSleep
ApConf_MapAnimSleep:  @ 0x089B1A10
	.incbin "baserom.gba", 0x9B1A10, 0x400

	.global Img_MapAnimBerserkfx
Img_MapAnimBerserkfx:  @ 0x089B1E10
	.incbin "baserom.gba", 0x9B1E10, 0x2D8

	.global Pal_MapAnimBerserkfx
Pal_MapAnimBerserkfx:  @ 0x089B20E8
	.incbin "baserom.gba", 0x9B20E8, 0x20

	.global ApConf_MapAnimBerserkfx
ApConf_MapAnimBerserkfx:  @ 0x089B2108
	.incbin "baserom.gba", 0x9B2108, 0xD0

	.global Img_ManimSilenceObjfx
Img_ManimSilenceObjfx:  @ 0x089B21D8
	.incbin "baserom.gba", 0x9B21D8, 0x440

	.global Img_ManimSilenceBgfx
Img_ManimSilenceBgfx:  @ 0x089B2618
    .incbin "baserom.gba", 0x9B2618, 0x110

	.global Pal_ManimSilencefx
Pal_ManimSilencefx:  @ 0x089B2728
	.incbin "baserom.gba", 0x9B2728, 0x20

	.global ApConf_ManimSilencefx
ApConf_ManimSilencefx:  @ 0x089B2748
	.incbin "baserom.gba", 0x9B2748, 0x138

	.global Img_ManimBarrierBgfx
Img_ManimBarrierBgfx:  @ 0x089B2880
	.incbin "baserom.gba", 0x9B2880, 0xBBC

	.global Tsa_089B343C
Tsa_089B343C:  @ 0x089B343C
	.incbin "baserom.gba", 0x9B343C, 0x194

	.global Img_NightMareMapAnimfx
Img_NightMareMapAnimfx:  @ 0x089B35D0
	.incbin "baserom.gba", 0x9B35D0, 0x162C

	.global Pal_NightMareMapAnimfx
Pal_NightMareMapAnimfx:  @ 0x089B4BFC
    .incbin "baserom.gba", 0x9B4BFC, 0x9B4C1C - 0x9B4BFC

.global Tsa_NightMareMapAnimfx1
Tsa_NightMareMapAnimfx1:
	.incbin "baserom.gba", 0x9B4C1C, 0x9B4C80 - 0x9B4C1C

.global Tsa_NightMareMapAnimfx2
Tsa_NightMareMapAnimfx2:
	.incbin "baserom.gba", 0x9B4C80, 0x9B4CE8 - 0x9B4C80

.global Tsa_NightMareMapAnimfx3
Tsa_NightMareMapAnimfx3:
	.incbin "baserom.gba", 0x9B4CE8, 0x9B4D64 - 0x9B4CE8

.global Tsa_NightMareMapAnimfx4
Tsa_NightMareMapAnimfx4:
	.incbin "baserom.gba", 0x9B4D64, 0x9B4DDC - 0x9B4D64

.global Tsa_NightMareMapAnimfx5
Tsa_NightMareMapAnimfx5:
	.incbin "baserom.gba", 0x9B4DDC, 0x9B4E4C - 0x9B4DDC

.global Tsa_NightMareMapAnimfx6
Tsa_NightMareMapAnimfx6:
	.incbin "baserom.gba", 0x9B4E4C, 0x9B4EB8 - 0x9B4E4C

.global Tsa_NightMareMapAnimfx7
Tsa_NightMareMapAnimfx7:
	.incbin "baserom.gba", 0x9B4EB8, 0x9B4F2C - 0x9B4EB8

.global Tsa_NightMareMapAnimfx8
Tsa_NightMareMapAnimfx8:
	.incbin "baserom.gba", 0x9B4F2C, 0x9B4FA4 - 0x9B4F2C

.global Tsa_NightMareMapAnimfx9
Tsa_NightMareMapAnimfx9:
	.incbin "baserom.gba", 0x9B4FA4, 0x9B501C - 0x9B4FA4

.global Tsa_NightMareMapAnimfx10
Tsa_NightMareMapAnimfx10:
	.incbin "baserom.gba", 0x9B501C, 0x9B5094 - 0x9B501C

.global Tsa_NightMareMapAnimfx11
Tsa_NightMareMapAnimfx11:
	.incbin "baserom.gba", 0x9B5094, 0x9B5118 - 0x9B5094

.global Tsa_NightMareMapAnimfx12
Tsa_NightMareMapAnimfx12:
	.incbin "baserom.gba", 0x9B5118, 0x9B519C - 0x9B5118

.global Tsa_NightMareMapAnimfx13
Tsa_NightMareMapAnimfx13:
	.incbin "baserom.gba", 0x9B519C, 0x9B5220 - 0x9B519C

.global Tsa_NightMareMapAnimfx14
Tsa_NightMareMapAnimfx14:
	.incbin "baserom.gba", 0x9B5220, 0x9B52A4 - 0x9B5220

.global Tsa_NightMareMapAnimfx15
Tsa_NightMareMapAnimfx15:
	.incbin "baserom.gba", 0x9B52A4, 0x9B5310 - 0x9B52A4

.global Tsa_NightMareMapAnimfx16
Tsa_NightMareMapAnimfx16:
	.incbin "baserom.gba", 0x9B5310, 0x9B5398 - 0x9B5310

.global Tsa_NightMareMapAnimfx17
Tsa_NightMareMapAnimfx17:
	.incbin "baserom.gba", 0x9B5398, 0x9B5434 - 0x9B5398

.global Tsa_NightMareMapAnimfx18
Tsa_NightMareMapAnimfx18:
	.incbin "baserom.gba", 0x9B5434, 0x9B54F0 - 0x9B5434

.global Tsa_NightMareMapAnimfx19
Tsa_NightMareMapAnimfx19:
	.incbin "baserom.gba", 0x9B54F0, 0x9B55EC - 0x9B54F0

.global Tsa_NightMareMapAnimfx20
Tsa_NightMareMapAnimfx20:
	.incbin "baserom.gba", 0x9B55EC, 0x9B5720 - 0x9B55EC

.global Tsa_NightMareMapAnimfx21
Tsa_NightMareMapAnimfx21:
	.incbin "baserom.gba", 0x9B5720, 0x9B58DC - 0x9B5720

.global Tsa_NightMareMapAnimfx22
Tsa_NightMareMapAnimfx22:
	.incbin "baserom.gba", 0x9B58DC, 0x9B5B38 - 0x9B58DC

.global Tsa_NightMareMapAnimfx23
Tsa_NightMareMapAnimfx23:
	.incbin "baserom.gba", 0x9B5B38, 0x9B5C6C - 0x9B5B38

.global Tsa_NightMareMapAnimfx24
Tsa_NightMareMapAnimfx24:
	.incbin "baserom.gba", 0x9B5C6C, 0x9B5E0C - 0x9B5C6C

.global Tsa_NightMareMapAnimfx25
Tsa_NightMareMapAnimfx25:
	.incbin "baserom.gba", 0x9B5E0C, 0x9B6050 - 0x9B5E0C

.global Tsa_NightMareMapAnimfx26
Tsa_NightMareMapAnimfx26:
	.incbin "baserom.gba", 0x9B6050, 0x9B6174 - 0x9B6050

.global Tsa_NightMareMapAnimfx27
Tsa_NightMareMapAnimfx27:
	.incbin "baserom.gba", 0x9B6174, 0x9B630C - 0x9B6174

.global Tsa_NightMareMapAnimfx28
Tsa_NightMareMapAnimfx28:
	.incbin "baserom.gba", 0x9B630C, 0x9B6510 - 0x9B630C

.global Tsa_NightMareMapAnimfx29
Tsa_NightMareMapAnimfx29:
	.incbin "baserom.gba", 0x9B6510, 0x9B65D4 - 0x9B6510

.global Tsa_NightMareMapAnimfx30
Tsa_NightMareMapAnimfx30:
	.incbin "baserom.gba", 0x9B65D4, 0x9B66BC - 0x9B65D4

.global Tsa_NightMareMapAnimfx31
Tsa_NightMareMapAnimfx31:
	.incbin "baserom.gba", 0x9B66BC, 0x9B6808 - 0x9B66BC

.global Tsa_NightMareMapAnimfx32
Tsa_NightMareMapAnimfx32:
	.incbin "baserom.gba", 0x9B6808, 0x9B69BC - 0x9B6808

.global Tsa_NightMareMapAnimfx33
Tsa_NightMareMapAnimfx33:
	.incbin "baserom.gba", 0x9B69BC, 0x9B6AA0 - 0x9B69BC

	.global Img_MonsterStoneMapAnimfx
Img_MonsterStoneMapAnimfx:  @ 0x089B6AA0
	.incbin "baserom.gba", 0x9B6AA0, 0x934

	.global Pal_MonsterStoneMapAnimfx
Pal_MonsterStoneMapAnimfx:  @ 0x089B73D4
	.incbin "baserom.gba", 0x9B73D4, 0x20

	.global Tsa1_MonsterStoneMapAnimfx
Tsa1_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B73F4, 0x9B7414 - 0x9B73F4

	.global Tsa2_MonsterStoneMapAnimfx
Tsa2_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B7414, 0x9B743C - 0x9B7414

	.global Tsa3_MonsterStoneMapAnimfx
Tsa3_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B743C, 0x9B7468 - 0x9B743C

	.global Tsa4_MonsterStoneMapAnimfx
Tsa4_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B7468, 0x9B749C - 0x9B7468

	.global Tsa5_MonsterStoneMapAnimfx
Tsa5_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B749C, 0x9B74D4 - 0x9B749C

	.global Tsa6_MonsterStoneMapAnimfx
Tsa6_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B74D4, 0x9B7514 - 0x9B74D4

	.global Tsa7_MonsterStoneMapAnimfx
Tsa7_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B7514, 0x9B7554 - 0x9B7514

	.global Tsa8_MonsterStoneMapAnimfx
Tsa8_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B7554, 0x9B759C - 0x9B7554

	.global Tsa9_MonsterStoneMapAnimfx
Tsa9_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B759C, 0x9B75D8 - 0x9B759C

	.global Tsa10_MonsterStoneMapAnimfx
Tsa10_MonsterStoneMapAnimfx:
	.incbin "baserom.gba", 0x9B75D8, 0x9B7610 - 0x9B75D8

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

	.global Img_TalkBubble
Img_TalkBubble:  @ 0x089E8238
    .incbin "baserom.gba", 0x9E8238, 0xA8

	.global Img_TalkBubbleOpening_E
Img_TalkBubbleOpening_E:  @ 0x089E82E0
	.incbin "baserom.gba", 0x9E82E0, 0xA4

	.global Img_TalkBubbleOpening_D
Img_TalkBubbleOpening_D:  @ 0x089E8384
	.incbin "baserom.gba", 0x9E8384, 0x5C

	.global Img_TalkBubbleOpening_C
Img_TalkBubbleOpening_C:  @ 0x089E83E0
	.incbin "baserom.gba", 0x9E83E0, 0x54

	.global Img_TalkBubbleOpening_B
Img_TalkBubbleOpening_B:  @ 0x089E8434
	.incbin "baserom.gba", 0x9E8434, 0x50

	.global Img_TalkBubbleOpening_A
Img_TalkBubbleOpening_A:  @ 0x089E8484
	.incbin "baserom.gba", 0x9E8484, 0x50

	.global Pal_TalkBubble
Pal_TalkBubble:  @ 0x089E84D4
	.incbin "baserom.gba", 0x9E84D4, 0x20
