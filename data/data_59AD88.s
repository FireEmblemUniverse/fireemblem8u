    .section .data

	.global ProcScr_Popup2
ProcScr_Popup2:  @ 0x0859B0C0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ProcPopup2_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ProcPopup2_Loop
        @ PROC_CALL
        .short 0x2, 0x0
        .word ClearBg0Bg1
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

