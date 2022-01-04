	.align 2
	@********************** Track  1 **********************@

	.global song975_1
song975_1:	@ 0x0858698C
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x6E
	.byte	0xBD
	.byte	0x6B
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
	.global song975
song975:	@ 0x0858699C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song975_1		@ track
