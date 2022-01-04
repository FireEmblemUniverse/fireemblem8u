	.align 2
	@********************** Track  1 **********************@

	.global song722_1
song722_1:	@ 0x08582BD8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x21
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xD2
	.byte	0x3B
	.byte	0x70
	.byte	0x83
	.byte	0x39
	.byte	0x83
	.byte	0xE9
	.byte	0x37
	.byte	0x7F
	.byte	0x9A
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song722_2
song722_2:	@ 0x08582BED
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x22
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xE9
	.byte	0x37
	.byte	0x7F
	.byte	0x9A
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song722
song722:	@ 0x08582BFC
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song722_1		@ track
	.word	song722_2		@ track
