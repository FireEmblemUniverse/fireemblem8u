	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song703_1
song703_1:	@ 0x08582A40
	.byte	TEMPO	, 75
	.byte	VOL	, v100
	.byte	VOICE	, 13
	.byte	KEYSH	, 0
	.byte		N48	, Cn3, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song703
song703:	@ 0x08582A50
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song703_1		@ track
