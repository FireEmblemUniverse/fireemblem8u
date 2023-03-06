    .section .data

	.global cg_0_tiles
cg_0_tiles: @8a3cb5c
	.word cg_0_part_0_tiles
	.word cg_0_part_1_tiles
	.word cg_0_part_2_tiles
	.word cg_0_part_3_tiles
	.word cg_0_part_4_tiles
	.word cg_0_part_5_tiles
	.word cg_0_part_6_tiles
	.word cg_0_part_7_tiles
	.word cg_0_part_8_tiles
	.word cg_0_part_9_tiles

	.align 2, 0
	.global cg_1_tiles
cg_1_tiles: @8a3cb84
	.word cg_1_part_0_tiles
	.word cg_1_part_1_tiles
	.word cg_1_part_2_tiles
	.word cg_1_part_3_tiles
	.word cg_1_part_4_tiles
	.word cg_1_part_5_tiles
	.word cg_1_part_6_tiles
	.word cg_1_part_7_tiles
	.word cg_1_part_8_tiles
	.word cg_1_part_9_tiles

	.align 2, 0
	.global cg_2_tiles
cg_2_tiles: @8a3cbac
	.word cg_2_part_0_tiles
	.word cg_2_part_1_tiles
	.word cg_2_part_2_tiles
	.word cg_2_part_3_tiles
	.word cg_2_part_4_tiles
	.word cg_2_part_5_tiles
	.word cg_2_part_6_tiles
	.word cg_2_part_7_tiles
	.word cg_2_part_8_tiles
	.word cg_2_part_9_tiles

	.align 2, 0
	.global cg_3_tiles
cg_3_tiles: @8a3cbd4
	.word cg_3_part_0_tiles
	.word cg_3_part_1_tiles
	.word cg_3_part_2_tiles
	.word cg_3_part_3_tiles
	.word cg_3_part_4_tiles
	.word cg_3_part_5_tiles
	.word cg_3_part_6_tiles
	.word cg_3_part_7_tiles
	.word cg_3_part_8_tiles
	.word cg_3_part_9_tiles

	.align 2, 0
	.global cg_4_tiles
cg_4_tiles: @8a3cbfc
	.word cg_4_part_0_tiles
	.word cg_4_part_1_tiles
	.word cg_4_part_2_tiles
	.word cg_4_part_3_tiles
	.word cg_4_part_4_tiles
	.word cg_4_part_5_tiles
	.word cg_4_part_6_tiles
	.word cg_4_part_7_tiles
	.word cg_4_part_8_tiles
	.word cg_4_part_9_tiles

	.align 2, 0
	.global cg_5_tiles
cg_5_tiles: @8a3cc24
	.word cg_5_part_0_tiles
	.word cg_5_part_1_tiles
	.word cg_5_part_2_tiles
	.word cg_5_part_3_tiles
	.word cg_5_part_4_tiles
	.word cg_5_part_5_tiles
	.word cg_5_part_6_tiles
	.word cg_5_part_7_tiles
	.word cg_5_part_8_tiles
	.word cg_5_part_9_tiles

	.align 2, 0
	.global cg_6_tiles
cg_6_tiles: @8a3cc4c
	.word cg_6_part_0_tiles
	.word cg_6_part_1_tiles
	.word cg_6_part_2_tiles
	.word cg_6_part_3_tiles
	.word cg_6_part_4_tiles
	.word cg_6_part_5_tiles
	.word cg_6_part_6_tiles
	.word cg_6_part_7_tiles
	.word cg_6_part_8_tiles
	.word cg_6_part_9_tiles

	.align 2, 0
	.global cg_7_tiles
cg_7_tiles: @8a3cc74
	.word cg_7_part_0_tiles
	.word cg_7_part_1_tiles
	.word cg_7_part_2_tiles
	.word cg_7_part_3_tiles
	.word cg_7_part_4_tiles
	.word cg_7_part_5_tiles
	.word cg_7_part_6_tiles
	.word cg_7_part_7_tiles
	.word cg_7_part_8_tiles
	.word cg_7_part_9_tiles

	.align 2, 0
	.global cg_8_tiles
cg_8_tiles: @8a3cc9c
	.word cg_8_part_0_tiles
	.word cg_8_part_1_tiles
	.word cg_8_part_2_tiles
	.word cg_8_part_3_tiles
	.word cg_8_part_4_tiles
	.word cg_8_part_5_tiles
	.word cg_8_part_6_tiles
	.word cg_8_part_7_tiles
	.word cg_8_part_8_tiles
	.word cg_8_part_9_tiles

	.align 2, 0
	.global cg_9_tiles
cg_9_tiles: @8a3ccc4
	.word cg_9_part_0_tiles
	.word cg_9_part_1_tiles
	.word cg_9_part_2_tiles
	.word cg_9_part_3_tiles
	.word cg_9_part_4_tiles
	.word cg_9_part_5_tiles
	.word cg_9_part_6_tiles
	.word cg_9_part_7_tiles
	.word cg_9_part_8_tiles
	.word cg_9_part_9_tiles

	.align 2, 0
	.global gCGDataTable
gCGDataTable: @8a3ccec
	.word cg_0_tiles, cg_0_map, cg_0_palette
	.word cg_1_tiles, cg_1_map, cg_1_palette
	.word cg_2_tiles, cg_2_map, cg_2_palette
	.word cg_3_tiles, cg_3_map, cg_3_palette
	.word cg_4_tiles, cg_4_map, cg_4_palette
	.word cg_5_tiles, cg_5_map, cg_5_palette
	.word cg_6_tiles, cg_6_map, cg_6_palette
	.word cg_7_tiles, cg_7_map, cg_7_palette
	.word cg_8_tiles, cg_8_map, cg_8_palette
	.word cg_9_tiles, cg_9_map, cg_9_palette

	.global gUnknown_08A3CD64
gUnknown_08A3CD64:  @ 0x08A3CD64
	.incbin "baserom.gba", 0xA3CD64, 0x444

	.global gUnknown_08A3D1A8
gUnknown_08A3D1A8:  @ 0x08A3D1A8
@ replacing .incbin "baserom.gba", 0x00a3d1a8, 0x8
.4byte gUnknown_08A3CD64 + 0x4
.4byte gUnknown_08A3CD64 + 0x224

	.global gUnknown_08A3D1B0
gUnknown_08A3D1B0:  @ 0x08A3D1B0
	.incbin "baserom.gba", 0xA3D1B0, 0x110

	.global gUnknown_08A3D2C0
gUnknown_08A3D2C0:  @ 0x08A3D2C0
	.incbin "baserom.gba", 0xA3D2C0, 0x88

	.global gUnknown_08A3D348
gUnknown_08A3D348:  @ 0x08A3D348
@ replacing .incbin "baserom.gba", 0x00a3d348, 0x10
.4byte gUnknown_020007A0
.4byte gUnknown_02000F00 + 0xa0
.4byte gUnknown_02001188 + 0x618
.4byte gConvoyItemCount + 0x30

	.global gUnknown_08A3D358
gUnknown_08A3D358:  @ 0x08A3D358
@ replacing .incbin "baserom.gba", 0x00a3d358, 0x4
.4byte gTradeMenuText + 0x14

	.global gUnknown_08A3D35C
gUnknown_08A3D35C:  @ 0x08A3D35C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B696C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6AE0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B69D4
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6BD8
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6C00
        @ PROC_SLEEP
        .short 0xe, 0x72
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6AE0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x64
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x7
        .word sub_8014BD0
        @ PROC_CALL_ARG
        .short 0x18, 0x2
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6C14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D40C
gUnknown_08A3D40C:  @ 0x08A3D40C
    .incbin "baserom.gba", 0xA3D40C, 0x14

	.global gUnknown_08A3D420
gUnknown_08A3D420:  @ 0x08A3D420
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6D24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B6ED0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D440
gUnknown_08A3D440:  @ 0x08A3D440
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B6F34
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B71DC
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B723C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7274
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D478
gUnknown_08A3D478:  @ 0x08A3D478
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B72C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B734C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D498
gUnknown_08A3D498:  @ 0x08A3D498
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B74B0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B74D8
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word sub_8014BD0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x64
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B7500
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7540
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x64
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B7574
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D540
gUnknown_08A3D540:  @ 0x08A3D540
	.incbin "baserom.gba", 0xA3D540, 0x20

	.global gUnknown_08A3D560
gUnknown_08A3D560:  @ 0x08A3D560
	.incbin "baserom.gba", 0xA3D560, 0xE

	.global gUnknown_08A3D56E
gUnknown_08A3D56E:  @ 0x08A3D56E
	.incbin "baserom.gba", 0xA3D56E, 0xE

	.global gUnknown_08A3D57C
gUnknown_08A3D57C:  @ 0x08A3D57C
	.incbin "baserom.gba", 0xA3D57C, 0xE

	.global gUnknown_08A3D58A
gUnknown_08A3D58A:  @ 0x08A3D58A
	.incbin "baserom.gba", 0xA3D58A, 0xE

	.global gUnknown_08A3D598
gUnknown_08A3D598:  @ 0x08A3D598
	.incbin "baserom.gba", 0xA3D598, 0xE

	.global gUnknown_08A3D5A6
gUnknown_08A3D5A6:  @ 0x08A3D5A6
	.incbin "baserom.gba", 0xA3D5A6, 0xE

	.global gUnknown_08A3D5B4
gUnknown_08A3D5B4:  @ 0x08A3D5B4
	.incbin "baserom.gba", 0xA3D5B4, 0x70

	.global gUnknown_08A3D624
gUnknown_08A3D624:  @ 0x08A3D624
@ replacing .incbin "baserom.gba", 0x00a3d624, 0x18
.4byte gUnknown_08A3D5B4 + 0x36
.4byte gUnknown_08A3D5B4 + 0x2e
.4byte gUnknown_08A3D5B4 + 0x26
.4byte gUnknown_08A3D5B4 + 0x1e
.4byte gUnknown_08A3D5B4 + 0x16
.4byte gUnknown_08A3D5B4 + 0xe

	.global gUnknown_08A3D63C
gUnknown_08A3D63C:  @ 0x08A3D63C
@ replacing .incbin "baserom.gba", 0x00a3d63c, 0x18
.4byte gUnknown_08A3D5B4 + 0x66
.4byte gUnknown_08A3D5B4 + 0x5e
.4byte gUnknown_08A3D5B4 + 0x56
.4byte gUnknown_08A3D5B4 + 0x4e
.4byte gUnknown_08A3D5B4 + 0x46
.4byte gUnknown_08A3D5B4 + 0x3e

	.global gUnknown_08A3D654
gUnknown_08A3D654:  @ 0x08A3D654
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B75AC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7614
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3D674
gUnknown_08A3D674:  @ 0x08A3D674
@ replacing .incbin "baserom.gba", 0x00a3d674, 0x4
.4byte gTradeMenuText + 0x14

	.global gUnknown_08A3D678
gUnknown_08A3D678:  @ 0x08A3D678
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B7648
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B770C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8014
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B7B30
        @ PROC_SLEEP
        .short 0xe, 0x78
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8168
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D6E0
gUnknown_08A3D6E0:  @ 0x08A3D6E0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B820C
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D700
gUnknown_08A3D700:  @ 0x08A3D700
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_57
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B823C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B8630
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3D728
gUnknown_08A3D728:  @ 0x08A3D728
	.incbin "baserom.gba", 0xA3D728, 0x20

	.global gUnknown_08A3D748
gUnknown_08A3D748:  @ 0x08A3D748
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word WorldMap_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8FD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL_ARG
        .short 0x18, 0x1
        .word sub_8014BD0
        @ PROC_SLEEP
        .short 0xe, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word WorldMap_SetupChapterStuff
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9BA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9D14
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9D04
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9A34
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9DB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9DC4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9D04
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F54
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9A34
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF13C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E80
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B97F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9804
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC454
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B8A7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B8B3C
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B8BA4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B96DC
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9820
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x17
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B987C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B989C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B98A8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xb
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B98F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9918
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9924
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80B9974
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9994
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B99A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xd
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9FD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word Make6C_savemenu2
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x17
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0xe
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_LABEL
        .short 0xb, 0xf
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word WorldMap_InitChapterTransition
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WorldMap_WaitForChapterIntroEvents
        @ PROC_CALL
        .short 0x2, 0x0
        .word WorldMap_HideEverything
        @ PROC_GOTO
        .short 0xc, 0x19
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9A58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9A94
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9AB0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9AEC
        @ PROC_GOTO
        .short 0xc, 0x19
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x11
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9DE0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B9E40
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x12
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF15C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3E94
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BC5B4
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x13
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F14
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x14
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F24
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x15
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F34
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x16
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9810
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9F44
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9154
        @ PROC_GOTO
        .short 0xc, 0x18
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x18
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B982C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_GOTO
        .short 0xc, 0x12
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x17
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B982C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x19
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B9EA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word DoNothing
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD08
gUnknown_08A3DD08:  @ 0x08A3DD08
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA06C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD20
gUnknown_08A3DD20:  @ 0x08A3DD20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA100
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD38
gUnknown_08A3DD38:  @ 0x08A3DD38
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA1F4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD50
gUnknown_08A3DD50:  @ 0x08A3DD50
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word NewWorldMap
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_08A3D748
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_08A20DA4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DD88
gUnknown_08A3DD88:  @ 0x08A3DD88
	.incbin "baserom.gba", 0xA3DD88, 0x6C

	.global gUnknown_08A3DDF4
gUnknown_08A3DDF4:  @ 0x08A3DDF4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f60
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BA61C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BA628
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA3DDF4 + 0x28, 0x90 - 0x28

	.global gUnknown_08A3DE84
gUnknown_08A3DE84:  @ 0x08A3DE84
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f70
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word MapScreen_OnDelete
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapScreen_Init
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BA490
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BA4D0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BAB00
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BAB0C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DECC
gUnknown_08A3DECC:  @ 0x08A3DECC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f84
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapUnit_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapUnit_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapUnit_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DEFC
gUnknown_08A3DEFC:  @ 0x08A3DEFC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f84
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapUnitContainer_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapUnitContainer_Init
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DF2C
gUnknown_08A3DF2C:  @ 0x08A3DF2C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205f90
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapUnitFade_Destruct
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapUnitFade_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapUnitFade_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DF64
gUnknown_08A3DF64:  @ 0x08A3DF64
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820648c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word GmapScreen2_Destruct
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapScreen2_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapScreen2_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DF94
gUnknown_08A3DF94:  @ 0x08A3DF94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82064b0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_59
        @ PROC_CALL
        .short 0x2, 0x0
        .word GmapCursor_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GmapCursor_Destruct
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3DFC4
gUnknown_08A3DFC4:  @ 0x08A3DFC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82067f4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_38
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BBEB8
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BBF60
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word MapRoute_StartTransition
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_80BC0F4
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word MapRoute_EnableBGSyncs
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapRoute_TransitionLoop
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word MapRoute_TransitionEnd
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
@ Replacing .incbin "baserom.gba", 0xA3DFC4 + 0x88, 0x160 - 0x88
    .4byte gUnknown_08206674 + 0x1ac
    .4byte 0x6df0645
    .4byte 0x0
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC4C4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1a4
    .4byte 0x6e00646
    .4byte 0x100
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC4DC
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x19c
    .4byte 0x6e50647
    .4byte 0x200
    .4byte MapMenu_IsGuideCommandAvailable
    .4byte sub_80BC4F4
    .4byte sub_80BC56C
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x194
    .4byte 0x6e10648
    .4byte 0x300
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC584
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x18c
    .4byte 0x6790649
    .4byte 0x400
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC59C
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

	.global gUnknown_08A3E124
gUnknown_08A3E124:  @ 0x08A3E124
@ Replacing .incbin "baserom.gba", 0xA3E124, 0x24
    .4byte 0x60101
    .4byte 0x0
    .4byte gUnknown_08A3DFC4 + 0x88
    .4byte sub_80BC490
    .4byte sub_80BC4A0
    .4byte 0x0
    .4byte sub_80BC4AC
    .4byte MenuAutoHelpBoxSelect
    .4byte MenuStdHelpBox

	.global gUnknown_08A3E148
gUnknown_08A3E148:  @ 0x08A3E148
@ Replacing .incbin "baserom.gba", 0xA3E148, 0xB8
    .4byte 0x70101
    .4byte gUnknown_08206674 + 0x1e4
    .4byte 0x6cf066e
    .4byte 0x0
    .4byte sub_80BC674
    .4byte 0x0
    .4byte sub_80BC77C
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1d4
    .4byte 0x6d0066f
    .4byte 0x100
    .4byte sub_80BC6AC
    .4byte 0x0
    .4byte sub_80BC7A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1c4
    .4byte 0x6d10670
    .4byte 0x200
    .4byte sub_80BC6E4
    .4byte 0x0
    .4byte sub_80BC7CC
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08206674 + 0x1b4
    .4byte 0x6780671
    .4byte 0x300
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_80BC7F4
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

	.global gUnknown_08A3E200
gUnknown_08A3E200:  @ 0x08A3E200
@ Replacing .incbin "baserom.gba", 0xA3E200, 0x24
    .4byte 0x80a14
    .4byte 0x0
    .4byte gUnknown_08A3E148 + 0x4
    .4byte sub_80BC634
    .4byte sub_80BC644
    .4byte 0x0
    .4byte sub_80BC650
    .4byte MenuAutoHelpBoxSelect
    .4byte MenuStdHelpBox

	.global gUnknown_08A3E224
gUnknown_08A3E224:  @ 0x08A3E224
	.incbin "baserom.gba", 0xA3E224, 0x4

	.global gUnknown_08A3E228
gUnknown_08A3E228:  @ 0x08A3E228
	.incbin "baserom.gba", 0xA3E228, 0x4

	.global gUnknown_08A3E22C
gUnknown_08A3E22C:  @ 0x08A3E22C
	.incbin "baserom.gba", 0xA3E22C, 0x10

	.global gUnknown_08A3E23C
gUnknown_08A3E23C:  @ 0x08A3E23C
@ Replacing .incbin "baserom.gba", 0xA3E23C, 0xC
    .4byte 0x8001000
    .4byte 0x1000
    .4byte 0x0

	.global gUnknown_08A3E248
gUnknown_08A3E248:  @ 0x08A3E248
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206870
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_37
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD410
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_70
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD444
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BD830
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD9D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BDA78
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E2C0
gUnknown_08A3E2C0:  @ 0x08A3E2C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206880
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_49
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapMU_FillPrim
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E2F0
gUnknown_08A3E2F0:  @ 0x08A3E2F0
	.incbin "baserom.gba", 0xA3E2F0, 0x8

	.global gUnknown_08A3E2F8
gUnknown_08A3E2F8:  @ 0x08A3E2F8
	.incbin "baserom.gba", 0xA3E2F8, 0x24

	.global gUnknown_08A3E31C
gUnknown_08A3E31C:  @ 0x08A3E31C
	.incbin "baserom.gba", 0xA3E31C, 0x44

	.global gUnknown_08A3E360
gUnknown_08A3E360:  @ 0x08A3E360
	.incbin "baserom.gba", 0xA3E360, 0x2E

	.global gUnknown_08A3E38E
gUnknown_08A3E38E:  @ 0x08A3E38E
	.incbin "baserom.gba", 0xA3E38E, 0x2C

	.global gUnknown_08A3E3BA
gUnknown_08A3E3BA:  @ 0x08A3E3BA
	.incbin "baserom.gba", 0xA3E3BA, 0x58

	.global gUnknown_08A3E412
gUnknown_08A3E412:  @ 0x08A3E412
	.incbin "baserom.gba", 0xA3E412, 0x36

	.global gUnknown_08A3E448
gUnknown_08A3E448:  @ 0x08A3E448
	.incbin "baserom.gba", 0xA3E448, 0x10

	.global gUnknown_08A3E458
gUnknown_08A3E458:  @ 0x08A3E458
	.incbin "baserom.gba", 0xA3E458, 0x3

	.global gUnknown_08A3E45B
gUnknown_08A3E45B:  @ 0x08A3E45B
	.incbin "baserom.gba", 0xA3E45B, 0x3

	.global gUnknown_08A3E45E
gUnknown_08A3E45E:  @ 0x08A3E45E
	.incbin "baserom.gba", 0xA3E45E, 0x3

	.global gUnknown_08A3E461
gUnknown_08A3E461:  @ 0x08A3E461
	.incbin "baserom.gba", 0xA3E461, 0x3

	.global gUnknown_08A3E464
gUnknown_08A3E464:  @ 0x08A3E464
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206888
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BEFB8
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEF6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEBD4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEC58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BECB8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BEDCC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BEDD4
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E4D4
gUnknown_08A3E4D4:  @ 0x08A3E4D4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word DoesBMXFADEExist
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF048
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E4F4
gUnknown_08A3E4F4:  @ 0x08A3E4F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820688c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BF180
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF190
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF198
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E52C
gUnknown_08A3E52C:  @ 0x08A3E52C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068a0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BF2AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF2D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF2D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E55C
gUnknown_08A3E55C:  @ 0x08A3E55C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068b4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_50
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF5C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF5DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E594
gUnknown_08A3E594:  @ 0x08A3E594
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068c4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BF804
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF890
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFA1C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BF8CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BF988
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E5E4
gUnknown_08A3E5E4:  @ 0x08A3E5E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068d4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80BFB4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFB90
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFBCC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BFC44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E624
gUnknown_08A3E624:  @ 0x08A3E624
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068d4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_48
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFD80
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFEF8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0080
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BFFD0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0144
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E6AC
gUnknown_08A3E6AC:  @ 0x08A3E6AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x82068e4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C0308
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C040C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C04CC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E6E4
gUnknown_08A3E6E4:  @ 0x08A3E6E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820690c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_47
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05AC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05C4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05F8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05C4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C05F8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0610
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C06F0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C07B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E78C
gUnknown_08A3E78C:  @ 0x08A3E78C
@ Replacing .incbin "baserom.gba", 0xA3E78C, 0xFC
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte gUnknown_08A3E78C + 0xa8
    .4byte 0x0
    .4byte 0x50a8
    .4byte 0x0
    .4byte sub_80C0A10
    .4byte gUnknown_08A3E78C
    .4byte gUnknown_08A3E78C + 0x38
    .4byte gUnknown_08A3E78C + 0xc4
    .4byte 0x0
    .4byte 0x6e86888
    .4byte 0x0
    .4byte sub_80C0A44
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte gUnknown_08A3E78C + 0x70
    .4byte gUnknown_08A3E78C + 0xe0
    .4byte gUnknown_08A3E78C + 0x54
    .4byte 0x5427888
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte gUnknown_08A3E78C + 0x70
    .4byte gUnknown_08A3E78C + 0x38
    .4byte 0x0
    .4byte 0x54378a8
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x38
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xe0
    .4byte 0x0
    .4byte 0x5448888
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xa8
    .4byte 0x0
    .4byte gUnknown_08A3E78C
    .4byte 0x6763020
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x8c
    .4byte gUnknown_08A3E78C + 0xc4
    .4byte 0x0
    .4byte gUnknown_08A3E78C
    .4byte 0x6774810
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xa8
    .4byte gUnknown_08A3E78C + 0xe0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x1c
    .4byte 0x6f35810
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0xc4
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_08A3E78C + 0x70
    .4byte 0x6f07818
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_08A3E888
gUnknown_08A3E888:  @ 0x08A3E888
	.incbin "baserom.gba", 0xA3E888, 0x18

	.global gUnknown_08A3E8A0
gUnknown_08A3E8A0:  @ 0x08A3E8A0
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0EBC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3E8B8
gUnknown_08A3E8B8:  @ 0x08A3E8B8
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C0E4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0DF0
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0CF4
        @ PROC_CALL
        .short 0x2, 0x0
        .word NewGreenTextColorManager
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0C44
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0E58
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08A3E8A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C0F00
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0FA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MU_EndAll
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA3E8B8 + 0x88, 0xE8 - 0x88

	.global gUnknown_08A3E9A0
gUnknown_08A3E9A0:  @ 0x08A3E9A0
@ Replacing .incbin "baserom.gba", 0xA3E9A0, 0x60
    .4byte gUnknown_08A3E8B8 + 0x88
    .4byte 0xf8f844
    .4byte gUnknown_08A3E8B8 + 0x90
    .4byte 0xf80044
    .4byte gUnknown_08A3E8B8 + 0x98
    .4byte 0xf844
    .4byte gUnknown_08A3E8B8 + 0xa0
    .4byte 0x44
    .4byte gUnknown_08A3E8B8 + 0xa8
    .4byte 0xf0f004
    .4byte gUnknown_08A3E8B8 + 0xb0
    .4byte 0xf00004
    .4byte gUnknown_08A3E8B8 + 0xb8
    .4byte 0xf004
    .4byte gUnknown_08A3E8B8 + 0xc0
    .4byte 0x4
    .4byte gUnknown_08A3E8B8 + 0xc8
    .4byte 0xe0e000
    .4byte gUnknown_08A3E8B8 + 0xd0
    .4byte 0xe00000
    .4byte gUnknown_08A3E8B8 + 0xd8
    .4byte 0xe000
    .4byte gUnknown_08A3E8B8 + 0xe0
    .4byte 0x0

	.global gUnknown_08A3EA00
gUnknown_08A3EA00:  @ 0x08A3EA00
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206920
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C0FB0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C0FE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C10B8
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EA38
gUnknown_08A3EA38:  @ 0x08A3EA38
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206930
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C128C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C12AC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1324
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EA70
gUnknown_08A3EA70:  @ 0x08A3EA70
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x820693c
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C1470
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1480
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1524
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1624
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EAA8
gUnknown_08A3EAA8:  @ 0x08A3EAA8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ab4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_72
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C18EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1920
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1A58
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EAF0
gUnknown_08A3EAF0:  @ 0x08A3EAF0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ac4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1E2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EB10
gUnknown_08A3EB10:  @ 0x08A3EB10
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ac4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C1E40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1E54
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1E70
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C1E8C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EB50
gUnknown_08A3EB50:  @ 0x08A3EB50
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206ad4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C1F6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1FDC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C1FE0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C205C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C20B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C210C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2320
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2094
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2078
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C214C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C224C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2398
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EBE8
gUnknown_08A3EBE8:  @ 0x08A3EBE8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206adc
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2598
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C25B8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C25F8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2658
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EC48
gUnknown_08A3EC48:  @ 0x08A3EC48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b50
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2728
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2750
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2804
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2964
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C29F8
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2A1C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C29F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C28C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C28DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3ECB0
gUnknown_08A3ECB0:  @ 0x08A3ECB0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206adc
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2C54
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2C58
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2D44
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2DA4
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3ED10
gUnknown_08A3ED10:  @ 0x08A3ED10
	.incbin "baserom.gba", 0xA3ED10, 0x8

	.global gUnknown_08A3ED18
gUnknown_08A3ED18:  @ 0x08A3ED18
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b50
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C2E70
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C2EA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2F7C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2F9C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C2F7C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A3ED60
gUnknown_08A3ED60:  @ 0x08A3ED60
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b60
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C3124
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C31A8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31C4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31FC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3220
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3264
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31FC
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3280
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C32E4
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3350
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C31E0
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3244
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3264
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EE28
gUnknown_08A3EE28:  @ 0x08A3EE28
	.incbin "baserom.gba", 0xA3EE28, 0x1C

	.global gUnknown_08A3EE44
gUnknown_08A3EE44:  @ 0x08A3EE44
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C35C4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C35EC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EE6C
gUnknown_08A3EE6C:  @ 0x08A3EE6C
    .incbin "baserom.gba", 0x00a3ee6c, 0x4

	.global gUnknown_08A3EE70
gUnknown_08A3EE70:  @ 0x08A3EE70
	.incbin "baserom.gba", 0xA3EE70, 0x4

	.global gUnknown_08A3EE74
gUnknown_08A3EE74:  @ 0x08A3EE74
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b84
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3D9C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3AB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3D24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3B40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C3D5C
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EED4
gUnknown_08A3EED4:  @ 0x08A3EED4
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3DAC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3EEEC
gUnknown_08A3EEEC:  @ 0x08A3EEEC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206b90
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_71
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3EC8
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3EDC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3F24
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3F88
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3FB4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3FE0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C3F04
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA3EEEC + 0xC8, 0x824 - 0xC8

	.global gUnknown_08A3F710
gUnknown_08A3F710:  @ 0x08A3F710
	.incbin "baserom.gba", 0xA3F710, 0x40

	.global gUnknown_08A3F750
gUnknown_08A3F750:  @ 0x08A3F750
	.incbin "baserom.gba", 0xA3F750, 0x89C

	.global gUnknown_08A3FFEC
gUnknown_08A3FFEC:  @ 0x08A3FFEC
    .incbin "baserom.gba", 0xA3FFEC, 0x7C

	.global gUnknown_08A40068
gUnknown_08A40068:  @ 0x08A40068
	.incbin "baserom.gba", 0xA40068, 0x7C

	.global gUnknown_08A400E4
gUnknown_08A400E4:  @ 0x08A400E4
	.incbin "baserom.gba", 0xA400E4, 0x120

	.global gUnknown_08A40204
gUnknown_08A40204:  @ 0x08A40204
	.incbin "baserom.gba", 0xA40204, 0x148

	.global gUnknown_08A4034C
gUnknown_08A4034C:  @ 0x08A4034C
	.incbin "baserom.gba", 0xA4034C, 0x124

	.global gUnknown_08A40470
gUnknown_08A40470:  @ 0x08A40470
	.incbin "baserom.gba", 0xA40470, 0x144

	.global gUnknown_08A405B4
gUnknown_08A405B4:  @ 0x08A405B4
	.incbin "baserom.gba", 0xA405B4, 0x20

	.global gUnknown_08A405D4
gUnknown_08A405D4:  @ 0x08A405D4
	.incbin "baserom.gba", 0xA405D4, 0x3FC

	.global gUnknown_08A409D0
gUnknown_08A409D0:  @ 0x08A409D0
	.incbin "baserom.gba", 0xA409D0, 0x104

	.global gUnknown_08A40AD4
gUnknown_08A40AD4:  @ 0x08A40AD4
    .incbin "baserom.gba", 0xA40AD4, 0x40

	.global gUnknown_08A40B14
gUnknown_08A40B14:  @ 0x08A40B14
	.incbin "baserom.gba", 0xA40B14, 0x4B4

	.global gUnknown_08A40FC8
gUnknown_08A40FC8:  @ 0x08A40FC8
	.incbin "baserom.gba", 0xA40FC8, 0xBF64

	.global gUnknown_08A4CF2C
gUnknown_08A4CF2C:  @ 0x08A4CF2C
	.incbin "baserom.gba", 0xA4CF2C, 0x1A0

	.global gUnknown_08A4D0CC
gUnknown_08A4D0CC:  @ 0x08A4D0CC
	.incbin "baserom.gba", 0xA4D0CC, 0x11C

	.align 2, 0
	.global cg_0_part_0_tiles
cg_0_part_0_tiles: @8a4d1e8
	.incbin "graphics/cg/cg_0_part_0.4bpp.lz"

	.align 2, 0
	.global cg_0_part_1_tiles
cg_0_part_1_tiles: @8a4d7b8
	.incbin "graphics/cg/cg_0_part_1.4bpp.lz"

	.align 2, 0
	.global cg_0_part_2_tiles
cg_0_part_2_tiles: @8a4dfb8
	.incbin "graphics/cg/cg_0_part_2.4bpp.lz"

	.align 2, 0
	.global cg_0_part_3_tiles
cg_0_part_3_tiles: @8a4e7dc
	.incbin "graphics/cg/cg_0_part_3.4bpp.lz"

	.align 2, 0
	.global cg_0_part_4_tiles
cg_0_part_4_tiles: @8a4f040
	.incbin "graphics/cg/cg_0_part_4.4bpp.lz"

	.align 2, 0
	.global cg_0_part_5_tiles
cg_0_part_5_tiles: @8a4f898
	.incbin "graphics/cg/cg_0_part_5.4bpp.lz"

	.align 2, 0
	.global cg_0_part_6_tiles
cg_0_part_6_tiles: @8a50118
	.incbin "graphics/cg/cg_0_part_6.4bpp.lz"

	.align 2, 0
	.global cg_0_part_7_tiles
cg_0_part_7_tiles: @8a50980
	.incbin "graphics/cg/cg_0_part_7.4bpp.lz"

	.align 2, 0
	.global cg_0_part_8_tiles
cg_0_part_8_tiles: @8a511f0
	.incbin "graphics/cg/cg_0_part_8.4bpp.lz"

	.align 2, 0
	.global cg_0_part_9_tiles
cg_0_part_9_tiles: @8a51a50
	.incbin "graphics/cg/cg_0_part_9.4bpp.lz"

	.align 2, 0
	.global cg_1_part_0_tiles
cg_1_part_0_tiles: @8a52258
	.incbin "graphics/cg/cg_1_part_0.4bpp.lz"

	.align 2, 0
	.global cg_1_part_1_tiles
cg_1_part_1_tiles: @8a529e4
	.incbin "graphics/cg/cg_1_part_1.4bpp.lz"

	.align 2, 0
	.global cg_1_part_2_tiles
cg_1_part_2_tiles: @8a531fc
	.incbin "graphics/cg/cg_1_part_2.4bpp.lz"

	.align 2, 0
	.global cg_1_part_3_tiles
cg_1_part_3_tiles: @8a53a10
	.incbin "graphics/cg/cg_1_part_3.4bpp.lz"

	.align 2, 0
	.global cg_1_part_4_tiles
cg_1_part_4_tiles: @8a5421c
	.incbin "graphics/cg/cg_1_part_4.4bpp.lz"

	.align 2, 0
	.global cg_1_part_5_tiles
cg_1_part_5_tiles: @8a54a30
	.incbin "graphics/cg/cg_1_part_5.4bpp.lz"

	.align 2, 0
	.global cg_1_part_6_tiles
cg_1_part_6_tiles: @8a55274
	.incbin "graphics/cg/cg_1_part_6.4bpp.lz"

	.align 2, 0
	.global cg_1_part_7_tiles
cg_1_part_7_tiles: @8a55a1c
	.incbin "graphics/cg/cg_1_part_7.4bpp.lz"

	.align 2, 0
	.global cg_1_part_8_tiles
cg_1_part_8_tiles: @8a56210
	.incbin "graphics/cg/cg_1_part_8.4bpp.lz"

	.align 2, 0
	.global cg_1_part_9_tiles
cg_1_part_9_tiles: @8a56a24
	.incbin "graphics/cg/cg_1_part_9.4bpp.lz"

	.align 2, 0
	.global cg_2_part_0_tiles
cg_2_part_0_tiles: @8a57200
	.incbin "graphics/cg/cg_2_part_0.4bpp.lz"

	.align 2, 0
	.global cg_2_part_1_tiles
cg_2_part_1_tiles: @8a57a30
	.incbin "graphics/cg/cg_2_part_1.4bpp.lz"

	.align 2, 0
	.global cg_2_part_2_tiles
cg_2_part_2_tiles: @8a58288
	.incbin "graphics/cg/cg_2_part_2.4bpp.lz"

	.align 2, 0
	.global cg_2_part_3_tiles
cg_2_part_3_tiles: @8a58ae4
	.incbin "graphics/cg/cg_2_part_3.4bpp.lz"

	.align 2, 0
	.global cg_2_part_4_tiles
cg_2_part_4_tiles: @8a59358
	.incbin "graphics/cg/cg_2_part_4.4bpp.lz"

	.align 2, 0
	.global cg_2_part_5_tiles
cg_2_part_5_tiles: @8a59bd8
	.incbin "graphics/cg/cg_2_part_5.4bpp.lz"

	.align 2, 0
	.global cg_2_part_6_tiles
cg_2_part_6_tiles: @8a5a434
	.incbin "graphics/cg/cg_2_part_6.4bpp.lz"

	.align 2, 0
	.global cg_2_part_7_tiles
cg_2_part_7_tiles: @8a5ac34
	.incbin "graphics/cg/cg_2_part_7.4bpp.lz"

	.align 2, 0
	.global cg_2_part_8_tiles
cg_2_part_8_tiles: @8a5b390
	.incbin "graphics/cg/cg_2_part_8.4bpp.lz"

	.align 2, 0
	.global cg_2_part_9_tiles
cg_2_part_9_tiles: @8a5bb54
	.incbin "graphics/cg/cg_2_part_9.4bpp.lz"

	.align 2, 0
	.global cg_3_part_0_tiles
cg_3_part_0_tiles: @8a5c350
	.incbin "graphics/cg/cg_3_part_0.4bpp.lz"

	.align 2, 0
	.global cg_3_part_1_tiles
cg_3_part_1_tiles: @8a5cb20
	.incbin "graphics/cg/cg_3_part_1.4bpp.lz"

	.align 2, 0
	.global cg_3_part_2_tiles
cg_3_part_2_tiles: @8a5d2f8
	.incbin "graphics/cg/cg_3_part_2.4bpp.lz"

	.align 2, 0
	.global cg_3_part_3_tiles
cg_3_part_3_tiles: @8a5da70
	.incbin "graphics/cg/cg_3_part_3.4bpp.lz"

	.align 2, 0
	.global cg_3_part_4_tiles
cg_3_part_4_tiles: @8a5e27c
	.incbin "graphics/cg/cg_3_part_4.4bpp.lz"

	.align 2, 0
	.global cg_3_part_5_tiles
cg_3_part_5_tiles: @8a5ea9c
	.incbin "graphics/cg/cg_3_part_5.4bpp.lz"

	.align 2, 0
	.global cg_3_part_6_tiles
cg_3_part_6_tiles: @8a5f2f0
	.incbin "graphics/cg/cg_3_part_6.4bpp.lz"

	.align 2, 0
	.global cg_3_part_7_tiles
cg_3_part_7_tiles: @8a5fb20
	.incbin "graphics/cg/cg_3_part_7.4bpp.lz"

	.align 2, 0
	.global cg_3_part_8_tiles
cg_3_part_8_tiles: @8a602ec
	.incbin "graphics/cg/cg_3_part_8.4bpp.lz"

	.align 2, 0
	.global cg_3_part_9_tiles
cg_3_part_9_tiles: @8a60b24
	.incbin "graphics/cg/cg_3_part_9.4bpp.lz"

	.align 2, 0
	.global cg_4_part_0_tiles
cg_4_part_0_tiles: @8a61388
	.incbin "graphics/cg/cg_4_part_0.4bpp.lz"

	.align 2, 0
	.global cg_4_part_1_tiles
cg_4_part_1_tiles: @8a61bc4
	.incbin "graphics/cg/cg_4_part_1.4bpp.lz"

	.align 2, 0
	.global cg_4_part_2_tiles
cg_4_part_2_tiles: @8a62428
	.incbin "graphics/cg/cg_4_part_2.4bpp.lz"

	.align 2, 0
	.global cg_4_part_3_tiles
cg_4_part_3_tiles: @8a62c8c
	.incbin "graphics/cg/cg_4_part_3.4bpp.lz"

	.align 2, 0
	.global cg_4_part_4_tiles
cg_4_part_4_tiles: @8a634ec
	.incbin "graphics/cg/cg_4_part_4.4bpp.lz"

	.align 2, 0
	.global cg_4_part_5_tiles
cg_4_part_5_tiles: @8a63d64
	.incbin "graphics/cg/cg_4_part_5.4bpp.lz"

	.align 2, 0
	.global cg_4_part_6_tiles
cg_4_part_6_tiles: @8a645d0
	.incbin "graphics/cg/cg_4_part_6.4bpp.lz"

	.align 2, 0
	.global cg_4_part_7_tiles
cg_4_part_7_tiles: @8a64dec
	.incbin "graphics/cg/cg_4_part_7.4bpp.lz"

	.align 2, 0
	.global cg_4_part_8_tiles
cg_4_part_8_tiles: @8a6561c
	.incbin "graphics/cg/cg_4_part_8.4bpp.lz"

	.align 2, 0
	.global cg_4_part_9_tiles
cg_4_part_9_tiles: @8a65e34
	.incbin "graphics/cg/cg_4_part_9.4bpp.lz"

	.align 2, 0
	.global cg_5_part_0_tiles
cg_5_part_0_tiles: @8a66634
	.incbin "graphics/cg/cg_5_part_0.4bpp.lz"

	.align 2, 0
	.global cg_5_part_1_tiles
cg_5_part_1_tiles: @8a66de4
	.incbin "graphics/cg/cg_5_part_1.4bpp.lz"

	.align 2, 0
	.global cg_5_part_2_tiles
cg_5_part_2_tiles: @8a675c8
	.incbin "graphics/cg/cg_5_part_2.4bpp.lz"

	.align 2, 0
	.global cg_5_part_3_tiles
cg_5_part_3_tiles: @8a67dc0
	.incbin "graphics/cg/cg_5_part_3.4bpp.lz"

	.align 2, 0
	.global cg_5_part_4_tiles
cg_5_part_4_tiles: @8a685fc
	.incbin "graphics/cg/cg_5_part_4.4bpp.lz"

	.align 2, 0
	.global cg_5_part_5_tiles
cg_5_part_5_tiles: @8a68e38
	.incbin "graphics/cg/cg_5_part_5.4bpp.lz"

	.align 2, 0
	.global cg_5_part_6_tiles
cg_5_part_6_tiles: @8a69694
	.incbin "graphics/cg/cg_5_part_6.4bpp.lz"

	.align 2, 0
	.global cg_5_part_7_tiles
cg_5_part_7_tiles: @8a69ec4
	.incbin "graphics/cg/cg_5_part_7.4bpp.lz"

	.align 2, 0
	.global cg_5_part_8_tiles
cg_5_part_8_tiles: @8a6a6cc
	.incbin "graphics/cg/cg_5_part_8.4bpp.lz"

	.align 2, 0
	.global cg_5_part_9_tiles
cg_5_part_9_tiles: @8a6ae84
	.incbin "graphics/cg/cg_5_part_9.4bpp.lz"

	.align 2, 0
	.global cg_6_part_0_tiles
cg_6_part_0_tiles: @8a6b5c4
	.incbin "graphics/cg/cg_6_part_0.4bpp.lz"

	.align 2, 0
	.global cg_6_part_1_tiles
cg_6_part_1_tiles: @8a6bdd8
	.incbin "graphics/cg/cg_6_part_1.4bpp.lz"

	.align 2, 0
	.global cg_6_part_2_tiles
cg_6_part_2_tiles: @8a6c62c
	.incbin "graphics/cg/cg_6_part_2.4bpp.lz"

	.align 2, 0
	.global cg_6_part_3_tiles
cg_6_part_3_tiles: @8a6ce80
	.incbin "graphics/cg/cg_6_part_3.4bpp.lz"

	.align 2, 0
	.global cg_6_part_4_tiles
cg_6_part_4_tiles: @8a6d6dc
	.incbin "graphics/cg/cg_6_part_4.4bpp.lz"

	.align 2, 0
	.global cg_6_part_5_tiles
cg_6_part_5_tiles: @8a6df50
	.incbin "graphics/cg/cg_6_part_5.4bpp.lz"

	.align 2, 0
	.global cg_6_part_6_tiles
cg_6_part_6_tiles: @8a6e7cc
	.incbin "graphics/cg/cg_6_part_6.4bpp.lz"

	.align 2, 0
	.global cg_6_part_7_tiles
cg_6_part_7_tiles: @8a6f040
	.incbin "graphics/cg/cg_6_part_7.4bpp.lz"

	.align 2, 0
	.global cg_6_part_8_tiles
cg_6_part_8_tiles: @8a6f894
	.incbin "graphics/cg/cg_6_part_8.4bpp.lz"

	.align 2, 0
	.global cg_6_part_9_tiles
cg_6_part_9_tiles: @8a700e4
	.incbin "graphics/cg/cg_6_part_9.4bpp.lz"

	.align 2, 0
	.global cg_7_part_0_tiles
cg_7_part_0_tiles: @8a708f4
	.incbin "graphics/cg/cg_7_part_0.4bpp.lz"

	.align 2, 0
	.global cg_7_part_1_tiles
cg_7_part_1_tiles: @8a70f04
	.incbin "graphics/cg/cg_7_part_1.4bpp.lz"

	.align 2, 0
	.global cg_7_part_2_tiles
cg_7_part_2_tiles: @8a716e0
	.incbin "graphics/cg/cg_7_part_2.4bpp.lz"

	.align 2, 0
	.global cg_7_part_3_tiles
cg_7_part_3_tiles: @8a71ee4
	.incbin "graphics/cg/cg_7_part_3.4bpp.lz"

	.align 2, 0
	.global cg_7_part_4_tiles
cg_7_part_4_tiles: @8a72718
	.incbin "graphics/cg/cg_7_part_4.4bpp.lz"

	.align 2, 0
	.global cg_7_part_5_tiles
cg_7_part_5_tiles: @8a72f44
	.incbin "graphics/cg/cg_7_part_5.4bpp.lz"

	.align 2, 0
	.global cg_7_part_6_tiles
cg_7_part_6_tiles: @8a737a0
	.incbin "graphics/cg/cg_7_part_6.4bpp.lz"

	.align 2, 0
	.global cg_7_part_7_tiles
cg_7_part_7_tiles: @8a73ff0
	.incbin "graphics/cg/cg_7_part_7.4bpp.lz"

	.align 2, 0
	.global cg_7_part_8_tiles
cg_7_part_8_tiles: @8a7480c
	.incbin "graphics/cg/cg_7_part_8.4bpp.lz"

	.align 2, 0
	.global cg_7_part_9_tiles
cg_7_part_9_tiles: @8a74ff4
	.incbin "graphics/cg/cg_7_part_9.4bpp.lz"

	.align 2, 0
	.global cg_8_part_0_tiles
cg_8_part_0_tiles: @8a75838
	.incbin "graphics/cg/cg_8_part_0.4bpp.lz"

	.align 2, 0
	.global cg_8_part_1_tiles
cg_8_part_1_tiles: @8a75fb0
	.incbin "graphics/cg/cg_8_part_1.4bpp.lz"

	.align 2, 0
	.global cg_8_part_2_tiles
cg_8_part_2_tiles: @8a767fc
	.incbin "graphics/cg/cg_8_part_2.4bpp.lz"

	.align 2, 0
	.global cg_8_part_3_tiles
cg_8_part_3_tiles: @8a77070
	.incbin "graphics/cg/cg_8_part_3.4bpp.lz"

	.align 2, 0
	.global cg_8_part_4_tiles
cg_8_part_4_tiles: @8a778d8
	.incbin "graphics/cg/cg_8_part_4.4bpp.lz"

	.align 2, 0
	.global cg_8_part_5_tiles
cg_8_part_5_tiles: @8a780ec
	.incbin "graphics/cg/cg_8_part_5.4bpp.lz"

	.align 2, 0
	.global cg_8_part_6_tiles
cg_8_part_6_tiles: @8a7892c
	.incbin "graphics/cg/cg_8_part_6.4bpp.lz"

	.align 2, 0
	.global cg_8_part_7_tiles
cg_8_part_7_tiles: @8a79188
	.incbin "graphics/cg/cg_8_part_7.4bpp.lz"

	.align 2, 0
	.global cg_8_part_8_tiles
cg_8_part_8_tiles: @8a799ec
	.incbin "graphics/cg/cg_8_part_8.4bpp.lz"

	.align 2, 0
	.global cg_8_part_9_tiles
cg_8_part_9_tiles: @8a7a218
	.incbin "graphics/cg/cg_8_part_9.4bpp.lz"

	.align 2, 0
	.global cg_9_part_0_tiles
cg_9_part_0_tiles: @8a7aa0c
	.incbin "graphics/cg/cg_9_part_0.4bpp.lz"

	.align 2, 0
	.global cg_9_part_1_tiles
cg_9_part_1_tiles: @8a7b1f4
	.incbin "graphics/cg/cg_9_part_1.4bpp.lz"

	.align 2, 0
	.global cg_9_part_2_tiles
cg_9_part_2_tiles: @8a7ba2c
	.incbin "graphics/cg/cg_9_part_2.4bpp.lz"

	.align 2, 0
	.global cg_9_part_3_tiles
cg_9_part_3_tiles: @8a7c280
	.incbin "graphics/cg/cg_9_part_3.4bpp.lz"

	.align 2, 0
	.global cg_9_part_4_tiles
cg_9_part_4_tiles: @8a7cad0
	.incbin "graphics/cg/cg_9_part_4.4bpp.lz"

	.align 2, 0
	.global cg_9_part_5_tiles
cg_9_part_5_tiles: @8a7d324
	.incbin "graphics/cg/cg_9_part_5.4bpp.lz"

	.align 2, 0
	.global cg_9_part_6_tiles
cg_9_part_6_tiles: @8a7db70
	.incbin "graphics/cg/cg_9_part_6.4bpp.lz"

	.align 2, 0
	.global cg_9_part_7_tiles
cg_9_part_7_tiles: @8a7e3e0
	.incbin "graphics/cg/cg_9_part_7.4bpp.lz"

	.align 2, 0
	.global cg_9_part_8_tiles
cg_9_part_8_tiles: @8a7ec3c
	.incbin "graphics/cg/cg_9_part_8.4bpp.lz"

	.align 2, 0
	.global cg_9_part_9_tiles
cg_9_part_9_tiles: @8a7f494
	.incbin "graphics/cg/cg_9_part_9.4bpp.lz"

	.align 2, 0
	.global cg_0_map
cg_0_map: @8a7fcdc
	.incbin "graphics/cg/cg_0.bin"

	.align 2, 0
	.global cg_1_map
cg_1_map: @8a80190
	.incbin "graphics/cg/cg_1.bin"

	.align 2, 0
	.global cg_2_map
cg_2_map: @8a80644
	.incbin "graphics/cg/cg_2.bin"

	.align 2, 0
	.global cg_3_map
cg_3_map: @8a80af8
	.incbin "graphics/cg/cg_3.bin"

	.align 2, 0
	.global cg_4_map
cg_4_map: @8a80fac
	.incbin "graphics/cg/cg_4.bin"

	.align 2, 0
	.global cg_5_map
cg_5_map: @8a81460
	.incbin "graphics/cg/cg_5.bin"

	.align 2, 0
	.global cg_6_map
cg_6_map: @8a81914
	.incbin "graphics/cg/cg_6.bin"

	.align 2, 0
	.global cg_7_map
cg_7_map: @8a81dc8
	.incbin "graphics/cg/cg_7.bin"

	.align 2, 0
	.global cg_8_map
cg_8_map: @8a8227c
	.incbin "graphics/cg/cg_8.bin"

	.align 2, 0
	.global cg_9_map
cg_9_map: @8a82730
	.incbin "graphics/cg/cg_9.bin"

	.align 2, 0
	.global cg_0_palette
cg_0_palette: @8a82be4
	.incbin "graphics/cg/cg_0.gbapal"

	.align 2, 0
	.global cg_1_palette
cg_1_palette: @8a82ca4
	.incbin "graphics/cg/cg_1.gbapal"

	.align 2, 0
	.global cg_2_palette
cg_2_palette: @8a82d64
	.incbin "graphics/cg/cg_2.gbapal"

	.align 2, 0
	.global cg_3_palette
cg_3_palette: @8a82e24
	.incbin "graphics/cg/cg_3.gbapal"

	.align 2, 0
	.global cg_4_palette
cg_4_palette: @8a82ee4
	.incbin "graphics/cg/cg_4.gbapal"

	.align 2, 0
	.global cg_5_palette
cg_5_palette: @8a82fa4
	.incbin "graphics/cg/cg_5.gbapal"

	.align 2, 0
	.global cg_6_palette
cg_6_palette: @8a83064
	.incbin "graphics/cg/cg_6.gbapal"

	.align 2, 0
	.global cg_7_palette
cg_7_palette: @8a83124
	.incbin "graphics/cg/cg_7.gbapal"

	.align 2, 0
	.global cg_8_palette
cg_8_palette: @8a831e4
	.incbin "graphics/cg/cg_8.gbapal"

	.align 2, 0
	.global cg_9_palette
cg_9_palette: @8a832a4
	.incbin "graphics/cg/cg_9.gbapal"

	.global gUnknown_08A83364
gUnknown_08A83364:  @ 0x08A83364
	.incbin "baserom.gba", 0xA83364, 0x12C00

	.global gUnknown_08A95F64
gUnknown_08A95F64:  @ 0x08A95F64
	.incbin "baserom.gba", 0xA95F64, 0x80

	.global gUnknown_08A95FE4
gUnknown_08A95FE4:  @ 0x08A95FE4
	.incbin "baserom.gba", 0xA95FE4, 0x80

	.global gUnknown_08A96064
gUnknown_08A96064:  @ 0x08A96064
	.incbin "baserom.gba", 0xA96064, 0x2A4

	.global gUnknown_08A96308
gUnknown_08A96308:  @ 0x08A96308
	.incbin "baserom.gba", 0xA96308, 0x1108

	.global gUnknown_08A97410
gUnknown_08A97410:  @ 0x08A97410
	.incbin "baserom.gba", 0xA97410, 0x630

	.global gUnknown_08A97A40
gUnknown_08A97A40:  @ 0x08A97A40
	.incbin "baserom.gba", 0xA97A40, 0x20

	.global gUnknown_08A97A60
gUnknown_08A97A60:  @ 0x08A97A60
	.incbin "baserom.gba", 0xA97A60, 0x20

	.global gUnknown_08A97A80
gUnknown_08A97A80:  @ 0x08A97A80
	.incbin "baserom.gba", 0xA97A80, 0x4C

	.global gUnknown_08A97ACC
gUnknown_08A97ACC:  @ 0x08A97ACC
	.incbin "baserom.gba", 0xA97ACC, 0x20

	.global gUnknown_08A97AEC
gUnknown_08A97AEC:  @ 0x08A97AEC
	.incbin "baserom.gba", 0xA97AEC, 0x1AC

	.global gUnknown_08A97C98
gUnknown_08A97C98:  @ 0x08A97C98
	.incbin "baserom.gba", 0xA97C98, 0x190

	.global gUnknown_08A97E28
gUnknown_08A97E28:  @ 0x08A97E28
	.incbin "baserom.gba", 0xA97E28, 0x20

	.global gUnknown_08A97E48
gUnknown_08A97E48:  @ 0x08A97E48
	.incbin "baserom.gba", 0xA97E48, 0x90

	.global gUnknown_08A97ED8
gUnknown_08A97ED8:  @ 0x08A97ED8
	.incbin "baserom.gba", 0xA97ED8, 0xCC

	.global gUnknown_08A97FA4
gUnknown_08A97FA4:  @ 0x08A97FA4
	.incbin "baserom.gba", 0xA97FA4, 0x71C

	.global gUnknown_08A986C0
gUnknown_08A986C0:  @ 0x08A986C0
	.incbin "baserom.gba", 0xA986C0, 0x538

	.global gUnknown_08A98BF8
gUnknown_08A98BF8:  @ 0x08A98BF8
	.incbin "baserom.gba", 0xA98BF8, 0x104

	.global gUnknown_08A98CFC
gUnknown_08A98CFC:  @ 0x08A98CFC
	.incbin "baserom.gba", 0xA98CFC, 0x5C

	.global gUnknown_08A98D58
gUnknown_08A98D58:  @ 0x08A98D58
	.incbin "baserom.gba", 0xA98D58, 0x30

	.global gUnknown_08A98D88
gUnknown_08A98D88:  @ 0x08A98D88
	.incbin "baserom.gba", 0xA98D88, 0x18

	.global gUnknown_08A98DA0
gUnknown_08A98DA0:  @ 0x08A98DA0
	.incbin "baserom.gba", 0xA98DA0, 0x18

	.global gUnknown_08A98DB8
gUnknown_08A98DB8:  @ 0x08A98DB8
	.incbin "baserom.gba", 0xA98DB8, 0x14

	.global gUnknown_08A98DCC
gUnknown_08A98DCC:  @ 0x08A98DCC
	.incbin "baserom.gba", 0xA98DCC, 0x60

	.global gUnknown_08A98E2C
gUnknown_08A98E2C:  @ 0x08A98E2C
	.incbin "baserom.gba", 0xA98E2C, 0x20

	.global gUnknown_08A98E4C
gUnknown_08A98E4C:  @ 0x08A98E4C
    .incbin "baserom.gba", 0xA98E4C, 0x20

	.global gUnknown_08A98E6C
gUnknown_08A98E6C:  @ 0x08A98E6C
	.incbin "baserom.gba", 0xA98E6C, 0x20

	.global gUnknown_08A98E8C
gUnknown_08A98E8C:  @ 0x08A98E8C
	.incbin "baserom.gba", 0xA98E8C, 0x20

	.global gUnknown_08A98EAC
gUnknown_08A98EAC:  @ 0x08A98EAC
	.incbin "baserom.gba", 0xA98EAC, 0x84

	.global gUnknown_08A98F30
gUnknown_08A98F30:  @ 0x08A98F30
	.incbin "baserom.gba", 0xA98F30, 0xEC

	.global gUnknown_08A9901C
gUnknown_08A9901C:  @ 0x08A9901C
	.incbin "baserom.gba", 0xA9901C, 0x104

	.global gUnknown_08A99120
gUnknown_08A99120:  @ 0x08A99120
	.incbin "baserom.gba", 0xA99120, 0x20

	.global gUnknown_08A99140
gUnknown_08A99140:  @ 0x08A99140
	.incbin "baserom.gba", 0xA99140, 0x4E34

	.global gUnknown_08A9DF74
gUnknown_08A9DF74:  @ 0x08A9DF74
	.incbin "baserom.gba", 0xA9DF74, 0x550

	.global gUnknown_08A9E4C4
gUnknown_08A9E4C4:  @ 0x08A9E4C4
	.incbin "baserom.gba", 0xA9E4C4, 0x80

	.global gUnknown_08A9E544
gUnknown_08A9E544:  @ 0x08A9E544
	.incbin "baserom.gba", 0xA9E544, 0x78

	.global gUnknown_08A9E5BC
gUnknown_08A9E5BC:  @ 0x08A9E5BC
	.incbin "baserom.gba", 0xA9E5BC, 0x20

	.global gUnknown_08A9E5DC
gUnknown_08A9E5DC:  @ 0x08A9E5DC
	.incbin "baserom.gba", 0xA9E5DC, 0xAC

	.global gUnknown_08A9E688
gUnknown_08A9E688:  @ 0x08A9E688
	.incbin "baserom.gba", 0xA9E688, 0x2AC4

	.global gUnknown_08AA114C
gUnknown_08AA114C:  @ 0x08AA114C
	.incbin "baserom.gba", 0xAA114C, 0x44

	.global gUnknown_08AA1190
gUnknown_08AA1190:  @ 0x08AA1190
	.incbin "baserom.gba", 0xAA1190, 0x20

	.global gUnknown_08AA11B0
gUnknown_08AA11B0:  @ 0x08AA11B0
	.incbin "baserom.gba", 0xAA11B0, 0x20

	.global gUnknown_08AA11D0
gUnknown_08AA11D0:  @ 0x08AA11D0
	.incbin "baserom.gba", 0xAA11D0, 0xB0

	.global gUnknown_08AA1280
gUnknown_08AA1280:  @ 0x08AA1280
	.incbin "baserom.gba", 0xAA1280, 0x60C

	.global gUnknown_08AA188C
gUnknown_08AA188C:  @ 0x08AA188C
	.incbin "baserom.gba", 0xAA188C, 0x20

	.global gUnknown_08AA18AC
gUnknown_08AA18AC:  @ 0x08AA18AC
	.incbin "baserom.gba", 0xAA18AC, 0x84

	.global gUnknown_08AA1930
gUnknown_08AA1930:  @ 0x08AA1930
	.incbin "baserom.gba", 0xAA1930, 0x20

	.global gUnknown_08AA1950
gUnknown_08AA1950:  @ 0x08AA1950
	.incbin "baserom.gba", 0xAA1950, 0x20

	.global gUnknown_08AA1970
gUnknown_08AA1970:  @ 0x08AA1970
	.incbin "baserom.gba", 0xAA1970, 0x300

	.global gUnknown_08AA1C70
gUnknown_08AA1C70:  @ 0x08AA1C70
	.incbin "baserom.gba", 0xAA1C70, 0x3D4

	.global gUnknown_08AA2044
gUnknown_08AA2044:  @ 0x08AA2044
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C40B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C40B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C412C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4158
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4184
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C41E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA2084
gUnknown_08AA2084:  @ 0x08AA2084
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4460
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C4664
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C46E4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C46F0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C4738
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x10
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C47B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word WaitForFade
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C47F4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
