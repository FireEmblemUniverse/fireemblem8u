	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song186_1
song186_1:	@ 0x0857E4F0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 49
	.byte	VOL	, v127
	.byte		N12	, Ds2, v127
	.byte	W20
	.byte		N40	, As2
	.byte	W04
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song186
song186:	@ 0x0857E504
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song186_1		@ track
