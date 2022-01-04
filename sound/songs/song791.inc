	.align 2
	@********************** Track  1 **********************@

	.global song791_1
song791_1:	@ 0x085844D4
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x6E
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x7F
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song791
song791:	@ 0x085844E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song791_1		@ track
