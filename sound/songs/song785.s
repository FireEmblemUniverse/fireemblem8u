	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song785_1
song785_1:	@ 0x08583F1C
	.byte	TEMPO	, 75
	.byte	VOL	, v099
	.byte	KEYSH	, 0
	.byte	VOICE	, 110
	.byte	W64
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	@********************** Track  2 **********************@

	.align 2
	.global song785_2
song785_2:	@ 0x08583F2C
	.byte	VOL	, v099
	.byte	KEYSH	, 0
	.byte	VOICE	, 111
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song785
song785:	@ 0x08583F38
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song785_1		@ track
	.word	song785_2		@ track
