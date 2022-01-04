	.align 2
	@********************** Track  1 **********************@

	.global song701_1
song701_1:	@ 0x08582A08
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x7F
	.byte	0xBD
	.byte	0x0B
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
	.global song701
song701:	@ 0x08582A18
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song701_1		@ track
