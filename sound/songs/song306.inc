	.align 2
	@********************** Track  1 **********************@

	.global song306_1
song306_1:	@ 0x0857FB58
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x0B
	.byte	0xBE
	.byte	0x7F
	.byte	0xEF
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song306
song306:	@ 0x0857FB68
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song306_1		@ track
