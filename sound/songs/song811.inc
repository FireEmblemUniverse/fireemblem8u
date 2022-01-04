	.align 2
	@********************** Track  1 **********************@

	.global song811_1
song811_1:	@ 0x08584638
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x7F
	.byte	0xBD
	.byte	0x16
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

	.global song811_2
song811_2:	@ 0x08584648
	.byte	0xBE
	.byte	0x2D
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x64
	.byte	0xD2
	.byte	0x37
	.byte	0x78
	.byte	0x83
	.byte	0x3C
	.byte	0x64
	.byte	0x83
	.byte	0xBD
	.byte	0x65
	.byte	0xD2
	.byte	0x3D
	.byte	0x50
	.byte	0x83
	.byte	0x3E
	.byte	0x3C
	.byte	0x83
	.byte	0x41
	.byte	0x28
	.byte	0x83
	.byte	0x41
	.byte	0x14
	.byte	0x83
	.byte	0x41
	.byte	0x0A
	.byte	0x83
	.byte	0xB1
	.align 2
	.global song811
song811:	@ 0x08584668
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song811_1		@ track
	.word	song811_2		@ track
