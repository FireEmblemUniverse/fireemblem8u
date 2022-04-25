	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song701_1
song701_1:	@ 0x08582A08
	.byte	TEMPO	, 75
	.byte	VOL	, v127
	.byte	VOICE	, 11
	.byte	KEYSH	, 0
	.byte		N72	, Cn3, v127
	.byte	W72
	.byte	FINE

	.align 2
	.global song701
song701:	@ 0x08582A18
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song701_1		@ track
