	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song127_1
song127_1:	@ 0x0857D7C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 44
	.byte	VOL	, v127
	.byte	BENDR	, 6
	.byte	BEND	, c_v
	.byte		N24	, Cn3, v127
	.byte	W02
	.byte	VOL	, v120
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v110
	.byte	W01
	.byte		v101
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v092
	.byte	W01
	.byte		v084
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v076
	.byte	W01
	.byte		v069
	.byte	BEND	, c_v+8
	.byte	W01
	.byte	VOL	, v062
	.byte	W01
	.byte		v056
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v050
	.byte	W01
	.byte		v044
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v039
	.byte	W01
	.byte		v035
	.byte	BEND	, c_v+26
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v027
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v024
	.byte	W01
	.byte		v021
	.byte	BEND	, c_v+42
	.byte	W01
	.byte	VOL	, v019
	.byte	W01
	.byte		v018
	.byte	BEND	, c_v+53
	.byte	W01
	.byte	VOL	, v016
	.byte	W01
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	FINE

	.align 2
	.global song127
song127:	@ 0x0857D824
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song127_1		@ track
