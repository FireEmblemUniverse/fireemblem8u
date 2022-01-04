	.align 2
	@********************** Track  1 **********************@

	.global song807_1
song807_1:	@ 0x085845C0
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x69
	.byte	0xBD
	.byte	0x03
	.byte	0xBC
	.byte	0x00
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x9C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	@********************** Track  2 **********************@

	.global song807_2
song807_2:	@ 0x085845D0
	.byte	0xBE
	.byte	0x29
	.byte	0xBD
	.byte	0x64
	.byte	0xBC
	.byte	0x00
	.byte	0xD1
	.byte	0x41
	.byte	0x7F
	.byte	0x82
	.byte	0x34
	.byte	0x5A
	.byte	0x82
	.byte	0x3C
	.byte	0x7F
	.byte	0x82
	.byte	0x44
	.byte	0x5A
	.byte	0x82
	.byte	0x41
	.byte	0x7F
	.byte	0x82
	.byte	0x32
	.byte	0x5A
	.byte	0x82
	.byte	0x3C
	.byte	0x7F
	.byte	0x82
	.byte	0x32
	.byte	0x5A
	.byte	0x82
	.byte	0xB1
	.align 2
	.global song807
song807:	@ 0x085845F0
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song807_1		@ track
	.word	song807_2		@ track
