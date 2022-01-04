	.align 2
	@********************** Track  1 **********************@

	.global song305_1
song305_1:	@ 0x0857FB38
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x0D
	.byte	0xBE
	.byte	0x6E
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song305
song305:	@ 0x0857FB4C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song305_1		@ track
