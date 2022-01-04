	.align 2
	@********************** Track  1 **********************@

	.global song176_1
song176_1:	@ 0x0857E2F0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x45
	.byte	0xBE
	.byte	0x7F
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song176
song176:	@ 0x0857E300
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song176_1		@ track
