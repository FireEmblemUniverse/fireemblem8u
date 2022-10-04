    .section .data

	.global gUnknown_0859AFC8
gUnknown_0859AFC8:  @ 0x0859AFC8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F540
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AFE8
gUnknown_0859AFE8:  @ 0x0859AFE8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F630
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B008
gUnknown_0859B008:  @ 0x0859B008
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F6EC
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x64
        .word 0x0
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B048
gUnknown_0859B048:  @ 0x0859B048
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F7D8
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_SLEEP
        .short 0xe, 0xf
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B070
gUnknown_0859B070:  @ 0x0859B070
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F860
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_0859A548
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F88C
        @ PROC_WHILE
        .short 0x14, 0x0
        .word DoesBMXFADEExist
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B0A0
gUnknown_0859B0A0:  @ 0x0859B0A0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F904
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B0C0
gUnknown_0859B0C0:  @ 0x0859B0C0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F9C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801F9CC
        @ PROC_CALL
        .short 0x2, 0x0
        .word ClearBg0Bg1
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

