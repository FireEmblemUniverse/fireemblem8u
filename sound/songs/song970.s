	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song970_1
song970_1:	@ 0x08586944
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 100
	.byte	VOL	, v085
	.byte	BENDR	, 12
	.byte		N02	, Cs2, v127
	.byte	W02
	.byte			Ds2
	.byte	W02
	.byte			Gn2
	.byte	W02
	.byte			Dn2
	.byte	W02
	.byte			Cn2
	.byte	W01
	.byte			An1
	.byte	W02
	.byte	FINE

	@********************** Track  2 **********************@

	.global song970_2
song970_2:	@ 0x0858695D
	.byte	KEYSH	, 0
	.byte	VOICE	, 113
	.byte	VOL	, v085
	.byte	BENDR	, 12
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	W02
	.byte	FINE

	@********************** Track  3 **********************@

	.global song970_3
song970_3:	@ 0x0858696B
	.byte	KEYSH	, 0
	.byte	VOICE	, 48
	.byte	VOL	, v085
	.byte	BENDR	, 12
	.byte		N44	, Cn4, v127
	.byte	W44
	.byte	FINE

	.align 2
	.global song970
song970:	@ 0x08586978
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song970_1		@ track
	.word	song970_2		@ track
	.word	song970_3		@ track
