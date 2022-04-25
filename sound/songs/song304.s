	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song304_1
song304_1:	@ 0x0857FADC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 12
	.byte	VOL	, v052
	.byte		TIE	, Cn3, v127
	.byte	W02
	.byte	VOL	, v058
	.byte	W02
	.byte		v064
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v077
	.byte	W02
	.byte		v084
	.byte	W02
	.byte		v090
	.byte	W02
	.byte		v097
	.byte	W02
	.byte		v104
	.byte	W08
	.byte	W24
	.byte	W24
	.byte	W24
	.byte		v098
	.byte	W02
	.byte		v090
	.byte	W02
	.byte		v082
	.byte	W02
	.byte		v075
	.byte	W02
	.byte		v068
	.byte	W02
	.byte		v062
	.byte	W02
	.byte		v056
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v014
	.byte	W02
	.byte		v012
	.byte	W02
	.byte		v010
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W06
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song304
song304:	@ 0x0857FB2C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song304_1		@ track
