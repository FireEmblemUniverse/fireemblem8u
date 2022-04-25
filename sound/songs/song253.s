	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song253_1
song253_1:	@ 0x0857EF40
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 41
	.byte	VOL	, v064
	.byte	BENDR	, 1
	.byte	BEND	, c_v-64
	.byte		TIE	, Cn3, v127
	.byte	W02
	.byte	VOL	, v071
	.byte	BEND	, c_v-57
	.byte	W02
	.byte	VOL	, v079
	.byte	BEND	, c_v-49
	.byte	W02
	.byte	VOL	, v087
	.byte	BEND	, c_v-41
	.byte	W02
	.byte	VOL	, v095
	.byte	BEND	, c_v-33
	.byte	W02
	.byte	VOL	, v103
	.byte	BEND	, c_v-25
	.byte	W02
	.byte	VOL	, v111
	.byte	BEND	, c_v-17
	.byte	W02
	.byte	VOL	, v119
	.byte	BEND	, c_v-9
	.byte	W02
	.byte	VOL	, v127
	.byte	BEND	, c_v
	.byte	W08
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W20
	.byte	VOL	, v126
	.byte	W02
	.byte		v106
	.byte	W02
	.byte		v088
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v015
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v005
	.byte	W02
	.byte		v002
	.byte	W02
	.byte		EOT	
	.byte	W04
	.byte	FINE

	.align 2
	.global song253
song253:	@ 0x0857EF9C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song253_1		@ track
