	.align 2
	@********************** Track  1 **********************@

	.global song594_1
song594_1:	@ 0x08582574
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x41
	.byte	0xBE
	.byte	0x75
	.byte	0xE7
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song594
song594:	@ 0x08582584
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song594_1		@ track
