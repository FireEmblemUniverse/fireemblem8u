	.align 2
	@********************** Track  1 **********************@

	.global song613_1
song613_1:	@ 0x085826A8
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
	.global song613
song613:	@ 0x085826B8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song613_1		@ track
