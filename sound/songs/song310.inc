	.align 2
	@********************** Track  1 **********************@

	.global song310_1
song310_1:	@ 0x0857FC20
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x1B
	.byte	0xBE
	.byte	0x7F
	.byte	0xE7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song310
song310:	@ 0x0857FC30
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song310_1		@ track
