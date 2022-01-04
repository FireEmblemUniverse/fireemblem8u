	.align 2
	@********************** Track  1 **********************@

	.global song125_1
song125_1:	@ 0x0857D748
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x29
	.byte	0xBE
	.byte	0x28
	.byte	0xD3
	.byte	0x49
	.byte	0x7F
	.byte	0x84
	.byte	0x4E
	.byte	0x94
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song125_2
song125_2:	@ 0x0857D757
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x2A
	.byte	0xC1
	.byte	0x02
	.byte	0xBE
	.byte	0x28
	.byte	0xC0
	.byte	0x3A
	.byte	0xD3
	.byte	0x49
	.byte	0x7F
	.byte	0x84
	.byte	0x4E
	.byte	0x94
	.byte	0xB1
	.align 2
	.global song125
song125:	@ 0x0857D768
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song125_1		@ track
	.word	song125_2		@ track
