	.align 2
	@********************** Track  1 **********************@

	.global song700_1
song700_1:	@ 0x085829EC
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x64
	.byte	0xBD
	.byte	0x0A
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
	.global song700
song700:	@ 0x085829FC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song700_1		@ track
