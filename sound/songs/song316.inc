	.align 2
	@********************** Track  1 **********************@

	.global song316_1
song316_1:	@ 0x0857FDD4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x12
	.byte	0xBE
	.byte	0x7F
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.align 2
	.global song316
song316:	@ 0x0857FDE4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song316_1		@ track
