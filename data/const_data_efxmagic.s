    .section .rodata

	.asciz "efxGorgon"

	.global gUnknown_080DF042
gUnknown_080DF042:  @ 0x080DF042
	.incbin "baserom.gba", 0xDF042, 0x3E

	.global gUnknown_080DF080
gUnknown_080DF080:  @ 0x080DF080
	.incbin "baserom.gba", 0xDF080, 0x60

	.global gFrameConfig_efxGorgonBGFinish
gFrameConfig_efxGorgonBGFinish:  @ 0x080DF0E0
	.incbin "baserom.gba", 0xDF0E0, 0xDF11C - 0xDF0E0
