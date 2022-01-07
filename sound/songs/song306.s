	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song306_1
song306_1:	@ 0x0857FB58
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 11
	.byte	VOL	, v127
	.byte		N48	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song306
song306:	@ 0x0857FB68
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song306_1		@ track
