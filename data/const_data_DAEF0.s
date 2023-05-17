    .section .rodata

	.global gBanimRoundScripts
gBanimRoundScripts:  @ 0x080DAEF0
	.incbin "baserom.gba", 0xDAEF0, 0x28

	.global gUnknown_080DAF18
gUnknown_080DAF18:  @ 0x080DAF18
	.incbin "baserom.gba", 0xDAF18, 0x5

	.global gUnknown_080DAF1D
gUnknown_080DAF1D:  @ 0x080DAF1D
	.incbin "baserom.gba", 0xDAF1D, 0x5

	.global gUnknown_080DAF22
gUnknown_080DAF22:  @ 0x080DAF22
	.incbin "baserom.gba", 0xDAF22, 0x6

	.global gUnknown_080DAF28
gUnknown_080DAF28:  @ 0x080DAF28
	.incbin "baserom.gba", 0xDAF28, 0x38

	.global gUnknown_080DAF60
gUnknown_080DAF60:  @ 0x080DAF60
	.incbin "baserom.gba", 0xDAF60, 0xC6

	.global gUnknown_080DB026
gUnknown_080DB026:  @ 0x080DB026
	.incbin "baserom.gba", 0xDB026, 0x1836

	.global gUnknown_080DC85C
gUnknown_080DC85C:  @ 0x080DC85C
	.incbin "baserom.gba", 0xDC85C, 0xDC860 - 0xDC85C
