	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song705_1
song705_1:	@ 0x08582A78
	.byte	TEMPO	, 75
	.byte	VOL	, v115
	.byte	VOICE	, 15
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song705
song705:	@ 0x08582A88
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song705_1		@ track
