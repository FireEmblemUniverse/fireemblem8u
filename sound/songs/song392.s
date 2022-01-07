	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song392_1
song392_1:	@ 0x085817E4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 25
	.byte	VOL	, v080
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song392
song392:	@ 0x085817F4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song392_1		@ track
