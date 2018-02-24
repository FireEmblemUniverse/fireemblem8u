    .section .rodata

	.global gUnknown_08B1FA20
gUnknown_08B1FA20:  @ 0x08B1FA20
	.incbin "baserom.gba", 0xB1FA20, 0x4

	.global gUnknown_08B1FA24
gUnknown_08B1FA24:  @ 0x08B1FA24
	.incbin "baserom.gba", 0xB1FA24, 0x14

@ mallocr data
.if 0
	.global gUnknown_08B1FA38
gUnknown_08B1FA38:  @ 0x08B1FA38
	.incbin "baserom.gba", 0xB1FA38, 0x8

	.global gUnknown_08B1FA40
gUnknown_08B1FA40:  @ 0x08B1FA40
	.incbin "baserom.gba", 0xB1FA40, 0x400

	.global gUnknown_08B1FE40
gUnknown_08B1FE40:  @ 0x08B1FE40
	.incbin "baserom.gba", 0xB1FE40, 0x4

	.global gUnknown_08B1FE44
gUnknown_08B1FE44:  @ 0x08B1FE44
	.incbin "baserom.gba", 0xB1FE44, 0x4

	.global gUnknown_08B1FE48
gUnknown_08B1FE48:  @ 0x08B1FE48
	.incbin "baserom.gba", 0xB1FE48, 0x4

	.global gUnknown_08B1FE4C
gUnknown_08B1FE4C:  @ 0x08B1FE4C
	.incbin "baserom.gba", 0xB1FE4C, 0x4

	.global gUnknown_08B1FE50
gUnknown_08B1FE50:  @ 0x08B1FE50
	.incbin "baserom.gba", 0xB1FE50, 0x4

	.global gUnknown_08B1FE54
gUnknown_08B1FE54:  @ 0x08B1FE54
	.incbin "baserom.gba", 0xB1FE54, 0xE01B4
.endif
