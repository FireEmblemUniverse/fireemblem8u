     .section .data

     .global gUnknown_0859A9D8
 gUnknown_0859A9D8:  @ 0x0859A9D8
     .incbin "baserom.gba", 0x59A9D8, 0x14

     .global gUnknown_0859A9EC
 gUnknown_0859A9EC:  @ 0x0859A9EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_WaitForSelectPress
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SetNewKeyStatusWith16
        @ PROC_SLEEP
        .short 0xe, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SetNewKeyStatusWith16
        @ PROC_SLEEP
        .short 0xe, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SetNewKeyStatusWith16
        @ PROC_SLEEP
        .short 0xe, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SetNewKeyStatusWith16
        @ PROC_SLEEP
        .short 0xe, 0xc
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SetNewKeyStatusWith16
        @ PROC_SLEEP
        .short 0xe, 0xc
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

     .global gUnknown_0859AA5C
 gUnknown_0859AA5C:  @ 0x0859AA5C
     .incbin "baserom.gba", 0x59AA5C, 0x8

