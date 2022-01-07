	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song177_1
song177_1:	@ 0x0857E30C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 70
	.byte	VOL	, v127
	.byte		N20	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song177
song177:	@ 0x0857E31C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song177_1		@ track
