	.align 2
	@********************** Track  1 **********************@

	.global song856_1
song856_1:	@ 0x085848B8
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x63
	.byte	0xBD
	.byte	0x19
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
	.global song856
song856:	@ 0x085848C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song856_1		@ track
