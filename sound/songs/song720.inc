	.align 2
	@********************** Track  1 **********************@

	.global song720_1
song720_1:	@ 0x08582BA8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x1F
	.byte	0xBE
	.byte	0x69
	.byte	0xBF
	.byte	0x40
	.byte	0x83
	.byte	0xE6
	.byte	0x6A
	.byte	0x54
	.byte	0x97
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song720_2
song720_2:	@ 0x08582BB8
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x23
	.byte	0xBE
	.byte	0x69
	.byte	0xBF
	.byte	0x40
	.byte	0xE7
	.byte	0x43
	.byte	0x60
	.byte	0x98
	.byte	0x82
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song720
song720:	@ 0x08582BC8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song720_1		@ track
	.word	song720_2		@ track
