	.align 2
	@********************** Track  1 **********************@

	.global song122_1
song122_1:	@ 0x0857D6B0
	.byte	0xBE
	.byte	0x1E
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x27
	.byte	0xD1
	.byte	0x4C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song122
song122:	@ 0x0857D6C0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song122_1		@ track
