	.align 2
	@********************** Track  1 **********************@

	.global song295_1
song295_1:	@ 0x0857FA18
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x33
	.byte	0xBE
	.byte	0x7F
	.byte	0xEC
	.byte	0x3C
	.byte	0x7F
	.byte	0x98
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song295
song295:	@ 0x0857FA28
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song295_1		@ track
