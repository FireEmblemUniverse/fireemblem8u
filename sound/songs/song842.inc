	.align 2
	@********************** Track  1 **********************@

	.global song842_1
song842_1:	@ 0x08584810
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x08
	.byte	0xBE
	.byte	0x50
	.byte	0xC0
	.byte	0x40
	.byte	0xFF
	.byte	0x3C
	.byte	0x5C
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song842
song842:	@ 0x08584820
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup039		@ voicegroup/tone

	.word	song842_1		@ track
