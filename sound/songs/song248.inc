	.align 2
	@********************** Track  1 **********************@

	.global song248_1
song248_1:	@ 0x0857EDC8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x07
	.byte	0xBE
	.byte	0x6E
	.byte	0xEE
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song248
song248:	@ 0x0857EDD8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song248_1		@ track
