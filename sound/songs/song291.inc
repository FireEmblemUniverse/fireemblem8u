	.align 2
	@********************** Track  1 **********************@

	.global song291_1
song291_1:	@ 0x0857F980
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x32
	.byte	0xBE
	.byte	0x50
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x8C
	.byte	0xDA
	.byte	0x3C
	.byte	0x60
	.byte	0x8C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song291
song291:	@ 0x0857F994
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song291_1		@ track
