	.align 2
	@********************** Track  1 **********************@

	.global song101_1
song101_1:	@ 0x0857D098
	.byte	0xBE
	.byte	0x28
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x00
	.byte	0xD2
	.byte	0x50
	.byte	0x7F
	.byte	0x84
	.byte	0xD4
	.byte	0x4E
	.byte	0x94
	.byte	0xB1
	.align 2
	.global song101
song101:	@ 0x0857D0A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song101_1		@ track
