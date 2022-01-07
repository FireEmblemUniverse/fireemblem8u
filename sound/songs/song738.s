	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song738_1
song738_1:	@ 0x08583324
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 51
	.byte	BENDR	, 12
	.byte	VOL	, v018
	.byte		N60	, Cn3, v127
	.byte	W02
	.byte	VOL	, v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v075
	.byte	W06
	.byte	W16
	.byte		v074
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v000
	.byte	FINE

	.align 2
	.global song738
song738:	@ 0x08583380
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song738_1		@ track
