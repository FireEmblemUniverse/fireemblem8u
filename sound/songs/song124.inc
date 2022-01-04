	.align 2
	@********************** Track  1 **********************@

	.global song124_1
song124_1:	@ 0x0857D728
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x22
	.byte	0xBE
	.byte	0x46
	.byte	0xD1
	.byte	0x6C
	.byte	0x7F
	.byte	0x84
	.byte	0xD1
	.byte	0x84
	.byte	0xD1
	.byte	0x84
	.byte	0xD1
	.byte	0x8C
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song124
song124:	@ 0x0857D73C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song124_1		@ track
