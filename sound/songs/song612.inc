	.align 2
	@********************** Track  1 **********************@

	.global song612_1
song612_1:	@ 0x0858268C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x79
	.byte	0xBE
	.byte	0x78
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song612
song612:	@ 0x0858269C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song612_1		@ track
