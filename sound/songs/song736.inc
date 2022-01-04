	.align 2
	@********************** Track  1 **********************@

	.global song736_1
song736_1:	@ 0x08583250
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x31
	.byte	0xBE
	.byte	0x5A
	.byte	0xBF
	.byte	0x40
	.byte	0xDB
	.byte	0x35
	.byte	0x70
	.byte	0x8C
	.byte	0xD2
	.byte	0x35
	.byte	0x24
	.byte	0x83
	.byte	0x35
	.byte	0x1C
	.byte	0x83
	.byte	0x35
	.byte	0x14
	.byte	0x83
	.byte	0x35
	.byte	0x08
	.byte	0x83
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song736_2
song736_2:	@ 0x0858326C
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x32
	.byte	0xBE
	.byte	0x5A
	.byte	0xBF
	.byte	0x40
	.byte	0xE7
	.byte	0x3A
	.byte	0x64
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.align 2
	.global song736
song736:	@ 0x0858327C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song736_1		@ track
	.word	song736_2		@ track
