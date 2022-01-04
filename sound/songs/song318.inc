	.align 2
	@********************** Track  1 **********************@

	.global song318_1
song318_1:	@ 0x0857FE7C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x14
	.byte	0xBE
	.byte	0x7F
	.byte	0xE3
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song318
song318:	@ 0x0857FE8C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song318_1		@ track
