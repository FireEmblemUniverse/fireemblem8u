	.align 2
	@********************** Track  1 **********************@

	.global song235_1
song235_1:	@ 0x0857EC14
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x0F
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
	.global song235
song235:	@ 0x0857EC24
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song235_1		@ track
