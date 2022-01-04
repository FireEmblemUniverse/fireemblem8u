	.align 2
	@********************** Track  1 **********************@

	.global song181_1
song181_1:	@ 0x0857E3D4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x4F
	.byte	0xBE
	.byte	0x6E
	.byte	0x84
	.byte	0xEE
	.byte	0x3C
	.byte	0x7F
	.byte	0x94
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song181
song181:	@ 0x0857E3E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song181_1		@ track
