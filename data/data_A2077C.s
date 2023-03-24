    .section .data

	.incbin "baserom.gba", 0xA2077C, 0x220

	.global gUnknown_08A2099C
gUnknown_08A2099C:  @ 0x08A2099C
@ replacing .incbin "baserom.gba", 0x00a2099c, 0x1c
.4byte gProcScr_SaveBgUp + 0xee
.4byte gProcScr_SaveBgUp + 0x108
.4byte gProcScr_SaveBgUp + 0x122
.4byte gProcScr_SaveBgUp + 0x13c
.4byte gProcScr_SaveBgUp + 0x156
.4byte gProcScr_SaveBgUp + 0x170
.4byte gProcScr_SaveBgUp + 0x18a

	.global gUnknown_08A209B8
gUnknown_08A209B8:  @ 0x08A209B8
@ replacing .incbin "baserom.gba", 0x00a209b8, 0x2c
.4byte gProcScr_SaveBgUp + 0x20
.4byte gProcScr_SaveBgUp + 0x3a
.4byte gProcScr_SaveBgUp + 0x54
.4byte gProcScr_SaveBgUp + 0x68
.4byte gProcScr_SaveBgUp + 0x82
.4byte gProcScr_SaveBgUp + 0x96
.4byte gProcScr_SaveBgUp + 0xa4
.4byte gProcScr_SaveBgUp + 0x3a
.4byte gProcScr_SaveBgUp + 0xcc
.4byte gProcScr_SaveBgUp + 0xe6
.4byte gProcScr_SaveBgUp + 0xb2

	.global gUnknown_08A209E4
gUnknown_08A209E4:  @ 0x08A209E4
@ replacing .incbin "baserom.gba", 0x00a209e4, 0xc
.4byte gProcScr_SaveBgUp + 0x1ce
.4byte gProcScr_SaveBgUp + 0x1f4
.4byte gProcScr_SaveBgUp + 0x21a

	.global gUnknown_08A209F0
gUnknown_08A209F0:  @ 0x08A209F0
@ replacing .incbin "baserom.gba", 0x00a209f0, 0xc
.4byte gProcScr_SaveBgUp + 0x192
.4byte gProcScr_SaveBgUp + 0x1a6
.4byte gProcScr_SaveBgUp + 0x1ba

	.global gUnknown_08A209FC
gUnknown_08A209FC:  @ 0x08A209FC
	.incbin "baserom.gba", 0xA209FC, 0xC

	.global gUnknown_08A20A08
gUnknown_08A20A08:  @ 0x08A20A08
	.incbin "baserom.gba", 0xA20A08, 0x8

	.global ProcScr_NewGameDiffilcultySelect
ProcScr_NewGameDiffilcultySelect:  @ 0x08A20A10
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80AC078
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD5B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AC1A8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnableAllGfx
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AC288
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL_ARG
        .short 0x18, 0x8
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_64
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20A98
gUnknown_08A20A98:  @ 0x08A20A98
	.incbin "baserom.gba", 0xA20A98, 0x8

	.global gUnknown_08A20AA0
gUnknown_08A20AA0:  @ 0x08A20AA0
	.incbin "baserom.gba", 0xA20AA0, 0xE

	.global gUnknown_08A20AAE
gUnknown_08A20AAE:  @ 0x08A20AAE
    .incbin "baserom.gba", 0xA20AAE, 0x14

	.global gUnknown_08A20AC2
gUnknown_08A20AC2:  @ 0x08A20AC2
	.incbin "baserom.gba", 0xA20AC2, 0x46

	.global gUnknown_08A20B08
gUnknown_08A20B08:  @ 0x08A20B08
@ replacing .incbin "baserom.gba", 0x00a20b08, 0xc
.4byte gUnknown_08A20AC2 + 0xe
.4byte gUnknown_08A20AC2 + 0x22
.4byte gUnknown_08A20AC2 + 0x30

	.global gUnknown_08A20B14
gUnknown_08A20B14:  @ 0x08A20B14
	.incbin "baserom.gba", 0xA20B14, 0x8

	.global gUnknown_08A20B1C
gUnknown_08A20B1C:  @ 0x08A20B1C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AC3F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AC588
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20B3C
gUnknown_08A20B3C:  @ 0x08A20B3C
	.incbin "baserom.gba", 0xA20B3C, 0x8

	.global gUnknown_08A20B44
gUnknown_08A20B44:  @ 0x08A20B44
	.incbin "baserom.gba", 0xA20B44, 0x8

	.global gUnknown_08A20B4C
gUnknown_08A20B4C:  @ 0x08A20B4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AC904
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AC930
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20B7C
gUnknown_08A20B7C:  @ 0x08A20B7C
	.incbin "baserom.gba", 0xA20B7C, 0xE

	.global gUnknown_08A20B8A
gUnknown_08A20B8A:  @ 0x08A20B8A
	.incbin "baserom.gba", 0xA20B8A, 0xA

	.global gUnknown_08A20B94
gUnknown_08A20B94:  @ 0x08A20B94
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ACB14
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ACB34
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ParallelFiniteLoop
ProcScr_ParallelFiniteLoop:  @ 0x08A20BB4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ACDF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ACDF8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20BD4
gUnknown_08A20BD4:  @ 0x08A20BD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ACE3C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ACE54
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ParallelWorker
ProcScr_ParallelWorker:  @ 0x08A20C04
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ParallelWorker_OnLoop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20C1C
gUnknown_08A20C1C:  @ 0x08A20C1C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD434
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AD43C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20C4C
gUnknown_08A20C4C:  @ 0x08A20C4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AD5F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AD610
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA20C4C + 0x18, 0x120 - 0x18

	.global gUnknown_08A20D6C
gUnknown_08A20D6C:  @ 0x08A20D6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80ADA24
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ADA3C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20D8C
gUnknown_08A20D8C:  @ 0x08A20D8C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80ADCA4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20DA4
gUnknown_08A20DA4:  @ 0x08A20DA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_DisableGfx
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word FadeIn_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20DCC
gUnknown_08A20DCC:  @ 0x08A20DCC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnableAllGfx
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word FadeOut_Loop
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInOut_DisableGfx
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20DFC
gUnknown_08A20DFC:  @ 0x08A20DFC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AE4D8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AE518
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AE71C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20E24
gUnknown_08A20E24:  @ 0x08A20E24
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AE930
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AE938
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20E44
gUnknown_08A20E44:  @ 0x08A20E44
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AEB60
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AEB8C
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A20E74
gUnknown_08A20E74:  @ 0x08A20E74
	.incbin "baserom.gba", 0xA20E74, 0x460

	.global gUnknown_08A212D4
gUnknown_08A212D4:  @ 0x08A212D4
@ replacing .incbin "baserom.gba", 0x00a212d4, 0x4
.4byte gGenericBuffer

	.global gUnknown_08A212D8
gUnknown_08A212D8:  @ 0x08A212D8
@ replacing .incbin "baserom.gba", 0x00a212d8, 0x4
.4byte gUnknown_02020988

	.global gUnknown_08A212DC
gUnknown_08A212DC:  @ 0x08A212DC
@ replacing .incbin "baserom.gba", 0x00a212dc, 0x4
.4byte gUnknown_02021188

	.global gUnknown_08A212E0
gUnknown_08A212E0:  @ 0x08A212E0
@ replacing .incbin "baserom.gba", 0x00a212e0, 0x4
.4byte gUnknown_02021188 + 0x200

	.global gUnknown_08A212E4
gUnknown_08A212E4:  @ 0x08A212E4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AEEC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AEEE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21304
gUnknown_08A21304:  @ 0x08A21304
@ replacing .incbin "baserom.gba", 0x00a21304, 0x4
.4byte gSoundInfo

	.global gUnknown_08A21308
gUnknown_08A21308:  @ 0x08A21308
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AF220
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_65
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AF22C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21338
gUnknown_08A21338:  @ 0x08A21338
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AF524
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeIn
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeInExists
        @ PROC_WHILE
        .short 0x14, 0x0
        .word MusicProc4Exists
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AF8A0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFBBC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFC60
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFC98
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFCE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFCF8
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFBBC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFC60
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFD48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFD5C
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFDF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFE8C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFCE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFCF8
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AFA64
        @ PROC_CALL_ARG
        .short 0x18, 0x4
        .word NewFadeOut
        @ PROC_WHILE
        .short 0x14, 0x0
        .word FadeOutExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AFA94
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21440
gUnknown_08A21440:  @ 0x08A21440
	.incbin "baserom.gba", 0xA21440, 0xE

	.global gUnknown_08A2144E
gUnknown_08A2144E:  @ 0x08A2144E
	.incbin "baserom.gba", 0xA2144E, 0xE

	.global gUnknown_08A2145C
gUnknown_08A2145C:  @ 0x08A2145C
	.incbin "baserom.gba", 0xA2145C, 0xE

	.global gUnknown_08A2146A
gUnknown_08A2146A:  @ 0x08A2146A
	.incbin "baserom.gba", 0xA2146A, 0x20

	.global gUnknown_08A2148A
gUnknown_08A2148A:  @ 0x08A2148A
	.incbin "baserom.gba", 0xA2148A, 0x14

	.global gUnknown_08A2149E
gUnknown_08A2149E:  @ 0x08A2149E
	.incbin "baserom.gba", 0xA2149E, 0x8

	.global gUnknown_08A214A6
gUnknown_08A214A6:  @ 0x08A214A6
	.incbin "baserom.gba", 0xA214A6, 0x8

	.global gUnknown_08A214AE
gUnknown_08A214AE:  @ 0x08A214AE
	.incbin "baserom.gba", 0xA214AE, 0x5A

	.global gUnknown_08A21508
gUnknown_08A21508:  @ 0x08A21508
@ replacing .incbin "baserom.gba", 0x00a21508, 0x28
.4byte gUnknown_08A214AE + 0x8
.4byte gUnknown_08A214AE + 0x10
.4byte gUnknown_08A214AE + 0x18
.4byte gUnknown_08A214AE + 0x20
.4byte gUnknown_08A214AE + 0x28
.4byte gUnknown_08A214AE + 0x30
.4byte gUnknown_08A214AE + 0x38
.4byte gUnknown_08A214AE + 0x40
.4byte gUnknown_08A214AE + 0x48
.4byte gUnknown_08A214AE + 0x50

	.global gUnknown_08A21530
gUnknown_08A21530:  @ 0x08A21530
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B031C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B0324
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A21550
gUnknown_08A21550:  @ 0x08A21550
	.incbin "baserom.gba", 0xA21550, 0x18

	.global gUnknown_08A21568
gUnknown_08A21568:  @ 0x08A21568
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B04BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B04F8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_66
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B05C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
