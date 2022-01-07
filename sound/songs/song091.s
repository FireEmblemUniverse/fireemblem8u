	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song091_1
song091_1:	@ 0x0857CEA8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 87
	.byte	VOICE	, 81
	.byte	VOL	, v100
	.byte	PAN	, c_v+10
	.byte		N22	, Cn4, v127
	.byte	W24
	.byte		N05	, Dn4
	.byte	W08
	.byte			Cn4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte		N44	, En4
	.byte	W48
	.byte	FINE

	@********************** Track  2 **********************@

	.global song091_2
song091_2:	@ 0x0857CEC1
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	VOL	, v100
	.byte	PAN	, c_v-10
	.byte		N22	, Ds3, v127
	.byte	W24
	.byte		N05	, As3
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			As3
	.byte	W08
	.byte		N44	, Gn3
	.byte	W48
	.byte	FINE

	@********************** Track  3 **********************@

	.global song091_3
song091_3:	@ 0x0857CED8
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	VOL	, v100
	.byte	PAN	, c_v+20
	.byte		N22	, Cn3, v127
	.byte	W24
	.byte		N22	
	.byte	W24
	.byte		N44	, Gn2
	.byte	W48
	.byte	FINE

	@********************** Track  4 **********************@

	.global song091_4
song091_4:	@ 0x0857CEEA
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	VOL	, v100
	.byte	PAN	, c_v-20
	.byte		N22	, Gs2, v127
	.byte	W24
	.byte			Fn2
	.byte	W24
	.byte		N44	, Cn2
	.byte	W48
	.byte	FINE

	.align 2
	.global song091
song091:	@ 0x0857CEFC
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	60		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song091_1		@ track
	.word	song091_2		@ track
	.word	song091_3		@ track
	.word	song091_4		@ track
