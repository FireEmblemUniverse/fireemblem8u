	.align 2
	@********************** Track  1 **********************@

	.global song207_1
song207_1:	@ 0x0857E8AC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x09
	.byte	0xBE
	.byte	0x7F
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song207
song207:	@ 0x0857E8BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song207_1		@ track
