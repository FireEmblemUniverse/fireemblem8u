	.align 2
	@********************** Track  1 **********************@

	.global song785_1
song785_1:	@ 0x08583F1C
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x63
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x6E
	.byte	0xA5
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	@********************** Track  2 **********************@

	.global song785_2
song785_2:	@ 0x08583F2C
	.byte	0xBE
	.byte	0x63
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x6F
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song785
song785:	@ 0x08583F38
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song785_1		@ track
	.word	song785_2		@ track
