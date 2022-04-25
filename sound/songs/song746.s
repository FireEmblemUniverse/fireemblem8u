	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song746_1
song746_1:	@ 0x08583538
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 63
	.byte	VOL	, v024
	.byte	PAN	, c_v
	.byte	VOL	, v028
	.byte		N30	, Cs3, v080
	.byte		N30	, An3
	.byte	W01
	.byte	VOL	, v034
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v095
	.byte	W18
	.byte	FINE

	.align 2
	.global song746
song746:	@ 0x08583564
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song746_1		@ track
