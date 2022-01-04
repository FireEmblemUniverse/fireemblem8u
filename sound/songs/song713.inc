	.align 2
	@********************** Track  1 **********************@

	.global song713_1
song713_1:	@ 0x08582B04
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x69
	.byte	0xBD
	.byte	0x17
	.byte	0xBC
	.byte	0x00
	.byte	0xEF
	.byte	0x3C
	.byte	0x7F
	.byte	0xA0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song713
song713:	@ 0x08582B14
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song713_1		@ track
