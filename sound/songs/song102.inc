	.align 2
	@********************** Track  1 **********************@

	.global song102_1
song102_1:	@ 0x0857D0B4
	.byte	0xBE
	.byte	0x37
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x01
	.byte	0xD3
	.byte	0x51
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song102
song102:	@ 0x0857D0C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song102_1		@ track
