	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song114_1
song114_1:	@ 0x0857D39C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 15
	.byte	VOL	, v080
	.byte		N01	, Cs3, v127
	.byte	W02
	.byte			Gs3
	.byte	W02
	.byte			An3
	.byte	W02
	.byte			Dn3
	.byte	W02
	.byte			An3
	.byte	W02
	.byte			As3
	.byte	W02
	.byte			Ds3
	.byte	W02
	.byte			As3
	.byte	W02
	.byte			Bn3
	.byte	W08
	.byte	FINE

	.align 2
	.global song114
song114:	@ 0x0857D3BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song114_1		@ track
