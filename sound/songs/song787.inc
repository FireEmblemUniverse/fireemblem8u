	.align 2
	@********************** Track  1 **********************@

	.global song787_1
song787_1:	@ 0x08583F64
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x69
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x73
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x9C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song787
song787:	@ 0x08583F74
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song787_1		@ track
