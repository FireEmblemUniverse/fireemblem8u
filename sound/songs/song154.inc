	.align 2
	@********************** Track  1 **********************@

	.global song154_1
song154_1:	@ 0x0857E0AC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x04
	.byte	0xBE
	.byte	0x70
	.byte	0xBF
	.byte	0x40
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song154
song154:	@ 0x0857E0BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song154_1		@ track
