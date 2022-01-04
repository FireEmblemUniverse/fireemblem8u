	.align 2
	@********************** Track  1 **********************@

	.global song283_1
song283_1:	@ 0x0857F720
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x25
	.byte	0xBE
	.byte	0x78
	.byte	0xF3
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song283
song283:	@ 0x0857F730
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song283_1		@ track
