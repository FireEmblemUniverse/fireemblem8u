
    .section .rodata

    .incbin "baserom.gba", 0x206B60, 0x10

	.global gUnknown_08206B70
gUnknown_08206B70:  @ 0x08206B70
@ Replacing .incbin "baserom.gba", 0x206B70, 0x2B4
    .4byte 0x00000003
    .4byte 0x01030100
    .4byte 0x02020101
    .4byte 0x03020203
    .4byte 0x03020303
    .4byte 0x70616d47
    .4byte 0x64615220
    .4byte 0x00007265
    .4byte 0x70616d47
    .4byte 0x73614220
    .4byte 0x654d2065
    .4byte 0x0000756e
