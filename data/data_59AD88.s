    .section .data

	.global gUnknown_0859AEC8
gUnknown_0859AEC8:  @ 0x0859AEC8
	.incbin "baserom.gba", 0x59AEC8, 0x20

	.global gProcScr_PhaseIntroSquares
gProcScr_PhaseIntroSquares:  @ 0x0859AEE8
        @ PROC_CALL
        .short 0x2, 0x0
        .word PhaseIntroSquares_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PhaseIntroSquares_InLoop

	.global gProcScr_PhaseIntroText
gProcScr_PhaseIntroText:  @ 0x0859AEF8
        @ PROC_CALL
        .short 0x2, 0x0
        .word PhaseIntroText_Init
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word PhaseIntroText_PutText
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroSquares
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PhaseIntroText_InLoop
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PhaseIntroText_OutLoop
        @ PROC_CALL
        .short 0x2, 0x0
        .word PhaseIntroText_Clear
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gProcScr_PhaseIntroBlendBox
gProcScr_PhaseIntroBlendBox:  @ 0x0859AF40
        @ PROC_CALL
        .short 0x2, 0x0
        .word PhaseIntroBlendBox_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PhaseIntroBlendBox_InLoop
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word PhaseIntroBlendBox_OutLoop
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
        .word gProcScr_PhaseIntroText
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gProcScr_PhaseIntroBlendBox
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

