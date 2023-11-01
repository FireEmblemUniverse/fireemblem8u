    .section .data

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
