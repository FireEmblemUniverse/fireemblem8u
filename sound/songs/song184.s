	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song184_1
song184_1:	@ 0x0857E428
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 82
	.byte	VOL	, v080
	.byte		N01	, Cs2, v127
	.byte	W02
	.byte			Gs2
	.byte	W02
	.byte			An2
	.byte	W02
	.byte			Dn2
	.byte	W02
	.byte			An2
	.byte	W02
	.byte			As2
	.byte	W02
	.byte			Ds2
	.byte	W02
	.byte			As2
	.byte	W02
	.byte			Bn2
	.byte	W02
	.byte			En2
	.byte	W02
	.byte			Bn2
	.byte	W02
	.byte			Cn3
	.byte	W02
	.byte			En2, v072
	.byte	W02
	.byte			Bn2
	.byte	W02
	.byte			Cn3
	.byte	W02
	.byte			En2, v040
	.byte	W02
	.byte			Bn2
	.byte	W02
	.byte			Cn3
	.byte	W14
	.byte	FINE

	@********************** Track  2 **********************@

	.global song184_2
song184_2:	@ 0x0857E459
	.byte	KEYSH	, 0
	.byte	VOICE	, 83
	.byte	BENDR	, 12
	.byte	VOL	, v070
	.byte	BEND	, c_v
	.byte		N36	, Fn2, v127
	.byte	W01
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v055
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v-29
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v-24
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v-21
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v-17
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v-13
	.byte	W01
	.byte		c_v+24
	.byte	W01
	.byte		c_v-8
	.byte	W01
	.byte		c_v+33
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte	VOL	, v036
	.byte	BEND	, c_v+42
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte	VOL	, v032
	.byte	BEND	, c_v+55
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+59
	.byte	W01
	.byte		c_v+27
	.byte	W01
	.byte	VOL	, v028
	.byte	BEND	, c_v+62
	.byte	W01
	.byte		c_v+30
	.byte	W01
	.byte	VOL	, v024
	.byte	BEND	, c_v+63
	.byte	W01
	.byte		c_v+31
	.byte	W13
	.byte	FINE

	.align 2
	.global song184
song184:	@ 0x0857E4C4
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song184_1		@ track
	.word	song184_2		@ track
