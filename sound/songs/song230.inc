	.align 2
	@********************** Track  1 **********************@

	.global song230_1
song230_1:	@ 0x0857EBBC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x5A
	.byte	0xBE
	.byte	0x7F
	.byte	0xCF
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x8C
	.byte	0xCE
	.byte	0x8C
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song230
song230:	@ 0x0857EBD0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song230_1		@ track
