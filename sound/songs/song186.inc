	.align 2
	@********************** Track  1 **********************@

	.global song186_1
song186_1:	@ 0x0857E4F0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x31
	.byte	0xBE
	.byte	0x7F
	.byte	0xDB
	.byte	0x33
	.byte	0x7F
	.byte	0x94
	.byte	0xEC
	.byte	0x3A
	.byte	0x84
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song186
song186:	@ 0x0857E504
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song186_1		@ track
