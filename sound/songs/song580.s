	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song580_1
song580_1:	@ 0x0858245C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song580
song580:	@ 0x0858246C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song580_1		@ track
