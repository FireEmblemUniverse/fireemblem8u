	.align 2
	@********************** Track  1 **********************@

	.global song729_1
song729_1:	@ 0x085831E4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x2A
	.byte	0xBE
	.byte	0x7F
	.byte	0xBF
	.byte	0x40
	.byte	0xEA
	.byte	0x3C
	.byte	0x7F
	.byte	0x9B
	.byte	0x83
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song729_2
song729_2:	@ 0x085831F4
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x31
	.byte	0xBE
	.byte	0x28
	.byte	0xBF
	.byte	0x40
	.byte	0xD7
	.byte	0x41
	.byte	0x40
	.byte	0x89
	.byte	0xDD
	.byte	0x3E
	.byte	0x2C
	.byte	0x8E
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song729
song729:	@ 0x08583208
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song729_1		@ track
	.word	song729_2		@ track
