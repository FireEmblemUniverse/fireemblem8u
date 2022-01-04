	.align 2
	@********************** Track  1 **********************@

	.global song733_1
song733_1:	@ 0x08583234
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x46
	.byte	0xBD
	.byte	0x2E
	.byte	0xBC
	.byte	0x00
	.byte	0xF3
	.byte	0x48
	.byte	0x7F
	.byte	0xA4
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song733
song733:	@ 0x08583244
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song733_1		@ track
