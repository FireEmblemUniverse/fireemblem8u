	.align 2
	@********************** Track  1 **********************@

	.global song132_1
song132_1:	@ 0x0857D958
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x24
	.byte	0xBE
	.byte	0x50
	.byte	0xDD
	.byte	0x58
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song132
song132:	@ 0x0857D968
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song132_1		@ track
