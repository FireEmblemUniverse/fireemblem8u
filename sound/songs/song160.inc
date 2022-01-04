	.align 2
	@********************** Track  1 **********************@

	.global song160_1
song160_1:	@ 0x0857E154
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x08
	.byte	0xBE
	.byte	0x7F
	.byte	0xBF
	.byte	0x40
	.byte	0xDA
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song160
song160:	@ 0x0857E164
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song160_1		@ track
