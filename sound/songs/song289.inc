	.align 2
	@********************** Track  1 **********************@

	.global song289_1
song289_1:	@ 0x0857F7D0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x31
	.byte	0xBE
	.byte	0x38
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0x81
	.byte	0xBE
	.byte	0x3F
	.byte	0x81
	.byte	0x46
	.byte	0x81
	.byte	0x4D
	.byte	0x81
	.byte	0x55
	.byte	0x81
	.byte	0x5A
	.byte	0x93
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song289
song289:	@ 0x0857F7EC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song289_1		@ track
