	.align 2
	@********************** Track  1 **********************@

	.global song177_1
song177_1:	@ 0x0857E30C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x46
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
	.global song177
song177:	@ 0x0857E31C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song177_1		@ track
