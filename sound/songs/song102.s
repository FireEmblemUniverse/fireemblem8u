	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song102_1
song102_1:	@ 0x0857D0B4
	.byte	VOL	, v055
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte		N04	, An4, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song102
song102:	@ 0x0857D0C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song102_1		@ track
