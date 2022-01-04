	.align 2
	@********************** Track  1 **********************@

	.global song806_1
song806_1:	@ 0x08584584
	.byte	0xBB
	.byte	0x4B
	.byte	0xBE
	.byte	0x50
	.byte	0xBD
	.byte	0x02
	.byte	0xBC
	.byte	0x00
	.byte	0xEB
	.byte	0x3C
	.byte	0x7F
	.byte	0x9C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00
	@********************** Track  2 **********************@

	.global song806_2
song806_2:	@ 0x08584594
	.byte	0xBE
	.byte	0x2F
	.byte	0xBD
	.byte	0x65
	.byte	0xBC
	.byte	0x00
	.byte	0xD1
	.byte	0x37
	.byte	0x7F
	.byte	0x82
	.byte	0x32
	.byte	0x82
	.byte	0xBD
	.byte	0x64
	.byte	0xD1
	.byte	0x37
	.byte	0x64
	.byte	0x82
	.byte	0x36
	.byte	0x32
	.byte	0x82
	.byte	0x34
	.byte	0x3C
	.byte	0x82
	.byte	0x32
	.byte	0x1E
	.byte	0x82
	.byte	0xB1
	.align 2
	.global song806
song806:	@ 0x085845B0
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song806_1		@ track
	.word	song806_2		@ track
