	.align 2
	@********************** Track  1 **********************@

	.global song780_1
song780_1:	@ 0x08583EC8
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x2D
	.byte	0xBD
	.byte	0x28
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
	.global song780
song780:	@ 0x08583ED8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song780_1		@ track
