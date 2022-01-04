	.align 2
	@********************** Track  1 **********************@

	.global song215_1
song215_1:	@ 0x0857E9AC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x1A
	.byte	0xBE
	.byte	0x7F
	.byte	0x8A
	.byte	0xDD
	.byte	0x3C
	.byte	0x7F
	.byte	0x8E
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song215
song215:	@ 0x0857E9BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song215_1		@ track
