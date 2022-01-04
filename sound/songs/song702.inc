	.align 2
	@********************** Track  1 **********************@

	.global song702_1
song702_1:	@ 0x08582A24
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x68
	.byte	0xBD
	.byte	0x0C
	.byte	0xBC
	.byte	0x00
	.byte	0xCF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xAC
	.byte	0xCE
	.byte	0x3C
	.byte	0xB1
	.align 2
	.global song702
song702:	@ 0x08582A34
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song702_1		@ track
