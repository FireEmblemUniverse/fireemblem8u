	.align 2
	@********************** Track  1 **********************@

	.global song757_1
song757_1:	@ 0x08583D48
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x45
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xFF
	.byte	0x43
	.byte	0x7F
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song757
song757:	@ 0x08583D58
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song757_1		@ track
