	.align 2
	@********************** Track  1 **********************@

	.global song373_1
song373_1:	@ 0x08581640
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x11
	.byte	0xBE
	.byte	0x75
	.byte	0xE7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song373
song373:	@ 0x08581650
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song373_1		@ track
