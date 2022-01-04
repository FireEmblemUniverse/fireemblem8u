	.align 2
	@********************** Track  1 **********************@

	.global song163_1
song163_1:	@ 0x0857E1A8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x01
	.byte	0xBE
	.byte	0x7F
	.byte	0xBF
	.byte	0x40
	.byte	0xDF
	.byte	0x3B
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song163
song163:	@ 0x0857E1B8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song163_1		@ track
