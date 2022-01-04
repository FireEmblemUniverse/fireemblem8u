	.align 2
	@********************** Track  1 **********************@

	.global song112_1
song112_1:	@ 0x0857D32C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x20
	.byte	0xBE
	.byte	0x7F
	.byte	0xD5
	.byte	0x51
	.byte	0x7F
	.byte	0x86
	.byte	0x58
	.byte	0x86
	.byte	0x56
	.byte	0x86
	.byte	0x58
	.byte	0x86
	.byte	0x5D
	.byte	0x98
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song112_2
song112_2:	@ 0x0857D341
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x21
	.byte	0xBE
	.byte	0x28
	.byte	0xD5
	.byte	0x5D
	.byte	0x7F
	.byte	0x86
	.byte	0x64
	.byte	0x86
	.byte	0x62
	.byte	0x86
	.byte	0x64
	.byte	0x86
	.byte	0x69
	.byte	0x98
	.byte	0xB1
	.align 2
	.global song112
song112:	@ 0x0857D354
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song112_1		@ track
	.word	song112_2		@ track
