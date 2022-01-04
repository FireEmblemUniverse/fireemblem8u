	.align 2
	@********************** Track  1 **********************@

	.global song530_1
song530_1:	@ 0x08582114
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x2B
	.byte	0xBE
	.byte	0x6E
	.byte	0xE7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song530
song530:	@ 0x08582124
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song530_1		@ track
