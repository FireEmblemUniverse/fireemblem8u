	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song815_mon_gog_attack2_1
song815_mon_gog_attack2_1:	@ 0x085846CC
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	VOICE	, 43
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song815_mon_gog_attack2_2
song815_mon_gog_attack2_2:	@ 0x085846DC
	.byte	VOL	, v099
	.byte	VOICE	, 41
	.byte	KEYSH	, 0
	.byte	VOL	, v062
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	VOL	, v046
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	VOL	, v031
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	VOL	, v015
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	FINE

	.align 2
	.global song815_mon_gog_attack2
song815_mon_gog_attack2:	@ 0x085846FC
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song815_mon_gog_attack2_1		@ track
	.word	song815_mon_gog_attack2_2		@ track
