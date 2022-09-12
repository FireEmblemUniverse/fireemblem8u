    .section .data

	.global gUnknown_0859ADC8
gUnknown_0859ADC8:  @ 0x0859ADC8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d7b18
        @ PROC_END_IF_DUPLICATE
        .short 0x11, 0x0
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word Destruct6CBMXFADE
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801DD1C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801DD54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801DD54
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AE00
gUnknown_0859AE00:  @ 0x0859AE00
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801DEF0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProcScr_ADJUSTSFROMXI
gProcScr_ADJUSTSFROMXI:  @ 0x0859AE18
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d7b20
        @ PROC_CALL
        .short 0x2, 0x0
        .word ADJUSTFROMXI_MoveCameraOnSomeUnit
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AE38
gUnknown_0859AE38:  @ 0x0859AE38
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_801DF94
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_801DFDC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_801E008
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word sub_801E018
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801E02C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801E048
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AE88
gUnknown_0859AE88:  @ 0x0859AE88
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801E4F4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AEA0
gUnknown_0859AEA0:  @ 0x0859AEA0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801EA64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801EAE8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801EBE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AEC8
gUnknown_0859AEC8:  @ 0x0859AEC8
	.incbin "baserom.gba", 0x59AEC8, 0x20

	.global gUnknown_0859AEE8
gUnknown_0859AEE8:  @ 0x0859AEE8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801EE98
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801EEA8

	.global gUnknown_0859AEF8
gUnknown_0859AEF8:  @ 0x0859AEF8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801ED58
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801ED30
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_0859AEE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801ED94
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801EE08
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801EE80
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_0859AF40
gUnknown_0859AF40:  @ 0x0859AF40
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801EFE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801EFF0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801F0C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AF60
gUnknown_0859AF60:  @ 0x0859AF60
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F198
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801F1A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801F228
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859AF80
gUnknown_0859AF80:  @ 0x0859AF80
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F2AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F2CC
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_0859AEF8
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_0859AF40
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_0859AF60
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F3A8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801F490
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80160D0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


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

