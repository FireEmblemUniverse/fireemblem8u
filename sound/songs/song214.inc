	.align 2
	@********************** Track  1 **********************@

	.global song214_1
song214_1:	@ 0x0857E990
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x67
	.byte	0xBE
	.byte	0x50
	.byte	0xEF
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song214
song214:	@ 0x0857E9A0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song214_1		@ track
