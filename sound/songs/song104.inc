	.align 2
	@********************** Track  1 **********************@

	.global song104_1
song104_1:	@ 0x0857D0EC
	.byte	0xBE
	.byte	0x37
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x05
	.byte	0xC1
	.byte	0x05
	.byte	0xBA
	.byte	0x0A
	.byte	0xC0
	.byte	0x40
	.byte	0xD9
	.byte	0x57
	.byte	0x7F
	.byte	0x82
	.byte	0xC0
	.byte	0x7F
	.byte	0x82
	.byte	0x40
	.byte	0x82
	.byte	0x7F
	.byte	0x82
	.byte	0x40
	.byte	0x82
	.byte	0xBA
	.byte	0x00
	.byte	0x82
	.byte	0xB1
	.byte	0x00
	.align 2
	.global song104
song104:	@ 0x0857D10C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	31		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song104_1		@ track
