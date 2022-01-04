	.align 2
	@********************** Track  1 **********************@

	.global song782_1
song782_1:	@ 0x08583EE4
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x2F
	.byte	0xBD
	.byte	0x03
	.byte	0xBC
	.byte	0x00
	.byte	0xDB
	.byte	0x48
	.byte	0x7F
	.byte	0x8C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song782
song782:	@ 0x08583EF4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song782_1		@ track
