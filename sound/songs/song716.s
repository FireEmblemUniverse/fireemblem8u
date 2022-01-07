	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song716_1
song716_1:	@ 0x08582B20
	.byte	TEMPO	, 75
	.byte	VOL	, v095
	.byte	VOICE	, 26
	.byte	KEYSH	, 0
	.byte		N72	, Cn3, v127
	.byte	W72
	.byte	FINE

	.align 2
	.global song716
song716:	@ 0x08582B30
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song716_1		@ track
