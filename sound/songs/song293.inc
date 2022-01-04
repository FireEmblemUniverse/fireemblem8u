	.align 2
	@********************** Track  1 **********************@

	.global song293_1
song293_1:	@ 0x0857F9C0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x2E
	.byte	0xBE
	.byte	0x6E
	.byte	0xFB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.align 2
	.global song293
song293:	@ 0x0857F9D0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song293_1		@ track
