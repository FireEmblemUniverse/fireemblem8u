	.align 2
	@********************** Track  1 **********************@

	.global song433_1
song433_1:	@ 0x08581AD8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x15
	.byte	0xBE
	.byte	0x6E
	.byte	0xDD
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song433
song433:	@ 0x08581AE8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song433_1		@ track
