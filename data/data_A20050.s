    .section .data

	.global gUnknown_08A204B8
gUnknown_08A204B8:  @ 0x08A204B8
@ replacing .incbin "baserom.gba", 0x00a204b8, 0x4
.4byte gUnknown_02000948 + 0x20

	.global gUnknown_08A204BC
gUnknown_08A204BC:  @ 0x08A204BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA550
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AA69C
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA658
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AA69C
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AA6D8
        @ PROC_LABEL
        .short 0xb, 0xa
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A2051C
gUnknown_08A2051C:  @ 0x08A2051C
	.incbin "baserom.gba", 0xA2051C, 0x1A

	.global gUnknown_08A20536
gUnknown_08A20536:  @ 0x08A20536
	.incbin "baserom.gba", 0xA20536, 0x3A

	.global gUnknown_08A20570
gUnknown_08A20570:  @ 0x08A20570
	.incbin "baserom.gba", 0xA20570, 0x8

	.global gUnknown_08A20578
gUnknown_08A20578:  @ 0x08A20578
	.incbin "baserom.gba", 0xA20578, 0x8

	.global gUnknown_08A20580
gUnknown_08A20580:  @ 0x08A20580
	.incbin "baserom.gba", 0xA20580, 0x8

	.global gUnknown_08A20588
gUnknown_08A20588:  @ 0x08A20588
	.incbin "baserom.gba", 0xA20588, 0x8

	.global gUnknown_08A20590
gUnknown_08A20590:  @ 0x08A20590
	.incbin "baserom.gba", 0xA20590, 0xC0

	.global gUnknown_08A20650
gUnknown_08A20650:  @ 0x08A20650
@ replacing .incbin "baserom.gba", 0x00a20650, 0x2c
.4byte gUnknown_08A20590 + 0xe
.4byte gUnknown_08A20590 + 0x16
.4byte gUnknown_08A20590 + 0x1e
.4byte gUnknown_08A20590 + 0x26
.4byte gUnknown_08A20590 + 0x2e
.4byte gUnknown_08A20590 + 0x36
.4byte gUnknown_08A20590 + 0x3e
.4byte gUnknown_08A20590 + 0x46
.4byte gUnknown_08A20590 + 0x4e
.4byte gUnknown_08A20590 + 0x56
.4byte gUnknown_08A20590 + 0x5e

	.global gUnknown_08A2067C
gUnknown_08A2067C:  @ 0x08A2067C
@ replacing .incbin "baserom.gba", 0x00a2067c, 0x2c
.4byte gUnknown_08A20590 + 0x66
.4byte gUnknown_08A20590 + 0x6e
.4byte gUnknown_08A20590 + 0x76
.4byte gUnknown_08A20590 + 0x7e
.4byte gUnknown_08A20590 + 0x86
.4byte gUnknown_08A20590 + 0x8e
.4byte gUnknown_08A20590 + 0x96
.4byte gUnknown_08A20590 + 0x9e
.4byte gUnknown_08A20590 + 0xa6
.4byte gUnknown_08A20590 + 0xae
.4byte gUnknown_08A20590 + 0xb6

	.global gUnknown_08A206A8
gUnknown_08A206A8:  @ 0x08A206A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205de0
        @ PROC_MARK
        .short 0xf, 0xc
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80AAA6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80AAA78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80AB2A0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
