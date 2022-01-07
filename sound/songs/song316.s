	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song316_1
song316_1:	@ 0x0857FDD4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 18
	.byte	VOL	, v127
	.byte		N96	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song316
song316:	@ 0x0857FDE4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song316_1		@ track
