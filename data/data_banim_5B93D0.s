	.section .data

	.global gProc_efxFarAttack
gProc_efxFarAttack:  @ 0x085B97C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80da4ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80534E4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053514
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053584
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_efxQuakePure
gProc_efxQuakePure:  @ 0x085B97EC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabc0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80536B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085B9804
gUnknown_085B9804:  @ 0x085B9804
    .4byte gUnknown_080DA4BA
    .4byte 0
    .4byte gEfxQuakeVecs
    .4byte 0
    .4byte gUnknown_080DA526
    .4byte 0
    .4byte gEfxQuakeVecs2
    .4byte 0
    .4byte gUnknown_080DA5BA
    .4byte 0
    .4byte gUnknown_080DA604
    .4byte 0
    .4byte gUnknown_080DA66E + 0xb2
    .4byte 0
    .4byte gUnknown_080DA66E + 0xc4
    .4byte 0
    .4byte gUnknown_080DA66E + 0xe6
    .4byte 0
    .4byte gUnknown_080DA66E + 0xf8
    .4byte 0
    .4byte gUnknown_080DA66E + 0x10a
    .4byte 0
    .4byte gUnknown_080DA66E + 0x11c
    .4byte 0
    .4byte gUnknown_080DA66E + 0x1d2
    .4byte 0
    .4byte gUnknown_080DA66E + 0x1e4
    .4byte 0
    .4byte gUnknown_080DA66E + 0x1f6
    .4byte 0
    .4byte gUnknown_080DA66E + 0x208
    .4byte 0

	.global gProc_efxHitQuakePure
gProc_efxHitQuakePure:  @ 0x085B9884
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabd0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_56
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_efxQuake
gProc_efxQuake:  @ 0x085B989C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabe0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805382C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_efxHitQuake
gProc_efxHitQuake:  @ 0x085B98B4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dabec
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8053BBC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
