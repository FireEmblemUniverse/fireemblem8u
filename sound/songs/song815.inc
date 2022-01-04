	.align 2
	@********************** Track  1 **********************@

	.global song815_1
song815_1:	@ 0x085846CC
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x63
	.byte	0xBD
	.byte	0x2B
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
	@********************** Track  2 **********************@

	.global song815_2
song815_2:	@ 0x085846DC
	.byte	0xBE
	.byte	0x63
	.byte	0xBD
	.byte	0x29
	.byte	0xBC
	.byte	0x00
	.byte	0xBE
	.byte	0x3E
	.byte	0xD7
	.byte	0x3C
	.byte	0x7F
	.byte	0x88
	.byte	0xBE
	.byte	0x2E
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
	.byte	0xBE
	.byte	0x0F
	.byte	0xD7
	.byte	0x3C
	.byte	0x7F
	.byte	0x88
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song815
song815:	@ 0x085846FC
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song815_1		@ track
	.word	song815_2		@ track
