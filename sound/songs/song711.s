	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song711_1
song711_1:	@ 0x08582ACC
	.byte	TEMPO	, 75
	.byte	VOL	, v105
	.byte	VOICE	, 21
	.byte	KEYSH	, 0
	.byte		N96	, Cn3, v127
	.byte	W96
	.byte	FINE

	.align 2
	.global song711
song711:	@ 0x08582ADC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song711_1		@ track
