	.align 2
	@********************** Track  1 **********************@

	.global song716_1
song716_1:	@ 0x08582B20
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x5F
	.byte	0xBD
	.byte	0x1A
	.byte	0xBC
	.byte	0x00
	.byte	0xF7
	.byte	0x3C
	.byte	0x7F
	.byte	0xA8
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song716
song716:	@ 0x08582B30
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song716_1		@ track
