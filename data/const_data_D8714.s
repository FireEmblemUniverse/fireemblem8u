    .section .rodata

	.global post_gUnknown_080D9D61
post_gUnknown_080D9D61:
	.incbin "baserom.gba", 0xD9D70, 0xD9DE4 - 0xD9D70

	.global gUnknown_080D9DE4
gUnknown_080D9DE4:  @ 0x080D9DE4
	.incbin "baserom.gba", 0xD9DE4, 0xE

	.global gUnknown_080D9DF2
gUnknown_080D9DF2:  @ 0x080D9DF2
	.incbin "baserom.gba", 0xD9DF2, 0x14

	.global gUnknown_080D9E06
gUnknown_080D9E06:  @ 0x080D9E06
	.incbin "baserom.gba", 0xD9E06, 0x8

	.global gUnknown_080D9E0E
gUnknown_080D9E0E:  @ 0x080D9E0E
	.incbin "baserom.gba", 0xD9E0E, 0xE

	.global gUnknown_080D9E1C
gUnknown_080D9E1C:  @ 0x080D9E1C
	.incbin "baserom.gba", 0xD9E1C, 0x28

	.global gUnknown_080D9E44
gUnknown_080D9E44:  @ 0x080D9E44
	.incbin "baserom.gba", 0xD9E44, 0xC

	.global gUnknown_080D9E50
gUnknown_080D9E50:  @ 0x080D9E50
	.incbin "baserom.gba", 0xD9E50, 0x4C
