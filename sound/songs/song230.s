	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song230_1
song230_1:	@ 0x0857EBBC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 90
	.byte	VOL	, v127
	.byte		TIE	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W12
	.byte		EOT	
	.byte	W12
	.byte	FINE

	.align 2
	.global song230
song230:	@ 0x0857EBD0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song230_1		@ track
