    .section .data

	.global ProcScr_TacticianNameSelection
ProcScr_TacticianNameSelection:  @ 0x085A9614
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Tactician_InitScreen
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Tactician_Loop
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8044FE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8044FFC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804503C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045068
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word NameSelect_DrawName
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045108
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Set_0203DDDC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80451F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
