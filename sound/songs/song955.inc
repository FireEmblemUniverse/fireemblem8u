	.align 2
	@********************** Track  1 **********************@

	.global song955_1
song955_1:	@ 0x085862D0
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x64
	.byte	0xBD
	.byte	0x08
	.byte	0xBC
	.byte	0x00
	.byte	0xEF
	.byte	0x40
	.byte	0x7F
	.byte	0xA0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song955
song955:	@ 0x085862E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song955_1		@ track
