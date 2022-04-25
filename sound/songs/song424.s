	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song424_1
song424_1:	@ 0x08581A4C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 8
	.byte	VOL	, v110
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song424
song424:	@ 0x08581A5C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup035		@ voicegroup/tone

	.word	song424_1		@ track
