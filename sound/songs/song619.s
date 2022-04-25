	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song619_1
song619_1:	@ 0x08582988
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 27
	.byte	VOL	, v127
	.byte	BENDR	, 2
	.byte	BEND	, c_v
	.byte		N16	, Cn3, v127
	.byte	W02
	.byte	BEND	, c_v+21
	.byte	W02
	.byte		c_v+42
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte	VOL	, v110
	.byte	W02
	.byte		v080
	.byte	W02
	.byte		v065
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v127
	.byte	BEND	, c_v
	.byte		N14	, Cn3, v048
	.byte	W02
	.byte	BEND	, c_v+21
	.byte	W02
	.byte		c_v+42
	.byte	W02
	.byte	VOL	, v110
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v080
	.byte	W02
	.byte		v065
	.byte	W02
	.byte		v050
	.byte	W20
	.byte	FINE

	.align 2
	.global song619
song619:	@ 0x085829C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song619_1		@ track
