	.align 2
	@********************** Track  1 **********************@

	.global song728_1
song728_1:	@ 0x085831C8
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x78
	.byte	0xBD
	.byte	0x29
	.byte	0xBC
	.byte	0x00
	.byte	0xF7
	.byte	0x48
	.byte	0x7F
	.byte	0xA8
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song728
song728:	@ 0x085831D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song728_1		@ track
