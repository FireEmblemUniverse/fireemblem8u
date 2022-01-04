	.align 2
	@********************** Track  1 **********************@

	.global song402_1
song402_1:	@ 0x085818C4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x01
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
	.global song402
song402:	@ 0x085818D4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song402_1		@ track
