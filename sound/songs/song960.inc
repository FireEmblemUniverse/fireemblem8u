	.align 2
	@********************** Track  1 **********************@

	.global song960_1
song960_1:	@ 0x08586484
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x69
	.byte	0xBD
	.byte	0x32
	.byte	0xBC
	.byte	0x00
	.byte	0xF4
	.byte	0x3C
	.byte	0x7F
	.byte	0xA5
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song960
song960:	@ 0x08586494
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song960_1		@ track
