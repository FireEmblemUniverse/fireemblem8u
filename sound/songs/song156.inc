	.align 2
	@********************** Track  1 **********************@

	.global song156_1
song156_1:	@ 0x0857E0E4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x06
	.byte	0xBE
	.byte	0x70
	.byte	0xBF
	.byte	0x40
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song156
song156:	@ 0x0857E0F4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song156_1		@ track
