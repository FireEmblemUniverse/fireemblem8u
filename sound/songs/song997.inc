	.align 2
	@********************** Track  1 **********************@

	.global song997_1
song997_1:	@ 0x08587690
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x50
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x7D
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x9C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song997
song997:	@ 0x085876A0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song997_1		@ track
