	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song090_1
song090_1:	@ 0x0857CE30
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 84
	.byte	VOL	, v080
	.byte	PAN	, c_v+10
	.byte		N03	, Cn4, v127
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte		N44	, Dn5
	.byte	W12
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song090_2
song090_2:	@ 0x0857CE4E
	.byte	KEYSH	, 0
	.byte	VOICE	, 84
	.byte	VOL	, v080
	.byte	PAN	, c_v-10
	.byte		N03	, Gn3, v127
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte		N44	, An4
	.byte	W12
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  3 **********************@

	.global song090_3
song090_3:	@ 0x0857CE6A
	.byte	KEYSH	, 0
	.byte	VOICE	, 84
	.byte	VOL	, v080
	.byte	PAN	, c_v+20
	.byte		N32	, Ds3, v127
	.byte	W24
	.byte	W12
	.byte		N44	, Gn3
	.byte	W12
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  4 **********************@

	.global song090_4
song090_4:	@ 0x0857CE7D
	.byte	KEYSH	, 0
	.byte	VOICE	, 84
	.byte	VOL	, v080
	.byte	PAN	, c_v-20
	.byte		N32	, As2, v127
	.byte	W24
	.byte	W12
	.byte		N44	, Cn3
	.byte	W12
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song090
song090:	@ 0x0857CE90
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	60		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song090_1		@ track
	.word	song090_2		@ track
	.word	song090_3		@ track
	.word	song090_4		@ track
