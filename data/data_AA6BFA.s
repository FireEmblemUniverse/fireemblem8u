    .section .data

	.global gUnknown_08AA704C
gUnknown_08AA704C:  @ 0x08AA704C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8554
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08AA705C
gUnknown_08AA705C:  @ 0x08AA705C
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C85FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8580
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C85B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA707C
gUnknown_08AA707C:  @ 0x08AA707C
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C8684
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8608
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8638
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA709C
gUnknown_08AA709C:  @ 0x08AA709C
	.incbin "baserom.gba", 0xAA709C, 0x20

	.global gUnknown_08AA70BC
gUnknown_08AA70BC:  @ 0x08AA70BC
	.incbin "baserom.gba", 0xAA70BC, 0x20

	.global gUnknown_08AA70DC
gUnknown_08AA70DC:  @ 0x08AA70DC
	.incbin "baserom.gba", 0xAA70DC, 0xE

	.global gUnknown_08AA70EA
gUnknown_08AA70EA:  @ 0x08AA70EA
	.incbin "baserom.gba", 0xAA70EA, 0x2C

	.global gUnknown_08AA7116
gUnknown_08AA7116:  @ 0x08AA7116
	.incbin "baserom.gba", 0xAA7116, 0x14

	.global gUnknown_08AA712A
gUnknown_08AA712A:  @ 0x08AA712A
	.incbin "baserom.gba", 0xAA712A, 0x32

	.global gUnknown_08AA715C
gUnknown_08AA715C:  @ 0x08AA715C
	.incbin "baserom.gba", 0xAA715C, 0x38

	.global gUnknown_08AA7194
gUnknown_08AA7194:  @ 0x08AA7194
	.incbin "baserom.gba", 0xAA7194, 0x34
