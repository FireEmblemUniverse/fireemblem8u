	.align 2
	@********************** Track  1 **********************@

	.global song166_1
song166_1:	@ 0x0857E1FC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x09
	.byte	0xBE
	.byte	0x7F
	.byte	0xBF
	.byte	0x40
	.byte	0xDD
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song166
song166:	@ 0x0857E20C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song166_1		@ track
