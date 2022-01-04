	.align 2
	@********************** Track  1 **********************@

	.global song802_1
song802_1:	@ 0x08584528
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x78
	.byte	0xBD
	.byte	0x55
	.byte	0xBC
	.byte	0x00
	.byte	0xEF
	.byte	0x3C
	.byte	0x7F
	.byte	0xA0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song802
song802:	@ 0x08584538
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song802_1		@ track
