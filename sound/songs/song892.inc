	.align 2
	@********************** Track  1 **********************@

	.global song892_1
song892_1:	@ 0x08584AC4
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x50
	.byte	0xBD
	.byte	0x54
	.byte	0xBC
	.byte	0x00
	.byte	0xF4
	.byte	0x3C
	.byte	0x7F
	.byte	0xA5
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song892
song892:	@ 0x08584AD4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song892_1		@ track
