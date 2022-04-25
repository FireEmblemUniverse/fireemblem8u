	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song610_1
song610_1:	@ 0x08582654
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 120
	.byte	VOL	, v120
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song610
song610:	@ 0x08582664
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song610_1		@ track
