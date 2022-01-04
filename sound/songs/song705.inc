	.align 2
	@********************** Track  1 **********************@

	.global song705_1
song705_1:	@ 0x08582A78
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x73
	.byte	0xBD
	.byte	0x0F
	.byte	0xBC
	.byte	0x00
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x9C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song705
song705:	@ 0x08582A88
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song705_1		@ track
