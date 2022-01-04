	.align 2
	@********************** Track  1 **********************@

	.global song745_1
song745_1:	@ 0x08583518
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x3F
	.byte	0xBE
	.byte	0x73
	.byte	0xBF
	.byte	0x40
	.byte	0xD5
	.byte	0x3D
	.byte	0x7F
	.byte	0xD5
	.byte	0x45
	.byte	0x86
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song745
song745:	@ 0x0858352C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song745_1		@ track
