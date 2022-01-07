	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song774_1
song774_1:	@ 0x08583E74
	.byte	TEMPO	, 75
	.byte	VOL	, v080
	.byte	VOICE	, 2
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song774
song774:	@ 0x08583E84
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song774_1		@ track
