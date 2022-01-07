	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song288_1
song288_1:	@ 0x0857F7A8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 48
	.byte	VOL	, v062
	.byte		N96	, Cn3, v127
	.byte	W01
	.byte	VOL	, v070
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v100
	.byte	W19
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song288
song288:	@ 0x0857F7C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song288_1		@ track
