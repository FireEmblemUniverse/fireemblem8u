	.align 2
	@********************** Track  1 **********************@

	.global song171_1
song171_1:	@ 0x0857E29C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x2E
	.byte	0xBE
	.byte	0x7F
	.byte	0xEE
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song171
song171:	@ 0x0857E2AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song171_1		@ track
