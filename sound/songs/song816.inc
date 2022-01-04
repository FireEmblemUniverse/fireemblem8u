	.align 2
	@********************** Track  1 **********************@

	.global song816_1
song816_1:	@ 0x0858470C
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x5F
	.byte	0xBD
	.byte	0x2C
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

	.global song816_2
song816_2:	@ 0x0858471C
	.byte	0xBE
	.byte	0x5F
	.byte	0xBD
	.byte	0x29
	.byte	0xBC
	.byte	0x00
	.byte	0xBE
	.byte	0x0E
	.byte	0xD5
	.byte	0x3C
	.byte	0x7F
	.byte	0x86
	.byte	0xBE
	.byte	0x2C
	.byte	0xD5
	.byte	0x37
	.byte	0x7F
	.byte	0x86
	.byte	0xBE
	.byte	0x4A
	.byte	0xD5
	.byte	0x30
	.byte	0x7F
	.byte	0x86
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song816
song816:	@ 0x08584738
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song816_1		@ track
	.word	song816_2		@ track
