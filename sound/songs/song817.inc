	.align 2
	@********************** Track  1 **********************@

	.global song817_1
song817_1:	@ 0x08584748
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x63
	.byte	0xBD
	.byte	0x2D
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
	.global song817
song817:	@ 0x08584758
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song817_1		@ track
