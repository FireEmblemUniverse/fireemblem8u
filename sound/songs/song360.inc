	.align 2
	@********************** Track  1 **********************@

	.global song360_1
song360_1:	@ 0x0858150C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x0C
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
	.global song360
song360:	@ 0x0858151C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song360_1		@ track
