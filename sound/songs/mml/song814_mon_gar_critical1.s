	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song814_mon_gar_critical1_1
song814_mon_gar_critical1_1:	@ 0x08584694
	.byte	TEMPO	, 75
	.byte	VOL	, v120
	.byte	KEYSH	, 0
	.byte	VOICE	, 60
	.byte	VOL	, v094
	.byte		N16	, Cn3, v127
	.byte	W16
	.byte	VOL	, v037
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	W08
	.byte	VOL	, v094
	.byte		N16	, Cn3, v127
	.byte	W16
	.byte	VOL	, v037
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	W08
	.byte	VOL	, v120
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song814_mon_gar_critical1
song814_mon_gar_critical1:	@ 0x085846C0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song814_mon_gar_critical1_1		@ track
