    .section .data

	.global gUnknown_0899D6DC
gUnknown_0899D6DC:  @ 0x0899D6DC
	.incbin "baserom.gba", 0x99D6DC, 0x9A18D4 - 0x99D6DC

	.global Pal_EventMapAnimMaskfx
Pal_EventMapAnimMaskfx:  @ 0x089A18D4
	.incbin "baserom.gba", 0x9A18D4, 0x20

	.global Img_Congratulations
Img_Congratulations:  @ 0x089A18F4
	.incbin "graphics/event/Gfx_Congratulations.4bpp.lz"

	.global Img_MapClear
Img_MapClear:  @ 0x089A1E70
	.incbin "graphics/event/Gfx_MapClear.4bpp.lz"

	.global Pal_Congratulations
Pal_Congratulations:  @ 0x089A230C
	.incbin "graphics/event/Gfx_Congratulations.gbapal", 0, 0x20

	.global Pal_MapClear
Pal_MapClear:  @ 0x089A232C
	.incbin "graphics/event/Gfx_MapClear.gbapal", 0, 0x20

	.global gUnknown_089A234C
gUnknown_089A234C:  @ 0x089A234C
	.incbin "baserom.gba", 0x9A234C, 0x468

	.global gUnknown_089A27B4
gUnknown_089A27B4:  @ 0x089A27B4
	.incbin "baserom.gba", 0x9A27B4, 0x12C

	.global gUnknown_089A28E0
gUnknown_089A28E0:  @ 0x089A28E0
	.incbin "baserom.gba", 0x9A28E0, 0x40
