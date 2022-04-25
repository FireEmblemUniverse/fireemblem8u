	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song969_1
song969_1:	@ 0x085868D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 101
	.byte	VOL	, v029
	.byte	BENDR	, 12
	.byte		N02	, En2, v127
	.byte	W03
	.byte			En2, v064
	.byte	W03
	.byte			Ds4, v127
	.byte	W03
	.byte			Ds4, v048
	.byte	W03
	.byte			As2, v127
	.byte	W03
	.byte			As2, v056
	.byte	W02
	.byte	FINE

	@********************** Track  2 **********************@

	.global song969_2
song969_2:	@ 0x085868EE
	.byte	KEYSH	, 0
	.byte	VOICE	, 88
	.byte	VOL	, v095
	.byte	BENDR	, 12
	.byte		N05	, En3, v127
	.byte	W06
	.byte	BEND	, c_v+63
	.byte		N14	, Gn4
	.byte	W01
	.byte	BEND	, c_v+53
	.byte	W01
	.byte		c_v+42
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-21
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-42
	.byte	W01
	.byte		c_v-64
	.byte	W05
	.byte	FINE

	@********************** Track  3 **********************@

	.global song969_3
song969_3:	@ 0x08586913
	.byte	KEYSH	, 0
	.byte	VOICE	, 103
	.byte	VOL	, v029
	.byte	BENDR	, 12
	.byte		N02	, En2, v127
	.byte	W03
	.byte			En2, v064
	.byte	W03
	.byte			Ds4, v127
	.byte	W03
	.byte			Ds4, v048
	.byte	W03
	.byte			As2, v127
	.byte	W03
	.byte			As2, v056
	.byte	W02
	.byte	FINE

	.align 2
	.global song969
song969:	@ 0x08586930
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song969_1		@ track
	.word	song969_2		@ track
	.word	song969_3		@ track
