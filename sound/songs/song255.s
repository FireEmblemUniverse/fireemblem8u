	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song255_1
song255_1:	@ 0x0857F01C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 31
	.byte	VOL	, v127
	.byte	BENDR	, 2
	.byte	BEND	, c_v
	.byte		N32	, Cs3, v127
	.byte	W02
	.byte	VOL	, v119
	.byte	W01
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v111
	.byte	W01
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v103
	.byte	W01
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v095
	.byte	W01
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v087
	.byte	W01
	.byte	BEND	, c_v+22
	.byte	W01
	.byte	VOL	, v079
	.byte	W01
	.byte	BEND	, c_v+27
	.byte	W01
	.byte	VOL	, v071
	.byte	W01
	.byte	BEND	, c_v+31
	.byte	W01
	.byte	VOL	, v063
	.byte	W01
	.byte	BEND	, c_v+36
	.byte	W01
	.byte	VOL	, v055
	.byte	W01
	.byte	BEND	, c_v+41
	.byte	W01
	.byte	VOL	, v047
	.byte	W01
	.byte	BEND	, c_v+45
	.byte	W01
	.byte	VOL	, v039
	.byte	W01
	.byte	BEND	, c_v+50
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte	BEND	, c_v+54
	.byte	W01
	.byte	VOL	, v023
	.byte	W01
	.byte	BEND	, c_v+59
	.byte	W01
	.byte	VOL	, v015
	.byte	W01
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v008
	.byte	W18
	.byte	FINE

	.align 2
	.global song255
song255:	@ 0x0857F084
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song255_1		@ track
