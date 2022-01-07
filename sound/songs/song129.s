	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song129_1
song129_1:	@ 0x0857D868
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 45
	.byte	VOL	, v032
	.byte	MODT	, 2
	.byte	MOD	, 40
	.byte	LFOS	, 10
	.byte		TIE	, Cn3, v127
	.byte	W02
	.byte	VOL	, v039
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v055
	.byte	W02
	.byte		v063
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v079
	.byte	W02
	.byte		v087
	.byte	W02
	.byte		v095
	.byte	W02
	.byte		v103
	.byte	W02
	.byte		v111
	.byte	W02
	.byte		v119
	.byte	W02
	.byte		v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte		v120
	.byte	W06
	.byte		v116
	.byte	W06
	.byte		v112
	.byte	W06
	.byte		v108
	.byte	W06
	.byte		v105
	.byte	W06
	.byte		v101
	.byte	W06
	.byte		v097
	.byte	W06
	.byte		v094
	.byte	W06
	.byte		v090
	.byte	W06
	.byte		v086
	.byte	W06
	.byte		v083
	.byte	W06
	.byte		v080
	.byte	W02
	.byte		v078
	.byte	W04
song129_1_1:
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	GOTO	
		.word	song129_1_1
	.byte	W08
	.byte		EOT	, Cn3
	.byte	W16
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song129
song129:	@ 0x0857D8CC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song129_1		@ track
