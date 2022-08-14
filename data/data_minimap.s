    .section .data

	.global gGfx_MinimapTiles
gGfx_MinimapTiles:  @ 0x08A1FBD8
	.incbin "graphics/minimap/minimap_tiles.4bpp.lz"

	.global gPal_MinimapTiles
gPal_MinimapTiles:  @ 0x08A1FFB0
	.incbin "graphics/minimap/minimap_tiles.gbapal"

	.global gPal_08A1FFD0
gPal_08A1FFD0:  @ 0x08A1FFD0
	.incbin "graphics/minimap/gPal_08A1FFD0.gbapal"

	.incbin "graphics/minimap/gPal_Unused_08A1FFF0.gbapal"
	.incbin "graphics/minimap/gPal_Unused_08A20010.gbapal"
	.incbin "graphics/minimap/gPal_Unused_08A20030.gbapal"
