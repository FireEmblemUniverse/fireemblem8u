	.align 2
	@********************** Track  1 **********************@

	.global song756_1
song756_1:	@ 0x08583D20
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x1C
	.byte	0xBE
	.byte	0x50
	.byte	0xBF
	.byte	0x40
	.byte	0xD7
	.byte	0x3C
	.byte	0x70
	.byte	0x84
	.byte	0x3E
	.byte	0x7F
	.byte	0x88
	.byte	0xD2
	.byte	0x3E
	.byte	0x20
	.byte	0x83
	.byte	0x3E
	.byte	0x14
	.byte	0x83
	.byte	0x3E
	.byte	0x0C
	.byte	0x83
	.byte	0xB1
	.align 2
	.global song756
song756:	@ 0x08583D3C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song756_1		@ track
