	.align 2
	@********************** Track  1 **********************@

	.global song805_1
song805_1:	@ 0x08584544
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x50
	.byte	0xBD
	.byte	0x01
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
	@********************** Track  2 **********************@

	.global song805_2
song805_2:	@ 0x08584554
	.byte	0xBE
	.byte	0x2F
	.byte	0xBD
	.byte	0x64
	.byte	0xBC
	.byte	0x00
	.byte	0xD3
	.byte	0x3C
	.byte	0x7F
	.byte	0x84
	.byte	0xBD
	.byte	0x65
	.byte	0xD2
	.byte	0x3B
	.byte	0x64
	.byte	0x83
	.byte	0x3B
	.byte	0x50
	.byte	0x83
	.byte	0xD1
	.byte	0x3B
	.byte	0x3C
	.byte	0x82
	.byte	0x3B
	.byte	0x1E
	.byte	0x82
	.byte	0x3B
	.byte	0x0A
	.byte	0x82
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song805
song805:	@ 0x08584574
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song805_1		@ track
	.word	song805_2		@ track
