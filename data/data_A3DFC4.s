    .section .data

	.global gUnknown_08A3E22C
gUnknown_08A3E22C:  @ 0x08A3E22C
	.incbin "baserom.gba", 0xA3E22C, 0x10

	.global gUnknown_08A3E23C
gUnknown_08A3E23C:  @ 0x08A3E23C
@ Replacing .incbin "baserom.gba", 0xA3E23C, 0xC
    .4byte 0x8001000
    .4byte 0x1000
    .4byte 0x0

	.global gUnknown_08A3E248
gUnknown_08A3E248:  @ 0x08A3E248
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206870
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_37
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD410
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_70
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD444
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BD830
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80BD9D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80BDA78
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E2C0
gUnknown_08A3E2C0:  @ 0x08A3E2C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8206880
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_49
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapMU_FillPrim
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A3E2F0
gUnknown_08A3E2F0:  @ 0x08A3E2F0
	.incbin "baserom.gba", 0xA3E2F0, 0x8

	.global gUnknown_08A3E2F8
gUnknown_08A3E2F8:  @ 0x08A3E2F8
	.incbin "baserom.gba", 0xA3E2F8, 0x24

	.global gUnknown_08A3E31C
gUnknown_08A3E31C:  @ 0x08A3E31C
	.incbin "baserom.gba", 0xA3E31C, 0x44

	.global gUnknown_08A3E360
gUnknown_08A3E360:  @ 0x08A3E360
	.incbin "baserom.gba", 0xA3E360, 0x2E

	.global gUnknown_08A3E38E
gUnknown_08A3E38E:  @ 0x08A3E38E
	.incbin "baserom.gba", 0xA3E38E, 0x2C

	.global gUnknown_08A3E3BA
gUnknown_08A3E3BA:  @ 0x08A3E3BA
	.incbin "baserom.gba", 0xA3E3BA, 0x58

	.global gUnknown_08A3E412
gUnknown_08A3E412:  @ 0x08A3E412
	.incbin "baserom.gba", 0xA3E412, 0x36
