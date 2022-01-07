	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song728_1
song728_1:	@ 0x085831C8
	.byte	TEMPO	, 75
	.byte	VOL	, v120
	.byte	VOICE	, 41
	.byte	KEYSH	, 0
	.byte		N72	, Cn4, v127
	.byte	W72
	.byte	FINE

	.align 2
	.global song728
song728:	@ 0x085831D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song728_1		@ track
