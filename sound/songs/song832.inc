	.align 2
	@********************** Track  1 **********************@

	.global song832_1
song832_1:	@ 0x085847A0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x07
	.byte	0xBE
	.byte	0x7F
	.byte	0xC0
	.byte	0x40
	.byte	0xFF
	.byte	0x3C
	.byte	0x5C
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song832
song832:	@ 0x085847B0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup039		@ voicegroup/tone

	.word	song832_1		@ track
