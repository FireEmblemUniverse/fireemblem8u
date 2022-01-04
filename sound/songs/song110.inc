	.align 2
	@********************** Track  1 **********************@

	.global song110_1
song110_1:	@ 0x0857D2B8
	.byte	0xBE
	.byte	0x32
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x08
	.byte	0xD1
	.byte	0x4B
	.byte	0x7F
	.byte	0x82
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song110
song110:	@ 0x0857D2C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song110_1		@ track
