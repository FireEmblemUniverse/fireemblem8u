	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song772_1
song772_1:	@ 0x08583E58
	.byte	TEMPO	, 75
	.byte	VOL	, v127
	.byte	VOICE	, 1
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song772
song772:	@ 0x08583E68
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song772_1		@ track
