	.align 2
	@********************** Track  1 **********************@

	.global song717_1
song717_1:	@ 0x08582B3C
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x32
	.byte	0xBD
	.byte	0x1B
	.byte	0xBC
	.byte	0x00
	.byte	0xED
	.byte	0x48
	.byte	0x7F
	.byte	0x9E
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song717
song717:	@ 0x08582B4C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song717_1		@ track
