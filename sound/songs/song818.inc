	.align 2
	@********************** Track  1 **********************@

	.global song818_1
song818_1:	@ 0x08584764
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x3D
	.byte	0xBE
	.byte	0x63
	.byte	0xBC
	.byte	0x00
	.byte	0xD7
	.byte	0x3C
	.byte	0x7F
	.byte	0x88
	.byte	0xBE
	.byte	0x1F
	.byte	0xD7
	.byte	0x3C
	.byte	0x7F
	.byte	0x88
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song818
song818:	@ 0x08584778
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song818_1		@ track
