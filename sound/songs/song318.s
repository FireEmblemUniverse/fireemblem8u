	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song318_1
song318_1:	@ 0x0857FE7C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 20
	.byte	VOL	, v127
	.byte		N20	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song318
song318:	@ 0x0857FE8C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song318_1		@ track
