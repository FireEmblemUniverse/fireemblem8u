	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song250_1
song250_1:	@ 0x0857EE84
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 9
	.byte	VOL	, v040
	.byte	BENDR	, 5
	.byte	BEND	, c_v
	.byte		N64	, As2, v127
	.byte	W02
	.byte	BEND	, c_v+2
	.byte	W02
	.byte		c_v+10
	.byte	W02
	.byte	VOL	, v040
	.byte	BEND	, c_v+23
	.byte	W02
	.byte	VOL	, v042
	.byte	BEND	, c_v+41
	.byte	W02
	.byte	VOL	, v042
	.byte	BEND	, c_v+63
	.byte	W02
	.byte	VOL	, v044
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v054
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v060
	.byte	W02
	.byte		v064
	.byte	W02
	.byte		v067
	.byte	W02
	.byte		v071
	.byte	W02
	.byte		v075
	.byte	W02
	.byte		v080
	.byte	W12
	.byte		v079
	.byte	W02
	.byte		v061
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v015
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v005
	.byte	W02
	.byte		v005
	.byte	W08
	.byte	W24
	.byte	FINE

	.align 2
	.global song250
song250:	@ 0x0857EED8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song250_1		@ track
