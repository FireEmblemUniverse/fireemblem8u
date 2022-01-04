	.align 2
	@********************** Track  1 **********************@

	.global song706_1
song706_1:	@ 0x08582A94
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x5F
	.byte	0xBD
	.byte	0x10
	.byte	0xBC
	.byte	0x00
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song706
song706:	@ 0x08582AA4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song706_1		@ track
