	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song289_1
song289_1:	@ 0x0857F7D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 49
	.byte	VOL	, v056
	.byte		N96	, Cn3, v127
	.byte	W01
	.byte	VOL	, v063
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v090
	.byte	W19
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song289
song289:	@ 0x0857F7EC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song289_1		@ track
