	.align 2
	@********************** Track  1 **********************@

	.global song850_1
song850_1:	@ 0x08584864
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x04
	.byte	0xBE
	.byte	0x64
	.byte	0xC0
	.byte	0x40
	.byte	0xFF
	.byte	0x3C
	.byte	0x5C
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song850
song850:	@ 0x08584874
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup039		@ voicegroup/tone

	.word	song850_1		@ track
