	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song747_1
song747_1:	@ 0x08583570
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 63
	.byte	VOL	, v023
	.byte	PAN	, c_v
	.byte	VOL	, v024
	.byte		N64	, Cs3, v080
	.byte		N64	, An3
	.byte	W01
	.byte	VOL	, v025
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W28
	.byte	W01
	.byte	FINE

	.align 2
	.global song747
song747:	@ 0x085835D0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song747_1		@ track
