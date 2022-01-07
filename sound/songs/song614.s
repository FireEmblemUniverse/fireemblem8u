	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song614_1
song614_1:	@ 0x085826C4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 100
	.byte	VOL	, v120
	.byte		N23	, Cn3, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song614
song614:	@ 0x085826D4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup034		@ voicegroup/tone

	.word	song614_1		@ track
