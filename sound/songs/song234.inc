	.align 2
	@********************** Track  1 **********************@

	.global song234_1
song234_1:	@ 0x0857EBF8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x0E
	.byte	0xBE
	.byte	0x7F
	.byte	0xE3
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song234
song234:	@ 0x0857EC08
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song234_1		@ track
