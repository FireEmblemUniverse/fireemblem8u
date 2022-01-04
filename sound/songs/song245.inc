	.align 2
	@********************** Track  1 **********************@

	.global song245_1
song245_1:	@ 0x0857ECBC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x3D
	.byte	0xBE
	.byte	0x6E
	.byte	0xF7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.align 2
	.global song245
song245:	@ 0x0857ECCC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song245_1		@ track
