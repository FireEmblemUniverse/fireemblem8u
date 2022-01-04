	.align 2
	@********************** Track  1 **********************@

	.global song180_1
song180_1:	@ 0x0857E3B8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x4E
	.byte	0xBE
	.byte	0x64
	.byte	0xFB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.align 2
	.global song180
song180:	@ 0x0857E3C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song180_1		@ track
