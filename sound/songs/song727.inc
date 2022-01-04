	.align 2
	@********************** Track  1 **********************@

	.global song727_1
song727_1:	@ 0x08583190
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x28
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xF7
	.byte	0x3C
	.byte	0x7F
	.byte	0xA8
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song727_2
song727_2:	@ 0x0858319F
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x21
	.byte	0xBE
	.byte	0x27
	.byte	0xBF
	.byte	0x40
	.byte	0xD2
	.byte	0x3D
	.byte	0x68
	.byte	0x83
	.byte	0x3B
	.byte	0x5C
	.byte	0x83
	.byte	0x3A
	.byte	0x4C
	.byte	0x83
	.byte	0x37
	.byte	0x40
	.byte	0x83
	.byte	0x35
	.byte	0x34
	.byte	0x83
	.byte	0xB1
	.align 2
	.global song727
song727:	@ 0x085831B8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song727_1		@ track
	.word	song727_2		@ track
