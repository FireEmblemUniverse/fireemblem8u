	.align 2
	@********************** Track  1 **********************@

	.global song206_1
song206_1:	@ 0x0857E890
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x08
	.byte	0xBE
	.byte	0x7F
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song206
song206:	@ 0x0857E8A0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song206_1		@ track
