    .section .data

	.global gUnknown_08A2EE90
gUnknown_08A2EE90:  @ 0x08A2EE90
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e74
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80B24DC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B251C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2EEC0
gUnknown_08A2EEC0:  @ 0x08A2EEC0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205e80
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_67
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80B2608
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
