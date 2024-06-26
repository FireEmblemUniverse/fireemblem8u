    .section .rodata

    .4byte 0x43000001
    .4byte 0x37008000
    .4byte 0x43000001
    .4byte 0x47048200
    .4byte 0x43000001
    .4byte 0x57088400
    .4byte 0x43000001
    .4byte 0x670c8600

	.global gUnknown_080DA25C
gUnknown_080DA25C:  @ 0x080DA25C
	.incbin "baserom.gba", 0xDA25C, 0xE

	.global gUnknown_080DA26A
gUnknown_080DA26A:  @ 0x080DA26A
	.incbin "baserom.gba", 0xDA26A, 0x14

	.global gUnknown_080DA27E
gUnknown_080DA27E:  @ 0x080DA27E
	.incbin "baserom.gba", 0xDA27E, 0x32

	.global gUnknown_080DA2B0
gUnknown_080DA2B0:  @ 0x080DA2B0
	.incbin "baserom.gba", 0xDA2B0, 0x44
