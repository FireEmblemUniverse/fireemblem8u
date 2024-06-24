    .section .data

	.global gUnknown_085AAB68
gUnknown_085AAB68:  @ 0x085AAB68
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D2A4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroText
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroSquares
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroBlendBox
        @ PROC_CALL
        .short 0x2, 0x0
        .word PhaseIntro_InitDisp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PhaseIntro_WaitForEnd
        @ PROC_CALL
        .short 0x2, 0x0
        .word StopBGM2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D37C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085AABB8
gUnknown_085AABB8:  @ 0x085AABB8
@ replacing .incbin "baserom.gba", 0x005aabb8, 0x10
.4byte gUnknown_080DA22C + 0x10
.4byte gUnknown_080DA22C + 0x18
.4byte gUnknown_080DA22C + 0x20
.4byte gUnknown_080DA22C + 0x28

	.global gUnknown_085AABC8
gUnknown_085AABC8:  @ 0x085AABC8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D47C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AABD8
gUnknown_085AABD8:  @ 0x085AABD8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D7B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
@ Replacing .incbin "baserom.gba", 0x5AABD8 + 0x18, 0x1C8 - 0x18
    .4byte 0x80da2e4
    .4byte 0x0
    .4byte 0x100
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_804D8C8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2d8
    .4byte 0x0
    .4byte 0x200
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_804D8C8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x300
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x400
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x500
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x600
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x700
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80210
    .4byte 0x0
    .4byte 0x85aabf0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte sub_804D940
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_085AADA0
gUnknown_085AADA0:  @ 0x085AADA0
@ Replacing .incbin "baserom.gba", 0x5AADA0, 0x6C
    .4byte 0xe0101
    .4byte 0x0
    .4byte 0x85aac5c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte sub_804D940
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc0201
    .4byte 0x0
    .4byte 0x85aad34
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte MenuCancelSelect
    .4byte 0x0
    .4byte 0x0
    .4byte 0x160201
    .4byte 0x0
    .4byte 0x85aad58
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte MenuCancelSelect
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_085AAE0C
gUnknown_085AAE0C:  @ 0x085AAE0C
    .incbin "baserom.gba", 0x5AAE0C, 0x54C

	.global Img_LinkArenaMenu
Img_LinkArenaMenu:  @ 0x085AB358
    .incbin "baserom.gba", 0x5AB358, 0xA10

	.global Img_TacticianSelObj
Img_TacticianSelObj:  @ 0x085ABD68
    .incbin "baserom.gba", 0x5ABD68, 0x89C

	.global gUnknown_085AC604
gUnknown_085AC604:  @ 0x085AC604
	.incbin "baserom.gba", 0x5AC604, 0x3D8

	.global Img_LinkArenaRankIcons
Img_LinkArenaRankIcons:  @ 0x085AC9DC
	.incbin "baserom.gba", 0x5AC9DC, 0x344

	.global Img_LinkArenaActiveBannerFx
Img_LinkArenaActiveBannerFx:  @ 0x085ACD20
	.incbin "baserom.gba", 0x5ACD20, 0x1DC

	.global gUnknown_085ACEFC
gUnknown_085ACEFC:  @ 0x085ACEFC
	.incbin "baserom.gba", 0x5ACEFC, 0x1D0

	.global Img_LinkArenaPlacementRanks
Img_LinkArenaPlacementRanks:  @ 0x085AD0CC
    .incbin "baserom.gba", 0x5AD0CC, 0x740

	.global gUnknown_085AD80C
gUnknown_085AD80C:  @ 0x085AD80C
	.incbin "baserom.gba", 0x5AD80C, 0x1C0

	.global gUnknown_085AD9CC
gUnknown_085AD9CC:  @ 0x085AD9CC
	.incbin "baserom.gba", 0x5AD9CC, 0x6C

	.global Img_LinkArenaPlayerBanners
Img_LinkArenaPlayerBanners:  @ 0x085ADA38
	.incbin "baserom.gba", 0x5ADA38, 0x1B0

	.global Pal_LinkArenaMenu
Pal_LinkArenaMenu:  @ 0x085ADBE8
	.incbin "baserom.gba", 0x5ADBE8, 0x60

	.global Pal_TacticianSelObj
Pal_TacticianSelObj:  @ 0x085ADC48
	.incbin "baserom.gba", 0x5ADC48, 0x80

	.global Pal_LinkArenaRankIcons
Pal_LinkArenaRankIcons:  @ 0x085ADCC8
	.incbin "baserom.gba", 0x5ADCC8, 0xE0

	.global gUnknown_085ADDA8
gUnknown_085ADDA8:  @ 0x085ADDA8
	.incbin "baserom.gba", 0x5ADDA8, 0x20

	.global Pal_LinkArenaPlacementRanks
Pal_LinkArenaPlacementRanks:  @ 0x085ADDC8
	.incbin "baserom.gba", 0x5ADDC8, 0x20

	.global gUnknown_085ADDE8
gUnknown_085ADDE8:  @ 0x085ADDE8
	.incbin "baserom.gba", 0x5ADDE8, 0x20

	.global Pal_LinkArenaActiveBannerFx
Pal_LinkArenaActiveBannerFx:  @ 0x085ADE08
	.incbin "baserom.gba", 0x5ADE08, 0x20

	.global gUnknown_085ADE28
gUnknown_085ADE28:  @ 0x085ADE28
	.incbin "baserom.gba", 0x5ADE28, 0x20

	.global gUnknown_085ADE48
gUnknown_085ADE48:  @ 0x085ADE48
	.incbin "baserom.gba", 0x5ADE48, 0x20

	.global Pal_085ADE68
Pal_085ADE68:  @ 0x085ADE68
	.incbin "baserom.gba", 0x5ADE68, 0x20

	.global gUnknown_085ADE88
gUnknown_085ADE88:  @ 0x085ADE88
	.incbin "baserom.gba", 0x5ADE88, 0xB8

	.global gUnknown_085ADF40
gUnknown_085ADF40:  @ 0x085ADF40
	.incbin "baserom.gba", 0x5ADF40, 0x250

	.global Tsa_085AE190
Tsa_085AE190:  @ 0x085AE190
	.incbin "baserom.gba", 0x5AE190, 0x2D4

	.global Tsa_SioResultRankings
Tsa_SioResultRankings:  @ 0x085AE464
	.incbin "baserom.gba", 0x5AE464, 0x314

	.global gUnknown_085AE778
gUnknown_085AE778:  @ 0x085AE778
	.incbin "baserom.gba", 0x5AE778, 0x74

	.global gUnknown_085AE7EC
gUnknown_085AE7EC:  @ 0x085AE7EC
    .incbin "baserom.gba", 0x5AE7EC, 0x984

	.global Img_LinkArenaPostBattleBg
Img_LinkArenaPostBattleBg:  @ 0x085AF170
    .incbin "baserom.gba", 0x5AF170, 0x16AC

	.global Pal_LinkArenaPostBattleBg
Pal_LinkArenaPostBattleBg:  @ 0x085B081C
	.incbin "baserom.gba", 0x5B081C, 0x80

	.global Tsa_LinkArenaPostBattleBg
Tsa_LinkArenaPostBattleBg:  @ 0x085B089C
	.incbin "baserom.gba", 0x5B089C, 0x54C

	.global gUnknown_085B0DE8
gUnknown_085B0DE8:  @ 0x085B0DE8
	.incbin "baserom.gba", 0x5B0DE8, 0x144

	.global gUnknown_085B0F2C
gUnknown_085B0F2C:  @ 0x085B0F2C
    .incbin "baserom.gba", 0x5B0F2C, 0x5504
