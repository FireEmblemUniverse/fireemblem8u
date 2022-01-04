	.align 2
	@********************** Track  1 **********************@

	.global song718_1
song718_1:	@ 0x08582B58
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x1C
	.byte	0xBE
	.byte	0x50
	.byte	0xBF
	.byte	0x40
	.byte	0xD4
	.byte	0x3C
	.byte	0x7F
	.byte	0x86
	.byte	0xD2
	.byte	0x3C
	.byte	0x14
	.byte	0x83
	.byte	0x3C
	.byte	0x10
	.byte	0x83
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song718_2
song718_2:	@ 0x08582B6E
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x1D
	.byte	0xBE
	.byte	0x50
	.byte	0xBF
	.byte	0x40
	.byte	0xD5
	.byte	0x6B
	.byte	0x64
	.byte	0x86
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song718
song718:	@ 0x08582B7C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song718_1		@ track
	.word	song718_2		@ track
