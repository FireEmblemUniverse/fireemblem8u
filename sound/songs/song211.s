	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song211_1
song211_1:	@ 0x0857E93C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 111
	.byte	VOL	, v125
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song211
song211:	@ 0x0857E94C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song211_1		@ track
