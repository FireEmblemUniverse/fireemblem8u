	.align 2
	@********************** Track  1 **********************@

	.global song285_1
song285_1:	@ 0x0857F758
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x07
	.byte	0xBE
	.byte	0x58
	.byte	0xEE
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song285
song285:	@ 0x0857F768
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song285_1		@ track
