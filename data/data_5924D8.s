    .section .data

	.global gUnknown_08592568
gUnknown_08592568:  @ 0x08592568
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80126BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592580
gUnknown_08592580:  @ 0x08592580
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012A2C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012A64
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012AC0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E79C
        @ PROC_SLEEP
        .short 0xe, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E7C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_BoomFogFx
ProcScr_BoomFogFx:  @ 0x085925D0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807CE18
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085925F0
gUnknown_085925F0:  @ 0x085925F0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012B9C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
