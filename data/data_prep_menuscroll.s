    .section .data

	.global gUnknown_08A18744
gUnknown_08A18744:  @ 0x08A18744
	.incbin "baserom.gba", 0xA18744, 0x8

	.global gUnknown_08A1874C
gUnknown_08A1874C:  @ 0x08A1874C
	.incbin "baserom.gba", 0xA1874C, 0x8

	.global gUnknown_08A18754
gUnknown_08A18754:  @ 0x08A18754
	.incbin "baserom.gba", 0xA18754, 0x48

	.global gUnknown_08A1879C
gUnknown_08A1879C:  @ 0x08A1879C
@ Replacing .incbin "baserom.gba", 0xA1879C, 0x54
    .4byte 0x0
    .4byte gUnknown_08A18754 + 0x8
    .4byte gUnknown_08A18754 + 0x10
    .4byte gUnknown_08A18754 + 0x18
    .4byte gUnknown_08A18754 + 0x20
    .4byte gUnknown_08A18754 + 0x28
    .4byte gUnknown_08A18754 + 0x30
    .4byte gUnknown_08A18754 + 0x38
    .4byte gUnknown_08A18754 + 0x40
    .4byte 0x1
    .4byte 0xa0000
    .4byte 0x1
    .4byte 0xb0000
    .4byte 0x1
    .4byte 0xc0000
    .4byte 0x1
    .4byte 0xd0000
    .4byte 0x1
    .4byte 0xe0000
    .4byte 0x1
    .4byte 0xf0000

	.global gUnknown_08A187F0
gUnknown_08A187F0:  @ 0x08A187F0
@ replacing .incbin "baserom.gba", 0x00a187f0, 0x18
.4byte gUnknown_08A1879C + 0x24
.4byte gUnknown_08A1879C + 0x2c
.4byte gUnknown_08A1879C + 0x34
.4byte gUnknown_08A1879C + 0x3c
.4byte gUnknown_08A1879C + 0x44
.4byte gUnknown_08A1879C + 0x4c

	.global ProcScr_menu_scroll
ProcScr_menu_scroll:  @ 0x08A18808
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205bd8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80973B0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80973E4
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
