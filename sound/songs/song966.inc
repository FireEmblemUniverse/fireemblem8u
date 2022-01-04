	.align 2
	@********************** Track  1 **********************@

	.global song966_1
song966_1:	@ 0x085866D4
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x64
	.byte	0xBD
	.byte	0x33
	.byte	0xBC
	.byte	0x00
	.byte	0xCF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xA5
	.byte	0xCE
	.byte	0x3C
	.byte	0xB1
	.align 2
	.global song966
song966:	@ 0x085866E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song966_1		@ track
