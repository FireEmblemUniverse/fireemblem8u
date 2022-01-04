	.align 2
	@********************** Track  1 **********************@

	.global song707_1
song707_1:	@ 0x08582AB0
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x73
	.byte	0xBD
	.byte	0x11
	.byte	0xBC
	.byte	0x00
	.byte	0xCF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xA4
	.byte	0xCE
	.byte	0x3C
	.byte	0xB1
	.align 2
	.global song707
song707:	@ 0x08582AC0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song707_1		@ track
