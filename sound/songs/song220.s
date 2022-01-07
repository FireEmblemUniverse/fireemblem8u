	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song220_1
song220_1:	@ 0x0857EA68
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 20
	.byte	VOL	, v127
	.byte	BENDR	, 12
	.byte		N48	, En3, v127
	.byte	W04
	.byte	VOL	, v124
	.byte	W02
	.byte		v118
	.byte	W02
	.byte		v102
	.byte	W02
	.byte		v076
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v066
	.byte	BEND	, c_v
	.byte	W02
	.byte	VOL	, v076
	.byte	BEND	, c_v+7
	.byte	W02
	.byte	VOL	, v084
	.byte	BEND	, c_v+14
	.byte	W02
	.byte	VOL	, v091
	.byte	BEND	, c_v+21
	.byte	W02
	.byte	VOL	, v096
	.byte	BEND	, c_v+27
	.byte	W02
	.byte	VOL	, v099
	.byte	BEND	, c_v+33
	.byte	W02
	.byte	VOL	, v100
	.byte	BEND	, c_v+38
	.byte	W02
	.byte		c_v+43
	.byte	W02
	.byte		c_v+47
	.byte	W02
	.byte		c_v+51
	.byte	W02
	.byte		c_v+54
	.byte	W02
	.byte		c_v+57
	.byte	W02
	.byte		c_v+59
	.byte	W02
	.byte		c_v+61
	.byte	W02
	.byte		c_v+62
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte	FINE

	.align 2
	.global song220
song220:	@ 0x0857EAB8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song220_1		@ track
