	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song816_mon_gog_attack3_1
song816_mon_gog_attack3_1:	@ 0x0858470C
	.byte	TEMPO	, 75
	.byte	VOL	, v095
	.byte	VOICE	, 44
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song816_mon_gog_attack3_2
song816_mon_gog_attack3_2:	@ 0x0858471C
	.byte	VOL	, v095
	.byte	VOICE	, 41
	.byte	KEYSH	, 0
	.byte	VOL	, v014
	.byte		N06	, Cn3, v127
	.byte	W06
	.byte	VOL	, v044
	.byte		N06	, Gn2, v127
	.byte	W06
	.byte	VOL	, v074
	.byte		N06	, Cn2, v127
	.byte	W06
	.byte	FINE

	.align 2
	.global song816_mon_gog_attack3
song816_mon_gog_attack3:	@ 0x08584738
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song816_mon_gog_attack3_1		@ track
	.word	song816_mon_gog_attack3_2		@ track
