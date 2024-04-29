	.section .data

	.global gUnknown_089ED67C
gUnknown_089ED67C:  @ 0x089ED67C
	.incbin "baserom.gba", 0x9ED67C, 0x18

	.global gUnknown_089ED694
gUnknown_089ED694:  @ 0x089ED694
	.incbin "baserom.gba", 0x9ED694, 0x18

	.global gUnknown_089ED6AC
gUnknown_089ED6AC:  @ 0x089ED6AC
    .incbin "baserom.gba", 0x9ED6AC, 0x9ED7CC - 0x9ED6AC
