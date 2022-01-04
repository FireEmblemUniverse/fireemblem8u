	.align 2
	@********************** Track  1 **********************@

	.global song741_1
song741_1:	@ 0x08583494
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x28
	.byte	0xBD
	.byte	0x3A
	.byte	0xBC
	.byte	0x00
	.byte	0xD1
	.byte	0x53
	.byte	0x7F
	.byte	0x82
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song741
song741:	@ 0x085834A4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song741_1		@ track
