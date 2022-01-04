	.align 2
	@********************** Track  1 **********************@

	.global song430_1
song430_1:	@ 0x08581A84
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x14
	.byte	0xBE
	.byte	0x6E
	.byte	0xDF
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song430
song430:	@ 0x08581A94
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song430_1		@ track
