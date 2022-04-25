	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song215_1
song215_1:	@ 0x0857E9AC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 26
	.byte	VOL	, v127
	.byte	W10
	.byte		N14	, Cn3, v127
	.byte	W14
	.byte	FINE

	.align 2
	.global song215
song215:	@ 0x0857E9BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song215_1		@ track
