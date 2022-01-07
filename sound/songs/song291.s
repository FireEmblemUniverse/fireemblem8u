	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song291_1
song291_1:	@ 0x0857F980
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 50
	.byte	VOL	, v080
	.byte		N12	, Cn3, v127
	.byte	W12
	.byte		N11	, Cn3, v096
	.byte	W12
	.byte	FINE

	.align 2
	.global song291
song291:	@ 0x0857F994
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song291_1		@ track
