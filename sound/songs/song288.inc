	.align 2
	@********************** Track  1 **********************@

	.global song288_1
song288_1:	@ 0x0857F7A8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x30
	.byte	0xBE
	.byte	0x3E
	.byte	0xFF
	.byte	0x3C
	.byte	0x7F
	.byte	0x81
	.byte	0xBE
	.byte	0x46
	.byte	0x81
	.byte	0x4E
	.byte	0x81
	.byte	0x56
	.byte	0x81
	.byte	0x5E
	.byte	0x81
	.byte	0x64
	.byte	0x93
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.align 2
	.global song288
song288:	@ 0x0857F7C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song288_1		@ track
