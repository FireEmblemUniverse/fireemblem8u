	.align 2
	@********************** Track  1 **********************@

	.global song213_1
song213_1:	@ 0x0857E974
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x71
	.byte	0xBE
	.byte	0x7D
	.byte	0xE7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song213
song213:	@ 0x0857E984
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song213_1		@ track
