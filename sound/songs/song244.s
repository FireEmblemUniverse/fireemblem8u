	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song244_1
song244_1:	@ 0x0857ECA0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 35
	.byte	VOL	, v100
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song244
song244:	@ 0x0857ECB0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song244_1		@ track
