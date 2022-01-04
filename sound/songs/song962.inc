	.align 2
	@********************** Track  1 **********************@

	.global song962_1
song962_1:	@ 0x085864A0
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x31
	.byte	0xBD
	.byte	0x67
	.byte	0xBC
	.byte	0x00
	.byte	0xD3
	.byte	0x4C
	.byte	0x7F
	.byte	0x84
	.byte	0xBE
	.byte	0x29
	.byte	0xD3
	.byte	0x4C
	.byte	0x7F
	.byte	0x84
	.byte	0xBE
	.byte	0x21
	.byte	0xD3
	.byte	0x4C
	.byte	0x7F
	.byte	0x84
	.byte	0xBE
	.byte	0x18
	.byte	0xD3
	.byte	0x4C
	.byte	0x7F
	.byte	0x84
	.byte	0xB1
	.byte	0x00
	@********************** Track  2 **********************@

	.global song962_2
song962_2:	@ 0x085864C0
	.byte	0xBE
	.byte	0x69
	.byte	0xBD
	.byte	0x74
	.byte	0xBC
	.byte	0x00
	.byte	0x8C
	.byte	0xFF
	.byte	0x43
	.byte	0x7F
	.byte	0xB0
	.byte	0xB1
	.align 2
	.global song962
song962:	@ 0x085864CC
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song962_1		@ track
	.word	song962_2		@ track
