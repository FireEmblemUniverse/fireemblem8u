	.align 2
	@********************** Track  1 **********************@

	.global song772_1
song772_1:	@ 0x08583E58
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x7F
	.byte	0xBD
	.byte	0x01
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
	.align 2
	.global song772
song772:	@ 0x08583E68
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song772_1		@ track
