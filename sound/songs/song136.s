	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song136_1
song136_1:	@ 0x0857DA4C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 32
	.byte	BENDR	, 3
	.byte	VOL	, v052
	.byte	BEND	, c_v
	.byte		N48	, Cs3, v127
	.byte	W02
	.byte	VOL	, v064
	.byte	BEND	, c_v+7
	.byte	W02
	.byte	VOL	, v077
	.byte	BEND	, c_v+15
	.byte	W02
	.byte	VOL	, v090
	.byte	BEND	, c_v+23
	.byte	W02
	.byte	VOL	, v104
	.byte	BEND	, c_v+31
	.byte	W02
	.byte		c_v+39
	.byte	W02
	.byte		c_v+47
	.byte	W02
	.byte		c_v+55
	.byte	W02
	.byte		c_v+63
	.byte	W08
	.byte	W08
	.byte	VOL	, v098
	.byte	W02
	.byte		v085
	.byte	W02
	.byte		v074
	.byte	W02
	.byte		v063
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v016
	.byte	W02
	.byte	FINE

	.align 2
	.global song136
song136:	@ 0x0857DA8C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song136_1		@ track
