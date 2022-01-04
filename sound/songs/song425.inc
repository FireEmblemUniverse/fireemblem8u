	.align 2
	@********************** Track  1 **********************@

	.global song425_1
song425_1:	@ 0x08581A68
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x08
	.byte	0xBE
	.byte	0x6E
	.byte	0xE7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song425
song425:	@ 0x08581A78
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song425_1		@ track
