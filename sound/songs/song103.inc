	.align 2
	@********************** Track  1 **********************@

	.global song103_1
song103_1:	@ 0x0857D0D0
	.byte	0xBE
	.byte	0x37
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x01
	.byte	0xD3
	.byte	0x53
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song103
song103:	@ 0x0857D0E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song103_1		@ track
