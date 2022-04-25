	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song893_1
song893_1:	@ 0x08584AE0
	.byte	TEMPO	, 75
	.byte	VOL	, v060
	.byte	VOICE	, 6
	.byte	KEYSH	, 0
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song893
song893:	@ 0x08584AF0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song893_1		@ track
