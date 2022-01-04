	.align 2
	@********************** Track  1 **********************@

	.global song172_1
song172_1:	@ 0x0857E2B8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x2F
	.byte	0xBE
	.byte	0x7F
	.byte	0xE3
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song172
song172:	@ 0x0857E2C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song172_1		@ track
