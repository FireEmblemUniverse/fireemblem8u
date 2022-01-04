	.align 2
	@********************** Track  1 **********************@

	.global song970_1
song970_1:	@ 0x08586944
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x64
	.byte	0xBE
	.byte	0x55
	.byte	0xC1
	.byte	0x0C
	.byte	0xD1
	.byte	0x31
	.byte	0x7F
	.byte	0x82
	.byte	0x33
	.byte	0x82
	.byte	0x37
	.byte	0x82
	.byte	0x32
	.byte	0x82
	.byte	0x30
	.byte	0x81
	.byte	0x2D
	.byte	0x82
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song970_2
song970_2:	@ 0x0858695D
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x71
	.byte	0xBE
	.byte	0x55
	.byte	0xC1
	.byte	0x0C
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x9C
	.byte	0x82
	.byte	0xB1
	@********************** Track  3 **********************@

	.global song970_3
song970_3:	@ 0x0858696B
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x30
	.byte	0xBE
	.byte	0x55
	.byte	0xC1
	.byte	0x0C
	.byte	0xEE
	.byte	0x48
	.byte	0x7F
	.byte	0x9F
	.byte	0xB1
	.align 2
	.global song970
song970:	@ 0x08586978
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song970_1		@ track
	.word	song970_2		@ track
	.word	song970_3		@ track
