	.align 2
	@********************** Track  1 **********************@

	.global song202_1
song202_1:	@ 0x0857E820
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x02
	.byte	0xBE
	.byte	0x55
	.byte	0xDD
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song202
song202:	@ 0x0857E830
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song202_1		@ track
