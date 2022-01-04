	.align 2
	@********************** Track  1 **********************@

	.global song313_1
song313_1:	@ 0x0857FD94
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x10
	.byte	0xBE
	.byte	0x70
	.byte	0xCF
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x98
	.byte	0x88
	.byte	0xCE
	.byte	0x90
	.byte	0xB1
	.align 2
	.global song313
song313:	@ 0x0857FDA8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song313_1		@ track
