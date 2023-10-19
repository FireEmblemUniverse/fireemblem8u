	.section .data

	.global gUnknown_085BB0C8
gUnknown_085BB0C8:  @ 0x085BB0C8
	.incbin "baserom.gba", 0x5BB0C8, 0x214

	.global gUnknown_085BB2DC
gUnknown_085BB2DC:  @ 0x085BB2DC
	.incbin "baserom.gba", 0x5BB2DC, 0xEAC

	.global gUnknown_085BC188
gUnknown_085BC188:  @ 0x085BC188
	.incbin "baserom.gba", 0x5BC188, 0x266C

	.global gUnknown_085BE7F4
gUnknown_085BE7F4:  @ 0x085BE7F4
	.incbin "baserom.gba", 0x5BE7F4, 0x7A0

	.global gUnknown_085BEF94
gUnknown_085BEF94:  @ 0x085BEF94
	.incbin "baserom.gba", 0x5BEF94, 0x5918

	.global gUnknown_085C48AC
gUnknown_085C48AC:  @ 0x085C48AC
	.incbin "baserom.gba", 0x5C48AC, 0x10E8

	.global gUnknown_085C5994
gUnknown_085C5994:  @ 0x085C5994
	.incbin "baserom.gba", 0x5C5994, 0x6C0

	.global gUnknown_085C6054
gUnknown_085C6054:  @ 0x085C6054
	.incbin "baserom.gba", 0x5C6054, 0x80

	.global gUnknown_085C60D4
gUnknown_085C60D4:  @ 0x085C60D4
	.incbin "baserom.gba", 0x5C60D4, 0x65C

	.global gUnknown_085C6730
gUnknown_085C6730:  @ 0x085C6730
	.incbin "baserom.gba", 0x5C6730, 0xAB4

@ Following are some animation scripts. these contain pointers, sometimes
@ packed with other data into one word. Ideally there'd be some macros here
@ based on the decoding in animedrv.c - but I think the alignment guarantees
@ that shifting the objects referenced here doesn't affect the other data.

	.global gUnknown_085C71E4
gUnknown_085C71E4:  @ 0x085C71E4
@ Replacing .incbin "baserom.gba", 0x5C71E4, 0xC8
    .4byte gUnknown_085C6730 + 0x299
    .4byte gUnknown_085C6730 + 0x2d5
    .4byte gUnknown_085C6730 + 0x329
    .4byte gUnknown_085C6730 + 0x395
    .4byte gUnknown_085C6730 + 0x419
    .4byte gUnknown_085C6730 + 0x49d
    .4byte gUnknown_085C6730 + 0x52d
    .4byte gUnknown_085C6730 + 0x5bd
    .4byte gUnknown_085C6730 + 0x641
    .4byte gUnknown_085C6730 + 0x6c5
    .4byte gUnknown_085C6730 + 0x755
    .4byte gUnknown_085C6730 + 0x7e5
    .4byte gUnknown_085C6730 + 0x881
    .4byte gUnknown_085C6730 + 0x91d
    .4byte gUnknown_085C6730 + 0x9b9
    .4byte 0x20000000 + gUnknown_085C6730 + 0xa4a
    .4byte 0x80000000
    .4byte 0x80004000
    .4byte 0xffd00000
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0xfff00004
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0x00100008
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x0030000c
    .4byte 0x00000008
    .4byte 0x80004000
    .4byte 0xffd0000d
    .4byte 0x0000fff8
    .4byte 0x80004000
    .4byte 0xfff00011
    .4byte 0x0000fff8
    .4byte 0x80004000
    .4byte 0x00100015
    .4byte 0x0000fff8
    .4byte 0x40004000
    .4byte 0xffd00019
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xfff0001d
    .4byte 0x0000fff0
    .4byte 0x40004000
    .4byte 0x00000039
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
