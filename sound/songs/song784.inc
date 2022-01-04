	.align 2
	@********************** Track  1 **********************@

	.global song784_1
song784_1:	@ 0x08583F00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x6E
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x70
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x9C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song784
song784:	@ 0x08583F10
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song784_1		@ track
