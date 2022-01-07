	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song730_1
song730_1:	@ 0x08583218
	.byte	TEMPO	, 75
	.byte	VOL	, v120
	.byte	VOICE	, 43
	.byte	KEYSH	, 0
	.byte		N72	, Cn4, v127
	.byte	W72
	.byte	FINE

	.align 2
	.global song730
song730:	@ 0x08583228
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song730_1		@ track
