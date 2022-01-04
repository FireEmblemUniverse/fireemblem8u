	.align 2
	@********************** Track  1 **********************@

	.global song730_1
song730_1:	@ 0x08583218
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x78
	.byte	0xBD
	.byte	0x2B
	.byte	0xBC
	.byte	0x00
	.byte	0xF7
	.byte	0x48
	.byte	0x7F
	.byte	0xA8
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song730
song730:	@ 0x08583228
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song730_1		@ track
