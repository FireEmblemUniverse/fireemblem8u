    .section .data

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


	.global ProcScr_SysHandCtrlMaybe
ProcScr_SysHandCtrlMaybe:  @ 0x08A20C1C
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


	.global gSoundRoomTable
gSoundRoomTable:  @ 0x08A20E74
	.incbin "baserom.gba", 0xA20E74, 0x460

	.global gUnknown_08A212D4
gUnknown_08A212D4:  @ 0x08A212D4
@ replacing .incbin "baserom.gba", 0x00a212d4, 0x4
.4byte gGenericBuffer

	.global gUnknown_08A212D8
gUnknown_08A212D8:  @ 0x08A212D8
@ replacing .incbin "baserom.gba", 0x00a212d8, 0x4
.4byte gGenericBuffer+0x800

	.global gUnknown_08A212DC
gUnknown_08A212DC:  @ 0x08A212DC
@ replacing .incbin "baserom.gba", 0x00a212dc, 0x4
.4byte gGenericBuffer+0x1000

	.global gUnknown_08A212E0
gUnknown_08A212E0:  @ 0x08A212E0
@ replacing .incbin "baserom.gba", 0x00a212e0, 0x4
.4byte gGenericBuffer+0x1200

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
