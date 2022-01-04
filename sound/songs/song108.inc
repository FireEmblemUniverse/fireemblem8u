	.align 2
	@********************** Track  1 **********************@

	.global song108_1
song108_1:	@ 0x0857D1B8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x03
	.byte	0xBA
	.byte	0x0A
	.byte	0xBE
	.byte	0x6E
	.byte	0xD1
	.byte	0x30
	.byte	0x7F
	.byte	0x84
	.byte	0xE0
	.byte	0x30
	.byte	0x6C
	.byte	0x8C
	.byte	0xBA
	.byte	0x00
	.byte	0x88
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song108
song108:	@ 0x0857D1D0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song108_1		@ track
