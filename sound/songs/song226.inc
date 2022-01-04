	.align 2
	@********************** Track  1 **********************@

	.global song226_1
song226_1:	@ 0x0857EBA0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x1D
	.byte	0xBE
	.byte	0x7F
	.byte	0xF7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song226
song226:	@ 0x0857EBB0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song226_1		@ track
