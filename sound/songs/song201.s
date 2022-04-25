	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song201_1
song201_1:	@ 0x0857E804
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte	VOL	, v080
	.byte		N16	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song201
song201:	@ 0x0857E814
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song201_1		@ track
