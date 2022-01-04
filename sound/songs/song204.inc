	.align 2
	@********************** Track  1 **********************@

	.global song204_1
song204_1:	@ 0x0857E858
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x0A
	.byte	0xBE
	.byte	0x6E
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song204
song204:	@ 0x0857E868
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song204_1		@ track
