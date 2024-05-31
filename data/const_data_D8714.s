    .section .rodata

	.global gUnknown_080D9E44
gUnknown_080D9E44:  @ 0x080D9E44
	.incbin "baserom.gba", 0xD9E44, 0xC

	.global gLinkArenaRuleData
gLinkArenaRuleData:  @ 0x080D9E50
	.incbin "baserom.gba", 0xD9E50, 0x4C
