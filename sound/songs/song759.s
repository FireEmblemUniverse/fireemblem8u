	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song759_1
song759_1:	@ 0x08583D64
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 53
	.byte	MOD	, 20
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	LFOS	, 20
	.byte		N84	, Cn4, v120
	.byte	W56
	.byte	W01
	.byte	VOL	, v118
	.byte	W01
	.byte		v110
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	W08
	.byte	FINE

	.align 2
	.global song759
song759:	@ 0x08583DA4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song759_1		@ track
