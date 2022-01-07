	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song719_1
song719_1:	@ 0x08582B8C
	.byte	TEMPO	, 75
	.byte	VOL	, v127
	.byte	VOICE	, 30
	.byte	KEYSH	, 0
	.byte		N36	, Cn3, v127
	.byte	W36
	.byte	FINE

	.align 2
	.global song719
song719:	@ 0x08582B9C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song719_1		@ track
