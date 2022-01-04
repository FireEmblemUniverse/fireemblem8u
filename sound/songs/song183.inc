	.align 2
	@********************** Track  1 **********************@

	.global song183_1
song183_1:	@ 0x0857E40C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x4D
	.byte	0xBE
	.byte	0x7F
	.byte	0xEF
	.byte	0x3E
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song183
song183:	@ 0x0857E41C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song183_1		@ track
