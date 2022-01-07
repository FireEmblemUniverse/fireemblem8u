	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song118_1
song118_1:	@ 0x0857D504
	.byte	VOL	, v060
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 11
	.byte	PAN	, c_v
	.byte		N03	, Dn6, v127
	.byte	W04
	.byte		N04	, Dn6, v100
	.byte	W04
	.byte			Dn6, v080
	.byte	W04
	.byte			Dn6, v060
	.byte	W04
	.byte			Dn6, v040
	.byte	W04
	.byte			Dn6, v020
	.byte	W04
	.byte	FINE

	@********************** Track  2 **********************@

	.global song118_2
song118_2:	@ 0x0857D523
	.byte	KEYSH	, 0
	.byte	VOICE	, 12
	.byte	VOL	, v045
	.byte	BENDR	, 1
	.byte	PAN	, c_v
	.byte	BEND	, c_v+16
	.byte		N03	, Dn6, v127
	.byte	W04
	.byte		N04	, Dn6, v100
	.byte	W04
	.byte			Dn6, v080
	.byte	W04
	.byte			Dn6, v060
	.byte	W04
	.byte			Dn6, v040
	.byte	W04
	.byte			Dn6, v020
	.byte	W04
	.byte	FINE

	.align 2
	.global song118
song118:	@ 0x0857D544
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song118_1		@ track
	.word	song118_2		@ track
