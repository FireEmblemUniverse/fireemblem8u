    .section .data

	.global Img_0899D6DC
Img_0899D6DC:
	.incbin "baserom.gba", 0x99D6DC, 0x99E1A4 - 0x99D6DC

	.global Img_99E1A4
Img_99E1A4:
	.incbin "baserom.gba", 0x99E1A4, 0x99ED44 - 0x99E1A4

	.global Img_99ED44
Img_99ED44:
	.incbin "baserom.gba", 0x99ED44, 0x99F7D4 - 0x99ED44

	.global Img_99F7D4
Img_99F7D4:
	.incbin "baserom.gba", 0x99F7D4, 0x9A0154 - 0x99F7D4

	.global Img_9A0154
Img_9A0154:
	.incbin "baserom.gba", 0x9A0154, 0x9A0864 - 0x9A0154

	.global Img_9A0864
Img_9A0864:
	.incbin "baserom.gba", 0x9A0864, 0x9A0E84 - 0x9A0864

	.global TileSet_9A0E84
TileSet_9A0E84:
	.incbin "baserom.gba", 0x9A0E84, 0x9A1050 - 0x9A0E84

	.global TileSet_9A1050
TileSet_9A1050:
	.incbin "baserom.gba", 0x9A1050, 0x9A1228 - 0x9A1050

	.global TileSet_9A1228
TileSet_9A1228:
	.incbin "baserom.gba", 0x9A1228, 0x9A13EC - 0x9A1228

	.global TileSet_9A13EC
TileSet_9A13EC:
	.incbin "baserom.gba", 0x9A13EC, 0x9A15B4 - 0x9A13EC

	.global TileSet_9A15B4
TileSet_9A15B4:
	.incbin "baserom.gba", 0x9A15B4, 0x9A174C - 0x9A15B4

	.global TileSet_9A174C
TileSet_9A174C:
	.incbin "baserom.gba", 0x9A174C, 0x9A18D4 - 0x9A174C

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
