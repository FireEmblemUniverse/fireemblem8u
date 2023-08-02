    .section .data

	.global gUnknown_08A3D728
gUnknown_08A3D728:  @ 0x08A3D728
	.incbin "baserom.gba", 0xA3D728, 0x20

	.global gProcScr_WorldMapMain
gProcScr_WorldMapMain:  @ 0x08A3D748
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
        .word StartWMGeneralMenu
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
        .word StartFastFadeToBlack
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
        .word StartFastFadeToBlack
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
        .word StartFastFadeFromBlack
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
        .word StartFastFadeToBlack
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
        .word StartFastFadeFromBlack
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
        .word StartFastFadeToBlack
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
        .word StartFastFadeFromBlack
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
        .word StartFastFadeToBlack
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
        .word StartWMNodeMenu
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
        .word StartFastFadeFromBlack
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
        .word StartFastFadeFromBlack
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
        .word gProcScr_WorldMapMain
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
