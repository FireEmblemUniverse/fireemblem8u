	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song313_1
song313_1:	@ 0x0857FD94
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 16
	.byte	VOL	, v112
	.byte		TIE	, Cn3, v127
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W08
	.byte		EOT	
	.byte	W16
	.byte	FINE

	.align 2
	.global song313
song313:	@ 0x0857FDA8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song313_1		@ track
