@ Map tileset configuration macros.
@
@ A map tileset config decompresses into sTilesetConfig[0x1000 + 0x200] (see
@ src/bmmap.c): 0x1000 u16 of tile-graphics config followed by a 0x200 u16
@ (1024-byte) terrain-type lookup.
@
@ Each metatile is a 16x16 block built from four 8x8 BG tiles, stored as four
@ consecutive TSA entries (low bits = tile index, high nibble = palette/flip)
@ in TL, TR, BL, BR order. There are 0x400 (1024) metatiles.
	.include "graphics/map/terrains.inc"

	.macro metatile tl, tr, bl, br
	.2byte \tl, \tr, \bl, \br
	.endm
