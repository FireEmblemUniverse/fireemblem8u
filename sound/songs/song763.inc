	.align 2
	@********************** Track  1 **********************@

	.global song763_1
song763_1:	@ 0x08583E0C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x48
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xEF
	.byte	0x3C
	.byte	0x5C
	.byte	0xA0
	.byte	0xEF
	.byte	0xA0
	.byte	0xB1
	@********************** Track  2 **********************@

	.global song763_2
song763_2:	@ 0x08583E1D
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x45
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xFF
	.byte	0x42
	.byte	0x64
	.byte	0xB0
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.align 2
	.global song763
song763:	@ 0x08583E2C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song763_1		@ track
	.word	song763_2		@ track
