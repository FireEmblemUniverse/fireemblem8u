	.align 2
	@********************** Track  1 **********************@

	.global song957_1
song957_1:	@ 0x085862EC
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x78
	.byte	0xBD
	.byte	0x05
	.byte	0xBC
	.byte	0x00
	.byte	0xDB
	.byte	0x3C
	.byte	0x7F
	.byte	0x8C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song957
song957:	@ 0x085862FC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song957_1		@ track
