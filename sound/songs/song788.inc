	.align 2
	@********************** Track  1 **********************@

	.global song788_1
song788_1:	@ 0x08583F80
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x73
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x74
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song788
song788:	@ 0x08583F90
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song788_1		@ track
