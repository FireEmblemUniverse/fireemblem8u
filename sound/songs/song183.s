	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song183_1
song183_1:	@ 0x0857E40C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 77
	.byte	VOL	, v127
	.byte		N48	, Dn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song183
song183:	@ 0x0857E41C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song183_1		@ track
