	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song342_1
song342_1:	@ 0x08581384
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 5
	.byte	VOL	, v117
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song342
song342:	@ 0x08581394
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song342_1		@ track
