	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song128_1
song128_1:	@ 0x0857D830
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 43
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 1
	.byte		N04	, Cn3, v127
	.byte	W05
	.byte	BEND	, c_v+16
	.byte		N04	, Cn3, v072
	.byte	W05
	.byte	BEND	, c_v+32
	.byte		N04	, Cn3, v056
	.byte	W05
	.byte	BEND	, c_v+48
	.byte		N04	, Cn3, v040
	.byte	W05
	.byte	BEND	, c_v+63
	.byte		N04	, Cn3, v028
	.byte	W04
	.byte	FINE

	.align 2
	.global song128
song128:	@ 0x0857D85C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song128_1		@ track
