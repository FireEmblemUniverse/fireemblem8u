	.align 2
	@********************** Track  1 **********************@

	.global song133_1
song133_1:	@ 0x0857D974
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x21
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
	.global song133
song133:	@ 0x0857D984
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song133_1		@ track
