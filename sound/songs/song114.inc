	.align 2
	@********************** Track  1 **********************@

	.global song114_1
song114_1:	@ 0x0857D39C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x0F
	.byte	0xBE
	.byte	0x50
	.byte	0xD0
	.byte	0x3D
	.byte	0x7F
	.byte	0x82
	.byte	0x44
	.byte	0x82
	.byte	0x45
	.byte	0x82
	.byte	0x3E
	.byte	0x82
	.byte	0x45
	.byte	0x82
	.byte	0x46
	.byte	0x82
	.byte	0x3F
	.byte	0x82
	.byte	0x46
	.byte	0x82
	.byte	0x47
	.byte	0x88
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song114
song114:	@ 0x0857D3BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song114_1		@ track
